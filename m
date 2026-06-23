Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F57C3A5E7A
	for <tools@linux.kernel.org>; Tue, 23 Jun 2026 20:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782246873; cv=none; b=hvMOk2/ehI+XcAzumVKu+i4tKI7mSVlqiwSXDP6Nog1rgZIYKWszCS1ZOAPs8w6viWnb7uisHlKxleR6TG1nlu6ADJP3iggswEjYkRIk7SJYGPOisLFZP7tS29Z2hafAj7EwaGz2a5jwAz0houGJLAoSHeEySC89fF1+8BCgVeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782246873; c=relaxed/simple;
	bh=Ssc+V1HSTFr88a4JejUYCfbIyMmgODT4EcIqm3OAH1Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mHVbmGmI9DMg72CYfpU4isQBAaBivErR3EzyabrdeyOcS1rgoAUOMCupLgJai4sUqBFV81+r5wADDyYnZbGPd0nZmYwWYRG0OX/zETSeV3BlJNxX1wT90ru0nDlr6n8LpK2glCDpZ/yW3vAlJ5ElloO3ieCfmXoMQVrJaTz5ttY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O8MbEO9i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O8MbEO9i"
Received: by smtp.kernel.org (Postfix)
	id 430C81F00A3D; Tue, 23 Jun 2026 20:34:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68B3D1F000E9;
	Tue, 23 Jun 2026 20:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782246872;
	bh=HqW75+krLpxbyWIKf3p7IiavNiqnt+RVALvqB8blT18=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=O8MbEO9i5eT9q9sE+1aSomxkY6AXWH25f/yVxQMpufkAFtQbz+YUQ4oAZ/UVdC7EB
	 fzLLVNuqjqdULGHWQArM7fXQtND9viEIjx2u697Tuo4XJzkPCdvBT6O7a6rgfUa1e5
	 pOp/tztDUshg1tXQF1SCeeXyajSu0VuA2RW/2hMgX14mhj0jKwpuDCk6HK3Jhl+nJi
	 6YTEzT0nxiIAqakxnXoRXlSKfT2O6MYjZ3CUjLCTH1xRYUNR6K32AeMonQ+o/LSEdx
	 kzhiDsyEsJz0mFINqOMr13VHnKSFsesiFBohzxoQX/kpYyvcgaYE44tJIl5pMIgN3Z
	 sPdWtUhB0vGFg==
From: Christian Brauner <brauner@kernel.org>
Date: Tue, 23 Jun 2026 22:34:22 +0200
Subject: [PATCH b4 v2 6/6] review-tui: test take->merge conflict resolution
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-20260623-review-tui-take-am-worktree-v2-6-2cbbab5d5441@kernel.org>
References: <20260623-20260623-review-tui-take-am-worktree-v2-0-2cbbab5d5441@kernel.org>
In-Reply-To: <20260623-20260623-review-tui-take-am-worktree-v2-0-2cbbab5d5441@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-e850d
X-Developer-Signature: v=1; a=openpgp-sha256; l=12526; i=brauner@kernel.org;
 h=from:subject:message-id; bh=Ssc+V1HSTFr88a4JejUYCfbIyMmgODT4EcIqm3OAH1Y=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWRZvT2/dtLdZQJ1ZxtEFGcZhXBPNg2eZc7lX3dhBstdL
 1nV7kivjlIWBjEuBlkxRRaHdpNwueU8FZuNMjVg5rAygQxh4OIUgImsSGJkOP96odYmv3aXY3vf
 ZJ9rEfxq/0mxfAZbxMIW/g+O5dyfzzAydK89tTj9c0OkV2phYo/UoaTaJ9EVL2fPf63i7LXC/t8
 CHgA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Cover the new in-place merge conflict resolution: the shared
_resolve_worktree_take_conflict() helper (resolve, abort, and an unfinished
throwaway worktree being kept) and an end-to-end _do_take_merge() run
through a real conflicted merge.

The key invariant is that finishing the conflicted merge in place keeps the
merged-in side fully reachable -- unlike "b4 shazam --resolve", which
replays not-yet-applied patches with `git apply --3way` + `git add -u` and
so silently drops a patch that only adds a new file. The tests assert a
real two-parent merge commit results, the merged side is an ancestor of
HEAD, and a brand-new file added on that side survives.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/tests/test_tui_tracking.py | 236 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 235 insertions(+), 1 deletion(-)

diff --git a/src/tests/test_tui_tracking.py b/src/tests/test_tui_tracking.py
index bf131ec..b7d543b 100644
--- a/src/tests/test_tui_tracking.py
+++ b/src/tests/test_tui_tracking.py
@@ -15,7 +15,7 @@ import datetime
 import email.message
 import os
 import pathlib
-from typing import Any, Dict, List, Optional
+from typing import Any, Dict, List, Optional, Tuple
 from unittest.mock import patch
 
 import pytest
@@ -38,9 +38,12 @@ from b4.review_tui._modals import (
 from b4.review_tui._tracking_app import (
     TrackedSeriesItem,
     TrackingApp,
+    _resolve_worktree_take_conflict,
     _shazam_merge_flags,
     _take_worktree,
+    _TakeWorktree,
     _worktree_for_branch,
+    _worktree_merge_in_progress,
 )
 
 # ---------------------------------------------------------------------------
@@ -3773,3 +3776,234 @@ class TestAmTakeWorktree:
             gitdir, ['status', '--porcelain', '--untracked-files=no']
         )
         assert ecode == 0 and status.strip() == ''
+
+
+# ---------------------------------------------------------------------------
+# take->merge conflict resolution (must never drop a non-empty commit)
+# ---------------------------------------------------------------------------
+
+
+def _conflict_base(gitdir: str) -> str:
+    """Commit a shared file onto the current branch; return the new HEAD sha."""
+    (pathlib.Path(gitdir) / 'shared.txt').write_text('a\nb\nc\n')
+    b4.git_run_command(gitdir, ['add', 'shared.txt'])
+    ecode, _ = b4.git_run_command(gitdir, ['commit', '-m', 'add shared.txt'])
+    assert ecode == 0
+    ecode, base = b4.git_run_command(gitdir, ['rev-parse', 'HEAD'])
+    assert ecode == 0
+    return base.strip()
+
+
+def _conflicted_merge_worktree(gitdir: str, tmp_path: pathlib.Path) -> Tuple[str, str]:
+    """Park a worktree on a conflicted ``git merge``.
+
+    The merged-in ("theirs") side edits the shared file (forcing the conflict)
+    *and* adds a brand-new file -- the kind of non-empty change that
+    ``b4 shazam --resolve`` silently drops via ``git add -u``. Returns
+    (worktree_path, pre_merge_head).
+    """
+    base = _conflict_base(gitdir)
+    b4.git_run_command(gitdir, ['branch', 'ours', base])
+    b4.git_run_command(gitdir, ['branch', 'theirs', base])
+
+    ours_wt = str(tmp_path / 'ours-wt')
+    ecode, _ = b4.git_run_command(gitdir, ['worktree', 'add', ours_wt, 'ours'])
+    assert ecode == 0
+    (pathlib.Path(ours_wt) / 'shared.txt').write_text('a\nOURS\nc\n')
+    b4.git_run_command(ours_wt, ['add', 'shared.txt'])
+    ecode, _ = b4.git_run_command(ours_wt, ['commit', '-m', 'ours edits shared'])
+    assert ecode == 0
+
+    theirs_wt = str(tmp_path / 'theirs-wt')
+    ecode, _ = b4.git_run_command(gitdir, ['worktree', 'add', theirs_wt, 'theirs'])
+    assert ecode == 0
+    (pathlib.Path(theirs_wt) / 'shared.txt').write_text('a\nTHEIRS\nc\n')
+    (pathlib.Path(theirs_wt) / 'newfile.txt').write_text('brand new\n')
+    b4.git_run_command(theirs_wt, ['add', '-A'])
+    ecode, _ = b4.git_run_command(
+        theirs_wt, ['commit', '-m', 'theirs edits shared and adds newfile']
+    )
+    assert ecode == 0
+    b4.git_run_command(gitdir, ['worktree', 'remove', '--force', theirs_wt])
+
+    ecode, pre = b4.git_run_command(ours_wt, ['rev-parse', 'HEAD'])
+    assert ecode == 0
+    pre = pre.strip()
+    ecode, _ = b4.git_run_command(
+        ours_wt, ['merge', '--no-ff', 'theirs'], logstderr=True
+    )
+    assert ecode != 0  # conflict on shared.txt
+    return ours_wt, pre
+
+
+def _resolve_shared(*_args: Any, **kwargs: Any) -> None:
+    """_suspend_to_shell stand-in: resolve the conflict and finish the merge."""
+    cwd = kwargs['cwd']
+    (pathlib.Path(cwd) / 'shared.txt').write_text('a\nRESOLVED\nc\n')
+    b4.git_run_command(cwd, ['add', 'shared.txt'])
+    ecode, _ = b4.git_run_command(cwd, ['commit', '--no-edit'])
+    assert ecode == 0
+
+
+class TestMergeConflictResolution:
+    """take->merge finishes the *same* real merge, dropping nothing.
+
+    Unlike ``b4 shazam --resolve`` (which replays not-yet-applied patches with
+    ``git apply --3way`` + ``git add -u`` and so silently omits a patch that
+    adds a new file), the conflicted ``git merge`` is completed in place, so the
+    merged-in side stays fully reachable and every added file survives.
+    """
+
+    def test_in_progress_detects_and_clears(
+        self, gitdir: str, tmp_path: pathlib.Path
+    ) -> None:
+        wt, _pre = _conflicted_merge_worktree(gitdir, tmp_path)
+        assert _worktree_merge_in_progress(wt) is True
+        b4.git_run_command(wt, ['merge', '--abort'])
+        assert _worktree_merge_in_progress(wt) is False
+
+    def test_resolution_keeps_added_file(
+        self, gitdir: str, tmp_path: pathlib.Path
+    ) -> None:
+        wt, pre = _conflicted_merge_worktree(gitdir, tmp_path)
+        handle = _TakeWorktree(wt, is_temp=False)
+        with patch(
+            'b4.review_tui._tracking_app._suspend_to_shell',
+            side_effect=_resolve_shared,
+        ):
+            ok = _resolve_worktree_take_conflict(
+                handle, 'merge', pre, _worktree_merge_in_progress
+            )
+        assert ok is True
+        # A real two-parent merge commit...
+        ecode, parents = b4.git_run_command(wt, ['rev-list', '--parents', '-1', 'HEAD'])
+        assert ecode == 0 and len(parents.split()) == 3
+        # ...with the merged-in side fully reachable (no commit dropped)...
+        ecode, theirs = b4.git_run_command(wt, ['rev-parse', 'theirs'])
+        assert ecode == 0
+        ecode, _ = b4.git_run_command(
+            wt, ['merge-base', '--is-ancestor', theirs.strip(), 'HEAD']
+        )
+        assert ecode == 0
+        # ...and the brand-new file (shazam --resolve drops it) is present.
+        ecode, content = b4.git_run_command(wt, ['show', 'HEAD:newfile.txt'])
+        assert ecode == 0 and content.strip() == 'brand new'
+        ecode, shared = b4.git_run_command(wt, ['show', 'HEAD:shared.txt'])
+        assert ecode == 0 and 'RESOLVED' in shared
+
+    def test_abort_returns_false_and_restores_head(
+        self, gitdir: str, tmp_path: pathlib.Path
+    ) -> None:
+        wt, pre = _conflicted_merge_worktree(gitdir, tmp_path)
+        handle = _TakeWorktree(wt, is_temp=False)
+
+        def _abort(*_a: Any, **kw: Any) -> None:
+            b4.git_run_command(kw['cwd'], ['merge', '--abort'])
+
+        with patch('b4.review_tui._tracking_app._suspend_to_shell', side_effect=_abort):
+            ok = _resolve_worktree_take_conflict(
+                handle, 'merge', pre, _worktree_merge_in_progress
+            )
+        assert ok is False
+        ecode, head = b4.git_run_command(wt, ['rev-parse', 'HEAD'])
+        assert ecode == 0 and head.strip() == pre
+        assert _worktree_merge_in_progress(wt) is False
+
+    def test_incomplete_keeps_throwaway(
+        self, gitdir: str, tmp_path: pathlib.Path
+    ) -> None:
+        wt, pre = _conflicted_merge_worktree(gitdir, tmp_path)
+        handle = _TakeWorktree(wt, is_temp=True)
+        # User exits the shell without finishing the merge.
+        with patch('b4.review_tui._tracking_app._suspend_to_shell'):
+            ok = _resolve_worktree_take_conflict(
+                handle, 'merge', pre, _worktree_merge_in_progress
+            )
+        assert ok is False
+        assert handle._keep is True
+        assert _worktree_merge_in_progress(wt) is True
+
+
+def _series_mbox_add_and_edit(gitdir: str, tmp_path: pathlib.Path, base: str) -> bytes:
+    """Two patches at *base*: add newfile.txt, then edit shared.txt line 2."""
+    wt = str(tmp_path / 'seriesgen')
+    ecode, _ = b4.git_run_command(gitdir, ['worktree', 'add', '--detach', wt, base])
+    assert ecode == 0
+    try:
+        (pathlib.Path(wt) / 'newfile.txt').write_text('brand new\n')
+        b4.git_run_command(wt, ['add', 'newfile.txt'])
+        ecode, _ = b4.git_run_command(wt, ['commit', '-m', 'add newfile.txt'])
+        assert ecode == 0
+        (pathlib.Path(wt) / 'shared.txt').write_text('a\nPATCH\nc\n')
+        b4.git_run_command(wt, ['add', 'shared.txt'])
+        ecode, _ = b4.git_run_command(wt, ['commit', '-m', 'edit shared.txt'])
+        assert ecode == 0
+        ecode, patches = b4.git_run_command(
+            wt, ['format-patch', '--stdout', f'{base}..HEAD']
+        )
+        assert ecode == 0
+    finally:
+        b4.git_run_command(gitdir, ['worktree', 'remove', '--force', wt])
+    return patches.encode()
+
+
+class TestDoTakeMergeConflict:
+    """End-to-end: _do_take_merge resolves a real merge conflict in place."""
+
+    def _run(self, gitdir: str, target_branch: str, ambytes: bytes) -> None:
+        from types import SimpleNamespace
+
+        change_id = 'merge-conflict-e2e'
+        review_branch = _create_review_branch(gitdir, change_id, status='reviewing')
+        app = TrackingApp.__new__(TrackingApp)
+        app._identifier = None  # type: ignore[assignment]
+        app._selected_series = {}
+        app._prepare_am_messages = lambda *a, **k: ambytes  # type: ignore[method-assign]
+        take_screen: Any = SimpleNamespace(
+            target_result=target_branch,
+            add_signoff=False,
+            add_link=False,
+            accept_series=False,
+        )
+        with (
+            patch('b4.review_tui._tracking_app._wait_for_enter'),
+            patch(
+                'b4.review_tui._tracking_app._suspend_to_shell',
+                side_effect=_resolve_shared,
+            ),
+        ):
+            app._do_take_merge(
+                change_id, review_branch, take_screen, {'subject': 'x'}, None
+            )
+
+    def test_resolves_without_dropping_added_file(
+        self, gitdir: str, tmp_path: pathlib.Path
+    ) -> None:
+        base = _conflict_base(gitdir)
+        # Target diverges on shared.txt and is checked out nowhere (throwaway).
+        b4.git_run_command(gitdir, ['branch', 'target', base])
+        twt = str(tmp_path / 'target-edit')
+        ecode, _ = b4.git_run_command(gitdir, ['worktree', 'add', twt, 'target'])
+        assert ecode == 0
+        (pathlib.Path(twt) / 'shared.txt').write_text('a\nTARGET\nc\n')
+        b4.git_run_command(twt, ['add', 'shared.txt'])
+        b4.git_run_command(twt, ['commit', '-m', 'target diverges'])
+        b4.git_run_command(gitdir, ['worktree', 'remove', '--force', twt])
+
+        ambytes = _series_mbox_add_and_edit(gitdir, tmp_path, base)
+        self._run(gitdir, 'target', ambytes)
+
+        # target advanced to a real two-parent merge commit...
+        ecode, parents = b4.git_run_command(
+            gitdir, ['rev-list', '--parents', '-1', 'target']
+        )
+        assert ecode == 0 and len(parents.split()) == 3
+        # ...the added-file patch survived (the shazam --resolve drop bug)...
+        ecode, content = b4.git_run_command(gitdir, ['show', 'target:newfile.txt'])
+        assert ecode == 0 and content.strip() == 'brand new'
+        ecode, shared = b4.git_run_command(gitdir, ['show', 'target:shared.txt'])
+        assert ecode == 0 and 'RESOLVED' in shared
+        # ...and the throwaway worktree was cleaned up.
+        common_dir = b4.git_get_common_dir(gitdir)
+        assert common_dir is not None
+        assert not os.path.isdir(os.path.join(common_dir, 'b4-take-worktree'))

-- 
2.53.0

