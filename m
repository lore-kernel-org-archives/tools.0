Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249B23DDDC0
	for <tools@linux.kernel.org>; Thu, 25 Jun 2026 12:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782389389; cv=none; b=jluMG8kIzT0nOMWgoFb41tuwKNNg6P1Q+Vdq/cQpvbXFR9F1nIlgxtVQH5ASgP/Pkq/Y81a2tQ58x1He6xQmqlfXyFdV//GVtWcZDfsiParMaowH3WXzvVase1LN3rSdhbXveTyra1U/6yj1vhewNNSzicCTZFekSba/rp9cGMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782389389; c=relaxed/simple;
	bh=RIdJ/DTgQetUuCHrvUfkgRe1qZBUpg8GTPalAUl8peg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FPSObPVKUGjAHjWfUcl6/Y43QQ4qxJDYEy5Ly4BTCoF/xwhjp40otfZ+53NgEeaDF8eNDO0oKH1o1icGPWLzBtxWhmBsKvnq4v+IH2w1jNMLid1ZicVeSPVUAe+j/GvTIPTOn3katzerkcRrpqvHzUmQaHS80639IgjDzGQRyss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UREaqxMU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UREaqxMU"
Received: by smtp.kernel.org (Postfix)
	id D5B981F00A3D; Thu, 25 Jun 2026 12:09:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A72A1F000E9;
	Thu, 25 Jun 2026 12:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782389387;
	bh=hlPqTXYbmv91HakJaTcsfCPZhaohiPwb8/+BPV82NeE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=UREaqxMUVw+xGuN82ujPGx6s9Ik9qUApFjJ7uHvmhcfLLIHd9sFdVY9EnE01Brw/V
	 qfdkk+KlgjULwXkLb8jlr240GA0FLEaUKODW7LvgvvRp/JdQKYMQIlmndBS9PGPfsL
	 uq3GxKYasod6lijmvvcmqTrAnxbImlHkmnXzPXVtzHd3nQmJj46+Lf8mvvbyONQnK4
	 0xJQnhA0Dav3jPhfvkw0pywxDLkTwBGi4XIYXY/A3m4yKRyaviImperoo1u4q4lyLq
	 8L+IXECUoWMHXIiaQ3euJi56k0d35fMCEKrl2RbHez7rToga+hWWI5tEwpfoGsS8ku
	 +24xyOyNYRm1w==
From: Christian Brauner <brauner@kernel.org>
Date: Thu, 25 Jun 2026 14:09:29 +0200
Subject: [PATCH b4 v3 9/9] review-tui: test take-worktree conflict abort
 and dirty-target guard
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-shazam-resolve-native-am-v3-9-622b37a7f3b2@kernel.org>
References: <20260625-shazam-resolve-native-am-v3-0-622b37a7f3b2@kernel.org>
In-Reply-To: <20260625-shazam-resolve-native-am-v3-0-622b37a7f3b2@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-0a195
X-Developer-Signature: v=1; a=openpgp-sha256; l=7713; i=brauner@kernel.org;
 h=from:subject:message-id; bh=RIdJ/DTgQetUuCHrvUfkgRe1qZBUpg8GTPalAUl8peg=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTZStWfZrQ/aKQjcWDf8uRroZNnHVb/+KLhk4Fc8adDa
 6N+FHxe01HKwiDGxSArpsji0G4SLrecp2KzUaYGzBxWJpAhDFycAjAR33xGhtvMhyud+95Ht+1R
 Nbc9qJIdcYr93XXF+qxLOXXKGTZHoxgZfkbzLvTu5cnu/Xvn09Io1rUZSb+O/dLL0rTN/LZBt72
 LHQA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Cover the two failure modes the previous commit fixes, plus the shared
helpers underneath:

  - _worktree_inprogress_op detects an in-progress merge/cherry-pick (and a
    clean worktree returns nothing); _abort_worktree_op aborts a conflicted
    merge and falls back to git reset --merge for a bare unmerged index.
  - A real checkout left mid-conflict is restored (counterpart to the
    throwaway-kept case), and a take refuses up front on a target worktree
    that is already mid-op or carries a conflicted index.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/tests/test_tui_tracking.py | 142 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 141 insertions(+), 1 deletion(-)

diff --git a/src/tests/test_tui_tracking.py b/src/tests/test_tui_tracking.py
index caacd3e..c2b027e 100644
--- a/src/tests/test_tui_tracking.py
+++ b/src/tests/test_tui_tracking.py
@@ -24,7 +24,12 @@ from textual.widgets import Input, ListView, Static
 import b4
 import b4.review
 import b4.review.tracking as tracking
-from b4 import _worktree_merge_in_progress
+from b4 import (
+    _abort_worktree_op,
+    _worktree_has_unmerged,
+    _worktree_inprogress_op,
+    _worktree_merge_in_progress,
+)
 from b4.review_tui._modals import (
     ActionItem,
     ActionScreen,
@@ -3923,6 +3928,141 @@ class TestMergeConflictResolution:
         assert handle._keep is True
         assert _worktree_merge_in_progress(wt) is True
 
+    def test_real_worktree_incomplete_auto_aborts(
+        self, gitdir: str, tmp_path: pathlib.Path
+    ) -> None:
+        """A real checkout left mid-op is aborted, never poisoned.
+
+        Counterpart to test_incomplete_keeps_throwaway: a throwaway worktree is
+        kept for the user, but a real checkout must be restored -- otherwise its
+        unmerged index breaks the user's git work and makes the next take fail
+        cryptically on top of it.
+        """
+        wt, pre = _conflicted_merge_worktree(gitdir, tmp_path)
+        handle = _TakeWorktree(wt, is_temp=False)
+        # User exits the shell WITHOUT finishing or aborting the merge.
+        with patch('b4.review_tui._tracking_app._suspend_to_shell'):
+            ok = _resolve_worktree_take_conflict(
+                handle, 'merge', pre, _worktree_merge_in_progress
+            )
+        assert ok is False
+        assert _worktree_merge_in_progress(wt) is False
+        assert _worktree_has_unmerged(wt) is False
+        ecode, head = b4.git_run_command(wt, ['rev-parse', 'HEAD'])
+        assert ecode == 0 and head.strip() == pre
+
+
+def _strip_merge_pseudo_refs(wt: str) -> None:
+    """Leave *wt*'s index unmerged but remove its in-progress-merge markers.
+
+    Reproduces the resting state that breaks the next take: stage>0 entries with
+    no MERGE_HEAD/etc, which git refuses to start a fresh op on top of yet no
+    ``--abort`` can clear.
+    """
+    ecode, gd = b4.git_run_command(wt, ['rev-parse', '--absolute-git-dir'])
+    assert ecode == 0
+    for fname in ('MERGE_HEAD', 'MERGE_MSG', 'AUTO_MERGE'):
+        try:
+            os.unlink(os.path.join(gd.strip(), fname))
+        except OSError:
+            pass
+
+
+class TestWorktreeOpDetection:
+    """_worktree_inprogress_op / _worktree_has_unmerged / _abort_worktree_op."""
+
+    def test_detects_merge_and_clean(
+        self, gitdir: str, tmp_path: pathlib.Path
+    ) -> None:
+        wt, _pre = _conflicted_merge_worktree(gitdir, tmp_path)
+        assert _worktree_inprogress_op(wt) == 'merge'
+        assert _worktree_has_unmerged(wt) is True
+        b4.git_run_command(wt, ['merge', '--abort'])
+        assert _worktree_inprogress_op(wt) is None
+        assert _worktree_has_unmerged(wt) is False
+
+    def test_detects_cherry_pick(
+        self, gitdir: str, tmp_path: pathlib.Path
+    ) -> None:
+        wt, _pre = _conflicted_merge_worktree(gitdir, tmp_path)
+        b4.git_run_command(wt, ['merge', '--abort'])
+        # The same divergent edit to shared.txt now conflicts as a cherry-pick.
+        ecode, _ = b4.git_run_command(wt, ['cherry-pick', 'theirs'], logstderr=True)
+        assert ecode != 0
+        assert _worktree_inprogress_op(wt) == 'cherry-pick'
+        b4.git_run_command(wt, ['cherry-pick', '--abort'])
+        assert _worktree_inprogress_op(wt) is None
+
+    def test_abort_op_aborts_merge(
+        self, gitdir: str, tmp_path: pathlib.Path
+    ) -> None:
+        wt, pre = _conflicted_merge_worktree(gitdir, tmp_path)
+        assert _abort_worktree_op(wt) == 'merge'
+        ecode, head = b4.git_run_command(wt, ['rev-parse', 'HEAD'])
+        assert ecode == 0 and head.strip() == pre
+        assert _worktree_inprogress_op(wt) is None
+        assert _worktree_has_unmerged(wt) is False
+
+    def test_abort_op_resets_bare_unmerged_index(
+        self, gitdir: str, tmp_path: pathlib.Path
+    ) -> None:
+        wt, _pre = _conflicted_merge_worktree(gitdir, tmp_path)
+        _strip_merge_pseudo_refs(wt)
+        assert _worktree_inprogress_op(wt) is None
+        assert _worktree_has_unmerged(wt) is True
+        assert _abort_worktree_op(wt) == 'reset'
+        assert _worktree_has_unmerged(wt) is False
+
+    def test_abort_op_noop_on_clean(
+        self, gitdir: str, tmp_path: pathlib.Path
+    ) -> None:
+        b4.git_run_command(gitdir, ['branch', 'target', 'master'])
+        linked = str(tmp_path / 'clean-wt')
+        ecode, _ = b4.git_run_command(gitdir, ['worktree', 'add', linked, 'target'])
+        assert ecode == 0
+        assert _abort_worktree_op(linked) is None
+
+
+class TestTakeWorktreeRefusesDirtyTarget:
+    """_take_worktree refuses a target worktree that is mid-op or conflicted.
+
+    A take's git-am/git-merge would otherwise fail cryptically on top of the
+    leftover state; refuse up front instead, without discarding state that may
+    be the user's own.
+    """
+
+    def test_refuses_inprogress_merge(
+        self, gitdir: str, tmp_path: pathlib.Path
+    ) -> None:
+        wt, _pre = _conflicted_merge_worktree(gitdir, tmp_path)  # 'ours' is in wt
+        with patch('b4.review_tui._tracking_app._wait_for_enter'):
+            with _take_worktree(gitdir, 'ours') as handle:
+                assert handle is None
+        # Refusing must leave the conflicted state untouched for the user.
+        assert _worktree_merge_in_progress(wt) is True
+
+    def test_refuses_bare_unmerged_index(
+        self, gitdir: str, tmp_path: pathlib.Path
+    ) -> None:
+        wt, _pre = _conflicted_merge_worktree(gitdir, tmp_path)
+        _strip_merge_pseudo_refs(wt)
+        assert _worktree_inprogress_op(wt) is None
+        assert _worktree_has_unmerged(wt) is True
+        with patch('b4.review_tui._tracking_app._wait_for_enter'):
+            with _take_worktree(gitdir, 'ours') as handle:
+                assert handle is None
+
+    def test_allows_clean_target(
+        self, gitdir: str, tmp_path: pathlib.Path
+    ) -> None:
+        b4.git_run_command(gitdir, ['branch', 'target', 'master'])
+        linked = str(tmp_path / 'clean-target')
+        ecode, _ = b4.git_run_command(gitdir, ['worktree', 'add', linked, 'target'])
+        assert ecode == 0
+        with _take_worktree(gitdir, 'target') as handle:
+            assert handle is not None
+            assert not handle.is_temp
+
 
 def _series_mbox_add_and_edit(gitdir: str, tmp_path: pathlib.Path, base: str) -> bytes:
     """Two patches at *base*: add newfile.txt, then edit shared.txt line 2."""

-- 
2.53.0

