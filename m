Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAAB360EE8
	for <tools@linux.kernel.org>; Fri, 17 Jul 2026 22:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784327906; cv=none; b=okSnZUUhl5Rc3+oNmtVfUovcGAVZ6JvvKFyaXM00NiLDBJNqXt/SeBAmrb5mM2s+mbrH9EvH3x6mlabv3TDN1FhB1rCkWsan1Az7y9KaxQpc1soPmlszbWPo5VuNvzklvj48GciEl+9ZA+6qLzM/7Mm66NESQ28swES2T7Z/zJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784327906; c=relaxed/simple;
	bh=UGmnjaRTYs0CFuRRy2pjeAdkvSbOWFBk3vZKMxCJZ48=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VAQx7t0z4rcTtAIw6O/YMlYzxx3MmSe1p+DBf57qtSUVWHyHps9ohezUGkCUV/tChSd8At2VroimKr6Sl47hPDkS7mVMMewxuFMdnlcx3vToq+Q/C9iJzqxxErUGwECOErv+8tb9RPByPv/obycxz3PZkk9piYnXuY/2WiXLBoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YeP3ctG3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YeP3ctG3"
Received: by smtp.kernel.org (Postfix)
	id 5ADD21F00A3D; Fri, 17 Jul 2026 22:38:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E97E1F000E9;
	Fri, 17 Jul 2026 22:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784327904;
	bh=IHyj17qCpdLp+/zPXbhJ6koCXNxUuzLp20yLjxx0KZk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=YeP3ctG3ucg9sm+0UHcqzC41cajusIBCFcrhdkik/139EYzdnZeW5fp3PXEMuPIzE
	 BLC0zv+EHwwA552nB/oDM3uCCBMY2tZHQjM45jnHGZO2WQjKrN6mEHbr51FNec9EDz
	 pI4rzmMRyBG/kuTs0YxbIuhzSt1WzOAInBlm7qeSCwAYKckQsjbZBuI3mg1LVmQ41R
	 EJSnY5U+ij538nINEyg4vUmJODgMIV55wz+UMrDxv0gBLx8LV7Fp9l7KCIYx2jeta2
	 9UGluaKQ9EH9A+Xg2nil7fECWwTrS2UZdm5DPZr1scc2h42ytZu4Slj9S9nAxF4HYU
	 lEhOR1rVo04Dg==
From: Christian Brauner <brauner@kernel.org>
Date: Sat, 18 Jul 2026 00:37:39 +0200
Subject: [PATCH RFC 03/11] review: test per-revision message tracking
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-work-b4-multiver-rows-v1-3-3c539d2a3095@kernel.org>
References: <20260718-work-b4-multiver-rows-v1-0-3c539d2a3095@kernel.org>
In-Reply-To: <20260718-work-b4-multiver-rows-v1-0-3c539d2a3095@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-4217c
X-Developer-Signature: v=1; a=openpgp-sha256; l=30350; i=brauner@kernel.org;
 h=from:subject:message-id; bh=UGmnjaRTYs0CFuRRy2pjeAdkvSbOWFBk3vZKMxCJZ48=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWRFrbtpWddc9aj3xSvxCWXakeWTGRefnf351rs7/IcSc
 rftfNjxq6OEhUGMi0FWTJHFod0kXG45T8Vmo0wNmDmsTCBDGLg4BWAiKlcYGaaV6gVMOfpiyZqF
 uzWbW2ruyexIuJvsdF968gGlxP9eP2sYfvw51ZnumrvPeedTZs9+A7vF/kt2vpG6/2MuS9s3xi2
 z+AA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Cover the v11 migration (column adds, catalog backfill from live and
archived series rows, idempotence), the stitched count reads (live
wins, archived never shadows, NULL falls back), the per-revision
poller (first fetch, quiet incremental with zero writes, new-mail
bump, error paths, skip statuses, tracked-row guarantee, newest-first
cap, rethreaded first fetch and per-patch incremental, blob caching),
and the revision-aware fallbacks in refresh_message_count() and
sync_seen_from_unseen_count().

Assisted-by: LLM
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/tests/test_review_tracking.py | 705 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 705 insertions(+)

diff --git a/src/tests/test_review_tracking.py b/src/tests/test_review_tracking.py
index bcf8745..5002aaa 100644
--- a/src/tests/test_review_tracking.py
+++ b/src/tests/test_review_tracking.py
@@ -4190,3 +4190,708 @@ class TestSyncRevisionsCatalogToBranch:
             )
             is False
         )
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
+            'last_activity_at',
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
+    def test_live_series_counts_win(self, tmp_path: pytest.TempPathFactory) -> None:
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
+            'UPDATE series SET message_count = 10, seen_message_count = 7'
+            " WHERE change_id = 'cid'"
+        )
+        review_tracking.add_revision(conn, 'cid', 2, 'v2@x')
+        conn.execute(
+            'UPDATE revisions SET message_count = 3, seen_message_count = 3'
+            " WHERE change_id = 'cid' AND revision = 2"
+        )
+        conn.commit()
+        revs = review_tracking.get_revisions(conn, 'cid')
+        conn.close()
+        assert revs[0]['message_count'] == 10
+        assert revs[0]['seen_message_count'] == 7
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
+            'UPDATE series SET message_count = 4, seen_message_count = 0,'
+            " status = 'archived' WHERE change_id = 'cid'"
+        )
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
+    def test_summarize_revision_unseen(self) -> None:
+        revs = [
+            {'revision': 1, 'message_count': 5, 'seen_message_count': 3},
+            {'revision': 2, 'message_count': None, 'seen_message_count': None},
+            {'revision': 3, 'message_count': 9, 'seen_message_count': 0},
+        ]
+        assert review_tracking.summarize_revision_unseen(revs, 3) == 2
+        assert review_tracking.summarize_revision_unseen(revs) == 11
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
+class TestUpdateRevisionMessageCounts:
+    """The per-revision poller for non-tracked versions."""
+
+    def test_first_fetch_initializes_counts(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        conn = review_tracking.init_db('poll-first')
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
+        assert result == {'updated': 1, 'errors': 0}
+        conn = review_tracking.get_db('poll-first')
+        revs = {r['revision']: r for r in review_tracking.get_revisions(conn, 'cid')}
+        conn.close()
+        assert revs[1]['message_count'] == 3
+        assert revs[1]['seen_message_count'] == 3
+        assert revs[1]['last_update_check'] is not None
+        assert revs[1]['last_activity_at'] is not None
+        # The tracked revision's row was backfilled but not polled.
+        assert revs[2]['message_count'] is None
+
+    def test_quiet_incremental_makes_zero_writes(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        conn = review_tracking.init_db('poll-quiet')
+        review_tracking.add_revision(conn, 'cid', 1, 'v1@x')
+        review_tracking.add_revision(conn, 'cid', 2, 'v2@x')
+        conn.execute(
+            'UPDATE revisions SET message_count = 5, seen_message_count = 5,'
+            " last_update_check = '2026-07-01T00:00:00+00:00'"
+            " WHERE change_id = 'cid' AND revision = 1"
+        )
+        conn.commit()
+        conn.close()
+        db_path = review_tracking.get_db_path('poll-quiet')
+        before_mtime = os.stat(db_path).st_mtime_ns
+        monkeypatch.setattr(
+            review_tracking, '_fetch_new_since', lambda msgid, since: (0, None)
+        )
+        result = review_tracking.update_revision_message_counts(
+            'poll-quiet', [_poller_series('cid', 2, 'v2@x')]
+        )
+        assert result == {'updated': 0, 'errors': 0}
+        assert os.stat(db_path).st_mtime_ns == before_mtime
+
+    def test_incremental_new_mail_bumps_count(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        conn = review_tracking.init_db('poll-new')
+        review_tracking.add_revision(conn, 'cid', 1, 'v1@x')
+        review_tracking.add_revision(conn, 'cid', 2, 'v2@x')
+        conn.execute(
+            'UPDATE revisions SET message_count = 5, seen_message_count = 5,'
+            " last_update_check = '2026-07-01T00:00:00+00:00',"
+            " last_activity_at = '2026-06-30T00:00:00+00:00'"
+            " WHERE change_id = 'cid' AND revision = 1"
+        )
+        conn.commit()
+        conn.close()
+        monkeypatch.setattr(
+            review_tracking,
+            '_fetch_new_since',
+            lambda msgid, since: (2, '2026-07-10T00:00:00+00:00'),
+        )
+        result = review_tracking.update_revision_message_counts(
+            'poll-new', [_poller_series('cid', 2, 'v2@x')]
+        )
+        assert result == {'updated': 1, 'errors': 0}
+        conn = review_tracking.get_db('poll-new')
+        revs = {r['revision']: r for r in review_tracking.get_revisions(conn, 'cid')}
+        conn.close()
+        assert revs[1]['message_count'] == 7
+        assert revs[1]['seen_message_count'] == 5
+        assert revs[1]['last_activity_at'] == '2026-07-10T00:00:00+00:00'
+        assert revs[1]['last_update_check'] > '2026-07-01T00:00:00+00:00'
+
+    def test_incremental_fetch_error_counts_error(
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
+        monkeypatch.setattr(
+            review_tracking, '_fetch_new_since', lambda msgid, since: None
+        )
+        result = review_tracking.update_revision_message_counts(
+            'poll-err', [_poller_series('cid', 2, 'v2@x')]
+        )
+        assert result == {'updated': 0, 'errors': 1}
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
+        for status in ('archived', 'accepted', 'thanked', 'snoozed'):
+            result = review_tracking.update_revision_message_counts(
+                'poll-skip', [_poller_series('cid', 2, 'v2@x', status=status)]
+            )
+            assert result == {'updated': 0, 'errors': 0}
+        assert calls == []
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
+        assert result == {'updated': 0, 'errors': 0}
+        assert calls == []
+
+    def test_tracked_row_backfilled_when_missing(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        review_tracking.init_db('poll-backfill').close()
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
+        assert result == {'updated': 1, 'errors': 0}
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
+        monkeypatch.setattr(b4.review, 'retrieve_series_messages', _fake_retrieve)
+        result = review_tracking.update_revision_message_counts(
+            'poll-rt-first', [_poller_series('cid', 2, 'v2@x')]
+        )
+        assert result == {'updated': 1, 'errors': 0}
+        assert seen_dicts and seen_dicts[0]['is_rethreaded'] is True
+        assert seen_dicts[0]['revision'] == 1
+        conn = review_tracking.get_db('poll-rt-first')
+        revs = {r['revision']: r for r in review_tracking.get_revisions(conn, 'cid')}
+        conn.close()
+        assert revs[1]['message_count'] == 4
+
+    def test_rethreaded_incremental_sums_patch_threads(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
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
+        queried: list[str] = []
+
+        def _fake_new_since(msgid: str, since: str) -> tuple[int, str]:
+            queried.append(msgid)
+            return (1, '2026-07-10T00:00:00+00:00')
+
+        monkeypatch.setattr(review_tracking, '_fetch_new_since', _fake_new_since)
+        result = review_tracking.update_revision_message_counts(
+            'poll-rt-incr', [_poller_series('cid', 2, 'v2@x')]
+        )
+        assert result == {'updated': 1, 'errors': 0}
+        assert queried == ['p1@x', 'p2@x']
+        conn = review_tracking.get_db('poll-rt-incr')
+        revs = review_tracking.get_revisions(conn, 'cid')
+        conn.close()
+        assert revs[0]['message_count'] == 8
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
+            'UPDATE series SET message_count = 8, seen_message_count = 8'
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
+    def test_sync_seen_prefers_live_series_row(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        self._seed('sync-live')
+        assert review_tracking.sync_seen_from_unseen_count('sync-live', 'cid', 2, 2)
+        conn = review_tracking.get_db('sync-live')
+        series_seen = conn.execute(
+            "SELECT seen_message_count FROM series WHERE change_id = 'cid'"
+        ).fetchone()[0]
+        rev_seen = conn.execute(
+            'SELECT seen_message_count FROM revisions'
+            " WHERE change_id = 'cid' AND revision = 2"
+        ).fetchone()[0]
+        conn.close()
+        assert series_seen == 6
+        assert rev_seen == 3
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
+    def test_sync_seen_ignores_archived_series(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        self._seed('sync-arch')
+        conn = review_tracking.get_db('sync-arch')
+        conn.execute(
+            'INSERT INTO series (change_id, revision, message_id, status,'
+            ' message_count, seen_message_count)'
+            " VALUES ('cid', 1, 'v1@x', 'archived', 4, 4)"
+        )
+        conn.commit()
+        conn.close()
+        assert review_tracking.sync_seen_from_unseen_count('sync-arch', 'cid', 1, 1)
+        conn = review_tracking.get_db('sync-arch')
+        archived_seen = conn.execute(
+            "SELECT seen_message_count FROM series WHERE change_id = 'cid'"
+            ' AND revision = 1'
+        ).fetchone()[0]
+        rev_seen = conn.execute(
+            'SELECT seen_message_count FROM revisions'
+            " WHERE change_id = 'cid' AND revision = 1"
+        ).fetchone()[0]
+        conn.close()
+        assert archived_seen == 4
+        assert rev_seen == 5
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
+    def test_refresh_count_unchanged_series_skips_catalog(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        self._seed('refresh-skip')
+        assert not review_tracking.refresh_message_count('refresh-skip', 'cid', 2, 8)
+        conn = review_tracking.get_db('refresh-skip')
+        rev_count = conn.execute(
+            'SELECT message_count FROM revisions'
+            " WHERE change_id = 'cid' AND revision = 2"
+        ).fetchone()[0]
+        conn.close()
+        assert rev_count == 3
+
+    def test_mark_all_revision_messages_seen(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        self._seed('mark-rev')
+        conn = review_tracking.get_db('mark-rev')
+        conn.execute(
+            'UPDATE revisions SET seen_message_count = 1'
+            " WHERE change_id = 'cid' AND revision = 1"
+        )
+        conn.commit()
+        review_tracking.mark_all_revision_messages_seen(conn, 'cid', 1)
+        rev_seen = conn.execute(
+            'SELECT seen_message_count FROM revisions'
+            " WHERE change_id = 'cid' AND revision = 1"
+        ).fetchone()[0]
+        conn.close()
+        assert rev_seen == 6

-- 
2.53.0

