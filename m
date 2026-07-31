Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E9237E302
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 21:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785535176; cv=none; b=Cb7myIuYj4AH9sw+3MdGZaOM+6kjJZtmZ1Z40BdcgrXS2cOpDUQqGi79n0Dk+G23CKJ69+tjZKUgGQjtvqVwvPa8QhF98sv5zRgbnbZ+CvtjmlPuxur8edIz6UeaTtBuDf4F81mKdRVEtzGjVaT/srlbROUWfKqJ+Mub8NYSAKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785535176; c=relaxed/simple;
	bh=bahuyIcqU7764cYtkvG9Z9iRZmhr2aF6nXkFMGZivsg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aUQoIGrS/sVVr93EG2SmPiAB+FbQoxISKJppAkPgaoXTk0rYK3aZtOCfgIMvEsmebraq+8CN8Q2dbTC0qpIl+LAuvQzk0sXbG5t2cbVpVSYE74y+MLmRxLWbstPZOBsAF9+ME41oL/yveNgM0Y2jdZbLkwSoJuRf0nVptu6Sh+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FCbr1CU2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FCbr1CU2"
Received: by smtp.kernel.org (Postfix)
	id A42AC1F00ACF; Fri, 31 Jul 2026 21:59:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D51C11F00AC4;
	Fri, 31 Jul 2026 21:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785535174;
	bh=g2kcJtIbs37Viw5MsWRrHWBqpPHv3Hs6VEVc26MiTc4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=FCbr1CU2OoDBnGNpsrmFzULWXQr9uFXD1DfTY6LKmqNmywTDcab5FbhE1Xm58GxL2
	 efY+RX495A/Zp4LDA+J6gV2+mx3+0mtDxwi2Od3WAKhsIpmtAttFG8IodrZQTrwD9s
	 3SpSjMB34C0op6XppPRwO6Nyv89oCLWhOUtN3POgkrGmCpfhyfDV3MuNKTZ+wpn6/y
	 LiXurmtqoHTWGfE64exiPvSoAuX3V6TDKvCSZ4bHP9drjL5PMfzezihpaQcB2bXI+O
	 KXInQ8//lQw4/iSfRZLPXWtGCDC2c6xCrjylweq0PMnqw3oje4aSGY+VKvsq/XlLhs
	 nSslNhLeWiiVg==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 23:59:15 +0200
Subject: [PATCH b4 v2 34/44] review-tui: put the branch back after a
 revision upgrade
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260731-work-b4-editor-branch-guard-v2-34-243fd19d322d@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=8127; i=brauner@kernel.org;
 h=from:subject:message-id; bh=bahuyIcqU7764cYtkvG9Z9iRZmhr2aF6nXkFMGZivsg=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlSs3Zv22li2GRnZnmSZOFUZ73jm5rmhhWZiGxXIOHQ
 Ynj/tHQjlIWBjEuBlkxRRaHdpNwueU8FZuNMjVg5rAygQxh4OIUgIl8kWD477C5lzNDlmmC+MfH
 4c4/5YU0RY1Ss35E6Lt2Jn1b48txk5HhA+9EMQHxsjf8zFFz4i/qrpwqtr39hu/hB4FrI54Y2V5
 gAgA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

A revision upgrade builds a temporary branch and renames it onto the
review branch, and HEAD follows the rename. Nothing put it back, so
the worktree was left on the review branch whether the upgrade
finished or not. Restore on every exit path with a context manager
that takes git_head_restore_args(), like the rebase action beside it.

The error path could not run at all: create_review_branch() exits
rather than raises, and SystemExit is not an Exception, so a failed
apply left the half-built branch behind and unwound into the UI.
Catch it, delete the branch once HEAD is off it, and report "see
above" since the reason is already on screen. The conflict-resolve
path now falls through to the same create call and the same handler.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/review_tui/_tracking_app.py | 107 ++++++++++++++++++++++++-------------
 1 file changed, 70 insertions(+), 37 deletions(-)

diff --git a/src/b4/review_tui/_tracking_app.py b/src/b4/review_tui/_tracking_app.py
index cc845df..c547d7c 100644
--- a/src/b4/review_tui/_tracking_app.py
+++ b/src/b4/review_tui/_tracking_app.py
@@ -319,6 +319,34 @@ class _TakeWorktree:
         self._keep = True
 
 
+@contextlib.contextmanager
+def _keep_current_branch(topdir: str) -> Generator[Callable[[], None], None, None]:
+    """Put HEAD back where it was when the block started.
+
+    Tracking-list actions run with the UI suspended, and some of them check
+    out a branch of their own to get their work done. The list comes back up
+    when they return, so the branch they moved to must not outlive them: the
+    worktree is the user's, shared with their other terminals, and they never
+    asked to be moved. Restores however the block ends, including when the
+    action bails out early or something under it raises.
+
+    Yields the restore itself, for the callers that need to be off the branch
+    before the block ends -- deleting it, say, which git refuses while it is
+    checked out. Calling it early is safe: the one on the way out then has
+    nothing left to do.
+    """
+    start_head = b4.git_head_restore_args(topdir)
+
+    def restore() -> None:
+        if start_head and b4.git_head_restore_args(topdir) != start_head:
+            b4.git_run_command(topdir, start_head, logstderr=True)
+
+    try:
+        yield restore
+    finally:
+        restore()
+
+
 @contextlib.contextmanager
 def _take_worktree(
     topdir: str, target_branch: str
@@ -4256,13 +4284,16 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
 
         upgrade_branch = f'b4/review/_tmp-{change_id}-v{target_rev}-upgrade'
 
-        with self.suspend():
-            topdir = b4.git_get_toplevel()
-            if not topdir:
-                logger.critical('Not in a git repository')
-                _wait_for_enter()
-                return
+        topdir = b4.git_get_toplevel()
+        if not topdir:
+            self.notify('Not in a git repository', severity='error')
+            return
 
+        # The apply below checks out the upgrade branch and renames it onto the
+        # review branch, so HEAD ends up there whether the upgrade succeeds or
+        # not. The tracking list comes back up when this returns; leaving the
+        # worktree moved strands the user on the review branch when they quit.
+        with self.suspend(), _keep_current_branch(topdir) as restore_branch:
             # --- 1. Save maintainer review data keyed by patch-id ---
             logger.info('Saving review data from v%d...', current_rev)
             patch_ids = b4.review.get_review_branch_patch_ids(topdir, review_branch)
@@ -4348,37 +4379,33 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
             # Use the target revision's own rethread state, not the currently
             # tracked revision's — they can differ across an upgrade.
             _is_rt = bool(target_is_rethreaded)
+            # create_review_branch() reports failure by exiting rather than
+            # raising, and SystemExit is not an Exception, so catch it too --
+            # letting it out of here skips the cleanup below and unwinds
+            # straight through the suspend and into the UI.
             try:
                 logger.info('Base: %s', base_sha)
-                b4.git_fetch_am_into_repo(
-                    topdir,
-                    ambytes=ambytes,
-                    at_base=base_sha,
-                    origin=linkurl,
-                    am_flags=['-3'],
-                    resolve=True,
-                )
-                b4.review.create_review_branch(
-                    topdir,
-                    upgrade_branch,
-                    base_sha,
-                    lser,
-                    linkurl,
-                    linkmask,
-                    num_prereqs=0,
-                    identifier=self._identifier,
-                    status='reviewing',
-                    is_rethreaded=_is_rt,
-                )
-                logger.info('Upgrade branch created: %s', upgrade_branch)
-            except b4.AmConflictError as cex:
-                if not b4.resolve_am_conflict_in_shell(topdir, cex, origin=linkurl):
-                    # User aborted — clean up upgrade branch if it was
-                    # partially created before the conflict
-                    if b4.git_branch_exists(topdir, upgrade_branch):
-                        b4.git_run_command(topdir, ['branch', '-D', upgrade_branch])
-                    _wait_for_enter()
-                    return
+                try:
+                    b4.git_fetch_am_into_repo(
+                        topdir,
+                        ambytes=ambytes,
+                        at_base=base_sha,
+                        origin=linkurl,
+                        am_flags=['-3'],
+                        resolve=True,
+                    )
+                except b4.AmConflictError as cex:
+                    if not b4.resolve_am_conflict_in_shell(topdir, cex, origin=linkurl):
+                        # User aborted.  Nothing this run made is left -- the
+                        # upgrade branch is not created until the am lands --
+                        # but the name is derived from the change-id and the
+                        # revision, so an earlier attempt that ended somewhere
+                        # without cleanup left one sitting on it.  Take it with
+                        # us rather than let it fail the next attempt.
+                        if b4.git_branch_exists(topdir, upgrade_branch):
+                            b4.git_run_command(topdir, ['branch', '-D', upgrade_branch])
+                        _wait_for_enter()
+                        return
                 b4.review.create_review_branch(
                     topdir,
                     upgrade_branch,
@@ -4392,8 +4419,14 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
                     is_rethreaded=_is_rt,
                 )
                 logger.info('Upgrade branch created: %s', upgrade_branch)
-            except Exception as ex:
-                logger.critical('Error creating review branch: %s', ex)
+            except (Exception, SystemExit) as ex:
+                # SystemExit only carries the exit code; create_review_branch()
+                # has already said why on its way out.
+                reason = 'see above' if isinstance(ex, SystemExit) else str(ex)
+                logger.critical('Error creating review branch: %s', reason)
+                # Off the half-built branch before dropping it: git refuses to
+                # delete the branch it has checked out.
+                restore_branch()
                 if b4.git_branch_exists(topdir, upgrade_branch):
                     b4.git_run_command(topdir, ['branch', '-D', upgrade_branch])
                 _wait_for_enter()

-- 
2.53.0

