Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB3637E5CF
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 21:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785535165; cv=none; b=qrFDtYXWTFweWioqkYNJj99UD7N2SYTkqQGZ3LHKYZDH8+A8XDgtI4yk0Lu3eP+ARoEionwuWlO9YlhKjRb/33MM4x3Z1cUfcxho+KJAmxD1sw7vzWgOpabBFmBrF7w1ikAiB9hJ3cfCsulvKAIzc6709a1itbVQ00/X4FFQHTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785535165; c=relaxed/simple;
	bh=faEXJ2/UFMIAkBfqcw6Kz1N40+GViDJHKwCqpI8E7nY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AM7QFNZislZZtPmEJZtxO7MFiHDq+nc1cYXdokH4FrDM2Qp/SAnscR54brU2SeGvNCTdQ7gNFORdq0MARPeYY1X5MMZcQkKvdoFyk5qo8u5DUOIZk0vcshrSc5hazaA7ItlDC/a+ieLjPucmhMakM0SQkQ9rcVEbS2KEvCm3RpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dDjlg3nb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dDjlg3nb"
Received: by smtp.kernel.org (Postfix)
	id 170981F00ACA; Fri, 31 Jul 2026 21:59:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42E1A1F00AC4;
	Fri, 31 Jul 2026 21:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785535164;
	bh=rFrwi3Dwo3e3H2DLYF8BkT7M+CMcHmW6anGwqvPc13Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=dDjlg3nbFL7dAAITOW768d+2lRKNqMOIjSs/+PtwxvMHw0O51W3PH3qWepzxwl7nr
	 YXY06cR1Ka/aB0MDsqcJzUlM6CKUV1GjHuNNnq8YGaA6miywuG40yYgMHD6GXI3MTF
	 /4yqOzk9tcTnL3jett+QTTs4J62yPPpGdx7bV8A0qcUUx98Fw1oxOIhZBPLSu9r9Ei
	 V+Coc4v9CZvvjopV5DdXrMveWjXWbVHlTSgr44nk9rIRjL40KWzuYwSudKsNzk7ERH
	 dRhM0OwQoWQANf9VANDz+CwM8/f7KxCFf8fiZrr/94SQIM6cGq166VhhEsMqjoYDQB
	 goZvjwMpugFFQ==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 23:59:06 +0200
Subject: [PATCH b4 v2 25/44] review-tui: put HEAD back where it was when it
 was not on a branch
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v2-25-243fd19d322d@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=6944; i=brauner@kernel.org;
 h=from:subject:message-id; bh=faEXJ2/UFMIAkBfqcw6Kz1N40+GViDJHKwCqpI8E7nY=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlSs3pu8h11Tuu9hdP+Cy/oj8OV/2e2Nl7FVzb71qiJ
 7PrVk9TRykLgxgXg6yYIotDu0m43HKeis1GmRowc1iZQIYwcHEKwESun2RkOBV594FeqbGSl0H6
 FCGhDKfz9x019Ns6BRauS/3TtokzhJHhKav+wyApux+Ke23tmHlV37C2fBes7mbrOsWVx7dxlg4
 PAA==
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Every restore remembers where to go back to by branch name, and a
detached HEAD has none, so the restore was skipped and the user left
wherever b4 moved them. A detached HEAD is an ordinary place to start
a review from. Record the position instead: checkout arguments that
name the branch when there is one and the commit when there is not.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/__init__.py               | 17 +++++++++++++++++
 src/b4/review/_review.py         |  6 ++++--
 src/b4/review_tui/_entry.py      | 16 +++++++---------
 src/b4/review_tui/_review_app.py |  9 ++++++---
 4 files changed, 34 insertions(+), 14 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index a22c28d..2697da1 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -5246,6 +5246,23 @@ def git_get_current_branch(
     return mybranch
 
 
+def git_head_restore_args(gitdir: Optional[str] = None) -> List[str]:
+    """git-checkout args that put HEAD back where it is standing right now.
+
+    The branch name when HEAD is on one, the bare commit when it is not, so
+    that a caller which moves HEAD can undo that from a detached start too --
+    a branch name is not the only starting point worth going back to.  Empty
+    when HEAD cannot be read at all, e.g. on an unborn branch.
+    """
+    ecode, out = git_run_command(gitdir, ['symbolic-ref', '--short', 'HEAD'])
+    if ecode == 0:
+        return ['checkout', out.strip()]
+    ecode, out = git_run_command(gitdir, ['rev-parse', 'HEAD'])
+    if ecode == 0:
+        return ['checkout', '--detach', out.strip()]
+    return []
+
+
 def get_excluded_addrs() -> Set[str]:
     config = get_main_config()
     excludes = set()
diff --git a/src/b4/review/_review.py b/src/b4/review/_review.py
index 4c67387..06595fa 100644
--- a/src/b4/review/_review.py
+++ b/src/b4/review/_review.py
@@ -3151,8 +3151,9 @@ def _prepare_review_session(cmdargs: argparse.Namespace) -> Dict[str, Any]:
             topdir, change_id, series, patches
         )
 
-    # Record current branch so ReviewApp can restore it if it checks
-    # out the review branch for shell/agent operations.
+    # Record where HEAD is so ReviewApp can put it back if it checks out the
+    # review branch for shell/agent operations.  A detached HEAD is a starting
+    # point too, so remember the commit alongside the branch name.
     ecode, out = b4.git_run_command(topdir, ['symbolic-ref', '--short', 'HEAD'])
     current_branch = out.strip() if ecode == 0 else None
 
@@ -3160,6 +3161,7 @@ def _prepare_review_session(cmdargs: argparse.Namespace) -> Dict[str, Any]:
         'topdir': topdir,
         'branch': branch,
         'original_branch': current_branch,
+        'original_head': b4.git_head_restore_args(topdir),
         'cover_text': cover_text,
         'tracking': tracking,
         'series': series,
diff --git a/src/b4/review_tui/_entry.py b/src/b4/review_tui/_entry.py
index 6dc71a4..ab68ca4 100644
--- a/src/b4/review_tui/_entry.py
+++ b/src/b4/review_tui/_entry.py
@@ -69,8 +69,10 @@ def run_tracking_tui(
     patatt_sign = not (no_sign or _cnps.lower() in {'yes', 'true', 'y'})
     use_mouse = not no_mouse and _tui_use_mouse()
 
-    # Get current branch to restore later
+    # Remember where HEAD is so we can put it back later.  A detached HEAD is
+    # a starting point too, so keep the commit alongside the branch name.
     original_branch = b4.git_get_current_branch(topdir)
+    original_head = b4.git_head_restore_args(topdir)
 
     # Check if we're already on a review branch
     if original_branch and original_branch.startswith(b4.review.REVIEW_BRANCH_PREFIX):
@@ -178,7 +180,7 @@ def run_tracking_tui(
         # Anything else means the user moved HEAD themselves -- possibly hours
         # ago, from another terminal sharing this worktree -- and the branch
         # recorded when we started is stale, not something to check back out.
-        if original_branch:
+        if original_head:
             current = b4.git_get_current_branch(topdir)
             if (
                 current
@@ -186,12 +188,8 @@ def run_tracking_tui(
                 and current.startswith(b4.review.REVIEW_BRANCH_PREFIX)
             ):
                 logger.info(
-                    'Checking out %s and starting tracking UI...', original_branch
-                )
-                ecode, _out = b4.git_run_command(
-                    topdir, ['checkout', original_branch], logstderr=True
+                    'Checking out %s and starting tracking UI...', original_head[-1]
                 )
+                ecode, _out = b4.git_run_command(topdir, original_head, logstderr=True)
                 if ecode != 0:
-                    logger.warning(
-                        'Could not restore original branch: %s', original_branch
-                    )
+                    logger.warning('Could not restore %s', original_head[-1])
diff --git a/src/b4/review_tui/_review_app.py b/src/b4/review_tui/_review_app.py
index 0982f55..9c9bf17 100644
--- a/src/b4/review_tui/_review_app.py
+++ b/src/b4/review_tui/_review_app.py
@@ -292,6 +292,9 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
         self._patatt_sign: bool = session.get('patatt_sign', True)
         self._branch: str = session['branch']
         self._original_branch: Optional[str] = session.get('original_branch')
+        self._original_head: List[str] = session.get('original_head') or (
+            ['checkout', self._original_branch] if self._original_branch else []
+        )
         self.branch_checked_out: bool = False
         self._has_cover: bool = NO_COVER_NOTE not in self._cover_text
         self._selected_idx: int = (
@@ -2161,8 +2164,8 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
         return True
 
     def _restore_original_branch(self) -> None:
-        """Switch back to the original branch after shell/agent use."""
-        if not self.branch_checked_out or not self._original_branch:
+        """Put HEAD back where the session found it after shell/agent use."""
+        if not self.branch_checked_out or not self._original_head:
             return
         # Only undo our own checkout. If HEAD is no longer on the review
         # branch we left it on, something else moved it -- the shell we just
@@ -2172,7 +2175,7 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
             self.branch_checked_out = False
             return
         ecode, _out = b4.git_run_command(
-            self._topdir, ['checkout', self._original_branch], logstderr=True
+            self._topdir, self._original_head, logstderr=True
         )
         if ecode == 0:
             self.branch_checked_out = False

-- 
2.53.0

