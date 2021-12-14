Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7617529CA
	for <tools@linux.kernel.org>; Tue, 14 Dec 2021 21:43:29 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id o4so29007470oia.10
        for <tools@linux.kernel.org>; Tue, 14 Dec 2021 13:43:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ll20mJJamjZfWaP0cWYRfcKybAZRD8ovrtScaPX/cAw=;
        b=3l72OHSFiAAwFYfQq8CcR+r1AuKkzES06i5CnmMbwWw0cSMybfSkNmxD5xpQJsvnc5
         Eg3q/NQKpXJ9kyDzkunK2y0soc2r0TBddSvTtos/Ip1K9/ysZ+n/OaFtEcCOoQJ/qZAC
         bIi8vm190yh28a8gUPey4Q5GmhnFEZlhl5FgaOoQy9/X7LQLBenobLDIPKonvq85+SA0
         fkqsOeFb1ZnWcZkz7aTF0EmzHhghV0RkyJOsUD/+lPZdlIHSVLTrbt+HOIpGsPMGE7d5
         fF0G50GG9tw5xQZLkDF06s3dxkkT+I7FugkyNog2fKa5hZhqMiOgxOJvQy2sGRYS+eQw
         xGPg==
X-Gm-Message-State: AOAM533lDcaZwV0RAJcYN4qrVYEhaII5mCdet0tHO26sEB8TmG+v0Um3
	SSAuzftrsuEhTnyQPBwUUqCUXchFSA==
X-Google-Smtp-Source: ABdhPJyDK6NzwcSzXoFVDrwGA9CN17DhGRGcZX87L2EnsNjH/G6LLwE3sixyeGCvXPZhCS3eHCgEbA==
X-Received: by 2002:aca:af50:: with SMTP id y77mr6438054oie.134.1639518208538;
        Tue, 14 Dec 2021 13:43:28 -0800 (PST)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.googlemail.com with ESMTPSA id e26sm16038oog.46.2021.12.14.13.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 13:43:27 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] Allow whitespace before a trailer
Date: Tue, 14 Dec 2021 15:43:27 -0600
Message-Id: <20211214214327.4003631-1-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, b4 fails to find and add trailers with leading whitespace. Let's
be a bit more forgiving and allow for that case.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Rob Herring <robh@kernel.org>
---
This thread exhibits the problem:
https://lore.kernel.org/r/20211206174113.2295616-1-robh%40kernel.org

Note that patchwork also fails on this. Between fixing b4 or Greg, I 
went with b4. :)

---
 b4/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/b4/__init__.py b/b4/__init__.py
index 11c287eb3433..a4add56c5f80 100644
--- a/b4/__init__.py
+++ b/b4/__init__.py
@@ -1397,7 +1397,7 @@ class LoreMessage:
         was_trailer = False
         for line in body.split('\n'):
             line = line.strip('\r')
-            matches = re.search(r'^(\w\S+):\s+(\S.*)', line, flags=re.I)
+            matches = re.search(r'^\s?(\w\S+):\s+(\S.*)', line, flags=re.I)
             if matches:
                 groups = list(matches.groups())
                 # We only accept headers if we haven't seen any non-trailer lines
-- 
2.32.0

