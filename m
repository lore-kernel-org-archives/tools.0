Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
 by mx.groups.io with SMTP id smtpd.web11.54777.1584976241842838505
 for <tools@linux.kernel.org>;
 Mon, 23 Mar 2020 08:10:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: linux-m68k.org, ip: 195.130.132.52, mailfrom: geert@linux-m68k.org)
Received: from ramsan ([84.195.182.253])
	by xavier.telenet-ops.be with bizsmtp
	id HrAf2200U5USYZQ01rAfNq; Mon, 23 Mar 2020 16:10:40 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan with esmtp (Exim 4.90_1)
	(envelope-from <geert@linux-m68k.org>)
	id 1jGOit-0007EA-PN; Mon, 23 Mar 2020 16:10:39 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
	(envelope-from <geert@linux-m68k.org>)
	id 1jGOit-0000DR-NT; Mon, 23 Mar 2020 16:10:39 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH lore] Typos: s/Start Trek/Star Trek/
Date: Mon, 23 Mar 2020 16:10:38 +0100
Message-Id: <20200323151038.784-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 README.rst   | 2 +-
 man/b4.5     | 2 +-
 man/b4.5.rst | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/README.rst b/README.rst
index d7a7743c1c448ed2..5ffa652fa41d0111 100644
--- a/README.rst
+++ b/README.rst
@@ -4,7 +4,7 @@ easier to participate in a patch-based workflows, like those used in
 the Linux kernel development.
 
 The name "b4" was chosen for ease of typing and because B-4 was the
-precursor to Lore and Data in the Start Trek universe.
+precursor to Lore and Data in the Star Trek universe.
 
 See man/b4.5.rst for more information.
 
diff --git a/man/b4.5 b/man/b4.5
index 7667caa28216859f..8fe8fa774efd2050 100644
--- a/man/b4.5
+++ b/man/b4.5
@@ -41,7 +41,7 @@ easier to participate in a patch\-based workflows, like those used in
 the Linux kernel development.
 .sp
 The name "b4" was chosen for ease of typing and because B\-4 was the
-precursor to Lore and Data in the Start Trek universe.
+precursor to Lore and Data in the Star Trek universe.
 .SH SUBCOMMANDS
 .INDENT 0.0
 .IP \(bu 2
diff --git a/man/b4.5.rst b/man/b4.5.rst
index 1af8addd7e3bd2b7..0bea71f7564c46ff 100644
--- a/man/b4.5.rst
+++ b/man/b4.5.rst
@@ -23,7 +23,7 @@ easier to participate in a patch-based workflows, like those used in
 the Linux kernel development.
 
 The name "b4" was chosen for ease of typing and because B-4 was the
-precursor to Lore and Data in the Start Trek universe.
+precursor to Lore and Data in the Star Trek universe.
 
 SUBCOMMANDS
 -----------
-- 
2.17.1

