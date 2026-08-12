Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE6C36D517
	for <tools@linux.kernel.org>; Wed, 12 Aug 2026 21:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786571236; cv=none; b=AZQn9BUiWaCHMJ6lMTMZcdcbgvtmTilpN0/DL9KzzXsCcSaqZJtI87LiiiKXR4VrxwAqqGa7vSekFjGiQ3WL/lAiTymg4ClaW4J0IaJiYMDWvqFCSRTh7rVTxZgTmVfVmuGJI3FjmdfhHgNijZ8pJGd82yZ2H5EOAaqYWAdSYMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786571236; c=relaxed/simple;
	bh=VYCGus+qHXZdZe1cr19Ec8G7IwPPkzUPRF0rT5DegH0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZmImHFtZ/9OzAourf2CgJb23FXWGmuBFERjlajPEspO9hsDGPKmvYacwtEcBuF8x1K99G2nvI8vFXDe6z2Wu5+GKIkS/JZmmJ67WJrKN9K36bbJTDFEZSKJUvlkly3h1QI+RqCr02iXIK/1Gbbxu7qttg1IxCCTfntyGqYGnq04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A5Jc+2n3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A5Jc+2n3"
Received: by smtp.kernel.org (Postfix)
	id 0B4F11F00A3D; Wed, 12 Aug 2026 21:47:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2831C1F000E9;
	Wed, 12 Aug 2026 21:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786571234;
	bh=n7DZJQpW7B0EoF9Y/Tu78QK3o2IvpLOkDc07dvFsxFU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=A5Jc+2n3bNOrwGFo+60iFcC5F1FrEhrOBCvi9A4fc9pyQGUWinw5QJOA4yHgcb+Du
	 oi83pFt6V4XJPs6kUwM9inka6hx+KSzG45HUjrGrupUb88x3AfwakiATd3p8mS8sE8
	 +vLLyM1Q6hLjxfUoXRrSmetcOlMIlCvqOcn42g/7qYRWc1YebhFsom3UYZekKTzutI
	 ht1qCk0eh34x/Oi0lzUoYmO17w75rcxsVgQOVWR3HgmswWbPumkBWoYyhY3umRToX6
	 EsonsD4KCfQNk4bsRqorADrl0tRqXmldYn5uBTwmRhuDci4FRvqS/SwYZzBDbgAOTX
	 QoVRPaj2dmYjw==
From: Christian Brauner <brauner@kernel.org>
Date: Wed, 12 Aug 2026 23:46:46 +0200
Subject: =?utf-8?q?=5BPATCH_RFC_v2_05/25=5D_review-tui=3A_recompute_an_ev?=
 =?utf-8?q?icted_A=C2=B7R=C2=B7T_cache_entry?=
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260812-work-b4-multiver-rows-v2-5-305d53cd723a@kernel.org>
References: <20260812-work-b4-multiver-rows-v2-0-305d53cd723a@kernel.org>
In-Reply-To: <20260812-work-b4-multiver-rows-v2-0-305d53cd723a@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.17-dev-362b8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4009; i=brauner@kernel.org;
 h=from:subject:message-id; bh=VYCGus+qHXZdZe1cr19Ec8G7IwPPkzUPRF0rT5DegH0=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTVvLy1beabVyxrbDZFW3w9ldSv/OFbwL1LB4VUj63aY
 mVwuTxLqaOUhUGMi0FWTJHFod0kXG45T8Vmo0wNmDmsTCBDGLg4BWAi740ZGS63nNc+ueFukaz6
 f0PBVLYZzd/Nah9OCgq4a5mtw6B3dj3DP71qV76ls456l+94kr73lZVE58d8A8s/530LHhVZeRc
 d5AMA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

_invalidate_caches(change_id) evicts a single series from the A·R·T count
cache, but _load_series() only refills that cache when the whole dict is
None, so the evicted entry is never recomputed.  The series dicts are
rebuilt from scratch on every load, so nothing carries the old value
forward either, and the series renders '-' in the A·R·T column for the
rest of the session.

Take, link, upgrade, snooze, unsnooze, waiting and thank all evict
exactly one entry, so every one of them hits this.

Refill whenever a wanted branch is missing from the cache rather than
only when the cache is gone, and merge rather than replace so an intact
cache still skips the subprocess.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/review_tui/_tracking_app.py | 34 +++++++++++++++++++++++++++++++---
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/src/b4/review_tui/_tracking_app.py b/src/b4/review_tui/_tracking_app.py
index 69da8f58..11e79ef2 100644
--- a/src/b4/review_tui/_tracking_app.py
+++ b/src/b4/review_tui/_tracking_app.py
@@ -988,7 +988,11 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
         self._cached_newest_revisions: Optional[Dict[str, int]] = None
         self._cached_revision_counts: Optional[Dict[str, int]] = None
         self._cached_revisions: Optional[Dict[str, List[Dict[str, Any]]]] = None
-        self._cached_art_counts: Optional[Dict[str, Tuple[int, int, int]]] = None
+        # A None value is a branch whose tip carries no tracking trailer
+        # block; cached as a miss so the refill below converges.
+        self._cached_art_counts: Optional[Dict[str, Optional[Tuple[int, int, int]]]] = (
+            None
+        )
 
     def _invalidate_caches(self, change_id: Optional[str] = None) -> None:
         """Drop cached data so the next _load_series re-fetches.
@@ -1190,8 +1194,32 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
                     art_branches[branch_name] = branch_tips[branch_name]
 
         # --- Bulk ART counts (1 subprocess instead of N) ---
-        if self._cached_art_counts is None and art_branches and topdir:
-            self._cached_art_counts = _get_art_counts_batch(topdir, art_branches)
+        # Recompute whenever a wanted branch is missing, not only when the
+        # whole dict is gone: _invalidate_caches(change_id) evicts a single
+        # entry, which an `is None` test would never notice, leaving that
+        # series' A·R·T stuck at '-' for the session.
+        #
+        # Only the missing ones, though.  The targeted eviction keeps the
+        # other entries precisely so they are not recomputed, and handing
+        # the whole map to the batch spends that back: one tracking commit
+        # read per branch under review, on every take, link, snooze or
+        # thank, to re-derive counts nothing has invalidated.
+        art_missing = {
+            name: sha
+            for name, sha in art_branches.items()
+            if not self._cached_art_counts or name not in self._cached_art_counts
+        }
+        if topdir and art_missing:
+            counts = _get_art_counts_batch(topdir, art_missing)
+            if self._cached_art_counts is None:
+                self._cached_art_counts = {}
+            self._cached_art_counts.update(counts)
+            # Misses recorded too, or a branch _get_art_counts_batch declines
+            # to return stays absent, the difference above never empties and
+            # a `git cat-file` fires on every reload -- once a second while a
+            # cron sweep bumps the DB mtime.
+            for branch_name in art_missing:
+                self._cached_art_counts.setdefault(branch_name, None)
         art_map = self._cached_art_counts or {}
         for series in self._all_series:
             change_id = series.get('change_id', '')

-- 
2.53.0

