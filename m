Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6473236D517
	for <tools@linux.kernel.org>; Wed, 12 Aug 2026 21:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786571250; cv=none; b=KJ9Hm+3LTZwxPro5nhvyn7vpOJvphi4lHJIzWlRSrnYZ2VGuQrXw/QPUf/lzxw2szypRTUvR3Xr1o8mWMqTxA8zCLYPfTNeO6F+wVW5mkUDrenT0aBeFkapr5Q3X2nmma1fAW4/S5JCRGqEYNi0EfZOJ5vvNNrfoq+jXjaffP1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786571250; c=relaxed/simple;
	bh=MTlGGR4fC6labMNXDzh0ZAWFcy/dPUl+lscLZAWem44=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HJUIexcfgRcclo3TgHEhBHYlwtzGqtS6eMYgYA4L1HObC9idyzU+YOCO3c/uiNI/EVv/c2KhqDq/a3W/NHqV3xMXPQvLEbzNp/qZmPqbEHbKbbVltXXM1zQuIjzVVAAl9nOHDsV/YtsCDouTyJ4kAH932r0vxBSirzHCru8sHs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ywki85i6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ywki85i6"
Received: by smtp.kernel.org (Postfix)
	id 1F8801F000E9; Wed, 12 Aug 2026 21:47:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CC811F00A3A;
	Wed, 12 Aug 2026 21:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786571249;
	bh=DS/9iz/VaiqtlSNHrsGa4ZIilUKR8Raq+5oYTaPCjqE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Ywki85i6H3xMZDZNjlKHkT0zkmsluSIFnWAeM6n6A4p/39fTYP2bTTwoNf7SLP6px
	 pRf9i7jhhG6oaPcloahoViDpEBXmGU8Wnyk8OhKCBiBYJAkfBtS6n3nDgHp5xqDXsu
	 8K15k043x4fDEEkRUaFA1dTANnfIoBGmmp89uc6NQJt9fHmC8zGpHQMBzhfp+NSHbP
	 poY19+olA7aE+7G2Vs3Ocgl19L1cl8qfiJZFaMQ7PNYdg1LL19IthYwQgwh0SSndnG
	 qiKiC5Hg6tn+9Jx75crv5uv0xGiKA6fdUe8TXCFoun9Xia6jh0nMIm+RWuDY5Pwsw5
	 8IecDO/WiHnMA==
From: Christian Brauner <brauner@kernel.org>
Date: Wed, 12 Aug 2026 23:46:56 +0200
Subject: [PATCH RFC v2 15/25] review-tui: fall back when a cached thread
 blob has no series
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260812-work-b4-multiver-rows-v2-15-305d53cd723a@kernel.org>
References: <20260812-work-b4-multiver-rows-v2-0-305d53cd723a@kernel.org>
In-Reply-To: <20260812-work-b4-multiver-rows-v2-0-305d53cd723a@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.17-dev-362b8
X-Developer-Signature: v=1; a=openpgp-sha256; l=11444; i=brauner@kernel.org;
 h=from:subject:message-id; bh=MTlGGR4fC6labMNXDzh0ZAWFcy/dPUl+lscLZAWem44=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTVvLy1zNfGccUHv0V2Fxj+3LK8/im6zePcRsHjjJ7F1
 5ae4NhY3FHKwiDGxSArpsji0G4SLrecp2KzUaYGzBxWJpAhDFycAjCR6VsYGRbPFLuT/vvjuo0e
 0zoYtlw6nzo7U8H1wo7znq/1Hhved1AEqshgs+YyO3Dmctz+6vl/lswOK5NrOrT+HE/th+7veos
 qOAE=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

fetch_fake_am_range() trusted revisions.thread_blob unconditionally: any
non-empty blob short-circuited the lore fetch, and if the series could
not be built from it the function gave up rather than trying the path
that would have worked.

That was safe while the column was only ever written from a complete
tracked-series thread at upgrade time.  It is not now that the revision
poller caches whatever thread it counted, which for a version the
backward search records as plain despite broken threading is a single
patch's thread.  Range-diff against such a version then failed
permanently, since the bad blob was preferred on every attempt.

Build the series before committing to the blob, and refetch when it does
not yield one: the lore path runs the get_extra_series() passes that
stitch a broken-threaded version back together.  Store what those passes
produced as the revision's series_blob, beside the thread rather than
over it, since the thread is still what a poll counts and what the next
fetch is diffed against.  The following range-diff reads it back instead
of paying for the stitching again.  An incomplete cached thread is kept
as a fallback for a refetch that cannot run at all.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/review_tui/_common.py | 167 +++++++++++++++++++++++++++++++++++--------
 1 file changed, 136 insertions(+), 31 deletions(-)

diff --git a/src/b4/review_tui/_common.py b/src/b4/review_tui/_common.py
index 2f161c2c..b90d6815 100644
--- a/src/b4/review_tui/_common.py
+++ b/src/b4/review_tui/_common.py
@@ -1158,17 +1158,21 @@ def fetch_fake_am_range(
     topdir: str,
     revisions: List[Dict[str, Any]],
     rev: int,
+    recache: Optional[Callable[[int, List[Any]], None]] = None,
 ) -> Optional[Tuple[str, str]]:
     """Fetch a revision and create a fake-am commit range.
 
-    Tries the cached thread blob from the revisions table first,
-    falling back to a lore fetch if the blob is absent or GC'd.
+    Three sources, cheapest first: the stitched ``series_blob`` recorded by
+    an earlier call, the ``thread_blob`` a poll cached when it holds the
+    whole series, and lore.  Any of them may be absent or GC'd.
+
+    *recache*, when given, is handed the stitched messages behind whatever
+    this ends up using so the caller can record them as the revision's
+    series blob.  It is what keeps the next call off the lore path, for a
+    version whose thread does not carry every patch and never will.
 
     Returns (range_start, range_end) on success, or None on failure.
     """
-    msgs = None
-    msgid = ''
-
     # Locate this revision's record
     rev_record: Dict[str, Any] = {}
     for r in revisions:
@@ -1176,36 +1180,120 @@ def fetch_fake_am_range(
             rev_record = r
             break
 
-    # Try cached thread blob first (may be absent or GC'd — tolerate both)
-    blob_sha = rev_record.get('thread_blob') or ''
-    if blob_sha:
-        mbox_bytes = b4.review.tracking.get_thread_mbox(topdir, blob_sha)
-        if mbox_bytes:
-            logger.info('Using cached thread blob for v%d', rev)
-            msgs = b4.split_and_dedupe_pi_results(mbox_bytes)
+    def _series_from(msgs: List[Any]) -> Optional['b4.LoreSeries']:
+        lmbx = b4.LoreMailbox()
+        for msg in msgs:
+            lmbx.add_message(msg)
+        return lmbx.get_series(rev, sloppytrailers=False, codereview_trailers=False)
 
-    # Fall back to lore fetch
-    if not msgs:
-        msgid = rev_record.get('message_id', '')
-        if not msgid:
-            logger.critical('No message-id recorded for v%d', rev)
+    def _known_patches(lser: Optional['b4.LoreSeries']) -> int:
+        """How many of a series' patches are actually in hand.
+
+        Absent counts as none, so the comparisons below need no companion
+        None test: "did this source do better?" is the only question, and
+        having nothing is the bottom of that order rather than a separate
+        case.
+        """
+        if lser is None:
+            return 0
+        return sum(1 for p in (lser.patches or [])[1:] if p is not None)
+
+    def _cached(blob_sha: str) -> Optional[List[Any]]:
+        if not blob_sha:
+            return None
+        mbox_bytes = b4.review.tracking.get_thread_mbox(topdir, blob_sha)
+        if not mbox_bytes:
             return None
+        return b4.split_and_dedupe_pi_results(mbox_bytes)
+
+    # The fullest reconstruction seen so far, whichever source it came
+    # from.  An incomplete range-diff beats none, so this is what the lore
+    # passes below have to improve on to be worth using.
+    partial: Optional['b4.LoreSeries'] = None
+
+    # A recorded series blob is this revision stitched, and it is dropped
+    # the moment its thread changes -- but only a *complete* one is an
+    # answer.  Returning a short stitch unconditionally pinned every later
+    # range-diff to it: a settled version's thread never changes, so the
+    # blob is never dropped and the passes below never run again.  It is
+    # the same completeness test the thread arm applies, for the same
+    # reason.
+    stitched = _cached(rev_record.get('series_blob') or '')
+    if stitched:
+        lser = _series_from(stitched)
+        if lser is not None and lser.complete:
+            logger.info('Using cached series blob for v%d', rev)
+            return _fake_am_range_from(topdir, lser, rev)
+        partial = lser
+
+    # The thread as last fetched, which for most versions is the whole
+    # series and costs nothing further.
+    cached_msgs = _cached(rev_record.get('thread_blob') or '')
+    if cached_msgs:
+        logger.info('Using cached thread blob for v%d', rev)
+        lser = _series_from(cached_msgs)
+        if lser is not None and lser.complete:
+            return _fake_am_range_from(topdir, lser, rev)
+        # get_series() returns None only when every patch is missing; a
+        # merely short series comes back complete=False.  Either way the
+        # thread does not hold the version, and only the get_extra_series()
+        # passes below can stitch the rest back together.
+        if _known_patches(lser) > _known_patches(partial):
+            partial = lser
+        logger.info('Cached thread for v%d is incomplete, refetching', rev)
+
+    msgid = rev_record.get('message_id', '')
+    if not msgid:
+        logger.critical('No message-id recorded for v%d', rev)
+        return _fake_am_range_from(topdir, partial, rev)
 
-        logger.info('Fetching v%d from lore...', rev)
-        with lore_request():
-            msgs = b4.get_pi_thread_by_msgid(msgid)
-            if not msgs:
-                logger.critical('Could not retrieve thread for v%d', rev)
-                return None
+    logger.info('Fetching v%d from lore...', rev)
+    with lore_request():
+        msgs: List[Any] = b4.get_pi_thread_by_msgid(msgid) or []
+        if not msgs:
+            logger.critical('Could not retrieve thread for v%d', rev)
+            return _fake_am_range_from(topdir, partial, rev)
+
+        msgs = b4.mbox.get_extra_series(msgs, direction=1, wantvers=[rev])
+        msgs = b4.mbox.get_extra_series(msgs, direction=-1, wantvers=[rev])
+    lser = _series_from(msgs)
+    if lser is None or _known_patches(lser) <= _known_patches(partial):
+        # The passes came back no more complete than what is already
+        # cached, so that cache is all there is of this version.  Nothing
+        # was stitched here, so nothing is recorded: writing the cached
+        # bytes back as a `series_blob` would file them under a name
+        # meaning "every patch of this version", which is the one thing
+        # they are not -- and the arm above would then trust them.
+        if partial is not None:
+            if lser is None:
+                logger.info(
+                    'Refetch of v%d failed, using the incomplete cached thread', rev
+                )
+            else:
+                logger.info(
+                    'Refetch of v%d is no better than the cache, keeping it', rev
+                )
+        return _fake_am_range_from(topdir, partial, rev)
+
+    # Record what the stitching produced, so the next press of 'd' takes
+    # the branch above instead of three more lore round-trips -- but only
+    # when it is the whole version.  `series_blob` means "every patch of
+    # this version", and its reader returns it without re-deriving that; a
+    # short stitch stays a fallback, and the thread it improved on is
+    # already cached beside it.
+    if recache is not None and msgs and lser.complete:
+        try:
+            recache(rev, msgs)
+        except Exception as ex:
+            logger.debug('Could not re-cache series for v%d: %s', rev, ex)
 
-            msgs = b4.mbox.get_extra_series(msgs, direction=1, wantvers=[rev])
-            msgs = b4.mbox.get_extra_series(msgs, direction=-1, wantvers=[rev])
+    return _fake_am_range_from(topdir, lser, rev)
 
-    lmbx = b4.LoreMailbox()
-    for msg in msgs:
-        lmbx.add_message(msg)
 
-    lser = lmbx.get_series(rev, sloppytrailers=False, codereview_trailers=False)
+def _fake_am_range_from(
+    topdir: str, lser: Optional['b4.LoreSeries'], rev: int
+) -> Optional[Tuple[str, str]]:
+    """Build the fake-am range for *lser*, or fail loudly if there is none."""
     if lser is None:
         logger.critical('Could not find series v%d in retrieved messages', rev)
         return None
@@ -1247,6 +1335,23 @@ def compute_range_diff(
         logger.critical('Could not load revisions: %s', ex)
         return None
 
+    def _recache(rev: int, msgs: List[Any]) -> None:
+        """Store a stitched series so the next range-diff hits the cache.
+
+        Beside the thread blob rather than over it: a poll caches whatever
+        single thread it counted, which for a version posted with broken
+        threading is one patch's, and that thread is still the right
+        baseline for counting new mail even though it will never satisfy
+        fetch_fake_am_range().
+        """
+        conn = b4.review.tracking.get_db(identifier)
+        try:
+            b4.review.tracking.store_revision_series_blob(
+                conn, topdir, change_id, rev, msgs
+            )
+        finally:
+            conn.close()
+
     # --- Resolve the current revision range ---
     # Use local review branch if available, otherwise fetch from lore
     branch = f'b4/review/{change_id}'
@@ -1267,13 +1372,13 @@ def compute_range_diff(
 
     if not cur_start or not cur_end:
         # No local branch — fetch from lore
-        result = fetch_fake_am_range(topdir, revisions, current_rev)
+        result = fetch_fake_am_range(topdir, revisions, current_rev, recache=_recache)
         if result is None:
             return None
         cur_start, cur_end = result
 
     # --- Fetch the other version (blob SHA comes from the revisions table) ---
-    result = fetch_fake_am_range(topdir, revisions, other_rev)
+    result = fetch_fake_am_range(topdir, revisions, other_rev, recache=_recache)
     if result is None:
         return None
     other_start, other_end = result

-- 
2.53.0

