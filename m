Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DB73ADBA3
	for <tools@linux.kernel.org>; Thu, 25 Jun 2026 12:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782389381; cv=none; b=Omy+B+fI9afgjSVIOncsPsl4XaoVwZgb1hMQhpNUjHS0JHTN7ch7wSxzT/xN0I6ecDUmKtihOFO1B6ZkI4u2IPP16l9aWoLFhP+CSrPtpa2K4zhTw/FYwkkrpEnSzr9uWL1bhWmRBzIPEQJMDW/UWCgIIQVwdRuigN7j3JQ02Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782389381; c=relaxed/simple;
	bh=yz7yGTUU+PIpKEmi1JjofWOsgtGoBoTaUkbYJMWiPPg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ittXqGRO+0DoyAFHGmuFoRMAoQ7OatjTUFvg2EZbLQcT1aHQ+Ytu5bAa0J2oQr8OMdVXkGgGJ/XFStvKMhWxteRrjzvAneu7EgD9OnGXXdk6LX6BgRgqv5QO24ZYBzBLXDV1D6hvt97aJrJuc1yQo4NEB0cFxnfXFfiZVmqp2iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WBMF9dFn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WBMF9dFn"
Received: by smtp.kernel.org (Postfix)
	id 4B8341F00A3D; Thu, 25 Jun 2026 12:09:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73FBA1F000E9;
	Thu, 25 Jun 2026 12:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782389380;
	bh=jR2y2r7Xfyuow2eMlYUD+esmYyx0Oof23VuzDW8sMnQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=WBMF9dFnsaNWIX6c0QdIO1BYggcRJx+aHVKq1kyGgshtqW6tAZPX4B809k+Ar61z4
	 Q7YYA5rN2bt5CXwBGIZkUA+WUxsROUrm5AheZ/rl22OyTnEfAZS3ArDQlWHnwh08W2
	 1TQgGDWjEtTOP9XLAEFo7ZKbAjgnvz2VuHhQLOJDhuEtijTm8vWlzyGQrIFlBcIXy+
	 PQpwraDzNVzHp4QLW6tztqEnLMjWewkVgUWwOIuF5JJXEOlnZLpfB6PigVCHxJjYO+
	 j3z6Cn9dVjV76xwQKn4VqaYlxEcCDV1uiJ/+F+pxZCV2DLSkeEpmZ2PaT6l2tL9iMp
	 vMtmSONCXbknw==
From: Christian Brauner <brauner@kernel.org>
Date: Thu, 25 Jun 2026 14:09:23 +0200
Subject: [PATCH b4 v3 3/9] shazam: test native-am conflict resolution keeps
 every patch
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-shazam-resolve-native-am-v3-3-622b37a7f3b2@kernel.org>
References: <20260625-shazam-resolve-native-am-v3-0-622b37a7f3b2@kernel.org>
In-Reply-To: <20260625-shazam-resolve-native-am-v3-0-622b37a7f3b2@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-0a195
X-Developer-Signature: v=1; a=openpgp-sha256; l=16710; i=brauner@kernel.org;
 h=from:subject:message-id; bh=yz7yGTUU+PIpKEmi1JjofWOsgtGoBoTaUkbYJMWiPPg=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTZStXFuaQ+M8g//LP+SIdl+fM6veuHHQ0mnhDMEKoPv
 rFuUShrRykLgxgXg6yYIotDu0m43HKeis1GmRowc1iZQIYwcHEKwES8uBj++/gx+L58o1XWsMCv
 tHClyQOhHy9nPAgLVtlaE7H4R/9pQYb/2de2a28p9476MS8hds/r1sY5Bycttk6wPGhW4a3UHpz
 HAgA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

The old tests drove _start_merge_resolve()/_apply_remaining_patches(),
which no longer exist. Rewrite them around the native flow: trigger a
multi-patch git-am conflict, hand it off with _begin_shazam_resolve(),
finish the am in the worktree, and run shazam --continue.

The key invariant is that nothing is dropped -- assert a real two-parent
merge results and that all three patches' changes survive: the file added
by patch 1, the edit from patch 2, and the conflicted-then-resolved file
from patch 3. Also cover --continue refusing while the am is still in
progress, and --abort tearing down the worktree and state.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/tests/test_three_way_merge.py | 270 +++++++++++++++-----------------------
 1 file changed, 106 insertions(+), 164 deletions(-)

diff --git a/src/tests/test_three_way_merge.py b/src/tests/test_three_way_merge.py
index 2b4391e..090aa66 100644
--- a/src/tests/test_three_way_merge.py
+++ b/src/tests/test_three_way_merge.py
@@ -526,21 +526,14 @@ def _build_multi_patch_conflict(gitdir: str) -> Tuple[bytes, str]:
     return mbox.encode(), base
 
 
-def _make_shazam_state(
-    common_dir: str, state: Optional[Dict[str, Any]] = None
-) -> Tuple[str, str]:
-    """Create shazam state file and patches dir.
-
-    Returns (state_file_path, patches_dir_path).
-    """
+def _make_shazam_state(common_dir: str, state: Optional[Dict[str, Any]] = None) -> str:
+    """Write a shazam state file; return its path."""
     state_file = os.path.join(common_dir, 'b4-shazam-state.json')
-    patches_dir = os.path.join(common_dir, 'b4-shazam-patches')
-    os.makedirs(patches_dir, exist_ok=True)
     if state is None:
         state = {'origin': 'https://example.com', 'merge_flags': '--signoff'}
     with open(state_file, 'w') as fh:
         json.dump(state, fh)
-    return state_file, patches_dir
+    return state_file
 
 
 class TestLoadShazamState:
@@ -549,7 +542,7 @@ class TestLoadShazamState:
     def test_valid_state_loaded(self, gitdir: str) -> None:
         common_dir = b4.git_get_common_dir(gitdir)
         assert common_dir is not None
-        state_file, patches_dir = _make_shazam_state(common_dir)
+        state_file = _make_shazam_state(common_dir)
         try:
             _topdir, _cdir, sf, loaded = b4.mbox._load_shazam_state(require_state=True)
             assert loaded == {
@@ -559,7 +552,6 @@ class TestLoadShazamState:
             assert sf == state_file
         finally:
             os.unlink(state_file)
-            os.rmdir(patches_dir)
 
     def test_missing_state_exits(self, gitdir: str) -> None:
         with pytest.raises(SystemExit) as exc_info:
@@ -570,195 +562,145 @@ class TestLoadShazamState:
         _topdir, _cdir, _sf, loaded = b4.mbox._load_shazam_state(require_state=False)
         assert loaded is None
 
-    def test_missing_patches_dir_exits(self, gitdir: str) -> None:
-        common_dir = b4.git_get_common_dir(gitdir)
-        assert common_dir is not None
-        # Create state file but NOT the patches dir
-        state_file = os.path.join(common_dir, 'b4-shazam-state.json')
-        with open(state_file, 'w') as fh:
-            json.dump({'origin': 'test'}, fh)
-        try:
-            with pytest.raises(SystemExit) as exc_info:
-                b4.mbox._load_shazam_state(require_state=True)
-            assert exc_info.value.code == 1
-        finally:
-            if os.path.exists(state_file):
-                os.unlink(state_file)
-
 
-class TestShazamAbort:
-    """Tests for shazam_abort cleanup."""
-
-    def test_cleans_up_all_artifacts(self, gitdir: str) -> None:
-        common_dir = b4.git_get_common_dir(gitdir)
-        assert common_dir is not None
+def _trigger_am_conflict(
+    gitdir: str,
+) -> Tuple[b4.AmConflictError, Dict[str, Any]]:
+    """Run a conflicting multi-patch git-am inside the shazam worktree.
 
-        state_file, patches_dir = _make_shazam_state(common_dir)
-        # Add a fake patch file
-        with open(os.path.join(patches_dir, '0000'), 'w') as fh:
-            fh.write('patch data')
+    Applying onto HEAD (which carries master's conflicting file1 rewrite) makes
+    patch 3 fail, so git_fetch_am_into_repo raises and leaves the in-progress
+    git-am parked in the worktree -- exactly the state the real shazam flow
+    hands to ``--resolve``. Returns (the error, a state dict for
+    _begin_shazam_resolve).
+    """
+    ambytes, _base = _build_multi_patch_conflict(gitdir)
+    with pytest.raises(b4.AmConflictError) as exc_info:
+        b4.git_fetch_am_into_repo(gitdir, ambytes, at_base='HEAD', am_flags=['-3'])
+    state = {
+        'worktree': exc_info.value.worktree_path,
+        'origin': 'https://example.com',
+        'merge_template_values': {},
+        'merge_template': 'Merge test series\n\nResolved conflict.\n',
+        'merge_flags': '--signoff',
+        'no_interactive': True,
+        'do_merge': True,
+    }
+    return exc_info.value, state
 
-        cmdargs = argparse.Namespace()
-        b4.mbox.shazam_abort(cmdargs)
 
-        assert not os.path.exists(patches_dir)
-        assert not os.path.exists(state_file)
+class TestBeginShazamResolve:
+    """``b4 shazam --resolve`` hands the conflicted git-am back to the user."""
 
-    def test_cleans_up_stale_worktree(self, gitdir: str) -> None:
+    def test_keeps_worktree_and_writes_state(self, gitdir: str) -> None:
         common_dir = b4.git_get_common_dir(gitdir)
         assert common_dir is not None
+        cex, state = _trigger_am_conflict(gitdir)
 
-        state_file, patches_dir = _make_shazam_state(common_dir)
-
-        # Create a stale worktree
-        gwt = os.path.join(common_dir, 'b4-shazam-worktree')
-        b4.git_run_command(gitdir, ['worktree', 'add', '--detach', gwt, 'HEAD'])
-        assert os.path.isdir(gwt)
-
-        cmdargs = argparse.Namespace()
-        b4.mbox.shazam_abort(cmdargs)
+        # Saves state and exits, leaving the in-progress git-am untouched.
+        with pytest.raises(SystemExit) as exit_info:
+            b4.mbox._begin_shazam_resolve(cex, common_dir, state)
+        assert exit_info.value.code == 1
 
-        assert not os.path.exists(gwt)
-        assert not os.path.exists(patches_dir)
-        assert not os.path.exists(state_file)
+        state_file = os.path.join(common_dir, 'b4-shazam-state.json')
+        assert os.path.exists(state_file)
+        with open(state_file) as fh:
+            assert json.load(fh)['worktree'] == cex.worktree_path
 
-    def test_noop_when_nothing_to_clean(self, gitdir: str) -> None:
-        cmdargs = argparse.Namespace()
-        # Should not raise
-        b4.mbox.shazam_abort(cmdargs)
+        # The worktree (and its git-am) must survive for the user to finish.
+        assert os.path.isdir(cex.worktree_path)
+        assert b4._worktree_rebase_apply_dir(cex.worktree_path) is not None
+        # sparse-checkout disabled -> the conflicted file is materialized.
+        assert os.path.exists(os.path.join(cex.worktree_path, 'file1.txt'))
 
+        b4.git_run_command(gitdir, ['worktree', 'remove', '--force', cex.worktree_path])
+        os.unlink(state_file)
 
-class TestStartMergeResolve:
-    """Integration tests for _start_merge_resolve.
 
-    This function extracts remaining patches from a failed git-am
-    worktree, fetches successfully-applied patches, starts a merge,
-    and applies remaining patches one-by-one.
-    """
+class TestShazamResolveContinue:
+    """The lossless --resolve -> git am --continue -> shazam --continue flow."""
 
-    def test_creates_state_and_patches(self, gitdir: str) -> None:
-        """After a multi-patch conflict, state files are created."""
-        ambytes, _base = _build_multi_patch_conflict(gitdir)
+    def test_continue_merges_and_keeps_every_patch(self, gitdir: str) -> None:
         common_dir = b4.git_get_common_dir(gitdir)
         assert common_dir is not None
+        cex, state = _trigger_am_conflict(gitdir)
+        wt = cex.worktree_path
 
-        with pytest.raises(b4.AmConflictError) as exc_info:
-            b4.git_fetch_am_into_repo(gitdir, ambytes, at_base='HEAD', am_flags=['-3'])
+        with pytest.raises(SystemExit):
+            b4.mbox._begin_shazam_resolve(cex, common_dir, state)
 
-        state = {
-            'origin': 'https://example.com',
-            'merge_template_values': {},
-            'merge_template': 'Test merge\n\nConflict resolution test.',
-            'merge_flags': '--signoff',
-            'no_interactive': True,
-        }
+        # User finishes the git-am natively in the worktree.
+        with open(os.path.join(wt, 'file1.txt'), 'w') as fh:
+            fh.write('Resolved file1.\n')
+        b4.git_run_command(wt, ['add', 'file1.txt'], logstderr=True, rundir=wt)
+        ecode, _out = b4.git_run_command(
+            wt, ['am', '--continue'], logstderr=True, rundir=wt
+        )
+        assert ecode == 0
+        assert b4._worktree_rebase_apply_dir(wt) is None
 
-        # _start_merge_resolve exits(1) because remaining patch 3 conflicts
+        # b4 shazam --continue fetches and merges; under pytest _run_shazam_merge
+        # runs the merge captured and exits with its return code.
         with pytest.raises(SystemExit) as exit_info:
-            b4.mbox._start_merge_resolve(gitdir, exc_info.value, common_dir, state)
-        assert exit_info.value.code == 1
+            b4.mbox.shazam_continue(argparse.Namespace())
+        assert exit_info.value.code == 0
 
-        # State file and patches dir should exist
-        state_file = os.path.join(common_dir, 'b4-shazam-state.json')
-        patches_dir = os.path.join(common_dir, 'b4-shazam-patches')
-        assert os.path.exists(state_file)
-        assert os.path.isdir(patches_dir)
-
-        # One remaining patch was extracted (patch 3)
-        with open(os.path.join(patches_dir, 'total'), 'r') as fh:
-            assert fh.read().strip() == '1'
+        # A real two-parent merge commit resulted...
+        ecode, parents = b4.git_run_command(
+            gitdir, ['rev-list', '--parents', '-1', 'HEAD']
+        )
+        assert ecode == 0 and len(parents.split()) == 3
 
-        # Worktree should be removed
-        gwt = os.path.join(common_dir, 'b4-shazam-worktree')
-        assert not os.path.exists(gwt)
+        # ...and EVERY patch survived: patch 1 (file2), 2 (lipsum), 3 (file1).
+        ecode, file2 = b4.git_run_command(gitdir, ['show', 'HEAD:file2.txt'])
+        assert ecode == 0 and 'Added by patch 1.' in file2
+        ecode, lipsum = b4.git_run_command(gitdir, ['show', 'HEAD:lipsum.txt'])
+        assert ecode == 0 and 'Extra paragraph from patch 2.' in lipsum
+        ecode, file1 = b4.git_run_command(gitdir, ['show', 'HEAD:file1.txt'])
+        assert ecode == 0 and 'Resolved file1.' in file1
 
-        # Clean up for fixture teardown
-        b4.git_run_command(gitdir, ['merge', '--abort'], logstderr=True)
+        # State and worktree cleaned up.
+        assert not os.path.exists(os.path.join(common_dir, 'b4-shazam-state.json'))
+        assert not os.path.exists(wt)
 
-    def test_full_resolve_continue_flow(self, gitdir: str) -> None:
-        """Full flow: conflict -> resolve -> shazam --continue -> merge commit."""
-        ambytes, _base = _build_multi_patch_conflict(gitdir)
+    def test_continue_refuses_while_am_unfinished(self, gitdir: str) -> None:
         common_dir = b4.git_get_common_dir(gitdir)
         assert common_dir is not None
+        cex, state = _trigger_am_conflict(gitdir)
+        wt = cex.worktree_path
 
-        # Step 1: trigger conflict
-        with pytest.raises(b4.AmConflictError) as exc_info:
-            b4.git_fetch_am_into_repo(gitdir, ambytes, at_base='HEAD', am_flags=['-3'])
-
-        state = {
-            'origin': 'https://example.com',
-            'merge_template_values': {},
-            'merge_template': 'Test merge\n\nResolved conflict.',
-            'merge_flags': '--signoff',
-            'no_interactive': True,
-        }
-
-        # Step 2: _start_merge_resolve extracts patches, starts merge,
-        # applies remaining patch 3 which conflicts -> exit(1)
         with pytest.raises(SystemExit):
-            b4.mbox._start_merge_resolve(gitdir, exc_info.value, common_dir, state)
+            b4.mbox._begin_shazam_resolve(cex, common_dir, state)
 
-        # Step 3: resolve the conflict (accept any content)
-        with open(os.path.join(gitdir, 'file1.txt'), 'w') as fh:
-            fh.write('Resolved content for file1.\n')
-        b4.git_run_command(gitdir, ['add', 'file1.txt'])
+        # git-am is still mid-flight -> --continue must refuse and keep state.
+        with pytest.raises(SystemExit) as exit_info:
+            b4.mbox.shazam_continue(argparse.Namespace())
+        assert exit_info.value.code == 1
+        assert os.path.exists(os.path.join(common_dir, 'b4-shazam-state.json'))
+        assert os.path.isdir(wt)
 
-        # Step 4: shazam --continue
-        cmdargs = argparse.Namespace()
-        # Should complete successfully (no SystemExit)
-        b4.mbox.shazam_continue(cmdargs)
+        b4.git_run_command(gitdir, ['worktree', 'remove', '--force', wt])
+        os.unlink(os.path.join(common_dir, 'b4-shazam-state.json'))
 
-        # Step 5: verify merge commit was created
-        ecode, _log_out = b4.git_run_command(
-            gitdir, ['log', '--oneline', '-1', '--format=%s']
-        )
-        assert ecode == 0
-        # The commit was made with -F (the merge template content)
-        # Just verify a commit exists on top of our branch
-        ecode, parents = b4.git_run_command(
-            gitdir, ['rev-list', '--parents', '-1', 'HEAD']
-        )
-        assert ecode == 0
-        # Merge commit has 2 parents
-        parent_list = parents.strip().split()
-        assert len(parent_list) == 3  # commit_hash parent1 parent2
 
-        # State files should be cleaned up
-        state_file = os.path.join(common_dir, 'b4-shazam-state.json')
-        patches_dir = os.path.join(common_dir, 'b4-shazam-patches')
-        assert not os.path.exists(state_file)
-        assert not os.path.exists(patches_dir)
+class TestShazamAbort:
+    """Tests for shazam_abort cleanup."""
 
-    def test_abort_after_conflict(self, gitdir: str) -> None:
-        """After conflict, shazam --abort cleans everything up."""
-        ambytes, _base = _build_multi_patch_conflict(gitdir)
+    def test_cleans_up_state_and_worktree(self, gitdir: str) -> None:
         common_dir = b4.git_get_common_dir(gitdir)
         assert common_dir is not None
-
-        with pytest.raises(b4.AmConflictError) as exc_info:
-            b4.git_fetch_am_into_repo(gitdir, ambytes, at_base='HEAD', am_flags=['-3'])
-
-        state = {
-            'origin': 'https://example.com',
-            'merge_template_values': {},
-            'merge_template': 'Test merge',
-            'merge_flags': '--signoff',
-            'no_interactive': True,
-        }
+        cex, state = _trigger_am_conflict(gitdir)
 
         with pytest.raises(SystemExit):
-            b4.mbox._start_merge_resolve(gitdir, exc_info.value, common_dir, state)
+            b4.mbox._begin_shazam_resolve(cex, common_dir, state)
 
-        # Abort instead of resolving
-        cmdargs = argparse.Namespace()
-        b4.mbox.shazam_abort(cmdargs)
+        b4.mbox.shazam_abort(argparse.Namespace())
 
-        # Everything should be cleaned up
-        state_file = os.path.join(common_dir, 'b4-shazam-state.json')
-        patches_dir = os.path.join(common_dir, 'b4-shazam-patches')
-        assert not os.path.exists(state_file)
-        assert not os.path.exists(patches_dir)
+        assert not os.path.exists(cex.worktree_path)
+        assert not os.path.exists(os.path.join(common_dir, 'b4-shazam-state.json'))
+        # Nothing left dangling in the main tree.
+        assert not os.path.exists(os.path.join(gitdir, '.git', 'MERGE_HEAD'))
 
-        # Merge should be aborted (no MERGE_HEAD)
-        merge_head = os.path.join(gitdir, '.git', 'MERGE_HEAD')
-        assert not os.path.exists(merge_head)
+    def test_noop_when_nothing_to_clean(self, gitdir: str) -> None:
+        # Should not raise.
+        b4.mbox.shazam_abort(argparse.Namespace())

-- 
2.53.0

