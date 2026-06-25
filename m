Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6818E31E852
	for <tools@linux.kernel.org>; Thu, 25 Jun 2026 12:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782389923; cv=none; b=Uc9tSuO66eiq0ccRWs3vNsWIiTIRm9iSMUFZxw2h5dSmTQbf0pWl3B0BAzBfcAjfAcsONCPnHUgSug2LrvWQs8L1TrD8mdxFwCB1Pp0XvNApXtQPhAnTrEmrV6g2e1HD/aKEeGuSlMZT3ziGwPjsst7pE2Tqcy8lkre1TJOEb6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782389923; c=relaxed/simple;
	bh=gPbfpIg8FsiM2M+GPDsfNRaKw2l1RvZcxAwLGUYuVvo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fiFvYRLBsRRCz7BBJzli8mVGWJb4WEZM5EdTsuFj8P3v75Dvc57hDr+NbdpqcTbunxJlUS4T+XLI4KoGVfK1BQGLR/3jJVAHO1LWMgEvqSkxphSWuJJgY42T7j/Wk3+ZLGvk/JgN3Ku5emFsEKjR7V2Nn97PMBXlJVLcSBHNyAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QIhpb5P3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QIhpb5P3"
Received: by smtp.kernel.org (Postfix)
	id 441D61F00A3D; Thu, 25 Jun 2026 12:18:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 661691F000E9;
	Thu, 25 Jun 2026 12:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782389922;
	bh=pR/EPReEXMtK4RNcwi+lNk2pJk75KmfspoH9ys7QMcE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=QIhpb5P3z2nM0AbsHszIWmFeqbUkCAZUlSzhG7lleKQnLXCh1nQIkfqvq0Y3GdyiX
	 Y4N2A0KQB4kiBF2FSDxYaZpZS/5R3AxQBHj/0xwHfLrFm76U+IM0IFIFfh9qobWBzD
	 EtfSSHWZXLFDSfalaGaxiy2uONaWxct1KKZPR465pUM84Oq/LapCp139qHVvxV4WZT
	 l3GFOCZoH73MS1lsv4oqSWE8WllRqY4TslcIthwoisU4CGkDugIFRzsTnMznQa05j4
	 IH+2L7HmZQyd8QcuPwzlfJqPVTxw8myOEnkPfeSe+7jn7Lchl54Fu4YTRRF0AOCUCO
	 zgKw17kPPxnDg==
From: Christian Brauner <brauner@kernel.org>
Date: Thu, 25 Jun 2026 14:18:36 +0200
Subject: [PATCH RFC 1/2] review-tui: add cherry-pick+merge take method
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260625-20260625-review-tui-take-cherry-pick-merge-v1-1-8ba4809d048a@kernel.org>
References: <20260625-20260625-review-tui-take-cherry-pick-merge-v1-0-8ba4809d048a@kernel.org>
In-Reply-To: <20260625-20260625-review-tui-take-cherry-pick-merge-v1-0-8ba4809d048a@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-d56bb
X-Developer-Signature: v=1; a=openpgp-sha256; l=9545; i=brauner@kernel.org;
 h=from:subject:message-id; bh=gPbfpIg8FsiM2M+GPDsfNRaKw2l1RvZcxAwLGUYuVvo=;
 b=kA0DAAoWkcYbwGV43KIByyZiAGo9HJ+iGry2AytC3Ja+Zhy1+9f1ZB2OUa19TH8uZj+gd3azc
 Ih1BAAWCgAdFiEEQIc0Vx6nDHizMmkokcYbwGV43KIFAmo9HJ8ACgkQkcYbwGV43KJSGgD/aJZG
 jDdoCGtWDH5uCzqbFXzRD97Z0fyDxpBN/UHMBEsBAIBrpeSJbUsus/99l+CqN+DSSSkJCFHUu0z
 PocRaP4YE
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

The Take dialog offered merge, linear, and cherry-pick, but no way to
ask for a cover-letter merge commit of a hand-picked subset of the
series -- the equivalent of "b4 shazam -M -P". A subset merge was only
reachable when patches were pre-marked skipped, in which case a plain
merge fell through to the picker; with nothing skipped, merge always
took the whole series.

The merge path already accepts a cherry-pick selection -- _do_take_merge
builds its mbox from the picked indices -- so this was purely a missing
UI affordance.

Add a fourth method, "merge-pick" (shown as "cherry-pick + merge"), that
always opens the patch picker like cherry-pick and then routes to the
merge path like merge:

  - _on_take_confirmed always shows the picker for merge-pick;
  - _on_take_final dispatches merge-pick to _do_take_merge;
  - the apply self-test bases merge-pick at the series base-commit, as
    it does for a plain merge;
  - it is accepted as a review-default-take-method value.

The picker's existing pre-deselection of skipped patches is shared, so a
cherry-pick+merge over a series with skips starts with those patches
deselected, like the other picker paths.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 docs/config.rst                    |  5 +++--
 docs/releases.rst                  | 10 ++++++++++
 docs/reviewer/getting-started.rst  |  6 ++++--
 src/b4/review_tui/_modals.py       |  7 ++++---
 src/b4/review_tui/_tracking_app.py | 26 +++++++++++++++-----------
 5 files changed, 36 insertions(+), 18 deletions(-)

diff --git a/docs/config.rst b/docs/config.rst
index 7b279e4..95c92a4 100644
--- a/docs/config.rst
+++ b/docs/config.rst
@@ -468,8 +468,9 @@ These settings control ``b4 review`` TUI behaviour.
 
    :term:`b4.review-default-take-method`
      The default take method to pre-select in the Take dialog. Valid
-     values are ``merge``, ``linear``, and ``cherry-pick``. If not set,
-     no method is pre-selected.
+     values are ``merge``, ``linear``, ``cherry-pick``, and
+     ``merge-pick`` (cherry-pick + merge). If not set, no method is
+     pre-selected.
 
      Default: ``None``
 
diff --git a/docs/releases.rst b/docs/releases.rst
index 5ad200f..3f4f013 100644
--- a/docs/releases.rst
+++ b/docs/releases.rst
@@ -90,6 +90,16 @@ to the last 30 days. A self-dismissing notice informs you when the window
 is active, and the title bar shows "· last 30 days" so the absence of
 older series does not look like data loss.
 
+**Cherry-pick + merge take method**
+
+The Take dialog gains a fourth method, **cherry-pick + merge**, the
+equivalent of ``b4 shazam -M -P``. Selecting it always opens the patch
+picker (like cherry-pick) so you can choose a subset of the series, then
+applies the selection as a single ``--no-ff`` merge commit using the
+cover letter as the merge message (like merge). Previously a subset
+could be merged only when some patches were pre-marked skipped; this
+makes a picker-driven subset merge a first-class choice.
+
 ``b4 trailers`` — interactive review and fuzzy matching
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
diff --git a/docs/reviewer/getting-started.rst b/docs/reviewer/getting-started.rst
index ab4506a..c515704 100644
--- a/docs/reviewer/getting-started.rst
+++ b/docs/reviewer/getting-started.rst
@@ -215,8 +215,10 @@ When you are ready to accept a series, open the action menu (``a``)
 and select **Take**. B4 presents a dialog where you choose:
 
 * **Merge strategy** — merge (creates a merge commit using the cover
-  letter as the message template), linear (``git am``), or cherry-pick
-  (select individual patches).
+  letter as the message template), linear (``git am``), cherry-pick
+  (select individual patches), or cherry-pick + merge (select
+  individual patches *and* create a cover-letter merge commit, like
+  ``b4 shazam -M -P``).
 * **Target branch** — recently used branches are suggested, with the
   configured :term:`b4.review-target-branch` always included. You can
   also type a branch name directly.
diff --git a/src/b4/review_tui/_modals.py b/src/b4/review_tui/_modals.py
index 51e6b4e..f20a000 100644
--- a/src/b4/review_tui/_modals.py
+++ b/src/b4/review_tui/_modals.py
@@ -764,6 +764,7 @@ class TakeScreen(ModalScreen[bool]):
             ('merge', 'merge'),
             ('linear', 'linear'),
             ('cherry-pick', 'cherry-pick'),
+            ('cherry-pick + merge', 'merge-pick'),
         ]
         with Vertical(id='take-dialog') as dialog:
             dialog.border_title = 'Take Series'
@@ -1011,9 +1012,9 @@ class TakeConfirmScreen(ModalScreen[bool]):
             patch_base = f'{self._review_branch}~{num_patches + 1}'
             patch_tip = f'{self._review_branch}~1'
 
-            # For merge, test at the series base-commit (or target branch);
-            # for linear/cherry-pick, test at target branch HEAD.
-            if self._method == 'merge':
+            # For merge and cherry-pick+merge, test at the series base-commit
+            # (or target branch); for linear/cherry-pick, test at target HEAD.
+            if self._method in ('merge', 'merge-pick'):
                 t_series = tracking.get('series', {})
                 test_base = t_series.get('base-commit', '')
                 if not test_base:
diff --git a/src/b4/review_tui/_tracking_app.py b/src/b4/review_tui/_tracking_app.py
index d184680..d29f741 100644
--- a/src/b4/review_tui/_tracking_app.py
+++ b/src/b4/review_tui/_tracking_app.py
@@ -2427,7 +2427,7 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
         """Push the TakeScreen dialog."""
         num_patches = series.get('num_patches', 0) or 0
         # Start with user config preference; skip detection below may override it.
-        _valid_take_methods = {'merge', 'linear', 'cherry-pick'}
+        _valid_take_methods = {'merge', 'linear', 'cherry-pick', 'merge-pick'}
         b4cfg = b4.get_config_from_git(r'b4\..*')
         cfg_method = str(b4cfg.get('review-default-take-method', ''))
         default_method: Optional[str] = (
@@ -2496,15 +2496,17 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
     ) -> None:
         """Handle take screen result — proceed to patch selection or confirm.
 
-        The cherry-pick method always offers the patch picker. The merge
-        method offers it only when some patches are skipped, so a merge can
-        still produce a cover-letter merge commit while excluding the
+        The cherry-pick and cherry-pick+merge methods always offer the patch
+        picker. A plain merge offers it only when some patches are skipped, so
+        it can still produce a cover-letter merge commit while excluding the
         skipped patches; with nothing skipped it merges the whole series.
+        cherry-pick+merge ('merge-pick') is the picker-driven merge: it always
+        prompts for a subset and then merges the selection (b4 shazam -M -P).
         """
         if not confirmed:
             return
         method = take_screen.method_result
-        if method in ('cherry-pick', 'merge'):
+        if method in ('cherry-pick', 'merge', 'merge-pick'):
             # Load tracking to get the patch list for selection
             topdir = b4.git_get_toplevel()
             if not topdir:
@@ -2526,8 +2528,10 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
                 if b4.review._get_patch_state(p, usercfg) != 'skip'
             ]
             has_skips = len(preselected) != len(patches)
-            # Merge with nothing skipped takes the whole series, no picker.
-            if method == 'cherry-pick' or has_skips:
+            # cherry-pick and cherry-pick+merge always show the picker; a
+            # plain merge shows it only to drop skipped patches (otherwise it
+            # takes the whole series with no picker).
+            if method in ('cherry-pick', 'merge-pick') or has_skips:
                 # Only pre-populate when some patches are actually skipped
                 pre = preselected if has_skips else None
                 pick_screen = CherryPickScreen(patches, preselected=pre)
@@ -2563,9 +2567,9 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
     ) -> None:
         """Handle patch selection — proceed to confirm screen.
 
-        Preserves the originally chosen method (cherry-pick or merge) so a
-        skip-trimmed merge still produces a merge commit rather than a
-        sequence of cherry-picks.
+        Preserves the originally chosen method (cherry-pick, merge, or
+        merge-pick) so a skip-trimmed merge or a cherry-pick+merge still
+        produces a merge commit rather than a sequence of cherry-picks.
         """
         if not confirmed:
             return
@@ -2625,7 +2629,7 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
         take_screen.accept_series = confirm_screen.accept_series
         self._focus_change_id = change_id
         self._invalidate_caches(change_id)
-        if method == 'merge':
+        if method in ('merge', 'merge-pick'):
             with self.suspend():
                 self._do_take_merge(
                     change_id, review_branch, take_screen, series, cherrypick=cherrypick

-- 
2.53.0

