Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C90351C04
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 21:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785535147; cv=none; b=Ulj0jXlmGluMauJuzC2wxAt2e0nWPFFES/luPYATdcMmdc+QN+MVkpRC6LDrCQVFY817hLE2L8IFLgdFiXa7rT/7SFFYAYJKOtbcozwBHv/iO2pAyRnn+HnxH5euOJ6IVqng+eAYFUGSYO/+ZLKvNvFfkQGm07wL5e2T4gdNlDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785535147; c=relaxed/simple;
	bh=XbR+siBJvaFv34SxvMzEf3nrKKh1ghDDXpDpVus8o10=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ek4duQ+livN9rBsCR1hZx/ub1Xn+aJgbAkAvRCLmTc1VU+2+FmZioTFFYuFgiawmxyCiYYEq5uYCtMJ73VNsO8x4X0jQpYFSGT+CrKplCaWji8kFGEGLJ8hN0Yrga19F8D3qT3kw3ko2Br+5TYy+20tmpNcDCAirW6IzQdfZhBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O25W14MZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O25W14MZ"
Received: by smtp.kernel.org (Postfix)
	id 4FF9F1F00ACA; Fri, 31 Jul 2026 21:59:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76CD21F00AC4;
	Fri, 31 Jul 2026 21:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785535146;
	bh=14IV1fW6shosZkTTr0CG/Y1MNQ++2Hg5etJ9KoweAro=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=O25W14MZSKcNIVSZktPlvZ7eFQIwZ8ju+KYqGLCw8yWsvxiWTm08h9JXW8nYRQ327
	 6to2nAnLloxFtf0eoFLIKyncgr4CHQ1DK++EvBopq8yrfscxVmVkJuS9VPo1lEgWRh
	 YtoD6Vvg4Eyv8wSWcCKXNZgcr3GUo/31kI+RVrXfeAGajdxvSQfAH9WzUkPnGTyc/1
	 odEXeyKpph+fDKK5y56OstXiNHDRpk9lXZF8qVDvuaPVgsYVCVDYUvLQRgG3JIlvOx
	 Y/y7MHNizKOFNKLydawiYF8oIGjBa+ULq+FwWzZWGj6lo9MgfR/GFWA9ruGvt8IQdY
	 dDnGu/j9OLAfw==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 23:58:51 +0200
Subject: [PATCH b4 v2 10/44] review-tui: say which way a take did not reach
 'accepted'
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v2-10-243fd19d322d@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=5498; i=brauner@kernel.org;
 h=from:subject:message-id; bh=XbR+siBJvaFv34SxvMzEf3nrKKh1ghDDXpDpVus8o10=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlSs2e+PCh7pFlK09zZWz62DCNOft2q+3Lpv9a082SV
 lstn/g4u6OUhUGMi0FWTJHFod0kXG45T8Vmo0wNmDmsTCBDGLg4BWAi/q8ZGf7PUsu1y/CO+XHS
 My59v2qmtXom/3/Zgt1Leed91vs/t4Phf4xOzZrad938DAkhiVeWKWkV84j3T3aJZDsWIHPnehg
 HHwA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

The take helpers return None for three different things: accept
unchecked in the dialog, a take that stopped short, and patches that
landed with only the record of them missing. All three were reported
as "series not marked accepted". The last is the worst: it reports a
take that did not happen over one that did.

Tell them apart. The dialog answers the first. The unrecorded take
gets a status of its own, kept out of the tracking database and
Patchwork like None. What is left is a take that stopped short.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/review_tui/_tracking_app.py | 33 ++++++++++++++++++++++++++-------
 src/tests/test_tui_tracking.py     |  6 ++++--
 2 files changed, 30 insertions(+), 9 deletions(-)

diff --git a/src/b4/review_tui/_tracking_app.py b/src/b4/review_tui/_tracking_app.py
index 8d91b37..83e33c7 100644
--- a/src/b4/review_tui/_tracking_app.py
+++ b/src/b4/review_tui/_tracking_app.py
@@ -2645,11 +2645,25 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
                     'Thank & archive skipped: series only partially applied',
                     severity='warning',
                 )
-            else:
+            elif new_status == 'unrecorded':
+                self.notify(
+                    'Thank & archive skipped: the take was not recorded',
+                    severity='warning',
+                )
+            elif not take_screen.accept_series:
                 self.notify(
                     'Thank & archive skipped: series not marked accepted',
                     severity='warning',
                 )
+            else:
+                # _do_take_* returns None both for "accept was unchecked" and
+                # for "the take never finished"; only the latter is left here,
+                # and claiming a status the series never reached would send the
+                # maintainer looking for a take that did not happen.
+                self.notify(
+                    'Thank & archive skipped: take did not complete',
+                    severity='warning',
+                )
 
     @staticmethod
     def _record_take_metadata(
@@ -2664,7 +2678,8 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
 
         Computes patch coverage and returns the resulting series status:
         'accepted' if all patches are now taken, 'partial' if some remain,
-        or None if *accepted* is False (no status change requested).
+        'unrecorded' if the patches went in but the tracking data could not
+        be read, or None if *accepted* is False (no status change requested).
 
         Args:
             topdir: Repository top-level directory.
@@ -2677,8 +2692,10 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
         try:
             cover_text, tracking = b4.review.load_tracking(topdir, review_branch)
         except SystemExit:
-            logger.warning('Could not load tracking data for recording take metadata')
-            return None
+            # The patches are applied; only the record of it is missing, which
+            # is a different thing from a take that never got this far.
+            logger.critical('Could not load tracking data for recording the take')
+            return 'unrecorded'
 
         series = tracking.get('series', {})
         take_info = {
@@ -2993,14 +3010,16 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
     ) -> None:
         """Common post-take steps: record branch, update DB, update Patchwork.
 
-        *new_status* is the status computed by _record_take_metadata: 'accepted',
-        'partial', or None (when the user did not request a status change).
+        *new_status* is the status computed by _record_take_metadata:
+        'accepted', 'partial', 'unrecorded' (nothing was written to the
+        tracking commit, so there is no coverage to propagate), or None (when
+        the user did not request a status change).
         """
         common_dir = b4.git_get_common_dir(topdir)
         if common_dir:
             b4.review.tracking.record_take_branch(common_dir, target_branch)
 
-        if new_status and self._identifier and change_id:
+        if new_status in ('accepted', 'partial') and self._identifier and change_id:
             revision = series.get('revision')
             existing_target = None
             try:
diff --git a/src/tests/test_tui_tracking.py b/src/tests/test_tui_tracking.py
index 3e69621..6a3f2f8 100644
--- a/src/tests/test_tui_tracking.py
+++ b/src/tests/test_tui_tracking.py
@@ -4484,10 +4484,12 @@ class TestTakeThankArchiveChain:
         assert not thanks
         assert any('partially applied' in n for n in notices)
 
-    def test_incomplete_take_does_not_chain(self) -> None:
+    def test_aborted_take_says_so(self) -> None:
+        """A take that never finished is reported as such, not as a series
+        the maintainer declined to accept."""
         thanks, notices = self._run_take_final(None, True)
         assert not thanks
-        assert any('not marked accepted' in n for n in notices)
+        assert any('take did not complete' in n for n in notices)
 
     def test_unchecked_box_never_chains(self) -> None:
         thanks, notices = self._run_take_final('accepted', False)

-- 
2.53.0

