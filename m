Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web12.197403.1598283804470565688
 for <tools@linux.kernel.org>;
 Mon, 24 Aug 2020 08:43:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@toxicpanda-com.20150623.gappssmtp.com header.s=20150623 header.b=TD9Vu5dY;
 spf=none, err=permanent DNS error (domain: toxicpanda.com, ip: 209.85.219.65, mailfrom: josef@toxicpanda.com)
Received: by mail-qv1-f65.google.com with SMTP id v1so3920033qvn.3
        for <tools@linux.kernel.org>; Mon, 24 Aug 2020 08:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GiA0mxFfobqJjKEKH3kFtIei7JAN3nlucEt3EpKFLqs=;
        b=TD9Vu5dYrDA+tT25TM+ckrmwhsbgKUyKEBloCKJ0QhHyvweJRVDxuhttLC/PnL8Vxa
         9t3mEBIyt1unEIiXANHxO8FZgN/tIlTak2LizdR/jDrEBI12AvZ0qetp2Z8vP75kOVjY
         zINGm/GI3trb1RgebplRmU0yGV43l896goRhA6PWUek9G9dXR1oX9l/R5dbg437bCG0x
         ekjUvYWzP//JVOiO0So0lEq42PFtqLJ2GtER5az/4GHPT/bqh2VhXRXmFPWhagfvTrM7
         kcW5TPjJkMx4vsNMthysLEFslA1DFOMvdft8t320MNqI3PrgFXKZ5FU21o1EFfgJYanD
         snEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GiA0mxFfobqJjKEKH3kFtIei7JAN3nlucEt3EpKFLqs=;
        b=jNHhKcnw7AQ9t5LwuFKPc5KUxQRzQPrCHsqsfaD6ZO9JlsACLDupWIUXm6Hm3M/x4/
         NKdi2OLXns1nY/j6+g+C4gDa5ryvhPjNKOW6yWK62wzJybeHhurxaKjplAueuipeRSE+
         UhghMEUiitxz7N6bdZEdTpCGBb57KuelkGM/dauPXLt2mukwOJaH4MSnaoez2LweE/nC
         crbYCACD0ilp83aZtJhCy/T9x2ek+ZpPmyF3FOpKtA0gbYOisOsM5eiI4LR23sZgjLAV
         qKz/1HiMtcZo19Ookq/qFy9liQgv8ts0lrS8mn1Jm3VsDm+wCwYP193Lr4VjrYgIyPqS
         5/dg==
X-Gm-Message-State: AOAM5328zWTIkW2m1Wq6WH61itHa1EUA2EhrdoVahgUkqrHgNH/NBx/9
	IIH/CzfQ9lMI3Hlpb7hBmkVrIqm/HOhur6LR
X-Google-Smtp-Source: ABdhPJwQE3djMkDAJX7aB/pILCMRPZT09xdiKvV42Z4IjMqzAxDgI34lmoGaJ6dA41zO1vaBDxxvDg==
X-Received: by 2002:ad4:42cc:: with SMTP id f12mr5506865qvr.89.1598283803304;
        Mon, 24 Aug 2020 08:43:23 -0700 (PDT)
Return-Path: <josef@toxicpanda.com>
Received: from localhost (cpe-174-109-172-136.nc.res.rr.com. [174.109.172.136])
        by smtp.gmail.com with ESMTPSA id h20sm9762403qkk.79.2020.08.24.08.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 08:43:22 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
To: tools@linux.kernel.org,
	kernel-team@fb.com
Subject: [PATCH] b4: add an --apply option for b4 am
Date: Mon, 24 Aug 2020 11:43:21 -0400
Message-Id: <73e01862e01dc42fe853365e4babe1f9d8c2e839.1598283790.git.josef@toxicpanda.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I'm infinitely lazy and would rather not have to copy and paste the git
am command to run.  This patch adds a --apply/-a option to git am so
it'll go ahead and run git am so I can get to the work of reviewing a
patch series.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 b4/command.py | 2 ++
 b4/mbox.py    | 7 ++++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/b4/command.py b/b4/command.py
index ffa58ef..c584fb0 100644
--- a/b4/command.py
+++ b/b4/command.py
@@ -113,6 +113,8 @@ def cmd():
                             '(tries to ensure that all index blobs exist by making a fake commit range)')
     sp_am.add_argument('--no-cover', dest='nocover', action='store_true', default=False,
                        help='Do not save the cover letter (on by default when using -o -)')
+    sp_am.add_argument('-a', '--apply', dest='apply', action='store_true', default=False,
+                       help='Run git am on the resulting am file')
     sp_am.set_defaults(func=cmd_am)
 
     # b4 attest
diff --git a/b4/mbox.py b/b4/mbox.py
index fb82389..0fd4795 100644
--- a/b4/mbox.py
+++ b/b4/mbox.py
@@ -239,7 +239,12 @@ def mbox_to_am(mboxfile, cmdargs):
         os.unlink(am_filename)
 
     thanks_record_am(lser, cherrypick=cherrypick)
-
+    if cmdargs.apply:
+        ecode, out = b4.git_run_command(None, ['am', am_filename])
+        if ecode > 0:
+            logger.critical("Error: couldn't apply patch cleanly")
+        else:
+            logger.critical("Applied patchfile cleanly")
 
 def thanks_record_am(lser, cherrypick=None):
     if not lser.complete:
-- 
2.24.1

