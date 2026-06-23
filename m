Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4A83090C2
	for <tools@linux.kernel.org>; Tue, 23 Jun 2026 16:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782230500; cv=none; b=fBg4HW/DX/YliscH2uyVSJdPuVk0mHDeHOtg+u2ZUxn4C++arQpF1E2v6U3mYF5ZxLPVqwm8FKrKGbv7ODPD958EciNdloGUkZv8RgV/+GXahtznsF+Vh1y8z7SBG3po1bBrMYdHIH7j/IdOO8dddK7IsaOY5mkJYgRwEL1RVsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782230500; c=relaxed/simple;
	bh=qs6n9+to+L1GrF1RXxbcwF26eZaycLo/8SMfdk0G7O0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g/RbrUS8iIhwEDXODPp7tEjyHZKulOWw5zP/l8S+tpvKMg/fvacmoxcQl6PxklTz40upccJ8XRPBVFSrfRGDuu9N1u3nt/76J1XMwdJoVG4nL9bVsplV7J2REg1DI459lMCvK1zwGGZdY9I5eY5pKkeBl8GmeNV+vDqC+xxPt+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A/xTNtuR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A/xTNtuR"
Received: by smtp.kernel.org (Postfix)
	id 5B8431F00A3A; Tue, 23 Jun 2026 16:01:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76DFA1F000E9;
	Tue, 23 Jun 2026 16:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782230499;
	bh=OEe42RpRxSv81fJjavZmZsdC20CuuPZlJOBAyjx9EFY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=A/xTNtuRXx9HH0OxVojbjTWkYk4RawV/qwVUzy73OR33nqdbNEa5HKBu2OI88AjmH
	 rzX4vOdJBlrCc5fSxZk9Do2HjNBVkhDzI/NFcCYzCvS7J7j63YogoHN7LcbFRY1vMI
	 GQF0wcmS2XFX12rlM9sMwruzCZKUUzuG1UYNIj3EqBGzTaGqDW8JWzKsMH9yv7sXxD
	 p3RBCVU1S4p5fMUozh+hHX8khDnvE+5atRc5Kq/5vux8mh0gQnO2RzK3gffH8UrJsQ
	 fTf5bSnjvP7/mACnP+WvF+IuGymRAmiSOzwnLvitHRvsYDPCXadZvFN7ZCE69GBfzn
	 YtA73ZLpw6otA==
From: Christian Brauner <brauner@kernel.org>
Date: Tue, 23 Jun 2026 18:01:31 +0200
Subject: [PATCH b4 3/6] review-tui: test cross-worktree takes
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-20260623-review-tui-take-am-worktree-v1-3-e8a2140a287e@kernel.org>
References: <20260623-20260623-review-tui-take-am-worktree-v1-0-e8a2140a287e@kernel.org>
In-Reply-To: <20260623-20260623-review-tui-take-am-worktree-v1-0-e8a2140a287e@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-50a61
X-Developer-Signature: v=1; a=openpgp-sha256; l=10474; i=brauner@kernel.org;
 h=from:subject:message-id; bh=qs6n9+to+L1GrF1RXxbcwF26eZaycLo/8SMfdk0G7O0=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWRZrb0naLvq4BNN9aC857rXtJS29V21fs73Y9GGps4H7
 45YZzO+7ChlYRDjYpAVU2RxaDcJl1vOU7HZKFMDZg4rE8gQBi5OAZhIYyDD/8Df7abXBYzD/TsN
 y48q5XKsLbrMXKRa5HairYBt3RIGJYb//rJb7jBe6D1x6P0s/YzPq40jlq62eXL7oUILezzPt5d
 ZLAA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Cover the shared worktree resolution and the take->am path:

- _take_worktree(): reuses an existing worktree that holds the target and
  leaves it in place, creates and tears down a throwaway when the target is
  checked out nowhere, and honors keep() for an unfinished am.
- _do_take_am(): applies onto a target checked out in another worktree (the
  reported failure) and via a throwaway when it is not, asserting in both
  cases that the patch lands on the target and the current checkout is left
  untouched. The mbox is a real, cleanly-applying format-patch and
  _prepare_am_messages is stubbed, so there is no network or lore access.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/tests/test_tui_tracking.py | 190 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 190 insertions(+)

diff --git a/src/tests/test_tui_tracking.py b/src/tests/test_tui_tracking.py
index 4950dbd..f21b98d 100644
--- a/src/tests/test_tui_tracking.py
+++ b/src/tests/test_tui_tracking.py
@@ -13,6 +13,7 @@ status transitions, and modal interactions.
 
 import datetime
 import email.message
+import os
 import pathlib
 from typing import Any, Dict, List, Optional
 from unittest.mock import patch
@@ -38,6 +39,7 @@ from b4.review_tui._tracking_app import (
     TrackedSeriesItem,
     TrackingApp,
     _shazam_merge_flags,
+    _take_worktree,
     _worktree_for_branch,
 )
 
@@ -3583,3 +3585,191 @@ class TestLoadSeriesCaching:
             await pilot.pause()
             assert len(app._all_series) == 1
             assert app._all_series[0].get('snoozed_until') == snoozed_until
+
+
+# ---------------------------------------------------------------------------
+# Cross-worktree takes (merge + am share _take_worktree)
+# ---------------------------------------------------------------------------
+
+
+def _canned_am_patch(gitdir: str, tmp_path: pathlib.Path, fname: str) -> bytes:
+    """Build a real, cleanly-applying mbox (adds *fname*) via git format-patch.
+
+    Uses a detached worktree so it works even though master is checked out in
+    the main worktree; the patch adds a brand-new file so it applies on any
+    base without conflicts.
+    """
+    wt = str(tmp_path / f'patchgen-{fname}')
+    ecode, _ = b4.git_run_command(gitdir, ['worktree', 'add', '--detach', wt, 'master'])
+    assert ecode == 0
+    try:
+        (pathlib.Path(wt) / fname).write_text('hello from take\n')
+        b4.git_run_command(wt, ['add', fname])
+        ecode, _ = b4.git_run_command(wt, ['commit', '-m', f'add {fname}'])
+        assert ecode == 0
+        ecode, patch = b4.git_run_command(wt, ['format-patch', '-1', '--stdout'])
+        assert ecode == 0
+    finally:
+        b4.git_run_command(gitdir, ['worktree', 'remove', '--force', wt])
+    return patch.encode()
+
+
+class TestTakeWorktreeHelper:
+    """The shared _take_worktree picks the right worktree and cleans up.
+
+    Both take paths (merge and am) route through this, so a target that is
+    checked out elsewhere is applied there, an unchecked-out target gets a
+    throwaway worktree, and the current checkout is never touched.
+    """
+
+    def test_uses_existing_worktree_and_leaves_it(
+        self, gitdir: str, tmp_path: pathlib.Path
+    ) -> None:
+        b4.git_run_command(gitdir, ['branch', 'target', 'master'])
+        linked = str(tmp_path / 'target-wt')
+        ecode, _ = b4.git_run_command(gitdir, ['worktree', 'add', linked, 'target'])
+        assert ecode == 0
+        with _take_worktree(gitdir, 'target') as wt:
+            assert wt is not None
+            assert not wt.is_temp
+            assert os.path.realpath(wt.path) == os.path.realpath(linked)
+        # An existing worktree must survive the context.
+        assert os.path.isdir(linked)
+
+    def test_creates_and_removes_throwaway(self, gitdir: str) -> None:
+        b4.git_run_command(gitdir, ['branch', 'target', 'master'])
+        common_dir = b4.git_get_common_dir(gitdir)
+        assert common_dir
+        throwaway = os.path.join(common_dir, 'b4-take-worktree')
+        with _take_worktree(gitdir, 'target') as wt:
+            assert wt is not None
+            assert wt.is_temp
+            assert os.path.realpath(wt.path) == os.path.realpath(throwaway)
+            assert os.path.isdir(throwaway)
+        # The throwaway is torn down on exit.
+        assert not os.path.isdir(throwaway)
+
+    def test_keep_preserves_throwaway(self, gitdir: str) -> None:
+        b4.git_run_command(gitdir, ['branch', 'target', 'master'])
+        common_dir = b4.git_get_common_dir(gitdir)
+        assert common_dir
+        throwaway = os.path.join(common_dir, 'b4-take-worktree')
+        with _take_worktree(gitdir, 'target') as wt:
+            assert wt is not None and wt.is_temp
+            wt.keep()
+        # keep() leaves an unfinished worktree in place for the user.
+        assert os.path.isdir(throwaway)
+
+
+class TestAmTakeWorktree:
+    """Regression: take->am must apply in the target branch's worktree.
+
+    Reported failure: applying a series to a branch already checked out in
+    another worktree died with "fatal: '<branch>' is already used by worktree
+    ...".  The am path now mirrors the merge path and never checks out the
+    target in the current worktree.
+    """
+
+    def _run_am(self, gitdir: str, target_branch: str, ambytes: bytes) -> None:
+        from types import SimpleNamespace
+
+        change_id = 'am-wt-1'
+        review_branch = _create_review_branch(gitdir, change_id, status='reviewing')
+        app = TrackingApp.__new__(TrackingApp)
+        app._identifier = None  # type: ignore[attr-defined]
+        app._selected_series = {}  # type: ignore[attr-defined]
+        app._prepare_am_messages = lambda *a, **k: ambytes  # type: ignore[method-assign]
+        take_screen: Any = SimpleNamespace(
+            target_result=target_branch,
+            add_signoff=False,
+            add_link=False,
+            accept_series=False,
+        )
+        with patch('b4.review_tui._tracking_app._wait_for_enter'):
+            app._do_take_am(
+                change_id, review_branch, take_screen, {'subject': 'x'}, None
+            )
+
+    def test_applies_to_target_in_other_worktree(
+        self, gitdir: str, tmp_path: pathlib.Path
+    ) -> None:
+        # Target checked out in a *separate* worktree -- the reported failure.
+        b4.git_run_command(gitdir, ['branch', 'vfs.fixes', 'master'])
+        linked = str(tmp_path / 'vfs.fixes-wt')
+        ecode, _ = b4.git_run_command(gitdir, ['worktree', 'add', linked, 'vfs.fixes'])
+        assert ecode == 0
+
+        ecode, head_before = b4.git_run_command(gitdir, ['rev-parse', 'HEAD'])
+        ecode, branch_before = b4.git_run_command(
+            gitdir, ['rev-parse', '--abbrev-ref', 'HEAD']
+        )
+
+        ambytes = _canned_am_patch(gitdir, tmp_path, 'takefile.txt')
+        self._run_am(gitdir, 'vfs.fixes', ambytes)
+
+        # The patch landed on vfs.fixes...
+        ecode, subj = b4.git_run_command(
+            gitdir, ['log', '-1', '--format=%s', 'vfs.fixes']
+        )
+        assert ecode == 0 and subj.strip() == 'add takefile.txt'
+        # ...without disturbing the current checkout.
+        ecode, head_after = b4.git_run_command(gitdir, ['rev-parse', 'HEAD'])
+        assert head_after.strip() == head_before.strip()
+        ecode, branch_after = b4.git_run_command(
+            gitdir, ['rev-parse', '--abbrev-ref', 'HEAD']
+        )
+        assert branch_after.strip() == branch_before.strip()
+
+    def test_applies_via_throwaway_when_not_checked_out(
+        self, gitdir: str, tmp_path: pathlib.Path
+    ) -> None:
+        # Target exists but is checked out nowhere -> throwaway worktree.
+        b4.git_run_command(gitdir, ['branch', 'vfs.fixes', 'master'])
+        ecode, head_before = b4.git_run_command(gitdir, ['rev-parse', 'HEAD'])
+
+        ambytes = _canned_am_patch(gitdir, tmp_path, 'takefile.txt')
+        self._run_am(gitdir, 'vfs.fixes', ambytes)
+
+        ecode, subj = b4.git_run_command(
+            gitdir, ['log', '-1', '--format=%s', 'vfs.fixes']
+        )
+        assert ecode == 0 and subj.strip() == 'add takefile.txt'
+        # Current checkout untouched and the throwaway worktree is gone.
+        ecode, head_after = b4.git_run_command(gitdir, ['rev-parse', 'HEAD'])
+        assert head_after.strip() == head_before.strip()
+        common_dir = b4.git_get_common_dir(gitdir)
+        assert common_dir
+        assert not os.path.isdir(os.path.join(common_dir, 'b4-take-worktree'))
+
+    def test_applies_into_main_worktree_from_other_cwd(
+        self, gitdir: str, tmp_path: pathlib.Path
+    ) -> None:
+        # Regression: target checked out in the MAIN worktree while b4 is driven
+        # from a different cwd. git_run_command targets a primary worktree via
+        # --git-dir (not -C), so the apply must anchor its cwd (rundir) to the
+        # target worktree, else git-am writes the patched files into the wrong
+        # one -- committing to the branch but leaving the target worktree dirty.
+        side = str(tmp_path / 'side-wt')
+        b4.git_run_command(gitdir, ['branch', 'sidebr', 'master'])
+        ecode, _ = b4.git_run_command(gitdir, ['worktree', 'add', side, 'sidebr'])
+        assert ecode == 0
+
+        ambytes = _canned_am_patch(gitdir, tmp_path, 'takefile.txt')
+
+        olddir = os.getcwd()
+        os.chdir(side)
+        try:
+            self._run_am(gitdir, 'master', ambytes)
+        finally:
+            os.chdir(olddir)
+
+        # The patch landed on master, written into the MAIN worktree...
+        ecode, subj = b4.git_run_command(gitdir, ['log', '-1', '--format=%s', 'master'])
+        assert ecode == 0 and subj.strip() == 'add takefile.txt'
+        assert os.path.isfile(os.path.join(gitdir, 'takefile.txt'))
+        # ...not leaked into the driving worktree, and the target stays clean.
+        assert not os.path.isfile(os.path.join(side, 'takefile.txt'))
+        ecode, status = b4.git_run_command(
+            gitdir, ['status', '--porcelain', '--untracked-files=no']
+        )
+        assert ecode == 0 and status.strip() == ''

-- 
2.53.0

