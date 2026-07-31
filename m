Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914C137F8D7
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 21:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785535186; cv=none; b=ZRgRy2HBCN9EuKX2NU1QkW7NOdd3RB5dWVu/qtifwscFESWslEvviuQFZVuHy56r5S5nDfQdHQt8Kr9O/BO1Snlp8uSkDDZYbMjgWpQjD3LCkmz6qR+DpXLUa8aTKW2z+SyOnTSl9IaG9WHVPhnf20d+CNi9PYZlRWVK+RWJOEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785535186; c=relaxed/simple;
	bh=phQjxerczIJ6XzLmxR35HKb+Yy6UHEnjjBR95TlEyA0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jZxrsMYiINPukPyQAt/xAfyXicuZZGwTwWGXOODxIbRJNGVG7Ti8wCIcQbkKrjxy2TeNbCKH34MElOfE7euj/nWeNDOMHQUtrt/rKq6/Bg49DgsjrKbUKtIP6d+DEvOyj6ODadvfuUs6kiuVsJ6ehUtOnC0A0EzohQYQxhgs95A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=emEWg6/q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="emEWg6/q"
Received: by smtp.kernel.org (Postfix)
	id 8BC0D1F00ACF; Fri, 31 Jul 2026 21:59:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDFAC1F00AC4;
	Fri, 31 Jul 2026 21:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785535185;
	bh=KwBaa0f/nXb7T+JAIADOqu/WrdxjeZXyI5ToPDSQDeI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=emEWg6/qu5CdBbS8+qEDDAWyS8ntS63ryHESmS0czUaU7k2YDLOpK/2UNDGBYI5UJ
	 LaAmexTZzdXHrJZr5U2QMvzTfbYPhb0tAeIv8G/+HtrHITFS/G14ezeqgLtFJHH73L
	 wlMer4Iw0Ua0loasouefZmz5CGN8aPg4mkTjq4Eh4j5Y1LJVQaNX6kHXy5+cwbfvBW
	 Tq01hG/DQAX3QKK9q2U50fQsi5GLMb3Lu7yAVbsSfVDJtHHQPEiRgXU1Ria1Ilx0+P
	 Vw99vIxHAT6qzpnpHR2tTx0ts6bzzPAzQLTkLwt1iYWaXfVWGWT4Jrar9zCnTuPHNG
	 EAX1sJTqRbLYg==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 23:59:24 +0200
Subject: [PATCH b4 v2 43/44] review-tui: put the user back when the branch
 they are on is deleted
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v2-43-243fd19d322d@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=5574; i=brauner@kernel.org;
 h=from:subject:message-id; bh=phQjxerczIJ6XzLmxR35HKb+Yy6UHEnjjBR95TlEyA0=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlSs01OnJnatob4+zEONHdTZt7j7hH5tye7LZt0mx9i
 dCjjuInOkpZGMS4GGTFFFkc2k3C5ZbzVGw2ytSAmcPKBDKEgYtTACZy+hLD/8iQqSceC+3q8Un/
 qhAsfKQhcqn+74mur68lKWzwYsp+U8bwv8x9j63H6Rfb/vaeZ07gFrU87+bBXixybIeUQM+15/L
 xHAA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Deleting the branch HEAD sits on detaches to its parent commit, the
only destination delete_review_branch() can name without knowing the
caller. The exit restore leaves a detached HEAD alone by design, so
abandoning or archiving a series parked the user on a commit they
never asked for.

We know where the session started. Put the user back there, at the
two places that ask for the detaching.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/review_tui/_entry.py        |  1 +
 src/b4/review_tui/_tracking_app.py | 60 ++++++++++++++++++++++++++++++--------
 2 files changed, 49 insertions(+), 12 deletions(-)

diff --git a/src/b4/review_tui/_entry.py b/src/b4/review_tui/_entry.py
index f085cb4..700c5ea 100644
--- a/src/b4/review_tui/_entry.py
+++ b/src/b4/review_tui/_entry.py
@@ -139,6 +139,7 @@ def run_tracking_tui(
                 focus_change_id=focus_change_id,
                 email_dryrun=email_dryrun,
                 patatt_sign=patatt_sign,
+                original_head=original_head,
             )
             focus_change_id = None
             branch_name = app.run(mouse=use_mouse)
diff --git a/src/b4/review_tui/_tracking_app.py b/src/b4/review_tui/_tracking_app.py
index ac3a575..ac2ffcf 100644
--- a/src/b4/review_tui/_tracking_app.py
+++ b/src/b4/review_tui/_tracking_app.py
@@ -347,6 +347,31 @@ def _keep_current_branch(topdir: str) -> Generator[Callable[[], None], None, Non
         restore()
 
 
+@contextlib.contextmanager
+def _land_off_deleted_branch(
+    topdir: str, branch: str, fallback: List[str]
+) -> Generator[None, None, None]:
+    """Land HEAD back on *fallback* if *branch* is deleted out from under it.
+
+    Deleting the branch HEAD is on means getting off it first, and git can
+    only be pointed at the parent commit: it does not know where the user
+    was before they came here. We do, so put them back where the session
+    started rather than leave the worktree detached at a commit for them to
+    find later.  *fallback* is git-checkout args, so a session that started
+    on a detached HEAD lands back on its own commit and not on this one.
+
+    Does nothing unless HEAD was on *branch* going in and is detached
+    coming out, which only the deletion can have done -- nothing in
+    between suspends the UI, so the user cannot have moved it themselves.
+    """
+    on_branch = b4.git_get_current_branch(topdir) == branch
+    try:
+        yield
+    finally:
+        if on_branch and fallback and b4.git_get_current_branch(topdir) is None:
+            b4.git_run_command(topdir, fallback, logstderr=True)
+
+
 @contextlib.contextmanager
 def _take_worktree(
     topdir: str, target_branch: str
@@ -921,10 +946,16 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
         focus_change_id: Optional[str] = None,
         email_dryrun: bool = False,
         patatt_sign: bool = True,
+        original_head: Optional[List[str]] = None,
     ) -> None:
         super().__init__()
         self._identifier = identifier
         self._original_branch = original_branch
+        # Where to put HEAD back when an action detaches it.  A caller that
+        # only named a branch gets that branch back.
+        self._original_head: List[str] = original_head or (
+            ['checkout', original_branch] if original_branch else []
+        )
         self._focus_change_id = focus_change_id
         self._email_dryrun = email_dryrun
         self._patatt_sign = patatt_sign
@@ -3819,13 +3850,15 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
 
         Thin TUI wrapper around b4.review.delete_review_branch() that turns
         its error string into a notification.  Interactive, so detaching HEAD
-        to get off the branch is fine here.
+        to get off the branch is fine here -- as long as we do not leave it
+        that way.
 
         Returns True on success, False on failure.
         """
-        ok, err = b4.review.delete_review_branch(
-            topdir, review_branch, allow_switch=True
-        )
+        with _land_off_deleted_branch(topdir, review_branch, self._original_head):
+            ok, err = b4.review.delete_review_branch(
+                topdir, review_branch, allow_switch=True
+            )
         if not ok and notify:
             self.notify(err, severity='error')
         return ok
@@ -4744,14 +4777,17 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
                 self.notify('Not in a git repository', severity='error')
             return False
 
-        ok, detail = b4.review.archive_series(
-            topdir,
-            self._identifier,
-            change_id,
-            revision=revision,
-            pw_series_id=pw_series_id,
-            allow_switch=True,
-        )
+        # Archiving deletes the branch, so it detaches HEAD to get off it the
+        # same way an outright delete does.
+        with _land_off_deleted_branch(topdir, review_branch, self._original_head):
+            ok, detail = b4.review.archive_series(
+                topdir,
+                self._identifier,
+                change_id,
+                revision=revision,
+                pw_series_id=pw_series_id,
+                allow_switch=True,
+            )
         if not ok:
             if notify:
                 self.notify(detail, severity='error')

-- 
2.53.0

