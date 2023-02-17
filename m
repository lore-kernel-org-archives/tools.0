Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B65376
	for <tools@linux.kernel.org>; Fri, 17 Feb 2023 03:56:18 +0000 (UTC)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=t-8ch.de; s=mail;
	t=1676606170; bh=fgjfPm9h3HVM75DOIMpxlJQ700l0IXlEOJUyONTPWEk=;
	h=From:Date:Subject:To:Cc:From;
	b=oDcpUhYt7KsuBwRsq+O18k6DzCrJViSzPe4fGZ+RZufxoW6lxpN7XghyqX3UsRCtg
	 iVZ0gAvSbB51iPtvn/S7R5IN2nKeXcD8pT3Dt/1pf76Mz7f7xlnIk4Nm9/Mzj0DB0f
	 tn5Twfbj46DyLieffoBFR7pS0WEOmUjNhIc2qGak=
Date: Fri, 17 Feb 2023 03:56:07 +0000
Subject: [PATCH b4] ez: send: make argument to --resend optional
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230217-resend-auto-version-v1-1-e1db938d6fee@t-8ch.de>
X-B4-Tracking: v=1; b=H4sIANb67mMC/x2NQQrDMAwEvxJ0riB2Ay39SulBspVGhzpFSkMg5
 O+1c1kYdofdwcVUHB7dDiarus6lQrh0kCYqb0HNlSH28drHcEMTl5KRfsuMq1jbIyUemGvke4B
 qMrkgG5U0NfdDvoi14msy6nbePYEHeB3HH4vYi1CCAAAA
To: "Kernel.org Tools" <tools@linux.kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1676606167; l=4237;
 i=thomas@t-8ch.de; s=20221212; h=from:subject:message-id;
 bh=fgjfPm9h3HVM75DOIMpxlJQ700l0IXlEOJUyONTPWEk=;
 b=Fh6qL1fcw6zdlYI/Hlre4Ro0Y+wft2n6/xlrutQl6/kffD58JepjAUYLsUNHY9NoVbaaUYGLn
 2HT090NUeMbATtjqT1nHJ2IuMF71A/+eH1ZvV2Fm0Ck0x1Vg3X+wdYj
X-Developer-Key: i=thomas@t-8ch.de; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

This frees the user from having to specifying an explicit version to
resend.
Most of the time this should be the latest version.

---


Signed-off-by: Thomas Weißschuh <thomas@t-8ch.de>
---
 b4/command.py |  2 +-
 b4/ez.py      | 10 ++++++++--
 man/b4.5      |  4 ++--
 man/b4.5.rst  |  4 ++--
 4 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/b4/command.py b/b4/command.py
index a7a5aa91b2e6..b38d69ce2713 100644
--- a/b4/command.py
+++ b/b4/command.py
@@ -319,7 +319,7 @@ def setup_parser() -> argparse.ArgumentParser:
     sp_send.add_argument('--cc', nargs='+', help='Addresses to add to the Cc: list')
     sp_send.add_argument('--not-me-too', action='store_true', default=False,
                          help='Remove yourself from the To: or Cc: list')
-    sp_send.add_argument('--resend', metavar='vN', default=None,
+    sp_send.add_argument('--resend', metavar='vN', nargs='?', const='latest',
                          help='Resend a previously sent version of the series')
     sp_send.add_argument('--no-sign', action='store_true', default=False,
                          help='Do not add the cryptographic attestation signature header')
diff --git a/b4/ez.py b/b4/ez.py
index 74afddcbf614..e4ef38c9ea0d 100644
--- a/b4/ez.py
+++ b/b4/ez.py
@@ -1257,10 +1257,16 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
     tag_msg = None
     cl_msgid = None
     if cmdargs.resend:
-        tagname, revision = get_sent_tagname(mybranch, SENT_TAG_PREFIX, cmdargs.resend)
+        if cmdargs.resend == 'latest':
+            cover, tracking = load_cover()
+            revstr = tracking['series']['revision']
+        else:
+            revstr = cmdargs.resend
+
+        tagname, revision = get_sent_tagname(mybranch, SENT_TAG_PREFIX, revstr)
 
         if revision is None:
-            logger.critical('Could not figure out revision from %s', cmdargs.resend)
+            logger.critical('Could not figure out revision from %s', revstr)
             sys.exit(1)
 
         try:
diff --git a/man/b4.5 b/man/b4.5
index fef1e87313c0..867ab35e6ebb 100644
--- a/man/b4.5
+++ b/man/b4.5
@@ -604,7 +604,7 @@ Enroll current branch, using the passed tag, branch, or commit as fork base
 .INDENT 0.0
 .TP
 .B usage:
-b4 send [\-h] [\-d] [\-o OUTPUT_DIR] [\-\-reflect] [\-\-no\-trailer\-to\-cc] [\-\-to TO [TO ...]] [\-\-cc CC [CC ...]] [\-\-not\-me\-too] [\-\-resend RESEND] [\-\-no\-sign] [\-\-web\-auth\-new] [\-\-web\-auth\-verify VERIFY_TOKEN]
+b4 send [\-h] [\-d] [\-o OUTPUT_DIR] [\-\-reflect] [\-\-no\-trailer\-to\-cc] [\-\-to TO [TO ...]] [\-\-cc CC [CC ...]] [\-\-not\-me\-too] [\-\-resend [RESEND]] [\-\-no\-sign] [\-\-web\-auth\-new] [\-\-web\-auth\-verify VERIFY_TOKEN]
 .TP
 .B options:
 .INDENT 7.0
@@ -637,7 +637,7 @@ Addresses to add to the Cc: list
 .B  \-\-not\-me\-too
 Remove yourself from the To: or Cc: list
 .TP
-.BI \-\-resend \ RESEND
+.BI \-\-resend \ [RESEND]
 Resend a previously sent version of the series
 .TP
 .B  \-\-no\-sign
diff --git a/man/b4.5.rst b/man/b4.5.rst
index 31beae44cefd..3b442c91aafb 100644
--- a/man/b4.5.rst
+++ b/man/b4.5.rst
@@ -390,7 +390,7 @@ Enroll existing branch:
 b4 send
 ~~~~~~~
 usage:
-  b4 send [-h] [-d] [-o OUTPUT_DIR] [--reflect] [--no-trailer-to-cc] [--to TO [TO ...]] [--cc CC [CC ...]] [--not-me-too] [--resend RESEND] [--no-sign] [--web-auth-new] [--web-auth-verify VERIFY_TOKEN]
+  b4 send [-h] [-d] [-o OUTPUT_DIR] [--reflect] [--no-trailer-to-cc] [--to TO [TO ...]] [--cc CC [CC ...]] [--not-me-too] [--resend [RESEND]] [--no-sign] [--web-auth-new] [--web-auth-verify VERIFY_TOKEN]
 
 options:
   -h, --help            show this help message and exit
@@ -411,7 +411,7 @@ options:
 
   --not-me-too
                         Remove yourself from the To: or Cc: list
-  --resend RESEND
+  --resend [RESEND]
                         Resend a previously sent version of the series
   --no-sign
                         Do not add the cryptographic attestation signature header

---
base-commit: ada3021c64dd484e53219eb3af55da6c8f25d0ec
change-id: 20230217-resend-auto-version-acb4bbcb4d81

Best regards,
-- 
Thomas Weißschuh <thomas@t-8ch.de>

