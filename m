Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C757246BD5
	for <tools@linux.kernel.org>; Fri, 17 Jul 2026 22:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784327905; cv=none; b=chitITvqRAb6IDhuVwWUjZ3jEV2eeCrsp7EML8z4+10QWSGgKP3SrRMAcsIylrOt3XWliAN/ju6sFA2ZHvGWuNZwxVwDY908cyWIDAsb7hXHfR/AGNzJp0g53pUE39RNEaWXpdS7OxGO2bVwaIcJoOgBxuCw92KqyvnusNa8i2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784327905; c=relaxed/simple;
	bh=IGGScG69uF/sJAfe52qJQu14gPbydcKGIyPu4AuO0hg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=joOo1plwmRmhvvlm3rpCOZ0glGhEkKpEYWzub4bnOyItDBcHoc7ZBcRsrQPpXNu56TeGwXTU8tdX8STQbDs0qNwP6xJ2ESASaIWkNjtDr8hknoTJikHO+YeZcbe2dJlpIyVZPkBzb44UsCNnqi8CChFCKDzXUMKc9PYC+eQU6HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lWwx9J5O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lWwx9J5O"
Received: by smtp.kernel.org (Postfix)
	id F06CC1F00A3A; Fri, 17 Jul 2026 22:38:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 898091F000E9;
	Fri, 17 Jul 2026 22:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784327902;
	bh=u9/6nBxSPoe+L+XG+b8HCcW2IlOJMRyRuCZnasbf+m4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=lWwx9J5OrwZv6efGjkvylVX96ZLJi6IkRCN0aM5Ep8wrKn1w58hipLPpqqGRDnF/s
	 8TOHqVNM/kYnfDY4wtQ8En3GAIjgM16orJjn1rOq1MCswaDf1B6/O3rhP7qSj9uVMS
	 +0hCCAdMD4PnGml39abRI0oKHguHIzYR7FdYeKKqh0bv70vZRtUG3wH2O5ICWgomCZ
	 W5fpgN64/gaeu9PO5s7Dvvj2+uGqorrmLgt9O1nbtikYxljVO9mudqJV5RCgrNfpcj
	 CTCe0OywgyXEnfz9wgXyBErrjSfwpBnOQyxoTJebXZ/zG4LCBOVCs93Y0xlyq4zPkd
	 iTegqSjFljatw==
From: Christian Brauner <brauner@kernel.org>
Date: Sat, 18 Jul 2026 00:37:38 +0200
Subject: [PATCH RFC 02/11] review: track message counts for all revisions
 of a series
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260718-work-b4-multiver-rows-v1-2-3c539d2a3095@kernel.org>
References: <20260718-work-b4-multiver-rows-v1-0-3c539d2a3095@kernel.org>
In-Reply-To: <20260718-work-b4-multiver-rows-v1-0-3c539d2a3095@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-4217c
X-Developer-Signature: v=1; a=openpgp-sha256; l=29537; i=brauner@kernel.org;
 h=from:subject:message-id; bh=IGGScG69uF/sJAfe52qJQu14gPbydcKGIyPu4AuO0hg=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWRFrbt570r/zzy9tPVXBM023FLnkfbOefbo96GLRkrhC
 7vtkgTYO0pZGMS4GGTFFFkc2k3C5ZbzVGw2ytSAmcPKBDKEgYtTACYS+Zbhn7aiW+f2i1I7C5lT
 MveKyjXkvK6U7Lc/PrfmlMDn57IHaxgZVvW9m8Dqsy/7UcqkPf8+P5WZmdL46kCkEbfcqhUOL9Y
 J8QMA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

The series table only carries message counts for the tracked revision,
so new mail landing on an older version's thread is invisible.  Give
the revisions catalog its own message_count/seen_message_count/
last_update_check/last_activity_at columns (schema v11, backfilled
from series rows including archived upgrade leftovers), stitch reads
through a LEFT JOIN so live series counts win while archived rows
never shadow the catalog, and add update_revision_message_counts() --
an incremental per-revision poller (newest-first, zero writes when
quiet, rethreaded revisions summed across their per-patch threads,
thread mbox cached as a git blob).

refresh_message_count() and sync_seen_from_unseen_count() now fall
back to the catalog row when the (change_id, revision) pair is not
actively tracked, so the thread viewer's badge sync works for any
revision.

Assisted-by: LLM
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/review/tracking.py | 566 ++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 493 insertions(+), 73 deletions(-)

diff --git a/src/b4/review/tracking.py b/src/b4/review/tracking.py
index 0d10dff..c176c46 100644
--- a/src/b4/review/tracking.py
+++ b/src/b4/review/tracking.py
@@ -26,7 +26,7 @@ logger = b4.logger
 REVIEW_METADATA_DIR = 'b4-review'
 REVIEW_METADATA_FILE = 'metadata.json'
 
-SCHEMA_VERSION = 10
+SCHEMA_VERSION = 11
 
 SERIES_PATCHES_DDL = """
 CREATE TABLE IF NOT EXISTS series_patches (
@@ -38,12 +38,7 @@ CREATE TABLE IF NOT EXISTS series_patches (
     PRIMARY KEY (change_id, revision, position)
 )"""
 
-SCHEMA_SQL = (
-    """
-CREATE TABLE IF NOT EXISTS schema_version (
-    version INTEGER PRIMARY KEY
-);
-
+SERIES_DDL = """
 CREATE TABLE IF NOT EXISTS series (
     track_id INTEGER PRIMARY KEY,
     change_id TEXT NOT NULL,
@@ -68,7 +63,16 @@ CREATE TABLE IF NOT EXISTS series (
     target_branch TEXT,
     is_rethreaded INTEGER DEFAULT 0,
     UNIQUE (change_id, revision)
+)"""
+
+SCHEMA_SQL = (
+    """
+CREATE TABLE IF NOT EXISTS schema_version (
+    version INTEGER PRIMARY KEY
 );
+"""
+    + SERIES_DDL
+    + """;
 
 CREATE TABLE IF NOT EXISTS revisions (
     change_id   TEXT NOT NULL,
@@ -81,6 +85,10 @@ CREATE TABLE IF NOT EXISTS revisions (
     fingerprint TEXT,
     source      TEXT DEFAULT 'heuristic',
     is_rethreaded INTEGER DEFAULT 0,
+    message_count INT,
+    seen_message_count INT,
+    last_update_check TEXT,
+    last_activity_at TEXT,
     PRIMARY KEY (change_id, revision)
 );
 
@@ -187,6 +195,76 @@ def _migrate_db_if_needed(conn: sqlite3.Connection) -> None:
             conn.execute(
                 'ALTER TABLE revisions ADD COLUMN is_rethreaded INTEGER DEFAULT 0'
             )
+    if version < 11:
+        # Per-revision unread tracking: the series table only covers the
+        # tracked revision, so non-tracked versions get their message
+        # counts and new-mail detection from the revisions catalog.
+        # The stitched per-revision read joins series, so make sure the
+        # table exists (mirrors the v8 treatment of revisions).
+        conn.execute(SERIES_DDL)
+        existing = {row[1] for row in conn.execute('PRAGMA table_info(revisions)')}
+        for coldef in (
+            'message_count INT',
+            'seen_message_count INT',
+            'last_update_check TEXT',
+            'last_activity_at TEXT',
+        ):
+            if coldef.split()[0] not in existing:
+                conn.execute(f'ALTER TABLE revisions ADD COLUMN {coldef}')
+        # Backfill from the series table -- but only when it carries the
+        # full column set (a degenerate/absent series table has nothing
+        # worth backfilling from).
+        series_cols = {row[1] for row in conn.execute('PRAGMA table_info(series)')}
+        needed = {
+            'change_id',
+            'revision',
+            'message_id',
+            'subject',
+            'added_at',
+            'sent_at',
+            'fingerprint',
+            'is_rethreaded',
+            'message_count',
+            'seen_message_count',
+            'last_update_check',
+            'last_activity_at',
+        }
+        if needed <= series_cols:
+            # Every tracked series (archived rows included) needs a catalog
+            # row so its per-revision counts have somewhere to live.
+            conn.execute(
+                'INSERT OR IGNORE INTO revisions'
+                ' (change_id, revision, message_id, subject, found_at,'
+                '  fingerprint, source, is_rethreaded,'
+                '  message_count, seen_message_count, last_update_check,'
+                '  last_activity_at)'
+                ' SELECT change_id, revision, message_id, subject,'
+                "  COALESCE(added_at, sent_at), fingerprint, 'heuristic',"
+                '  COALESCE(is_rethreaded, 0),'
+                '  message_count, seen_message_count, last_update_check,'
+                '  last_activity_at'
+                " FROM series WHERE message_id IS NOT NULL AND message_id != ''"
+            )
+            # Seed counts on pre-existing catalog rows from any matching
+            # series row -- the only historical data available.
+            conn.execute(
+                'UPDATE revisions SET'
+                '  message_count = (SELECT s.message_count FROM series s'
+                '   WHERE s.change_id = revisions.change_id'
+                '   AND s.revision = revisions.revision),'
+                '  seen_message_count = (SELECT s.seen_message_count FROM series s'
+                '   WHERE s.change_id = revisions.change_id'
+                '   AND s.revision = revisions.revision),'
+                '  last_update_check = (SELECT s.last_update_check FROM series s'
+                '   WHERE s.change_id = revisions.change_id'
+                '   AND s.revision = revisions.revision),'
+                '  last_activity_at = (SELECT s.last_activity_at FROM series s'
+                '   WHERE s.change_id = revisions.change_id'
+                '   AND s.revision = revisions.revision)'
+                ' WHERE message_count IS NULL AND EXISTS (SELECT 1 FROM series s'
+                '  WHERE s.change_id = revisions.change_id'
+                '  AND s.revision = revisions.revision)'
+            )
     conn.execute('UPDATE schema_version SET version = ?', (SCHEMA_VERSION,))
     conn.commit()
 
@@ -1035,18 +1113,34 @@ _REVISION_COLS = (
     'fingerprint',
     'source',
     'is_rethreaded',
+    'message_count',
+    'seen_message_count',
+    'last_update_check',
+    'last_activity_at',
 )
 
+# Counts for the revision a series row actively tracks live on `series`;
+# the catalog columns cover every other revision.  COALESCE stitches the
+# two so readers get one consistent per-revision view.  Archived series
+# rows are upgrade leftovers whose stale counts must not shadow the
+# catalog's.
 _REVISION_SELECT = (
-    'SELECT change_id, revision, message_id, subject, link, found_at,'
-    ' thread_blob, fingerprint, source, is_rethreaded FROM revisions'
+    'SELECT r.change_id, r.revision, r.message_id, r.subject, r.link,'
+    ' r.found_at, r.thread_blob, r.fingerprint, r.source, r.is_rethreaded,'
+    ' COALESCE(s.message_count, r.message_count),'
+    ' COALESCE(s.seen_message_count, r.seen_message_count),'
+    ' COALESCE(s.last_update_check, r.last_update_check),'
+    ' COALESCE(s.last_activity_at, r.last_activity_at)'
+    ' FROM revisions r LEFT JOIN series s'
+    ' ON s.change_id = r.change_id AND s.revision = r.revision'
+    " AND s.status != 'archived'"
 )
 
 
 def get_revisions(conn: sqlite3.Connection, change_id: str) -> list[dict[str, Any]]:
     """Return all known revisions for a change_id, ordered ascending."""
     cursor = conn.execute(
-        _REVISION_SELECT + ' WHERE change_id = ? ORDER BY revision ASC',
+        _REVISION_SELECT + ' WHERE r.change_id = ? ORDER BY r.revision ASC',
         (change_id,),
     )
     return [dict(zip(_REVISION_COLS, row)) for row in cursor.fetchall()]
@@ -1064,7 +1158,7 @@ def find_revision_by_fingerprint(
     if not fingerprint:
         return None
     row = conn.execute(
-        _REVISION_SELECT + ' WHERE fingerprint = ? LIMIT 1',
+        _REVISION_SELECT + ' WHERE r.fingerprint = ? LIMIT 1',
         (fingerprint,),
     ).fetchone()
     if row is None:
@@ -1475,26 +1569,34 @@ def get_all_revisions_grouped(
     conn: sqlite3.Connection,
 ) -> dict[str, list[dict[str, Any]]]:
     """Return {change_id: [rev_dicts]} for all change_ids, ordered ascending."""
-    cols = (
-        'change_id',
-        'revision',
-        'message_id',
-        'subject',
-        'link',
-        'found_at',
-        'thread_blob',
-    )
-    cursor = conn.execute(
-        'SELECT change_id, revision, message_id, subject, link, found_at, thread_blob '
-        'FROM revisions ORDER BY change_id, revision ASC'
-    )
+    cursor = conn.execute(_REVISION_SELECT + ' ORDER BY r.change_id, r.revision ASC')
     result: dict[str, list[dict[str, Any]]] = {}
     for row in cursor.fetchall():
-        entry: dict[str, Any] = dict(zip(cols, row))
-        result.setdefault(row[0], []).append(entry)
+        entry: dict[str, Any] = dict(zip(_REVISION_COLS, row))
+        result.setdefault(entry['change_id'], []).append(entry)
     return result
 
 
+def summarize_revision_unseen(
+    revisions: List[Dict[str, Any]], tracked_revision: Optional[int] = None
+) -> int:
+    """Sum unseen messages across catalog revisions, excluding the tracked one.
+
+    Revisions whose thread was never fetched (NULL count) contribute
+    nothing.  The tracked revision is excluded because its unread state
+    is already surfaced through the series row badge.
+    """
+    total = 0
+    for rev in revisions:
+        if tracked_revision is not None and rev.get('revision') == tracked_revision:
+            continue
+        count = rev.get('message_count')
+        if count is None:
+            continue
+        total += max(0, int(count) - int(rev.get('seen_message_count') or 0))
+    return total
+
+
 def update_attestation(
     identifier: str, change_id: str, revision: int, attestation: Optional[str]
 ) -> None:
@@ -1925,6 +2027,45 @@ def _fetch_new_since(
         return None
 
 
+def _write_mbox_blob(topdir: str, msgs: List[Any]) -> Optional[str]:
+    """Serialize msgs to mboxrd and write as a git blob; return the SHA."""
+    import io
+
+    buf = io.BytesIO()
+    b4.save_mboxrd_mbox(msgs, buf)
+    mbox_bytes = buf.getvalue()
+    if not mbox_bytes:
+        return None
+
+    ecode, out = b4.git_run_command(
+        topdir, ['hash-object', '-w', '--stdin'], stdin=mbox_bytes
+    )
+    if ecode != 0:
+        return None
+    return str(out.strip())
+
+
+def _store_revision_thread_blob(
+    conn: sqlite3.Connection,
+    topdir: str,
+    change_id: str,
+    revision: int,
+    msgs: List[Any],
+) -> Optional[str]:
+    """Cache a catalog revision's thread mbox as a git blob.
+
+    Unlike _store_thread_blob this records the SHA in the revisions
+    catalog only -- the review branch tracking ref belongs to the
+    tracked revision.
+    """
+    blob_sha = _write_mbox_blob(topdir, msgs)
+    if blob_sha is None:
+        logger.debug('Could not store thread blob for %s v%d', change_id, revision)
+        return None
+    set_revision_thread_blob(conn, change_id, revision, blob_sha)
+    return blob_sha
+
+
 def _store_thread_blob(topdir: str, change_id: str, msgs: List[Any]) -> Optional[str]:
     """Serialize msgs to mboxrd and write as a git blob; update tracking commit.
 
@@ -1936,24 +2077,12 @@ def _store_thread_blob(topdir: str, change_id: str, msgs: List[Any]) -> Optional
     """
     # Local import first — avoids circular deps AND prevents UnboundLocalError
     # that would occur if `import b4.review` appeared after a `b4.xxx` call.
-    import io
-
     import b4.review as _b4_review
 
-    buf = io.BytesIO()
-    b4.save_mboxrd_mbox(msgs, buf)
-    mbox_bytes = buf.getvalue()
-    if not mbox_bytes:
-        logger.debug('No bytes to store for thread blob for %s', change_id)
-        return None
-
-    ecode, out = b4.git_run_command(
-        topdir, ['hash-object', '-w', '--stdin'], stdin=mbox_bytes
-    )
-    if ecode != 0:
+    blob_sha = _write_mbox_blob(topdir, msgs)
+    if blob_sha is None:
         logger.debug('Could not write thread blob for %s', change_id)
         return None
-    blob_sha = out.strip()
 
     branch_name = f'b4/review/{change_id}'
     if b4.git_branch_exists(topdir, branch_name):
@@ -2423,6 +2552,228 @@ def update_message_counts(
     return {'updated': updated, 'errors': errors}
 
 
+def _fetch_revision_thread_msgs(
+    identifier: str,
+    conn: sqlite3.Connection,
+    change_id: str,
+    rev: Dict[str, Any],
+) -> Optional[List[Any]]:
+    """Fetch the full thread for a catalog revision.
+
+    Rethreaded revisions reassemble from their per-patch message-ids;
+    plain revisions fetch the single thread mbox.  Returns None on
+    failure or when offline.
+    """
+    revision = int(rev['revision'])
+    if rev.get('is_rethreaded'):
+        patches = get_series_patches(conn, change_id, revision)
+        if sum(1 for p in patches if p.get('position', 0) > 0) >= 2:
+            import b4.review as _b4_review
+
+            series_dict = {
+                'message_id': rev.get('message_id', ''),
+                'change_id': change_id,
+                'revision': revision,
+                'is_rethreaded': True,
+            }
+            try:
+                return _b4_review.retrieve_series_messages(series_dict, identifier)
+            except Exception as ex:
+                logger.debug(
+                    'Could not reassemble rethreaded v%d of %s: %s',
+                    revision,
+                    change_id,
+                    ex,
+                )
+                return None
+    message_id = str(rev.get('message_id') or '')
+    if not message_id:
+        return None
+    mbox_bytes = _fetch_thread_mbox_bytes(message_id)
+    if mbox_bytes is None:
+        return None
+    return b4.split_and_dedupe_pi_results(mbox_bytes)
+
+
+def _update_one_revision_count(
+    identifier: str,
+    conn: sqlite3.Connection,
+    topdir: Optional[str],
+    change_id: str,
+    rev: Dict[str, Any],
+    now: str,
+) -> Optional[bool]:
+    """Update message counts for a single non-tracked catalog revision.
+
+    Returns True when the database changed, False when there was nothing
+    new (zero writes, keeping the DB mtime stable), None on fetch failure.
+    """
+    revision = int(rev['revision'])
+
+    if rev.get('message_count') is None or not rev.get('last_update_check'):
+        # ── First fetch: full thread download ────────────────────────────
+        msgs = _fetch_revision_thread_msgs(identifier, conn, change_id, rev)
+        if not msgs:
+            return None
+        count = len(msgs)
+        conn.execute(
+            'UPDATE revisions SET message_count = ?, seen_message_count = ?,'
+            ' last_update_check = ?, last_activity_at = ?'
+            ' WHERE change_id = ? AND revision = ?',
+            (count, count, now, _latest_date_from_msgs(msgs), change_id, revision),
+        )
+        conn.commit()
+        if topdir:
+            _store_revision_thread_blob(conn, topdir, change_id, revision, msgs)
+        return True
+
+    # ── Incremental: query for messages since last check ─────────────────
+    # A rethreaded revision is N separate threads, one per patch — sum the
+    # per-thread queries.  A reply CC'd into several patch threads can be
+    # counted more than once; the next full refresh corrects the total.
+    msgids = [str(rev.get('message_id') or '')]
+    if rev.get('is_rethreaded'):
+        patches = get_series_patches(conn, change_id, revision)
+        patch_ids = [p['message_id'] for p in patches if p.get('position', 0) > 0]
+        if patch_ids:
+            msgids = patch_ids
+
+    new_count = 0
+    new_activity: Optional[str] = None
+    for msgid in msgids:
+        if not msgid:
+            continue
+        result = _fetch_new_since(msgid, str(rev['last_update_check']))
+        if result is None:
+            return None
+        count, activity = result
+        new_count += count
+        if activity and (new_activity is None or activity > new_activity):
+            new_activity = activity
+
+    if new_count == 0:
+        return False
+
+    if topdir:
+        # New mail arrived — refresh the cached blob and take the exact
+        # count from the full refetch rather than trusting the increment.
+        msgs = _fetch_revision_thread_msgs(identifier, conn, change_id, rev)
+        if msgs:
+            conn.execute(
+                'UPDATE revisions SET message_count = ?, last_update_check = ?,'
+                ' last_activity_at = COALESCE(?, last_activity_at)'
+                ' WHERE change_id = ? AND revision = ?',
+                (
+                    len(msgs),
+                    now,
+                    _latest_date_from_msgs(msgs),
+                    change_id,
+                    revision,
+                ),
+            )
+            conn.commit()
+            _store_revision_thread_blob(conn, topdir, change_id, revision, msgs)
+            return True
+
+    conn.execute(
+        'UPDATE revisions SET message_count = message_count + ?,'
+        ' last_update_check = ?,'
+        ' last_activity_at = COALESCE(?, last_activity_at)'
+        ' WHERE change_id = ? AND revision = ?',
+        (new_count, now, new_activity, change_id, revision),
+    )
+    conn.commit()
+    return True
+
+
+def update_revision_message_counts(
+    identifier: str,
+    series_list: List[Dict[str, Any]],
+    topdir: Optional[str] = None,
+    max_revisions_per_series: Optional[int] = None,
+) -> Dict[str, int]:
+    """Fetch and store thread message counts for non-tracked revisions.
+
+    The series machinery owns the tracked revision's counts; this covers
+    every *other* revision in the catalog so new mail landing on an old
+    version's thread is still noticed:
+
+    - **First fetch** (``message_count IS NULL``): downloads the full
+      thread and stores the count, with ``seen_message_count`` initialised
+      to the same value so no badge appears until *new* activity arrives.
+      When *topdir* is given the mbox is cached as a git blob.
+    - **Incremental**: queries for messages newer than
+      ``last_update_check``.  An empty response produces **zero database
+      writes**, keeping the DB mtime stable and suppressing spurious list
+      reloads in the TUI.  New mail bumps the count and refreshes the
+      cached blob.
+
+    Revisions are polled newest-first, optionally capped by
+    *max_revisions_per_series*.
+
+    Returns ``{'updated': n, 'errors': n}`` where *updated* counts
+    revisions whose counts actually changed.
+    """
+    updated = 0
+    errors = 0
+    skip_statuses = frozenset(('archived', 'accepted', 'thanked', 'snoozed'))
+    now = datetime.datetime.now(datetime.timezone.utc).isoformat()
+
+    try:
+        conn = get_db(identifier)
+    except FileNotFoundError:
+        return {'updated': 0, 'errors': 0}
+
+    for series in series_list:
+        if series.get('status') in skip_statuses:
+            continue
+        change_id = series.get('change_id', '')
+        if not change_id:
+            continue
+        tracked_rev = int(series.get('revision') or 1)
+
+        # A catalog row for the tracked revision is not guaranteed (manual
+        # linking can record only newer versions); backfill it so the
+        # revision keeps its counts once it stops being tracked.  Guarded
+        # by an existence check to keep quiet runs write-free.
+        if series.get('message_id'):
+            row = conn.execute(
+                'SELECT 1 FROM revisions WHERE change_id = ? AND revision = ?',
+                (change_id, tracked_rev),
+            ).fetchone()
+            if row is None:
+                add_revision(
+                    conn,
+                    change_id,
+                    tracked_rev,
+                    str(series['message_id']),
+                    subject=series.get('subject'),
+                    fingerprint=series.get('fingerprint'),
+                    is_rethreaded=bool(series.get('is_rethreaded')),
+                )
+
+        polled = 0
+        for rev in reversed(get_revisions(conn, change_id)):
+            if int(rev['revision']) == tracked_rev:
+                continue
+            if (
+                max_revisions_per_series is not None
+                and polled >= max_revisions_per_series
+            ):
+                break
+            polled += 1
+            result = _update_one_revision_count(
+                identifier, conn, topdir, change_id, rev, now
+            )
+            if result is None:
+                errors += 1
+            elif result:
+                updated += 1
+
+    conn.close()
+    return {'updated': updated, 'errors': errors}
+
+
 def mark_all_messages_seen(
     conn: sqlite3.Connection, change_id: str, revision: int
 ) -> None:
@@ -2435,49 +2786,92 @@ def mark_all_messages_seen(
     conn.commit()
 
 
-def sync_seen_from_unseen_count(
-    identifier: str, change_id: str, revision: int, unseen_count: int
-) -> bool:
-    """Sync seen_message_count so the unread badge matches the messages DB.
+def mark_all_revision_messages_seen(
+    conn: sqlite3.Connection, change_id: str, revision: int
+) -> None:
+    """Clear the unread delta on a catalog revision (revisions table)."""
+    conn.execute(
+        'UPDATE revisions SET seen_message_count = message_count'
+        ' WHERE change_id = ? AND revision = ? AND message_count IS NOT NULL',
+        (change_id, revision),
+    )
+    conn.commit()
 
-    Sets ``seen_message_count = message_count - unseen_count``, clamped
-    to [0, message_count].  Only writes when the value actually changes.
 
-    Returns True if the database was updated, False otherwise.
+def _row_guard(table: str) -> str:
+    """WHERE-clause suffix scoping series lookups to non-archived rows.
+
+    Archived series rows are upgrade leftovers; per-revision reads and
+    writes must resolve to the revisions catalog instead of them.
     """
-    try:
-        conn = get_db(identifier)
-    except FileNotFoundError:
-        return False
+    return " AND status != 'archived'" if table == 'series' else ''
+
 
+def _apply_seen_sync(
+    conn: sqlite3.Connection,
+    table: str,
+    change_id: str,
+    revision: int,
+    unseen_count: int,
+) -> Optional[bool]:
+    """Apply a seen-count sync against one table.
+
+    Returns None when no row matches (caller should try the next table),
+    False when nothing changed, True when the database was updated.
+    """
+    guard = _row_guard(table)
     row = conn.execute(
-        'SELECT message_count, seen_message_count FROM series'
-        ' WHERE change_id = ? AND revision = ?',
+        f'SELECT message_count, seen_message_count FROM {table}'
+        f' WHERE change_id = ? AND revision = ?{guard}',
         (change_id, revision),
     ).fetchone()
     if row is None:
-        conn.close()
-        return False
+        return None
 
     fc = row['message_count']
     if fc is None:
-        conn.close()
         return False
 
     new_seen = max(0, min(fc, fc - unseen_count))
     if new_seen == row['seen_message_count']:
-        conn.close()
         return False
 
     conn.execute(
-        'UPDATE series SET seen_message_count = ? WHERE change_id = ? AND revision = ?',
+        f'UPDATE {table} SET seen_message_count = ?'
+        f' WHERE change_id = ? AND revision = ?{guard}',
         (new_seen, change_id, revision),
     )
     conn.commit()
-    conn.close()
     return True
 
 
+def sync_seen_from_unseen_count(
+    identifier: str, change_id: str, revision: int, unseen_count: int
+) -> bool:
+    """Sync seen_message_count so the unread badge matches the messages DB.
+
+    Sets ``seen_message_count = message_count - unseen_count``, clamped
+    to [0, message_count].  Only writes when the value actually changes.
+
+    The series row (the tracked revision) is preferred; when the
+    (change_id, revision) pair is not actively tracked the sync applies
+    to the revisions catalog row instead, so viewing an old version's
+    thread keeps its badge accurate.
+
+    Returns True if the database was updated, False otherwise.
+    """
+    try:
+        conn = get_db(identifier)
+    except FileNotFoundError:
+        return False
+
+    result = _apply_seen_sync(conn, 'series', change_id, revision, unseen_count)
+    if result is None:
+        result = _apply_seen_sync(conn, 'revisions', change_id, revision, unseen_count)
+    conn.close()
+    return bool(result)
+
+
 def refresh_message_count(
     identifier: str, change_id: str, revision: int, total_messages: int
 ) -> bool:
@@ -2496,6 +2890,10 @@ def refresh_message_count(
     Only writes to the database when the count differs from the stored
     value, keeping the DB mtime stable when nothing changed.
 
+    The series row (the tracked revision) is preferred; when the
+    (change_id, revision) pair is not actively tracked the count applies
+    to the revisions catalog row instead.
+
     Returns True if the database was updated, False otherwise.
     """
     now = datetime.datetime.now(datetime.timezone.utc).isoformat()
@@ -2504,29 +2902,52 @@ def refresh_message_count(
     except FileNotFoundError:
         return False
 
+    result = _apply_message_count(
+        conn, 'series', change_id, revision, total_messages, now
+    )
+    if result is None:
+        result = _apply_message_count(
+            conn, 'revisions', change_id, revision, total_messages, now
+        )
+    conn.close()
+    return bool(result)
+
+
+def _apply_message_count(
+    conn: sqlite3.Connection,
+    table: str,
+    change_id: str,
+    revision: int,
+    total_messages: int,
+    now: str,
+) -> Optional[bool]:
+    """Apply a fresh total message count against one table.
+
+    Returns None when no row matches (caller should try the next table),
+    False when nothing changed, True when the database was updated.
+    """
+    guard = _row_guard(table)
     row = conn.execute(
-        'SELECT message_count, seen_message_count FROM series'
-        ' WHERE change_id = ? AND revision = ?',
+        f'SELECT message_count, seen_message_count FROM {table}'
+        f' WHERE change_id = ? AND revision = ?{guard}',
         (change_id, revision),
     ).fetchone()
     if row is None:
-        conn.close()
-        return False
+        return None
 
     count = total_messages
     old_count = row['message_count']
 
     if old_count is not None and count == old_count:
         # Nothing changed — skip the write to keep the DB mtime stable.
-        conn.close()
         return False
 
     if old_count is None:
         # First fetch: initialise both counts equally (no badge).
         conn.execute(
-            'UPDATE series SET message_count = ?, seen_message_count = ?,'
-            '  last_update_check = ?'
-            ' WHERE change_id = ? AND revision = ?',
+            f'UPDATE {table} SET message_count = ?, seen_message_count = ?,'
+            f'  last_update_check = ?'
+            f' WHERE change_id = ? AND revision = ?{guard}',
             (count, count, now, change_id, revision),
         )
     else:
@@ -2535,20 +2956,19 @@ def refresh_message_count(
         seen = row['seen_message_count']
         if seen is not None and seen > count:
             conn.execute(
-                'UPDATE series SET message_count = ?, seen_message_count = ?,'
-                '  last_update_check = ?'
-                ' WHERE change_id = ? AND revision = ?',
+                f'UPDATE {table} SET message_count = ?, seen_message_count = ?,'
+                f'  last_update_check = ?'
+                f' WHERE change_id = ? AND revision = ?{guard}',
                 (count, count, now, change_id, revision),
             )
         else:
             conn.execute(
-                'UPDATE series SET message_count = ?, last_update_check = ?'
-                ' WHERE change_id = ? AND revision = ?',
+                f'UPDATE {table} SET message_count = ?, last_update_check = ?'
+                f' WHERE change_id = ? AND revision = ?{guard}',
                 (count, now, change_id, revision),
             )
 
     conn.commit()
-    conn.close()
     return True
 
 

-- 
2.53.0

