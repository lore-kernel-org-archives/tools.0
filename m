Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C3B402BA1
	for <tools@linux.kernel.org>; Wed, 12 Aug 2026 21:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786571247; cv=none; b=hZQM16JPORrwXjf5eRP+l5zKNYlEJIS8+Kz1uyp7AohVmvuI8HQdltuLpo2diH7FlUeYpnF0pJPmUewdLRJ4uXgSKB4MajjE4xlWot3LTXJ5ioZZinjeX4Lt+QWqymQ0j/wmLc4TYdnu/lfzgoDsGXEgByN9aEZfXuK6Eud2rlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786571247; c=relaxed/simple;
	bh=QWscLY+TtkPKjwyykQFdEOcCJifc/ui1gNmQRRMrbDU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uWYjVejAjeo2kHoGum4JWsKszqMfHnFNqVrT4ekHF5ooVf0H76bWviO7f+WkyQD0pN854nDOvkhnLmTCZbgNJZ3+5bbHgNV6ms2twPeqzMQA233+wsR/FVf07uu2sBqcqNPKdffHhGGz5pIHJ2v/4HoK05gvsiP7yS72V6OMYWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oVKRU+0/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oVKRU+0/"
Received: by smtp.kernel.org (Postfix)
	id CAC031F00A3D; Wed, 12 Aug 2026 21:47:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C59211F000E9;
	Wed, 12 Aug 2026 21:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786571244;
	bh=GYqPB9hnxCHqAETpiMQO3iPerzc0cMp7SdVmWiOywpU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=oVKRU+0/vyoeepURXfKrvlxhm/dXlGZNyUUEHW2kK5N1HbdGj8UrRRsBqO9J98nvi
	 IblD2Vid3kwOs1dGZIicHNqbs9Ja0hTUhcp2BWR07w4NlmjXgddCZuTlECdI4pXP/K
	 kfJ/B/bYxEtNS4PneIb/n5W2dQkHfVOVA67p/2jJY91oQy4Y3GzSEMuHP8/QREW9Ey
	 MLhJXDPmppF+h8fZ5tQa+ELp97OEiJXC9qmH9bA9eOwWuksclDByMOHx1zRTpmnY7M
	 pp0Bz2OLh5P+KPKdV0SCPca+IulGYu3IDUteb3ZltfLj5WJsKShFAWI3JnH3RGyv+5
	 UR0fmXaPl2h+Q==
From: Christian Brauner <brauner@kernel.org>
Date: Wed, 12 Aug 2026 23:46:53 +0200
Subject: [PATCH RFC v2 12/25] review-tui: poll every revision on u/U
 updates
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260812-work-b4-multiver-rows-v2-12-305d53cd723a@kernel.org>
References: <20260812-work-b4-multiver-rows-v2-0-305d53cd723a@kernel.org>
In-Reply-To: <20260812-work-b4-multiver-rows-v2-0-305d53cd723a@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.17-dev-362b8
X-Developer-Signature: v=1; a=openpgp-sha256; l=35087; i=brauner@kernel.org;
 h=from:subject:message-id; bh=QWscLY+TtkPKjwyykQFdEOcCJifc/ui1gNmQRRMrbDU=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTVvLwl96BryvY3N6M9DmxT1dN49/NZc8XtTreQi4cOz
 N5pJRWm1FHKwiDGxSArpsji0G4SLrecp2KzUaYGzBxWJpAhDFycAjCR17sZGbYuY8h6cHllzpFF
 l8v5OqNfmSvdctxnFx2Tc4z5YcsO/TeMDFPFjJ5WG27oKvp4iGuhQ4POhYo/D00mrOB02qBflfD
 JlgcA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Hook update_revision_message_counts() into the per-series update loop so
every known version of a tracked series gets new-mail detection, not just
the tracked revision.  Revisions discovered by update_series_tracking()
moments earlier are picked up in the same pass, because the poller
re-reads the catalog.

A series whose branch is busy is still polled.  Only the branch is left
alone, and the ref catches up on a later sweep, while the poll writes DB
rows and a loose blob and moves no ref.  A series under review is
normally the checked-out branch, so exempting it would mute exactly the
series being worked on.  Its tracked revision's counts keep landing too,
with the tracking-commit save withheld: the thread snapshot behind
seen_bump moves onto the revision's catalog row so it keeps advancing
while the ref is frozen, and the skip is reported only for statuses whose
branch the sweep would have written.

Quiet old versions are re-polled on a schedule keyed to how recently
their thread saw mail.  An explicit u/U bypasses that minimum-age skip,
since a recently checked version silently withheld reads as the update
not working.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/review/_review.py           | 184 ++++++++++++++++++++++++++++++-------
 src/b4/review/tracking.py          | 154 ++++++++++++++++++++++++++++---
 src/b4/review_tui/_common.py       |   4 +-
 src/b4/review_tui/_modals.py       |   8 ++
 src/b4/review_tui/_review_app.py   |   2 +-
 src/b4/review_tui/_tracking_app.py |  16 +++-
 src/tests/test_review_tracking.py  |  20 ++--
 7 files changed, 331 insertions(+), 57 deletions(-)

diff --git a/src/b4/review/_review.py b/src/b4/review/_review.py
index f566dbfd..652f21a5 100644
--- a/src/b4/review/_review.py
+++ b/src/b4/review/_review.py
@@ -34,6 +34,10 @@ logger = b4.logger
 REVIEW_MAGIC_MARKER = '--- b4-review-tracking ---'
 REVIEW_BRANCH_PREFIX = 'b4/review/'
 COMMIT_MESSAGE_PATH = ':message'
+# Statuses whose review branch the update sweep rewrites (trailer
+# follow-ups, tracking-commit refreshes); every other status leaves the
+# branch strictly alone.
+BRANCH_UPDATE_STATUSES = ('reviewing', 'replied', 'partial', 'waiting')
 # Synthesized into the cover text when the author sent no cover letter;
 # consumers check for it to detect cover-letter absence.
 NO_COVER_NOTE = 'NOTE: No cover letter provided by the author.'
@@ -1909,7 +1913,7 @@ def _integrate_followup_inline_comments(
     Returns True if any comments were integrated.
     """
     series = tracking['series']
-    blob_sha = series.get('thread-blob', '')
+    blob_sha = b4.review.tracking.resolve_thread_blob(topdir, series)
     if not blob_sha:
         return False
 
@@ -2392,23 +2396,46 @@ def _own_message_entries(
     return entries
 
 
-def _prev_thread_msgids(topdir: str, change_id: str) -> Optional[Set[str]]:
+def _prev_thread_msgids(
+    topdir: str, identifier: str, change_id: str, revision: int
+) -> Optional[Set[str]]:
     """Msgids from the previously stored thread blob, or None if unavailable.
 
     None means "no reliable previous snapshot" — callers must treat that
     as "cannot tell which messages are new" and skip any accounting that
     depends on it.
+
+    The revision's catalog row is the authoritative snapshot: it advances
+    on every counted fetch, including sweeps that must not touch the
+    tracking ref because the branch is checked out.  The tracking commit's
+    blob covers only rows from before the catalog copy existed —
+    preferring it while the ref was frozen re-counted the same messages
+    as new on every sweep.  A recorded catalog blob that no longer reads
+    back (git gc pruned it) is no snapshot at all, not a fallback case.
     """
-    branch = REVIEW_BRANCH_PREFIX + change_id
-    if not b4.git_branch_exists(topdir, branch):
-        return None
+    blob_sha = ''
     try:
-        _, tracking = load_tracking(topdir, branch)
-    except (SystemExit, Exception):
+        conn = b4.review.tracking.get_db(identifier)
+        try:
+            blob_sha = (
+                b4.review.tracking.get_revision_thread_blob(conn, change_id, revision)
+                or ''
+            )
+        finally:
+            conn.close()
+    except Exception:
         return None
-    blob_sha = tracking.get('series', {}).get('thread-blob', '')
     if not blob_sha:
-        return None
+        branch = REVIEW_BRANCH_PREFIX + change_id
+        if not b4.git_branch_exists(topdir, branch):
+            return None
+        try:
+            _, tracking = load_tracking(topdir, branch)
+        except (SystemExit, Exception):
+            return None
+        blob_sha = tracking.get('series', {}).get('thread-blob', '')
+        if not blob_sha:
+            return None
     mbox_bytes = b4.review.tracking.get_thread_mbox(topdir, blob_sha)
     if not mbox_bytes:
         return None
@@ -2548,22 +2575,21 @@ def update_series_tracking(
     # as a side effect of updating.  Do not re-add auto-promotion here.
 
     # Update follow-up trailers if the series has a review branch.  A
-    # branch that is checked out (in any worktree) is left strictly
-    # alone: the maintainer is working on it right there, possibly
-    # mid-rebase, and rewriting its tip under them risks corrupting
-    # their work.  The database updates above have already happened;
-    # the tracking commit catches up on the next sweep after the
-    # branch is no longer checked out.
+    # branch whose worktree has a git operation in flight is left strictly
+    # alone: the maintainer is mid-am or mid-rebase right there, and that
+    # state names the tip this would replace.  The database updates above
+    # have already happened; the tracking commit catches up on the next
+    # sweep that finds the worktree free.
     branch = f'b4/review/{change_id}'
-    update_branch = bool(topdir) and status in (
-        'reviewing',
-        'replied',
-        'partial',
-        'waiting',
-    )
-    if update_branch and topdir and b4.git_branch_checked_out(topdir, branch):
-        logger.debug('%s is checked out, leaving the branch alone', branch)
-        result['checked_out'] = True
+    # Asked only for the statuses whose branch this would write, and only
+    # to *report* the skip -- save_tracking_ref declines on its own, so
+    # nothing below depends on getting this right.  Every other status
+    # short-circuits before the lookup, which is what keeps a sweep from
+    # spending a `git worktree list` per series to learn nothing.
+    update_branch = bool(topdir) and status in BRANCH_UPDATE_STATUSES
+    if update_branch and topdir and b4.git_worktree_busy(topdir, branch):
+        logger.debug('%s is mid-operation, leaving the branch alone', branch)
+        result['branch_busy'] = True
         update_branch = False
     if update_branch and topdir:
         wantver = current_rev
@@ -2665,7 +2691,9 @@ def update_series_tracking(
                 if own_entries:
                     messages.set_flags_bulk(mconn, own_entries, 'Seen')
             if topdir:
-                prev_msgids = _prev_thread_msgids(topdir, change_id)
+                prev_msgids = _prev_thread_msgids(
+                    topdir, identifier, change_id, current_rev
+                )
                 if prev_msgids is not None:
                     new_msgids = []
                     for msg in thread_msgs:
@@ -2725,6 +2753,7 @@ def update_all_tracking(
     series_list: Optional[List[Dict[str, Any]]] = None,
     progress_cb: Optional[Callable[[int, int, str], None]] = None,
     cancel_cb: Optional[Callable[[], bool]] = None,
+    force_revision_poll: bool = False,
 ) -> Dict[str, Any]:
     """Rescan branches, then fetch threads and update all tracked series.
 
@@ -2737,10 +2766,16 @@ def update_all_tracking(
     are updated.  *progress_cb*, when provided, is called as
     ``progress_cb(completed, total, subject)`` around each series.
     *cancel_cb* is polled between series; returning True stops the
-    sweep.
+    sweep.  *force_revision_poll* makes the per-revision poller ignore
+    its minimum-age skip -- set for a user-initiated refresh, where a
+    recently checked version being skipped silently reads as the update
+    not working; scheduled sweeps leave old quiet versions on their
+    schedule.
 
     Returns a summary dict with keys: series_checked, series_updated,
-    errors, gone, followup_updated, error_details, cancelled.
+    errors, gone, followup_updated, revision_counts_updated,
+    revision_errors, revision_fresh_errors, revision_polled,
+    error_details, cancelled.
     """
     result: Dict[str, Any] = {
         'series_checked': 0,
@@ -2748,7 +2783,11 @@ def update_all_tracking(
         'errors': 0,
         'gone': 0,
         'followup_updated': 0,
-        'checked_out_skipped': 0,
+        'revision_counts_updated': 0,
+        'revision_errors': 0,
+        'revision_fresh_errors': 0,
+        'revision_polled': 0,
+        'branch_busy_skipped': 0,
         'error_details': [],
         'cancelled': False,
     }
@@ -2796,14 +2835,73 @@ def update_all_tracking(
                 result['errors'] += 1
                 submitter = series.get('sender_name', 'unknown')
                 result['error_details'].append((submitter, r['error']))
-            if r.get('checked_out'):
-                result['checked_out_skipped'] += 1
             if r.get('counts_updated'):
                 result['followup_updated'] += 1
 
+            if r.get('branch_busy'):
+                # Only the branch was left alone.  The per-revision poll
+                # below writes DB rows and a loose blob, moves no ref, and
+                # a series under review is normally the checked-out branch
+                # -- skipping it here is what stopped late replies to old
+                # versions being noticed at all.
+                result['branch_busy_skipped'] += 1
+
             if progress_cb:
                 progress_cb(i + 1, total, subject)
 
+        # Poll non-tracked revisions for new mail; revisions discovered by
+        # update_series_tracking moments ago are picked up because the
+        # poller re-reads the catalog.  Capped per series: this is one lore
+        # round-trip per revision on top of the per-series fetch, and late
+        # replies land on recent versions.
+        #
+        # One call for the whole list, which is what the signature takes.
+        # Handing it a series at a time reopened the database for every
+        # entry, and scoped its own offline short-circuit to a single
+        # series so a sweep run off the network never stopped early.
+        if not result['cancelled']:
+            # The bar reached N/N when the loop above finished, and the
+            # poll below can be minutes of lore traffic; keep feeding it or
+            # the display reads as hung.  Held at N/N: the series it
+            # counts are all done, and walking the bar backwards through a
+            # second pass over the same list read as a restarted sweep.
+            def _poll_status(subject: str) -> None:
+                if progress_cb:
+                    progress_cb(total, total, f'Polling earlier revisions: {subject}')
+
+            try:
+                rc = b4.review.tracking.update_revision_message_counts(
+                    identifier,
+                    series_list,
+                    topdir=topdir,
+                    max_revisions_per_series=b4.review.tracking.REVISION_POLL_LIMIT,
+                    cancel_cb=cancel_cb,
+                    status_cb=_poll_status if progress_cb else None,
+                    force=force_revision_poll,
+                )
+                result['revision_counts_updated'] += rc.get('new_mail', 0)
+                # Counted separately from result['errors'], which drives
+                # the per-series error report: a revision that will not
+                # fetch is not a series that failed to update.  Without
+                # it a poller that never works (a bad linkmask, 404ing
+                # message-ids) is indistinguishable from a quiet list.
+                result['revision_errors'] += rc.get('errors', 0)
+                result['revision_fresh_errors'] += rc.get('fresh_errors', 0)
+                result['revision_polled'] += rc.get('polled', 0)
+                if rc.get('cancelled'):
+                    result['cancelled'] = True
+            except liblore.OperationCancelledError:
+                result['cancelled'] = True
+            except Exception as ex:
+                # Counted, not just logged.  A poll that raises has failed
+                # exactly as surely as one whose fetch came back empty,
+                # and at debug level the whole feature can break -- a
+                # locked database, a regression in the poll path -- while
+                # every sweep goes on reporting a clean run.
+                result['revision_errors'] += 1
+                result['revision_fresh_errors'] += 1
+                logger.debug('Per-revision count update failed: %s', ex)
+
     return result
 
 
@@ -2892,11 +2990,33 @@ def _cron_update(identifier: str, topdir: Optional[str]) -> None:
         )
     else:
         logger.debug('Checked %s series, no updates', result['series_checked'])
-    if result.get('checked_out_skipped'):
+    if result.get('revision_counts_updated'):
+        logger.info(
+            'New mail on %s non-tracked revision(s)',
+            result['revision_counts_updated'],
+        )
+    if result.get('revision_errors'):
+        # Out of error_details (not a per-series failure).  Warned -- and
+        # thus turned into cron mail -- only when the whole poll came back
+        # empty AND something failed for the first time.  A permanently
+        # dead message-id fails on every pass; once it is known dead
+        # (attempted before, never fetched once) each further failure is
+        # old news, and when it is the only candidate at all, gating on
+        # the others' success alone still mailed the maintainer forever.
+        if result.get('revision_polled') or not result.get('revision_fresh_errors'):
+            logger.debug(
+                'Could not poll %s non-tracked revision(s)', result['revision_errors']
+            )
+        else:
+            logger.warning(
+                'Could not poll %s non-tracked revision(s)', result['revision_errors']
+            )
+    if result.get('branch_busy_skipped'):
         # Normal while the maintainer works on a branch — debug, not
         # cron mail.  The branch catches up on a later sweep.
         logger.debug(
-            '%s branch(es) checked out, left alone', result['checked_out_skipped']
+            '%s branch(es) mid-operation, left alone',
+            result['branch_busy_skipped'],
         )
     for submitter, error in result['error_details']:
         logger.warning('Update error (%s): %s', submitter, error)
diff --git a/src/b4/review/tracking.py b/src/b4/review/tracking.py
index 68701238..1b26d722 100644
--- a/src/b4/review/tracking.py
+++ b/src/b4/review/tracking.py
@@ -1360,6 +1360,23 @@ def set_revision_series_blob(
     return cursor.rowcount > 0
 
 
+def get_revision_thread_blob(
+    conn: sqlite3.Connection, change_id: str, revision: int
+) -> Optional[str]:
+    """The git blob SHA of a revision's cached thread mbox, if one is recorded.
+
+    The read half of :func:`set_revision_thread_blob`.  A caller that only
+    wants the snapshot has no business selecting a column out of the
+    catalog by hand, and one that wants the whole row has
+    :func:`get_revisions`.
+    """
+    row = conn.execute(
+        'SELECT thread_blob FROM revisions WHERE change_id = ? AND revision = ?',
+        (change_id, revision),
+    ).fetchone()
+    return str(row[0]) if row is not None and row[0] else None
+
+
 def add_series_patches(
     conn: sqlite3.Connection, change_id: str, revision: int, lser: 'b4.LoreSeries'
 ) -> None:
@@ -2937,6 +2954,14 @@ def update_message_count_from_msgs(
     *seen_bump* — the caller's count of new-to-the-thread messages that
     are already read (e.g. the maintainer's own replies).
 
+    The thread snapshot always lands on the revision's catalog row, so
+    "which messages were already counted" keeps advancing sweep over
+    sweep even when the tracking commit cannot be refreshed alongside it
+    -- reusing a stale snapshot re-counted the same already-read messages
+    into *seen_bump* every sweep, silently clearing unread badges.  The
+    tracking commit is offered the same snapshot and declines on its own
+    if the branch's worktree is mid-operation; no caller has to ask.
+
     Returns True if the database was changed, False otherwise.
     """
     now = datetime.datetime.now(datetime.timezone.utc).isoformat()
@@ -2955,9 +2980,21 @@ def update_message_count_from_msgs(
     if verdict is None:
         # Unchanged total: stamp the check time and leave the counts --
         # and the cached thread, which this writer overwrites rather than
-        # merging -- alone.
+        # merging -- alone.  Unless git gc has taken that thread since: a
+        # settled series' count never moves again, so this path is its only
+        # chance to notice, and the tracked revision is the one revision the
+        # poller skips, so nothing else will.
         _stamp_check(conn, change_id, revision, now)
         conn.commit()
+        if msgs:
+            _ensure_thread_blob(
+                conn,
+                topdir,
+                change_id,
+                revision,
+                get_revision_thread_blob(conn, change_id, revision),
+                msgs,
+            )
         return False
 
     new_count, new_seen = verdict
@@ -2969,7 +3006,10 @@ def update_message_count_from_msgs(
     _touch_last_mail(conn, change_id, revision, last_mail)
     conn.commit()
     if topdir and msgs:
-        _store_thread_blob(topdir, change_id, msgs)
+        # One serialization and one hash-object for both writers: the SHA
+        # the catalog just recorded is the one the tracking commit needs.
+        blob_sha = store_revision_thread_blob(conn, topdir, change_id, revision, msgs)
+        _store_thread_blob(topdir, change_id, msgs, blob_sha=blob_sha)
     return True
 
 
@@ -3057,12 +3097,22 @@ def _store_revision_blob(
     return blob_sha
 
 
-def _store_thread_blob(topdir: str, change_id: str, msgs: List[Any]) -> Optional[str]:
+def _store_thread_blob(
+    topdir: str, change_id: str, msgs: List[Any], blob_sha: Optional[str] = None
+) -> Optional[str]:
     """Serialize msgs to mboxrd and write as a git blob; update tracking commit.
 
     Also writes thread-context-blob (the plain-text rendered context for the
     AI agent) in the same save_tracking_ref call to avoid a second write.
 
+    *blob_sha* is the SHA these same messages were already written under.
+    Blobs are content-addressed, so re-serializing the mbox and hashing it
+    again only produces the same SHA at the cost of a second
+    ``hash-object`` -- and the caller that caches the thread on the
+    revision's catalog row immediately before calling here has it in hand.
+    Omitted, or None because that write failed, the mbox is written here as
+    before.
+
     Returns the mbox blob SHA, or None on failure.  Non-fatal: a failure here
     just means the next 'f' press will fall back to a live lore fetch.
     """
@@ -3070,7 +3120,8 @@ def _store_thread_blob(topdir: str, change_id: str, msgs: List[Any]) -> Optional
     # that would occur if `import b4.review` appeared after a `b4.xxx` call.
     import b4.review as _b4_review
 
-    blob_sha = _write_mbox_blob(topdir, msgs)
+    if blob_sha is None:
+        blob_sha = _write_mbox_blob(topdir, msgs)
     if blob_sha is None:
         logger.debug('Could not write thread blob for %s', change_id)
         return None
@@ -3357,6 +3408,55 @@ def render_prior_review_context(
     return '\n'.join(lines)
 
 
+def resolve_thread_blob(topdir: Optional[str], series: Dict[str, Any]) -> str:
+    """The freshest recorded thread snapshot for a revision, or '' if none.
+
+    The catalog first, the tracking commit second -- the same precedence
+    :func:`b4.review._prev_thread_msgids` uses, and for the same reason.  A
+    sweep whose branch is checked out must not move the ref, which is the
+    normal state for a series under review, so it advances the catalog copy
+    and leaves the tracking commit's behind.  A reader on the tracking
+    commit alone then serves a thread from before the checkout for as long
+    as the review lasts, and the follow-ups the sweep counted -- the ones
+    that raised the unread badge -- are exactly what it cannot see.
+
+    *series* is a tracking-commit series block, so its keys are the
+    hyphenated ones :func:`b4.review.save_tracking_ref` writes.  The
+    change_id and revision are read out of it rather than passed beside
+    it: a caller that supplies them separately can disagree with the dict
+    it also supplies, and an empty change_id then fails silently -- it
+    skips the catalog and serves the very copy this function exists to
+    stop preferring.
+
+    A recorded SHA that git has since pruned is not a snapshot either.
+    Thread blobs are written with ``hash-object -w`` and referenced only
+    from the database, so any gc may take one while the row keeps its SHA
+    -- and the tracking commit names a different blob, which may still be
+    there.
+
+    Falls back rather than failing: the tracking commit is where this lived
+    before the catalog had a copy, and a database that cannot be opened is
+    not a reason to show nothing.
+    """
+    change_id = str(series.get('change-id') or '')
+    if topdir and change_id:
+        try:
+            identifier = get_repo_identifier(topdir)
+            if identifier:
+                conn = get_db(identifier)
+                try:
+                    sha = get_revision_thread_blob(
+                        conn, change_id, int(series.get('revision') or 1)
+                    )
+                finally:
+                    conn.close()
+                if sha and _thread_blob_exists(topdir, sha):
+                    return sha
+        except Exception as ex:
+            logger.debug('Could not read the catalog thread blob: %s', ex)
+    return str(series.get('thread-blob') or '')
+
+
 def ensure_thread_context_blob(
     topdir: str, change_id: str, series: Dict[str, Any], patches: List[Dict[str, Any]]
 ) -> Optional[str]:
@@ -3375,7 +3475,7 @@ def ensure_thread_context_blob(
     if series.get('thread-context-blob'):
         return str(series['thread-context-blob'])
 
-    blob_sha = series.get('thread-blob')
+    blob_sha = resolve_thread_blob(topdir, series)
     if not blob_sha:
         return None
 
@@ -3661,6 +3761,16 @@ def _poll_due(rev: Dict[str, Any], now: str) -> bool:
     return True
 
 
+# Per-sweep cap on the non-tracked revisions polled for one series.  Each
+# costs a lore round-trip -- one per member patch for a rethreaded revision
+# -- and they are paid one after another before the update returns, so a
+# prolific series would otherwise answer a single 'u' with a round-trip per
+# version it has ever had.  Revisions past the cap come round on a later
+# sweep, oldest check first, so nothing is dropped and a settled series'
+# versions stop coming due all in the same pass.
+REVISION_POLL_LIMIT = 3
+
+
 def update_revision_message_counts(
     identifier: str,
     series_list: List[Dict[str, Any]],
@@ -3669,6 +3779,7 @@ def update_revision_message_counts(
     cancel_cb: Optional[Callable[[], bool]] = None,
     only_revisions: Optional[Set[int]] = None,
     status_cb: Optional[Callable[[str], None]] = None,
+    force: bool = False,
 ) -> Dict[str, int]:
     """Fetch and store thread message counts for non-tracked revisions.
 
@@ -3699,13 +3810,16 @@ def update_revision_message_counts(
     *cancel_cb* is polled between revisions so a cancelled sweep stops
     here rather than grinding through the rest of the catalog.
     *only_revisions* narrows the poll to named versions, for a caller
-    that knows which ones it wants counted; naming them also bypasses the
-    minimum-age skip, since the caller is asking now.  *status_cb*, when
-    given, is handed each polled series' subject, so a caller driving a
-    progress display has something to show during what is otherwise
-    minutes of silent lore traffic.  A subject and nothing else: how far
-    along a sweep is belongs to the sweep, which knows how many series it
-    handed over and has already drawn a bar for them.
+    that knows which ones it wants counted.  *force* bypasses the
+    minimum-age skip -- the explicit interactive refresh, where skipping a
+    recently checked version silently would read as the update not
+    working.  Naming revisions implies it, since a caller that asked for
+    those versions is asking now; the per-sweep cap still applies to both.
+    *status_cb*, when given, is handed each polled series' subject, so a
+    caller driving a progress display has something to show during what
+    is otherwise minutes of silent lore traffic.  A subject and nothing
+    else: how far along a sweep is belongs to the sweep, which knows how
+    many series it handed over and has already drawn a bar for them.
 
     Returns ``{'updated': n, 'new_mail': n, 'errors': n,
     'fresh_errors': n, 'polled': n, 'cancelled': 0-or-1}``.  *cancelled*
@@ -3728,10 +3842,22 @@ def update_revision_message_counts(
     fresh_errors = 0
     polled_total = 0
     cancelled = False
+    # Asking for named versions is asking now, so it carries the same
+    # weight as the flag rather than being a second thing to test for.
+    force = force or only_revisions is not None
     # The same set update_all_tracking() drops, no wider: a late reply lands
     # on an old version of an applied series just as readily as on its
     # tracked one, which is polled past 'accepted'/'thanked' for that reason.
-    skip_statuses = frozenset(('archived', 'snoozed'))
+    #
+    # Snoozed is a sweep policy -- "do not spend the network on this on my
+    # behalf" -- so an explicit single-series ask lifts it: 'u' on a snoozed
+    # row already updates that series' tracked revision, and polling its
+    # other versions is the half of the same request.  Archived is not a
+    # policy but a fact: those rows are filtered out of the tracking list,
+    # so there is no row to press 'u' on and nothing to lift.
+    skip_statuses = (
+        frozenset(('archived',)) if force else frozenset(('archived', 'snoozed'))
+    )
 
     try:
         conn = get_db(identifier)
@@ -3807,7 +3933,7 @@ def update_revision_message_counts(
                     cancelled = True
                     break
                 now = datetime.datetime.now(datetime.timezone.utc).isoformat()
-                if only_revisions is None and not _poll_due(rev, now):
+                if not force and not _poll_due(rev, now):
                     continue
                 first_fetch = rev.get('message_count') is None
                 try:
diff --git a/src/b4/review_tui/_common.py b/src/b4/review_tui/_common.py
index 2d978441..34cd5d28 100644
--- a/src/b4/review_tui/_common.py
+++ b/src/b4/review_tui/_common.py
@@ -461,7 +461,9 @@ class CheckRunnerMixin:
             try:
                 with _quiet_worker():
                     _cover, tracking = b4.review.load_tracking(topdir, review_branch)
-                blob_sha = tracking.get('series', {}).get('thread-blob', '')
+                blob_sha = b4.review.tracking.resolve_thread_blob(
+                    topdir, tracking.get('series', {})
+                )
                 fd, tracking_file = tempfile.mkstemp(
                     prefix='b4-tracking-', suffix='.json'
                 )
diff --git a/src/b4/review_tui/_modals.py b/src/b4/review_tui/_modals.py
index 4acfd0da..23d5f566 100644
--- a/src/b4/review_tui/_modals.py
+++ b/src/b4/review_tui/_modals.py
@@ -2814,12 +2814,19 @@ class UpdateAllScreen(ModalScreen[Dict[str, Any]]):
         identifier: str,
         linkmask: str,
         topdir: Optional[str] = None,
+        force_revision_poll: bool = False,
     ) -> None:
         super().__init__()
         self._series_list = series_list
         self._identifier = identifier
         self._linkmask = linkmask
         self._topdir = topdir
+        # 'u' on one series: the maintainer is asking about that series
+        # right now, so a recently checked version is polled rather than
+        # silently skipped.  'U' leaves the schedule alone -- forcing it
+        # across a few hundred series turns one keypress into a
+        # REVISION_POLL_LIMIT-sized burst of lore traffic per series.
+        self._force_revision_poll = force_revision_poll
         self._cancelled = False
         self._result: Dict[str, Any] = {
             'series_checked': 0,
@@ -2868,6 +2875,7 @@ class UpdateAllScreen(ModalScreen[Dict[str, Any]]):
                     series_list=self._series_list,
                     progress_cb=_on_progress,
                     cancel_cb=_should_cancel,
+                    force_revision_poll=self._force_revision_poll,
                 )
             except b4.LockHeldError:
                 self._result['busy'] = True
diff --git a/src/b4/review_tui/_review_app.py b/src/b4/review_tui/_review_app.py
index 7fe707bb..47d448ed 100644
--- a/src/b4/review_tui/_review_app.py
+++ b/src/b4/review_tui/_review_app.py
@@ -2084,7 +2084,7 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
         self._show_external_comments = True
 
         # ── Try local blob first, fall back to lore in background ────────────
-        blob_sha = self._series.get('thread-blob', '')
+        blob_sha = b4.review.tracking.resolve_thread_blob(self._topdir, self._series)
         self.notify('Loading follow-ups\u2026')
         run_lore_worker(
             self,
diff --git a/src/b4/review_tui/_tracking_app.py b/src/b4/review_tui/_tracking_app.py
index 42f0f46c..31601ded 100644
--- a/src/b4/review_tui/_tracking_app.py
+++ b/src/b4/review_tui/_tracking_app.py
@@ -2364,7 +2364,11 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
         self._focus_change_id = self._selected_series.get('change_id')
         self.push_screen(
             UpdateAllScreen(
-                [self._selected_series], self._identifier, linkmask, topdir
+                [self._selected_series],
+                self._identifier,
+                linkmask,
+                topdir,
+                force_revision_poll=True,
             ),
             callback=self._on_update_complete,
         )
@@ -2413,9 +2417,15 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
             parts.append(f'{updated} updated')
         if errors:
             parts.append(f'{errors} error(s)')
-        skipped = result.get('checked_out_skipped', 0)
+        rev_counts = result.get('revision_counts_updated', 0)
+        if rev_counts:
+            parts.append(f'{rev_counts} other revision(s) with new mail')
+        rev_errors = result.get('revision_errors', 0)
+        if rev_errors:
+            parts.append(f'{rev_errors} revision(s) unreachable')
+        skipped = result.get('branch_busy_skipped', 0)
         if skipped:
-            parts.append(f'{skipped} checked-out branch(es) left alone')
+            parts.append(f'{skipped} busy branch(es) left alone')
 
         severity: Literal['information', 'warning'] = (
             'warning' if errors else 'information'
diff --git a/src/tests/test_review_tracking.py b/src/tests/test_review_tracking.py
index c1f20649..df867938 100644
--- a/src/tests/test_review_tracking.py
+++ b/src/tests/test_review_tracking.py
@@ -4962,8 +4962,8 @@ class TestCmdForget:
         assert self._rows_left('forget-checkedout', 'cid-gone')['series'] == 1
 
 
-class TestUpdateSkipsCheckedOutBranch:
-    """update_series_tracking leaves a checked-out review branch alone."""
+class TestUpdateSkipsABusyWorktree:
+    """update_series_tracking leaves a mid-operation worktree alone."""
 
     def _tracking_data(self, change_id: str) -> Dict[str, Any]:
         return {
@@ -5025,20 +5025,28 @@ class TestUpdateSkipsCheckedOutBranch:
                 series_dict, 'co-test', 'https://example.com/%s', topdir=gitdir
             )
 
-    def test_checked_out_branch_left_alone(self, gitdir: str) -> None:
-        """A checked-out branch is skipped: flag set, tip untouched."""
+    def test_busy_worktree_left_alone(self, gitdir: str) -> None:
+        """A worktree mid-operation is skipped: flag set, tip untouched.
+
+        Checked out is not enough on its own -- the amend reuses the
+        branch's own tree, so a quiescent checkout survives it untouched.
+        What it would strand is the `git am` whose sequencer state names
+        the tip being replaced, and that is what this puts in the way.
+        """
         change_id = 'co-checkedout'
         branch = _create_review_branch(
             gitdir, change_id, self._tracking_data(change_id)
         )
         ecode, _ = b4.git_run_command(gitdir, ['checkout', branch])
         assert ecode == 0
+        # What `git am` leaves behind for as long as it is in flight.
+        os.makedirs(os.path.join(gitdir, '.git', 'rebase-apply'), exist_ok=True)
         ecode, tip_before = b4.git_run_command(gitdir, ['rev-parse', branch])
         assert ecode == 0
 
         result = self._run_update(gitdir, change_id)
 
-        assert result.get('checked_out') is True
+        assert result.get('branch_busy') is True
         assert result.get('error') is None
         ecode, tip_after = b4.git_run_command(gitdir, ['rev-parse', branch])
         assert ecode == 0
@@ -5054,7 +5062,7 @@ class TestUpdateSkipsCheckedOutBranch:
 
         result = self._run_update(gitdir, change_id)
 
-        assert result.get('checked_out') is None
+        assert result.get('branch_busy') is None
         assert result.get('error') == 'Could not find series v1 in retrieved messages'
 
 

-- 
2.53.0

