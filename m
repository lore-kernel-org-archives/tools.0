Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC292BE7A7
	for <tools@linux.kernel.org>; Sun, 19 Apr 2026 16:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776614411; cv=none; b=mbpygV1GDA6BrNwp+/PFHrugRSlQYGOKGDsPGqTR9x2wTFlD7+0wKsiBTqYHzArkNZ0oUbigQgX3tqRiHE2AU6ztCD/w2OX0J3j14BKkoeDcmMOnuBtYoSA6WlcI+GfLpPxYWTW0Zx39TpeGIJpDjLQMV9JJDiv6wVqUDJ43/uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776614411; c=relaxed/simple;
	bh=eRxUfU4o769yAwxPiF1CurpaCD5deJKYrTLBXqDMnnI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LWrMvLGXYFT1u62Z3mPQX4LDPKHMwqEQkPW4+VrO2q8EUnRQXKOXqghSIKtQHHS+qNjlYRTxI6xWdpiifJ1XHSHBqYJAuI99McY4PpYZpo5dzfNPDvihYuzvqal9qBXU69t+8r79Qo0T4ge3WGbHnQpIfctxNJiJ4BkKjEXMSG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=itEFxtqg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="itEFxtqg"
Received: by smtp.kernel.org (Postfix)
	id 3717BC2BCAF; Sun, 19 Apr 2026 16:00:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEF39C2BCB7;
	Sun, 19 Apr 2026 16:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776614411;
	bh=eRxUfU4o769yAwxPiF1CurpaCD5deJKYrTLBXqDMnnI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=itEFxtqg1pCiAjrw4WriutAVvaqO0lH8ubUe/5lFQJGydHksRbjMhWbfR+VEddcXV
	 vywI5o8ja3PRsLuHk3DCFWRu7hSzksGz7j+hU5TgnTerEPgYQco03L7K0VkQwhynoF
	 VALhATxpw60/D7EkFTcSZJW3DPuzxrEUJkFfZneDMo/asFx7+3SgVqERi6u0wDtIBW
	 zpIhTRM4cH47LCHhLKk7pVOgYWf0dqi5UyaVncRXwey+EDC359BxAs/RqvxgBqzIGI
	 jl00+nMFJzYmL/gc5jZJZ8vjOxByc9Z1rUu2E8CDfY7l51JteaGMq+zE0cXiSEEDb3
	 +kM1mBvKTAKRA==
From: Tamir Duberstein <tamird@kernel.org>
Date: Sun, 19 Apr 2026 12:00:02 -0400
Subject: [PATCH b4 v2 07/11] Enable mypy unreachable warnings
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260419-ruff-check-v2-7-089dfb264501@kernel.org>
References: <20260419-ruff-check-v2-0-089dfb264501@kernel.org>
In-Reply-To: <20260419-ruff-check-v2-0-089dfb264501@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=10257; i=tamird@kernel.org;
 h=from:subject:message-id; bh=eRxUfU4o769yAwxPiF1CurpaCD5deJKYrTLBXqDMnnI=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlP/rD8uaaeu9449JhYHVP+krNdyXGNuQ2SO47xMT/vi
 3zwxuVvx0QWBjEuBksxRZZE0UN701Nv75HNfHccZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx0DFm4OIUgKleco7hv5tPrq9vwes35+WD98xuK/srzV1j6sBrodHB+oE5YMn13YwMs14XzJ/
 Edt4qMJK/t+yW+tVz7ovVVaOWL92d0BG9Q12UCQA=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

Turn on warn_unreachable and remove dead branches that it exposes.

Some of those branches were stale null checks against non-optional APIs.
Others were test assertions that hit mypy's stale narrowing of mutable
attributes, so add targeted ignores with a reference to the upstream
issue.

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
 pyproject.toml                   |  2 +-
 src/b4/__init__.py               |  6 ++----
 src/b4/mbox.py                   |  2 --
 src/b4/pr.py                     |  2 +-
 src/b4/review/tracking.py        |  3 ++-
 src/b4/review_tui/_common.py     |  4 ----
 src/b4/review_tui/_modals.py     |  2 --
 src/b4/review_tui/_review_app.py |  4 ++--
 src/b4/ty.py                     |  3 ---
 src/tests/test_tui_modals.py     | 12 +++++++++---
 src/tests/test_tui_tracking.py   | 12 +++++++++---
 11 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/pyproject.toml b/pyproject.toml
index c5b4593..b960994 100644
--- a/pyproject.toml
+++ b/pyproject.toml
@@ -125,7 +125,7 @@ quote-style = "single"
 [tool.pyright]
 typeCheckingMode = "off"
 
-# Configure mypy in strict mode
 [tool.mypy]
 exclude = ["^ezgb/", "^liblore/", "^patatt/"]
 strict = true
+warn_unreachable = true
diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 3c1c127..6b1789f 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -1190,9 +1190,7 @@ class LoreSeries:
         branches: Optional[List[str]] = None,
         maxdays: int = 30,
     ) -> Tuple[str, int, int]:
-        if self.indexes is None:
-            self.populate_indexes()
-        if self.indexes is None or not len(self.indexes):
+        if not self.indexes:
             raise IndexError('No indexes to check against')
 
         pdate = self.submission_date
@@ -1744,7 +1742,7 @@ class LoreMessage:
         # walk until we find the first text/plain part
         self.body, self.charset = LoreMessage.get_payload(self.msg)
 
-        if self.body is None:
+        if not self.body:
             # Woah, we didn't find any usable parts
             logger.debug('  No plain or patch parts found in message')
             logger.info('  Not plaintext: %s', self.full_subject)
diff --git a/src/b4/mbox.py b/src/b4/mbox.py
index 3198836..66b47ba 100644
--- a/src/b4/mbox.py
+++ b/src/b4/mbox.py
@@ -226,8 +226,6 @@ def make_am(msgs: List[EmailMessage], cmdargs: argparse.Namespace, msgid: str) -
         if cmdargs.cherrypick == '_':
             # We might want to pick a patch sent as a followup, so create a fake series
             # and add followups with diffs
-            if lser is None:
-                lser = b4.LoreSeries(revision=1, expected=1)
             for followup in lmbx.followups:
                 if followup.has_diff:
                     lser.add_patch(followup)
diff --git a/src/b4/pr.py b/src/b4/pr.py
index 7c0659a..b6a0c6b 100644
--- a/src/b4/pr.py
+++ b/src/b4/pr.py
@@ -92,7 +92,7 @@ def git_get_commit_id_from_repo_ref(repo: str, ref: str) -> Optional[str]:
 
 def parse_pr_data(msg: email.message.EmailMessage) -> Optional[b4.LoreMessage]:
     lmsg = b4.LoreMessage(msg)
-    if lmsg.body is None:
+    if not lmsg.body:
         logger.critical('Could not find a plain part in the message body')
         return None
 
diff --git a/src/b4/review/tracking.py b/src/b4/review/tracking.py
index ee0d218..dd9a8e5 100644
--- a/src/b4/review/tracking.py
+++ b/src/b4/review/tracking.py
@@ -229,13 +229,14 @@ def record_take_branch(gitdir: str, branch: str) -> None:
     metadata_dir = os.path.join(gitdir, REVIEW_METADATA_DIR)
     pathlib.Path(metadata_dir).mkdir(parents=True, exist_ok=True)
     metadata_path = get_repo_metadata_path(gitdir)
-    data: Dict[str, Any] = {}
     if os.path.exists(metadata_path):
         try:
             with open(metadata_path, 'r') as f:
                 data = json.load(f)
         except (json.JSONDecodeError, OSError):
             pass
+    else:
+        data = {}
     if not isinstance(data, dict):
         data = {}
     branches = data.get('recent-take-branches', [])
diff --git a/src/b4/review_tui/_common.py b/src/b4/review_tui/_common.py
index c6d5df3..33349fb 100644
--- a/src/b4/review_tui/_common.py
+++ b/src/b4/review_tui/_common.py
@@ -792,10 +792,6 @@ def gather_attestation_info(lser: b4.LoreSeries) -> Dict[str, Any]:
     apply_mismatches = 0
 
     if topdir:
-        # Ensure indexes are populated for applicability check
-        if lser.indexes is None:
-            lser.populate_indexes()
-
         if base_commit:
             base_exists = b4.git_commit_exists(topdir, base_commit)
 
diff --git a/src/b4/review_tui/_modals.py b/src/b4/review_tui/_modals.py
index c8521d6..dc72597 100644
--- a/src/b4/review_tui/_modals.py
+++ b/src/b4/review_tui/_modals.py
@@ -2256,8 +2256,6 @@ class TargetBranchScreen(ModalScreen[Optional[str]]):
             ifh = io.BytesIO()
             b4.save_git_am_mbox(am_msgs, ifh)
             ambytes = ifh.getvalue()
-            if lser.indexes is None:
-                lser.populate_indexes()
             return lser, ambytes
 
     def _check_applicability(self, branch: str) -> None:
diff --git a/src/b4/review_tui/_review_app.py b/src/b4/review_tui/_review_app.py
index e476044..bf6f9ab 100644
--- a/src/b4/review_tui/_review_app.py
+++ b/src/b4/review_tui/_review_app.py
@@ -1265,7 +1265,7 @@ class ReviewApp(CheckRunnerMixin, App[None]):
                 editor_text.encode(), filehint='reply.b4-review.eml'
             )
 
-        if result is None:
+        if not result:
             self.notify('Editor returned no content')
             return
         reply_text = result.decode(errors='replace')
@@ -1388,7 +1388,7 @@ class ReviewApp(CheckRunnerMixin, App[None]):
         with self.suspend():
             result = b4.edit_in_editor(editor_text.encode(), filehint='note.txt')
 
-        if result is None:
+        if not result:
             self.notify('Editor returned no content')
             return
         raw_text = result.decode(errors='replace')
diff --git a/src/b4/ty.py b/src/b4/ty.py
index 45c7773..5918193 100644
--- a/src/b4/ty.py
+++ b/src/b4/ty.py
@@ -521,9 +521,6 @@ def send_messages(
             # This is a patch series
             msg = generate_am_thanks(gitdir, jsondata, branch, cmdargs)
 
-        if msg is None:
-            continue
-
         assert isinstance(jsondata['msgid'], str), 'msgid must be a string'
         msgids.append(jsondata['msgid'])
         assert isinstance(jsondata['patches'], list), 'patches must be a list'
diff --git a/src/tests/test_tui_modals.py b/src/tests/test_tui_modals.py
index 8f16781..4bb3069 100644
--- a/src/tests/test_tui_modals.py
+++ b/src/tests/test_tui_modals.py
@@ -88,7 +88,9 @@ class TestHelpScreen:
             await pilot.pause()
             # Should be back on the host screen
             assert not isinstance(app.screen, HelpScreen)
-            assert dismissed == [None]
+            # https://github.com/python/mypy/issues/9457:
+            # app.screen is stale-narrowed across await.
+            assert dismissed == [None]  # type: ignore[unreachable]
 
     @pytest.mark.asyncio
     async def test_question_mark_dismisses(self) -> None:
@@ -182,7 +184,9 @@ class TestConfirmScreen:
             await pilot.press('y')
             await pilot.pause()
             assert not isinstance(app.screen, ConfirmScreen)
-            assert results == [True]
+            # https://github.com/python/mypy/issues/9457:
+            # app.screen is stale-narrowed across await.
+            assert results == [True]  # type: ignore[unreachable]
 
     @pytest.mark.asyncio
     async def test_escape_cancels(self) -> None:
@@ -477,7 +481,9 @@ class TestPriorReviewScreen:
             await pilot.press('escape')
             await pilot.pause()
             assert not isinstance(app.screen, PriorReviewScreen)
-            assert results == [None]
+            # https://github.com/python/mypy/issues/9457:
+            # app.screen is stale-narrowed across await.
+            assert results == [None]  # type: ignore[unreachable]
 
     @pytest.mark.asyncio
     async def test_content_rendered(self) -> None:
diff --git a/src/tests/test_tui_tracking.py b/src/tests/test_tui_tracking.py
index 76ff353..a9491ad 100644
--- a/src/tests/test_tui_tracking.py
+++ b/src/tests/test_tui_tracking.py
@@ -1044,7 +1044,9 @@ class TestTrackingSnooze:
             assert not isinstance(app.screen, SnoozeScreen)
 
             # Verify DB was updated
-            conn = tracking.get_db(identifier)
+            # https://github.com/python/mypy/issues/9457:
+            # app.screen is stale-narrowed across await.
+            conn = tracking.get_db(identifier)  # type: ignore[unreachable]
             cursor = conn.execute(
                 'SELECT status, snoozed_until FROM series WHERE change_id = ?',
                 ('snooze-test-1',),
@@ -2161,7 +2163,9 @@ class TestTargetBranch:
             assert not isinstance(app.screen, TargetBranchScreen)
 
             # Verify DB cleared
-            conn = tracking.get_db(identifier)
+            # https://github.com/python/mypy/issues/9457:
+            # app.screen is stale-narrowed across await.
+            conn = tracking.get_db(identifier)  # type: ignore[unreachable]
             target = tracking.get_target_branch(conn, change_id)
             conn.close()
             assert target is None
@@ -2709,7 +2713,9 @@ class TestLoadSeriesCaching:
             assert app._cached_branch_tips is not None
             app._invalidate_caches()
             assert app._cached_branch_tips is None
-            assert app._cached_newest_revisions is None
+            # https://github.com/python/mypy/issues/9457:
+            # app._cached_branch_tips is stale-narrowed across a method call.
+            assert app._cached_newest_revisions is None  # type: ignore[unreachable]
             assert app._cached_revision_counts is None
             assert app._cached_art_counts is None
 

-- 
2.53.0

