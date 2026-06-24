Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED2139937C
	for <tools@linux.kernel.org>; Wed, 24 Jun 2026 08:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782291127; cv=none; b=puGVmAiaw/iEy/7Sh/6aHEqh0gN2QJ7HQ2B0kw77L+PkZ7VZHU4+UHCU7BUCYt14EU7tSsxqMQCxcuO/ty9I/YQwGy/+MaVcJe398USL0+iuFpdZ4VbARHlF25W0esxYzMoH38akNWGL3bPsHqcBcbwTxEqAeNw81E7BQ1rVvxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782291127; c=relaxed/simple;
	bh=3HegLkSzM+0WKgCS57qX3bwU0GQAkJLsBHgO8TlGPfo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XQnhpS2TJkCp1sGhlmWe4HifmTe/kkC8GrNK9duxjxfKQPKefVGdV5t3iKUOOhekOK3q6DKqpfvtJ+bniLqFH0fM9H23wbRSS8WnYq7d+vMBi3tkbnCqOF5n9OVCAs00JRh8LS/m9dnb33r/8+CS2EYTdmcqSKYd6CbWwCCNYzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J/TL1A0s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J/TL1A0s"
Received: by smtp.kernel.org (Postfix)
	id 9C9E11F00A3D; Wed, 24 Jun 2026 08:52:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0E871F000E9;
	Wed, 24 Jun 2026 08:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782291125;
	bh=uXG8M6OJIt5iKarYCUUDtD1Orvu84HW3l50a5R0a9+A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=J/TL1A0s7Xf0fOIkQGYse10dN0Q2l2gcrSbNj+Kw26U4YlILCB62DZVHIG8DAZPTX
	 Si1VIIqXxRcBzSb9/bQqG8CwudT69vPq8lAOAwS36aXimBnqsC832rl/p9G7PQ4QWW
	 z/R2/Sqsy+2LTzN5M9X/caa7Z0YRVueNGfBoota2hDyiROjbVrSI5sUkzgzSD9aI3c
	 aVyYWV5iwDotuzEGECZ6uE8JTm7SdP9hS1NC3BPCT6sd7rNopsaEGUHoPLPFs2w7xg
	 u3MnKQAX3cpkY82xb1op57ASmeVsojt2qpcQdw159+UtjrZk7yUHgTWfl9OUYlRhg+
	 jGDA2wviboocw==
From: Christian Brauner <brauner@kernel.org>
Date: Wed, 24 Jun 2026 10:51:59 +0200
Subject: [PATCH b4 v2 7/7] shazam: test the inline --resolve subshell flow
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-shazam-resolve-native-am-v2-7-97b3a1bc497a@kernel.org>
References: <20260624-shazam-resolve-native-am-v2-0-97b3a1bc497a@kernel.org>
In-Reply-To: <20260624-shazam-resolve-native-am-v2-0-97b3a1bc497a@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-cd519
X-Developer-Signature: v=1; a=openpgp-sha256; l=24004; i=brauner@kernel.org;
 h=from:subject:message-id; bh=3HegLkSzM+0WKgCS57qX3bwU0GQAkJLsBHgO8TlGPfo=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWRZz1p94HJp6m1B4XDbaa0Xv6mbTXBt23zm2JHWqXYVN
 zY9qW3d3lHKwiDGxSArpsji0G4SLrecp2KzUaYGzBxWJpAhDFycAjAR7g2MDM37XkyO5TsRecHr
 WdHZ2Ev31mr+2ya4bH/ewoZaqdVTX3xjZNg7Yck0g8NdW1RfJm5VXpujGOnSXGMrmp10OFlQepb
 LM34A
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Update the conflict-resolution tests for the subshell model. The two-phase
entry points (_begin_shazam_resolve, _load_shazam_state, shazam_continue,
shazam_abort) are gone, so drop the tests that drove them and the state-file
tests, and exercise b4.resolve_am_conflict_in_shell() directly with a
_suspend_to_shell stand-in that performs the in-worktree git actions a user
would type.

TestShazamResolveInline covers the three outcomes: the user resolves and runs
"git am --continue" (every patch survives the merge), leaves the shell with the
am unfinished (worktree torn down, no merge), and runs "git am --abort" after a
partial multi-patch apply (HEAD-vs-base catches "nothing applied", so no no-op
merge silently drops the series). Convert the subdir regression tests to the
same helper, and retarget the TUI tracking abort test from the removed
_resolve_worktree_am_conflict to b4.resolve_am_conflict_in_shell.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/tests/test_three_way_merge.py | 367 ++++++++++++--------------------------
 src/tests/test_tui_tracking.py    |   2 +-
 2 files changed, 112 insertions(+), 257 deletions(-)

diff --git a/src/tests/test_three_way_merge.py b/src/tests/test_three_way_merge.py
index 4db592e..acf5a08 100644
--- a/src/tests/test_three_way_merge.py
+++ b/src/tests/test_three_way_merge.py
@@ -1,7 +1,5 @@
-import argparse
-import json
 import os
-from typing import Any, Dict, Optional, Tuple
+from typing import Any, Callable, Tuple
 from unittest.mock import patch
 
 import pytest
@@ -260,11 +258,11 @@ class TestGitFetchAmIntoRepo:
 class TestSuspendToShellCwd:
     """Test that _suspend_to_shell passes cwd to subprocess.run."""
 
-    @patch('b4.tui._common.subprocess.run')
+    @patch('b4.subprocess.run')
     def test_cwd_passed_through(
         self, mock_run: Any, monkeypatch: pytest.MonkeyPatch
     ) -> None:
-        from b4.review_tui._common import _suspend_to_shell
+        from b4 import _suspend_to_shell
 
         # Use a shell name that is neither bash nor zsh so we hit
         # the simple else branch (no tempfile/rcfile logic).
@@ -276,11 +274,11 @@ class TestSuspendToShellCwd:
         _args, kwargs = mock_run.call_args
         assert kwargs.get('cwd') == '/tmp/test-worktree'
 
-    @patch('b4.tui._common.subprocess.run')
+    @patch('b4.subprocess.run')
     def test_cwd_none_by_default(
         self, mock_run: Any, monkeypatch: pytest.MonkeyPatch
     ) -> None:
-        from b4.review_tui._common import _suspend_to_shell
+        from b4 import _suspend_to_shell
 
         monkeypatch.setenv('SHELL', '/tmp/fakeshell')
 
@@ -290,11 +288,11 @@ class TestSuspendToShellCwd:
         _args, kwargs = mock_run.call_args
         assert kwargs.get('cwd') is None
 
-    @patch('b4.tui._common.subprocess.run')
+    @patch('b4.subprocess.run')
     def test_hint_appears_in_env(
         self, mock_run: Any, monkeypatch: pytest.MonkeyPatch
     ) -> None:
-        from b4.review_tui._common import _suspend_to_shell
+        from b4 import _suspend_to_shell
 
         monkeypatch.setenv('SHELL', '/tmp/fakeshell')
 
@@ -603,53 +601,13 @@ def _build_subdir_clean_3way(gitdir: str) -> bytes:
     return mbox.encode()
 
 
-def _make_shazam_state(common_dir: str, state: Optional[Dict[str, Any]] = None) -> str:
-    """Write a shazam state file; return its path."""
-    state_file = os.path.join(common_dir, 'b4-shazam-state.json')
-    if state is None:
-        state = {'origin': 'https://example.com', 'merge_flags': '--signoff'}
-    with open(state_file, 'w') as fh:
-        json.dump(state, fh)
-    return state_file
-
-
-class TestLoadShazamState:
-    """Tests for _load_shazam_state."""
-
-    def test_valid_state_loaded(self, gitdir: str) -> None:
-        common_dir = b4.git_get_common_dir(gitdir)
-        assert common_dir is not None
-        state_file = _make_shazam_state(common_dir)
-        try:
-            _topdir, _cdir, sf, loaded = b4.mbox._load_shazam_state(require_state=True)
-            assert loaded == {
-                'origin': 'https://example.com',
-                'merge_flags': '--signoff',
-            }
-            assert sf == state_file
-        finally:
-            os.unlink(state_file)
-
-    def test_missing_state_exits(self, gitdir: str) -> None:
-        with pytest.raises(SystemExit) as exc_info:
-            b4.mbox._load_shazam_state(require_state=True)
-        assert exc_info.value.code == 1
-
-    def test_optional_state_returns_none(self, gitdir: str) -> None:
-        _topdir, _cdir, _sf, loaded = b4.mbox._load_shazam_state(require_state=False)
-        assert loaded is None
-
-
-def _trigger_am_conflict(
-    gitdir: str,
-) -> Tuple[b4.AmConflictError, Dict[str, Any]]:
+def _trigger_am_conflict(gitdir: str) -> Tuple[b4.AmConflictError, str]:
     """Run a conflicting multi-patch git-am inside the shazam worktree.
 
     Applying onto HEAD (which carries master's conflicting file1 rewrite) makes
     patch 3 fail, so git_fetch_am_into_repo raises and leaves the in-progress
-    git-am parked in the worktree -- exactly the state the real shazam flow
-    hands to ``--resolve``. Returns (the error, a state dict for
-    _begin_shazam_resolve).
+    git-am parked in the worktree -- exactly the state ``b4 shazam --resolve``
+    hands to the subshell. Returns (the error, the am's base commit).
     """
     ambytes, _base = _build_multi_patch_conflict(gitdir)
     _ecode, head = b4.git_run_command(gitdir, ['rev-parse', 'HEAD'])
@@ -657,73 +615,59 @@ def _trigger_am_conflict(
         b4.git_fetch_am_into_repo(
             gitdir, ambytes, at_base='HEAD', am_flags=['-3'], resolve=True
         )
-    state = {
-        'worktree': exc_info.value.worktree_path,
-        'base': head.strip(),
-        'origin': 'https://example.com',
-        'merge_template_values': {},
-        'merge_template': 'Merge test series\n\nResolved conflict.\n',
-        'merge_flags': '--signoff',
-        'no_interactive': True,
-        'do_merge': True,
-    }
-    return exc_info.value, state
+    return exc_info.value, head.strip()
 
 
-class TestBeginShazamResolve:
-    """``b4 shazam --resolve`` hands the conflicted git-am back to the user."""
+def _resolve_in_shell(actions: Callable[[str], None]) -> Callable[..., None]:
+    """Build a _suspend_to_shell stand-in that drives the conflict worktree.
 
-    def test_keeps_worktree_and_writes_state(self, gitdir: str) -> None:
-        common_dir = b4.git_get_common_dir(gitdir)
-        assert common_dir is not None
-        cex, state = _trigger_am_conflict(gitdir)
-
-        # Saves state and exits, leaving the in-progress git-am untouched.
-        with pytest.raises(SystemExit) as exit_info:
-            b4.mbox._begin_shazam_resolve(cex, common_dir, state)
-        assert exit_info.value.code == 1
-
-        state_file = os.path.join(common_dir, 'b4-shazam-state.json')
-        assert os.path.exists(state_file)
-        with open(state_file) as fh:
-            assert json.load(fh)['worktree'] == cex.worktree_path
+    resolve_am_conflict_in_shell calls _suspend_to_shell(hint=..., cwd=<worktree>,
+    ...) then inspects the worktree. Patching it with this stand-in runs
+    *actions(worktree)* in place of the interactive shell -- i.e. whatever the user
+    would type (resolve + ``git am --continue``, ``git am --abort``, or nothing).
+    """
 
-        # The worktree (and its git-am) must survive for the user to finish.
-        assert os.path.isdir(cex.worktree_path)
-        assert b4._worktree_rebase_apply_dir(cex.worktree_path) is not None
-        # sparse-checkout disabled -> the conflicted file is materialized.
-        assert os.path.exists(os.path.join(cex.worktree_path, 'file1.txt'))
+    def _side_effect(*_args: Any, **kwargs: Any) -> None:
+        actions(kwargs['cwd'])
 
-        b4.git_run_command(gitdir, ['worktree', 'remove', '--force', cex.worktree_path])
-        os.unlink(state_file)
+    return _side_effect
 
 
-class TestShazamResolveContinue:
-    """The lossless --resolve -> git am --continue -> shazam --continue flow."""
+class TestShazamResolveInline:
+    """``b4 shazam --resolve`` resolves the conflict inline via a subshell."""
 
-    def test_continue_merges_and_keeps_every_patch(self, gitdir: str) -> None:
-        common_dir = b4.git_get_common_dir(gitdir)
-        assert common_dir is not None
-        cex, state = _trigger_am_conflict(gitdir)
+    def test_resolve_merges_and_keeps_every_patch(self, gitdir: str) -> None:
+        cex, _base = _trigger_am_conflict(gitdir)
         wt = cex.worktree_path
 
-        with pytest.raises(SystemExit):
-            b4.mbox._begin_shazam_resolve(cex, common_dir, state)
+        def finish_am(worktree: str) -> None:
+            with open(os.path.join(worktree, 'file1.txt'), 'w') as fh:
+                fh.write('Resolved file1.\n')
+            b4.git_run_command(worktree, ['add', 'file1.txt'], rundir=worktree)
+            ecode, _out = b4.git_run_command(
+                worktree, ['am', '--continue'], rundir=worktree
+            )
+            assert ecode == 0
 
-        # User finishes the git-am natively in the worktree.
-        with open(os.path.join(wt, 'file1.txt'), 'w') as fh:
-            fh.write('Resolved file1.\n')
-        b4.git_run_command(wt, ['add', 'file1.txt'], logstderr=True, rundir=wt)
-        ecode, _out = b4.git_run_command(
-            wt, ['am', '--continue'], logstderr=True, rundir=wt
-        )
-        assert ecode == 0
-        assert b4._worktree_rebase_apply_dir(wt) is None
+        with patch('b4._suspend_to_shell', side_effect=_resolve_in_shell(finish_am)):
+            ok = b4.resolve_am_conflict_in_shell(
+                gitdir, cex, origin='https://example.com'
+            )
+        # Success: the worktree is gone and the series sits in FETCH_HEAD.
+        assert ok is True
+        assert not os.path.exists(wt)
 
-        # b4 shazam --continue fetches and merges; under pytest _run_shazam_merge
-        # runs the merge captured and exits with its return code.
+        # Merge it exactly like the clean shazam path would (under pytest
+        # _run_shazam_merge runs the merge captured and exits with its code).
         with pytest.raises(SystemExit) as exit_info:
-            b4.mbox.shazam_continue(argparse.Namespace())
+            b4.mbox._run_shazam_merge(
+                gitdir,
+                merge_template='Merge test series\n\nResolved conflict.\n',
+                tptvals={},
+                merge_flags='--signoff',
+                no_interactive=True,
+                do_merge=True,
+            )
         assert exit_info.value.code == 0
 
         # A real two-parent merge commit resulted...
@@ -740,83 +684,54 @@ class TestShazamResolveContinue:
         ecode, file1 = b4.git_run_command(gitdir, ['show', 'HEAD:file1.txt'])
         assert ecode == 0 and 'Resolved file1.' in file1
 
-        # State and worktree cleaned up.
-        assert not os.path.exists(os.path.join(common_dir, 'b4-shazam-state.json'))
-        assert not os.path.exists(wt)
-
-    def test_continue_refuses_while_am_unfinished(self, gitdir: str) -> None:
-        common_dir = b4.git_get_common_dir(gitdir)
-        assert common_dir is not None
-        cex, state = _trigger_am_conflict(gitdir)
+    def test_resolve_unfinished_am_tears_down(self, gitdir: str) -> None:
+        # Leaving the shell with the git-am still parked is treated as "gave up":
+        # the worktree is torn down and no merge happens.
+        cex, _base = _trigger_am_conflict(gitdir)
         wt = cex.worktree_path
+        _e, head_before = b4.git_run_command(gitdir, ['rev-parse', 'HEAD'])
 
-        with pytest.raises(SystemExit):
-            b4.mbox._begin_shazam_resolve(cex, common_dir, state)
-
-        # git-am is still mid-flight -> --continue must refuse and keep state.
-        with pytest.raises(SystemExit) as exit_info:
-            b4.mbox.shazam_continue(argparse.Namespace())
-        assert exit_info.value.code == 1
-        assert os.path.exists(os.path.join(common_dir, 'b4-shazam-state.json'))
-        assert os.path.isdir(wt)
+        def do_nothing(_worktree: str) -> None:
+            pass
 
-        b4.git_run_command(gitdir, ['worktree', 'remove', '--force', wt])
-        os.unlink(os.path.join(common_dir, 'b4-shazam-state.json'))
+        with patch('b4._suspend_to_shell', side_effect=_resolve_in_shell(do_nothing)):
+            ok = b4.resolve_am_conflict_in_shell(gitdir, cex)
+        assert ok is False
+        assert not os.path.exists(wt)
+        _e, head_after = b4.git_run_command(gitdir, ['rev-parse', 'HEAD'])
+        assert head_after.strip() == head_before.strip()
 
-    def test_continue_refuses_after_am_abort(self, gitdir: str) -> None:
-        # Regression: if the user runs "git am --abort" instead of finishing,
-        # the worktree is back at base with no rebase-apply. --continue must
-        # refuse rather than merge the bare base -- a no-op ("Already up to
-        # date") that would silently drop the whole series and report success.
-        common_dir = b4.git_get_common_dir(gitdir)
-        assert common_dir is not None
-        cex, state = _trigger_am_conflict(gitdir)
+    def test_resolve_aborted_am_tears_down(self, gitdir: str) -> None:
+        # Regression: "git am --abort" after a partial multi-patch apply resets the
+        # worktree HEAD all the way back to base. The HEAD-vs-base check must catch
+        # that as "nothing applied" (a before/after-HEAD compare would not), so we
+        # refuse rather than merge a no-op that silently drops the whole series.
+        cex, _base = _trigger_am_conflict(gitdir)
         wt = cex.worktree_path
+        _e, head_before = b4.git_run_command(gitdir, ['rev-parse', 'HEAD'])
 
-        with pytest.raises(SystemExit):
-            b4.mbox._begin_shazam_resolve(cex, common_dir, state)
-
-        # User gives up with "git am --abort" in the worktree.
-        ecode, _out = b4.git_run_command(wt, ['am', '--abort'], rundir=wt)
-        assert ecode == 0
-        assert b4._worktree_rebase_apply_dir(wt) is None
+        def abort_am(worktree: str) -> None:
+            ecode, _out = b4.git_run_command(
+                worktree, ['am', '--abort'], rundir=worktree
+            )
+            assert ecode == 0
 
-        # --continue refuses (nothing applied), keeping state + worktree, and
-        # makes NO commit on the branch.
-        _e, head_before = b4.git_run_command(gitdir, ['rev-parse', 'HEAD'])
-        with pytest.raises(SystemExit) as exit_info:
-            b4.mbox.shazam_continue(argparse.Namespace())
-        assert exit_info.value.code == 1
-        assert os.path.exists(os.path.join(common_dir, 'b4-shazam-state.json'))
-        assert os.path.isdir(wt)
+        with patch('b4._suspend_to_shell', side_effect=_resolve_in_shell(abort_am)):
+            ok = b4.resolve_am_conflict_in_shell(gitdir, cex)
+        assert ok is False
+        assert not os.path.exists(wt)
+        # No commit was made on the branch.
         _e, head_after = b4.git_run_command(gitdir, ['rev-parse', 'HEAD'])
         assert head_after.strip() == head_before.strip()
 
-        b4.git_run_command(gitdir, ['worktree', 'remove', '--force', wt])
-        os.unlink(os.path.join(common_dir, 'b4-shazam-state.json'))
-
-
-class TestShazamAbort:
-    """Tests for shazam_abort cleanup."""
-
-    def test_cleans_up_state_and_worktree(self, gitdir: str) -> None:
-        common_dir = b4.git_get_common_dir(gitdir)
-        assert common_dir is not None
-        cex, state = _trigger_am_conflict(gitdir)
-
-        with pytest.raises(SystemExit):
-            b4.mbox._begin_shazam_resolve(cex, common_dir, state)
-
-        b4.mbox.shazam_abort(argparse.Namespace())
-
-        assert not os.path.exists(cex.worktree_path)
-        assert not os.path.exists(os.path.join(common_dir, 'b4-shazam-state.json'))
-        # Nothing left dangling in the main tree.
-        assert not os.path.exists(os.path.join(gitdir, '.git', 'MERGE_HEAD'))
-
-    def test_noop_when_nothing_to_clean(self, gitdir: str) -> None:
-        # Should not raise.
-        b4.mbox.shazam_abort(argparse.Namespace())
+    def test_conflict_pins_am_base_commit(self, gitdir: str) -> None:
+        # Regression for the silent-drop bug: the am's base must be pinned on the
+        # AmConflictError when the conflict is raised (while the worktree HEAD
+        # still points at base), not re-derived from a symbolic 'HEAD' against the
+        # worktree later -- by then git-am has advanced HEAD to the applied tip, so
+        # a *successful* resolve would otherwise be misread as "nothing applied".
+        cex, base = _trigger_am_conflict(gitdir)
+        assert cex.base_sha == base
 
 
 class TestSubdirConflictResolve:
@@ -829,9 +744,8 @@ class TestSubdirConflictResolve:
     """
 
     def test_subdir_conflict_records_markers_and_keeps_patch(self, gitdir: str) -> None:
-        common_dir = b4.git_get_common_dir(gitdir)
-        assert common_dir is not None
         ambytes = _build_subdir_conflict(gitdir)
+        _e, _base = b4.git_run_command(gitdir, ['rev-parse', 'HEAD'])
 
         with pytest.raises(b4.AmConflictError) as exc_info:
             b4.git_fetch_am_into_repo(
@@ -847,27 +761,31 @@ class TestSubdirConflictResolve:
         )
         assert 'drivers/foo.txt' in unmerged
 
-        state = {
-            'worktree': wt,
-            'origin': 'https://example.com',
-            'merge_template_values': {},
-            'merge_template': 'Merge series\n\nResolved.\n',
-            'merge_flags': '--signoff',
-            'no_interactive': True,
-            'do_merge': True,
-        }
-        with pytest.raises(SystemExit):
-            b4.mbox._begin_shazam_resolve(exc_info.value, common_dir, state)
+        def finish(worktree: str) -> None:
+            with open(os.path.join(worktree, 'drivers', 'foo.txt'), 'w') as fh:
+                fh.write('1\nRESOLVED\n3\n')
+            b4.git_run_command(worktree, ['add', 'drivers/foo.txt'], rundir=worktree)
+            ecode, _out = b4.git_run_command(
+                worktree, ['am', '--continue'], rundir=worktree
+            )
+            assert ecode == 0
 
-        # User resolves the subdir conflict natively and finishes the git-am.
-        with open(os.path.join(wt, 'drivers', 'foo.txt'), 'w') as fh:
-            fh.write('1\nRESOLVED\n3\n')
-        b4.git_run_command(wt, ['add', 'drivers/foo.txt'], rundir=wt)
-        ecode, _out = b4.git_run_command(wt, ['am', '--continue'], rundir=wt)
-        assert ecode == 0
+        with patch('b4._suspend_to_shell', side_effect=_resolve_in_shell(finish)):
+            ok = b4.resolve_am_conflict_in_shell(
+                gitdir, exc_info.value, origin='https://example.com'
+            )
+        assert ok is True
+        assert not os.path.exists(wt)
 
         with pytest.raises(SystemExit) as exit_info:
-            b4.mbox.shazam_continue(argparse.Namespace())
+            b4.mbox._run_shazam_merge(
+                gitdir,
+                merge_template='Merge series\n\nResolved.\n',
+                tptvals={},
+                merge_flags='--signoff',
+                no_interactive=True,
+                do_merge=True,
+            )
         assert exit_info.value.code == 0
 
         # Both patches survived: patch 1 (file2) and patch 2 (drivers/foo).
@@ -876,9 +794,6 @@ class TestSubdirConflictResolve:
         ecode, foo = b4.git_run_command(gitdir, ['show', 'HEAD:drivers/foo.txt'])
         assert ecode == 0 and 'RESOLVED' in foo
 
-        assert not os.path.exists(os.path.join(common_dir, 'b4-shazam-state.json'))
-        assert not os.path.exists(wt)
-
 
 class TestSubdirCleanThreeWay:
     """Regression: a clean 3-way in a subdir file must not be a phantom conflict.
@@ -906,63 +821,3 @@ class TestSubdirCleanThreeWay:
 
         # Worktree torn down, nothing parked for resolution.
         assert not os.path.exists(os.path.join(common_dir, 'b4-shazam-worktree'))
-        assert not os.path.exists(os.path.join(common_dir, 'b4-shazam-state.json'))
-
-
-class TestCorruptShazamState:
-    """A corrupt state file must not crash the recovery command."""
-
-    def test_abort_survives_corrupt_state(self, gitdir: str) -> None:
-        common_dir = b4.git_get_common_dir(gitdir)
-        assert common_dir is not None
-        state_file = os.path.join(common_dir, 'b4-shazam-state.json')
-        with open(state_file, 'w') as fh:
-            fh.write('{ this is not valid json')
-        # Cleans up the corrupt file instead of raising JSONDecodeError.
-        b4.mbox.shazam_abort(argparse.Namespace())
-        assert not os.path.exists(state_file)
-
-    def test_continue_refuses_corrupt_state(self, gitdir: str) -> None:
-        common_dir = b4.git_get_common_dir(gitdir)
-        assert common_dir is not None
-        state_file = os.path.join(common_dir, 'b4-shazam-state.json')
-        with open(state_file, 'w') as fh:
-            fh.write('{ this is not valid json')
-        with pytest.raises(SystemExit) as exit_info:
-            b4.mbox.shazam_continue(argparse.Namespace())
-        assert exit_info.value.code == 1
-        os.unlink(state_file)
-
-
-class TestContinueDirtyTree:
-    """shazam --continue refuses (keeping state) when the main tree is dirty."""
-
-    def test_continue_refuses_dirty_tree(self, gitdir: str) -> None:
-        common_dir = b4.git_get_common_dir(gitdir)
-        assert common_dir is not None
-        cex, state = _trigger_am_conflict(gitdir)
-        wt = cex.worktree_path
-        with pytest.raises(SystemExit):
-            b4.mbox._begin_shazam_resolve(cex, common_dir, state)
-
-        # Finish the git-am in the worktree.
-        with open(os.path.join(wt, 'file1.txt'), 'w') as fh:
-            fh.write('Resolved file1.\n')
-        b4.git_run_command(wt, ['add', 'file1.txt'], rundir=wt)
-        ecode, _out = b4.git_run_command(wt, ['am', '--continue'], rundir=wt)
-        assert ecode == 0
-
-        # Dirty the main tree, then --continue must refuse and keep state/worktree
-        # so it stays re-runnable.
-        with open(os.path.join(gitdir, 'file2.txt'), 'a') as fh:
-            fh.write('uncommitted local edit\n')
-        state_file = os.path.join(common_dir, 'b4-shazam-state.json')
-        with pytest.raises(SystemExit) as exit_info:
-            b4.mbox.shazam_continue(argparse.Namespace())
-        assert exit_info.value.code == 1
-        assert os.path.exists(state_file)
-        assert os.path.isdir(wt)
-
-        b4.git_run_command(gitdir, ['checkout', '--', 'file2.txt'])
-        b4.git_run_command(gitdir, ['worktree', 'remove', '--force', wt])
-        os.unlink(state_file)
diff --git a/src/tests/test_tui_tracking.py b/src/tests/test_tui_tracking.py
index 0c716b7..caacd3e 100644
--- a/src/tests/test_tui_tracking.py
+++ b/src/tests/test_tui_tracking.py
@@ -3275,7 +3275,7 @@ class TestUpdateRevisionWorkflow:
                 patch('b4.review_tui._tracking_app._wait_for_enter'),
                 patch('b4.git_fetch_am_into_repo', side_effect=conflict),
                 patch(
-                    'b4.review_tui._tracking_app._resolve_worktree_am_conflict',
+                    'b4.resolve_am_conflict_in_shell',
                     return_value=False,
                 ),
             ):

-- 
2.53.0

