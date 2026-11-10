Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794314464;
	b=iDkpmsBHdcSrxtKlw/4v86s1H2Kv+GofY6mQe5SyRgVU/O797gyoF4ASeAtUPjoIdVcV
	 EsG96LC99I7lxZs11ytuC5XjJgn7JQ7WUGKq+0gN9jmEnEiP/+gDq4jGsx6L27poFZikW
	 jkSJjbrgZi0wIkCrmcL0qVmncDBL/i0hmELDG4aHP/oKBUlvQ0UfHyuiMu3vj6ZylxeVz
	 586dX/Hivg1mAFqlbQMPCMao1XXsDafRQ4gBnem04pbbdI0ROQHoLvCR2vS48YfIp8q0n
	 q2kXYz4JOwqlWlUtOtKZDbErbQIHMr/k63Mhrtk9IveLzorQeD6+4Y73YExPNb5inBw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794314464;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Bm-Milter-Handled:
	 X-Bm-Transport-Timestamp;
	bh=EzSdcmpBK6YTWedgZ6xJWRy4YomovX5SvUjKwDMs/ss=;
	b=qSMlvQytDyQBHx4woK4Cjkl/o2M6kL2v8K3o/SB/Q2lg+f/W1I8qKXDbEOj8pHPI29xZ
	 KLfG1oh+XHnWyPpeCb9SBaae+uwYnB6cz6vrIHKdaNjF93gK5N1dwBzXzGg6JyZsljpRY
	 Ub4BuXshAcM0Df1g4sWXhb3nkm8amQbz3fIlePnsF0DrOm/xK9YCreCFGJEVyIqlEiVkw
	 NBRb9DDA0rJcVuxOROyYkaCGCkvns7WVnduw3mu6EWoCDbZ+xdbeU78y6qafCBxy1NOc6
	 luv5BIJXP16fOxM5lTueMw6Y/cgVcJiPZsgCqf0jOTT/nDfIyYdh1iH+aHBbsqYUw5w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0E1606A33D
	for <tools@linux.kernel.org>; Tue, 10 Nov 2026 12:41:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 869C81F00926; Tue, 10 Nov 2026 12:41:02 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=94.136.29.106
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794314462;
	b=nkh0foJ3LAUxVlHW9PGGVjBB5i8jfTnbAoFP/qlJM0XS1yTXfDiVwKbzb5w5sTZ0QZrC
	 WZDkKyOejnNviHGWqm1EnB38OIvf3y0OoRk4Y5N1aPX6SCH0coyPBD/JhfRMDSeOu/Jq0
	 105UPgF9gVnqMTodgh4gJekhT2o6TjkPqICiJtaoslIJftzrxjbWU5LtT2dNM8gWlEime
	 P40dbkx8/ZLD0drXP9NMR8+pgLRFEIthTu9Yaj/YMn2BAZ6uKhUMsI+k6kPQ6W+cwGsY/
	 j7oFttGgSex2qBYVvb0MAWfyPjx7hiZEYnmj66wSEqAikLDX1uwq9j9pSSN8mfx5mFw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794314462;
	h=DMARC-Filter:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Bm-Milter-Handled:X-Bm-Transport-Timestamp;
	bh=EzSdcmpBK6YTWedgZ6xJWRy4YomovX5SvUjKwDMs/ss=;
	b=TwbYkBjyEPRpRwyumBZ0vtXcclSjPctwT0ds4U+J7kWq80hSvLa0GaZ9wiAUv+qhVVed
	 K38LoVoRXjGfKQmVbVGd7y/VtymyoyFzbrj7/q/U+UgjpNzLpEivcfq2lKkuBXnUtHm9a
	 IJveIqphVyL5yysBHghlFRmu3L1UsWSAoN90RQ7idu9YuXc6hBBPi+y5j3Ge0LzIwcxAv
	 RbjmNv1EdEVwq3itd2zi5JjeqKJPkqEINB7CA2MnA5P82CjtgbwnsRalQtTojSb3n2ph3
	 xUSXvEBqAyByAG4v+/lqU3FtDZJaMaoQcAwFXGYbYYAl01Ssi5gaQYZNuBKatVT73qQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dmarc=none header.from=proxmox.com;
	spf=pass smtp.mailfrom=proxmox.com;
	arc=none smtp.remote-ip=94.136.29.106
Received: from proxmox-new.maurer-it.com (proxmox-new.maurer-it.com [94.136.29.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E2FD81F008BC
	for <tools@kernel.org>; Tue, 10 Nov 2026 12:40:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org E2FD81F008BC
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=proxmox.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=proxmox.com
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
	by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 4FF76481B0;
	Tue, 10 Nov 2026 13:40:58 +0100 (CET)
From: Gabriel Goller <g.goller@proxmox.com>
Date: Tue, 10 Nov 2026 13:40:51 +0100
Subject: [PATCH RFC b4 5/6] prep: enroll a detached HEAD without creating a
 branch
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-editor_refuse_the-v1-5-4b6e52f326a9@proxmox.com>
References: <20261110-editor_refuse_the-v1-0-4b6e52f326a9@proxmox.com>
In-Reply-To: <20261110-editor_refuse_the-v1-0-4b6e52f326a9@proxmox.com>
To: tools@kernel.org
Cc: Gabriel Goller <g.goller@proxmox.com>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Gabriel Goller <hey@gabriels.computer>
X-Mailer: b4 0.17-dev
X-Bm-Milter-Handled: 55990f41-d878-4baa-be0a-ee34c49e34d2
X-Bm-Transport-Timestamp: 1794314454093

From: Gabriel Goller <hey@gabriels.computer>

b4 prep -e refused to run on a detached HEAD. Enroll the history of
HEAD as a series instead, keeping HEAD detached and leaving every
branch alone.

There is no upstream to fall back on, so the base must be given. A
branch is forked from as on a branch. A tag or commit has to be an
ancestor of HEAD, because no branch holds the series to say where it
forked. The series is named after its first patch, like -F names it
after the cover letter subject, or detached-head when there is no
usable subject.

The base, the series name and the change-id are all worked out, and
merges or an existing cover letter in the range are refused, before
anything changes. HEAD is then saved as refs/original/b4/<change-id>,
the ref that later rewrites of the series back up to, before it is
reset to the base and the commits are replayed on top of the cover.
If replaying fails, the cherry-pick is left for the user to resolve,
and b4 says how to go back to the saved commits instead.

Signed-off-by: Gabriel Goller <hey@gabriels.computer>
---
 src/b4/command.py             |   3 +-
 src/b4/ez.py                  | 184 +++++++++++++++++++++++++++---
 src/tests/test_ez_detached.py | 254 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 425 insertions(+), 16 deletions(-)

diff --git a/src/b4/command.py b/src/b4/command.py
index 18d9a9ea43b0..f0f33fc4e5dd 100644
--- a/src/b4/command.py
+++ b/src/b4/command.py
@@ -1236,7 +1236,8 @@ def setup_parser() -> argparse.ArgumentParser:
         nargs='?',
         const='@{upstream}',
         help='Enroll current branch, using its configured upstream branch as fork base, '
-        'or the passed tag, branch, or commit',
+        'or the passed tag, branch, or commit. On a detached HEAD, enroll HEAD '
+        'without creating a branch; this requires an explicit base',
     )
     sp_prep.set_defaults(func=cmd_prep)
 
diff --git a/src/b4/ez.py b/src/b4/ez.py
index 481a221cb4a2..7e421c23da85 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -348,6 +348,88 @@ def get_base_forkpoint(basebranch: str, mybranch: Optional[str] = None) -> str:
     return forkpoint
 
 
+def make_change_id(slug: str) -> str:
+    # We don't need all the entropy of uuid, just some of it
+    return (
+        '%s-%s-%s'
+        % (
+            datetime.date.today().strftime('%Y%m%d'),  # noqa: DTZ011
+            slug,
+            uuid.uuid4().hex[:12],
+        )
+    )
+
+
+def _get_detached_backup_ref(change_id: str) -> str:
+    return f'refs/original/b4/{change_id}'
+
+
+def _get_detached_enroll_base(enroll_base: str) -> str:
+    """Resolve the enrollment base for a detached HEAD to a commit.
+
+    A branch is forked from as on a branch. Anything else has to be an
+    ancestor of HEAD, because no branch holds the series to say where it
+    forked. Exits without changing anything when the base is not usable.
+    """
+    ecode, out = b4.git_run_command(
+        None, ['rev-parse', '--verify', '-q', f'{enroll_base}^{{commit}}']
+    )
+    if ecode > 0:
+        if '@{' in enroll_base:
+            logger.critical(
+                'CRITICAL: HEAD is detached, so it has no upstream to enroll against.'
+            )
+            logger.critical('          Pass the base explicitly, for example:')
+            logger.critical('            b4 prep -e origin/master')
+        else:
+            logger.critical('CRITICAL: Could not find commit: %s', enroll_base)
+        sys.exit(1)
+    basecommit = out.strip()
+    ecode, out = b4.git_run_command(
+        None, ['rev-parse', '--symbolic-full-name', enroll_base]
+    )
+    if ecode == 0 and out.startswith(('refs/heads/', 'refs/remotes/')):
+        try:
+            return get_base_forkpoint(enroll_base, 'HEAD')
+        except RuntimeError as ex:
+            logger.critical(
+                'CRITICAL: could not use %s as enrollment base:', enroll_base
+            )
+            logger.critical('          %s', ex)
+            sys.exit(1)
+    if not b4.git_commit_is_ancestor(None, basecommit, 'HEAD'):
+        logger.critical('CRITICAL: %s is not an ancestor of HEAD.', enroll_base)
+        sys.exit(1)
+    return basecommit
+
+
+def _get_detached_series_name(forkpoint: str) -> str:
+    """Name a detached series after its first patch, as -F names it after
+    the cover letter subject."""
+    subjects = b4.git_get_command_lines(
+        None, ['log', '--reverse', '--format=%s', f'{forkpoint}..HEAD']
+    )
+    slug = ''
+    if subjects:
+        slug = b4.LoreSubject(subjects[0]).get_slug(with_counter=False)
+        # If it's longer than 30 chars, use first 3 words
+        if len(slug) > 30:
+            slug = '_'.join(slug.split('_')[:3])
+    return slug or 'detached-head'
+
+
+def _explain_enroll_recovery(recovery_ref: str, cherry_picking: bool) -> None:
+    logger.critical('          Your commits from before enrolling are kept in')
+    logger.critical('          %s.', recovery_ref)
+    if cherry_picking:
+        logger.critical('          Resolve the problem and run "git cherry-pick')
+        logger.critical('          --continue" to finish enrolling, or go back with:')
+        logger.critical('            git cherry-pick --abort')
+    else:
+        logger.critical('          To go back to where you started, run:')
+    logger.critical('            git checkout --detach %s', recovery_ref)
+
+
 def start_new_series(cmdargs: argparse.Namespace) -> None:
     check_no_operation_in_progress()
     usercfg = b4.get_user_config()
@@ -450,6 +532,9 @@ def start_new_series(cmdargs: argparse.Namespace) -> None:
     strategy = get_cover_strategy()
     cherry_range = None
     depends_on = None
+    branchname: Optional[str] = None
+    changeid: Optional[str] = None
+    recovery_ref: Optional[str] = None
     if cmdargs.new_series_name:
         basebranch = None
         if not cmdargs.fork_point:
@@ -510,6 +595,70 @@ def start_new_series(cmdargs: argparse.Namespace) -> None:
         logger.info('Created new branch %s', branchname)
         seriesname = cmdargs.new_series_name
 
+    elif cmdargs.enroll_base and mybranch is None:
+        # The series is the history of HEAD, and no branch is created for it.
+        # Work out everything before the first change, so that a bad base
+        # leaves HEAD alone.
+        basebranch = None
+        forkpoint = _get_detached_enroll_base(cmdargs.enroll_base)
+        merges = b4.git_get_command_lines(
+            None, ['rev-list', '--merges', f'{forkpoint}..HEAD']
+        )
+        if merges:
+            logger.critical(
+                'CRITICAL: HEAD has merge commit %.12s above %s,',
+                merges[0],
+                cmdargs.enroll_base,
+            )
+            logger.critical('          so b4 cannot enroll it as a series.')
+            sys.exit(1)
+        covers = b4.git_get_command_lines(
+            None,
+            ['log', '--grep', MAGIC_MARKER, '-F', '--format=%H', f'{forkpoint}..HEAD'],
+        )
+        if covers:
+            logger.critical(
+                'CRITICAL: HEAD already has a b4 cover letter at %.12s.', covers[0]
+            )
+            sys.exit(1)
+        try:
+            commitcount = get_rev_count(f'{forkpoint}..HEAD')
+        except RuntimeError as ex:
+            logger.critical(
+                'CRITICAL: could not use %s as fork point:', cmdargs.enroll_base
+            )
+            logger.critical('          %s', ex)
+            sys.exit(1)
+        seriesname = _get_detached_series_name(forkpoint)
+        slug = re.sub(r'\W+', '-', seriesname).strip('-').lower()
+        changeid = make_change_id(slug)
+        tip = b4.git_revparse_obj('HEAD')
+
+        recovery_ref = _get_detached_backup_ref(changeid)
+        # An empty old value only creates the ref, never moves an existing one
+        gitargs = ['update-ref', '-m', 'b4: enroll', recovery_ref, tip, '']
+        ecode, out = b4.git_run_command(None, gitargs, logstderr=True)
+        if ecode > 0:
+            logger.critical('CRITICAL: Could not save HEAD as %s:', recovery_ref)
+            logger.critical(out)
+            sys.exit(1)
+
+        if commitcount:
+            logger.info('Will track %s commits', commitcount)
+            cherry_range = f'{forkpoint}..{tip}'
+            # Moves only HEAD, since it is detached
+            gitargs = ['reset', '--hard', forkpoint]
+            ecode, out = b4.git_run_command(None, gitargs, logstderr=True)
+            if ecode > 0:
+                logger.critical('CRITICAL: not able to reset HEAD to %s', forkpoint)
+                logger.critical(out)
+                _explain_enroll_recovery(recovery_ref, cherry_picking=False)
+                sys.exit(1)
+        else:
+            logger.info(
+                'NOTE: No new commits since fork-point "%s"', cmdargs.enroll_base
+            )
+
     elif cmdargs.enroll_base:
         basebranch = None
         _cb = b4.git_get_current_branch()
@@ -620,8 +769,9 @@ def start_new_series(cmdargs: argparse.Namespace) -> None:
         logger.critical('CRITICAL: unknown operation requested')
         sys.exit(1)
 
-    # Store our cover letter strategy in the branch config
-    b4.git_set_config(None, f'branch.{branchname}.b4-prep-cover-strategy', strategy)
+    if branchname is not None:
+        # Store our cover letter strategy in the branch config
+        b4.git_set_config(None, f'branch.{branchname}.b4-prep-cover-strategy', strategy)
 
     if not cover:
         # create a default cover letter and store it where the strategy indicates
@@ -656,15 +806,8 @@ def start_new_series(cmdargs: argparse.Namespace) -> None:
         logger.info('Created the default cover letter, you can edit with --edit-cover.')
 
     if not tracking:
-        # We don't need all the entropy of uuid, just some of it
-        changeid = (
-            '%s-%s-%s'
-            % (
-                datetime.date.today().strftime('%Y%m%d'),  # noqa: DTZ011
-                slug,
-                uuid.uuid4().hex[:12],
-            )
-        )
+        if changeid is None:
+            changeid = make_change_id(slug)
         if revision is None:
             revision = 1
         prefixes = list()
@@ -704,13 +847,20 @@ def start_new_series(cmdargs: argparse.Namespace) -> None:
             # We only need the base-branch info when using strategies other than 'commit'
             tracking['series']['base-branch'] = basebranch
 
-    store_cover(cover, tracking, new=True)
+    try:
+        store_cover(cover, tracking, new=True)
+    except RuntimeError:
+        if recovery_ref:
+            _explain_enroll_recovery(recovery_ref, cherry_picking=False)
+        raise
     if cherry_range:
         gitargs = ['cherry-pick', cherry_range]
         ecode, out = b4.git_run_command(None, gitargs)
         if ecode > 0:
             # Woops, this is bad! At least tell them where the commit range is.
             logger.critical('Could not cherry-pick commits from range %s', cherry_range)
+            if recovery_ref:
+                _explain_enroll_recovery(recovery_ref, cherry_picking=True)
             sys.exit(1)
 
     if patches:
@@ -901,7 +1051,10 @@ def is_prep_branch(mustbe: bool = False, usebranch: Optional[str] = None) -> boo
     )
     _rev, mybranch = get_prep_target(usebranch)
     if mybranch is None:
-        mustmsg = 'CRITICAL: HEAD is not a prep-managed series or it was created by someone else.'
+        mustmsg = (
+            'CRITICAL: HEAD is not a prep-managed series or it was created by someone else.\n'
+            '          To enroll it, run: b4 prep -e <base>'
+        )
         if _get_configured_cover_strategy() != 'commit':
             if mustbe:
                 # Explains why and exits
@@ -1034,7 +1187,7 @@ def get_series_backup_ref(tracking: Dict[str, Any]) -> Optional[str]:
     """
     if b4.git_get_current_branch() is not None:
         return None
-    return f'refs/original/b4/{tracking["series"]["change-id"]}'
+    return _get_detached_backup_ref(tracking['series']['change-id'])
 
 
 def find_cover_commits(usebranch: Optional[str] = None) -> List[Tuple[str, str]]:
@@ -2255,7 +2408,8 @@ def update_trailers(cmdargs: argparse.Namespace) -> None:
     if not in_prep_branch and b4.git_get_current_branch() is None:
         # Rewriting a detached HEAD needs a backup ref named after the series
         logger.critical('CRITICAL: HEAD is detached and is not a b4 prep series.')
-        logger.critical('          Check out a branch first.')
+        logger.critical('          Check out a branch, or enroll HEAD with:')
+        logger.critical('            b4 prep -e <base>')
         sys.exit(1)
     if in_prep_branch:
         # Don't limit by committer in a prep branch
diff --git a/src/tests/test_ez_detached.py b/src/tests/test_ez_detached.py
index 2ed1b5b9e75f..65f2f9f13961 100644
--- a/src/tests/test_ez_detached.py
+++ b/src/tests/test_ez_detached.py
@@ -401,3 +401,257 @@ def test_linked_worktree_moves_only_its_head(
     assert b4.git_revparse_obj('HEAD', gitdir=linked) != head
     assert b4.git_get_current_branch(detached) == 'master'
     assert b4.git_revparse_obj(_backup_ref()) == head
+
+
+# -- enrolling a detached HEAD ------------------------------------------------
+
+
+@pytest.fixture
+def unenrolled(gitdir: str) -> Generator[str, None, None]:
+    """Two commits on a detached HEAD above master, tagged base-tag."""
+    b4.MAIN_CONFIG['prep-cover-strategy'] = 'commit'
+    _git('tag', 'base-tag', 'master')
+    _git('checkout', '-q', '--detach', 'master')
+    _commit_file('one.txt', 'Add the first file')
+    _commit_file('two.txt', 'Add the second file')
+    yield gitdir
+
+
+def _refs(pattern: str) -> List[str]:
+    return b4.git_get_command_lines(
+        None, ['for-each-ref', '--format=%(refname)', pattern]
+    )
+
+
+def _assert_untouched(head: str, branches: List[str]) -> None:
+    assert _head() == head
+    assert b4.git_get_current_branch() is None
+    assert _refs('refs/heads/') == branches
+    assert _refs('refs/original/') == []
+    _assert_no_bogus_branch_config()
+
+
+def _advance_master() -> None:
+    """Move master on without checking it out, as a fetch would."""
+    tree = _git('rev-parse', 'master^{tree}')
+    newer = _git('commit-tree', tree, '-p', 'master', '-m', 'Upstream moved on')
+    _git('update-ref', 'refs/heads/master', newer)
+
+
+@pytest.mark.parametrize('base', ['master', 'base-tag', 'sha'])
+def test_enroll_without_a_branch(unenrolled: str, base: str) -> None:
+    fork = b4.git_revparse_obj('base-tag^{commit}')
+    tip = _head()
+    tip_tree = b4.git_revparse_obj('HEAD^{tree}')
+    branches = _refs('refs/heads/')
+    if base == 'sha':
+        base = fork
+    elif base == 'master':
+        # A branch is forked from, so it may have moved on
+        _advance_master()
+
+    _run('prep', '-e', base)
+
+    assert b4.git_get_current_branch() is None
+    assert _refs('refs/heads/') == branches
+    cover = b4.ez.find_cover_commit()
+    assert cover is not None
+    assert b4.git_revparse_obj(f'{cover}~1') == fork
+    assert _git('rev-list', '--count', f'{cover}..HEAD') == '2'
+    assert b4.git_revparse_obj('HEAD^{tree}') == tip_tree
+    series = _tracking()['series']
+    assert '-add_the_first_file-' in series['change-id']
+    assert 'base-branch' not in series
+    assert b4.git_revparse_obj(_backup_ref()) == tip
+    assert 'EDITME: cover title for add_the_first_file' in b4.ez.load_cover()[0]
+    _assert_no_bogus_branch_config()
+
+
+def test_enroll_names_an_empty_series(unenrolled: str) -> None:
+    _run('prep', '-e', 'HEAD')
+    assert '-detached-head-' in _tracking()['series']['change-id']
+    assert b4.ez.get_series_range()[1] == _head()
+
+
+@pytest.mark.parametrize(
+    'args, message',
+    [
+        (['-e'], 'no upstream to enroll against'),
+        (['-e', 'no-such-ref'], 'Could not find commit: no-such-ref'),
+        (['-e', 'side'], 'side is not an ancestor of HEAD'),
+    ],
+)
+def test_enroll_refuses_bad_base(
+    unenrolled: str,
+    caplog: pytest.LogCaptureFixture,
+    args: List[str],
+    message: str,
+) -> None:
+    tree = _git('rev-parse', 'master^{tree}')
+    side = _git('commit-tree', tree, '-p', 'master', '-m', 'Elsewhere')
+    _git('tag', 'side', side)
+    head = _head()
+    branches = _refs('refs/heads/')
+    with caplog.at_level(logging.CRITICAL), pytest.raises(SystemExit) as exc:
+        _run('prep', *args)
+    assert exc.value.code == 1
+    assert message in caplog.text
+    _assert_untouched(head, branches)
+
+
+def test_enroll_refuses_unenrollable_history(
+    unenrolled: str, caplog: pytest.LogCaptureFixture
+) -> None:
+    head = _head()
+    _git('checkout', '-q', '-b', 'side', 'master')
+    _commit_file('side.txt', 'Side change')
+    _git('checkout', '-q', '--detach', head)
+    _git('merge', '-q', '--no-edit', 'side')
+    head = _head()
+    branches = _refs('refs/heads/')
+    with caplog.at_level(logging.CRITICAL), pytest.raises(SystemExit):
+        _run('prep', '-e', 'base-tag')
+    assert 'so b4 cannot enroll it as a series' in caplog.text
+    _assert_untouched(head, branches)
+
+
+def test_enroll_refuses_enrolled_history(
+    unenrolled: str, caplog: pytest.LogCaptureFixture
+) -> None:
+    _run('prep', '-e', 'base-tag')
+    head = _head()
+    with caplog.at_level(logging.CRITICAL), pytest.raises(SystemExit):
+        # Says it is a series already, and stops at the prompt
+        with patch('builtins.input', side_effect=KeyboardInterrupt):
+            _run('prep', '-e', 'base-tag')
+    assert _head() == head
+    with patch('builtins.input', return_value=''):
+        with caplog.at_level(logging.CRITICAL), pytest.raises(SystemExit):
+            _run('prep', '-e', 'base-tag')
+    assert 'HEAD already has a b4 cover letter' in caplog.text
+    assert _head() == head
+
+
+def test_enroll_refuses_other_strategies(
+    unenrolled: str, caplog: pytest.LogCaptureFixture
+) -> None:
+    b4.MAIN_CONFIG['prep-cover-strategy'] = 'tip-commit'
+    head = _head()
+    branches = _refs('refs/heads/')
+    with caplog.at_level(logging.CRITICAL), pytest.raises(SystemExit):
+        _run('prep', '-e', 'base-tag')
+    assert 'b4.prep-cover-strategy is tip-commit' in caplog.text
+    _assert_untouched(head, branches)
+
+
+def test_enroll_failed_replay_can_be_recovered(
+    unenrolled: str, caplog: pytest.LogCaptureFixture
+) -> None:
+    """An empty commit stops the cherry-pick; whatever the user does about
+    it, the commits from before enrolling are still there."""
+    _git('commit', '-q', '--allow-empty', '-m', 'An empty commit')
+    _commit_file('three.txt', 'Add the third file')
+    tip = _head()
+    with caplog.at_level(logging.CRITICAL), pytest.raises(SystemExit):
+        _run('prep', '-e', 'base-tag')
+    assert 'Could not cherry-pick' in caplog.text
+    recovery = _refs('refs/original/b4/')
+    assert len(recovery) == 1
+    assert b4.git_revparse_obj(recovery[0]) == tip
+    assert f'git checkout --detach {recovery[0]}' in caplog.text
+    assert 'git cherry-pick --abort' in caplog.text
+    # The replay is left for the user to resolve, not thrown away
+    assert b4._worktree_inprogress_op(unenrolled) == 'cherry-pick'
+
+    _git('cherry-pick', '--abort')
+    _git('checkout', '-q', '--detach', recovery[0])
+    assert _head() == tip
+
+
+def test_enroll_aborts_if_recovery_ref_fails(
+    unenrolled: str, caplog: pytest.LogCaptureFixture
+) -> None:
+    head = _head()
+    branches = _refs('refs/heads/')
+    real = b4.git_run_command
+
+    def _fail_update_ref(gitdir: Any, args: List[str], *a: Any, **kw: Any) -> Any:
+        if args[:1] == ['update-ref']:
+            return 1, 'fatal: injected'
+        return real(gitdir, args, *a, **kw)
+
+    with patch('b4.git_run_command', side_effect=_fail_update_ref):
+        with caplog.at_level(logging.CRITICAL), pytest.raises(SystemExit):
+            _run('prep', '-e', 'base-tag')
+    assert 'Could not save HEAD as refs/original/b4/' in caplog.text
+    _assert_untouched(head, branches)
+
+
+def test_enroll_failed_reset_explains_recovery(
+    unenrolled: str, caplog: pytest.LogCaptureFixture
+) -> None:
+    head = _head()
+    real = b4.git_run_command
+
+    def _fail_reset(gitdir: Any, args: List[str], *a: Any, **kw: Any) -> Any:
+        if args[:1] == ['reset']:
+            return 1, 'fatal: injected'
+        return real(gitdir, args, *a, **kw)
+
+    with patch('b4.git_run_command', side_effect=_fail_reset):
+        with caplog.at_level(logging.CRITICAL), pytest.raises(SystemExit):
+            _run('prep', '-e', 'base-tag')
+    recovery = _refs('refs/original/b4/')
+    assert [b4.git_revparse_obj(r) for r in recovery] == [head]
+    assert f'git checkout --detach {recovery[0]}' in caplog.text
+    assert _head() == head
+
+
+def test_enroll_in_linked_worktree(unenrolled: str, tmp_path: pathlib.Path) -> None:
+    head = _head()
+    linked = str(tmp_path / 'linked')
+    _git('worktree', 'add', '-q', '--detach', linked, head)
+    _git('checkout', '-q', 'master')
+    os.chdir(linked)
+    _run('prep', '-e', 'base-tag')
+    assert b4.ez.is_prep_branch() is True
+    assert b4.git_get_current_branch(unenrolled) == 'master'
+    assert b4.git_revparse_obj('HEAD', gitdir=unenrolled) == b4.git_revparse_obj(
+        'master'
+    )
+
+
+def test_enrolled_series_end_to_end(
+    unenrolled: str, tmp_path: pathlib.Path, transport: _Transport
+) -> None:
+    """Enroll, edit, format, check and send a series entirely on a
+    detached HEAD, and pick up review trailers for the next revision."""
+    _run('prep', '-e', 'base-tag')
+    _cover_from(tmp_path, COVER)
+    _run('prep', '--format-patch', str(tmp_path / 'out'))
+    assert len(os.listdir(tmp_path / 'out')) == 3
+    b4.MAIN_CONFIG['prep-perpatch-check-cmd'] = 'true'
+    _run('prep', '--check')
+
+    _run('send', '--no-sign', '--to', 'list@example.com')
+    assert len(transport.sent) == 3
+    change_id = _tracking()['series']['change-id']
+    assert b4.git_revparse_tag(None, f'sent/{change_id}-v1')
+    assert _tracking()['series']['revision'] == 2
+
+    reply = email.message.EmailMessage()
+    reply['From'] = 'Rev Iewer <rev@example.com>'
+    reply['Subject'] = 'Re: ' + str(transport.sent[1]['Subject'])
+    reply['Message-Id'] = '<review-2@example.com>'
+    reply['In-Reply-To'] = transport.sent[1]['Message-Id']
+    reply.set_content('Acked-by: Rev Iewer <rev@example.com>\n')
+    mbx_path = str(tmp_path / 'thread.mbox')
+    mbx = mailbox.mbox(mbx_path)
+    for msg in transport.sent + [reply]:
+        mbx.add(msg)
+    mbx.close()
+    _run('--offline-mode', 'trailers', '-u', '-m', mbx_path)
+    assert 'Acked-by: Rev Iewer' in _git('log', '-1', '--format=%B', 'HEAD~1')
+    assert b4.git_get_current_branch() is None
+    assert _refs('refs/heads/') == ['refs/heads/master']
+    _assert_no_bogus_branch_config()

-- 
2.56.0


