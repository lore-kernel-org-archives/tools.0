Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB919402BA1
	for <tools@linux.kernel.org>; Wed, 12 Aug 2026 21:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786571249; cv=none; b=uji1ikkWRfiEfJ2gQnklb9fj900w4MK+etAETbcc9G7y2e5HAv+QNi8SdGGwTqpsnEhgMcaO1VhCuc7dQknKdYWgayYw6qw5JIUKWM6Cd+VEgdpsHGceBKcM1OBWwvClC15mw3r1pQvqLchGoeoLR94jab7BDTfPt5nD0equAzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786571249; c=relaxed/simple;
	bh=+YRp/+qXNPOTlYhgMlNywJxHhmNu92NBsy0RXx6RSvA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nDk689BKWU6iuHvze3F5w2YdN8JcaJiG+u1BmkECbxm90Hb9r5DVtxtNrMpCBwAovr/wseqet1D/uRODMfI5lnYIwUPPCuJYUTLU6/MR5Pi/TBDzbyVefdsXSSZPB6it1JhhGEnnulOliiKOUGso2V2WaBA1TibffveEf1s3j1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DDJXBtC4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DDJXBtC4"
Received: by smtp.kernel.org (Postfix)
	id A97EC1F00A3D; Wed, 12 Aug 2026 21:47:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B89451F00A3A;
	Wed, 12 Aug 2026 21:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786571247;
	bh=OPQ6zE4ex8fJc8osvCvs6K6yh7peU+HHEVj9Da5H8Yw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=DDJXBtC4yrPtl3VdFZd9swyoGnkI2snD6FAeuX5W3qKLd95+rI/Dj36FP1PlcqLiy
	 X0SACWl1v31FxrWEOz8lFs3cQS6JXDjdLawlxNGQEOulYNFAQ17r/jh0pNVnM65IoA
	 bqJRiUshiZjtX9++/9g3DGWOv/U/jSNpLjmD9jfrimnI7F+PtiFrhsKo8wOJlS7pJa
	 ruIjEQAGINoN6cUZReagzoxOXYDDrP9Nu++zKfq7ykpzyY+XrzHzk16lGXUw8lQHbi
	 ok/0EBzInhQQLHdvzjRtA7NeMQblmqjNS43wyAdnN5t2QtHKMIbwaAMk63OvaHxFXa
	 kshbyOviRCz0A==
From: Christian Brauner <brauner@kernel.org>
Date: Wed, 12 Aug 2026 23:46:55 +0200
Subject: [PATCH RFC v2 14/25] review-tui: resolve the tracked revision in
 revision lists
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-work-b4-multiver-rows-v2-14-305d53cd723a@kernel.org>
References: <20260812-work-b4-multiver-rows-v2-0-305d53cd723a@kernel.org>
In-Reply-To: <20260812-work-b4-multiver-rows-v2-0-305d53cd723a@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.17-dev-362b8
X-Developer-Signature: v=1; a=openpgp-sha256; l=9110; i=brauner@kernel.org;
 h=from:subject:message-id; bh=+YRp/+qXNPOTlYhgMlNywJxHhmNu92NBsy0RXx6RSvA=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTVvLwl/7gznXffKr7LC3s2yyVcnueXva8uNers+cw2R
 r1U/107O0pZGMS4GGTFFFkc2k3C5ZbzVGw2ytSAmcPKBDKEgYtTACbi/JCR4aXE1ZV2ySeSmINe
 /NOKsXvSOfeF9dObR9SurMnrY1ZcaMfwP851z4RHmpIPI6+vf37OqEH0Zckd222vk+7bS95Y8vi
 dLxMA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

The revisions catalog is not guaranteed a row for the tracked revision,
since manually linking a newer version records only that one.  Anything
reasoning about the versions of a series from the catalog alone can
therefore omit the version the maintainer is actually on, and a
range-diff then cannot resolve the side it is taken against, on a row
whose binding was enabled on exactly that basis.

Add merge_tracked_revisions(), which appends an entry synthesized from
the series row when the catalog lacks one, and route both readers through
it: the DB-side resolver get_revisions_with_tracked() and the TUI's row
builder.  The versions shown and the versions a range-diff can resolve
are then always the same set.

It covers every live series row, not just the furthest along.
rescan_branches() can leave a change_id with more than one and the
tracking list renders each separately, so resolving only one would enable
the range-diff on a version row whose message-id cannot then be found.

The synthesized entry carries neither blob nor read state.  Both live on
the catalog row it stands in for, so a series row that never got one has
none to report.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/review/tracking.py          | 100 +++++++++++++++++++++++++++++++++++++
 src/b4/review_tui/_common.py       |   6 ++-
 src/b4/review_tui/_tracking_app.py |  34 +++++++++++++
 3 files changed, 139 insertions(+), 1 deletion(-)

diff --git a/src/b4/review/tracking.py b/src/b4/review/tracking.py
index 1b26d722..c8d9e7d9 100644
--- a/src/b4/review/tracking.py
+++ b/src/b4/review/tracking.py
@@ -1649,6 +1649,106 @@ def get_revisions(conn: sqlite3.Connection, change_id: str) -> list[dict[str, An
     return [dict(zip(_REVISION_COLS, row)) for row in cursor.fetchall()]
 
 
+def merge_tracked_revisions(
+    change_id: str,
+    revs: List[dict[str, Any]],
+    series_rows: List[dict[str, Any]],
+) -> List[dict[str, Any]]:
+    """Merge catalog *revs* with the revisions the *series_rows* track.
+
+    A catalog row for a tracked revision is not guaranteed -- manually
+    linking a newer version records only that one -- so anything that
+    reasons about "the versions of this series" from the catalog alone
+    can silently omit the one the maintainer is actually on.  Synthesize
+    an entry from the series row when it is missing.
+
+    Every series row, not just one: rescan_branches can leave a change_id
+    with more than one, and the tracking list renders each of them
+    separately.  Resolving only one would enable the range-diff on a
+    version row whose message-id cannot then be found.  Both the DB
+    resolver (:func:`get_revisions_with_tracked`) and the TUI's row
+    builder go through here, so the versions shown and the versions the
+    range-diff can resolve are always the same set.
+
+    Every write path that points a series row at a revision catalogues it
+    first (:func:`_ensure_catalog_row`), and the v11 backfill did the same
+    for every row that predates that rule, so this is a fallback for a
+    database written before it and not a reconciliation step: nothing here
+    fixes up a value the catalog also holds.
+
+    The synthesized entry carries neither blob nor read state.  Both live
+    on the catalog row this one stands in for, so a series row that never
+    got one has none to report -- the entry exists to supply a message-id
+    and a subject, not a badge.
+
+    *series_rows* entries carry ``revision``, ``message_id``, ``subject``,
+    ``found_at``, ``fingerprint`` and ``is_rethreaded``.
+    """
+    revs = list(revs)
+    known = {int(r['revision']) for r in revs if r.get('revision') is not None}
+    added = False
+    for row in series_rows:
+        if not row.get('message_id'):
+            continue
+        tracked = int(row.get('revision') or 1)
+        if tracked in known:
+            continue
+        known.add(tracked)
+        added = True
+        revs.append(
+            {
+                'change_id': change_id,
+                'revision': tracked,
+                'message_id': row['message_id'],
+                'subject': row.get('subject'),
+                'link': '',
+                'found_at': row.get('found_at') or '',
+                'thread_blob': '',
+                'series_blob': '',
+                'fingerprint': row.get('fingerprint'),
+                'source': 'tracked',
+                'is_rethreaded': bool(row.get('is_rethreaded')),
+                'message_count': None,
+                'seen_message_count': None,
+                'last_update_check': None,
+                'last_mail_at': None,
+            }
+        )
+    if added:
+        revs.sort(key=lambda r: r.get('revision') or 0)
+    return revs
+
+
+def get_revisions_with_tracked(
+    conn: sqlite3.Connection, change_id: str
+) -> list[dict[str, Any]]:
+    """get_revisions(), guaranteed to include the revision being tracked.
+
+    :func:`merge_tracked_revisions` over the catalog and every live series
+    row -- see there for why the merge works the way it does.
+    """
+    # Positional access: callers may hand us a connection without a
+    # sqlite3.Row factory (init_db does not set one).
+    rows = [
+        {
+            'revision': row[0],
+            'message_id': row[1],
+            'subject': row[2],
+            'found_at': row[3],
+            'fingerprint': row[4],
+            'is_rethreaded': row[5],
+        }
+        for row in conn.execute(
+            'SELECT revision, message_id, subject, COALESCE(sent_at, added_at),'
+            ' fingerprint, is_rethreaded FROM series'
+            " WHERE change_id = ? AND COALESCE(status, 'new') != 'archived'"
+            ' ORDER BY revision DESC',
+            (change_id,),
+        )
+    ]
+    return merge_tracked_revisions(change_id, get_revisions(conn, change_id), rows)
+
+
 def find_revision_by_fingerprint(
     conn: sqlite3.Connection, fingerprint: Optional[str]
 ) -> Optional[dict[str, Any]]:
diff --git a/src/b4/review_tui/_common.py b/src/b4/review_tui/_common.py
index 34cd5d28..2f161c2c 100644
--- a/src/b4/review_tui/_common.py
+++ b/src/b4/review_tui/_common.py
@@ -1237,7 +1237,11 @@ def compute_range_diff(
     """
     try:
         conn = b4.review.tracking.get_db(identifier)
-        revisions = b4.review.tracking.get_revisions(conn, change_id)
+        # Must include the tracked revision even when the catalog has no
+        # row for it, or the side this diff is taken against cannot be
+        # resolved -- and the TUI enables the action on exactly that
+        # basis.
+        revisions = b4.review.tracking.get_revisions_with_tracked(conn, change_id)
         conn.close()
     except Exception as ex:
         logger.critical('Could not load revisions: %s', ex)
diff --git a/src/b4/review_tui/_tracking_app.py b/src/b4/review_tui/_tracking_app.py
index 31601ded..bcad86f3 100644
--- a/src/b4/review_tui/_tracking_app.py
+++ b/src/b4/review_tui/_tracking_app.py
@@ -1746,6 +1746,40 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
             )
         )
 
+    @staticmethod
+    def _merge_tracked_revision(series: Dict[str, Any]) -> List[Dict[str, Any]]:
+        """Known revisions of a series, guaranteed to include the tracked ones.
+
+        tracking.merge_tracked_revisions() over the preloaded catalog rows
+        and every live series row of the change_id (stashed by
+        _load_series), so the version rows shown here and the revisions
+        compute_range_diff can resolve are always the same set.
+
+        Memoized onto the series dict: the answer gates two bindings, so it
+        is recomputed on every refresh_bindings() for every cursor move.
+        _load_series rebuilds these dicts from scratch, which is what keeps
+        the memo from outliving the data it was derived from.
+        """
+        cached: Optional[List[Dict[str, Any]]] = series.get('_versions')
+        if cached is not None:
+            return cached
+        rows = [
+            {
+                'revision': s.get('revision', 1),
+                'message_id': s.get('message_id', ''),
+                'subject': s.get('subject'),
+                'found_at': s.get('sent_at') or s.get('added_at') or '',
+                'fingerprint': s.get('fingerprint'),
+                'is_rethreaded': s.get('is_rethreaded'),
+            }
+            for s in (series.get('_sibling_rows') or [series])
+        ]
+        revs = b4.review.tracking.merge_tracked_revisions(
+            series.get('change_id', ''), series.get('_revisions') or [], rows
+        )
+        series['_versions'] = revs
+        return revs
+
     def _checkout_new_series(self) -> None:
         """Retrieve series, build am-ready mbox, and show base selection."""
         series = self._selected_series

-- 
2.53.0

