Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84083A6B82
	for <tools@linux.kernel.org>; Mon, 22 Jun 2026 12:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782130856; cv=none; b=G6KSYuH4BTVBv31boQ3noiWNrjlz7NXmHDpKzxVvHpDITBqLPfFSgQGlImFDW2pw7p0AnfQ4PXJueWjTyJkA5H+a/b1TQcmhBaZ87cU+2u5mer7ExpklfC0x5MwFv0F6f+7hULvo7BJP3o4CwdCIDmUiX7hwOH9KA3VM9PpsXok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782130856; c=relaxed/simple;
	bh=yqaMov/Y1wYkdzU9fu8pmzPItO6Jm0oXZgvsLLEC7fQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cMPuRoobuIx3pQv8GEozAPNafVs1onWTVahIv+74uxIosCAzbJ5GqNtDVwBJ7cMnl5SeluDBKIu1DcQKsOKwP0bBw34+g7UQ/UWBB5S9CEZSucAk2KhFDxV30lFRvcOzQcf+KsgYjM1bl7MzsdchTn5QUIoorEu1+jIydyFm4EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O7Skgo18; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O7Skgo18"
Received: by smtp.kernel.org (Postfix)
	id 800B81F00A3A; Mon, 22 Jun 2026 12:20:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DFDA1F000E9;
	Mon, 22 Jun 2026 12:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782130854;
	bh=NeFTHYmom9sGfaOQLuPQJ0haoJoy/0UA4lqvznyk95w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=O7Skgo18/cXMQW+1EQzx0VLHmAC9a2WoG6NvmmUI1vpIYOJLjp6hPi7d+GmNlRGkm
	 ZzKwcryWUxzuuV80o6q7FFqAp6exBWHc+LprcHdrAnlHzdw6Y9CbuAhOyB8AeNXZzv
	 sGKDTFmRUQRuOgoxedrUb3i5PVlCEoKz7jzOghbChE02gK+2Gcrkp7dksRiVU6QEYR
	 brf7lW7egFb7AGFtIxX+LV5CQA5geixeOiAfNRLH9+KFFKUBL4Ds/5LVTbRJ/cIGTC
	 V/dsS3g5q4sZqF3MKqgxSQzy322iVEgsWGcJ1g33tAhit31BDVardBlckW1tINWB/1
	 RrTU6xssnrzfQ==
From: Christian Brauner <brauner@kernel.org>
Date: Mon, 22 Jun 2026 14:20:44 +0200
Subject: [PATCH b4 2/3] review-tui: run take->merge in the target branch's
 worktree
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-review-tui-take-merge-v1-2-ad4893027e4d@kernel.org>
References: <20260622-review-tui-take-merge-v1-0-ad4893027e4d@kernel.org>
In-Reply-To: <20260622-review-tui-take-merge-v1-0-ad4893027e4d@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-04799
X-Developer-Signature: v=1; a=openpgp-sha256; l=22471; i=brauner@kernel.org;
 h=from:subject:message-id; bh=yqaMov/Y1wYkdzU9fu8pmzPItO6Jm0oXZgvsLLEC7fQ=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWRZaiy63Pu0uWBarelFva0CNjtLdB5kpLJtmK+9uFvdP
 eWTyfrLHaUsDGJcDLJiiiwO7Sbhcst5KjYbZWrAzGFlAhnCwMUpABPpfMbIsEjV55rXxpdtrjH6
 OmI6Pctm1lnxTxPmDOLP97n0+9vbPkaGrV3zhCxMJ4V3/41W8fU1zG7Sy1p21tyH88XujOdzDz9
 jBgA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

The take->merge applied the series by checking out the target branch in
the current worktree.  That disturbed the current checkout and, worse,
failed outright with "'<branch>' is already used by worktree at ..."
whenever the target was checked out in another worktree -- a common
setup when applying a series from a different worktree than the one the
branch lives in.

Resolve the worktree that holds the target branch with a new
_worktree_for_branch() helper (git for-each-ref %(worktreepath)) and run
the whole fetch+merge there instead.  If the branch is not checked out
anywhere, use a throwaway worktree.  The current checkout is never
touched, so a series can be taken onto a branch that lives in any
worktree.  FETCH_HEAD is per-worktree, so the fetch is pointed at the
merge worktree too.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/__init__.py                 |  16 +-
 src/b4/review_tui/_modals.py       |   6 +-
 src/b4/review_tui/_tracking_app.py | 298 ++++++++++++++++++++++---------------
 3 files changed, 192 insertions(+), 128 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index adb33cb..4cb6e72 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -5620,8 +5620,16 @@ def git_fetch_am_into_repo(
         logger.info(out.strip())
         logger.info('---')
         logger.info('Fetching into FETCH_HEAD')
+        # FETCH_HEAD is per-worktree, and which worktree git writes it into is
+        # decided by the process cwd for a primary worktree (git_run_command
+        # uses --git-dir there, not -C, so the cwd leaks in). The caller may be
+        # driving this from a different worktree than `gitdir` -- e.g. the
+        # review TUI merging into a branch checked out elsewhere -- so anchor
+        # the fetch to `gitdir` via rundir. Otherwise the commits land in the
+        # caller's FETCH_HEAD and its later `git -C gitdir merge FETCH_HEAD`
+        # reads a stale or missing one, silently merging the wrong commits.
         gitargs = ['fetch', gwt]
-        ecode, out = git_run_command(topdir, gitargs, logstderr=True)
+        ecode, out = git_run_command(gitdir, gitargs, logstderr=True, rundir=gitdir)
         if ecode > 0:
             logger.critical('Unable to fetch from the worktree')
             logger.critical(out.strip())
@@ -5630,8 +5638,10 @@ def git_fetch_am_into_repo(
         if cleanup:
             git_run_command(topdir, ['worktree', 'remove', '--force', gwt])
 
-    if origin and topdir:
-        _rewrite_fetch_head_origin(topdir, gwt, origin)
+    if origin and gitdir:
+        # Rewrite the same FETCH_HEAD the fetch above wrote (gitdir's), not the
+        # cwd worktree's.
+        _rewrite_fetch_head_origin(gitdir, gwt, origin)
 
 
 def edit_in_editor(bdata: bytes, filehint: str = 'COMMIT_EDITMSG') -> bytes:
diff --git a/src/b4/review_tui/_modals.py b/src/b4/review_tui/_modals.py
index a708dbc..d383fdc 100644
--- a/src/b4/review_tui/_modals.py
+++ b/src/b4/review_tui/_modals.py
@@ -726,6 +726,7 @@ class TakeScreen(ModalScreen[bool]):
         default_method: Optional[str] = None,
         recent_branches: Optional[List[str]] = None,
         subject: str = '',
+        default_signoff: bool = True,
     ) -> None:
         """Initialize take screen.
 
@@ -736,6 +737,7 @@ class TakeScreen(ModalScreen[bool]):
             default_method: Override the default take method selection
             recent_branches: Recently used branch names for auto-suggest
             subject: Series subject to display for context
+            default_signoff: Initial state of the "add Signed-off-by" checkbox
         """
         super().__init__()
         self._target_branch = target_branch
@@ -749,7 +751,7 @@ class TakeScreen(ModalScreen[bool]):
         self.target_result: str = ''
         self.method_result: str = self._default_method
         self.add_link: bool = True
-        self.add_signoff: bool = True
+        self.add_signoff: bool = default_signoff
         self.accept_series: bool = True
 
     def compose(self) -> ComposeResult:
@@ -784,7 +786,7 @@ class TakeScreen(ModalScreen[bool]):
             )
             yield Checkbox(
                 'add Signed-off-by:',
-                value=True,
+                value=self.add_signoff,
                 id='take-add-signoff',
                 classes='take-checkbox',
             )
diff --git a/src/b4/review_tui/_tracking_app.py b/src/b4/review_tui/_tracking_app.py
index 959670a..3293786 100644
--- a/src/b4/review_tui/_tracking_app.py
+++ b/src/b4/review_tui/_tracking_app.py
@@ -16,6 +16,7 @@ import os
 import pathlib
 import re
 import shlex
+import shutil
 import sqlite3
 import subprocess
 import sys
@@ -137,25 +138,44 @@ _ACTIONABLE_STATUSES: frozenset[str] = frozenset(
 )
 
 
-def _shazam_merge_flags(config: Dict[str, Any]) -> List[str]:
-    """Extra ``git merge`` flags for the take->merge path from config.
+def _shazam_merge_flags(config: Dict[str, Any], add_signoff: bool) -> List[str]:
+    """``git merge`` flags for the take->merge path.
 
-    Mirrors the ``b4 shazam`` CLI's handling of ``b4.shazam-merge-flags``
-    (e.g. ``--log``, ``--stat``, ``--gpg-sign``) so a merge taken from the
-    review TUI carries the same options.
+    ``b4.shazam-merge-flags`` is passed through verbatim, exactly like the
+    ``b4 shazam`` CLI, so ``--log``/``--stat``/``--gpg-sign`` and any strategy
+    (e.g. ``-s ours``) take effect unchanged -- the config is authoritative.
 
-    Signed-off-by is deliberately dropped here: in the review TUI the merge
-    commit's SoB is controlled by the take dialog's "add Signed-off-by"
-    checkbox, which edits the merge message body directly. ``git merge
-    --signoff`` does not dedup against an existing trailer, so leaving it in
-    would append a second Signed-off-by line.
+    Signed-off-by is then reconciled with the take dialog's checkbox, which is
+    the per-take override: any ``--signoff``/``--no-signoff`` already in the
+    config is dropped and a single, deduped flag is appended from
+    *add_signoff*. The checkbox itself defaults from the config's signoff
+    intent (see ``_show_take_screen``), so an unset config (whose default is
+    ``--signoff``) still signs off, while ``--no-signoff`` in the config
+    defaults the box off. Signoff rides on the git flag rather than being baked
+    into the merge message body, so it can never double up (``git merge
+    --signoff`` does not dedup against a trailer already in the message).
     """
     raw = str(config.get('shazam-merge-flags', '--signoff'))
-    if not raw:
-        return []
     sp = shlex.shlex(raw, posix=True)
     sp.whitespace_split = True
-    return [f for f in sp if f not in ('-s', '--signoff', '--no-signoff')]
+    flags = [f for f in sp if f not in ('--signoff', '--no-signoff')]
+    flags.append('--signoff' if add_signoff else '--no-signoff')
+    return flags
+
+
+def _worktree_for_branch(topdir: str, branch: str) -> Optional[str]:
+    """Return the path of the worktree that has *branch* checked out, if any.
+
+    The review TUI may be driven from a different worktree than the one the
+    series is being applied to, so the merge has to run wherever the target
+    branch lives rather than in the current checkout.
+    """
+    ecode, out = b4.git_run_command(
+        topdir, ['for-each-ref', '--format=%(worktreepath)', f'refs/heads/{branch}']
+    )
+    if ecode != 0:
+        return None
+    return out.strip() or None
 
 
 def _resolve_worktree_am_conflict(topdir: str, cex: 'b4.AmConflictError') -> bool:
@@ -2311,6 +2331,12 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
         if target_branch and target_branch not in all_suggestions:
             all_suggestions.append(target_branch)
         recent_branches = all_suggestions or None
+        # Default the Signed-off-by checkbox from the configured signoff intent
+        # (shazam-merge-flags defaults to --signoff), so config drives the
+        # default while the user can still override it per-take.
+        default_signoff = '--signoff' in shlex.split(
+            str(b4cfg.get('shazam-merge-flags', '--signoff'))
+        )
         take_screen = TakeScreen(
             target_branch,
             review_branch,
@@ -2318,6 +2344,7 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
             default_method=default_method,
             recent_branches=recent_branches,
             subject=series.get('subject', ''),
+            default_signoff=default_signoff,
         )
         self.push_screen(
             take_screen,
@@ -2516,9 +2543,11 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
         series['taken'] = take_info
         series.setdefault('takes', []).append(take_info)
 
-        # Record the branch tip commit for CI lookups (e.g. KernelCI).
-        # HEAD is still on target_branch at this point.
-        ecode, tip_out = b4.git_run_command(topdir, ['rev-parse', 'HEAD'])
+        # Record the resulting target-branch tip for CI lookups (e.g. KernelCI).
+        # Resolve the branch ref, not HEAD: the merge-take path advances
+        # target_branch in a separate worktree and never moves the current
+        # checkout, so HEAD here is the launch branch, not the merge commit.
+        ecode, tip_out = b4.git_run_command(topdir, ['rev-parse', target_branch])
         if ecode == 0 and tip_out.strip():
             tip_entry = {
                 'date': take_info['date'],
@@ -2641,21 +2670,9 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
         if not take_screen.add_link:
             body = re.sub(r'^Link:.*\n?', '', body, flags=re.MULTILINE)
 
-        # Append Signed-off-by if requested
-        if take_screen.add_signoff:
-            usercfg = b4.get_config_from_git('user\\..*')
-            uname = usercfg.get('name', '')
-            uemail = usercfg.get('email', '')
-            if uname and uemail:
-                sob = f'Signed-off-by: {uname} <{uemail}>'
-                stripped = body.rstrip('\n')
-                # If the body already ends with a trailer (e.g. Link:),
-                # keep them in the same block without a blank line.
-                last_line = stripped.rsplit('\n', 1)[-1]
-                if re.match(r'^[A-Za-z-]+:\s', last_line):
-                    body = stripped + '\n' + sob + '\n'
-                else:
-                    body = stripped + '\n\n' + sob + '\n'
+        # Signed-off-by is not baked into the body: it rides on git-merge's
+        # --signoff flag (see _shazam_merge_flags), reconciled with the take
+        # dialog's checkbox, so it can never double up with shazam-merge-flags.
 
         # Apply trailer-amended patches in a sparse worktree and fetch
         # into FETCH_HEAD, so individual commits carry their trailers.
@@ -2672,110 +2689,145 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
                 return
             base_commit = out.strip()
 
-        try:
-            b4.git_fetch_am_into_repo(
-                topdir,
-                ambytes,
-                at_base=base_commit,
-                origin=t_series.get('link', ''),
-                am_flags=['-3'],
+        # A throwaway worktree from a previously interrupted take may still be
+        # registered -- possibly even holding target_branch, in which case the
+        # resolution below would latch onto it and then never clean it up
+        # (temp_wt stays None, so the finally skips removal). Remove any such
+        # leftover up front. This also clears a bare leftover directory that a
+        # plain `worktree remove` would choke on.
+        common_dir = b4.git_get_common_dir(topdir)
+        temp_wt: Optional[str] = None
+        if common_dir:
+            leftover = os.path.join(common_dir, 'b4-take-worktree')
+            if os.path.exists(leftover):
+                b4.git_run_command(topdir, ['worktree', 'remove', '--force', leftover])
+                b4.git_run_command(topdir, ['worktree', 'prune'])
+                if os.path.isdir(leftover):
+                    shutil.rmtree(leftover, ignore_errors=True)
+
+        # Run the merge in whichever worktree holds the target branch -- the
+        # review TUI may be driven from a different worktree than the one the
+        # series is being applied to, and the target may even be checked out
+        # elsewhere. If it is not checked out anywhere, use a throwaway
+        # worktree, so the current checkout is never disturbed.
+        merge_dir = _worktree_for_branch(topdir, target_branch)
+        if merge_dir is None:
+            if not common_dir:
+                logger.critical('Unable to determine git common dir')
+                _wait_for_enter()
+                return
+            temp_wt = os.path.join(common_dir, 'b4-take-worktree')
+            ecode, out = b4.git_run_command(
+                topdir, ['worktree', 'add', temp_wt, target_branch], logstderr=True
             )
-        except b4.AmConflictError as cex:
-            if not _resolve_worktree_am_conflict(topdir, cex):
+            if ecode != 0:
+                logger.critical(
+                    'Could not create a worktree for %s: %s',
+                    target_branch,
+                    out.strip(),
+                )
                 _wait_for_enter()
                 return
-        except RuntimeError:
-            _wait_for_enter()
-            return
-
-        # Save current branch so we can restore on failure
-        prev_branch = b4.git_get_current_branch(topdir)
-        if prev_branch is None:
-            prev_branch = b4.git_revparse_obj('HEAD', gitdir=topdir)
+            merge_dir = temp_wt
 
-        # Checkout target branch
-        ecode, out = b4.git_run_command(
-            topdir, ['checkout', target_branch], logstderr=True
-        )
-        if ecode != 0:
-            logger.critical('Could not checkout %s: %s', target_branch, out.strip())
-            _wait_for_enter()
-            return
+        try:
+            # Apply trailer-amended patches in a sparse worktree and fetch into
+            # the target worktree's FETCH_HEAD (which is per-worktree), so the
+            # merge below sees them and each commit carries its trailers.
+            try:
+                b4.git_fetch_am_into_repo(
+                    merge_dir,
+                    ambytes,
+                    at_base=base_commit,
+                    origin=t_series.get('link', ''),
+                    am_flags=['-3'],
+                )
+            except b4.AmConflictError as cex:
+                if not _resolve_worktree_am_conflict(merge_dir, cex):
+                    _wait_for_enter()
+                    return
+            except RuntimeError:
+                _wait_for_enter()
+                return
 
-        # Write merge message to git dir
-        ecode, gitdir = b4.git_run_command(topdir, ['rev-parse', '--git-dir'])
-        if ecode != 0:
-            logger.critical('Unable to find git directory')
-            b4.git_run_command(topdir, ['checkout', prev_branch], logstderr=True)
-            _wait_for_enter()
-            return
-        mmf = os.path.join(gitdir.strip(), 'b4-merge-msg')
-        with open(mmf, 'w') as fh:
-            fh.write(body)
+            # Write merge message to the target worktree's git dir
+            ecode, gitdir = b4.git_run_command(merge_dir, ['rev-parse', '--git-dir'])
+            if ecode != 0:
+                logger.critical('Unable to find git directory')
+                _wait_for_enter()
+                return
+            mmf = os.path.join(gitdir.strip(), 'b4-merge-msg')
+            with open(mmf, 'w') as fh:
+                fh.write(body)
 
-        # Merge FETCH_HEAD (trailer-amended patches) instead of the review
-        # branch directly, so each commit carries its trailers. Mirror
-        # "b4 shazam": git-merge builds the final message from -F + the flags
-        # and opens the editor (--edit), so b4.shazam-merge-flags such as
-        # --log/--stat/--gpg-sign take effect and the appended shortlog is
-        # visible. Signed-off-by is left out of the flags -- it is already in
-        # the body via the take dialog's checkbox (see _shazam_merge_flags).
-        mergeflags = _shazam_merge_flags(config)
-        out = ''
-        if hasattr(sys, '_running_in_pytest'):
-            # Tests have no tty for an interactive editor; run the merge
-            # non-interactively through the captured runner, like the CLI does.
-            mergeargs = (
-                ['merge', '--no-ff', '-F', mmf, '--no-edit', 'FETCH_HEAD']
-                + mergeflags
-            )
-            ecode, out = b4.git_run_command(topdir, mergeargs, logstderr=True)
-        else:
-            # Run git directly with an inherited tty (under the caller's
-            # suspend()) so git can open the editor, like _suspend_to_shell.
-            mergeargs = (
-                ['git', '-C', topdir, 'merge', '--no-ff', '-F', mmf, '--edit',
-                 'FETCH_HEAD']
-                + mergeflags
-            )
-            ecode = subprocess.run(mergeargs).returncode
+            # Merge FETCH_HEAD (trailer-amended patches) instead of the review
+            # branch directly, so each commit carries its trailers. Mirror
+            # "b4 shazam": git-merge builds the final message from -F + the
+            # flags and opens the editor (--edit), so b4.shazam-merge-flags
+            # such as --log/--stat/--gpg-sign take effect and the appended
+            # shortlog is visible. Signed-off-by rides on --signoff in the
+            # flags, reconciled with the take dialog's checkbox (see
+            # _shazam_merge_flags).
+            mergeflags = _shazam_merge_flags(config, take_screen.add_signoff)
+            out = ''
+            if hasattr(sys, '_running_in_pytest'):
+                # Tests have no tty for an interactive editor; run the merge
+                # non-interactively through the captured runner, like the CLI.
+                mergeargs = (
+                    ['merge', '--no-ff', '-F', mmf, '--no-edit', 'FETCH_HEAD']
+                    + mergeflags
+                )
+                ecode, out = b4.git_run_command(merge_dir, mergeargs, logstderr=True)
+            else:
+                # Run git directly with an inherited tty (under the caller's
+                # suspend()) so git can open the editor, like _suspend_to_shell.
+                mergeargs = (
+                    ['git', '-C', merge_dir, 'merge', '--no-ff', '-F', mmf,
+                     '--edit', 'FETCH_HEAD']
+                    + mergeflags
+                )
+                ecode = subprocess.run(mergeargs).returncode
 
-        # Clean up message file
-        try:
-            os.unlink(mmf)
-        except OSError:
-            pass
+            # Clean up message file
+            try:
+                os.unlink(mmf)
+            except OSError:
+                pass
 
-        if ecode != 0:
-            logger.critical('Merge failed%s', f': {out.strip()}' if out.strip() else '')
-            logger.critical('Aborting merge...')
-            b4.git_run_command(topdir, ['merge', '--abort'], logstderr=True)
-            b4.git_run_command(topdir, ['checkout', prev_branch], logstderr=True)
-            _wait_for_enter()
-            return
+            if ecode != 0:
+                logger.critical(
+                    'Merge failed%s', f': {out.strip()}' if out.strip() else ''
+                )
+                logger.critical('Aborting merge...')
+                b4.git_run_command(merge_dir, ['merge', '--abort'], logstderr=True)
+                _wait_for_enter()
+                return
 
-        logger.info('Merged %s into %s', review_branch, target_branch)
+            logger.info('Merged %s into %s', review_branch, target_branch)
 
-        # Record per-patch commit IDs from the merged branch.
-        # After --no-ff merge, HEAD^2 is the tip of the merged side;
-        # the individual patch commits are base_commit..HEAD^2.
-        ecode, out = b4.git_run_command(
-            topdir, ['rev-list', '--reverse', f'{base_commit}..HEAD^2']
-        )
-        new_status: Optional[str] = None
-        if ecode == 0 and out.strip():
-            commit_ids = out.strip().splitlines()
-            new_status = self._record_take_metadata(
-                topdir,
-                review_branch,
-                target_branch,
-                commit_ids,
-                cherrypick=cherrypick,
-                accepted=take_screen.accept_series,
+            # Record per-patch commit IDs from the merged branch.
+            # After --no-ff merge, HEAD^2 is the tip of the merged side;
+            # the individual patch commits are base_commit..HEAD^2.
+            ecode, out = b4.git_run_command(
+                merge_dir, ['rev-list', '--reverse', f'{base_commit}..HEAD^2']
             )
+            new_status: Optional[str] = None
+            if ecode == 0 and out.strip():
+                commit_ids = out.strip().splitlines()
+                new_status = self._record_take_metadata(
+                    topdir,
+                    review_branch,
+                    target_branch,
+                    commit_ids,
+                    cherrypick=cherrypick,
+                    accepted=take_screen.accept_series,
+                )
 
-        self._finalize_take(topdir, target_branch, change_id, t_series, new_status)
-        _wait_for_enter()
+            self._finalize_take(topdir, target_branch, change_id, t_series, new_status)
+            _wait_for_enter()
+        finally:
+            if temp_wt:
+                b4.git_run_command(topdir, ['worktree', 'remove', '--force', temp_wt])
 
     def _finalize_take(
         self,

-- 
2.53.0

