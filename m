Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4AD364045
	for <tools@linux.kernel.org>; Fri,  6 Mar 2026 11:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772797960; cv=none; b=Xofw846xywMpdSMl86QTpa8RcVUujIhR1w4KHvlPN4GBAUrAn6DS82Hpk1fkNXoehdaLu5LVmrqe7OqnEKxHBWydherMTLRePSRsL8jh/+sE2EvhxjPfOz2BFbdUbDIdJQPc3Km5Wcxn3Qbl2Irk+ChKtTU/q5+H7uPwWLBeO2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772797960; c=relaxed/simple;
	bh=IPRC4J3ujUQHOcGhxmcdewwR4bruWLhGmifHGRQOqCE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=av+IzctD+b32tATqsnJsAA3KabUELSk7nSPuP/3dRxrZwG/wChwrj0k/ndrGj7xwI30ZrmR6KWwffcCMC3hVKtvVeYnfSppOOsJuKiYMLLFwjQwvxUyDp0y8wYezGDk0nriLOTZ0XNPvXrddkxlGJ35p5pdvK7LFtkF7IBE/zHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UmSCLbWB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UmSCLbWB"
Received: by smtp.kernel.org (Postfix)
	id 56E38C2BC86; Fri,  6 Mar 2026 11:52:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 112A1C2BC9E;
	Fri,  6 Mar 2026 11:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772797960;
	bh=IPRC4J3ujUQHOcGhxmcdewwR4bruWLhGmifHGRQOqCE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UmSCLbWBUd76UrWuRdpBrrUK1c/dE41yqpxld2RskKVtSDhh1zFhG82wPwXdBt/XT
	 8HiIQQp3c5XqDzSe4ob8PH9tE1i2RA18fhljVcklT/iMO1ExVOnoML7IeZX0njhyee
	 ncAc2xtGs0AXHRcbytlh2yyf44P5lhlmb9zHQOjTLTEIIWTf61FTtq9R+/TWud1hpe
	 P25NIKM5RJsNmRChnjGA9duVY/xErX23B90W9Br++5gMXJ6RyNh/Sll0n37c7Kh/RM
	 eI9cktv7ptNfsd8zeqTtYVvuY3bd2+JzcdvdMtp6zpZbZ38jxssS+PpMoZmdpdS3+T
	 ilbd83AE7dgjQ==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 06 Mar 2026 12:52:26 +0100
Subject: [PATCH b4 3/3] shazam: enable merge conflict resolution for b4
 shazam -H --resolve
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-master-v1-3-5a4b9cbe11d7@kernel.org>
References: <20260306-master-v1-0-5a4b9cbe11d7@kernel.org>
In-Reply-To: <20260306-master-v1-0-5a4b9cbe11d7@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Christian Brauner <christian@amutable.com>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Christian Brauner <brauner@kernel.org>, 
 "Claude Opus 4.6" <noreply@anthropic.com>
X-Mailer: b4 0.15-dev-ace2f
X-Developer-Signature: v=1; a=openpgp-sha256; l=20994; i=brauner@kernel.org;
 h=from:subject:message-id; bh=IPRC4J3ujUQHOcGhxmcdewwR4bruWLhGmifHGRQOqCE=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWSuOsBweIKPyI0/dvV+gUasAh4zZyfJvdt+5ea8qUcXR
 zFeye/K6ChlYRDjYpAVU2RxaDcJl1vOU7HZKFMDZg4rE8gQBi5OAZhI8D2G//EXm203vL356r+K
 4voD7zlieRaeTVu6ekssu+bk6yprWyMYGa4cNL0Sp+XFw7vxNv8hmyPiqR47vbOFq8pn3l8+rWd
 THg8A
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

When b4 shazam -H applies patches via git-am in a temporary sparse
worktree, conflicts previously caused the worktree to be destroyed
before the user could act.

Add a conflict resolution workflow with three new flags:

  --resolve   When git-am fails, the successfully applied patches are
              fetched into FETCH_HEAD, the sparse worktree is removed,
              and remaining patches are extracted. A
              git merge --no-ff --no-commit FETCH_HEAD is started in
              the user's working tree, then remaining patches are
              applied one at a time with git apply --3way. On conflict
              the user resolves with their normal tools in their full
              working tree.

  --continue  After resolving conflicts, stages the resolution and
              applies any further remaining patches. When all patches
              are applied, commits the merge with the cover letter
              message (opening an editor unless --no-interactive).

  --abort     Cleans up all state: removes the patches directory,
              aborts any in-progress merge, and removes a stale
              worktree if one exists.

Without --resolve, a conflict cleans up the worktree and exits with
an error, preserving the original behavior.

Conflict resolution happens in the user's branch rather than the
sparse worktree, which avoids problems with sparse-checkout blocking
git-add on files outside the checkout definition and gives the user
full tree context for resolving conflicts.

Shazam state (origin URL, merge template, flags) is saved to
<git-common-dir>/b4-shazam-state.json so --continue and --abort can
operate across separate invocations.

Patches that applied cleanly are preserved as individual commits
reachable from the merge's second parent via FETCH_HEAD. Patches that
required manual resolution have their changes folded into the merge
commit.

Co-developed-by: Claude Opus 4.6 <noreply@anthropic.com>
Signed-off-by: Christian Brauner <brauner@kernel.org>
---
 src/b4/command.py |   6 +
 src/b4/mbox.py    | 378 ++++++++++++++++++++++++++++++++++++++++++++++++------
 2 files changed, 346 insertions(+), 38 deletions(-)

diff --git a/src/b4/command.py b/src/b4/command.py
index a49a8bc..859dd5f 100644
--- a/src/b4/command.py
+++ b/src/b4/command.py
@@ -231,6 +231,12 @@ def setup_parser() -> argparse.ArgumentParser:
                              '(default: 3 weeks)'))
     sp_sh.add_argument('--merge-base', dest='mergebase', type=str, default=None,
                        help='(use with -H or -M) Force this base when merging')
+    sp_sh.add_argument('--resolve', dest='shazam_resolve', action='store_true', default=False,
+                       help='(use with -H or -M) Enable conflict resolution if patches fail to apply')
+    sp_sh.add_argument('--continue', dest='shazam_continue', action='store_true', default=False,
+                       help='Continue after resolving merge conflicts from --resolve')
+    sp_sh.add_argument('--abort', dest='shazam_abort', action='store_true', default=False,
+                       help='Abort a conflicted shazam and clean up')
     sp_sh.set_defaults(func=cmd_shazam)
 
     # b4 review
diff --git a/src/b4/mbox.py b/src/b4/mbox.py
index 0a86f6f..5cec332 100644
--- a/src/b4/mbox.py
+++ b/src/b4/mbox.py
@@ -384,38 +384,6 @@ def make_am(msgs: List[EmailMessage], cmdargs: argparse.Namespace, msgid: str) -
         base_commit = get_base_commit(topdir, first_body, lser, cmdargs)
         linkurl = linkmask % top_msgid
 
-        am_flags = ['-3']
-        amflags_cfg = str(config.get('shazam-am-flags', ''))
-        if amflags_cfg:
-            sp = shlex.shlex(amflags_cfg, posix=True)
-            sp.whitespace_split = True
-            am_flags.extend(list(sp))
-
-        try:
-            if cmdargs.mergebase:
-                logger.info(' Base: %s', base_commit)
-            else:
-                logger.info(' Base: %s (use --merge-base to override)', base_commit)
-            b4.git_fetch_am_into_repo(topdir, ambytes=ambytes, at_base=base_commit,
-                                       origin=linkurl, am_flags=am_flags)
-        except b4.AmConflictError as cex:
-            b4.git_run_command(topdir, ['worktree', 'remove', '--force', cex.worktree_path])
-            logger.critical('Unable to cleanly apply series, see failure log below')
-            logger.critical('---')
-            logger.critical(cex.output)
-            logger.critical('---')
-            logger.critical('Not fetching into FETCH_HEAD')
-            sys.exit(1)
-        except RuntimeError:
-            sys.exit(1)
-
-        gitargs = ['rev-parse', '--git-dir']
-        ecode, out = b4.git_run_command(topdir, gitargs, logstderr=True)
-        if ecode > 0:
-            logger.critical('Unable to find git directory')
-            logger.critical(out.strip())
-            sys.exit(ecode)
-        mmf = os.path.join(out.rstrip(), 'b4-cover')
         merge_template = DEFAULT_MERGE_TEMPLATE
         if config.get('shazam-merge-template'):
             # Try to load this template instead
@@ -426,11 +394,6 @@ def make_am(msgs: List[EmailMessage], cmdargs: argparse.Namespace, msgid: str) -
                                 config['shazam-merge-template'])
                 sys.exit(2)
 
-        # Write out a sample merge message using the cover letter
-        if os.path.exists(mmf):
-            # Make sure any old cover letters don't confuse anyone
-            os.unlink(mmf)
-
         if lser.has_cover and lser.patches[0] is not None:
             clmsg: b4.LoreMessage = lser.patches[0]
             parts = b4.LoreMessage.get_body_parts(clmsg.body)
@@ -457,11 +420,68 @@ def make_am(msgs: List[EmailMessage], cmdargs: argparse.Namespace, msgid: str) -
         else:
             tptvals['patch_or_series'] = 'patch'
 
+        mergeflags = str(config.get('shazam-merge-flags', '--signoff'))
+
+        am_flags = ['-3']
+        amflags_cfg = str(config.get('shazam-am-flags', ''))
+        if amflags_cfg:
+            sp = shlex.shlex(amflags_cfg, posix=True)
+            sp.whitespace_split = True
+            am_flags.extend(list(sp))
+
+        try:
+            if cmdargs.mergebase:
+                logger.info(' Base: %s', base_commit)
+            else:
+                logger.info(' Base: %s (use --merge-base to override)', base_commit)
+            b4.git_fetch_am_into_repo(topdir, ambytes=ambytes, at_base=base_commit,
+                                       origin=linkurl, am_flags=am_flags)
+        except b4.AmConflictError as cex:
+            gwt = cex.worktree_path
+            if not getattr(cmdargs, 'shazam_resolve', False):
+                b4.git_run_command(topdir, ['worktree', 'remove', '--force', gwt])
+                logger.critical('Unable to cleanly apply series, see failure log below')
+                logger.critical('---')
+                logger.critical(cex.output)
+                logger.critical('---')
+                logger.critical('Not fetching into FETCH_HEAD')
+                logger.critical('Use --resolve to enable conflict resolution')
+                sys.exit(1)
+
+            common_dir = b4.git_get_common_dir(topdir)
+            if not common_dir:
+                logger.critical('Unable to determine git common dir')
+                b4.git_run_command(topdir, ['worktree', 'remove', '--force', gwt])
+                sys.exit(1)
+
+            state = {
+                'origin': linkurl,
+                'merge_template_values': tptvals,
+                'merge_template': merge_template,
+                'merge_flags': mergeflags,
+                'no_interactive': cmdargs.no_interactive,
+            }
+            _start_merge_resolve(topdir, cex, common_dir, state)
+        except RuntimeError:
+            sys.exit(1)
+
+        gitargs = ['rev-parse', '--git-dir']
+        ecode, out = b4.git_run_command(topdir, gitargs, logstderr=True)
+        if ecode > 0:
+            logger.critical('Unable to find git directory')
+            logger.critical(out.strip())
+            sys.exit(ecode)
+        mmf = os.path.join(out.rstrip(), 'b4-cover')
+
+        # Write out a sample merge message using the cover letter
+        if os.path.exists(mmf):
+            # Make sure any old cover letters don't confuse anyone
+            os.unlink(mmf)
+
         body = Template(merge_template).safe_substitute(tptvals)
         with open(mmf, 'w') as mmh:
             mmh.write(body)
 
-        mergeflags = str(config.get('shazam-merge-flags', '--signoff'))
         sp = shlex.shlex(mergeflags, posix=True)
         sp.whitespace_split = True
         if cmdargs.no_interactive:
@@ -861,9 +881,291 @@ def minimize_thread(msgs: List[EmailMessage]) -> List[EmailMessage]:
     return mmsgs
 
 
+def _start_merge_resolve(topdir: str, cex: b4.AmConflictError,
+                          common_dir: str, state: Dict) -> None:
+    gwt = cex.worktree_path
+    logger.critical('---')
+    logger.critical(cex.output)
+    logger.critical('---')
+    logger.critical('Patch series did not apply cleanly, resolving...')
+
+    # Find rebase-apply in the worktree
+    ecode, gitdir = b4.git_run_command(gwt, ['rev-parse', '--git-dir'],
+                                        logstderr=True, rundir=gwt)
+    if ecode > 0:
+        logger.critical('Unable to find git directory in worktree')
+        b4.git_run_command(topdir, ['worktree', 'remove', '--force', gwt])
+        sys.exit(1)
+    rebase_apply = os.path.join(gitdir.strip(), 'rebase-apply')
+    if not os.path.isdir(rebase_apply):
+        logger.critical('No git-am state found in worktree.')
+        b4.git_run_command(topdir, ['worktree', 'remove', '--force', gwt])
+        sys.exit(1)
+
+    # Extract remaining patches
+    with open(os.path.join(rebase_apply, 'next'), 'r') as fh:
+        next_num = int(fh.read().strip())
+    with open(os.path.join(rebase_apply, 'last'), 'r') as fh:
+        last_num = int(fh.read().strip())
+
+    patches_dir = os.path.join(common_dir, 'b4-shazam-patches')
+    if os.path.exists(patches_dir):
+        shutil.rmtree(patches_dir)
+    os.makedirs(patches_dir)
+
+    patch_count = 0
+    for i in range(next_num, last_num + 1):
+        src = os.path.join(rebase_apply, f'{i:04d}')
+        if os.path.exists(src):
+            dst = os.path.join(patches_dir, f'{patch_count:04d}')
+            shutil.copy2(src, dst)
+            patch_count += 1
+
+    with open(os.path.join(patches_dir, 'total'), 'w') as fh:
+        fh.write(str(patch_count))
+    with open(os.path.join(patches_dir, 'current'), 'w') as fh:
+        fh.write('0')
+
+    # Check for uncommitted changes
+    status_lines = b4.git_get_repo_status(topdir)
+    if status_lines:
+        logger.critical('You have uncommitted changes in your working tree.')
+        logger.critical('Please commit or stash them before resolving.')
+        shutil.rmtree(patches_dir)
+        b4.git_run_command(topdir, ['worktree', 'remove', '--force', gwt])
+        sys.exit(1)
+
+    # Fetch successfully applied patches into FETCH_HEAD
+    logger.info('Fetching successfully applied patches into FETCH_HEAD')
+    ecode, out = b4.git_run_command(topdir, ['fetch', gwt], logstderr=True)
+    if ecode > 0:
+        logger.critical('Unable to fetch from the worktree')
+        logger.critical(out.strip())
+        shutil.rmtree(patches_dir)
+        b4.git_run_command(topdir, ['worktree', 'remove', '--force', gwt])
+        sys.exit(1)
+
+    # Rewrite FETCH_HEAD origin
+    origin = state.get('origin')
+    if origin:
+        gitargs = ['rev-parse', '--git-path', 'FETCH_HEAD']
+        ecode, fhf = b4.git_run_command(topdir, gitargs, logstderr=True)
+        if ecode == 0:
+            fhf = fhf.rstrip()
+            with open(fhf, 'r') as fhh:
+                contents = fhh.read()
+            mmsg = 'patches from %s' % origin
+            new_contents = contents.replace(gwt, mmsg)
+            if new_contents != contents:
+                with open(fhf, 'w') as fhh:
+                    fhh.write(new_contents)
+
+    # Remove the worktree
+    b4.git_run_command(topdir, ['worktree', 'remove', '--force', gwt])
+
+    # Save state for --continue/--abort
+    state_file = os.path.join(common_dir, 'b4-shazam-state.json')
+    with open(state_file, 'w') as sfh:
+        json.dump(state, sfh, indent=2)
+
+    # Start merge of successfully applied patches
+    logger.info('Merging successfully applied patches into your branch...')
+    ecode, out = b4.git_run_command(topdir, ['merge', '--no-ff', '--no-commit', 'FETCH_HEAD'],
+                                     logstderr=True, rundir=topdir)
+
+    if ecode > 0:
+        logger.warning('Merge had conflicts:')
+        logger.warning(out.strip())
+        logger.warning('Resolve conflicts, then run: b4 shazam --continue')
+        logger.warning('To abort: b4 shazam --abort')
+        sys.exit(1)
+
+    # Merge was clean, apply remaining patches
+    _apply_remaining_patches(topdir, patches_dir, state, state_file, common_dir)
+    sys.exit(0)
+
+
+def _apply_remaining_patches(topdir: str, patches_dir: str, state: Dict,
+                              state_file: str, common_dir: str) -> None:
+    with open(os.path.join(patches_dir, 'total'), 'r') as fh:
+        total = int(fh.read().strip())
+    with open(os.path.join(patches_dir, 'current'), 'r') as fh:
+        current = int(fh.read().strip())
+
+    while current < total:
+        patch_file = os.path.join(patches_dir, f'{current:04d}')
+        if not os.path.exists(patch_file):
+            current += 1
+            continue
+
+        with open(patch_file, 'rb') as fh:
+            patch_data = fh.read()
+
+        logger.info('Applying remaining patch %d/%d...', current + 1, total)
+        ecode, out = b4.git_run_command(topdir, ['apply', '--3way'],
+                                         stdin=patch_data, logstderr=True, rundir=topdir)
+        if ecode > 0:
+            logger.critical('---')
+            logger.critical(out.strip())
+            logger.critical('---')
+            logger.critical('Remaining patch %d/%d did not apply cleanly.', current + 1, total)
+            logger.critical('Resolve conflicts in your working tree, then run: b4 shazam --continue')
+            logger.critical('To abort: b4 shazam --abort')
+            # Advance past this patch, its changes (with conflict markers) are in the tree
+            with open(os.path.join(patches_dir, 'current'), 'w') as fh:
+                fh.write(str(current + 1))
+            sys.exit(1)
+
+        # Patch applied cleanly, stage it
+        b4.git_run_command(topdir, ['add', '-u'], logstderr=True, rundir=topdir)
+        current += 1
+        with open(os.path.join(patches_dir, 'current'), 'w') as fh:
+            fh.write(str(current))
+
+    # All patches applied, finish the merge
+    _finish_shazam_merge(topdir, state, state_file, common_dir, patches_dir)
+
+
+def _finish_shazam_merge(topdir: str, state: Dict, state_file: str,
+                          common_dir: str, patches_dir: str) -> None:
+    b4.git_run_command(topdir, ['add', '-u'], logstderr=True, rundir=topdir)
+
+    gitargs = ['rev-parse', '--git-dir']
+    ecode, out = b4.git_run_command(topdir, gitargs, logstderr=True)
+    if ecode > 0:
+        logger.critical('Unable to find git directory')
+        sys.exit(1)
+    mmf = os.path.join(out.rstrip(), 'b4-cover')
+
+    merge_template = state.get('merge_template', DEFAULT_MERGE_TEMPLATE)
+    tptvals = state.get('merge_template_values', {})
+
+    body = Template(merge_template).safe_substitute(tptvals)
+    with open(mmf, 'w') as mmh:
+        mmh.write(body)
+
+    # Clean up state before committing -- if the commit is interactive
+    # (execvp), we won't get a chance to clean up after.
+    if os.path.exists(patches_dir):
+        shutil.rmtree(patches_dir)
+    if os.path.exists(state_file):
+        os.unlink(state_file)
+
+    no_interactive = state.get('no_interactive', False)
+    mergeflags = str(state.get('merge_flags', ''))
+    commitargs = ['commit', '-F', mmf]
+    if mergeflags:
+        sp = shlex.shlex(mergeflags, posix=True)
+        sp.whitespace_split = True
+        commitargs.extend(list(sp))
+    if no_interactive:
+        commitargs.append('--no-edit')
+        ecode, out = b4.git_run_command(topdir, commitargs, logstderr=True, rundir=topdir)
+        if ecode > 0:
+            logger.critical('Failed to commit merge:')
+            logger.critical(out.strip())
+            sys.exit(1)
+        logger.info(out.strip())
+    else:
+        # Interactive, need the terminal, so exec git directly
+        commitargs.append('--edit')
+        commitcmd = ['git'] + commitargs
+        logger.info('Invoking: %s', ' '.join(commitcmd))
+        if hasattr(sys, '_running_in_pytest'):
+            _out = b4.git_run_command(None, commitargs)
+            sys.exit(_out[0])
+        os.chdir(topdir)
+        os.execvp(commitcmd[0], commitcmd)
+
+    if os.path.exists(mmf):
+        os.unlink(mmf)
+    logger.info('Merge completed successfully.')
+
+
+def _load_shazam_state(require_state: bool = True) -> Tuple[str, str, str, Optional[Dict]]:
+    topdir = b4.git_get_toplevel()
+    if not topdir:
+        logger.critical('Could not figure out where your git dir is.')
+        sys.exit(1)
+    common_dir = b4.git_get_common_dir(topdir)
+    if not common_dir:
+        logger.critical('Unable to determine git common dir.')
+        sys.exit(1)
+
+    state_file = os.path.join(common_dir, 'b4-shazam-state.json')
+    state = None
+    if require_state:
+        if not os.path.exists(state_file):
+            logger.critical('No shazam state found. Nothing to continue.')
+            sys.exit(1)
+        with open(state_file, 'r') as fh:
+            state = json.load(fh)
+        patches_dir = os.path.join(common_dir, 'b4-shazam-patches')
+        if not os.path.isdir(patches_dir):
+            logger.critical('Patches directory not found. State may be corrupted.')
+            logger.critical('Run: b4 shazam --abort')
+            sys.exit(1)
+
+    return topdir, common_dir, state_file, state
+
+
+def shazam_continue(cmdargs: argparse.Namespace) -> None:
+    topdir, common_dir, state_file, state = _load_shazam_state(require_state=True)
+    assert state is not None
+    patches_dir = os.path.join(common_dir, 'b4-shazam-patches')
+
+    # Stage any resolved files
+    b4.git_run_command(topdir, ['add', '-u'], logstderr=True, rundir=topdir)
+
+    # Check for remaining unmerged files
+    ecode, unmerged = b4.git_run_command(topdir, ['diff', '--name-only', '--diff-filter=U'],
+                                          logstderr=True, rundir=topdir)
+    if unmerged.strip():
+        logger.critical('There are still unresolved conflicts:')
+        logger.critical(unmerged.strip())
+        logger.critical('Resolve them, then run: b4 shazam --continue')
+        sys.exit(1)
+
+    # Apply remaining patches and finish merge
+    _apply_remaining_patches(topdir, patches_dir, state, state_file, common_dir)
+
+
+def shazam_abort(cmdargs: argparse.Namespace) -> None:
+    topdir, common_dir, state_file, _state = _load_shazam_state(require_state=False)
+    found = False
+
+    # Abort in-progress merge if any
+    b4.git_run_command(topdir, ['merge', '--abort'], logstderr=True, rundir=topdir)
+
+    # Clean up patches directory
+    patches_dir = os.path.join(common_dir, 'b4-shazam-patches')
+    if os.path.exists(patches_dir):
+        shutil.rmtree(patches_dir)
+        found = True
+
+    # Clean up worktree if it exists
+    gwt = os.path.join(common_dir, 'b4-shazam-worktree')
+    if os.path.exists(gwt):
+        b4.git_run_command(topdir, ['worktree', 'remove', '--force', gwt])
+        found = True
+
+    if os.path.exists(state_file):
+        os.unlink(state_file)
+        found = True
+
+    if found:
+        logger.info('Shazam aborted and cleaned up.')
+    else:
+        logger.info('No shazam in progress.')
+
+
 def main(cmdargs: argparse.Namespace) -> None:
     # We force some settings
     if cmdargs.subcmd == 'shazam':
+        if getattr(cmdargs, 'shazam_continue', False):
+            return shazam_continue(cmdargs)
+        if getattr(cmdargs, 'shazam_abort', False):
+            return shazam_abort(cmdargs)
         cmdargs.checknewer = True
         cmdargs.threeway = False
         cmdargs.nopartialreroll = False

-- 
2.47.3

