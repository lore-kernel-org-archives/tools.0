Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC122C80
	for <tools@linux.kernel.org>; Tue, 19 Oct 2021 14:46:02 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id g62-20020a9d2dc4000000b0054752cfbc59so2258868otb.1
        for <tools@linux.kernel.org>; Tue, 19 Oct 2021 07:46:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZMEUKF/B1mZOtvs0hyw2R9B+fOChkCsN1GenqWvTPXQ=;
        b=hjgsgBi6tFW8JBTqPt96SjOPUVsSURajL1kuppK4PZqat+KKuSZoDfwBlJ9U96o3Rc
         9YQjOGKjTxpqLBZahDABOS7srpsKrXIRMh0JKvAmu4N6vAwQMgmQn/AAbYBzIs7ndJ3j
         gVjMxDrE2Dsu3CQuNlPGm5GlyvNZhACDAW5aQyojvAHroobqn8Uu7tm7F+7mRdW8P2hB
         CJNlwKbsMTDYPkRS2arOd5YOGVlZWo6cNR5DQqY0YnqwG5eCedXl6SfDF+2pdG7xKTB+
         fjnd7pcFACXMtrlZn/qnuKNB+jT9a+Y2EcXaeEU9IaGoiQZQLVQDwVmuwDepM0XaPkt6
         aJrg==
X-Gm-Message-State: AOAM533gdA9djQuVeeM7Ej3v+A1QjVhiFlg616PhKtynmOkm7WcKk4tJ
	XBbw9HEVneOXiTy7gb9kgCr5zeqAoA==
X-Google-Smtp-Source: ABdhPJyJF4MIKq6sBoJmXPIJaqgl4E0FTtutz61UnaquuvJOz9wUzbmZ2ExgyeWxHVAMUlpgylHE1Q==
X-Received: by 2002:a9d:72d8:: with SMTP id d24mr5511880otk.149.1634654761419;
        Tue, 19 Oct 2021 07:46:01 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.googlemail.com with ESMTPSA id d18sm3109557ook.14.2021.10.19.07.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 07:46:00 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: [PATCH] Fix shazam for multiple git worktrees
Date: Tue, 19 Oct 2021 09:46:00 -0500
Message-Id: <20211019144600.225058-1-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The shazam command makes assumptions that '.git' is a directory which is
not the case with multiple worktree. Use 'git rev-parse' instead to
retrieve the correct paths.

Signed-off-by: Rob Herring <robh@kernel.org>
---
Maybe $GIT_DIR/b4-cover is not the best location given it depends on 
worktree details. Perhaps a .b4/ directory instead? 

 b4/mbox.py | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/b4/mbox.py b/b4/mbox.py
index 50dd2c36bb49..1b35623c2880 100644
--- a/b4/mbox.py
+++ b/b4/mbox.py
@@ -307,9 +307,13 @@ def make_am(msgs, cmdargs, msgid):
                 logger.critical('Unable to fetch from the worktree')
                 logger.critical(out.strip())
                 sys.exit(ecode)
-            # Edit the FETCH_HEAD to give a better default merge message
-            fhf = os.path.join(topdir, '.git', 'FETCH_HEAD')
-            with open(fhf, 'r') as fhh:
+            gitargs = ['rev-parse', '--git-path', 'FETCH_HEAD']
+            ecode, fhf = b4.git_run_command(topdir, gitargs, logstderr=True)
+            if ecode > 0:
+                logger.critical('Unable to find FETCH_HEAD')
+                logger.critical(out.strip())
+                sys.exit(ecode)
+            with open(fhf.rstrip(), 'r') as fhh:
                 contents = fhh.read()
             linkurl = config['linkmask'] % top_msgid
             if len(am_msgs) > 1:
@@ -321,7 +325,13 @@ def make_am(msgs, cmdargs, msgid):
                 with open(fhf, 'w') as fhh:
                     fhh.write(new_contents)
 
-            mmf = os.path.join(topdir, '.git', 'b4-cover')
+            gitargs = ['rev-parse', '--git-dir']
+            ecode, fhf = b4.git_run_command(topdir, gitargs, logstderr=True)
+            if ecode > 0:
+                logger.critical('Unable to find git directory')
+                logger.critical(out.strip())
+                sys.exit(ecode)
+            mmf = os.path.join(fhf.rstrip(), 'b4-cover')
             if lser.has_cover:
                 merge_template = DEFAULT_MERGE_TEMPLATE
                 if config.get('shazam-merge-template'):
@@ -358,7 +368,7 @@ def make_am(msgs, cmdargs, msgid):
 
         logger.info('You can now merge or checkout FETCH_HEAD')
         if lser.has_cover:
-            logger.info('  e.g.: git merge -F .git/b4-cover --signoff --edit FETCH_HEAD')
+            logger.info('  e.g.: git merge -F $(git rev-parse --git-dir)/b4-cover --signoff --edit FETCH_HEAD')
         thanks_record_am(lser, cherrypick=cherrypick)
         return
 
-- 
2.32.0

