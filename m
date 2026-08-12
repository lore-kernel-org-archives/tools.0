Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1F13EFD24
	for <tools@linux.kernel.org>; Wed, 12 Aug 2026 21:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786571243; cv=none; b=exxEdAJaHK+W/NNmT1EsdV5gXUg6i0areAWgHGPWAJ/Iobe+n+KMPAGGZiur1CZt00FXKublu2QBUhwJfPR9IPK6MUiB7eXG2mWBWV76AG6G623c6dnmT3ALDme96PfGMkepqMMeKjCJCT1EOR944AMSccoVlyQ5z+5wG7XisOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786571243; c=relaxed/simple;
	bh=kPwnPGe5ZgDKbhnjRl4A0hC/IoUJCQhggXbCxjm286k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=snWy8vUAqC1smyYsY/7gZRcXdwAqBbOqdkIRhtK7baAzLCSwLiqAKvMvTfEs2RxREKIzoUF/1Vmsxjjma1O7Ioa2kXaiSdHighjISriB7zNu0DTpgH8kWyIODmEOvU95G0asu59C0pF5e+yAcHd5cb98SQxmX5+aDktoR+B6lGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L1chFhWH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L1chFhWH"
Received: by smtp.kernel.org (Postfix)
	id BB31A1F000E9; Wed, 12 Aug 2026 21:47:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D662D1F00A3E;
	Wed, 12 Aug 2026 21:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786571241;
	bh=dKpsahRFvP+y0HL+4PRQfuo+2ly8FJgfp8W+vLCLHd8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=L1chFhWHePnKIqNxHpikVCv7LPSNnHCieLwHPlUOEVsWICCh/ojR7Ap0p026KUhOb
	 DMkSc17WqShRCpZQdtL9FSN5s8NQ4ydD0Dd7i6G6B73WmuCLcpcO8QUFgeSRsYsftS
	 JxaEZscz7guN5LD65aEsKV9PqK25o77NL+TWf4yDNp9U9xjZJEGbeOp52eP9okP70m
	 kFsZhA6TDg3PWU49FOiaFjvZ7C4CiwPaK+Ttb2G6R8fXGXZDhcPgxZNQPwk8i9rrO0
	 XObzxmZ9lDcIwLiotPXSpyYARa5tRnfst7G0ujf+dqoVNEHkDuCA+j0DIL6fiCqFdS
	 ou8aq+sjiKfxg==
From: Christian Brauner <brauner@kernel.org>
Date: Wed, 12 Aug 2026 23:46:51 +0200
Subject: [PATCH RFC v2 10/25] review: give per-change_id state its own
 table
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260812-work-b4-multiver-rows-v2-10-305d53cd723a@kernel.org>
References: <20260812-work-b4-multiver-rows-v2-0-305d53cd723a@kernel.org>
In-Reply-To: <20260812-work-b4-multiver-rows-v2-0-305d53cd723a@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.17-dev-362b8
X-Developer-Signature: v=1; a=openpgp-sha256; l=12809; i=brauner@kernel.org;
 h=from:subject:message-id; bh=kPwnPGe5ZgDKbhnjRl4A0hC/IoUJCQhggXbCxjm286k=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTVvLw1RWCbPudHvkyduWd4mW7yyCS3zL+vrmkXy3yL/
 Qvfv4bAjlIWBjEuBlkxRRaHdpNwueU8FZuNMjVg5rAygQxh4OIUgIl0GjD8Uzq6fbppxRRJzjDh
 pIplxbXb1X72JevN6djG26JuFfA2jeF/dvtUpcs3bIW1Z+9cZihwacfF7S7rFvBUiTzkCRSWmfe
 CDQA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

series.branch_sha records the HEAD of b4/review/<change_id> so a rescan
can skip a branch that has not moved.  There is one such branch per
change_id, but the column lives on a table keyed (change_id, revision),
so the fact is stored once per version of the series.

That forces an arbitration nothing should have to make.  rescan_branches()
reads it back with ORDER BY revision DESC LIMIT 1, believing the highest
revision's copy, while writing only the row whose revision the branch's
tracking commit happens to name.  A change_id with more than one live
row, which rescan_branches() itself can produce, then has a stale copy
sitting where the reader looks.

Give it a table of its own, keyed by change_id alone.  The reader stops
choosing, the writer stops picking a row, and delete_series() drops the
entry with the rest of the change.  The migration seeds each change_id
from the same row the old reader believed, so nothing is reinterpreted on
the way across.  A wrong sha costs one extra tracking-commit read on the
next rescan, since this is a cache key rather than data.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/review/tracking.py         | 141 +++++++++++++++++++++++++++++++-------
 src/tests/test_review_tracking.py |   3 +-
 2 files changed, 120 insertions(+), 24 deletions(-)

diff --git a/src/b4/review/tracking.py b/src/b4/review/tracking.py
index 7d42b160..68701238 100644
--- a/src/b4/review/tracking.py
+++ b/src/b4/review/tracking.py
@@ -26,7 +26,7 @@ logger = b4.logger
 REVIEW_METADATA_DIR = 'b4-review'
 REVIEW_METADATA_FILE = 'metadata.json'
 
-SCHEMA_VERSION = 11
+SCHEMA_VERSION = 12
 
 SERIES_PATCHES_DDL = """
 CREATE TABLE IF NOT EXISTS series_patches (
@@ -53,7 +53,6 @@ CREATE TABLE IF NOT EXISTS series (
     pw_series_id INTEGER,
     status TEXT DEFAULT 'new',
     fingerprint TEXT,
-    branch_sha TEXT,
     -- Per-revision read state (message_count, seen_message_count,
     -- last_update_check) lives on `revisions` and only there: a series row
     -- names which revision it tracks, and that revision's catalog row
@@ -73,6 +72,28 @@ CREATE TABLE IF NOT EXISTS series (
     UNIQUE (change_id, revision)
 )"""
 
+# Per-change_id state: one row per change_id, never one per revision.
+#
+# These facts belong to the change, not to a version of it -- the review
+# branch is `b4/review/<change_id>` and there is exactly one, the backward
+# search runs once per change_id -- so a copy on every `series` row left
+# each writer updating them all and each reader arbitrating between them
+# (MAX(back_searched), ORDER BY revision DESC LIMIT 1 for the other two).
+# That is the same "which copy wins" question the per-revision read state
+# moved onto `revisions` to stop asking.
+CHANGES_DDL = """
+CREATE TABLE IF NOT EXISTS changes (
+    change_id TEXT PRIMARY KEY,
+    -- HEAD of b4/review/<change_id> at the last branch rescan.
+    branch_sha TEXT,
+    -- "<branch-sha>:<catalog-sha1>" at the last successful known-revisions
+    -- mirror; see sync_revisions_catalog_to_branch.
+    catalog_synced TEXT,
+    -- 1 once the one-shot backward revision search has run for this
+    -- change_id, found something or not; see set_back_searched().
+    back_searched INTEGER DEFAULT 0
+)"""
+
 SCHEMA_SQL = (
     """
 CREATE TABLE IF NOT EXISTS schema_version (
@@ -117,6 +138,8 @@ CREATE INDEX IF NOT EXISTS idx_revisions_fingerprint ON revisions(fingerprint);
 CREATE INDEX IF NOT EXISTS idx_revisions_message_id ON revisions(message_id);
 
 """
+    + CHANGES_DDL
+    + ';'
     + SERIES_PATCHES_DDL
     + ';'
 )
@@ -164,6 +187,21 @@ def init_db(identifier: str) -> sqlite3.Connection:
     return conn
 
 
+def _drop_column(conn: sqlite3.Connection, table: str, col: str) -> None:
+    """Drop *col* from *table*, tolerating an sqlite too old to do it.
+
+    DROP COLUMN wants sqlite 3.35 (2021).  On anything older the column
+    simply stays, unread by everything above -- dead weight in the row, not
+    a correctness problem, and not worth a twelve-step table rebuild.
+
+    *table* and *col* are literals supplied by this module.
+    """
+    try:
+        conn.execute(f'ALTER TABLE {table} DROP COLUMN {col}')
+    except sqlite3.OperationalError as ex:
+        logger.debug('Could not drop %s.%s: %s', table, col, ex)
+
+
 def _migrate_db_if_needed(conn: sqlite3.Connection) -> None:
     """Apply any pending schema migrations in-place.
 
@@ -339,20 +377,12 @@ def _run_migrations(conn: sqlite3.Connection) -> None:
             # column left behind invites the next writer to keep it warm.
             # Inside the backfill guard on purpose: dropping a copy that
             # was never carried across would just lose it.
-            #
-            # DROP COLUMN wants sqlite 3.35 (2021).  On anything older the
-            # columns simply stay, unread by everything below -- dead
-            # weight in the row, not a correctness problem, and not worth
-            # a twelve-step table rebuild to reclaim.
             for col in (
                 'message_count',
                 'seen_message_count',
                 'last_update_check',
             ):
-                try:
-                    conn.execute(f'ALTER TABLE series DROP COLUMN {col}')
-                except sqlite3.OperationalError as ex:
-                    logger.debug('Could not drop series.%s: %s', col, ex)
+                _drop_column(conn, 'series', col)
         # Matching a posting by message-id became a hot lookup at v11 --
         # [l], [o] and the conflict check all run it -- and it was a full
         # table scan, unlike its fingerprint twin.
@@ -360,6 +390,27 @@ def _run_migrations(conn: sqlite3.Connection) -> None:
             'CREATE INDEX IF NOT EXISTS idx_revisions_message_id'
             ' ON revisions(message_id)'
         )
+    if version < 12:
+        # Per-change_id state gets its own table.  `branch_sha` describes
+        # the one b4/review/<change_id> branch, so a copy on every series
+        # row meant writing them all and reading back with ORDER BY
+        # revision DESC LIMIT 1 -- an arbitration between copies that only
+        # existed because the fact was stored per revision.
+        conn.execute(CHANGES_DDL)
+        series_cols = {row[1] for row in conn.execute('PRAGMA table_info(series)')}
+        if 'branch_sha' in series_cols:
+            # Highest revision wins, which is the row the old reader picked
+            # with ORDER BY revision DESC LIMIT 1.  A wrong sha here costs
+            # one extra tracking-commit read on the next rescan, so there is
+            # nothing to reconcile: it is a cache key, not data.
+            conn.execute(
+                'INSERT OR IGNORE INTO changes (change_id, branch_sha)'
+                ' SELECT change_id, ('
+                '  SELECT s.branch_sha FROM series s WHERE s.change_id ='
+                '  series.change_id ORDER BY s.revision DESC LIMIT 1)'
+                ' FROM series GROUP BY change_id'
+            )
+            _drop_column(conn, 'series', 'branch_sha')
     # Not an UPDATE: `version` is the primary key, so an UPDATE writes
     # nothing at all against an empty table -- and the read above maps "no
     # row" to version 0, so such a database would re-run the whole ladder
@@ -1453,6 +1504,52 @@ def record_known_revisions(
     conn.commit()
 
 
+def _set_change_state(conn: sqlite3.Connection, change_id: str, **cols: Any) -> None:
+    """Upsert per-change_id state, creating the `changes` row if needed.
+
+    A change_id acquires its row the first time something needs to
+    remember anything about it; nothing else has to keep the table in
+    step with `series`.
+
+    *cols* keys are column names supplied by the wrappers below, never
+    caller input.
+    """
+    assignments = ', '.join(f'{col} = ?' for col in cols)
+    conn.execute(
+        f'INSERT INTO changes (change_id, {", ".join(cols)})'
+        f' VALUES (?, {", ".join("?" for _ in cols)})'
+        f' ON CONFLICT (change_id) DO UPDATE SET {assignments}',
+        (change_id, *cols.values(), *cols.values()),
+    )
+    conn.commit()
+
+
+def set_branch_sha(conn: sqlite3.Connection, change_id: str, branch_sha: str) -> None:
+    """Record the review branch's HEAD, so a rescan can skip an unmoved branch."""
+    _set_change_state(conn, change_id, branch_sha=branch_sha)
+
+
+def get_branch_sha(conn: sqlite3.Connection, change_id: str) -> Optional[str]:
+    """The review branch HEAD recorded at the last rescan, if any."""
+    row = conn.execute(
+        'SELECT branch_sha FROM changes WHERE change_id = ?', (change_id,)
+    ).fetchone()
+    return str(row[0]) if row is not None and row[0] else None
+
+
+def forget_change_state(conn: sqlite3.Connection, change_id: str) -> None:
+    """Drop the per-change_id row once nothing tracks that change_id.
+
+    `changes` outlives `series` on its own -- nothing joins them -- so a
+    change_id that stops existing leaves a row behind carrying
+    back_searched=1 and a branch sha.  Re-tracking it then skips the
+    one-shot backward search for ever, which is the exact opposite of what
+    the latch is for, and a resurrected branch landing on the recorded sha
+    is skipped by rescan_branches.
+    """
+    conn.execute('DELETE FROM changes WHERE change_id = ?', (change_id,))
+
+
 def sync_revisions_catalog_to_branch(
     topdir: Optional[str], identifier: str, change_id: str
 ) -> bool:
@@ -1922,6 +2019,7 @@ def absorb_series_as_revision(
         conn.execute(
             'DELETE FROM series_patches WHERE change_id = ?', (stray_change_id,)
         )
+        forget_change_state(conn, stray_change_id)
     conn.commit()
     return True
 
@@ -3923,13 +4021,7 @@ def rescan_branches(
             continue
         current_sha = sha_out.strip()
 
-        # Check the stored SHA for the most recent revision of this change_id.
-        stored = conn.execute(
-            'SELECT branch_sha FROM series WHERE change_id = ?'
-            ' ORDER BY revision DESC LIMIT 1',
-            (change_id_from_branch,),
-        ).fetchone()
-        if stored and stored['branch_sha'] == current_sha:
+        if get_branch_sha(conn, change_id_from_branch) == current_sha:
             # Branch HEAD unchanged — skip the expensive tracking-commit read.
             scanned_change_ids.add(change_id_from_branch)
             continue
@@ -4021,11 +4113,7 @@ def rescan_branches(
         record_known_revisions(conn, change_id, tracking.get('known-revisions'))
 
         # Persist the new HEAD SHA so future rescans can skip this branch.
-        conn.execute(
-            'UPDATE series SET branch_sha = ? WHERE change_id = ? AND revision = ?',
-            (current_sha, change_id, revision),
-        )
-        conn.commit()
+        set_branch_sha(conn, change_id, str(current_sha))
 
         logger.info('Rescanned: %s (status: %s)', change_id, status)
         changed += 1
@@ -4072,8 +4160,15 @@ def delete_series(
             'DELETE FROM series_patches WHERE change_id = ? AND revision = ?',
             (change_id, revision),
         )
+        # Only once nothing is left: the other revisions still share the
+        # one branch, and the search latch still describes them.
+        if not conn.execute(
+            'SELECT COUNT(*) FROM series WHERE change_id = ?', (change_id,)
+        ).fetchone()[0]:
+            forget_change_state(conn, change_id)
     else:
         conn.execute('DELETE FROM revisions WHERE change_id = ?', (change_id,))
         conn.execute('DELETE FROM series WHERE change_id = ?', (change_id,))
         conn.execute('DELETE FROM series_patches WHERE change_id = ?', (change_id,))
+        forget_change_state(conn, change_id)
     conn.commit()
diff --git a/src/tests/test_review_tracking.py b/src/tests/test_review_tracking.py
index f65bbb4d..8611cd3d 100644
--- a/src/tests/test_review_tracking.py
+++ b/src/tests/test_review_tracking.py
@@ -1646,7 +1646,8 @@ class TestFollowupCounts:
         conn = review_tracking.get_db('fc-migration-test')
         cursor = conn.execute('PRAGMA table_info(series)')
         col_names = {row[1] for row in cursor.fetchall()}
-        assert 'branch_sha' in col_names
+        # branch_sha is added by v2 and rehomed to `changes` by v12.
+        assert 'branch_sha' not in col_names
         assert 'message_count' in col_names
         assert 'seen_message_count' in col_names
         assert 'last_update_check' in col_names

-- 
2.53.0

