Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE876376
	for <tools@linux.kernel.org>; Fri, 17 Feb 2023 03:59:01 +0000 (UTC)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=t-8ch.de; s=mail;
	t=1676606339; bh=aGN2pDNla2to1HUi4tv53tXvS8OW3xGyAeU6FWlnxjQ=;
	h=From:Date:Subject:To:Cc:From;
	b=IOHlTEIqMvMsI+Wh36lGy9aiw0D+NvatfNlWzvo0DPGPvA6Sul08KE21GnVPvfYqa
	 u+lOJYu7cbqvFaL3Y1wRD00AMhAyYjEk1vHZ8rWM5SGq+w7HssHN2SVAjXJkfq6l3X
	 ITia0KvC8z57kD4ieo9uZj+MC5K7yJTxXcuYO7Xo=
Date: Fri, 17 Feb 2023 03:58:58 +0000
Subject: [PATCH b4 v2] ez: send: make argument to --resend optional
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230217-resend-auto-version-v2-1-0830b9733993@t-8ch.de>
X-B4-Tracking: v=1; b=H4sIAIH77mMC/31OSw7CIBC9SjNrxxTaaHXlPUwXDEyFhdQMSDRN7
 y7tAdy85P3y3gKJJXCCa7OAcAkpzLESfWjAehMfjMFVDrrVXavVGYUTR4fmnWcsLFsejaWeqII
 bFNQmmcRIYqL1W/dpUmbZjJfwFD773B2oh7FqPqQ8y3d/UNTu/B0rChWycnTpBneamG8ZB+uPj
 mFc1/UHruIcWtIAAAA=
To: "Kernel.org Tools" <tools@linux.kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1676606337; l=4413;
 i=thomas@t-8ch.de; s=20221212; h=from:subject:message-id;
 bh=aGN2pDNla2to1HUi4tv53tXvS8OW3xGyAeU6FWlnxjQ=;
 b=fZfDRXIRMX0Z6zCxlI8/wIsO7WhLOkmpaWzGdiybUsw3ErrUntIZP8GfQ3JITIo1+6YNG1I/Y
 bjoZdjtVhEwBWlnymXBw8DQl6BMfRxwl7J8guIiZ7A4bm66ZwCL82bk
X-Developer-Key: i=thomas@t-8ch.de; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

This frees the user from having to specifying an explicit version to
resend.
Most of the time this should be the latest version.

---


Signed-off-by: Thomas Weißschuh <thomas@t-8ch.de>
---
Changes in v2:
- Correctly use last *sent* version, not current active one
- Link to v1: https://msgid.link/20230217-resend-auto-version-v1-1-e1db938d6fee@t-8ch.de
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
index 74afddcbf614..625a27c2db2a 100644
--- a/b4/ez.py
+++ b/b4/ez.py
@@ -1257,10 +1257,16 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
     tag_msg = None
     cl_msgid = None
     if cmdargs.resend:
-        tagname, revision = get_sent_tagname(mybranch, SENT_TAG_PREFIX, cmdargs.resend)
+        if cmdargs.resend == 'latest':
+            cover, tracking = load_cover()
+            revstr = tracking['series']['revision'] - 1
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

