Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD4D1FC1
	for <tools@linux.kernel.org>; Tue, 15 Nov 2022 03:25:07 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id b185so12893576pfb.9
        for <tools@linux.kernel.org>; Mon, 14 Nov 2022 19:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=7J564uUT549QGwk2qNdViBZ6DMA+npDXzUEyb/gTMqs=;
        b=7TT2PxFTEdX4vSPduzCMNeFKaij364p8iAcUEqQUYvPuURA2IdkqHmkQaZwLqaFppy
         RRr4+a0i/BQ9pysFHTX070iAsgvBrpMbmXj6jzq4Y0U7sDj6ryNIGeV23h1krhKvkzVp
         TBesdzSc//Q1LQA37sJTF75FVbKx4IKDBb2v5+BbgEZblKnbzOV6XY7HRtAxdcglHpM+
         kqoMzDUiNi1hzdUiXRc629h8N63JC9QrsnJT+N14ar6hmGKi1L6oZ5x30kNYlG3sivtg
         XJT8VQejQw9yCrFqRGMqxMBs9qn92ztXQbFUaMdtKm2ccwgr1i7GuWRC9F9mqUEZZmmt
         R0Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7J564uUT549QGwk2qNdViBZ6DMA+npDXzUEyb/gTMqs=;
        b=xhk43otadhJ/dVSO7K0oTVCT0roVVIvzL7lynGBJ4wFc/elO6qYff9fkUcZRTBZ39k
         Ch2ZTBk72P5iOMS3+sN4PxRoieHpeb/esTJDgXQQfhrVHWH3n0hpv9DD2cMJrcisPEH6
         KNQzPiId6z9fEG174cHOQI4qsi5dr5vdOa71q8vyzm7KFGR+e5rtEmPE8YZMopnbJ+UU
         n59uDY3gLXo/BYUQL68MLNl9PUFCMq7OY1/V7JtgwftdmORbnFMHj0w8FDDtWIx1ulV/
         ZRGym5DYsHbU+M5TUy0xis0ttsxJfdQD4+NBUMpQ1pY/mIFXAeHWKE4ze0fjd6AFxVoL
         YQKw==
X-Gm-Message-State: ANoB5pm+8oGhXx/JS7OX8ex5j0WSbCVieT7BrUrB6Y6CjWU3WzZim6Y1
	6ScDDB8QR5cQXMyOgcfjib6Z90QbKTYkqw==
X-Google-Smtp-Source: AA0mqf45t5STwkDqFv/HGN7yvVD26e1QgrDb5evOgv8bgHF/4X7g4suhVtwOvcW7t0Dx/COyaCSq1A==
X-Received: by 2002:a63:cd11:0:b0:46f:ef65:f6a8 with SMTP id i17-20020a63cd11000000b0046fef65f6a8mr14625006pgg.398.1668482706490;
        Mon, 14 Nov 2022 19:25:06 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id d199-20020a621dd0000000b00562677968aesm7481343pfd.72.2022.11.14.19.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 19:25:06 -0800 (PST)
Subject: [PATCH] mbox: Add the --pipe-each-message argument
Date: Mon, 14 Nov 2022 19:24:39 -0800
Message-Id: <20221115032439.24876-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.38.1
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: tools@linux.kernel.org

I've got an oddball mailbox format, so rather than trying to directly
encode it into b4 this just lets b4 pipe each message into a command
that sorts things out.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
This seems excessively ugly, I couldn't quite figure out why just
` save_git_am_mbox(list(msg))` wasn't doing it so I gave up.  Happy to
go do it right, but this works for me.

Also: this is on top of the patch stack I sent up earlier, sorry if
there's some conflicts.  I haven't jumped to a newer master yet...
---
 b4/command.py |  2 ++
 b4/mbox.py    | 13 +++++++++++++
 man/b4.5.rst  |  2 ++
 3 files changed, 17 insertions(+)

diff --git a/b4/command.py b/b4/command.py
index b68cf72..c32be13 100644
--- a/b4/command.py
+++ b/b4/command.py
@@ -36,6 +36,8 @@ def cmd_mbox_common_opts(sp):
                     help='Filename to name the mbox destination')
     sp.add_argument('-M', '--save-as-maildir', dest='maildir', action='store_true', default=False,
                     help='Save as maildir (avoids mbox format ambiguities)')
+    sp.add_argument('--pipe-each-message', dest='pipe_each_message', default=None,
+                    help='Pipe each message to an instance of the given command')
 
 
 def cmd_am_common_opts(sp):
diff --git a/b4/mbox.py b/b4/mbox.py
index 5842bf9..88a7667 100644
--- a/b4/mbox.py
+++ b/b4/mbox.py
@@ -20,6 +20,7 @@ import pathlib
 import tempfile
 import io
 import shlex
+import subprocess
 import argparse
 
 import urllib.parse
@@ -819,6 +820,18 @@ def main(cmdargs):
         logger.info('Saved maildir %s', savename)
         return
 
+    if cmdargs.pipe_each_message:
+        for msg in msgs:
+            proc = subprocess.Popen(cmdargs.pipe_each_message,
+                                    stdin=subprocess.PIPE,
+                                    encoding='utf8')
+            gen = email.generator.Generator(proc.stdin)
+            gen.flatten(msg)
+            gen.write("\n")
+            proc.stdin.close()
+            proc.wait()
+        return
+
     with open(savename, 'w') as fh:
         b4.save_git_am_mbox(msgs, fh)
 
diff --git a/man/b4.5.rst b/man/b4.5.rst
index dfe52e4..5126abf 100644
--- a/man/b4.5.rst
+++ b/man/b4.5.rst
@@ -89,6 +89,8 @@ options:
                         Save as maildir (avoids mbox format ambiguities)
   -f, --filter-dupes
                         When adding messages to existing maildir, filter out duplicates
+  --pipe-each-message
+                        Pipe each message to an instance of the given command
 
 
 *Example*: b4 mbox 20200313231252.64999-1-keescook@chromium.org
-- 
2.38.1

