Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D782BE641
	for <tools@linux.kernel.org>; Tue,  7 Apr 2026 16:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775580525; cv=none; b=tVVMaiAbyggx1aTVZhX27OSjqE/WFCeY79SQiHx7IvGRSExt+0oXiybLf57xW1PFLaJ996x6ojL2B5nbmcChdmaHfF2D0ZKpT6an5QwRlkvK71erPFrmbkev3owW1r+KFAl6k4hJvr7gKTTWDRXe5fU5TmwlIfYh3g1RKCHU6hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775580525; c=relaxed/simple;
	bh=iXVwwM9O9d1RK2S66CeMbJI62NQiJ+bEDQsVc2Fq5nQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WVvRT926VCAJOt7H5X5aoJdjKQogEhbT7RfthawhBctFhUFRQKuNpu6E2zanzh8n2l8a/U3ZT7wgWJkDfq0O+lTifTuFo+81DDoeXdm6OotlRCXeff1azU4WnFtLXmOR9cRNvsWNtU2WOWcBeQrgonNyIzyfAGgOngv8EZrUMS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MHB1Zdwz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MHB1Zdwz"
Received: by smtp.kernel.org (Postfix)
	id ABBAEC2BCB0; Tue,  7 Apr 2026 16:48:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C294C116C6;
	Tue,  7 Apr 2026 16:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775580525;
	bh=iXVwwM9O9d1RK2S66CeMbJI62NQiJ+bEDQsVc2Fq5nQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MHB1ZdwzD4pnQ4hZjhls6rhvPK4xahJMPDZihAC9Hn4yOdAAHb8fNC8Z8xOgOh9Jz
	 uWLlMl6BqcsUzwAj+SQIFggLXhTpBlYAyAuRFbSETp/dEP+DMxoAlvf9T1kKaDwZMi
	 iEmnNY/qMn/3NCKWNodzNeQbDp7CRr1hJHMxVYt5cGEC5oj9GyDqcvH6ukeshQmAnQ
	 APtOma/BQEnmbBeJ+JUhK2Mo+ZsFJTnNbPWE1kQBm12Pvr7q1aGtnadrPZU0TL2a0Q
	 KBJAFArk5RaKOaO5OJOLrlecNV/TMhFrSpu+Kjsaeu5Zt4nTAWUxARaQry/9yVrxiY
	 CHVJhPf9cOslA==
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 07 Apr 2026 12:48:36 -0400
Subject: [PATCH b4 07/12] Enable mypy unreachable warnings
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-ruff-check-v1-7-c9568541ff67@kernel.org>
References: <20260407-ruff-check-v1-0-c9568541ff67@kernel.org>
In-Reply-To: <20260407-ruff-check-v1-0-c9568541ff67@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=10383; i=tamird@kernel.org;
 h=from:subject:message-id; bh=iXVwwM9O9d1RK2S66CeMbJI62NQiJ+bEDQsVc2Fq5nQ=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlXTTOsty8+NX9P51w7dRaxaD4pzm9ZngmxU/693nH6g
 9ZX0816HRNZGMS4GCzFFFkSRQ/tTU+9vUc2891xmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHQMeYgYtTAKY6ZgfDfzc141k/9VTm7vsp3D5ZsEta8mDIZusofcNzF9wb1STdgxkZLld9u1h
 fsaKV62Sw11x5v0hmSzOTFysCjgunf1N+v/oBLwA=
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
index c08f47e..982ad95 100644
--- a/pyproject.toml
+++ b/pyproject.toml
@@ -121,6 +121,6 @@ flake8-quotes.inline-quotes = "single"
 [tool.pyright]
 typeCheckingMode = "off"
 
-# Configure mypy in strict mode
 [tool.mypy]
 strict = true
+warn_unreachable = true
diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index a14d89c..20d1f75 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -1056,9 +1056,7 @@ class LoreSeries:
         return len(self.indexes), mismatches
 
     def find_base(self, gitdir: Optional[str], branches: Optional[List[str]] = None, maxdays: int = 30) -> Tuple[str, int, int]:
-        if self.indexes is None:
-            self.populate_indexes()
-        if self.indexes is None or not len(self.indexes):
+        if not self.indexes:
             raise IndexError('No indexes to check against')
 
         pdate = self.submission_date
@@ -1554,7 +1552,7 @@ class LoreMessage:
         # walk until we find the first text/plain part
         self.body, self.charset = LoreMessage.get_payload(self.msg)
 
-        if self.body is None:
+        if not self.body:
             # Woah, we didn't find any usable parts
             logger.debug('  No plain or patch parts found in message')
             logger.info('  Not plaintext: %s', self.full_subject)
diff --git a/src/b4/mbox.py b/src/b4/mbox.py
index 624a2f3..5e8093a 100644
--- a/src/b4/mbox.py
+++ b/src/b4/mbox.py
@@ -202,8 +202,6 @@ def make_am(msgs: List[EmailMessage], cmdargs: argparse.Namespace, msgid: str) -
         if cmdargs.cherrypick == '_':
             # We might want to pick a patch sent as a followup, so create a fake series
             # and add followups with diffs
-            if lser is None:
-                lser = b4.LoreSeries(revision=1, expected=1)
             for followup in lmbx.followups:
                 if followup.has_diff:
                     lser.add_patch(followup)
diff --git a/src/b4/pr.py b/src/b4/pr.py
index cb2ca76..939c1f5 100644
--- a/src/b4/pr.py
+++ b/src/b4/pr.py
@@ -84,7 +84,7 @@ def git_get_commit_id_from_repo_ref(repo: str, ref: str) -> Optional[str]:
 
 def parse_pr_data(msg: email.message.EmailMessage) -> Optional[b4.LoreMessage]:
     lmsg = b4.LoreMessage(msg)
-    if lmsg.body is None:
+    if not lmsg.body:
         logger.critical('Could not find a plain part in the message body')
         return None
 
diff --git a/src/b4/review/tracking.py b/src/b4/review/tracking.py
index e66cfd8..2b0d058 100644
--- a/src/b4/review/tracking.py
+++ b/src/b4/review/tracking.py
@@ -222,13 +222,14 @@ def record_take_branch(gitdir: str, branch: str) -> None:
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
index f30405d..536af2d 100644
--- a/src/b4/review_tui/_common.py
+++ b/src/b4/review_tui/_common.py
@@ -720,10 +720,6 @@ def gather_attestation_info(lser: b4.LoreSeries) -> Dict[str, Any]:
     apply_mismatches = 0
 
     if topdir:
-        # Ensure indexes are populated for applicability check
-        if lser.indexes is None:
-            lser.populate_indexes()
-
         if base_commit:
             base_exists = b4.git_commit_exists(topdir, base_commit)
 
diff --git a/src/b4/review_tui/_modals.py b/src/b4/review_tui/_modals.py
index 10bffb5..0cd80e1 100644
--- a/src/b4/review_tui/_modals.py
+++ b/src/b4/review_tui/_modals.py
@@ -2156,8 +2156,6 @@ class TargetBranchScreen(ModalScreen[Optional[str]]):
             ifh = io.BytesIO()
             b4.save_git_am_mbox(am_msgs, ifh)
             ambytes = ifh.getvalue()
-            if lser.indexes is None:
-                lser.populate_indexes()
             return lser, ambytes
 
     def _check_applicability(self, branch: str) -> None:
diff --git a/src/b4/review_tui/_review_app.py b/src/b4/review_tui/_review_app.py
index c6c926d..c14005b 100644
--- a/src/b4/review_tui/_review_app.py
+++ b/src/b4/review_tui/_review_app.py
@@ -1150,7 +1150,7 @@ class ReviewApp(CheckRunnerMixin, App[None]):
             result = b4.edit_in_editor(
                 editor_text.encode(), filehint='reply.b4-review.eml')
 
-        if result is None:
+        if not result:
             self.notify('Editor returned no content')
             return
         reply_text = result.decode(errors='replace')
@@ -1271,7 +1271,7 @@ class ReviewApp(CheckRunnerMixin, App[None]):
         with self.suspend():
             result = b4.edit_in_editor(editor_text.encode(), filehint='note.txt')
 
-        if result is None:
+        if not result:
             self.notify('Editor returned no content')
             return
         raw_text = result.decode(errors='replace')
diff --git a/src/b4/ty.py b/src/b4/ty.py
index 5786222..74c094a 100644
--- a/src/b4/ty.py
+++ b/src/b4/ty.py
@@ -460,9 +460,6 @@ def send_messages(listing: List[JsonDictT], branch: str, cmdargs: argparse.Names
             # This is a patch series
             msg = generate_am_thanks(gitdir, jsondata, branch, cmdargs)
 
-        if msg is None:
-            continue
-
         assert isinstance(jsondata['msgid'], str), 'msgid must be a string'
         msgids.append(jsondata['msgid'])
         assert isinstance(jsondata['patches'], list), 'patches must be a list'
diff --git a/src/tests/test_tui_modals.py b/src/tests/test_tui_modals.py
index e0e6f3f..6a608a9 100644
--- a/src/tests/test_tui_modals.py
+++ b/src/tests/test_tui_modals.py
@@ -84,7 +84,9 @@ class TestHelpScreen:
             await pilot.pause()
             # Should be back on the host screen
             assert not isinstance(app.screen, HelpScreen)
-            assert dismissed == [None]
+            # https://github.com/python/mypy/issues/9457:
+            # app.screen is stale-narrowed across await.
+            assert dismissed == [None]  # type: ignore[unreachable]
 
     @pytest.mark.asyncio
     async def test_question_mark_dismisses(self) -> None:
@@ -168,7 +170,9 @@ class TestConfirmScreen:
             await pilot.press('y')
             await pilot.pause()
             assert not isinstance(app.screen, ConfirmScreen)
-            assert results == [True]
+            # https://github.com/python/mypy/issues/9457:
+            # app.screen is stale-narrowed across await.
+            assert results == [True]  # type: ignore[unreachable]
 
     @pytest.mark.asyncio
     async def test_escape_cancels(self) -> None:
@@ -459,7 +463,9 @@ class TestPriorReviewScreen:
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
index 80004e8..103a7c3 100644
--- a/src/tests/test_tui_tracking.py
+++ b/src/tests/test_tui_tracking.py
@@ -934,7 +934,9 @@ class TestTrackingSnooze:
             assert not isinstance(app.screen, SnoozeScreen)
 
             # Verify DB was updated
-            conn = tracking.get_db(identifier)
+            # https://github.com/python/mypy/issues/9457:
+            # app.screen is stale-narrowed across await.
+            conn = tracking.get_db(identifier)  # type: ignore[unreachable]
             cursor = conn.execute(
                 'SELECT status, snoozed_until FROM series WHERE change_id = ?',
                 ('snooze-test-1',))
@@ -1930,7 +1932,9 @@ class TestTargetBranch:
             assert not isinstance(app.screen, TargetBranchScreen)
 
             # Verify DB cleared
-            conn = tracking.get_db(identifier)
+            # https://github.com/python/mypy/issues/9457:
+            # app.screen is stale-narrowed across await.
+            conn = tracking.get_db(identifier)  # type: ignore[unreachable]
             target = tracking.get_target_branch(conn, change_id)
             conn.close()
             assert target is None
@@ -2358,7 +2362,9 @@ class TestLoadSeriesCaching:
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

