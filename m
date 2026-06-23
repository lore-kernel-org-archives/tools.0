Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6251E2727EB
	for <tools@linux.kernel.org>; Tue, 23 Jun 2026 16:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782230499; cv=none; b=tMPsIv2zxQ1phsapkTKs0BSTYT8sgC3RWDCp1bb6ezTsbWZ2KuJX8RdME32M93i/8e4sqa4z0us9Ns7nebSmrZDH5jskTqou3phAYsSzSyCgmE9AGS7DGbnaPKEmUJdWtmFN8xZcwEhUMFQNAiKVtrjqHOcMT72diXlfZNGhLNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782230499; c=relaxed/simple;
	bh=Z7N7iMVRN9NAqPvh2lFpKScUoMek7QC6N+OGJu3Ep44=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BgtcqOV4t8vBWP/X3Om7BedcbDrcnui1NwbmT+aVnHErCCCiPIFVPeIN79GngZwH6ZonuiCkwCa7zf6sL3O1qJOCyw6tgZ59XmP6rUraRLvT4gxf6MTaX2CrYUUPk6wAccZg+FCaUE5H0zAVVVElYXlJQpy1n3byHQbtekhhDmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dJulkLh2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dJulkLh2"
Received: by smtp.kernel.org (Postfix)
	id 18AA01F00A3D; Tue, 23 Jun 2026 16:01:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 437D11F000E9;
	Tue, 23 Jun 2026 16:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782230498;
	bh=k7+kHpBemWP2ewLkcjc7UlLh+wGinQUfSBB58ZJWN1c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=dJulkLh2OfiTXPK2MfJ1mb+jzwiSg9d5vrB9zDUcC95/Aj/2h2lwssFsJtaCvKWZF
	 +B1GE3AYRhzkTfJzLkyCpTwBgeKD+XEhi4g6MllA5LBwFCmBG1qBknUNRk/Qn9oJfp
	 b4APtglp8/3m2ZgPkl3rUgw9y5hosuwUCXKqSVzNmPbIPgHRwcGd+Ho5rDMZtAwGNR
	 zgnZiDqoiz0ZCdILAZefeXp32Skukh+RqnyBAloh2r4aGhXDlpPmGkeQMfrrSKBUyR
	 vqlw4ZA41WjcPFzAg6sEcnn7pytOjI/nckcoq3awjAuvrX3Rb3wazZfmtaAy+tHuGu
	 wxP9dP1GMYgDg==
From: Christian Brauner <brauner@kernel.org>
Date: Tue, 23 Jun 2026 18:01:30 +0200
Subject: [PATCH b4 2/6] review-tui: run take->am in the target branch's
 worktree
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-20260623-review-tui-take-am-worktree-v1-2-e8a2140a287e@kernel.org>
References: <20260623-20260623-review-tui-take-am-worktree-v1-0-e8a2140a287e@kernel.org>
In-Reply-To: <20260623-20260623-review-tui-take-am-worktree-v1-0-e8a2140a287e@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-50a61
X-Developer-Signature: v=1; a=openpgp-sha256; l=9592; i=brauner@kernel.org;
 h=from:subject:message-id; bh=Z7N7iMVRN9NAqPvh2lFpKScUoMek7QC6N+OGJu3Ep44=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWRZrb234enrWXOn9bZ3MmRMFlj4VX2dnFHYn1PRn06I6
 N56aHd+X0cpC4MYF4OsmCKLQ7tJuNxynorNRpkaMHNYmUCGMHBxCsBEeOwYGfbX/563RMmXNc7z
 yImuV3dWtmXbV85fuE1p5U+5a7XXVxsyMtzI3/VZK2NVZ5R9oKDm9vub7gke9PT8H7Yvdf1UqRN
 u6gwA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Applying a reviewed series with the linear/cherry-pick (git-am) take method
checked the target branch out in the *current* worktree. When the target
was already checked out elsewhere this failed outright --

    Could not checkout vfs.fixes: fatal: 'vfs.fixes' is already used by
    worktree at '/home/brauner/src/git/linux/vfs/vfs.fixes'

-- and otherwise it clobbered whatever was checked out where review was
being driven from. take->merge already avoided this; take->am did not.

Run git-am through _take_worktree() like the merge path: apply in the
worktree that holds the target branch, or a throwaway one when it is
checked out nowhere, leaving the current checkout untouched. Conflict state
is probed in that worktree's own git dir (rev-parse --absolute-git-dir, not
topdir/.git), the conflict shell opens there, and an unfinished am in a
throwaway worktree is kept rather than torn down under the user.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/review_tui/_tracking_app.py | 147 +++++++++++++++++++------------------
 1 file changed, 74 insertions(+), 73 deletions(-)

diff --git a/src/b4/review_tui/_tracking_app.py b/src/b4/review_tui/_tracking_app.py
index 7af469f..0496eaa 100644
--- a/src/b4/review_tui/_tracking_app.py
+++ b/src/b4/review_tui/_tracking_app.py
@@ -253,6 +253,20 @@ def _take_worktree(
             b4.git_run_command(topdir, ['worktree', 'remove', '--force', temp_wt])
 
 
+def _worktree_rebase_apply_dir(worktree: str) -> Optional[str]:
+    """Return *worktree*'s in-progress ``git am`` state dir, or ``None``.
+
+    ``rebase-apply`` lives under the per-worktree git dir, not the shared
+    ``.git``, so resolve it via ``--absolute-git-dir`` to handle linked and
+    throwaway worktrees too.
+    """
+    ecode, gitdir = b4.git_run_command(worktree, ['rev-parse', '--absolute-git-dir'])
+    if ecode != 0:
+        return None
+    rebase_apply = os.path.join(gitdir.strip(), 'rebase-apply')
+    return rebase_apply if os.path.isdir(rebase_apply) else None
+
+
 def _resolve_worktree_am_conflict(topdir: str, cex: 'b4.AmConflictError') -> bool:
     """Handle an AmConflictError by dropping the user into a shell.
 
@@ -289,17 +303,7 @@ def _resolve_worktree_am_conflict(topdir: str, cex: 'b4.AmConflictError') -> boo
     )
     _suspend_to_shell(hint='b4 conflict', cwd=cex.worktree_path)
     # Check if am is still in progress (user exited without finishing)
-    ecode, wt_gitdir = b4.git_run_command(
-        cex.worktree_path,
-        ['rev-parse', '--git-dir'],
-        logstderr=True,
-        rundir=cex.worktree_path,
-    )
-    if ecode == 0:
-        rebase_apply = os.path.join(wt_gitdir.strip(), 'rebase-apply')
-    else:
-        rebase_apply = ''
-    if rebase_apply and os.path.isdir(rebase_apply):
+    if _worktree_rebase_apply_dir(cex.worktree_path):
         logger.warning('Conflict resolution incomplete, aborting')
         b4.git_run_command(topdir, ['worktree', 'remove', '--force', cex.worktree_path])
         return False
@@ -3094,75 +3098,72 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
         if ambytes is None:
             return
 
-        # Save current branch so we can report it on failure
-        prev_branch = b4.git_get_current_branch(topdir)
-        if prev_branch is None:
-            prev_branch = b4.git_revparse_obj('HEAD', gitdir=topdir)
-
-        # Checkout target branch
-        ecode, out = b4.git_run_command(
-            topdir, ['checkout', target_branch], logstderr=True
-        )
-        if ecode != 0:
-            logger.critical('Could not checkout %s: %s', target_branch, out.strip())
-            _wait_for_enter()
-            return
-
-        # Save HEAD before git-am so we can find the new commits afterwards
-        ecode, out = b4.git_run_command(topdir, ['rev-parse', 'HEAD'])
-        pre_am_head = out.strip() if ecode == 0 else ''
-
-        # Run git-am with three-way merge
-        ecode, out = b4.git_run_command(
-            topdir, ['am', '-3'], stdin=ambytes, logstderr=True
-        )
-        if ecode != 0:
-            logger.critical('git-am failed:')
-            logger.critical(out.strip())
-            logger.info('You can resolve the conflict now.')
-            logger.info(
-                'Use "git am --continue" after resolving, or "git am --abort" to give up.'
-            )
-            _suspend_to_shell(hint='b4 conflict')
-            # Check if am is still in progress (user exited without finishing)
-            rebase_apply_path = os.path.join(topdir, '.git', 'rebase-apply')
-            if os.path.isdir(rebase_apply_path):
-                logger.warning('Conflict resolution incomplete')
-                logger.warning('Run "git am --abort" to clean up')
-                _wait_for_enter()
-                return
-            # Check if am was aborted (HEAD unchanged)
-            ecode, current_head = b4.git_run_command(
-                topdir, ['rev-parse', 'HEAD'], logstderr=True
-            )
-            if ecode != 0 or current_head.strip() == pre_am_head:
-                logger.warning('Conflict resolution aborted')
-                _wait_for_enter()
+        # Apply in whichever worktree holds the target branch (or a throwaway
+        # one), so the current checkout is never disturbed.
+        with _take_worktree(topdir, target_branch) as wt:
+            if wt is None:
                 return
-            logger.info('Conflict resolved, patches applied.')
+            am_dir = wt.path
 
-        logger.info(out.strip())
-        logger.info('Applied patches to %s', target_branch)
+            # Save HEAD before git-am so we can find the new commits afterwards
+            ecode, out = b4.git_run_command(am_dir, ['rev-parse', 'HEAD'])
+            pre_am_head = out.strip() if ecode == 0 else ''
 
-        # Record per-patch commit IDs in the tracking data
-        new_status: Optional[str] = None
-        if pre_am_head:
+            # Run git-am with three-way merge in the target worktree. Anchor to
+            # am_dir via rundir: git_run_command targets a primary worktree with
+            # --git-dir (not -C), so without it git-am writes files into b4's
+            # cwd rather than the target worktree (cf. git_fetch_am_into_repo).
             ecode, out = b4.git_run_command(
-                topdir, ['rev-list', '--reverse', f'{pre_am_head}..HEAD']
+                am_dir, ['am', '-3'], stdin=ambytes, logstderr=True, rundir=am_dir
             )
-            if ecode == 0:
-                commit_ids = out.strip().splitlines()
-                new_status = self._record_take_metadata(
-                    topdir,
-                    review_branch,
-                    target_branch,
-                    commit_ids,
-                    cherrypick=cherrypick,
-                    accepted=take_screen.accept_series,
+            if ecode != 0:
+                logger.critical('git-am failed:')
+                logger.critical(out.strip())
+                logger.info('You can resolve the conflict now.')
+                logger.info(
+                    'Use "git am --continue" after resolving, or "git am --abort" to give up.'
+                )
+                _suspend_to_shell(hint='b4 conflict', cwd=am_dir)
+                if _worktree_rebase_apply_dir(am_dir):
+                    logger.warning('Conflict resolution incomplete')
+                    if wt.is_temp:
+                        wt.keep()
+                        logger.warning('Finish or abort it in: %s', am_dir)
+                    logger.warning('Run "git am --abort" to clean up')
+                    _wait_for_enter()
+                    return
+                # Check if am was aborted (HEAD unchanged)
+                ecode, current_head = b4.git_run_command(
+                    am_dir, ['rev-parse', 'HEAD'], logstderr=True
                 )
+                if ecode != 0 or current_head.strip() == pre_am_head:
+                    logger.warning('Conflict resolution aborted')
+                    _wait_for_enter()
+                    return
+                logger.info('Conflict resolved, patches applied.')
 
-        self._finalize_take(topdir, target_branch, change_id, series, new_status)
-        _wait_for_enter()
+            logger.info(out.strip())
+            logger.info('Applied patches to %s', target_branch)
+
+            # Record per-patch commit IDs in the tracking data
+            new_status: Optional[str] = None
+            if pre_am_head:
+                ecode, out = b4.git_run_command(
+                    am_dir, ['rev-list', '--reverse', f'{pre_am_head}..HEAD']
+                )
+                if ecode == 0:
+                    commit_ids = out.strip().splitlines()
+                    new_status = self._record_take_metadata(
+                        topdir,
+                        review_branch,
+                        target_branch,
+                        commit_ids,
+                        cherrypick=cherrypick,
+                        accepted=take_screen.accept_series,
+                    )
+
+            self._finalize_take(topdir, target_branch, change_id, series, new_status)
+            _wait_for_enter()
 
     def action_rebase(self) -> None:
         """Rebase the review branch on top of current HEAD."""

-- 
2.53.0

