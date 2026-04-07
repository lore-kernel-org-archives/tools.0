Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846D23CEBBA
	for <tools@linux.kernel.org>; Tue,  7 Apr 2026 16:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775580527; cv=none; b=HPi8cDpBNnfJvPayXBofSR1sB7yiqeCwAEEhdxYYMtmWs3TuQu54GDbqh3Hlnwv91LoTkCWgcBVie4NCTic1/q/doJ9jG0/Og+Hvr/QdnRwQLMNd/B2bTKKo/OoJxt3hhkJaRm5XyJmeV6u/5Kh7p3yLjLnHPjyZ4KNgdqX9z2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775580527; c=relaxed/simple;
	bh=wXDLh7UOpQAUkVmVEpKgNSmEP5Z9WUwIm9fEjoR6wcU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sacMmNPhQN8chVmVIp7/6JqsvHzvUyQrPd1ZLqF6Oyv5D0Ems7Il/Zg68prD0Tw1gzC88zmm9ZitbmACNYvXYjG2zAjPPWPQ3d2eT2bfYCvV09DnbIzgC/XBoN+peO/DUan2rGxk1boTBrtS//9yuC5zhcwRtuV8pxwdVHGI064=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UET+Y8q9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UET+Y8q9"
Received: by smtp.kernel.org (Postfix)
	id 7724AC2BCAF; Tue,  7 Apr 2026 16:48:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1691CC116C6;
	Tue,  7 Apr 2026 16:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775580527;
	bh=wXDLh7UOpQAUkVmVEpKgNSmEP5Z9WUwIm9fEjoR6wcU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UET+Y8q9wP9lA0kZx8tAZPAMN8b5SZ70k2JvXSdudYwSc3HheFPCFDfe74CdYbwoi
	 DzbIMbDuKhE8SeL4xusGN8Lj3VdKcOUsmYrVIr2nhqUrKMDSH+aIa0eaykYXb79phf
	 R2UaZG83SYONVrDA8FYFMk83aZCYeMH51PLBN7DR0XKieqenhioEqZLqnlOqw9UtEG
	 Wikf66/1HssfxaFh2mhzvNMOtX2V+ynUUCQ3V2CHp3XxzvTvNpSvxb33lxt2GBQVdq
	 BSfYuofYMrM1++z8n2Z3mvhF/MmpPBXt8aWiGo+KjtF29vY7QyySkmyBnHzRB34phF
	 8En5uAhi8MN2A==
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 07 Apr 2026 12:48:39 -0400
Subject: [PATCH b4 10/12] Add ty and configuration
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-ruff-check-v1-10-c9568541ff67@kernel.org>
References: <20260407-ruff-check-v1-0-c9568541ff67@kernel.org>
In-Reply-To: <20260407-ruff-check-v1-0-c9568541ff67@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=30528; i=tamird@kernel.org;
 h=from:subject:message-id; bh=wXDLh7UOpQAUkVmVEpKgNSmEP5Z9WUwIm9fEjoR6wcU=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlXTTPmH1v2nHsNQ+XpR9sOtyfZZPGbHl8070uqc+LNs
 +vdlp1m7JjIwiDGxWAppsiSKHpob3rq7T2yme+Ow8xhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkY6BjrGDFycAjDV6kaMDIfqwyfm+EZxW7irq7594fbfrPdojexD+6WL9jOx5ZavqWD4Z71MbJl
 Tq7WMY5KSUaNDdZ5lZGTq1SoJ1w1yad/4b73kAAA=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

This revealed usage that assumed python >= 3.11 such as `|` unions and a
particular overload of `wsgiref.simple_server.make_server`.

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
 misc/send-receive.py               |   2 +
 pyproject.toml                     |   6 ++-
 src/b4/__init__.py                 |  52 +++++++++++-------
 src/b4/command.py                  |  12 ++---
 src/b4/dig.py                      |   4 +-
 src/b4/ez.py                       |   2 +-
 src/b4/mbox.py                     |   5 +-
 src/b4/pr.py                       |   4 ++
 src/b4/review/checks.py            |  16 +++---
 src/b4/review_tui/_common.py       | 106 +++++++++++++++++++++++++++++++------
 src/b4/review_tui/_review_app.py   |   7 ++-
 src/b4/review_tui/_tracking_app.py |   3 +-
 src/b4/tui/_common.py              |  18 ++++---
 src/b4/ty.py                       |   5 +-
 src/tests/test___init__.py         |   4 +-
 src/tests/test_tui_tracking.py     |   3 +-
 16 files changed, 180 insertions(+), 69 deletions(-)

diff --git a/misc/send-receive.py b/misc/send-receive.py
index 3f00f09..330bbae 100644
--- a/misc/send-receive.py
+++ b/misc/send-receive.py
@@ -700,6 +700,8 @@ class SendReceiveListener(object):
             resp.content_type = falcon.MEDIA_TEXT
             resp.text = 'Failed to parse the request\n'
             return
+        # TODO(https://github.com/astral-sh/ruff/pull/24458): remove this when ty understands conditional walrus.
+        action = None
         if not isinstance(jdata, Mapping) or (action := jdata.get('action')) is None:
             logger.critical('Action not set from %s', req.remote_addr)
             return
diff --git a/pyproject.toml b/pyproject.toml
index 389e573..25338e7 100644
--- a/pyproject.toml
+++ b/pyproject.toml
@@ -12,7 +12,7 @@ license = {file = "COPYING"}
 authors = [
     {name = "Konstantin Ryabitsev", email="konstantin@linuxfoundation.org"},
 ]
-requires-python = ">=3.9"
+requires-python = ">=3.11"
 classifiers = [
     "Environment :: Console",
     "Operating System :: POSIX :: Linux",
@@ -40,6 +40,7 @@ dev = [
     "pytest",
     "pytest-asyncio",
     "ruff",
+    "ty",
     "types-requests",
 ]
 misc = [
@@ -126,3 +127,6 @@ warn_unreachable = true
 [tool.pyright]
 typeCheckingMode = "standard"
 reportUnusedImport = true
+
+[tool.ty.rules]
+all = "error"
diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index e6eae3e..c9b05d8 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -57,7 +57,7 @@ import patatt
 ConfigDictT = Dict[str, Union[str, List[str], None]]
 
 from email import charset
-from email.message import EmailMessage
+from email.message import EmailMessage, Message
 
 charset.add_charset('utf-8', None)
 # Policy we use for saving mail locally
@@ -68,9 +68,9 @@ emlpolicy = email.policy.EmailPolicy(utf8=True, cte_type='8bit', max_line_length
 qspecials = re.compile(r'[()<>@,:;.\"\[\]]')
 
 # global setting allowing us to turn off networking
-can_network = True
+can_network: bool = True
 
-__VERSION__ = '0.16-dev'
+__VERSION__: str = '0.16-dev'
 PW_REST_API_VERSION = '1.2'
 
 
@@ -229,6 +229,8 @@ class LoreMailbox:
         # Are existing patches replies to previous revisions with the same counter?
         lser = self.series[revision]
         sane = True
+        # TODO(https://github.com/astral-sh/ruff/pull/24458): remove this when ty understands conditional walrus.
+        ppatch = None
         for patch in lser.patches:
             if patch is None:
                 continue
@@ -246,6 +248,8 @@ class LoreMailbox:
                     found = True
                     break
                 # Do we have another level up?
+                # TODO(https://github.com/astral-sh/ruff/pull/24458): remove this when ty understands conditional walrus.
+                npatch = None
                 if (
                     ppatch.in_reply_to is None
                     or (npatch := self.msgid_map.get(ppatch.in_reply_to)) is None
@@ -414,6 +418,8 @@ class LoreMailbox:
                     # Could be a cover letter
                     pmsg.followup_trailers += trailers
                     break
+                # TODO(https://github.com/astral-sh/ruff/pull/24458): remove this when ty understands conditional walrus.
+                nmsg = None
                 if (
                     pmsg.in_reply_to
                     and (nmsg := self.msgid_map.get(pmsg.in_reply_to)) is not None
@@ -1673,10 +1679,10 @@ class LoreMessage:
         # Identify all DKIM-Signature headers and try them in reverse order
         # until we come to a passing one
         dkhdrs = list()
-        for header in list(self.msg._headers): # type: ignore[attr-defined]
+        for header in list(self.msg._headers):  # type: ignore[attr-defined]  # ty: ignore[unresolved-attribute]
             if header[0].lower() == 'dkim-signature':
                 dkhdrs.append(header)
-                self.msg._headers.remove(header) # type: ignore[attr-defined]
+                self.msg._headers.remove(header)  # type: ignore[attr-defined]  # ty: ignore[unresolved-attribute]
         dkhdrs.reverse()
 
         seenatts = list()
@@ -1706,7 +1712,7 @@ class LoreMessage:
                 if isinstance(sh, str) and 'date' in sh.lower().split(':'):
                     signtime = self.date
 
-            self.msg._headers.append((hn, hval)) # type: ignore[attr-defined]
+            self.msg._headers.append((hn, hval))  # type: ignore[attr-defined]  # ty: ignore[unresolved-attribute]
             try:
                 res = dkim.verify(self.msg.as_bytes(policy=emlpolicy), logger=dkimlogger)
                 logger.debug('DKIM verify results: %s=%s', identity, res)
@@ -1723,7 +1729,7 @@ class LoreMessage:
                 self._attestors.append(attestor)
                 return
 
-            self.msg._headers.pop(-1) # type: ignore[attr-defined]
+            self.msg._headers.pop(-1)  # type: ignore[attr-defined]  # ty: ignore[unresolved-attribute]
             seenatts.append(attestor)
 
         # No exact domain matches, so return everything we have
@@ -2012,9 +2018,9 @@ class LoreMessage:
                             self.fromname = xpair[0]
                             self.fromemail = xpair[1]
                             # Drop the reply-to header if it's exactly the same
-                            for header in list(self.msg._headers): # type: ignore[attr-defined]
+                            for header in list(self.msg._headers):  # type: ignore[attr-defined]  # ty: ignore[unresolved-attribute]
                                 if header[0].lower() == 'reply-to' and header[1].find(xpair[1]) > 0:
-                                    self.msg._headers.remove(header) # type: ignore[attr-defined]
+                                    self.msg._headers.remove(header)  # type: ignore[attr-defined]  # ty: ignore[unresolved-attribute]
 
                 has_passing = True
                 att_info: Dict[str, Any] = {
@@ -2356,7 +2362,7 @@ class LoreMessage:
         return hdata
 
     @staticmethod
-    def get_clean_msgid(msg: EmailMessage, header: str = 'Message-Id') -> Optional[str]:
+    def get_clean_msgid(msg: Message, header: str = 'Message-Id') -> Optional[str]:
         msgid = None
         raw = msg.get(header)
         if raw:
@@ -3240,8 +3246,8 @@ def git_run_command(gitdir: Optional[Union[str, Path]], args: List[str], stdin:
 
     U = TypeVar('U', str, bytes)
 
-    def _handle(_out: U, _err: U) -> Tuple[int, Union[str, bytes]]:
-        if logstderr and len(_err.strip()):
+    def _handle(_out: U, _err: U) -> Tuple[int, U]:
+        if logstderr and len(_err.strip()):  # ty:ignore[no-matching-overload, invalid-argument-type] # https://github.com/astral-sh/ty/issues/1503
             logger.debug('Stderr: %s', _err)
             _out += _err
 
@@ -4694,10 +4700,17 @@ def send_mail(smtp: Union[smtplib.SMTP, smtplib.SMTP_SSL, List[str], None], msgs
 
     if isinstance(smtp, list):
         # This is a local command
+
+        # This a little crazy but it's possible, through multiple inheritance,
+        # for smtp to be a list of something other than str if it is also one of
+        # the other types in the union.
+        #
+        # https://github.com/astral-sh/ty/issues/1578
+        smtps = ' '.join(smtp)  # ty:ignore[no-matching-overload]
         if reflect:
-            logger.info('Reflecting via "%s"', ' '.join(smtp))
+            logger.info('Reflecting via "%s"', smtps)
         else:
-            logger.info('Sending via "%s"', ' '.join(smtp))
+            logger.info('Sending via "%s"', smtps)
         for destaddrs, bdata, lsubject in tosend:
             logger.info('  %s', lsubject.full_subject)
             if reflect:
@@ -4706,7 +4719,8 @@ def send_mail(smtp: Union[smtplib.SMTP, smtplib.SMTP_SSL, List[str], None], msgs
                 cmdargs = list(smtp) + list(destaddrs)
             ecode, _out, err = _run_command(cmdargs, stdin=bdata)
             if ecode > 0:
-                raise RuntimeError('Error running %s: %s' % (' '.join(smtp), err.decode()))
+                raise RuntimeError(
+                    'Error running %s: %s' % (smtps, err.decode()))
             sent += 1
 
     elif smtp:
@@ -5370,11 +5384,11 @@ def mailbox_email_factory(fh: BinaryIO) -> EmailMessage:
 
 def get_msgs_from_mailbox_or_maildir(mbmd: str) -> List[EmailMessage]:
     if is_maildir(mbmd):
-        in_mdr = mailbox.Maildir(mbmd, factory=mailbox_email_factory)  # type: ignore[arg-type]
-        return [x[1] for x in in_mdr.items()]  # type: ignore[misc]
+        in_mdr = mailbox.Maildir(mbmd, factory=mailbox_email_factory)  # type: ignore[arg-type]  # ty: ignore[invalid-argument-type]
+        return [x[1] for x in in_mdr.items()]  # type: ignore[misc]  # ty: ignore[invalid-return-type]
 
-    in_mbx = mailbox.mbox(mbmd, factory=mailbox_email_factory)  # type: ignore[arg-type]
-    return[x[1] for x in in_mbx.items()]  # type: ignore[misc]
+    in_mbx = mailbox.mbox(mbmd, factory=mailbox_email_factory)  # type: ignore[arg-type]  # ty: ignore[invalid-argument-type]
+    return [x[1] for x in in_mbx.items()]  # type: ignore[misc]  # ty: ignore[invalid-return-type]
 
 
 def get_mailfrom() -> Tuple[str, str]:
diff --git a/src/b4/command.py b/src/b4/command.py
index fc55c71..c820d61 100644
--- a/src/b4/command.py
+++ b/src/b4/command.py
@@ -142,7 +142,7 @@ class ConfigOption(argparse.Action):
     """Action class for storing key=value arguments in a dict."""
     def __call__(self, parser: argparse.ArgumentParser,
                  namespace: argparse.Namespace,
-                 keyval: Union[str, Sequence[Any], None],
+                 values: Union[str, Sequence[Any], None],
                  option_string: Optional[str] = None) -> None:
         config = getattr(namespace, self.dest, None)
 
@@ -150,13 +150,13 @@ class ConfigOption(argparse.Action):
             config = dict()
             setattr(namespace, self.dest, config)
 
-        if not isinstance(keyval, str):
-            raise TypeError(f'Expected a string config assignment, got {keyval!r}')
+        if not isinstance(values, str):
+            raise TypeError(f'Expected a string config assignment, got {values!r}')
 
-        if '=' in keyval:
-            key, value = keyval.split('=', maxsplit=1)
+        if '=' in values:
+            key, value = values.split('=', maxsplit=1)
         else:
-            key, value = keyval, 'true'
+            key, value = values, 'true'
         config[key] = value
 
 
diff --git a/src/b4/dig.py b/src/b4/dig.py
index 46e2510..422c56f 100644
--- a/src/b4/dig.py
+++ b/src/b4/dig.py
@@ -276,7 +276,7 @@ def dig_commitish(cmdargs: argparse.Namespace) -> None:
         if not best_match:
             # Next, try to find by exact patch-id
             for lmsg in all_lmsgs:
-                if lmsg.git_patch_id == patch_id:  # pyright: ignore[reportPossiblyUnboundVariable] # broken since 3ae277e9c7dd3e1df61a14884aabdd5834ad1201
+                if lmsg.git_patch_id == patch_id:  # pyright: ignore[reportPossiblyUnboundVariable] # ty:ignore[possibly-unresolved-reference] # broken since 3ae277e9c7dd3e1df61a14884aabdd5834ad1201
                     logger.debug('matched by exact patch-id')
                     best_match = lmsg
                     break
@@ -331,7 +331,7 @@ def dig_commitish(cmdargs: argparse.Namespace) -> None:
                 continue
             if firstmsg is None:
                 firstmsg = lmsg
-            if lmsg.git_patch_id == patch_id:  # pyright: ignore[reportPossiblyUnboundVariable] # broken since inception in 16329336c1c8faba853b11238a16249306742505
+            if lmsg.git_patch_id == patch_id:  # pyright: ignore[reportPossiblyUnboundVariable] # ty:ignore[possibly-unresolved-reference] # broken since inception in 16329336c1c8faba853b11238a16249306742505
                 logger.debug('Matched by exact patch-id')
                 break
             if lmsg.subject == csubj:
diff --git a/src/b4/ez.py b/src/b4/ez.py
index 51ded98..9f55bc9 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -1306,7 +1306,7 @@ def update_trailers(cmdargs: argparse.Namespace) -> None:
                 if fltr.lmsg is not None:
                     source = midmask % urllib.parse.quote_plus(fltr.lmsg.msgid, safe='@')
                 logger.info('  + %s', rendered)
-                logger.info('    via: %s', source)  # pyright: ignore[reportPossiblyUnboundVariable] # broken since 742e017c1b5b91d0e6fd6fca7decf73956b31487
+                logger.info('    via: %s', source)  # pyright: ignore[reportPossiblyUnboundVariable] # ty:ignore[possibly-unresolved-reference] # broken since 742e017c1b5b91d0e6fd6fca7decf73956b31487
             else:
                 logger.debug('  . %s', fltr.as_string(omit_extinfo=True))
 
diff --git a/src/b4/mbox.py b/src/b4/mbox.py
index 5e8093a..a73c995 100644
--- a/src/b4/mbox.py
+++ b/src/b4/mbox.py
@@ -49,7 +49,7 @@ def save_msgs_as_mbox(dest: str, msgs: List[EmailMessage], filterdupes: bool = F
         added = 0
         if filterdupes:
             for emsg in mdr:
-                have_msgids.add(b4.LoreMessage.get_clean_msgid(emsg))  # type: ignore[arg-type]
+                have_msgids.add(b4.LoreMessage.get_clean_msgid(emsg))
         for msg in msgs:
             if b4.LoreMessage.get_clean_msgid(msg) not in have_msgids:
                 added += 1
@@ -829,8 +829,7 @@ def refetch(dest: str) -> None:
 
     by_msgid: Dict[str, EmailMessage] = dict()
     for key, msg in mbox.items():
-        # We normally pass EmailMessage objects, but this works, too
-        msgid = b4.LoreMessage.get_clean_msgid(msg)  # type: ignore[arg-type]
+        msgid = b4.LoreMessage.get_clean_msgid(msg)
         if not msgid:
             continue
         if msgid not in by_msgid:
diff --git a/src/b4/pr.py b/src/b4/pr.py
index 939c1f5..469cc8e 100644
--- a/src/b4/pr.py
+++ b/src/b4/pr.py
@@ -458,6 +458,7 @@ def main(cmdargs: argparse.Namespace) -> None:
 
         if msgs:
             if cmdargs.sendidentity:
+                assert isinstance(cmdargs.sendidentity, str)
                 # Pass exploded series via git-send-email
                 config = b4.get_config_from_git(rf'sendemail\.{cmdargs.sendidentity}\..*')
                 if not len(config):
@@ -465,6 +466,9 @@ def main(cmdargs: argparse.Namespace) -> None:
                     sys.exit(1)
                 # Make sure from is not overridden by current user
                 mailfrom = msgs[0].get('from')
+                if not isinstance(mailfrom, str):
+                    logger.critical('Expected a string From header in exploded message, got %r', mailfrom)
+                    sys.exit(1)
                 gitargs = ['send-email', '--identity', cmdargs.sendidentity, '--from', mailfrom]
                 if cmdargs.dryrun:
                     gitargs.append('--dry-run')
diff --git a/src/b4/review/checks.py b/src/b4/review/checks.py
index 2ea5027..aec5de4 100644
--- a/src/b4/review/checks.py
+++ b/src/b4/review/checks.py
@@ -13,7 +13,7 @@ import pathlib
 import shlex
 import sqlite3
 from email.message import EmailMessage
-from typing import Any, Dict, List, Optional, Tuple
+from typing import Any, Dict, List, Optional, Tuple, Union
 
 import requests
 
@@ -153,12 +153,14 @@ def load_check_cmds() -> Tuple[List[str], List[str]]:
     """
     config = b4.get_main_config()
 
-    def _as_list(val: Any) -> List[str]:
-        if isinstance(val, str):
-            return [val]
-        if isinstance(val, list):
-            return list(val)
-        return []
+    def _as_list(val: Union[str, List[str], None]) -> List[str]:
+        match val:
+            case str():
+                return [val]
+            case list():
+                return val
+            case None:
+                return []
 
     perpatch = _as_list(config.get('review-perpatch-check-cmd'))
     if not perpatch:
diff --git a/src/b4/review_tui/_common.py b/src/b4/review_tui/_common.py
index 38cd9b2..5ec0157 100644
--- a/src/b4/review_tui/_common.py
+++ b/src/b4/review_tui/_common.py
@@ -9,7 +9,20 @@ import email.message
 import json
 import os
 import tempfile
-from typing import Any, Dict, List, Optional, Set, Tuple
+from typing import (
+    TYPE_CHECKING,
+    Any,
+    Awaitable,
+    Callable,
+    Dict,
+    List,
+    Optional,
+    ParamSpec,
+    Protocol,
+    Set,
+    Tuple,
+    TypeVar,
+)
 
 from rich import box
 from rich.padding import Padding
@@ -17,6 +30,7 @@ from rich.panel import Panel
 from rich.rule import Rule
 from rich.text import Text
 from textual.widgets import RichLog
+from textual.worker import Worker
 
 import b4
 import b4.review
@@ -24,6 +38,13 @@ import b4.review.tracking
 
 logger = b4.logger
 
+if TYPE_CHECKING:
+    from b4.review_tui._modals import CheckLoadingScreen
+
+_CallFromThreadParams = ParamSpec('_CallFromThreadParams')
+_CallFromThreadReturn = TypeVar('_CallFromThreadReturn')
+_WorkerResult = TypeVar('_WorkerResult')
+
 
 def get_thread_msgs(
     topdir: str,
@@ -124,6 +145,61 @@ from b4.tui._common import (
 )
 
 
+class _CallFromThreadHost(Protocol):
+    def call_from_thread(
+        self,
+        callback: Callable[
+            _CallFromThreadParams,
+            _CallFromThreadReturn | Awaitable[_CallFromThreadReturn],
+        ],
+        *args: _CallFromThreadParams.args,
+        **kwargs: _CallFromThreadParams.kwargs,
+    ) -> _CallFromThreadReturn: ...
+
+
+class _CheckRunnerHost(Protocol):
+    _check_loading: Optional['CheckLoadingScreen']
+
+    @property
+    def app(self) -> _CallFromThreadHost: ...
+
+    def _get_check_context(self) -> Optional[Tuple[str, str, str]]: ...
+
+    def _run_checks(self, force: bool = ...) -> None: ...
+
+    def _dismiss_loading(self, msg: str = ..., severity: str = ...) -> None: ...
+
+    def _update_loading(self, text: str) -> None: ...
+
+    def _fetch_and_check(
+        self,
+        message_id: str,
+        series_subject: str,
+        change_id: str = '',
+        force: bool = ...,
+    ) -> None: ...
+
+    def notify(self, message: str, *, severity: str = ...) -> None: ...
+
+    def push_screen(
+        self,
+        screen: object,
+        callback: Optional[Callable[[Optional[str]], None]] = ...,
+    ) -> object: ...
+
+    def run_worker(
+        self,
+        work: Callable[[], _WorkerResult],
+        name: Optional[str] = ...,
+        group: str = ...,
+        description: str = ...,
+        exit_on_error: bool = ...,
+        start: bool = ...,
+        exclusive: bool = ...,
+        thread: bool = ...,
+    ) -> Worker[_WorkerResult]: ...
+
+
 class CheckRunnerMixin:
     """Mixin providing CI check execution for Textual App subclasses.
 
@@ -132,7 +208,7 @@ class CheckRunnerMixin:
     interaction (loading overlay, results modal) is handled here.
     """
 
-    _check_loading: Optional[Any] = None
+    _check_loading: Optional['CheckLoadingScreen']
 
     # -- interface for subclasses ------------------------------------------
 
@@ -145,46 +221,46 @@ class CheckRunnerMixin:
 
     # -- public action -----------------------------------------------------
 
-    def action_check(self) -> None:
+    def action_check(self: _CheckRunnerHost) -> None:
         """Run CI checks on the current series."""
         self._run_checks(force=False)
 
     # -- helpers -----------------------------------------------------------
 
-    def _run_checks(self, force: bool = False) -> None:
+    def _run_checks(self: _CheckRunnerHost, force: bool = False) -> None:
         """Show loading overlay and launch the check worker thread."""
         ctx = self._get_check_context()
         if ctx is None:
             return
         message_id, series_subject, change_id = ctx
         if not message_id:
-            self.notify('No message-id for this series', severity='error')  # type: ignore[attr-defined]
+            self.notify('No message-id for this series', severity='error')
             return
         from b4.review_tui._modals import CheckLoadingScreen
         self._check_loading = CheckLoadingScreen()
-        self.push_screen(self._check_loading)  # type: ignore[attr-defined]
-        self.run_worker(  # type: ignore[attr-defined]
+        self.push_screen(self._check_loading)
+        self.run_worker(
             lambda: self._fetch_and_check(message_id, series_subject,
                                           change_id=change_id, force=force),
             name='_check_worker', thread=True)
 
-    def _dismiss_loading(self, msg: str = '', severity: str = '') -> None:
+    def _dismiss_loading(self: _CheckRunnerHost, msg: str = '', severity: str = '') -> None:
         """Dismiss the check loading screen and optionally notify."""
         def _do() -> None:
             if self._check_loading is not None and self._check_loading.is_attached:
                 self._check_loading.dismiss(None)
             if msg:
-                self.notify(msg, severity=severity)  # type: ignore[attr-defined]
-        self.app.call_from_thread(_do)  # type: ignore[attr-defined]
+                self.notify(msg, severity=severity)
+        self.app.call_from_thread(_do)
 
-    def _update_loading(self, text: str) -> None:
+    def _update_loading(self: _CheckRunnerHost, text: str) -> None:
         """Update the loading screen status text."""
         def _do() -> None:
             if self._check_loading is not None and self._check_loading.is_attached:
                 self._check_loading.update_status(text)
-        self.app.call_from_thread(_do)  # type: ignore[attr-defined]
+        self.app.call_from_thread(_do)
 
-    def _fetch_and_check(self, message_id: str, series_subject: str,
+    def _fetch_and_check(self: _CheckRunnerHost, message_id: str, series_subject: str,
                          change_id: str = '', force: bool = False) -> None:
         """Fetch thread, run checks, and push results modal (worker thread)."""
         import b4.review.checks as checks
@@ -355,11 +431,11 @@ class CheckRunnerMixin:
         def _push_modal() -> None:
             if self._check_loading is not None and self._check_loading.is_attached:
                 self._check_loading.dismiss(None)
-            self.push_screen(TrackingCheckResultsScreen(  # type: ignore[attr-defined]
+            self.push_screen(TrackingCheckResultsScreen(
                 title, patch_labels, patch_subjects, tools_sorted, matrix),
                 callback=_on_result)
 
-        self.app.call_from_thread(_push_modal)  # type: ignore[attr-defined]
+        self.app.call_from_thread(_push_modal)
 
 
 def _make_initials(name: str) -> str:
diff --git a/src/b4/review_tui/_review_app.py b/src/b4/review_tui/_review_app.py
index 8c2c110..c13d899 100644
--- a/src/b4/review_tui/_review_app.py
+++ b/src/b4/review_tui/_review_app.py
@@ -47,6 +47,7 @@ from b4.review_tui._common import (
     reviewer_colours,
 )
 from b4.review_tui._modals import (
+    CheckLoadingScreen,
     FollowupReplyPreviewScreen,
     HelpScreen,
     NoteScreen,
@@ -282,7 +283,7 @@ class ReviewApp(CheckRunnerMixin, App[None]):
         self._collapsed_comment_lines: Dict[int, Tuple[str, int]] = {}
         self._reply_sent: bool = False
         self._hide_skipped: bool = False
-        self._check_loading: Optional[Any] = None
+        self._check_loading: Optional[CheckLoadingScreen] = None
 
     def _get_check_context(self) -> Optional[Tuple[str, str, str]]:
         message_id = self._series.get('header-info', {}).get('msgid', '')
@@ -336,7 +337,9 @@ class ReviewApp(CheckRunnerMixin, App[None]):
             widget.update(f' WARNING: newer version(s) available: {versions}')
             widget.styles.display = 'block'
         else:
-            widget.styles.display = 'none'
+            # Textual infers StringEnumProperty from the default ("block"),
+            # so ty treats the valid "none" value as an invalid assignment.
+            widget.styles.display = 'none'  # ty: ignore[invalid-assignment]
 
     def _populate_patch_list(self) -> None:
         """Populate or refresh the patch list widget."""
diff --git a/src/b4/review_tui/_tracking_app.py b/src/b4/review_tui/_tracking_app.py
index 69c2769..9cdfa1f 100644
--- a/src/b4/review_tui/_tracking_app.py
+++ b/src/b4/review_tui/_tracking_app.py
@@ -51,6 +51,7 @@ from b4.review_tui._modals import (
     ActionScreen,
     ArchiveConfirmScreen,
     BaseSelectionScreen,
+    CheckLoadingScreen,
     CherryPickScreen,
     HelpScreen,
     LimitScreen,
@@ -606,7 +607,7 @@ class TrackingApp(CheckRunnerMixin, App[Optional[str]]):
         self._last_snooze_source: str = ''
         self._last_snooze_input: str = ''
         # CI check modal state
-        self._check_loading: Optional[Any] = None
+        self._check_loading: Optional[CheckLoadingScreen] = None
         # Thanks queue count
         self._queue_count: int = 0
         # Show target branch binding only when configured
diff --git a/src/b4/tui/_common.py b/src/b4/tui/_common.py
index 8eb6c45..306484e 100644
--- a/src/b4/tui/_common.py
+++ b/src/b4/tui/_common.py
@@ -12,7 +12,7 @@ import subprocess
 import tempfile
 import unicodedata
 from collections import defaultdict
-from typing import Any, Dict, List, Optional
+from typing import Any, Dict, List, Optional, Protocol
 
 from textual.app import ComposeResult
 from textual.binding import Binding
@@ -272,6 +272,12 @@ def _validate_addrs(text: str) -> Optional[str]:
     return None
 
 
+class _ListViewHost(Protocol):
+    _list_id: str
+
+    def query_one(self, selector: str, expect_type: type[ListView]) -> ListView: ...
+
+
 class JKListNavMixin:
     """Mixin providing j/k cursor navigation for a named ListView.
 
@@ -279,15 +285,13 @@ class JKListNavMixin:
     target :class:`ListView` (e.g. ``'#action-list'``).
     """
 
-    _list_id: str = ''
-
-    def action_cursor_down(self) -> None:
-        lv = self.query_one(self._list_id, ListView)  # type: ignore[attr-defined]
+    def action_cursor_down(self: _ListViewHost) -> None:
+        lv = self.query_one(self._list_id, ListView)
         if lv.index is not None and lv.index < len(lv.children) - 1:
             lv.index += 1
 
-    def action_cursor_up(self) -> None:
-        lv = self.query_one(self._list_id, ListView)  # type: ignore[attr-defined]
+    def action_cursor_up(self: _ListViewHost) -> None:
+        lv = self.query_one(self._list_id, ListView)
         if lv.index is not None and lv.index > 0:
             lv.index -= 1
 
diff --git a/src/b4/ty.py b/src/b4/ty.py
index 0d8adc2..f88b53f 100644
--- a/src/b4/ty.py
+++ b/src/b4/ty.py
@@ -523,7 +523,10 @@ def list_tracked() -> List[JsonDictT]:
     # find all tracked bits
     tracked = list()
     datadir = b4.get_data_dir()
-    paths = sorted(Path(datadir).iterdir(), key=os.path.getmtime)
+    # Work around https://github.com/astral-sh/ty/issues/2799, which widens the
+    # sorted element type when the key function accepts a broader path-like type
+    # than Path.
+    paths = sorted(Path(datadir).iterdir(), key=lambda path: path.stat().st_mtime)
     for fullpath in paths:
         if fullpath.suffix not in ('.pr', '.am'):
             continue
diff --git a/src/tests/test___init__.py b/src/tests/test___init__.py
index cf1a699..d4d4eaf 100644
--- a/src/tests/test___init__.py
+++ b/src/tests/test___init__.py
@@ -1,5 +1,6 @@
 import email
 import email.message
+import email.parser
 import email.policy
 import email.utils
 import io
@@ -40,13 +41,10 @@ def test_save_git_am_mbox(sampledir: Optional[str], tmp_path: pathlib.Path, sour
         if ismbox:
             msgs = b4.get_msgs_from_mailbox_or_maildir(f'{sampledir}/{source}.txt')
         else:
-            import email
-            import email.parser
             with open(f'{sampledir}/{source}.txt', 'rb') as fh:
                 msg = email.parser.BytesParser(policy=b4.emlpolicy, _class=email.message.EmailMessage).parse(fh)
             msgs = [msg]
     else:
-        import email.message
         msgs = list()
         for x in range(0, 3):
             msg = email.message.EmailMessage()
diff --git a/src/tests/test_tui_tracking.py b/src/tests/test_tui_tracking.py
index 103a7c3..7973b62 100644
--- a/src/tests/test_tui_tracking.py
+++ b/src/tests/test_tui_tracking.py
@@ -1243,7 +1243,8 @@ class TestTrackingDetailPanel:
 
             from textual.containers import Vertical
             panel = app.query_one('#details-panel', Vertical)
-            assert panel.styles.height.value == 0  # type: ignore[union-attr]
+            assert panel.styles.height is not None
+            assert panel.styles.height.value == 0
 
     @pytest.mark.asyncio
     async def test_detail_panel_updates_on_navigation(self, tmp_path: pathlib.Path) -> None:

-- 
2.53.0

