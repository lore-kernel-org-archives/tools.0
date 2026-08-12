Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BA7403E97
	for <tools@linux.kernel.org>; Wed, 12 Aug 2026 21:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786571256; cv=none; b=GZWpeB3XRgrKKjKd0x+rv0/iFY0nXZMjEYixUUD3xwJz19ot/3X8erPAa1Z9jSdRdO2DET3sBD1Jk3hBy5JONaYr8gFCIrrhGGwEmduTu/jo0qyHdMa5fywXjeKq2jN7cz7h68ZBa8LIz5FE4L77XxJntKUyJkDoL+/pHaxt3cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786571256; c=relaxed/simple;
	bh=BzCjqN4lSxnZaXEMmDP3MPM7TonnqSVELNVvPa7WaHU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s2i0MAxe6dlLoJzKdTjhanANkXMDFP/RB19/eC0xOE+JeW+8x3NbXsdoCPDL8pzi6Qk8ShB1AIppeVkU4PMNURZ6F2yH9Aeq9eSUyBEBR7ua1n85W6oLYpV5cJ3mLpI0aReiRlnjHrG8o+ZaLTMOSwkts++d4WuBALpJN/fTFKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O9cQFNXL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O9cQFNXL"
Received: by smtp.kernel.org (Postfix)
	id D48F01F00A3A; Wed, 12 Aug 2026 21:47:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AED981F000E9;
	Wed, 12 Aug 2026 21:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786571254;
	bh=k+5QmNuLVzAuQESwkDoA5HDdyMgR6btFR3LiamvGa/A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=O9cQFNXLotpIADtk/QG8yy6uh7ps5qh//wtRd9nOmb+SSjHLwS2fOGTCdbrJJ4dTI
	 yECfKCs7GAFFnwum4oukJdQCrDwdSYRBou9vVUK5wkSMdL34Dp0fPRyg/iAPRAvZwB
	 l9QNxMc05QPPbwiXNwX8FHq8GI9h1vhalM0FBXa2DTdW7qvrvKUMXLicaYjkx8/4+y
	 sH6YKQaZ0z6RGVvDd/nZ36Rwe5BvUiJTHpwquIHOYYpZc9lEnDXpLPGSDF9DEXd61n
	 S4pVDxOHt2Zzt6YY11wb65SZo8hZuVCmRv+IQjl8Ahvyok31qouxLkPGuWdD+0R0sr
	 6pPDxmjWgTMCA==
From: Christian Brauner <brauner@kernel.org>
Date: Wed, 12 Aug 2026 23:47:00 +0200
Subject: [PATCH RFC v2 19/25] review: add backward discovery of older
 series revisions
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260812-work-b4-multiver-rows-v2-19-305d53cd723a@kernel.org>
References: <20260812-work-b4-multiver-rows-v2-0-305d53cd723a@kernel.org>
In-Reply-To: <20260812-work-b4-multiver-rows-v2-0-305d53cd723a@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.17-dev-362b8
X-Developer-Signature: v=1; a=openpgp-sha256; l=20182; i=brauner@kernel.org;
 h=from:subject:message-id; bh=BzCjqN4lSxnZaXEMmDP3MPM7TonnqSVELNVvPa7WaHU=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTVvLxttzhr5a79YvrfvV48m1M7YbZPX92Urgv3N0iKL
 dz/ak+XSkcpC4MYF4OsmCKLQ7tJuNxynorNRpkaMHNYmUCGMHBxCsBEGvUY/vu+mGC2PjBoDvP0
 ldYRLtP6jC67LVFa+Xi96XGOUytbU1Yx/C/eeCosJE64R3/r5xbzmFVnPTtlK0MjlXYVfyyN3rG
 9nwMA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Auto-discovery only looks forward, so versions posted before a series was
tracked never enter the revisions catalog unless they shared the seed
thread.

Add discover_older_revisions().  It fetches the tracked thread and runs
the same get_extra_series() machinery b4 am/mbox uses to pull other
revisions, with an explicit wantvers covering every previous version,
since the backward search otherwise fetches only latest-1.  Newly
recorded revisions are polled immediately so they arrive with counts and
cached thread blobs.

The update sweep runs the same backward search once per series, latched
in a dedicated back_searched column.  Neither the catalog nor revision
provenance can record that a search ran and found nothing: the v11
backfill gives every series row a catalog entry, and offline tracking and
manual linking both stamp a source with no search behind them.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/review/_review.py  |  45 +++++---
 src/b4/review/tracking.py | 263 +++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 293 insertions(+), 15 deletions(-)

diff --git a/src/b4/review/_review.py b/src/b4/review/_review.py
index 68b5a7a0..2ed7c340 100644
--- a/src/b4/review/_review.py
+++ b/src/b4/review/_review.py
@@ -2497,22 +2497,38 @@ def update_series_tracking(
     if b4.can_network:
         try:
             _conn = b4.review.tracking.get_db(identifier)
-            _known = set(
-                r['revision']
-                for r in b4.review.tracking.get_revisions(_conn, change_id)
-            )
-            _conn.close()
+            try:
+                _rows = b4.review.tracking.get_revisions(_conn, change_id)
+                _searched = b4.review.tracking.is_back_searched(_conn, change_id)
+            finally:
+                _conn.close()
         except Exception:
-            _known = set()
+            _rows = []
+            _searched = False
+        _known = {r['revision'] for r in _rows}
 
         msgs = b4.mbox.get_extra_series(msgs, direction=1, nocache=True)
-        # Discount the tracked revision's own entry.  The v11 backfill gives
-        # every series row one, so a plain "is the catalog empty?" test is
-        # never true again and this one-shot search stopped running at all.
-        if current_rev > 1 and not (_known - {current_rev}):
+        # One-shot, latched on changes.back_searched.  The catalog alone
+        # cannot carry the latch: the v11 backfill gives every series row
+        # an entry, so "is the catalog empty?" is never true again, and
+        # discounting just the tracked revision re-ran this uncached
+        # subject+sender search on every sweep, forever, for any series
+        # whose older versions cannot be found.  Revision provenance
+        # cannot carry it either: offline tracking and manual linking
+        # both stamp a source with no search behind it, and a manual
+        # stamp can never be overwritten to record a later real search.
+        if current_rev > 1 and not _searched and not (_known - {current_rev}):
             msgs = b4.mbox.get_extra_series(
                 msgs, direction=-1, wantvers=list(range(1, current_rev)), nocache=True
             )
+            try:
+                _conn = b4.review.tracking.get_db(identifier)
+                try:
+                    b4.review.tracking.set_back_searched(_conn, change_id)
+                finally:
+                    _conn.close()
+            except Exception as ex:
+                logger.debug('Could not latch the backward search: %s', ex)
 
     lmbx = b4.LoreMailbox()
     for msg in msgs:
@@ -2562,7 +2578,13 @@ def update_series_tracking(
     try:
         conn = b4.review.tracking.get_db(identifier)
         new_revs = b4.review.tracking._record_discovered_revisions(
-            conn, change_id, lmbx, str(linkmask)
+            conn,
+            change_id,
+            lmbx,
+            str(linkmask),
+            # Offline the lmbx is just the cached thread with no search
+            # behind it; 'heuristic' keeps that provenance honest.
+            source='discovered' if b4.can_network else 'heuristic',
         )
         result['new_revisions'] = len(new_revs)
         try:
@@ -2684,7 +2706,6 @@ def update_series_tracking(
         if not save_tracking_ref(topdir, branch, cover_text, tracking):
             result['error'] = 'Error saving tracking data'
             return result
-
     elif topdir and has_review_branch:
         # The block above mirrors the catalog as part of its save, but it
         # only runs for four statuses.  Every other one still holds
diff --git a/src/b4/review/tracking.py b/src/b4/review/tracking.py
index 6662cd9e..843808c4 100644
--- a/src/b4/review/tracking.py
+++ b/src/b4/review/tracking.py
@@ -922,8 +922,19 @@ def cmd_track(cmdargs: argparse.Namespace) -> None:
         # Already tracked: fold any newly discovered revisions into the
         # existing series instead of creating a duplicate (bug 70fe607).
         new_revs = _record_discovered_revisions(
-            conn, existing_change_id, lmbx, linkmask, rethreaded_revs=rethreaded_revs
+            conn,
+            existing_change_id,
+            lmbx,
+            linkmask,
+            rethreaded_revs=rethreaded_revs,
+            # Offline the lmbx is just the fetched thread with no search
+            # behind it; 'heuristic' keeps that provenance honest.
+            source='discovered' if b4.can_network else 'heuristic',
         )
+        if b4.can_network and wanted_ver > 1:
+            # The backward search above covered the older versions; the
+            # update sweep's one-shot pass need not repeat it.
+            set_back_searched(conn, existing_change_id)
         srow = conn.execute(
             'SELECT status, revision FROM series WHERE change_id = ?',
             (existing_change_id,),
@@ -990,8 +1001,19 @@ def cmd_track(cmdargs: argparse.Namespace) -> None:
     )
     add_series_patches(conn, change_id, revision, lser)
     _record_discovered_revisions(
-        conn, change_id, lmbx, linkmask, rethreaded_revs=rethreaded_revs
+        conn,
+        change_id,
+        lmbx,
+        linkmask,
+        rethreaded_revs=rethreaded_revs,
+        # Offline the lmbx is just the fetched thread with no search
+        # behind it; 'heuristic' keeps that provenance honest.
+        source='discovered' if b4.can_network else 'heuristic',
     )
+    if b4.can_network and wanted_ver > 1:
+        # The backward search above covered the older versions; the update
+        # sweep's one-shot pass need not repeat it.
+        set_back_searched(conn, change_id)
     conn.close()
     # Mirror the catalog onto the review branch when one already exists (a
     # fresh track usually has none yet — this is then a harmless no-op).
@@ -1205,7 +1227,10 @@ def get_all_tracked_series(identifier: str) -> list[dict[str, Any]]:
 
 # Provenance ranking for a revision's `source`.  A higher rank wins: a manual
 # link must override, and never be downgraded by, automated discovery.
-_SOURCE_RANK = {'heuristic': 0, 'auto-consume': 0, 'manual': 1}
+# 'discovered' sits in between: unlike 'heuristic' (a row seeded from a series
+# row by backfill) it proves a discovery pass actually processed the series,
+# which is what the update sweep's one-shot backward search latches on.
+_SOURCE_RANK = {'heuristic': 0, 'auto-consume': 0, 'discovered': 1, 'manual': 2}
 
 
 def _source_rank(source: Optional[str]) -> int:
@@ -1588,6 +1613,25 @@ def _store_catalog_synced(
     _set_change_state(conn, change_id, catalog_synced=f'{branch_sha}:{catalog_sha}')
 
 
+def set_back_searched(conn: sqlite3.Connection, change_id: str) -> None:
+    """Latch "the backward revision search ran" for a change_id.
+
+    A dedicated stamp rather than an inference from revision provenance:
+    offline tracking and manual linking both write sources with no search
+    behind them, and a search that finds nothing writes no revision rows
+    at all.  Set once the search has run, found something or not.
+    """
+    _set_change_state(conn, change_id, back_searched=1)
+
+
+def is_back_searched(conn: sqlite3.Connection, change_id: str) -> bool:
+    """Whether the one-shot backward revision search already ran."""
+    row = conn.execute(
+        'SELECT back_searched FROM changes WHERE change_id = ?', (change_id,)
+    ).fetchone()
+    return bool(row and row[0])
+
+
 def sync_revisions_catalog_to_branch(
     topdir: Optional[str], identifier: str, change_id: str
 ) -> bool:
@@ -1994,12 +2038,33 @@ def _raw_revision_ref(
     return '', '', False
 
 
+def _revision_posted_at(lmbx: 'b4.LoreMailbox', revision: int) -> Optional[str]:
+    """When a discovered revision was posted, from its own Date: header.
+
+    The backward search records versions posted long before the series was
+    tracked, so dating them "now" would sort the oldest version after the
+    newest and report a year-old posting as found today.
+    """
+    msg = lmbx.covers.get(revision)
+    if msg is None:
+        for p in getattr(lmbx.series.get(revision), 'patches', None) or []:
+            if p is not None:
+                msg = p
+                break
+    date = getattr(msg, 'date', None)
+    if not isinstance(date, datetime.datetime):
+        return None
+    return date.astimezone(datetime.timezone.utc).isoformat()
+
+
 def _record_discovered_revisions(
     conn: sqlite3.Connection,
     change_id: str,
     lmbx: 'b4.LoreMailbox',
     linkmask: str,
     rethreaded_revs: Optional[Set[int]] = None,
+    source: str = 'discovered',
+    skip_revs: Optional[Set[int]] = None,
 ) -> List[int]:
     """Record every revision discovered in *lmbx* under *change_id*.
 
@@ -2014,12 +2079,30 @@ def _record_discovered_revisions(
     their member patch message-ids are recorded — fetching the recorded
     message-id alone would not reconstitute the series, so retrieval must read
     the stored patches instead.
+
+    *source* defaults to ``'discovered'``, the rank for versions a live
+    lore search turned up.  A caller recording from a cached thread with
+    no search behind it passes ``'heuristic'``, so a later real discovery
+    or manual link still outranks those rows.  Whether the one-shot
+    backward search has run is deliberately not inferred from here -- see
+    :func:`set_back_searched`.
+
+    Revisions in *skip_revs* are left out, for a caller that has decided
+    some of what it found is not its to record -- see
+    :func:`discover_older_revisions` and the strays it reports rather than
+    absorbs.  A parameter rather than the caller deleting entries from
+    *lmbx*: that mailbox is the caller's fetch, not a scratch buffer, and
+    a reader of it after this call should still see what came back.
     """
     if rethreaded_revs is None:
         rethreaded_revs = set()
+    if skip_revs is None:
+        skip_revs = set()
     known = {r['revision'] for r in get_revisions(conn, change_id)}
     new_revs: List[int] = []
     for v in sorted(lmbx.series.keys()):
+        if v in skip_revs:
+            continue
         v_ser = lmbx.series[v]
         is_rt = v in rethreaded_revs
         v_msgid, v_subject, from_cover = _raw_revision_ref(lmbx, v, rethreaded=is_rt)
@@ -2034,8 +2117,10 @@ def _record_discovered_revisions(
             v_subject,
             v_link,
             fingerprint=getattr(v_ser, 'fingerprint', None),
+            source=source,
             is_rethreaded=is_rt,
             subject_from_cover=from_cover,
+            found_at=_revision_posted_at(lmbx, v),
         )
         if is_rt:
             add_series_patches(conn, change_id, v, v_ser)
@@ -4241,6 +4326,178 @@ def _is_archived_only(conn: sqlite3.Connection, change_id: str) -> bool:
     return not (row[1] or 0)
 
 
+def discover_older_revisions(
+    identifier: str,
+    series: Dict[str, Any],
+    linkmask: str,
+    topdir: Optional[str] = None,
+    cancel_cb: Optional[Callable[[], bool]] = None,
+) -> Dict[str, Any]:
+    """Search lore for revisions older than the tracked one and record them.
+
+    Auto-discovery only looks forward, so versions posted before a series
+    was tracked never enter the catalog unless they happened to share the
+    seed thread.  This fetches the tracked revision's thread, runs the
+    backward lore search (change-id query when the cover carries one,
+    subject+sender otherwise, capped roughly a year back), records every
+    previously unknown revision, and immediately polls the series so the
+    new revisions get counts and cached thread blobs.
+
+    A rethreaded series is reassembled from its member patches before the
+    search runs.  Its recorded message-id is one patch's, so seeding from
+    that patch's thread alone hands :func:`b4.mbox.get_extra_series` a
+    mailbox with no cover in it -- and a patch numbered above 1 is skipped
+    outright there, leaving no base message and no query issued at all.
+
+    The search returns whole revisions, not per-patch threads, so an older
+    version that was posted with broken threading is recorded as a plain
+    revision: viewing it shows the thread of the message-id that was
+    matched rather than the reassembled series.  Rethreading a version
+    still has to go through a manual link.
+
+    A version that is already tracked as its own stray series is reported
+    rather than recorded -- see the ``conflicts`` key below.
+
+    Returns ``{'found': n, 'revisions': [..], 'conflicts': [..],
+    'error': str-or-None}`` where *found* counts genuinely new catalog
+    entries, *revisions* lists their version numbers, and *conflicts*
+    lists versions skipped because another series already tracks them.
+    """
+
+    def nothing(error: Optional[str] = None) -> Dict[str, Any]:
+        return {'found': 0, 'revisions': [], 'conflicts': [], 'error': error}
+
+    change_id = series.get('change_id', '')
+    message_id = series.get('message_id', '')
+    if not change_id or not message_id:
+        return nothing('no message-id for this series')
+    tracked_rev = int(series.get('revision') or 1)
+    if tracked_rev <= 1:
+        return nothing()
+    if not b4.can_network:
+        return nothing('offline')
+
+    # Same seed the per-revision poller uses, so a rethreaded series arrives
+    # reassembled from its member patches rather than as one patch's thread.
+    # Falls back to the plain fetch whenever the patch list cannot supply a
+    # series, which is what a non-rethreaded revision always does.
+    seed_conn = get_db(identifier)
+    try:
+        msgs = _fetch_revision_thread_msgs(
+            identifier,
+            seed_conn,
+            change_id,
+            {
+                'revision': tracked_rev,
+                'message_id': message_id,
+                'is_rethreaded': bool(series.get('is_rethreaded')),
+            },
+        )
+    finally:
+        seed_conn.close()
+    if not msgs:
+        return nothing(f'could not fetch thread for {message_id}')
+    # Same machinery b4 am/mbox uses to pull other revisions of a series,
+    # except we ask for every previous version at once — without an
+    # explicit wantvers the backward search only fetches latest-1.
+    wantvers = list(range(1, tracked_rev))
+    try:
+        msgs = b4.mbox.get_extra_series(
+            msgs, direction=-1, wantvers=wantvers, nocache=True
+        )
+    except liblore.OperationCancelledError:
+        raise
+    except Exception as ex:
+        return nothing(str(ex))
+
+    lmbx = b4.LoreMailbox()
+    for msg in msgs:
+        lmbx.add_message(msg)
+    if not lmbx.series:
+        return nothing()
+
+    conn = get_db(identifier)
+    try:
+        # The backward search just ran; the update sweep's one-shot pass
+        # need not repeat it.
+        set_back_searched(conn, change_id)
+        # Absorbing a stray removes that revision from the series that owns
+        # it, which a search action should not do unprompted: skip and
+        # report, [l] absorbs.
+        #
+        # Only for versions this change_id does not already have.  A series
+        # whose catalog already covers what the search turned up has nothing
+        # to link: [l] would absorb a posting it already holds, and since
+        # add_revision() is first-wins on message_id it would not even change
+        # the row -- it would only delete the series that owned the other
+        # copy.  A change_id synthesized per posting (the author sends no
+        # change-id trailer, so date+slug+fingerprint differ every version)
+        # puts every one of its versions in that state at once, which is how
+        # this came to report four conflicts on a series that had already
+        # catalogued all of them.
+        own = {r['revision'] for r in get_revisions(conn, change_id)}
+        conflicts = set()
+        for v in sorted(lmbx.series.keys()):
+            if v in own:
+                continue
+            if v == tracked_rev:
+                # The seed thread is the tracked revision's, so lmbx always
+                # holds it, and a stray duplicate of it matches here like any
+                # other.  Reporting it would send the maintainer to [l] to
+                # link the version they are already on.  Same reason
+                # new_revs below drops it.
+                #
+                # Only that one revision, not everything from it up: a newer
+                # version can ride along in the seed thread (an author
+                # posting vN+1 as a reply), and skipping the check for it
+                # would record a posting another series already owns without
+                # anyone being told.
+                continue
+            v_msgid, _, _ = _raw_revision_ref(lmbx, v)
+            fingerprint = getattr(lmbx.series[v], 'fingerprint', None)
+            if find_stray_revision(conn, change_id, v_msgid, fingerprint) is not None:
+                conflicts.add(v)
+        recorded = _record_discovered_revisions(
+            conn, change_id, lmbx, linkmask, skip_revs=conflicts
+        )
+    finally:
+        conn.close()
+
+    # The seed thread is the tracked revision's, so lmbx always holds it
+    # too, and it counts as new whenever the catalog had no row for it.
+    # Recording that row is worth having; reporting the version the
+    # maintainer is already on as an older one found is not.
+    new_revs = [v for v in recorded if v < tracked_rev]
+
+    if recorded:
+        # Mirror the new entries into the review branch's tracking commit,
+        # as every other _record_discovered_revisions caller does, so they
+        # travel with the branch on push.
+        if topdir:
+            sync_revisions_catalog_to_branch(topdir, identifier, change_id)
+    # Named outright so other revisions awaiting a first fetch cannot spend
+    # the budget on these -- but still inside it, or one [o] press on a v20
+    # series answers with 19 round-trips.
+    if new_revs:
+        try:
+            update_revision_message_counts(
+                identifier,
+                [series],
+                topdir=topdir,
+                only_revisions=set(new_revs),
+                max_revisions_per_series=REVISION_POLL_LIMIT,
+                cancel_cb=cancel_cb,
+            )
+        except liblore.OperationCancelledError:
+            pass
+    return {
+        'conflicts': sorted(conflicts),
+        'found': len(new_revs),
+        'revisions': sorted(new_revs),
+        'error': None,
+    }
+
+
 def mark_all_messages_seen(
     conn: sqlite3.Connection, change_id: str, revision: int
 ) -> None:

-- 
2.53.0

