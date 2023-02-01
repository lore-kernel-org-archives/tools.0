Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78468483
	for <tools@linux.kernel.org>; Wed,  1 Feb 2023 17:34:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 168A3C433D2;
	Wed,  1 Feb 2023 17:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675272842;
	bh=ygc4IOR5OvRlgD4F6Q9hfed4+9m5JcEjPGCgA5dLEDA=;
	h=From:To:Cc:Subject:Date:From;
	b=bRuHPD5sloF3pF+zjmTTjkinTCyXMfGMUZAM0v9y/0gLtRAPZURJHm/yDsuWusCTB
	 4NxHVSC9KemAconh0zgTZeVcE2fpGaDS1vOAKhvjF9M9IdFcYrj2Tpb98iZo3c5UTX
	 e3ogv8StnOTw5FU6RtuhQV8LIwZoGaBgL4i6P96q2gQnQiULfk7cUYbpTy6WsdTluV
	 FNvf/Zxs+oC+cs9X/101fHIcb+g8vh7le968bkvynicZvIW1QUcMcqc2aVwhxMpC9m
	 1N3EX0jPszeqUuzEQ7ODup7sOm1T75v2Ps/QMRalKuG9rwRSQQbuJ2NT4vzyRuRayp
	 9QgfOSTbfPY7Q==
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com,
	konstantin@linuxfoundation.org
Cc: conor@kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>,
	tools@linux.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2] shazam: Add the --merge-base argument
Date: Wed,  1 Feb 2023 17:33:02 +0000
Message-Id: <20230201173301.54604-1-conor@kernel.org>
X-Mailer: git-send-email 2.39.1
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Palmer Dabbelt <palmer@rivosinc.com>

I was just handling a patch set where the author used English to
describe the dependencies.  They hadn't yet been merged at the time the
patch set was posted so I don't think there's really any way to make
sure the computers always understand the base, this just lets me quickly
override the automatic merge base detection when I run into something
non-canonical.

Link: https://lore.kernel.org/all/20220913061817.22564-1-zong.li@sifive.com/
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Co-developed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Been running this fixed up version for a bit now with no issues. Dunno
if the last submission didn't end up in an inbox for some reason, but
figured I'd resend with my fixes.
The changelog is the diff I attached in my response to the v1:
https://lore.kernel.org/tools/Y8199aCGNIW37YGx@spud/T/#m9fbe4c02429ec0601e5ff93fbe1aaecb368f736c
---
 b4/command.py |  2 ++
 b4/mbox.py    | 17 +++++++++++------
 man/b4.5.rst  |  2 ++
 3 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/b4/command.py b/b4/command.py
index 304450f..3d769ad 100644
--- a/b4/command.py
+++ b/b4/command.py
@@ -175,6 +175,8 @@ def setup_parser() -> argparse.ArgumentParser:
     sp_sh.add_argument('--guess-lookback', dest='guessdays', type=int, default=21,
                        help=('(use with -H or -M) When guessing base, go back this many days from the patch date '
                              '(default: 3 weeks)'))
+    sp_sh.add_argument('--merge-base', dest='mergebase', type=str, default=None,
+                       help=('(use with -H or -M) Force this base when merging'))
     sp_sh.set_defaults(func=cmd_shazam)
 
     # b4 pr
diff --git a/b4/mbox.py b/b4/mbox.py
index e0c6a0a..0b0fc40 100644
--- a/b4/mbox.py
+++ b/b4/mbox.py
@@ -211,14 +211,17 @@ def make_am(msgs: List[email.message.Message], cmdargs: argparse.Namespace, msgi
         logger.critical(' Link: %s', linkurl)
 
     base_commit = None
-    matches = re.search(r'base-commit: .*?([\da-f]+)', first_body, re.MULTILINE)
-    if matches:
-        base_commit = matches.groups()[0]
+    if cmdargs.mergebase:
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
 
     if base_commit and topdir:
         # Does it actually exist in this tree?
@@ -670,8 +673,8 @@ def refetch(dest: str) -> None:
 
 
 def main(cmdargs: argparse.Namespace) -> None:
+    # We force some settings
     if cmdargs.subcmd == 'shazam':
-        # We force some settings
         cmdargs.checknewer = True
         cmdargs.threeway = False
         cmdargs.nopartialreroll = False
@@ -683,6 +686,8 @@ def main(cmdargs: argparse.Namespace) -> None:
             cmdargs.guessbase = True
         else:
             cmdargs.guessbase = False
+    else:
+        cmdargs.mergebase = False
 
     if cmdargs.checknewer:
         # Force nocache mode
diff --git a/man/b4.5.rst b/man/b4.5.rst
index dc00ef2..31beae4 100644
--- a/man/b4.5.rst
+++ b/man/b4.5.rst
@@ -230,6 +230,8 @@ options:
                         Attempt to merge series as if it were a pull request (execs git-merge)
   --guess-lookback GUESSDAYS
                         (use with -H or -M) When guessing base, go back this many days from the patch date (default: 3 weeks)
+  --merge-base COMMIT
+                        (use with -H or -M) Force this base when merging
 
 *Example*: b4 shazam -H 20200313231252.64999-1-keescook@chromium.org
 
-- 
2.39.1

