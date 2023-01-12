Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7DD8468
	for <tools@linux.kernel.org>; Thu, 12 Jan 2023 17:52:38 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id j34-20020a05600c1c2200b003da1b054057so1446571wms.5
        for <tools@linux.kernel.org>; Thu, 12 Jan 2023 09:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tessares.net; s=google;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S8oiHrwuSNcDbTHNUId/d90y5/zc+lVp5skIYcQKa4w=;
        b=T5bJ/DeqblmiEfHKCPKvzUMI0ejbQpKmKIbbjpy+lN8ruaWbR8nu/vjI+JhQAhWFZ+
         YrF4m2yVzE9oqb7Zjw3r+J8rEPcOJC4YNWHPfgFmf1iz6KxXHHudP6W94TBNMoI2WjwP
         8/X9muGGrSXewQiYTaHMKGOuIfTWfaQMHquHYFx1x/zVp/DlU33ipqh0De99SyHIq54V
         BpL7cBM5TyC4Y3EEW/rsnm3NeNNg/NSwXd8Xhu+GpGBVCNluxZf3DgOO0xTdNc9MjHKG
         nDXA0WPGT/43sEVpFBA0hjO2BfrCBY+oUwSgslQGqoaZhveG/D82vMcja5fO4Z279Hh3
         Zu2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S8oiHrwuSNcDbTHNUId/d90y5/zc+lVp5skIYcQKa4w=;
        b=wwPOKBlnsM4nXyUiVhwrODryOXUK4YOsMGJn1rg5DQy6KhP4wxfgkvdULGJ6SgFoxM
         tXzrmZdCyeX3AbiEmr8MpRevZLSZGfgtflCUa2xcluTQYI2UP7DJ1iAvEcJ3iBaVn9fR
         UbcAAEIAhX/tffQ0/4i8fIPHJudO5lHNuhe22Z/xLWw4RpdmsxsTX6hs4H+D6/wjs0z8
         C+jfWdFFcHosyYlJwyFy7ryDc1KlXXQGZKSqTpcvdh21wUcQhfAPHVDUb9+0+jb+V4tZ
         FP9LacluXTmNJ/Q0iSG6kZEx767LJ/jvNWt9yqwDNNLCp64IMPURO7tA8Rs0YoARrwQH
         whOA==
X-Gm-Message-State: AFqh2kpXPiuq9/UDlZ5nw9JH8OJ3Pu5ZpwAXUXxugmEGUQoRON9O3Pa+
	oa5yj/eNf4v6GKs1OXhaBjCsrQ==
X-Google-Smtp-Source: AMrXdXsdNR9/CXk8gGv20JClnDQyzpbapTQNnnkjSPRCPojPL+wDhHKeakm3Xp147Pos4sAJQkq/OA==
X-Received: by 2002:a05:600c:4f43:b0:3da:fcd:7dfe with SMTP id m3-20020a05600c4f4300b003da0fcd7dfemr4267005wmq.10.1673545957050;
        Thu, 12 Jan 2023 09:52:37 -0800 (PST)
Received: from vdi08.nix.tessares.net (static.219.156.76.144.clients.your-server.de. [144.76.156.219])
        by smtp.gmail.com with ESMTPSA id l27-20020a05600c2cdb00b003a84375d0d1sm29886332wmc.44.2023.01.12.09.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 09:52:36 -0800 (PST)
From: Matthieu Baerts <matthieu.baerts@tessares.net>
Date: Thu, 12 Jan 2023 18:52:29 +0100
Subject: [PATCH b4] ez: treat cover-letter as git commit msg
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230112-cover-letter-72-chars-v1-1-69b15b1e3fef@tessares.net>
X-B4-Tracking: v=1; b=H4sIAN1IwGMC/x2NwQrCQAxEf6XkbKDZrSj+injIbqO7oFtJShFK/
 920p+Ex85gVTLSKwa1bQWWpVqfmQKcOcuH2EqyjM4Q+xJ4oYJ4WUXzLPHtcnAur4TXQQJnOMcYE
 7iY2waTcctntD5vP9+Kr8qy/4/AOaYDHtv0BwOV+4YQAAAA=
To: "Kernel.org Tools" <tools@linux.kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Matthieu Baerts <matthieu.baerts@tessares.net>
X-Mailer: b4 0.11.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5062;
 i=matthieu.baerts@tessares.net; h=from:subject:message-id;
 bh=P2OVi9VgeupIQS5GbjUCCi9ZEw9f7rVs/o4SkEYQ/W4=;
 b=owEBbQKS/ZANAwAIAfa3gk9CaaBzAcsmYgBjwEjk0XKKtMHPAlKGYBLEwuEO5zjLw1B++d1TCs6i
 o0KfyACJAjMEAAEIAB0WIQToy4X3aHcFem4n93r2t4JPQmmgcwUCY8BI5AAKCRD2t4JPQmmgc0ZZEA
 CM8IjB8V0950YRst6hw/KElVGEjIQ9jCECE3kQNCH0MRmVn1VPWTbskkPutIDQjim7AeRq9WNRP8Ph
 H6ynD+sd5jSizQtjNZ2gDjtzWORi/1Dqrx2y78tloiSOG1Hee8XO667xuhRZLG4pbJZIPABaoRJPwd
 r+40eTPGXl63Ny+OQUP9W7LA1tBMjwBe7Cvq4DAQVnVx0liVZgLT2U2t4qf8ScBJJj5gSYXjGGkKi1
 K72xNZ+WfZ2iX3dB3EcsnmLi4fKTm2Q3ir4XSfEqQVuP8AUIeSZ9qoEHh6KRpNP1RIk7/CSYZUlIGA
 JVpP33MxSJFZbkGy3gLENHt/1y8uFwuZ1HhL+nT8zLikYdsODYg9rSj7HQypvdhP6G5mN3K8LNyNxw
 QylxpIaWDAu7X1rHJwWg+4iWBqFt4sVl2j2CR4xG+47enABcWNGHOxGw5Zg2B3GjXXT1jMrXr4LFw7
 0+hVKZjVThH7zvSqyM6Ohw2jrEIHkT04LzL2V0Dnd1Z8WuBg4vZDv/fVwCXr+k9Ao/Sn/SLKvUnz5Z
 o5nwpXQNg3OlUrNGOjE1zwoh1Oh/Wl3KGEu3bu8aaH8D7FGOAmAz2HfG/EbOpS1UNH09Wip2JbIGm4
 h91QR9GK4QTfCnwlMVKuqrRy0c4/iyuBhasQT3LfB/3khiDazn+MF0NYnCfA==
X-Developer-Key: i=matthieu.baerts@tessares.net; a=openpgp;
 fpr=E8CB85F76877057A6E27F77AF6B7824F4269A073

It is common to write the cover-letter in a merge commit message. For
this reason, it is recommended to wrap it at 72 chars and have a short
title. It is like a git commit message at the end while lines starting
with '#' will be ignored.

For this reason and to "trick" the text editor, the temp file is now
called COMMIT_EDITMSG like the one generated by 'git commit'.

At the end, the file didn't contain any restructured-text format.

While at it, the default template is also wrapped to 72 chars.

Signed-off-by: Matthieu Baerts <matthieu.baerts@tessares.net>
---
 b4/ez.py | 41 +++++++++++++++++++++++------------------
 1 file changed, 23 insertions(+), 18 deletions(-)

diff --git a/b4/ez.py b/b4/ez.py
index 82500e3..2b6c0d6 100644
--- a/b4/ez.py
+++ b/b4/ez.py
@@ -451,21 +451,22 @@ def start_new_series(cmdargs: argparse.Namespace) -> None:
         # create a default cover letter and store it where the strategy indicates
         cover = ('EDITME: cover title for %s' % seriesname,
                  '',
-                 '# Lines starting with # will be removed from the cover letter. You can use',
-                 '# them to add notes or reminders to yourself.',
+                 '# Lines starting with # will be removed from the cover letter. You can',
+                 '# use them to add notes or reminders to yourself.',
                  '',
-                 'EDITME: describe the purpose of this series. The information you put here',
-                 'will be used by the project maintainer to make a decision whether your',
-                 'patches should be reviewed, and in what priority order. Please be very',
-                 'detailed and link to any relevant discussions or sites that the maintainer',
-                 'can review to better understand your proposed changes. If you only have a',
-                 'single patch in your series, the contents of the cover letter will be',
-                 'appended to the "under-the-cut" portion of the patch.',
+                 'EDITME: describe the purpose of this series. The information you put',
+                 'here will be used by the project maintainer to make a decision whether',
+                 'your patches should be reviewed, and in what priority order. Please be',
+                 'very detailed and link to any relevant discussions or sites that the',
+                 'maintainer can review to better understand your proposed changes. If you',
+                 'only have a single patch in your series, the contents of the cover',
+                 'letter will be appended to the "under-the-cut" portion of the patch.',
                  '',
                  '# You can add trailers to the cover letter. Any email addresses found in',
-                 '# these trailers will be added to the addresses specified/generated during',
-                 '# the b4 send stage. You can also run "b4 prep --auto-to-cc" to auto-populate',
-                 '# the To: and Cc: trailers based on the code being modified.',
+                 '# these trailers will be added to the addresses specified/generated',
+                 '# during the b4 send stage. You can also run "b4 prep --auto-to-cc" to',
+                 '# auto-populate the To: and Cc: trailers based on the code being',
+                 '# modified.',
                  '',
                  'Signed-off-by: %s <%s>' % (usercfg.get('name', ''), usercfg.get('email', '')),
                  '',
@@ -686,17 +687,21 @@ def edit_cover() -> None:
     corecfg = b4.get_config_from_git(r'core\..*', {'editor': os.environ.get('EDITOR', 'vi')})
     editor = corecfg.get('editor')
     logger.debug('editor=%s', editor)
-    # We give it a suffix .rst in hopes that editors autoload restructured-text rules
-    with tempfile.NamedTemporaryFile(suffix='.rst') as temp_cover:
-        temp_cover.write(cover.encode())
-        temp_cover.seek(0)
+    # Use COMMIT_EDITMSG name in hopes that editors autoload git commit rules
+    with tempfile.TemporaryDirectory(prefix='b4-') as temp_dir:
+        temp_fpath = os.path.join(temp_dir, 'COMMIT_EDITMSG')
+        with open(temp_fpath, 'xb') as temp_cover:
+            temp_cover.write(cover.encode())
+
         sp = shlex.shlex(editor, posix=True)
         sp.whitespace_split = True
-        cmdargs = list(sp) + [temp_cover.name]
+        cmdargs = list(sp) + [temp_fpath]
         logger.debug('Running %s' % ' '.join(cmdargs))
         sp = subprocess.Popen(cmdargs)
         sp.wait()
-        new_cover = temp_cover.read().decode(errors='replace').strip()
+
+        with open(temp_fpath, 'rb') as temp_cover:
+            new_cover = temp_cover.read().decode(errors='replace').strip()
 
     if new_cover == cover:
         logger.info('Cover letter unchanged.')

---
base-commit: 5b2056d4002a1d71dc64c56ee65585c5d8739c32
change-id: 20230112-cover-letter-72-chars-82141c15333b

Best regards,
-- 
Matthieu Baerts <matthieu.baerts@tessares.net>
