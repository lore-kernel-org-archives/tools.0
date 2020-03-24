Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
 by mx.groups.io with SMTP id smtpd.web12.2102.1585040464535878760
 for <tools@linux.kernel.org>;
 Tue, 24 Mar 2020 02:01:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: linux-m68k.org, ip: 195.130.137.89, mailfrom: geert@linux-m68k.org)
Received: from ramsan ([84.195.182.253])
	by laurent.telenet-ops.be with bizsmtp
	id J9122200L5USYZQ01912y5; Tue, 24 Mar 2020 10:01:02 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan with esmtp (Exim 4.90_1)
	(envelope-from <geert@linux-m68k.org>)
	id 1jGfQk-0008Jc-6w; Tue, 24 Mar 2020 10:01:02 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
	(envelope-from <geert@linux-m68k.org>)
	id 1jGfQk-0006cj-5I; Tue, 24 Mar 2020 10:01:02 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] Fix invocation of b4.sh through a symlink
Date: Tue, 24 Mar 2020 10:00:57 +0100
Message-Id: <20200324090057.25409-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.17.1

If b4 in your $PATH is a symlink pointing to b4.sh, $SCRIPT_TOP points
to the directory containing the symlink, and b4/command.py cannot be
found.

Fix this by following any symlinks, if present.

After this it works for being invoked through either an alias, symlink,
or plain path.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
Stack Overflow tells me "readlink -f" is not supported on OS X and some
BSDs. Do we care?
---
 b4.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/b4.sh b/b4.sh
index cafeee186115832d..e5459192d978e41b 100755
--- a/b4.sh
+++ b/b4.sh
@@ -3,6 +3,6 @@
 # Run b4 from a git checkout.
 #
 
-SCRIPT_TOP="${SCRIPT_TOP:-$(cd "${BASH_SOURCE%/*}" && pwd)}"
+SCRIPT_TOP="${SCRIPT_TOP:-$(dirname $(readlink -f $0))}"
 
 exec env PYTHONPATH="${SCRIPT_TOP}" python3 "${SCRIPT_TOP}/b4/command.py" "${@}"
-- 
2.17.1

