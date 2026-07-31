Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DA61A6800
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 21:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785535178; cv=none; b=OuyPWPW+vtF+ZuxmB2K1Q3nD6gIef1iUq1LbOw3Pra7UVmLHWQFV4JIvkVJMZCeVEQSV9tlYWuTca75SSn22QVOSB3zZFLnG9oilmOMK3zP7bWYVVpj3DmUd7ZuCAnrjr+xhs66fNYnhhu5gvxOkMual5uzJEySOo6qnXpBYSbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785535178; c=relaxed/simple;
	bh=+hqJjkW/QNRz1pY1pnu0d2ehRFf7LqUuW+4ZnsbdDWo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LYKT2MVFy+bokRMswv+CvrOhlvEYbESgwHlfsn6vtZy5uhCWNwdZRoDbQY9mSls2iHzVYNWO1EAPYY24jFHok/cpvjSL8weWjiyY7we06qmAcAVViXoiQlREQm6niX/qhfxs1yEOjE33JooMEKqxmtkNudytP2y/Ftn+3mfqUEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TSv6b4OE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TSv6b4OE"
Received: by smtp.kernel.org (Postfix)
	id 1F9EA1F00ACF; Fri, 31 Jul 2026 21:59:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 507C21F00AC4;
	Fri, 31 Jul 2026 21:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785535177;
	bh=BWn1PVGpKmylNwiEOyeEC+C6BmX6TN9Z8u+iEUfzO30=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=TSv6b4OEpQqMUGduiile6zxnem26Gz0VJHWDmh57f9YE35p6abc8jc1ewgFDc63Iu
	 eOGqSH+0+Rg6nM0gqYAcHh11Sl7khR8xTRHAGPjJgIkl1lKL26Osy2zgJq3hzLXO0P
	 3ryiMAArPY5C0SJ5zJevsMeHiiRHopBGNl8L/Mvn4Ns2VJpdDiRYAOPZMFIO5Bv9hl
	 Y69bw3492RKFHgc2iTCjDWQRq+7h5hFGpIHRBkQV0wH5sf/n8Xi9Wmvj2qsAxYQCg+
	 HjgtbmECBdlx3IoM7QTSgBAYSPnnqgKv5MgSxcadkWw3v52x+EMwgTEZyRSPAZRkJo
	 jQ5LXPu0egzPQ==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 23:59:17 +0200
Subject: [PATCH b4 v2 36/44] review-tui: restore the original branch
 however the tracking loop ends
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260731-work-b4-editor-branch-guard-v2-36-243fd19d322d@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=9730; i=brauner@kernel.org;
 h=from:subject:message-id; bh=+hqJjkW/QNRz1pY1pnu0d2ehRFf7LqUuW+4ZnsbdDWo=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlSs0x78m4rvtXv4JRoGw618s/Bnftt2XLdsy1sL57e
 47XUe5NHaUsDGJcDLJiiiwO7Sbhcst5KjYbZWrAzGFlAhnCwMUpABOR3M/wP7T1fvtNCVEpS+ne
 con/Ei6nHigaK0537v5elv6vyojpJcNf4SmLr6Zc155ULbhmnTJbxu+N3q+U7Be7LV1YOK1nteV
 ZbgA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

The restore sat at the tail of the loop body, so quitting the tracking
list skipped it. That started to matter when the list grew actions
that move HEAD, like the revision upgrade. Lift the restore into a
helper and run it in a finally.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/review_tui/_entry.py | 174 +++++++++++++++++++++++---------------------
 1 file changed, 92 insertions(+), 82 deletions(-)

diff --git a/src/b4/review_tui/_entry.py b/src/b4/review_tui/_entry.py
index ab68ca4..31c6257 100644
--- a/src/b4/review_tui/_entry.py
+++ b/src/b4/review_tui/_entry.py
@@ -74,6 +74,28 @@ def run_tracking_tui(
     original_branch = b4.git_get_current_branch(topdir)
     original_head = b4.git_head_restore_args(topdir)
 
+    def restore_original_head() -> None:
+        """Put HEAD back where we found it on the user's behalf.
+
+        Only a review branch is ours to undo, since that is the only kind
+        either app checks out.  Anything else means the user moved HEAD
+        themselves -- possibly hours ago, from another terminal sharing this
+        worktree -- and the position recorded when we started is stale, not
+        something to check back out.
+        """
+        if not original_head or not topdir:
+            return
+        current = b4.git_get_current_branch(topdir)
+        if (
+            current
+            and current != original_branch
+            and current.startswith(b4.review.REVIEW_BRANCH_PREFIX)
+        ):
+            logger.info('Checking out %s...', original_head[-1])
+            ecode, _out = b4.git_run_command(topdir, original_head, logstderr=True)
+            if ecode != 0:
+                logger.warning('Could not restore %s', original_head[-1])
+
     # Check if we're already on a review branch
     if original_branch and original_branch.startswith(b4.review.REVIEW_BRANCH_PREFIX):
         # Go directly to ReviewApp and exit when done
@@ -103,93 +125,81 @@ def run_tracking_tui(
             )
         return
 
-    # Normal tracking mode - loop between TrackingApp and ReviewApp
+    # Normal tracking mode - loop between TrackingApp and ReviewApp.
+    # The restore runs in a finally: the tracking list has actions of its own
+    # that leave HEAD on a review branch -- upgrading a series to a newer
+    # revision is one -- and quitting from there must not strand the user on
+    # it.  Restoring only after a ReviewApp pass misses every such path.
     focus_change_id: Optional[str] = None
-    while True:
-        app = TrackingApp(
-            identifier,
-            original_branch,
-            focus_change_id=focus_change_id,
-            email_dryrun=email_dryrun,
-            patatt_sign=patatt_sign,
-        )
-        focus_change_id = None
-        branch_name = app.run(mouse=use_mouse)
+    try:
+        while True:
+            app = TrackingApp(
+                identifier,
+                original_branch,
+                focus_change_id=focus_change_id,
+                email_dryrun=email_dryrun,
+                patatt_sign=patatt_sign,
+            )
+            focus_change_id = None
+            branch_name = app.run(mouse=use_mouse)
 
-        if not branch_name:
-            # User quit - exit the loop
-            break
+            if not branch_name:
+                # User quit - exit the loop
+                break
 
-        if branch_name == TrackingApp.PATCHWORK_SENTINEL:
-            # User pressed [p]atchwork — run PwApp and loop back
-            config = b4.get_main_config()
-            pwkey = str(config.get('pw-key', ''))
-            pwurl = str(config.get('pw-url', ''))
-            pwproj = str(config.get('pw-project', ''))
-            if pwkey and pwurl and pwproj:
-                run_pw_tui(
-                    pwkey,
-                    pwurl,
-                    pwproj,
-                    email_dryrun=email_dryrun,
-                    patatt_sign=patatt_sign,
-                )
-            continue
+            if branch_name == TrackingApp.PATCHWORK_SENTINEL:
+                # User pressed [p]atchwork — run PwApp and loop back
+                config = b4.get_main_config()
+                pwkey = str(config.get('pw-key', ''))
+                pwurl = str(config.get('pw-url', ''))
+                pwproj = str(config.get('pw-project', ''))
+                if pwkey and pwurl and pwproj:
+                    run_pw_tui(
+                        pwkey,
+                        pwurl,
+                        pwproj,
+                        email_dryrun=email_dryrun,
+                        patatt_sign=patatt_sign,
+                    )
+                continue
 
-        # User selected a branch to review - prepare session and run ReviewApp
-        cmdargs = argparse.Namespace(branch=branch_name)
-        try:
-            session = b4.review._prepare_review_session(cmdargs)
-        except SystemExit:
-            # Session prep failed (e.g., branch doesn't exist)
-            logger.warning(
-                'Could not prepare review session for branch: %s', branch_name
-            )
-            continue
+            # User selected a branch to review - prepare session and run ReviewApp
+            cmdargs = argparse.Namespace(branch=branch_name)
+            try:
+                session = b4.review._prepare_review_session(cmdargs)
+            except SystemExit:
+                # Session prep failed (e.g., branch doesn't exist)
+                logger.warning(
+                    'Could not prepare review session for branch: %s', branch_name
+                )
+                continue
 
-        session['email_dryrun'] = email_dryrun
-        session['patatt_sign'] = patatt_sign
-        review_app = ReviewApp(session)
-        review_app.run(mouse=use_mouse)
+            session['email_dryrun'] = email_dryrun
+            session['patatt_sign'] = patatt_sign
+            review_app = ReviewApp(session)
+            review_app.run(mouse=use_mouse)
 
-        # Remember which series was just reviewed so the tracking list
-        # can position the cursor on it.
-        focus_change_id = branch_name.removeprefix(b4.review.REVIEW_BRANCH_PREFIX)
+            # Remember which series was just reviewed so the tracking list
+            # can position the cursor on it.
+            focus_change_id = branch_name.removeprefix(b4.review.REVIEW_BRANCH_PREFIX)
 
-        # Sync status from tracking commit to DB.  The ReviewApp writes
-        # status changes (e.g. 'replied') into the tracking commit JSON,
-        # so we read it back here and propagate to the SQLite database.
-        try:
-            _cover_text, tracking = b4.review.load_tracking(topdir, branch_name)
-            tracking_status = tracking.get('series', {}).get('status')
-            revision = session['series'].get('revision')
-            if tracking_status and focus_change_id:
-                conn = b4.review.tracking.get_db(identifier)
-                b4.review.tracking.update_series_status(
-                    conn, focus_change_id, tracking_status, revision=revision
-                )
-                conn.close()
-        except Exception as ex:
-            logger.warning('Could not sync tracking status: %s', ex)
+            # Sync status from tracking commit to DB.  The ReviewApp writes
+            # status changes (e.g. 'replied') into the tracking commit JSON,
+            # so we read it back here and propagate to the SQLite database.
+            try:
+                _cover_text, tracking = b4.review.load_tracking(topdir, branch_name)
+                tracking_status = tracking.get('series', {}).get('status')
+                revision = session['series'].get('revision')
+                if tracking_status and focus_change_id:
+                    conn = b4.review.tracking.get_db(identifier)
+                    b4.review.tracking.update_series_status(
+                        conn, focus_change_id, tracking_status, revision=revision
+                    )
+                    conn.close()
+            except Exception as ex:
+                logger.warning('Could not sync tracking status: %s', ex)
 
-        # Restore original branch if we're no longer on it.
-        # This covers two cases:
-        # - ReviewApp checked out the review branch (shell suspend/agent)
-        # - TrackingApp checked out a new series via create_review_branch
-        # Both land on a review branch, and that is the only case we may undo.
-        # Anything else means the user moved HEAD themselves -- possibly hours
-        # ago, from another terminal sharing this worktree -- and the branch
-        # recorded when we started is stale, not something to check back out.
-        if original_head:
-            current = b4.git_get_current_branch(topdir)
-            if (
-                current
-                and current != original_branch
-                and current.startswith(b4.review.REVIEW_BRANCH_PREFIX)
-            ):
-                logger.info(
-                    'Checking out %s and starting tracking UI...', original_head[-1]
-                )
-                ecode, _out = b4.git_run_command(topdir, original_head, logstderr=True)
-                if ecode != 0:
-                    logger.warning('Could not restore %s', original_head[-1])
+            # Put the user back before the tracking list comes up again.
+            restore_original_head()
+    finally:
+        restore_original_head()

-- 
2.53.0

