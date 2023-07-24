Received: from forward205c.mail.yandex.net (forward205c.mail.yandex.net [178.154.239.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E129D30A
	for <tools@linux.kernel.org>; Mon, 24 Jul 2023 14:25:41 +0000 (UTC)
Received: from forward101c.mail.yandex.net (forward101c.mail.yandex.net [IPv6:2a02:6b8:c03:500:1:45:d181:d101])
	by forward205c.mail.yandex.net (Yandex) with ESMTP id CF8CC4AB39
	for <tools@linux.kernel.org>; Mon, 24 Jul 2023 17:20:26 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-19.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-19.sas.yp-c.yandex.net [IPv6:2a02:6b8:c14:4081:0:640:557:0])
	by forward101c.mail.yandex.net (Yandex) with ESMTP id 1C94E600D0
	for <tools@linux.kernel.org>; Mon, 24 Jul 2023 17:20:19 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-19.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id FKKMjRUW1a60-YtSBCEpn;
	Mon, 24 Jul 2023 17:20:16 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1690208416;
	bh=uaQQuyfDpj/OVVZghT28RCCP5D95FaQ3zF9yxWpuRJo=;
	h=Message-Id:Date:Cc:Subject:To:From;
	b=TS/SMLbbGbUOZ/5iO/e7pVMLi8MRLIajdJKZ705Qupx74/Yv9XHQWCqByvLvuWqY8
	 /me7nENLRcHixYqRE/gru3zyqcUK9W5FJwR7jF37TnyllmCd4RxhwBmtoY6u+woaCk
	 cQj/h3HqUd7n3EM0J8puUam544iWIM8SMoji2KIs=
Authentication-Results: mail-nwsmtp-smtp-production-main-19.sas.yp-c.yandex.net; dkim=pass header.i=@maquefel.me
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: tools@linux.kernel.org
Cc: Nikita Shubin <nikita.shubin@maquefel.me>
Subject: [RFC PATCH] send: allow per patch To/Cc
Date: Mon, 24 Jul 2023 17:20:01 +0300
Message-Id: <20230724142001.8104-1-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add "--per-patch-to-cc" option to send command to allow invoking cccmd
and tocmd individually per patch - this is usefull when sending series to
multiply subsystems.

Cover letter will still includes To: and Cc: gathered by "prep --auto-to-cc".

Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
---
This makes b4 act as an old cocci_cc script, we gather emails by
--auto-to-cc, but then we can select email individually for each commit.
---
 b4/command.py |  2 ++
 b4/ez.py      | 51 +++++++++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 51 insertions(+), 2 deletions(-)

diff --git a/b4/command.py b/b4/command.py
index 1ae73d2..9dd5835 100644
--- a/b4/command.py
+++ b/b4/command.py
@@ -317,6 +317,8 @@ def setup_parser() -> argparse.ArgumentParser:
                          help='Send everything to yourself instead of the actual recipients')
     sp_send.add_argument('--no-trailer-to-cc', action='store_true', default=False,
                          help='Do not add any addresses found in the cover or patch trailers to To: or Cc:')
+    sp_send.add_argument('--per-patch-to-cc', action='store_true', default=False,
+                         help='Invoke individual tocmd, cccmd for each patch')
     sp_send.add_argument('--to', nargs='+', help='Addresses to add to the To: list')
     sp_send.add_argument('--cc', nargs='+', help='Addresses to add to the Cc: list')
     sp_send.add_argument('--not-me-too', action='store_true', default=False,
diff --git a/b4/ez.py b/b4/ez.py
index 3799e07..7925e31 100644
--- a/b4/ez.py
+++ b/b4/ez.py
@@ -1557,8 +1557,18 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
         if not cl_msgid:
             cl_msgid = b4.LoreMessage.get_clean_msgid(msg)
 
-        myto = list(allto)
-        mycc = list(allcc)
+        myto = list()
+        mycc = list()
+        if cmdargs.per_patch_to_cc and commit:
+            tocmd = get_to_cmd()
+            cccmd = get_cc_cmd()
+            msgbytes = msg.as_bytes()
+            myto = get_addresses_from_cmd(tocmd, msgbytes)
+            mycc = get_addresses_from_cmd(cccmd, msgbytes)
+        else:
+            myto = list(allto)
+            mycc = list(allcc)
+
         if msg['To']:
             myto += email.utils.getaddresses([msg['To']])
         if msg['Cc']:
@@ -2053,6 +2063,43 @@ def compare(compareto: str) -> None:
     logger.debug('Running %s', ' '.join(grdcmd))
     os.execvp(grdcmd[0], grdcmd)
 
+def get_to_cmd():
+    tocmdstr = None
+    topdir = b4.git_get_toplevel()
+    # Use sane tocmd and cccmd defaults if we find a get_maintainer.pl
+    getm = os.path.join(topdir, 'scripts', 'get_maintainer.pl')
+    config = b4.get_main_config()
+    if config.get('send-auto-to-cmd'):
+        tocmdstr = config.get('send-auto-to-cmd')
+    elif os.access(getm, os.X_OK):
+        tocmdstr = f'{getm} --nogit --nogit-fallback --nogit-chief-penguins --norolestats --nol'
+
+    tocmd = list()
+    if tocmdstr:
+        sp = shlex.shlex(tocmdstr, posix=True)
+        sp.whitespace_split = True
+        tocmd = list(sp)
+
+    return tocmd
+
+def get_cc_cmd():
+    cccmdstr = None
+    topdir = b4.git_get_toplevel()
+    # Use sane tocmd and cccmd defaults if we find a get_maintainer.pl
+    getm = os.path.join(topdir, 'scripts', 'get_maintainer.pl')
+    config = b4.get_main_config()
+    if config.get('send-auto-cc-cmd'):
+        cccmdstr = config.get('send-auto-cc-cmd')
+    elif os.access(getm, os.X_OK):
+        cccmdstr = f'{getm} --nogit --nogit-fallback --nogit-chief-penguins --norolestats --nom'
+
+    cccmd = list()
+    if cccmdstr:
+        sp = shlex.shlex(cccmdstr, posix=True)
+        sp.whitespace_split = True
+        cccmd = list(sp)
+
+    return cccmd
 
 def auto_to_cc() -> None:
     tocmdstr = None
-- 
2.39.2

