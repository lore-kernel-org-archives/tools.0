Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D4B35675C
	for <tools@linux.kernel.org>; Wed, 12 Aug 2026 21:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786571235; cv=none; b=UL2SN1lD/WZjZv/H2SkrpjfF8dyHcSqYELxCnI2h7tHfXlRE0g3lEKqSOc8El2BL8UmDy4RJ91Xk1Rxet34oqktJUFh3nWzRiedLwWsy4wdRalEPXqGh8YXietOGIEWoX168ZJ1e9tVjH8B7YXc5be8VMwjPYqbOwN2N8b+I65Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786571235; c=relaxed/simple;
	bh=oAyyanx4oMILbml9WZLOSAZJdXCTREQim9NU9lOuO+o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KhByLuCjVGQPMdR6iyhivdSiVIPrE0/FhRtuAquUV1LmejtTbx/nujngKZCk+FMTynCtpqHEuT3EzQxqwnWp1F4GylAaDCssU3ru6UY/5C8bFFzFqidD/xqZ6R8PRrn3vwqXWDBpfQ6XMRYjShJs6I69QwR0hxzfjPHECweFFsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m6VE2VBm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m6VE2VBm"
Received: by smtp.kernel.org (Postfix)
	id BC2A31F00A3A; Wed, 12 Aug 2026 21:47:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E44F01F000E9;
	Wed, 12 Aug 2026 21:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786571233;
	bh=ESGdRfF0nTrOIHTdQ6J3J7+vq2FTUeS4R9RcsRiorkI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=m6VE2VBmBAs2aejKNLd6hLoEjZO5RVn2g5yc8u6IqU7WXH2iyOAYahWDhB8NcrgVK
	 nE/a0Gr+NTL8BVf4sIQwj4rHu2ff97QYGoNG0r+Vcuxx/s/8GPO5VF7n2RKkwnIEi3
	 Kjx4zPvMKUqok6R6BHweFyZexXX8Uva3Y6JRp4jP79T1mYNyO8VEX4e4UNXhAsLlNB
	 Q2+kAE46OXXRSCA2rFpAnrqocXckDdH9c/ssZDIGjIJErm5JkZbnDD3A4tTgsC9yQV
	 GkIHTgh1peQ4p6RXdAlLJs9wrZK/B4yC18OAgE1Mp8eW6Gi2WpgsbgeMDaHwWbuxYg
	 CgLxXkU/SUPjA==
From: Christian Brauner <brauner@kernel.org>
Date: Wed, 12 Aug 2026 23:46:45 +0200
Subject: [PATCH RFC v2 04/25] review: guard the tracking-commit amend on
 the worktree, not the checkout
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260812-work-b4-multiver-rows-v2-4-305d53cd723a@kernel.org>
References: <20260812-work-b4-multiver-rows-v2-0-305d53cd723a@kernel.org>
In-Reply-To: <20260812-work-b4-multiver-rows-v2-0-305d53cd723a@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.17-dev-362b8
X-Developer-Signature: v=1; a=openpgp-sha256; l=7307; i=brauner@kernel.org;
 h=from:subject:message-id; bh=oAyyanx4oMILbml9WZLOSAZJdXCTREQim9NU9lOuO+o=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTVvLw19/+N+cs27drQXGTX2ym6/XKC3Ewlg+KIkIDnj
 +XdNtVu6ihlYRDjYpAVU2RxaDcJl1vOU7HZKFMDZg4rE8gQBi5OAZiIexEjw93Vzdp6EzYVXIww
 K14sd87dvfn8uvR2juPx6SYibH89yxn+h4p8tzxi8yH0a377er0PT/4oJXya8U40Uy/VqCrcl/k
 mBwA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

save_tracking_ref() rewrites a review branch's tip with commit-tree plus
update-ref.  Unlike `git branch -f`, that pair will move a branch out
from under a live worktree and strand an in-progress `git am` or rebase
on a commit that is no longer the branch tip.

"Checked out" is the wrong test for it.  The amend reuses the branch's
own tree, so a quiescent checkout survives one untouched: HEAD moves, the
working tree and index still match it, `git status` stays clean.
Refusing every checkout would refuse the review UI amending the tracking
commit on the branch it has just checked out itself, and would defer the
sweep's own writes for as long as a series stays under review.

What the amend cannot survive is an operation in flight.  A `git am`,
rebase, merge, cherry-pick, revert or bisect keeps state that names the
tip being replaced, and git records that per worktree.

Put the rule in the writer rather than in each caller, so the two writers
that reach update-ref through _store_thread_blob() and
ensure_thread_context_blob() are covered as well.  A lookup that fails
counts as busy, since this guards a ref move.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/__init__.py        | 60 +++++++++++++++++++++++++++++++++++++++++++++++
 src/b4/review/_review.py  | 20 ++++++++++++++++
 src/b4/review/tracking.py |  7 ++++++
 3 files changed, 87 insertions(+)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index a52b0011..169547c0 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -4601,6 +4601,66 @@ def git_branch_checked_out(gitdir: Optional[str], branch_name: str) -> bool:
     return False
 
 
+# What a git operation leaves in a worktree's own gitdir while it is in
+# flight.  Each of these names a sequencer or a state that remembers the
+# tip the operation started from.
+_WORKTREE_OP_STATE = (
+    'rebase-apply',  # git am, git rebase --apply
+    'rebase-merge',  # git rebase --merge / -i
+    'MERGE_HEAD',
+    'CHERRY_PICK_HEAD',
+    'REVERT_HEAD',
+    'BISECT_LOG',
+    'sequencer',
+)
+
+
+def git_worktree_busy(gitdir: Optional[str], branch_name: str) -> bool:
+    """Whether a git operation is in flight where *branch_name* is checked out.
+
+    The question anything rewriting a branch's tip commit in place has to
+    ask, and it is narrower than :func:`git_branch_checked_out`.  An amend
+    that reuses the branch's own tree moves HEAD and nothing else -- the
+    working tree and index still match it, and `git status` stays clean --
+    so a quiescent checkout survives one untouched.  Refusing every
+    checkout instead would refuse the review UI amending the tracking
+    commit on the branch it has just checked out itself, which is the
+    common and correct case.
+
+    What such an amend cannot survive is a `git am`, rebase, merge,
+    cherry-pick, revert or bisect in flight: those keep state naming the
+    tip they started from, and moving it out from under them strands the
+    operation.
+
+    Not knowing counts as busy.  This guards a ref move, so a lookup that
+    fails must not read as permission.
+    """
+    wantref = f'refs/heads/{branch_name.removeprefix("refs/heads/")}'
+    ecode, out = git_run_command(gitdir, ['worktree', 'list', '--porcelain'])
+    if ecode != 0:
+        logger.debug('Could not list worktrees, assuming %s is busy', branch_name)
+        return True
+    wtpath = None
+    current = None
+    for line in out.splitlines():
+        if line.startswith('worktree '):
+            current = line[9:].strip()
+        elif line.startswith('branch ') and line[7:].strip() == wantref:
+            wtpath = current
+            break
+    if not wtpath:
+        # Checked out nowhere, so there is no operation to strand.
+        return False
+    ecode, out = git_run_command(wtpath, ['rev-parse', '--absolute-git-dir'])
+    if ecode != 0:
+        logger.debug('Could not resolve the gitdir of %s, assuming busy', wtpath)
+        return True
+    wtgitdir = out.strip()
+    return any(
+        os.path.exists(os.path.join(wtgitdir, name)) for name in _WORKTREE_OP_STATE
+    )
+
+
 def git_revparse_tag(gitdir: Optional[str], tagname: str) -> Optional[str]:
     if not tagname.startswith('refs/tags/'):
         fulltag = f'refs/tags/{tagname}'
diff --git a/src/b4/review/_review.py b/src/b4/review/_review.py
index 5fa4d2ab..98f51363 100644
--- a/src/b4/review/_review.py
+++ b/src/b4/review/_review.py
@@ -721,12 +721,32 @@ def save_tracking_ref(
     Uses git commit-tree + git update-ref so that commit.gpgsign and
     hooks are not triggered — tracking commits are ephemeral and do
     not benefit from signing.  Returns True on success.
+
+    Declines while the worktree holding *branch* has a git operation in
+    flight.  update-ref, unlike `git branch -f`, will happily move a
+    branch out from under a live worktree, and a `git am` or rebase keeps
+    state naming the tip this is about to replace.  The rule lives here
+    rather than in each caller because it is a property of the write:
+    every caller that moves this ref has to respect it, and the two that
+    reached update-ref through :func:`b4.review.tracking._store_thread_blob`
+    and :func:`b4.review.tracking.ensure_thread_context_blob` did not.
+
+    The tree is the branch's own, so a *quiescent* checkout is not a
+    reason to decline -- see :func:`b4.git_worktree_busy`.
     """
     if not branch.startswith(REVIEW_BRANCH_PREFIX):
         logger.critical(
             'Refusing to write tracking commit to non-review branch: %s', branch
         )
         return False
+    if b4.git_worktree_busy(topdir, branch):
+        # Said out loud, not at debug: :func:`save_tracking` turns a False
+        # into `Unable to amend tracking commit` and exits, and a maintainer
+        # who has a rebase in flight on the branch is owed the reason.  The
+        # sweep is the one caller that meets this routinely, and it runs
+        # inside _quiet_cron/_quiet_worker.
+        logger.info('%s is mid-operation, not amending its tracking commit', branch)
+        return False
     commit_msg = cover_text + '\n\n' + make_review_magic_json(tracking)
     ecode, out = b4.git_run_command(topdir, ['rev-parse', f'{branch}^{{tree}}'])
     if ecode > 0:
diff --git a/src/b4/review/tracking.py b/src/b4/review/tracking.py
index 710b4a0d..2722e6c3 100644
--- a/src/b4/review/tracking.py
+++ b/src/b4/review/tracking.py
@@ -1223,6 +1223,13 @@ def sync_revisions_catalog_to_branch(
     that cannot be re-derived from lore — travels with the branch on push.
     No-op (returns False) when there is no topdir, no such branch, or the
     catalog is already current.
+
+    A branch whose worktree is mid-operation is declined by
+    :func:`b4.review.save_tracking_ref` itself, so there is no test for it
+    here: the rule belongs to the write, and repeating it per caller is
+    how it came to be enforced for this one and not for the other two.
+    The catalog is mirrored again on the next sweep that finds the
+    worktree free.
     """
     if not topdir:
         return False

-- 
2.53.0

