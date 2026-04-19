Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24AE2BDC0E
	for <tools@linux.kernel.org>; Sun, 19 Apr 2026 16:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776614411; cv=none; b=qNt0+uC5/cm+X+yoOyqdA4+PcYgfNySKk3Xzxqesz1ViIYZtuCJTIydw61+iDHFw1XkUpRawZJiX1HcqKBLaZBJsgnjgd322VHm0ztdkl9X7h3d6apTX9NMHlkYPebZ9W6kH5Rcs+Ul7T5mQrokxkJQdvtm5Jgr8NtomBN8czDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776614411; c=relaxed/simple;
	bh=guXrpnVJtbMfkLWtOdkZdrdX7lcIoM3k8rsGuvKOG5A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h5MSYCW0Rg/neHJcInG1oayFavE/cP7BJ/VVcx1BrdSvVeOcDf0fzmjyFX768BnvMTYgjfYaDWwa31Ckki7KMcdPo3t7jMnIBLUkuRDxqLMpERnNGwGn1OWi3c3dqgD1jjmMO1vi0lDQn2G8evb1QAd6q1jWngmWJB8gAoEukFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pQicWYuf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pQicWYuf"
Received: by smtp.kernel.org (Postfix)
	id BB1B3C2BCAF; Sun, 19 Apr 2026 16:00:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DF73C2BCB3;
	Sun, 19 Apr 2026 16:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776614411;
	bh=guXrpnVJtbMfkLWtOdkZdrdX7lcIoM3k8rsGuvKOG5A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pQicWYufnu8dgjJiTFXTzgXmcbqexdpUrEriYpcT2G65WtawJSJThOOVuW1DdgG2/
	 Pij+70n0HLKW0nbiyL7rUMDaPdCVkmj530cfhqBB9XQCmsGWfEvpHVdmjA6G7hCxxw
	 3dAEg8eZgirW1S01ZG1elU811Ibdp8fNXngebDrzKVFfpC80HPS19By5lQbyqA5XTI
	 fRbPAayWTdjk/UZsGFjtEzbtCgZ9JDln8RvTwjws4jjyvGw3Itl/wTemK+RlaA5Xux
	 /SZHXzeWdNvitMROQFBUdcbyctbmkmA6SvbAnYSFfkUpK12ybwDSe39qyDXY2Merxf
	 aUyyZVMux1ZMA==
From: Tamir Duberstein <tamird@kernel.org>
Date: Sun, 19 Apr 2026 12:00:03 -0400
Subject: [PATCH b4 v2 08/11] Enable and fix pyright diagnostics
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260419-ruff-check-v2-8-089dfb264501@kernel.org>
References: <20260419-ruff-check-v2-0-089dfb264501@kernel.org>
In-Reply-To: <20260419-ruff-check-v2-0-089dfb264501@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=29565; i=tamird@kernel.org;
 h=from:subject:message-id; bh=guXrpnVJtbMfkLWtOdkZdrdX7lcIoM3k8rsGuvKOG5A=;
 b=kA0DAAoW0EwOJRfXEpcByyZiAGnk/AShx7q5GhkHhDQTlqZCG6z8/E+cPY+ct3QXg5OXcu6xA
 IiRBAAWCgA5FiEEYRXCvWdl27wdae7H0EwOJRfXEpcFAmnk/AQbFIAAAAAABAAObWFudTIsMi41
 KzEuMTIsMCwzAAoJENBMDiUX1xKXJrgA/jjbksB6e+bi6p7Spd/+ZLfSKM4l6+ZXu9qsX7bQduP
 +APsHpfKHd6jmE3AnCEgDTKxwL7mzCbGg7Fsr7RmvFL2GCQ==
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
 ci.sh                              |  1 +
 misc/send-receive.py               |  2 ++
 pyproject.toml                     | 12 +++++++++---
 src/b4/__init__.py                 | 16 +++++++---------
 src/b4/command.py                  | 11 ++++++-----
 src/b4/dig.py                      |  4 ++--
 src/b4/ez.py                       | 14 +++++++++-----
 src/b4/review/_review.py           |  5 +++--
 src/b4/review/tracking.py          |  5 ++---
 src/b4/review_tui/_common.py       |  4 ----
 src/b4/review_tui/_modals.py       | 19 +++++++------------
 src/b4/review_tui/_pw_app.py       |  3 ++-
 src/b4/review_tui/_review_app.py   | 26 ++++++++++++++------------
 src/b4/review_tui/_tracking_app.py | 37 ++++++++++++++-----------------------
 src/b4/ty.py                       | 13 +++++++++----
 src/tests/test___init__.py         |  4 +++-
 src/tests/test_review_tracking.py  | 14 ++++----------
 17 files changed, 94 insertions(+), 96 deletions(-)

diff --git a/ci.sh b/ci.sh
index 7632e85..7e4e7a4 100755
--- a/ci.sh
+++ b/ci.sh
@@ -5,4 +5,5 @@ set -eu
 uv run ruff format --check
 uv run ruff check
 uv run mypy .
+uv run pyright
 uv run pytest --durations=20
diff --git a/misc/send-receive.py b/misc/send-receive.py
index c0dbfe2..11af5dc 100644
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
index b960994..8167f53 100644
--- a/pyproject.toml
+++ b/pyproject.toml
@@ -37,6 +37,7 @@ dependencies = [
 dev = [
     "mypy",
     "pip-tools",
+    "pyright",
     "pytest",
     "pytest-asyncio",
     "ruff",
@@ -122,10 +123,15 @@ flake8-quotes.inline-quotes = "single"
 [tool.ruff.format]
 quote-style = "single"
 
-[tool.pyright]
-typeCheckingMode = "off"
-
 [tool.mypy]
 exclude = ["^ezgb/", "^liblore/", "^patatt/"]
 strict = true
 warn_unreachable = true
+
+[tool.pyright]
+# pyright automatically ignores virtual environments and other directories, but
+# once we specify `exclude`, we're on our own. See
+# https://github.com/microsoft/pyright/issues/9057#issuecomment-2366938099.
+exclude = [".venv", "ezgb", "liblore", "patatt"]
+typeCheckingMode = "standard"
+reportUnusedImport = true
diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 6b1789f..c427ee4 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -93,7 +93,7 @@ def _dkim_log_filter(record: logging.LogRecord) -> bool:
     return True
 
 
-logger = logging.getLogger('b4')
+logger: logging.Logger = logging.getLogger('b4')
 dkimlogger = logger.getChild('dkim')
 dkimlogger.addFilter(_dkim_log_filter)
 # Route liblore logging through b4's logger so debug mode covers it
@@ -1349,25 +1349,25 @@ class LoreSeries:
                         seenfiles.add(nfn)
                     # Try to grab full ref_id of this hash
                     try:
-                        ohash = git_revparse_obj(ofi)
+                        hash = git_revparse_obj(ofi)
                         logger.debug('  Found matching blob for: %s', ofn)
                         gitargs = [
                             'update-index',
                             '--add',
                             '--cacheinfo',
-                            f'{fmod},{ohash},{ofn}',
+                            f'{fmod},{hash},{ofn}',
                         ]
                     except RuntimeError:
                         logger.debug(
                             'Could not find matching blob for %s (%s)', ofn, ofi
                         )
                         try:
-                            chash = git_revparse_obj(f':{ofn}', topdir)
+                            hash = git_revparse_obj(f':{ofn}', topdir)
                             gitargs = [
                                 'update-index',
                                 '--add',
                                 '--cacheinfo',
-                                f'{fmod},{chash},{ofn}',
+                                f'{fmod},{hash},{ofn}',
                             ]
                         except RuntimeError:
                             logger.critical(
@@ -1378,9 +1378,7 @@ class LoreSeries:
                     ecode, out = git_run_command(None, gitargs)
                     if ecode > 0:
                         logger.critical(
-                            '  ERROR: Could not run update-index for %s (%s)',
-                            ofn,
-                            ohash,
+                            '  ERROR: Could not run update-index for %s (%s)', ofn, hash
                         )
                         return None, None
 
@@ -4972,7 +4970,7 @@ def send_mail(
     web_endpoint: Optional[str] = None,
     reflect: bool = False,
 ) -> Optional[int]:
-    tosend = list()
+    tosend: List[Tuple[Set[str], bytes, LoreSubject]] = list()
     if output_dir is not None:
         dryrun = True
 
diff --git a/src/b4/command.py b/src/b4/command.py
index 35ed44b..fa6e84c 100644
--- a/src/b4/command.py
+++ b/src/b4/command.py
@@ -279,12 +279,13 @@ class ConfigOption(argparse.Action):
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
index 781d509..eac749c 100644
--- a/src/b4/dig.py
+++ b/src/b4/dig.py
@@ -297,7 +297,7 @@ def dig_commitish(cmdargs: argparse.Namespace) -> None:
         if not best_match:
             # Next, try to find by exact patch-id
             for lmsg in all_lmsgs:
-                if lmsg.git_patch_id == patch_id:
+                if lmsg.git_patch_id == patch_id:  # pyright: ignore[reportPossiblyUnboundVariable] # broken since 3ae277e9c7dd3e1df61a14884aabdd5834ad1201
                     logger.debug('matched by exact patch-id')
                     best_match = lmsg
                     break
@@ -354,7 +354,7 @@ def dig_commitish(cmdargs: argparse.Namespace) -> None:
                 continue
             if firstmsg is None:
                 firstmsg = lmsg
-            if lmsg.git_patch_id == patch_id:
+            if lmsg.git_patch_id == patch_id:  # pyright: ignore[reportPossiblyUnboundVariable] # broken since inception in 16329336c1c8faba853b11238a16249306742505
                 logger.debug('Matched by exact patch-id')
                 break
             if lmsg.subject == csubj:
diff --git a/src/b4/ez.py b/src/b4/ez.py
index 02589c5..3a59256 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -1481,7 +1481,7 @@ def update_trailers(cmdargs: argparse.Namespace) -> None:
                         fltr.lmsg.msgid, safe='@'
                     )
                 logger.info('  + %s', rendered)
-                logger.info('    via: %s', source)
+                logger.info('    via: %s', source)  # pyright: ignore[reportPossiblyUnboundVariable] # broken since 742e017c1b5b91d0e6fd6fca7decf73956b31487
             else:
                 logger.debug('  . %s', fltr.as_string(omit_extinfo=True))
 
@@ -1636,7 +1636,7 @@ def get_base_changeid_from_tag(tagname: str) -> Tuple[str, str, str]:
     return cover, base_commit, change_id
 
 
-def make_msgid_tpt(change_id: str, revision: str, domain: Optional[str] = None) -> str:
+def make_msgid_tpt(change_id: str, revision: int, domain: Optional[str] = None) -> str:
     if not domain:
         usercfg = b4.get_user_config()
         myemail = usercfg.get('email')
@@ -1800,7 +1800,7 @@ def get_prep_branch_as_patches(
 
     if prefixes is None:
         prefixes = list()
-    prefixes += tracking['series'].get('prefixes', list())
+    prefixes.extend(tracking['series'].get('prefixes', list()))
     base_commit, start_commit, end_commit = get_series_range(usebranch=usebranch)
     change_id = tracking['series'].get('change-id')
     revision = tracking['series'].get('revision')
@@ -1953,6 +1953,10 @@ def get_prep_branch_as_patches(
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
@@ -2034,7 +2038,7 @@ def get_sent_tag_as_patches(
     csubject, cbody = get_cover_subject_body(cover)
     cbody = cbody.strip() + '\n-- \n' + b4.get_email_signature()
     prefixes = ['RESEND'] + csubject.get_extra_prefixes(exclude=['RESEND'])
-    msgid_tpt = make_msgid_tpt(change_id, str(revision))
+    msgid_tpt = make_msgid_tpt(change_id, revision)
     seriests = int(time.time())
     mailfrom = b4.get_mailfrom()
 
@@ -3178,7 +3182,7 @@ def force_revision(forceto: int) -> None:
 
 
 def range_diff_compare(
-    compareto: str, execvp: bool = True, range_diff_opts: Optional[str] = None
+    compareto: int, execvp: bool = True, range_diff_opts: Optional[str] = None
 ) -> Union[str, None]:
     _, tracking = load_cover()
     # Try the new format first
diff --git a/src/b4/review/_review.py b/src/b4/review/_review.py
index b061139..47098c1 100644
--- a/src/b4/review/_review.py
+++ b/src/b4/review/_review.py
@@ -21,6 +21,7 @@ import liblore.utils
 
 import b4
 import b4.mbox
+import b4.review
 import b4.review.tracking
 
 logger = b4.logger
@@ -2172,7 +2173,7 @@ def update_series_tracking(
 
 def cmd_tui(cmdargs: argparse.Namespace) -> None:
     try:
-        import b4.review_tui
+        import b4.review_tui as review_tui
     except ImportError:
         logger.critical('The TUI requires the textual library.')
         logger.critical('Install it with: pip install b4[tui]')
@@ -2197,7 +2198,7 @@ def cmd_tui(cmdargs: argparse.Namespace) -> None:
             logger.critical('Enroll with: b4 review enroll')
             sys.exit(1)
 
-    b4.review_tui.run_tracking_tui(
+    review_tui.run_tracking_tui(
         identifier,
         email_dryrun=cmdargs.email_dryrun,
         no_sign=cmdargs.no_sign,
diff --git a/src/b4/review/tracking.py b/src/b4/review/tracking.py
index dd9a8e5..fb41bf0 100644
--- a/src/b4/review/tracking.py
+++ b/src/b4/review/tracking.py
@@ -229,14 +229,13 @@ def record_take_branch(gitdir: str, branch: str) -> None:
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
@@ -814,7 +813,7 @@ def get_all_revisions_grouped(
     )
     result: dict[str, list[dict[str, Any]]] = {}
     for row in cursor.fetchall():
-        entry = dict(zip(cols, row))
+        entry: dict[str, Any] = dict(zip(cols, row))
         result.setdefault(row[0], []).append(entry)
     return result
 
diff --git a/src/b4/review_tui/_common.py b/src/b4/review_tui/_common.py
index 33349fb..84992e8 100644
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
@@ -23,7 +20,6 @@ from rich.text import Text
 from textual.widgets import RichLog
 
 import b4
-import b4.mbox
 import b4.review
 import b4.review.tracking
 
diff --git a/src/b4/review_tui/_modals.py b/src/b4/review_tui/_modals.py
index dc72597..21f76ad 100644
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
@@ -978,8 +981,6 @@ class TakeConfirmScreen(ModalScreen[bool]):
 
     def _test_take(self) -> Tuple[bool, str]:
         """Test-apply review branch patches at the target base."""
-        import b4.review
-
         with _quiet_worker():
             topdir = b4.git_get_toplevel()
             if not topdir:
@@ -1477,8 +1478,6 @@ class QueueDeliveryScreen(
         self._cancelled = True
 
     def _do_deliver(self) -> Tuple[int, int, List[Tuple[str, int]]]:
-        import b4.ty
-
         def _on_progress(completed: int, total: int, status: str) -> None:
             if not self._cancelled:
                 self.app.call_from_thread(
@@ -1679,7 +1678,8 @@ class ViewSeriesScreen(_FetchViewerScreen):
             msgs = b4.review._retrieve_messages(self._message_id)
             return b4.review._get_lore_series(msgs)
 
-    def _show_result(self, lser: 'b4.LoreSeries') -> None:
+    def _show_result(self, result: 'b4.LoreSeries') -> None:
+        lser = result
         subject = lser.subject or '(no subject)'
         self.query_one('#fv-title', Static).update(subject)
         viewer = self.query_one('#fv-viewer', RichLog)
@@ -1724,13 +1724,12 @@ class CIChecksScreen(_FetchViewerScreen):
         self._series = series
 
     def _fetch(self) -> List[Dict[str, Any]]:
-        import b4.review
-
         with _quiet_worker():
             patch_ids = self._series.get('patch_ids', [])
             return b4.review.pw_fetch_checks(self._pwkey, self._pwurl, patch_ids)
 
-    def _show_result(self, checks: List[Dict[str, Any]]) -> None:
+    def _show_result(self, result: List[Dict[str, Any]]) -> None:
+        checks = result
         series_name = self._series.get('name') or '(no subject)'
         self.query_one('#fv-title', Static).update(f'CI checks \u2014 {series_name}')
         viewer = self.query_one('#fv-viewer', RichLog)
@@ -1989,8 +1988,6 @@ class RebaseScreen(ModalScreen[bool]):
 
     def _prepare_local(self) -> bytes:
         """Build mbox from the local review branch patches."""
-        import b4.review
-
         topdir = b4.git_get_toplevel()
         if not topdir:
             raise RuntimeError('Not in a git repository')
@@ -2760,8 +2757,6 @@ class UpdateAllScreen(ModalScreen[Dict[str, Any]]):
         self._cancelled = True
 
     def _do_updates(self) -> Dict[str, Any]:
-        import b4.review
-
         with _quiet_worker():
             # Rescan local review branches first so the DB reflects current
             # on-disk state before the network update runs.
diff --git a/src/b4/review_tui/_pw_app.py b/src/b4/review_tui/_pw_app.py
index 6efb55a..6ee5b80 100644
--- a/src/b4/review_tui/_pw_app.py
+++ b/src/b4/review_tui/_pw_app.py
@@ -515,8 +515,9 @@ class PwApp(App[None]):
         )
 
     def _on_apply_complete(
-        self, result: Tuple[int, int, str], item: 'PwSeriesItem'
+        self, result: Optional[Tuple[int, int, str]], item: 'PwSeriesItem'
     ) -> None:
+        assert result is not None
         ok, fail, new_state = result
         if fail:
             self.notify(f'{ok} updated, {fail} failed', severity='warning')
diff --git a/src/b4/review_tui/_review_app.py b/src/b4/review_tui/_review_app.py
index bf6f9ab..7cdc6e9 100644
--- a/src/b4/review_tui/_review_app.py
+++ b/src/b4/review_tui/_review_app.py
@@ -1226,7 +1226,6 @@ class ReviewApp(CheckRunnerMixin, App[None]):
         existing_reply = review.get('reply', '')
 
         # Get the real diff for position resolution when parsing back
-        real_diff = ''
         if self._selected_idx > 0:
             patch_idx = self._selected_idx - 1
             if patch_idx >= len(self._commit_shas):
@@ -1238,18 +1237,11 @@ class ReviewApp(CheckRunnerMixin, App[None]):
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
-                    '', all_reviews, my_email, commit_msg=self._cover_text
-                )
+            if existing_reply:
+                editor_text = existing_reply
             else:
+                all_reviews = target.get('reviews', {})
+                my_email = str(self._usercfg.get('email', ''))
                 ecode, commit_msg = b4.git_run_command(
                     self._topdir, ['show', '--format=%B', '--no-patch', sha]
                 )
@@ -1259,6 +1251,16 @@ class ReviewApp(CheckRunnerMixin, App[None]):
                 editor_text = b4.review._render_quoted_diff_with_comments(
                     real_diff, all_reviews, my_email, commit_msg=commit_msg.strip()
                 )
+        else:
+            real_diff = ''
+            if existing_reply:
+                editor_text = existing_reply
+            else:
+                all_reviews = target.get('reviews', {})
+                my_email = str(self._usercfg.get('email', ''))
+                editor_text = b4.review._render_quoted_diff_with_comments(
+                    '', all_reviews, my_email, commit_msg=self._cover_text
+                )
 
         with self.suspend():
             result = b4.edit_in_editor(
diff --git a/src/b4/review_tui/_tracking_app.py b/src/b4/review_tui/_tracking_app.py
index 2c8087f..6b4151c 100644
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
@@ -829,8 +830,6 @@ class TrackingApp(CheckRunnerMixin, App[Optional[str]]):
         b4.review.tracking.unsnooze_series(conn, cid, prev_status, revision=rev)
 
     def _load_series(self) -> None:
-        import b4.ty
-
         self._auto_wake_snoozed()
 
         all_series = b4.review.tracking.get_all_tracked_series(self._identifier)
@@ -1644,6 +1643,7 @@ class TrackingApp(CheckRunnerMixin, App[Optional[str]]):
                             rend,
                         )
 
+            _is_rt = bool(series.get('is_rethreaded'))
             try:
                 logger.info('Base: %s', base_commit)
                 b4.git_fetch_am_into_repo(
@@ -1655,7 +1655,6 @@ class TrackingApp(CheckRunnerMixin, App[Optional[str]]):
                 )
 
                 # Create the review branch
-                _is_rt = bool(series.get('is_rethreaded'))
                 b4.review.create_review_branch(
                     topdir,
                     branch_name,
@@ -2145,7 +2144,7 @@ class TrackingApp(CheckRunnerMixin, App[Optional[str]]):
 
     def _on_newer_revision_acknowledged(
         self,
-        proceed: bool,
+        proceed: Optional[bool],
         target_branch: str,
         change_id: str,
         review_branch: str,
@@ -2220,7 +2219,7 @@ class TrackingApp(CheckRunnerMixin, App[Optional[str]]):
 
     def _on_take_confirmed(
         self,
-        confirmed: bool,
+        confirmed: Optional[bool],
         change_id: str,
         review_branch: str,
         take_screen: 'TakeScreen',
@@ -2272,7 +2271,7 @@ class TrackingApp(CheckRunnerMixin, App[Optional[str]]):
 
     def _on_cherrypick_confirmed(
         self,
-        confirmed: bool,
+        confirmed: Optional[bool],
         change_id: str,
         review_branch: str,
         take_screen: 'TakeScreen',
@@ -2323,7 +2322,7 @@ class TrackingApp(CheckRunnerMixin, App[Optional[str]]):
 
     def _on_take_final(
         self,
-        confirmed: bool,
+        confirmed: Optional[bool],
         method: str,
         change_id: str,
         review_branch: str,
@@ -2949,7 +2948,10 @@ class TrackingApp(CheckRunnerMixin, App[Optional[str]]):
         )
 
     def _on_rebase_confirmed(
-        self, confirmed: bool, review_branch: str, rebase_screen: 'RebaseScreen'
+        self,
+        confirmed: Optional[bool],
+        review_branch: str,
+        rebase_screen: 'RebaseScreen',
     ) -> None:
         """Handle rebase confirmation result."""
         if not confirmed:
@@ -3452,7 +3454,7 @@ class TrackingApp(CheckRunnerMixin, App[Optional[str]]):
 
     def _on_abandon_confirmed(
         self,
-        confirmed: bool,
+        confirmed: Optional[bool],
         change_id: str,
         review_branch: str,
         has_branch: bool,
@@ -3879,6 +3881,7 @@ class TrackingApp(CheckRunnerMixin, App[Optional[str]]):
                         )
 
             # --- 3. Apply to temporary upgrade branch ---
+            _is_rt = bool((self._selected_series or {}).get('is_rethreaded'))
             try:
                 logger.info('Base: %s', base_sha)
                 b4.git_fetch_am_into_repo(
@@ -3888,7 +3891,6 @@ class TrackingApp(CheckRunnerMixin, App[Optional[str]]):
                     origin=linkurl,
                     am_flags=['-3'],
                 )
-                _is_rt = bool((self._selected_series or {}).get('is_rethreaded'))
                 b4.review.create_review_branch(
                     topdir,
                     upgrade_branch,
@@ -4240,8 +4242,6 @@ class TrackingApp(CheckRunnerMixin, App[Optional[str]]):
         import tarfile
         import time
 
-        import b4.ez
-
         topdir = b4.git_get_toplevel()
         if not topdir:
             if notify:
@@ -4325,7 +4325,7 @@ class TrackingApp(CheckRunnerMixin, App[Optional[str]]):
 
     def _on_archive_confirmed(
         self,
-        confirmed: bool,
+        confirmed: Optional[bool],
         change_id: str,
         review_branch: str,
         has_branch: bool,
@@ -4347,9 +4347,6 @@ class TrackingApp(CheckRunnerMixin, App[Optional[str]]):
         """Compose and preview a thank-you reply for a taken series."""
         import argparse
 
-        import b4.review
-        import b4.ty
-
         series = self._selected_series
         if not series:
             return
@@ -4479,8 +4476,6 @@ class TrackingApp(CheckRunnerMixin, App[Optional[str]]):
         self, msg: email.message.EmailMessage, checkurl: str
     ) -> None:
         """Queue the thanks message for delivery once commits are public."""
-        import b4.ty
-
         series = self._selected_series
         if not series:
             return
@@ -4542,8 +4537,6 @@ class TrackingApp(CheckRunnerMixin, App[Optional[str]]):
 
     def _refresh_queue_indicator(self) -> None:
         """Update the title-bar queue count and Q binding visibility."""
-        import b4.ty
-
         self._queue_count = b4.ty.get_queued_count(dryrun=self._email_dryrun)
         try:
             right = self.query_one('#title-right', Static)
@@ -4557,8 +4550,6 @@ class TrackingApp(CheckRunnerMixin, App[Optional[str]]):
 
     def action_process_queue(self) -> None:
         """Show the queue modal and optionally deliver."""
-        import b4.ty
-
         entries = b4.ty.get_queued_messages(dryrun=self._email_dryrun)
         if not entries:
             self.notify('No queued thanks messages')
diff --git a/src/b4/ty.py b/src/b4/ty.py
index 5918193..cb33ee9 100644
--- a/src/b4/ty.py
+++ b/src/b4/ty.py
@@ -570,9 +570,11 @@ def send_messages(
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
@@ -677,12 +679,14 @@ def discard_selected(cmdargs: argparse.Namespace) -> None:
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
@@ -692,6 +696,7 @@ def discard_selected(cmdargs: argparse.Namespace) -> None:
     if not pwstate:
         pwstate = config.get('pw-discard-state')
     if pwstate:
+        assert isinstance(pwstate, str), 'pwstate must be a string'
         b4.patchwork_set_state(msgids, pwstate)
 
     sys.exit(0)
diff --git a/src/tests/test___init__.py b/src/tests/test___init__.py
index c997059..ade79b2 100644
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
index e106312..290c991 100644
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
@@ -1938,20 +1938,14 @@ class TestFollowupBlob:
 class TestPatchState:
     """Tests for _get_patch_state() and _set_patch_state()."""
 
-    _USERCFG: Dict[str, Union[str, List[str], None]] = {
-        'email': 'reviewer@example.com',
-        'name': 'Test Reviewer',
-    }
+    _EMAIL = 'reviewer@example.com'
+    _USERCFG: b4.ConfigDictT = {'email': _EMAIL, 'name': 'Test Reviewer'}
 
     def _make_target(self, review_data: Dict[str, Any] | None = None) -> Dict[str, Any]:
         """Return a minimal target dict, optionally with review data."""
         if review_data is None:
             return {}
-        return {
-            'reviews': {
-                self._USERCFG['email']: {'name': 'Test Reviewer', **review_data}
-            }
-        }
+        return {'reviews': {self._EMAIL: {'name': 'Test Reviewer', **review_data}}}
 
     def test_no_data(self) -> None:
         """Empty reviews dict → no state."""

-- 
2.53.0

