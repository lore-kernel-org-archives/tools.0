Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFED736D517
	for <tools@linux.kernel.org>; Wed, 12 Aug 2026 21:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786571233; cv=none; b=JRY3D67TUFYxJpuLcjB/askw9gleo7sNZmZX9HJsjOPDF3YnMonS1z/3GqJ1oscME4i+aocGhvsLVUQiV2EgAu5jSpzEJtXPmWtw5SxuZ4yfBaf7DFsEEssjcSJ595wiYqzJpJ3JUkGGNwe+tNC0HOwfsKO6GbZioE24+enAFM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786571233; c=relaxed/simple;
	bh=8jchzMjXpwueTWeuUXE2FZ+vHL7nGa+IY6mGsyTkRWg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PyR+Y9oRO+BI3oJ23azM2n5UZgunPIvvVHrtxU0n2dZmHb5esPInrpabwcbqtj4VBWaeR/+ewNiOC2Iym2j71quYwjglbeqbbArdb7nCgkDKlZesfl2BQBPMx8cJDHxDkDyhkkWjv40hTl1TcBDbls2DzRbG7hftWzp598RNgKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f5vkzfKn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f5vkzfKn"
Received: by smtp.kernel.org (Postfix)
	id 85AFD1F00A3D; Wed, 12 Aug 2026 21:47:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE8F21F000E9;
	Wed, 12 Aug 2026 21:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786571232;
	bh=32bCUp5kCQdI+OGh+4tS3a/mWmi9W0QJ8jbq4snreJM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=f5vkzfKnViBby/9LcCMwv7c7rVtGjJaya8Q6emUuv56OHQEu83p0iZctBhvvoO0Nd
	 FWifPIK0b0ZZx/nK4zeW2/OY4pGY6NFUl59BykxBo18f0+qgmCYPcnC0uMw0RH5BA5
	 ZPEKMLNTDCi95Ft0k+W1ik7hhI8pv5Z8QSV77A1kBQhpGJzry2KDcDVXTQWObjAq/Q
	 MNPcUHDDvpP9IrxXnMAzO/0Yu584S8XyZR9GA0lY2pjcA+9z94vm/ZMNLJ49y4lhcx
	 kWzVs1sEmoiLtgzanXvbJuKYMrlakWz32XMeXaW4GGHNf4rjCfI+tIN2nGbHAbpqgr
	 AV9vC5d5NF24A==
From: Christian Brauner <brauner@kernel.org>
Date: Wed, 12 Aug 2026 23:46:44 +0200
Subject: [PATCH RFC v2 03/25] review-tui: keep the rethread flag on an
 upgraded series row
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-work-b4-multiver-rows-v2-3-305d53cd723a@kernel.org>
References: <20260812-work-b4-multiver-rows-v2-0-305d53cd723a@kernel.org>
In-Reply-To: <20260812-work-b4-multiver-rows-v2-0-305d53cd723a@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.17-dev-362b8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4852; i=brauner@kernel.org;
 h=from:subject:message-id; bh=8jchzMjXpwueTWeuUXE2FZ+vHL7nGa+IY6mGsyTkRWg=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTVvLz1+H3x31fz+if+MlMq7Pr03u1eosKsBQ5LjB7/i
 mqfWLDMt6OUhUGMi0FWTJHFod0kXG45T8Vmo0wNmDmsTCBDGLg4BWAir2wYGTrWLBf1uHq4snRO
 58bAsLMmf7njRF4cr/1SbRRn8qdaexPDX/lHbRLN2+KLkuSfOW7OemC54lJM6YOdK7MEPc4VfH5
 izQQA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

The upgrade path resolves whether the target revision needs rethreading
and threads target_is_rethreaded through five call sites, then does not
pass it to add_series_to_db().  The UPSERT arm writes is_rethreaded from
the excluded row, so the parameter's False default lands on the row and
clears an existing 1.

A series row saying 0 for a revision that really was stitched together
from individually fetched patches sends retrieve_series_messages() down
the single-msgid path: 'e' shows one patch's thread instead of the
series, and the message count collapses to match.

Pass the flag the upgrade already computed, and stop depending on every
caller remembering to.  The flag describes the posting, which the
revisions catalog already records, so resolve it from there on the way in
and keep the argument for a first track, before there is a catalog row to
ask.  Make the UPSERT arm sticky rather than overwriting, as
add_revision() already is.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/review/tracking.py          | 20 +++++++++++++++++---
 src/b4/review_tui/_tracking_app.py |  6 ++++++
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/src/b4/review/tracking.py b/src/b4/review/tracking.py
index 52b9a897..710b4a0d 100644
--- a/src/b4/review/tracking.py
+++ b/src/b4/review/tracking.py
@@ -456,7 +456,16 @@ def add_series_to_db(
     an existing one in place.  Re-adds come from callers that never
     learned those fields -- the Patchwork tracker attaching its id,
     rescan_branches replaying a branch -- and each used to wipe whatever
-    the others had recorded.
+    the others had recorded.  ``is_rethreaded`` is sticky for the same
+    reason, matching the catalog's :func:`add_revision`.
+
+    ``is_rethreaded`` describes the posting, so the catalog's answer for
+    this revision wins over the argument on the way in.  The argument is
+    still what a first track supplies, before there is a catalog row to
+    ask.  Callers that hand-carry the flag from a catalog lookup are then
+    merely agreeing with the row rather than being the only thing standing
+    between it and a False default -- which is what made dropping it at
+    one call site quietly clear the column.
     """
     if added_at is None:
         added_at = datetime.datetime.now(datetime.timezone.utc).isoformat()
@@ -465,7 +474,9 @@ def add_series_to_db(
         INSERT INTO series
         (change_id, revision, subject, sender_name, sender_email, sent_at, added_at,
          message_id, num_patches, pw_series_id, fingerprint, is_rethreaded)
-        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
+        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,
+                MAX(?, COALESCE((SELECT is_rethreaded FROM revisions
+                                 WHERE change_id = ? AND revision = ?), 0)))
         ON CONFLICT (change_id, revision) DO UPDATE SET
             subject = excluded.subject,
             sender_name = excluded.sender_name,
@@ -476,7 +487,8 @@ def add_series_to_db(
             num_patches = excluded.num_patches,
             pw_series_id = COALESCE(excluded.pw_series_id, series.pw_series_id),
             fingerprint = COALESCE(excluded.fingerprint, series.fingerprint),
-            is_rethreaded = excluded.is_rethreaded
+            is_rethreaded = MAX(COALESCE(series.is_rethreaded, 0),
+                                excluded.is_rethreaded)
         RETURNING track_id
     """,
         (
@@ -492,6 +504,8 @@ def add_series_to_db(
             pw_series_id,
             fingerprint,
             int(is_rethreaded),
+            change_id,
+            revision,
         ),
     )
     track_id = cursor.fetchone()[0]
diff --git a/src/b4/review_tui/_tracking_app.py b/src/b4/review_tui/_tracking_app.py
index 9f0a0302..69da8f58 100644
--- a/src/b4/review_tui/_tracking_app.py
+++ b/src/b4/review_tui/_tracking_app.py
@@ -4462,6 +4462,12 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
                         sent_at,
                         target_msgid,
                         lser.expected or num_am,
+                        # The upgrade already resolved this; without it the
+                        # UPSERT writes the column's 0 default (and clears an
+                        # existing 1), which sends every later retrieval of
+                        # the now-tracked revision down the single-msgid path
+                        # instead of reassembling it from its member patches.
+                        is_rethreaded=bool(target_is_rethreaded),
                     )
                     b4.review.tracking.update_series_status(
                         conn, change_id, 'reviewing', revision=target_rev

-- 
2.53.0

