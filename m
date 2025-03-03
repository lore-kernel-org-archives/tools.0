Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335CD442C
	for <tools@linux.kernel.org>; Mon,  3 Mar 2025 00:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740962083; cv=none; b=uCuxqG2E1ffGJc1+mB91uLXybW8+x5X87EzsJglLvxKCBzQ+JZOVfTDRdgDchyZiEjQAUl+6rwDDjMqaGP+2gAavNA8DROrsbzgKOXViC9RqwA4/LV0tY4n1nI71hZQFUfq3+AVl+ypXOOEyo+Ty/LVHfWJdPjMkT6Te4KfKxs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740962083; c=relaxed/simple;
	bh=XFFPBbup0j8uqeDFS0Glz5v39qOkLCXiIDI2wK+rEv8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=N9E/3j6xCq/znvx7LD2k2yfm5PfsCncHRVLb7gmQsOempML/ruiYBtVJbntGTg7fqKHM/NdXx0zriw1H4QjT952gwGXzlsBqS7XqLuWS0rWojM1O6Cd4PsYKOQExlPvqAwJKPTCdP4xvLpT4vA1nSDtD06Zj/n0O6upQbliJiWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BUvILR5/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BUvILR5/"
Received: by smtp.kernel.org (Postfix)
	id 1276BC4CEE2; Mon,  3 Mar 2025 00:34:43 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 01D93C4CED6
	for <tools@kernel.org>; Mon,  3 Mar 2025 00:34:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 01D93C4CED6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22355618fd9so62468895ad.3
        for <tools@kernel.org>; Sun, 02 Mar 2025 16:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740962079; x=1741566879; darn=kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N8LtpITm8x70gYWIM+F/gmMmnCnj0opAaHfMIHZc2rQ=;
        b=BUvILR5/Pvkr88OoedbnbzkMnQtA2ce6NesNLR1UGkhhXKp0HQLreR7PFnbqadsqDE
         kj2skBYX3RGz6ijxlTQxlexR2avQBH776H78k6ZQBDsHOn+S7Un8nb8J/ZYT+vVRJ5MC
         5zQ1TdzQUIxbfSCLSSCzve8YMfQhl/OD1fpuZvyb1pm9QO4oxkz2JU7fehzK/3GMbTW4
         L2NLQU2QPWOcLayn7w1Z0OVbZYAOdF/CPCDNjLwBXRkSGvO6WuGPeye3lJqHAxzPVDcJ
         lJloDYPYpIU0Yn7UnbFkc+QBDRSKuKBw4p2B75XrRPX8s6kLjw5voD8B0sRKfKx/NaD9
         cBRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740962079; x=1741566879;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N8LtpITm8x70gYWIM+F/gmMmnCnj0opAaHfMIHZc2rQ=;
        b=HaF3o2FvNY3G1Nzf1JmyRpvpAr/dXftwv+/T+Y8MI61m0wjOgtEc4bPOg/rYmIeb9H
         uoUS+k4sBK3zNM5qL83PT5tlKnysXx783xIxGjBDN0RVX7UhuKIWItfHXMizRY6Uyxho
         5CqzpH5OpURMr1QbTd/AgeJhhtmL3Ib6ou3ANfYhEUkOiY0HLNvFrBM1K73xis7uUcb2
         t00YoGWVTuxD+DpUPw+mE4kJDj/ic6vLDSX5sbBoTfGkv/hzVZlLdd56Kcd5mHaHs4wo
         utlwIFO6WNCk2N9Ie77S01hQORan5g2z3oP0GWOBtkco6+d65o7uWCieZH6ta3cmSoe2
         /r7w==
X-Gm-Message-State: AOJu0YwlOaD0HPJ5mB0rfcYGyWFu815mFm0djlYdKP5uYoa38N7+Rhf1
	AbrEgPd386F3sNHNsAX6SHdNGn76KEi2OfruXu85TrYJqAlyxE1J
X-Gm-Gg: ASbGncvNqcoZGGzX8WeDkUvpV6ear2zKHN9JZztrbEhbcZBFAMLHBTR6wSrdiKla5oR
	FYsflu9+NsV7be/EtHt4EwwBfAgMHETDLdijMr3oGgPvsSeF89lXrg0xQl5Ly7Q0fQkbAxXbAkh
	0P73cRecmlN+e2vahiWs9hX45cVEOpGzsyBM2iW6rnY2y8m3qPmNDE3ukHlZlisiaS6HHGg8nXI
	nWM6Zy7eJ3JL4GAdGJlpJuC1Y5nt6V8JzyRGFl3x03RllxwWnnHZBO5JrHngHEGSpBrx++LvXvt
	LFe+Ba1uGkzplCe4/IjcMmVfqwPpMAOHZIlxAnGBVQiINA==
X-Google-Smtp-Source: AGHT+IGIoODLPRIjzadOSCoV8Sl+MTGOYUNL5E00NWMP0qxjbctieJm0Tb1z4qrLhH0kn0n+KWZlMA==
X-Received: by 2002:a17:902:d48f:b0:223:570d:b4b1 with SMTP id d9443c01a7336-22368f6ddf8mr187952605ad.1.1740962079026;
        Sun, 02 Mar 2025 16:34:39 -0800 (PST)
Received: from [127.0.1.1] ([2601:644:8501:1640:2645:3c99:9dc4:8c41])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504c5a11sm66430855ad.150.2025.03.02.16.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 16:34:38 -0800 (PST)
From: Rudraksha Gupta <guptarud@gmail.com>
Date: Sun, 02 Mar 2025 16:34:34 -0800
Subject: [PATCH b4] Add `flow` subcommand
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250302-flow-v1-1-3247c022bbac@gmail.com>
X-B4-Tracking: v=1; b=H4sIABn5xGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDYwMj3bSc/HJdS1MTI0sTIGFiYKEEVFpQlJqWWQE2JlopyUQptrYWAMm
 uV0paAAAA
X-Change-ID: 20250302-flow-954294542408
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Rudraksha Gupta <guptarud@gmail.com>
X-Mailer: b4 0.15-dev-0ede1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740962078; l=4712;
 i=guptarud@gmail.com; s=20250208; h=from:subject:message-id;
 bh=XFFPBbup0j8uqeDFS0Glz5v39qOkLCXiIDI2wK+rEv8=;
 b=HTqL8Q+h/Vtb3B92smxnYlVJIg850v9PNLOOqz+3Wa9/FYet5QgOrtqVbSPQ92h/0L3TKHZ/X
 dDYdW5DscOTCaJQN6vyt3wnJpNhBA4UOvouqtryljf2te7g15zo7Vk5
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=5lJNaiR/Bu7edToWFLriO5zXOrVqSQWrBKbAKwuEw04=

`b4 flow` is an interactive session designed to handhold the user into
submitting patches upsteam. As b4 grows in complexity, there will be
multiple commands to remember. `b4 flow` covers the majority of cases and
shows the proper way to use the program.

Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
`b4 flow` is an interactive session designed to handhold the user into
submitting patches upsteam. As b4 grows in complexity, there will be
multiple commands to remember. `b4 flow` covers the majority of cases and
shows the proper way to use the program.
---
 src/b4/command.py | 75 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/src/b4/command.py b/src/b4/command.py
index 617a2d7..c0ac71a 100644
--- a/src/b4/command.py
+++ b/src/b4/command.py
@@ -9,6 +9,9 @@ import argparse
 import logging
 import b4
 import sys
+import subprocess
+import os
+import tempfile
 
 logger = b4.logger
 
@@ -93,6 +96,74 @@ def cmd_send(cmdargs):
     b4.ez.cmd_send(cmdargs)
 
 
+def cmd_flow(cmdargs):
+    import b4.ez
+    def run_b4_recursively(command_args: str):
+        current_path = os.path.dirname(os.path.abspath(__file__))
+        command_args_run = [os.path.join(current_path, 'b4.sh')] + command_args.split(" ")
+        command_args_bak = [os.path.join(current_path, '..', '..', 'b4.sh')] + command_args.split(" ")
+        # TODO: can we deterministically see where the shell script executed from?
+        try:
+            out = subprocess.run(command_args_run, check=True)
+        except:
+            try:
+                out = subprocess.run(command_args_bak, check=True)
+            except:
+                return False
+        return True
+
+    def question_user(prompt: str, command: str) -> bool:
+        # We want to default this as a Y so that users can use the `yes` command
+        user_input = input(prompt + ' [Y/n]: ')
+        if user_input.strip().lower() not in ['y', '']:
+            return False
+        run_b4_recursively(command)
+        return True
+
+    # Colors
+    WARNING = '\033[93m'
+    ENDC = '\033[0m'
+
+    print("Starting up an interactive session to submit kernel patches upstream. Make your changes prior to running this. Press Ctrl+C to exit at any point.")
+    print(WARNING)
+    print("If you changed a commit message, trailers will NOT be applied for that patch. Please manually apply them.")
+    print(ENDC)
+
+    question_user("Retrieve trailers?", "trailers -u")
+    question_user("Edit cover letter?", "prep --edit-cover")
+    with tempfile.TemporaryDirectory() as tmpdir:
+        if question_user("View patches?", f'send -o {tmpdir}'):
+            for file in os.listdir(tmpdir):
+                print(f"viewing: {file}")
+                file_path = os.path.join(tmpdir, file)
+                with open(file_path, 'r') as f:
+                    content = f.read().encode()
+                    b4.edit_in_editor(content, filehint='Review Patches')
+        # needs to run `b4 send -o {tmpdir}` just in case user says no in the previous question
+        if question_user("Run checkpatch.pl?", f'send -o {tmpdir}'):
+            for file in os.listdir(tmpdir):
+                if file.startswith('0000-'):
+                    continue
+
+                print(file)
+                file_path = os.path.join(tmpdir, file)
+                subprocess.run(["./scripts/checkpatch.pl", file_path], check=True)
+
+    cover, tracking = b4.ez.load_cover(strip_comments=True)
+    revision = tracking['series'].get('revision')
+    if revision > 1:
+        question_user("Compare with previous version?", f"prep --compare-to v{revision - 1}")
+
+    question_user("Auto add emails?", "prep --auto-to-cc")
+    question_user("Check with b4?", "prep --check")
+    question_user("Reflect patches?", "send --reflect")
+
+    print(WARNING)
+    print("You are about to send your patches upstream.")
+    print(ENDC)
+    question_user("Send?", "send")
+
+
 def cmd_am(cmdargs):
     import b4.mbox
     b4.mbox.main(cmdargs)
@@ -389,6 +460,10 @@ def setup_parser() -> argparse.ArgumentParser:
                           help='Submit the token received via verification email')
     sp_send.set_defaults(func=cmd_send)
 
+    # b4 flow
+    sp_flow = subparsers.add_parser('flow', help='Interactive session to submit patches upstream')
+    sp_flow.set_defaults(func=cmd_flow)
+
     return parser
 
 

---
base-commit: 42535902a457332560d860608b770fca9eea1382
change-id: 20250302-flow-954294542408

Best regards,
-- 
Rudraksha Gupta <guptarud@gmail.com>

