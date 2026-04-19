Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A002BF3D7
	for <tools@linux.kernel.org>; Sun, 19 Apr 2026 16:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776614412; cv=none; b=ALz5RIlHCi9IfbuYq08WekkZinVT5Z43/2kZRG/ruhTYF4epjraWJlSVwql5VOGkcoMXf0zzz9P2GBu0Oq8kUED4VBF6Xf2gmXZfg15C2tPPipBdSo5Xf99h37SsCNL32tsbIbWoLVvo+jHSQdNQRijBCGSvVtSMjNzOGQC60p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776614412; c=relaxed/simple;
	bh=VxDcs3yYKh5ELcoIGNcVSuB56Un+D4unz2s5+9/Zt+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JZEauXYVvyNrewUChgeuaTkFvqqRAE3wYnt2cnomtbRnhOtNRNxSU8MDrRQKr8chTx5KswNsIQtPr2M0YSwLTgfgrvHd3H11QtU4DQySQ95Lb5uof5uKCxQkd48kKcuw5sf/sYSjaOQDikN0YrYUWcQBmp3xbfJRY1pHwHRvUnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QFgyTOl9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QFgyTOl9"
Received: by smtp.kernel.org (Postfix)
	id D173CC2BCAF; Sun, 19 Apr 2026 16:00:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 746FBC2BCB5;
	Sun, 19 Apr 2026 16:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776614412;
	bh=VxDcs3yYKh5ELcoIGNcVSuB56Un+D4unz2s5+9/Zt+M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QFgyTOl9W4Xrd36yHtBQ1pXScMVCJuL36uUHPpkZ/vytSdMfQDJKE0xgvAk4WVew+
	 V+LJN3qzGnta0HDwr+grnIa9DpOEUmWfRIiZVzdT63DyINSrIDqBWfHBslbrsaJ4tA
	 RFuD01iPG6m+2QHgcfuuBYD9JjrTwCbhJxtc1fBYta1QwMPvQ7XhkN/CPTxEhVLOAO
	 iM0lsDZA4DJAOzYNvCak5pRip8ZKY/Ic6NTLhpZAPKDIQOmkT20HcAprAWjJmXaBGK
	 mAmufIPr1uVmCDSpbqaFz94asJcZtZ5NoGSmOfNGS8B/e2SnXoK0BlosUCNng4O/OD
	 LsRuyZ5d7KlRQ==
From: Tamir Duberstein <tamird@kernel.org>
Date: Sun, 19 Apr 2026 12:00:05 -0400
Subject: [PATCH b4 v2 10/11] Add ty and configuration
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260419-ruff-check-v2-10-089dfb264501@kernel.org>
References: <20260419-ruff-check-v2-0-089dfb264501@kernel.org>
In-Reply-To: <20260419-ruff-check-v2-0-089dfb264501@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=29804; i=tamird@kernel.org;
 h=from:subject:message-id; bh=VxDcs3yYKh5ELcoIGNcVSuB56Un+D4unz2s5+9/Zt+M=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlP/rDmXFI+vG6DQFd92PzPr1U9GO/w/l3Df7aZMcNWe
 vbUN0sXdExkYRDjYrAUU2RJFD20Nz319h7ZzHfHYeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdAx1jBi5OAZjqFU8ZGa4E2jYHV9XY9diGF1QlzPDdwXXznsOnb+8O3jpzjbs29wXD/4B3JYk
 qb3bqXvyVVGDVY/zlES93loHDtF//2p97X7Q6wQ4A
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

This revealed usage that assumed Python >= 3.11 such as `|` unions and a
particular overload of `wsgiref.simple_server.make_server`.

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
 ci.sh                              |   1 +
 misc/send-receive.py               |   2 +
 pyproject.toml                     |   9 +++-
 src/b4/__init__.py                 |  49 ++++++++++-------
 src/b4/command.py                  |  12 ++---
 src/b4/dig.py                      |   4 +-
 src/b4/ez.py                       |   2 +-
 src/b4/mbox.py                     |   5 +-
 src/b4/pr.py                       |   7 +++
 src/b4/review/checks.py            |  16 +++---
 src/b4/review_tui/_common.py       | 108 +++++++++++++++++++++++++++++++------
 src/b4/review_tui/_review_app.py   |   5 +-
 src/b4/review_tui/_tracking_app.py |   3 +-
 src/b4/tui/_common.py              |  18 ++++---
 src/b4/ty.py                       |   5 +-
 src/tests/test___init__.py         |   6 +--
 src/tests/test_tui_tracking.py     |   3 +-
 17 files changed, 185 insertions(+), 70 deletions(-)

diff --git a/ci.sh b/ci.sh
index 7e4e7a4..658f626 100755
--- a/ci.sh
+++ b/ci.sh
@@ -4,6 +4,7 @@ set -eu
 
 uv run ruff format --check
 uv run ruff check
+uv run ty check
 uv run mypy .
 uv run pyright
 uv run pytest --durations=20
diff --git a/misc/send-receive.py b/misc/send-receive.py
index 11af5dc..e59440b 100644
--- a/misc/send-receive.py
+++ b/misc/send-receive.py
@@ -803,6 +803,8 @@ class SendReceiveListener(object):
             resp.content_type = falcon.MEDIA_TEXT
             resp.text = 'Failed to parse the request\n'
             return
+        # TODO(https://github.com/astral-sh/ruff/pull/24458): remove this when ty understands conditional walrus.
+        action = None
         if not isinstance(jdata, Mapping) or (action := jdata.get('action')) is None:
             logger.critical('Action not set from %s', req.remote_addr)
             return
diff --git a/pyproject.toml b/pyproject.toml
index 8167f53..bde64bf 100644
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
@@ -41,6 +41,7 @@ dev = [
     "pytest",
     "pytest-asyncio",
     "ruff",
+    "ty",
     "types-requests",
 ]
 misc = [
@@ -135,3 +136,9 @@ warn_unreachable = true
 exclude = [".venv", "ezgb", "liblore", "patatt"]
 typeCheckingMode = "standard"
 reportUnusedImport = true
+
+[tool.ty.src]
+exclude = ["ezgb/", "liblore/", "patatt/"]
+
+[tool.ty.rules]
+all = "error"
diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 72b1c97..739e1af 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -71,9 +71,9 @@ emlpolicy = email.policy.EmailPolicy(
 qspecials = re.compile(r'[()<>@,:;.\"\[\]]')
 
 # global setting allowing us to turn off networking
-can_network = True
+can_network: bool = True
 
-__VERSION__ = '0.16-dev'
+__VERSION__: str = '0.16-dev'
 PW_REST_API_VERSION = '1.2'
 
 
@@ -237,6 +237,8 @@ class LoreMailbox:
         # Are existing patches replies to previous revisions with the same counter?
         lser = self.series[revision]
         sane = True
+        # TODO(https://github.com/astral-sh/ruff/pull/24458): remove this when ty understands conditional walrus.
+        ppatch = None
         for patch in lser.patches:
             if patch is None:
                 continue
@@ -259,6 +261,8 @@ class LoreMailbox:
                     found = True
                     break
                 # Do we have another level up?
+                # TODO(https://github.com/astral-sh/ruff/pull/24458): remove this when ty understands conditional walrus.
+                npatch = None
                 if (
                     ppatch.in_reply_to is None
                     or (npatch := self.msgid_map.get(ppatch.in_reply_to)) is None
@@ -447,6 +451,8 @@ class LoreMailbox:
                     # Could be a cover letter
                     pmsg.followup_trailers += trailers
                     break
+                # TODO(https://github.com/astral-sh/ruff/pull/24458): remove this when ty understands conditional walrus.
+                nmsg = None
                 if (
                     pmsg.in_reply_to
                     and (nmsg := self.msgid_map.get(pmsg.in_reply_to)) is not None
@@ -1872,10 +1878,10 @@ class LoreMessage:
         # Identify all DKIM-Signature headers and try them in reverse order
         # until we come to a passing one
         dkhdrs = list()
-        for header in list(self.msg._headers):  # type: ignore[attr-defined]
+        for header in list(self.msg._headers):  # type: ignore[attr-defined]  # ty: ignore[unresolved-attribute]
             if header[0].lower() == 'dkim-signature':
                 dkhdrs.append(header)
-                self.msg._headers.remove(header)  # type: ignore[attr-defined]
+                self.msg._headers.remove(header)  # type: ignore[attr-defined]  # ty: ignore[unresolved-attribute]
         dkhdrs.reverse()
 
         seenatts = list()
@@ -1909,7 +1915,7 @@ class LoreMessage:
                 if isinstance(sh, str) and 'date' in sh.lower().split(':'):
                     signtime = self.date
 
-            self.msg._headers.append((hn, hval))  # type: ignore[attr-defined]
+            self.msg._headers.append((hn, hval))  # type: ignore[attr-defined]  # ty: ignore[unresolved-attribute]
             try:
                 res = dkim.verify(
                     self.msg.as_bytes(policy=emlpolicy), logger=dkimlogger
@@ -1928,7 +1934,7 @@ class LoreMessage:
                 self._attestors.append(attestor)
                 return
 
-            self.msg._headers.pop(-1)  # type: ignore[attr-defined]
+            self.msg._headers.pop(-1)  # type: ignore[attr-defined]  # ty: ignore[unresolved-attribute]
             seenatts.append(attestor)
 
         # No exact domain matches, so return everything we have
@@ -2248,12 +2254,12 @@ class LoreMessage:
                             self.fromname = xpair[0]
                             self.fromemail = xpair[1]
                             # Drop the reply-to header if it's exactly the same
-                            for header in list(self.msg._headers):  # type: ignore[attr-defined]
+                            for header in list(self.msg._headers):  # type: ignore[attr-defined]  # ty: ignore[unresolved-attribute]
                                 if (
                                     header[0].lower() == 'reply-to'
                                     and header[1].find(xpair[1]) > 0
                                 ):
-                                    self.msg._headers.remove(header)  # type: ignore[attr-defined]
+                                    self.msg._headers.remove(header)  # type: ignore[attr-defined]  # ty: ignore[unresolved-attribute]
 
                 has_passing = True
                 att_info: Dict[str, Any] = {
@@ -3622,8 +3628,8 @@ def git_run_command(
 
     U = TypeVar('U', str, bytes)
 
-    def _handle(_out: U, _err: U) -> Tuple[int, Union[str, bytes]]:
-        if logstderr and len(_err.strip()):
+    def _handle(_out: U, _err: U) -> Tuple[int, U]:
+        if logstderr and len(_err.strip()):  # ty:ignore[no-matching-overload, invalid-argument-type] # https://github.com/astral-sh/ty/issues/1503
             logger.debug('Stderr: %s', _err)
             _out += _err
 
@@ -5063,10 +5069,17 @@ def send_mail(
 
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
@@ -5075,9 +5088,7 @@ def send_mail(
                 cmdargs = list(smtp) + list(destaddrs)
             ecode, _out, err = _run_command(cmdargs, stdin=bdata)
             if ecode > 0:
-                raise RuntimeError(
-                    'Error running %s: %s' % (' '.join(smtp), err.decode())
-                )
+                raise RuntimeError('Error running %s: %s' % (smtps, err.decode()))
             sent += 1
 
     elif smtp:
@@ -5815,11 +5826,11 @@ def mailbox_email_factory(fh: BinaryIO) -> EmailMessage:
 
 def get_msgs_from_mailbox_or_maildir(mbmd: str) -> List[EmailMessage]:
     if is_maildir(mbmd):
-        in_mdr = mailbox.Maildir(mbmd, factory=mailbox_email_factory)  # type: ignore[arg-type]
-        return [x[1] for x in in_mdr.items()]  # type: ignore[misc]
+        in_mdr = mailbox.Maildir(mbmd, factory=mailbox_email_factory)  # type: ignore[arg-type]  # ty: ignore[invalid-argument-type]
+        return [x[1] for x in in_mdr.items()]  # type: ignore[misc]  # ty: ignore[invalid-return-type]
 
-    in_mbx = mailbox.mbox(mbmd, factory=mailbox_email_factory)  # type: ignore[arg-type]
-    return [x[1] for x in in_mbx.items()]  # type: ignore[misc]
+    in_mbx = mailbox.mbox(mbmd, factory=mailbox_email_factory)  # type: ignore[arg-type]  # ty: ignore[invalid-argument-type]
+    return [x[1] for x in in_mbx.items()]  # type: ignore[misc]  # ty: ignore[invalid-return-type]
 
 
 def get_mailfrom() -> Tuple[str, str]:
diff --git a/src/b4/command.py b/src/b4/command.py
index fa6e84c..b49d377 100644
--- a/src/b4/command.py
+++ b/src/b4/command.py
@@ -270,7 +270,7 @@ class ConfigOption(argparse.Action):
         self,
         parser: argparse.ArgumentParser,
         namespace: argparse.Namespace,
-        keyval: Union[str, Sequence[Any], None],
+        values: Union[str, Sequence[Any], None],
         option_string: Optional[str] = None,
     ) -> None:
         config = getattr(namespace, self.dest, None)
@@ -279,13 +279,13 @@ class ConfigOption(argparse.Action):
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
index eac749c..d93eb2b 100644
--- a/src/b4/dig.py
+++ b/src/b4/dig.py
@@ -297,7 +297,7 @@ def dig_commitish(cmdargs: argparse.Namespace) -> None:
         if not best_match:
             # Next, try to find by exact patch-id
             for lmsg in all_lmsgs:
-                if lmsg.git_patch_id == patch_id:  # pyright: ignore[reportPossiblyUnboundVariable] # broken since 3ae277e9c7dd3e1df61a14884aabdd5834ad1201
+                if lmsg.git_patch_id == patch_id:  # pyright: ignore[reportPossiblyUnboundVariable] # ty:ignore[possibly-unresolved-reference] # broken since 3ae277e9c7dd3e1df61a14884aabdd5834ad1201
                     logger.debug('matched by exact patch-id')
                     best_match = lmsg
                     break
@@ -354,7 +354,7 @@ def dig_commitish(cmdargs: argparse.Namespace) -> None:
                 continue
             if firstmsg is None:
                 firstmsg = lmsg
-            if lmsg.git_patch_id == patch_id:  # pyright: ignore[reportPossiblyUnboundVariable] # broken since inception in 16329336c1c8faba853b11238a16249306742505
+            if lmsg.git_patch_id == patch_id:  # pyright: ignore[reportPossiblyUnboundVariable] # ty:ignore[possibly-unresolved-reference] # broken since inception in 16329336c1c8faba853b11238a16249306742505
                 logger.debug('Matched by exact patch-id')
                 break
             if lmsg.subject == csubj:
diff --git a/src/b4/ez.py b/src/b4/ez.py
index d64e0bc..be3d2fe 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -1482,7 +1482,7 @@ def update_trailers(cmdargs: argparse.Namespace) -> None:
                         fltr.lmsg.msgid, safe='@'
                     )
                 logger.info('  + %s', rendered)
-                logger.info('    via: %s', source)  # pyright: ignore[reportPossiblyUnboundVariable] # broken since 742e017c1b5b91d0e6fd6fca7decf73956b31487
+                logger.info('    via: %s', source)  # pyright: ignore[reportPossiblyUnboundVariable] # ty:ignore[possibly-unresolved-reference] # broken since 742e017c1b5b91d0e6fd6fca7decf73956b31487
             else:
                 logger.debug('  . %s', fltr.as_string(omit_extinfo=True))
 
diff --git a/src/b4/mbox.py b/src/b4/mbox.py
index 66b47ba..65cff36 100644
--- a/src/b4/mbox.py
+++ b/src/b4/mbox.py
@@ -51,7 +51,7 @@ def save_msgs_as_mbox(
         added = 0
         if filterdupes:
             for emsg in mdr:
-                have_msgids.add(b4.LoreMessage.get_clean_msgid(emsg))  # type: ignore[arg-type]
+                have_msgids.add(b4.LoreMessage.get_clean_msgid(emsg))  # type: ignore[arg-type] # ty:ignore[invalid-argument-type] # this will go away when we update liblore
         for msg in msgs:
             if b4.LoreMessage.get_clean_msgid(msg) not in have_msgids:
                 added += 1
@@ -924,8 +924,7 @@ def refetch(dest: str) -> None:
 
     by_msgid: Dict[str, EmailMessage] = dict()
     for key, msg in mbox.items():
-        # We normally pass EmailMessage objects, but this works, too
-        msgid = b4.LoreMessage.get_clean_msgid(msg)  # type: ignore[arg-type]
+        msgid = b4.LoreMessage.get_clean_msgid(msg)  # type: ignore[arg-type] # ty:ignore[invalid-argument-type] # this will go away when we update liblore
         if not msgid:
             continue
         if msgid not in by_msgid:
diff --git a/src/b4/pr.py b/src/b4/pr.py
index b6a0c6b..4be366b 100644
--- a/src/b4/pr.py
+++ b/src/b4/pr.py
@@ -510,6 +510,7 @@ def main(cmdargs: argparse.Namespace) -> None:
 
         if msgs:
             if cmdargs.sendidentity:
+                assert isinstance(cmdargs.sendidentity, str)
                 # Pass exploded series via git-send-email
                 config = b4.get_config_from_git(
                     rf'sendemail\.{cmdargs.sendidentity}\..*'
@@ -522,6 +523,12 @@ def main(cmdargs: argparse.Namespace) -> None:
                     sys.exit(1)
                 # Make sure from is not overridden by current user
                 mailfrom = msgs[0].get('from')
+                if not isinstance(mailfrom, str):
+                    logger.critical(
+                        'Expected a string From header in exploded message, got %r',
+                        mailfrom,
+                    )
+                    sys.exit(1)
                 gitargs = [
                     'send-email',
                     '--identity',
diff --git a/src/b4/review/checks.py b/src/b4/review/checks.py
index a7e1ff0..36c0780 100644
--- a/src/b4/review/checks.py
+++ b/src/b4/review/checks.py
@@ -13,7 +13,7 @@ import pathlib
 import shlex
 import sqlite3
 from email.message import EmailMessage
-from typing import Any, Dict, List, Optional, Tuple
+from typing import Any, Dict, List, Optional, Tuple, Union
 
 import requests
 
@@ -163,12 +163,14 @@ def load_check_cmds() -> Tuple[List[str], List[str]]:
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
index 84992e8..441ea67 100644
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
 
 import liblore.utils
 from rich import box
@@ -18,6 +31,7 @@ from rich.panel import Panel
 from rich.rule import Rule
 from rich.text import Text
 from textual.widgets import RichLog
+from textual.worker import Worker
 
 import b4
 import b4.review
@@ -78,6 +92,13 @@ from b4.tui._common import (
 
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
@@ -122,6 +143,61 @@ CI_CHECK_LABELS = {
 }
 
 
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
 
@@ -130,7 +206,7 @@ class CheckRunnerMixin:
     interaction (loading overlay, results modal) is handled here.
     """
 
-    _check_loading: Optional[Any] = None
+    _check_loading: Optional['CheckLoadingScreen']
 
     # -- interface for subclasses ------------------------------------------
 
@@ -143,26 +219,26 @@ class CheckRunnerMixin:
 
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
             lambda: self._fetch_and_check(
                 message_id, series_subject, change_id=change_id, force=force
             ),
@@ -170,28 +246,30 @@ class CheckRunnerMixin:
             thread=True,
         )
 
-    def _dismiss_loading(self, msg: str = '', severity: str = '') -> None:
+    def _dismiss_loading(
+        self: _CheckRunnerHost, msg: str = '', severity: str = ''
+    ) -> None:
         """Dismiss the check loading screen and optionally notify."""
 
         def _do() -> None:
             if self._check_loading is not None and self._check_loading.is_attached:
                 self._check_loading.dismiss(None)
             if msg:
-                self.notify(msg, severity=severity)  # type: ignore[attr-defined]
+                self.notify(msg, severity=severity)
 
-        self.app.call_from_thread(_do)  # type: ignore[attr-defined]
+        self.app.call_from_thread(_do)
 
-    def _update_loading(self, text: str) -> None:
+    def _update_loading(self: _CheckRunnerHost, text: str) -> None:
         """Update the loading screen status text."""
 
         def _do() -> None:
             if self._check_loading is not None and self._check_loading.is_attached:
                 self._check_loading.update_status(text)
 
-        self.app.call_from_thread(_do)  # type: ignore[attr-defined]
+        self.app.call_from_thread(_do)
 
     def _fetch_and_check(
-        self,
+        self: _CheckRunnerHost,
         message_id: str,
         series_subject: str,
         change_id: str = '',
@@ -376,14 +454,14 @@ class CheckRunnerMixin:
         def _push_modal() -> None:
             if self._check_loading is not None and self._check_loading.is_attached:
                 self._check_loading.dismiss(None)
-            self.push_screen(  # type: ignore[attr-defined]
+            self.push_screen(
                 TrackingCheckResultsScreen(
                     title, patch_labels, patch_subjects, tools_sorted, matrix
                 ),
                 callback=_on_result,
             )
 
-        self.app.call_from_thread(_push_modal)  # type: ignore[attr-defined]
+        self.app.call_from_thread(_push_modal)
 
 
 def _make_initials(name: str) -> str:
diff --git a/src/b4/review_tui/_review_app.py b/src/b4/review_tui/_review_app.py
index 7cdc6e9..8786fbb 100644
--- a/src/b4/review_tui/_review_app.py
+++ b/src/b4/review_tui/_review_app.py
@@ -49,6 +49,7 @@ from b4.review_tui._common import (
     reviewer_colours,
 )
 from b4.review_tui._modals import (
+    CheckLoadingScreen,
     FollowupReplyPreviewScreen,
     HelpScreen,
     NoteScreen,
@@ -294,7 +295,7 @@ class ReviewApp(CheckRunnerMixin, App[None]):
         self._collapsed_comment_lines: Dict[int, Tuple[str, int]] = {}
         self._reply_sent: bool = False
         self._hide_skipped: bool = False
-        self._check_loading: Optional[Any] = None
+        self._check_loading: Optional[CheckLoadingScreen] = None
 
     def _get_check_context(self) -> Optional[Tuple[str, str, str]]:
         message_id = self._series.get('header-info', {}).get('msgid', '')
@@ -354,6 +355,8 @@ class ReviewApp(CheckRunnerMixin, App[None]):
             widget.update(f' WARNING: newer version(s) available: {versions}')
             widget.styles.display = 'block'
         else:
+            # Textual infers StringEnumProperty from the default ("block"),
+            # so ty treats the valid "none" value as an invalid assignment.
             widget.styles.display = 'none'
 
     def _populate_patch_list(self) -> None:
diff --git a/src/b4/review_tui/_tracking_app.py b/src/b4/review_tui/_tracking_app.py
index 6b4151c..a5a9389 100644
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
@@ -644,7 +645,7 @@ class TrackingApp(CheckRunnerMixin, App[Optional[str]]):
         self._last_snooze_source: str = ''
         self._last_snooze_input: str = ''
         # CI check modal state
-        self._check_loading: Optional[Any] = None
+        self._check_loading: Optional[CheckLoadingScreen] = None
         # Thanks queue count
         self._queue_count: int = 0
         # Show target branch binding only when configured
diff --git a/src/b4/tui/_common.py b/src/b4/tui/_common.py
index b788f35..cdd3818 100644
--- a/src/b4/tui/_common.py
+++ b/src/b4/tui/_common.py
@@ -13,7 +13,7 @@ import subprocess
 import tempfile
 import unicodedata
 from collections import defaultdict
-from typing import Any, Dict, List, Optional
+from typing import Any, Dict, List, Optional, Protocol
 
 from textual.app import ComposeResult
 from textual.binding import Binding
@@ -275,6 +275,12 @@ def _validate_addrs(text: str) -> Optional[str]:
     return None
 
 
+class _ListViewHost(Protocol):
+    _list_id: str
+
+    def query_one(self, selector: str, expect_type: type[ListView]) -> ListView: ...
+
+
 class JKListNavMixin:
     """Mixin providing j/k cursor navigation for a named ListView.
 
@@ -282,15 +288,13 @@ class JKListNavMixin:
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
index cb33ee9..ba7f646 100644
--- a/src/b4/ty.py
+++ b/src/b4/ty.py
@@ -586,7 +586,10 @@ def list_tracked() -> List[JsonDictT]:
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
index ade79b2..3c4c2d0 100644
--- a/src/tests/test___init__.py
+++ b/src/tests/test___init__.py
@@ -1,5 +1,6 @@
 import email
 import email.message
+import email.parser
 import email.policy
 import email.utils
 import io
@@ -58,17 +59,12 @@ def test_save_git_am_mbox(
         if ismbox:
             msgs = b4.get_msgs_from_mailbox_or_maildir(f'{sampledir}/{source}.txt')
         else:
-            import email
-            import email.parser
-
             with open(f'{sampledir}/{source}.txt', 'rb') as fh:
                 msg = email.parser.BytesParser(
                     policy=b4.emlpolicy, _class=email.message.EmailMessage
                 ).parse(fh)
             msgs = [msg]
     else:
-        import email.message
-
         msgs = list()
         for x in range(0, 3):
             msg = email.message.EmailMessage()
diff --git a/src/tests/test_tui_tracking.py b/src/tests/test_tui_tracking.py
index a9491ad..d8feb6f 100644
--- a/src/tests/test_tui_tracking.py
+++ b/src/tests/test_tui_tracking.py
@@ -1388,7 +1388,8 @@ class TestTrackingDetailPanel:
             from textual.containers import Vertical
 
             panel = app.query_one('#details-panel', Vertical)
-            assert panel.styles.height.value == 0  # type: ignore[union-attr]
+            assert panel.styles.height is not None
+            assert panel.styles.height.value == 0
 
     @pytest.mark.asyncio
     async def test_detail_panel_updates_on_navigation(

-- 
2.53.0

