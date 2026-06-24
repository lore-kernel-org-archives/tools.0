Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2E2397B15
	for <tools@linux.kernel.org>; Wed, 24 Jun 2026 08:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782291121; cv=none; b=inbWLyzfqBQ53p24jVrOmvPsGMCwgil3g8T1wmXd6XyJ0x+8ydvKL7yIDq61yd4sZS7CJTChywgSIEJ/NwoZLueqvqWuPoFj2KeOLk/ua4KvDJF/uANN9i+992cYktD7OfFqs6rcMrvJyy3rARnMN/TBYAa5PmeXnCbAub2F+uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782291121; c=relaxed/simple;
	bh=3IYXYqyYkqWz5geAisHWXM72d8Hb8xheK+nwF1RPsfk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WGNXeyV/ngsuUVTKgXnyZkBsKl+k+YAGP8bp7R28niOaR9M22A5hnwjHsMuCfCoth0tNDApda0pUoiDqMfxouJ72LfJOPmEHz7A1FOS1svuh1y/917sBkT5yQk93L1mirhgT117VxUIbvyJztE2Oi472HiRqHGVoeI31aUKCv0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fNfdyAGe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fNfdyAGe"
Received: by smtp.kernel.org (Postfix)
	id 43CDA1F00A3A; Wed, 24 Jun 2026 08:51:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 382B01F000E9;
	Wed, 24 Jun 2026 08:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782291119;
	bh=GD4te8hTV33dwJiv0pCR5L4ZUgHjJweW1nPi5kVtabk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=fNfdyAGejttHgI1ML/s3PK2p9nlkHdpvIokht9WsIcjjGKpdLridxGehWD40xrep8
	 UDZ4fH7YjR7wQiq8H6TbHM0FyodWJOOkofTMep7m2MyghuHvI6bfLevJk3EvznRcPT
	 ZeT55YS8IWPa+b9jBwAqt5trdw4lvK+tQMCVmDtlNE1ejNZGAhdu9l9nghZqHfZmA6
	 gPbuEVGVXcU8qg1sgNL2tHGRMBZvl/EKeoiD/I8Pfy5cvyiBNnD4OOjWKhnwrj38UC
	 8Lda9K9egcLylZh7dTgjpBexQJa88ZXO0bVSZU5oNcG+S6kEt4JBq9wtXHIhvs1M2/
	 cUXa9NfawQYMw==
From: Christian Brauner <brauner@kernel.org>
Date: Wed, 24 Jun 2026 10:51:54 +0200
Subject: [PATCH b4 v2 2/7] shazam: resolve conflicts via native git-am,
 never dropping patches
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260624-shazam-resolve-native-am-v2-2-97b3a1bc497a@kernel.org>
References: <20260624-shazam-resolve-native-am-v2-0-97b3a1bc497a@kernel.org>
In-Reply-To: <20260624-shazam-resolve-native-am-v2-0-97b3a1bc497a@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-cd519
X-Developer-Signature: v=1; a=openpgp-sha256; l=24319; i=brauner@kernel.org;
 h=from:subject:message-id; bh=3IYXYqyYkqWz5geAisHWXM72d8Hb8xheK+nwF1RPsfk=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWRZz1rNrD/1dYDRjDMnEq6H/FG8aLLO9H/OftXXGs+7E
 zg3qRxk6ihlYRDjYpAVU2RxaDcJl1vOU7HZKFMDZg4rE8gQBi5OAZhIhSIjQ0+oC+eWrrIA7nc+
 riGT7HifCc8+8LRPzcn9q9K3xYE3qxj+Fyyx9zMVEP76eqKR9KrzdXdVnPxSey4e01joeNv+Q5Q
 bGwA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

b4 shazam --resolve replayed the not-yet-applied patches with
`git apply --3way` + `git add -u` after merging the clean prefix. When
the 3-way fallback cannot run -- e.g. the patch's recorded blobs are not
present, the common case for emailed patches -- `git apply --3way` exits
non-zero having written nothing: no conflict markers, no unmerged index
entries. The replay loop assumed a non-zero exit always meant "markers
are in the tree", advanced past the patch, and told the user to resolve
conflicts that did not exist. The patch was silently and permanently
dropped from the merge.

Drop that machinery and mirror what the review TUI already does. On a
conflicted `git am`, keep the in-progress am parked in the worktree
(git_fetch_am_into_repo already preserves it), disable its sparse-checkout
so the files are visible, and let the user finish natively with
`git am --continue` (or `git am --skip`). `b4 shazam --continue` reuses the
shared worktree helpers (previous commit) to confirm the am is finished,
fetch the fully-applied series, and drop the worktree, then merges once --
the same merge a clean `b4 shazam` makes, via a shared _run_shazam_merge().
The whole series goes through git-am, which never silently skips a patch,
so nothing is dropped.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 docs/maintainer/am-shazam.rst |  39 ++--
 src/b4/mbox.py                | 421 ++++++++++++++----------------------------
 2 files changed, 157 insertions(+), 303 deletions(-)

diff --git a/docs/maintainer/am-shazam.rst b/docs/maintainer/am-shazam.rst
index 7445876..37dc80f 100644
--- a/docs/maintainer/am-shazam.rst
+++ b/docs/maintainer/am-shazam.rst
@@ -315,11 +315,13 @@ the merge commit.
   the failure. See :ref:`shazam_conflict_resolution` below.
 
 ``--continue``
-  Continue after resolving merge conflicts from ``--resolve``. Run this
-  after fixing the conflicts in your working tree.
+  Continue after a conflicted ``--resolve``. Run this once you have
+  finished the ``git am`` in the resolution worktree; b4 then fetches the
+  applied series and merges it.
 
 ``--abort``
-  Abort a conflicted shazam and clean up any saved state.
+  Abort a conflicted shazam: remove the resolution worktree and clean up
+  any saved state.
 
 Please also see the :ref:`shazam_settings` section for some
 configuration file options that affect some of ``b4 shazam`` behaviour.
@@ -356,26 +358,31 @@ add the ``--resolve`` flag::
 
     b4 shazam -H --resolve <msgid>
 
-With ``--resolve``, b4 does the following when a conflict occurs:
+With ``--resolve``, instead of giving up, b4 leaves the in-progress
+``git am`` parked in a throwaway worktree and prints its path. The whole
+series is applied there by git itself, so no patch is ever silently
+dropped. Resolve the conflict the usual way and let ``git am`` work
+through the rest of the series::
 
-1. Applies as many patches as it can cleanly.
-2. Fetches the successfully applied patches into ``FETCH_HEAD`` and
-   merges them into your current branch.
-3. Applies remaining patches one by one using ``git apply --3way``.
-4. If a patch has conflicts, b4 stops and tells you which files need
-   attention.
+    cd <worktree path printed by b4>
+    # edit the conflicted files
+    git am --continue        # or: git am --skip
 
-At this point, resolve the conflicts in your working tree (the usual
-``git diff``, edit, ``git add`` cycle), then run::
+Repeat until ``git am`` reports that it is done, then come back to your
+branch and run::
 
     b4 shazam --continue
 
-B4 picks up where it left off — it applies any remaining patches and
-finishes the merge. If all goes well, you end up with a merge commit
-just as if the series had applied cleanly.
+B4 fetches the fully-applied series out of the worktree, removes the
+worktree, and merges the series into your branch — exactly the merge a
+clean ``b4 shazam`` would have made. If that final merge itself
+conflicts, resolve it the normal way (git leaves the conflicted merge in
+your tree) and commit.
 
 If you decide you don't want to proceed, run::
 
     b4 shazam --abort
 
-This cleans up the saved state and leaves your branch as it was before.
+This removes the resolution worktree (discarding the in-progress ``git
+am``), backs out a half-finished merge, and clears the saved state,
+leaving your branch as it was before.
diff --git a/src/b4/mbox.py b/src/b4/mbox.py
index 65cff36..97ef51f 100644
--- a/src/b4/mbox.py
+++ b/src/b4/mbox.py
@@ -519,64 +519,27 @@ def make_am(msgs: List[EmailMessage], cmdargs: argparse.Namespace, msgid: str) -
                 sys.exit(1)
 
             state = {
+                'worktree': gwt,
                 'origin': linkurl,
                 'merge_template_values': tptvals,
                 'merge_template': merge_template,
                 'merge_flags': mergeflags,
                 'no_interactive': cmdargs.no_interactive,
+                'do_merge': cmdargs.merge,
             }
-            _start_merge_resolve(topdir, cex, common_dir, state)
+            _begin_shazam_resolve(cex, common_dir, state)
         except RuntimeError:
             sys.exit(1)
 
-        gitargs = ['rev-parse', '--git-dir']
-        ecode, out = b4.git_run_command(topdir, gitargs, logstderr=True)
-        if ecode > 0:
-            logger.critical('Unable to find git directory')
-            logger.critical(out.strip())
-            sys.exit(ecode)
-        mmf = os.path.join(out.rstrip(), 'b4-cover')
-
-        # Write out a sample merge message using the cover letter
-        if os.path.exists(mmf):
-            # Make sure any old cover letters don't confuse anyone
-            os.unlink(mmf)
-
-        body = Template(merge_template).safe_substitute(tptvals)
-        with open(mmf, 'w') as mmh:
-            mmh.write(body)
-
-        sp = shlex.shlex(mergeflags, posix=True)
-        sp.whitespace_split = True
-        if cmdargs.no_interactive:
-            edit = '--no-edit'
-        else:
-            edit = '--edit'
-        mergeargs = ['merge', '--no-ff', '-F', mmf, edit, 'FETCH_HEAD'] + list(sp)
-        mergecmd = ['git'] + mergeargs
-
         thanks_record_am(lser, cherrypick=cherrypick)
-        if cmdargs.merge:
-            if not cmdargs.no_interactive:
-                logger.info('Will exec: %s', ' '.join(mergecmd))
-                try:
-                    input('Press Enter to continue or Ctrl-C to abort')
-                except KeyboardInterrupt:
-                    logger.info('')
-                    sys.exit(130)
-            else:
-                logger.info('Invoking: %s', ' '.join(mergecmd))
-            if hasattr(sys, '_running_in_pytest'):
-                # Don't execvp, as this kills our tests
-                _out = b4.git_run_command(None, mergeargs)
-                sys.exit(_out[0])
-
-            # We exec git-merge and let it take over
-            os.execvp(mergecmd[0], mergecmd)
-
-        logger.info('You can now merge or checkout FETCH_HEAD')
-        logger.info('  e.g.: %s', ' '.join(mergecmd))
-        sys.exit(0)
+        _run_shazam_merge(
+            topdir,
+            merge_template=merge_template,
+            tptvals=tptvals,
+            merge_flags=mergeflags,
+            no_interactive=cmdargs.no_interactive,
+            do_merge=cmdargs.merge,
+        )
 
     if topdir:
         base_commit = get_base_commit(topdir, first_body, lser, cmdargs)
@@ -1014,228 +977,102 @@ def minimize_thread(msgs: List[EmailMessage]) -> List[EmailMessage]:
     return mmsgs
 
 
-def _start_merge_resolve(
-    topdir: str, cex: b4.AmConflictError, common_dir: str, state: Dict[str, Any]
-) -> None:
-    gwt = cex.worktree_path
-    logger.critical('---')
-    logger.critical(cex.output)
-    logger.critical('---')
-    logger.critical('Patch series did not apply cleanly, resolving...')
-
-    # Find rebase-apply in the worktree
-    ecode, gitdir = b4.git_run_command(
-        gwt, ['rev-parse', '--git-dir'], logstderr=True, rundir=gwt
-    )
-    if ecode > 0:
-        logger.critical('Unable to find git directory in worktree')
-        b4.git_run_command(topdir, ['worktree', 'remove', '--force', gwt])
-        sys.exit(1)
-    rebase_apply = os.path.join(gitdir.strip(), 'rebase-apply')
-    if not os.path.isdir(rebase_apply):
-        logger.critical('No git-am state found in worktree.')
-        b4.git_run_command(topdir, ['worktree', 'remove', '--force', gwt])
-        sys.exit(1)
-
-    # Extract remaining patches
-    with open(os.path.join(rebase_apply, 'next'), 'r') as fh:
-        next_num = int(fh.read().strip())
-    with open(os.path.join(rebase_apply, 'last'), 'r') as fh:
-        last_num = int(fh.read().strip())
-
-    patches_dir = os.path.join(common_dir, 'b4-shazam-patches')
-    if os.path.exists(patches_dir):
-        shutil.rmtree(patches_dir)
-    os.makedirs(patches_dir)
-
-    patch_count = 0
-    for i in range(next_num, last_num + 1):
-        src = os.path.join(rebase_apply, f'{i:04d}')
-        if os.path.exists(src):
-            dst = os.path.join(patches_dir, f'{patch_count:04d}')
-            shutil.copy2(src, dst)
-            patch_count += 1
-
-    with open(os.path.join(patches_dir, 'total'), 'w') as fh:
-        fh.write(str(patch_count))
-    with open(os.path.join(patches_dir, 'current'), 'w') as fh:
-        fh.write('0')
-
-    # Check for uncommitted changes
-    status_lines = b4.git_get_repo_status(topdir)
-    if status_lines:
-        logger.critical('You have uncommitted changes in your working tree.')
-        logger.critical('Please commit or stash them before resolving.')
-        shutil.rmtree(patches_dir)
-        b4.git_run_command(topdir, ['worktree', 'remove', '--force', gwt])
-        sys.exit(1)
-
-    # Fetch successfully applied patches into FETCH_HEAD
-    logger.info('Fetching successfully applied patches into FETCH_HEAD')
-    ecode, out = b4.git_run_command(topdir, ['fetch', gwt], logstderr=True)
-    if ecode > 0:
-        logger.critical('Unable to fetch from the worktree')
-        logger.critical(out.strip())
-        shutil.rmtree(patches_dir)
-        b4.git_run_command(topdir, ['worktree', 'remove', '--force', gwt])
-        sys.exit(1)
-
-    # Rewrite FETCH_HEAD origin
-    origin = state.get('origin')
-    if origin:
-        gitargs = ['rev-parse', '--git-path', 'FETCH_HEAD']
-        ecode, fhf = b4.git_run_command(topdir, gitargs, logstderr=True)
-        if ecode == 0:
-            fhf = fhf.rstrip()
-            with open(fhf, 'r') as fhh:
-                contents = fhh.read()
-            mmsg = 'patches from %s' % origin
-            new_contents = contents.replace(gwt, mmsg)
-            if new_contents != contents:
-                with open(fhf, 'w') as fhh:
-                    fhh.write(new_contents)
-
-    # Remove the worktree
-    b4.git_run_command(topdir, ['worktree', 'remove', '--force', gwt])
-
-    # Save state for --continue/--abort
-    state_file = os.path.join(common_dir, 'b4-shazam-state.json')
-    with open(state_file, 'w') as sfh:
-        json.dump(state, sfh, indent=2)
-
-    # Start merge of successfully applied patches
-    logger.info('Merging successfully applied patches into your branch...')
-    ecode, out = b4.git_run_command(
-        topdir,
-        ['merge', '--no-ff', '--no-commit', 'FETCH_HEAD'],
-        logstderr=True,
-        rundir=topdir,
-    )
-
-    if ecode > 0:
-        logger.warning('Merge had conflicts:')
-        logger.warning(out.strip())
-        logger.warning('Resolve conflicts, then run: b4 shazam --continue')
-        logger.warning('To abort: b4 shazam --abort')
-        sys.exit(1)
-
-    # Merge was clean, apply remaining patches
-    _apply_remaining_patches(topdir, patches_dir, state, state_file, common_dir)
-    sys.exit(0)
-
-
-def _apply_remaining_patches(
-    topdir: str,
-    patches_dir: str,
-    state: Dict[str, Any],
-    state_file: str,
-    common_dir: str,
-) -> None:
-    with open(os.path.join(patches_dir, 'total'), 'r') as fh:
-        total = int(fh.read().strip())
-    with open(os.path.join(patches_dir, 'current'), 'r') as fh:
-        current = int(fh.read().strip())
-
-    while current < total:
-        patch_file = os.path.join(patches_dir, f'{current:04d}')
-        if not os.path.exists(patch_file):
-            current += 1
-            continue
-
-        with open(patch_file, 'rb') as fh:
-            patch_data = fh.read()
-
-        logger.info('Applying remaining patch %d/%d...', current + 1, total)
-        ecode, out = b4.git_run_command(
-            topdir, ['apply', '--3way'], stdin=patch_data, logstderr=True, rundir=topdir
-        )
-        if ecode > 0:
-            logger.critical('---')
-            logger.critical(out.strip())
-            logger.critical('---')
-            logger.critical(
-                'Remaining patch %d/%d did not apply cleanly.', current + 1, total
-            )
-            logger.critical(
-                'Resolve conflicts in your working tree, then run: b4 shazam --continue'
-            )
-            logger.critical('To abort: b4 shazam --abort')
-            # Advance past this patch, its changes (with conflict markers) are in the tree
-            with open(os.path.join(patches_dir, 'current'), 'w') as fh:
-                fh.write(str(current + 1))
-            sys.exit(1)
-
-        # Patch applied cleanly, stage it
-        b4.git_run_command(topdir, ['add', '-u'], logstderr=True, rundir=topdir)
-        current += 1
-        with open(os.path.join(patches_dir, 'current'), 'w') as fh:
-            fh.write(str(current))
-
-    # All patches applied, finish the merge
-    _finish_shazam_merge(topdir, state, state_file, common_dir, patches_dir)
-
-
-def _finish_shazam_merge(
+def _run_shazam_merge(
     topdir: str,
-    state: Dict[str, Any],
-    state_file: str,
-    common_dir: str,
-    patches_dir: str,
+    *,
+    merge_template: str,
+    tptvals: Dict[str, Any],
+    merge_flags: str,
+    no_interactive: bool,
+    do_merge: bool,
 ) -> None:
-    b4.git_run_command(topdir, ['add', '-u'], logstderr=True, rundir=topdir)
+    """Merge the series sitting in FETCH_HEAD into the current branch.
 
+    Shared by the clean ``b4 shazam`` path and ``b4 shazam --continue``: render
+    the cover letter as the merge message and either run ``git merge`` (handing
+    the terminal to git so it can open the editor and resolve any conflicts
+    natively) or just point the user at FETCH_HEAD.
+    """
     gitargs = ['rev-parse', '--git-dir']
     ecode, out = b4.git_run_command(topdir, gitargs, logstderr=True)
     if ecode > 0:
         logger.critical('Unable to find git directory')
-        sys.exit(1)
+        logger.critical(out.strip())
+        sys.exit(ecode)
     mmf = os.path.join(out.rstrip(), 'b4-cover')
 
-    merge_template = state.get('merge_template', DEFAULT_MERGE_TEMPLATE)
-    tptvals = state.get('merge_template_values', {})
+    # Write out a sample merge message using the cover letter
+    if os.path.exists(mmf):
+        # Make sure any old cover letters don't confuse anyone
+        os.unlink(mmf)
 
     body = Template(merge_template).safe_substitute(tptvals)
     with open(mmf, 'w') as mmh:
         mmh.write(body)
 
-    # Clean up state before committing -- if the commit is interactive
-    # (execvp), we won't get a chance to clean up after.
-    if os.path.exists(patches_dir):
-        shutil.rmtree(patches_dir)
-    if os.path.exists(state_file):
-        os.unlink(state_file)
-
-    no_interactive = state.get('no_interactive', False)
-    mergeflags = str(state.get('merge_flags', ''))
-    commitargs = ['commit', '-F', mmf]
-    if mergeflags:
-        sp = shlex.shlex(mergeflags, posix=True)
-        sp.whitespace_split = True
-        commitargs.extend(list(sp))
+    sp = shlex.shlex(merge_flags, posix=True)
+    sp.whitespace_split = True
     if no_interactive:
-        commitargs.append('--no-edit')
-        ecode, out = b4.git_run_command(
-            topdir, commitargs, logstderr=True, rundir=topdir
-        )
-        if ecode > 0:
-            logger.critical('Failed to commit merge:')
-            logger.critical(out.strip())
-            sys.exit(1)
-        logger.info(out.strip())
+        edit = '--no-edit'
     else:
-        # Interactive, need the terminal, so exec git directly
-        commitargs.append('--edit')
-        commitcmd = ['git'] + commitargs
-        logger.info('Invoking: %s', ' '.join(commitcmd))
+        edit = '--edit'
+    mergeargs = ['merge', '--no-ff', '-F', mmf, edit, 'FETCH_HEAD'] + list(sp)
+    mergecmd = ['git'] + mergeargs
+
+    if do_merge:
+        if not no_interactive:
+            logger.info('Will exec: %s', ' '.join(mergecmd))
+            try:
+                input('Press Enter to continue or Ctrl-C to abort')
+            except KeyboardInterrupt:
+                logger.info('')
+                sys.exit(130)
+        else:
+            logger.info('Invoking: %s', ' '.join(mergecmd))
         if hasattr(sys, '_running_in_pytest'):
-            _out = b4.git_run_command(None, commitargs)
+            # Don't execvp, as this kills our tests
+            _out = b4.git_run_command(None, mergeargs)
             sys.exit(_out[0])
-        os.chdir(topdir)
-        os.execvp(commitcmd[0], commitcmd)
 
-    if os.path.exists(mmf):
-        os.unlink(mmf)
-    logger.info('Merge completed successfully.')
+        # We exec git-merge and let it take over
+        os.execvp(mergecmd[0], mergecmd)
+
+    logger.info('You can now merge or checkout FETCH_HEAD')
+    logger.info('  e.g.: %s', ' '.join(mergecmd))
+    sys.exit(0)
+
+
+def _begin_shazam_resolve(
+    cex: b4.AmConflictError, common_dir: str, state: Dict[str, Any]
+) -> None:
+    """Hand a conflicted ``git am`` back to the user to finish in the worktree.
+
+    Rather than replaying the not-yet-applied patches with ``git apply``, keep
+    the in-progress ``git am`` (already preserved by git_fetch_am_into_repo) so
+    the user drives it to completion natively and nothing is silently dropped.
+    The fully-applied series is merged once, by ``b4 shazam --continue``.
+    """
+    gwt = cex.worktree_path
+    logger.critical('---')
+    logger.critical(cex.output)
+    logger.critical('---')
+    logger.critical('Patch series did not apply cleanly.')
+
+    # Drop sparse-checkout so the user can see and edit every conflicted file.
+    b4.git_run_command(gwt, ['sparse-checkout', 'disable'], logstderr=True, rundir=gwt)
+
+    state_file = os.path.join(common_dir, 'b4-shazam-state.json')
+    with open(state_file, 'w') as sfh:
+        json.dump(state, sfh, indent=2)
+
+    logger.critical('Resolve the conflict in the worktree and finish the git-am:')
+    logger.critical('  cd %s', gwt)
+    logger.critical('  git am --continue   (or "git am --skip" to drop a patch)')
+    logger.critical('Once git-am is done, come back and run:')
+    logger.critical('  b4 shazam --continue')
+    logger.critical('To give up and clean everything up:')
+    logger.critical('  b4 shazam --abort')
+    sys.exit(1)
 
 
 def _load_shazam_state(
@@ -1252,61 +1089,71 @@ def _load_shazam_state(
 
     state_file = os.path.join(common_dir, 'b4-shazam-state.json')
     state = None
-    if require_state:
-        if not os.path.exists(state_file):
-            logger.critical('No shazam state found. Nothing to continue.')
-            sys.exit(1)
+    if os.path.exists(state_file):
         with open(state_file, 'r') as fh:
             state = json.load(fh)
-        patches_dir = os.path.join(common_dir, 'b4-shazam-patches')
-        if not os.path.isdir(patches_dir):
-            logger.critical('Patches directory not found. State may be corrupted.')
-            logger.critical('Run: b4 shazam --abort')
-            sys.exit(1)
+    elif require_state:
+        logger.critical('No shazam state found. Nothing to continue.')
+        sys.exit(1)
 
     return topdir, common_dir, state_file, state
 
 
 def shazam_continue(cmdargs: argparse.Namespace) -> None:
-    topdir, common_dir, state_file, state = _load_shazam_state(require_state=True)
+    topdir, _common_dir, state_file, state = _load_shazam_state(require_state=True)
     assert state is not None
-    patches_dir = os.path.join(common_dir, 'b4-shazam-patches')
 
-    # Stage any resolved files
-    b4.git_run_command(topdir, ['add', '-u'], logstderr=True, rundir=topdir)
+    gwt = state.get('worktree')
+    if not gwt or not os.path.isdir(gwt):
+        logger.critical('Resolution worktree is gone. Run: b4 shazam --abort')
+        sys.exit(1)
 
-    # Check for remaining unmerged files
-    _ecode, unmerged = b4.git_run_command(
-        topdir,
-        ['diff', '--name-only', '--diff-filter=U'],
-        logstderr=True,
-        rundir=topdir,
-    )
-    if unmerged.strip():
-        logger.critical('There are still unresolved conflicts:')
-        logger.critical(unmerged.strip())
-        logger.critical('Resolve them, then run: b4 shazam --continue')
+    # The git-am has to be finished before we can fetch and merge the series.
+    if b4._worktree_rebase_apply_dir(gwt):
+        logger.critical('git-am is still in progress in the worktree:')
+        logger.critical('  %s', gwt)
+        logger.critical(
+            'Finish it there with "git am --continue" (or "git am --skip"),'
+        )
+        logger.critical('then run: b4 shazam --continue')
+        sys.exit(1)
+
+    # git-am completed: fetch the fully-applied series into FETCH_HEAD, drop the
+    # worktree, and merge it exactly like a clean shazam would.
+    logger.info('Fetching resolved series into FETCH_HEAD')
+    if not b4._fetch_and_drop_am_worktree(topdir, gwt, origin=state.get('origin')):
         sys.exit(1)
 
-    # Apply remaining patches and finish merge
-    _apply_remaining_patches(topdir, patches_dir, state, state_file, common_dir)
+    # Clean up state before merging -- an interactive merge hands off via execvp
+    # and never returns here.
+    if os.path.exists(state_file):
+        os.unlink(state_file)
+
+    _run_shazam_merge(
+        topdir,
+        merge_template=state.get('merge_template', DEFAULT_MERGE_TEMPLATE),
+        tptvals=state.get('merge_template_values', {}),
+        merge_flags=str(state.get('merge_flags', '')),
+        no_interactive=state.get('no_interactive', False),
+        do_merge=state.get('do_merge', True),
+    )
 
 
 def shazam_abort(cmdargs: argparse.Namespace) -> None:
-    topdir, common_dir, state_file, _state = _load_shazam_state(require_state=False)
+    topdir, common_dir, state_file, state = _load_shazam_state(require_state=False)
     found = False
 
-    # Abort in-progress merge if any
-    b4.git_run_command(topdir, ['merge', '--abort'], logstderr=True, rundir=topdir)
-
-    # Clean up patches directory
-    patches_dir = os.path.join(common_dir, 'b4-shazam-patches')
-    if os.path.exists(patches_dir):
-        shutil.rmtree(patches_dir)
+    # Back out the FETCH_HEAD merge if --continue started one and it conflicted.
+    ecode, _out = b4.git_run_command(
+        topdir, ['merge', '--abort'], logstderr=True, rundir=topdir
+    )
+    if ecode == 0:
         found = True
 
-    # Clean up worktree if it exists
-    gwt = os.path.join(common_dir, 'b4-shazam-worktree')
+    # Remove the resolution worktree, discarding its in-progress git-am.
+    gwt = state.get('worktree') if state else None
+    if not gwt:
+        gwt = os.path.join(common_dir, 'b4-shazam-worktree')
     if os.path.exists(gwt):
         b4.git_run_command(topdir, ['worktree', 'remove', '--force', gwt])
         found = True

-- 
2.53.0

