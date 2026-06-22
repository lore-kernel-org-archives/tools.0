Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C831F0E29
	for <tools@linux.kernel.org>; Mon, 22 Jun 2026 12:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782130861; cv=none; b=rt29qN0fHPyV5HJvzoRKIH1tRQU+k7SFbYc92DSERF8WTxdgNWkrfGQ1igNlYIePIXo/AobsAV2F3ZJo4DACQxgVyuJZ5zlfkDrHwELqmNOmMEwoSgQ79B3/gBg35qrpi6rU89ewmRKaDM/V2J//hBEVegGkZX280DHmaPtEVTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782130861; c=relaxed/simple;
	bh=tFNwXZ/FqxTrwF7Lo+iwUXiyTpPM1ZaD43fkHXA8294=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jCjfcgGpH6RBPRfTZzqsdGZTfZEivIhNDbUFntBJnxnifJZI0TnjpXUhbvbwp6iJkwIR8ol5GOAycOMF2XHZ7LH+sWMvObDacUGOFtwtFckQJxoyG+m+ZXncZNladX8oKZSgvFVdPB32EknIn6MT1MIDQDNF1YIcS1h9GkBT0sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ROpSvDsV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ROpSvDsV"
Received: by smtp.kernel.org (Postfix)
	id B12081F00A3E; Mon, 22 Jun 2026 12:20:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCA381F000E9;
	Mon, 22 Jun 2026 12:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782130855;
	bh=SRQ3NWN8CDWCw1qlqtiM70BoAuwTYYFzl95pNmG1U4I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ROpSvDsV9gt5ucqN5pV1ZzD8g0pt5z3rVputK/riG+ocIAmp2BtbHwCIMOVbBeBub
	 2TgM0GtZyU2NYKckJLce1/4H9OD58cioQhhoeRADKs60s6lUu24DGjSOdcfb5Ga8j6
	 GIMnkIubF/fqKsnVlCNUdx/Ez6TvTA9eELj6d2P4yn9DsNt9wMN7tFYksDa6TJkpMD
	 f5jjiHxqJahjKZ7FFJyeqJnVYoRczXnABenoTI6YQ2Mlw6JXko1urkGMvsPRHlgp5W
	 yaJ9dquXHkPQM/KpyrtZ9DCK3tyTIQTo6POOVhdW8a4Ou0Li8KDcBICCNhYWkw2GWP
	 gwG/nz5R9hlrQ==
From: Christian Brauner <brauner@kernel.org>
Date: Mon, 22 Jun 2026 14:20:45 +0200
Subject: [PATCH b4 3/3] review-tui: test shazam-merge-flags and worktree
 resolution
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260622-review-tui-take-merge-v1-3-ad4893027e4d@kernel.org>
References: <20260622-review-tui-take-merge-v1-0-ad4893027e4d@kernel.org>
In-Reply-To: <20260622-review-tui-take-merge-v1-0-ad4893027e4d@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-04799
X-Developer-Signature: v=1; a=openpgp-sha256; l=10340; i=brauner@kernel.org;
 h=from:subject:message-id; bh=tFNwXZ/FqxTrwF7Lo+iwUXiyTpPM1ZaD43fkHXA8294=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWRZaizi+rzM7U/whfPJlm+3zPFvXrD7x+3gjJAFEx0rf
 LdeLD15pqOUhUGMi0FWTJHFod0kXG45T8Vmo0wNmDmsTCBDGLg4BWAi15sZGaaf3Cf6cN6Wu3+K
 y/eGLa9k/qFtz3mg/+DaRjeBP4VhuyIZGXadv33IYfXBdx2hl8PLZCLjjzNt5JwoMl8vRe3hs+C
 CLbwA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Cover the take->merge helpers:

- _shazam_merge_flags(): the default and an explicit --signoff are
  stripped (the take dialog's checkbox owns Signed-off-by), while
  --log/--stat/--gpg-sign pass through.
- _worktree_for_branch(): resolves the worktree holding a branch across
  linked worktrees and returns None when it is not checked out anywhere.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/tests/test_tui_tracking.py | 185 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 184 insertions(+), 1 deletion(-)

diff --git a/src/tests/test_tui_tracking.py b/src/tests/test_tui_tracking.py
index 022dc0c..7fb52b8 100644
--- a/src/tests/test_tui_tracking.py
+++ b/src/tests/test_tui_tracking.py
@@ -34,7 +34,12 @@ from b4.review_tui._modals import (
     SnoozeScreen,
     TargetBranchScreen,
 )
-from b4.review_tui._tracking_app import TrackedSeriesItem, TrackingApp
+from b4.review_tui._tracking_app import (
+    TrackedSeriesItem,
+    TrackingApp,
+    _shazam_merge_flags,
+    _worktree_for_branch,
+)
 
 # ---------------------------------------------------------------------------
 # Compat helper — Textual ≥ 1.0 (pip) uses Static.content,
@@ -2298,6 +2303,54 @@ class TestSeriesLifecycle:
         assert all(p.get('taken') for p in patches), 'all patches should be taken'
         assert updated['series']['status'] == 'accepted'
 
+    def test_record_take_metadata_branch_tip_is_target_not_head(
+        self, gitdir: str
+    ) -> None:
+        """branch-tips records the *target branch* tip, not the current HEAD.
+
+        Regression: the merge-take path advances target_branch in a separate
+        worktree and never checks out target_branch in the current checkout, so
+        reading HEAD here recorded the wrong commit (the launch branch) for the
+        CI-lookup metadata.
+        """
+        change_id = 'branch-tip-1'
+        branch_name = _create_review_branch(
+            gitdir, change_id, identifier='test-branch-tip', status='reviewing'
+        )
+        cover_text, trk = b4.review.load_tracking(gitdir, branch_name)
+        trk['patches'] = [{'subject': 'patch 1', 'message-id': 'p1@ex.com'}]
+        b4.review.save_tracking_ref(gitdir, branch_name, cover_text, trk)
+
+        # A target branch whose tip is advanced beyond the current HEAD
+        # (master), so HEAD and the target tip are distinguishable.
+        b4.git_run_command(gitdir, ['branch', 'take-target'])
+        ecode, tree = b4.git_run_command(gitdir, ['rev-parse', 'take-target^{tree}'])
+        assert ecode == 0
+        ecode, newsha = b4.git_run_command(
+            gitdir,
+            ['commit-tree', tree.strip(), '-p', 'take-target'],
+            stdin=b'advance target\n',
+        )
+        assert ecode == 0
+        b4.git_run_command(
+            gitdir, ['update-ref', 'refs/heads/take-target', newsha.strip()]
+        )
+
+        app = TrackingApp.__new__(TrackingApp)
+        app._record_take_metadata(
+            gitdir, branch_name, 'take-target', ['commit-a'], accepted=True
+        )
+
+        _, updated = b4.review.load_tracking(gitdir, branch_name)
+        tips = updated['series'].get('branch-tips', [])
+        assert tips, 'expected a branch-tips entry'
+        _, target_tip = b4.git_run_command(gitdir, ['rev-parse', 'take-target'])
+        _, head = b4.git_run_command(gitdir, ['rev-parse', 'HEAD'])
+        assert tips[-1]['branch'] == 'take-target'
+        assert tips[-1]['sha'] == target_tip.strip()
+        # The bug recorded HEAD (master); guard against a regression.
+        assert tips[-1]['sha'] != head.strip()
+
     @pytest.mark.asyncio
     async def test_thank_partial_series_cherrypicks_taken(self, gitdir: str) -> None:
         """Thanking a 'partial' series proceeds and thanks only taken patches.
@@ -2506,6 +2559,136 @@ class TestSeriesLifecycle:
         )
 
 
+class TestShazamMergeFlags:
+    """The take->merge path passes b4.shazam-merge-flags through verbatim (like
+    `b4 shazam`) and reconciles Signed-off-by with the take dialog's checkbox as
+    a single, deduped git-merge flag (config is authoritative).
+    """
+
+    def test_unset_config_defaults_to_signoff(self) -> None:
+        # Default shazam-merge-flags is '--signoff'; with the (config-defaulted)
+        # checkbox on, exactly one --signoff is passed.
+        assert _shazam_merge_flags({}, True) == ['--signoff']
+
+    def test_unset_config_checkbox_off_yields_no_signoff(self) -> None:
+        assert _shazam_merge_flags({}, False) == ['--no-signoff']
+
+    def test_config_flags_pass_through_verbatim(self) -> None:
+        # --log/--stat/--gpg-sign survive unchanged; signoff is appended once.
+        assert _shazam_merge_flags(
+            {'shazam-merge-flags': '--gpg-sign --stat --log'}, True
+        ) == ['--gpg-sign', '--stat', '--log', '--signoff']
+
+    def test_config_signoff_is_not_duplicated(self) -> None:
+        # An explicit --signoff in config is deduped against the checkbox flag.
+        assert _shazam_merge_flags(
+            {'shazam-merge-flags': '--signoff --log'}, True
+        ) == ['--log', '--signoff']
+        assert _shazam_merge_flags(
+            {'shazam-merge-flags': '--signoff --log'}, False
+        ) == ['--log', '--no-signoff']
+
+    def test_config_no_signoff_overridden_by_checkbox(self) -> None:
+        assert _shazam_merge_flags(
+            {'shazam-merge-flags': '--no-signoff --log'}, True
+        ) == ['--log', '--signoff']
+        assert _shazam_merge_flags(
+            {'shazam-merge-flags': '--no-signoff --log'}, False
+        ) == ['--log', '--no-signoff']
+
+    def test_strategy_short_flag_is_passed_through(self) -> None:
+        # In `git merge`, -s is --strategy (it takes an argument), NOT a short
+        # form of --signoff. It must survive untouched, else `-s ours` would
+        # lose the -s and leave `ours` as a bogus merge operand.
+        assert _shazam_merge_flags(
+            {'shazam-merge-flags': '-s ours'}, True
+        ) == ['-s', 'ours', '--signoff']
+
+    def test_empty_config_still_honors_checkbox(self) -> None:
+        assert _shazam_merge_flags({'shazam-merge-flags': ''}, True) == ['--signoff']
+        assert _shazam_merge_flags(
+            {'shazam-merge-flags': ''}, False
+        ) == ['--no-signoff']
+
+
+class TestWorktreeForBranch:
+    """Resolving which worktree holds a branch, for cross-worktree takes."""
+
+    def test_finds_and_ignores_other_worktrees(
+        self, gitdir: str, tmp_path: pathlib.Path
+    ) -> None:
+        # The fixture checks out 'master' in the main worktree.
+        main = _worktree_for_branch(gitdir, 'master')
+        assert main is not None and pathlib.Path(main).samefile(gitdir)
+
+        # A branch that is not checked out anywhere resolves to None.
+        b4.git_run_command(gitdir, ['branch', 'topic'])
+        assert _worktree_for_branch(gitdir, 'topic') is None
+
+        # Once checked out in a linked worktree, it resolves to that path.
+        wt = str(tmp_path / 'wt-topic')
+        ecode, _ = b4.git_run_command(gitdir, ['worktree', 'add', wt, 'topic'])
+        assert ecode == 0
+        found = _worktree_for_branch(gitdir, 'topic')
+        assert found is not None and pathlib.Path(found).samefile(wt)
+
+        # An unknown branch resolves to None.
+        assert _worktree_for_branch(gitdir, 'no-such-branch') is None
+
+
+class TestCrossWorktreeFetch:
+    """git_fetch_am_into_repo must land FETCH_HEAD in the target worktree.
+
+    The merge-take path applies patches via git_fetch_am_into_repo(merge_dir,
+    ...) and then merges ``git -C merge_dir ... FETCH_HEAD``. FETCH_HEAD is
+    per-worktree; if the fetch runs against the caller's cwd instead of
+    merge_dir, the commits land in the wrong worktree and the merge reads a
+    stale/missing FETCH_HEAD -- silently merging unrelated commits.
+    """
+
+    def test_fetch_head_lands_in_target_worktree_not_cwd(
+        self, gitdir: str, tmp_path: pathlib.Path, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        # Build an am-able patch on top of master without needing a committer
+        # identity or disturbing HEAD (mirrors _create_review_branch).
+        patchfile = pathlib.Path(gitdir) / 'cross_wt_patch.txt'
+        patchfile.write_text('cross-worktree marker\n')
+        b4.git_run_command(gitdir, ['add', 'cross_wt_patch.txt'])
+        ecode, tree = b4.git_run_command(gitdir, ['write-tree'])
+        assert ecode == 0
+        ecode, commit = b4.git_run_command(
+            gitdir,
+            ['commit-tree', tree.strip(), '-p', 'master'],
+            stdin=b'add cross_wt_patch\n',
+        )
+        assert ecode == 0
+        ecode, mbox = b4.git_run_command(
+            gitdir, ['format-patch', '-1', '--stdout', commit.strip()], decode=False
+        )
+        assert ecode == 0
+        # Restore a clean master (drop the staged file) so at_base=master and
+        # its FETCH_HEAD start fresh.
+        b4.git_run_command(gitdir, ['reset', '--hard', 'master'])
+
+        # Drive the fetch from a *different* worktree than gitdir. gitdir is the
+        # primary worktree (its .git is a directory) -- the case that used to
+        # leak the process cwd into the FETCH_HEAD location.
+        other = str(tmp_path / 'other-wt')
+        ecode, _ = b4.git_run_command(gitdir, ['worktree', 'add', other, '-b', 'other'])
+        assert ecode == 0
+        monkeypatch.chdir(other)
+
+        b4.git_fetch_am_into_repo(gitdir, mbox, at_base='master', am_flags=['-3'])
+
+        # FETCH_HEAD must be readable from gitdir and carry the patched file --
+        # i.e. it landed in gitdir's per-worktree FETCH_HEAD, not `other`'s.
+        ecode, blob = b4.git_run_command(
+            gitdir, ['show', 'FETCH_HEAD:cross_wt_patch.txt']
+        )
+        assert ecode == 0, 'FETCH_HEAD did not land in the target worktree'
+        assert blob.strip() == 'cross-worktree marker'
+
+
 class TestMergeTakeSkipRouting:
     """Take routing when patches are skipped (bug 6d1d35c).
 

-- 
2.53.0

