Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092C03A4F47
	for <tools@linux.kernel.org>; Tue, 23 Jun 2026 20:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782246867; cv=none; b=Akl3MskCmmJYsfeFQEujyiarlOVXHlF6Ls4wvXqkqUleYmxUXrnBqhTImMjHGZJb0XfAxS2/aT7SKZDcppYOMDKgk4jv34iof8ywhUALBYad/LaxV/SCkQqWUBd+NSaggiduyrU/gCfS/1ddgssUqviO0lA0JueMoxen+tQeeRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782246867; c=relaxed/simple;
	bh=0HFfY7MNn/IKCMV5fwTYfpT2G47Q7MXqukYq+41KQ+s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nVBdel+nokrSrlxZnk4yM8b2s5JxlgEsXMz6d4eJjiU5JGu+tmYPSwSLTcroYGmTd5Shb1UJdoK3Oo7oew+hx5B6jRxj9U6tFmwEHaoV+QKV/JloK0X7IG6OOIjFZJ1i0nCmm8DCrUKiZPS43p31F3v2bbsVlxT5HX5ca8sRELc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i6VJiBzf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i6VJiBzf"
Received: by smtp.kernel.org (Postfix)
	id CF5911F00A3A; Tue, 23 Jun 2026 20:34:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7C301F000E9;
	Tue, 23 Jun 2026 20:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782246865;
	bh=CYZEq8xKY95BeZm3cEBvvEfgHWU1EgFMncurnVoq2RY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=i6VJiBzfioAH3G7oyYlFo6sbiUk6CcbapMhw5W6HCw0rNroVci2PFw6yw4uItrqLD
	 yhSpT34jHnhdtxxUqZIx+6t2oLLwg6NAP1zKY5O81YN+gTBJPIgl5fh74qdpVHwo2g
	 uIAzs/Mk20XSdsGD7siI3NnaS1gIZDak58P/xsPlEdk0RvjgM4xZorVwjUweKqBltW
	 N4DfqVBn8YEaNOuaXCE+9iZAefA/O6Wb5WA5y7RYibU1P+Jpatae38al7g8VQ+iRe4
	 +C1QandPgvJzY6N10P54j3qc0IHtJcyqYKPRerNBXop4pbUwxfko7J0C8cy3XSLYJG
	 vJgr2rAgzirWA==
From: Christian Brauner <brauner@kernel.org>
Date: Tue, 23 Jun 2026 22:34:17 +0200
Subject: [PATCH b4 v2 1/6] review-tui: factor cross-worktree take setup
 into _take_worktree
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-20260623-review-tui-take-am-worktree-v2-1-2cbbab5d5441@kernel.org>
References: <20260623-20260623-review-tui-take-am-worktree-v2-0-2cbbab5d5441@kernel.org>
In-Reply-To: <20260623-20260623-review-tui-take-am-worktree-v2-0-2cbbab5d5441@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-e850d
X-Developer-Signature: v=1; a=openpgp-sha256; l=8272; i=brauner@kernel.org;
 h=from:subject:message-id; bh=0HFfY7MNn/IKCMV5fwTYfpT2G47Q7MXqukYq+41KQ+s=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWRZvT2355fqg0YBn9Xvruf7XN20ovRfhJTRAYaVqjveJ
 tvvv8a8taOUhUGMi0FWTJHFod0kXG45T8Vmo0wNmDmsTCBDGLg4BWAilxYwMpzMal/23+luUeXk
 DrVUyzW5WacLP5i/+/DhgNKtHV4pn5Yz/C+x5vn3K1WxuXzjjCiFaqnMLIWZh4z2fPguuiJ4lmR
 oJRsA
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
index e2bfd9a..c910c36 100644
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
+from typing import Any, Dict, Generator, List, Literal, Optional, Tuple
 
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
+) -> Generator[Optional[_TakeWorktree], None, None]:
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

