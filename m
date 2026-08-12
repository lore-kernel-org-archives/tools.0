Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD40A3EFD24
	for <tools@linux.kernel.org>; Wed, 12 Aug 2026 21:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786571248; cv=none; b=M+POnxVbeKfX1mDBdYncNbX7olbdEqamL/WQelsh0hjiFTkqLLnhxa4N3qylNPQ5ACo95z0brSJLxON6rQMyyHEIidHqb87MiKQ5C7pvi2lJKvshXNjrskDOi4BaFmpm6nu3LSSo4haucXo3nSb+EbPqZl45kbxRkMMg4IiBKkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786571248; c=relaxed/simple;
	bh=dEhtM5dCjlFOF3FayxN3Q89ipl2+OSGFIexhILplsUQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E2ETh6cbu2jjhd5E2vMp7qKjDwilpdIDxLPI19LHIAMNiJrrrRfl4l7FOnpe4rFiaMaZ84fWUl1QJREBecyLXUDbnAQjshgXWersxz6ysPqK+Ua6/MH6XNnoirYqrAQTgS1QvZAa2CVs0jySmiyo01l23oSbSD7YQ5aXA9+e3G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N3gxaLxn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N3gxaLxn"
Received: by smtp.kernel.org (Postfix)
	id 6734B1F00A3E; Wed, 12 Aug 2026 21:47:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25F121F00A3D;
	Wed, 12 Aug 2026 21:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786571243;
	bh=lnARqHGDoJULsmJMg+qQp0YF+tXoakWAWu63Y8DFWMs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=N3gxaLxn+XviXnhkbX2mE7ffp8AVXv2QDecWnvg6LnQkEl78HO7j8jrhF26ZFkcSe
	 EVhtG70Xt0iZOb5U7AoOY942hMR2kfXtLg5zOhTDPChuOBetEwAteBZgUc6epr+9ku
	 NwYrR3UswBUKJAh8CzCan6oq/fXxionGD4fBGLKGPAZDg/qQuDVc84VfGFK8B0EHjx
	 FSosG+zXEHXvmcIFcV6YK8/ZQBjczvFkAXo8+iOHosxfgSUsOXhrlS0Rs39aeGAt3m
	 49CCZHrmo8eEPN8BINcDJisP9Ye7qzolb638hG4KkU2iLevyuWf/qK28/OGSCYppyu
	 Nh7VNuUuCgcRg==
From: Christian Brauner <brauner@kernel.org>
Date: Wed, 12 Aug 2026 23:46:52 +0200
Subject: [PATCH RFC v2 11/25] review: test per-revision message tracking
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-work-b4-multiver-rows-v2-11-305d53cd723a@kernel.org>
References: <20260812-work-b4-multiver-rows-v2-0-305d53cd723a@kernel.org>
In-Reply-To: <20260812-work-b4-multiver-rows-v2-0-305d53cd723a@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.17-dev-362b8
X-Developer-Signature: v=1; a=openpgp-sha256; l=124922; i=brauner@kernel.org;
 h=from:subject:message-id; bh=dEhtM5dCjlFOF3FayxN3Q89ipl2+OSGFIexhILplsUQ=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTVvLzF57VbITXVhvlBCvfz8wJOrqdilBkPuuUvVXhxK
 1nr4JeGjlIWBjEuBlkxRRaHdpNwueU8FZuNMjVg5rAygQxh4OIUgImISjL8d28N5OGPulrQ9+FK
 RETzydPB0xcZOtSEx8qtnxf5xc1clJGho3ymlO+8e6zlr6VnlEzljTU8w/RB4IdAeJyD5nShx12
 cAA==
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Cover the v11 migration (column adds, catalog backfill from live and
archived series rows, idempotence), the catalog-owned count reads, the
per-revision poller (first fetch, a quiet poll that records the check
without moving the counts, new-mail bump, error paths, skip statuses,
tracked-row guarantee, least-recently-checked rotation and the cap,
rethreaded first fetch and per-patch incremental, thread-blob caching and
the stitched series blob a re-store must not discard), and the
revision-aware writes in refresh_message_count() and
sync_seen_from_unseen_count().

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/tests/test_review_tracking.py | 2902 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 2901 insertions(+), 1 deletion(-)

diff --git a/src/tests/test_review_tracking.py b/src/tests/test_review_tracking.py
index 8611cd3d..c1f20649 100644
--- a/src/tests/test_review_tracking.py
+++ b/src/tests/test_review_tracking.py
@@ -7,7 +7,7 @@ import pathlib
 import re
 import sqlite3
 from email.message import EmailMessage
-from typing import Any, Dict
+from typing import Any, Dict, Optional
 from unittest import mock
 
 import pytest
@@ -1918,6 +1918,30 @@ class TestFollowupBlob:
         result = review_tracking.get_thread_mbox(gitdir, 'deadbeef' * 5)
         assert result is None
 
+    def test_store_revision_thread_blob_reports_a_missing_catalog_row(
+        self, gitdir: str, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        """A no-op UPDATE must not read as a stored blob.
+
+        The tracked revision is not guaranteed a catalog row, so a caller
+        handed a synthesized entry took the silent no-op for a cache write
+        and refetched from lore on every call.
+        """
+        conn = review_tracking.init_db('blob-no-row')
+        msgs = [_make_test_msg('only@example.com')]
+
+        assert (
+            review_tracking.store_revision_thread_blob(conn, gitdir, 'cid', 1, msgs)
+            is None
+        )
+
+        review_tracking.add_revision(conn, 'cid', 1, 'v1@example.com')
+        sha = review_tracking.store_revision_thread_blob(conn, gitdir, 'cid', 1, msgs)
+        revs = review_tracking.get_revisions(conn, 'cid')
+        conn.close()
+        assert sha
+        assert revs[0]['thread_blob'] == sha
+
 
 class TestPatchState:
     """Tests for _get_patch_state() and _set_patch_state()."""
@@ -3357,6 +3381,66 @@ class TestAbsorbSeriesAsRevision:
         conn.close()
         assert srow[0] == 0
 
+    def test_absorbing_the_last_series_row_rehomes_the_catalog(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        """The stray's other catalogued versions move to the target.
+
+        A stray tracked online carries auto-discovered sibling versions,
+        and a rethreaded one's per-patch message-ids exist nowhere else.
+        Deleting them with the stray's last series row made [l] on a
+        multi-version stray a silent data-loss action.
+        """
+        conn = review_tracking.init_db('mrl-absorb-rehome-test')
+        review_tracking.add_revision(conn, 'series-A', 1, 'a-v1@example.com')
+        _seed_stray_series(conn, 'series-B', 2, 'fp-stray-b')
+        # The stray's catalog knows more than its series row: a
+        # rethreaded v1 colliding with the target's, and a plain v3.
+        review_tracking.add_revision(
+            conn,
+            'series-B',
+            1,
+            'b-v1@example.com',
+            source='discovered',
+            is_rethreaded=True,
+        )
+        _insert_patches(
+            conn, 'series-B', 1, ['b-v1-p1@example.com', 'b-v1-p2@example.com']
+        )
+        review_tracking.add_revision(
+            conn, 'series-B', 3, 'b-v3@example.com', source='discovered'
+        )
+
+        absorbed = review_tracking.absorb_series_as_revision(
+            conn, 'series-A', 'series-B', 2
+        )
+        assert absorbed is True
+
+        revs_a = {
+            r['revision']: r for r in review_tracking.get_revisions(conn, 'series-A')
+        }
+        assert sorted(revs_a) == [1, 2, 3]
+        # The colliding v1 keeps the target's own row, but rescues the
+        # stray's patch list the target lacked -- and the rethread flag
+        # behind which that list is read.
+        assert revs_a[1]['message_id'] == 'a-v1@example.com'
+        assert revs_a[1]['is_rethreaded']
+        patches = review_tracking.get_series_patches(conn, 'series-A', 1)
+        assert [p['message_id'] for p in patches] == [
+            'b-v1-p1@example.com',
+            'b-v1-p2@example.com',
+        ]
+        # The non-colliding v3 is re-homed whole, provenance included.
+        assert revs_a[3]['message_id'] == 'b-v3@example.com'
+        assert revs_a[3]['source'] == 'discovered'
+        # Nothing left under the stray.
+        assert review_tracking.get_revisions(conn, 'series-B') == []
+        leftovers = conn.execute(
+            "SELECT COUNT(*) FROM series_patches WHERE change_id = 'series-B'"
+        ).fetchone()
+        conn.close()
+        assert leftovers[0] == 0
+
     def test_absorb_missing_stray_is_noop(
         self, tmp_path: pytest.TempPathFactory
     ) -> None:
@@ -4382,6 +4466,36 @@ class TestKnownRevisionsCatalog:
             'p2@example.com',
         ]
 
+    def test_the_posting_date_survives_the_round_trip(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        """add_revision() defaults found_at to now, which is wrong on replay.
+
+        The catalog is rebuilt from the review branch on a second machine,
+        or after the database is deleted.  Dropping found_at on the way
+        through re-dates every version to the moment of the rebuild, so the
+        version rows and 'posted <date>' all read as today and v1 sorts
+        after vN -- the case found_at was added to prevent.
+        """
+        conn = review_tracking.init_db('rt-found-at')
+        review_tracking.add_revision(
+            conn, 'cid', 1, 'v1@example.com', found_at='2025-11-02T09:15:00+00:00'
+        )
+        review_tracking.add_revision(
+            conn, 'cid', 2, 'v2@example.com', found_at='2026-01-20T18:40:00+00:00'
+        )
+        known = review_tracking.build_known_revisions(conn, 'cid')
+        conn.close()
+
+        conn2 = review_tracking.init_db('rt-found-at2')
+        review_tracking.record_known_revisions(conn2, 'cid', known)
+        revs = review_tracking.get_revisions(conn2, 'cid')
+        conn2.close()
+
+        by_rev = {r['revision']: r['found_at'] for r in revs}
+        assert by_rev[1] == '2025-11-02T09:15:00+00:00'
+        assert by_rev[2] == '2026-01-20T18:40:00+00:00'
+
     def test_record_is_sticky_and_no_downgrade(
         self, tmp_path: pytest.TempPathFactory
     ) -> None:
@@ -5163,3 +5277,2789 @@ class TestUpgradeKeepsTheRethreadFlag:
         )
         conn.close()
         assert rows == {2: 1, 3: 0}
+
+
+def _make_legacy_v10_db(identifier: str) -> str:
+    """Create a schema-v10 database (revisions without count columns)."""
+    path = review_tracking.get_db_path(identifier)
+    conn = sqlite3.connect(path)
+    conn.executescript(
+        """
+        CREATE TABLE schema_version (version INTEGER PRIMARY KEY);
+        CREATE TABLE series (
+            track_id INTEGER PRIMARY KEY,
+            change_id TEXT NOT NULL,
+            revision INTEGER NOT NULL,
+            subject TEXT,
+            sender_name TEXT,
+            sender_email TEXT,
+            sent_at TEXT,
+            added_at TEXT,
+            message_id TEXT,
+            num_patches INTEGER,
+            pw_series_id INTEGER,
+            status TEXT DEFAULT 'new',
+            fingerprint TEXT,
+            branch_sha TEXT,
+            message_count INT,
+            seen_message_count INT,
+            last_update_check TEXT,
+            last_activity_at TEXT,
+            snoozed_until TEXT,
+            attestation TEXT DEFAULT 'pending',
+            target_branch TEXT,
+            is_rethreaded INTEGER DEFAULT 0,
+            UNIQUE (change_id, revision)
+        );
+        CREATE TABLE revisions (
+            change_id   TEXT NOT NULL,
+            revision    INTEGER NOT NULL,
+            message_id  TEXT NOT NULL,
+            subject     TEXT,
+            link        TEXT,
+            found_at    TEXT,
+            thread_blob TEXT,
+            fingerprint TEXT,
+            source      TEXT DEFAULT 'heuristic',
+            is_rethreaded INTEGER DEFAULT 0,
+            PRIMARY KEY (change_id, revision)
+        );
+        """
+    )
+    conn.execute('INSERT INTO schema_version (version) VALUES (10)')
+    # (i) live tracked series with counts and a matching catalog row,
+    # plus a catalog-only older revision.
+    conn.execute(
+        'INSERT INTO series (change_id, revision, subject, message_id, status,'
+        ' message_count, seen_message_count, last_update_check,'
+        ' last_activity_at, added_at)'
+        " VALUES ('cid-live', 2, 'live v2', 'live-v2@x', 'reviewing',"
+        " 8, 6, '2026-07-01T00:00:00+00:00', '2026-06-30T00:00:00+00:00',"
+        " '2026-06-01T00:00:00+00:00')"
+    )
+    conn.execute(
+        'INSERT INTO revisions (change_id, revision, message_id)'
+        " VALUES ('cid-live', 2, 'live-v2@x')"
+    )
+    conn.execute(
+        'INSERT INTO revisions (change_id, revision, message_id)'
+        " VALUES ('cid-live', 1, 'live-v1@x')"
+    )
+    # (ii) archived series row (upgrade leftover) with old counts.
+    conn.execute(
+        'INSERT INTO series (change_id, revision, message_id, status,'
+        ' message_count, seen_message_count)'
+        " VALUES ('cid-live', 1, 'live-v1@x', 'archived', 4, 1)"
+    )
+    # (iii) tracked series with no catalog row at all.
+    conn.execute(
+        'INSERT INTO series (change_id, revision, message_id, status,'
+        ' message_count, seen_message_count)'
+        " VALUES ('cid-norow', 3, 'norow-v3@x', 'new', 5, 5)"
+    )
+    # (iv) series row without a message-id.
+    conn.execute(
+        'INSERT INTO series (change_id, revision, message_id, status)'
+        " VALUES ('cid-nomsgid', 1, '', 'new')"
+    )
+    conn.commit()
+    conn.close()
+    return path
+
+
+class TestSchemaV11RevisionCounts:
+    """Schema v11: per-revision unread tracking lands on the catalog."""
+
+    def test_schema_version_at_least_11(self) -> None:
+        assert review_tracking.SCHEMA_VERSION >= 11
+
+    def test_new_db_has_count_columns(self, tmp_path: pytest.TempPathFactory) -> None:
+        conn = review_tracking.init_db('v11-cols')
+        cols = {row[1] for row in conn.execute('PRAGMA table_info(revisions)')}
+        conn.close()
+        assert {
+            'message_count',
+            'seen_message_count',
+            'last_update_check',
+            'last_mail_at',
+        } <= cols
+
+    def test_migration_adds_columns_and_bumps_version(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        _make_legacy_v10_db('v11-migrate')
+        conn = review_tracking.get_db('v11-migrate')  # runs migration on open
+        cols = {row[1] for row in conn.execute('PRAGMA table_info(revisions)')}
+        version = conn.execute('SELECT version FROM schema_version').fetchone()[0]
+        conn.close()
+        assert 'message_count' in cols
+        assert version == review_tracking.SCHEMA_VERSION
+
+    def test_migration_backfills_catalog_rows(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        _make_legacy_v10_db('v11-backfill')
+        conn = review_tracking.get_db('v11-backfill')
+        norow = review_tracking.get_revisions(conn, 'cid-norow')
+        nomsgid = review_tracking.get_revisions(conn, 'cid-nomsgid')
+        conn.close()
+        # The series row without a catalog entry gets one, carrying counts.
+        assert len(norow) == 1
+        assert norow[0]['message_id'] == 'norow-v3@x'
+        assert norow[0]['message_count'] == 5
+        assert norow[0]['seen_message_count'] == 5
+        # No catalog row is invented without a message-id.
+        assert nomsgid == []
+
+    def test_migration_seeds_existing_catalog_rows(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        _make_legacy_v10_db('v11-seed')
+        conn = review_tracking.get_db('v11-seed')
+        revs = {
+            r['revision']: r for r in review_tracking.get_revisions(conn, 'cid-live')
+        }
+        conn.close()
+        # v2 counts come from the live series row via the stitched read.
+        assert revs[2]['message_count'] == 8
+        assert revs[2]['seen_message_count'] == 6
+        # v1 counts were seeded from the archived series row (the only
+        # historical data) into the catalog columns.
+        assert revs[1]['message_count'] == 4
+        assert revs[1]['seen_message_count'] == 1
+
+    def test_migration_leaves_catalog_activity_unseeded(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        """series.last_activity_at is not this version's newest mail.
+
+        It also records maintainer actions, so seeding last_mail_at from it
+        would date a version's thread from the last time someone snoozed
+        the series.  Left NULL until a poll reads a real Date: header --
+        and with one owner there is no second column to fall through to.
+        """
+        _make_legacy_v10_db('v11-activity')
+        conn = review_tracking.get_db('v11-activity')
+        raw = conn.execute(
+            'SELECT last_mail_at FROM revisions'
+            " WHERE change_id = 'cid-live' AND revision = 2"
+        ).fetchone()[0]
+        revs = {
+            r['revision']: r for r in review_tracking.get_revisions(conn, 'cid-live')
+        }
+        conn.close()
+        assert raw is None
+        # ...and the read reports exactly that, rather than borrowing the
+        # series' maintainer-action stamp.
+        assert revs[2]['last_mail_at'] is None
+
+    def test_migration_idempotent(self, tmp_path: pytest.TempPathFactory) -> None:
+        _make_legacy_v10_db('v11-idem')
+        review_tracking.get_db('v11-idem').close()
+        conn = review_tracking.get_db('v11-idem')
+        nrevs = conn.execute('SELECT COUNT(*) FROM revisions').fetchone()[0]
+        version = conn.execute('SELECT version FROM schema_version').fetchone()[0]
+        conn.close()
+        assert nrevs == 3
+        assert version == review_tracking.SCHEMA_VERSION
+
+
+class TestStitchedRevisionReads:
+    """Per-revision counts stitch series (live) over catalog columns."""
+
+    def test_counts_come_from_the_catalog_row(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        """One owner, so there is no second copy for a reader to prefer."""
+        conn = review_tracking.init_db('stitch-live')
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
+            'UPDATE revisions SET message_count = 10, seen_message_count = 7'
+            " WHERE change_id = 'cid' AND revision = 2"
+        )
+        conn.commit()
+        revs = review_tracking.get_revisions(conn, 'cid')
+        conn.close()
+        assert revs[0]['message_count'] == 10
+        assert revs[0]['seen_message_count'] == 7
+
+    def test_rethread_flag_is_stitched_too(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        """It picks the retrieval path, so both rows must agree on it.
+
+        'e' on the tracked revision's own version row would otherwise
+        reassemble a different thread than 'e' on the series row directly
+        above it.
+        """
+        conn = review_tracking.init_db('stitch-rethread')
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
+            is_rethreaded=True,
+        )
+        # The catalog row predates the rethread being recognised.
+        review_tracking.add_revision(conn, 'cid', 2, 'v2@x')
+        conn.commit()
+        revs = review_tracking.get_revisions(conn, 'cid')
+        conn.close()
+        assert bool(revs[0]['is_rethreaded'])
+
+    def test_archived_series_does_not_shadow(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        conn = review_tracking.init_db('stitch-arch')
+        review_tracking.add_series_to_db(
+            conn,
+            change_id='cid',
+            revision=1,
+            subject='s',
+            sender_name='n',
+            sender_email='e@x',
+            sent_at='2026-06-01T00:00:00+00:00',
+            message_id='v1@x',
+            num_patches=1,
+        )
+        conn.execute(
+            'UPDATE revisions SET message_count = 4, seen_message_count = 0'
+            " WHERE change_id = 'cid'"
+        )
+        conn.execute("UPDATE series SET status = 'archived' WHERE change_id = 'cid'")
+        review_tracking.add_revision(conn, 'cid', 1, 'v1@x')
+        conn.execute(
+            'UPDATE revisions SET message_count = 6, seen_message_count = 6'
+            " WHERE change_id = 'cid' AND revision = 1"
+        )
+        conn.commit()
+        revs = review_tracking.get_revisions(conn, 'cid')
+        conn.close()
+        assert revs[0]['message_count'] == 6
+        assert revs[0]['seen_message_count'] == 6
+
+    def test_null_series_counts_fall_back(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        conn = review_tracking.init_db('stitch-null')
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
+            'UPDATE revisions SET message_count = 9, seen_message_count = 9'
+            " WHERE change_id = 'cid' AND revision = 2"
+        )
+        conn.commit()
+        revs = review_tracking.get_revisions(conn, 'cid')
+        conn.close()
+        assert revs[0]['message_count'] == 9
+        assert revs[0]['seen_message_count'] == 9
+
+    def test_grouped_returns_full_columns(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        conn = review_tracking.init_db('stitch-grouped')
+        review_tracking.add_revision(
+            conn, 'cid', 1, 'v1@x', fingerprint='fp1', is_rethreaded=True
+        )
+        grouped = review_tracking.get_all_revisions_grouped(conn)
+        conn.close()
+        entry = grouped['cid'][0]
+        assert entry['is_rethreaded']
+        assert entry['fingerprint'] == 'fp1'
+        assert entry['source'] == 'heuristic'
+        assert entry['message_count'] is None
+
+    def test_series_list_agrees_with_its_own_version_row(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        """The tracker list and the version rows read the same numbers.
+
+        An upgrade clears the series row's counts, so a raw read renders
+        the parent as '-' while the child row for that very revision,
+        sourced from the catalog, shows a count.
+        """
+        conn = review_tracking.init_db('stitch-list')
+        review_tracking.add_series_to_db(
+            conn,
+            change_id='cid',
+            revision=2,
+            subject='[PATCH v2] thing',
+            sender_name='S',
+            sender_email='s@e.com',
+            sent_at='2026-01-01T00:00:00+00:00',
+            message_id='v2@x',
+            num_patches=1,
+        )
+        review_tracking.add_revision(conn, 'cid', 3, 'v3@x')
+        conn.execute(
+            'UPDATE revisions SET message_count = 20, seen_message_count = 12'
+            " WHERE change_id = 'cid' AND revision = 3"
+        )
+        conn.commit()
+        review_tracking.update_series_revision(conn, 'cid', 2, 3, 'v3@x')
+        grouped = review_tracking.get_all_revisions_grouped(conn)
+        conn.close()
+
+        series = {
+            s['change_id']: s
+            for s in review_tracking.get_all_tracked_series('stitch-list')
+        }['cid']
+        child = {r['revision']: r for r in grouped['cid']}[3]
+        assert series['revision'] == 3
+        assert series['message_count'] == child['message_count'] == 20
+        assert series['seen_message_count'] == child['seen_message_count'] == 12
+
+
+def _thread_msgs(count: int, base: str = 'm') -> list[EmailMessage]:
+    """Build a minimal thread of EmailMessage objects with Date headers."""
+    msgs = []
+    for i in range(count):
+        msg = EmailMessage()
+        msg['Subject'] = f'Re: thread {i}'
+        msg['From'] = 'Dev <dev@example.com>'
+        msg['Message-Id'] = f'<{base}-{i}@example.com>'
+        msg['Date'] = f'Thu, {i + 1:02d} Jul 2026 08:00:00 +0000'
+        msg.set_payload('body\n')
+        msgs.append(msg)
+    return msgs
+
+
+def _poller_series(
+    change_id: str, revision: int, message_id: str, status: str = 'new'
+) -> Dict[str, Any]:
+    """Series dict shaped like the TUI's loaded rows, for the poller."""
+    return {
+        'change_id': change_id,
+        'revision': revision,
+        'message_id': message_id,
+        'subject': 'test subject',
+        'status': status,
+    }
+
+
+class TestFailedPollsSpendTheBudget:
+    """The cap counts lore round-trips, and a fetch that fails made one.
+
+    Two deliberate rules combine badly otherwise: naming the revisions
+    lifts the two-in-a-row break (dead message-ids are exactly what a
+    backward search turns up), so a version whose ids all 404 walked every
+    one of them however small the cap.
+    """
+
+    @staticmethod
+    def _seed(identifier: str) -> None:
+        conn = review_tracking.init_db(identifier)
+        for rev in (1, 2, 3, 4, 5):
+            review_tracking.add_revision(conn, 'cid', rev, f'v{rev}@x')
+        conn.close()
+
+    def _run(
+        self, identifier: str, monkeypatch: pytest.MonkeyPatch, online: bool
+    ) -> list[int]:
+        self._seed(identifier)
+        tried: list[int] = []
+
+        def _fail(ident: str, conn: Any, change_id: str, rev: Dict[str, Any]) -> None:
+            tried.append(int(rev['revision']))
+            return None
+
+        monkeypatch.setattr(b4, 'can_network', online)
+        monkeypatch.setattr(review_tracking, '_fetch_revision_thread_msgs', _fail)
+        review_tracking.update_revision_message_counts(
+            identifier,
+            [_poller_series('cid', 6, 'v6@x')],
+            only_revisions={1, 2, 3, 4, 5},
+            max_revisions_per_series=2,
+        )
+        return tried
+
+    def test_the_cap_bounds_a_run_of_failures(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        assert len(self._run('poll-budget', monkeypatch, online=True)) == 2
+
+    def test_offline_spends_nothing(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """No request was made, so there is no round-trip to charge for.
+
+        Charging them would make an offline sweep look like a series that
+        had used up its budget, and the revisions behind the cap would wait
+        a sweep for nothing.
+        """
+        assert len(self._run('poll-budget-off', monkeypatch, online=False)) == 5
+
+
+class TestUpdateRevisionMessageCounts:
+    """The per-revision poller for non-tracked versions."""
+
+    def test_first_fetch_initializes_counts(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        conn = review_tracking.init_db('poll-first')
+        review_tracking.add_series_to_db(
+            conn,
+            change_id='cid',
+            revision=2,
+            subject='test subject',
+            sender_name='n',
+            sender_email='e@x',
+            sent_at='2026-06-01T00:00:00+00:00',
+            message_id='v2@x',
+            num_patches=1,
+        )
+        # Leave only the manual-link gap the backfill exists to close.
+        conn.execute('DELETE FROM revisions WHERE revision = 2')
+        conn.commit()
+        review_tracking.add_revision(conn, 'cid', 1, 'v1@x')
+        conn.close()
+        monkeypatch.setattr(
+            review_tracking,
+            '_fetch_revision_thread_msgs',
+            lambda identifier, conn, change_id, rev: _thread_msgs(3),
+        )
+        result = review_tracking.update_revision_message_counts(
+            'poll-first', [_poller_series('cid', 2, 'v2@x')]
+        )
+        assert result == {
+            'updated': 1,
+            'new_mail': 0,
+            'errors': 0,
+            'fresh_errors': 0,
+            'polled': 1,
+            'cancelled': 0,
+        }
+        conn = review_tracking.get_db('poll-first')
+        revs = {r['revision']: r for r in review_tracking.get_revisions(conn, 'cid')}
+        conn.close()
+        assert revs[1]['message_count'] == 3
+        assert revs[1]['seen_message_count'] == 3
+        assert revs[1]['last_update_check'] is not None
+        assert revs[1]['last_mail_at'] is not None
+        # The tracked revision's row was backfilled but not polled.
+        assert revs[2]['message_count'] is None
+
+    def test_quiet_poll_leaves_the_counts_alone(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """A quiet revision records the check but not a new count.
+
+        The check has to be recorded or the poll rotation never advances
+        past it (see TestPollCapFairness); what must not move is the
+        count/seen pair the unread badge is derived from.
+        """
+        conn = review_tracking.init_db('poll-quiet')
+        review_tracking.add_revision(conn, 'cid', 1, 'v1@x')
+        review_tracking.add_revision(conn, 'cid', 2, 'v2@x')
+        conn.execute(
+            'UPDATE revisions SET message_count = 5, seen_message_count = 3,'
+            " last_update_check = '2026-07-01T00:00:00+00:00',"
+            " last_mail_at = '2026-06-30T00:00:00+00:00'"
+            " WHERE change_id = 'cid' AND revision = 1"
+        )
+        conn.commit()
+        conn.close()
+        # The refetch finds the same 5 messages.
+        monkeypatch.setattr(
+            review_tracking,
+            '_fetch_revision_thread_msgs',
+            lambda identifier, conn, change_id, rev: _thread_msgs(5),
+        )
+        result = review_tracking.update_revision_message_counts(
+            'poll-quiet', [_poller_series('cid', 2, 'v2@x')]
+        )
+        assert result == {
+            'updated': 0,
+            'new_mail': 0,
+            'errors': 0,
+            'fresh_errors': 0,
+            'polled': 1,
+            'cancelled': 0,
+        }
+        conn = review_tracking.get_db('poll-quiet')
+        revs = {r['revision']: r for r in review_tracking.get_revisions(conn, 'cid')}
+        conn.close()
+        # The badge is untouched: still 2 unseen, and no fresh activity.
+        assert revs[1]['message_count'] == 5
+        assert revs[1]['seen_message_count'] == 3
+        assert revs[1]['last_mail_at'] == '2026-06-30T00:00:00+00:00'
+        # But the rotation moved on.
+        assert revs[1]['last_update_check'] > '2026-07-01T00:00:00+00:00'
+
+    def test_a_shorter_thread_still_becomes_the_cached_thread(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """thread_blob is "the thread as it last looked", so the fetch wins.
+
+        Threads do shrink, and the blob is what the next sweep diffs
+        against to decide which messages are new -- keeping a fuller older
+        snapshot would re-count the difference as fresh mail for ever.  A
+        range-diff is not what this column answers: that reads
+        ``series_blob``, which :func:`set_revision_thread_blob` leaves
+        alone unless the thread itself changed.
+        """
+        conn = review_tracking.init_db('poll-blobshrink')
+        review_tracking.add_revision(conn, 'cid', 1, 'v1@x')
+        conn.execute(
+            'UPDATE revisions SET message_count = 4, seen_message_count = 4,'
+            " thread_blob = 'cafebabe'"
+            " WHERE change_id = 'cid' AND revision = 1"
+        )
+        conn.commit()
+        conn.close()
+        monkeypatch.setattr(
+            review_tracking,
+            '_fetch_revision_thread_msgs',
+            lambda identifier, conn, change_id, rev: _thread_msgs(1),
+        )
+        stored: list[int] = []
+        monkeypatch.setattr(
+            review_tracking,
+            'store_revision_thread_blob',
+            lambda conn, topdir, change_id, revision, msgs: stored.append(len(msgs)),
+        )
+        review_tracking.update_revision_message_counts(
+            'poll-blobshrink', [_poller_series('cid', 2, 'v2@x')], topdir='/nonexistent'
+        )
+        conn = review_tracking.get_db('poll-blobshrink')
+        revs = {r['revision']: r for r in review_tracking.get_revisions(conn, 'cid')}
+        conn.close()
+        assert (revs[1]['message_count'], revs[1]['seen_message_count']) == (1, 1)
+        assert stored == [1]
+
+    def test_a_changed_thread_drops_the_stitched_series_blob(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """A stitch is only as good as the thread it was built from.
+
+        The patch that made a version unstitchable may be exactly what
+        just landed, so a new thread retires the series blob built from
+        the old one and the next range-diff stitches again.
+        """
+        conn = review_tracking.init_db('poll-blobstitch')
+        review_tracking.add_revision(conn, 'cid', 1, 'v1@x')
+        conn.execute(
+            'UPDATE revisions SET message_count = 4, seen_message_count = 4,'
+            " thread_blob = 'cafebabe', series_blob = 'deadbeef'"
+            " WHERE change_id = 'cid' AND revision = 1"
+        )
+        conn.commit()
+        conn.close()
+        monkeypatch.setattr(
+            review_tracking,
+            '_fetch_revision_thread_msgs',
+            lambda identifier, conn, change_id, rev: _thread_msgs(6),
+        )
+        monkeypatch.setattr(
+            review_tracking, '_write_mbox_blob', lambda topdir, msgs: 'feedface'
+        )
+        review_tracking.update_revision_message_counts(
+            'poll-blobstitch', [_poller_series('cid', 2, 'v2@x')], topdir='/nonexistent'
+        )
+        conn = review_tracking.get_db('poll-blobstitch')
+        revs = {r['revision']: r for r in review_tracking.get_revisions(conn, 'cid')}
+        conn.close()
+        assert revs[1]['thread_blob'] == 'feedface'
+        assert revs[1]['series_blob'] is None
+
+    def test_an_unchanged_thread_keeps_the_stitched_series_blob(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """Re-storing the same thread must not throw the stitch away.
+
+        The blob is content-addressed, so a thread that has not moved
+        hashes to the SHA already on the row -- and a sweep that retired
+        the series blob on every such write would undo the caching it
+        exists to provide.
+        """
+        conn = review_tracking.init_db('poll-blobkeep')
+        review_tracking.add_revision(conn, 'cid', 1, 'v1@x')
+        conn.execute(
+            'UPDATE revisions SET message_count = 4, seen_message_count = 4,'
+            " thread_blob = 'cafebabe', series_blob = 'deadbeef'"
+            " WHERE change_id = 'cid' AND revision = 1"
+        )
+        conn.commit()
+        conn.close()
+        assert (
+            review_tracking.set_revision_thread_blob(
+                review_tracking.get_db('poll-blobkeep'), 'cid', 1, 'cafebabe'
+            )
+            is True
+        )
+        conn = review_tracking.get_db('poll-blobkeep')
+        revs = {r['revision']: r for r in review_tracking.get_revisions(conn, 'cid')}
+        conn.close()
+        assert revs[1]['series_blob'] == 'deadbeef'
+
+    def test_a_cancel_between_series_is_reported(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        """The outer cancel check must not present a clean, complete sweep."""
+        review_tracking.init_db('poll-cancel-outer').close()
+        result = review_tracking.update_revision_message_counts(
+            'poll-cancel-outer',
+            [_poller_series('cid', 2, 'v2@x')],
+            cancel_cb=lambda: True,
+        )
+        assert result['cancelled'] == 1
+        assert result['polled'] == 0
+
+    def test_a_missing_db_returns_the_documented_contract(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        """The early return carries every key the docstring promises."""
+        result = review_tracking.update_revision_message_counts(
+            'poll-no-such-db', [_poller_series('cid', 2, 'v2@x')]
+        )
+        assert result == {
+            'updated': 0,
+            'new_mail': 0,
+            'errors': 0,
+            'fresh_errors': 0,
+            'polled': 0,
+            'cancelled': 0,
+        }
+
+    def test_first_fetch_is_not_reported_as_new_mail(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """Two revisions never counted before, plus one that got mail.
+
+        The sweep summary quotes 'new_mail', so a catalog that has just
+        grown per-revision columns must not read as activity everywhere.
+        """
+        conn = review_tracking.init_db('poll-firstmail')
+        for rev, msgid in ((1, 'v1@x'), (2, 'v2@x'), (3, 'v3@x')):
+            review_tracking.add_revision(conn, 'cid', rev, msgid)
+        conn.execute(
+            'UPDATE revisions SET message_count = 5, seen_message_count = 5,'
+            " last_update_check = '2026-07-01T00:00:00+00:00'"
+            " WHERE change_id = 'cid' AND revision = 2"
+        )
+        conn.commit()
+        conn.close()
+        # v1 has never been counted; v2 was at 5 and has grown to 7.
+        monkeypatch.setattr(
+            review_tracking,
+            '_fetch_revision_thread_msgs',
+            lambda identifier, conn, change_id, rev: _thread_msgs(
+                7 if int(rev['revision']) == 2 else 2
+            ),
+        )
+        result = review_tracking.update_revision_message_counts(
+            'poll-firstmail', [_poller_series('cid', 3, 'v3@x')]
+        )
+        assert result == {
+            'updated': 2,
+            'new_mail': 1,
+            'errors': 0,
+            'fresh_errors': 0,
+            'polled': 2,
+            'cancelled': 0,
+        }
+
+    def test_new_mail_bumps_count(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        conn = review_tracking.init_db('poll-new')
+        review_tracking.add_revision(conn, 'cid', 1, 'v1@x')
+        review_tracking.add_revision(conn, 'cid', 2, 'v2@x')
+        conn.execute(
+            'UPDATE revisions SET message_count = 5, seen_message_count = 5,'
+            " last_update_check = '2026-07-01T00:00:00+00:00',"
+            " last_mail_at = '2026-06-30T00:00:00+00:00'"
+            " WHERE change_id = 'cid' AND revision = 1"
+        )
+        conn.commit()
+        conn.close()
+        monkeypatch.setattr(
+            review_tracking,
+            '_fetch_revision_thread_msgs',
+            lambda identifier, conn, change_id, rev: _thread_msgs(7),
+        )
+        result = review_tracking.update_revision_message_counts(
+            'poll-new', [_poller_series('cid', 2, 'v2@x')]
+        )
+        assert result == {
+            'updated': 1,
+            'new_mail': 1,
+            'errors': 0,
+            'fresh_errors': 0,
+            'polled': 1,
+            'cancelled': 0,
+        }
+        conn = review_tracking.get_db('poll-new')
+        revs = {r['revision']: r for r in review_tracking.get_revisions(conn, 'cid')}
+        conn.close()
+        assert revs[1]['message_count'] == 7
+        assert revs[1]['seen_message_count'] == 5
+        assert revs[1]['last_mail_at'] > '2026-06-30T00:00:00+00:00'
+        assert revs[1]['last_update_check'] > '2026-07-01T00:00:00+00:00'
+
+    def test_fetch_error_counts_error(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        conn = review_tracking.init_db('poll-err')
+        review_tracking.add_revision(conn, 'cid', 1, 'v1@x')
+        review_tracking.add_revision(conn, 'cid', 2, 'v2@x')
+        conn.execute(
+            'UPDATE revisions SET message_count = 5, seen_message_count = 5,'
+            " last_update_check = '2026-07-01T00:00:00+00:00'"
+            " WHERE change_id = 'cid' AND revision = 1"
+        )
+        conn.commit()
+        conn.close()
+        monkeypatch.setattr(b4, 'can_network', True)
+        monkeypatch.setattr(
+            review_tracking,
+            '_fetch_revision_thread_msgs',
+            lambda identifier, conn, change_id, rev: None,
+        )
+        result = review_tracking.update_revision_message_counts(
+            'poll-err', [_poller_series('cid', 2, 'v2@x')]
+        )
+        assert result == {
+            'updated': 0,
+            'new_mail': 0,
+            'errors': 1,
+            'fresh_errors': 1,
+            'polled': 0,
+            'cancelled': 0,
+        }
+        conn = review_tracking.get_db('poll-err')
+        revs = review_tracking.get_revisions(conn, 'cid')
+        conn.close()
+        assert revs[0]['message_count'] == 5
+
+    def test_skip_statuses_not_polled(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        conn = review_tracking.init_db('poll-skip')
+        review_tracking.add_revision(conn, 'cid', 1, 'v1@x')
+        conn.close()
+        calls: list[int] = []
+        monkeypatch.setattr(
+            review_tracking,
+            '_fetch_revision_thread_msgs',
+            lambda identifier, conn, change_id, rev: calls.append(rev['revision']),
+        )
+        for status in ('archived', 'snoozed'):
+            result = review_tracking.update_revision_message_counts(
+                'poll-skip', [_poller_series('cid', 2, 'v2@x', status=status)]
+            )
+            assert result == {
+                'updated': 0,
+                'new_mail': 0,
+                'errors': 0,
+                'fresh_errors': 0,
+                'polled': 0,
+                'cancelled': 0,
+            }
+        assert calls == []
+
+    def test_applied_series_is_still_polled(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """A late reply to an old version still counts once a series lands.
+
+        The tracked revision is deliberately polled past 'accepted' so
+        follow-up discussion on an applied series keeps raising a badge;
+        its older versions must not be dropped at the same moment.
+        """
+        conn = review_tracking.init_db('poll-applied')
+        review_tracking.add_revision(conn, 'cid', 1, 'v1@x')
+        conn.close()
+        calls: list[int] = []
+
+        def _fetch(identifier: str, conn: Any, change_id: str, rev: Any) -> Any:
+            calls.append(int(rev['revision']))
+            return _thread_msgs(3)
+
+        monkeypatch.setattr(review_tracking, '_fetch_revision_thread_msgs', _fetch)
+        for status in ('accepted', 'thanked'):
+            calls.clear()
+            # The first pass stamps the check; age it back out so the
+            # second status is not skipped by the minimum-interval gate.
+            conn = review_tracking.get_db('poll-applied')
+            conn.execute('UPDATE revisions SET last_update_check = NULL')
+            conn.commit()
+            conn.close()
+            review_tracking.update_revision_message_counts(
+                'poll-applied', [_poller_series('cid', 2, 'v2@x', status=status)]
+            )
+            assert calls == [1]
+
+    def test_tracked_revision_not_polled(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        conn = review_tracking.init_db('poll-tracked')
+        review_tracking.add_revision(conn, 'cid', 2, 'v2@x')
+        conn.close()
+        calls: list[int] = []
+        monkeypatch.setattr(
+            review_tracking,
+            '_fetch_revision_thread_msgs',
+            lambda identifier, conn, change_id, rev: calls.append(rev['revision']),
+        )
+        result = review_tracking.update_revision_message_counts(
+            'poll-tracked', [_poller_series('cid', 2, 'v2@x')]
+        )
+        assert result == {
+            'updated': 0,
+            'new_mail': 0,
+            'errors': 0,
+            'fresh_errors': 0,
+            'polled': 0,
+            'cancelled': 0,
+        }
+        assert calls == []
+
+    def test_tracked_row_backfilled_when_missing(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        """Seeded from the series table, the authority the dict mirrors."""
+        conn = review_tracking.init_db('poll-backfill')
+        review_tracking.add_series_to_db(
+            conn,
+            change_id='cid',
+            revision=2,
+            subject='test subject',
+            sender_name='n',
+            sender_email='e@x',
+            sent_at='2026-06-01T00:00:00+00:00',
+            message_id='v2@x',
+            num_patches=1,
+        )
+        # Simulate the manual-link gap: the series row exists, its
+        # revision's catalog row does not.
+        conn.execute('DELETE FROM revisions')
+        conn.commit()
+        conn.close()
+        review_tracking.update_revision_message_counts(
+            'poll-backfill', [_poller_series('cid', 2, 'v2@x')]
+        )
+        conn = review_tracking.get_db('poll-backfill')
+        revs = review_tracking.get_revisions(conn, 'cid')
+        conn.close()
+        assert len(revs) == 1
+        assert revs[0]['revision'] == 2
+        assert revs[0]['message_id'] == 'v2@x'
+        assert revs[0]['message_count'] is None
+
+    def test_a_recent_check_is_skipped(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """Below the cap the rotation never engages; the age floor must.
+
+        With every candidate under the cap, an uncapped rotation re-fetches
+        each quiet old version's full thread on every sweep just to learn
+        it is still quiet -- thousands of lore round-trips a day on a
+        30-minute cron for a list of any size.
+        """
+        recent = datetime.datetime.now(datetime.timezone.utc).isoformat()
+        conn = review_tracking.init_db('poll-fresh')
+        review_tracking.add_revision(conn, 'cid', 1, 'v1@x')
+        conn.execute(
+            'UPDATE revisions SET message_count = 5, seen_message_count = 5,'
+            ' last_update_check = ?',
+            (recent,),
+        )
+        conn.commit()
+        conn.close()
+        monkeypatch.setattr(
+            review_tracking,
+            '_fetch_revision_thread_msgs',
+            lambda identifier, conn, change_id, rev: pytest.fail(
+                'a freshly checked revision must not be fetched'
+            ),
+        )
+        result = review_tracking.update_revision_message_counts(
+            'poll-fresh', [_poller_series('cid', 2, 'v2@x')]
+        )
+        assert result['polled'] == 0
+
+    def test_named_revisions_bypass_the_age_floor(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """only_revisions means the caller is asking right now."""
+        recent = datetime.datetime.now(datetime.timezone.utc).isoformat()
+        conn = review_tracking.init_db('poll-named')
+        review_tracking.add_revision(conn, 'cid', 1, 'v1@x')
+        conn.execute(
+            'UPDATE revisions SET message_count = 5, seen_message_count = 5,'
+            ' last_update_check = ?',
+            (recent,),
+        )
+        conn.commit()
+        conn.close()
+        monkeypatch.setattr(
+            review_tracking,
+            '_fetch_revision_thread_msgs',
+            lambda identifier, conn, change_id, rev: _thread_msgs(5),
+        )
+        result = review_tracking.update_revision_message_counts(
+            'poll-named', [_poller_series('cid', 2, 'v2@x')], only_revisions={1}
+        )
+        assert result['polled'] == 1
+
+    def test_newest_first_with_cap(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        conn = review_tracking.init_db('poll-cap')
+        for rev in (1, 2, 3, 4):
+            review_tracking.add_revision(conn, 'cid', rev, f'v{rev}@x')
+        conn.close()
+        polled: list[int] = []
+
+        def _fake_fetch(
+            identifier: str, conn: Any, change_id: str, rev: Dict[str, Any]
+        ) -> list[EmailMessage]:
+            polled.append(int(rev['revision']))
+            return _thread_msgs(2)
+
+        monkeypatch.setattr(review_tracking, '_fetch_revision_thread_msgs', _fake_fetch)
+        result = review_tracking.update_revision_message_counts(
+            'poll-cap',
+            [_poller_series('cid', 4, 'v4@x')],
+            max_revisions_per_series=1,
+        )
+        assert result == {
+            'updated': 1,
+            'new_mail': 0,
+            'errors': 0,
+            'fresh_errors': 0,
+            'polled': 1,
+            'cancelled': 0,
+        }
+        assert polled == [3]
+
+    def test_rethreaded_first_fetch_reassembles(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        conn = review_tracking.init_db('poll-rt-first')
+        review_tracking.add_revision(conn, 'cid', 1, 'v1@x', is_rethreaded=True)
+        _insert_patches(conn, 'cid', 1, ['p1@x', 'p2@x'])
+        conn.close()
+        seen_dicts: list[Dict[str, Any]] = []
+
+        def _fake_retrieve(
+            series: Dict[str, Any], identifier: str
+        ) -> list[EmailMessage]:
+            seen_dicts.append(series)
+            return _thread_msgs(4)
+
+        monkeypatch.setattr(b4, 'can_network', True)
+        monkeypatch.setattr(b4.review, 'retrieve_series_messages', _fake_retrieve)
+        result = review_tracking.update_revision_message_counts(
+            'poll-rt-first', [_poller_series('cid', 2, 'v2@x')]
+        )
+        assert result == {
+            'updated': 1,
+            'new_mail': 0,
+            'errors': 0,
+            'fresh_errors': 0,
+            'polled': 1,
+            'cancelled': 0,
+        }
+        assert seen_dicts and seen_dicts[0]['is_rethreaded'] is True
+        assert seen_dicts[0]['revision'] == 1
+        conn = review_tracking.get_db('poll-rt-first')
+        revs = {r['revision']: r for r in review_tracking.get_revisions(conn, 'cid')}
+        conn.close()
+        assert revs[1]['message_count'] == 4
+
+    def test_rethreaded_recount_reassembles_from_patches(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """An already-counted rethreaded revision recounts the same way.
+
+        Summing per-patch queries counted a reply CC'd into several patch
+        threads once per thread; reassembly dedupes it.
+        """
+        conn = review_tracking.init_db('poll-rt-incr')
+        review_tracking.add_revision(conn, 'cid', 1, 'v1@x', is_rethreaded=True)
+        _insert_patches(conn, 'cid', 1, ['p1@x', 'p2@x'])
+        conn.execute(
+            'UPDATE revisions SET message_count = 6, seen_message_count = 6,'
+            " last_update_check = '2026-07-01T00:00:00+00:00'"
+            " WHERE change_id = 'cid' AND revision = 1"
+        )
+        conn.commit()
+        conn.close()
+        seen_series: list[Dict[str, Any]] = []
+
+        def _reassemble(series: Dict[str, Any], identifier: str) -> list[EmailMessage]:
+            seen_series.append(series)
+            return _thread_msgs(8)
+
+        monkeypatch.setattr(b4, 'can_network', True)
+        monkeypatch.setattr(b4.review, 'retrieve_series_messages', _reassemble)
+        result = review_tracking.update_revision_message_counts(
+            'poll-rt-incr', [_poller_series('cid', 2, 'v2@x')]
+        )
+        assert result == {
+            'updated': 1,
+            'new_mail': 1,
+            'errors': 0,
+            'fresh_errors': 0,
+            'polled': 1,
+            'cancelled': 0,
+        }
+        assert [s['revision'] for s in seen_series] == [1]
+        assert seen_series[0]['is_rethreaded'] is True
+        conn = review_tracking.get_db('poll-rt-incr')
+        revs = review_tracking.get_revisions(conn, 'cid')
+        conn.close()
+        assert revs[0]['message_count'] == 8
+        # Seen is untouched, so the two new messages raise a badge.
+        assert revs[0]['seen_message_count'] == 6
+
+    def test_first_fetch_stores_blob_with_topdir(
+        self, gitdir: str, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        conn = review_tracking.init_db('poll-blob')
+        review_tracking.add_revision(conn, 'cid', 1, 'v1@x')
+        conn.close()
+        monkeypatch.setattr(
+            review_tracking,
+            '_fetch_revision_thread_msgs',
+            lambda identifier, conn, change_id, rev: _thread_msgs(2),
+        )
+        review_tracking.update_revision_message_counts(
+            'poll-blob', [_poller_series('cid', 2, 'v2@x')], topdir=gitdir
+        )
+        conn = review_tracking.get_db('poll-blob')
+        revs = review_tracking.get_revisions(conn, 'cid')
+        conn.close()
+        blob_sha = revs[0]['thread_blob']
+        assert blob_sha
+        mbox = review_tracking.get_thread_mbox(gitdir, blob_sha)
+        assert mbox is not None
+        assert b'm-0@example.com' in mbox
+
+
+class TestRevisionAwareSyncHelpers:
+    """refresh_message_count / sync_seen fall back to the catalog."""
+
+    def _seed(self, identifier: str) -> None:
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
+            'UPDATE revisions SET message_count = 8, seen_message_count = 8'
+            " WHERE change_id = 'cid'"
+        )
+        review_tracking.add_revision(conn, 'cid', 1, 'v1@x')
+        review_tracking.add_revision(conn, 'cid', 2, 'v2@x')
+        conn.execute(
+            'UPDATE revisions SET message_count = 6, seen_message_count = 6'
+            " WHERE change_id = 'cid' AND revision = 1"
+        )
+        conn.execute(
+            'UPDATE revisions SET message_count = 3, seen_message_count = 3'
+            " WHERE change_id = 'cid' AND revision = 2"
+        )
+        conn.commit()
+        conn.close()
+
+    def test_sync_seen_writes_the_named_revisions_row(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        """No routing decision left: the revision named is the row written."""
+        self._seed('sync-live')
+        assert review_tracking.sync_seen_from_unseen_count('sync-live', 'cid', 2, 2)
+        conn = review_tracking.get_db('sync-live')
+        revs = {r['revision']: r for r in review_tracking.get_revisions(conn, 'cid')}
+        conn.close()
+        # v2 holds 3 messages, 2 of them unseen.
+        assert revs[2]['seen_message_count'] == 1
+        # ...and the version beside it is untouched.
+        assert revs[1]['seen_message_count'] == 6
+
+    def test_sync_seen_falls_back_to_catalog(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        self._seed('sync-fall')
+        assert review_tracking.sync_seen_from_unseen_count('sync-fall', 'cid', 1, 4)
+        conn = review_tracking.get_db('sync-fall')
+        rev_seen = conn.execute(
+            'SELECT seen_message_count FROM revisions'
+            " WHERE change_id = 'cid' AND revision = 1"
+        ).fetchone()[0]
+        conn.close()
+        assert rev_seen == 2
+
+    def test_sync_seen_ignores_the_series_status(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        """An archived series row used to shadow, then have to be excluded.
+
+        Read state never sat on it, so its status cannot affect a badge and
+        the write needs no guard against it.
+        """
+        self._seed('sync-arch')
+        conn = review_tracking.get_db('sync-arch')
+        review_tracking.update_series_status(conn, 'cid', 'archived')
+        conn.close()
+        assert review_tracking.sync_seen_from_unseen_count('sync-arch', 'cid', 2, 1)
+        conn = review_tracking.get_db('sync-arch')
+        revs = {r['revision']: r for r in review_tracking.get_revisions(conn, 'cid')}
+        conn.close()
+        assert revs[2]['seen_message_count'] == 2
+
+    def test_sync_seen_no_rows_returns_false(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        review_tracking.init_db('sync-none').close()
+        assert not review_tracking.sync_seen_from_unseen_count('sync-none', 'cid', 9, 1)
+
+    def test_refresh_count_falls_back_to_catalog(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        conn = review_tracking.init_db('refresh-fall')
+        review_tracking.add_revision(conn, 'cid', 1, 'v1@x')
+        conn.close()
+        assert review_tracking.refresh_message_count('refresh-fall', 'cid', 1, 7)
+        conn = review_tracking.get_db('refresh-fall')
+        revs = review_tracking.get_revisions(conn, 'cid')
+        conn.close()
+        # First fetch initialises both counts equally (no badge).
+        assert revs[0]['message_count'] == 7
+        assert revs[0]['seen_message_count'] == 7
+
+    def test_refresh_count_unchanged_writes_nothing(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        """A count that has not moved leaves the DB mtime alone."""
+        self._seed('refresh-skip')
+        assert not review_tracking.refresh_message_count('refresh-skip', 'cid', 2, 3)
+
+    def test_mark_all_messages_seen_clears_the_badge(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        """One row to clear, and its own total is what the badge showed."""
+        self._seed('mark-rev')
+        conn = review_tracking.get_db('mark-rev')
+        conn.execute(
+            'UPDATE revisions SET seen_message_count = 1'
+            " WHERE change_id = 'cid' AND revision = 2"
+        )
+        conn.commit()
+        review_tracking.mark_all_messages_seen(conn, 'cid', 2)
+        revs = {r['revision']: r for r in review_tracking.get_revisions(conn, 'cid')}
+        conn.close()
+        assert revs[2]['seen_message_count'] == revs[2]['message_count'] == 3
+        # The other version keeps whatever it had.
+        assert revs[1]['seen_message_count'] == 6
+
+    def test_marking_seen_uses_the_rows_own_total(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        """The count on the row is the count that was displayed.
+
+        This used to need a clamp: the badge came from a stitched read, so
+        a catalog row that ran ahead of the series row held messages the
+        list never showed.  With one copy the two cannot diverge.
+        """
+        self._seed('mark-ahead')
+        conn = review_tracking.get_db('mark-ahead')
+        conn.execute(
+            'UPDATE revisions SET message_count = 14, seen_message_count = 10'
+            " WHERE change_id = 'cid' AND revision = 2"
+        )
+        conn.commit()
+        revs = {r['revision']: r for r in review_tracking.get_revisions(conn, 'cid')}
+        assert revs[2]['message_count'] == 14
+        review_tracking.mark_all_messages_seen(conn, 'cid', 2)
+        revs = {r['revision']: r for r in review_tracking.get_revisions(conn, 'cid')}
+        conn.close()
+        assert revs[2]['seen_message_count'] == 14
+
+
+class TestRevisionCountsSurviveSeriesMoves:
+    """A series row only holds the tracked revision's counts.
+
+    Re-pointing or retiring one must hand that read state to the catalog,
+    which is where every non-tracked revision keeps it.
+    """
+
+    def _seed(self, identifier: str, revision: int = 2) -> sqlite3.Connection:
+        conn = review_tracking.init_db(identifier)
+        review_tracking.add_series_to_db(
+            conn,
+            change_id='cid',
+            revision=revision,
+            subject='s',
+            sender_name='n',
+            sender_email='e@x',
+            sent_at='2026-06-01T00:00:00+00:00',
+            message_id=f'v{revision}@x',
+            num_patches=3,
+        )
+        conn.execute(
+            'UPDATE revisions SET message_count = 12, seen_message_count = 9,'
+            " last_update_check = '2026-06-05T00:00:00+00:00',"
+            " last_mail_at = '2026-06-04T00:00:00+00:00'"
+            ' WHERE change_id = ? AND revision = ?',
+            ('cid', revision),
+        )
+        conn.commit()
+        return conn
+
+    def test_upgrade_parks_counts_in_catalog(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        conn = self._seed('carry-upgrade')
+        review_tracking.update_series_revision(conn, 'cid', 2, 3, 'v3@x')
+        revs = {r['revision']: r for r in review_tracking.get_revisions(conn, 'cid')}
+        conn.close()
+        assert revs[2]['message_count'] == 12
+        assert revs[2]['seen_message_count'] == 9
+        assert revs[2]['message_id'] == 'v2@x'
+        assert revs[2]['last_mail_at'] == '2026-06-04T00:00:00+00:00'
+
+    def test_upgrade_defers_to_a_newer_catalog_row(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        conn = self._seed('carry-nooverwrite')
+        review_tracking.add_revision(conn, 'cid', 2, 'v2@x')
+        conn.execute(
+            'UPDATE revisions SET message_count = 20, seen_message_count = 20,'
+            " last_update_check = '2026-06-09T00:00:00+00:00'"
+            " WHERE change_id = 'cid' AND revision = 2"
+        )
+        conn.commit()
+        review_tracking.update_series_revision(conn, 'cid', 2, 3, 'v3@x')
+        revs = {r['revision']: r for r in review_tracking.get_revisions(conn, 'cid')}
+        conn.close()
+        assert revs[2]['message_count'] == 20
+
+    def test_an_upgrade_leaves_the_old_revision_alone(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        """Nothing is copied on an upgrade, so nothing can overwrite.
+
+        The outgoing revision's counts were never on the series row: they
+        are its own, and moving off it does not touch them.
+        """
+        conn = self._seed('carry-overwrite')
+        review_tracking.add_revision(conn, 'cid', 2, 'v2@x')
+        conn.execute(
+            'UPDATE revisions SET message_count = 8, seen_message_count = 8,'
+            " last_update_check = '2026-06-01T00:00:00+00:00'"
+            " WHERE change_id = 'cid' AND revision = 2"
+        )
+        conn.commit()
+        review_tracking.update_series_revision(conn, 'cid', 2, 3, 'v3@x')
+        revs = {r['revision']: r for r in review_tracking.get_revisions(conn, 'cid')}
+        conn.close()
+        assert revs[2]['message_count'] == 8
+        assert revs[2]['seen_message_count'] == 8
+        assert revs[2]['last_update_check'] == '2026-06-01T00:00:00+00:00'
+
+    def test_an_upgrade_needs_no_staleness_check(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        """Which copy is newer was only ever a question with two copies."""
+        conn = self._seed('carry-untimed')
+        review_tracking.add_revision(conn, 'cid', 2, 'v2@x')
+        conn.execute(
+            'UPDATE revisions SET message_count = 20, seen_message_count = 20'
+            " WHERE change_id = 'cid' AND revision = 2"
+        )
+        conn.commit()
+        review_tracking.update_series_revision(conn, 'cid', 2, 3, 'v3@x')
+        revs = {r['revision']: r for r in review_tracking.get_revisions(conn, 'cid')}
+        conn.close()
+        # No timestamp anywhere, and still unambiguous.
+        assert revs[2]['message_count'] == 20
+
+    def test_absorb_carries_stray_counts(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        conn = review_tracking.init_db('carry-absorb')
+        review_tracking.add_series_to_db(
+            conn,
+            change_id='target',
+            revision=3,
+            subject='s',
+            sender_name='n',
+            sender_email='e@x',
+            sent_at='2026-06-01T00:00:00+00:00',
+            message_id='v3@x',
+            num_patches=3,
+        )
+        review_tracking.add_series_to_db(
+            conn,
+            change_id='stray',
+            revision=2,
+            subject='s',
+            sender_name='n',
+            sender_email='e@x',
+            sent_at='2026-05-01T00:00:00+00:00',
+            message_id='v2@x',
+            num_patches=3,
+        )
+        conn.execute(
+            'UPDATE revisions SET message_count = 15, seen_message_count = 11'
+            " WHERE change_id = 'stray'"
+        )
+        conn.commit()
+        assert review_tracking.absorb_series_as_revision(conn, 'target', 'stray', 2)
+        revs = {r['revision']: r for r in review_tracking.get_revisions(conn, 'target')}
+        conn.close()
+        assert revs[2]['message_count'] == 15
+        assert revs[2]['seen_message_count'] == 11
+
+    def test_absorb_carries_counts_held_only_by_the_catalog(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        """A stray's counts commonly live in its own catalog row.
+
+        The per-revision read COALESCEs over both tables, so a stray whose
+        series row never carried counts still displays them -- and absorb
+        deletes that catalog row, so reading only the series row drops the
+        state the user was looking at.
+        """
+        conn = review_tracking.init_db('carry-absorb-catalog')
+        review_tracking.add_series_to_db(
+            conn,
+            change_id='target',
+            revision=3,
+            subject='s',
+            sender_name='n',
+            sender_email='e@x',
+            sent_at='2026-06-01T00:00:00+00:00',
+            message_id='v3@x',
+            num_patches=3,
+        )
+        review_tracking.add_series_to_db(
+            conn,
+            change_id='stray',
+            revision=2,
+            subject='s',
+            sender_name='n',
+            sender_email='e@x',
+            sent_at='2026-05-01T00:00:00+00:00',
+            message_id='v2@x',
+            num_patches=3,
+        )
+        review_tracking.add_revision(conn, 'stray', 2, 'v2@x')
+        conn.execute(
+            'UPDATE revisions SET message_count = 12, seen_message_count = 5'
+            " WHERE change_id = 'stray' AND revision = 2"
+        )
+        conn.commit()
+        assert review_tracking.absorb_series_as_revision(conn, 'target', 'stray', 2)
+        revs = {r['revision']: r for r in review_tracking.get_revisions(conn, 'target')}
+        conn.close()
+        assert revs[2]['message_count'] == 12
+        assert revs[2]['seen_message_count'] == 5
+
+    def test_absorb_uses_the_revision_the_caller_matched(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        """A stray tracked across versions must not contribute the wrong one."""
+        conn = review_tracking.init_db('carry-absorb-multi')
+        review_tracking.add_series_to_db(
+            conn,
+            change_id='target',
+            revision=5,
+            subject='s',
+            sender_name='n',
+            sender_email='e@x',
+            sent_at='2026-06-01T00:00:00+00:00',
+            message_id='t5@x',
+            num_patches=3,
+        )
+        for rev, count in ((2, 4), (3, 30)):
+            review_tracking.add_series_to_db(
+                conn,
+                change_id='stray',
+                revision=rev,
+                subject='s',
+                sender_name='n',
+                sender_email='e@x',
+                sent_at='2026-06-01T00:00:00+00:00',
+                message_id=f'stray-v{rev}@x',
+                num_patches=1,
+            )
+            conn.execute(
+                'UPDATE revisions SET message_count = ?, seen_message_count = 0'
+                " WHERE change_id = 'stray' AND revision = ?",
+                (count, rev),
+            )
+        conn.commit()
+        assert review_tracking.absorb_series_as_revision(
+            conn, 'target', 'stray', 2, stray_revision=2
+        )
+        revs = {r['revision']: r for r in review_tracking.get_revisions(conn, 'target')}
+        conn.close()
+        # v3's message-id and counts must not arrive labelled as v2.
+        assert revs[2]['message_id'] == 'stray-v2@x'
+        assert revs[2]['message_count'] == 4
+
+    def test_absorb_refuses_a_revision_the_stray_does_not_track(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        """A named revision is the only candidate, never a hint.
+
+        The catalog can hold a revision the stray never had a series row
+        for, and falling back to another of its versions would file that
+        posting under the message-id the caller matched.
+        """
+        conn = review_tracking.init_db('carry-absorb-missing')
+        review_tracking.add_series_to_db(
+            conn,
+            change_id='target',
+            revision=5,
+            subject='s',
+            sender_name='n',
+            sender_email='e@x',
+            sent_at='2026-06-01T00:00:00+00:00',
+            message_id='t5@x',
+            num_patches=3,
+        )
+        review_tracking.add_series_to_db(
+            conn,
+            change_id='stray',
+            revision=3,
+            subject='s',
+            sender_name='n',
+            sender_email='e@x',
+            sent_at='2026-06-01T00:00:00+00:00',
+            message_id='stray-v3@x',
+            num_patches=1,
+        )
+        conn.execute(
+            'UPDATE revisions SET message_count = 30, seen_message_count = 0'
+            " WHERE change_id = 'stray' AND revision = 3"
+        )
+        conn.commit()
+
+        assert (
+            review_tracking.absorb_series_as_revision(
+                conn, 'target', 'stray', 2, stray_revision=2
+            )
+            is False
+        )
+        revs = review_tracking.get_revisions(conn, 'target')
+        stray_rows = conn.execute(
+            "SELECT COUNT(*) FROM series WHERE change_id = 'stray'"
+        ).fetchone()[0]
+        conn.close()
+        # The refused absorb recorded nothing, and the stray is untouched --
+        # v3's message-id must not turn up labelled v2.  The target's own
+        # v5 row is there because tracking a series catalogues the revision
+        # it tracks, which is where that revision's read state lives.
+        assert [r['revision'] for r in revs] == [5]
+        assert stray_rows == 1
+
+    def test_archiving_parks_counts_in_catalog(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        """Upgrading a checked-out series archives the outgoing row.
+
+        Per-revision reads skip archived rows, so the counts have to
+        reach the catalog before the status flips.
+        """
+        conn = self._seed('carry-archive', revision=1)
+        review_tracking.add_revision(conn, 'cid', 1, 'v1@x')
+        review_tracking.update_series_status(conn, 'cid', 'archived', revision=1)
+        review_tracking.add_series_to_db(
+            conn,
+            change_id='cid',
+            revision=2,
+            subject='s',
+            sender_name='n',
+            sender_email='e@x',
+            sent_at='2026-06-10T00:00:00+00:00',
+            message_id='v2@x',
+            num_patches=3,
+        )
+        revs = {r['revision']: r for r in review_tracking.get_revisions(conn, 'cid')}
+        conn.close()
+        assert revs[1]['message_count'] == 12
+        assert revs[1]['seen_message_count'] == 9
+
+    def test_archiving_backfills_a_missing_catalog_row(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        """A manually linked series can lack a catalog row entirely."""
+        conn = self._seed('carry-archive-nocatalog', revision=1)
+        review_tracking.update_series_status(conn, 'cid', 'archived')
+        revs = {r['revision']: r for r in review_tracking.get_revisions(conn, 'cid')}
+        conn.close()
+        assert revs[1]['message_id'] == 'v1@x'
+        assert revs[1]['message_count'] == 12
+        assert revs[1]['seen_message_count'] == 9
+
+    def test_parking_dates_the_revision_it_retires(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        """found_at is when the version was posted, not when it was retired."""
+        conn = self._seed('carry-founddate', revision=2)
+        conn.execute(
+            "UPDATE series SET added_at = '2026-06-02T00:00:00+00:00'"
+            " WHERE change_id = 'cid'"
+        )
+        conn.commit()
+        review_tracking.update_series_revision(conn, 'cid', 2, 3, 'v3@x')
+        revs = {r['revision']: r for r in review_tracking.get_revisions(conn, 'cid')}
+        conn.close()
+        # Dating it now would sort the older version after the newer one, and
+        # dating it added_at reports when tracking started -- sent_at is the
+        # Date: header the row claims to be showing.
+        assert revs[2]['found_at'] == '2026-06-01T00:00:00+00:00'
+
+    def test_archiving_keeps_the_revisions_watermark(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        """A NULL watermark sorts to the head of the poll rotation forever.
+
+        Archiving used to park counts, which could spread the incoming
+        revision's cleared watermark onto the one being retired.  It now
+        writes no read state at all.
+        """
+        conn = self._seed('carry-nullmark', revision=2)
+        review_tracking.add_revision(conn, 'cid', 2, 'v2@x')
+        conn.execute(
+            'UPDATE revisions SET message_count = 4, seen_message_count = 4,'
+            " last_update_check = '2026-06-02T00:00:00+00:00'"
+            " WHERE change_id = 'cid' AND revision = 2"
+        )
+        conn.commit()
+        review_tracking.update_series_status(conn, 'cid', 'archived', revision=2)
+        row = conn.execute(
+            'SELECT last_update_check FROM revisions'
+            " WHERE change_id = 'cid' AND revision = 2"
+        ).fetchone()
+        conn.close()
+        assert row[0] == '2026-06-02T00:00:00+00:00'
+
+    def test_parking_does_not_overwrite_polled_activity(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        """series.last_activity_at also stamps maintainer actions.
+
+        The catalog column only ever holds a real Date: header, so a
+        snooze or a status change must not replace one.
+        """
+        conn = self._seed('carry-activity', revision=2)
+        review_tracking.add_revision(conn, 'cid', 2, 'v2@x')
+        conn.execute(
+            'UPDATE revisions SET message_count = 4, seen_message_count = 4,'
+            " last_mail_at = '2026-03-01T00:00:00+00:00'"
+            " WHERE change_id = 'cid' AND revision = 2"
+        )
+        # A maintainer action bumps the series stamp to something newer.
+        conn.execute(
+            "UPDATE series SET last_activity_at = '2026-07-01T00:00:00+00:00'"
+            " WHERE change_id = 'cid'"
+        )
+        conn.commit()
+        review_tracking.update_series_status(conn, 'cid', 'archived', revision=2)
+        row = conn.execute(
+            'SELECT last_mail_at FROM revisions'
+            " WHERE change_id = 'cid' AND revision = 2"
+        ).fetchone()
+        conn.close()
+        assert row[0] == '2026-03-01T00:00:00+00:00'
+
+
+class TestPollerFetchDiscipline:
+    """The poller must fetch the same way every other count writer does."""
+
+    def test_fetch_is_uncached_and_strict(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """A cached mbox can predate the very messages the rt: poll found.
+
+        Counting it would leave message_count unmoved while
+        last_update_check advanced past those messages, losing them.
+        """
+        calls: list[Dict[str, Any]] = []
+
+        def _fake(msgid: str, **kw: Any) -> list[EmailMessage]:
+            calls.append({'msgid': msgid, **kw})
+            return _thread_msgs(3)
+
+        monkeypatch.setattr(b4, 'can_network', True)
+        monkeypatch.setattr(b4, 'get_pi_thread_by_msgid', _fake)
+        msgs = review_tracking._fetch_thread_msgs('v1@x')
+        assert msgs is not None and len(msgs) == 3
+        assert calls == [{'msgid': 'v1@x', 'nocache': True, 'quiet': True}]
+
+    def test_fetch_propagates_cancellation(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        def _cancelled(msgid: str, **kw: Any) -> list[EmailMessage]:
+            raise liblore.OperationCancelledError('Request cancelled')
+
+        monkeypatch.setattr(b4, 'can_network', True)
+        monkeypatch.setattr(b4, 'get_pi_thread_by_msgid', _cancelled)
+        with pytest.raises(liblore.OperationCancelledError):
+            review_tracking._fetch_thread_msgs('v1@x')
+
+    def test_offline_skips_rethreaded_fetch(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """Offline must short-circuit before the per-patch requests."""
+        conn = review_tracking.init_db('poll-offline')
+        review_tracking.add_revision(conn, 'cid', 1, 'v1@x', is_rethreaded=True)
+        _insert_patches(conn, 'cid', 1, ['p1@x', 'p2@x'])
+        conn.close()
+
+        def _boom(series: Dict[str, Any], identifier: str) -> list[EmailMessage]:
+            raise AssertionError('must not fetch while offline')
+
+        monkeypatch.setattr(b4, 'can_network', False)
+        monkeypatch.setattr(b4.review, 'retrieve_series_messages', _boom)
+        result = review_tracking.update_revision_message_counts(
+            'poll-offline', [_poller_series('cid', 2, 'v2@x')]
+        )
+        # Offline is not a failure: no request was issued, so nothing is
+        # reported unreachable.  Counting it would have _cron_update() mail
+        # 'Could not poll N non-tracked revision(s)' after every sweep run
+        # from a machine that happened to be off the network.
+        assert result == {
+            'updated': 0,
+            'new_mail': 0,
+            'errors': 0,
+            'fresh_errors': 0,
+            'polled': 0,
+            'cancelled': 0,
+        }
+
+    def test_cancel_cb_stops_the_sweep(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        conn = review_tracking.init_db('poll-cancel')
+        for rev in (1, 2, 3):
+            review_tracking.add_revision(conn, 'cid', rev, f'v{rev}@x')
+        conn.close()
+        polled: list[int] = []
+
+        def _fake_fetch(
+            identifier: str, conn: Any, change_id: str, rev: Dict[str, Any]
+        ) -> list[EmailMessage]:
+            polled.append(int(rev['revision']))
+            return _thread_msgs(2)
+
+        monkeypatch.setattr(review_tracking, '_fetch_revision_thread_msgs', _fake_fetch)
+        result = review_tracking.update_revision_message_counts(
+            'poll-cancel',
+            [_poller_series('cid', 4, 'v4@x')],
+            cancel_cb=lambda: len(polled) >= 1,
+        )
+        assert polled == [3]
+        assert result['updated'] == 1
+
+    def test_connection_closed_when_a_revision_raises(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """update_all_tracking swallows and continues, so a leak compounds."""
+        conn = review_tracking.init_db('poll-leak')
+        review_tracking.add_revision(conn, 'cid', 1, 'v1@x')
+        conn.close()
+        real_get_db = review_tracking.get_db
+
+        class _ProxyConn:
+            """sqlite3.Connection.close is read-only, so wrap instead."""
+
+            def __init__(self, real: sqlite3.Connection) -> None:
+                self._real = real
+                self.closed = False
+
+            def __getattr__(self, name: str) -> Any:
+                return getattr(self._real, name)
+
+            def close(self) -> None:
+                self.closed = True
+                self._real.close()
+
+        proxies: list[_ProxyConn] = []
+
+        def _tracking_get_db(identifier: str) -> Any:
+            proxy = _ProxyConn(real_get_db(identifier))
+            proxies.append(proxy)
+            return proxy
+
+        def _boom(*a: Any, **kw: Any) -> None:
+            raise sqlite3.OperationalError('database is locked')
+
+        monkeypatch.setattr(review_tracking, 'get_db', _tracking_get_db)
+        monkeypatch.setattr(review_tracking, '_update_one_revision_count', _boom)
+        with pytest.raises(sqlite3.OperationalError):
+            review_tracking.update_revision_message_counts(
+                'poll-leak', [_poller_series('cid', 2, 'v2@x')]
+            )
+        assert proxies and all(p.closed for p in proxies)
+
+    def test_incremental_stamps_per_revision(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """A sweep-wide timestamp double-counts mail arriving during it."""
+        conn = review_tracking.init_db('poll-stamp')
+        for rev in (1, 2):
+            review_tracking.add_revision(conn, 'cid', rev, f'v{rev}@x')
+        conn.close()
+        stamps: list[str] = []
+
+        def _fake_fetch(
+            identifier: str, conn: Any, change_id: str, rev: Dict[str, Any]
+        ) -> list[EmailMessage]:
+            return _thread_msgs(2)
+
+        monkeypatch.setattr(review_tracking, '_fetch_revision_thread_msgs', _fake_fetch)
+        review_tracking.update_revision_message_counts(
+            'poll-stamp', [_poller_series('cid', 3, 'v3@x')]
+        )
+        conn = review_tracking.get_db('poll-stamp')
+        stamps = [
+            r['last_update_check']
+            for r in review_tracking.get_revisions(conn, 'cid')
+            # v3 is the tracked revision, so the poller skips it
+            if r['revision'] != 3
+        ]
+        conn.close()
+        assert len(stamps) == 2
+        assert all(s for s in stamps)
+        assert len(set(stamps)) == 2
+
+
+class TestRevisionSwitchClearsStaleState:
+    """update_series_revision() must not leave the old revision behind."""
+
+    def _seed(self, identifier: str) -> None:
+        conn = review_tracking.init_db(identifier)
+        review_tracking.add_series_to_db(
+            conn,
+            change_id='cid',
+            revision=2,
+            subject='[PATCH v2 0/2] thing',
+            sender_name='S',
+            sender_email='s@e.com',
+            sent_at='2026-01-01T00:00:00+00:00',
+            message_id='v2@e.com',
+            num_patches=2,
+        )
+        conn.execute(
+            'UPDATE revisions SET message_count = 10, seen_message_count = 10,'
+            " last_update_check = '2026-05-01T00:00:00+00:00',"
+            " last_mail_at = '2026-04-28T00:00:00+00:00'"
+            " WHERE change_id = 'cid'"
+        )
+        review_tracking.add_revision(conn, 'cid', 2, 'v2@e.com')
+        review_tracking.add_revision(conn, 'cid', 3, 'v3@e.com')
+        conn.execute(
+            'UPDATE revisions SET message_count = 7, seen_message_count = 7,'
+            " last_update_check = '2026-06-01T00:00:00+00:00',"
+            " last_mail_at = '2026-05-30T00:00:00+00:00'"
+            " WHERE change_id = 'cid' AND revision = 3"
+        )
+        conn.commit()
+        conn.close()
+
+    def test_watermark_does_not_survive_the_switch(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        """The incoming revision must not inherit the outgoing thread's watermark."""
+        self._seed('switch-watermark')
+        conn = review_tracking.get_db('switch-watermark')
+        review_tracking.update_series_revision(conn, 'cid', 2, 3, 'v3@e.com')
+        revs = {r['revision']: r for r in review_tracking.get_revisions(conn, 'cid')}
+        conn.close()
+        # v3's count comes from the catalog, so its watermark must too --
+        # not from the series row, where it still described v2.
+        assert revs[3]['message_count'] == 7
+        assert revs[3]['last_update_check'] == '2026-06-01T00:00:00+00:00'
+
+    def test_activity_is_the_threads_not_the_switch(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        """A version row reports thread activity, not when the upgrade happened."""
+        self._seed('switch-activity')
+        conn = review_tracking.get_db('switch-activity')
+        review_tracking.update_series_revision(conn, 'cid', 2, 3, 'v3@e.com')
+        revs = {r['revision']: r for r in review_tracking.get_revisions(conn, 'cid')}
+        conn.close()
+        assert revs[3]['last_mail_at'] == '2026-05-30T00:00:00+00:00'
+        assert revs[2]['last_mail_at'] == '2026-04-28T00:00:00+00:00'
+
+    def test_rethread_flag_is_repointed(self, tmp_path: pytest.TempPathFactory) -> None:
+        """The flag describes the tracked revision, so it moves with it."""
+        self._seed('switch-rethread')
+        conn = review_tracking.get_db('switch-rethread')
+        conn.execute("UPDATE series SET is_rethreaded = 1 WHERE change_id = 'cid'")
+        conn.commit()
+        review_tracking.update_series_revision(conn, 'cid', 2, 3, 'v3@e.com')
+        row = conn.execute(
+            "SELECT is_rethreaded FROM series WHERE change_id = 'cid'"
+        ).fetchone()
+        assert row[0] == 0
+        # ...and parking must not stamp the stale flag onto the catalog,
+        # where add_revision() promotes but never clears it.
+        review_tracking.update_series_status(conn, 'cid', 'archived', revision=3)
+        crow = conn.execute(
+            'SELECT is_rethreaded FROM revisions'
+            " WHERE change_id = 'cid' AND revision = 3"
+        ).fetchone()
+        conn.close()
+        assert crow[0] == 0
+
+    def test_incoming_counts_are_simply_read(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        """A switch cannot mark the incoming version's unread mail read.
+
+        There is no first-sighting to mistake it for: the row the series
+        moves onto already holds whatever the poller learned about it, and
+        the next count write reads that rather than a blank series row.
+        """
+        self._seed('switch-adopt')
+        conn = review_tracking.get_db('switch-adopt')
+        conn.execute(
+            'UPDATE revisions SET seen_message_count = 4'
+            " WHERE change_id = 'cid' AND revision = 3"
+        )
+        conn.commit()
+        review_tracking.update_series_revision(conn, 'cid', 2, 3, 'v3@e.com')
+        # The sweep refetches the tracked thread and finds the same 7.
+        changed = review_tracking.update_message_count_from_msgs(
+            conn, 'cid', 3, _thread_msgs(7)
+        )
+        revs = {r['revision']: r for r in review_tracking.get_revisions(conn, 'cid')}
+        conn.close()
+        assert (revs[3]['message_count'], revs[3]['seen_message_count']) == (7, 4)
+        # Nothing moved, and nothing had to be moved for it to be right.
+        assert changed is False
+
+    def test_refresh_count_reads_the_same_row(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        """Opening the thread viewer must not clear the badge either."""
+        self._seed('switch-adopt-refresh')
+        conn = review_tracking.get_db('switch-adopt-refresh')
+        conn.execute(
+            'UPDATE revisions SET seen_message_count = 4'
+            " WHERE change_id = 'cid' AND revision = 3"
+        )
+        conn.commit()
+        review_tracking.update_series_revision(conn, 'cid', 2, 3, 'v3@e.com')
+        conn.close()
+        # 7 is what the row already holds, so there is nothing to write.
+        assert not review_tracking.refresh_message_count(
+            'switch-adopt-refresh', 'cid', 3, 7
+        )
+        conn = review_tracking.get_db('switch-adopt-refresh')
+        revs = {r['revision']: r for r in review_tracking.get_revisions(conn, 'cid')}
+        conn.close()
+        assert (revs[3]['message_count'], revs[3]['seen_message_count']) == (7, 4)
+
+
+class TestPollerLeavesOtherLiveRowsAlone:
+    """A second live series row's revision is not the poller's to write."""
+
+    @staticmethod
+    def _two_live_rows(identifier: str) -> None:
+        """One change_id, two non-archived series rows, as rescan leaves them."""
+        conn = review_tracking.init_db(identifier)
+        for rev, msgid in ((2, 'v2@x'), (1, 'v1@x')):
+            review_tracking.add_series_to_db(
+                conn,
+                change_id='cid',
+                revision=rev,
+                subject=f'[PATCH v{rev}] thing',
+                sender_name='S',
+                sender_email='s@e.com',
+                sent_at='2026-01-01T00:00:00+00:00',
+                message_id=msgid,
+                num_patches=1,
+            )
+            review_tracking.add_revision(conn, 'cid', rev, msgid)
+        conn.commit()
+        conn.close()
+
+    def test_another_rows_tracked_revision_is_not_polled(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """update_all_tracking() walks the rows one at a time.
+
+        Excluding only the revision of the dict this call was handed leaves
+        the *other* row's actively tracked revision fair game -- and the
+        poller writes the catalog from a first fetch (seen = count), so that
+        row's unread delta is gone before anything can park it.
+        """
+        self._two_live_rows('poll-otherrow')
+        conn = review_tracking.get_db('poll-otherrow')
+        conn.execute(
+            'UPDATE revisions SET message_count = 20, seen_message_count = 17,'
+            " last_update_check = '2026-01-01T00:00:00+00:00'"
+            " WHERE change_id = 'cid' AND revision = 1"
+        )
+        conn.commit()
+        conn.close()
+        polled: list[int] = []
+
+        def _fetch(identifier: str, conn: Any, change_id: str, rev: Any) -> Any:
+            polled.append(int(rev['revision']))
+            return _thread_msgs(20)
+
+        monkeypatch.setattr(b4, 'can_network', True)
+        monkeypatch.setattr(review_tracking, '_fetch_revision_thread_msgs', _fetch)
+        review_tracking.update_revision_message_counts(
+            'poll-otherrow', [_poller_series('cid', 2, 'v2@x')]
+        )
+        assert polled == []
+
+    def test_the_other_rows_unread_survives(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """The end-to-end damage this once caused: three unread marked read.
+
+        A change_id with two live series rows had one row's unread state
+        overwritten by the other.  Nothing copies read state between rows
+        any more, so the poller simply has to leave a revision another live
+        row tracks to that row.
+        """
+        self._two_live_rows('poll-otherpark')
+        conn = review_tracking.get_db('poll-otherpark')
+        conn.execute(
+            'UPDATE revisions SET message_count = 20, seen_message_count = 17,'
+            " last_update_check = '2026-01-01T00:00:00+00:00'"
+            " WHERE change_id = 'cid' AND revision = 1"
+        )
+        conn.commit()
+        conn.close()
+
+        monkeypatch.setattr(b4, 'can_network', True)
+        monkeypatch.setattr(
+            review_tracking,
+            '_fetch_revision_thread_msgs',
+            lambda identifier, conn, change_id, rev: _thread_msgs(20),
+        )
+        review_tracking.update_revision_message_counts(
+            'poll-otherpark', [_poller_series('cid', 2, 'v2@x')]
+        )
+        conn = review_tracking.get_db('poll-otherpark')
+        review_tracking.update_series_status(conn, 'cid', 'archived', revision=1)
+        row = conn.execute(
+            'SELECT message_count, seen_message_count FROM revisions'
+            " WHERE change_id = 'cid' AND revision = 1"
+        ).fetchone()
+        conn.close()
+        assert (row[0], row[1]) == (20, 17)
+
+
+class TestPollerRoutesOnTheCatalogRow:
+    """The poller reads the row it writes, not the stitched view."""
+
+    def test_counted_but_unwatermarked_keeps_its_badge(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """The v11 migration seeds counts with a NULL watermark; don't clobber."""
+        conn = review_tracking.init_db('poll-nowm')
+        review_tracking.add_revision(conn, 'cid', 1, 'v1@x')
+        conn.execute(
+            'UPDATE revisions SET message_count = 4, seen_message_count = 1,'
+            " last_mail_at = '2026-02-02T00:00:00+00:00'"
+            " WHERE change_id = 'cid' AND revision = 1"
+        )
+        conn.commit()
+        conn.close()
+        # No Date: headers, so the fetch cannot improve on last_activity_at.
+        undated = _thread_msgs(6)
+        for msg in undated:
+            del msg['Date']
+        monkeypatch.setattr(
+            review_tracking,
+            '_fetch_revision_thread_msgs',
+            lambda identifier, conn, change_id, rev: undated,
+        )
+        review_tracking.update_revision_message_counts(
+            'poll-nowm', [_poller_series('cid', 2, 'v2@x')]
+        )
+        conn = review_tracking.get_db('poll-nowm')
+        row = conn.execute(
+            'SELECT message_count, seen_message_count, last_mail_at'
+            " FROM revisions WHERE change_id = 'cid' AND revision = 1"
+        ).fetchone()
+        conn.close()
+        # 3 unread before, 5 after -- not "all read".
+        assert (row['message_count'], row['seen_message_count']) == (6, 1)
+        assert row['last_mail_at'] == '2026-02-02T00:00:00+00:00'
+
+    def test_single_patch_rethread_uses_the_recorded_thread(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """One recorded patch is not enough to reassemble from."""
+        conn = review_tracking.init_db('poll-rt1')
+        review_tracking.add_revision(conn, 'cid', 1, 'v1@x', is_rethreaded=True)
+        conn.execute(
+            'INSERT INTO series_patches (change_id, revision, position, message_id)'
+            " VALUES ('cid', 1, 1, 'p1@x')"
+        )
+        conn.commit()
+        conn.close()
+        queried: list[str] = []
+
+        def _thread(msgid: str) -> list[EmailMessage]:
+            queried.append(msgid)
+            return _thread_msgs(3)
+
+        monkeypatch.setattr(b4, 'can_network', True)
+        monkeypatch.setattr(review_tracking, '_fetch_thread_msgs', _thread)
+        monkeypatch.setattr(
+            b4.review,
+            'retrieve_series_messages',
+            lambda series, identifier: pytest.fail('must not reassemble'),
+        )
+        review_tracking.update_revision_message_counts(
+            'poll-rt1', [_poller_series('cid', 2, 'v2@x')]
+        )
+        assert queried == ['v1@x']
+
+
+class TestPollCapFairness:
+    """The cap must not permanently hide the oldest versions."""
+
+    def _seed(self, identifier: str, revs: int) -> None:
+        conn = review_tracking.init_db(identifier)
+        for rev in range(1, revs + 1):
+            review_tracking.add_revision(conn, 'cid', rev, f'v{rev}@x')
+        conn.close()
+
+    def test_never_counted_revisions_are_polled_first(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """A newest-first cap left v1/v2 of a v6 series at '-' forever."""
+        self._seed('cap-fair', 5)
+        conn = review_tracking.get_db('cap-fair')
+        # v3..v5 already counted; v1 and v2 never were.
+        conn.execute(
+            'UPDATE revisions SET message_count = 2, seen_message_count = 2,'
+            " last_update_check = '2026-06-01T00:00:00+00:00'"
+            ' WHERE change_id = ? AND revision >= 3',
+            ('cid',),
+        )
+        conn.commit()
+        conn.close()
+        fetched: list[int] = []
+
+        def _full(identifier: str, conn: Any, change_id: str, rev: Any) -> Any:
+            fetched.append(int(rev['revision']))
+            return _thread_msgs(2)
+
+        monkeypatch.setattr(review_tracking, '_fetch_revision_thread_msgs', _full)
+        review_tracking.update_revision_message_counts(
+            'cap-fair',
+            [_poller_series('cid', 6, 'v6@x')],
+            max_revisions_per_series=2,
+        )
+        assert sorted(fetched) == [1, 2]
+
+    def test_a_failed_fetch_does_not_spend_the_budget(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """One unreachable revision must not starve the ones behind it."""
+        self._seed('cap-fail', 3)
+        attempted: list[int] = []
+
+        def _full(identifier: str, conn: Any, change_id: str, rev: Any) -> Any:
+            revision = int(rev['revision'])
+            attempted.append(revision)
+            # v3 is unreachable, the rest are fine.
+            return None if revision == 3 else _thread_msgs(2)
+
+        monkeypatch.setattr(b4, 'can_network', True)
+        monkeypatch.setattr(review_tracking, '_fetch_revision_thread_msgs', _full)
+        result = review_tracking.update_revision_message_counts(
+            'cap-fail',
+            [_poller_series('cid', 4, 'v4@x')],
+            max_revisions_per_series=2,
+        )
+        assert result['errors'] == 1
+        assert result['updated'] == 2
+        assert attempted == [3, 2, 1]
+
+    def test_two_failures_in_a_row_stop_the_series(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """Offline means every revision fails; don't try the whole catalog."""
+        self._seed('cap-offline', 6)
+        attempted: list[int] = []
+
+        def _full(identifier: str, conn: Any, change_id: str, rev: Any) -> Any:
+            attempted.append(int(rev['revision']))
+            return None
+
+        monkeypatch.setattr(review_tracking, '_fetch_revision_thread_msgs', _full)
+        review_tracking.update_revision_message_counts(
+            'cap-offline',
+            [_poller_series('cid', 7, 'v7@x')],
+            max_revisions_per_series=4,
+        )
+        assert len(attempted) == 2
+
+    def test_a_dead_revision_does_not_starve_the_rotation(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """Two permanently unreachable revisions used to stop every sweep.
+
+        They stayed uncounted, so they sorted to the front for ever, and
+        two failures in a row abandoned the series before anything else
+        was reached -- including the recent versions late replies land on.
+        """
+        monkeypatch.setattr(b4, 'can_network', True)
+        self._seed('cap-dead', 5)
+        conn = review_tracking.get_db('cap-dead')
+        conn.execute(
+            'UPDATE revisions SET message_count = 2, seen_message_count = 2,'
+            " last_update_check = '2026-06-01T00:00:00+00:00'"
+            ' WHERE change_id = ? AND revision >= 4',
+            ('cid',),
+        )
+        conn.commit()
+        conn.close()
+
+        def _full(identifier: str, conn: Any, change_id: str, rev: Any) -> Any:
+            # v1 and v2 are gone from the archive for good.
+            return None if int(rev['revision']) in (1, 2) else _thread_msgs(3)
+
+        monkeypatch.setattr(review_tracking, '_fetch_revision_thread_msgs', _full)
+        for _ in range(3):
+            review_tracking.update_revision_message_counts(
+                'cap-dead',
+                [_poller_series('cid', 6, 'v6@x')],
+                max_revisions_per_series=2,
+            )
+        conn = review_tracking.get_db('cap-dead')
+        revs = {r['revision']: r for r in review_tracking.get_revisions(conn, 'cid')}
+        conn.close()
+        # The reachable versions were reached despite the two dead ones.
+        assert revs[4]['message_count'] == 3
+        assert revs[5]['message_count'] == 3
+
+    def test_named_revisions_are_not_abandoned_after_two_failures(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """discover_older_revisions passes only_revisions with no cap.
+
+        It does that precisely so every version it just recorded gets
+        counted; giving up after two dead message-ids -- which is exactly
+        what a backward lore search turns up -- reintroduces the starvation
+        the missing cap was avoiding.
+        """
+        self._seed('cap-named', 4)
+        fetched: list[int] = []
+
+        def _full(identifier: str, conn: Any, change_id: str, rev: Any) -> Any:
+            revision = int(rev['revision'])
+            fetched.append(revision)
+            return None if revision in (3, 4) else _thread_msgs(3)
+
+        monkeypatch.setattr(review_tracking, '_fetch_revision_thread_msgs', _full)
+        review_tracking.update_revision_message_counts(
+            'cap-named',
+            [_poller_series('cid', 5, 'v5@x')],
+            only_revisions={1, 2, 3, 4},
+        )
+        conn = review_tracking.get_db('cap-named')
+        revs = {r['revision']: r for r in review_tracking.get_revisions(conn, 'cid')}
+        conn.close()
+        assert fetched == [4, 3, 2, 1]
+        assert revs[1]['message_count'] == 3
+        assert revs[2]['message_count'] == 3
+
+    def test_counted_revisions_come_back_around(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """A newest-first cap watched only the newest few, for ever."""
+        self._seed('cap-rotate', 6)
+        conn = review_tracking.get_db('cap-rotate')
+        conn.execute(
+            'UPDATE revisions SET message_count = 2, seen_message_count = 2,'
+            " last_update_check = '2026-06-01T00:00:00+00:00'",
+        )
+        conn.commit()
+        conn.close()
+        attempted: list[int] = []
+
+        def _full(identifier: str, conn: Any, change_id: str, rev: Any) -> Any:
+            attempted.append(int(rev['revision']))
+            return _thread_msgs(2)
+
+        monkeypatch.setattr(review_tracking, '_fetch_revision_thread_msgs', _full)
+        for _ in range(3):
+            review_tracking.update_revision_message_counts(
+                'cap-rotate',
+                [_poller_series('cid', 7, 'v7@x')],
+                max_revisions_per_series=2,
+            )
+        # Six sweeps' worth of budget covered all six versions, not the
+        # same two over and over.
+        assert sorted(attempted) == [1, 2, 3, 4, 5, 6]
+
+
+class TestSeenSyncFallsBackToCatalog:
+    def test_uncounted_series_row_defers_to_the_catalog(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        """A NULL series count is not "nothing to do".
+
+        The displayed badge came from the catalog, so that is where the
+        sync has to land.
+        """
+        conn = review_tracking.init_db('seen-fallback')
+        review_tracking.add_series_to_db(
+            conn,
+            change_id='cid',
+            revision=3,
+            subject='[PATCH v3] thing',
+            sender_name='S',
+            sender_email='s@e.com',
+            sent_at='2026-01-01T00:00:00+00:00',
+            message_id='v3@x',
+            num_patches=1,
+        )
+        review_tracking.add_revision(conn, 'cid', 3, 'v3@x')
+        conn.execute(
+            'UPDATE revisions SET message_count = 8, seen_message_count = 8'
+            " WHERE change_id = 'cid' AND revision = 3"
+        )
+        conn.commit()
+        conn.close()
+        assert review_tracking.sync_seen_from_unseen_count('seen-fallback', 'cid', 3, 3)
+        conn = review_tracking.get_db('seen-fallback')
+        row = conn.execute(
+            'SELECT seen_message_count FROM revisions'
+            " WHERE change_id = 'cid' AND revision = 3"
+        ).fetchone()
+        conn.close()
+        assert row[0] == 5
+
+
+class TestRethreadFlagStitching:
+    """`series.is_rethreaded` is never NULL, so it cannot be COALESCEd over."""
+
+    @staticmethod
+    def _seed(identifier: str) -> None:
+        conn = review_tracking.init_db(identifier)
+        review_tracking.add_series_to_db(
+            conn,
+            change_id='cid',
+            revision=2,
+            subject='[PATCH v2] thing',
+            sender_name='S',
+            sender_email='s@e.com',
+            sent_at='2026-01-01T00:00:00+00:00',
+            message_id='v2@x',
+            num_patches=2,
+        )
+        review_tracking.add_revision(conn, 'cid', 2, 'v2@x', is_rethreaded=True)
+        _insert_patches(conn, 'cid', 2, ['p1@x', 'p2@x'])
+        conn.commit()
+        conn.close()
+
+    def test_catalog_rethread_survives_a_zeroed_series_row(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        """The column is INTEGER DEFAULT 0, so a COALESCE always picks it.
+
+        A series row that lost the flag (the upgrade path used to write the
+        default) would then permanently mask the catalog's 1.
+        """
+        self._seed('rt-stitch')
+        conn = review_tracking.get_db('rt-stitch')
+        row = conn.execute(
+            "SELECT is_rethreaded FROM series WHERE change_id = 'cid'"
+        ).fetchone()
+        conn.close()
+        # Precondition: the series row really does hold a non-NULL 0.
+        assert row[0] == 0
+
+        conn = review_tracking.get_db('rt-stitch')
+        revs = {r['revision']: r for r in review_tracking.get_revisions(conn, 'cid')}
+        conn.close()
+        assert revs[2]['is_rethreaded']
+
+    def test_known_revisions_keeps_the_patch_list(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        """build_known_revisions() gates the portable patch list on the flag.
+
+        update_series_tracking() rewrites `known-revisions` on every sweep,
+        so a dropped flag actively erases a rethreaded revision from the
+        branch -- and it cannot be re-derived from lore.
+        """
+        self._seed('rt-known')
+        conn = review_tracking.get_db('rt-known')
+        known = review_tracking.build_known_revisions(conn, 'cid')
+        conn.close()
+        entry = next(e for e in known if e['revision'] == 2)
+        assert entry.get('is-rethreaded') is True
+        assert [p['message-id'] for p in entry['patches']] == ['p1@x', 'p2@x']
+
+
+class TestShrinkIsRecorded:
+    def test_a_stale_high_watermark_does_not_eat_the_badge(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """10/10 stored, real thread 8 -> two replies -> the badge shows.
+
+        Threads do shrink (dedup variation, mail removed from the
+        archive), and a writer that refuses any total at or below the
+        stored one turns 10 into a watermark: the corrected 8 and the
+        subsequent genuine 10 are both refused, the badge never lights,
+        and the one repair path runs only when the maintainer opens the
+        thread the missing badge was meant to point at.
+        """
+        conn = review_tracking.init_db('shrink-badge')
+        review_tracking.add_revision(conn, 'cid', 1, 'v1@x')
+        conn.execute(
+            'UPDATE revisions SET message_count = 10, seen_message_count = 10,'
+            " last_update_check = '2026-01-01T00:00:00+00:00'"
+            " WHERE change_id = 'cid' AND revision = 1"
+        )
+        conn.commit()
+        conn.close()
+
+        size = [8]
+        monkeypatch.setattr(b4, 'can_network', True)
+        monkeypatch.setattr(
+            review_tracking,
+            '_fetch_revision_thread_msgs',
+            lambda identifier, conn, change_id, rev: _thread_msgs(size[0]),
+        )
+        review_tracking.update_revision_message_counts(
+            'shrink-badge', [_poller_series('cid', 2, 'v2@x')]
+        )
+        conn = review_tracking.get_db('shrink-badge')
+        row = conn.execute(
+            'SELECT message_count, seen_message_count FROM revisions'
+            " WHERE change_id = 'cid' AND revision = 1"
+        ).fetchone()
+        # The shrink is recorded and seen capped with it: nothing unread.
+        assert (row[0], row[1]) == (8, 8)
+        # Age the check stamp out of the minimum-interval gate.
+        conn.execute(
+            "UPDATE revisions SET last_update_check = '2026-01-01T00:00:00+00:00'"
+        )
+        conn.commit()
+        conn.close()
+
+        size[0] = 10
+        review_tracking.update_revision_message_counts(
+            'shrink-badge', [_poller_series('cid', 2, 'v2@x')]
+        )
+        conn = review_tracking.get_db('shrink-badge')
+        row = conn.execute(
+            'SELECT message_count, seen_message_count FROM revisions'
+            " WHERE change_id = 'cid' AND revision = 1"
+        ).fetchone()
+        conn.close()
+        # The two genuine replies badge instead of vanishing under the
+        # old high watermark.
+        assert (row[0], row[1]) == (10, 8)
+
+    def test_a_genuine_growth_is_still_taken(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """Growth stores the count and leaves seen for the badge."""
+        conn = review_tracking.init_db('short-grow')
+        review_tracking.add_revision(conn, 'cid', 1, 'v1@x')
+        conn.execute(
+            'UPDATE revisions SET message_count = 4, seen_message_count = 4'
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
+        review_tracking.update_revision_message_counts(
+            'short-grow', [_poller_series('cid', 2, 'v2@x')]
+        )
+        conn = review_tracking.get_db('short-grow')
+        row = conn.execute(
+            'SELECT message_count, seen_message_count FROM revisions'
+            " WHERE change_id = 'cid' AND revision = 1"
+        ).fetchone()
+        conn.close()
+        assert (row[0], row[1]) == (6, 4)
+
+
+class TestTrackedRevisionActivityKeepsMoving:
+    def test_the_catalog_date_follows_the_tracked_thread(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        """Per-revision reads prefer the catalog, and the poller skips the
+        tracked revision -- so without a mirror a version's date freezes at
+        whatever poll it last got as an older version."""
+        conn = review_tracking.init_db('act-mirror')
+        review_tracking.add_series_to_db(
+            conn,
+            change_id='cid',
+            revision=3,
+            subject='[PATCH v3] thing',
+            sender_name='S',
+            sender_email='s@e.com',
+            sent_at='2026-01-01T00:00:00+00:00',
+            message_id='v3@x',
+            num_patches=1,
+        )
+        review_tracking.add_revision(conn, 'cid', 3, 'v3@x')
+        conn.execute(
+            'UPDATE revisions SET message_count = 2, seen_message_count = 2,'
+            " last_mail_at = '2026-02-01T00:00:00+00:00'"
+            " WHERE change_id = 'cid' AND revision = 3"
+        )
+        conn.commit()
+        conn.close()
+        # get_db(), not the init_db() handle: update_message_count_from_msgs
+        # indexes rows by name and only get_db() sets the Row factory.
+        conn = review_tracking.get_db('act-mirror')
+        review_tracking.update_message_count_from_msgs(conn, 'cid', 3, _thread_msgs(4))
+        revs = {r['revision']: r for r in review_tracking.get_revisions(conn, 'cid')}
+        conn.close()
+        # _thread_msgs dates run 01..04 Jul 2026, so the newest wins.
+        assert revs[3]['last_mail_at'].startswith('2026-07-04')
+
+    def test_a_maintainer_action_does_not_reach_the_catalog(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        """Only a real Date: header moves the column."""
+        conn = review_tracking.init_db('act-nomaint')
+        review_tracking.add_series_to_db(
+            conn,
+            change_id='cid',
+            revision=3,
+            subject='[PATCH v3] thing',
+            sender_name='S',
+            sender_email='s@e.com',
+            sent_at='2026-01-01T00:00:00+00:00',
+            message_id='v3@x',
+            num_patches=1,
+        )
+        review_tracking.add_revision(conn, 'cid', 3, 'v3@x')
+        conn.execute(
+            'UPDATE revisions SET message_count = 2, seen_message_count = 2,'
+            " last_mail_at = '2026-02-01T00:00:00+00:00'"
+            " WHERE change_id = 'cid' AND revision = 3"
+        )
+        conn.commit()
+        review_tracking.update_series_status(conn, 'cid', 'waiting', revision=3)
+        row = conn.execute(
+            'SELECT last_mail_at FROM revisions'
+            " WHERE change_id = 'cid' AND revision = 3"
+        ).fetchone()
+        conn.close()
+        assert row[0] == '2026-02-01T00:00:00+00:00'
+
+
+class TestPrunedThreadBlobIsReCached:
+    def test_a_gc_d_blob_is_replaced_on_a_quiet_poll(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """Thread blobs are unreferenced objects; git gc may take one.
+
+        A settled old version's count never moves again, so the quiet path
+        is its only chance -- and it used to treat the dead SHA still in the
+        row as proof the thread was cached.
+        """
+        conn = review_tracking.init_db('blob-gc')
+        review_tracking.add_revision(conn, 'cid', 1, 'v1@x')
+        conn.execute(
+            'UPDATE revisions SET message_count = 2, seen_message_count = 2,'
+            " thread_blob = 'deadbeef' WHERE change_id = 'cid' AND revision = 1"
+        )
+        conn.commit()
+        conn.close()
+        stored: list[int] = []
+        monkeypatch.setattr(b4, 'can_network', True)
+        monkeypatch.setattr(
+            review_tracking,
+            '_fetch_revision_thread_msgs',
+            lambda identifier, conn, change_id, rev: _thread_msgs(2),
+        )
+        monkeypatch.setattr(
+            review_tracking, '_thread_blob_exists', lambda topdir, sha: False
+        )
+        monkeypatch.setattr(
+            review_tracking,
+            'store_revision_thread_blob',
+            lambda conn, topdir, change_id, revision, msgs: stored.append(len(msgs)),
+        )
+        review_tracking.update_revision_message_counts(
+            'blob-gc', [_poller_series('cid', 2, 'v2@x')], topdir='/nonexistent'
+        )
+        assert stored == [2]
+
+    def test_a_blob_holding_at_least_as_much_is_left_alone(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        conn = review_tracking.init_db('blob-live')
+        review_tracking.add_revision(conn, 'cid', 1, 'v1@x')
+        conn.execute(
+            'UPDATE revisions SET message_count = 2, seen_message_count = 2,'
+            " thread_blob = 'deadbeef' WHERE change_id = 'cid' AND revision = 1"
+        )
+        conn.commit()
+        conn.close()
+        stored: list[int] = []
+        monkeypatch.setattr(b4, 'can_network', True)
+        monkeypatch.setattr(
+            review_tracking,
+            '_fetch_revision_thread_msgs',
+            lambda identifier, conn, change_id, rev: _thread_msgs(2),
+        )
+        monkeypatch.setattr(
+            review_tracking, '_thread_blob_exists', lambda topdir, sha: True
+        )
+        monkeypatch.setattr(
+            review_tracking,
+            'store_revision_thread_blob',
+            lambda conn, topdir, change_id, revision, msgs: stored.append(len(msgs)),
+        )
+        review_tracking.update_revision_message_counts(
+            'blob-live', [_poller_series('cid', 2, 'v2@x')], topdir='/nonexistent'
+        )
+        assert stored == []
+
+    def test_the_quiet_path_does_not_read_the_blob_back(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """Existence, not content: the thread is the one already stored.
+
+        Every cataloged revision comes through here on every sweep, so
+        reading and re-parsing each one's whole mbox to answer "no change"
+        is a cost the rotation pays for nothing.
+        """
+        conn = review_tracking.init_db('blob-quiet-read')
+        review_tracking.add_revision(conn, 'cid', 1, 'v1@x')
+        conn.execute(
+            'UPDATE revisions SET message_count = 2, seen_message_count = 2,'
+            " thread_blob = 'deadbeef' WHERE change_id = 'cid' AND revision = 1"
+        )
+        conn.commit()
+        conn.close()
+        monkeypatch.setattr(b4, 'can_network', True)
+        monkeypatch.setattr(
+            review_tracking,
+            '_fetch_revision_thread_msgs',
+            lambda identifier, conn, change_id, rev: _thread_msgs(2),
+        )
+        monkeypatch.setattr(
+            review_tracking, '_thread_blob_exists', lambda topdir, sha: True
+        )
+        monkeypatch.setattr(
+            review_tracking,
+            'get_thread_mbox',
+            lambda topdir, sha: pytest.fail('quiet poll must not read the blob'),
+        )
+        review_tracking.update_revision_message_counts(
+            'blob-quiet-read', [_poller_series('cid', 2, 'v2@x')], topdir='/nonexistent'
+        )
+
+    def test_a_shrink_still_restores_a_pruned_blob(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """The short-fetch path has the messages in hand; cache them.
+
+        A revision whose thread ends up permanently shorter than the
+        stored watermark otherwise never got its pruned blob back, and
+        every range-diff against it refetched from lore forever.
+        """
+        conn = review_tracking.init_db('blob-shrink-gc')
+        review_tracking.add_revision(conn, 'cid', 1, 'v1@x')
+        conn.execute(
+            'UPDATE revisions SET message_count = 10, seen_message_count = 10,'
+            " thread_blob = 'deadbeef' WHERE change_id = 'cid' AND revision = 1"
+        )
+        conn.commit()
+        conn.close()
+        monkeypatch.setattr(b4, 'can_network', True)
+        monkeypatch.setattr(
+            review_tracking,
+            '_fetch_revision_thread_msgs',
+            lambda identifier, conn, change_id, rev: _thread_msgs(8),
+        )
+        stored: list[int] = []
+        monkeypatch.setattr(
+            review_tracking,
+            'store_revision_thread_blob',
+            lambda conn, topdir, change_id, revision, msgs: stored.append(len(msgs)),
+        )
+        review_tracking.update_revision_message_counts(
+            'blob-shrink-gc', [_poller_series('cid', 2, 'v2@x')], topdir='/nonexistent'
+        )
+        assert stored == [8]
+
+
+class TestSeenWritersStayConsistent:
+    @staticmethod
+    def _seed(identifier: str, series_count: Optional[int], cat_count: int) -> None:
+        conn = review_tracking.init_db(identifier)
+        review_tracking.add_series_to_db(
+            conn,
+            change_id='cid',
+            revision=2,
+            subject='[PATCH v2] thing',
+            sender_name='S',
+            sender_email='s@e.com',
+            sent_at='2026-01-01T00:00:00+00:00',
+            message_id='v2@x',
+            num_patches=1,
+        )
+        review_tracking.add_revision(conn, 'cid', 2, 'v2@x')
+        if series_count is not None:
+            conn.execute(
+                'UPDATE revisions SET message_count = ?, seen_message_count = ?'
+                " WHERE change_id = 'cid' AND revision = 2",
+                (series_count, series_count - 3),
+            )
+        conn.execute(
+            'UPDATE revisions SET message_count = ?, seen_message_count = ?'
+            " WHERE change_id = 'cid' AND revision = 2",
+            (cat_count, cat_count),
+        )
+        conn.commit()
+        conn.close()
+
+    def test_sync_writes_the_single_copy(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        """There is no second copy to go stale behind this one."""
+        self._seed('seen-mirror', series_count=10, cat_count=10)
+        assert review_tracking.sync_seen_from_unseen_count('seen-mirror', 'cid', 2, 2)
+        conn = review_tracking.get_db('seen-mirror')
+        row = conn.execute(
+            'SELECT message_count, seen_message_count FROM revisions'
+            " WHERE change_id = 'cid' AND revision = 2"
+        ).fetchone()
+        conn.close()
+        assert (row[0], row[1]) == (10, 8)
+
+    def test_mark_seen_skips_a_row_with_no_count(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        """A seen count against a NULL total is a badge with no basis.
+
+        There is no longer a second row for it to shadow, but recording it
+        would still leave seen > total the moment a count did arrive.
+        """
+        conn = review_tracking.init_db('seen-nullcount')
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
+        conn.commit()
+        review_tracking.mark_all_messages_seen(conn, 'cid', 2)
+        row = conn.execute(
+            'SELECT message_count, seen_message_count FROM revisions'
+            " WHERE change_id = 'cid' AND revision = 2"
+        ).fetchone()
+        conn.close()
+        assert row[0] is None
+        assert row[1] is None
+
+
+class TestMigrationDeclinesWhatItCannotCarry:
+    """A series table too degenerate to backfill from keeps its columns.
+
+    The read-state move drops the `series` copies only inside the backfill
+    guard: dropping a copy that was never carried across would just lose
+    it.  The branch_sha move sits outside that guard because it needs
+    nothing from `series` but the two columns every version of it has had.
+    """
+
+    @staticmethod
+    def _degenerate_v1_db(identifier: str) -> None:
+        import sqlite3 as _sqlite3
+
+        raw = _sqlite3.connect(review_tracking.get_db_path(identifier))
+        raw.executescript("""
+            CREATE TABLE schema_version (version INTEGER PRIMARY KEY);
+            CREATE TABLE series (
+                track_id INTEGER PRIMARY KEY,
+                change_id TEXT NOT NULL,
+                revision INTEGER NOT NULL,
+                status TEXT DEFAULT 'new',
+                UNIQUE (change_id, revision)
+            );
+        """)
+        raw.execute('INSERT INTO schema_version (version) VALUES (1)')
+        raw.commit()
+        raw.close()
+
+    def test_read_state_survives_a_backfill_it_cannot_run(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        self._degenerate_v1_db('mig-degenerate')
+        conn = review_tracking.get_db('mig-degenerate')
+        series_cols = {row[1] for row in conn.execute('PRAGMA table_info(series)')}
+        rev_cols = {row[1] for row in conn.execute('PRAGMA table_info(revisions)')}
+        version = conn.execute('SELECT version FROM schema_version').fetchone()[0]
+        conn.close()
+        read_state = {'message_count', 'seen_message_count', 'last_update_check'}
+        # The catalog gains them either way ...
+        assert read_state <= rev_cols
+        # ... and `series` keeps its own, because there was nothing to copy:
+        # this table never had the identity columns the backfill selects.
+        assert read_state <= series_cols
+        assert version == review_tracking.SCHEMA_VERSION
+
+    def test_branch_sha_moves_even_so(self, tmp_path: pytest.TempPathFactory) -> None:
+        self._degenerate_v1_db('mig-degenerate-sha')
+        conn = review_tracking.get_db('mig-degenerate-sha')
+        series_cols = {row[1] for row in conn.execute('PRAGMA table_info(series)')}
+        chg_cols = {row[1] for row in conn.execute('PRAGMA table_info(changes)')}
+        conn.close()
+        assert 'branch_sha' not in series_cols
+        assert 'branch_sha' in chg_cols

-- 
2.53.0

