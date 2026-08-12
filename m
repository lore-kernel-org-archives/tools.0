Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B563E406261
	for <tools@linux.kernel.org>; Wed, 12 Aug 2026 21:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786571261; cv=none; b=gdbHndBPoNXTUL3Cb9CevWi5aE7zli7DKqBrTHSx0ZTXiYjYcruAnbbLURtd3RktaWFSJoEENAQy+kZTrpCjHk2d3b3Bt1miwXU6PnhB83DpCtjE6ugGlmEpf++9FWYy38Kjmu3zPoHMlp/HY32d199bUryif2xpewZ2pA3owx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786571261; c=relaxed/simple;
	bh=s1MDzFo6whMx5aTttg0U831s6iYYBbFBnFZxiRuB+qM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XFJL1crUB5HL65EUo7Vr2KXhWqaONxEDQQq7f5z+OdRD7wM/Zabuw9nUBGNZQW8avdHxR4w5mAgeyhM3drEuPYTS7sE6fUrlcKR3XSg4q2bA5dYO48QG4ScG9tvt9mPbwlLiw50dMKJKIJ0nNqxRkgLSYob5bvh2PHA8M6HdhTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TYZQ8p78; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TYZQ8p78"
Received: by smtp.kernel.org (Postfix)
	id B100E1F00A3A; Wed, 12 Aug 2026 21:47:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6B961F000E9;
	Wed, 12 Aug 2026 21:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786571257;
	bh=aBUe8iaGldw7rZq90UlqRqZkl2TO1Lf8Jv5YvVgLtsU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=TYZQ8p78mU21d6aQIaU2P5HUZhkspG9MECaUzgcrt5i3dJ0wJ6f9/LEkGq/KRnnUC
	 GR7NW76QJsTB4di9dtqdCLacuBRBKbIzl/+hV3Ru5/PYV6dnB3agcnxq7Grd9VcXqu
	 T1fX3Vx+CrsVdBxDLgl+v0uEyrn/GOGUQgBMQgrBH/QA6Uhwn9yi2C2OCBPoPCDuXi
	 xHhywQ8g25YgqlK1eBlD3b0d94xwWcWeuC2MuZ/TTNw/D5FmJMPaF33jJHhhDksTR3
	 +5iv+qWklRFp+YYPnSjky54oqO1Ew/O6dT7Mn9Xmg7lJwh3UPz9subqv+oiUjXWJqG
	 YkeMCFGYv7YYg==
From: Christian Brauner <brauner@kernel.org>
Date: Wed, 12 Aug 2026 23:47:02 +0200
Subject: [PATCH RFC v2 21/25] review: test the catalog mirror, stray
 matching and backward discovery
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260812-work-b4-multiver-rows-v2-21-305d53cd723a@kernel.org>
References: <20260812-work-b4-multiver-rows-v2-0-305d53cd723a@kernel.org>
In-Reply-To: <20260812-work-b4-multiver-rows-v2-0-305d53cd723a@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.17-dev-362b8
X-Developer-Signature: v=1; a=openpgp-sha256; l=77445; i=brauner@kernel.org;
 h=from:subject:message-id; bh=s1MDzFo6whMx5aTttg0U831s6iYYBbFBnFZxiRuB+qM=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTVvLx9uvzajAN9v+eWPjAPN38cXjGzqG3Bm8ePP4o9y
 uGWWDC7v6OUhUGMi0FWTJHFod0kXG45T8Vmo0wNmDmsTCBDGLg4BWAiHqyMDOsXqKVs9t0el7w4
 7URfK8fJtVb+KVN2Xcs1tz8c+T1IYi0jw5di0+tTt+rea/WPOb+h4vJqfY4FSe4dxZ1HJbZ5rDu
 /iQ8A
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Cover the catalog-sync watermark answering "already current" without
touching git, and a catalog write breaking it.  Cover stray matching by
message-id, a fingerprint that drifted, a catalog-only stray, and an
all-archived owner left alone.  Cover discover_older_revisions(): every
previous version recorded with an explicit wantvers, revisions dated from
their own posting, the one-shot latch, offline, the v1 no-op, conflicts
reported rather than absorbed, and the budget the follow-up poll runs
inside.

Also the branch sha recorded once per change_id, the force flag bypassing
the minimum-age skip, and the catalog thread snapshot advancing while the
tracking ref is frozen.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/tests/test_review.py          |  133 +++
 src/tests/test_review_tracking.py | 1612 +++++++++++++++++++++++++++++++++++++
 src/tests/test_tui_tracking.py    |   47 ++
 3 files changed, 1792 insertions(+)

diff --git a/src/tests/test_review.py b/src/tests/test_review.py
index f3adcb5a..a40b9af6 100644
--- a/src/tests/test_review.py
+++ b/src/tests/test_review.py
@@ -5544,3 +5544,136 @@ class TestExplicitUpdateReachesASnoozedSeries:
         the cron sweep's lore budget.
         """
         assert self._run('snooze-sweep', monkeypatch, forced=False) == []
+
+
+class TestCatalogMirrorSkipsABranchlessSeries:
+    """The sweep enumerates the review branches once; asking again is waste.
+
+    Every status outside BRANCH_UPDATE_STATUSES falls through to the
+    mirror below the branch save, and a series that has never been checked
+    out has nothing to mirror onto -- but the sync only learns that by
+    opening the database and spending a rev-parse, once per series, every
+    sweep.  A tracking list is mostly 'new' series.
+    """
+
+    @staticmethod
+    def _run(
+        monkeypatch: pytest.MonkeyPatch, identifier: str, **kwargs: Any
+    ) -> List[str]:
+        change_id = f'{identifier}-cid'
+        conn = b4.review.tracking.init_db(identifier)
+        b4.review.tracking.add_series_to_db(
+            conn,
+            change_id,
+            1,
+            'Subject',
+            'Author',
+            'a@example.com',
+            '2024-01-15T10:00:00+00:00',
+            'cover@example.com',
+            2,
+        )
+        conn.close()
+        synced: List[str] = []
+        monkeypatch.setattr(
+            b4.review.tracking,
+            'sync_revisions_catalog_to_branch',
+            lambda topdir, ident, cid: synced.append(cid),
+        )
+        monkeypatch.setattr(b4, 'git_worktree_busy', lambda topdir, branch: False)
+        monkeypatch.setattr(
+            b4.review.tracking, 'store_revision_thread_blob', lambda *a, **kw: None
+        )
+        monkeypatch.setattr(
+            b4.review.tracking, '_store_thread_blob', lambda *a, **kw: None
+        )
+
+        msg = email.message.EmailMessage()
+        msg['Message-Id'] = f'<{change_id}-r1@example.com>'
+        msg['Date'] = 'Mon, 27 Jul 2026 10:00:00 +0000'
+        mock_lmbx = mock.Mock()
+        mock_lmbx.series = {}
+        mock_lmbx.covers = {}
+        mock_lmbx.get_series.return_value = None
+        series_dict: Dict[str, Any] = {
+            'change_id': change_id,
+            'revision': 1,
+            'status': 'new',
+            'message_id': 'cover@example.com',
+        }
+        with (
+            mock.patch(
+                'b4.review._review.retrieve_series_messages', return_value=[msg]
+            ),
+            mock.patch('b4.LoreMailbox', return_value=mock_lmbx),
+        ):
+            review.update_series_tracking(
+                series_dict,
+                identifier,
+                'https://example.com/%s',
+                topdir='/nonexistent',
+                **kwargs,
+            )
+        return synced
+
+    def test_a_branchless_series_is_not_mirrored(
+        self, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        assert self._run(monkeypatch, 'mirror-none', review_branches=set()) == []
+
+    def test_a_series_with_a_branch_still_is(
+        self, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        assert self._run(
+            monkeypatch,
+            'mirror-some',
+            review_branches={'b4/review/mirror-some-cid'},
+        ) == ['mirror-some-cid']
+
+    def test_not_knowing_falls_back_to_asking(
+        self, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """A rescan that could not run must not mute the mirror."""
+        assert self._run(monkeypatch, 'mirror-unknown') == ['mirror-unknown-cid']
+
+
+def test_update_all_tracking_forwards_the_branch_set(
+    monkeypatch: pytest.MonkeyPatch,
+) -> None:
+    """One enumeration at the top of the sweep, not one git call per series."""
+    seen: List[Any] = []
+    monkeypatch.setattr(
+        b4.review.tracking,
+        'rescan_branches',
+        lambda identifier, topdir: {
+            'gone': 0,
+            'changed': 0,
+            'branches': {'b4/review/a'},
+        },
+    )
+    monkeypatch.setattr(
+        b4.review.tracking,
+        'get_all_tracked_series',
+        lambda identifier: [
+            {'change_id': 'a', 'subject': 's', 'status': 'new', 'sender_name': 'A'}
+        ],
+    )
+
+    def _fake(
+        one: Dict[str, Any],
+        identifier: str,
+        linkmask: str,
+        topdir: Optional[str] = None,
+        **kw: Any,
+    ) -> Dict[str, Any]:
+        seen.append(kw.get('review_branches'))
+        return {'new_revisions': 0, 'new_trailers': 0, 'error': None}
+
+    monkeypatch.setattr(review, 'update_series_tracking', _fake)
+    monkeypatch.setattr(
+        b4.review.tracking, 'update_revision_message_counts', lambda *a, **kw: {}
+    )
+    review.update_all_tracking(
+        'fwd-branches', 'https://lore.example/r/%s', topdir='/nonexistent'
+    )
+    assert seen == [{'b4/review/a'}]
diff --git a/src/tests/test_review_tracking.py b/src/tests/test_review_tracking.py
index 145fac8f..532c65c9 100644
--- a/src/tests/test_review_tracking.py
+++ b/src/tests/test_review_tracking.py
@@ -15,6 +15,7 @@ import pytest
 pytest.importorskip('textual')
 
 import b4
+import b4.mbox
 import b4.review
 import liblore
 from b4.review import tracking as review_tracking
@@ -1589,6 +1590,61 @@ class TestRescanBranches:
         assert row['status'] == 'replied'
         conn.close()
 
+    def test_rescan_records_one_branch_sha_per_change_id(self, gitdir: str) -> None:
+        """A change_id's branch sha is one fact, however many rows it has.
+
+        rescan_branches and the catalog-sync fast path both read it, and
+        while it lived on `series` they had to agree on which of a
+        change_id's rows to believe -- a stale copy on a higher-revision
+        row vouched for a watermark the branch move had just invalidated,
+        and an external branch reset then never re-mirrored the catalog.
+        On `changes` there is nothing to pick between.
+        """
+        identifier = 'rescan-onesha'
+        conn = review_tracking.init_db(identifier)
+        # A leftover row at a higher revision than the branch tracks,
+        # carrying the pre-move sha.
+        review_tracking.add_series_to_db(
+            conn,
+            'multi-change',
+            revision=3,
+            subject='Test series v3',
+            sender_name='Test Author',
+            sender_email='author@example.com',
+            sent_at='2024-01-15T10:00:00+00:00',
+            message_id='multi-change-v3@example.com',
+            num_patches=3,
+        )
+        review_tracking.set_branch_sha(conn, 'multi-change', 'stale-sha')
+        conn.close()
+
+        tracking_data = self._make_tracking_data('multi-change', identifier=identifier)
+        branch = _create_review_branch(gitdir, 'multi-change', tracking_data)
+        ecode, sha_out = b4.git_run_command(gitdir, ['rev-parse', branch])
+        assert ecode == 0
+        current_sha = sha_out.strip()
+
+        review_tracking.rescan_branches(identifier, gitdir, branch=branch)
+
+        conn = review_tracking.get_db(identifier)
+        revisions = [
+            r['revision']
+            for r in conn.execute(
+                "SELECT revision FROM series WHERE change_id = 'multi-change'"
+                ' ORDER BY revision'
+            )
+        ]
+        stored = review_tracking.get_branch_sha(conn, 'multi-change')
+        rows = conn.execute(
+            "SELECT COUNT(*) FROM changes WHERE change_id = 'multi-change'"
+        ).fetchone()[0]
+        conn.close()
+        # The branch's tracking commit names v1, and the leftover v3 row
+        # is untouched by the rescan -- yet there is still exactly one sha.
+        assert revisions == [1, 3]
+        assert rows == 1
+        assert stored == current_sha
+
 
 class TestFollowupCounts:
     """Tests for message_count / seen_message_count tracking."""
@@ -3697,6 +3753,109 @@ class TestRecordLinkedRevision:
         assert review_tracking.get_revisions(conn, 'series-B') == []
         conn.close()
 
+    def test_link_absorbs_a_stray_whose_fingerprint_drifted(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        """The message-id is what discover_older_revisions matched on.
+
+        A fingerprint hashes only the patches present, so a stray recorded
+        from a partial fetch does not match the one computed here -- and the
+        conflict notice sends the maintainer to [l] precisely then.  Matching
+        on fingerprint alone recorded a second copy of the same posting
+        instead of absorbing it.
+        """
+        conn = review_tracking.init_db('mrl-link-absorb-msgid')
+        _seed_target(conn, 'series-A', 1)
+        lser = _build_series(
+            '[PATCH v2] foo: fix bar', _AUTHOR, 2, msgid='<shared-v2@example.com>'
+        )
+        _seed_stray_series(conn, 'series-B', 2, 'a-stale-fingerprint')
+        conn.execute(
+            "UPDATE revisions SET message_id = 'shared-v2@example.com'"
+            " WHERE change_id = 'series-B'"
+        )
+        conn.commit()
+
+        result = review_tracking.record_linked_revision(conn, 'series-A', lser)
+
+        assert result['absorbed'] is True
+        assert review_tracking.get_revisions(conn, 'series-B') == []
+        conn.close()
+
+    def test_link_leaves_an_all_archived_stray_alone(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        """Absorbing deletes a series wholesale, records and all.
+
+        The v11 migration gave archived series rows catalog entries, which
+        put them in reach of the stray match for the first time.  They are
+        invisible in the tracking list, so absorbing one destroys a series
+        the maintainer never saw and could not have been asked about --
+        which is why discover_older_revisions will not even report them.
+        """
+        conn = review_tracking.init_db('mrl-link-archived-stray')
+        _seed_target(conn, 'series-A', 1)
+        lser = _build_series('[PATCH v2] foo: fix bar', _AUTHOR, 2)
+        _seed_stray_series(conn, 'series-B', 2, lser.fingerprint)
+        conn.execute(
+            "UPDATE series SET status = 'archived' WHERE change_id = 'series-B'"
+        )
+        conn.commit()
+
+        result = review_tracking.record_linked_revision(conn, 'series-A', lser)
+
+        assert result['status'] == 'linked'
+        assert result['absorbed'] is False
+        # The revision is recorded on the target...
+        revs = review_tracking.get_revisions(conn, 'series-A')
+        assert [r['revision'] for r in revs] == [1, 2]
+        # ...and the archived series still exists.
+        assert (
+            conn.execute(
+                "SELECT COUNT(*) FROM series WHERE change_id = 'series-B'"
+            ).fetchone()[0]
+            == 1
+        )
+        conn.close()
+
+    def test_link_absorbs_a_catalog_only_stray(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        """A catalog row with no series row behind it is still absorbable.
+
+        An upgraded stray keeps the version it left behind exactly that
+        way, and refusing it there records the same message-id under two
+        change_ids -- which then resolves by table order.
+        """
+        conn = review_tracking.init_db('mrl-link-catalog-only-stray')
+        _seed_target(conn, 'series-A', 1)
+        lser = _build_series(
+            '[PATCH v2] foo: fix bar', _AUTHOR, 2, msgid='<catalog-only@test.com>'
+        )
+        # A catalogued posting with no series row of its own.
+        review_tracking.add_revision(
+            conn,
+            'series-B',
+            2,
+            'catalog-only@test.com',
+            subject='[PATCH v2] foo: fix bar',
+            fingerprint=lser.fingerprint,
+        )
+
+        result = review_tracking.record_linked_revision(conn, 'series-A', lser)
+
+        revs = review_tracking.get_revisions(conn, 'series-A')
+        owners = conn.execute(
+            'SELECT change_id FROM revisions WHERE message_id = ?',
+            ('catalog-only@test.com',),
+        ).fetchall()
+        conn.close()
+        assert result['status'] == 'linked'
+        assert result['absorbed'] is True
+        assert [r['revision'] for r in revs] == [1, 2]
+        # One owner, so find_revision_by_message_id has nothing to pick between.
+        assert [r[0] for r in owners] == ['series-A']
+
 
 class TestUnlinkRevision:
     """Tier 5: unlink_revision() undoes a manual link only."""
@@ -4625,6 +4784,138 @@ class TestSyncRevisionsCatalogToBranch:
         _cover, tracking = b4.review.load_tracking(gitdir, 'b4/review/cid-A')
         assert tracking.get('known-revisions', []) == []
 
+    def test_steady_state_answers_without_git(
+        self, gitdir: str, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """The every-sweep no-op must not cost subprocesses.
+
+        The update sweep lands here each pass for every series outside the
+        four statuses whose branch save mirrors the catalog itself --
+        accepted and thanked included -- so "already current" has to come
+        from the catalog_synced watermark, not from three git reads.
+
+        The watermark is only half the answer: it names the branch sha the
+        mirror was made against, and only rescan_branches can say the
+        database has actually imported that sha.  So the sweep order is the
+        precondition -- rescan first, then this -- and the fast path stays
+        shut until it holds.
+        """
+        identifier = 'rt-port-sync-fast'
+        _make_review_branch_with_catalog(gitdir, identifier, 'cid-A', 5, [])
+        conn = review_tracking.init_db(identifier)
+        review_tracking.add_series_to_db(
+            conn,
+            change_id='cid-A',
+            revision=5,
+            subject='s',
+            sender_name='n',
+            sender_email='e@x',
+            sent_at='2026-06-01T00:00:00+00:00',
+            message_id='v5@example.com',
+            num_patches=1,
+        )
+        conn.close()
+        assert (
+            review_tracking.sync_revisions_catalog_to_branch(
+                gitdir, identifier, 'cid-A'
+            )
+            is True
+        )
+        # As update_all_tracking does at the top of every sweep.
+        review_tracking.rescan_branches(identifier, gitdir)
+        monkeypatch.setattr(
+            b4,
+            'git_run_command',
+            lambda *a, **kw: pytest.fail('steady-state sync must not touch git'),
+        )
+        monkeypatch.setattr(
+            b4,
+            'git_worktree_busy',
+            lambda *a, **kw: pytest.fail('steady-state sync must not touch git'),
+        )
+        assert (
+            review_tracking.sync_revisions_catalog_to_branch(
+                gitdir, identifier, 'cid-A'
+            )
+            is False
+        )
+
+    def test_a_catalog_write_breaks_the_watermark(self, gitdir: str) -> None:
+        identifier = 'rt-port-sync-dirty'
+        _make_review_branch_with_catalog(gitdir, identifier, 'cid-A', 5, [])
+        conn = review_tracking.init_db(identifier)
+        review_tracking.add_series_to_db(
+            conn,
+            change_id='cid-A',
+            revision=5,
+            subject='s',
+            sender_name='n',
+            sender_email='e@x',
+            sent_at='2026-06-01T00:00:00+00:00',
+            message_id='v5@example.com',
+            num_patches=1,
+        )
+        conn.close()
+        assert review_tracking.sync_revisions_catalog_to_branch(
+            gitdir, identifier, 'cid-A'
+        )
+        conn = review_tracking.get_db(identifier)
+        review_tracking.add_revision(conn, 'cid-A', 6, 'v6@example.com')
+        conn.close()
+        assert review_tracking.sync_revisions_catalog_to_branch(
+            gitdir, identifier, 'cid-A'
+        )
+        _cover, tracking = b4.review.load_tracking(gitdir, 'b4/review/cid-A')
+        known = {e['revision'] for e in tracking.get('known-revisions', [])}
+        assert known == {5, 6}
+
+    def test_migration_adds_the_watermark_column(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        _make_legacy_v10_db('sync-mig-watermark')
+        conn = review_tracking.get_db('sync-mig-watermark')
+        cols = {row[1] for row in conn.execute('PRAGMA table_info(changes)')}
+        version = conn.execute('SELECT version FROM schema_version').fetchone()[0]
+        conn.close()
+        assert 'catalog_synced' in cols
+        assert version == review_tracking.SCHEMA_VERSION
+
+    def test_the_mirror_does_not_vouch_for_an_unimported_branch(
+        self, gitdir: str
+    ) -> None:
+        """branch_sha means "imported", and only rescan_branches can say it.
+
+        The mirror reads a branch and may move it; it never imports its
+        tracking commit.  Recording the sha it saw as though it had made
+        rescan_branches skip that branch for ever -- so a status and a
+        known-revisions block pushed from another machine were silently
+        never replayed.
+        """
+        identifier = 'sync-no-vouch'
+        _make_review_branch_with_catalog(gitdir, identifier, 'cid-A', 5, [])
+        conn = review_tracking.init_db(identifier)
+        review_tracking.add_series_to_db(
+            conn,
+            change_id='cid-A',
+            revision=5,
+            subject='s',
+            sender_name='n',
+            sender_email='e@x',
+            sent_at='2026-06-01T00:00:00+00:00',
+            message_id='v5@example.com',
+            num_patches=1,
+        )
+        conn.close()
+        # The mirror runs against a branch the database has never imported.
+        review_tracking.sync_revisions_catalog_to_branch(gitdir, identifier, 'cid-A')
+        conn = review_tracking.get_db(identifier)
+        vouched = review_tracking.get_branch_sha(conn, 'cid-A')
+        conn.close()
+        assert vouched is None
+        # ...so the rescan still reads it.
+        result = review_tracking.rescan_branches(identifier, gitdir)
+        assert result['changed'] == 1
+
 
 class TestKnownProjects:
     """Tests for the identifier→repository reverse mapping."""
@@ -4768,6 +5059,40 @@ class TestUpdateMessageCountSeenBump:
         assert self._get_counts(conn) == (3, 3)
         conn.close()
 
+    def test_the_catalog_snapshot_advances_on_every_counted_fetch(
+        self, monkeypatch: pytest.MonkeyPatch, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        """The catalog copy is written whatever the tracking commit does.
+
+        seen_bump is derived from the previous thread snapshot, so a
+        snapshot that stops advancing while a branch is checked out
+        re-counts the same read messages as new on every sweep -- the
+        badge is then silently cleared for mail never opened.  The
+        catalog row's copy must therefore keep advancing regardless.
+        """
+        conn = self._setup_series('bump-frozen')
+        ref_saves: list[int] = []
+        cat_saves: list[int] = []
+        monkeypatch.setattr(
+            review_tracking,
+            '_store_thread_blob',
+            lambda topdir, cid, msgs, blob_sha=None: ref_saves.append(len(msgs)),
+        )
+        monkeypatch.setattr(
+            review_tracking,
+            'store_revision_thread_blob',
+            lambda conn, topdir, change_id, revision, msgs: cat_saves.append(len(msgs)),
+        )
+        review_tracking.update_message_count_from_msgs(
+            conn, 'bump-cid', 1, self._make_msgs(3), topdir='/nonexistent'
+        )
+        assert (cat_saves, ref_saves) == ([3], [3])
+        review_tracking.update_message_count_from_msgs(
+            conn, 'bump-cid', 1, self._make_msgs(5), topdir='/nonexistent'
+        )
+        assert (cat_saves, ref_saves) == ([3, 5], [3, 5])
+        conn.close()
+
 
 class TestFindTrackedChangeId:
     """Tests for find_tracked_change_id()."""
@@ -6392,6 +6717,44 @@ class TestUpdateRevisionMessageCounts:
         assert mbox is not None
         assert b'm-0@example.com' in mbox
 
+    def test_force_bypasses_the_minimum_age_skip(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """An explicit refresh polls versions the schedule would skip.
+
+        The poller's minimum-age gate exists for unattended sweeps; on a
+        user-initiated update a recently checked version being skipped
+        silently reads as the update not working.
+        """
+        now = datetime.datetime.now(datetime.timezone.utc).isoformat()
+        conn = review_tracking.init_db('poll-force')
+        review_tracking.add_revision(conn, 'cid', 1, 'v1@x')
+        conn.execute(
+            'UPDATE revisions SET message_count = 5, seen_message_count = 5,'
+            ' last_update_check = ?, last_mail_at = ?'
+            " WHERE change_id = 'cid' AND revision = 1",
+            (now, now),
+        )
+        conn.commit()
+        conn.close()
+        monkeypatch.setattr(
+            review_tracking,
+            '_fetch_revision_thread_msgs',
+            lambda identifier, conn, change_id, rev: _thread_msgs(7),
+        )
+        quiet = review_tracking.update_revision_message_counts(
+            'poll-force', [_poller_series('cid', 2, 'v2@x')]
+        )
+        assert quiet['polled'] == 0
+        forced = review_tracking.update_revision_message_counts(
+            'poll-force', [_poller_series('cid', 2, 'v2@x')], force=True
+        )
+        assert forced['polled'] == 1
+        conn = review_tracking.get_db('poll-force')
+        revs = {r['revision']: r for r in review_tracking.get_revisions(conn, 'cid')}
+        conn.close()
+        assert revs[1]['message_count'] == 7
+
 
 class TestRevisionAwareSyncHelpers:
     """refresh_message_count / sync_seen fall back to the catalog."""
@@ -8457,3 +8820,1252 @@ class TestMergeTrackedRevisionsHelper:
         # No read state: the entry supplies a message-id, not a badge.
         assert synth['message_count'] is None
         assert synth['seen_message_count'] is None
+
+
+class TestDiscoveredRevisionsAreDatedFromTheirPosting:
+    """found_at is the version's own Date:, not the moment it was recorded.
+
+    The backward search records versions posted long before the series was
+    tracked, and the version rows fall back to found_at whenever the
+    follow-up poll could not fill last_activity_at -- so dating them "now"
+    reported a year-old posting as found today and sorted the oldest
+    version after the newest.
+    """
+
+    def test_cover_date_is_used(self, tmp_path: pytest.TempPathFactory) -> None:
+        conn = review_tracking.init_db('rt-found-cover')
+        lmbx = _build_lmbx('thing', _AUTHOR, 2, 2, cover=True)
+        review_tracking._record_discovered_revisions(conn, 'cid-D', lmbx, '')
+        revs = review_tracking.get_revisions(conn, 'cid-D')
+        conn.close()
+        # 08:51:10 +0530 == 03:21:10 UTC
+        assert revs[0]['found_at'] == '2026-03-19T03:21:10+00:00'
+
+    def test_first_patch_date_is_used_without_a_cover(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        conn = review_tracking.init_db('rt-found-patch')
+        lmbx = _build_lmbx('thing', _AUTHOR, 2, 2)
+        review_tracking._record_discovered_revisions(conn, 'cid-E', lmbx, '')
+        revs = review_tracking.get_revisions(conn, 'cid-E')
+        conn.close()
+        assert revs[0]['found_at'] == '2026-03-19T03:21:12+00:00'
+
+
+class TestDiscoverOlderRevisions:
+    """The backward lore search records all previous versions."""
+
+    def test_records_all_previous_versions(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        conn = review_tracking.init_db('disc-all')
+        review_tracking.add_revision(conn, 'cid', 3, 'thing-v3-p1@example.com')
+        conn.close()
+        monkeypatch.setattr(b4, 'can_network', True)
+        base_msgs = _series_msgs('thing', _AUTHOR, 3, 2)
+        monkeypatch.setattr(
+            review_tracking, '_fetch_thread_msgs', lambda msgid: list(base_msgs)
+        )
+        seen_calls: list[tuple[int, Any]] = []
+
+        def _fake_extra(
+            msgs: list[EmailMessage],
+            direction: int = 1,
+            wantvers: Any = None,
+            nocache: bool = False,
+        ) -> list[EmailMessage]:
+            seen_calls.append((direction, wantvers))
+            return (
+                list(msgs)
+                + _series_msgs('thing', _AUTHOR, 2, 2)
+                + _series_msgs('thing', _AUTHOR, 1, 2)
+            )
+
+        monkeypatch.setattr(b4.mbox, 'get_extra_series', _fake_extra)
+        polled: list[tuple[str, Any]] = []
+        monkeypatch.setattr(
+            review_tracking,
+            'update_revision_message_counts',
+            lambda identifier, series_list, topdir=None, max_revisions_per_series=None, cancel_cb=None, only_revisions=None: (
+                polled.append((series_list[0]['change_id'], only_revisions))
+            ),
+        )
+        series = {
+            'change_id': 'cid',
+            'revision': 3,
+            'message_id': 'thing-v3-p1@example.com',
+            'status': 'new',
+        }
+        result = review_tracking.discover_older_revisions('disc-all', series, '')
+        assert result == {
+            'found': 2,
+            'revisions': [1, 2],
+            'conflicts': [],
+            'error': None,
+        }
+        assert seen_calls == [(-1, [1, 2])]
+        # Named outright: the two revisions just recorded, not a budget
+        # any other uncounted revision could spend.
+        assert polled == [('cid', {1, 2})]
+        conn = review_tracking.get_db('disc-all')
+        revs = {r['revision'] for r in review_tracking.get_revisions(conn, 'cid')}
+        conn.close()
+        assert revs == {1, 2, 3}
+
+    def test_rethreaded_series_is_reassembled_before_searching(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """A rethreaded seed is one patch's thread, which finds nothing.
+
+        get_extra_series() skips any patch numbered above 1 and gives up
+        without issuing a query when that leaves no base message, so
+        seeding from the recorded message-id alone can search for nothing
+        at all.  Reassemble from the member patches first, exactly as the
+        per-revision poller does.
+        """
+        conn = review_tracking.init_db('disc-rethreaded')
+        # The recorded message-id is patch 2's: the seed thread for it holds
+        # no cover and no 1/N, which is what defeats the backward search.
+        review_tracking.add_revision(
+            conn, 'cid', 3, 'thing-v3-p2@example.com', is_rethreaded=True
+        )
+        _insert_patches(
+            conn,
+            'cid',
+            3,
+            ['thing-v3-p1@example.com', 'thing-v3-p2@example.com'],
+        )
+        conn.close()
+        monkeypatch.setattr(b4, 'can_network', True)
+
+        def _no_plain_fetch(msgid: str) -> list[EmailMessage]:
+            raise AssertionError('must reassemble, not fetch one patch thread')
+
+        monkeypatch.setattr(review_tracking, '_fetch_thread_msgs', _no_plain_fetch)
+        seen_series: list[dict[str, Any]] = []
+
+        def _reassemble(series: dict[str, Any], identifier: str) -> list[EmailMessage]:
+            seen_series.append(series)
+            return _series_msgs('thing', _AUTHOR, 3, 2)
+
+        monkeypatch.setattr(b4.review, 'retrieve_series_messages', _reassemble)
+        seen_calls: list[tuple[int, Any]] = []
+
+        def _fake_extra(
+            msgs: list[EmailMessage],
+            direction: int = 1,
+            wantvers: Any = None,
+            nocache: bool = False,
+        ) -> list[EmailMessage]:
+            seen_calls.append((direction, wantvers))
+            return list(msgs) + _series_msgs('thing', _AUTHOR, 2, 2)
+
+        monkeypatch.setattr(b4.mbox, 'get_extra_series', _fake_extra)
+        monkeypatch.setattr(
+            review_tracking,
+            'update_revision_message_counts',
+            lambda *a, **kw: {'updated': 0, 'new_mail': 0, 'errors': 0, 'polled': 0},
+        )
+        series = {
+            'change_id': 'cid',
+            'revision': 3,
+            'message_id': 'thing-v3-p2@example.com',
+            'is_rethreaded': True,
+            'status': 'new',
+        }
+        result = review_tracking.discover_older_revisions('disc-rethreaded', series, '')
+
+        assert seen_series and seen_series[0]['is_rethreaded'] is True
+        assert seen_calls == [(-1, [1, 2])]
+        assert result['found'] == 1
+        assert result['revisions'] == [2]
+
+    def test_tracked_revision_is_not_reported_as_found(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """The seed thread is v3's, so v3 is always in the mailbox.
+
+        With no catalog row for it -- the case the whole tracked-revision
+        synthesis exists for -- it counted as newly discovered, and the
+        search reported the version the maintainer is already on.
+        """
+        review_tracking.init_db('disc-tracked').close()
+        monkeypatch.setattr(b4, 'can_network', True)
+        base_msgs = _series_msgs('thing', _AUTHOR, 3, 2)
+        monkeypatch.setattr(
+            review_tracking, '_fetch_thread_msgs', lambda msgid: list(base_msgs)
+        )
+        monkeypatch.setattr(
+            b4.mbox,
+            'get_extra_series',
+            lambda msgs, direction=1, wantvers=None, nocache=False: (
+                list(msgs) + _series_msgs('thing', _AUTHOR, 2, 2)
+            ),
+        )
+        monkeypatch.setattr(
+            review_tracking,
+            'update_revision_message_counts',
+            lambda *a, **kw: None,
+        )
+        series = {
+            'change_id': 'cid',
+            'revision': 3,
+            'message_id': 'thing-v3-p1@example.com',
+            'status': 'new',
+        }
+        result = review_tracking.discover_older_revisions('disc-tracked', series, '')
+        assert result == {
+            'found': 1,
+            'revisions': [2],
+            'conflicts': [],
+            'error': None,
+        }
+        # v3 is still recorded, just not announced as a find.
+        conn = review_tracking.get_db('disc-tracked')
+        revs = {r['revision'] for r in review_tracking.get_revisions(conn, 'cid')}
+        conn.close()
+        assert revs == {2, 3}
+
+    def test_offline_reports_error(self, tmp_path: pytest.TempPathFactory) -> None:
+        review_tracking.init_db('disc-off').close()
+        series = {'change_id': 'cid', 'revision': 3, 'message_id': 'v3@x'}
+        result = review_tracking.discover_older_revisions('disc-off', series, '')
+        assert result == {
+            'found': 0,
+            'revisions': [],
+            'conflicts': [],
+            'error': 'offline',
+        }
+
+    def test_v1_is_noop(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        review_tracking.init_db('disc-v1').close()
+
+        def _boom(msgid: str) -> list[EmailMessage]:
+            raise AssertionError('must not fetch for v1')
+
+        monkeypatch.setattr(review_tracking, '_fetch_thread_msgs', _boom)
+        series = {'change_id': 'cid', 'revision': 1, 'message_id': 'v1@x'}
+        result = review_tracking.discover_older_revisions('disc-v1', series, '')
+        assert result == {
+            'found': 0,
+            'revisions': [],
+            'conflicts': [],
+            'error': None,
+        }
+
+    def test_nothing_new_found(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        conn = review_tracking.init_db('disc-none')
+        review_tracking.add_revision(conn, 'cid', 3, 'thing-v3-p1@example.com')
+        conn.close()
+        monkeypatch.setattr(b4, 'can_network', True)
+        base_msgs = _series_msgs('thing', _AUTHOR, 3, 2)
+        monkeypatch.setattr(
+            review_tracking, '_fetch_thread_msgs', lambda msgid: list(base_msgs)
+        )
+        monkeypatch.setattr(
+            b4.mbox,
+            'get_extra_series',
+            lambda msgs, direction=1, wantvers=None, nocache=False: list(msgs),
+        )
+
+        def _no_poll(*args: Any, **kw: Any) -> None:
+            raise AssertionError('poller must not run when nothing was found')
+
+        monkeypatch.setattr(review_tracking, 'update_revision_message_counts', _no_poll)
+        series = {
+            'change_id': 'cid',
+            'revision': 3,
+            'message_id': 'thing-v3-p1@example.com',
+        }
+        result = review_tracking.discover_older_revisions('disc-none', series, '')
+        assert result == {
+            'found': 0,
+            'revisions': [],
+            'conflicts': [],
+            'error': None,
+        }
+
+
+class TestBackwardSearchOneShot:
+    """The sweep's backward search runs once per series, then latches.
+
+    The catalog alone cannot carry the latch -- the v11 backfill gives
+    every series row an entry -- and revision provenance cannot either:
+    offline tracking and manual linking both stamp a source with no
+    search behind it.  A dedicated series.back_searched column records
+    that the search ran, found older versions or not.
+    """
+
+    @staticmethod
+    def _sweep(
+        identifier: str,
+        monkeypatch: pytest.MonkeyPatch,
+        backward: list[list[int]],
+        online: bool = True,
+    ) -> None:
+        monkeypatch.setattr(b4, 'can_network', online)
+
+        def _fake_extra(
+            msgs: list[EmailMessage],
+            direction: int = 1,
+            wantvers: Any = None,
+            nocache: bool = False,
+        ) -> list[EmailMessage]:
+            if direction == -1:
+                backward.append(list(wantvers or []))
+            return list(msgs)
+
+        monkeypatch.setattr(b4.mbox, 'get_extra_series', _fake_extra)
+        monkeypatch.setattr(
+            'b4.review._review.retrieve_series_messages',
+            lambda series, identifier: _series_msgs('thing', _AUTHOR, 3, 1),
+        )
+        series = {
+            'change_id': 'os-cid',
+            'revision': 3,
+            'status': 'new',
+            'message_id': 'thing-v3-p1@example.com',
+        }
+        result = b4.review.update_series_tracking(
+            series, identifier, 'https://l.example/%s'
+        )
+        assert result.get('error') is None
+
+    @staticmethod
+    def _seed(identifier: str) -> None:
+        conn = review_tracking.init_db(identifier)
+        review_tracking.add_series_to_db(
+            conn,
+            change_id='os-cid',
+            revision=3,
+            subject='thing',
+            sender_name='n',
+            sender_email='e@x',
+            sent_at='2026-06-01T00:00:00+00:00',
+            message_id='thing-v3-p1@example.com',
+            num_patches=1,
+        )
+        conn.close()
+
+    def test_finding_nothing_still_latches(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """A v3 whose v1/v2 are not on lore must not be re-searched forever.
+
+        The subject+sender query behind the backward search is the
+        expensive kind, and 'found nothing' records no catalog row -- so a
+        guard reading only the revision set re-fired it on every 'u', 'U'
+        and cron pass for the lifetime of the series.
+        """
+        self._seed('oneshot-dry')
+        backward: list[list[int]] = []
+        self._sweep('oneshot-dry', monkeypatch, backward)
+        assert backward == [[1, 2]]
+        conn = review_tracking.get_db('oneshot-dry')
+        revs = {r['revision']: r for r in review_tracking.get_revisions(conn, 'os-cid')}
+        assert review_tracking.is_back_searched(conn, 'os-cid')
+        conn.close()
+        assert revs[3]['source'] == 'discovered'
+        self._sweep('oneshot-dry', monkeypatch, backward)
+        assert backward == [[1, 2]]
+
+    def test_an_offline_sweep_does_not_latch(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """Recording a cached thread proves nothing about lore."""
+        self._seed('oneshot-offline')
+        backward: list[list[int]] = []
+        self._sweep('oneshot-offline', monkeypatch, backward, online=False)
+        assert backward == []
+        self._sweep('oneshot-offline', monkeypatch, backward)
+        assert backward == [[1, 2]]
+
+    def test_a_manual_link_does_not_latch(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """Relinking the tracked revision proves nothing about lore.
+
+        [l] and absorb promote the tracked revision's row to 'manual'
+        through add_revision's rank upgrade.  The old provenance latch
+        read any rank above 'heuristic' as "search already ran", so a
+        relinked series never had its older versions looked for.
+        """
+        self._seed('oneshot-manual')
+        conn = review_tracking.get_db('oneshot-manual')
+        review_tracking.add_revision(
+            conn, 'os-cid', 3, 'thing-v3-p1@example.com', source='manual'
+        )
+        conn.close()
+        backward: list[list[int]] = []
+        self._sweep('oneshot-manual', monkeypatch, backward)
+        assert backward == [[1, 2]]
+
+
+class TestDiscoverOlderConflicts:
+    def test_stray_tracked_version_is_reported_not_duplicated(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """v1 tracked under its own change_id must not become a second row."""
+        conn = review_tracking.init_db('disc-conflict')
+        monkeypatch.setattr(b4, 'can_network', True)
+        base_msgs = _series_msgs('thing', _AUTHOR, 3, 2)
+        older = _series_msgs('thing', _AUTHOR, 1, 2)
+        # Record v1 under a different change_id, by its own fingerprint.
+        lmbx = b4.LoreMailbox()
+        for msg in older:
+            lmbx.add_message(msg)
+        review_tracking.add_revision(
+            conn,
+            'stray-cid',
+            1,
+            'thing-v1-p1@example.com',
+            fingerprint=lmbx.series[1].fingerprint,
+        )
+        review_tracking.add_revision(conn, 'cid', 3, 'thing-v3-p1@example.com')
+        conn.commit()
+        conn.close()
+        monkeypatch.setattr(
+            review_tracking, '_fetch_thread_msgs', lambda msgid: list(base_msgs)
+        )
+        monkeypatch.setattr(
+            b4.mbox,
+            'get_extra_series',
+            lambda msgs, direction=1, wantvers=None, nocache=False: list(msgs) + older,
+        )
+        monkeypatch.setattr(
+            review_tracking,
+            'update_revision_message_counts',
+            lambda *a, **kw: {'updated': 0, 'new_mail': 0, 'errors': 0, 'polled': 0},
+        )
+        series = {
+            'change_id': 'cid',
+            'revision': 3,
+            'message_id': 'thing-v3-p1@example.com',
+        }
+        result = review_tracking.discover_older_revisions('disc-conflict', series, '')
+        assert result['conflicts'] == [1]
+        assert result['found'] == 0
+        conn = review_tracking.get_db('disc-conflict')
+        revs = {r['revision'] for r in review_tracking.get_revisions(conn, 'cid')}
+        conn.close()
+        assert revs == {3}
+
+    def test_a_version_we_already_catalog_is_not_a_conflict(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """Nothing to link, so nothing to report.
+
+        A series without a change-id trailer gets one synthesized per
+        posting, so tracking three versions of it makes three change_ids
+        that each catalog the same history.  Every version then matches a
+        stray, and the report sent the maintainer to [l] for versions the
+        series already held -- where absorbing would not change the row
+        (add_revision is first-wins on message_id) and would only delete
+        the series that owned the other copy.
+        """
+        conn = review_tracking.init_db('disc-conflict-own')
+        monkeypatch.setattr(b4, 'can_network', True)
+        base_msgs = _series_msgs('thing', _AUTHOR, 3, 2)
+        older = _series_msgs('thing', _AUTHOR, 1, 2)
+        lmbx = b4.LoreMailbox()
+        for msg in older:
+            lmbx.add_message(msg)
+        # A live series elsewhere owns v1 ...
+        review_tracking.add_revision(
+            conn,
+            'stray-cid',
+            1,
+            'thing-v1-p1@example.com',
+            fingerprint=lmbx.series[1].fingerprint,
+        )
+        review_tracking.add_series_to_db(
+            conn,
+            change_id='stray-cid',
+            revision=1,
+            subject='[PATCH] thing',
+            sender_name='S',
+            sender_email='s@e.com',
+            sent_at='2026-01-01T00:00:00+00:00',
+            message_id='thing-v1-p1@example.com',
+            num_patches=2,
+        )
+        # ... and so do we, already.
+        review_tracking.add_revision(conn, 'cid', 1, 'thing-v1-p1@example.com')
+        review_tracking.add_revision(conn, 'cid', 3, 'thing-v3-p1@example.com')
+        conn.commit()
+        conn.close()
+        monkeypatch.setattr(
+            review_tracking, '_fetch_thread_msgs', lambda msgid: list(base_msgs)
+        )
+        monkeypatch.setattr(
+            b4.mbox,
+            'get_extra_series',
+            lambda msgs, direction=1, wantvers=None, nocache=False: list(msgs) + older,
+        )
+        series = {
+            'change_id': 'cid',
+            'revision': 3,
+            'message_id': 'thing-v3-p1@example.com',
+        }
+        result = review_tracking.discover_older_revisions(
+            'disc-conflict-own', series, ''
+        )
+        assert result['conflicts'] == []
+        assert result['found'] == 0
+        # and the stray series is still there, untouched
+        conn = review_tracking.get_db('disc-conflict-own')
+        assert (
+            conn.execute(
+                "SELECT COUNT(*) FROM series WHERE change_id = 'stray-cid'"
+            ).fetchone()[0]
+            == 1
+        )
+        conn.close()
+
+    def test_partially_retrieved_stray_is_still_caught(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """A fingerprint hashes only the patches present.
+
+        The backward search routinely returns an older version short a
+        patch, so its recomputed fingerprint need not match the one stored
+        when that version was tracked standalone.  The message-id does not
+        move, and catching the stray by that is what keeps one posting from
+        landing under two change_ids.
+        """
+        conn = review_tracking.init_db('disc-conflict-partial')
+        monkeypatch.setattr(b4, 'can_network', True)
+        base_msgs = _series_msgs('thing', _AUTHOR, 3, 2)
+        older = _series_msgs('thing', _AUTHOR, 1, 2)
+        # The stray was recorded from the whole v1; the search below returns
+        # it one patch short, so the fingerprints cannot agree.
+        lmbx = b4.LoreMailbox()
+        for msg in older:
+            lmbx.add_message(msg)
+        full_fingerprint = lmbx.series[1].fingerprint
+        review_tracking.add_revision(
+            conn,
+            'stray-cid',
+            1,
+            'thing-v1-p1@example.com',
+            fingerprint=full_fingerprint,
+        )
+        review_tracking.add_revision(conn, 'cid', 3, 'thing-v3-p1@example.com')
+        conn.commit()
+        conn.close()
+        partial = [m for m in older if 'p2' not in str(m['Message-Id'])]
+        plmbx = b4.LoreMailbox()
+        for msg in partial:
+            plmbx.add_message(msg)
+        assert plmbx.series[1].fingerprint != full_fingerprint
+
+        monkeypatch.setattr(
+            review_tracking, '_fetch_thread_msgs', lambda msgid: list(base_msgs)
+        )
+        monkeypatch.setattr(
+            b4.mbox,
+            'get_extra_series',
+            lambda msgs, direction=1, wantvers=None, nocache=False: (
+                list(msgs) + partial
+            ),
+        )
+        monkeypatch.setattr(
+            review_tracking,
+            'update_revision_message_counts',
+            lambda *a, **kw: {'updated': 0, 'new_mail': 0, 'errors': 0, 'polled': 0},
+        )
+        series = {
+            'change_id': 'cid',
+            'revision': 3,
+            'message_id': 'thing-v3-p1@example.com',
+        }
+        result = review_tracking.discover_older_revisions(
+            'disc-conflict-partial', series, ''
+        )
+        assert result['conflicts'] == [1]
+        assert result['found'] == 0
+        conn = review_tracking.get_db('disc-conflict-partial')
+        rows = conn.execute(
+            "SELECT change_id FROM revisions WHERE message_id = 'thing-v1-p1@example.com'"
+        ).fetchall()
+        conn.close()
+        # One posting, one catalog row.
+        assert [r[0] for r in rows] == ['stray-cid']
+
+    def test_the_tracked_revision_is_never_a_conflict(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """The seed thread is the tracked revision's, so lmbx always holds it.
+
+        A stray duplicate of that same posting matches the stray lookup like
+        any other, and reporting it sends the maintainer to [l] to link the
+        version they are already sitting on.  The search is for *older*
+        revisions; its report is about those.
+        """
+        conn = review_tracking.init_db('disc-self-conflict')
+        monkeypatch.setattr(b4, 'can_network', True)
+        v2 = _series_msgs('thing', _AUTHOR, 2, 2)
+        # another change_id already owns the very posting 'cid' tracks
+        review_tracking.add_revision(conn, 'dup-cid', 2, 'thing-v2-p1@example.com')
+        review_tracking.add_series_to_db(
+            conn,
+            change_id='dup-cid',
+            revision=2,
+            subject='[PATCH v2] thing',
+            sender_name='S',
+            sender_email='s@e.com',
+            sent_at='2026-01-01T00:00:00+00:00',
+            message_id='thing-v2-p1@example.com',
+            num_patches=2,
+        )
+        review_tracking.add_revision(conn, 'cid', 2, 'thing-v2-p1@example.com')
+        conn.commit()
+        conn.close()
+        monkeypatch.setattr(
+            review_tracking, '_fetch_thread_msgs', lambda msgid: list(v2)
+        )
+        monkeypatch.setattr(
+            b4.mbox,
+            'get_extra_series',
+            lambda msgs, direction=1, wantvers=None, nocache=False: list(msgs),
+        )
+        series = {
+            'change_id': 'cid',
+            'revision': 2,
+            'message_id': 'thing-v2-p1@example.com',
+        }
+        result = review_tracking.discover_older_revisions(
+            'disc-self-conflict', series, ''
+        )
+        assert result['conflicts'] == []
+        assert result['found'] == 0
+
+
+class TestDiscoverIgnoresArchivedStrays:
+    def test_an_archived_only_stray_is_not_a_conflict(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """The v11 migration gave archived series rows catalog entries too.
+
+        Reporting one sends the maintainer after a series the tracking list
+        does not show and [l] cannot reach.
+        """
+        conn = review_tracking.init_db('disc-archived')
+        monkeypatch.setattr(b4, 'can_network', True)
+        base_msgs = _series_msgs('thing', _AUTHOR, 3, 2)
+        older = _series_msgs('thing', _AUTHOR, 1, 2)
+        lmbx = b4.LoreMailbox()
+        for msg in older:
+            lmbx.add_message(msg)
+        review_tracking.add_series_to_db(
+            conn,
+            change_id='stray-cid',
+            revision=1,
+            subject='[PATCH] thing',
+            sender_name='S',
+            sender_email='s@e.com',
+            sent_at='2026-01-01T00:00:00+00:00',
+            message_id='thing-v1-p1@example.com',
+            num_patches=2,
+        )
+        review_tracking.add_revision(
+            conn,
+            'stray-cid',
+            1,
+            'thing-v1-p1@example.com',
+            fingerprint=lmbx.series[1].fingerprint,
+        )
+        review_tracking.update_series_status(conn, 'stray-cid', 'archived', revision=1)
+        review_tracking.add_revision(conn, 'cid', 3, 'thing-v3-p1@example.com')
+        conn.commit()
+        conn.close()
+        monkeypatch.setattr(
+            review_tracking, '_fetch_thread_msgs', lambda msgid: list(base_msgs)
+        )
+        monkeypatch.setattr(
+            b4.mbox,
+            'get_extra_series',
+            lambda msgs, direction=1, wantvers=None, nocache=False: list(msgs) + older,
+        )
+        monkeypatch.setattr(
+            review_tracking,
+            'update_revision_message_counts',
+            lambda *a, **kw: {'updated': 0, 'new_mail': 0, 'errors': 0, 'polled': 0},
+        )
+        series = {
+            'change_id': 'cid',
+            'revision': 3,
+            'message_id': 'thing-v3-p1@example.com',
+        }
+        result = review_tracking.discover_older_revisions('disc-archived', series, '')
+        assert result['conflicts'] == []
+        assert result['found'] == 1
+        conn = review_tracking.get_db('disc-archived')
+        revs = {r['revision'] for r in review_tracking.get_revisions(conn, 'cid')}
+        conn.close()
+        assert revs == {1, 3}
+
+
+class TestAbsorbIsRevisionScoped:
+    """Absorbing one version must not delete a stray's other postings."""
+
+    @staticmethod
+    def _seed(identifier: str) -> sqlite3.Connection:
+        conn = review_tracking.init_db(identifier)
+        _seed_target(conn, 'target', 3)
+        for rev in (1, 2, 3):
+            review_tracking.add_series_to_db(
+                conn,
+                change_id='stray',
+                revision=rev,
+                subject=f'[PATCH v{rev}] s',
+                sender_name='n',
+                sender_email='e@x',
+                sent_at='2026-06-01T00:00:00+00:00',
+                message_id=f'stray-v{rev}@x',
+                num_patches=1,
+            )
+            review_tracking.add_revision(
+                conn, 'stray', rev, f'stray-v{rev}@x', source='manual'
+            )
+            _insert_patches(conn, 'stray', rev, [f'stray-v{rev}-p1@x'])
+        conn.commit()
+        return conn
+
+    def test_other_versions_survive(self, tmp_path: pytest.TempPathFactory) -> None:
+        """Their per-patch message-ids cannot be re-derived from the list."""
+        conn = self._seed('absorb-scope')
+        assert review_tracking.absorb_series_as_revision(
+            conn, 'target', 'stray', 2, stray_revision=2
+        )
+        left = [
+            r[0]
+            for r in conn.execute(
+                "SELECT revision FROM series WHERE change_id = 'stray'"
+                ' ORDER BY revision'
+            )
+        ]
+        patches = conn.execute(
+            "SELECT COUNT(*) FROM series_patches WHERE change_id = 'stray'"
+        ).fetchone()[0]
+        conn.close()
+        assert left == [1, 3]
+        assert patches == 2
+
+    def test_the_last_version_takes_the_leftovers(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        """Nothing reaches a change_id with no series row left."""
+        conn = review_tracking.init_db('absorb-last')
+        _seed_target(conn, 'target', 2)
+        review_tracking.add_series_to_db(
+            conn,
+            change_id='stray',
+            revision=1,
+            subject='[PATCH] s',
+            sender_name='n',
+            sender_email='e@x',
+            sent_at='2026-06-01T00:00:00+00:00',
+            message_id='stray-v1@x',
+            num_patches=1,
+        )
+        review_tracking.add_revision(conn, 'stray', 1, 'stray-v1@x')
+        _insert_patches(conn, 'stray', 1, ['stray-v1-p1@x'])
+        conn.commit()
+        assert review_tracking.absorb_series_as_revision(
+            conn, 'target', 'stray', 1, stray_revision=1
+        )
+        rows = [
+            conn.execute(
+                f"SELECT COUNT(*) FROM {t} WHERE change_id = 'stray'"
+            ).fetchone()[0]
+            for t in ('series', 'revisions', 'series_patches')
+        ]
+        conn.close()
+        assert rows == [0, 0, 0]
+
+    def test_an_absorb_merges_read_state_instead_of_dropping_it(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        """Totals take the larger side, seen the smaller, stamps the newer.
+
+        The stray is where the maintainer was actually reading, and its
+        rows are deleted by the absorb -- a copy gated on the target being
+        blank threw that read state away whenever the forward sweep had
+        first-fetched the same posting under the target (seen = count),
+        rendering genuinely unread mail read.  A false badge from the
+        conservative merge clears on open; a suppressed one never comes
+        back.
+        """
+        conn = self._seed('absorb-readstate')
+        # Already catalogued and first-fetched under the target, which is
+        # what the forward sweep plus the poller leave behind.
+        review_tracking.add_revision(conn, 'target', 2, 'target-v2@x')
+        conn.execute(
+            'UPDATE revisions SET message_count = 30, seen_message_count = 30,'
+            " last_update_check = '2026-01-01T00:00:00+00:00'"
+            " WHERE change_id = 'target' AND revision = 2"
+        )
+        conn.execute(
+            'UPDATE revisions SET message_count = 4, seen_message_count = 1,'
+            " last_update_check = '2026-06-01T00:00:00+00:00',"
+            " last_mail_at = '2026-05-30T00:00:00+00:00'"
+            " WHERE change_id = 'stray' AND revision = 2"
+        )
+        conn.commit()
+        review_tracking.absorb_series_as_revision(
+            conn, 'target', 'stray', 2, stray_revision=2
+        )
+        row = conn.execute(
+            'SELECT message_count, seen_message_count, last_update_check,'
+            ' last_mail_at FROM revisions'
+            " WHERE change_id = 'target' AND revision = 2"
+        ).fetchone()
+        conn.close()
+        assert (row[0], row[1]) == (30, 1)
+        assert row[2] == '2026-06-01T00:00:00+00:00'
+        assert row[3] == '2026-05-30T00:00:00+00:00'
+
+
+class TestStrayMatchingIsOneRule:
+    """[l]'s preview, the absorb it performs and [o]'s conflicts agree."""
+
+    def test_message_id_beats_a_stale_fingerprint(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        """A revision recorded from a partial fetch hashes differently."""
+        conn = review_tracking.init_db('stray-msgid')
+        review_tracking.add_series_to_db(
+            conn,
+            change_id='owner',
+            revision=2,
+            subject='s',
+            sender_name='n',
+            sender_email='e@x',
+            sent_at='2026-06-01T00:00:00+00:00',
+            message_id='v2@x',
+            num_patches=1,
+        )
+        review_tracking.add_revision(
+            conn, 'owner', 2, 'v2@x', fingerprint='partial-hash'
+        )
+        conn.commit()
+        found = review_tracking.find_stray_revision(
+            conn, 'other', 'v2@x', 'complete-hash'
+        )
+        conn.close()
+        assert found is not None
+        assert found['change_id'] == 'owner'
+
+    def test_an_all_archived_owner_is_not_a_match(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        """It is invisible in the tracking list, so it cannot be acted on."""
+        conn = review_tracking.init_db('stray-archived')
+        review_tracking.add_series_to_db(
+            conn,
+            change_id='owner',
+            revision=2,
+            subject='s',
+            sender_name='n',
+            sender_email='e@x',
+            sent_at='2026-06-01T00:00:00+00:00',
+            message_id='v2@x',
+            num_patches=1,
+        )
+        review_tracking.add_revision(conn, 'owner', 2, 'v2@x', fingerprint='fp')
+        review_tracking.update_series_status(conn, 'owner', 'archived')
+        conn.commit()
+        found = review_tracking.find_stray_revision(conn, 'other', 'v2@x', 'fp')
+        conn.close()
+        assert found is None
+
+    def test_the_owning_series_itself_is_not_a_stray(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        conn = review_tracking.init_db('stray-self')
+        review_tracking.add_revision(conn, 'mine', 2, 'v2@x', fingerprint='fp')
+        conn.commit()
+        found = review_tracking.find_stray_revision(conn, 'mine', 'v2@x', 'fp')
+        conn.close()
+        assert found is None
+
+    def test_the_target_holding_the_msgid_does_not_hide_the_stray(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        """Nothing constrains a message-id to one change_id.
+
+        Auto-discovery records the posting under the link target, then the
+        maintainer links it: two catalog rows for one message-id.  Taking
+        the first row back answers with the target whenever it sorts first
+        -- 'aaa' before 'zzz' -- so [l] reported no stray and duplicated
+        the series instead of absorbing it.
+        """
+        conn = review_tracking.init_db('stray-shadowed')
+        # 'aaa' is the link target and sorts first.
+        review_tracking.add_revision(conn, 'aaa', 2, 'v2@x', fingerprint='fp')
+        review_tracking.add_series_to_db(
+            conn,
+            change_id='zzz',
+            revision=2,
+            subject='s',
+            sender_name='n',
+            sender_email='e@x',
+            sent_at='2026-06-01T00:00:00+00:00',
+            message_id='v2@x',
+            num_patches=1,
+        )
+        review_tracking.add_revision(conn, 'zzz', 2, 'v2@x', fingerprint='fp')
+        conn.commit()
+        found = review_tracking.find_stray_revision(conn, 'aaa', 'v2@x', 'fp')
+        conn.close()
+        assert found is not None
+        assert found['change_id'] == 'zzz'
+
+    def test_an_archived_owner_does_not_hide_a_live_one(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        """Same walk, one row further: 'aaa' is archived, 'zzz' is not."""
+        conn = review_tracking.init_db('stray-archived-first')
+        for cid in ('aaa', 'zzz'):
+            review_tracking.add_series_to_db(
+                conn,
+                change_id=cid,
+                revision=2,
+                subject='s',
+                sender_name='n',
+                sender_email='e@x',
+                sent_at='2026-06-01T00:00:00+00:00',
+                message_id='v2@x',
+                num_patches=1,
+            )
+            review_tracking.add_revision(conn, cid, 2, 'v2@x', fingerprint='fp')
+        review_tracking.update_series_status(conn, 'aaa', 'archived')
+        conn.commit()
+        found = review_tracking.find_stray_revision(conn, 'other', 'v2@x', 'fp')
+        conn.close()
+        assert found is not None
+        assert found['change_id'] == 'zzz'
+
+
+class TestMarkingReadNeverUnreads:
+    """A monotonic writer must not lower the catalog's seen count."""
+
+    def test_mark_all_seen_only_raises_the_catalog(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        """The catalog can legitimately hold the larger fully-read pair."""
+        conn = review_tracking.init_db('seen-floor')
+        review_tracking.add_series_to_db(
+            conn,
+            change_id='cid',
+            revision=2,
+            subject='s',
+            sender_name='n',
+            sender_email='e@x',
+            sent_at='2026-06-01T00:00:00+00:00',
+            message_id='v2@x',
+            num_patches=1,
+        )
+        review_tracking.add_revision(conn, 'cid', 2, 'v2@x')
+        conn.execute(
+            'UPDATE revisions SET message_count = 20, seen_message_count = 18'
+            " WHERE change_id = 'cid' AND revision = 2"
+        )
+        conn.execute(
+            'UPDATE revisions SET message_count = 25, seen_message_count = 25'
+            " WHERE change_id = 'cid' AND revision = 2"
+        )
+        conn.commit()
+        review_tracking.mark_all_messages_seen(conn, 'cid', 2)
+        row = conn.execute(
+            'SELECT message_count, seen_message_count FROM revisions'
+            " WHERE change_id = 'cid' AND revision = 2"
+        ).fetchone()
+        conn.close()
+        assert (row[0], row[1]) == (25, 25)
+
+    def test_a_drifted_catalog_is_repaired_without_a_series_move(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        """The sync is the only writer that brings the copy back into line."""
+        identifier = 'seen-repair'
+        conn = review_tracking.init_db(identifier)
+        review_tracking.add_series_to_db(
+            conn,
+            change_id='cid',
+            revision=2,
+            subject='s',
+            sender_name='n',
+            sender_email='e@x',
+            sent_at='2026-06-01T00:00:00+00:00',
+            message_id='v2@x',
+            num_patches=1,
+        )
+        review_tracking.add_revision(conn, 'cid', 2, 'v2@x')
+        conn.execute(
+            'UPDATE revisions SET message_count = 10, seen_message_count = 8'
+            " WHERE change_id = 'cid' AND revision = 2"
+        )
+        conn.execute(
+            'UPDATE revisions SET message_count = 10, seen_message_count = 3'
+            " WHERE change_id = 'cid' AND revision = 2"
+        )
+        conn.commit()
+        conn.close()
+        # The series row already reads 8, so it does not move; only the
+        # catalog does, and the early return used to skip it entirely.
+        assert review_tracking.sync_seen_from_unseen_count(identifier, 'cid', 2, 2)
+        conn = review_tracking.get_db(identifier)
+        row = conn.execute(
+            'SELECT seen_message_count FROM revisions'
+            " WHERE change_id = 'cid' AND revision = 2"
+        ).fetchone()
+        conn.close()
+        assert row[0] == 8
+
+
+class TestRevisionActivityIsForwardOnly:
+    """A poll must not walk a version's activity date backwards."""
+
+    def test_a_thread_that_lost_a_member_cannot_rewind_the_date(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """A rethreaded member whose thread will not fetch drops its newest
+        reply from the union while the others still raise the total."""
+        conn = review_tracking.init_db('activity-back')
+        review_tracking.add_revision(conn, 'cid', 1, 'v1@x')
+        conn.execute(
+            'UPDATE revisions SET message_count = 5, seen_message_count = 5,'
+            " last_mail_at = '2026-06-01T00:00:00+00:00'"
+            " WHERE change_id = 'cid' AND revision = 1"
+        )
+        conn.commit()
+        conn.close()
+        monkeypatch.setattr(b4, 'can_network', True)
+        monkeypatch.setattr(
+            review_tracking,
+            '_fetch_revision_thread_msgs',
+            lambda identifier, conn, change_id, rev: _thread_msgs(6),
+        )
+        monkeypatch.setattr(
+            review_tracking,
+            '_latest_date_from_msgs',
+            lambda msgs: '2024-01-01T00:00:00+00:00',
+        )
+        review_tracking.update_revision_message_counts(
+            'activity-back', [_poller_series('cid', 2, 'v2@x')]
+        )
+        conn = review_tracking.get_db('activity-back')
+        row = conn.execute(
+            'SELECT message_count, last_mail_at FROM revisions'
+            " WHERE change_id = 'cid' AND revision = 1"
+        ).fetchone()
+        conn.close()
+        assert row[0] == 6
+        assert row[1] == '2026-06-01T00:00:00+00:00'
+
+
+class TestParkingDoesNotLeakMaintainerActions:
+    """last_activity_at doubles as an action stamp on `series` only."""
+
+    @staticmethod
+    def _seed(identifier: str) -> sqlite3.Connection:
+        conn = review_tracking.init_db(identifier)
+        review_tracking.add_series_to_db(
+            conn,
+            change_id='cid',
+            revision=2,
+            subject='s',
+            sender_name='n',
+            sender_email='e@x',
+            sent_at='2026-06-01T00:00:00+00:00',
+            message_id='v2@x',
+            num_patches=1,
+        )
+        conn.execute(
+            'UPDATE revisions SET message_count = 5, seen_message_count = 5'
+            " WHERE change_id = 'cid' AND revision = 2"
+        )
+        conn.commit()
+        return conn
+
+    def test_a_snooze_is_not_that_versions_newest_mail(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        """The poller writes the date with its watermark, so a value newer
+        than that watermark cannot have come from a Date: header."""
+        conn = self._seed('park-snooze')
+        review_tracking.update_series_status(conn, 'cid', 'snoozed', revision=2)
+        review_tracking.update_series_revision(conn, 'cid', 2, 3, 'v3@x')
+        revs = {r['revision']: r for r in review_tracking.get_revisions(conn, 'cid')}
+        conn.close()
+        assert revs[2]['last_mail_at'] is None
+
+    def test_a_polled_date_is_still_carried(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        """Refusing every series value would lose real thread activity."""
+        conn = self._seed('park-polled')
+        conn.execute(
+            "UPDATE revisions SET last_update_check = '2026-06-05T00:00:00+00:00',"
+            " last_mail_at = '2026-06-04T00:00:00+00:00'"
+            " WHERE change_id = 'cid' AND revision = 2"
+        )
+        conn.commit()
+        review_tracking.update_series_revision(conn, 'cid', 2, 3, 'v3@x')
+        revs = {r['revision']: r for r in review_tracking.get_revisions(conn, 'cid')}
+        conn.close()
+        assert revs[2]['last_mail_at'] == '2026-06-04T00:00:00+00:00'
+
+
+class TestDiscoveryRespectsThePollBudget:
+    """The poll cap applies to what a backward search just turned up too."""
+
+    @staticmethod
+    def _stub_search(monkeypatch: pytest.MonkeyPatch) -> None:
+        monkeypatch.setattr(b4, 'can_network', True)
+        base_msgs = _series_msgs('thing', _AUTHOR, 3, 2)
+        monkeypatch.setattr(
+            review_tracking, '_fetch_thread_msgs', lambda msgid: list(base_msgs)
+        )
+        monkeypatch.setattr(
+            b4.mbox,
+            'get_extra_series',
+            lambda msgs, direction=1, wantvers=None, nocache=False: (
+                list(msgs)
+                + _series_msgs('thing', _AUTHOR, 2, 2)
+                + _series_msgs('thing', _AUTHOR, 1, 2)
+            ),
+        )
+
+    def _run(
+        self, identifier: str, monkeypatch: pytest.MonkeyPatch, limit: int
+    ) -> list[dict[str, Any]]:
+        conn = review_tracking.init_db(identifier)
+        review_tracking.add_revision(conn, 'cid', 3, 'thing-v3-p1@example.com')
+        conn.close()
+        self._stub_search(monkeypatch)
+        seen: list[dict[str, Any]] = []
+
+        def _record(
+            _ident: str, _series_list: list[dict[str, Any]], **kw: Any
+        ) -> dict[str, int]:
+            seen.append(kw)
+            return {'updated': 0, 'new_mail': 0, 'errors': 0, 'polled': 0}
+
+        monkeypatch.setattr(review_tracking, 'REVISION_POLL_LIMIT', limit)
+        monkeypatch.setattr(review_tracking, 'update_revision_message_counts', _record)
+        series = {
+            'change_id': 'cid',
+            'revision': 3,
+            'message_id': 'thing-v3-p1@example.com',
+            'status': 'new',
+        }
+        review_tracking.discover_older_revisions(identifier, series, '')
+        return seen
+
+    def test_the_cap_and_a_cancel_hook_are_passed_through(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """Uncapped, one [o] press on a v20 series is 19 lore round-trips."""
+        seen = self._run('disc-budget-cap', monkeypatch, 2)
+        assert len(seen) == 1
+        assert seen[0]['max_revisions_per_series'] == 2
+        assert seen[0]['only_revisions'] == {1, 2}
+
+
+class TestChangeStateIsForgotten:
+    """`changes` outlives `series` on its own -- nothing joins them.
+
+    A change_id that stops existing must not leave a row behind: its
+    back_searched latch would skip the one-shot backward search for ever
+    on a re-track, and its branch sha would make rescan_branches skip a
+    resurrected branch it had never imported.
+    """
+
+    @staticmethod
+    def _seed(identifier: str, change_id: str, revision: int = 1) -> None:
+        conn = review_tracking.init_db(identifier)
+        review_tracking.add_series_to_db(
+            conn,
+            change_id=change_id,
+            revision=revision,
+            subject='[PATCH] s',
+            sender_name='S',
+            sender_email='s@e.com',
+            sent_at='2026-01-01T00:00:00+00:00',
+            message_id=f'{change_id}-v{revision}@x',
+            num_patches=1,
+        )
+        review_tracking.set_back_searched(conn, change_id)
+        review_tracking.set_branch_sha(conn, change_id, 'deadbeef')
+        conn.close()
+
+    def _rows(self, identifier: str, change_id: str) -> int:
+        conn = review_tracking.get_db(identifier)
+        n = conn.execute(
+            'SELECT COUNT(*) FROM changes WHERE change_id = ?', (change_id,)
+        ).fetchone()[0]
+        conn.close()
+        return int(n)
+
+    def test_deleting_the_last_revision_forgets_it(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        self._seed('forget-lastrev', 'cid')
+        conn = review_tracking.get_db('forget-lastrev')
+        review_tracking.delete_series(conn, 'cid', revision=1)
+        conn.close()
+        assert self._rows('forget-lastrev', 'cid') == 0
+
+    def test_deleting_one_of_several_keeps_it(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        """The other revisions still share the branch and the latch."""
+        self._seed('forget-onerev', 'cid', revision=1)
+        conn = review_tracking.get_db('forget-onerev')
+        review_tracking.add_series_to_db(
+            conn,
+            change_id='cid',
+            revision=2,
+            subject='[PATCH v2] s',
+            sender_name='S',
+            sender_email='s@e.com',
+            sent_at='2026-01-02T00:00:00+00:00',
+            message_id='cid-v2@x',
+            num_patches=1,
+        )
+        review_tracking.delete_series(conn, 'cid', revision=1)
+        conn.close()
+        assert self._rows('forget-onerev', 'cid') == 1
+        conn = review_tracking.get_db('forget-onerev')
+        assert review_tracking.is_back_searched(conn, 'cid') is True
+        conn.close()
+
+    def test_absorbing_the_last_row_forgets_the_stray(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        """Absorb deletes the stray's change_id; its state must go too."""
+        self._seed('forget-absorb', 'stray')
+        conn = review_tracking.get_db('forget-absorb')
+        review_tracking.add_series_to_db(
+            conn,
+            change_id='target',
+            revision=2,
+            subject='[PATCH v2] s',
+            sender_name='S',
+            sender_email='s@e.com',
+            sent_at='2026-01-02T00:00:00+00:00',
+            message_id='target-v2@x',
+            num_patches=1,
+        )
+        review_tracking.absorb_series_as_revision(
+            conn, 'target', 'stray', 1, stray_revision=1
+        )
+        conn.close()
+        assert self._rows('forget-absorb', 'stray') == 0
diff --git a/src/tests/test_tui_tracking.py b/src/tests/test_tui_tracking.py
index 2803bf3d..d6233afe 100644
--- a/src/tests/test_tui_tracking.py
+++ b/src/tests/test_tui_tracking.py
@@ -6030,3 +6030,50 @@ class TestUpdateAllDoesNotForceThePoll:
         assert len(seen) == 2
         assert seen[0]._force_revision_poll is True
         assert seen[1]._force_revision_poll is False
+
+
+class TestDiscoverOlderAction:
+    """The 'Find older revisions' action wires into the discovery seam."""
+
+    @pytest.mark.asyncio
+    async def test_action_menu_offers_discover(self, tmp_path: pathlib.Path) -> None:
+        _seed_db(
+            'test-discover-menu',
+            [{'change_id': 'cid-d', 'revision': 3, 'status': 'new'}],
+        )
+        app = TrackingApp('test-discover-menu')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            await pilot.press('a')
+            await pilot.pause()
+            keys = [key for key, _label in getattr(app.screen, '_actions')]
+            assert 'discover' in keys
+
+    @pytest.mark.asyncio
+    async def test_action_runs_discovery(self, tmp_path: pathlib.Path) -> None:
+        _seed_db(
+            'test-discover-run',
+            [{'change_id': 'cid-d', 'revision': 3, 'status': 'new'}],
+        )
+        calls: List[Tuple[str, Optional[str]]] = []
+
+        def _fake_discover(
+            identifier: str,
+            series: Dict[str, Any],
+            linkmask: str,
+            topdir: Optional[str] = None,
+            cancel_cb: Optional[Callable[[], bool]] = None,
+        ) -> Dict[str, Any]:
+            calls.append((identifier, series.get('change_id')))
+            # Wired, or the run is interruptible only by tearing down the TUI.
+            assert cancel_cb is not None
+            return {'found': 2, 'revisions': [1, 2], 'error': None}
+
+        app = TrackingApp('test-discover-run')
+        with patch.object(tracking, 'discover_older_revisions', _fake_discover):
+            async with app.run_test(size=(120, 30)) as pilot:
+                await pilot.pause()
+                app.action_discover_older()
+                await app.workers.wait_for_complete()
+                await pilot.pause()
+        assert calls == [('test-discover-run', 'cid-d')]

-- 
2.53.0

