Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8AF3806BD
	for <tools@linux.kernel.org>; Wed, 29 Jul 2026 08:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785315512; cv=none; b=R6tn/xJBkDiY+MujkzRpwnvTPfvgfQBaE+mPwoOi2ON/DWgjhjWwpznV6CT59S3NwTh0GDcLu8dHrdhDtGyVzUuEeW+gmp+HefHuhEdR3Br4HshH7HtQ8GlgkXd3/0XedxpBPrxRCoYceSY7eiwJKEROCGtj3nQCJ5jDz2lMW6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785315512; c=relaxed/simple;
	bh=bZxf/je6EObZyojoZByVf0OkguEA18mw8V8J8jpGysQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WeU2994q6yRrdEv1or4CMdpGc2jsDNwFJMDzqb2obHGSpPvLjXTHYUQ44YyZRG5r02rYwDXOQgiye5q+mhEhT65yOOu8A9A7EZhqP7K4vl1okEpkFNgXDJ/1Nz0n2vt8EY3SyWg3uripTzP9OyKZ/CUTbNVsfKQ+5e5x3jAVa/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R7alAiBV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R7alAiBV"
Received: by smtp.kernel.org (Postfix)
	id 8E0BF1F00A3A; Wed, 29 Jul 2026 08:58:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B94501F000E9;
	Wed, 29 Jul 2026 08:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785315510;
	bh=yPOvkV98ReHgo/drukYtd9oWb2FjmzjDL7eab5wYcrA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=R7alAiBVO/etIhruTtsORYnClrLNRmeRG+9BV26J9gIPC2g3afYiV3T8d+ntqIOTV
	 TFmej6Po9SqW/nbZjcnxevM+J5lSHaa1JtO7S+vl3VTDMwV2BysQ2FlfwqvrIRr0iS
	 991xf8oLT3X2QWRvJrYOshDrVUGgDlTin1ubYugxlVMM5SNo6FXLfrttIShVNTOEvM
	 A5KzzEed0r81wVQdObBrprBnQueI4Tc6UordWo4vcInyfQup+k9JaKiVIrnmKuVWNf
	 xHEIcIt89l25DqCQZZ6QlibhvuyUkc0NWxylXDg2L7N2PauTpWEzJH7qrogY7Ploqx
	 29lKHsVgvOLIw==
From: Christian Brauner <brauner@kernel.org>
Date: Wed, 29 Jul 2026 10:58:17 +0200
Subject: [PATCH b4 1/2] b4 review: identify updated revisions by their
 cover letter too
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260729-work-b4-cover-subject-v1-1-718507ed317b@kernel.org>
References: <20260729-work-b4-cover-subject-v1-0-718507ed317b@kernel.org>
In-Reply-To: <20260729-work-b4-cover-subject-v1-0-718507ed317b@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-99fe1
X-Developer-Signature: v=1; a=openpgp-sha256; l=9579; i=brauner@kernel.org;
 h=from:subject:message-id; bh=bZxf/je6EObZyojoZByVf0OkguEA18mw8V8J8jpGysQ=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWRlHthy03LuWY0qrgkiS5a3sSkYLIwwtVfNKzCKWLZ+m
 1tycGJmRykLgxgXg6yYIotDu0m43HKeis1GmRowc1iZQIYwcHEKwESMtBj+SpU3XUrs/f3oxjsJ
 Pb0FeTENOrLh0tKuae+kH816fu2pNMN/x7OyZjMbg47/iVp8UCtM0OHPD63LVtP+nCxp+Tb3Ko8
 iLwA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Commit 83551c65f68d ("review: identify discovered revisions by their
cover letter") fixed revision identification in
_record_discovered_revisions(), but update_series_tracking() carries a
hand-rolled copy of the same loop, and that copy is what pressing 'u'
in the tracking TUI runs. The fix never reached the path that matters.

The mechanism is the same: LoreMailbox files cover letters into its
parse-time covers dict and only get_series() injects one into
patches[0]. update_series_tracking() runs get_series() for the tracked
revision alone, so every other discovered revision is a raw LoreSeries
whose patches[0] is None, and picking the first present patch lands on
patch 1/N. That subject is what gets stored, what an upgrade carries
into the series row, and what the series list shows -- upgrading a
series re-titles it after its first patch.

Route the loop through _record_discovered_revisions() so both paths
identify a revision the same way. The shared helper also stores the
content fingerprint and keeps the sticky rethread flag intact; the
hand-rolled copy did neither.

That alone does not repair an already-upgraded series. The revisions
catalog heals on every re-add, but series.subject is only written when
a series is tracked or upgraded, so a row that took its title from
patch 1/N keeps it forever. Re-derive it on update via
realign_series_subject(), and only ever write back a cover-derived
title: the first-patch fallback is no better than what is already
stored, and would mis-title every correctly titled row whose cover
letter is missing from the fetched thread, coverless series first
among them.

The upgrade path stops taking the title from the catalog entirely: by
the time the base selection dialog opens it holds the resolved
LoreSeries, which knows its own title, so use that for the dialog
heading and the stored subject. The exception is a series that saw
neither its cover nor patch 1 and is stuck with the '(untitled)'
placeholder -- get_am_ready() skips missing patches, so such a series
still am-preps. Keep the catalog title there.

Fixes: 83551c65f68d ("review: identify discovered revisions by their cover letter")
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/review/_review.py           | 35 +++++++++++++--------------------
 src/b4/review/tracking.py          | 40 ++++++++++++++++++++++++++++++++++++++
 src/b4/review_tui/_tracking_app.py |  9 +++++++++
 src/tests/test_tui_tracking.py     | 15 +++++++++-----
 4 files changed, 72 insertions(+), 27 deletions(-)

diff --git a/src/b4/review/_review.py b/src/b4/review/_review.py
index 147d56d..da11773 100644
--- a/src/b4/review/_review.py
+++ b/src/b4/review/_review.py
@@ -2284,32 +2284,23 @@ def update_series_tracking(
         att = check_series_attestation(lser_att)
         b4.review.tracking.update_attestation(identifier, change_id, current_rev, att)
 
-    # Record all discovered revisions in SQLite, keeping track of what
-    # was already known so we can distinguish genuinely new versions.
-    previously_known: Set[int] = set()
+    # Record all discovered revisions in SQLite through the shared helper, so
+    # a revision is identified by its cover letter when the author sent one.
+    # Recording them here by hand picked the first present patch of the raw,
+    # never-get_series()'d LoreSeries — which has no cover injected into
+    # patches[0] — and left the series titled after patch 1/N (bug 8bb6e4c).
     try:
         conn = b4.review.tracking.get_db(identifier)
-        previously_known = set(
-            r['revision'] for r in b4.review.tracking.get_revisions(conn, change_id)
+        new_revs = b4.review.tracking._record_discovered_revisions(
+            conn, change_id, lmbx, str(linkmask)
         )
-        for v in sorted(lmbx.series.keys()):
-            v_ser = lmbx.series[v]
-            v_msgid = ''
-            v_subject = ''
-            if hasattr(v_ser, 'patches') and v_ser.patches:
-                for p in v_ser.patches:
-                    if p is not None:
-                        v_msgid = p.msgid
-                        v_subject = getattr(p, 'full_subject', '') or getattr(
-                            p, 'subject', ''
-                        )
-                        break
-            v_link = (linkmask % v_msgid) if v_msgid and '%s' in str(linkmask) else ''
-            b4.review.tracking.add_revision(
-                conn, change_id, v, v_msgid, v_subject, v_link
+        result['new_revisions'] = len(new_revs)
+        try:
+            b4.review.tracking.realign_series_subject(
+                conn, change_id, current_rev, lmbx
             )
-            if v not in previously_known:
-                result['new_revisions'] += 1
+        except Exception as ex:
+            logger.warning('Could not realign series subject: %s', ex)
         conn.close()
     except Exception as ex:
         logger.warning('Could not record revisions: %s', ex)
diff --git a/src/b4/review/tracking.py b/src/b4/review/tracking.py
index a503f4b..41004d8 100644
--- a/src/b4/review/tracking.py
+++ b/src/b4/review/tracking.py
@@ -1624,6 +1624,46 @@ def update_series_revision(
     conn.commit()
 
 
+def realign_series_subject(
+    conn: sqlite3.Connection,
+    change_id: str,
+    revision: int,
+    lmbx: 'b4.LoreMailbox',
+) -> bool:
+    """Re-title a tracked series from *lmbx*'s cover letter for *revision*.
+
+    ``series.subject`` is only ever written when a series is first tracked or
+    upgraded, so a row that took its title from the first patch before the
+    cover letter was seen (bug 8bb6e4c) keeps showing it forever — unlike the
+    revisions catalog, which heals itself on every re-add (see
+    :func:`add_revision`).
+
+    Only a cover-derived title is trusted: with nothing but a first-patch
+    fallback in hand there is nothing better than what is already stored, and
+    writing it back would corrupt a correctly titled row.  The bare titles are
+    what get compared, since the tracking and upgrade paths format the
+    ``[PATCH vN x/y]`` prefix differently and neither is wrong.  Returns True
+    if the row was re-titled.
+    """
+    _msgid, subject, from_cover = _raw_revision_ref(lmbx, revision)
+    if not from_cover or not subject:
+        return False
+    row = conn.execute(
+        'SELECT subject FROM series WHERE change_id = ? AND revision = ?',
+        (change_id, revision),
+    ).fetchone()
+    if row is None:
+        return False
+    if b4.LoreSubject(str(row[0] or '')).subject == b4.LoreSubject(subject).subject:
+        return False
+    conn.execute(
+        'UPDATE series SET subject = ? WHERE change_id = ? AND revision = ?',
+        (subject, change_id, revision),
+    )
+    conn.commit()
+    return True
+
+
 def snooze_series(
     conn: sqlite3.Connection,
     change_id: str,
diff --git a/src/b4/review_tui/_tracking_app.py b/src/b4/review_tui/_tracking_app.py
index 2b29dc1..7ca5d2f 100644
--- a/src/b4/review_tui/_tracking_app.py
+++ b/src/b4/review_tui/_tracking_app.py
@@ -4187,6 +4187,15 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
 
         lser, ambytes, initial_base, base_hint, num_am = result
 
+        # The resolved series knows its own title — its cover letter's when it
+        # has one.  Prefer it over the catalog's, which may predate the cover
+        # being seen and name patch 1/N instead (bug 8bb6e4c).  A thread
+        # missing both cover and patch 1 still am-preps but leaves LoreSeries'
+        # '(untitled)' placeholder — the catalog title beats that.
+        lser_subject = getattr(lser, 'subject', '') or ''
+        if lser_subject and lser_subject != '(untitled)':
+            target_subject = lser_subject
+
         base_suggestions = _build_base_suggestions()
 
         self.push_screen(
diff --git a/src/tests/test_tui_tracking.py b/src/tests/test_tui_tracking.py
index b4db46b..8df38db 100644
--- a/src/tests/test_tui_tracking.py
+++ b/src/tests/test_tui_tracking.py
@@ -2824,18 +2824,23 @@ class TestSeriesLifecycle:
         v1_mock.fromname = 'Test Author'
         v1_mock.fromemail = 'author@example.com'
         v1_mock.subject = '[PATCH 0/3] a three-patch series'
+        v1_mock.fingerprint = None
 
-        # v2 mock: needs a patch with msgid so add_revision can record it
-        v2_patch = mock.Mock()
-        v2_patch.msgid = 'cover-v2@example.com'
-        v2_patch.full_subject = '[PATCH v2 0/3] a three-patch series'
+        # v2 mock: needs a cover with msgid so add_revision can record it
+        v2_cover = mock.Mock()
+        v2_cover.msgid = 'cover-v2@example.com'
+        v2_cover.full_subject = '[PATCH v2 0/3] a three-patch series'
         v2_mock = mock.Mock()
         v2_mock.revision = 2
         v2_mock.change_id = change_id
-        v2_mock.patches = [v2_patch, None, None, None]
+        v2_mock.patches = [None, None, None, None]
+        v2_mock.fingerprint = None
 
         mock_lmbx = mock.Mock()
         mock_lmbx.series = {1: v1_mock, 2: v2_mock}
+        # Cover letters live in the mailbox's parse-time covers dict, never in
+        # a raw series' patches[0] — that only happens in get_series().
+        mock_lmbx.covers = {2: v2_cover}
         mock_lmbx.get_series.return_value = v1_mock
 
         series_dict = {

-- 
2.53.0

