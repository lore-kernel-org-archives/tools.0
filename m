Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF592727EB
	for <tools@linux.kernel.org>; Tue, 23 Jun 2026 16:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782230498; cv=none; b=sw5TVNyurC4Mdzo1/FW9FlX7KAakL3aCVsPwdr8ZLNazJndoR4clNeaMVb3wCS40YnbdCqFZwE9nSMfasNqzo3fwWo+z1i967Lp3nftdK7lP4WPH3FFndSNtECgEZ5z93AttHOYfnNt9SjO/bd1zSW8VZ6RtnosTSyxGc4ymrhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782230498; c=relaxed/simple;
	bh=5BuIUJREaV6IHH0Cp68UOhHGZLPJLZ02GMdSK5beB9k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GdyHOi0MI6EeTi2JiAauiffTsjNlGlZpjiz6PDDceJeBoYh+vE/Q+YUznG/LK1V+K7GM3biE7mbiUD1i8RJZK5oM7P9+uSg7wa8aslRqwu3miMhSHIedoAbH1kjWgMdGo+/ETWvC33fosD/a+j7CTg2n+iSP5HE5ReZxo6Y5FJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JpsAVBab; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JpsAVBab"
Received: by smtp.kernel.org (Postfix)
	id DA6401F00A3A; Tue, 23 Jun 2026 16:01:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 115411F000E9;
	Tue, 23 Jun 2026 16:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782230496;
	bh=+HBT0LQKYQ4jCT8tb6USrBTNvlZHqNfFVmJlez3wR5E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=JpsAVBabThKQHencVRAh8kA8Y+8ywxGUa2PJUonEhNhaI90SRWMKAlNiI3+xZOQ/i
	 o6JHokGvEgdG/p1KzfMrHHvgrR9u1FOaqRpP11OLLvUz7maPfrBIPO/ZhOqJSNXqE7
	 Dqt9Itel/lcYpHMSVbyYXHXKDQ3J5y0YB01ZqsopqRw+SLy8YjktGA2wc4gtY1Hrky
	 e8oGXIYkwkQ6TGVRbSQHYyf8XLQtC7w1zVNCtAE0WYu72KS0DFrJumjmqETNzSKFBy
	 OZMiLZdaY/PqWFcbURjmNTKkpMmwMg6Lvp9Z5MvEwq98MP2hApdxbZZHel9INZ0grl
	 U7yyzm3EtaSWA==
From: Christian Brauner <brauner@kernel.org>
Date: Tue, 23 Jun 2026 18:01:29 +0200
Subject: [PATCH b4 1/6] review-tui: factor cross-worktree take setup into
 _take_worktree
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-20260623-review-tui-take-am-worktree-v1-1-e8a2140a287e@kernel.org>
References: <20260623-20260623-review-tui-take-am-worktree-v1-0-e8a2140a287e@kernel.org>
In-Reply-To: <20260623-20260623-review-tui-take-am-worktree-v1-0-e8a2140a287e@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-50a61
X-Developer-Signature: v=1; a=openpgp-sha256; l=8258; i=brauner@kernel.org;
 h=from:subject:message-id; bh=5BuIUJREaV6IHH0Cp68UOhHGZLPJLZ02GMdSK5beB9k=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWRZrb0XMcG1PmbClBd25fGLL8gum97iyZNmrLkvXqXXp
 efU3z+dHaUsDGJcDLJiiiwO7Sbhcst5KjYbZWrAzGFlAhnCwMUpABMRiGNkaK29d9bhjGy+rHP4
 M7OaKsbUTqHHJW5XvD/e4e33l55swMjQd+KNscqFFMurpqkdrdy3Nws+/2n7JKx3dtiUjbxx3Ow
 cAA==
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

The take->merge path resolves which worktree to apply a series in (the one
already holding the target branch, or a throwaway b4-take-worktree when it
is checked out nowhere), clears any stale throwaway first, and removes its
own on the way out. take->am needs the exact same dance, so pull it out of
_do_take_merge into a _take_worktree() context manager plus a small
_TakeWorktree handle (path/is_temp/keep).

No functional change: _do_take_merge behaves as before -- it never marks
the worktree keep(), so a throwaway is always removed -- and the take->am
path is converted in the next commit.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/review_tui/_tracking_app.py | 126 ++++++++++++++++++++++++-------------
 1 file changed, 81 insertions(+), 45 deletions(-)

diff --git a/src/b4/review_tui/_tracking_app.py b/src/b4/review_tui/_tracking_app.py
index e2bfd9a..7af469f 100644
--- a/src/b4/review_tui/_tracking_app.py
+++ b/src/b4/review_tui/_tracking_app.py
@@ -5,6 +5,7 @@
 #
 __author__ = 'Konstantin Ryabitsev <konstantin@linuxfoundation.org>'
 
+import contextlib
 import copy
 import datetime
 import email.message
@@ -21,7 +22,7 @@ import sqlite3
 import subprocess
 import sys
 from string import Template
-from typing import Any, Dict, List, Literal, Optional, Tuple
+from typing import Any, Dict, Iterator, List, Literal, Optional, Tuple
 
 from rich.text import Text as RichText
 from textual.app import App, ComposeResult
@@ -178,6 +179,80 @@ def _worktree_for_branch(topdir: str, branch: str) -> Optional[str]:
     return out.strip() or None
 
 
+class _TakeWorktree:
+    """Handle for the worktree a take runs in (see :func:`_take_worktree`)."""
+
+    def __init__(self, path: str, is_temp: bool) -> None:
+        self.path = path
+        self.is_temp = is_temp
+        self._keep = False
+
+    def keep(self) -> None:
+        """Leave a throwaway worktree in place on exit (e.g. unfinished am)."""
+        self._keep = True
+
+
+@contextlib.contextmanager
+def _take_worktree(
+    topdir: str, target_branch: str
+) -> Iterator[Optional[_TakeWorktree]]:
+    """Yield the worktree in which to apply a take onto *target_branch*.
+
+    The review TUI may be driven from a different worktree than the one the
+    series is applied to, and the target may even be checked out elsewhere, so
+    the take must run wherever the branch lives rather than in the current
+    checkout. Runs in whichever worktree already holds *target_branch*; when it
+    is checked out nowhere, a throwaway ``b4-take-worktree`` is created and
+    removed on exit unless the caller marks it :meth:`~_TakeWorktree.keep`.
+    Yields ``None`` (after logging and waiting) when no worktree can be
+    established, so the caller can simply return.
+    """
+    # A throwaway worktree from a previously interrupted take may still be
+    # registered -- possibly even holding target_branch, in which case the
+    # resolution below would latch onto it and never clean it up. Remove any
+    # such leftover up front; this also clears a bare leftover directory that a
+    # plain `worktree remove` would choke on.
+    common_dir = b4.git_get_common_dir(topdir)
+    if common_dir:
+        leftover = os.path.join(common_dir, 'b4-take-worktree')
+        if os.path.exists(leftover):
+            b4.git_run_command(topdir, ['worktree', 'remove', '--force', leftover])
+            if os.path.isdir(leftover):
+                shutil.rmtree(leftover, ignore_errors=True)
+        # Prune unconditionally: a directory deleted out-of-band leaves only a
+        # registration that _worktree_for_branch would still resolve to a dead
+        # path.
+        b4.git_run_command(topdir, ['worktree', 'prune'])
+
+    work_dir = _worktree_for_branch(topdir, target_branch)
+    temp_wt: Optional[str] = None
+    if work_dir is None:
+        if not common_dir:
+            logger.critical('Unable to determine git common dir')
+            _wait_for_enter()
+            yield None
+            return
+        temp_wt = os.path.join(common_dir, 'b4-take-worktree')
+        ecode, out = b4.git_run_command(
+            topdir, ['worktree', 'add', temp_wt, target_branch], logstderr=True
+        )
+        if ecode != 0:
+            logger.critical(
+                'Could not create a worktree for %s: %s', target_branch, out.strip()
+            )
+            _wait_for_enter()
+            yield None
+            return
+        work_dir = temp_wt
+
+    handle = _TakeWorktree(work_dir, is_temp=temp_wt is not None)
+    try:
+        yield handle
+    finally:
+        if temp_wt and not handle._keep:
+            b4.git_run_command(topdir, ['worktree', 'remove', '--force', temp_wt])
+
+
 def _resolve_worktree_am_conflict(topdir: str, cex: 'b4.AmConflictError') -> bool:
     """Handle an AmConflictError by dropping the user into a shell.
 
@@ -2690,48 +2765,12 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
                 return
             base_commit = out.strip()
 
-        # A throwaway worktree from a previously interrupted take may still be
-        # registered -- possibly even holding target_branch, in which case the
-        # resolution below would latch onto it and then never clean it up
-        # (temp_wt stays None, so the finally skips removal). Remove any such
-        # leftover up front. This also clears a bare leftover directory that a
-        # plain `worktree remove` would choke on.
-        common_dir = b4.git_get_common_dir(topdir)
-        temp_wt: Optional[str] = None
-        if common_dir:
-            leftover = os.path.join(common_dir, 'b4-take-worktree')
-            if os.path.exists(leftover):
-                b4.git_run_command(topdir, ['worktree', 'remove', '--force', leftover])
-                b4.git_run_command(topdir, ['worktree', 'prune'])
-                if os.path.isdir(leftover):
-                    shutil.rmtree(leftover, ignore_errors=True)
-
-        # Run the merge in whichever worktree holds the target branch -- the
-        # review TUI may be driven from a different worktree than the one the
-        # series is being applied to, and the target may even be checked out
-        # elsewhere. If it is not checked out anywhere, use a throwaway
-        # worktree, so the current checkout is never disturbed.
-        merge_dir = _worktree_for_branch(topdir, target_branch)
-        if merge_dir is None:
-            if not common_dir:
-                logger.critical('Unable to determine git common dir')
-                _wait_for_enter()
-                return
-            temp_wt = os.path.join(common_dir, 'b4-take-worktree')
-            ecode, out = b4.git_run_command(
-                topdir, ['worktree', 'add', temp_wt, target_branch], logstderr=True
-            )
-            if ecode != 0:
-                logger.critical(
-                    'Could not create a worktree for %s: %s',
-                    target_branch,
-                    out.strip(),
-                )
-                _wait_for_enter()
+        # Merge in whichever worktree holds the target branch (or a throwaway
+        # one), so the current checkout is never disturbed.
+        with _take_worktree(topdir, target_branch) as wt:
+            if wt is None:
                 return
-            merge_dir = temp_wt
-
-        try:
+            merge_dir = wt.path
             # Apply trailer-amended patches in a sparse worktree and fetch into
             # the target worktree's FETCH_HEAD (which is per-worktree), so the
             # merge below sees them and each commit carries its trailers.
@@ -2836,9 +2875,6 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
 
             self._finalize_take(topdir, target_branch, change_id, t_series, new_status)
             _wait_for_enter()
-        finally:
-            if temp_wt:
-                b4.git_run_command(topdir, ['worktree', 'remove', '--force', temp_wt])
 
     def _finalize_take(
         self,

-- 
2.53.0

