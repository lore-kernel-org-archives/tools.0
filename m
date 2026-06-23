Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBFF30B514
	for <tools@linux.kernel.org>; Tue, 23 Jun 2026 16:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782230503; cv=none; b=kx+FAgNe30R64OzQ3yPMF/kU4t8o16/a9pGG2DhKzwsWJ+rr+Lr9FcLHbVYYjVmoKRSA4S8pwVzWea7v2ZR30OT7UGardVjBVZ7s5GU8CDLZ4vHHqW17QuW8+D9BGZ86kYty7aFgoZSkFY4+iJEapk9ufNtsupmc3esSr7cgm48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782230503; c=relaxed/simple;
	bh=06UHCE10bI/4FPo8FFyXNhdmX/tgyp+SIevK0nx5KbI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kl3CEByoQ1oIRC8WiuEM/m9cZQO24VZyvLBMw3cM6dOBBpN/h7DbBFJMmxvd8omlLww79yJ9wfC9WwzLZhgh27ANM+MIg/TuAVYFeAiCgsdqIGhYSGTepfVYD8KqI0QKPscJA8Ae4CSMFNVeMokqY/9MOfNaHsrv2Luu3MOWYjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dGLNy/ql; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dGLNy/ql"
Received: by smtp.kernel.org (Postfix)
	id 091971F00A3D; Tue, 23 Jun 2026 16:01:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BABA1F000E9;
	Tue, 23 Jun 2026 16:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782230501;
	bh=E3epGrqCHTJgTenpqhjVEWC3e3vmSGiB1DbFNqMyFHE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=dGLNy/qlvxdRy3dqmXte54JFR/cSgsumd6s/cUbUg6hkegl0PgsyPT4c/M9M5xqCN
	 dcBzNYTi4VQvSia1wNitLoXZOHjjbqI8L8jJQXbrwodoQUtIvJrhxh+nQo6c0C9aD1
	 4mVtFk0PYMDIIRJzbJfBPSVwebFrD2WxIgCPFfiEZv+ticSWgrx2MbYX4ex/mYJ8bD
	 CYgcwX8YpgRS/ucok91pjOwhX2WzyWtZOKgPINU4NiNktmh4Lh8uMZSJzZl6j2a6Ay
	 ZDGr83dgAw8j0MM5ivOX7pI+Za05kAQgLTcZ9VUTNodp6Rep9kq2BKF61shEgeW4fu
	 wct2gr4LtZ4Fw==
From: Christian Brauner <brauner@kernel.org>
Date: Tue, 23 Jun 2026 18:01:33 +0200
Subject: [PATCH b4 5/6] review-tui: resolve take->merge conflicts in place
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-20260623-review-tui-take-am-worktree-v1-5-e8a2140a287e@kernel.org>
References: <20260623-20260623-review-tui-take-am-worktree-v1-0-e8a2140a287e@kernel.org>
In-Reply-To: <20260623-20260623-review-tui-take-am-worktree-v1-0-e8a2140a287e@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-50a61
X-Developer-Signature: v=1; a=openpgp-sha256; l=8402; i=brauner@kernel.org;
 h=from:subject:message-id; bh=06UHCE10bI/4FPo8FFyXNhdmX/tgyp+SIevK0nx5KbI=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWRZrb2X7ccz+Xzl2yPyPnOiVwqdK2i5KySxOyWfw0Lq3
 6WWnMQDHaUsDGJcDLJiiiwO7Sbhcst5KjYbZWrAzGFlAhnCwMUpABOp3crwV6p9ZV2egS3ntwV5
 16a6zRJMqXtz4csb8VjXxBW5uWdzAhkZFvvc/2R/7du/yaciQ14uPtp4aSXnfp7Ac5nsq6e6PdS
 8xgwA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

When a take via git-merge hit a conflict, b4 review aborted the merge and
discarded the take, forcing the user to start over. The git-am take path
already drops the user into a shell to finish (or abort) the conflict by
hand; do the same for merge, matching "b4 shazam".

On a merge failure, distinguish a real conflict (MERGE_HEAD present in the
target worktree) from any other failure (e.g. a dirty worktree, which
leaves no merge to resolve): only the former is handed to the user, the
latter still aborts and bails as before. A finished merge is told apart
from an abort by whether HEAD moved off the pre-merge tip.

Both take methods now share the same "drop to a shell, then check what the
user did" dance, so factor it into _resolve_worktree_take_conflict(),
parameterized by the git subcommand and an in-progress probe (rebase-apply
for am, MERGE_HEAD for merge), and route take->am through it too. An
unfinished throwaway worktree is kept so the user can complete it by hand.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/review_tui/_tracking_app.py | 118 ++++++++++++++++++++++++++++---------
 1 file changed, 90 insertions(+), 28 deletions(-)

diff --git a/src/b4/review_tui/_tracking_app.py b/src/b4/review_tui/_tracking_app.py
index 7d296f5..cb6b616 100644
--- a/src/b4/review_tui/_tracking_app.py
+++ b/src/b4/review_tui/_tracking_app.py
@@ -22,7 +22,7 @@ import sqlite3
 import subprocess
 import sys
 from string import Template
-from typing import Any, Dict, Iterator, List, Literal, Optional, Tuple
+from typing import Any, Callable, Dict, Iterator, List, Literal, Optional, Tuple
 
 from rich.text import Text as RichText
 from textual.app import App, ComposeResult
@@ -267,6 +267,19 @@ def _worktree_rebase_apply_dir(worktree: str) -> Optional[str]:
     return rebase_apply if os.path.isdir(rebase_apply) else None
 
 
+def _worktree_merge_in_progress(worktree: str) -> bool:
+    """Return whether *worktree* has a conflicted ``git merge`` in progress.
+
+    ``MERGE_HEAD`` lives under the per-worktree git dir, not the shared
+    ``.git``, so resolve it via ``--absolute-git-dir`` to handle linked and
+    throwaway worktrees too.
+    """
+    ecode, gitdir = b4.git_run_command(worktree, ['rev-parse', '--absolute-git-dir'])
+    if ecode != 0:
+        return False
+    return os.path.exists(os.path.join(gitdir.strip(), 'MERGE_HEAD'))
+
+
 def _resolve_worktree_am_conflict(topdir: str, cex: 'b4.AmConflictError') -> bool:
     """Handle an AmConflictError by dropping the user into a shell.
 
@@ -330,6 +343,46 @@ def _resolve_worktree_am_conflict(topdir: str, cex: 'b4.AmConflictError') -> boo
     return True
 
 
+def _resolve_worktree_take_conflict(
+    wt: '_TakeWorktree',
+    op: str,
+    pre_head: str,
+    in_progress: Callable[[str], object],
+) -> bool:
+    """Drop to a shell so the user can finish a conflicted take in *wt*.
+
+    *op* is the git subcommand (``am`` or ``merge``) shown in the hints.
+    *pre_head* is *wt*'s HEAD captured before *op* ran, used to tell a completed
+    operation (HEAD moved) from an abort (HEAD unchanged). *in_progress* reports
+    whether *op* is still mid-flight in the worktree.
+
+    Returns True when the user finished *op*, False when they aborted it or left
+    the shell without finishing. An unfinished throwaway worktree is kept so the
+    user can complete it by hand.
+    """
+    logger.info('You can resolve the conflict now.')
+    logger.info(
+        'Use "git %s --continue" after resolving, or "git %s --abort" to give up.',
+        op,
+        op,
+    )
+    _suspend_to_shell(hint='b4 conflict', cwd=wt.path)
+    if in_progress(wt.path):
+        logger.warning('Conflict resolution incomplete')
+        if wt.is_temp:
+            wt.keep()
+            logger.warning('Finish or abort it in: %s', wt.path)
+        logger.warning('Run "git %s --abort" to clean up', op)
+        return False
+    ecode, current_head = b4.git_run_command(
+        wt.path, ['rev-parse', 'HEAD'], logstderr=True
+    )
+    if ecode != 0 or current_head.strip() == pre_head:
+        logger.warning('Conflict resolution aborted')
+        return False
+    return True
+
+
 def _format_snooze_until(value: str) -> str:
     """Format a snoozed_until value for display.
 
@@ -2851,15 +2904,40 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
                 pass
 
             if ecode != 0:
-                logger.critical(
-                    'Merge failed%s', f': {out.strip()}' if out.strip() else ''
-                )
-                logger.critical('Aborting merge...')
-                b4.git_run_command(
-                    merge_dir, ['merge', '--abort'], logstderr=True, rundir=merge_dir
+                # A conflicted merge can be finished by hand; let the user
+                # resolve it in the worktree instead of discarding the take
+                # (mirrors the git-am path above and "b4 shazam"). Anything
+                # else (e.g. a dirty worktree) leaves no merge to resolve, so
+                # abort and bail as before.
+                if not _worktree_merge_in_progress(merge_dir):
+                    logger.critical(
+                        'Merge failed%s', f': {out.strip()}' if out.strip() else ''
+                    )
+                    logger.critical('Aborting merge...')
+                    b4.git_run_command(
+                        merge_dir,
+                        ['merge', '--abort'],
+                        logstderr=True,
+                        rundir=merge_dir,
+                    )
+                    _wait_for_enter()
+                    return
+                logger.critical('Merge conflict:')
+                if out.strip():
+                    logger.critical(out.strip())
+                # HEAD still points at the pre-merge tip while the conflicted
+                # merge sits uncommitted; capture it to tell a finished merge
+                # from an abort.
+                ecode, pre_merge_head = b4.git_run_command(
+                    merge_dir, ['rev-parse', 'HEAD']
                 )
-                _wait_for_enter()
-                return
+                pre_merge_head = pre_merge_head.strip() if ecode == 0 else ''
+                if not _resolve_worktree_take_conflict(
+                    wt, 'merge', pre_merge_head, _worktree_merge_in_progress
+                ):
+                    _wait_for_enter()
+                    return
+                logger.info('Conflict resolved, series merged.')
 
             logger.info('Merged %s into %s', review_branch, target_branch)
 
@@ -3123,25 +3201,9 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
             if ecode != 0:
                 logger.critical('git-am failed:')
                 logger.critical(out.strip())
-                logger.info('You can resolve the conflict now.')
-                logger.info(
-                    'Use "git am --continue" after resolving, or "git am --abort" to give up.'
-                )
-                _suspend_to_shell(hint='b4 conflict', cwd=am_dir)
-                if _worktree_rebase_apply_dir(am_dir):
-                    logger.warning('Conflict resolution incomplete')
-                    if wt.is_temp:
-                        wt.keep()
-                        logger.warning('Finish or abort it in: %s', am_dir)
-                    logger.warning('Run "git am --abort" to clean up')
-                    _wait_for_enter()
-                    return
-                # Check if am was aborted (HEAD unchanged)
-                ecode, current_head = b4.git_run_command(
-                    am_dir, ['rev-parse', 'HEAD'], logstderr=True
-                )
-                if ecode != 0 or current_head.strip() == pre_am_head:
-                    logger.warning('Conflict resolution aborted')
+                if not _resolve_worktree_take_conflict(
+                    wt, 'am', pre_am_head, _worktree_rebase_apply_dir
+                ):
                     _wait_for_enter()
                     return
                 logger.info('Conflict resolved, patches applied.')

-- 
2.53.0

