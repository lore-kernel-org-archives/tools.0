Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38ED3DD875
	for <tools@linux.kernel.org>; Thu, 25 Jun 2026 12:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782389388; cv=none; b=A3+c4umOR3wqaPHTwKvMVQa5EoLcJvgrc09LkEVpX10WkRsHMRRfjayyKwb7yyBwq9QzAN2y3QgzM6H/BTM00WetX/JJbCmhaSE+rnhBVaHBvXkij6P6jSD21uyw/8CqZrWNPx/4dmgykslURl2BxUrJc0P8/I6gFYEz3H/wl0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782389388; c=relaxed/simple;
	bh=wDEFEve+L9eYH3MsrUwjNrCts/jXuk8jNR/nkJAtsz0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m+H4PJbozrE4DndZ22rZ4UX+oqx1uDYfkLZPFSUA2KHpT8+ajfu7rz2cjvOrFRwZ6XqJCZihk6vyBlnK4ZiBqYB34lCvHZNvoSTe4hqWjTgfmXpMsv8DGKCKNSyqOAIiWrQ79qeH/IMTcSJ7xRm+TmHs8vJ3LeVzgjeAuYTXCBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ec03vcOx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ec03vcOx"
Received: by smtp.kernel.org (Postfix)
	id 9F62D1F00A3A; Thu, 25 Jun 2026 12:09:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE8581F000E9;
	Thu, 25 Jun 2026 12:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782389386;
	bh=y0MYz/c6wfbHCsYVQIpXprjPizPmBtrhW98RXj1LApY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ec03vcOx8ZKjMgKShpV+WxIl6AkdZ7u/Q8uPDb6w3mpruSkTZeJ2//Z/VmZM4TzwQ
	 I0mKuh3FjTfCKlb0FMzAmhLj0m1NqWDfLsgkN8oGY4DM09/YtLrYV83yzrDWuSl81a
	 YC+mp8PR7pZLDCNxausR32dwTn3zyjtRDiWAZBTJKbzy612sT57FMU4AI4u0gmSF4c
	 sAevpXX977rjYl+uGYV60+bAP5VbhJHiNrHk532PhDwfFPBrv/+ljD3hqa8qQXlyw/
	 frTFETFQVOM06xL5kLgdCy5m4QxqXD/oF9BMOhIwba1uOhPz6y65M4d3eaV9WssdO+
	 Iu8+KMnqiI4eQ==
From: Christian Brauner <brauner@kernel.org>
Date: Thu, 25 Jun 2026 14:09:28 +0200
Subject: [PATCH b4 v3 8/9] review-tui: don't leave a take's target worktree
 mid-conflict
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-shazam-resolve-native-am-v3-8-622b37a7f3b2@kernel.org>
References: <20260625-shazam-resolve-native-am-v3-0-622b37a7f3b2@kernel.org>
In-Reply-To: <20260625-shazam-resolve-native-am-v3-0-622b37a7f3b2@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-0a195
X-Developer-Signature: v=1; a=openpgp-sha256; l=8734; i=brauner@kernel.org;
 h=from:subject:message-id; bh=wDEFEve+L9eYH3MsrUwjNrCts/jXuk8jNR/nkJAtsz0=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTZStWvsxNe1fW9UX+1mPi6Uy9kz23Z+/PrIonH0088v
 LftnGyGfUcpC4MYF4OsmCKLQ7tJuNxynorNRpkaMHNYmUCGMHBxCsBE6kMYGf59sk7ev/vXQVH1
 o+0xO5JS4rdMTK6WWe7s63En/8GBon5GhiMBBu2Kkzaa+YpkxbBFpOeaHpBo994pVroyIEVr9bc
 DzAA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

A take applies the series into whichever worktree holds the target branch
-- often the maintainer's real checkout. When git-am or git-merge hits a
conflict there, the take drops into a shell to resolve it in place. If that
shell is left without finishing (no git am/merge --continue or --abort),
_resolve_worktree_take_conflict only printed a "run git ... --abort to clean
up" hint and returned, leaving the half-applied am/merge in the worktree.

That poisons it. A later take's git-merge then refuses to even start
("Merging is not possible because you have unmerged files"), and the
"Aborting merge..." fallback runs git merge --abort, which cannot clear a
bare unmerged index with no MERGE_HEAD -- so every subsequent take fails the
same way until the worktree is cleaned by hand.

Fix it from both ends:

  - A real checkout is never left mid-op. When conflict resolution is
    abandoned, abort what we started so the worktree is restored. Throwaway
    worktrees are still kept for hand-finishing -- they are isolated and
    poison nothing, and the next take force-removes them regardless.

  - A take refuses up front if the target worktree is already mid-op or
    carries a conflicted index -- an earlier abandoned take, a crash, or the
    user's own unfinished am/merge -- naming the op and the fix to run,
    rather than failing cryptically on top of it. Pre-existing state may be
    the user's own, so it is reported, never discarded.

Detection and abort live in b4 core, alongside the worktree am-conflict
plumbing this series already lifted there: _worktree_inprogress_op resolves
the in-progress operation from git's own state files (am/rebase/merge/
cherry-pick/revert), _worktree_has_unmerged spots a bare conflicted index,
and _abort_worktree_op runs the matching --abort, falling back to git reset
--merge for an unmergeable index.

Fixes: 089665dbb6ba ("review-tui: resolve take->merge conflicts in place")
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/__init__.py                 | 66 ++++++++++++++++++++++++++++++++++++++
 src/b4/review_tui/_tracking_app.py | 42 +++++++++++++++++++++++-
 2 files changed, 107 insertions(+), 1 deletion(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index d9e3bff..d7b41ee 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -5727,6 +5727,72 @@ def _worktree_merge_in_progress(worktree: str) -> bool:
     return os.path.exists(os.path.join(gitdir.strip(), 'MERGE_HEAD'))
 
 
+def _worktree_inprogress_op(worktree: str) -> Optional[str]:
+    """Return the git operation mid-flight in *worktree*, or ``None``.
+
+    One of ``'am'``, ``'rebase'``, ``'merge'``, ``'cherry-pick'`` or
+    ``'revert'`` -- mirroring how git-status decides which "in the middle of"
+    banner to show. State lives under the per-worktree git dir (resolved via
+    ``--absolute-git-dir`` so linked and throwaway worktrees work too):
+    ``rebase-apply/`` is shared by ``git am`` and ``git rebase --apply``, told
+    apart by the ``applying`` marker; ``rebase-merge/`` is the rebase merge
+    backend; the rest are recorded as pseudo-ref files.
+    """
+    ecode, gitdir = git_run_command(worktree, ['rev-parse', '--absolute-git-dir'])
+    if ecode != 0:
+        return None
+    gd = gitdir.strip()
+    if os.path.isdir(os.path.join(gd, 'rebase-apply')):
+        applying = os.path.exists(os.path.join(gd, 'rebase-apply', 'applying'))
+        return 'am' if applying else 'rebase'
+    if os.path.isdir(os.path.join(gd, 'rebase-merge')):
+        return 'rebase'
+    for marker, op in (
+        ('MERGE_HEAD', 'merge'),
+        ('CHERRY_PICK_HEAD', 'cherry-pick'),
+        ('REVERT_HEAD', 'revert'),
+    ):
+        if os.path.exists(os.path.join(gd, marker)):
+            return op
+    return None
+
+
+def _worktree_has_unmerged(worktree: str) -> bool:
+    """Return whether *worktree*'s index carries unmerged (conflict) entries.
+
+    This is the state git leaves when it refuses to *start* an operation on top
+    of a conflicted index (e.g. ``git merge`` reporting "you have unmerged
+    files"): there is no in-progress op to ``--abort``, only stage>0 entries.
+    """
+    ecode, out = git_run_command(worktree, ['ls-files', '--unmerged'])
+    return ecode == 0 and bool(out.strip())
+
+
+def _abort_worktree_op(worktree: str) -> Optional[str]:
+    """Abort whatever git operation is mid-flight in *worktree*, restoring it.
+
+    Detects the in-progress op (see :func:`_worktree_inprogress_op`) and runs
+    the matching ``--abort``. When nothing is in progress but the index still
+    carries unmerged entries -- which no ``--abort`` can clear -- falls back to
+    ``git reset --merge`` to drop them. Returns what it did: the op aborted
+    ('am'/'rebase'/'merge'/'cherry-pick'/'revert'), ``'reset'`` for the
+    unmerged-index fallback, or ``None`` if there was nothing to clean up.
+
+    WARNING: this discards the in-progress operation and any half-done conflict
+    resolution in it. Only call it on a worktree whose state is b4's to throw
+    away -- its own incomplete take, or a throwaway worktree -- never on
+    pre-existing state a user may own.
+    """
+    op = _worktree_inprogress_op(worktree)
+    if op is not None:
+        git_run_command(worktree, [op, '--abort'], logstderr=True, rundir=worktree)
+        return op
+    if _worktree_has_unmerged(worktree):
+        git_run_command(worktree, ['reset', '--merge'], logstderr=True, rundir=worktree)
+        return 'reset'
+    return None
+
+
 def _fetch_and_drop_am_worktree(
     dest: str, gwt: str, origin: Optional[str] = None
 ) -> bool:
diff --git a/src/b4/review_tui/_tracking_app.py b/src/b4/review_tui/_tracking_app.py
index 0c00917..7e7f142 100644
--- a/src/b4/review_tui/_tracking_app.py
+++ b/src/b4/review_tui/_tracking_app.py
@@ -244,6 +244,36 @@ def _take_worktree(
             yield None
             return
         work_dir = temp_wt
+    else:
+        # The target is checked out in a real worktree. If it is mid-op or its
+        # index is conflicted -- an earlier take the user walked away from, a
+        # crash, or their own unfinished am/merge -- a take's git-am/git-merge
+        # would fail cryptically on top of it (and "git merge --abort" cannot
+        # clear a bare unmerged index). Refuse up front with the fix rather than
+        # poison the take; the state may be the user's own, so we never discard
+        # it for them.
+        stuck = b4._worktree_inprogress_op(work_dir)
+        if stuck is None and b4._worktree_has_unmerged(work_dir):
+            logger.critical(
+                'Target worktree %s has a conflicted index (unmerged files).',
+                work_dir,
+            )
+            logger.critical(
+                'Resolve them, or run "git reset --merge" there, then retry.'
+            )
+            _wait_for_enter()
+            yield None
+            return
+        if stuck is not None:
+            logger.critical(
+                'Target worktree %s has an unfinished git-%s.', work_dir, stuck
+            )
+            logger.critical(
+                'Finish it, or run "git %s --abort" there, then retry.', stuck
+            )
+            _wait_for_enter()
+            yield None
+            return
 
     handle = _TakeWorktree(work_dir, is_temp=temp_wt is not None)
     try:
@@ -280,9 +310,19 @@ def _resolve_worktree_take_conflict(
     if in_progress(wt.path):
         logger.warning('Conflict resolution incomplete')
         if wt.is_temp:
+            # A throwaway worktree is isolated, so an unfinished op poisons
+            # nothing -- keep it for the user to finish or abort by hand (the
+            # next take force-removes it regardless).
             wt.keep()
             logger.warning('Finish or abort it in: %s', wt.path)
-        logger.warning('Run "git %s --abort" to clean up', op)
+            logger.warning('Run "git %s --abort" to clean up', op)
+        else:
+            # A real checkout must never be left mid-op: the unmerged index
+            # breaks the user's own git work and makes the next take fail
+            # cryptically on top of it (and "git merge --abort" cannot clear a
+            # bare unmerged index). Abort what we started.
+            if b4._abort_worktree_op(wt.path):
+                logger.warning('Aborted incomplete %s in %s', op, wt.path)
         return False
     ecode, current_head = b4.git_run_command(
         wt.path, ['rev-parse', 'HEAD'], logstderr=True

-- 
2.53.0

