Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646BE47010D
	for <tools@linux.kernel.org>; Tue, 21 Jul 2026 20:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784665275; cv=none; b=OGNdzu5B0/zOscYQyEchoT/+84kKpCZK0IwiJFKmZ7UyyfS356ncnqCjAz3NRmoX0QeTylGI2PkfylxPbuLq9DocKhbxoYPhk3QxGQyGFMIrn3G3MNHwidzFtg1Rgo9etoGuAN9d8xDa6oFF+NDjDZdn3zv/WNfjaNhlJdJpk+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784665275; c=relaxed/simple;
	bh=34bMbBbDn1C+4EFajfFQ8MicbqnZ1SRcOj+S8nBRXKI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VV203jSSCitXNDdz9qmdXyCPzDR/mu87G1bpNmTqJACPqrZ5FJDzdHKzb/x2WY4/T4+t/uil4YnOPMXm5EkObrXngYW1scHA8Q37HtfOOvy3sF5l0pWRuyW+amRc+1w9t2TZLT+JB/X2b1ea5d0xLmgUhQFEiQu8Dmc8emz5Y5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Teq4wyhb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Teq4wyhb"
Received: by smtp.kernel.org (Postfix)
	id 630AE1F00A3D; Tue, 21 Jul 2026 20:21:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 612201F000E9;
	Tue, 21 Jul 2026 20:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784665274;
	bh=zAF3BtLHA9wvQw0HWa5kJtwyMpn2SY7TiygDAoxZBxk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Teq4wyhb7rMN1WviJPEZQKIvRbRi0gDUOnoXYvZhcikm7trdywgN3Lju63ftnKjVa
	 DkmWyAtFevGUouxhXH+hfQWu7/rTTY8BsKRARFGWkZm2Iu68HK8I+REQrVcxfp3w78
	 /+0I1QpN4djLZCUCxX8DfDvNa6SX3e1ZzfNneLn7bDlcNF+mNTMt8cGGId1C5OLdpO
	 8I+oALVYKv7Vre/fwL5YTLMtORYfLiCgj/7k1noz6P7GuvhnGEMyGbnSyVT1mGB17S
	 LeaXX89l+qw9yo6fEx2iZhj1FgqBFI1eqjyMiKX5Z8N/T3WyzsRqZd2ZCyv8K7jbxd
	 0bmq5u/5Ydoww==
From: Christian Brauner <brauner@kernel.org>
Date: Tue, 21 Jul 2026 22:21:03 +0200
Subject: [PATCH b4 3/4] review: drop tests for the batch message-count
 updater
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260721-work-b4-accepted-unread-badge-v1-3-28581acc4988@kernel.org>
References: <20260721-work-b4-accepted-unread-badge-v1-0-28581acc4988@kernel.org>
In-Reply-To: <20260721-work-b4-accepted-unread-badge-v1-0-28581acc4988@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-4217c
X-Developer-Signature: v=1; a=openpgp-sha256; l=14164; i=brauner@kernel.org;
 h=from:subject:message-id; bh=34bMbBbDn1C+4EFajfFQ8MicbqnZ1SRcOj+S8nBRXKI=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTFX9na+9AwO3BSRCS7pJdY265VT1R3bOt9ailo923jr
 dtp/wJ6OkpZGMS4GGTFFFkc2k3C5ZbzVGw2ytSAmcPKBDKEgYtTACayvZKR4dTbg2/eXmUNX/Mo
 etqVxOkyHjejLnX32Xup9pxh1Ju1pYjhn9mX9NhCpbcxt1l/F97b0rGgh6FcWWyV5583IV/LFh5
 nYwUA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

update_message_counts() and its private fetch helpers are about to be
removed. Drop their tests first so the removal commit leaves the suite
green at every step.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/tests/test_review_tracking.py | 336 --------------------------------------
 1 file changed, 336 deletions(-)

diff --git a/src/tests/test_review_tracking.py b/src/tests/test_review_tracking.py
index c3ddd33..2e646ba 100644
--- a/src/tests/test_review_tracking.py
+++ b/src/tests/test_review_tracking.py
@@ -1495,18 +1495,6 @@ class TestRescanBranches:
         conn.close()
 
 
-def _make_test_mbox(n: int, date: str = 'Mon, 15 Jan 2024 10:00:00 +0000') -> bytes:
-    """Build a minimal mbox with *n* unique messages (each has a distinct Message-ID)."""
-    parts = []
-    for i in range(n):
-        parts.append(
-            f'From foo@example.com Mon Jan 01 00:00:00 2024\n'
-            f'Message-ID: <msg{i}@example.com>\n'
-            f'Date: {date}\n\n'.encode()
-        )
-    return b''.join(parts)
-
-
 class TestFollowupCounts:
     """Tests for message_count / seen_message_count tracking."""
 
@@ -1560,161 +1548,6 @@ class TestFollowupCounts:
         assert row[0] == review_tracking.SCHEMA_VERSION
         conn.close()
 
-    @mock.patch('b4.review.tracking._fetch_thread_mbox_bytes')
-    def test_first_fetch_initialises_seen(
-        self, mock_mbox_bytes: mock.Mock, tmp_path: pytest.TempPathFactory
-    ) -> None:
-        """First update_message_counts sets seen = count (no badge shown yet)."""
-        # 9 unique messages in the thread
-        mock_mbox_bytes.return_value = _make_test_mbox(9)
-
-        conn = review_tracking.init_db('fc-first-test')
-        review_tracking.add_series_to_db(
-            conn,
-            'fc-change',
-            1,
-            'Subject',
-            'Author',
-            'a@example.com',
-            '2024-01-15T10:00:00+00:00',
-            'cover@example.com',
-            3,
-        )
-        conn.close()
-
-        series_list = [
-            {
-                'change_id': 'fc-change',
-                'revision': 1,
-                'message_id': 'cover@example.com',
-                'num_patches': 3,
-                'status': 'new',
-            }
-        ]
-        result = review_tracking.update_message_counts('fc-first-test', series_list)
-        assert result['updated'] == 1
-        assert result['errors'] == 0
-
-        conn = review_tracking.get_db('fc-first-test')
-        row = conn.execute(
-            'SELECT message_count, seen_message_count, last_update_check, last_activity_at'
-            ' FROM series WHERE change_id = ?',
-            ('fc-change',),
-        ).fetchone()
-        assert row['message_count'] == 9
-        # First fetch: seen initialised to same value — no badge yet
-        assert row['seen_message_count'] == 9
-        assert row['last_update_check'] is not None
-        assert row['last_activity_at'] == '2024-01-15T10:00:00+00:00'
-        conn.close()
-
-    @mock.patch('b4.review.tracking._fetch_new_since')
-    @mock.patch('b4.review.tracking._fetch_thread_mbox_bytes')
-    def test_incremental_fetch_adds_new_count(
-        self,
-        mock_fetch: mock.Mock,
-        mock_new_since: mock.Mock,
-        tmp_path: pytest.TempPathFactory,
-    ) -> None:
-        """Incremental update adds new message count and keeps seen unchanged."""
-        # 9 unique messages in the thread
-        mock_fetch.return_value = _make_test_mbox(9)
-        # incremental: 3 new messages, with a newer activity date
-        mock_new_since.return_value = (3, '2024-02-01T00:00:00+00:00')
-
-        conn = review_tracking.init_db('fc-incr-test')
-        review_tracking.add_series_to_db(
-            conn,
-            'fc-change2',
-            1,
-            'Subject',
-            'Author',
-            'a@example.com',
-            '2024-01-15T10:00:00+00:00',
-            'cover2@example.com',
-            3,
-        )
-        conn.close()
-
-        series_list = [
-            {
-                'change_id': 'fc-change2',
-                'revision': 1,
-                'message_id': 'cover2@example.com',
-                'num_patches': 3,
-                'status': 'reviewing',
-            }
-        ]
-
-        # First fetch: seen = count = 9, last_update_check set
-        review_tracking.update_message_counts('fc-incr-test', series_list)
-
-        # Incremental: 3 new messages since last check
-        result = review_tracking.update_message_counts('fc-incr-test', series_list)
-        assert result['updated'] == 1
-
-        conn = review_tracking.get_db('fc-incr-test')
-        row = conn.execute(
-            'SELECT message_count, seen_message_count, last_activity_at FROM series'
-            ' WHERE change_id = ?',
-            ('fc-change2',),
-        ).fetchone()
-        assert row['message_count'] == 12  # 9 + 3
-        assert row['seen_message_count'] == 9  # badge shows +3
-        assert row['last_activity_at'] == '2024-02-01T00:00:00+00:00'
-        conn.close()
-
-    @mock.patch('b4.review.tracking._fetch_new_since')
-    @mock.patch('b4.review.tracking._fetch_thread_mbox_bytes')
-    def test_incremental_noop_makes_no_db_write(
-        self,
-        mock_fetch: mock.Mock,
-        mock_new_since: mock.Mock,
-        tmp_path: pytest.TempPathFactory,
-    ) -> None:
-        """Incremental update with zero new messages writes nothing to the DB."""
-        # 9 unique messages in the thread
-        mock_fetch.return_value = _make_test_mbox(9)
-        mock_new_since.return_value = (0, None)  # no new messages
-
-        conn = review_tracking.init_db('fc-noop-test')
-        review_tracking.add_series_to_db(
-            conn,
-            'fc-change3',
-            1,
-            'Subject',
-            'Author',
-            'a@example.com',
-            '2024-01-15T10:00:00+00:00',
-            'cover3@example.com',
-            3,
-        )
-        conn.close()
-
-        series_list = [
-            {
-                'change_id': 'fc-change3',
-                'revision': 1,
-                'message_id': 'cover3@example.com',
-                'num_patches': 3,
-                'status': 'reviewing',
-            }
-        ]
-
-        # First fetch sets the baseline
-        review_tracking.update_message_counts('fc-noop-test', series_list)
-
-        import os
-
-        db_path = review_tracking.get_db_path('fc-noop-test')
-        mtime_before = os.path.getmtime(db_path)
-
-        # Incremental no-op — should not touch the DB at all
-        result = review_tracking.update_message_counts('fc-noop-test', series_list)
-        assert result['updated'] == 0
-        assert result['errors'] == 0
-        assert os.path.getmtime(db_path) == mtime_before
-
     def test_mark_all_messages_seen_clears_badge(
         self, tmp_path: pytest.TempPathFactory
     ) -> None:
@@ -1752,67 +1585,6 @@ class TestFollowupCounts:
         assert row['seen_message_count'] == 10
         conn.close()
 
-    def test_followup_fetch_skips_offline(
-        self, tmp_path: pytest.TempPathFactory
-    ) -> None:
-        """fetch_thread_message_count and _fetch_thread_mbox_bytes return None offline."""
-        # can_network is False in test fixture — no mock needed
-        assert review_tracking._fetch_thread_mbox_bytes('any@example.com') is None
-        assert review_tracking.fetch_thread_message_count('any@example.com') is None
-
-    def test_update_message_counts_skips_terminal_statuses(
-        self, tmp_path: pytest.TempPathFactory
-    ) -> None:
-        """update_message_counts skips archived/accepted/thanked series."""
-        conn = review_tracking.init_db('fc-skip-test')
-        for status in ('archived', 'accepted', 'thanked'):
-            cid = f'fc-{status}'
-            review_tracking.add_series_to_db(
-                conn,
-                cid,
-                1,
-                'Subject',
-                'Author',
-                'a@example.com',
-                '2024-01-15T10:00:00+00:00',
-                f'{cid}@example.com',
-                3,
-            )
-            review_tracking.update_series_status(conn, cid, status)
-        conn.close()
-
-        series_list = [
-            {
-                'change_id': f'fc-{s}',
-                'revision': 1,
-                'message_id': f'fc-{s}@example.com',
-                'num_patches': 3,
-                'status': s,
-            }
-            for s in ('archived', 'accepted', 'thanked')
-        ]
-        result = review_tracking.update_message_counts('fc-skip-test', series_list)
-        # None fetched — all skipped, no errors
-        assert result['updated'] == 0
-        assert result['errors'] == 0
-
-
-def _make_mbox_bytes(num_msgs: int, prefix: str = 'msg') -> bytes:
-    """Return valid mboxrd bytes containing *num_msgs* messages with unique IDs."""
-    result = b''
-    for i in range(num_msgs):
-        result += (
-            f'From sender@example.com Mon Jan 15 10:00:00 2024\n'
-            f'Message-ID: <{prefix}-{i}@example.com>\n'
-            f'From: Test Author <author@example.com>\n'
-            f'Date: Mon, 15 Jan 2024 10:00:00 +0000\n'
-            f'Subject: Test message {i}\n'
-            f'\n'
-            f'Body of message {i}\n'
-            f'\n'
-        ).encode()
-    return result
-
 
 def _make_test_msg(msgid: str = 'test@example.com') -> EmailMessage:
     """Return a minimal EmailMessage suitable for passing to _store_thread_blob."""
@@ -1924,114 +1696,6 @@ class TestFollowupBlob:
         result = review_tracking.get_thread_mbox(gitdir, 'deadbeef' * 5)
         assert result is None
 
-    @mock.patch('b4.review.tracking._fetch_thread_mbox_bytes')
-    def test_update_message_counts_stores_blob_on_first_fetch(
-        self, mock_mbox: mock.Mock, gitdir: str
-    ) -> None:
-        """update_message_counts writes a thread blob on the first fetch."""
-        mock_mbox.return_value = _make_mbox_bytes(9, prefix='ff')
-
-        change_id = 'blob-first-fetch'
-        _create_review_branch(
-            gitdir, change_id, _make_blob_tracking_data(change_id, 'blob-ff-proj')
-        )
-
-        conn = review_tracking.init_db('blob-ff-proj')
-        review_tracking.add_series_to_db(
-            conn,
-            change_id,
-            1,
-            'Subject',
-            'Author',
-            'a@example.com',
-            '2024-01-15T10:00:00+00:00',
-            'blob-first@example.com',
-            3,
-        )
-        conn.close()
-
-        series_list = [
-            {
-                'change_id': change_id,
-                'revision': 1,
-                'message_id': 'blob-first@example.com',
-                'num_patches': 3,
-                'status': 'reviewing',
-            }
-        ]
-        review_tracking.update_message_counts(
-            'blob-ff-proj', series_list, topdir=gitdir
-        )
-
-        _cover, loaded = b4.review.load_tracking(gitdir, f'b4/review/{change_id}')
-        blob_sha = loaded['series'].get('thread-blob')
-        assert blob_sha is not None
-        # Blob must be readable
-        ecode, _ = b4.git_run_command(
-            gitdir, ['cat-file', 'blob', blob_sha], decode=False
-        )
-        assert ecode == 0
-
-    @mock.patch('b4.review.tracking._fetch_new_since')
-    @mock.patch('b4.review.tracking._fetch_thread_mbox_bytes')
-    def test_update_message_counts_updates_blob_on_incremental(
-        self, mock_fetch: mock.Mock, mock_new_since: mock.Mock, gitdir: str
-    ) -> None:
-        """update_message_counts replaces the blob when new replies arrive."""
-        # Different prefixes → different Message-IDs → different blobs
-        initial_mbox = _make_mbox_bytes(5, prefix='init')
-        larger_mbox = _make_mbox_bytes(8, prefix='upd')
-        mock_fetch.return_value = initial_mbox
-        mock_new_since.return_value = (3, '2024-02-01T00:00:00+00:00')
-
-        change_id = 'blob-incr-test'
-        _create_review_branch(
-            gitdir, change_id, _make_blob_tracking_data(change_id, 'blob-incr-proj')
-        )
-
-        conn = review_tracking.init_db('blob-incr-proj')
-        review_tracking.add_series_to_db(
-            conn,
-            change_id,
-            1,
-            'Subject',
-            'Author',
-            'a@example.com',
-            '2024-01-15T10:00:00+00:00',
-            'blob-incr@example.com',
-            3,
-        )
-        conn.close()
-
-        series_list = [
-            {
-                'change_id': change_id,
-                'revision': 1,
-                'message_id': 'blob-incr@example.com',
-                'num_patches': 3,
-                'status': 'reviewing',
-            }
-        ]
-
-        # First fetch — stores initial blob
-        review_tracking.update_message_counts(
-            'blob-incr-proj', series_list, topdir=gitdir
-        )
-        _cover, loaded = b4.review.load_tracking(gitdir, f'b4/review/{change_id}')
-        sha_initial = loaded['series'].get('thread-blob')
-        assert sha_initial is not None
-
-        # Incremental — _fetch_thread_mbox_bytes now returns the larger mbox
-        mock_fetch.return_value = larger_mbox
-        review_tracking.update_message_counts(
-            'blob-incr-proj', series_list, topdir=gitdir
-        )
-        _cover, loaded = b4.review.load_tracking(gitdir, f'b4/review/{change_id}')
-        sha_updated = loaded['series'].get('thread-blob')
-
-        assert sha_updated is not None
-        assert sha_updated != sha_initial
-
 
 class TestPatchState:
     """Tests for _get_patch_state() and _set_patch_state()."""

-- 
2.53.0

