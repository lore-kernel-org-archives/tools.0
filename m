Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD0436D517
	for <tools@linux.kernel.org>; Wed, 12 Aug 2026 21:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786571238; cv=none; b=Nx203swQQqA7wdN8pUDSLugL25HISFm22KLi4j6gCKLaHnrwzDly2OZNp0kgUMG6V5agzkJ2t7rz+DYbpC06yil07XBD651w6t83tUTOm6gCBvH2u3R6MyX0MVVEPvqwg9NNKrxCzsY7XO9vyM6Xy5hKD5JbgMnJmnIYkWhNFvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786571238; c=relaxed/simple;
	bh=ZLVMq+M0pR3iWWkZSBOv6xK6oXvPWnbmm6obn276E1Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nl5xIw1tW7p8k/NsKo0RMhsaVTn79wBc142F8kH+E/bxgTECVy01Zilc29SdszZlfHWJ62Z20nuTjFLrtkZtQx7u7+NAsqByGkM2aOUyTDNExYjcdOoOrnkxqV/wKpuqD9n83hvCxL3Jqtq1/BtKMT4NnjJoNqEsZez8EG0aHLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N2gyQKDA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N2gyQKDA"
Received: by smtp.kernel.org (Postfix)
	id 82BA41F00A3A; Wed, 12 Aug 2026 21:47:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69F721F000E9;
	Wed, 12 Aug 2026 21:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786571236;
	bh=7DmoFD/e/nO5ZEjhZVMNj1cSvY/e8Rs/iNdyEGaJnL0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=N2gyQKDAeFEbUKufg/ZATiJW7Rz7M6MMmpGFoXToY2MbXwd0UXB7PdS+dDxy/aqNI
	 0rFb0ojLolZCMvoV+PSjrrOR5mhA1GIefCjjdPaAcPyzUCE0EmfR1hZ1Q9tfaaLu7W
	 f2AQVieIDcQ6c9JIYmTAJ+uzWtsQSgqwvlWo44RV9EsTOz6r+rt+LpKkBusaAM84mh
	 8TwjeJWzE9DyGWpyl7ec7ncaR8SBvm05av0ezdcwierbWdL1ZhruigRQEAjr7VIJ5a
	 QTfpThcA/PUDTAYiphXnUIsDNTzNEywNWa8ISFdudMJ1ppbcX4odYzj8RiYEFxTemW
	 48Qfdso+URflg==
From: Christian Brauner <brauner@kernel.org>
Date: Wed, 12 Aug 2026 23:46:47 +0200
Subject: [PATCH RFC v2 06/25] review: test the prerequisite fixes
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260812-work-b4-multiver-rows-v2-6-305d53cd723a@kernel.org>
References: <20260812-work-b4-multiver-rows-v2-0-305d53cd723a@kernel.org>
In-Reply-To: <20260812-work-b4-multiver-rows-v2-0-305d53cd723a@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.17-dev-362b8
X-Developer-Signature: v=1; a=openpgp-sha256; l=23025; i=brauner@kernel.org;
 h=from:subject:message-id; bh=ZLVMq+M0pR3iWWkZSBOv6xK6oXvPWnbmm6obn276E1Y=;
 b=kA0DAAoWkcYbwGV43KIByyZiAGp86drI7hBgCSsMVo2BoKzz56Y3xe+c1vVKept+IPZkrkg7A
 Ih1BAAWCgAdFiEEQIc0Vx6nDHizMmkokcYbwGV43KIFAmp86doACgkQkcYbwGV43KLyhQEAkW+1
 WkxGnpFtYQ6placppFoeUJVySsNfjYEoEeJBgpYBANRVth4eZ+6o0gNY7XVRQazmyRh3pXZ4Znd
 1I4H4qFMH
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Cover the four fixes the rest of the series builds on: the rethread flag
reaching retrieve_series_messages() through tracking_info and the thread
viewer's series dict, the UPSERT convergence of is_rethreaded plus the
Patchwork id and fingerprint a re-adding caller does not know, the
catalog mirror declining a branch whose worktree is mid-operation, and
the A·R·T cache refilling an entry a targeted invalidation evicted.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/tests/conftest.py             |  23 ++++
 src/tests/test___init__.py        |  62 ++++++++++
 src/tests/test_review_tracking.py | 172 ++++++++++++++++++++++++++++
 src/tests/test_tui_tracking.py    | 235 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 492 insertions(+)

diff --git a/src/tests/conftest.py b/src/tests/conftest.py
index aa6dbc84..a880e9af 100644
--- a/src/tests/conftest.py
+++ b/src/tests/conftest.py
@@ -44,6 +44,29 @@ def settestdefaults(
     monkeypatch.setattr(sys, '_running_in_pytest', True, raising=False)
 
 
+@pytest.fixture(scope='function', autouse=True)
+def clear_lore_cancel() -> Generator[None, None, None]:
+    """Clear liblore's cancel flag between tests.
+
+    The flag is process-global and sticky by design, and a TrackingApp sets
+    it on shutdown (LoreNodeShutdownMixin cancels the node so an in-flight
+    fetch stops).  Left set, it makes the next test that reaches lore raise
+    OperationCancelledError -- and only the TUI resets it, inside
+    lore_request(), so the plain sweep path in b4.review has no reset point
+    at all.
+
+    That turns a suite into an order-dependent one: any TUI test poisons a
+    later non-TUI one, and today only alphabetical file order hides it.  A
+    reorder -- pytest-randomly, --lf, a subset, CI sharding -- surfaces it,
+    pointing at the wrong file entirely.
+    """
+    yield
+    try:
+        b4.get_lore_node().reset_cancel()
+    except Exception:
+        pass
+
+
 @pytest.fixture(scope='function')
 def sampledir(request: pytest.FixtureRequest) -> str:
     return os.path.join(request.path.parent, 'samples')
diff --git a/src/tests/test___init__.py b/src/tests/test___init__.py
index f45aea56..cfc5882c 100644
--- a/src/tests/test___init__.py
+++ b/src/tests/test___init__.py
@@ -1236,6 +1236,68 @@ def test_git_run_command_log_fixup_looks_past_option_prefix(gitdir: str) -> None
     assert len(sha) == 40, f'log abbreviated the sha despite the fixup: {sha}'
 
 
+class TestGitWorktreeBusy:
+    """Tests for git_worktree_busy().
+
+    Deliberately narrower than git_branch_checked_out(): amending a tip
+    commit in place reuses the branch's own tree, so a quiescent checkout
+    survives it and only an operation in flight does not.
+    """
+
+    def test_a_quiescent_checkout_is_not_busy(self, gitdir: str) -> None:
+        """The distinction the whole predicate exists to draw."""
+        ecode, out = b4.git_run_command(gitdir, ['branch', '--show-current'])
+        assert ecode == 0
+        current = out.strip()
+        assert b4.git_branch_checked_out(gitdir, current) is True
+        assert b4.git_worktree_busy(gitdir, current) is False
+
+    def test_an_operation_in_flight_is_busy(self, gitdir: str) -> None:
+        ecode, out = b4.git_run_command(gitdir, ['branch', '--show-current'])
+        assert ecode == 0
+        current = out.strip()
+        os.makedirs(os.path.join(gitdir, '.git', 'rebase-apply'), exist_ok=True)
+        assert b4.git_worktree_busy(gitdir, current) is True
+
+    def test_a_branch_nobody_has_checked_out_is_not_busy(self, gitdir: str) -> None:
+        """No worktree, so there is no operation to strand."""
+        ecode, _ = b4.git_run_command(gitdir, ['branch', 'parked-branch'])
+        assert ecode == 0
+        assert b4.git_worktree_busy(gitdir, 'parked-branch') is False
+        assert b4.git_worktree_busy(gitdir, 'no-such-branch') is False
+
+    def test_a_linked_worktree_is_looked_at_on_its_own(
+        self, gitdir: str, tmp_path: pathlib.Path
+    ) -> None:
+        """State lives in the worktree's own gitdir, not the common one."""
+        wtpath = str(tmp_path / 'busy-wt')
+        ecode, out = b4.git_run_command(
+            gitdir, ['worktree', 'add', '-b', 'wt-busy', wtpath], logstderr=True
+        )
+        assert ecode == 0, out
+        try:
+            assert b4.git_worktree_busy(gitdir, 'wt-busy') is False
+            ecode, wtgit = b4.git_run_command(
+                wtpath, ['rev-parse', '--absolute-git-dir']
+            )
+            assert ecode == 0
+            os.makedirs(os.path.join(wtgit.strip(), 'rebase-merge'), exist_ok=True)
+            assert b4.git_worktree_busy(gitdir, 'wt-busy') is True
+            assert b4.git_worktree_busy(gitdir, 'refs/heads/wt-busy') is True
+            # The main worktree is untouched by the other one's state.
+            ecode, out = b4.git_run_command(gitdir, ['branch', '--show-current'])
+            assert b4.git_worktree_busy(gitdir, out.strip()) is False
+        finally:
+            b4.git_run_command(gitdir, ['worktree', 'remove', '--force', wtpath])
+
+    def test_a_lookup_that_fails_counts_as_busy(
+        self, gitdir: str, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """This guards a ref move, so not knowing must not read as consent."""
+        monkeypatch.setattr(b4, 'git_run_command', lambda *a, **kw: (1, ''))
+        assert b4.git_worktree_busy(gitdir, 'anything') is True
+
+
 class TestGitBranchCheckedOut:
     """Tests for git_branch_checked_out()."""
 
diff --git a/src/tests/test_review_tracking.py b/src/tests/test_review_tracking.py
index 64778be3..4cde7cdd 100644
--- a/src/tests/test_review_tracking.py
+++ b/src/tests/test_review_tracking.py
@@ -4359,6 +4359,31 @@ class TestSyncRevisionsCatalogToBranch:
             is False
         )
 
+    def test_sync_leaves_a_busy_worktree_alone(
+        self, gitdir: str, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """save_tracking_ref moves the ref with update-ref.
+
+        Unlike `git branch -f` that succeeds under a live worktree, which
+        strands an in-progress am or rebase.  The catalog is mirrored again
+        on the next pass that finds the branch free.
+        """
+        identifier = 'rt-port-sync-checkedout'
+        _make_review_branch_with_catalog(gitdir, identifier, 'cid-A', 5, [])
+        conn = review_tracking.init_db(identifier)
+        review_tracking.add_revision(conn, 'cid-A', 5, 'v5@example.com')
+        review_tracking.add_revision(conn, 'cid-A', 6, 'v6@example.com')
+        conn.close()
+        monkeypatch.setattr(b4, 'git_worktree_busy', lambda topdir, branch: True)
+        assert (
+            review_tracking.sync_revisions_catalog_to_branch(
+                gitdir, identifier, 'cid-A'
+            )
+            is False
+        )
+        _cover, tracking = b4.review.load_tracking(gitdir, 'b4/review/cid-A')
+        assert tracking.get('known-revisions', []) == []
+
 
 class TestKnownProjects:
     """Tests for the identifier→repository reverse mapping."""
@@ -4864,3 +4889,150 @@ class TestAutoWakeSkipsCheckedOutBranch:
         woken = review_tracking.auto_wake_snoozed(identifier, gitdir)
         assert woken == 1
         assert self._status(identifier, change_id) == 'replied'
+
+
+class TestUpgradeKeepsTheRethreadFlag:
+    def test_add_series_to_db_upsert_keeps_the_flag_without_the_argument(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        """The UPSERT's is_rethreaded is sticky, like the catalog's.
+
+        Not every re-adding caller knows the flag -- the Patchwork tracker
+        attaching a pw id, rescan_branches replaying a branch -- and a bare
+        `excluded.is_rethreaded` wrote each one's False default over an
+        existing 1, sending later retrievals down the single-msgid path.
+        """
+        conn = review_tracking.init_db('upgrade-rt')
+        review_tracking.add_series_to_db(
+            conn,
+            change_id='cid',
+            revision=3,
+            subject='[PATCH v3] thing',
+            sender_name='S',
+            sender_email='s@e.com',
+            sent_at='2026-01-01T00:00:00+00:00',
+            message_id='v3@x',
+            num_patches=2,
+            is_rethreaded=True,
+        )
+        conn.commit()
+        # Re-add without the flag, the way _finish_tracking does.
+        review_tracking.add_series_to_db(
+            conn,
+            change_id='cid',
+            revision=3,
+            subject='[PATCH v3] thing',
+            sender_name='S',
+            sender_email='s@e.com',
+            sent_at='2026-01-01T00:00:00+00:00',
+            message_id='v3@x',
+            num_patches=2,
+        )
+        conn.commit()
+        row = conn.execute(
+            "SELECT is_rethreaded FROM series WHERE change_id = 'cid'"
+        ).fetchone()
+        conn.close()
+        assert row[0] == 1
+
+    def test_add_series_to_db_upsert_keeps_linkage_a_caller_lacks(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        """fingerprint and pw_series_id survive a caller that has neither.
+
+        The same convergence rule as the flag: None means "not known
+        here", not "clear it" -- a CLI re-track must not detach the
+        Patchwork id, and a pw-side track must not null the fingerprint
+        the rethread machinery matches by.
+        """
+        conn = review_tracking.init_db('upgrade-linkage')
+        review_tracking.add_series_to_db(
+            conn,
+            change_id='cid',
+            revision=3,
+            subject='[PATCH v3] thing',
+            sender_name='S',
+            sender_email='s@e.com',
+            sent_at='2026-01-01T00:00:00+00:00',
+            message_id='v3@x',
+            num_patches=2,
+            fingerprint='fp-abc',
+        )
+        review_tracking.add_series_to_db(
+            conn,
+            change_id='cid',
+            revision=3,
+            subject='[PATCH v3] thing',
+            sender_name='S',
+            sender_email='s@e.com',
+            sent_at='2026-01-01T00:00:00+00:00',
+            message_id='v3@x',
+            num_patches=2,
+            pw_series_id=77,
+        )
+        row = conn.execute(
+            "SELECT fingerprint, pw_series_id FROM series WHERE change_id = 'cid'"
+        ).fetchone()
+        conn.close()
+        assert (row[0], row[1]) == ('fp-abc', 77)
+
+    def test_the_catalog_answer_wins_over_a_forgotten_argument(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        """is_rethreaded describes the posting, and the catalog owns that.
+
+        The upgrade path resolved the flag and then did not pass it on, so
+        the column's False default landed on the row.  Threading it through
+        fixes that call site; sourcing it from the catalog means no call
+        site can reintroduce the bug.
+        """
+        conn = review_tracking.init_db('rt-catalog-wins')
+        review_tracking.add_revision(conn, 'c', 2, 'v2@x', is_rethreaded=True)
+        review_tracking.add_series_to_db(
+            conn,
+            change_id='c',
+            revision=2,
+            subject='[PATCH v2] thing',
+            sender_name='S',
+            sender_email='s@e.com',
+            sent_at='2026-01-01T00:00:00+00:00',
+            message_id='v2@x',
+            num_patches=1,
+            # deliberately not passed, as the upgrade path used to do
+        )
+        row = conn.execute(
+            "SELECT is_rethreaded FROM series WHERE change_id = 'c'"
+        ).fetchone()
+        conn.close()
+        assert row[0] == 1
+
+    def test_the_flag_does_not_leak_to_another_revision(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        """Stickiness is per posting, not per series.
+
+        A series rethreaded at v2 and posted properly at v3 must record v3
+        as plain, or retrieval reassembles a series that was never split.
+        """
+        conn = review_tracking.init_db('rt-no-leak')
+        review_tracking.add_revision(conn, 'c', 2, 'v2@x', is_rethreaded=True)
+        review_tracking.add_revision(conn, 'c', 3, 'v3@x')
+        for rev in (2, 3):
+            review_tracking.add_series_to_db(
+                conn,
+                change_id='c',
+                revision=rev,
+                subject=f'[PATCH v{rev}] thing',
+                sender_name='S',
+                sender_email='s@e.com',
+                sent_at='2026-01-01T00:00:00+00:00',
+                message_id=f'v{rev}@x',
+                num_patches=1,
+            )
+        rows = dict(
+            conn.execute(
+                "SELECT revision, is_rethreaded FROM series WHERE change_id = 'c'"
+            ).fetchall()
+        )
+        conn.close()
+        assert rows == {2: 1, 3: 0}
diff --git a/src/tests/test_tui_tracking.py b/src/tests/test_tui_tracking.py
index 5ee2a242..664956ec 100644
--- a/src/tests/test_tui_tracking.py
+++ b/src/tests/test_tui_tracking.py
@@ -29,6 +29,7 @@ import b4
 import b4.review
 import b4.review.tracking as tracking
 import b4.review_tui._entry as _entry
+import b4.review_tui._tracking_app as _tracking_app
 from b4 import (
     _abort_worktree_op,
     _worktree_has_unmerged,
@@ -5762,3 +5763,237 @@ class TestTrackingEntryBranchRestore:
             _entry.run_tracking_tui('test-entry-dbclose')
 
         assert closed == [True]
+
+
+class TestArtCacheTargetedEviction:
+    @staticmethod
+    def _seed(identifier: str) -> None:
+        """Seed one reviewing series with a review branch to count A·R·T for.
+
+        Self-contained rather than reusing the version-row seeder: this
+        commit predates it, and a test that reaches forward for a helper
+        breaks every commit in between.
+        """
+        conn = tracking.init_db(identifier)
+        tracking.add_series_to_db(
+            conn,
+            change_id='multi-1',
+            revision=2,
+            subject='[PATCH v2 0/2] multi: test series',
+            sender_name='Vera Version',
+            sender_email='vera@example.com',
+            sent_at='2026-03-10T10:00:00+00:00',
+            message_id='multi-1-v2@example.com',
+            num_patches=2,
+        )
+        tracking.update_series_status(conn, 'multi-1', 'reviewing', revision=2)
+        conn.close()
+
+    @pytest.mark.asyncio
+    async def test_an_evicted_entry_is_recomputed(
+        self, tmp_path: pathlib.Path, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """_invalidate_caches(change_id) drops one entry, not the dict.
+
+        _load_series used to refill only when the whole dict was None, so an
+        evicted series' A·R·T stayed '-' for the rest of the session.
+        """
+        self._seed('art-evict')
+
+        batches: List[Dict[str, str]] = []
+
+        def _fake_batch(topdir: str, branches: Dict[str, str]) -> Dict[str, Any]:
+            batches.append(dict(branches))
+            return {name: (1, 2, 3) for name in branches}
+
+        monkeypatch.setattr(
+            _tracking_app, '_get_art_counts_batch', _fake_batch, raising=True
+        )
+        monkeypatch.setattr(
+            _tracking_app,
+            '_get_review_branch_tips',
+            lambda topdir: {'b4/review/multi-1': 'deadbeef'},
+        )
+        # There is no branch on disk, and the startup rescan would mark the
+        # series 'gone' -- which contributes no ART branch at all.
+        monkeypatch.setattr(
+            tracking, 'rescan_branches', lambda identifier, topdir: {'gone': 0}
+        )
+
+        app = TrackingApp('art-evict')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            assert app._all_series[0].get('art') == (1, 2, 3)
+            assert len(batches) == 1
+
+            app._invalidate_caches('multi-1')
+            app._load_series()
+            await pilot.pause()
+            assert len(batches) == 2
+            assert app._all_series[0].get('art') == (1, 2, 3)
+
+    @pytest.mark.asyncio
+    async def test_only_the_evicted_branch_is_recomputed(
+        self, tmp_path: pathlib.Path, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """Keeping the other entries is the whole point of the targeted form.
+
+        Refilling by handing the batch every branch spends that back: one
+        tracking-commit read per series under review on every take, link,
+        snooze or thank, to re-derive counts nothing invalidated.
+        """
+        self._seed('art-scope')
+        conn = tracking.get_db('art-scope')
+        tracking.add_series_to_db(
+            conn,
+            change_id='multi-2',
+            revision=1,
+            subject='[PATCH 0/1] other: series',
+            sender_name='Otto Other',
+            sender_email='otto@example.com',
+            sent_at='2026-03-11T10:00:00+00:00',
+            message_id='multi-2-v1@example.com',
+            num_patches=1,
+        )
+        tracking.update_series_status(conn, 'multi-2', 'reviewing', revision=1)
+        conn.close()
+
+        batches: List[Dict[str, str]] = []
+
+        def _fake_batch(topdir: str, branches: Dict[str, str]) -> Dict[str, Any]:
+            batches.append(dict(branches))
+            return {name: (1, 2, 3) for name in branches}
+
+        monkeypatch.setattr(_tracking_app, '_get_art_counts_batch', _fake_batch)
+        monkeypatch.setattr(
+            _tracking_app,
+            '_get_review_branch_tips',
+            lambda topdir: {
+                'b4/review/multi-1': 'deadbeef',
+                'b4/review/multi-2': 'cafebabe',
+            },
+        )
+        monkeypatch.setattr(
+            tracking, 'rescan_branches', lambda identifier, topdir: {'gone': 0}
+        )
+
+        app = TrackingApp('art-scope')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            assert set(batches[0]) == {'b4/review/multi-1', 'b4/review/multi-2'}
+
+            app._invalidate_caches('multi-1')
+            app._load_series()
+            await pilot.pause()
+            assert len(batches) == 2
+            assert set(batches[1]) == {'b4/review/multi-1'}
+
+    @pytest.mark.asyncio
+    async def test_an_intact_cache_is_not_recomputed(
+        self, tmp_path: pathlib.Path, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """The batch is a subprocess; a full cache must still short-circuit."""
+        self._seed('art-intact')
+
+        calls: List[int] = []
+
+        def _counting_batch(topdir: str, branches: Dict[str, str]) -> Dict[str, Any]:
+            calls.append(1)
+            return {name: (1, 2, 3) for name in branches}
+
+        monkeypatch.setattr(_tracking_app, '_get_art_counts_batch', _counting_batch)
+        monkeypatch.setattr(
+            _tracking_app,
+            '_get_review_branch_tips',
+            lambda topdir: {'b4/review/multi-1': 'deadbeef'},
+        )
+        monkeypatch.setattr(
+            tracking, 'rescan_branches', lambda identifier, topdir: {'gone': 0}
+        )
+
+        app = TrackingApp('art-intact')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            assert len(calls) == 1
+            app._load_series()
+            await pilot.pause()
+            assert len(calls) == 1
+
+
+class TestRethreadFlagReachesTheThreadFetch:
+    """The rethread flag has to survive the whole hop to retrieve_series_messages.
+
+    A rethreaded revision's recorded message-id is one patch's, so the
+    series is reassembled from its member patches instead.  The flag that
+    selects that path is carried by hand through the tracking list's
+    tracking_info dict and the thread viewer's series dict, and dropping it
+    at either hop fetches a single patch's thread instead of the series --
+    silently, with the message count collapsing to match.
+    """
+
+    @staticmethod
+    def _seed_rethreaded(identifier: str) -> None:
+        conn = tracking.init_db(identifier)
+        tracking.add_series_to_db(
+            conn,
+            change_id='rt-1',
+            revision=2,
+            subject='[PATCH v2 0/2] rt: stitched series',
+            sender_name='Rhea Rethread',
+            sender_email='rhea@example.com',
+            sent_at='2026-03-10T10:00:00+00:00',
+            message_id='rt-1-v2-p1@example.com',
+            num_patches=2,
+            is_rethreaded=True,
+        )
+        for rev in (1, 2):
+            tracking.add_revision(
+                conn,
+                'rt-1',
+                rev,
+                f'rt-1-v{rev}-p1@example.com',
+                subject=f'[PATCH v{rev} 1/2] rt: first',
+                is_rethreaded=rev == 2,
+            )
+        conn.close()
+
+    @pytest.mark.asyncio
+    async def test_tracking_info_carries_the_flag(self, tmp_path: pathlib.Path) -> None:
+        """[e] on a rethreaded series hands the viewer is_rethreaded=True."""
+        self._seed_rethreaded('rt-info')
+
+        app = TrackingApp('rt-info')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            with patch.object(app, 'push_screen') as mock_push:
+                await pilot.press('e')
+                await pilot.pause()
+            screen = mock_push.call_args[0][0]
+            assert screen._tracking_info['revision'] == 2
+            assert screen._tracking_info['is_rethreaded'] is True
+
+    def test_viewer_forwards_the_flag_to_the_retrieval(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        """The viewer's series dict is what selects the reassembly path."""
+        from b4.review_tui._lite_app import LiteThreadScreen
+
+        seen: Dict[str, Any] = {}
+
+        def _capture(series: Dict[str, Any], identifier: str) -> List[Any]:
+            seen.update(series)
+            return []
+
+        screen = LiteThreadScreen(
+            'rt-1-v2-p1@example.com',
+            tracking_info={
+                'identifier': 'rt-fwd',
+                'change_id': 'rt-1',
+                'revision': 2,
+                'is_rethreaded': True,
+            },
+        )
+        with patch.object(b4.review, 'retrieve_series_messages', _capture):
+            screen._fetch_thread()
+        assert seen['is_rethreaded'] is True
+        assert seen['revision'] == 2

-- 
2.53.0

