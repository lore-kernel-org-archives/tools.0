Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2B636D517
	for <tools@linux.kernel.org>; Wed, 12 Aug 2026 21:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786571245; cv=none; b=RkIY4g26EpExqWMwcgRpdNkT/lEDHujQd11EaQCOXaeB5cr50dv4bBzHp9w8r5o3+6a1eQ/9cVv8LOBTElcxZFHP0HxhtUrEofrBbV3jfVYddgMqgP+tB57FGbyJqt/gGeC0fM7CJPNuWeb75/0iNVm55G9K+2048Z29UlxFQ74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786571245; c=relaxed/simple;
	bh=wEWX5VCkOGTvG751vvD2nwL/vBmuicRZHlaZTaMsTkA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XaDsRmEcIFet3mAwkKkeKuciMEyM4I70lMIcwx84Tdja/nfjo68zgIBbrzuAXfHnMHlCzqZ4hVSJv0sjBjXqHMXR1j8cuWO0r/MT0tEwyjKKoXZx4hhs4O/8cEEYTqd0g+SxPgOlMo8GkaR3txU2wM1p4WUM7OAb7yWQtuZvNTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fSNwQ4g7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fSNwQ4g7"
Received: by smtp.kernel.org (Postfix)
	id 77B401F00A3A; Wed, 12 Aug 2026 21:47:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 614FA1F000E9;
	Wed, 12 Aug 2026 21:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786571240;
	bh=6MXpV3a5aD15NzFgRvfpsMbTCu+3bbP6rfOEIwNYUgk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=fSNwQ4g7iOQy7+cJNLki1clQIcQ8X+Di6z/hLQM/SnX8ZwTZdY79SaleeawMdpnlu
	 xyxP0k1FTGc6zjp4IFSYY9PbI2gCTGLgnoYdOtrz3xaDZYYBgA4ObasSTlKCX+2BR4
	 r1BBnPNSF6+kBycSaKtzuCheMjo9YK2gZt5+c3OXW1s1uqSP5ZXI64eJ0eeG7Df6o8
	 g3rRSGDUgf9u0Qex2KQBE71z1AvMhN0vGCXr6rIY5HTX1QWsYCYeqNyUSEkrqyVCDz
	 75+LkaF8gVfjCLHDmVkyXxT+d7mFO5U/DkA0FMuZy7S+yewE/S4FBnhzMjc70HCa0I
	 EdjgahhjdYXFg==
From: Christian Brauner <brauner@kernel.org>
Date: Wed, 12 Aug 2026 23:46:50 +0200
Subject: [PATCH RFC v2 09/25] review: track message counts for all
 revisions of a series
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260812-work-b4-multiver-rows-v2-9-305d53cd723a@kernel.org>
References: <20260812-work-b4-multiver-rows-v2-0-305d53cd723a@kernel.org>
In-Reply-To: <20260812-work-b4-multiver-rows-v2-0-305d53cd723a@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.17-dev-362b8
X-Developer-Signature: v=1; a=openpgp-sha256; l=93701; i=brauner@kernel.org;
 h=from:subject:message-id; bh=wEWX5VCkOGTvG751vvD2nwL/vBmuicRZHlaZTaMsTkA=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTVvLwVYOzf2eflzLTeptjPwcGr57CZaNm6mf7PA9bMV
 1GR0THqKGVhEONikBVTZHFoNwmXW85TsdkoUwNmDisTyBAGLk4BmEjXZkaG93kFk29Nux9xytDT
 6dTp1LR12zSjn6y5zvFpGh9nIit7EyPDI2+/j57LTX9t2vrM6I1KuMqBV4ES2hszZYPsjjRsecH
 MDgA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

The series table only carries message counts for the tracked revision, so
new mail landing on an older version's thread is invisible.

Move per-revision read state onto the revisions catalog and leave it
there.  message_count, seen_message_count, last_update_check and
last_mail_at become catalog columns (schema v11, backfilled from series
rows including archived upgrade leftovers) and the series copies are
dropped, so no reader has to know which of two copies wins.

Add update_revision_message_counts(), a per-revision poller.  It works
least-recently-checked first, writes counts only when the thread actually
moved, reassembles rethreaded revisions from their per-patch threads, and
caches the thread mbox as a git blob.  The stitched series a range-diff
needs is a different artifact for any version posted with broken
threading, so it gets its own column beside that one.

The poller fetches and counts each thread rather than asking the archive
what is new since it last looked.  public-inbox has no thread-scoped
search, and its only date-range query runs against the whole inbox, which
costs more than the thread it would be probing.  Comparing the fresh
count against the stored one is correct on any public-inbox host.  A
quiet poll still records that it looked, since the rotation is ordered by
that stamp and a column meaning "last changed" would pin the cap to
whichever revisions keep changing.

refresh_message_count() and sync_seen_from_unseen_count() write the
revision's catalog row whether or not a series currently tracks it, so
the thread viewer's badge sync works for any revision.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/review/_review.py           |    5 +-
 src/b4/review/tracking.py          | 1475 ++++++++++++++++++++++++++++++------
 src/b4/review_tui/_tracking_app.py |   37 +-
 src/tests/test_review_tracking.py  |   37 +-
 src/tests/test_tui_tracking.py     |   20 +-
 5 files changed, 1326 insertions(+), 248 deletions(-)

diff --git a/src/b4/review/_review.py b/src/b4/review/_review.py
index 98f51363..f566dbfd 100644
--- a/src/b4/review/_review.py
+++ b/src/b4/review/_review.py
@@ -2470,7 +2470,10 @@ def update_series_tracking(
             _known = set()
 
         msgs = b4.mbox.get_extra_series(msgs, direction=1, nocache=True)
-        if current_rev > 1 and not _known:
+        # Discount the tracked revision's own entry.  The v11 backfill gives
+        # every series row one, so a plain "is the catalog empty?" test is
+        # never true again and this one-shot search stopped running at all.
+        if current_rev > 1 and not (_known - {current_rev}):
             msgs = b4.mbox.get_extra_series(
                 msgs, direction=-1, wantvers=list(range(1, current_rev)), nocache=True
             )
diff --git a/src/b4/review/tracking.py b/src/b4/review/tracking.py
index cecfdb9c..7d42b160 100644
--- a/src/b4/review/tracking.py
+++ b/src/b4/review/tracking.py
@@ -15,7 +15,7 @@ import signal
 import sqlite3
 import sys
 import types
-from typing import Any, Dict, List, Optional, Set, Tuple
+from typing import Any, Callable, Dict, List, Optional, Set, Tuple
 
 import b4
 import b4.mbox
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
@@ -59,16 +54,33 @@ CREATE TABLE IF NOT EXISTS series (
     status TEXT DEFAULT 'new',
     fingerprint TEXT,
     branch_sha TEXT,
-    message_count INT,
-    seen_message_count INT,
-    last_update_check TEXT,
+    -- Per-revision read state (message_count, seen_message_count,
+    -- last_update_check) lives on `revisions` and only there: a series row
+    -- names which revision it tracks, and that revision's catalog row
+    -- answers "how much mail, how much of it read, checked when".  Keeping
+    -- a second copy here is what made every reader restate a COALESCE.
+    --
+    -- last_activity_at stays, and is NOT the catalog's last_mail_at.  It is
+    -- a union stamp -- "when did anything last happen to this series",
+    -- maintainer actions and new mail on the tracked revision alike (see
+    -- _touch_last_mail) -- while last_mail_at is the newest Date: header in
+    -- one specific version's thread, and nothing else.
     last_activity_at TEXT,
     snoozed_until TEXT,
     attestation TEXT DEFAULT 'pending',
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
@@ -77,14 +89,32 @@ CREATE TABLE IF NOT EXISTS revisions (
     subject     TEXT,
     link        TEXT,
     found_at    TEXT,
+    -- This version's thread as last fetched: the snapshot a poll counted
+    -- and the baseline for "which messages are new".  Freshest wins.
     thread_blob TEXT,
     fingerprint TEXT,
     source      TEXT DEFAULT 'heuristic',
     is_rethreaded INTEGER DEFAULT 0,
+    message_count INT,
+    seen_message_count INT,
+    last_update_check TEXT,
+    -- Newest Date: header in this version's thread.  Deliberately not
+    -- `last_activity_at`: series.last_activity_at is a maintainer-action
+    -- stamp, and one name over two facts is what forced readers to pick a
+    -- direction per column.
+    last_mail_at TEXT,
+    -- The same version as a *series*, stitched by the get_extra_series()
+    -- passes a range-diff runs.  A separate column because it answers a
+    -- different question -- "all the patches", not "all the mail" -- and
+    -- the two disagree exactly when a version was posted with broken
+    -- threading.  Written only when the thread alone will not do, and
+    -- dropped when the thread changes underneath it.
+    series_blob TEXT,
     PRIMARY KEY (change_id, revision)
 );
 
 CREATE INDEX IF NOT EXISTS idx_revisions_fingerprint ON revisions(fingerprint);
+CREATE INDEX IF NOT EXISTS idx_revisions_message_id ON revisions(message_id);
 
 """
     + SERIES_PATCHES_DDL
@@ -233,6 +263,103 @@ def _run_migrations(conn: sqlite3.Connection) -> None:
             conn.execute(
                 'ALTER TABLE revisions ADD COLUMN is_rethreaded INTEGER DEFAULT 0'
             )
+    if version < 11:
+        # Per-revision read state moves onto the revisions catalog, which
+        # becomes its only home: the series table covers the tracked
+        # revision alone, so non-tracked versions had nowhere to keep a
+        # message count or a poll watermark.  The three columns are dropped
+        # from `series` at the end of this block rather than kept in step,
+        # so no reader has to know which copy wins.
+        conn.execute(SERIES_DDL)
+        existing = {row[1] for row in conn.execute('PRAGMA table_info(revisions)')}
+        for coldef in (
+            'message_count INT',
+            'seen_message_count INT',
+            'last_update_check TEXT',
+            'last_mail_at TEXT',
+            'series_blob TEXT',
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
+        # last_mail_at is deliberately not seeded from series.last_activity_at:
+        # that column also records maintainer actions, so seeding it would
+        # date a version's thread from the last time someone snoozed the
+        # series.  Left NULL until a poll reads a real Date: header.
+        if needed <= series_cols:
+            # Every tracked series (archived rows included) needs a catalog
+            # row so its per-revision counts have somewhere to live.
+            conn.execute(
+                'INSERT OR IGNORE INTO revisions'
+                ' (change_id, revision, message_id, subject, found_at,'
+                '  fingerprint, source, is_rethreaded,'
+                '  message_count, seen_message_count, last_update_check)'
+                ' SELECT change_id, revision, message_id, subject,'
+                "  COALESCE(sent_at, added_at), fingerprint, 'heuristic',"
+                '  COALESCE(is_rethreaded, 0),'
+                '  message_count, seen_message_count, last_update_check'
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
+                '   AND s.revision = revisions.revision)'
+                ' WHERE message_count IS NULL AND EXISTS (SELECT 1 FROM series s'
+                '  WHERE s.change_id = revisions.change_id'
+                '  AND s.revision = revisions.revision)'
+            )
+            # Now that the catalog holds them, retire the series copies.
+            # Two owners is what this schema bump exists to end, and a
+            # column left behind invites the next writer to keep it warm.
+            # Inside the backfill guard on purpose: dropping a copy that
+            # was never carried across would just lose it.
+            #
+            # DROP COLUMN wants sqlite 3.35 (2021).  On anything older the
+            # columns simply stay, unread by everything below -- dead
+            # weight in the row, not a correctness problem, and not worth
+            # a twelve-step table rebuild to reclaim.
+            for col in (
+                'message_count',
+                'seen_message_count',
+                'last_update_check',
+            ):
+                try:
+                    conn.execute(f'ALTER TABLE series DROP COLUMN {col}')
+                except sqlite3.OperationalError as ex:
+                    logger.debug('Could not drop series.%s: %s', col, ex)
+        # Matching a posting by message-id became a hot lookup at v11 --
+        # [l], [o] and the conflict check all run it -- and it was a full
+        # table scan, unlike its fingerprint twin.
+        conn.execute(
+            'CREATE INDEX IF NOT EXISTS idx_revisions_message_id'
+            ' ON revisions(message_id)'
+        )
     # Not an UPDATE: `version` is the primary key, so an UPDATE writes
     # nothing at all against an empty table -- and the read above maps "no
     # row" to version 0, so such a database would re-run the whole ladder
@@ -491,13 +618,18 @@ def add_series_to_db(
 ) -> int:
     """Add a series to the tracking database. Returns the track_id.
 
+    The tracked revision is catalogued as part of adding the series: read
+    state lives on `revisions` and only there, so a series row without a
+    catalog entry has nowhere to keep a message count, and the first
+    writer's UPDATE would match no row and drop the number on the floor.
+
     On conflict the identity fields converge instead of overwriting: a
     caller that does not know the Patchwork id or the fingerprint leaves
-    an existing one in place.  Re-adds come from callers that never
-    learned those fields -- the Patchwork tracker attaching its id,
+    an existing one in place, and ``is_rethreaded`` is sticky, matching
+    the catalog's :func:`add_revision`.  Re-adds come from callers that
+    never learned those fields -- the Patchwork tracker attaching its id,
     rescan_branches replaying a branch -- and each used to wipe whatever
-    the others had recorded.  ``is_rethreaded`` is sticky for the same
-    reason, matching the catalog's :func:`add_revision`.
+    the others had recorded.
 
     ``is_rethreaded`` describes the posting, so the catalog's answer for
     this revision wins over the argument on the way in.  The argument is
@@ -549,6 +681,7 @@ def add_series_to_db(
         ),
     )
     track_id = cursor.fetchone()[0]
+    _ensure_catalog_row(conn, change_id, revision)
     conn.commit()
     return int(track_id)
 
@@ -958,19 +1091,31 @@ def get_all_tracked_series(identifier: str) -> list[dict[str, Any]]:
 
     Returns a list of dicts with keys: track_id, change_id, revision, subject,
     sender_name, sender_email, sent_at, added_at, status, num_patches,
-    message_id, pw_series_id, message_count, seen_message_count.
+    message_id, pw_series_id, message_count, seen_message_count,
+    last_activity_at, attestation, target_branch, is_rethreaded,
+    snoozed_until, fingerprint, last_update_check, last_mail_at.
+
+    The counts come from the tracked revision's catalog row, which is the
+    only place they are kept.  ``last_activity_at`` is the series' own
+    column and means something else -- when the maintainer last acted on
+    it -- so it is read straight off `series`; the tracked version's newest
+    mail is ``last_mail_at``, beside the counts.
     """
     if not db_exists(identifier):
         return []
     try:
         conn = get_db(identifier)
         cursor = conn.execute("""
-            SELECT track_id, change_id, revision, subject, sender_name, sender_email,
-                   sent_at, added_at, status, num_patches, message_id, pw_series_id,
-                   message_count, seen_message_count, last_activity_at, attestation,
-                   target_branch, is_rethreaded, snoozed_until
-            FROM series
-            ORDER BY added_at DESC
+            SELECT s.track_id, s.change_id, s.revision, s.subject, s.sender_name,
+                   s.sender_email, s.sent_at, s.added_at, s.status, s.num_patches,
+                   s.message_id, s.pw_series_id,
+                   r.message_count, r.seen_message_count,
+                   s.last_activity_at, s.attestation,
+                   s.target_branch, s.is_rethreaded, s.snoozed_until, s.fingerprint,
+                   r.last_update_check, r.last_mail_at
+            FROM series s LEFT JOIN revisions r
+              ON r.change_id = s.change_id AND r.revision = s.revision
+            ORDER BY s.added_at DESC
         """)
         result = []
         for row in cursor.fetchall():
@@ -995,6 +1140,9 @@ def get_all_tracked_series(identifier: str) -> list[dict[str, Any]]:
                     'target_branch': row[16],
                     'is_rethreaded': bool(row[17]),
                     'snoozed_until': row[18],
+                    'fingerprint': row[19],
+                    'last_update_check': row[20],
+                    'last_mail_at': row[21],
                 }
             )
         conn.close()
@@ -1024,9 +1172,19 @@ def add_revision(
     source: str = 'heuristic',
     is_rethreaded: bool = False,
     subject_from_cover: bool = False,
+    found_at: Optional[str] = None,
 ) -> None:
     """Insert a revision record, ignoring core fields if already present.
 
+    *found_at* defaults to now, which is right for a revision discovered
+    on the wire but wrong for one being backfilled as it is retired — the
+    oldest version would then carry the newest date.  Callers that know
+    when the revision actually arrived pass it, so the column reads as
+    "when this revision was posted, as accurately as we know" rather than
+    "when b4 first saw it"; rows written before that distinction existed
+    still hold the discovery timestamp, which for a version found by the
+    forward search is within a sweep interval of the posting anyway.
+
     The core fields (message_id, subject, link, found_at) follow first-wins
     semantics — re-adding an existing revision leaves them untouched.  Four
     fields are reconciled on re-add, however:
@@ -1042,7 +1200,8 @@ def add_revision(
       first-patch fallback recorded before the cover was seen (bug 8bb6e4c),
       unless the stored row's provenance outranks the incoming one.
     """
-    found_at = datetime.datetime.now(datetime.timezone.utc).isoformat()
+    if not found_at:
+        found_at = datetime.datetime.now(datetime.timezone.utc).isoformat()
     conn.execute(
         """INSERT OR IGNORE INTO revisions
         (change_id, revision, message_id, subject, link, found_at,
@@ -1103,17 +1262,51 @@ def add_revision(
 
 def set_revision_thread_blob(
     conn: sqlite3.Connection, change_id: str, revision: int, blob_sha: str
-) -> None:
+) -> bool:
     """Record the git blob SHA of the cached mbox thread for a revision.
 
     The blob may later become unreachable (GC'd), so callers that read this
     value must tolerate a missing blob and fall back to a lore fetch.
+
+    Returns False when the catalog has no row for this revision -- the
+    tracked revision is not guaranteed one, so a caller handed a
+    synthesized entry would otherwise take a no-op for a stored blob and
+    refetch on every call.
+
+    A different thread drops any stitched ``series_blob`` built from the
+    old one: the patch that made the version unstitchable may have just
+    landed, and re-running the stitch once per thread change is the whole
+    cost of finding out.  Only an identical SHA -- and the blob is
+    content-addressed, so that means an identical thread -- keeps it, which
+    is what stops a quiet sweep from throwing the stitch away.
     """
-    conn.execute(
-        'UPDATE revisions SET thread_blob = ? WHERE change_id = ? AND revision = ?',
+    cursor = conn.execute(
+        'UPDATE revisions SET thread_blob = ?,'
+        ' series_blob = CASE WHEN thread_blob IS NULL OR thread_blob = ?'
+        '  THEN series_blob END'
+        ' WHERE change_id = ? AND revision = ?',
+        (blob_sha, blob_sha, change_id, revision),
+    )
+    conn.commit()
+    return cursor.rowcount > 0
+
+
+def set_revision_series_blob(
+    conn: sqlite3.Connection, change_id: str, revision: int, blob_sha: str
+) -> bool:
+    """Record the git blob SHA of a revision's stitched series mbox.
+
+    The counterpart of :func:`set_revision_thread_blob` for the *series*
+    view of a version: what the get_extra_series() passes reassembled, kept
+    because a thread that does not hold the whole series cannot be made to
+    yield one however often it is re-read.  Same GC caveat.
+    """
+    cursor = conn.execute(
+        'UPDATE revisions SET series_blob = ? WHERE change_id = ? AND revision = ?',
         (blob_sha, change_id, revision),
     )
     conn.commit()
+    return cursor.rowcount > 0
 
 
 def add_series_patches(
@@ -1181,6 +1374,12 @@ def build_known_revisions(
             entry['fingerprint'] = r['fingerprint']
         if r.get('source'):
             entry['source'] = r['source']
+        # Carried so a catalog rebuilt from the branch keeps each version's
+        # posting date.  Without it add_revision() defaults every replayed
+        # row to now(), and the oldest version comes back dated newest --
+        # exactly what the found_at parameter exists to prevent.
+        if r.get('found_at'):
+            entry['found-at'] = r['found_at']
         if r.get('is_rethreaded'):
             entry['is-rethreaded'] = True
             entry['patches'] = [
@@ -1225,6 +1424,7 @@ def record_known_revisions(
             fingerprint=entry.get('fingerprint'),
             source=entry.get('source') or 'heuristic',
             is_rethreaded=is_rethreaded,
+            found_at=entry.get('found-at'),
         )
         patches = entry.get('patches') or []
         if is_rethreaded and patches:
@@ -1302,21 +1502,34 @@ _REVISION_COLS = (
     'link',
     'found_at',
     'thread_blob',
+    'series_blob',
     'fingerprint',
     'source',
     'is_rethreaded',
+    'message_count',
+    'seen_message_count',
+    'last_update_check',
+    'last_mail_at',
 )
 
+# No join and no COALESCE: every column below is owned by `revisions` and
+# stored nowhere else, so there is no second copy to prefer, no archived
+# series row to exclude, and no per-column direction to remember.
+# (`series.is_rethreaded` is the one field still denormalized; see
+# update_series_revision, which re-reads it from the catalog.)
 _REVISION_SELECT = (
-    'SELECT change_id, revision, message_id, subject, link, found_at,'
-    ' thread_blob, fingerprint, source, is_rethreaded FROM revisions'
+    'SELECT r.change_id, r.revision, r.message_id, r.subject, r.link,'
+    ' r.found_at, r.thread_blob, r.series_blob, r.fingerprint, r.source,'
+    ' r.is_rethreaded, r.message_count, r.seen_message_count,'
+    ' r.last_update_check, r.last_mail_at'
+    ' FROM revisions r'
 )
 
 
 def get_revisions(conn: sqlite3.Connection, change_id: str) -> list[dict[str, Any]]:
     """Return all known revisions for a change_id, ordered ascending."""
     cursor = conn.execute(
-        _REVISION_SELECT + ' WHERE change_id = ? ORDER BY revision ASC',
+        _REVISION_SELECT + ' WHERE r.change_id = ? ORDER BY r.revision ASC',
         (change_id,),
     )
     return [dict(zip(_REVISION_COLS, row)) for row in cursor.fetchall()]
@@ -1334,7 +1547,7 @@ def find_revision_by_fingerprint(
     if not fingerprint:
         return None
     row = conn.execute(
-        _REVISION_SELECT + ' WHERE fingerprint = ? LIMIT 1',
+        _REVISION_SELECT + ' WHERE r.fingerprint = ? ORDER BY r.change_id LIMIT 1',
         (fingerprint,),
     ).fetchone()
     if row is None:
@@ -1513,27 +1726,55 @@ def absorb_series_as_revision(
     into_change_id: str,
     stray_change_id: str,
     revision: int,
+    stray_revision: Optional[int] = None,
 ) -> bool:
     """Re-home a stray stand-alone series as a revision of another change_id.
 
     When a posting is independently tracked under its own ``stray_change_id``
     but is really revision *revision* of ``into_change_id`` (e.g. a v-bump
     auto-discovery failed to connect), fold it in: record it as a manually
-    linked revision, copy its patches, and delete the stray series wholesale
-    (its ``series``, ``revisions``, and ``series_patches`` rows).
+    linked revision, copy its patches, and delete the stray's rows for the
+    absorbed revision.  The stray's *other* versions are left alone while a
+    series row still tracks them -- a stray tracked at v1, v2 and v3 that is
+    linked at v2 keeps v1 and v3.  Once its last series row is gone, its
+    ``revisions``/``series_patches`` leftovers are re-homed under the target
+    rather than dropped: they are postings of this same series, and their
+    per-patch message-ids cannot be re-derived from the mailing list (see
+    :func:`build_known_revisions`).
+
+    *stray_revision* names which of the stray's revisions is the one being
+    absorbed.  Callers that matched a specific revision (by fingerprint,
+    say) must pass it: a stray tracked across several versions otherwise
+    contributes whichever row the database happens to return first, and
+    the absorbed revision arrives carrying another version's message-id
+    and counts.  A catalog row is enough on its own: an upgraded stray keeps
+    the version it left behind in the catalog with no series row, and
+    refusing that would fall through to a duplicate record of the same
+    message-id under two change_ids.
 
     The target's other revisions are left untouched.  Returns True if a stray
-    series was absorbed, or False if none existed (making the call a safe
-    no-op, including when invoked a second time).
+    revision was absorbed, or False if none existed (making the call a safe
+    no-op, including when invoked a second time).  Callers must act on the
+    return: a False means the revision is still unrecorded.
     """
-    srow = conn.execute(
-        'SELECT revision, subject, message_id, fingerprint, is_rethreaded FROM series'
-        ' WHERE change_id = ?',
-        (stray_change_id,),
-    ).fetchone()
-    if srow is None:
+    if stray_revision is not None:
+        stray_rev: Optional[int] = int(stray_revision)
+        srow = conn.execute(
+            'SELECT revision, subject, message_id, fingerprint, is_rethreaded'
+            ' FROM series WHERE change_id = ? AND revision = ?',
+            (stray_change_id, stray_rev),
+        ).fetchone()
+    else:
+        srow = conn.execute(
+            'SELECT revision, subject, message_id, fingerprint, is_rethreaded'
+            ' FROM series WHERE change_id = ?'
+            # Deterministic, and live rows before upgrade leftovers.
+            " ORDER BY COALESCE(status, 'new') = 'archived', revision DESC",
+            (stray_change_id,),
+        ).fetchone()
+        stray_rev = srow[0] if srow is not None else None
+    if stray_rev is None:
         return False
-    stray_rev = srow[0]
 
     # Prefer the per-revision record for link/fingerprint, falling back to the
     # series row when the stray was never recorded in the revisions table.
@@ -1545,13 +1786,15 @@ def absorb_series_as_revision(
     # Treat the stray as rethreaded if either its series row or its
     # per-revision record says so — both are set when tracked via --rethread,
     # but be defensive about a partially-populated stray.
-    series_rt = bool(srow[4])
+    series_rt = bool(srow[4]) if srow is not None else False
     if rrow is not None:
         message_id, subject, link, fingerprint = rrow[0], rrow[1], rrow[2], rrow[3]
         is_rethreaded = bool(rrow[4]) or series_rt
-    else:
+    elif srow is not None:
         message_id, subject, link, fingerprint = srow[2], srow[1], None, srow[3]
         is_rethreaded = series_rt
+    else:
+        return False
 
     add_revision(
         conn,
@@ -1565,6 +1808,46 @@ def absorb_series_as_revision(
         is_rethreaded=is_rethreaded,
     )
 
+    # Read state follows the posting across change_ids -- the stray's rows
+    # are deleted below.  Still a copy, because this is the one move that
+    # is not a series row changing which revision it points at: the same
+    # posting is being re-filed under a different change_id, so its counts
+    # have to come along.  Merged, not gated on the target being blank: the
+    # forward sweep may have catalogued the same posting under the target
+    # and first-fetched it to seen = count, and skipping the copy then
+    # deletes the stray's real read state with the stray -- unread mail
+    # rendered read.  The totals take the larger side (never downgrade),
+    # the seen counts the smaller (never lose a badge), the stamps the
+    # newer; NULLs lose to values on every column.
+    conn.execute(
+        'UPDATE revisions SET'
+        '  message_count = MAX(COALESCE((SELECT message_count FROM revisions'
+        '   WHERE change_id = :scid AND revision = :srev), message_count),'
+        '   COALESCE(message_count, (SELECT message_count FROM revisions'
+        '   WHERE change_id = :scid AND revision = :srev))),'
+        '  seen_message_count = MIN(COALESCE((SELECT seen_message_count'
+        '   FROM revisions WHERE change_id = :scid AND revision = :srev),'
+        '   seen_message_count),'
+        '   COALESCE(seen_message_count, (SELECT seen_message_count'
+        '   FROM revisions WHERE change_id = :scid AND revision = :srev))),'
+        '  last_update_check = MAX(COALESCE((SELECT last_update_check'
+        '   FROM revisions WHERE change_id = :scid AND revision = :srev),'
+        '   last_update_check),'
+        '   COALESCE(last_update_check, (SELECT last_update_check'
+        '   FROM revisions WHERE change_id = :scid AND revision = :srev))),'
+        '  last_mail_at = MAX(COALESCE((SELECT last_mail_at FROM revisions'
+        '   WHERE change_id = :scid AND revision = :srev), last_mail_at),'
+        '   COALESCE(last_mail_at, (SELECT last_mail_at FROM revisions'
+        '   WHERE change_id = :scid AND revision = :srev)))'
+        ' WHERE change_id = :icid AND revision = :irev',
+        {
+            'scid': stray_change_id,
+            'srev': stray_rev,
+            'icid': into_change_id,
+            'irev': revision,
+        },
+    )
+
     # Copy the stray's patches onto the target revision, replacing any present.
     conn.execute(
         'DELETE FROM series_patches WHERE change_id = ? AND revision = ?',
@@ -1577,10 +1860,68 @@ def absorb_series_as_revision(
         (into_change_id, revision, stray_change_id, stray_rev),
     )
 
-    # Remove the stray series entirely.
-    conn.execute('DELETE FROM series WHERE change_id = ?', (stray_change_id,))
-    conn.execute('DELETE FROM revisions WHERE change_id = ?', (stray_change_id,))
-    conn.execute('DELETE FROM series_patches WHERE change_id = ?', (stray_change_id,))
+    # Remove only the absorbed revision: the stray's other versions are
+    # postings in their own right, and their per-patch message-ids are
+    # unrecoverable once dropped.
+    for table in ('series', 'revisions', 'series_patches'):
+        conn.execute(
+            f'DELETE FROM {table} WHERE change_id = ? AND revision = ?',
+            (stray_change_id, stray_rev),
+        )
+    remaining = conn.execute(
+        'SELECT COUNT(*) FROM series WHERE change_id = ?', (stray_change_id,)
+    ).fetchone()[0]
+    if not remaining:
+        # Last series row absorbed, so the stray's change_id is about to
+        # become unreachable -- but its other catalogued versions are
+        # postings of this same series, and a rethreaded one's per-patch
+        # message-ids cannot be re-derived from the list.  Re-home them
+        # under the target; a version the target already catalogs keeps
+        # the target's row, rescuing only a patch list the target lacks.
+        for (v,) in conn.execute(
+            'SELECT revision FROM revisions WHERE change_id = ?',
+            (stray_change_id,),
+        ).fetchall():
+            claimed = conn.execute(
+                'SELECT 1 FROM revisions WHERE change_id = ? AND revision = ?',
+                (into_change_id, v),
+            ).fetchone()
+            has_patches = conn.execute(
+                'SELECT 1 FROM series_patches WHERE change_id = ? AND revision = ?'
+                ' LIMIT 1',
+                (into_change_id, v),
+            ).fetchone()
+            if claimed is None:
+                conn.execute(
+                    'UPDATE revisions SET change_id = ?'
+                    ' WHERE change_id = ? AND revision = ?',
+                    (into_change_id, stray_change_id, v),
+                )
+            if has_patches is None:
+                moved = conn.execute(
+                    'UPDATE series_patches SET change_id = ?'
+                    ' WHERE change_id = ? AND revision = ?',
+                    (into_change_id, stray_change_id, v),
+                )
+                if claimed is not None and moved.rowcount:
+                    # A rescued patch list is only ever read behind the
+                    # rethread flag, so a rethreaded stray's flag comes
+                    # with it onto the row the target kept.
+                    rt = conn.execute(
+                        'SELECT is_rethreaded FROM revisions'
+                        ' WHERE change_id = ? AND revision = ?',
+                        (stray_change_id, v),
+                    ).fetchone()
+                    if rt is not None and rt[0]:
+                        conn.execute(
+                            'UPDATE revisions SET is_rethreaded = 1'
+                            ' WHERE change_id = ? AND revision = ?',
+                            (into_change_id, v),
+                        )
+        conn.execute('DELETE FROM revisions WHERE change_id = ?', (stray_change_id,))
+        conn.execute(
+            'DELETE FROM series_patches WHERE change_id = ?', (stray_change_id,)
+        )
     conn.commit()
     return True
 
@@ -1674,7 +2015,13 @@ def record_linked_revision(
     fingerprint = lser.fingerprint
     stray = find_revision_by_fingerprint(conn, fingerprint)
     if stray is not None and stray['change_id'] != change_id:
-        absorb_series_as_revision(conn, change_id, stray['change_id'], revision)
+        absorb_series_as_revision(
+            conn,
+            change_id,
+            stray['change_id'],
+            revision,
+            stray_revision=stray.get('revision'),
+        )
         result['absorbed'] = True
     else:
         message_id = ref_msg.msgid
@@ -1802,23 +2149,11 @@ def get_all_revisions_grouped(
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
 
 
@@ -1852,6 +2187,10 @@ def update_series_status(
 
     Always stamps last_activity_at with the current UTC time so that
     within-group sort reflects maintainer activity as well as thread activity.
+
+    Archiving needs no count bookkeeping: read state was never on this row
+    to begin with, so the revision an archived series leaves behind still
+    owns its own counts and unread badge.
     """
     now = datetime.datetime.now(datetime.timezone.utc).isoformat()
     if revision is not None:
@@ -1880,27 +2219,61 @@ def update_series_revision(
 
     Used when a not-yet-checked-out series should track a different
     revision without going through the full review checkout flow.
-    Updates the revision, message_id, and optionally subject columns.
-    Resets message_count and seen_message_count so the next update
-    fetches fresh counts for the new revision's thread.
+
+    Nothing is parked and nothing is cleared: read state belongs to the
+    revisions, not to this row, so the version being left behind keeps its
+    counts, its watermark and its unread badge simply by not being touched,
+    and the incoming one arrives with whatever the poller has already
+    learned about it.  ``is_rethreaded`` is re-read from the catalog for the
+    incoming revision, since it describes a posting rather than the series.
+
+    Both revisions are catalogued: the outgoing one because its read state
+    has nowhere else to live once this row stops naming it, the incoming
+    one because that is the rule every path pointing a series row at a
+    revision follows -- callers happen to pick the target out of the
+    catalog today, which is not something this function can require.
     """
     now = datetime.datetime.now(datetime.timezone.utc).isoformat()
+    _ensure_catalog_row(conn, change_id, old_revision)
+
+    rethreaded = 'COALESCE((SELECT is_rethreaded FROM revisions'
+    rethreaded += ' WHERE change_id = ? AND revision = ?), 0)'
     if new_subject is not None:
         conn.execute(
             'UPDATE series SET revision = ?, message_id = ?, subject = ?,'
-            ' message_count = NULL, seen_message_count = NULL,'
-            ' last_activity_at = ?'
+            ' last_activity_at = ?,'
+            f' is_rethreaded = {rethreaded}'
             ' WHERE change_id = ? AND revision = ?',
-            (new_revision, new_message_id, new_subject, now, change_id, old_revision),
+            (
+                new_revision,
+                new_message_id,
+                new_subject,
+                now,
+                change_id,
+                new_revision,
+                change_id,
+                old_revision,
+            ),
         )
     else:
         conn.execute(
             'UPDATE series SET revision = ?, message_id = ?,'
-            ' message_count = NULL, seen_message_count = NULL,'
-            ' last_activity_at = ?'
+            ' last_activity_at = ?,'
+            f' is_rethreaded = {rethreaded}'
             ' WHERE change_id = ? AND revision = ?',
-            (new_revision, new_message_id, now, change_id, old_revision),
+            (
+                new_revision,
+                new_message_id,
+                now,
+                change_id,
+                new_revision,
+                change_id,
+                old_revision,
+            ),
         )
+    # After the UPDATE, so the row this seeds from already names the
+    # incoming revision and its message-id.
+    _ensure_catalog_row(conn, change_id, new_revision)
     conn.commit()
 
 
@@ -2236,6 +2609,36 @@ def get_review_branches(topdir: Optional[str] = None) -> list[str]:
     return b4.git_get_command_lines(topdir, gitargs)
 
 
+def _fetch_thread_msgs(message_id: str) -> Optional[List[Any]]:
+    """Fetch a full thread by message-id for counting or discovery.
+
+    Goes through :func:`b4.get_pi_thread_by_msgid` rather than talking to
+    the LoreNode directly, for three reasons:
+
+    - ``nocache=True``.  The node's mbox cache has a ten-minute TTL, and
+      the count *is* the freshness signal here — a cached read would
+      report a thread as quiet when the mail that prompted the maintainer
+      to press 'u' has already landed.
+    - Strict threading.  Every other writer of ``message_count`` (the
+      series machinery, the thread viewer) counts the strict thread, so
+      counting the raw mbox here would make the two disagree and leave a
+      residual unread badge that never clears.
+    - Cancellation.  It catches only ``RemoteError``, letting
+      ``OperationCancelledError`` propagate to the sweep.
+
+    Returns None on failure or when offline.
+    """
+    if not b4.can_network:
+        return None
+    try:
+        return b4.get_pi_thread_by_msgid(message_id, nocache=True, quiet=True)
+    except liblore.OperationCancelledError:
+        raise
+    except Exception as ex:
+        logger.debug('Could not fetch thread for %s: %s', message_id, ex)
+        return None
+
+
 def _latest_date_from_msgs(msgs: List[Any]) -> Optional[str]:
     """Return the most recent Date header from EmailMessage objects as ISO timestamp."""
     latest: Optional[datetime.datetime] = None
@@ -2256,6 +2659,168 @@ def _latest_date_from_msgs(msgs: List[Any]) -> Optional[str]:
     return latest.astimezone(datetime.timezone.utc).isoformat()
 
 
+def _ensure_catalog_row(
+    conn: sqlite3.Connection, change_id: str, revision: int
+) -> None:
+    """Make sure the revision that *change_id* tracks has a catalog row.
+
+    Read state lives on `revisions` and only there, so a series row whose
+    revision was never catalogued has nowhere to put a count -- the UPDATE
+    would match nothing and the number would vanish.  Manual linking can
+    record only newer versions, so this is not hypothetical.  Seeded from
+    the series row, which is where the identifying fields came from.
+    """
+    conn.execute(
+        'INSERT OR IGNORE INTO revisions'
+        ' (change_id, revision, message_id, subject, found_at, fingerprint,'
+        '  source, is_rethreaded)'
+        ' SELECT change_id, revision, message_id, subject,'
+        "  COALESCE(sent_at, added_at), fingerprint, 'heuristic',"
+        '  COALESCE(is_rethreaded, 0) FROM series'
+        ' WHERE change_id = ? AND revision = ? AND message_id IS NOT NULL'
+        " AND message_id != ''",
+        (change_id, revision),
+    )
+
+
+def _touch_last_mail(
+    conn: sqlite3.Connection,
+    change_id: str,
+    revision: int,
+    last_mail: Optional[str],
+) -> None:
+    """Record the newest Date: header seen in a revision's thread.
+
+    Forward only: a rethreaded revision whose member thread will not fetch
+    loses that member's newest reply from the union while other members
+    raise the total, which otherwise walks the date backwards.
+
+    Also bumps the series' own ``last_activity_at``, which is a different
+    column answering a different question -- "when did anything last happen
+    to this series", maintainer actions included -- and which the tracking
+    list's age column has always advanced on new mail.
+    """
+    if not last_mail:
+        return
+    conn.execute(
+        'UPDATE revisions SET last_mail_at = ?'
+        ' WHERE change_id = ? AND revision = ?'
+        ' AND COALESCE(last_mail_at, ?) <= ?',
+        (last_mail, change_id, revision, last_mail, last_mail),
+    )
+    conn.execute(
+        'UPDATE series SET last_activity_at = ?'
+        ' WHERE change_id = ? AND revision = ?'
+        ' AND COALESCE(last_activity_at, ?) <= ?',
+        (last_mail, change_id, revision, last_mail, last_mail),
+    )
+
+
+def _read_counts(
+    conn: sqlite3.Connection, change_id: str, revision: int
+) -> Optional[Tuple[Optional[int], Optional[int]]]:
+    """A revision's stored ``(message_count, seen_message_count)``.
+
+    One lookup against the one table that holds them.  There is nothing to
+    adopt, park or carry across on an upgrade: a series row re-pointed at
+    another revision simply reads that revision's row, which the poller may
+    already have filled in, and the row it left keeps its own counts.
+
+    None means there is no catalog row at all, which is not the same as a
+    row that has never been counted -- the writes below would match nothing
+    and report a stored count that went nowhere.
+    """
+    row = conn.execute(
+        'SELECT message_count, seen_message_count FROM revisions'
+        ' WHERE change_id = ? AND revision = ?',
+        (change_id, revision),
+    ).fetchone()
+    if row is None:
+        return None
+    return row[0], row[1]
+
+
+def _write_counts(
+    conn: sqlite3.Connection,
+    change_id: str,
+    revision: int,
+    message_count: int,
+    seen_message_count: Optional[int],
+    now: str,
+) -> None:
+    """Store a revision's counts and stamp the check time.
+
+    The one statement behind every writer of the pair, as
+    :func:`_counts_after_fetch` is the one rule behind their decisions:
+    three hand-written copies of it drifted apart once already.  A
+    *seen_message_count* of None leaves the stored value alone.
+
+    Does not commit -- callers pair this with :func:`_touch_last_mail`
+    and close the transaction themselves.
+    """
+    conn.execute(
+        'UPDATE revisions SET message_count = ?,'
+        ' seen_message_count = COALESCE(?, seen_message_count),'
+        ' last_update_check = ?'
+        ' WHERE change_id = ? AND revision = ?',
+        (message_count, seen_message_count, now, change_id, revision),
+    )
+
+
+def _stamp_check(
+    conn: sqlite3.Connection, change_id: str, revision: int, now: str
+) -> None:
+    """Record that a revision's thread was looked at, counts untouched.
+
+    ``last_update_check`` means "last checked", not "last changed": the
+    poller's least-recently-attempted rotation depends on a quiet poll --
+    and a failed one -- advancing it, or a revision that never changes
+    keeps sorting to the front and starves the rest.
+    """
+    conn.execute(
+        'UPDATE revisions SET last_update_check = ?'
+        ' WHERE change_id = ? AND revision = ?',
+        (now, change_id, revision),
+    )
+
+
+def _counts_after_fetch(
+    old_count: Optional[int], old_seen: Optional[int], count: int
+) -> Optional[Tuple[int, Optional[int]]]:
+    """Decide what a freshly fetched total means for one revision's counts.
+
+    The single rule behind every writer of a ``message_count`` pair -- the
+    series sweep, the per-revision poll and the thread viewer's refresh --
+    which drifted apart once and left two of the three clamping read state
+    away on a partial fetch.
+
+    Returns the ``(message_count, seen_message_count)`` to store, where a
+    seen of None means leave it as it is, or None to store no counts at
+    all.  Only an equal total stores nothing: it carries no information.
+
+    A shrink is recorded, with seen capped to the new total.  Threads do
+    genuinely shrink -- dedup variation, mail removed from the archive --
+    and refusing the smaller number turns the stored count into a stale
+    high watermark that swallows every following total up to it: new
+    replies then arrive under the old number and never raise a badge, and
+    nothing ever corrects it, since the one repair path (the thread
+    viewer's seen sync) runs only when the maintainer opens the thread the
+    missing badge was meant to point at.  The price is that a *partial*
+    fetch recorded here can raise a transient badge for mail already read
+    once the complete thread comes back; that badge clears on open, which
+    is recoverable in a way a permanently suppressed one is not.
+    """
+    if old_count is None:
+        # Never counted: seen = count, so nothing badges mail that predates
+        # tracking.
+        return count, count
+    if count == old_count:
+        return None
+    if old_seen is not None and old_seen > count:
+        return count, count
+    return count, None
+
+
 def update_message_count_from_msgs(
     conn: sqlite3.Connection,
     change_id: str,
@@ -2278,61 +2843,122 @@ def update_message_count_from_msgs(
     """
     now = datetime.datetime.now(datetime.timezone.utc).isoformat()
     count = len(msgs)
-    last_activity = _latest_date_from_msgs(msgs)
-
-    row = conn.execute(
-        'SELECT message_count, seen_message_count FROM series'
-        ' WHERE change_id = ? AND revision = ?',
-        (change_id, revision),
-    ).fetchone()
-    existing_count = row['message_count'] if row else None
+    last_mail = _latest_date_from_msgs(msgs)
+    _ensure_catalog_row(conn, change_id, revision)
+    stored = _read_counts(conn, change_id, revision)
+    if stored is None:
+        # No catalog row and none could be seeded, so there is nowhere to
+        # put a count.  Reported rather than written into the void.
+        logger.debug('No catalog row for %s v%d, not counting', change_id, revision)
+        return False
+    existing_count, existing_seen = stored
 
-    if existing_count is None:
-        # First fetch — initialise seen = count (no badge yet)
-        conn.execute(
-            'UPDATE series'
-            ' SET message_count = ?, seen_message_count = ?,'
-            '     last_update_check = ?, last_activity_at = ?'
-            ' WHERE change_id = ? AND revision = ?',
-            (count, count, now, last_activity, change_id, revision),
-        )
-    elif count != existing_count:
-        # Count changed — update count but not seen (badge will appear),
-        # save for any already-read new messages reported by the caller
-        if seen_bump > 0:
-            new_seen = min(count, (row['seen_message_count'] or 0) + seen_bump)
-            conn.execute(
-                'UPDATE series'
-                ' SET message_count = ?, seen_message_count = ?,'
-                '     last_update_check = ?,'
-                '     last_activity_at = COALESCE(?, last_activity_at)'
-                ' WHERE change_id = ? AND revision = ?',
-                (count, new_seen, now, last_activity, change_id, revision),
-            )
-        else:
-            conn.execute(
-                'UPDATE series'
-                ' SET message_count = ?, last_update_check = ?,'
-                '     last_activity_at = COALESCE(?, last_activity_at)'
-                ' WHERE change_id = ? AND revision = ?',
-                (count, now, last_activity, change_id, revision),
-            )
-    else:
-        # No change — just stamp the check time, skip commit
-        conn.execute(
-            'UPDATE series SET last_update_check = ?'
-            ' WHERE change_id = ? AND revision = ?',
-            (now, change_id, revision),
-        )
+    verdict = _counts_after_fetch(existing_count, existing_seen, count)
+    if verdict is None:
+        # Unchanged total: stamp the check time and leave the counts --
+        # and the cached thread, which this writer overwrites rather than
+        # merging -- alone.
+        _stamp_check(conn, change_id, revision, now)
         conn.commit()
         return False
 
+    new_count, new_seen = verdict
+    if new_seen is None and seen_bump > 0:
+        # New-to-the-thread messages the caller already read (its own
+        # replies), so they must not raise a badge.
+        new_seen = min(new_count, (existing_seen or 0) + seen_bump)
+    _write_counts(conn, change_id, revision, new_count, new_seen, now)
+    _touch_last_mail(conn, change_id, revision, last_mail)
     conn.commit()
     if topdir and msgs:
         _store_thread_blob(topdir, change_id, msgs)
     return True
 
 
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
+def store_revision_thread_blob(
+    conn: sqlite3.Connection,
+    topdir: str,
+    change_id: str,
+    revision: int,
+    msgs: List[Any],
+) -> Optional[str]:
+    """Cache a catalog revision's thread mbox as a git blob.
+
+    The freshest fetch wins, unconditionally: this column holds "the
+    thread as it last looked", which is what a poll counted and what
+    :func:`b4.review._prev_thread_msgids` diffs the next fetch against, so
+    an older snapshot is never the better answer.  Nothing arbitrates here
+    because nothing has to -- a thread that does not hold the whole series
+    is cached as a *series* separately, by
+    :func:`store_revision_series_blob`.
+
+    Unlike _store_thread_blob this records the SHA in the revisions
+    catalog only -- the review branch tracking ref belongs to the
+    tracked revision.
+    """
+    return _store_revision_blob(
+        conn, topdir, change_id, revision, msgs, set_revision_thread_blob, 'thread'
+    )
+
+
+def store_revision_series_blob(
+    conn: sqlite3.Connection,
+    topdir: str,
+    change_id: str,
+    revision: int,
+    msgs: List[Any],
+) -> Optional[str]:
+    """Cache a catalog revision's stitched series mbox as a git blob.
+
+    What a range-diff reassembled with the get_extra_series() passes,
+    which is the only way to get every patch of a version posted with
+    broken threading.  Recording it is what keeps the next range-diff from
+    paying for those passes again; :func:`set_revision_thread_blob` drops
+    it when the underlying thread changes.
+    """
+    return _store_revision_blob(
+        conn, topdir, change_id, revision, msgs, set_revision_series_blob, 'series'
+    )
+
+
+def _store_revision_blob(
+    conn: sqlite3.Connection,
+    topdir: str,
+    change_id: str,
+    revision: int,
+    msgs: List[Any],
+    setter: Callable[[sqlite3.Connection, str, int, str], bool],
+    what: str,
+) -> Optional[str]:
+    """Write *msgs* as a git blob and record its SHA on the catalog row."""
+    blob_sha = _write_mbox_blob(topdir, msgs)
+    if blob_sha is None:
+        logger.debug('Could not store %s blob for %s v%d', what, change_id, revision)
+        return None
+    if not setter(conn, change_id, revision, blob_sha):
+        logger.debug('No catalog row for %s v%d, not caching', change_id, revision)
+        return None
+    return blob_sha
+
+
 def _store_thread_blob(topdir: str, change_id: str, msgs: List[Any]) -> Optional[str]:
     """Serialize msgs to mboxrd and write as a git blob; update tracking commit.
 
@@ -2344,24 +2970,12 @@ def _store_thread_blob(topdir: str, change_id: str, msgs: List[Any]) -> Optional
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
@@ -2707,13 +3321,480 @@ def ensure_thread_context_blob(
     return ctx_sha
 
 
+def _member_patch_count(conn: sqlite3.Connection, change_id: str, revision: int) -> int:
+    """How many member patches a rethreaded revision was stitched from.
+
+    Both the poll budget and the fetch path key off this number -- one
+    counts the round-trips it will cost, the other decides whether there
+    is a series to reassemble at all -- so they read it from here rather
+    than each re-deriving "position > 0" from the patch rows.
+    """
+    patches = get_series_patches(conn, change_id, revision)
+    return sum(1 for p in patches if p.get('position', 0) > 0)
+
+
+def _revision_poll_cost(
+    conn: sqlite3.Connection, change_id: str, rev: Dict[str, Any]
+) -> int:
+    """Lore round-trips polling this revision will cost.
+
+    One for a plain revision, one per member patch for a rethreaded one --
+    :func:`_fetch_revision_thread_msgs` reassembles those from their
+    per-patch message-ids.
+    """
+    if not rev.get('is_rethreaded'):
+        return 1
+    return max(1, _member_patch_count(conn, change_id, int(rev['revision'])))
+
+
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
+
+    The plain arm does not go through
+    :func:`b4.review.retrieve_series_messages`, which fetches the same
+    thread with the same ``nocache``: a poll runs unattended, so it wants
+    the quiet fetch that reports a miss by returning None rather than the
+    interactive one that logs a lookup per revision and raises.
+    """
+    # Checked up front so the rethreaded path below does not fire off one
+    # doomed request per member patch while offline.
+    if not b4.can_network:
+        return None
+    revision = int(rev['revision'])
+    if rev.get('is_rethreaded'):
+        if _member_patch_count(conn, change_id, revision) >= 2:
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
+            except liblore.OperationCancelledError:
+                raise
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
+    return _fetch_thread_msgs(message_id)
+
+
+def _tracked_revisions(conn: sqlite3.Connection, change_id: str) -> Set[int]:
+    """Revisions of *change_id* that a live series row currently tracks.
+
+    The series machinery fetches and counts these on the same sweep, so
+    polling them again would pay twice for one answer -- and lose: the
+    poller counts a revision it has no row for as a first fetch, which
+    initialises ``seen_message_count`` to the total and takes the unread
+    badge off mail the maintainer has not read.
+    """
+    return {
+        int(row[0])
+        for row in conn.execute(
+            'SELECT revision FROM series WHERE change_id = ?'
+            " AND COALESCE(status, 'new') != 'archived'",
+            (change_id,),
+        )
+    }
+
+
+def _thread_blob_exists(topdir: str, blob_sha: str) -> bool:
+    """Whether a recorded thread blob is still in the object store.
+
+    Thread blobs are written with ``hash-object -w`` and referenced only
+    from the database, so any ``git gc`` may prune one while the SHA stays
+    recorded -- a pruned blob reads the same as an absent one.  ``cat-file
+    -e`` resolves the object and exits, transferring none of its contents.
+    """
+    ecode, _ = b4.git_run_command(topdir, ['cat-file', '-e', blob_sha], decode=False)
+    return ecode == 0
+
+
+def _ensure_thread_blob(
+    conn: sqlite3.Connection,
+    topdir: Optional[str],
+    change_id: str,
+    revision: int,
+    blob_sha: Optional[str],
+    msgs: List[Any],
+) -> None:
+    """Cache *msgs* for a revision only if no stored blob survives.
+
+    The quiet-poll counterpart of :func:`store_revision_thread_blob`, for
+    the case where the fetch returned the same count as last sweep: the
+    stored blob holds that same thread, so rewriting it would serialize an
+    mbox and re-record a SHA the row already carries -- and, worse, throw
+    away a stitched ``series_blob`` that is still perfectly good.  The one
+    thing left to check is whether ``git gc`` has since pruned it, which
+    ``cat-file -e`` answers without transferring the mbox.
+    """
+    if not topdir:
+        return
+    if blob_sha and _thread_blob_exists(topdir, blob_sha):
+        return
+    store_revision_thread_blob(conn, topdir, change_id, revision, msgs)
+
+
+def _update_one_revision_count(
+    identifier: str,
+    conn: sqlite3.Connection,
+    topdir: Optional[str],
+    change_id: str,
+    rev: Dict[str, Any],
+    now: str,
+) -> Optional[int]:
+    """Update message counts for a single non-tracked catalog revision.
+
+    Fetches the thread and counts it, exactly as the tracked revision's
+    counts are maintained.  public-inbox offers no cheaper way to ask
+    "did anything arrive?": its only date-range search runs against the
+    whole inbox, so a probe costs more than the thread it is probing.
+
+    Returns the change in ``message_count`` -- 0 when nothing moved,
+    negative for a recorded shrink, the full total on a first count -- or
+    None on fetch failure.  The direction matters to the caller: a shrink
+    is an update but not new mail.  A quiet revision still writes its
+    check timestamp -- the rotation depends on it -- so unlike the
+    tracked-revision writers this does not leave the DB mtime alone.
+
+    *rev* is the revision's own catalog row (`_REVISION_SELECT` reads the
+    catalog and nothing else), so its counts are exactly what the writes
+    below compare against.
+    """
+    revision = int(rev['revision'])
+    old_count, old_seen = rev.get('message_count'), rev.get('seen_message_count')
+
+    msgs = _fetch_revision_thread_msgs(identifier, conn, change_id, rev)
+    if not msgs:
+        # Record the attempt, or a revision that always fails keeps
+        # sorting to the front of the rotation and starves the rest.
+        # Offline nothing was attempted, so nothing is recorded.
+        if b4.can_network:
+            _stamp_check(conn, change_id, revision, now)
+            conn.commit()
+        return None
+    count = len(msgs)
+
+    if old_count is not None and count == old_count:
+        # Nothing arrived, so the counts stay put -- but the check itself
+        # is recorded, or the rotation never advances past a quiet
+        # revision and the column would mean "last changed" instead.
+        _stamp_check(conn, change_id, revision, now)
+        conn.commit()
+        # A settled old version never changes count, so this is its only
+        # chance at a cached thread; without it every range-diff against
+        # that version refetches from lore.
+        _ensure_thread_blob(
+            conn, topdir, change_id, revision, rev.get('thread_blob'), msgs
+        )
+        return 0
+
+    verdict = _counts_after_fetch(old_count, old_seen, count)
+    if verdict is None:
+        # Only an equal total yields None, and that returned above.
+        return 0
+
+    new_count, new_seen = verdict
+    last_activity = _latest_date_from_msgs(msgs)
+    _write_counts(conn, change_id, revision, new_count, new_seen, now)
+    _touch_last_mail(conn, change_id, revision, last_activity)
+    conn.commit()
+    if topdir:
+        store_revision_thread_blob(conn, topdir, change_id, revision, msgs)
+    return new_count - (old_count or 0)
+
+
+# Minimum age of a revision's last check before the poller fetches it
+# again, keyed by how recently its thread saw mail.  Below the poll cap
+# the LRU rotation never engages, so without a floor every sweep
+# re-downloads every quiet old version's full thread just to re-learn it
+# is quiet; these keep late-reply detection at bounded staleness for
+# near-zero steady-state cost.
+_POLL_MIN_INTERVALS: Tuple[Tuple[Optional[float], float], ...] = (
+    (7 * 86400.0, 3600.0),  # mail this week: hourly
+    (30 * 86400.0, 6 * 3600.0),  # this month: six-hourly
+    (None, 24 * 3600.0),  # older or unknown: daily
+)
+
+
+def _poll_due(rev: Dict[str, Any], now: str) -> bool:
+    """Whether enough time has passed to re-poll a revision.
+
+    A never-checked revision is always due, and so is one whose stamps do
+    not parse -- when in doubt, poll.  Failed fetches stamp the check time
+    too, so a dead message-id is retried on this same schedule instead of
+    on every sweep.
+    """
+    checked = rev.get('last_update_check')
+    if not checked:
+        return True
+    try:
+        now_dt = datetime.datetime.fromisoformat(now)
+        age = (now_dt - datetime.datetime.fromisoformat(str(checked))).total_seconds()
+        quiet: Optional[float] = None
+        if rev.get('last_mail_at'):
+            quiet = (
+                now_dt - datetime.datetime.fromisoformat(str(rev['last_mail_at']))
+            ).total_seconds()
+    except (ValueError, TypeError):
+        return True
+    for horizon, interval in _POLL_MIN_INTERVALS:
+        if horizon is None or (quiet is not None and quiet <= horizon):
+            return age >= interval
+    return True
+
+
+def update_revision_message_counts(
+    identifier: str,
+    series_list: List[Dict[str, Any]],
+    topdir: Optional[str] = None,
+    max_revisions_per_series: Optional[int] = None,
+    cancel_cb: Optional[Callable[[], bool]] = None,
+    only_revisions: Optional[Set[int]] = None,
+    status_cb: Optional[Callable[[str], None]] = None,
+) -> Dict[str, int]:
+    """Fetch and store thread message counts for non-tracked revisions.
+
+    The series machinery owns the tracked revision's counts; this covers
+    every *other* revision in the catalog so new mail landing on an old
+    version's thread is still noticed.
+
+    Each polled revision has its thread fetched and counted.  Only the
+    check timestamp is written when the count has not moved, so an
+    unread badge never flickers on a quiet sweep; a count that has moved
+    is stored, and when *topdir* is given the mbox is cached as a git
+    blob.  A revision counted for the first time starts with
+    ``seen_message_count`` equal to the total, so no badge appears for
+    mail that predates it being tracked.
+
+    Revisions are polled least-recently-attempted first, capped by
+    *max_revisions_per_series* — a lore round-trip per revision (and, for
+    a rethreaded one, per member patch) adds up fast across a large
+    tracking list, so each sweep takes the next few in the rotation and
+    every version comes back around.  Failed fetches do not spend the
+    budget, so one unreachable revision cannot starve the live ones behind
+    it -- except under *only_revisions*, where the consecutive-failure stop
+    is lifted and the cap is all that bounds the run.  Below the cap the
+    rotation alone would re-fetch everything every sweep, so a revision
+    checked recently enough is skipped outright -- see :func:`_poll_due`
+    for the schedule.
+
+    *cancel_cb* is polled between revisions so a cancelled sweep stops
+    here rather than grinding through the rest of the catalog.
+    *only_revisions* narrows the poll to named versions, for a caller
+    that knows which ones it wants counted; naming them also bypasses the
+    minimum-age skip, since the caller is asking now.  *status_cb*, when
+    given, is handed each polled series' subject, so a caller driving a
+    progress display has something to show during what is otherwise
+    minutes of silent lore traffic.  A subject and nothing else: how far
+    along a sweep is belongs to the sweep, which knows how many series it
+    handed over and has already drawn a bar for them.
+
+    Returns ``{'updated': n, 'new_mail': n, 'errors': n,
+    'fresh_errors': n, 'polled': n, 'cancelled': 0-or-1}``.  *cancelled*
+    reports that *cancel_cb* stopped the sweep partway, so a caller does
+    not present a partial run as a complete one.  *updated* counts revisions whose
+    counts actually changed; *new_mail* is the subset that genuinely grew,
+    first fetches and recorded shrinks excluded -- a first fetch changes
+    the row without anything having arrived, and reporting it as new mail
+    would make the first sweep after a catalog grows claim activity on
+    every version of every series.  *polled* counts revisions whose
+    thread came back at all, which is what separates "one message-id will
+    not fetch" from "the poller is not working".  *fresh_errors* counts
+    the failures excluding revisions already known dead (attempted before,
+    never fetched once): a permanently dead message-id is worth one
+    report, not one per sweep.
+    """
+    updated = 0
+    new_mail = 0
+    errors = 0
+    fresh_errors = 0
+    polled_total = 0
+    cancelled = False
+    # The same set update_all_tracking() drops, no wider: a late reply lands
+    # on an old version of an applied series just as readily as on its
+    # tracked one, which is polled past 'accepted'/'thanked' for that reason.
+    skip_statuses = frozenset(('archived', 'snoozed'))
+
+    try:
+        conn = get_db(identifier)
+    except FileNotFoundError:
+        return {
+            'updated': 0,
+            'new_mail': 0,
+            'errors': 0,
+            'fresh_errors': 0,
+            'polled': 0,
+            'cancelled': 0,
+        }
+
+    try:
+        for series in series_list:
+            if cancel_cb is not None and cancel_cb():
+                # Reported, like the per-revision check below: a cancel
+                # landing between series otherwise presents the partial
+                # sweep as a clean, complete run.
+                cancelled = True
+                break
+            if series.get('status') in skip_statuses:
+                continue
+            change_id = series.get('change_id', '')
+            if not change_id:
+                continue
+            tracked_rev = int(series.get('revision') or 1)
+
+            # Backstop for a series row written before every path that
+            # points one at a revision catalogued it.  An INSERT OR IGNORE
+            # that ignores changes no page, so committing it leaves the
+            # file -- and the mtime the TUI reloads on -- untouched.
+            _ensure_catalog_row(conn, change_id, tracked_rev)
+            conn.commit()
+
+            # Every live series row's revision is off limits, not just the
+            # one this call was handed: rescan_branches can leave a
+            # change_id with more than one, and polling the revision another
+            # row tracks would overwrite its unread state from a first fetch.
+            tracked_revs = _tracked_revisions(conn, change_id) | {tracked_rev}
+            candidates = [
+                rev
+                for rev in get_revisions(conn, change_id)
+                if int(rev['revision']) not in tracked_revs
+                and (only_revisions is None or int(rev['revision']) in only_revisions)
+            ]
+            # Least-recently-attempted first: never-tried revisions have no
+            # stamp and drain first, then rejoin the rotation.  Ordering on
+            # the count would pin the cap to whichever revisions keep
+            # failing and never come back to the older versions.
+            candidates.sort(
+                key=lambda rev: (
+                    rev.get('last_update_check') or '',
+                    -int(rev['revision']),
+                )
+            )
+
+            if candidates and status_cb is not None:
+                status_cb(str(series.get('subject') or ''))
+
+            polled = 0
+            consecutive_errors = 0
+            for rev in candidates:
+                if (
+                    max_revisions_per_series is not None
+                    and polled >= max_revisions_per_series
+                ):
+                    break
+                if cancel_cb is not None and cancel_cb():
+                    # Reported, not just broken out of: a cancel during the
+                    # last series' poll otherwise ends the sweep by falling
+                    # off the loop, and it reports a clean run.
+                    cancelled = True
+                    break
+                now = datetime.datetime.now(datetime.timezone.utc).isoformat()
+                if only_revisions is None and not _poll_due(rev, now):
+                    continue
+                first_fetch = rev.get('message_count') is None
+                try:
+                    delta = _update_one_revision_count(
+                        identifier, conn, topdir, change_id, rev, now
+                    )
+                except liblore.OperationCancelledError:
+                    # Every revision counted so far committed its own row, so
+                    # the badges are already on screen.  Letting this out
+                    # would discard the tally that explains them, and a
+                    # poller that never works would read exactly like a
+                    # cancelled one.
+                    cancelled = True
+                    break
+                if delta is None:
+                    # Offline is not a failure: nothing was requested, and
+                    # counting it would mail the maintainer about every
+                    # revision of every series.
+                    if b4.can_network:
+                        errors += 1
+                        # A revision that was attempted before and has never
+                        # fetched once is known dead; only failures outside
+                        # that set are news.
+                        if not (first_fetch and rev.get('last_update_check')):
+                            fresh_errors += 1
+                        if only_revisions is not None:
+                            # Charged here and only here.  A caller that
+                            # named its revisions has the two-in-a-row stop
+                            # below lifted -- dead message-ids are exactly
+                            # what a backward search turns up -- so the cap
+                            # is the only thing left bounding the run, and a
+                            # failed fetch made the same round-trip a
+                            # successful one does.  Without this, [o] on a
+                            # v20 series whose ids all 404 answers with 19
+                            # of them, which is the number its own call site
+                            # says the cap prevents.  In the sweep the stop
+                            # still fires, so failures stay free there and
+                            # one dead revision cannot starve the live ones
+                            # behind it.
+                            polled += _revision_poll_cost(conn, change_id, rev)
+                    consecutive_errors += 1
+                    # Two in a row means offline rather than one bad
+                    # message-id -- but not when the caller named the
+                    # revisions it wants, since dead message-ids are exactly
+                    # what a backward lore search turns up.
+                    if consecutive_errors >= 2 and only_revisions is None:
+                        break
+                    continue
+                consecutive_errors = 0
+                # Charged in round-trips, which is what the budget exists to
+                # cap: a rethreaded revision costs one per member patch, so
+                # spending a single unit on it lets a handful of them issue
+                # dozens of requests inside a cap of three.
+                polled += _revision_poll_cost(conn, change_id, rev)
+                polled_total += 1
+                if delta:
+                    updated += 1
+                    if delta > 0 and not first_fetch:
+                        new_mail += 1
+            if cancelled:
+                break
+    finally:
+        conn.close()
+    return {
+        'updated': updated,
+        'new_mail': new_mail,
+        'errors': errors,
+        'fresh_errors': fresh_errors,
+        'polled': polled_total,
+        'cancelled': int(cancelled),
+    }
+
+
 def mark_all_messages_seen(
     conn: sqlite3.Connection, change_id: str, revision: int
 ) -> None:
-    """Set seen_message_count = message_count, clearing the unread badge."""
+    """Set seen_message_count = message_count, clearing the unread badge.
+
+    One row, one write.  The badge is derived from this revision's catalog
+    row, so clearing it is that row's own total -- no second copy to keep in
+    step, and no clamping one table's seen count against the other's total.
+    """
     conn.execute(
-        'UPDATE series SET seen_message_count = message_count'
-        ' WHERE change_id = ? AND revision = ?',
+        'UPDATE revisions SET seen_message_count = message_count'
+        ' WHERE change_id = ? AND revision = ? AND message_count IS NOT NULL',
         (change_id, revision),
     )
     conn.commit()
@@ -2724,8 +3805,12 @@ def sync_seen_from_unseen_count(
 ) -> bool:
     """Sync seen_message_count so the unread badge matches the messages DB.
 
-    Sets ``seen_message_count = message_count - unseen_count``, clamped
-    to [0, message_count].  Only writes when the value actually changes.
+    Sets ``seen_message_count = message_count - unseen_count``, clamped to
+    [0, message_count].  Only writes when the value actually changes, so a
+    sync that agrees with the stored state leaves the DB mtime alone.
+
+    Applies to the revision's catalog row whether or not a series currently
+    tracks it: that row is where the badge is read from either way.
 
     Returns True if the database was updated, False otherwise.
     """
@@ -2733,33 +3818,27 @@ def sync_seen_from_unseen_count(
         conn = get_db(identifier)
     except FileNotFoundError:
         return False
-
-    row = conn.execute(
-        'SELECT message_count, seen_message_count FROM series'
-        ' WHERE change_id = ? AND revision = ?',
-        (change_id, revision),
-    ).fetchone()
-    if row is None:
-        conn.close()
-        return False
-
-    fc = row['message_count']
-    if fc is None:
-        conn.close()
-        return False
-
-    new_seen = max(0, min(fc, fc - unseen_count))
-    if new_seen == row['seen_message_count']:
+    try:
+        row = conn.execute(
+            'SELECT message_count, seen_message_count FROM revisions'
+            ' WHERE change_id = ? AND revision = ?',
+            (change_id, revision),
+        ).fetchone()
+        if row is None or row['message_count'] is None:
+            return False
+        total = row['message_count']
+        new_seen = max(0, min(total, total - unseen_count))
+        if new_seen == row['seen_message_count']:
+            return False
+        conn.execute(
+            'UPDATE revisions SET seen_message_count = ?'
+            ' WHERE change_id = ? AND revision = ?',
+            (new_seen, change_id, revision),
+        )
+        conn.commit()
+        return True
+    finally:
         conn.close()
-        return False
-
-    conn.execute(
-        'UPDATE series SET seen_message_count = ? WHERE change_id = ? AND revision = ?',
-        (new_seen, change_id, revision),
-    )
-    conn.commit()
-    conn.close()
-    return True
 
 
 def refresh_message_count(
@@ -2772,13 +3851,14 @@ def refresh_message_count(
     taking/accepting a series).
 
     Only ``message_count`` and ``last_update_check`` are updated;
-    ``seen_message_count`` is left unchanged so the unread badge
-    continues to reflect the actual read state from the messages DB.
-    When ``message_count`` was NULL (first fetch), ``seen_message_count``
-    is initialised to the same value (no badge) as a safe default.
+    ``seen_message_count`` is left unchanged so the unread badge continues
+    to reflect the actual read state from the messages DB.  When
+    ``message_count`` was NULL (first fetch), ``seen_message_count`` is
+    initialised to the same value (no badge) as a safe default.
 
-    Only writes to the database when the count differs from the stored
-    value, keeping the DB mtime stable when nothing changed.
+    Only writes when the count differs from the stored value, keeping the
+    DB mtime stable when nothing changed.  Applies to the revision's
+    catalog row whether or not a series currently tracks it.
 
     Returns True if the database was updated, False otherwise.
     """
@@ -2787,53 +3867,20 @@ def refresh_message_count(
         conn = get_db(identifier)
     except FileNotFoundError:
         return False
-
-    row = conn.execute(
-        'SELECT message_count, seen_message_count FROM series'
-        ' WHERE change_id = ? AND revision = ?',
-        (change_id, revision),
-    ).fetchone()
-    if row is None:
-        conn.close()
-        return False
-
-    count = total_messages
-    old_count = row['message_count']
-
-    if old_count is not None and count == old_count:
-        # Nothing changed — skip the write to keep the DB mtime stable.
+    try:
+        _ensure_catalog_row(conn, change_id, revision)
+        stored = _read_counts(conn, change_id, revision)
+        if stored is None:
+            return False
+        verdict = _counts_after_fetch(stored[0], stored[1], total_messages)
+        if verdict is None:
+            # Unchanged total -- skip the write so the DB mtime stays put.
+            return False
+        _write_counts(conn, change_id, revision, verdict[0], verdict[1], now)
+        conn.commit()
+        return True
+    finally:
         conn.close()
-        return False
-
-    if old_count is None:
-        # First fetch: initialise both counts equally (no badge).
-        conn.execute(
-            'UPDATE series SET message_count = ?, seen_message_count = ?,'
-            '  last_update_check = ?'
-            ' WHERE change_id = ? AND revision = ?',
-            (count, count, now, change_id, revision),
-        )
-    else:
-        # Count changed: update only message_count; cap seen if it
-        # exceeds the new count (possible when dedup reduces the total).
-        seen = row['seen_message_count']
-        if seen is not None and seen > count:
-            conn.execute(
-                'UPDATE series SET message_count = ?, seen_message_count = ?,'
-                '  last_update_check = ?'
-                ' WHERE change_id = ? AND revision = ?',
-                (count, count, now, change_id, revision),
-            )
-        else:
-            conn.execute(
-                'UPDATE series SET message_count = ?, last_update_check = ?'
-                ' WHERE change_id = ? AND revision = ?',
-                (count, now, change_id, revision),
-            )
-
-    conn.commit()
-    conn.close()
-    return True
 
 
 def rescan_branches(
diff --git a/src/b4/review_tui/_tracking_app.py b/src/b4/review_tui/_tracking_app.py
index 11e79ef2..42f0f46c 100644
--- a/src/b4/review_tui/_tracking_app.py
+++ b/src/b4/review_tui/_tracking_app.py
@@ -4263,22 +4263,33 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
             prior_thread_blob = old_series.get('thread-context-blob', '')
             prior_msgid = old_series.get('header-info', {}).get('msgid', '')
 
-            # --- 1c. Record the current rev's mbox blob in the DB ---
-            # Do this before archiving so the blob SHA survives for range-diff.
-            # The blob may later be GC'd; callers must tolerate a missing blob.
-            if self._identifier:
-                cur_mbox_blob = old_series.get('thread-blob', '')
-                if cur_mbox_blob:
+            # --- 1c. Record the outgoing rev's mbox blob in the catalog ---
+            # Before anything fallible: every abort return below would skip
+            # this write, and the blob -- written with `hash-object -w` and
+            # referenced only from the database -- costs nothing to record
+            # now while the tracking commit is still the branch's.  The
+            # tracked revision's catalog row is guaranteed by
+            # add_series_to_db/_ensure_catalog_row and the v11 backfill; a
+            # row somehow missing degrades to a debug line and a later
+            # lore refetch.
+            cur_mbox_blob = old_series.get('thread-blob', '')
+            if self._identifier and cur_mbox_blob:
+                try:
+                    _conn = b4.review.tracking.get_db(self._identifier)
                     try:
-                        _conn = b4.review.tracking.get_db(self._identifier)
-                        b4.review.tracking.set_revision_thread_blob(
+                        if not b4.review.tracking.set_revision_thread_blob(
                             _conn, change_id, current_rev, cur_mbox_blob
-                        )
+                        ):
+                            logger.debug(
+                                'No catalog row for v%d, thread blob not recorded',
+                                current_rev,
+                            )
+                    finally:
                         _conn.close()
-                    except Exception as _ex:
-                        logger.debug(
-                            'Could not record thread blob for v%d: %s', current_rev, _ex
-                        )
+                except Exception as _ex:
+                    logger.debug(
+                        'Could not record thread blob for v%d: %s', current_rev, _ex
+                    )
 
             # --- 2. Resolve metadata for git-am ---
             top_msgid = None
diff --git a/src/tests/test_review_tracking.py b/src/tests/test_review_tracking.py
index 6394d332..f65bbb4d 100644
--- a/src/tests/test_review_tracking.py
+++ b/src/tests/test_review_tracking.py
@@ -1596,15 +1596,28 @@ class TestFollowupCounts:
     def test_schema_has_followup_columns(
         self, tmp_path: pytest.TempPathFactory
     ) -> None:
-        """Verify fresh DB has message_count, seen_message_count, last_update_check, last_activity_at."""
+        """Read state is the catalog's; `series` keeps only its own stamp."""
         conn = review_tracking.init_db('fc-schema-test')
-        cursor = conn.execute('PRAGMA table_info(series)')
-        col_names = {row[1] for row in cursor.fetchall()}
-        assert 'message_count' in col_names
-        assert 'seen_message_count' in col_names
-        assert 'last_update_check' in col_names
-        assert 'last_activity_at' in col_names
+        series_cols = {row[1] for row in conn.execute('PRAGMA table_info(series)')}
+        rev_cols = {row[1] for row in conn.execute('PRAGMA table_info(revisions)')}
         conn.close()
+        assert {
+            'message_count',
+            'seen_message_count',
+            'last_update_check',
+        } <= rev_cols
+        # One owner: no second copy on `series` for a reader to prefer.
+        assert (
+            not {
+                'message_count',
+                'seen_message_count',
+                'last_update_check',
+            }
+            & series_cols
+        )
+        # This one is the series' own maintainer-action stamp, not the
+        # catalog's last_mail_at, and it stays.
+        assert 'last_activity_at' in series_cols
 
     def test_migration_adds_followup_columns(
         self, tmp_path: pytest.TempPathFactory
@@ -1661,7 +1674,7 @@ class TestFollowupCounts:
         )
         # Manually set a delta
         conn.execute(
-            'UPDATE series SET message_count = 10, seen_message_count = 6'
+            'UPDATE revisions SET message_count = 10, seen_message_count = 6'
             ' WHERE change_id = ?',
             ('fc-seen',),
         )
@@ -1673,7 +1686,7 @@ class TestFollowupCounts:
         # Reopen with get_db to get row_factory for named column access
         conn = review_tracking.get_db('fc-seen-test')
         row = conn.execute(
-            'SELECT message_count, seen_message_count FROM series WHERE change_id = ?',
+            'SELECT message_count, seen_message_count FROM revisions WHERE change_id = ?',
             ('fc-seen',),
         ).fetchone()
         assert row['message_count'] == 10
@@ -2813,7 +2826,7 @@ class TestUpdateSeriesTrackingCounts:
         review_tracking.update_series_status(conn, change_id, 'accepted')
         # Baseline from the reviewing days: 5 messages, all seen
         conn.execute(
-            'UPDATE series SET message_count = 5, seen_message_count = 5'
+            'UPDATE revisions SET message_count = 5, seen_message_count = 5'
             ' WHERE change_id = ?',
             (change_id,),
         )
@@ -2854,7 +2867,7 @@ class TestUpdateSeriesTrackingCounts:
 
         conn = review_tracking.get_db(identifier)
         row = conn.execute(
-            'SELECT message_count, seen_message_count FROM series WHERE change_id = ?',
+            'SELECT message_count, seen_message_count FROM revisions WHERE change_id = ?',
             (change_id,),
         ).fetchone()
         conn.close()
@@ -4580,7 +4593,7 @@ class TestUpdateMessageCountSeenBump:
     @staticmethod
     def _get_counts(conn: sqlite3.Connection) -> tuple[int, int]:
         row = conn.execute(
-            'SELECT message_count, seen_message_count FROM series'
+            'SELECT message_count, seen_message_count FROM revisions'
             ' WHERE change_id = ? AND revision = ?',
             ('bump-cid', 1),
         ).fetchone()
diff --git a/src/tests/test_tui_tracking.py b/src/tests/test_tui_tracking.py
index 664956ec..cc80e7b1 100644
--- a/src/tests/test_tui_tracking.py
+++ b/src/tests/test_tui_tracking.py
@@ -108,7 +108,7 @@ def _seed_db(identifier: str, series_list: List[Dict[str, Any]]) -> None:
         mc = s.get('message_count')
         if mc is not None:
             conn.execute(
-                'UPDATE series SET message_count = ?, seen_message_count = ? '
+                'UPDATE revisions SET message_count = ?, seen_message_count = ? '
                 'WHERE change_id = ? AND revision = ?',
                 (
                     mc,
@@ -965,7 +965,7 @@ class TestTrackingWithReviewBranch:
             # Verify message counts are equal in DB
             conn = tracking.get_db(identifier)
             cursor = conn.execute(
-                'SELECT message_count, seen_message_count FROM series WHERE change_id = ?',
+                'SELECT message_count, seen_message_count FROM revisions WHERE change_id = ?',
                 (change_id,),
             )
             row = cursor.fetchone()
@@ -1199,7 +1199,7 @@ class TestTrackingUpgradeNewSeries:
         )
         # Set message counts so we can verify they get reset
         conn.execute(
-            'UPDATE series SET message_count = 6, seen_message_count = 4'
+            'UPDATE revisions SET message_count = 6, seen_message_count = 4'
             ' WHERE change_id = ?',
             (change_id,),
         )
@@ -1230,18 +1230,22 @@ class TestTrackingUpgradeNewSeries:
             # Verify the DB was updated to v13 with counts reset
             conn = tracking.get_db(identifier)
             cursor = conn.execute(
-                'SELECT revision, message_id, message_count,'
-                ' seen_message_count FROM series'
-                ' WHERE change_id = ?',
+                'SELECT revision, message_id FROM series WHERE change_id = ?',
                 (change_id,),
             )
             row = cursor.fetchone()
+            # Counts are not on this row to reset: the series now points at
+            # v13's catalog entry, which starts out uncounted.
+            counts = conn.execute(
+                'SELECT message_count, seen_message_count FROM revisions'
+                ' WHERE change_id = ? AND revision = 13',
+                (change_id,),
+            ).fetchone()
             conn.close()
             assert row is not None
             assert row[0] == 13
             assert row[1] == 'v13@ex.com'
-            assert row[2] is None  # message_count reset
-            assert row[3] is None  # seen_message_count reset
+            assert counts is None or (counts[0] is None and counts[1] is None)
 
 
 class TestTrackingSnooze:

-- 
2.53.0

