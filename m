Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DEEE10EE
	for <tools@linux.kernel.org>; Fri, 25 Feb 2022 03:11:38 +0000 (UTC)
Received: by mail-oo1-f43.google.com with SMTP id 189-20020a4a03c6000000b003179d7b30d8so4683189ooi.2
        for <tools@linux.kernel.org>; Thu, 24 Feb 2022 19:11:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Hys96ZMbTW2smbhZyr9/WJtCLkICD+HyBktBv4BQtUw=;
        b=e77iDeIbeNcaSaobDZgnGzl2V5sK90ZMwvORup63suNQjeGij7l4vRpJvP/C7sF/6q
         GmmaJ0Ia5Zs/D+EE1mVCIZ38gCdIAAHtMUYQoYGdrT9EfKRcADTVv8OcMuuRmAWqXjuJ
         y7okJa+CxV1c/dDhfKHyUUWmx1mtprFAU28PC1QyOQR/y7jEzXNPg4GMj6asExlfn3FZ
         pkbSFMaKLXx8n0dOec61/qeNhr4ek3GRP2FrUWty4+OM+wnsy5+Jk+Owpt5WsCKa8Vx8
         xPSwLjLiElV1CBJJ/o3CMZ+2XENbkSY8uGfwi+J1UQNATi4wdF1lIGKT+yceLJhruQZW
         oKhg==
X-Gm-Message-State: AOAM531N9/9wU8NL5KRWvBjs1SHHfxjFrOz0IA4Yh0PlcxW9vFady0QO
	zdz0DB/q2PEE6wKK4YnoeKep5RBQ8A==
X-Google-Smtp-Source: ABdhPJxjYS6Su5TSXvFbhivLPVwWD5pch5LMHNL2/vEOAZ7QsYpCneP58MztjTMnygueopQJCGDDbA==
X-Received: by 2002:a05:6870:5d9b:b0:d2:89cb:469d with SMTP id fu27-20020a0568705d9b00b000d289cb469dmr516549oab.25.1645758698004;
        Thu, 24 Feb 2022 19:11:38 -0800 (PST)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.googlemail.com with ESMTPSA id t11-20020a4ae40b000000b0031cc933b418sm514039oov.40.2022.02.24.19.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 19:11:36 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: [PATCH] Remove URL redirect project lookup
Date: Thu, 24 Feb 2022 21:11:35 -0600
Message-Id: <20220225031135.4136158-1-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that lore indexes all messages, there's no need to lookup the project
for the message-id. If the project is not specified, then 'all' is used.

The primary benefit of this change is that cached accesses can now work
offline instead of splatting with a network error.

Signed-off-by: Rob Herring <robh@kernel.org>
---

My usecase is twofold. First I want to speed up opening a thread by 
having it fetched in the background and cached. Second, I want to be 
able to work offline by fetching a list of threads (my PW queue) in 
advance and using the offline copy. With a sufficiently long cache 
timeout, the cache works perfectly for this use. Though maybe a 'use the 
cache if there's a network failure' mode is needed instead of always 
timing out the cache.

I also have this working using b4 to fetch my queue to an mbox and 
then using the 'use local mbox' option. This mostly works except for 
the handling of 'From ' in message bodies which is problematic for mbox 
format. The cache manages to avoid this problem.

Rob

 b4/__init__.py | 23 +++++++----------------
 1 file changed, 7 insertions(+), 16 deletions(-)

diff --git a/b4/__init__.py b/b4/__init__.py
index 0d506bbaa649..ec1a6da44144 100644
--- a/b4/__init__.py
+++ b/b4/__init__.py
@@ -2235,6 +2235,9 @@ def get_pi_thread_by_url(t_mbx_url, nocache=False):
         logger.critical('Grabbing thread from %s', t_mbx_url.split('://')[1])
         session = get_requests_session()
         resp = session.get(t_mbx_url)
+        if resp.status_code == 404:
+            logger.critical('That message-id is not known.')
+            return None
         if resp.status_code != 200:
             logger.critical('Server returned an error: %s', resp.status_code)
             return None
@@ -2263,22 +2266,10 @@ def get_pi_thread_by_url(t_mbx_url, nocache=False):
 def get_pi_thread_by_msgid(msgid, useproject=None, nocache=False, onlymsgids: Optional[set] = None):
     qmsgid = urllib.parse.quote_plus(msgid)
     config = get_main_config()
-    # Grab the head from lore, to see where we are redirected
-    midmask = config['midmask'] % qmsgid
-    loc = urllib.parse.urlparse(midmask)
-    if useproject:
-        projurl = '%s://%s/%s' % (loc.scheme, loc.netloc, useproject)
-    else:
-        logger.info('Looking up %s', midmask)
-        session = get_requests_session()
-        resp = session.head(midmask)
-        if resp.status_code < 300 or resp.status_code > 400:
-            logger.critical('That message-id is not known.')
-            return None
-        # Pop msgid from the end of the redirect
-        chunks = resp.headers['Location'].rstrip('/').split('/')
-        projurl = '/'.join(chunks[:-1])
-        resp.close()
+    loc = urllib.parse.urlparse(config['midmask'])
+    if not useproject:
+        useproject = 'all'
+    projurl = '%s://%s/%s' % (loc.scheme, loc.netloc, useproject)
     t_mbx_url = '%s/%s/t.mbox.gz' % (projurl, qmsgid)
     logger.debug('t_mbx_url=%s', t_mbx_url)
 
-- 
2.32.0

