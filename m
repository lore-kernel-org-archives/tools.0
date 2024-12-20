Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295A91A726B
	for <tools@linux.kernel.org>; Fri, 20 Dec 2024 08:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734685175; cv=none; b=ZZE/K07b/3T9mrZ206XlogNZ/U8y2BpnijN8f8+rVgIbQi0H/4gmPVjklhKk0KqsJ7Em3zYRxGwlLiFLNOC8y2EzwrHxnYkiKBVa2E7eQg7cnjQ8RgPjqQcxaT2Uec8iz4WLDfU00zjs59XrzsbCw9PayiE8mK/KDFA32nx11LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734685175; c=relaxed/simple;
	bh=Uwp4v/PtXDdknCQTc82R5l9HO2HNI2ZVfBWTORCu9mw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Qzy5ugLA4Z8A1fPvrArqskegXnKIhwm43gBpRcgxoKa+Pi8I+AKDFtoH4dObJKwSiNqg6lhgfkMqG2e5lTnH7lkTAkR2u5WTjz9rucH2CPqhdQy4qVifdz+e1usnR+8tewmA83IUECK5eRy9NdObRV0QxCCHj4rjP9KmPkzXQDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dyoW3NBd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dyoW3NBd"
Received: by smtp.kernel.org (Postfix)
	id 08EC7C4AF09; Fri, 20 Dec 2024 08:59:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1E93C4CECD;
	Fri, 20 Dec 2024 08:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734685173;
	bh=Uwp4v/PtXDdknCQTc82R5l9HO2HNI2ZVfBWTORCu9mw=;
	h=From:Date:Subject:To:Cc:From;
	b=dyoW3NBdzTMn7GEF0F2NQOtP7YdoyOfK0LcNUxVQUtD0b7S+AvbJKt1ALu2/ufv/F
	 1tipViY6OsRlgJL0woso8xT8lTOOqcsIAngac+OXSsVB1mnni7iCvPLTo39padEOF5
	 OCZNTnOS/oMFTTdULDu3gCWRJ4a7pBRFR+6cw2MtI83d3baRzunkW0i0D+gvDP9GP3
	 5aUQgmDieFbVdUvU7JOYJJatUTxzgo6mnTK7RgcZkAWwbAWkz/I984H9jgQ0A+dXea
	 gSO91j9yf9M6ZfCEZ5ccZ/276HaR49wnMfgDceXrD6BxSxKrTSBmuOLjgLJGHKlOS7
	 zWhUMxKy6R6SQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 20 Dec 2024 09:57:36 +0100
Subject: [PATCH b4] ez: add subject prefix flag
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-prefix-v1-1-026a7be0b35a@kernel.org>
X-B4-Tracking: v=1; b=H4sIAH8xZWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDIyMD3YKi1LTMCl0L8xRDU3ND81STRBMloGKIMNigaKUkE6XY2loAzSU
 ZM1wAAAA=
X-Change-ID: 20241220-prefix-87d15717e4a4
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6065; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=Uwp4v/PtXDdknCQTc82R5l9HO2HNI2ZVfBWTORCu9mw=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBnZTGc4urt3CggGwAhHxda+WA10NmgF61kDwGqT
 otBO1NV2vWJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ2UxnAAKCRDhuBo+eShj
 d318D/92K6sJ3aPREG6/ncyD6zzxTkik5gXHZ5YA9M9fH2GKmOYLrioLbX/1PYXApQ2U7MFobur
 Pkd67g7nXCIk3WZ6Tv3L5w18uZSfGDUgxuNortg7+NO2pxZm/I5dOQVqhcjH/CIyQzpSUmJl5aO
 ckDzHNyO3bq+YriRe3wjyja8xUBjKk6VDRdcQY+q/Il3hF/Q3crchnonuCXz9eKPGS/SoK3vMqa
 UHhIHi24Wk3ZipKynVSVquOAvY/lBG7iIeYCMXoknQDVb2imWbsLnQvC40HXz4J1b+86tl4R3mk
 K/oVnf2jHH2NSzyrDXYcPeEkZM99RmNpYLUH7lBarC3lOYXY7L8vlYY3YQVf0O560Uipr2lCd60
 Yrd8CACYHbHyU70jFet4bOLqNVPypR+qDBY+52Nb6/YnMSZppY26xFKqb2PmAhCwXxT/iTdRkSW
 qoLuxZMNQej2C+dtU8JYjg6vXnpGJ1aD4CGeqXiF9lHACNZeOZj0nZTfOQPR5M07UDxcPWMOPOF
 QLVUsbqFvtABYNB0IH3k+0om7V9kJBIGwAzRNjdKHsbXt7qKSbwR/qr2z+60/VAZNrt4Gu3xMcs
 TxvZPj0KNO9uCNf/7tfYTmRvCWnY28k9M3NQdVSLqoLNiRiwV0ua3e9lmt3nc4hS8U62XVwbGNu
 6UgGPVLcfXb+PzQ==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add a flag `-p PREFIX`/`--add-subject-prefix=PREFIX` to `am` and `shazam`
commands. This flag will add PREFIX to the subject line of each patch before
applying the patch.

One use case for this is when composing trees that consist of patches from many
different sources. Adding a prefix to the subject of each series makes it easy
to see the origin when scanning the commit log.

Another side effect is that git will not remove the `PREFIX: [PATCH vX x/y]`
prefix from the patch when applying it. This might similarly be desirable in
some situations.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 src/b4/__init__.py | 14 ++++++++------
 src/b4/command.py  |  2 ++
 src/b4/mbox.py     |  2 +-
 3 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index bb93656d8ad7d50cbcda1f7d0d820be50725962f..da2c3734184a44a4c547f1c3daacfcdfbf8f4e0c 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -616,7 +616,7 @@ class LoreSeries:
 
     def get_am_ready(self, noaddtrailers: bool = False, addmysob: bool = False,
                      addlink: bool = False, cherrypick: Optional[List[int]] = None, copyccs: bool = False,
-                     allowbadchars: bool = False, showchecks: bool = False) -> List[email.message.EmailMessage]:
+                     allowbadchars: bool = False, showchecks: bool = False, addprefix: Optional[str] = None) -> List[email.message.EmailMessage]:
 
         usercfg = get_user_config()
         config = get_main_config()
@@ -750,7 +750,7 @@ class LoreSeries:
                 if noaddtrailers:
                     add_trailers = False
                 msg = lmsg.get_am_message(add_trailers=add_trailers, extras=extras, copyccs=copyccs,
-                                          addmysob=addmysob, allowbadchars=allowbadchars)
+                                          addmysob=addmysob, allowbadchars=allowbadchars, addprefix=addprefix)
                 if local_check_cmds:
                     lmsg.load_local_ci_status(local_check_cmds)
                 if lmsg.local_ci_status or lmsg.pw_ci_status in {'success', 'fail', 'warning'}:
@@ -2326,7 +2326,7 @@ class LoreMessage:
 
         self.body = LoreMessage.rebuild_message(bheaders, message, fixtrailers, basement, signature)
 
-    def get_am_subject(self, indicate_reroll: bool = True, use_subject: Optional[str] = None) -> str:
+    def get_am_subject(self, indicate_reroll: bool = True, use_subject: Optional[str] = None, prefix: Optional[str] = None) -> str:
         # Return a clean patch subject
         parts = ['PATCH']
         if self.lsubject.rfc:
@@ -2347,11 +2347,13 @@ class LoreMessage:
         if not use_subject:
             use_subject = self.lsubject.subject
 
-        return '[%s] %s' % (' '.join(parts), use_subject)
+        prefix = "" if prefix is None else prefix
+
+        return '%s: [%s] %s' % (prefix, ' '.join(parts), use_subject)
 
     def get_am_message(self, add_trailers: bool = True, addmysob: bool = False,
                        extras: Optional[List['LoreTrailer']] = None, copyccs: bool = False,
-                       allowbadchars: bool = False) -> email.message.EmailMessage:
+                       allowbadchars: bool = False, addprefix: Optional[str] = None) -> email.message.EmailMessage:
         # Look through the body to make sure there aren't any suspicious unicode control flow chars
         # First, encode into ascii and compare for a quick utf8 presence test
         if not allowbadchars and self.body.encode('ascii', errors='replace') != self.body.encode():
@@ -2396,7 +2398,7 @@ class LoreMessage:
 
         am_msg = email.message.EmailMessage()
         hfrom = format_addrs([(i.get('Author', ''), i.get('Email'))])
-        am_msg.add_header('Subject', self.get_am_subject(indicate_reroll=False, use_subject=i.get('Subject')))
+        am_msg.add_header('Subject', self.get_am_subject(indicate_reroll=False, use_subject=i.get('Subject'), prefix=addprefix))
         am_msg.add_header('From', hfrom)
         am_msg.add_header('Date', i.get('Date'))
         am_msg.add_header('Message-Id', f'<{self.msgid}>')
diff --git a/src/b4/command.py b/src/b4/command.py
index 5d90b4f52b4f3bd84f8660c26fc005af98309c26..ad02765c7ef715f44eddc859b1577dae74c85292 100644
--- a/src/b4/command.py
+++ b/src/b4/command.py
@@ -61,6 +61,8 @@ def cmd_am_common_opts(sp):
                     help='Break thread at the msgid specified and ignore any parent messages')
     sp.add_argument('--allow-unicode-control-chars', dest='allowbadchars', action='store_true', default=False,
                     help='Allow unicode control characters (very rarely legitimate)')
+    sp.add_argument('-p', '--add-subject-prefix', dest='addprefix', default=None,
+                      help='Add a PREFIX: to every patch subject line')
     sa_g = sp.add_mutually_exclusive_group()
     sa_g.add_argument('-l', '--add-link', dest='addlink', action='store_true', default=False,
                       help='Add a Link: trailer with message-id lookup URL to every patch')
diff --git a/src/b4/mbox.py b/src/b4/mbox.py
index 7061d1493be3e0d116ec504c9a1638be34b65a9a..195f24d0e4d968e2e6e4997265cc7e318b2248ed 100644
--- a/src/b4/mbox.py
+++ b/src/b4/mbox.py
@@ -159,7 +159,7 @@ def make_am(msgs: List[email.message.EmailMessage], cmdargs: argparse.Namespace,
 
     am_msgs = lser.get_am_ready(noaddtrailers=cmdargs.noaddtrailers, addmysob=cmdargs.addmysob, addlink=cmdargs.addlink,
                                 cherrypick=cherrypick, copyccs=cmdargs.copyccs, allowbadchars=cmdargs.allowbadchars,
-                                showchecks=cmdargs.check)
+                                showchecks=cmdargs.check, addprefix=cmdargs.addprefix)
     logger.info('---')
 
     if cherrypick is None:

---
base-commit: 1b0d65dfcb498531da131511cab7f14e5845d969
change-id: 20241220-prefix-87d15717e4a4

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


