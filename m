Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB402BE641
	for <tools@linux.kernel.org>; Tue,  7 Apr 2026 16:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775580526; cv=none; b=MZh4UK0MnGYhS4T8n8GFq1nrUT3wnx+AER3YvBsZVPGx+94lvjXj4Gjpiaz0CtS7V4ED0L3u9K6odagvOkt9XZhvJf9FxUc2jeTtOzBkaxc7UV7Vd8UoQUMa7mpXbwaKUbzAcGXhV3uVXDFxJ5OqqykR5+EvNa3kS++omRBflok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775580526; c=relaxed/simple;
	bh=VoZmXSuVDp5Kw0MotARG5frYd8GRqX3JAbiq+E1LMjQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VrLpIffbo8gFtar93ubcabB2y7oph3ZowkGDohbQc5MAg5VQG8E6+tIeAWWpebp4fOH4BwMC+xyIp+RKe0IjgPkipQaqn2xqHPd5EKda3jwTtyFSdaA7Fix9n8Hx9MwEiRfDnH85pGBiFSX2GWzluWM3OkFrdH9duxCL7wEBYkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WLZ9BxRk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WLZ9BxRk"
Received: by smtp.kernel.org (Postfix)
	id 57D2DC19424; Tue,  7 Apr 2026 16:48:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D49D3C116C6;
	Tue,  7 Apr 2026 16:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775580526;
	bh=VoZmXSuVDp5Kw0MotARG5frYd8GRqX3JAbiq+E1LMjQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WLZ9BxRkiGvE3Uz2DB0mAMDyJ9nIFCEJKhQcgxOh/Pdvmm1XMvxE81iHQKg11cNx4
	 tB826Z7mDMSWe8JuOb4PVDNhidZdzTnC1Ws/z2TI6qR4BNfL76C6JZs9jzdwOUv09O
	 aH4HaIx95oRRgZWlU4dxhOPKijbGB6V5Ozx6vEBdIFHgQlEjrDPCKWndK4U2r0OUmA
	 TSysca7J/PFFJ082L3JWvMvWReE0igJgeqMWuOqIa8iF2nqpda5yEhiFeKhye1XqH0
	 nFsmobJpwbjO/mbpBdGOt2lDcuNaH+T7oYZ65tatNFkVvjkJ4Z1IeX6s6tXZa19mwk
	 wSoMxnwYHl4tw==
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 07 Apr 2026 12:48:37 -0400
Subject: [PATCH b4 08/12] Enable and fix pyright diagnostics
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260407-ruff-check-v1-8-c9568541ff67@kernel.org>
References: <20260407-ruff-check-v1-0-c9568541ff67@kernel.org>
In-Reply-To: <20260407-ruff-check-v1-0-c9568541ff67@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=32746; i=tamird@kernel.org;
 h=from:subject:message-id; bh=VoZmXSuVDp5Kw0MotARG5frYd8GRqX3JAbiq+E1LMjQ=;
 b=kA0DAAoW0EwOJRfXEpcByyZiAGnVNWjIyM+M8CScapAoO+bqAhTTSEncf49GCzEwe8JbGtKoo
 YiRBAAWCgA5FiEEYRXCvWdl27wdae7H0EwOJRfXEpcFAmnVNWgbFIAAAAAABAAObWFudTIsMi41
 KzEuMTIsMCwzAAoJENBMDiUX1xKXMNUBAJtHe9HPfxuU1oGmZgJm1DQnHi7rZVSQt9y2yCSLsSC
 XAQDLX0TahCZbnzpwhgI0GJfrz1/J0+Z7r708UWuVuUaNCw==
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

Enable Pyright in standard mode, add it to the dev dependency group, and
report unused imports.

Move lazy b4.review, b4.ty, and b4.ez imports to module scope so Pyright
can see package attributes without local import side effects, and add
explicit stdlib email submodule imports in tests for the same reason.

Tighten type annotations and assertions that Pyright reports on,
including logger and send-mail queue types, Message-ID revision values,
Patchwork state strings, JSON trackfile/msgid fields, and TUI callbacks
that may be dismissed with None.

Fix control-flow edges surfaced by reportPossiblyUnboundVariable:
duplicate list-id preference fallback, patch-id matching after skipped
duplicate diffs, trailer source logging without a backing message,
metadata JSON decoding, and review reply rendering.

Reject non-string -c/--config assignments explicitly and avoid using
ConfigDictT values as dict keys in tests.

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
 misc/send-receive.py               |  2 ++
 pyproject.toml                     |  8 +++++---
 src/b4/__init__.py                 | 30 +++++++++++++++++-------------
 src/b4/command.py                  | 11 ++++++-----
 src/b4/dig.py                      |  4 ++--
 src/b4/ez.py                       | 14 +++++++++-----
 src/b4/review/_review.py           | 12 ++++++++----
 src/b4/review/tracking.py          |  5 ++---
 src/b4/review_tui/_common.py       |  4 ----
 src/b4/review_tui/_modals.py       | 17 +++++++----------
 src/b4/review_tui/_pw_app.py       |  3 ++-
 src/b4/review_tui/_review_app.py   | 26 ++++++++++++++------------
 src/b4/review_tui/_tracking_app.py | 31 +++++++++++--------------------
 src/b4/ty.py                       | 13 +++++++++----
 src/tests/test___init__.py         |  4 +++-
 src/tests/test_review_tracking.py  |  7 ++++---
 16 files changed, 101 insertions(+), 90 deletions(-)

diff --git a/misc/send-receive.py b/misc/send-receive.py
index f9f65af..3f00f09 100644
--- a/misc/send-receive.py
+++ b/misc/send-receive.py
@@ -3,8 +3,10 @@
 import copy
 import email
 import email.header
+import email.message
 import email.policy
 import email.quoprimime
+import email.utils
 import json
 import logging
 import logging.handlers
diff --git a/pyproject.toml b/pyproject.toml
index 982ad95..389e573 100644
--- a/pyproject.toml
+++ b/pyproject.toml
@@ -36,6 +36,7 @@ dependencies = [
 dev = [
     "mypy",
     "pip-tools",
+    "pyright",
     "pytest",
     "pytest-asyncio",
     "ruff",
@@ -118,9 +119,10 @@ select = [
 ]
 flake8-quotes.inline-quotes = "single"
 
-[tool.pyright]
-typeCheckingMode = "off"
-
 [tool.mypy]
 strict = true
 warn_unreachable = true
+
+[tool.pyright]
+typeCheckingMode = "standard"
+reportUnusedImport = true
diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 20d1f75..f38787b 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -90,7 +90,7 @@ def _dkim_log_filter(record: logging.LogRecord) -> bool:
     return True
 
 
-logger = logging.getLogger('b4')
+logger: logging.Logger = logging.getLogger('b4')
 dkimlogger = logger.getChild('dkim')
 dkimlogger.addFilter(_dkim_log_filter)
 
@@ -1195,21 +1195,21 @@ class LoreSeries:
                         seenfiles.add(nfn)
                     # Try to grab full ref_id of this hash
                     try:
-                        ohash = git_revparse_obj(ofi)
+                        hash = git_revparse_obj(ofi)
                         logger.debug('  Found matching blob for: %s', ofn)
-                        gitargs = ['update-index', '--add', '--cacheinfo', f'{fmod},{ohash},{ofn}']
+                        gitargs = ['update-index', '--add', '--cacheinfo', f'{fmod},{hash},{ofn}']
                     except RuntimeError:
                         logger.debug('Could not find matching blob for %s (%s)', ofn, ofi)
                         try:
-                            chash = git_revparse_obj(f':{ofn}', topdir)
-                            gitargs = ['update-index', '--add', '--cacheinfo', f'{fmod},{chash},{ofn}']
+                            hash = git_revparse_obj(f':{ofn}', topdir)
+                            gitargs = ['update-index', '--add', '--cacheinfo', f'{fmod},{hash},{ofn}']
                         except RuntimeError:
                             logger.critical('  ERROR: Could not find anything matching %s', ofn)
                             return None, None
 
                     ecode, out = git_run_command(None, gitargs)
                     if ecode > 0:
-                        logger.critical('  ERROR: Could not run update-index for %s (%s)', ofn, ohash)
+                        logger.critical('  ERROR: Could not run update-index for %s (%s)', ofn, hash)
                         return None, None
 
                 msgs.append(lmsg.get_am_message(add_trailers=False))
@@ -2374,17 +2374,21 @@ class LoreMessage:
 
         listid1 = LoreMessage.get_clean_msgid(msg1, 'list-id')
         if listid1:
-            for prefidx1, listglob in enumerate(listidpref):  # noqa: B007
-                if fnmatch.fnmatch(listid1, listglob):
-                    break
+            prefidx1 = next(
+                idx
+                for idx, listglob in enumerate(listidpref)
+                if fnmatch.fnmatch(listid1, listglob)
+            )
         else:
             prefidx1 = listidpref.index('*')
 
         listid2 = LoreMessage.get_clean_msgid(msg2, 'list-id')
         if listid2:
-            for prefidx2, listglob in enumerate(listidpref):  # noqa: B007
-                if fnmatch.fnmatch(listid2, listglob):
-                    break
+            prefidx2 = next(
+                idx
+                for idx, listglob in enumerate(listidpref)
+                if fnmatch.fnmatch(listid2, listglob)
+            )
         else:
             prefidx2 = listidpref.index('*')
 
@@ -4601,7 +4605,7 @@ def send_mail(smtp: Union[smtplib.SMTP, smtplib.SMTP_SSL, List[str], None], msgs
               patatt_sign: bool = False, dryrun: bool = False,
               output_dir: Optional[str] = None, web_endpoint: Optional[str] = None,
               reflect: bool = False) -> Optional[int]:
-    tosend = list()
+    tosend: List[Tuple[Set[str], bytes, LoreSubject]] = list()
     if output_dir is not None:
         dryrun = True
 
diff --git a/src/b4/command.py b/src/b4/command.py
index a70a986..fc55c71 100644
--- a/src/b4/command.py
+++ b/src/b4/command.py
@@ -150,12 +150,13 @@ class ConfigOption(argparse.Action):
             config = dict()
             setattr(namespace, self.dest, config)
 
-        if isinstance(keyval, str):
-            if '=' in keyval:
-                key, value = keyval.split('=', maxsplit=1)
-            else:
-                key, value = keyval, 'true'
+        if not isinstance(keyval, str):
+            raise TypeError(f'Expected a string config assignment, got {keyval!r}')
 
+        if '=' in keyval:
+            key, value = keyval.split('=', maxsplit=1)
+        else:
+            key, value = keyval, 'true'
         config[key] = value
 
 
diff --git a/src/b4/dig.py b/src/b4/dig.py
index b3d637d..46e2510 100644
--- a/src/b4/dig.py
+++ b/src/b4/dig.py
@@ -276,7 +276,7 @@ def dig_commitish(cmdargs: argparse.Namespace) -> None:
         if not best_match:
             # Next, try to find by exact patch-id
             for lmsg in all_lmsgs:
-                if lmsg.git_patch_id == patch_id:
+                if lmsg.git_patch_id == patch_id:  # pyright: ignore[reportPossiblyUnboundVariable] # broken since 3ae277e9c7dd3e1df61a14884aabdd5834ad1201
                     logger.debug('matched by exact patch-id')
                     best_match = lmsg
                     break
@@ -331,7 +331,7 @@ def dig_commitish(cmdargs: argparse.Namespace) -> None:
                 continue
             if firstmsg is None:
                 firstmsg = lmsg
-            if lmsg.git_patch_id == patch_id:
+            if lmsg.git_patch_id == patch_id:  # pyright: ignore[reportPossiblyUnboundVariable] # broken since inception in 16329336c1c8faba853b11238a16249306742505
                 logger.debug('Matched by exact patch-id')
                 break
             if lmsg.subject == csubj:
diff --git a/src/b4/ez.py b/src/b4/ez.py
index 562f2a9..b54e04c 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -1305,7 +1305,7 @@ def update_trailers(cmdargs: argparse.Namespace) -> None:
                 if fltr.lmsg is not None:
                     source = midmask % urllib.parse.quote_plus(fltr.lmsg.msgid, safe='@')
                 logger.info('  + %s', rendered)
-                logger.info('    via: %s', source)
+                logger.info('    via: %s', source)  # pyright: ignore[reportPossiblyUnboundVariable] # broken since 742e017c1b5b91d0e6fd6fca7decf73956b31487
             else:
                 logger.debug('  . %s', fltr.as_string(omit_extinfo=True))
 
@@ -1442,7 +1442,7 @@ def get_base_changeid_from_tag(tagname: str) -> Tuple[str, str, str]:
     return cover, base_commit, change_id
 
 
-def make_msgid_tpt(change_id: str, revision: str, domain: Optional[str] = None) -> str:
+def make_msgid_tpt(change_id: str, revision: int, domain: Optional[str] = None) -> str:
     if not domain:
         usercfg = b4.get_user_config()
         myemail = usercfg.get('email')
@@ -1580,7 +1580,7 @@ def get_prep_branch_as_patches(movefrom: bool = True, thread: bool = True, addtr
 
     if prefixes is None:
         prefixes = list()
-    prefixes += tracking['series'].get('prefixes', list())
+    prefixes.extend(tracking['series'].get('prefixes', list()))
     base_commit, start_commit, end_commit = get_series_range(usebranch=usebranch)
     change_id = tracking['series'].get('change-id')
     revision = tracking['series'].get('revision')
@@ -1718,6 +1718,10 @@ def get_prep_branch_as_patches(movefrom: bool = True, thread: bool = True, addtr
         'prerequisites': prerequisites,
         'signature': b4.get_email_signature(),
     }
+    # Possible type confusion here; revision is initially a string, but is
+    # then assigned an integer in the loop above. What happens if that loop
+    # runs zero times? Unclear.
+    assert isinstance(revision, int)
     if cover_template.find('${range_diff}') >= 0:
         if revision > 1:
             oldrev = revision - 1
@@ -1781,7 +1785,7 @@ def get_sent_tag_as_patches(tagname: str, revision: int, presubject: Optional[st
     csubject, cbody = get_cover_subject_body(cover)
     cbody = cbody.strip() + '\n-- \n' + b4.get_email_signature()
     prefixes = ['RESEND'] + csubject.get_extra_prefixes(exclude=['RESEND'])
-    msgid_tpt = make_msgid_tpt(change_id, str(revision))
+    msgid_tpt = make_msgid_tpt(change_id, revision)
     seriests = int(time.time())
     mailfrom = b4.get_mailfrom()
 
@@ -2794,7 +2798,7 @@ def force_revision(forceto: int) -> None:
     store_cover(cover, tracking)
 
 
-def range_diff_compare(compareto: str, execvp: bool = True, range_diff_opts: Optional[str] = None) -> Union[str, None]:
+def range_diff_compare(compareto: int, execvp: bool = True, range_diff_opts: Optional[str] = None) -> Union[str, None]:
     _, tracking = load_cover()
     # Try the new format first
     tagname, _ = get_sent_tagname(tracking['series']['change-id'], SENT_TAG_PREFIX, compareto)
diff --git a/src/b4/review/_review.py b/src/b4/review/_review.py
index 3d5490b..0e20e81 100644
--- a/src/b4/review/_review.py
+++ b/src/b4/review/_review.py
@@ -19,6 +19,7 @@ from typing import Any, Dict, List, Optional, Set, Tuple, Union
 
 import b4
 import b4.mbox
+import b4.review
 import b4.review.tracking
 
 logger = b4.logger
@@ -2068,7 +2069,7 @@ def update_series_tracking(
 
 def cmd_tui(cmdargs: argparse.Namespace) -> None:
     try:
-        import b4.review_tui
+        import b4.review_tui as review_tui
     except ImportError:
         logger.critical('The TUI requires the textual library.')
         logger.critical('Install it with: pip install b4[tui]')
@@ -2093,9 +2094,12 @@ def cmd_tui(cmdargs: argparse.Namespace) -> None:
             logger.critical('Enroll with: b4 review enroll')
             sys.exit(1)
 
-    b4.review_tui.run_tracking_tui(identifier, email_dryrun=cmdargs.email_dryrun,
-                                   no_sign=cmdargs.no_sign,
-                                   no_mouse=cmdargs.no_mouse)
+    review_tui.run_tracking_tui(
+        identifier,
+        email_dryrun=cmdargs.email_dryrun,
+        no_sign=cmdargs.no_sign,
+        no_mouse=cmdargs.no_mouse,
+    )
 
 
 def _prepare_review_session(cmdargs: argparse.Namespace) -> Dict[str, Any]:
diff --git a/src/b4/review/tracking.py b/src/b4/review/tracking.py
index 2b0d058..9c5d33f 100644
--- a/src/b4/review/tracking.py
+++ b/src/b4/review/tracking.py
@@ -222,14 +222,13 @@ def record_take_branch(gitdir: str, branch: str) -> None:
     metadata_dir = os.path.join(gitdir, REVIEW_METADATA_DIR)
     pathlib.Path(metadata_dir).mkdir(parents=True, exist_ok=True)
     metadata_path = get_repo_metadata_path(gitdir)
+    data: object = {}
     if os.path.exists(metadata_path):
         try:
             with open(metadata_path, 'r') as f:
                 data = json.load(f)
         except (json.JSONDecodeError, OSError):
             pass
-    else:
-        data = {}
     if not isinstance(data, dict):
         data = {}
     branches = data.get('recent-take-branches', [])
@@ -726,7 +725,7 @@ def get_all_revisions_grouped(conn: sqlite3.Connection) -> dict[str, list[dict[s
         'FROM revisions ORDER BY change_id, revision ASC')
     result: dict[str, list[dict[str, Any]]] = {}
     for row in cursor.fetchall():
-        entry = dict(zip(cols, row))
+        entry: dict[str, Any] = dict(zip(cols, row))
         result.setdefault(row[0], []).append(entry)
     return result
 
diff --git a/src/b4/review_tui/_common.py b/src/b4/review_tui/_common.py
index 536af2d..38cd9b2 100644
--- a/src/b4/review_tui/_common.py
+++ b/src/b4/review_tui/_common.py
@@ -6,9 +6,6 @@
 __author__ = 'Konstantin Ryabitsev <konstantin@linuxfoundation.org>'
 
 import email.message
-import email.parser
-import email.policy
-import email.utils
 import json
 import os
 import tempfile
@@ -22,7 +19,6 @@ from rich.text import Text
 from textual.widgets import RichLog
 
 import b4
-import b4.mbox
 import b4.review
 import b4.review.tracking
 
diff --git a/src/b4/review_tui/_modals.py b/src/b4/review_tui/_modals.py
index 0cd80e1..1ee1088 100644
--- a/src/b4/review_tui/_modals.py
+++ b/src/b4/review_tui/_modals.py
@@ -36,6 +36,9 @@ from textual.widgets import (
 from textual.worker import Worker, WorkerState
 
 import b4
+import b4.review
+import b4.review.tracking
+import b4.ty
 from b4.review_tui._common import (
     CI_CHECK_LABELS,
     JKListNavMixin,
@@ -923,8 +926,6 @@ class TakeConfirmScreen(ModalScreen[bool]):
 
     def _test_take(self) -> Tuple[bool, str]:
         """Test-apply review branch patches at the target base."""
-        import b4.review
-
         with _quiet_worker():
             topdir = b4.git_get_toplevel()
             if not topdir:
@@ -1414,8 +1415,6 @@ class QueueDeliveryScreen(ModalScreen[Optional[Tuple[int, int, List[Tuple[str, i
         self._cancelled = True
 
     def _do_deliver(self) -> Tuple[int, int, List[Tuple[str, int]]]:
-        import b4.ty
-
         def _on_progress(completed: int, total: int, status: str) -> None:
             if not self._cancelled:
                 self.app.call_from_thread(self._update_progress, completed, total, status)
@@ -1609,7 +1608,8 @@ class ViewSeriesScreen(_FetchViewerScreen):
             msgs = b4.review._retrieve_messages(self._message_id)
             return b4.review._get_lore_series(msgs)
 
-    def _show_result(self, lser: 'b4.LoreSeries') -> None:
+    def _show_result(self, result: 'b4.LoreSeries') -> None:
+        lser = result
         subject = lser.subject or '(no subject)'
         self.query_one('#fv-title', Static).update(subject)
         viewer = self.query_one('#fv-viewer', RichLog)
@@ -1653,13 +1653,13 @@ class CIChecksScreen(_FetchViewerScreen):
         self._series = series
 
     def _fetch(self) -> List[Dict[str, Any]]:
-        import b4.review
         with _quiet_worker():
             patch_ids = self._series.get('patch_ids', [])
             return b4.review.pw_fetch_checks(
                 self._pwkey, self._pwurl, patch_ids)
 
-    def _show_result(self, checks: List[Dict[str, Any]]) -> None:
+    def _show_result(self, result: List[Dict[str, Any]]) -> None:
+        checks = result
         series_name = self._series.get('name') or '(no subject)'
         self.query_one('#fv-title', Static).update(
             f'CI checks \u2014 {series_name}')
@@ -1904,7 +1904,6 @@ class RebaseScreen(ModalScreen[bool]):
 
     def _prepare_local(self) -> bytes:
         """Build mbox from the local review branch patches."""
-        import b4.review
         topdir = b4.git_get_toplevel()
         if not topdir:
             raise RuntimeError('Not in a git repository')
@@ -2633,8 +2632,6 @@ class UpdateAllScreen(ModalScreen[Dict[str, int]]):
         self._cancelled = True
 
     def _do_updates(self) -> Dict[str, int]:
-        import b4.review
-
         with _quiet_worker():
             # Rescan local review branches first so the DB reflects current
             # on-disk state before the network update runs.
diff --git a/src/b4/review_tui/_pw_app.py b/src/b4/review_tui/_pw_app.py
index 2b0c10a..0b510e7 100644
--- a/src/b4/review_tui/_pw_app.py
+++ b/src/b4/review_tui/_pw_app.py
@@ -462,7 +462,8 @@ class PwApp(App[None]):
             callback=lambda res: self._on_apply_complete(res, item),
         )
 
-    def _on_apply_complete(self, result: Tuple[int, int, str], item: 'PwSeriesItem') -> None:
+    def _on_apply_complete(self, result: Optional[Tuple[int, int, str]], item: 'PwSeriesItem') -> None:
+        assert result is not None
         ok, fail, new_state = result
         if fail:
             self.notify(f'{ok} updated, {fail} failed', severity='warning')
diff --git a/src/b4/review_tui/_review_app.py b/src/b4/review_tui/_review_app.py
index c14005b..8c2c110 100644
--- a/src/b4/review_tui/_review_app.py
+++ b/src/b4/review_tui/_review_app.py
@@ -1114,7 +1114,6 @@ class ReviewApp(CheckRunnerMixin, App[None]):
         existing_reply = review.get('reply', '')
 
         # Get the real diff for position resolution when parsing back
-        real_diff = ''
         if self._selected_idx > 0:
             patch_idx = self._selected_idx - 1
             if patch_idx >= len(self._commit_shas):
@@ -1125,18 +1124,11 @@ class ReviewApp(CheckRunnerMixin, App[None]):
             if ecode > 0:
                 self.notify('Could not get diff', severity='error')
                 return
-
-        if existing_reply:
-            editor_text = existing_reply
-        else:
-            all_reviews = target.get('reviews', {})
-            my_email = str(self._usercfg.get('email', ''))
-            if self._selected_idx == 0:
-                # Cover letter reply
-                editor_text = b4.review._render_quoted_diff_with_comments(
-                    '', all_reviews, my_email,
-                    commit_msg=self._cover_text)
+            if existing_reply:
+                editor_text = existing_reply
             else:
+                all_reviews = target.get('reviews', {})
+                my_email = str(self._usercfg.get('email', ''))
                 ecode, commit_msg = b4.git_run_command(
                     self._topdir, ['show', '--format=%B', '--no-patch', sha])
                 if ecode > 0:
@@ -1145,6 +1137,16 @@ class ReviewApp(CheckRunnerMixin, App[None]):
                 editor_text = b4.review._render_quoted_diff_with_comments(
                     real_diff, all_reviews, my_email,
                     commit_msg=commit_msg.strip())
+        else:
+            real_diff = ''
+            if existing_reply:
+                editor_text = existing_reply
+            else:
+                all_reviews = target.get('reviews', {})
+                my_email = str(self._usercfg.get('email', ''))
+                editor_text = b4.review._render_quoted_diff_with_comments(
+                    '', all_reviews, my_email,
+                    commit_msg=self._cover_text)
 
         with self.suspend():
             result = b4.edit_in_editor(
diff --git a/src/b4/review_tui/_tracking_app.py b/src/b4/review_tui/_tracking_app.py
index 99de823..69c2769 100644
--- a/src/b4/review_tui/_tracking_app.py
+++ b/src/b4/review_tui/_tracking_app.py
@@ -9,7 +9,6 @@ import copy
 import datetime
 import email.message
 import email.parser
-import email.policy
 import email.utils
 import io
 import json
@@ -29,9 +28,11 @@ from textual.widgets import Footer, Label, ListItem, ListView, Static
 from textual.worker import Worker, WorkerState
 
 import b4
+import b4.ez
 import b4.mbox
 import b4.review
 import b4.review.tracking
+import b4.ty
 from b4.review_tui._common import (
     CheckRunnerMixin,
     SeparatedFooter,
@@ -788,7 +789,6 @@ class TrackingApp(CheckRunnerMixin, App[Optional[str]]):
         b4.review.tracking.unsnooze_series(conn, cid, prev_status, revision=rev)
 
     def _load_series(self) -> None:
-        import b4.ty
         self._auto_wake_snoozed()
 
         all_series = b4.review.tracking.get_all_tracked_series(self._identifier)
@@ -1507,13 +1507,13 @@ class TrackingApp(CheckRunnerMixin, App[Optional[str]]):
                     if rstart and rend:
                         logger.info('Prepared fake commit range for 3-way merge (%.12s..%.12s)', rstart, rend)
 
+            _is_rt = bool(series.get('is_rethreaded'))
             try:
                 logger.info('Base: %s', base_commit)
                 b4.git_fetch_am_into_repo(topdir, ambytes=ambytes, at_base=base_commit,
                                           origin=linkurl, am_flags=['-3'])
 
                 # Create the review branch
-                _is_rt = bool(series.get('is_rethreaded'))
                 b4.review.create_review_branch(topdir, branch_name, base_commit, lser,
                                                linkurl, linkmask, num_prereqs=0,
                                                identifier=self._identifier,
@@ -1955,7 +1955,7 @@ class TrackingApp(CheckRunnerMixin, App[Optional[str]]):
         else:
             self._show_take_screen(target_branch, change_id, review_branch, series)
 
-    def _on_newer_revision_acknowledged(self, proceed: bool, target_branch: str,
+    def _on_newer_revision_acknowledged(self, proceed: Optional[bool], target_branch: str,
                                         change_id: str, review_branch: str,
                                         series: Dict[str, Any]) -> None:
         """Handle result of the newer-revision warning."""
@@ -2009,7 +2009,7 @@ class TrackingApp(CheckRunnerMixin, App[Optional[str]]):
                 confirmed, change_id, review_branch, take_screen, series),
         )
 
-    def _on_take_confirmed(self, confirmed: bool, change_id: str,
+    def _on_take_confirmed(self, confirmed: Optional[bool], change_id: str,
                            review_branch: str, take_screen: 'TakeScreen',
                            series: Dict[str, Any]) -> None:
         """Handle take screen result — proceed to cherry-pick or confirm."""
@@ -2050,7 +2050,7 @@ class TrackingApp(CheckRunnerMixin, App[Optional[str]]):
                 take_screen.method_result, take_screen.target_result,
                 change_id, review_branch, take_screen, series)
 
-    def _on_cherrypick_confirmed(self, confirmed: bool, change_id: str,
+    def _on_cherrypick_confirmed(self, confirmed: Optional[bool], change_id: str,
                                  review_branch: str, take_screen: 'TakeScreen',
                                  series: Dict[str, Any],
                                  pick_screen: 'CherryPickScreen') -> None:
@@ -2079,7 +2079,7 @@ class TrackingApp(CheckRunnerMixin, App[Optional[str]]):
                 series, confirm_screen, cherrypick),
         )
 
-    def _on_take_final(self, confirmed: bool, method: str,
+    def _on_take_final(self, confirmed: Optional[bool], method: str,
                        change_id: str, review_branch: str,
                        take_screen: 'TakeScreen',
                        series: Dict[str, Any],
@@ -2629,7 +2629,7 @@ class TrackingApp(CheckRunnerMixin, App[Optional[str]]):
                 confirmed, review_branch, rebase_screen),
         )
 
-    def _on_rebase_confirmed(self, confirmed: bool, review_branch: str,
+    def _on_rebase_confirmed(self, confirmed: Optional[bool], review_branch: str,
                              rebase_screen: 'RebaseScreen') -> None:
         """Handle rebase confirmation result."""
         if not confirmed:
@@ -3061,7 +3061,7 @@ class TrackingApp(CheckRunnerMixin, App[Optional[str]]):
                 revision=revision),
         )
 
-    def _on_abandon_confirmed(self, confirmed: bool, change_id: str,
+    def _on_abandon_confirmed(self, confirmed: Optional[bool], change_id: str,
                                review_branch: str, has_branch: bool,
                                revision: Optional[int] = None) -> None:
         if not confirmed:
@@ -3429,12 +3429,12 @@ class TrackingApp(CheckRunnerMixin, App[Optional[str]]):
                         logger.info('Prepared fake commit range for 3-way merge (%.12s..%.12s)', rstart, rend)
 
             # --- 3. Apply to temporary upgrade branch ---
+            _is_rt = bool((self._selected_series or {}).get('is_rethreaded'))
             try:
                 logger.info('Base: %s', base_sha)
                 b4.git_fetch_am_into_repo(topdir, ambytes=ambytes,
                                           at_base=base_sha, origin=linkurl,
                                           am_flags=['-3'])
-                _is_rt = bool((self._selected_series or {}).get('is_rethreaded'))
                 b4.review.create_review_branch(topdir, upgrade_branch,
                                                base_sha, lser, linkurl,
                                                linkmask, num_prereqs=0,
@@ -3730,8 +3730,6 @@ class TrackingApp(CheckRunnerMixin, App[Optional[str]]):
         import tarfile
         import time
 
-        import b4.ez
-
         topdir = b4.git_get_toplevel()
         if not topdir:
             if notify:
@@ -3811,7 +3809,7 @@ class TrackingApp(CheckRunnerMixin, App[Optional[str]]):
                 self.notify(f'Archived {change_id}')
         return True
 
-    def _on_archive_confirmed(self, confirmed: bool, change_id: str,
+    def _on_archive_confirmed(self, confirmed: Optional[bool], change_id: str,
                                review_branch: str, has_branch: bool,
                                pw_series_id: Optional[int] = None,
                                revision: Optional[int] = None) -> None:
@@ -3829,9 +3827,6 @@ class TrackingApp(CheckRunnerMixin, App[Optional[str]]):
         """Compose and preview a thank-you reply for a taken series."""
         import argparse
 
-        import b4.review
-        import b4.ty
-
         series = self._selected_series
         if not series:
             return
@@ -3955,8 +3950,6 @@ class TrackingApp(CheckRunnerMixin, App[Optional[str]]):
 
     def _queue_thank_message(self, msg: email.message.EmailMessage, checkurl: str) -> None:
         """Queue the thanks message for delivery once commits are public."""
-        import b4.ty
-
         series = self._selected_series
         if not series:
             return
@@ -4011,7 +4004,6 @@ class TrackingApp(CheckRunnerMixin, App[Optional[str]]):
 
     def _refresh_queue_indicator(self) -> None:
         """Update the title-bar queue count and Q binding visibility."""
-        import b4.ty
         self._queue_count = b4.ty.get_queued_count(dryrun=self._email_dryrun)
         try:
             right = self.query_one('#title-right', Static)
@@ -4025,7 +4017,6 @@ class TrackingApp(CheckRunnerMixin, App[Optional[str]]):
 
     def action_process_queue(self) -> None:
         """Show the queue modal and optionally deliver."""
-        import b4.ty
         entries = b4.ty.get_queued_messages(dryrun=self._email_dryrun)
         if not entries:
             self.notify('No queued thanks messages')
diff --git a/src/b4/ty.py b/src/b4/ty.py
index 74c094a..0d8adc2 100644
--- a/src/b4/ty.py
+++ b/src/b4/ty.py
@@ -507,9 +507,11 @@ def send_messages(listing: List[JsonDictT], branch: str, cmdargs: argparse.Names
         else:
             logger.info('Sent %s thank-you letters', outgoing)
             if pwstate:
+                assert isinstance(pwstate, str), 'pwstate must be a string'
                 b4.patchwork_set_state(msgids, pwstate)
     else:
         if pwstate and not cmdargs.dryrun:
+            assert isinstance(pwstate, str), 'pwstate must be a string'
             b4.patchwork_set_state(msgids, pwstate)
             logger.info('---')
         logger.debug('Wrote %s thank-you letters', outgoing)
@@ -614,12 +616,14 @@ def discard_selected(cmdargs: argparse.Namespace) -> None:
     logger.info('Discarding %s messages', len(listing))
     msgids: List[str] = list()
     for jsondata in listing:
-        assert isinstance(jsondata['trackfile'], str), 'trackfile must be a string'
-        fullpath = os.path.join(datadir, jsondata['trackfile'])
+        trackfile = jsondata['trackfile']
+        assert isinstance(trackfile, str), 'trackfile must be a string'
+        fullpath = os.path.join(datadir, trackfile)
         os.rename(fullpath, '%s.discarded' % fullpath)
         logger.info('  Discarded: %s', jsondata['subject'])
-        assert isinstance(jsondata['msgid'], str), 'msgid must be a string'
-        msgids.append(jsondata['msgid'])
+        msgid = jsondata['msgid']
+        assert isinstance(msgid, str), 'msgid must be a string'
+        msgids.append(msgid)
         patches = cast(List[Tuple[str, str, str, str]], jsondata['patches'])
         for pdata in patches:
             msgids.append(pdata[2])
@@ -629,6 +633,7 @@ def discard_selected(cmdargs: argparse.Namespace) -> None:
     if not pwstate:
         pwstate = config.get('pw-discard-state')
     if pwstate:
+        assert isinstance(pwstate, str), 'pwstate must be a string'
         b4.patchwork_set_state(msgids, pwstate)
 
     sys.exit(0)
diff --git a/src/tests/test___init__.py b/src/tests/test___init__.py
index cb01795..cf1a699 100644
--- a/src/tests/test___init__.py
+++ b/src/tests/test___init__.py
@@ -1,5 +1,7 @@
 import email
-import email.parser
+import email.message
+import email.policy
+import email.utils
 import io
 import os
 import pathlib
diff --git a/src/tests/test_review_tracking.py b/src/tests/test_review_tracking.py
index 181b5e5..6734a1c 100644
--- a/src/tests/test_review_tracking.py
+++ b/src/tests/test_review_tracking.py
@@ -4,7 +4,7 @@ import io
 import os
 import re
 from email.message import EmailMessage
-from typing import Any, Dict, List, Union
+from typing import Any, Dict
 from unittest import mock
 
 import pytest
@@ -1724,13 +1724,14 @@ class TestFollowupBlob:
 class TestPatchState:
     """Tests for _get_patch_state() and _set_patch_state()."""
 
-    _USERCFG: Dict[str, Union[str, List[str], None]] = {'email': 'reviewer@example.com', 'name': 'Test Reviewer'}
+    _EMAIL = 'reviewer@example.com'
+    _USERCFG: b4.ConfigDictT = {'email': _EMAIL, 'name': 'Test Reviewer'}
 
     def _make_target(self, review_data: Dict[str, Any] | None = None) -> Dict[str, Any]:
         """Return a minimal target dict, optionally with review data."""
         if review_data is None:
             return {}
-        return {'reviews': {self._USERCFG['email']: {'name': 'Test Reviewer', **review_data}}}
+        return {'reviews': {self._EMAIL: {'name': 'Test Reviewer', **review_data}}}
 
     def test_no_data(self) -> None:
         """Empty reviews dict → no state."""

-- 
2.53.0

