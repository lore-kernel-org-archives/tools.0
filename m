Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D3239A81B
	for <tools@linux.kernel.org>; Wed, 24 Jun 2026 08:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782291126; cv=none; b=OiiDhBaGZRFqTNuWVN7teUieyS+2h4IIHM2YPE7P3OYT8X9oXCTcM9UJB+S0T2jtBGEFoet+7N2RMd4qis5WlGRKKu1UnEPC06I0Rm5gAaIYm93Doy0sB1QbAa3U4Mh6q5W2J1Ptfz0fj5lrbsIB4iPe6i7uxRXu6xZTZUjIqt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782291126; c=relaxed/simple;
	bh=XO9X56URAbvdvROYpjZyzsZjhY/oIvZa5R+rJcd5L44=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MwlszlWaUpfrKe3tKojSH39OnToP2aydmyS7k38BjOlqYNWH/LMj4URm2HzgCcw+LnIc8S4y19rOOXUnUreNN+cJS1sPpx6jSapscbjQkcJwFfN2Zm+yuph2MnRp3dUlx/7dnjylnyDMwpFqd//YrMLiklajXskQfnAI8a8BTSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TaEMJwhL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TaEMJwhL"
Received: by smtp.kernel.org (Postfix)
	id 525571F00A3A; Wed, 24 Jun 2026 08:52:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75EDF1F000E9;
	Wed, 24 Jun 2026 08:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782291124;
	bh=v7wU3IKvQFQsLJ7h1u43q1uX0c8Zpy8FRIlAfLUedig=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=TaEMJwhLpXT1bzVODSFioUP3iflTwFzDMtb2KQpSeM8PXYYmHCWFH/mmF+dMl0JJp
	 Pn5n9QHydwt8GI9TVBPy7MsniVqPJOaFoE3VR/CpyBl9kUk02RC4UOO9xe6l3zjHiO
	 adop+dzxbKAx+Tjk5rHqZOSsuhzhcEkYzlsgBmYV5Oi0jtWM+Hy5/q0+YlXxA7fkUM
	 kHCMxDs0f8kKOHYsi7pTZPd5U7xB5SBeqeM2OcFK9zK3FAEtYi/Y1oFE7QqoavaxQq
	 i0Eh74+a/u/n4lTEE/GvkLqcDb2YpYsQYmKxq2gBPFjrDpNIgQSyZfjtFh/WEZDsYB
	 fM+ahsyVINweg==
From: Christian Brauner <brauner@kernel.org>
Date: Wed, 24 Jun 2026 10:51:58 +0200
Subject: [PATCH b4 v2 6/7] shazam: resolve --resolve conflicts inline via a
 subshell
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260624-shazam-resolve-native-am-v2-6-97b3a1bc497a@kernel.org>
References: <20260624-shazam-resolve-native-am-v2-0-97b3a1bc497a@kernel.org>
In-Reply-To: <20260624-shazam-resolve-native-am-v2-0-97b3a1bc497a@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-cd519
X-Developer-Signature: v=1; a=openpgp-sha256; l=34645; i=brauner@kernel.org;
 h=from:subject:message-id; bh=XO9X56URAbvdvROYpjZyzsZjhY/oIvZa5R+rJcd5L44=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWRZz1q9u5jdgyWAe9/629aOccH2koaOmdkJ1QZbrm673
 jF15TuJjhIWBjEuBlkxRRaHdpNwueU8FZuNMjVg5rAygQxh4OIUgIms/MDwhdvtYn5tYO/itV0F
 q1dtNpyU3rUv/8mT6pNKi6srjz0vYmTon/arVvrJwtVRIZpXJ+6aUvHo2pOQfRsOyGc9vLSTYfZ
 mRgA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

b4 shazam --resolve used a two-phase, git-rebase-style flow: on a git-am
conflict it parked the in-progress am in a worktree, persisted
b4-shazam-state.json, and exited, leaving the user to finish the am by hand
and then run "b4 shazam --continue" (or "--abort").

Replace that with the subshell model the review TUI already uses: suspend into
a shell inside the conflict worktree (a blocking subprocess.run, so b4 stays
the parent) and finish inline when the shell exits -- fetch the fully-applied
series into FETCH_HEAD and merge on success, tear the worktree down on "git am
--abort" or an unfinished am. b4 only execvp's git-merge at the very end, once
the worktree has already been dropped. This drops the persisted state file and
the separate --continue/--abort subcommands.

Factor the shell-and-finish logic into b4.resolve_am_conflict_in_shell() and
have both shazam and the review TUI's three am-conflict call sites use it. Move
_suspend_to_shell() out of b4.tui._common (which imports textual, an optional
dependency) into b4 itself so the non-TUI shazam path can call it without
pulling in textual; b4.tui._common re-exports it for the TUI callers.

The shared helper detects "nothing applied" by comparing the worktree HEAD to
the am's base commit, not to the pre-shell HEAD: after a partial multi-patch
apply, "git am --abort" resets HEAD all the way back to base, which a
before/after-HEAD compare (as the TUI helper previously used) would misread as
success and silently merge a no-op. Passing the base from every call site
hardens the TUI's abort detection too.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 docs/maintainer/am-shazam.rst      |  39 ++-----
 src/b4/__init__.py                 | 145 +++++++++++++++++++++++-
 src/b4/command.py                  |  14 ---
 src/b4/mbox.py                     | 221 +++----------------------------------
 src/b4/review_tui/_tracking_app.py |  60 +---------
 src/b4/tui/_common.py              |  58 +---------
 6 files changed, 182 insertions(+), 355 deletions(-)

diff --git a/docs/maintainer/am-shazam.rst b/docs/maintainer/am-shazam.rst
index 9671c97..3205f77 100644
--- a/docs/maintainer/am-shazam.rst
+++ b/docs/maintainer/am-shazam.rst
@@ -314,16 +314,6 @@ the merge commit.
   enables interactive conflict resolution instead of simply reporting
   the failure. See :ref:`shazam_conflict_resolution` below.
 
-``--continue``
-  Continue after a conflicted ``--resolve``. Run this once you have
-  finished the ``git am`` in the resolution worktree; b4 then fetches the
-  applied series and finishes exactly as a clean run would — with ``-M`` it
-  merges the series, with ``-H`` it leaves it in ``FETCH_HEAD`` for you.
-
-``--abort``
-  Abort a conflicted shazam: remove the resolution worktree and clean up
-  any saved state.
-
 Please also see the :ref:`shazam_settings` section for some
 configuration file options that affect some of ``b4 shazam`` behaviour.
 
@@ -360,31 +350,26 @@ add the ``--resolve`` flag::
     b4 shazam -H --resolve <msgid>
 
 With ``--resolve``, instead of giving up, b4 leaves the in-progress
-``git am`` parked in a throwaway worktree and prints its path. The whole
-series is applied there by git itself, so no patch is ever silently
-dropped. Resolve the conflict the usual way and let ``git am`` work
-through the rest of the series::
+``git am`` parked in a throwaway worktree and drops you into a sub-shell
+whose working directory is that worktree. The whole series is applied
+there by git itself, so no patch is ever silently dropped. Resolve the
+conflict the usual way and let ``git am`` work through the rest of the
+series::
 
-    cd <worktree path printed by b4>
     # edit the conflicted files
     git am --continue        # or: git am --skip
 
-Repeat until ``git am`` reports that it is done, then come back to your
-branch and run::
-
-    b4 shazam --continue
+Repeat until ``git am`` reports that it is done, then leave the sub-shell
+with ``Ctrl-d``.
 
-B4 fetches the fully-applied series out of the worktree, removes the
+B4 then fetches the fully-applied series out of the worktree, removes the
 worktree, and finishes exactly as a clean ``b4 shazam`` would: with
 ``-M`` it merges the series into your branch, while with ``-H`` (as in the
 example above) it leaves the series in ``FETCH_HEAD`` for you to merge or
 check out. If a ``-M`` merge itself conflicts, resolve it the normal way
 (git leaves the conflicted merge in your tree) and commit.
 
-If you decide you don't want to proceed, run::
-
-    b4 shazam --abort
-
-This removes the resolution worktree (discarding the in-progress ``git
-am``), backs out a half-finished merge, and clears the saved state,
-leaving your branch as it was before.
+If you decide you don't want to proceed, run ``git am --abort`` in the
+sub-shell (or simply leave without finishing the ``git am``) and press
+``Ctrl-d``. B4 sees that nothing was applied, removes the worktree, and
+leaves your branch exactly as it was before.
diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 7a695ea..d9e3bff 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -80,9 +80,10 @@ PW_REST_API_VERSION = '1.2'
 
 
 class AmConflictError(RuntimeError):
-    def __init__(self, worktree_path: str, output: str):
+    def __init__(self, worktree_path: str, output: str, base_sha: str = ''):
         self.worktree_path = worktree_path
         self.output = output
+        self.base_sha = base_sha
         super().__init__(output)
 
 
@@ -5753,6 +5754,75 @@ def _fetch_and_drop_am_worktree(
     return True
 
 
+def resolve_am_conflict_in_shell(
+    topdir: str,
+    cex: 'AmConflictError',
+    *,
+    origin: Optional[str] = None,
+) -> bool:
+    """Drop the user into a subshell to finish a conflicted ``git am`` inline.
+
+    Shared by ``b4 shazam --resolve`` and the review TUI: the throwaway worktree
+    *cex.worktree_path* already holds the parked, full-checkout ``git am`` (rebuilt
+    by git_fetch_am_into_repo on conflict). Suspend into a shell there so the user
+    drives the am to completion natively, then act on the outcome:
+
+    - finished (``git am --continue``): fetch the result into *topdir*'s
+      FETCH_HEAD, drop the worktree, return True.
+    - aborted (``git am --abort``) or left unfinished: drop the worktree, return
+      False.
+
+    b4 stays the parent for the whole call (blocking subshell, no exec); the
+    caller must not exit or execvp until this returns -- and only then, once the
+    worktree is gone, hand off to git-merge.
+
+    The am's starting commit is pinned on *cex* (``cex.base_sha``) when the
+    conflict is raised; an am that ends back there (everything aborted or skipped)
+    counts as "nothing applied" and returns False rather than merging a no-op that
+    would silently drop the series. *origin* annotates FETCH_HEAD with the series
+    origin instead of the worktree path (see _fetch_and_drop_am_worktree).
+    """
+    gwt = cex.worktree_path
+    logger.critical('---')
+    logger.critical(cex.output)
+    logger.critical('---')
+    logger.critical('Patch series did not apply cleanly.')
+
+    _suspend_to_shell(
+        hint='b4 conflict',
+        cwd=gwt,
+        guidance=[
+            'You are now in a shell in the conflict worktree.',
+            'Resolve the conflict, then run "git am --continue"'
+            ' (or "git am --skip" to drop a patch).',
+            'Run "git am --abort" to give up on the whole series.',
+            'When done, Ctrl-d returns to b4.',
+        ],
+    )
+
+    # The am must be finished before we can fetch and merge the series.
+    if _worktree_rebase_apply_dir(gwt):
+        logger.warning('git-am is still in progress; conflict resolution incomplete.')
+        git_run_command(topdir, ['worktree', 'remove', '--force', gwt])
+        return False
+
+    # The am is finished -- but did it apply anything? If the user ran
+    # "git am --abort" (or "--skip"ped every patch) the worktree is back at the
+    # am's starting point (cex.base_sha, pinned when the conflict was raised);
+    # fetching+merging that is a no-op that silently drops the whole series.
+    _e1, wt_head_after = git_run_command(gwt, ['rev-parse', 'HEAD'], rundir=gwt)
+    wt_head_after = wt_head_after.strip()
+    if not wt_head_after or wt_head_after == cex.base_sha:
+        logger.warning('No patches are applied; conflict resolution aborted.')
+        git_run_command(topdir, ['worktree', 'remove', '--force', gwt])
+        return False
+
+    # am completed: fetch the fully-applied series into FETCH_HEAD and drop the
+    # worktree so the caller can merge it exactly like a clean apply would.
+    logger.info('Conflict resolved, fetching result...')
+    return _fetch_and_drop_am_worktree(topdir, gwt, origin=origin)
+
+
 def _replay_am_on_full_worktree(
     gwt: str, ambytes: bytes, amargs: List[str]
 ) -> Tuple[int, str]:
@@ -5801,6 +5871,15 @@ def git_fetch_am_into_repo(
     if ecode > 0:
         raise RuntimeError('Failed to create worktree: %s' % out.strip())
 
+    # Pin the commit the worktree (hence the am) starts on, while HEAD still
+    # points at it. A symbolic base like 'HEAD' re-resolved later would follow
+    # the worktree's own HEAD as git-am advances it past base.
+    ecode, base_sha = git_run_command(gwt, ['rev-parse', 'HEAD'], rundir=gwt)
+    base_sha = base_sha.strip()
+    if ecode > 0 or not base_sha:
+        git_run_command(topdir, ['worktree', 'remove', '--force', gwt])
+        raise RuntimeError('Unable to determine worktree base commit')
+
     cleanup = True
     try:
         logger.info('Magic: Preparing a sparse worktree')
@@ -5834,7 +5913,7 @@ def git_fetch_am_into_repo(
             if ecode > 0:
                 # Genuine conflict: park the am for the user to resolve.
                 cleanup = False
-                raise AmConflictError(gwt, out.strip())
+                raise AmConflictError(gwt, out.strip(), base_sha)
             # else: only sparseness blocked it; the series applied cleanly --
             # fall through to the normal fetch-into-FETCH_HEAD path.
         if check_only:
@@ -5867,6 +5946,68 @@ def git_fetch_am_into_repo(
         _rewrite_fetch_head_origin(gitdir, gwt, origin)
 
 
+def _suspend_to_shell(
+    hint: str = 'b4',
+    cwd: Optional[str] = None,
+    guidance: Optional[List[str]] = None,
+) -> None:
+    """Spawn an interactive sub-shell with a PS1 hint.
+
+    For bash and zsh, a temporary rc file is used so the user's normal
+    configuration is loaded first and then the prompt is prefixed with
+    a short marker.  For other shells the B4_REVIEW environment variable
+    is set so the user can incorporate it into their own prompt.
+
+    *guidance* overrides the default banner lines (the review-oriented "do not
+    rewrite commits" advice) with caller-specific instructions -- e.g. the
+    git-am conflict flow, where finishing the am does add a commit.
+    """
+    logger.info('---')
+    if guidance is None:
+        logger.info(
+            'You are now in shell mode. You can execute git commands or run checks.'
+        )
+        logger.info('Cosmetic commit edits (reword subjects, fix trailers) are fine;')
+        logger.info('b4 will reconcile tracking data when you return.')
+        logger.info('Do NOT add, remove, squash, or reorder commits.')
+        logger.info('When done, Ctrl-d to return to review UI.')
+    else:
+        for line in guidance:
+            logger.info(line)
+    logger.info('---')
+
+    shell = os.environ.get('SHELL', '/bin/sh')
+    shellname = os.path.basename(shell)
+    env = os.environ.copy()
+    env['B4_REVIEW'] = hint
+
+    if shellname == 'bash':
+        bashrc = os.path.expanduser('~/.bashrc')
+        source = f'[ -f "{bashrc}" ] && . "{bashrc}"\n'
+        source += f'PS1="({hint}) $PS1"\n'
+        with tempfile.NamedTemporaryFile(
+            mode='w', prefix='b4-shell-', suffix='.sh', delete=False
+        ) as rcf:
+            rcf.write(source)
+            rcfile = rcf.name
+        try:
+            subprocess.run([shell, '--rcfile', rcfile], env=env, cwd=cwd)
+        finally:
+            os.unlink(rcfile)
+    elif shellname == 'zsh':
+        real_zdotdir = os.environ.get('ZDOTDIR', os.path.expanduser('~'))
+        with tempfile.TemporaryDirectory(prefix='b4-shell-') as tmpdir:
+            zshrc = os.path.join(tmpdir, '.zshrc')
+            with open(zshrc, 'w') as f:
+                f.write(f'ZDOTDIR="{real_zdotdir}"\n')
+                f.write('[ -f "$ZDOTDIR/.zshrc" ] && . "$ZDOTDIR/.zshrc"\n')
+                f.write(f'PS1="({hint}) $PS1"\n')
+            env['ZDOTDIR'] = tmpdir
+            subprocess.run([shell], env=env, cwd=cwd)
+    else:
+        subprocess.run([shell], env=env, cwd=cwd)
+
+
 def edit_in_editor(bdata: bytes, filehint: str = 'COMMIT_EDITMSG') -> bytes:
     # To avoid losing the cover letter, ensure that we are still on the same
     # branch as when the cover-letter was originally opened.
diff --git a/src/b4/command.py b/src/b4/command.py
index 19a34d7..3c3dd73 100644
--- a/src/b4/command.py
+++ b/src/b4/command.py
@@ -491,20 +491,6 @@ def setup_parser() -> argparse.ArgumentParser:
         default=False,
         help='(use with -H or -M) Enable conflict resolution if patches fail to apply',
     )
-    sp_sh.add_argument(
-        '--continue',
-        dest='shazam_continue',
-        action='store_true',
-        default=False,
-        help='Continue after resolving merge conflicts from --resolve',
-    )
-    sp_sh.add_argument(
-        '--abort',
-        dest='shazam_abort',
-        action='store_true',
-        default=False,
-        help='Abort a conflicted shazam and clean up',
-    )
     sp_sh.set_defaults(func=cmd_shazam)
 
     # b4 review
diff --git a/src/b4/mbox.py b/src/b4/mbox.py
index 7852c1a..a2646ee 100644
--- a/src/b4/mbox.py
+++ b/src/b4/mbox.py
@@ -488,18 +488,6 @@ def make_am(msgs: List[EmailMessage], cmdargs: argparse.Namespace, msgid: str) -
             sp.whitespace_split = True
             am_flags.extend(list(sp))
 
-        # A parked --resolve owns the shared resolution worktree; a fresh shazam
-        # would force-remove it (git_fetch_am_into_repo) and discard the user's
-        # in-progress conflict edits. Refuse until they --continue or --abort.
-        common_dir = b4.git_get_common_dir(topdir)
-        if common_dir and os.path.exists(
-            os.path.join(common_dir, 'b4-shazam-state.json')
-        ):
-            logger.critical('A shazam conflict resolution is already in progress.')
-            logger.critical('Finish it with:  b4 shazam --continue')
-            logger.critical('Or discard it:   b4 shazam --abort')
-            sys.exit(1)
-
         try:
             if cmdargs.mergebase:
                 logger.info(' Base: %s', base_commit)
@@ -525,23 +513,24 @@ def make_am(msgs: List[EmailMessage], cmdargs: argparse.Namespace, msgid: str) -
                 logger.critical('Use --resolve to enable conflict resolution')
                 sys.exit(1)
 
-            common_dir = b4.git_get_common_dir(topdir)
-            if not common_dir:
-                logger.critical('Unable to determine git common dir')
+            # --resolve into a dirty tree can't finish: the user would resolve the
+            # whole series in the subshell only for the final git-merge to refuse.
+            # Fail fast before any of that resolution work is done.
+            status_lines = b4.git_get_repo_status(topdir)
+            if status_lines:
+                logger.critical('You have uncommitted changes in your working tree.')
+                logger.critical('Please commit or stash them before resolving.')
                 b4.git_run_command(topdir, ['worktree', 'remove', '--force', gwt])
                 sys.exit(1)
 
-            state = {
-                'worktree': gwt,
-                'base': base_commit,
-                'origin': linkurl,
-                'merge_template_values': tptvals,
-                'merge_template': merge_template,
-                'merge_flags': mergeflags,
-                'no_interactive': cmdargs.no_interactive,
-                'do_merge': cmdargs.merge,
-            }
-            _begin_shazam_resolve(cex, common_dir, state)
+            # --resolve: drop into a subshell in the worktree and finish the
+            # git-am inline. On success FETCH_HEAD holds the fully-applied series
+            # and the worktree is gone, so we fall through to the same merge the
+            # clean path runs. b4 stays the parent until then -- no exec/exit
+            # here -- so _run_shazam_merge can only execvp git-merge at the very
+            # end, once the worktree has already been dropped.
+            if not b4.resolve_am_conflict_in_shell(topdir, cex, origin=linkurl):
+                sys.exit(1)
         except RuntimeError:
             sys.exit(1)
 
@@ -1002,8 +991,8 @@ def _run_shazam_merge(
 ) -> None:
     """Merge the series sitting in FETCH_HEAD into the current branch.
 
-    Shared by the clean ``b4 shazam`` path and ``b4 shazam --continue``: render
-    the cover letter as the merge message and either run ``git merge`` (handing
+    Shared by the clean ``b4 shazam`` path and the ``--resolve`` conflict path:
+    render the cover letter as the merge message and either run ``git merge`` (handing
     the terminal to git so it can open the editor and resolve any conflicts
     natively) or just point the user at FETCH_HEAD.
     """
@@ -1056,185 +1045,9 @@ def _run_shazam_merge(
     sys.exit(0)
 
 
-def _begin_shazam_resolve(
-    cex: b4.AmConflictError, common_dir: str, state: Dict[str, Any]
-) -> None:
-    """Hand a conflicted ``git am`` back to the user to finish in the worktree.
-
-    Rather than replaying the not-yet-applied patches with ``git apply``, keep
-    the in-progress ``git am`` (already preserved by git_fetch_am_into_repo) so
-    the user drives it to completion natively and nothing is silently dropped.
-    The fully-applied series is merged once, by ``b4 shazam --continue``.
-    """
-    # TODO: switch --resolve to a subshell model like the review TUI's
-    # _resolve_worktree_am_conflict -- suspend into a shell in the worktree
-    # (blocking subprocess.run; b4 stays the parent) and finish inline when it
-    # exits: fetch+merge on success, tear the worktree down on "git am --abort"
-    # or an unfinished am. That drops the persisted b4-shazam-state.json and the
-    # separate --continue/--abort commands, at the cost of the git-rebase-style
-    # two-phase UX. Two constraints make it robust:
-    #  - b4 must stay alive while the shell runs (no sys.exit/os.execvp until
-    #    cleanup has run); _run_shazam_merge may only execvp git-merge at the
-    #    very end, once the worktree is already dropped.
-    #  - guard the worktree with try/finally (or atexit + a SIGINT/SIGTERM
-    #    handler) so it is reclaimed even if b4 is killed while the shell is up --
-    #    a shell "trap ... EXIT" analogue. Keep it outcome-aware (finished vs
-    #    aborted), never an unconditional remove, or a half-done resolution dies.
-    gwt = cex.worktree_path
-    logger.critical('---')
-    logger.critical(cex.output)
-    logger.critical('---')
-    logger.critical('Patch series did not apply cleanly.')
-
-    # git_fetch_am_into_repo already rebuilt a full (non-sparse) worktree on the
-    # conflict, so every conflicted file is present for the user to edit.
-    state_file = os.path.join(common_dir, 'b4-shazam-state.json')
-    with open(state_file, 'w') as sfh:
-        json.dump(state, sfh, indent=2)
-
-    logger.critical('Resolve the conflict in the worktree and finish the git-am:')
-    logger.critical('  cd %s', gwt)
-    logger.critical('  git am --continue   (or "git am --skip" to drop a patch)')
-    logger.critical('Once git-am is done, come back and run:')
-    logger.critical('  b4 shazam --continue')
-    logger.critical('To give up and clean everything up:')
-    logger.critical('  b4 shazam --abort')
-    sys.exit(1)
-
-
-def _load_shazam_state(
-    require_state: bool = True,
-) -> Tuple[str, str, str, Optional[Dict[str, Any]]]:
-    topdir = b4.git_get_toplevel()
-    if not topdir:
-        logger.critical('Could not figure out where your git dir is.')
-        sys.exit(1)
-    common_dir = b4.git_get_common_dir(topdir)
-    if not common_dir:
-        logger.critical('Unable to determine git common dir.')
-        sys.exit(1)
-
-    state_file = os.path.join(common_dir, 'b4-shazam-state.json')
-    state = None
-    if os.path.exists(state_file):
-        try:
-            with open(state_file, 'r') as fh:
-                state = json.load(fh)
-        except (json.JSONDecodeError, OSError) as ex:
-            # A truncated/corrupt state file (e.g. an interrupted write) must not
-            # crash the recovery command: --abort still cleans it up (state=None
-            # falls back to the default worktree path), --continue can't proceed.
-            if require_state:
-                logger.critical('Shazam state file is corrupt: %s', ex)
-                logger.critical('Run: b4 shazam --abort')
-                sys.exit(1)
-    elif require_state:
-        logger.critical('No shazam state found. Nothing to continue.')
-        sys.exit(1)
-
-    return topdir, common_dir, state_file, state
-
-
-def shazam_continue(cmdargs: argparse.Namespace) -> None:
-    topdir, _common_dir, state_file, state = _load_shazam_state(require_state=True)
-    assert state is not None
-
-    gwt = state.get('worktree')
-    if not gwt or not os.path.isdir(gwt):
-        logger.critical('Resolution worktree is gone. Run: b4 shazam --abort')
-        sys.exit(1)
-
-    # The git-am has to be finished before we can fetch and merge the series.
-    if b4._worktree_rebase_apply_dir(gwt):
-        logger.critical('git-am is still in progress in the worktree:')
-        logger.critical('  %s', gwt)
-        logger.critical(
-            'Finish it there with "git am --continue" (or "git am --skip"),'
-        )
-        logger.critical('then run: b4 shazam --continue')
-        sys.exit(1)
-
-    # git-am is finished -- but did it apply anything? If the user ran
-    # "git am --abort" (or "--skip"ped every patch) the worktree is back at its
-    # base; fetching+merging that is a no-op ("Already up to date") that would
-    # silently drop the whole series. Refuse instead of reporting false success.
-    base = state.get('base')
-    if base:
-        _e1, head = b4.git_run_command(gwt, ['rev-parse', 'HEAD'], rundir=gwt)
-        _e2, base_sha = b4.git_run_command(
-            gwt, ['rev-parse', '%s^{commit}' % base], rundir=gwt
-        )
-        if head.strip() and head.strip() == base_sha.strip():
-            logger.critical('No patches are applied in the resolution worktree.')
-            logger.critical('(git-am was aborted, or every patch was skipped.)')
-            logger.critical('Nothing to merge -- run: b4 shazam --abort')
-            sys.exit(1)
-
-    # A dirty working tree can make the final merge refuse or fail. Only the
-    # merge cares (do_merge), so check up front and keep the saved state intact
-    # so --continue stays re-runnable once the tree is clean.
-    if state.get('do_merge', True) and b4.git_get_repo_status(topdir):
-        logger.critical('You have uncommitted changes in your working tree.')
-        logger.critical('Commit or stash them, then run: b4 shazam --continue')
-        sys.exit(1)
-
-    # git-am completed: fetch the fully-applied series into FETCH_HEAD, drop the
-    # worktree, and merge it exactly like a clean shazam would.
-    logger.info('Fetching resolved series into FETCH_HEAD')
-    if not b4._fetch_and_drop_am_worktree(topdir, gwt, origin=state.get('origin')):
-        sys.exit(1)
-
-    # Clean up state before merging -- an interactive merge hands off via execvp
-    # and never returns here.
-    if os.path.exists(state_file):
-        os.unlink(state_file)
-
-    _run_shazam_merge(
-        topdir,
-        merge_template=state.get('merge_template', DEFAULT_MERGE_TEMPLATE),
-        tptvals=state.get('merge_template_values', {}),
-        merge_flags=str(state.get('merge_flags', '')),
-        no_interactive=state.get('no_interactive', False),
-        do_merge=state.get('do_merge', True),
-    )
-
-
-def shazam_abort(cmdargs: argparse.Namespace) -> None:
-    topdir, common_dir, state_file, state = _load_shazam_state(require_state=False)
-    found = False
-
-    # Back out the FETCH_HEAD merge if --continue started one and it conflicted.
-    ecode, _out = b4.git_run_command(
-        topdir, ['merge', '--abort'], logstderr=True, rundir=topdir
-    )
-    if ecode == 0:
-        found = True
-
-    # Remove the resolution worktree, discarding its in-progress git-am.
-    gwt = state.get('worktree') if state else None
-    if not gwt:
-        gwt = os.path.join(common_dir, 'b4-shazam-worktree')
-    if os.path.exists(gwt):
-        b4.git_run_command(topdir, ['worktree', 'remove', '--force', gwt])
-        found = True
-
-    if os.path.exists(state_file):
-        os.unlink(state_file)
-        found = True
-
-    if found:
-        logger.info('Shazam aborted and cleaned up.')
-    else:
-        logger.info('No shazam in progress.')
-
-
 def main(cmdargs: argparse.Namespace) -> None:
     # We force some settings
     if cmdargs.subcmd == 'shazam':
-        if getattr(cmdargs, 'shazam_continue', False):
-            return shazam_continue(cmdargs)
-        if getattr(cmdargs, 'shazam_abort', False):
-            return shazam_abort(cmdargs)
         cmdargs.checknewer = True
         cmdargs.threeway = False
         cmdargs.nopartialreroll = False
diff --git a/src/b4/review_tui/_tracking_app.py b/src/b4/review_tui/_tracking_app.py
index 34f5ad5..0c00917 100644
--- a/src/b4/review_tui/_tracking_app.py
+++ b/src/b4/review_tui/_tracking_app.py
@@ -253,56 +253,6 @@ def _take_worktree(
             b4.git_run_command(topdir, ['worktree', 'remove', '--force', temp_wt])
 
 
-def _resolve_worktree_am_conflict(topdir: str, cex: 'b4.AmConflictError') -> bool:
-    """Handle an AmConflictError by dropping the user into a shell.
-
-    Suspends to an interactive shell for conflict resolution (the worktree is
-    already a full checkout -- git_fetch_am_into_repo rebuilds it on conflict),
-    then checks the outcome:
-
-    - If the user completed ``git am --continue``, fetches the result
-      into FETCH_HEAD and removes the worktree.  Returns True.
-    - If the user aborted (``git am --abort``) or exited without
-      finishing, cleans up the worktree and returns False.
-    """
-    logger.critical('---')
-    logger.critical(cex.output)
-    logger.critical('---')
-    logger.critical('Patch did not apply cleanly.')
-    # Save worktree HEAD before shell so we can detect abort
-    _ecode, wt_head_before = b4.git_run_command(
-        cex.worktree_path,
-        ['rev-parse', 'HEAD'],
-        logstderr=True,
-        rundir=cex.worktree_path,
-    )
-    wt_head_before = wt_head_before.strip()
-    logger.info('You can resolve the conflict in the worktree.')
-    logger.info(
-        'Use "git am --continue" after resolving, or "git am --abort" to give up.'
-    )
-    _suspend_to_shell(hint='b4 conflict', cwd=cex.worktree_path)
-    # Check if am is still in progress (user exited without finishing)
-    if b4._worktree_rebase_apply_dir(cex.worktree_path):
-        logger.warning('Conflict resolution incomplete, aborting')
-        b4.git_run_command(topdir, ['worktree', 'remove', '--force', cex.worktree_path])
-        return False
-    # Check if am was aborted (HEAD unchanged from before shell)
-    _ecode, wt_head_after = b4.git_run_command(
-        cex.worktree_path,
-        ['rev-parse', 'HEAD'],
-        logstderr=True,
-        rundir=cex.worktree_path,
-    )
-    if wt_head_after.strip() == wt_head_before:
-        logger.warning('Conflict resolution aborted')
-        b4.git_run_command(topdir, ['worktree', 'remove', '--force', cex.worktree_path])
-        return False
-    # am completed -- fetch result into FETCH_HEAD and drop the worktree
-    logger.info('Conflict resolved, fetching result...')
-    return b4._fetch_and_drop_am_worktree(topdir, cex.worktree_path)
-
-
 def _resolve_worktree_take_conflict(
     wt: '_TakeWorktree',
     op: str,
@@ -1884,10 +1834,9 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
                 logger.info('Review branch created: %s', branch_name)
                 checkout_success = True
             except b4.AmConflictError as cex:
-                if not _resolve_worktree_am_conflict(topdir, cex):
+                if not b4.resolve_am_conflict_in_shell(topdir, cex, origin=linkurl):
                     _wait_for_enter()
                     return
-                b4._rewrite_fetch_head_origin(topdir, cex.worktree_path, linkurl)
                 # Create the review branch from resolved result
                 b4.review.create_review_branch(
                     topdir,
@@ -2802,7 +2751,9 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
                     resolve=True,
                 )
             except b4.AmConflictError as cex:
-                if not _resolve_worktree_am_conflict(merge_dir, cex):
+                if not b4.resolve_am_conflict_in_shell(
+                    merge_dir, cex, origin=t_series.get('link', '')
+                ):
                     _wait_for_enter()
                     return
             except RuntimeError:
@@ -4321,14 +4272,13 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
                 )
                 logger.info('Upgrade branch created: %s', upgrade_branch)
             except b4.AmConflictError as cex:
-                if not _resolve_worktree_am_conflict(topdir, cex):
+                if not b4.resolve_am_conflict_in_shell(topdir, cex, origin=linkurl):
                     # User aborted — clean up upgrade branch if it was
                     # partially created before the conflict
                     if b4.git_branch_exists(topdir, upgrade_branch):
                         b4.git_run_command(topdir, ['branch', '-D', upgrade_branch])
                     _wait_for_enter()
                     return
-                b4._rewrite_fetch_head_origin(topdir, cex.worktree_path, linkurl)
                 b4.review.create_review_branch(
                     topdir,
                     upgrade_branch,
diff --git a/src/b4/tui/_common.py b/src/b4/tui/_common.py
index c3312a8..52f6fdd 100644
--- a/src/b4/tui/_common.py
+++ b/src/b4/tui/_common.py
@@ -8,9 +8,6 @@
 __author__ = 'Konstantin Ryabitsev <konstantin@linuxfoundation.org>'
 
 import email.utils
-import os
-import subprocess
-import tempfile
 import unicodedata
 from collections import defaultdict
 from typing import Any, Dict, List, Optional, Protocol
@@ -23,6 +20,11 @@ from textual.worker import NoActiveWorker, get_current_worker
 
 import b4
 
+# _suspend_to_shell now lives in b4 itself (textual-free, so the non-TUI shazam
+# conflict flow can reuse it). Re-export it so this stays the import home for the
+# TUI callers (and b4.review_tui._common's re-export of it).
+from b4 import _suspend_to_shell as _suspend_to_shell
+
 logger = b4.logger
 
 
@@ -206,56 +208,6 @@ def _wait_for_enter() -> None:
         pass
 
 
-def _suspend_to_shell(hint: str = 'b4', cwd: Optional[str] = None) -> None:
-    """Spawn an interactive sub-shell with a PS1 hint.
-
-    For bash and zsh, a temporary rc file is used so the user's normal
-    configuration is loaded first and then the prompt is prefixed with
-    a short marker.  For other shells the B4_REVIEW environment variable
-    is set so the user can incorporate it into their own prompt.
-    """
-    logger.info('---')
-    logger.info(
-        'You are now in shell mode. You can execute git commands or run checks.'
-    )
-    logger.info('Cosmetic commit edits (reword subjects, fix trailers) are fine;')
-    logger.info('b4 will reconcile tracking data when you return.')
-    logger.info('Do NOT add, remove, squash, or reorder commits.')
-    logger.info('When done, Ctrl-d to return to review UI.')
-    logger.info('---')
-
-    shell = os.environ.get('SHELL', '/bin/sh')
-    shellname = os.path.basename(shell)
-    env = os.environ.copy()
-    env['B4_REVIEW'] = hint
-
-    if shellname == 'bash':
-        bashrc = os.path.expanduser('~/.bashrc')
-        source = f'[ -f {bashrc} ] && . {bashrc}\n'
-        source += f'PS1="({hint}) $PS1"\n'
-        with tempfile.NamedTemporaryFile(
-            mode='w', prefix='b4-shell-', suffix='.sh', delete=False
-        ) as rcf:
-            rcf.write(source)
-            rcfile = rcf.name
-        try:
-            subprocess.run([shell, '--rcfile', rcfile], env=env, cwd=cwd)
-        finally:
-            os.unlink(rcfile)
-    elif shellname == 'zsh':
-        real_zdotdir = os.environ.get('ZDOTDIR', os.path.expanduser('~'))
-        with tempfile.TemporaryDirectory(prefix='b4-shell-') as tmpdir:
-            zshrc = os.path.join(tmpdir, '.zshrc')
-            with open(zshrc, 'w') as f:
-                f.write(f'ZDOTDIR="{real_zdotdir}"\n')
-                f.write('[ -f "$ZDOTDIR/.zshrc" ] && . "$ZDOTDIR/.zshrc"\n')
-                f.write(f'PS1="({hint}) $PS1"\n')
-            env['ZDOTDIR'] = tmpdir
-            subprocess.run([shell], env=env, cwd=cwd)
-    else:
-        subprocess.run([shell], env=env, cwd=cwd)
-
-
 def _addrs_to_lines(header_str: str) -> str:
     """Parse a comma-separated address header into one-per-line display."""
     if not header_str:

-- 
2.53.0

