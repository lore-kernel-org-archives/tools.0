Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59E33D9C
	for <tools@linux.kernel.org>; Thu, 13 Oct 2022 17:57:23 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id c24so2477041pls.9
        for <tools@linux.kernel.org>; Thu, 13 Oct 2022 10:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=MJOvzfPte30c78AKZpeyjzajRnTDfEXYWgIhu6ayhGw=;
        b=jBevLWWo8tkj4fKCHuYteW0XVSr4BFkrkGuPe0YBBx4HV3S/Ni3fmYSoP3HBap3RCy
         bEfvgC0JWriQ18KE6tNpHoX37rcyzEuHKhbeFAxlYVLClL4wdpCSqUYWlKW1LrAOIJk0
         UlBeNFMln1+aw/KkYLvAJU4HCghkujYSrN2dZpJWL4Jf6Ul4O9knudjqxUmcNB35clX8
         Z0/rxxDNMYYVTc9NhftcYOcYcrVG3AefkBBJ1pU8nJDzKY250FFySgWyg+63CrYXi5wA
         h1ajJzuZ9RnaFZ1q097c3U1l+udMmGeSjmeIqusj9S03WbKg/GtWZkoNg3o7ORI7jg7y
         zdag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MJOvzfPte30c78AKZpeyjzajRnTDfEXYWgIhu6ayhGw=;
        b=VvK7P/Ob8bl6u/4cK1JMiEg9gmT6wGj+cpL8jmBCBeWlql/dVtaOtzDmRZL0K2syhE
         NxjkzTAtaQjaMeY1Bqz+vZNMHM+gIdmvIhHuGHFBw0N7ofhNV6WGB4XLKSWUZZ8ZKbBp
         3pqRvcu31JSGaubYtlCWg6C37/0YGQhAkgY5Dt7NYi2RCh7pKaJXKZSF/wBzrUGclUrW
         h5apDryvvSAbmwhAlR7gNt9AqvfECEYV6P8VfED+qPdYIP8b78JWlsmc+IX+iEMkH2JN
         RANgWTBn3Yl2SPEoYziCxI9aN0sLqtEsyHt5faHtgmf0i+r7bKJTokkIb2Bpe8aELE+1
         ff2A==
X-Gm-Message-State: ACrzQf2TGNYAcuqOvzPvfMdNHI3Q2TWKTdv1AZRKvxyJ/lmuXmVbaawH
	SIm34oEowlLNG2KhS4LJqSZdaHyUasgP4Q==
X-Google-Smtp-Source: AMsMyM6eK+33NErOFIwbMsEJVnHtbQXchiYqAMzkNfensSXQBRanY1sL04plX1PDLbt0tICpVRDm+Q==
X-Received: by 2002:a17:902:e552:b0:179:e795:71c5 with SMTP id n18-20020a170902e55200b00179e79571c5mr835659plf.57.1665683843030;
        Thu, 13 Oct 2022 10:57:23 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id t1-20020a17090a448100b001fb1de10a4dsm69661pjg.33.2022.10.13.10.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 10:57:22 -0700 (PDT)
Subject: [PATCH] shazam: Add the --merge-base argument
Date: Thu, 13 Oct 2022 10:57:27 -0700
Message-Id: <20221013175727.17139-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.38.0
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To:          tools@linux.kernel.org

I was just handling a patch set where the author used English to
describe the dependencies.  They hadn't yet been merged at the time the
patch set was posted so I don't think there's really any way to make
sure the computers always understand the base, this just lets me quickly
override the automatic merge base detection when I run into something
non-canonical.

Link: https://lore.kernel.org/all/20220913061817.22564-1-zong.li@sifive.com/
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 b4/command.py |  2 ++
 b4/mbox.py    | 13 ++++++++-----
 man/b4.5.rst  |  2 ++
 3 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/b4/command.py b/b4/command.py
index b16043e..5bb674e 100644
--- a/b4/command.py
+++ b/b4/command.py
@@ -171,6 +171,8 @@ def cmd():
     sp_sh.add_argument('--guess-lookback', dest='guessdays', type=int, default=21,
                        help=('(use with -H or -M) When guessing base, go back this many days from the patch date '
                              '(default: 3 weeks)'))
+    sp_sh.add_argument('--merge-base', dest='mergebase', type=str, default=None,
+                       help=('(use with -H or -M) Force this base when merging'))
     sp_sh.set_defaults(func=cmd_shazam)
 
     # b4 pr
diff --git a/b4/mbox.py b/b4/mbox.py
index ff96a11..c1a0660 100644
--- a/b4/mbox.py
+++ b/b4/mbox.py
@@ -231,14 +231,17 @@ def make_am(msgs, cmdargs, msgid):
         logger.critical(' Link: %s', linkurl)
 
     base_commit = None
-    matches = re.search(r'base-commit: .*?([\da-f]+)', first_body, re.MULTILINE)
-    if matches:
-        base_commit = matches.groups()[0]
+    if cmdargs.mergebase is not None:
+        base_commit = cmdargs.mergebase
     else:
-        # Try a more relaxed search
-        matches = re.search(r'based on .*?([\da-f]{40})', first_body, re.MULTILINE)
+        matches = re.search(r'base-commit: .*?([\da-f]+)', first_body, re.MULTILINE)
         if matches:
             base_commit = matches.groups()[0]
+        else:
+            # Try a more relaxed search
+            matches = re.search(r'based on .*?([\da-f]{40})', first_body, re.MULTILINE)
+            if matches:
+                base_commit = matches.groups()[0]
 
     if not base_commit and topdir and cmdargs.guessbase:
         logger.critical(' Base: attempting to guess base-commit...')
diff --git a/man/b4.5.rst b/man/b4.5.rst
index 073f32a..e889542 100644
--- a/man/b4.5.rst
+++ b/man/b4.5.rst
@@ -226,6 +226,8 @@ options:
                         Attempt to merge series as if it were a pull request (execs git-merge)
   --guess-lookback GUESSDAYS
                         (use with -H or -M) When guessing base, go back this many days from the patch date (default: 3 weeks)
+  --merge-base COMMIT
+                        (use with -H or -M) Force this base when merging
 
 *Example*: b4 shazam -H 20200313231252.64999-1-keescook@chromium.org
 
-- 
2.38.0

