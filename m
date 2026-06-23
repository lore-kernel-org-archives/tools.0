Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11E43CF692
	for <tools@linux.kernel.org>; Tue, 23 Jun 2026 23:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782258108; cv=none; b=Z8zNpI3FFaN/Ja4K4OPqkYgoGqe5GEmRJSznb9DVjQkG6ubfLjdnj1tWMmD5vKWh/P3dY5dD9c1C2t102h4mw5FoWQPqb2e5IVcy2FZ2uDDJVH6+YpVRBpMGw1h/VSKeWcOBP/ma9q86z0iKUhMIVsFsJ6FlaniBkFugzj0nU6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782258108; c=relaxed/simple;
	bh=F/zXBS03hoDvCOUoMV0QBPaMlf3T2pmQ6JrXeMeiUWw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N1QgqR4JHK9sj3KiZHXSkvA0td+16Pl8C/OFWAVVRdhv5Fyrgk8grM6RtB8A/3RHlB502Nu20JKtepAryrQ1i/9TnwBYF95lvs3F4sN/OUR/mTycu6qGg5logg3zYAiE4yDSix49qQ9QJoxQ/H3ezZk2Nu5wAepAO3Gk42WwxUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JuJBMPYJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JuJBMPYJ"
Received: by smtp.kernel.org (Postfix)
	id A05291F00A3A; Tue, 23 Jun 2026 23:41:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91FCE1F000E9;
	Tue, 23 Jun 2026 23:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782258106;
	bh=6OjzQOfNv+VlLYaNZ6xo0avW9VBlJPf3oFlZVAr3TTw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=JuJBMPYJq9GRShoH0TCWN6OY1LOMSKRQCBrHjRovLUDRhAjEHkUqikB/Z3+qC2twH
	 fGnEQ3mEFnA5REwPGSWsI68DZLMNbg3uZURS/05vkaSDQoHxCsKIWiH5DvEbrqrxAB
	 Qn1aGmks/m9KGZkHroZ+KAMB9yizlUXQ/iyhHcYEIqOX7kNkHn80ir+mrMAF9yz7oU
	 iu3nX1wAk2kvBcK8wIFsBsWFVzd4LQEu/CuZx+tF7h1zBDI6gtIfBBsLlwgi+eQemz
	 JYEMF/ROYCSQzhyJdCrueIxSVKQ6vAT0aY5zU207y+bMmAeOnKMMxbj6gHFjo7DlrF
	 eCx3rmDXZBxVA==
From: Christian Brauner <brauner@kernel.org>
Date: Wed, 24 Jun 2026 01:41:36 +0200
Subject: [PATCH b4 1/5] review-tui: lift worktree am-conflict helpers into
 b4 core
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-shazam-resolve-native-am-v1-1-91f5e5678998@kernel.org>
References: <20260624-shazam-resolve-native-am-v1-0-91f5e5678998@kernel.org>
In-Reply-To: <20260624-shazam-resolve-native-am-v1-0-91f5e5678998@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-6067f
X-Developer-Signature: v=1; a=openpgp-sha256; l=9492; i=brauner@kernel.org;
 h=from:subject:message-id; bh=F/zXBS03hoDvCOUoMV0QBPaMlf3T2pmQ6JrXeMeiUWw=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWRZS27fNnNh932JdYvNjcXVDqx7/itl/5qtfqtrsu3eH
 TKO2yTr1FHKwiDGxSArpsji0G4SLrecp2KzUaYGzBxWJpAhDFycAjCROg5Ghnv84b82fXwZfLSS
 M+bJvkvrkrYUbTukK3MxceFsB6fnJ2cwMiwsdbhUnSAu43Lm8HZGXZfQG7/vnnsjVZ7VUbA2fpt
 RFx8A
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

The review TUI's take->am/->merge conflict resolution carries a few small
pieces of git-worktree plumbing: detecting an in-progress git am
(_worktree_rebase_apply_dir) or merge (_worktree_merge_in_progress), and
fetching a finished git am out of a throwaway worktree before dropping it.

Move the two detection helpers into b4 core (next to git_fetch_am_into_repo
and _rewrite_fetch_head_origin) and add _fetch_and_drop_am_worktree(),
which fetches the worktree HEAD into the destination's FETCH_HEAD --
anchored via rundir, optionally rewriting the origin -- and removes the
worktree. _resolve_worktree_am_conflict() now uses it instead of an inline
fetch/remove; that also anchors the fetch's FETCH_HEAD via rundir (matching
git_fetch_am_into_repo and the clean path) rather than relying on the
process cwd.

No behavioral change intended. This is groundwork: the next commit teaches
b4 shazam --resolve to resolve conflicts the same way, reusing these
helpers instead of growing its own copies.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/__init__.py                 | 52 ++++++++++++++++++++++++++++++++++++++
 src/b4/review_tui/_tracking_app.py | 46 +++++----------------------------
 src/tests/test_tui_tracking.py     |  2 +-
 3 files changed, 59 insertions(+), 41 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 2806656..be41da1 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -5699,6 +5699,58 @@ def _rewrite_fetch_head_origin(topdir: str, old_origin: str, new_origin: str) ->
             fhh.write(new_contents)
 
 
+def _worktree_rebase_apply_dir(worktree: str) -> Optional[str]:
+    """Return *worktree*'s in-progress ``git am`` state dir, or ``None``.
+
+    ``rebase-apply`` lives under the per-worktree git dir, not the shared
+    ``.git``, so resolve it via ``--absolute-git-dir`` to handle linked and
+    throwaway worktrees too.
+    """
+    ecode, gitdir = git_run_command(worktree, ['rev-parse', '--absolute-git-dir'])
+    if ecode != 0:
+        return None
+    rebase_apply = os.path.join(gitdir.strip(), 'rebase-apply')
+    return rebase_apply if os.path.isdir(rebase_apply) else None
+
+
+def _worktree_merge_in_progress(worktree: str) -> bool:
+    """Return whether *worktree* has a conflicted ``git merge`` in progress.
+
+    ``MERGE_HEAD`` lives under the per-worktree git dir, not the shared
+    ``.git``, so resolve it via ``--absolute-git-dir`` to handle linked and
+    throwaway worktrees too.
+    """
+    ecode, gitdir = git_run_command(worktree, ['rev-parse', '--absolute-git-dir'])
+    if ecode != 0:
+        return False
+    return os.path.exists(os.path.join(gitdir.strip(), 'MERGE_HEAD'))
+
+
+def _fetch_and_drop_am_worktree(
+    dest: str, gwt: str, origin: Optional[str] = None
+) -> bool:
+    """Fetch *gwt*'s HEAD into *dest*'s FETCH_HEAD, then remove the worktree.
+
+    Shared by the conflict-resolution paths in ``b4 shazam`` and the review
+    TUI: once the user has finished the ``git am`` in the throwaway worktree
+    *gwt*, pull the result into *dest*'s FETCH_HEAD so it can be merged, then
+    tear the worktree down. The fetch is anchored to *dest* via ``rundir`` so
+    FETCH_HEAD lands in the worktree the caller merges in (see
+    git_fetch_am_into_repo). When *origin* is given, rewrite FETCH_HEAD so the
+    merge message names the series origin instead of the worktree path. Returns
+    False (after still removing the worktree) if the fetch failed.
+    """
+    ecode, out = git_run_command(dest, ['fetch', gwt], logstderr=True, rundir=dest)
+    if ecode == 0 and origin:
+        _rewrite_fetch_head_origin(dest, gwt, origin)
+    git_run_command(dest, ['worktree', 'remove', '--force', gwt])
+    if ecode > 0:
+        logger.critical('Unable to fetch from the worktree')
+        logger.critical(out.strip())
+        return False
+    return True
+
+
 def git_fetch_am_into_repo(
     gitdir: Optional[str],
     ambytes: bytes,
diff --git a/src/b4/review_tui/_tracking_app.py b/src/b4/review_tui/_tracking_app.py
index d184680..9b3ad65 100644
--- a/src/b4/review_tui/_tracking_app.py
+++ b/src/b4/review_tui/_tracking_app.py
@@ -253,33 +253,6 @@ def _take_worktree(
             b4.git_run_command(topdir, ['worktree', 'remove', '--force', temp_wt])
 
 
-def _worktree_rebase_apply_dir(worktree: str) -> Optional[str]:
-    """Return *worktree*'s in-progress ``git am`` state dir, or ``None``.
-
-    ``rebase-apply`` lives under the per-worktree git dir, not the shared
-    ``.git``, so resolve it via ``--absolute-git-dir`` to handle linked and
-    throwaway worktrees too.
-    """
-    ecode, gitdir = b4.git_run_command(worktree, ['rev-parse', '--absolute-git-dir'])
-    if ecode != 0:
-        return None
-    rebase_apply = os.path.join(gitdir.strip(), 'rebase-apply')
-    return rebase_apply if os.path.isdir(rebase_apply) else None
-
-
-def _worktree_merge_in_progress(worktree: str) -> bool:
-    """Return whether *worktree* has a conflicted ``git merge`` in progress.
-
-    ``MERGE_HEAD`` lives under the per-worktree git dir, not the shared
-    ``.git``, so resolve it via ``--absolute-git-dir`` to handle linked and
-    throwaway worktrees too.
-    """
-    ecode, gitdir = b4.git_run_command(worktree, ['rev-parse', '--absolute-git-dir'])
-    if ecode != 0:
-        return False
-    return os.path.exists(os.path.join(gitdir.strip(), 'MERGE_HEAD'))
-
-
 def _resolve_worktree_am_conflict(topdir: str, cex: 'b4.AmConflictError') -> bool:
     """Handle an AmConflictError by dropping the user into a shell.
 
@@ -316,7 +289,7 @@ def _resolve_worktree_am_conflict(topdir: str, cex: 'b4.AmConflictError') -> boo
     )
     _suspend_to_shell(hint='b4 conflict', cwd=cex.worktree_path)
     # Check if am is still in progress (user exited without finishing)
-    if _worktree_rebase_apply_dir(cex.worktree_path):
+    if b4._worktree_rebase_apply_dir(cex.worktree_path):
         logger.warning('Conflict resolution incomplete, aborting')
         b4.git_run_command(topdir, ['worktree', 'remove', '--force', cex.worktree_path])
         return False
@@ -331,16 +304,9 @@ def _resolve_worktree_am_conflict(topdir: str, cex: 'b4.AmConflictError') -> boo
         logger.warning('Conflict resolution aborted')
         b4.git_run_command(topdir, ['worktree', 'remove', '--force', cex.worktree_path])
         return False
-    # am completed -- fetch result into FETCH_HEAD
+    # am completed -- fetch result into FETCH_HEAD and drop the worktree
     logger.info('Conflict resolved, fetching result...')
-    ecode, _out = b4.git_run_command(
-        topdir, ['fetch', cex.worktree_path], logstderr=True
-    )
-    b4.git_run_command(topdir, ['worktree', 'remove', '--force', cex.worktree_path])
-    if ecode > 0:
-        logger.critical('Unable to fetch from resolved worktree')
-        return False
-    return True
+    return b4._fetch_and_drop_am_worktree(topdir, cex.worktree_path)
 
 
 def _resolve_worktree_take_conflict(
@@ -2909,7 +2875,7 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
                 # (mirrors the git-am path above and "b4 shazam"). Anything
                 # else (e.g. a dirty worktree) leaves no merge to resolve, so
                 # abort and bail as before.
-                if not _worktree_merge_in_progress(merge_dir):
+                if not b4._worktree_merge_in_progress(merge_dir):
                     logger.critical(
                         'Merge failed%s', f': {out.strip()}' if out.strip() else ''
                     )
@@ -2933,7 +2899,7 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
                 )
                 pre_merge_head = pre_merge_head.strip() if ecode == 0 else ''
                 if not _resolve_worktree_take_conflict(
-                    wt, 'merge', pre_merge_head, _worktree_merge_in_progress
+                    wt, 'merge', pre_merge_head, b4._worktree_merge_in_progress
                 ):
                     _wait_for_enter()
                     return
@@ -3202,7 +3168,7 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
                 logger.critical('git-am failed:')
                 logger.critical(out.strip())
                 if not _resolve_worktree_take_conflict(
-                    wt, 'am', pre_am_head, _worktree_rebase_apply_dir
+                    wt, 'am', pre_am_head, b4._worktree_rebase_apply_dir
                 ):
                     _wait_for_enter()
                     return
diff --git a/src/tests/test_tui_tracking.py b/src/tests/test_tui_tracking.py
index b7d543b..0c716b7 100644
--- a/src/tests/test_tui_tracking.py
+++ b/src/tests/test_tui_tracking.py
@@ -24,6 +24,7 @@ from textual.widgets import Input, ListView, Static
 import b4
 import b4.review
 import b4.review.tracking as tracking
+from b4 import _worktree_merge_in_progress
 from b4.review_tui._modals import (
     ActionItem,
     ActionScreen,
@@ -43,7 +44,6 @@ from b4.review_tui._tracking_app import (
     _take_worktree,
     _TakeWorktree,
     _worktree_for_branch,
-    _worktree_merge_in_progress,
 )
 
 # ---------------------------------------------------------------------------

-- 
2.53.0

