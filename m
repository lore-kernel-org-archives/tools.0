Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100C93CB2DA
	for <tools@linux.kernel.org>; Tue, 23 Jun 2026 23:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782258113; cv=none; b=htFqxEqQwVCtSGrAwTlyJc103w/Tjm2aD4a1SUaK76weJkfg+BB69aabH13WGxwR8bEQcIFEaIp9EgfACLPBw/o3KprODYTQC5/ueIyw2qfGHmESUueXZ9XX4TQ9L9byU6knj7gpJ4jQIhbK2C++ZFk5ld9/aSnHJ4gohH1XJz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782258113; c=relaxed/simple;
	bh=6V4wwBpD45hzZe1nBr280JCjLnPu78GjEic+cX7fy8c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O1dsNC5vW8uHryRPy6tHd/cRvlTgpThGpj2diz1jlcYL81k3k1P6DrRv+il0Sy4WITBuKSnZXgHH/CrzR2NcrGt9vWtAb1iNqfIR8ha/4yU9sEqZd9JsL5l/K8sfo/L19Cie7ZQcUWqB+BWecYlIXGIVf1zLQdJkN8qnIcZgcUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F0xvVSkJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F0xvVSkJ"
Received: by smtp.kernel.org (Postfix)
	id BAB8A1F00A3A; Tue, 23 Jun 2026 23:41:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D33E91F000E9;
	Tue, 23 Jun 2026 23:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782258110;
	bh=ExOll1rSLoD5iYTp0KLZQebnPAeNpAcYzA9dx9vb7c8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=F0xvVSkJ3KL0HWkRFrC7HitnkMCJZh2OFVVy+BkO+x0j0gOFoVg27LC229x7b/01b
	 3luVj2isZE9NoIBo3rKQeNMCu2lL6LmrrsOSyDNQpdMDcul8zMp/XXzYuAB31T9rua
	 jiWT+f6orB0U4CTaKpZ9gsuo9GXkqXYO54CL9YK8IK2w8mUGljNXR52qbin6ttNgJm
	 ey6GJcwAVCeYfDJPbRWkv5+orWieAgcUGbvIuPg9zk1tkdFLHReMTKZ30eO54HcaMq
	 QqGrpvbgB7N5+ViV8LpkCXFEWZhwpdP5CsG6f+7WZUWJr8n0iK9T/M545U283lNcEo
	 9UNcfucsVwfvQ==
From: Christian Brauner <brauner@kernel.org>
Date: Wed, 24 Jun 2026 01:41:39 +0200
Subject: [PATCH b4 4/5] shazam: resolve conflicts in subdirectory files,
 not just the repo root
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260624-shazam-resolve-native-am-v1-4-91f5e5678998@kernel.org>
References: <20260624-shazam-resolve-native-am-v1-0-91f5e5678998@kernel.org>
In-Reply-To: <20260624-shazam-resolve-native-am-v1-0-91f5e5678998@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-6067f
X-Developer-Signature: v=1; a=openpgp-sha256; l=29902; i=brauner@kernel.org;
 h=from:subject:message-id; bh=6V4wwBpD45hzZe1nBr280JCjLnPu78GjEic+cX7fy8c=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWRZS27fIaNVaX9s7VeG5092L5PTLn4fNaesuNM/6vqeC
 5wrU613d5SyMIhxMciKKbI4tJuEyy3nqdhslKkBM4eVCWQIAxenAEzkvivDP4O3mx8YyiZezzO1
 UJrcLXf1hJnWyWPq3YfSn007bZ9Zd4ORYYWb/9fwGzd7urlyxWas0eq9OKcgJf2e632ui5dY7i3
 XYAMA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

The native-am --resolve flow applies the series in a sparse worktree
(only root-level files materialized). git's 3-way merge refuses to touch
skip-worktree paths, so a conflict in a subdirectory file -- the common
case for real series -- makes `git am -3` abort with a clean index: no
conflict markers, no unmerged entries. b4 then points the user at a
conflict that isn't there; `git am --continue` dead-ends and
`git am --skip` silently drops the patch -- the very failure this series
set out to prevent. Only root-file conflicts worked, which is exactly
what the tests covered, so it slipped through.

Fix it at the shared chokepoint. git_fetch_am_into_repo grows a `resolve`
flag; on a conflict it rebuilds a full (non-sparse) worktree -- abort the
partial am, disable sparse-checkout, replay -- so the conflict is recorded
with real markers for the user (or `git am --continue`) to resolve. Both
`b4 shazam --resolve` and the review TUI apply through this one function,
so both are fixed at once, and the now-redundant sparse-checkout disables
in the two resolve handlers go away. A regression test drives a
subdirectory conflict end to end (and fails without the rebuild).

While here, harden the surrounding flow:

  - b4 shazam --abort no longer crashes on a corrupt/truncated state file
    (_load_shazam_state only guarded the json parse for --continue); abort
    now treats it as no state and cleans it up.
  - shazam --continue refuses up front when the working tree is dirty,
    keeping its saved state so it stays re-runnable, instead of deleting
    state and then letting the final merge fail with nothing to retry.
  - _fetch_and_drop_am_worktree leaves the worktree in place on a fetch
    failure so the resolved git-am can be retried rather than discarded.
  - docs: b4 shazam --continue merges only with -M; with -H it leaves the
    series in FETCH_HEAD, exactly as a clean run would. Say so.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 docs/maintainer/am-shazam.rst      |  12 +-
 src/b4/__init__.py                 |  46 ++++++-
 src/b4/mbox.py                     |  56 +++++++-
 src/b4/review_tui/_tracking_app.py |  15 +--
 src/tests/test_three_way_merge.py  | 264 ++++++++++++++++++++++++++++++++++++-
 5 files changed, 366 insertions(+), 27 deletions(-)

diff --git a/docs/maintainer/am-shazam.rst b/docs/maintainer/am-shazam.rst
index 37dc80f..9671c97 100644
--- a/docs/maintainer/am-shazam.rst
+++ b/docs/maintainer/am-shazam.rst
@@ -317,7 +317,8 @@ the merge commit.
 ``--continue``
   Continue after a conflicted ``--resolve``. Run this once you have
   finished the ``git am`` in the resolution worktree; b4 then fetches the
-  applied series and merges it.
+  applied series and finishes exactly as a clean run would — with ``-M`` it
+  merges the series, with ``-H`` it leaves it in ``FETCH_HEAD`` for you.
 
 ``--abort``
   Abort a conflicted shazam: remove the resolution worktree and clean up
@@ -374,10 +375,11 @@ branch and run::
     b4 shazam --continue
 
 B4 fetches the fully-applied series out of the worktree, removes the
-worktree, and merges the series into your branch — exactly the merge a
-clean ``b4 shazam`` would have made. If that final merge itself
-conflicts, resolve it the normal way (git leaves the conflicted merge in
-your tree) and commit.
+worktree, and finishes exactly as a clean ``b4 shazam`` would: with
+``-M`` it merges the series into your branch, while with ``-H`` (as in the
+example above) it leaves the series in ``FETCH_HEAD`` for you to merge or
+check out. If a ``-M`` merge itself conflicts, resolve it the normal way
+(git leaves the conflicted merge in your tree) and commit.
 
 If you decide you don't want to proceed, run::
 
diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index be41da1..7a695ea 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -5737,20 +5737,41 @@ def _fetch_and_drop_am_worktree(
     tear the worktree down. The fetch is anchored to *dest* via ``rundir`` so
     FETCH_HEAD lands in the worktree the caller merges in (see
     git_fetch_am_into_repo). When *origin* is given, rewrite FETCH_HEAD so the
-    merge message names the series origin instead of the worktree path. Returns
-    False (after still removing the worktree) if the fetch failed.
+    merge message names the series origin instead of the worktree path. On fetch
+    failure the worktree is left in place (so the resolved git-am can be retried)
+    and False is returned.
     """
     ecode, out = git_run_command(dest, ['fetch', gwt], logstderr=True, rundir=dest)
-    if ecode == 0 and origin:
-        _rewrite_fetch_head_origin(dest, gwt, origin)
-    git_run_command(dest, ['worktree', 'remove', '--force', gwt])
     if ecode > 0:
+        # Leave the worktree in place so the resolved git-am can be retried.
         logger.critical('Unable to fetch from the worktree')
         logger.critical(out.strip())
         return False
+    if origin:
+        _rewrite_fetch_head_origin(dest, gwt, origin)
+    git_run_command(dest, ['worktree', 'remove', '--force', gwt])
     return True
 
 
+def _replay_am_on_full_worktree(
+    gwt: str, ambytes: bytes, amargs: List[str]
+) -> Tuple[int, str]:
+    """Replay a sparse-blocked ``git am`` on a full (non-sparse) checkout.
+
+    git_fetch_am_into_repo applies into a sparse worktree (only root-level files
+    materialized). git's 3-way merge will not write ``skip-worktree`` paths, so a
+    subdirectory file makes the sparse ``git am`` stop even when the 3-way is
+    clean -- and a real conflict there is recorded with an empty index (no markers
+    to resolve). Abort the partial am, drop the sparse restriction so every path
+    is present, and replay. Returns the replay's (exit code, output): non-zero is
+    a genuine conflict the user resolves; zero means only sparseness had blocked
+    it and the series actually applies cleanly.
+    """
+    git_run_command(gwt, ['am', '--abort'], logstderr=True, rundir=gwt)
+    git_run_command(gwt, ['sparse-checkout', 'disable'], logstderr=True, rundir=gwt)
+    return git_run_command(gwt, amargs, stdin=ambytes, logstderr=True, rundir=gwt)
+
+
 def git_fetch_am_into_repo(
     gitdir: Optional[str],
     ambytes: bytes,
@@ -5758,6 +5779,7 @@ def git_fetch_am_into_repo(
     origin: Optional[str] = None,
     check_only: bool = False,
     am_flags: Optional[List[str]] = None,
+    resolve: bool = False,
 ) -> None:
     if gitdir is None:
         gitdir = os.getcwd()
@@ -5803,8 +5825,18 @@ def git_fetch_am_into_repo(
             gwt, amargs, stdin=ambytes, logstderr=True, rundir=gwt
         )
         if ecode > 0:
-            cleanup = False
-            raise AmConflictError(gwt, out.strip())
+            if resolve:
+                # The sparse worktree can't write skip-worktree paths, so git-am
+                # stops on any subdirectory file -- a real conflict (recorded
+                # with an empty index, no markers) or even a clean 3-way. Replay
+                # on a full worktree to tell them apart.
+                ecode, out = _replay_am_on_full_worktree(gwt, ambytes, amargs)
+            if ecode > 0:
+                # Genuine conflict: park the am for the user to resolve.
+                cleanup = False
+                raise AmConflictError(gwt, out.strip())
+            # else: only sparseness blocked it; the series applied cleanly --
+            # fall through to the normal fetch-into-FETCH_HEAD path.
         if check_only:
             return
         logger.info('---')
diff --git a/src/b4/mbox.py b/src/b4/mbox.py
index 97ef51f..374328a 100644
--- a/src/b4/mbox.py
+++ b/src/b4/mbox.py
@@ -488,6 +488,18 @@ def make_am(msgs: List[EmailMessage], cmdargs: argparse.Namespace, msgid: str) -
             sp.whitespace_split = True
             am_flags.extend(list(sp))
 
+        # A parked --resolve owns the shared resolution worktree; a fresh shazam
+        # would force-remove it (git_fetch_am_into_repo) and discard the user's
+        # in-progress conflict edits. Refuse until they --continue or --abort.
+        common_dir = b4.git_get_common_dir(topdir)
+        if common_dir and os.path.exists(
+            os.path.join(common_dir, 'b4-shazam-state.json')
+        ):
+            logger.critical('A shazam conflict resolution is already in progress.')
+            logger.critical('Finish it with:  b4 shazam --continue')
+            logger.critical('Or discard it:   b4 shazam --abort')
+            sys.exit(1)
+
         try:
             if cmdargs.mergebase:
                 logger.info(' Base: %s', base_commit)
@@ -499,6 +511,7 @@ def make_am(msgs: List[EmailMessage], cmdargs: argparse.Namespace, msgid: str) -
                 at_base=base_commit,
                 origin=linkurl,
                 am_flags=am_flags,
+                resolve=cmdargs.shazam_resolve,
             )
         except b4.AmConflictError as cex:
             gwt = cex.worktree_path
@@ -520,6 +533,7 @@ def make_am(msgs: List[EmailMessage], cmdargs: argparse.Namespace, msgid: str) -
 
             state = {
                 'worktree': gwt,
+                'base': base_commit,
                 'origin': linkurl,
                 'merge_template_values': tptvals,
                 'merge_template': merge_template,
@@ -1058,9 +1072,8 @@ def _begin_shazam_resolve(
     logger.critical('---')
     logger.critical('Patch series did not apply cleanly.')
 
-    # Drop sparse-checkout so the user can see and edit every conflicted file.
-    b4.git_run_command(gwt, ['sparse-checkout', 'disable'], logstderr=True, rundir=gwt)
-
+    # git_fetch_am_into_repo already rebuilt a full (non-sparse) worktree on the
+    # conflict, so every conflicted file is present for the user to edit.
     state_file = os.path.join(common_dir, 'b4-shazam-state.json')
     with open(state_file, 'w') as sfh:
         json.dump(state, sfh, indent=2)
@@ -1090,8 +1103,17 @@ def _load_shazam_state(
     state_file = os.path.join(common_dir, 'b4-shazam-state.json')
     state = None
     if os.path.exists(state_file):
-        with open(state_file, 'r') as fh:
-            state = json.load(fh)
+        try:
+            with open(state_file, 'r') as fh:
+                state = json.load(fh)
+        except (json.JSONDecodeError, OSError) as ex:
+            # A truncated/corrupt state file (e.g. an interrupted write) must not
+            # crash the recovery command: --abort still cleans it up (state=None
+            # falls back to the default worktree path), --continue can't proceed.
+            if require_state:
+                logger.critical('Shazam state file is corrupt: %s', ex)
+                logger.critical('Run: b4 shazam --abort')
+                sys.exit(1)
     elif require_state:
         logger.critical('No shazam state found. Nothing to continue.')
         sys.exit(1)
@@ -1118,6 +1140,30 @@ def shazam_continue(cmdargs: argparse.Namespace) -> None:
         logger.critical('then run: b4 shazam --continue')
         sys.exit(1)
 
+    # git-am is finished -- but did it apply anything? If the user ran
+    # "git am --abort" (or "--skip"ped every patch) the worktree is back at its
+    # base; fetching+merging that is a no-op ("Already up to date") that would
+    # silently drop the whole series. Refuse instead of reporting false success.
+    base = state.get('base')
+    if base:
+        _e1, head = b4.git_run_command(gwt, ['rev-parse', 'HEAD'], rundir=gwt)
+        _e2, base_sha = b4.git_run_command(
+            gwt, ['rev-parse', '%s^{commit}' % base], rundir=gwt
+        )
+        if head.strip() and head.strip() == base_sha.strip():
+            logger.critical('No patches are applied in the resolution worktree.')
+            logger.critical('(git-am was aborted, or every patch was skipped.)')
+            logger.critical('Nothing to merge -- run: b4 shazam --abort')
+            sys.exit(1)
+
+    # A dirty working tree can make the final merge refuse or fail. Only the
+    # merge cares (do_merge), so check up front and keep the saved state intact
+    # so --continue stays re-runnable once the tree is clean.
+    if state.get('do_merge', True) and b4.git_get_repo_status(topdir):
+        logger.critical('You have uncommitted changes in your working tree.')
+        logger.critical('Commit or stash them, then run: b4 shazam --continue')
+        sys.exit(1)
+
     # git-am completed: fetch the fully-applied series into FETCH_HEAD, drop the
     # worktree, and merge it exactly like a clean shazam would.
     logger.info('Fetching resolved series into FETCH_HEAD')
diff --git a/src/b4/review_tui/_tracking_app.py b/src/b4/review_tui/_tracking_app.py
index 9b3ad65..34f5ad5 100644
--- a/src/b4/review_tui/_tracking_app.py
+++ b/src/b4/review_tui/_tracking_app.py
@@ -256,8 +256,9 @@ def _take_worktree(
 def _resolve_worktree_am_conflict(topdir: str, cex: 'b4.AmConflictError') -> bool:
     """Handle an AmConflictError by dropping the user into a shell.
 
-    Disables sparse checkout in the worktree, suspends to an interactive
-    shell for conflict resolution, then checks the outcome:
+    Suspends to an interactive shell for conflict resolution (the worktree is
+    already a full checkout -- git_fetch_am_into_repo rebuilds it on conflict),
+    then checks the outcome:
 
     - If the user completed ``git am --continue``, fetches the result
       into FETCH_HEAD and removes the worktree.  Returns True.
@@ -268,13 +269,6 @@ def _resolve_worktree_am_conflict(topdir: str, cex: 'b4.AmConflictError') -> boo
     logger.critical(cex.output)
     logger.critical('---')
     logger.critical('Patch did not apply cleanly.')
-    # Disable sparse checkout so user can see and edit files
-    b4.git_run_command(
-        cex.worktree_path,
-        ['sparse-checkout', 'disable'],
-        logstderr=True,
-        rundir=cex.worktree_path,
-    )
     # Save worktree HEAD before shell so we can detect abort
     _ecode, wt_head_before = b4.git_run_command(
         cex.worktree_path,
@@ -1871,6 +1865,7 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
                     at_base=base_commit,
                     origin=linkurl,
                     am_flags=['-3'],
+                    resolve=True,
                 )
 
                 # Create the review branch
@@ -2804,6 +2799,7 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
                     at_base=base_commit,
                     origin=t_series.get('link', ''),
                     am_flags=['-3'],
+                    resolve=True,
                 )
             except b4.AmConflictError as cex:
                 if not _resolve_worktree_am_conflict(merge_dir, cex):
@@ -4309,6 +4305,7 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
                     at_base=base_sha,
                     origin=linkurl,
                     am_flags=['-3'],
+                    resolve=True,
                 )
                 b4.review.create_review_branch(
                     topdir,
diff --git a/src/tests/test_three_way_merge.py b/src/tests/test_three_way_merge.py
index 090aa66..4db592e 100644
--- a/src/tests/test_three_way_merge.py
+++ b/src/tests/test_three_way_merge.py
@@ -526,6 +526,83 @@ def _build_multi_patch_conflict(gitdir: str) -> Tuple[bytes, str]:
     return mbox.encode(), base
 
 
+def _build_subdir_conflict(gitdir: str) -> bytes:
+    """2-patch mbox whose conflicting patch touches a file in a SUBDIRECTORY.
+
+    The shazam worktree is a cone-mode sparse checkout (only root-level files
+    materialized), and git's 3-way merge refuses to touch skip-worktree paths,
+    so a conflict in a subdirectory file used to abort ``git am`` with a clean
+    index (no markers) -- and ``git am --skip`` would silently drop the patch.
+    With ``resolve=True``, git_fetch_am_into_repo rebuilds a full worktree and
+    replays so the conflict is recorded. Patch 1 changes a root file cleanly;
+    patch 2 changes ``drivers/foo.txt`` and conflicts with master.
+    """
+    # Seed a subdirectory file on master so it is part of the base tree.
+    os.makedirs(os.path.join(gitdir, 'drivers'), exist_ok=True)
+    with open(os.path.join(gitdir, 'drivers', 'foo.txt'), 'w') as fh:
+        fh.write('1\n2\n3\n')
+    b4.git_run_command(gitdir, ['add', 'drivers/foo.txt'])
+    b4.git_run_command(gitdir, ['commit', '-m', 'Seed drivers/foo.txt'])
+
+    b4.git_run_command(gitdir, ['checkout', '-b', 'subdir-patch'])
+    with open(os.path.join(gitdir, 'file2.txt'), 'a') as fh:
+        fh.write('Added by patch 1.\n')
+    b4.git_run_command(gitdir, ['add', 'file2.txt'])
+    b4.git_run_command(gitdir, ['commit', '-m', 'Patch 1: modify file2'])
+    with open(os.path.join(gitdir, 'drivers', 'foo.txt'), 'w') as fh:
+        fh.write('1\nPATCH\n3\n')
+    b4.git_run_command(gitdir, ['add', 'drivers/foo.txt'])
+    b4.git_run_command(gitdir, ['commit', '-m', 'Patch 2: change drivers/foo'])
+
+    ecode, mbox = b4.git_run_command(gitdir, ['format-patch', '-2', '--stdout'])
+    assert ecode == 0
+
+    b4.git_run_command(gitdir, ['checkout', 'master'])
+    b4.git_run_command(gitdir, ['branch', '-D', 'subdir-patch'])
+    with open(os.path.join(gitdir, 'drivers', 'foo.txt'), 'w') as fh:
+        fh.write('1\nMASTER\n3\n')
+    b4.git_run_command(gitdir, ['add', 'drivers/foo.txt'])
+    b4.git_run_command(gitdir, ['commit', '-m', 'Master: change drivers/foo'])
+    return mbox.encode()
+
+
+def _build_subdir_clean_3way(gitdir: str) -> bytes:
+    """1-patch mbox: a subdir change that 3-way merges CLEANLY against master.
+
+    The patch edits ``drivers/foo.txt`` near (but clear of) a line master also
+    changed, so the direct ``git apply`` misses on context and falls back to a
+    3-way merge that is clean. In the sparse shazam worktree git-am still stops
+    (it can't write the skip-worktree subdir file), but the full replay applies
+    cleanly -- so ``git_fetch_am_into_repo(resolve=True)`` must NOT report a
+    conflict.
+    """
+    lines = ''.join('%d\n' % n for n in range(1, 21))
+    os.makedirs(os.path.join(gitdir, 'drivers'), exist_ok=True)
+    with open(os.path.join(gitdir, 'drivers', 'foo.txt'), 'w') as fh:
+        fh.write(lines)
+    b4.git_run_command(gitdir, ['add', 'drivers/foo.txt'])
+    b4.git_run_command(gitdir, ['commit', '-m', 'Seed drivers/foo.txt'])
+
+    b4.git_run_command(gitdir, ['checkout', '-b', 'clean3'])
+    with open(os.path.join(gitdir, 'drivers', 'foo.txt'), 'w') as fh:
+        fh.write(lines.replace('10\n', 'TEN-from-patch\n'))
+    b4.git_run_command(gitdir, ['add', 'drivers/foo.txt'])
+    b4.git_run_command(gitdir, ['commit', '-m', 'Patch: drivers/foo line 10'])
+
+    ecode, mbox = b4.git_run_command(gitdir, ['format-patch', '-1', '--stdout'])
+    assert ecode == 0
+
+    b4.git_run_command(gitdir, ['checkout', 'master'])
+    b4.git_run_command(gitdir, ['branch', '-D', 'clean3'])
+    # Line 13 is inside the patch's context window for line 10 (forces 3-way)
+    # but two lines clear of it, so the merge is clean rather than a conflict.
+    with open(os.path.join(gitdir, 'drivers', 'foo.txt'), 'w') as fh:
+        fh.write(lines.replace('13\n', 'THIRTEEN-master\n'))
+    b4.git_run_command(gitdir, ['add', 'drivers/foo.txt'])
+    b4.git_run_command(gitdir, ['commit', '-m', 'Master: drivers/foo line 13'])
+    return mbox.encode()
+
+
 def _make_shazam_state(common_dir: str, state: Optional[Dict[str, Any]] = None) -> str:
     """Write a shazam state file; return its path."""
     state_file = os.path.join(common_dir, 'b4-shazam-state.json')
@@ -575,10 +652,14 @@ def _trigger_am_conflict(
     _begin_shazam_resolve).
     """
     ambytes, _base = _build_multi_patch_conflict(gitdir)
+    _ecode, head = b4.git_run_command(gitdir, ['rev-parse', 'HEAD'])
     with pytest.raises(b4.AmConflictError) as exc_info:
-        b4.git_fetch_am_into_repo(gitdir, ambytes, at_base='HEAD', am_flags=['-3'])
+        b4.git_fetch_am_into_repo(
+            gitdir, ambytes, at_base='HEAD', am_flags=['-3'], resolve=True
+        )
     state = {
         'worktree': exc_info.value.worktree_path,
+        'base': head.strip(),
         'origin': 'https://example.com',
         'merge_template_values': {},
         'merge_template': 'Merge test series\n\nResolved conflict.\n',
@@ -682,6 +763,38 @@ class TestShazamResolveContinue:
         b4.git_run_command(gitdir, ['worktree', 'remove', '--force', wt])
         os.unlink(os.path.join(common_dir, 'b4-shazam-state.json'))
 
+    def test_continue_refuses_after_am_abort(self, gitdir: str) -> None:
+        # Regression: if the user runs "git am --abort" instead of finishing,
+        # the worktree is back at base with no rebase-apply. --continue must
+        # refuse rather than merge the bare base -- a no-op ("Already up to
+        # date") that would silently drop the whole series and report success.
+        common_dir = b4.git_get_common_dir(gitdir)
+        assert common_dir is not None
+        cex, state = _trigger_am_conflict(gitdir)
+        wt = cex.worktree_path
+
+        with pytest.raises(SystemExit):
+            b4.mbox._begin_shazam_resolve(cex, common_dir, state)
+
+        # User gives up with "git am --abort" in the worktree.
+        ecode, _out = b4.git_run_command(wt, ['am', '--abort'], rundir=wt)
+        assert ecode == 0
+        assert b4._worktree_rebase_apply_dir(wt) is None
+
+        # --continue refuses (nothing applied), keeping state + worktree, and
+        # makes NO commit on the branch.
+        _e, head_before = b4.git_run_command(gitdir, ['rev-parse', 'HEAD'])
+        with pytest.raises(SystemExit) as exit_info:
+            b4.mbox.shazam_continue(argparse.Namespace())
+        assert exit_info.value.code == 1
+        assert os.path.exists(os.path.join(common_dir, 'b4-shazam-state.json'))
+        assert os.path.isdir(wt)
+        _e, head_after = b4.git_run_command(gitdir, ['rev-parse', 'HEAD'])
+        assert head_after.strip() == head_before.strip()
+
+        b4.git_run_command(gitdir, ['worktree', 'remove', '--force', wt])
+        os.unlink(os.path.join(common_dir, 'b4-shazam-state.json'))
+
 
 class TestShazamAbort:
     """Tests for shazam_abort cleanup."""
@@ -704,3 +817,152 @@ class TestShazamAbort:
     def test_noop_when_nothing_to_clean(self, gitdir: str) -> None:
         # Should not raise.
         b4.mbox.shazam_abort(argparse.Namespace())
+
+
+class TestSubdirConflictResolve:
+    """Regression: a conflict in a subdirectory file must be resolvable.
+
+    The sparse shazam worktree can't record conflicts in subdirectory files,
+    so ``git am`` aborted with a clean index and the patch was silently
+    dropped. ``resolve=True`` must rebuild a full worktree so the conflict is
+    materialized and every patch survives.
+    """
+
+    def test_subdir_conflict_records_markers_and_keeps_patch(self, gitdir: str) -> None:
+        common_dir = b4.git_get_common_dir(gitdir)
+        assert common_dir is not None
+        ambytes = _build_subdir_conflict(gitdir)
+
+        with pytest.raises(b4.AmConflictError) as exc_info:
+            b4.git_fetch_am_into_repo(
+                gitdir, ambytes, at_base='HEAD', am_flags=['-3'], resolve=True
+            )
+        wt = exc_info.value.worktree_path
+
+        # The subdir file is materialized and recorded as an unmerged conflict
+        # (without the fix it would be absent / clean and the patch lost).
+        assert os.path.exists(os.path.join(wt, 'drivers', 'foo.txt'))
+        _ecode, unmerged = b4.git_run_command(
+            wt, ['diff', '--name-only', '--diff-filter=U'], rundir=wt
+        )
+        assert 'drivers/foo.txt' in unmerged
+
+        state = {
+            'worktree': wt,
+            'origin': 'https://example.com',
+            'merge_template_values': {},
+            'merge_template': 'Merge series\n\nResolved.\n',
+            'merge_flags': '--signoff',
+            'no_interactive': True,
+            'do_merge': True,
+        }
+        with pytest.raises(SystemExit):
+            b4.mbox._begin_shazam_resolve(exc_info.value, common_dir, state)
+
+        # User resolves the subdir conflict natively and finishes the git-am.
+        with open(os.path.join(wt, 'drivers', 'foo.txt'), 'w') as fh:
+            fh.write('1\nRESOLVED\n3\n')
+        b4.git_run_command(wt, ['add', 'drivers/foo.txt'], rundir=wt)
+        ecode, _out = b4.git_run_command(wt, ['am', '--continue'], rundir=wt)
+        assert ecode == 0
+
+        with pytest.raises(SystemExit) as exit_info:
+            b4.mbox.shazam_continue(argparse.Namespace())
+        assert exit_info.value.code == 0
+
+        # Both patches survived: patch 1 (file2) and patch 2 (drivers/foo).
+        ecode, file2 = b4.git_run_command(gitdir, ['show', 'HEAD:file2.txt'])
+        assert ecode == 0 and 'Added by patch 1.' in file2
+        ecode, foo = b4.git_run_command(gitdir, ['show', 'HEAD:drivers/foo.txt'])
+        assert ecode == 0 and 'RESOLVED' in foo
+
+        assert not os.path.exists(os.path.join(common_dir, 'b4-shazam-state.json'))
+        assert not os.path.exists(wt)
+
+
+class TestSubdirCleanThreeWay:
+    """Regression: a clean 3-way in a subdir file must not be a phantom conflict.
+
+    The sparse worktree can't write skip-worktree paths, so git-am stops on the
+    subdir file even though the 3-way is clean. The full replay applies cleanly,
+    so ``resolve=True`` must complete normally -- not raise AmConflictError and
+    send the user off to resolve a conflict that does not exist.
+    """
+
+    def test_clean_subdir_3way_does_not_raise(self, gitdir: str) -> None:
+        common_dir = b4.git_get_common_dir(gitdir)
+        assert common_dir is not None
+        ambytes = _build_subdir_clean_3way(gitdir)
+
+        # Must NOT raise: only sparseness blocked the sparse am; the replay is clean.
+        b4.git_fetch_am_into_repo(
+            gitdir, ambytes, at_base='HEAD', am_flags=['-3'], resolve=True
+        )
+
+        # The series landed in FETCH_HEAD with BOTH edits 3-way merged.
+        ecode, foo = b4.git_run_command(gitdir, ['show', 'FETCH_HEAD:drivers/foo.txt'])
+        assert ecode == 0
+        assert 'TEN-from-patch' in foo and 'THIRTEEN-master' in foo
+
+        # Worktree torn down, nothing parked for resolution.
+        assert not os.path.exists(os.path.join(common_dir, 'b4-shazam-worktree'))
+        assert not os.path.exists(os.path.join(common_dir, 'b4-shazam-state.json'))
+
+
+class TestCorruptShazamState:
+    """A corrupt state file must not crash the recovery command."""
+
+    def test_abort_survives_corrupt_state(self, gitdir: str) -> None:
+        common_dir = b4.git_get_common_dir(gitdir)
+        assert common_dir is not None
+        state_file = os.path.join(common_dir, 'b4-shazam-state.json')
+        with open(state_file, 'w') as fh:
+            fh.write('{ this is not valid json')
+        # Cleans up the corrupt file instead of raising JSONDecodeError.
+        b4.mbox.shazam_abort(argparse.Namespace())
+        assert not os.path.exists(state_file)
+
+    def test_continue_refuses_corrupt_state(self, gitdir: str) -> None:
+        common_dir = b4.git_get_common_dir(gitdir)
+        assert common_dir is not None
+        state_file = os.path.join(common_dir, 'b4-shazam-state.json')
+        with open(state_file, 'w') as fh:
+            fh.write('{ this is not valid json')
+        with pytest.raises(SystemExit) as exit_info:
+            b4.mbox.shazam_continue(argparse.Namespace())
+        assert exit_info.value.code == 1
+        os.unlink(state_file)
+
+
+class TestContinueDirtyTree:
+    """shazam --continue refuses (keeping state) when the main tree is dirty."""
+
+    def test_continue_refuses_dirty_tree(self, gitdir: str) -> None:
+        common_dir = b4.git_get_common_dir(gitdir)
+        assert common_dir is not None
+        cex, state = _trigger_am_conflict(gitdir)
+        wt = cex.worktree_path
+        with pytest.raises(SystemExit):
+            b4.mbox._begin_shazam_resolve(cex, common_dir, state)
+
+        # Finish the git-am in the worktree.
+        with open(os.path.join(wt, 'file1.txt'), 'w') as fh:
+            fh.write('Resolved file1.\n')
+        b4.git_run_command(wt, ['add', 'file1.txt'], rundir=wt)
+        ecode, _out = b4.git_run_command(wt, ['am', '--continue'], rundir=wt)
+        assert ecode == 0
+
+        # Dirty the main tree, then --continue must refuse and keep state/worktree
+        # so it stays re-runnable.
+        with open(os.path.join(gitdir, 'file2.txt'), 'a') as fh:
+            fh.write('uncommitted local edit\n')
+        state_file = os.path.join(common_dir, 'b4-shazam-state.json')
+        with pytest.raises(SystemExit) as exit_info:
+            b4.mbox.shazam_continue(argparse.Namespace())
+        assert exit_info.value.code == 1
+        assert os.path.exists(state_file)
+        assert os.path.isdir(wt)
+
+        b4.git_run_command(gitdir, ['checkout', '--', 'file2.txt'])
+        b4.git_run_command(gitdir, ['worktree', 'remove', '--force', wt])
+        os.unlink(state_file)

-- 
2.53.0

