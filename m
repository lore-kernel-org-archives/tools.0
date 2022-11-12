Received: from proxmox1.postmarketos.org (proxmox1.postmarketos.org [213.239.216.189])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9F2FEDC
	for <tools@linux.kernel.org>; Sat, 12 Nov 2022 13:16:59 +0000 (UTC)
Received: from localhost.localdomain (dynamic-077-004-019-021.77.4.pool.telefonica.de [77.4.19.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by proxmox1.postmarketos.org (Postfix) with ESMTPSA id 0FE2314033A;
	Sat, 12 Nov 2022 13:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=donut; t=1668258705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5voysMMpqGqLqxJj2EJjd5P4zhl8I7d4zdRfRdadWuk=;
	b=hZNQ1D1P2DibpgLMZjWjeAEI7ja/OJhvq08uJBA5NrZgXCD/ciSwmD7eoHWmumfgxWuJkl
	mGaNj7n4oKCz5UeSvW5RNuu0qOyc9es+c2bEOAQ4D16LACn3I7+FXfHlaGTfsK+ZGXpA2K
	k64c2k3bdcoEDz8TGAgG0k97XzKjiww=
From: Oliver Smith <ollieparanoid@postmarketos.org>
To: tools@linux.kernel.org
Cc: Oliver Smith <ollieparanoid@postmarketos.org>
Subject: [PATCH b4 1/1] RFC: Support SourceHut as additional backend
Date: Sat, 12 Nov 2022 14:11:14 +0100
Message-Id: <20221112131114.2370-2-ollieparanoid@postmarketos.org>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20221112131114.2370-1-ollieparanoid@postmarketos.org>
References: <20221112131114.2370-1-ollieparanoid@postmarketos.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a SourceHut backend to b4, so it can be used with lists.sr.ht and
other instances. We've been using this successfully to merge a couple of
patches from https://lists.sr.ht/~postmarketos/pmbootstrap-devel/.

How to use:

1. Add a .b4-config to your git repo like this, adjust the paths:
  [b4]
    midmask = https://lists.sr.ht/~postmarketos/pmbootstrap-devel/%s
    linkmask = https://lists.sr.ht/~postmarketos/pmbootstrap-devel/%%3C%s%%3E
    send-series-to = ~postmarketos/pmbootstrap-devel@lists.sr.ht
    send-endpoint-web = NONE
    backend = sourcehut

2. Run 'b4 am' with either the short review ID integer, or the full
   message ID as used in the archives:
   $ b4 am 36506
   $ b4 am 20221031111614.1377-1-ollieparanoid@postmarketos.org

Signed-off-by: Oliver Smith <ollieparanoid@postmarketos.org>
---
 b4/__init__.py | 79 +++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 75 insertions(+), 4 deletions(-)

diff --git a/b4/__init__.py b/b4/__init__.py
index 39cfeaf..787f628 100644
--- a/b4/__init__.py
+++ b/b4/__init__.py
@@ -17,6 +17,7 @@ import pathlib
 import argparse
 import smtplib
 import shlex
+import re
 
 import urllib.parse
 import datetime
@@ -128,6 +129,8 @@ DEFAULT_CONFIG = {
     'gpgbin': None,
     # When sending mail, use this sendemail identity configuration
     'sendemail-identity': None,
+    # What backend the mailing list runs, either "lore" or "sourcehut"
+    'backend': 'lore',
 }
 
 # This is where we store actual config
@@ -2288,7 +2291,7 @@ def get_main_config() -> dict:
         # some options can be provided via the toplevel .b4-config file,
         # so load them up and use as defaults
         topdir = git_get_toplevel()
-        wtglobs = ['send-*', '*mask', '*template*', 'trailer*', 'pw-*']
+        wtglobs = ['send-*', '*mask', '*template*', 'trailer*', 'pw-*', 'backend']
         if topdir:
             wtcfg = os.path.join(topdir, '.b4-config')
             if os.access(wtcfg, os.R_OK):
@@ -2625,6 +2628,15 @@ def split_and_dedupe_pi_results(t_mbox: bytes, cachedir: Optional[str] = None) -
     return msgs
 
 
+def get_pi_thread_mbox_content(resp: requests.Session) -> bytes:
+    backend = get_main_config()['backend']
+    if backend == "lore":
+        return gzip.decompress(resp.content)
+    elif backend == "sourcehut":
+        return resp.content
+    raise KeyError
+
+
 def get_pi_thread_by_url(t_mbx_url: str, nocache: bool = False):
     msgs = list()
     cachedir = get_cache_file(t_mbx_url, 'pi.msgs')
@@ -2644,7 +2656,7 @@ def get_pi_thread_by_url(t_mbx_url: str, nocache: bool = False):
     if resp.status_code != 200:
         logger.critical('Server returned an error: %s', resp.status_code)
         return None
-    t_mbox = gzip.decompress(resp.content)
+    t_mbox = get_pi_thread_mbox_content(resp)
     resp.close()
     if not len(t_mbox):
         logger.critical('No messages found for that query')
@@ -2653,8 +2665,8 @@ def get_pi_thread_by_url(t_mbx_url: str, nocache: bool = False):
     return split_and_dedupe_pi_results(t_mbox, cachedir=cachedir)
 
 
-def get_pi_thread_by_msgid(msgid: str, nocache: bool = False,
-                           onlymsgids: Optional[set] = None) -> Optional[list]:
+def get_pi_thread_by_msgid_lore(msgid: str, nocache: bool = False,
+                                onlymsgids: Optional[set] = None) -> Optional[list]:
     qmsgid = urllib.parse.quote_plus(msgid)
     config = get_main_config()
     loc = urllib.parse.urlparse(config['midmask'])
@@ -2699,6 +2711,65 @@ def get_pi_thread_by_msgid(msgid: str, nocache: bool = False,
     return strict
 
 
+def get_pi_thread_by_msgid_sourcehut(msgid: str, nocache: bool = False,
+                                     onlymsgids: Optional[set] = None) -> Optional[list]:
+    review_id = urllib.parse.quote_plus(msgid)
+    config = get_main_config()
+    loc = urllib.parse.urlparse(config['midmask'])
+
+    if msgid.isdigit():
+        # This is the review ID, but we need the archives ID.
+        # TODO: use a proper api from sourcehut for this
+        # TODO: cache this, it won't change
+        review_url = config['midmask'] % f'patches/{msgid}'
+        logger.info('Looking up %s', review_url)
+        session = get_requests_session()
+        resp = session.get(review_url)
+        re_archives = re.compile('<a .*href="(.*)">View this thread in the archives')
+        match = re_archives.search(resp.text)
+        if not match:
+            raise ValueError('Failed to find the archives url')
+        archives_url = '%s://%s%s' % (loc.scheme, loc.netloc, match.group(1))
+
+        archives_id = urllib.parse.unquote(archives_url.split("/")[-1])
+        assert archives_id.startswith("<") and archives_id.endswith(">")
+        archives_id = archives_id[1:-1]
+        logger.info('Resolved to %s', archives_id)
+    else:
+        archives_url = config['midmask'] % f'<{msgid}>'
+        archives_id = msgid
+
+    t_mbx_url = '%s/mbox' % archives_url
+    logger.debug('t_mbx_url=%s', t_mbx_url)
+
+    msgs = get_pi_thread_by_url(t_mbx_url, nocache=nocache)
+    if not msgs:
+        return None
+
+    if onlymsgids:
+        strict = list()
+        for msg in msgs:
+            if LoreMessage.get_clean_msgid(msg) in onlymsgids:
+                strict.append(msg)
+            # also grab any messages where this msgid is in the references header
+            for onlymsgid in onlymsgids:
+                if msg.get('references', '').find(onlymsgid) >= 0:
+                    strict.append(msg)
+    else:
+        strict = get_strict_thread(msgs, archives_id)
+
+    return strict
+
+
+def get_pi_thread_by_msgid(*args, **kwargs) -> Optional[list]:
+    backend = get_main_config()['backend']
+    if backend == "lore":
+        return get_pi_thread_by_msgid_lore(*args, **kwargs)
+    elif backend == "sourcehut":
+        return get_pi_thread_by_msgid_sourcehut(*args, **kwargs)
+    raise KeyError
+
+
 def git_range_to_patches(gitdir: Optional[str], start: str, end: str,
                          covermsg: Optional[email.message.EmailMessage] = None,
                          prefixes: Optional[List[str]] = None,
-- 
2.34.3

