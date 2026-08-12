Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CBD36D517
	for <tools@linux.kernel.org>; Wed, 12 Aug 2026 21:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786571253; cv=none; b=nxOVEOhwuVGWttplL63+KEBaxqQzA0S7CXWHLFVkn3qiza0uiCzUEf78AaJqpJCVvgaKDFVcEKvzU/mvxBsN9PfvK6aFlEv4feylYuhieQUeWNw8DayG4exBxtYvdnbvshPrZgcV2ggCRMcUm/qbVa87rxYizTbs38x75gkdZRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786571253; c=relaxed/simple;
	bh=8iMJjLvKe49dcccihy6c3zZeTT3MH/18LOocofyEu5o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lp57GqFQJmxor5CgI1vZlnMpknU5vOYbuUWrxafcdxRkpmIAaQrztP6ZP39iE6Rs8BfmFa20NZVZ7hhkPaboj6HHYoSBsN/VsLI6tpv4MvegmMnOadht2V/k116GE0K0ejOtmcljOLlAgxHwFzvJpCAEeLL+0Ueb1ykgUrCNKG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c2uGcXbJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c2uGcXbJ"
Received: by smtp.kernel.org (Postfix)
	id 162741F00A3A; Wed, 12 Aug 2026 21:47:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C5C21F000E9;
	Wed, 12 Aug 2026 21:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786571252;
	bh=aK+9nGx7FQ70oe0CKCGU1xDPgy651SAzMdS5ptakLuU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=c2uGcXbJRQLAy16tDZFV7jjWvlCkSnOXtEywGsDyZPZSttDqcLNrVnJFrRUp9P0q0
	 W0NECUwRC3RfoPAbn0Q299q2/JHHaA3gXcogic6gnF45wLBmt0Nqoq2WFHs6PNeA45
	 Q2Pvd8iTyb6xgRwiJfAOFCrjQH5S62YGBo0y1FP4vcgn4NORikB/Q590MXHSiRGlUz
	 dvtIoByCUt+Nw77vGMQd5YRRXbN1q9VjMTfBEkZx7uoS6obMa03FQhbwRHRcOB5mIW
	 Ch7p9xanCWOROEValwF50HZhNX1j85sGVX9rxfuBFKyTDwMgxR5D5Mwc+CIYrurgq7
	 AujRhDGG29BZw==
From: Christian Brauner <brauner@kernel.org>
Date: Wed, 12 Aug 2026 23:46:58 +0200
Subject: [PATCH RFC v2 17/25] review: skip the catalog mirror when nothing
 moved
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-work-b4-multiver-rows-v2-17-305d53cd723a@kernel.org>
References: <20260812-work-b4-multiver-rows-v2-0-305d53cd723a@kernel.org>
In-Reply-To: <20260812-work-b4-multiver-rows-v2-0-305d53cd723a@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.17-dev-362b8
X-Developer-Signature: v=1; a=openpgp-sha256; l=17351; i=brauner@kernel.org;
 h=from:subject:message-id; bh=8iMJjLvKe49dcccihy6c3zZeTT3MH/18LOocofyEu5o=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTVvLzNeer2TOv5j3v+REnKXA+T+slpvWT//y2yWu7lZ
 lt4tmw+0VHKwiDGxSArpsji0G4SLrecp2KzUaYGzBxWJpAhDFycAjCRfS4Mf3gmaVUwv2I+9u2/
 p9PiSX5P69dNve77jH3WiuAvWp/+2LQyMtxafyn565Pfjk1f/Q8X7erXWqiy93j6z9nudR8PbEx
 nDmQBAA==
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

sync_revisions_catalog_to_branch() is a no-op in the steady state, and
the update sweep lands there every pass for every series, so answering
"already current" should cost nothing.

Two things drive that.  The sweep only mirrors the catalog as part of a
branch save for four statuses, so every other status never mirrored at
all, even though those series still hold per-patch message-ids that
cannot be re-derived from the list; mirror them here instead of never.
Answering then has to stop costing a rev-parse plus a tracking-commit
read per series per pass.

changes.catalog_synced remembers "<branch-sha>:<catalog-sha1>" from the
last verified mirror.  While both halves still match, the branch reads
are skipped outright; rescan_branches() refreshes branch_sha at the start
of every sweep, and a pulled or rewritten branch changes it.  Any catalog
write or branch move breaks the pair and falls through to the full
compare-and-save.

The pair is a cache key.  A mismatch costs one extra tracking-commit
read, never a wrong answer.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/review/_review.py     | 40 +++++++++++++++++-
 src/b4/review/tracking.py    | 97 ++++++++++++++++++++++++++++++++++++--------
 src/tests/test_review.py     | 19 +++++----
 src/tests/test_tui_modals.py |  1 +
 4 files changed, 131 insertions(+), 26 deletions(-)

diff --git a/src/b4/review/_review.py b/src/b4/review/_review.py
index 652f21a5..68b5a7a0 100644
--- a/src/b4/review/_review.py
+++ b/src/b4/review/_review.py
@@ -2452,9 +2452,18 @@ def update_series_tracking(
     identifier: str,
     linkmask: str,
     topdir: Optional[str] = None,
+    review_branches: Optional[Set[str]] = None,
 ) -> Dict[str, Any]:
     """Fetch thread, discover revisions, update trailers for one series.
 
+    *review_branches*, when given, is every ``b4/review/*`` branch that
+    exists, as :func:`b4.review.tracking.rescan_branches` enumerated it at
+    the top of this sweep.  It answers "has this change_id a branch at
+    all?" without a subprocess, which the catalog mirror below would
+    otherwise ask git once per series and then have answered "no" for
+    every series that has never been checked out.  None means the caller
+    does not know, and the mirror falls back to asking.
+
     Returns {'new_revisions': int, 'new_trailers': int,
              'error': Optional[str]}.
     """
@@ -2581,6 +2590,11 @@ def update_series_tracking(
     # have already happened; the tracking commit catches up on the next
     # sweep that finds the worktree free.
     branch = f'b4/review/{change_id}'
+    # Whether there is a branch to write to at all, from the enumeration the
+    # sweep already did.  Believing a stale "yes" costs one sync that
+    # declines; a stale "no" defers the mirror by one sweep, and nothing
+    # creates a review branch while a sweep is running.
+    has_review_branch = review_branches is None or branch in review_branches
     # Asked only for the statuses whose branch this would write, and only
     # to *report* the skip -- save_tracking_ref declines on its own, so
     # nothing below depends on getting this right.  Every other status
@@ -2671,6 +2685,21 @@ def update_series_tracking(
             result['error'] = 'Error saving tracking data'
             return result
 
+    elif topdir and has_review_branch:
+        # The block above mirrors the catalog as part of its save, but it
+        # only runs for four statuses.  Every other one still holds
+        # per-patch message-ids that cannot be re-derived from the list, so
+        # mirror them here rather than never.  Cheap on the every-sweep
+        # steady state: the sync's catalog_synced watermark answers
+        # "already current" without touching git -- but only for a series
+        # that has a branch.  Without one there is no watermark to match
+        # and nothing to mirror onto, so the sync opens the database and
+        # spends a rev-parse every sweep only to decline.  A 'new' series
+        # is exactly that case, and a tracking list is mostly those.
+        b4.review.tracking.sync_revisions_catalog_to_branch(
+            topdir, identifier, change_id
+        )
+
     # Auto-mark the maintainer's own messages as read.  Two passes:
     # replies sent through b4 were already flagged Seen at send time and
     # match here by message-id; anything whose From exactly matches the
@@ -2795,10 +2824,15 @@ def update_all_tracking(
     with b4.lockfile_nb(_get_update_lock_path(identifier)):
         # Rescan local review branches first so the DB reflects current
         # on-disk state before the network update runs.
+        # The review branches that exist, enumerated once here rather than
+        # asked per series below.  Left None when the rescan could not run,
+        # which is the "do not know" the per-series check falls back on.
+        review_branches: Optional[Set[str]] = None
         if topdir:
             try:
                 rescan = b4.review.tracking.rescan_branches(identifier, topdir)
                 result['gone'] = rescan.get('gone', 0)
+                review_branches = rescan.get('branches')
             except Exception as ex:
                 logger.warning('Pre-update rescan failed: %s', ex)
 
@@ -2823,7 +2857,11 @@ def update_all_tracking(
                 # Called via the package attribute: it is the established
                 # patch seam for tests and TUI callers alike
                 r = b4.review.update_series_tracking(
-                    series, identifier, linkmask, topdir=topdir
+                    series,
+                    identifier,
+                    linkmask,
+                    topdir=topdir,
+                    review_branches=review_branches,
                 )
             except liblore.OperationCancelledError:
                 result['cancelled'] = True
diff --git a/src/b4/review/tracking.py b/src/b4/review/tracking.py
index c8d9e7d9..958b5180 100644
--- a/src/b4/review/tracking.py
+++ b/src/b4/review/tracking.py
@@ -8,6 +8,7 @@ __author__ = 'Konstantin Ryabitsev <konstantin@linuxfoundation.org>'
 import argparse
 import datetime
 import email.utils
+import hashlib
 import json
 import os
 import pathlib
@@ -1521,6 +1522,11 @@ def record_known_revisions(
     conn.commit()
 
 
+def _catalog_sha(known: List[Dict[str, Any]]) -> str:
+    """Content hash of a serialized revisions catalog, for the sync watermark."""
+    return hashlib.sha1(json.dumps(known, sort_keys=True).encode('utf-8')).hexdigest()
+
+
 def _set_change_state(conn: sqlite3.Connection, change_id: str, **cols: Any) -> None:
     """Upsert per-change_id state, creating the `changes` row if needed.
 
@@ -1567,6 +1573,21 @@ def forget_change_state(conn: sqlite3.Connection, change_id: str) -> None:
     conn.execute('DELETE FROM changes WHERE change_id = ?', (change_id,))
 
 
+def _store_catalog_synced(
+    conn: sqlite3.Connection, change_id: str, branch_sha: str, catalog_sha: str
+) -> None:
+    """Record a verified known-revisions mirror for the sync fast path.
+
+    The branch sha goes into the watermark and nowhere else.  `branch_sha`
+    means "the sha whose tracking commit the database has imported", and
+    only rescan_branches can say that; writing it here -- as a mirror of a
+    branch this side has only read -- made rescan_branches skip a branch it
+    had never imported, so a pushed status and its known-revisions block
+    were never replayed.  One column, one writer, one meaning.
+    """
+    _set_change_state(conn, change_id, catalog_synced=f'{branch_sha}:{catalog_sha}')
+
+
 def sync_revisions_catalog_to_branch(
     topdir: Optional[str], identifier: str, change_id: str
 ) -> bool:
@@ -1578,6 +1599,17 @@ def sync_revisions_catalog_to_branch(
     No-op (returns False) when there is no topdir, no such branch, or the
     catalog is already current.
 
+    The steady state is "already current", and the update sweep lands here
+    every pass for every series whose branch save does not mirror the
+    catalog itself -- accepted and thanked ones included -- so answering
+    must not cost git subprocesses.  ``changes.catalog_synced`` remembers
+    ``<branch-sha>:<catalog-sha1>`` from the last verified mirror: while
+    both sides still match (rescan_branches refreshes ``branch_sha`` at
+    the start of every sweep, and a pulled or rewritten branch changes
+    it), the branch reads are skipped outright.  Any catalog write or
+    branch move breaks the pair and falls through to the full
+    compare-and-save.
+
     A branch whose worktree is mid-operation is declined by
     :func:`b4.review.save_tracking_ref` itself, so there is no test for it
     here: the rule belongs to the write, and repeating it per caller is
@@ -1590,22 +1622,45 @@ def sync_revisions_catalog_to_branch(
     import b4.review
 
     branch = f'b4/review/{change_id}'
-    ecode, _ = b4.git_run_command(topdir, ['rev-parse', '--verify', branch])
-    if ecode != 0:
-        return False
-    try:
-        cover_text, tracking = b4.review.load_tracking(topdir, branch)
-    except (SystemExit, Exception):
-        return False
     conn = get_db(identifier)
+    known: Optional[List[Dict[str, Any]]] = None
+    catalog_sha = ''
     try:
-        known = build_known_revisions(conn, change_id)
+        row = conn.execute(
+            'SELECT branch_sha, catalog_synced FROM changes WHERE change_id = ?',
+            (change_id,),
+        ).fetchone()
+        if row is not None and row[0] and row[1]:
+            known = build_known_revisions(conn, change_id)
+            catalog_sha = _catalog_sha(known)
+            if row[1] == f'{row[0]}:{catalog_sha}':
+                return False
+
+        ecode, out = b4.git_run_command(topdir, ['rev-parse', '--verify', branch])
+        if ecode != 0:
+            return False
+        branch_sha = str(out.strip())
+        try:
+            cover_text, tracking = b4.review.load_tracking(topdir, branch)
+        except (SystemExit, Exception):
+            return False
+        if known is None:
+            known = build_known_revisions(conn, change_id)
+            catalog_sha = _catalog_sha(known)
+        if tracking.get('known-revisions') == known:
+            _store_catalog_synced(conn, change_id, branch_sha, catalog_sha)
+            return False
+        tracking['known-revisions'] = known
+        if not b4.review.save_tracking_ref(topdir, branch, cover_text, tracking):
+            return False
+        # The save just moved the branch; record the sha it moved to, so the
+        # next sweep matches without waiting for a rescan.
+        ecode, out = b4.git_run_command(topdir, ['rev-parse', '--verify', branch])
+        if ecode == 0:
+            _store_catalog_synced(conn, change_id, str(out.strip()), catalog_sha)
+        return True
     finally:
         conn.close()
-    if tracking.get('known-revisions') == known:
-        return False
-    tracking['known-revisions'] = known
-    return bool(b4.review.save_tracking_ref(topdir, branch, cover_text, tracking))
 
 
 _REVISION_COLS = (
@@ -4209,7 +4264,7 @@ def refresh_message_count(
 
 def rescan_branches(
     identifier: str, topdir: str, branch: Optional[str] = None
-) -> Dict[str, int]:
+) -> Dict[str, Any]:
     """Rescan review branches and sync status/metadata into the tracking DB.
 
     Iterates b4/review/* branches (or a single branch if specified).  For each
@@ -4219,8 +4274,14 @@ def rescan_branches(
     upserted.  When doing a full rescan (branch=None), series whose branches
     have disappeared are marked as 'gone'.
 
-    Returns ``{'gone': n, 'changed': n}`` where ``changed`` is the number of
-    branches whose SHA differed and were re-processed.
+    Returns ``{'gone': n, 'changed': n, 'branches': set-or-None}`` where
+    ``changed`` is the number of branches whose SHA differed and were
+    re-processed, and ``branches`` is every review branch this rescan
+    enumerated.  A sweep is a long series of per-series decisions that each
+    want to know whether a change_id has a branch at all, and this is the
+    one place that already asked git; ``None`` when *branch* narrowed the
+    rescan to one, because a one-element answer must not be read as "the
+    only review branch there is".
     """
     import b4.review
 
@@ -4361,7 +4422,11 @@ def rescan_branches(
                     gone += 1
 
     conn.close()
-    return {'gone': gone, 'changed': changed}
+    return {
+        'gone': gone,
+        'changed': changed,
+        'branches': None if branch else set(branches),
+    }
 
 
 def delete_series(
diff --git a/src/tests/test_review.py b/src/tests/test_review.py
index a7c9cb15..f3adcb5a 100644
--- a/src/tests/test_review.py
+++ b/src/tests/test_review.py
@@ -4503,6 +4503,7 @@ def test_update_all_tracking_skips_snoozed_and_archived(
         identifier: str,
         linkmask: str,
         topdir: Optional[str] = None,
+        **kw: Any,
     ) -> Dict[str, Any]:
         updated.append(one['change_id'])
         if one['change_id'] == 'd':
@@ -4878,7 +4879,7 @@ def test_update_all_tracking_polls_revisions_capped(
     monkeypatch.setattr(
         review,
         'update_series_tracking',
-        lambda one, identifier, linkmask, topdir=None: {
+        lambda one, identifier, linkmask, topdir=None, **kw: {
             'new_revisions': 0,
             'new_trailers': 0,
             'error': None,
@@ -4942,7 +4943,7 @@ def test_update_all_tracking_reports_revision_poll_errors(
     monkeypatch.setattr(
         review,
         'update_series_tracking',
-        lambda one, identifier, linkmask, topdir=None: {
+        lambda one, identifier, linkmask, topdir=None, **kw: {
             'new_revisions': 0,
             'new_trailers': 0,
             'error': None,
@@ -4974,7 +4975,7 @@ def test_update_all_tracking_feeds_poll_progress(
     monkeypatch.setattr(
         review,
         'update_series_tracking',
-        lambda one, identifier, linkmask, topdir=None: {
+        lambda one, identifier, linkmask, topdir=None, **kw: {
             'new_revisions': 0,
             'new_trailers': 0,
             'error': None,
@@ -5077,7 +5078,7 @@ def test_update_all_tracking_cancelled_poller_stops_sweep(
     monkeypatch.setattr(
         review,
         'update_series_tracking',
-        lambda one, identifier, linkmask, topdir=None: {
+        lambda one, identifier, linkmask, topdir=None, **kw: {
             'new_revisions': 0,
             'new_trailers': 0,
             'error': None,
@@ -5101,7 +5102,7 @@ def _stub_sweep(monkeypatch: pytest.MonkeyPatch, series: List[Dict[str, Any]]) -
     monkeypatch.setattr(
         review,
         'update_series_tracking',
-        lambda one, identifier, linkmask, topdir=None: {
+        lambda one, identifier, linkmask, topdir=None, **kw: {
             'new_revisions': 0,
             'new_trailers': 0,
             'error': None,
@@ -5129,7 +5130,7 @@ def test_a_busy_branch_still_polls_its_revisions(
     monkeypatch.setattr(
         review,
         'update_series_tracking',
-        lambda one, identifier, linkmask, topdir=None: {
+        lambda one, identifier, linkmask, topdir=None, **kw: {
             'new_revisions': 0,
             'new_trailers': 0,
             'error': None,
@@ -5167,7 +5168,7 @@ def test_update_all_tracking_forwards_the_forced_poll(
     monkeypatch.setattr(
         review,
         'update_series_tracking',
-        lambda one, identifier, linkmask, topdir=None: {
+        lambda one, identifier, linkmask, topdir=None, **kw: {
             'new_revisions': 0,
             'new_trailers': 0,
             'error': None,
@@ -5416,7 +5417,7 @@ class TestCancelledPollKeepsItsTally:
         monkeypatch.setattr(
             review,
             'update_series_tracking',
-            lambda one, identifier, linkmask, topdir=None: {
+            lambda one, identifier, linkmask, topdir=None, **kw: {
                 'new_revisions': 0,
                 'new_trailers': 0,
                 'error': None,
@@ -5500,7 +5501,7 @@ class TestExplicitUpdateReachesASnoozedSeries:
         monkeypatch.setattr(
             review,
             'update_series_tracking',
-            lambda one, ident, linkmask, topdir=None: {
+            lambda one, ident, linkmask, topdir=None, **kw: {
                 'new_revisions': 0,
                 'new_trailers': 0,
                 'error': None,
diff --git a/src/tests/test_tui_modals.py b/src/tests/test_tui_modals.py
index 5a19cdd4..46b4d8b7 100644
--- a/src/tests/test_tui_modals.py
+++ b/src/tests/test_tui_modals.py
@@ -1132,6 +1132,7 @@ class TestUpdateAllScreenCancellation:
             identifier: str,
             linkmask: str,
             topdir: Optional[str] = None,
+            **kw: Any,
         ) -> Dict[str, Any]:
             nonlocal call_count
             call_count += 1

-- 
2.53.0

