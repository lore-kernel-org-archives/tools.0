Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907F63EFD24
	for <tools@linux.kernel.org>; Wed, 12 Aug 2026 21:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786571254; cv=none; b=eoOqePZ1vgPKP+aaqHo8owSn/flQ/z+cpqU7J5y+bkdW9pFxPXd7/WnaCIs7/Qkg6fZJjMybSRAaqOxenJCtUmO44hF2O1eBNHCp8mtkuG1KOLZkuexmQ0Mo5FcEm1Z5/LJ/1hRZ/JAsGPMbuuj7EFOPbwATPDemyQKvjxRlRCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786571254; c=relaxed/simple;
	bh=2MruuiU+zKtcmMtIwfrBkPh6EVLtLPEbaJggaQfsg5U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X+SRRveNZlbAk2pWJJcyy5p+ut0ppTBqH6YJtKVWIB3+J3cGeMqjWZrSOf3OWIA/HstzLkErY9MBzhe1qNMNajCYo6PiOzLSjJ0t92AaM/PVS6R6Sw1MSYDCTzle5ALywLWR56M8vF/oF7fMBduwIsLfbH2AV7DXRPksCOwaXhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oD1jyWfh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oD1jyWfh"
Received: by smtp.kernel.org (Postfix)
	id 4FF491F00A3D; Wed, 12 Aug 2026 21:47:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 748B51F000E9;
	Wed, 12 Aug 2026 21:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786571253;
	bh=ST/tBmCvHk3CsNQcJaWiJ1Tf6v96QD+THsdePaRvVsM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=oD1jyWfhWMgocLXrRT7o4B5E5K0QfxQTIregRN2Kb1L4n+bzqkd/bLEzMdnzvRJ/K
	 L1hXELgvGZnUM6Khm3IXGoYxlTLlW4t3+j1nOh7je+3fLXAm/Oeb4TS2gbByureKBV
	 Q6dCJ4JDUkLcgsTQHo6bNyQMF02+js7NBBIr+kncSPQuL1rXmjYRrsyyifZpbphQky
	 oJw5MDNim7S9PJsC7/UpMg2QThbb4Hp2dY+DV9N5D+tlB40lTZfuGcG9+HAuLTJq+o
	 BgfLJYXf/z/oVhKBIkPKVp/7iRoXW6PDzFZALKoQOpZs9LCpdDr+2VaxAu0JFi4goB
	 ecwiuYUWpy8WA==
From: Christian Brauner <brauner@kernel.org>
Date: Wed, 12 Aug 2026 23:46:59 +0200
Subject: [PATCH RFC v2 18/25] review: match a stray posting by message-id
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260812-work-b4-multiver-rows-v2-18-305d53cd723a@kernel.org>
References: <20260812-work-b4-multiver-rows-v2-0-305d53cd723a@kernel.org>
In-Reply-To: <20260812-work-b4-multiver-rows-v2-0-305d53cd723a@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.17-dev-362b8
X-Developer-Signature: v=1; a=openpgp-sha256; l=9787; i=brauner@kernel.org;
 h=from:subject:message-id; bh=2MruuiU+zKtcmMtIwfrBkPh6EVLtLPEbaJggaQfsg5U=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTVvLwdealHL+6GSuiUWuuTh3tD09qaZntI+GcUtjp+u
 TRDf61XRykLgxgXg6yYIotDu0m43HKeis1GmRowc1iZQIYwcHEKwER0Khn+mU44+mjLg7s5mzmL
 zh+7uZL5kKMWl6bUr+X7Ep89+KSWt52RocnE6XWq+XaxW3Psddt5Dae3umirrZ355SJTyr3pj05
 8ZQQA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Three places ask whether another series already owns a posting: [l]'s
confirmation preview, the absorb it then performs, and the conflicts [o]
reports.  They disagreed, and the preview warned about the safe cases
while staying silent on the destructive one.

Give them one rule.  find_stray_revision() matches by message-id first
and fingerprint second.  A fingerprint hashes only the patches present,
so a revision recorded from a partial fetch never matches the one
computed with the whole series in hand.

Both lookups exclude the target change_id in SQL and walk every remaining
row rather than testing one.  A posting can sit in the catalog under the
link target as well as under the stray, since auto-discovery records it
and the maintainer then links it, so taking the first row back would
answer with the target itself whenever it sorts first.  [l] would then
duplicate the series instead of absorbing it.

An all-archived owner is not a match at all.  It is invisible in the
tracking list, so absorbing it deletes a series the maintainer cannot see
and reporting it sends them after one they cannot reach.  The same walk
keeps such an owner from hiding a live one behind it.

Act on the absorb result rather than assuming it.  Absorb still declines
a revision with neither a series nor a catalog row, and that revision
would otherwise go unrecorded while the TUI reported both a link and an
absorbed duplicate.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/review/tracking.py          | 111 +++++++++++++++++++++++++++++++------
 src/b4/review_tui/_tracking_app.py |  10 +++-
 2 files changed, 102 insertions(+), 19 deletions(-)

diff --git a/src/b4/review/tracking.py b/src/b4/review/tracking.py
index 958b5180..6662cd9e 100644
--- a/src/b4/review/tracking.py
+++ b/src/b4/review/tracking.py
@@ -1804,6 +1804,32 @@ def get_revisions_with_tracked(
     return merge_tracked_revisions(change_id, get_revisions(conn, change_id), rows)
 
 
+def _find_revisions_by(
+    conn: sqlite3.Connection,
+    column: str,
+    value: Optional[str],
+    exclude_change_id: Optional[str] = None,
+) -> List[dict[str, Any]]:
+    """Every catalog row whose *column* equals *value*, ordered by change_id.
+
+    Plural on purpose: nothing constrains a message-id or a fingerprint to
+    one change_id, so a caller looking for *another* series' copy has to be
+    able to walk past the first row.  Ordered, or the answer is rowid order
+    and flips the first time a row is rewritten.
+
+    *column* is a literal supplied by this module, never caller input.
+    """
+    if not value:
+        return []
+    sql = _REVISION_SELECT + f' WHERE r.{column} = ?'
+    params: List[Any] = [value]
+    if exclude_change_id is not None:
+        sql += ' AND r.change_id != ?'
+        params.append(exclude_change_id)
+    sql += ' ORDER BY r.change_id'
+    return [dict(zip(_REVISION_COLS, row)) for row in conn.execute(sql, params)]
+
+
 def find_revision_by_fingerprint(
     conn: sqlite3.Connection, fingerprint: Optional[str]
 ) -> Optional[dict[str, Any]]:
@@ -1813,15 +1839,43 @@ def find_revision_by_fingerprint(
     under a different change_id) so it can be absorbed rather than duplicated.
     An empty or None fingerprint never matches.
     """
-    if not fingerprint:
-        return None
-    row = conn.execute(
-        _REVISION_SELECT + ' WHERE r.fingerprint = ? ORDER BY r.change_id LIMIT 1',
-        (fingerprint,),
-    ).fetchone()
-    if row is None:
-        return None
-    return dict(zip(_REVISION_COLS, row))
+    rows = _find_revisions_by(conn, 'fingerprint', fingerprint)
+    return rows[0] if rows else None
+
+
+def find_stray_revision(
+    conn: sqlite3.Connection,
+    change_id: str,
+    message_id: Optional[str],
+    fingerprint: Optional[str],
+) -> Optional[dict[str, Any]]:
+    """Return the revision another series already owns this posting under.
+
+    The single rule behind [l]'s confirmation preview, the absorb it then
+    performs, and the conflicts [o] reports -- they disagreed once and the
+    preview warned about the safe cases while staying silent on the
+    destructive one.
+
+    Message-id first, fingerprint second: a fingerprint hashes only the
+    patches present, so a revision recorded from a partial fetch does not
+    match the one computed with the whole series in hand.  An all-archived
+    owner is not a match at all -- it is invisible in the tracking list, so
+    absorbing it deletes a series the maintainer cannot see and reporting
+    it sends them after one they cannot reach.
+
+    Both lookups exclude *change_id* in SQL and walk every remaining row
+    rather than testing one.  A posting can sit in the catalog under the
+    link target as well as under the stray -- auto-discovery records it,
+    then the maintainer links it -- and taking the first row back would
+    answer with the target itself whenever it sorts first, reporting no
+    stray and letting [l] duplicate the series instead of absorbing it.
+    The same walk keeps an archived owner from hiding a live one behind it.
+    """
+    for column, value in (('message_id', message_id), ('fingerprint', fingerprint)):
+        for stray in _find_revisions_by(conn, column, value, change_id):
+            if not _is_archived_only(conn, str(stray['change_id'])):
+                return stray
+    return None
 
 
 def find_existing_change_id(
@@ -2251,8 +2305,10 @@ def record_linked_revision(
       returns ``status='collision'`` without mutating anything, so the caller
       can confirm before overwriting.
     - If the posting is already tracked as its own stray series (matched by
-      fingerprint under a different change_id), that series is absorbed
-      (``absorbed=True``) rather than duplicated.
+      message-id, then fingerprint, under a different change_id), that series
+      is absorbed (``absorbed=True``) rather than duplicated.  A stray whose
+      series rows are all archived is left alone and the revision is simply
+      recorded.
     - Otherwise the revision and its patches are recorded with
       ``source='manual'``.
 
@@ -2283,17 +2339,20 @@ def record_linked_revision(
         return result
 
     fingerprint = lser.fingerprint
-    stray = find_revision_by_fingerprint(conn, fingerprint)
-    if stray is not None and stray['change_id'] != change_id:
-        absorb_series_as_revision(
+    stray = find_stray_revision(conn, change_id, ref_msg.msgid, fingerprint)
+    if stray is not None:
+        # Acted on, not assumed: absorb still declines a revision with
+        # neither a series nor a catalog row, and the revision the
+        # maintainer asked to link would then go unrecorded while the TUI
+        # reported a link and an absorbed duplicate.
+        result['absorbed'] = absorb_series_as_revision(
             conn,
             change_id,
             stray['change_id'],
             revision,
             stray_revision=stray.get('revision'),
         )
-        result['absorbed'] = True
-    else:
+    if not result['absorbed']:
         message_id = ref_msg.msgid
         add_revision(
             conn,
@@ -4162,6 +4221,26 @@ def update_revision_message_counts(
     }
 
 
+def _is_archived_only(conn: sqlite3.Connection, change_id: str) -> bool:
+    """Whether *change_id* has series rows and every one of them is archived.
+
+    The v11 migration gives every series row a catalog entry, archived ones
+    included, so a catalog hit under another change_id no longer proves
+    anything is still tracked there.  A change_id with no series row at all
+    is a different matter -- that is a catalogued posting, and colliding
+    with it still matters -- so only the all-archived case is exempt.
+    """
+    row = conn.execute(
+        'SELECT COUNT(*),'
+        " SUM(COALESCE(status, 'new') != 'archived') FROM series"
+        ' WHERE change_id = ?',
+        (change_id,),
+    ).fetchone()
+    if row is None or not row[0]:
+        return False
+    return not (row[1] or 0)
+
+
 def mark_all_messages_seen(
     conn: sqlite3.Connection, change_id: str, revision: int
 ) -> None:
diff --git a/src/b4/review_tui/_tracking_app.py b/src/b4/review_tui/_tracking_app.py
index bcad86f3..f0ad512a 100644
--- a/src/b4/review_tui/_tracking_app.py
+++ b/src/b4/review_tui/_tracking_app.py
@@ -4006,8 +4006,12 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
             known = {
                 r['revision'] for r in b4.review.tracking.get_revisions(conn, change_id)
             }
-            stray = b4.review.tracking.find_revision_by_fingerprint(
-                conn, lser.fingerprint
+            ref_msg = b4.review.tracking._series_ref_message(lser)
+            stray = b4.review.tracking.find_stray_revision(
+                conn,
+                change_id,
+                ref_msg.msgid if ref_msg is not None else None,
+                lser.fingerprint,
             )
             conn.close()
         except Exception as ex:
@@ -4019,7 +4023,7 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
         warning = ''
         if collision:
             warning = f'v{revision} is already tracked — linking replaces it.'
-        elif stray is not None and stray['change_id'] != change_id:
+        elif stray is not None:
             warning = 'Already tracked as a separate series — it will be absorbed.'
 
         num_patches = sum(1 for p in lser.patches[1:] if p is not None)

-- 
2.53.0

