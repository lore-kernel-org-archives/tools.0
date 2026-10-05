Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A793C4CDDCA
	for <tools@linux.kernel.org>; Mon,  5 Oct 2026 17:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791222357; cv=pass; b=lt2SAJuepAu1ZamQcVT7D8TJLlCxImM9Z+iuAV1WLB64r7SA0taOFc4nUFhp3ll7boL5R4PXMoGnq9+bHZM+XlwyODEC3fiKWnthPIEb2bvAPZGU8X+69dYcWrBlf49cj8caolYcrJrEj3CPE80C1q3cJ9tA39zvD/hBR2RR1DI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791222357; c=relaxed/simple;
	bh=H3+VnRlfAQdsKuy4gZdnfcrP+pCw0Jpw+5vKUij7pFo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CljtVxJ4W6YnNEzU+IjqKzDUdbRSBXa2EfOpSfs04aRMAyme9AJYH8fmWPq95xbF73B6oyu2YyCUvF4BH3MjDBQJgkAviWsxB193fEcfdkq545QzA7ulj5WwIma2G80o3z8abQWLyz/l4HK8LpQDCl77tC+Xe2EFC09N6Y6bw8E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=gyAFLH/F; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="gyAFLH/F"
Received: by smtp.kernel.org (Postfix)
	id 698141F00893; Mon,  5 Oct 2026 17:45:55 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=74.125.225.98
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791222355;
	b=SGbUyHlSc7K+v4lY/lkDroxO8rpC4H12Dak4+ln8WbKms8HnlfY4yQG4Ywja4/x+v99D
	 oJHNSbajoaZNty/Z22h1sraRdQtD977cWCAHonVVI3kZUCiEJy10UVXGD1n51/5lRG2HA
	 TkuDRxxEVp0ckHMa9/OGKjC9JVND/FiTFwOm39u0Y3TLpRBUNAcMnfI1/z6bp4LnAA+ZR
	 YRijzaLaEDwsMoVZYS/ZQX1GRYJI3sjxmbwnNbDEKmdPN5ESmxkBHYkHHIAO8Xl1XbJLj
	 g0WXJJ5r2TaIoKaPytBlvWAOawcjGqoySWJT1IFi/4KTOpS8qokKeXATB1oKA3h452w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791222355;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=Djh0OizkTn3+tDSD+s2+W0XKwodqx8zPC9PrArSq0FI=;
	b=pf/3+Pu+aLvKyuIdcZTGPT26qHHWiQtB8Ju0qJ9Xf83YvJRmtVuMZhfMf1l36AEaHBql
	 mgw1QQCuPV4yQsr92A19Ta6pCa5Q0/OIXsxHkm9Unuo3LJPe5UOhdRPa0fOFU+vt9WxSw
	 xV5T2sKUF00EY6hl211pzd7yaYhlq+faH7VEqm/J6qMPjaByO4HtFm9dCj9ZIzO7qzOWB
	 V8RJ4sYWz39b1mnS+m5brtxZGAn1oHha40kAPKEEVTwSMj8BKQPbXEn70HMY3kt6eUFb8
	 9EYLZxFK0bJNk67tPaYmXco8Bzuv4Cc0iFhKhrgf5lg06+8VymKJRmx5MMJ9QG/am5Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="gyAFLH/F";
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	arc=none smtp.remote-ip=74.125.225.98
Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5FE021F000FF
	for <tools@kernel.org>; Mon,  5 Oct 2026 17:45:54 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=gyAFLH/F
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 5FE021F000FF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48af5ae31d8so1550596f8f.2
        for <tools@kernel.org>; Mon, 05 Oct 2026 10:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791222353; x=1791827153; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Djh0OizkTn3+tDSD+s2+W0XKwodqx8zPC9PrArSq0FI=;
        b=gyAFLH/FCayawlDzZ8QjCmlq7k/NQiSXuVAnshVapEazVjdj9UwFxU86lDo52PgSTi
         jE2on2xd96BBgdU3+U+iEm8DNXomvmt2x4DcXHN+OhlRbDrQ2ORKs5OmXnQLJqrl/N4n
         TlFQ2N0g9mg8ydJgsAcyik53CQxy7l/W8CbSZxXrLHCbN2S9VkvjRlx/pTN0Wz3SS5nL
         pjlZd/ppZtaadg0E8gYNYw0/HXIzFJy+ogqzOh9m12cja6pq+sJWr4fWLcDGUoWWWqcm
         tKobmJErTENHLf4j4WTW/IeT5OWkZWd5ByjiGIz7MzS06J+zMroRLY8cduYrkK61BAs5
         L20Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791222353; x=1791827153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Djh0OizkTn3+tDSD+s2+W0XKwodqx8zPC9PrArSq0FI=;
        b=sd/+iyvaH8mqycwPzmw0/tWP0oEAYiUfZ/BjMYPaQyoo26Tv3x7lACPpV6X6xXx1er
         wYnQ4vXtrdPqaewxWWi/Iugvr+U2eouVcCG1pj3BAXiRYc5P8Hp2fgFaPq2fnvpZAq9Y
         DOXu3qoUi/EvKIqBSj7BiawcjYW7qDJzZ7xBgOO2HebARd6oYS8ajRp1JjlVdYLKDyHT
         uawBPhbu9q507KvglaSib8fBUWsoanTBuC9njdWUStBgO4jamfob5Fa0JTSCxM3W8DO4
         AIwbyk4og9hvOA0Tl9BTMsMdAV/lfGUf6szOvLwlRbF4AqDRUztWPJxMKdJFXU3eoksx
         qy6Q==
X-Gm-Message-State: AFq9FYIMq0tOVMa7v2moH8QRfQF9hdVpqB2IZpL3yvADAfXY8K74Jbp8
	8VrOjHVZOJwYrl2e+NdfCa+HFNqcLjCKYyLcJj737Db228UFzrjyq3sT9gS3SjqCOqs=
X-Gm-Gg: AYBFou2iLMT7wu0ZS+7YGn01gI7eAO4B2RW1Qkh1mkL8WPrtUzpkyJ2PNLbwjDvdIuf
	Xsx08GajB2fO+rWuGkPSKdKcaW4cCGzdKef3+hAxoXLGfjspXQQOZ7WPjqCoKcvVB03XO1fzoL/
	/VDOh477U0tn/byaFRL70XRjmEyx9XgiXC4ZjrjFI5XdUIZx4hyyi2j8/Ok5+7urWuVeW0lXopl
	ksGCaftMpO5WmNlwmyh11xwHYpZnTgMHOU8ISfLw5CRc5GQaGw7BHKUTlJ0Y33/IWD3HkCMrprS
	JLgwa3Iq6ACXVgR1U+vS9bWDVFYwHjaNXZS7wJTJSWU0k6Sl9ieAX3TG8eCZ07Fz4TW/opQhE8j
	RylG5tpYmagrEX2gsgoZs8aJ4wuIAy8rHwob+nD4lMM16OAj7pwa3thg0BlZejNNfakyGm062cf
	T7UpFswWMMSMBkouEiDLgH4WQQuY339AlEfSzY9RUuiDQEaKx9wMNAvLH1uKDTRbgBesuVYJHDU
	VucuvwaPJ5/lZ+oh484
X-Received: by 2002:a05:6000:2c04:b0:487:27f9:841 with SMTP id ffacd0b85a97d-48b12727a3bmr20087368f8f.54.1791222352730;
        Mon, 05 Oct 2026 10:45:52 -0700 (PDT)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c621e4966sm4845029f8f.6.2026.10.05.10.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 10:45:52 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Mon, 05 Oct 2026 19:45:46 +0200
Subject: [PATCH b4 5/5] review: describe a re-tracked series by its live
 revision
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261005-b4-send-b-v1-5-7f6ed23f5106@baylibre.com>
References: <20261005-b4-send-b-v1-0-7f6ed23f5106@baylibre.com>
In-Reply-To: <20261005-b4-send-b-v1-0-7f6ed23f5106@baylibre.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
X-Mailer: b4 0.17-dev

The series table has one row per revision.  After an upgrade, the old
revision stays as "archived" next to the new one.  When a series was
already tracked, cmd_track looked it up by change-id only and got the
lowest revision, which is the archived one:

  rows:    (v2, archived)  (v3, reviewing)
  before:  "status: archived, v2", and advice to run "b4 review forget"
  after:   "status: reviewing, v3", and an offer to upgrade

Following that advice deleted the series and its review branch,
including the review in progress.

get_current_revision_state() now picks a non-archived row, newest
first, and falls back to the newest archived row only when every
revision is archived.  Sorting by revision alone is not enough: v3 can
be archived while v2 is still live.

Assisted-by: LLM [analysis, codegen, tests]
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 src/b4/review/tracking.py         |  37 +++++--
 src/tests/test_review_tracking.py | 219 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 248 insertions(+), 8 deletions(-)

diff --git a/src/b4/review/tracking.py b/src/b4/review/tracking.py
index 0d9c069f652b..c236e3444451 100644
--- a/src/b4/review/tracking.py
+++ b/src/b4/review/tracking.py
@@ -763,13 +763,8 @@ def cmd_track(cmdargs: argparse.Namespace) -> None:
         new_revs = _record_discovered_revisions(
             conn, existing_change_id, lmbx, linkmask, rethreaded_revs=rethreaded_revs
         )
-        srow = conn.execute(
-            'SELECT status, revision FROM series WHERE change_id = ?',
-            (existing_change_id,),
-        ).fetchone()
+        status_str, cur_rev = get_current_revision_state(conn, existing_change_id)
         conn.close()
-        status_str = str(srow[0]) if srow else 'unknown'
-        cur_rev = int(srow[1]) if srow else 0
         if new_revs:
             # Mirror the freshly-recorded catalog onto the existing review
             # branch so the pending upgrade travels on push (it can't be
@@ -786,8 +781,7 @@ def cmd_track(cmdargs: argparse.Namespace) -> None:
                 ', '.join(f'v{v}' for v in new_revs),
             )
             if status_str == 'archived':
-                # Archived series are not shown in the review TUI, so the
-                # usual upgrade advice would point at nothing actionable.
+                # A live row would have won the lookup, so all are archived.
                 logger.info('  This series is archived and not shown in the TUI.')
                 logger.info(
                     '  Use "b4 review forget %s" to erase it and track afresh.',
@@ -2490,6 +2484,33 @@ def get_series_status(
     return row[0] if row else None
 
 
+def get_current_revision_state(
+    conn: sqlite3.Connection, change_id: str
+) -> Tuple[str, int]:
+    """Return the (status, revision) that stands for a series as a whole.
+
+    The series table holds one row per (change_id, revision), so an upgraded
+    series keeps the superseded revision as 'archived' beside the live row
+    for the new one, and a lookup by change-id alone may return either.
+
+    Live revisions win, newest first, because the review TUI lists every row
+    whose status is not 'archived': "a non-archived row exists" is exactly
+    "the TUI still shows this series".  Only once every revision has been
+    archived does the newest archived one stand in for the series.
+
+    Returns ('unknown', 0) when the change-id has no series row at all.
+    """
+    row = conn.execute(
+        'SELECT status, revision FROM series WHERE change_id = ?'
+        " ORDER BY (COALESCE(status, 'new') = 'archived'), revision DESC"
+        ' LIMIT 1',
+        (change_id,),
+    ).fetchone()
+    if row is None:
+        return 'unknown', 0
+    return str(row[0] or 'new'), int(row[1])
+
+
 def get_pw_series_id(
     conn: sqlite3.Connection, change_id: str, revision: Optional[int] = None
 ) -> Optional[int]:
diff --git a/src/tests/test_review_tracking.py b/src/tests/test_review_tracking.py
index b9730fabf033..e2f1398297f9 100644
--- a/src/tests/test_review_tracking.py
+++ b/src/tests/test_review_tracking.py
@@ -5128,6 +5128,225 @@ class TestCmdTrackRetrievalFailure:
                 review_tracking.cmd_track(self._cmdargs('track-lookup'))
 
 
+class TestGetCurrentRevisionState:
+    """Layer 1: which of a series' per-revision rows stands for the series."""
+
+    @staticmethod
+    def _seed(
+        identifier: str, rows: list[tuple[int, str | None]]
+    ) -> sqlite3.Connection:
+        """Insert (revision, status) rows for 'cid' in the order given."""
+        review_tracking.init_db(identifier).close()
+        conn = review_tracking.get_db(identifier)
+        for revision, status in rows:
+            conn.execute(
+                'INSERT INTO series (change_id, revision, status) VALUES (?, ?, ?)',
+                ('cid', revision, status),
+            )
+        conn.commit()
+        return conn
+
+    def test_live_revision_wins_over_an_archived_one(self) -> None:
+        """The archived leftover of an upgrade never speaks for the series."""
+        conn = self._seed('state-live', [(2, 'archived'), (3, 'reviewing')])
+        assert review_tracking.get_current_revision_state(conn, 'cid') == (
+            'reviewing',
+            3,
+        )
+        conn.close()
+
+    def test_live_revision_wins_even_when_it_is_the_older_one(self) -> None:
+        """Highest live, not highest revision: v3 can be abandoned before v2."""
+        conn = self._seed('state-older', [(2, 'reviewing'), (3, 'archived')])
+        assert review_tracking.get_current_revision_state(conn, 'cid') == (
+            'reviewing',
+            2,
+        )
+        conn.close()
+
+    def test_newest_of_several_live_revisions_wins(self) -> None:
+        """Among live rows the newest revision is the one being worked on."""
+        conn = self._seed('state-newest', [(2, 'reviewing'), (3, 'replied')])
+        assert review_tracking.get_current_revision_state(conn, 'cid') == ('replied', 3)
+        conn.close()
+
+    def test_snoozed_counts_as_live(self) -> None:
+        """The TUI hides only archived rows, so a snoozed series is still shown."""
+        conn = self._seed('state-snoozed', [(2, 'archived'), (3, 'snoozed')])
+        assert review_tracking.get_current_revision_state(conn, 'cid') == ('snoozed', 3)
+        conn.close()
+
+    def test_newest_archived_stands_in_when_all_are_archived(self) -> None:
+        """A wholly archived series is described by its last revision."""
+        conn = self._seed('state-dead', [(2, 'archived'), (3, 'archived')])
+        assert review_tracking.get_current_revision_state(conn, 'cid') == (
+            'archived',
+            3,
+        )
+        conn.close()
+
+    def test_null_status_reads_as_new_and_counts_as_live(self) -> None:
+        """A row with no status is not archived, and reports the column default."""
+        conn = self._seed('state-null', [(2, 'archived'), (3, None)])
+        assert review_tracking.get_current_revision_state(conn, 'cid') == ('new', 3)
+        conn.close()
+
+    def test_untracked_change_id_is_unknown(self) -> None:
+        """No rows at all: the caller gets the placeholder, not a crash."""
+        conn = self._seed('state-none', [])
+        assert review_tracking.get_current_revision_state(conn, 'other') == (
+            'unknown',
+            0,
+        )
+        conn.close()
+
+
+class TestCmdTrackAlreadyTrackedState:
+    """Re-tracking reports the live revision, not a superseded one.
+
+    cmd_track used to describe whichever row an unordered lookup by
+    change-id handed back, so a series under active review was announced as
+    archived and offered "b4 review forget" -- which erases its rows and
+    deletes its review branch.
+    """
+
+    CHANGE_ID = 'cid-state'
+
+    @classmethod
+    def _retrieved(cls, revision: int) -> mock.Mock:
+        """A retrieved vN carrying the tracked change-id."""
+        cover = mock.Mock(
+            msgid=f'v{revision}-cover@example.com',
+            full_subject=f'[PATCH v{revision} 0/2] thing',
+        )
+        p1 = mock.Mock(
+            msgid=f'v{revision}-p1@example.com',
+            full_subject=f'[PATCH v{revision} 1/2] thing: part 1',
+        )
+        lser = mock.Mock()
+        lser.revision = revision
+        lser.expected = 2
+        lser.change_id = cls.CHANGE_ID
+        lser.fromname = 'Author'
+        lser.fromemail = 'author@example.com'
+        lser.subject = 'thing'
+        lser.fingerprint = f'fp-v{revision}'
+        lser.has_cover = True
+        lser.patches = [cover, p1, None]
+
+        mbx = mock.Mock()
+        mbx.series = {revision: lser}
+        mbx.covers = {revision: cover}
+        mbx.get_series.return_value = lser
+        return mbx
+
+    @classmethod
+    def _seed_upgraded_series(
+        cls, gitdir: str, identifier: str, v3_status: str
+    ) -> None:
+        """Leave rows (v2, archived) and (v3, *v3_status*), v2 inserted first.
+
+        That is the order an upgrade leaves behind, and it makes the unordered
+        lookup return the archived row deterministically: v2 is both the
+        earlier rowid and the lower key in the UNIQUE (change_id, revision)
+        index that serves the lookup.
+        """
+        review_tracking.cmd_enroll(
+            argparse.Namespace(repo_path=gitdir, identifier=identifier)
+        )
+        conn = review_tracking.get_db(identifier)
+        for revision in (2, 3):
+            review_tracking.add_series_to_db(
+                conn,
+                change_id=cls.CHANGE_ID,
+                revision=revision,
+                subject='thing',
+                sender_name='Author',
+                sender_email='author@example.com',
+                sent_at='2026-03-09T00:00:00+00:00',
+                message_id=f'v{revision}-cover@example.com',
+                num_patches=2,
+                fingerprint=f'fp-v{revision}',
+            )
+            review_tracking.add_revision(
+                conn, cls.CHANGE_ID, revision, f'v{revision}-cover@example.com'
+            )
+        review_tracking.update_series_status(conn, cls.CHANGE_ID, v3_status, revision=3)
+        review_tracking.update_series_status(
+            conn, cls.CHANGE_ID, 'archived', revision=2
+        )
+        rows = conn.execute(
+            'SELECT revision, status FROM series WHERE change_id = ?',
+            (cls.CHANGE_ID,),
+        ).fetchall()
+        conn.close()
+        # Guard the premise: the raw lookup really does hand back the v2 row.
+        assert [(row[0], row[1]) for row in rows] == [(2, 'archived'), (3, v3_status)]
+
+    @classmethod
+    def _track(cls, identifier: str, revision: int) -> None:
+        cmdargs = _track_cmdargs(identifier, series_id='thing@example.com')
+        with (
+            mock.patch('b4.retrieve_messages', return_value=(None, [mock.Mock()])),
+            mock.patch('b4.LoreMailbox', return_value=cls._retrieved(revision)),
+        ):
+            review_tracking.cmd_track(cmdargs)
+
+    def test_live_revision_is_reported_not_the_archived_leftover(
+        self, gitdir: str, caplog: pytest.LogCaptureFixture
+    ) -> None:
+        """v3 is under review, so re-tracking at v4 offers the TUI upgrade."""
+        identifier = 'state-live-track'
+        self._seed_upgraded_series(gitdir, identifier, 'reviewing')
+
+        with caplog.at_level(logging.INFO, logger='b4'):
+            self._track(identifier, revision=4)
+
+        assert (
+            f'Series already tracked as {self.CHANGE_ID} (status: reviewing, v3)'
+            in caplog.text
+        )
+        assert 'Recorded new revision(s): v4' in caplog.text
+        assert 'Upgrade the series in the review TUI' in caplog.text
+        assert 'This series is archived' not in caplog.text
+        assert 'review forget' not in caplog.text
+
+    def test_wholly_archived_series_still_gets_the_forget_advice(
+        self, gitdir: str, caplog: pytest.LogCaptureFixture
+    ) -> None:
+        """With every revision archived the TUI shows nothing, so forget it."""
+        identifier = 'state-dead-track'
+        self._seed_upgraded_series(gitdir, identifier, 'archived')
+
+        with caplog.at_level(logging.INFO, logger='b4'):
+            self._track(identifier, revision=4)
+
+        assert (
+            f'Series already tracked as {self.CHANGE_ID} (status: archived, v3)'
+            in caplog.text
+        )
+        assert 'This series is archived and not shown in the TUI.' in caplog.text
+        assert f'Use "b4 review forget {self.CHANGE_ID}"' in caplog.text
+        assert 'Upgrade the series in the review TUI' not in caplog.text
+
+    def test_no_new_revisions_reports_the_live_revision(
+        self, gitdir: str, caplog: pytest.LogCaptureFixture
+    ) -> None:
+        """Re-tracking v3 refuses, naming the revision it already has."""
+        identifier = 'state-same-track'
+        self._seed_upgraded_series(gitdir, identifier, 'reviewing')
+
+        with (
+            caplog.at_level(logging.CRITICAL, logger='b4'),
+            pytest.raises(SystemExit) as excinfo,
+        ):
+            self._track(identifier, revision=3)
+
+        assert excinfo.value.code == 1
+        assert 'This series is already tracked (status: reviewing, v3)' in caplog.text
+        assert f'Use "b4 review forget {self.CHANGE_ID}"' in caplog.text
+
+
 class TestCmdTrackRethreadOffline:
     """--rethread refuses in offline mode instead of querying lore.
 

-- 
2.56.0

