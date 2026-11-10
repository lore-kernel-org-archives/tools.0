Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794314463;
	b=sNshSksVaslIIzOwHpAZJshHEoOL03P1uS7Y5PeOfmhzWhb/Z+3LHiGqUj86kzpJR0oo
	 Mi/Kb5kyG+8l+3zrW+AdlirlK8XdMcWCb8gkdo9KF1yDUmvFuIgl3DIe2Nkyqs5kWAclY
	 p9PaG6+BI+03PlJKzD8PuiYABmB+ptoi1M9TLTYnHfpfuv5UviQYjoAyJvUBetq8eTAPv
	 aYeDly9VKOXQxviBurCOpbpWIVsbNfr2mD2Ee0hshJVEKPzX50b6NmAt/qcbbKC/JwHDm
	 rh/JVBj/kfKiIFgkKN7sEq0ro+cMOHrM5RTtMcdTmb9Rayvf3c4sAlgukXFB7PyyadA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794314463;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Bm-Milter-Handled:
	 X-Bm-Transport-Timestamp;
	bh=e7aMoXrExKIah249vLDWHvk3h3r5CsOHNR3abciDBSs=;
	b=Cn2yC0t98kmDDIr05KIOFzdg0Dhk9PHBXEjBnh5uvWHFIIYELTt6kJlty+eRuopHmBUH
	 EAdPPoOTPnCVdyBqm3wNOl6yJKRRY6LUCRgDCNIaasc4cbYIOPRb3/DS9a5aEBNR43V0+
	 ceusikKp+jLYncY7Dsa5yyzhJYuSAfQ6LtZDUBUzh+8scC4vWu+dwGGHmmRvritbPcs4J
	 6vuNwXsVle702pVuRA5pjTFAmLhO7g0b9aNdltL3hl2CpP7EJAF5NgAaiTGZZib16pGvv
	 2kmbOCIkXDNw0Lppcjoz8Iw6naPlQUEVI1+2zOftphz4CEnpfgzI5rdPfSIg5KvmO+A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF26660A2639
	for <tools@linux.kernel.org>; Tue, 10 Nov 2026 12:41:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CCC621F0089F; Tue, 10 Nov 2026 12:41:02 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=94.136.29.106
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794314462;
	b=Rrf9lNR4rgUYMUEOLcifjUZC4TQS+6T8+dieXXhyoCAKxNtUDtRGwI3NJDrDKJrLWLFw
	 3L0iVh1k2GISDW21lkjd5DypTqZA8ubj5hcgHsb+2WMC1VgtMywgVkCvAqLU+183SPb7N
	 42YYLIDFY+GYjqCKXa9pUSzGIGN/wC1Aqi2VSC3ou22QmccD6oQB6JxeQyujbEtRLteOB
	 hxWJVFjgjPtHsuprTNuH9VXW3A9D6fJQ6t3wlRoCTVMqk1X0Q/Ek8SwbZ/SR0B9sG0sAR
	 ji40pUgxubrKie56YqEIjUoNMvnlsUASGRE/bja1xKHNdR7LK3r8fyDkryZDf3Z1LQw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794314462;
	h=DMARC-Filter:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Bm-Milter-Handled:X-Bm-Transport-Timestamp;
	bh=e7aMoXrExKIah249vLDWHvk3h3r5CsOHNR3abciDBSs=;
	b=YGFd82az/+uQn+tyIgDq8N/AsoG8Vdw2LiBQPxC7IYgGk98otgpfwLduURim8QQXprSj
	 ukbcJOVzdxPSa2XhydjN94oXiARGRDufPXuYYxfegoOjyitTywk9sZhz6h9ySv2/8PK2J
	 3psD2GV5s037zdFbFwXo4Y8GDXzXUXqXKfxzMDeucPp57f/VgYdZxkJ43qgkZSqI1pHFO
	 SD9R3fwPJVN83nd+RHvqRGsLYY2TmJ/LOSABZwPJKV2Oa9mRS44fzcQWfWgypntYKA1Sc
	 8GfXoJ41NbR0s6KW1arfs3ONoYuSAZXLpJMh9reCW+uQ9aciRWw/HrVuhMB0TIYQFAQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dmarc=none header.from=proxmox.com;
	spf=pass smtp.mailfrom=proxmox.com;
	arc=none smtp.remote-ip=94.136.29.106
Received: from proxmox-new.maurer-it.com (proxmox-new.maurer-it.com [94.136.29.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5D54B1F008A6
	for <tools@kernel.org>; Tue, 10 Nov 2026 12:41:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 5D54B1F008A6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=proxmox.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=proxmox.com
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
	by proxmox-new.maurer-it.com (Proxmox) with ESMTP id A07E3481B2;
	Tue, 10 Nov 2026 13:40:58 +0100 (CET)
From: Gabriel Goller <g.goller@proxmox.com>
Date: Tue, 10 Nov 2026 13:40:49 +0100
Subject: [PATCH RFC b4 3/6] rewrite: keep a detached HEAD detached, never
 overwrite a moved ref
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
Message-Id: <20261110-editor_refuse_the-v1-3-4b6e52f326a9@proxmox.com>
References: <20261110-editor_refuse_the-v1-0-4b6e52f326a9@proxmox.com>
In-Reply-To: <20261110-editor_refuse_the-v1-0-4b6e52f326a9@proxmox.com>
To: tools@kernel.org
Cc: Gabriel Goller <g.goller@proxmox.com>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Gabriel Goller <hey@gabriels.computer>
X-Mailer: b4 0.17-dev
X-Bm-Milter-Handled: 55990f41-d878-4baa-be0a-ee34c49e34d2
X-Bm-Transport-Timestamp: 1794314453820

From: Gabriel Goller <hey@gabriels.computer>

pygit2 reports a detached HEAD as a direct reference named HEAD, so,
contrary to the comment in rewrite_commits(), a detached rewrite did
not fail. It moved HEAD and saved the backup as refs/original/HEAD, a
name that every detached series would share. Rewrite a detached HEAD
in place, keep it detached, and require the caller to name the backup
ref, since only the caller knows which series it rewrites. On a
detached HEAD that is not a prep series, b4 trailers -u relied on that
shared name. It now refuses, because there is no series to name a
backup after.

Publishing the rewritten tip also set the ref unconditionally. If the
ref moved after the rewrite read it, whatever moved it was lost. Check
that the ref still points at the tip that was rewritten, and fail
without changing any ref if it does not. With pygit2 1.19 or newer,
the ref and its backup stay locked from that check until they are
updated. Older pygit2 has no reference transactions, which leaves a
short window between the check and the update.

Refuse an end commit that is not the tip, as moving the ref to its
rewritten copy would drop the commits above it.

Signed-off-by: Gabriel Goller <hey@gabriels.computer>
---
 src/b4/_rewrite.py        | 135 +++++++++++++++++++++++++++------
 src/b4/ez.py              |  15 +++-
 src/tests/test_ez.py      |  41 ++++++++++
 src/tests/test_rewrite.py | 189 ++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 357 insertions(+), 23 deletions(-)

diff --git a/src/b4/_rewrite.py b/src/b4/_rewrite.py
index f3464485cce1..8ad8a046db20 100644
--- a/src/b4/_rewrite.py
+++ b/src/b4/_rewrite.py
@@ -22,13 +22,30 @@ from __future__ import annotations
 from typing import Dict, Iterable, List, Optional, Tuple
 
 import pygit2
-from pygit2.enums import SortMode
+from pygit2.enums import ReferenceType, SortMode
 
 import b4
 
 logger = b4.logger
 
 
+class RewriteTargetMovedError(RuntimeError):
+    """Raised when the ref being rewritten moved while the rewrite ran.
+
+    Publishing the rewritten tip anyway would silently discard whatever
+    moved the ref, so nothing is published and the newer history stays.
+    """
+
+    def __init__(self, refname: str, expected: str, found: Optional[str]) -> None:
+        self.refname = refname
+        self.expected = expected
+        self.found = found
+        super().__init__(
+            '%s moved from %s to %s during the rewrite; nothing was changed'
+            % (refname, expected[:12], found[:12] if found else 'elsewhere')
+        )
+
+
 class ThirdpartyCommitterError(RuntimeError):
     """Raised when a rewrite would touch commits committed by someone else.
 
@@ -99,6 +116,76 @@ def _current_committer() -> pygit2.Signature:
     return pygit2.Signature(str(name), str(email))
 
 
+def _get_rewrite_target(
+    repo: pygit2.Repository, backup_ref: Optional[str]
+) -> Tuple[str, str]:
+    """Return ``(refname, backup_refname)`` for the ref that HEAD names.
+
+    On a branch, that is the branch, backed up to ``refs/original/<branch>``
+    unless *backup_ref* says otherwise. A detached HEAD is rewritten in
+    place and stays detached. It has no name to derive a backup from, so
+    the caller must name one.
+    """
+    if repo.head_is_detached:
+        if not backup_ref:
+            raise RuntimeError('Rewriting a detached HEAD needs an explicit backup ref')
+        return 'HEAD', backup_ref
+    refname = repo.head.name
+    if backup_ref:
+        return refname, backup_ref
+    return refname, 'refs/original/' + refname.removeprefix('refs/heads/')
+
+
+def _check_target(repo: pygit2.Repository, refname: str, expected: pygit2.Oid) -> None:
+    ref = repo.references.get(refname)
+    if ref is None:
+        raise RewriteTargetMovedError(refname, str(expected), None)
+    if ref.type != ReferenceType.DIRECT:
+        # A detached HEAD that now names a branch was checked out elsewhere
+        raise RewriteTargetMovedError(refname, str(expected), None)
+    if ref.target != expected:
+        raise RewriteTargetMovedError(refname, str(expected), str(ref.target))
+
+
+def _can_lock_refs(repo: pygit2.Repository) -> bool:
+    # Reference transactions are new in pygit2 1.19
+    return hasattr(repo, 'transaction')
+
+
+def _publish_tip(
+    repo: pygit2.Repository,
+    refname: str,
+    backup_name: str,
+    old_tip: pygit2.Oid,
+    new_tip: pygit2.Oid,
+    reflog_msg: str,
+) -> None:
+    """Back up *old_tip* and move *refname* to *new_tip*, if it is unmoved.
+
+    With reference transactions, both refs stay locked from the check to
+    the update, so no other git process can move them in between. Older
+    pygit2 has no locking, which leaves a short window between checking
+    the ref and updating it.
+    """
+    backup_msg = 'b4: replace backup' if backup_name in repo.references else None
+    if _can_lock_refs(repo):
+        with repo.transaction() as txn:
+            txn.lock_ref(refname)
+            txn.lock_ref(backup_name)
+            _check_target(repo, refname, old_tip)
+            txn.set_target(backup_name, old_tip, message=backup_msg)
+            txn.set_target(refname, new_tip, message=reflog_msg)
+        return
+
+    _check_target(repo, refname, old_tip)
+    if backup_msg:
+        logger.debug('Overwriting existing %s', backup_name)
+        repo.references[backup_name].set_target(old_tip, backup_msg)
+    else:
+        repo.references.create(backup_name, old_tip)
+    repo.references[refname].set_target(new_tip, reflog_msg)
+
+
 def rewrite_commits(
     edit_map: Dict[str, str],
     start: str,
@@ -108,6 +195,7 @@ def rewrite_commits(
     gitdir: Optional[str] = None,
     force: bool = False,
     allow_thirdparty_committer: bool = False,
+    backup_ref: Optional[str] = None,
 ) -> Dict[str, str]:
     """Rewrite commits in ``(start, end]`` using pygit2.
 
@@ -135,8 +223,14 @@ def rewrite_commits(
     the rewrite range are migrated to the new commit OIDs with note bytes
     preserved verbatim.
 
-    Creates ``refs/original/<branch>`` as a backup before updating the live
-    branch ref. Appends a reflog entry on the branch ref using *reflog_msg*.
+    The ref that HEAD names is the one rewritten, and *end* must be its tip.
+    On a branch, that is the branch, and a detached HEAD is moved in place
+    and stays detached. The old tip is saved to a backup ref first, replacing
+    any earlier backup: ``refs/original/<branch>`` on a branch, *backup_ref*
+    when it is given, which is required on a detached HEAD. If the ref no
+    longer points at the old tip when the new one is ready,
+    :class:`RewriteTargetMovedError` is raised and no ref is changed.
+    Appends a reflog entry on the rewritten ref using *reflog_msg*.
     Calls ``b4.ez.run_rewrite_hook('pre')`` before any mutation and
     ``run_rewrite_hook('post')`` after. Both hooks are SKIPPED on the
     no-op fast path.
@@ -151,20 +245,23 @@ def rewrite_commits(
     # Lazy import to avoid a cycle: ez.py imports from this module.
     from b4.ez import run_rewrite_hook
 
-    run_rewrite_hook('pre')
-
     if gitdir is None:
         gd = b4.git_get_gitdir()
         if not isinstance(gd, str):
             raise RuntimeError('Unable to locate gitdir for rewrite')
         gitdir = gd
     repo = pygit2.Repository(gitdir)
-
-    head_ref = repo.head  # raises if HEAD is detached; callers guard this
-    branch_refname = head_ref.name
-
+    target_refname, backup_name = _get_rewrite_target(repo, backup_ref)
+    old_tip = repo.revparse_single('HEAD').id
     start_oid = repo.revparse_single(start).id
     end_oid = repo.revparse_single(end).id
+    if end_oid != old_tip:
+        raise RuntimeError(
+            '%s is not the tip of %s; rewriting it would drop the commits above it'
+            % (end, target_refname)
+        )
+
+    run_rewrite_hook('pre')
 
     walker = repo.walk(end_oid, SortMode.TOPOLOGICAL | SortMode.REVERSE)
     walker.hide(start_oid)
@@ -226,19 +323,13 @@ def rewrite_commits(
 
     assert new_tip_oid is not None  # old_commits was non-empty
 
-    # Backup the original branch tip, then move the branch to the new tip.
-    short = branch_refname
-    if short.startswith('refs/heads/'):
-        short = short[len('refs/heads/') :]
-    backup_name = f'refs/original/{short}'
-    old_tip = head_ref.target
-    if backup_name in repo.references:
-        logger.debug('Overwriting existing %s', backup_name)
-        repo.references[backup_name].set_target(old_tip, 'b4: replace backup')
-    else:
-        repo.references.create(backup_name, old_tip)
-
-    repo.references[branch_refname].set_target(new_tip_oid, reflog_msg)
+    try:
+        _publish_tip(
+            repo, target_refname, backup_name, old_tip, new_tip_oid, reflog_msg
+        )
+    except RewriteTargetMovedError:
+        run_rewrite_hook('post')
+        raise
 
     # Migrate notes (no-op fast path when there were none).
     if notes_snap:
diff --git a/src/b4/ez.py b/src/b4/ez.py
index 3a2594576f09..86a7e37305f7 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -33,7 +33,11 @@ from typing import Any, Dict, List, NamedTuple, Optional, Set, Tuple, Union
 
 import b4
 import patatt
-from b4._rewrite import ThirdpartyCommitterError, rewrite_commits
+from b4._rewrite import (
+    RewriteTargetMovedError,
+    ThirdpartyCommitterError,
+    rewrite_commits,
+)
 
 can_codespell = importlib.util.find_spec('codespell_lib') is not None
 
@@ -1039,6 +1043,10 @@ def _rewrite_series_commits(
         )
         logger.critical('                b4 prep --claim')
         sys.exit(1)
+    except RewriteTargetMovedError as ex:
+        logger.critical('CRITICAL: %s moved while b4 was rewriting it.', ex.refname)
+        logger.critical('          Nothing was changed; run the command again.')
+        sys.exit(1)
 
 
 def _claim_range_start(mybranch: str, cover_sha: str) -> str:
@@ -2150,6 +2158,11 @@ def update_trailers(cmdargs: argparse.Namespace) -> None:
     limit_committer: Optional[str] = str(usercfg['email'])
     # If we are in an b4-prep branch, we start from the beginning of the series
     in_prep_branch = is_prep_branch()
+    if not in_prep_branch and b4.git_get_current_branch() is None:
+        # Rewriting a detached HEAD needs a backup ref named after the series
+        logger.critical('CRITICAL: HEAD is detached and is not a b4 prep series.')
+        logger.critical('          Check out a branch first.')
+        sys.exit(1)
     if in_prep_branch:
         # Don't limit by committer in a prep branch
         limit_committer = None
diff --git a/src/tests/test_ez.py b/src/tests/test_ez.py
index 266cea96fbde..30ed5ea2117f 100644
--- a/src/tests/test_ez.py
+++ b/src/tests/test_ez.py
@@ -1358,6 +1358,47 @@ def test_rewrite_series_commits_explains_thirdparty(
     assert 'b4 prep --claim' in caplog.text
 
 
+def test_rewrite_series_commits_explains_moved_target(
+    caplog: pytest.LogCaptureFixture,
+) -> None:
+    err = b4._rewrite.RewriteTargetMovedError('HEAD', 'a' * 40, 'b' * 40)
+    with patch('b4.ez.rewrite_commits', side_effect=err):
+        with caplog.at_level(logging.CRITICAL, logger='b4'):
+            with pytest.raises(SystemExit):
+                b4.ez._rewrite_series_commits(
+                    {'deadbeefcafe': 'msg'}, 'start', reflog_msg='b4: test'
+                )
+    assert 'HEAD moved while b4 was rewriting it' in caplog.text
+    assert 'Nothing was changed' in caplog.text
+
+
+def test_trailers_refuse_detached_head_outside_a_series(
+    gitdir: str, caplog: pytest.LogCaptureFixture
+) -> None:
+    """A detached HEAD that is not a prep series has nothing to name a
+    backup after, so trailers -u refuses before looking for trailers."""
+    ecode, out = b4.git_run_command(None, ['checkout', '-q', '--detach'])
+    assert ecode == 0, out
+    head = b4.git_revparse_obj('HEAD')
+    parser = b4.command.setup_parser()
+    cmdargs = parser.parse_args(
+        [
+            '--no-stdin',
+            '--no-interactive',
+            '--offline-mode',
+            'trailers',
+            '-u',
+            '-m',
+            '/dev/null',
+        ]
+    )
+    with caplog.at_level(logging.CRITICAL), pytest.raises(SystemExit) as exc:
+        b4.ez.cmd_trailers(cmdargs)
+    assert exc.value.code == 1
+    assert 'HEAD is detached and is not a b4 prep series' in caplog.text
+    assert b4.git_revparse_obj('HEAD') == head
+
+
 def test_claim_branch_description_restamps_series(prepdir: str) -> None:
     """branch-description keeps no cover commit, but --claim still re-stamps
     the series patches (fork-point..HEAD) under the current identity."""
diff --git a/src/tests/test_rewrite.py b/src/tests/test_rewrite.py
index 2885a785a071..b8f2a71c2a71 100644
--- a/src/tests/test_rewrite.py
+++ b/src/tests/test_rewrite.py
@@ -260,6 +260,195 @@ class TestRewriteCore:
         )
 
 
+# -- Detached HEAD and moved targets ------------------------------------------
+
+BACKUP = 'refs/original/b4/20260101-series-0123456789ab'
+
+
+class TestRewriteTarget:
+    def test_detached_head_rewritten_in_place(
+        self, bare_repo: pygit2.Repository
+    ) -> None:
+        """pygit2 reports a detached HEAD as a direct ref named HEAD; it is
+        moved in place, stays detached, and leaves the branch alone."""
+        oids = _seed(bare_repo, ['a\n', 'b\n', 'c\n'])
+        bare_repo.set_head(oids[-1])
+        assert bare_repo.head_is_detached
+        bare_repo.create_note('the note body', SIG, SIG, str(oids[1]))
+        with _patch_gitdir(bare_repo), patch('b4.ez.run_rewrite_hook'):
+            result = b4._rewrite.rewrite_commits(
+                edit_map={str(oids[1]): 'b (edited)\n'},
+                start=str(oids[0]),
+                reflog_msg='b4: detached rewrite',
+                backup_ref=BACKUP,
+            )
+        assert bare_repo.head_is_detached
+        new_tip = _commit(bare_repo, bare_repo.head.target)
+        assert str(new_tip.id) == result[str(oids[2])]
+        assert new_tip.tree_id == _commit(bare_repo, oids[2]).tree_id
+        assert new_tip.author.email == SIG.email
+        assert new_tip.committer.name == CURRENT_USER['name']
+        assert _commit(bare_repo, result[str(oids[1])]).message == 'b (edited)\n'
+        assert bare_repo.lookup_note(result[str(oids[1])]).message == 'the note body'
+        # The branch HEAD came from is someone else's business now.
+        assert bare_repo.references[BRANCH].target == oids[-1]
+        assert bare_repo.references[BACKUP].target == oids[-1]
+        assert 'refs/original/HEAD' not in bare_repo.references
+        assert 'refs/original/master' not in bare_repo.references
+        entries = list(bare_repo.references['HEAD'].log())
+        assert entries[0].message == 'b4: detached rewrite'
+
+    def test_detached_head_needs_backup_ref(self, bare_repo: pygit2.Repository) -> None:
+        oids = _seed(bare_repo, ['a\n', 'b\n'])
+        bare_repo.set_head(oids[-1])
+        with _patch_gitdir(bare_repo), patch('b4.ez.run_rewrite_hook') as hook:
+            with pytest.raises(RuntimeError, match='explicit backup ref'):
+                b4._rewrite.rewrite_commits(
+                    edit_map={str(oids[1]): 'b!\n'}, start=str(oids[0])
+                )
+        hook.assert_not_called()
+        assert bare_repo.head.target == oids[-1]
+        assert not [r for r in bare_repo.references if r.startswith('refs/original/')]
+
+    def test_backup_ref_replaces_earlier_backup(
+        self, bare_repo: pygit2.Repository
+    ) -> None:
+        oids = _seed(bare_repo, ['a\n', 'b\n'])
+        bare_repo.set_head(oids[-1])
+        for msg in ('b1\n', 'b2\n'):
+            before = bare_repo.head.target
+            with _patch_gitdir(bare_repo), patch('b4.ez.run_rewrite_hook'):
+                b4._rewrite.rewrite_commits(
+                    edit_map={str(before): msg}, start=str(oids[0]), backup_ref=BACKUP
+                )
+            assert bare_repo.references[BACKUP].target == before
+
+    @pytest.mark.parametrize('locking', [True, False])
+    @pytest.mark.parametrize('detached', [True, False])
+    def test_moved_target_is_not_overwritten(
+        self, bare_repo: pygit2.Repository, locking: bool, detached: bool
+    ) -> None:
+        """Whatever moved the ref while the commits were rewritten wins; the
+        rewrite publishes nothing, not even a backup."""
+        if locking and not hasattr(bare_repo, 'transaction'):
+            pytest.skip('pygit2 before 1.19 has no reference transactions')
+        oids = _seed(bare_repo, ['a\n', 'b\n'])
+        newer = _mkcommit(bare_repo, 'newer\n', oids[-1], b'newer\n')
+        refname = BRANCH
+        if detached:
+            bare_repo.set_head(oids[-1])
+            refname = 'HEAD'
+        collect = b4._rewrite._collect_notes
+
+        def _move_then_collect(repo: pygit2.Repository, hexes: Any) -> Any:
+            repo.references[refname].set_target(newer, 'moved meanwhile')
+            return collect(repo, hexes)
+
+        with (
+            _patch_gitdir(bare_repo),
+            patch('b4.ez.run_rewrite_hook') as hook,
+            patch('b4._rewrite._collect_notes', side_effect=_move_then_collect),
+            patch('b4._rewrite._can_lock_refs', return_value=locking),
+        ):
+            with pytest.raises(b4._rewrite.RewriteTargetMovedError) as ei:
+                b4._rewrite.rewrite_commits(
+                    edit_map={str(oids[1]): 'b!\n'},
+                    start=str(oids[0]),
+                    backup_ref=BACKUP if detached else None,
+                )
+        assert ei.value.refname == refname
+        assert ei.value.found == str(newer)
+        assert bare_repo.references[refname].target == newer
+        assert bare_repo.head_is_detached == detached
+        assert not [r for r in bare_repo.references if r.startswith('refs/original/')]
+        # The pre hook ran, so the post hook must too.
+        assert [c.args for c in hook.call_args_list] == [('pre',), ('post',)]
+
+    def test_detached_head_checked_out_to_branch_is_not_written_through(
+        self, bare_repo: pygit2.Repository
+    ) -> None:
+        """A detached HEAD that now names a branch was checked out elsewhere;
+        writing to HEAD would move that branch."""
+        oids = _seed(bare_repo, ['a\n', 'b\n'])
+        bare_repo.set_head(oids[-1])
+        collect = b4._rewrite._collect_notes
+
+        def _attach_then_collect(repo: pygit2.Repository, hexes: Any) -> Any:
+            repo.set_head(BRANCH)
+            return collect(repo, hexes)
+
+        with (
+            _patch_gitdir(bare_repo),
+            patch('b4.ez.run_rewrite_hook'),
+            patch('b4._rewrite._collect_notes', side_effect=_attach_then_collect),
+        ):
+            with pytest.raises(b4._rewrite.RewriteTargetMovedError):
+                b4._rewrite.rewrite_commits(
+                    edit_map={str(oids[1]): 'b!\n'},
+                    start=str(oids[0]),
+                    backup_ref=BACKUP,
+                )
+        assert bare_repo.references[BRANCH].target == oids[-1]
+
+    def test_end_must_be_the_tip(self, bare_repo: pygit2.Repository) -> None:
+        oids = _seed(bare_repo, ['a\n', 'b\n', 'c\n'])
+        with _patch_gitdir(bare_repo), patch('b4.ez.run_rewrite_hook') as hook:
+            with pytest.raises(RuntimeError, match='not the tip'):
+                b4._rewrite.rewrite_commits(
+                    edit_map={str(oids[1]): 'b!\n'},
+                    start=str(oids[0]),
+                    end=str(oids[1]),
+                )
+        hook.assert_not_called()
+        assert bare_repo.references[BRANCH].target == oids[-1]
+
+    def test_linked_worktree_head_only(self, tmp_path: Path) -> None:
+        """A detached HEAD lives in its worktree's git dir; rewriting it
+        must not move the main worktree's HEAD or any branch."""
+        main = str(tmp_path / 'main')
+        linked = str(tmp_path / 'linked')
+        ecode, out = b4.git_run_command(None, ['init', '-q', '-b', 'master', main])
+        assert ecode == 0, out
+        for subj in ('one', 'two', 'three'):
+            ecode, out = b4.git_run_command(
+                main,
+                [
+                    '-c',
+                    f'user.name={SIG.name}',
+                    '-c',
+                    f'user.email={SIG.email}',
+                    'commit',
+                    '-q',
+                    '--allow-empty',
+                    '-m',
+                    subj,
+                ],
+            )
+            assert ecode == 0, out
+        ecode, out = b4.git_run_command(
+            main, ['worktree', 'add', '-q', '--detach', linked, 'master']
+        )
+        assert ecode == 0, out
+        wt_gitdir = b4.git_run_command(linked, ['rev-parse', '--absolute-git-dir'])[1]
+        assert isinstance(wt_gitdir, str)
+        tip = b4.git_revparse_obj('master', gitdir=main)
+
+        with (
+            patch('b4.git_get_gitdir', return_value=wt_gitdir.strip()),
+            patch('b4.ez.run_rewrite_hook'),
+        ):
+            result = b4._rewrite.rewrite_commits(
+                edit_map={tip: 'three (edited)\n'},
+                start=f'{tip}~1',
+                backup_ref=BACKUP,
+            )
+        assert b4.git_revparse_obj('HEAD', gitdir=linked) == result[tip]
+        assert b4.git_get_current_branch(linked) is None
+        assert b4.git_get_current_branch(main) == 'master'
+        assert b4.git_revparse_obj('HEAD', gitdir=main) == tip
+        assert b4.git_revparse_obj(BACKUP, gitdir=main) == tip
+
+
 # -- Notes migration ---------------------------------------------------------
 
 

-- 
2.56.0


