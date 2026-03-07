Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6BE1A8F84
	for <tools@linux.kernel.org>; Sat,  7 Mar 2026 01:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772846875; cv=none; b=slTxFX8Q8JIL7c/5BvQOcHeA3m0Qc6fwYwn1rY7XMFE+LaH9G+/2syj15xZlLAF4GN0Fa0RRiD8/Fu6++uanevrQXfqxva8RiliWJzVM1I+fBRjCNZQaAUbs/sxGKf1wVGCgt3Y6LKjOP89EQrGCMNY+hhkQHdP0M2bJBepNpkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772846875; c=relaxed/simple;
	bh=23VuKL+7KT7/RU8mfG98Q3t8eP6ue3712w2ueEQd9i8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=um56KjX5JxcXg93ZsrN3/sJFUiStlk4WYUhbMz+fxn+3CnGDOSLaqbcgjfSlAvcDjhjM1Fn1szNaDMD5t5d5z2lT07bboeCuqUGqKKi4ogLxsCipXrwUJDQtx6pStfVeZzmXyLbUZ8gkj7Zk6ho+yJ0Eh5+TRWzirR/lGNPHVYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f+EOU0JY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f+EOU0JY"
Received: by smtp.kernel.org (Postfix)
	id 87EC6C2BC86; Sat,  7 Mar 2026 01:27:55 +0000 (UTC)
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7EE86C4CEF7
	for <tools@kernel.org>; Sat,  7 Mar 2026 01:27:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7EE86C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2b4520f6b32so11261141eec.0
        for <tools@kernel.org>; Fri, 06 Mar 2026 17:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772846873; x=1773451673; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5ZtSxL/wVbcPHHXbYM5r+HljsKfhEjY9Zdx95DEAGl4=;
        b=f+EOU0JYK0yiCqE89v/j0CyEQ0vSwwHYIsIoswrBx7hYiUtwIf/xzsajLZ+hu1miiF
         i86o5Rzo/GT5Nr/pz0GlMjg7ukWmEOYmhETu/Mg3Pjj1G82nwOd4LoYspg2uBDtuc22j
         v4kXrgHKVVtm/5toY+fo4BCeHqTHvlXhQFuIr91pGIvER9TqPAZ+vi/zJ0vU5UfL/bbB
         fWUAHmiLOaLubu09/qBQmL1Hlcw109iPOf+eg2OqmE3XmL4l5/6INp3HPSNhnIt3lbYf
         TrM1L3WJRrrden8Q5R7VpNWoLpcmav5JTpGdjTvXRPh9Qnz9qXyoqYuw7a1h9AxPLlhJ
         h5LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772846873; x=1773451673;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ZtSxL/wVbcPHHXbYM5r+HljsKfhEjY9Zdx95DEAGl4=;
        b=u0NHgIZfwjx9kOE317NEn0TOr653gCIiMRWZSbXASfKeuw9IiKLp4XfNFKmZm7R7i+
         nWrNbwQzKeiRJZUtpztwwXLcE+nJEICg4H0UZ8IDN6bcEB7ZY0H9Hucqugs38l6H3H6c
         VclPnaiU4WI+oIFciiVbX2AExy1ek/I1R4o7JCeRb9Mo84aixYSYszyvI/Oxxp2tdc2U
         0BQvLurSB1eEmju1yq4KBPduLoOGqtVKCIWgA2PxJWe+Wumn2urGXSaMH4QIoLRuRRUt
         xTJwllb2gSastP9pZWRqPG8DTJYAIDSGtRtUnmF6nl0ImAJakYCCFnGvielSQSz+pKn8
         Jnqg==
X-Gm-Message-State: AOJu0Yy0oMFv8OgHMF/cO9gDhhYhGVsPX8rDgwinepj1i6Td/5QLOdgz
	DekeET4Vei95oVfMGuSlzTCyl/K7FMUzKr/pABybB1KVoOyc7tzXyxcLUpXO4A==
X-Gm-Gg: ATEYQzxcZfen6YgJkVUG6XsTUzFrORdITJbVZIXPKpnUyBpsqICX+IDLnpgBWUBZema
	6uvOLSeygBqQ+76xfpAa2hhMc5YzKxwB3G3ikXp+PvIuyNSRhIyolnQcHrdRVI1sK+VjKPdcCOa
	8jiGfZdmjz9b/S2fBbFULEmsQJzQLUJOXZR7Vnx13G4y07QEl2I+Xju1rhbpqS+I8Re4/Lb8j9V
	fheemorTpQpfsudUmmiQvTZwC/PAVWnqLIXnFP9jyD56ZpwyeLhhBZzpGfUQQSmmq09B3n3F6+M
	RhQN052D6xSF6Wsy3TrtiKA1z8w+Y2qBDHnNhOy4cvsTgZ4KcN6MBzf1JHjizCmQoxmn803VYJQ
	hSXr72JPA+wc78rIGcYI1ePxxiso2CN4KnJWE/X5Hhu2vfAYgdLaMcL1LJqlYpT38ualLcdtgfW
	xQXs8rBMVDkrZdOnx1jSdpbCSLs7tMszrVumg21XmsWG5KS+bcvblAkkluvQbgSG0GyLaIb0c64
	IvvQaFiFs16NYA=
X-Received: by 2002:a05:7300:cb15:b0:2bd:b7b8:c361 with SMTP id 5a478bee46e88-2be4e08fb30mr1515803eec.35.1772846872979;
        Fri, 06 Mar 2026 17:27:52 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:1554:a973:4eed:d1b1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f82b1d3sm2360394eec.11.2026.03.06.17.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 17:27:52 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: tools@kernel.org
Subject: [PATCH] b4: Implement --bcc and send-series-bcc config option
Date: Fri,  6 Mar 2026 17:27:45 -0800
Message-ID: <20260307012748.1414702-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow using blind carbon copy when sending entire series (no per-patch
Bcc).

Handling is similar to "To" and "Cc" handling except that it ignores
"not-me-too" and other exclusion lists as the intent to send to the
address(es) specified in bcc is explicit.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 docs/config.rst           |  9 +++++++++
 docs/contributor/send.rst | 11 ++++++++++-
 src/b4/__init__.py        | 19 +++++++++++++------
 src/b4/command.py         |  1 +
 src/b4/ez.py              | 23 ++++++++++++++++++++++-
 5 files changed, 55 insertions(+), 8 deletions(-)

diff --git a/docs/config.rst b/docs/config.rst
index 8ffbf5e..9f508cf 100644
--- a/docs/config.rst
+++ b/docs/config.rst
@@ -591,6 +591,15 @@ Contributor-oriented settings
      .. versionchanged:: v0.15
         Added ``shallow`` config value.
 
+   :term:`b4.send-series-bcc`
+     A comma-separated list of addresses to always add to the "Bcc:" list.
+     Recipients in this list will always receive the series regardless of
+     any exclusion filters (such as the ``--not-me-too`` flag or the
+     :term:`b4.email-exclude` configuration setting).
+     See :ref:`prep_recipients`.
+
+     Default: ``None``
+
    :term:`b4.send-series-cc`
      A comma-separated list of addresses to always add to the "Cc:" header.
      See :ref:`prep_recipients`.
diff --git a/docs/contributor/send.rst b/docs/contributor/send.rst
index ba18ef5..1314d48 100644
--- a/docs/contributor/send.rst
+++ b/docs/contributor/send.rst
@@ -320,8 +320,17 @@ Command line flags
   configuration file using the :term:`b4.send-series-cc` option (see
   :ref:`contributor_settings`).
 
+``--bcc``
+  Additional email addresses to include into the Bcc: list. Recipients
+  in this list will always receive the series regardless of any
+  exclusion filters (such as the ``--not-me-too`` flag or the
+  :term:`b4.email-exclude` configuration setting). Separate multiple
+  entries with a comma. You can also set this in the configuration
+  file using the :term:`b4.send-series-bcc` option (see
+  :ref:`contributor_settings`).
+
 ``--not-me-too``
-  Removes your own email address from the recipients.
+  Removes your own email address from the To: or Cc: recipients.
 
 ``--no-sign``
   Don't sign your patches with your configured attestation mechanism.
diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 9a5d25b..9ad68a4 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -4413,6 +4413,14 @@ def send_mail(smtp: Union[smtplib.SMTP, smtplib.SMTP_SSL, List[str], None], msgs
         dryrun = True
 
     for msg in msgs:
+        if not destaddrs:
+            alldests = email.utils.getaddresses([str(x) for x in msg.get_all('to', [])])
+            alldests += email.utils.getaddresses([str(x) for x in msg.get_all('cc', [])])
+            alldests += email.utils.getaddresses([str(x) for x in msg.get_all('bcc', [])])
+            myaddrs = {x[1] for x in alldests}
+        else:
+            myaddrs = set(destaddrs)
+
         if not msg.get('X-Mailer'):
             msg.add_header('X-Mailer', f'b4 {__VERSION__}')
         msg.set_charset('utf-8')
@@ -4422,6 +4430,11 @@ def send_mail(smtp: Union[smtplib.SMTP, smtplib.SMTP_SSL, List[str], None], msgs
         else:
             nl = '\r\n'
 
+        # If we have a Bcc header, we must strip it from the message body
+        # before sending it out.
+        if msg['Bcc']:
+            del msg['Bcc']
+
         bdata = LoreMessage.get_msg_as_bytes(msg, nl=nl, headers='encode')
 
         subject = msg.get('Subject', '')
@@ -4450,12 +4463,6 @@ def send_mail(smtp: Union[smtplib.SMTP, smtplib.SMTP_SSL, List[str], None], msgs
             logger.info('    | ' + bdata.decode().rstrip().replace('\n', '\n    | '))
             logger.info('    --- DRYRUN: message ends ---')
             continue
-        if not destaddrs:
-            alldests = email.utils.getaddresses([str(x) for x in msg.get_all('to', [])])
-            alldests += email.utils.getaddresses([str(x) for x in msg.get_all('cc', [])])
-            myaddrs = {x[1] for x in alldests}
-        else:
-            myaddrs = set(destaddrs)
 
         tosend.append((myaddrs, bdata, ls))
 
diff --git a/src/b4/command.py b/src/b4/command.py
index a49a8bc..d115765 100644
--- a/src/b4/command.py
+++ b/src/b4/command.py
@@ -425,6 +425,7 @@ def setup_parser() -> argparse.ArgumentParser:
                          help='Do not add any addresses found in the cover or patch trailers to To: or Cc:')
     sp_send.add_argument('--to', nargs='+', metavar='ADDR', help='Addresses to add to the To: list')
     sp_send.add_argument('--cc', nargs='+', metavar='ADDR', help='Addresses to add to the Cc: list')
+    sp_send.add_argument('--bcc', nargs='+', metavar='ADDR', help='Addresses to add to the Bcc: list')
     sp_send.add_argument('--not-me-too', action='store_true', default=False,
                          help='Remove yourself from the To: or Cc: list')
     sp_send.add_argument('--resend', metavar='vN', nargs='?', const='latest',
diff --git a/src/b4/ez.py b/src/b4/ez.py
index 52eb239..378d201 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -1968,6 +1968,8 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
     excludes: Set[str] = set()
     pccs: Dict[str, List[Tuple[str, str]]] = dict()
 
+    bccdests = list()
+
     if cmdargs.preview_to or cmdargs.no_trailer_to_cc:
         todests = list()
         ccdests = list()
@@ -2006,6 +2008,7 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
 
     tos = set()
     ccs = set()
+    bccs = set()
     if cmdargs.preview_to:
         tos.update(cmdargs.preview_to)
     else:
@@ -2017,6 +2020,13 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
             ccs.update(cmdargs.cc)
         if config.get('send-series-cc'):
             ccs.add(config.get('send-series-cc'))
+        if cmdargs.bcc:
+            bccs.update(cmdargs.bcc)
+        if config.get('send-series-bcc'):
+            bccs.add(config.get('send-series-bcc'))
+    if bccs:
+        for pair in email.utils.getaddresses(list(bccs)):
+            bccdests.append(pair)
     if ccs:
         for pair in email.utils.getaddresses(list(ccs)):
             if pair[1] in seen:
@@ -2032,6 +2042,7 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
 
     allto = list()
     allcc = list()
+    allbcc = list()
     alldests = set()
 
     if todests:
@@ -2042,6 +2053,10 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
         allcc = b4.cleanup_email_addrs(ccdests, excludes, None)
         logger.debug('allcc: %s', allcc)
         alldests.update(set([x[1] for x in allcc]))
+    if bccdests:
+        allbcc = b4.cleanup_email_addrs(bccdests, set(), None)
+        logger.debug('allbcc: %s', allbcc)
+        alldests.update(set([x[1] for x in allbcc]))
 
     logger.debug('alldests: %s', alldests)
 
@@ -2076,7 +2091,7 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
 
     # Give the user the last opportunity to bail out
     if not cmdargs.dryrun:
-        if not len(alldests):
+        if not len(allto):
             logger.critical('CRITICAL: Could not find any destination addresses')
             logger.critical('          try b4 prep --auto-to-cc or b4 send --to addr')
             sys.exit(1)
@@ -2135,6 +2150,7 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
         logger.info('---')
         b4.print_pretty_addrs(allto, 'To')
         b4.print_pretty_addrs(allcc, 'Cc')
+        b4.print_pretty_addrs(allbcc, 'Bcc')
         logger.info('---')
         for commit, msg in patches:
             if not msg:
@@ -2256,6 +2272,11 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
                 msg.replace_header('Cc', b4.format_addrs(pcc))
             else:
                 msg.add_header('Cc', b4.format_addrs(pcc))
+        if allbcc:
+            if msg['Bcc']:
+                msg.replace_header('Bcc', b4.format_addrs(allbcc))
+            else:
+                msg.add_header('Bcc', b4.format_addrs(allbcc))
 
         send_msgs.append(msg)
 
-- 
2.53.0.473.g4a7958ca14-goog

