Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FA92C11EE
	for <tools@linux.kernel.org>; Tue, 23 Jun 2026 20:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782246868; cv=none; b=duuuEJO0amlk6oNaYaWarnCRE7uvueUiPaUZiRM6IJmVA8sqLWAvVktCpVU0jqksoROKg94InfhY1D4DEMkgJk0a7SNWYRtBOI6Ap3oIqXE5/NJXSlvq/mx8T7A7xrBqfWSEspIDSgJ0XJsCbk0uHkRk+KY+Z7k8ZWYz4/SPySk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782246868; c=relaxed/simple;
	bh=IEAjJP2D3BVQ7iAOLK+zmdXikqJ0dLpbnqe5+t80GdQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IIGPsvtERojEZMIbK3ptaMaSU5ZLyKHHoiziiuuryVn+ierU1VgNIs2tvIGsgSlDpnfMr82IvL4PLBCyV9LfpmAmkockPOw/njhHVXGXEjIelghGIbA+Eeko+iJP10N7aZYvcrHkye4G0o6xFOYif+3rS3n1v4x9FwVYf2SFvso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CnviExP9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CnviExP9"
Received: by smtp.kernel.org (Postfix)
	id 2ADF61F00A3D; Tue, 23 Jun 2026 20:34:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C7B81F000E9;
	Tue, 23 Jun 2026 20:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782246867;
	bh=h5Z5mnM4ZRwH+YE5+T2kRkS19fgoPnPbcknfDmqNRNI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=CnviExP9XRuA/5gFKcZUtEwGKKtKK8fHKPmoiPZM6bzcyxkJU9G5NB2oXfNtTv6V4
	 IHRfAtKDWzNEEzujl5lZuT3qohIb2akbq+mxROtHQzH+RPqWssdPgb9JqYPO7VnN+0
	 EWdchpk/daKuTZX3w7dtOL0g29Ik2c8+C1yUxADTwNhIr12iT0QNknrajM6DklNK1B
	 yXShVKg0Vdzk/IkC6qRpgnm2iAcK1HvSK9+A5JtNNVqm1p9z9CZWU7qSVqt4nl4gei
	 pvFQIK0nhw0a17vk9TKv+LEubiTpOWnak80+W3SmfbIuNsM+7Ya4AC6Re6jwWZ+ws2
	 QBP6odE6AqVmA==
From: Christian Brauner <brauner@kernel.org>
Date: Tue, 23 Jun 2026 22:34:18 +0200
Subject: [PATCH b4 v2 2/6] review-tui: run take->am in the target branch's
 worktree
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-20260623-review-tui-take-am-worktree-v2-2-2cbbab5d5441@kernel.org>
References: <20260623-20260623-review-tui-take-am-worktree-v2-0-2cbbab5d5441@kernel.org>
In-Reply-To: <20260623-20260623-review-tui-take-am-worktree-v2-0-2cbbab5d5441@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-e850d
X-Developer-Signature: v=1; a=openpgp-sha256; l=9592; i=brauner@kernel.org;
 h=from:subject:message-id; bh=IEAjJP2D3BVQ7iAOLK+zmdXikqJ0dLpbnqe5+t80GdQ=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWRZvT3HYmpj0nVM4OOM4w0S/+zt9j465M60br6APkfAp
 +7+23s4OkpZGMS4GGTFFFkc2k3C5ZbzVGw2ytSAmcPKBDKEgYtTACYS0MXwh98h+Pe9svcMNxel
 zgu5qLz8eP/5pRO6hZXtrzWc/Kfme57hF9PHdcGiJ+z59+vvWvN02bdJd7ycriw0fim69LhkbkR
 4EjMA
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
index c910c36..a16f845 100644
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

