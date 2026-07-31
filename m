Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49ACD37D13D
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 21:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785535181; cv=none; b=BCV28IEpW0txLEy8Gdv6IChrOvtBR+EFWdqZb4gYL/HAc0RGa/jRPzUMTBtMR1ka5Ry8ourb3hKSscxbk2d/Ebe9hMoUeBxAvS8NvGzLIOAHOEVb70AHAGz0s9GwXU9J2FRYrNFknva75yQUzCEo81FXaHqJGPHQ5lNSrXogGhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785535181; c=relaxed/simple;
	bh=jvYEQ2W2h3gzZZ+wr3fONaJyJ+3K/2bRmxgqiPcGA8M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GRYpwgRglzDIwodN1p4Gk1CeR2+/B9aI8KAMFMXOa3Zo5H2fzeWrOeUsNCVNtVXPjYzt9kk9n72GV/8yOuhquvmmmcA2tiPhNqUVCLffZRWv95gJ3dTqrGvwZm6SPv9z+lj9+USGwPLEmoXAWUA59YjlnX4CVD65fMKqKzhopNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J/i+4YJL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J/i+4YJL"
Received: by smtp.kernel.org (Postfix)
	id EA3F71F00ACA; Fri, 31 Jul 2026 21:59:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A54C1F00AC4;
	Fri, 31 Jul 2026 21:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785535175;
	bh=/ybjTyUg4IHiXNwUCpfsSdVW2Aa5+i8cam0JGR0AmpI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=J/i+4YJLafCqSkttFuD4po3yW8ew74idk43CKun5YQ4enKcoGnr/zN1SGLpOD98gi
	 BdEcXA3OwNkBFLMLQGs8wfvNbOjThbOj7MHJAIJJTgehrp90rW+/a8SfoqAgEOdS2J
	 82y7OUCECDeGc7RR9Zzy3NIj7+HoxG0GhRRqUBi+H/mwCvwncbi3Igs9amDByZmcEZ
	 Yuv6WhJrGfAZ80xo3cLeLcv4HJBlOtaSfwiqIY4YTIYJ4WdpaUot9KOap7HQtndChg
	 uxkp1/eeb+qi27HzNgsSYwjJ47RvTQhwMzCxNJgCqtAw7OYY/2DSpmZYmHsSdk/K/J
	 Mbhh0AP3zIZIg==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 23:59:16 +0200
Subject: [PATCH b4 v2 35/44] tests: cover the revision upgrade's branch
 handling
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v2-35-243fd19d322d@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=12475; i=brauner@kernel.org;
 h=from:subject:message-id; bh=jvYEQ2W2h3gzZZ+wr3fONaJyJ+3K/2bRmxgqiPcGA8M=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlSs1Z1Sla8jb4hNpfV+HbAquXqZlwKW/9+zTm27KDv
 6Mfzk3a3lHKwiDGxSArpsji0G4SLrecp2KzUaYGzBxWJpAhDFycAjARnpUM/2MU399Z+vXZ9pl6
 T5+yZslfytNc88VxldiDM4IbJUwzOr8w/JU9/TXI/7bLpvvci6JbAtMtchpKnV+0zrwQJl316dj
 BQF4A
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

A finished upgrade puts the worktree back on the branch, or on the
commit when it started detached. A create that exits leaves neither
the upgrade branch nor the checkout behind. An abandoned apply removes
an earlier attempt's leftover upgrade branch.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/tests/test_tui_tracking.py | 270 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 270 insertions(+)

diff --git a/src/tests/test_tui_tracking.py b/src/tests/test_tui_tracking.py
index 09d1fea..7b2ffb9 100644
--- a/src/tests/test_tui_tracking.py
+++ b/src/tests/test_tui_tracking.py
@@ -4074,6 +4074,276 @@ class TestUpdateRevisionWorkflow:
             # Should return to tracking list, not exit to review
             assert app.is_running
 
+    @pytest.mark.asyncio
+    async def test_successful_upgrade_restores_original_branch(
+        self, gitdir: str
+    ) -> None:
+        """A finished upgrade puts the worktree back where it found it.
+
+        create_review_branch() checks HEAD out onto the upgrade branch and the
+        swap renames that onto the review branch, so HEAD is left sitting on
+        the review branch.  The tracking list comes back up when this returns,
+        and quitting from there stranded the user on the review branch.
+        """
+        identifier = 'test-update-restore'
+        change_id = 'update-restore-1'
+        review_branch = _setup_update_test(gitdir, identifier, change_id)
+
+        ecode, _out = b4.git_run_command(gitdir, ['checkout', '-q', '-b', 'work'])
+        assert ecode == 0
+
+        lser = _make_mock_lser()
+
+        def _fake_create(topdir: str, branch: str, *args: Any, **kwargs: Any) -> None:
+            """Create the branch and check it out, as the real one does."""
+            _create_review_branch(
+                topdir,
+                branch.removeprefix('b4/review/'),
+                identifier=identifier,
+                revision=2,
+                status='reviewing',
+            )
+            ecode, _o = b4.git_run_command(topdir, ['checkout', '-q', branch])
+            assert ecode == 0
+
+        def _mock_archive(
+            self_app: TrackingApp,
+            cid: str,
+            rev: Optional[int],
+            rbranch: str,
+            pw_series_id: Optional[int] = None,
+            notify: bool = True,
+        ) -> bool:
+            b4.git_run_command(gitdir, ['branch', '-D', rbranch])
+            aconn = tracking.get_db(self_app._identifier)
+            tracking.update_series_status(aconn, cid, 'archived', revision=rev)
+            aconn.close()
+            return True
+
+        app = TrackingApp(identifier)
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            with (
+                patch.object(
+                    app, 'suspend', return_value=__import__('contextlib').nullcontext()
+                ),
+                patch('b4.review_tui._tracking_app._wait_for_enter'),
+                patch('b4.git_fetch_am_into_repo'),
+                patch('b4.review.create_review_branch', side_effect=_fake_create),
+                patch('b4.review.get_review_branch_patch_ids', return_value=[]),
+                patch(
+                    'b4.review.load_tracking',
+                    return_value=('', {'series': {}, 'patches': []}),
+                ),
+                patch('b4.review.reanchor_patch_comments'),
+                patch('b4.review.save_tracking_ref'),
+                patch.object(TrackingApp, '_archive_branch', _mock_archive),
+            ):
+                app._on_update_base_selected(
+                    'HEAD',
+                    lser,
+                    b'mbox',
+                    1,
+                    change_id,
+                    1,
+                    2,
+                    'v2@ex.com',
+                    '[PATCH v2] update test',
+                    review_branch,
+                )
+            await pilot.pause()
+
+        # The upgrade landed, and the worktree is back on the user's branch.
+        assert b4.git_branch_exists(gitdir, review_branch)
+        assert b4.git_get_current_branch(gitdir) == 'work'
+
+    @pytest.mark.asyncio
+    async def test_upgrade_from_a_detached_head_puts_it_back(self, gitdir: str) -> None:
+        """A detached HEAD is where the user was too.
+
+        The upgrade renames the temporary branch onto the review branch and
+        HEAD follows, so a session that started detached ends up parked on a
+        branch it never asked for, with its own commit only in the reflog.
+        """
+        identifier = 'test-update-detached'
+        change_id = 'update-detached-1'
+        review_branch = _setup_update_test(gitdir, identifier, change_id)
+
+        ecode, _out = b4.git_run_command(gitdir, ['checkout', '-q', '--detach'])
+        assert ecode == 0
+        ecode, out = b4.git_run_command(gitdir, ['rev-parse', 'HEAD'])
+        assert ecode == 0
+        start_sha = out.strip()
+
+        lser = _make_mock_lser()
+
+        def _fake_create(topdir: str, branch: str, *args: Any, **kwargs: Any) -> None:
+            _create_review_branch(
+                topdir,
+                branch.removeprefix('b4/review/'),
+                identifier=identifier,
+                revision=2,
+                status='reviewing',
+            )
+            ecode, _o = b4.git_run_command(topdir, ['checkout', '-q', branch])
+            assert ecode == 0
+
+        def _mock_archive(
+            self_app: TrackingApp,
+            cid: str,
+            rev: Optional[int],
+            rbranch: str,
+            pw_series_id: Optional[int] = None,
+            notify: bool = True,
+        ) -> bool:
+            b4.git_run_command(gitdir, ['branch', '-D', rbranch])
+            aconn = tracking.get_db(self_app._identifier)
+            tracking.update_series_status(aconn, cid, 'archived', revision=rev)
+            aconn.close()
+            return True
+
+        app = TrackingApp(identifier)
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            with (
+                patch.object(
+                    app, 'suspend', return_value=__import__('contextlib').nullcontext()
+                ),
+                patch('b4.review_tui._tracking_app._wait_for_enter'),
+                patch('b4.git_fetch_am_into_repo'),
+                patch('b4.review.create_review_branch', side_effect=_fake_create),
+                patch('b4.review.get_review_branch_patch_ids', return_value=[]),
+                patch(
+                    'b4.review.load_tracking',
+                    return_value=('', {'series': {}, 'patches': []}),
+                ),
+                patch('b4.review.reanchor_patch_comments'),
+                patch('b4.review.save_tracking_ref'),
+                patch.object(TrackingApp, '_archive_branch', _mock_archive),
+            ):
+                app._on_update_base_selected(
+                    'HEAD',
+                    lser,
+                    b'mbox',
+                    1,
+                    change_id,
+                    1,
+                    2,
+                    'v2@ex.com',
+                    '[PATCH v2] update test',
+                    review_branch,
+                )
+            await pilot.pause()
+
+        assert b4.git_branch_exists(gitdir, review_branch)
+        assert b4.git_get_current_branch(gitdir) is None
+        ecode, out = b4.git_run_command(gitdir, ['rev-parse', 'HEAD'])
+        assert ecode == 0
+        assert out.strip() == start_sha
+
+    @pytest.mark.asyncio
+    async def test_apply_failure_restores_original_branch(self, gitdir: str) -> None:
+        """A create that moves HEAD and then fails leaves nothing behind.
+
+        create_review_branch() reports failure by exiting rather than raising,
+        and SystemExit is not an Exception, so the handler has to catch it too
+        or the cleanup is skipped and the user is left standing on a half-built
+        upgrade branch.
+        """
+        identifier = 'test-update-failrestore'
+        change_id = 'update-failrestore-1'
+        review_branch = _setup_update_test(gitdir, identifier, change_id)
+        upgrade_branch = f'b4/review/_tmp-{change_id}-v2-upgrade'
+
+        ecode, _out = b4.git_run_command(gitdir, ['checkout', '-q', '-b', 'work'])
+        assert ecode == 0
+
+        lser = _make_mock_lser()
+
+        def _fake_create(topdir: str, branch: str, *args: Any, **kwargs: Any) -> None:
+            """Move HEAD onto the new branch, then die the way the real one does."""
+            ecode, _o = b4.git_run_command(topdir, ['checkout', '-q', '-b', branch])
+            assert ecode == 0
+            raise SystemExit(1)
+
+        app = TrackingApp(identifier)
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            with (
+                patch.object(
+                    app, 'suspend', return_value=__import__('contextlib').nullcontext()
+                ),
+                patch('b4.review_tui._tracking_app._wait_for_enter'),
+                patch('b4.git_fetch_am_into_repo'),
+                patch('b4.review.create_review_branch', side_effect=_fake_create),
+            ):
+                app._on_update_base_selected(
+                    'HEAD',
+                    lser,
+                    b'mbox',
+                    1,
+                    change_id,
+                    1,
+                    2,
+                    'v2@ex.com',
+                    'subj',
+                    review_branch,
+                )
+            await pilot.pause()
+
+        assert b4.git_get_current_branch(gitdir) == 'work'
+        assert not b4.git_branch_exists(gitdir, upgrade_branch)
+        assert b4.git_branch_exists(gitdir, review_branch)
+
+    @pytest.mark.asyncio
+    async def test_abandoned_conflict_clears_a_leftover_branch(
+        self, gitdir: str
+    ) -> None:
+        """The upgrade branch name is derived from the series, so every
+        attempt at the same upgrade reuses it.  Backing out of the conflict
+        shell has to take an earlier attempt's leftover with it, or the next
+        attempt walks into create_review_branch() refusing the name."""
+        identifier = 'test-update-leftover'
+        change_id = 'update-leftover-1'
+        review_branch = _setup_update_test(gitdir, identifier, change_id)
+        upgrade_branch = f'b4/review/_tmp-{change_id}-v2-upgrade'
+
+        # An earlier attempt that ended somewhere without cleanup.
+        ecode, _out = b4.git_run_command(gitdir, ['branch', upgrade_branch])
+        assert ecode == 0
+
+        app = TrackingApp(identifier)
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            with (
+                patch.object(
+                    app, 'suspend', return_value=__import__('contextlib').nullcontext()
+                ),
+                patch('b4.review_tui._tracking_app._wait_for_enter'),
+                patch(
+                    'b4.git_fetch_am_into_repo',
+                    side_effect=b4.AmConflictError('/tmp/wt', 'conflict'),
+                ),
+                patch('b4.resolve_am_conflict_in_shell', return_value=False),
+            ):
+                app._on_update_base_selected(
+                    'HEAD',
+                    _make_mock_lser(),
+                    b'mbox',
+                    1,
+                    change_id,
+                    1,
+                    2,
+                    'v2@ex.com',
+                    'subj',
+                    review_branch,
+                )
+            await pilot.pause()
+
+        assert not b4.git_branch_exists(gitdir, upgrade_branch)
+        # Backing out costs the upgrade, never the series being upgraded.
+        assert b4.git_branch_exists(gitdir, review_branch)
+
     @pytest.mark.asyncio
     async def test_archive_failure_leaves_both_branches(self, gitdir: str) -> None:
         """If archiving fails, both branches are left for manual recovery."""

-- 
2.53.0

