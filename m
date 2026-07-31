Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B747E37C0EB
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 21:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785535162; cv=none; b=i88ffPxOgpXxwcjm24qV6I6Y4DD6PWJ0AKagFdRiDjXEpnhp2NdEI90psa98z1oq1htZ4fjpylytTkVrBGyWqr2HaskiNhifOUniwhWbD91wxpLJCSB3eGgjgiBNgHGt5l1nDtDol2Zf8H7BK8M2Zj9m0BVFYjWRwNemP8BExW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785535162; c=relaxed/simple;
	bh=c/U/tjhmnE67J4oYXh33ShyKtL7hvomUhtpD0qwkWeA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KSuAoIHthpqwF/9T7LTZrUhO4cNfcnsM/fJVTK1manDdacyXUlbdoW4QW/sLBPOfPuwb9A+FozT/vAw1AZSQvutyVf4jXA195uiwjUE3yXRZ7jSPLECHE4JnJudIPKlZduHaP/3eysFTaXOWSHhuNl35bxRXILTAR78QVhOYIFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=REAiv8fw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="REAiv8fw"
Received: by smtp.kernel.org (Postfix)
	id B3CA41F00ACA; Fri, 31 Jul 2026 21:59:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E64561F00ACF;
	Fri, 31 Jul 2026 21:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785535161;
	bh=eKpsUZOZW0iIDOKYKHiD+jDbWtPcV+ydFKQ+bILa0ZA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=REAiv8fwquOjnldO6uxCrc6vlpQ4t4d6VqwHWmQFGT9BstWncEQC6ffVZe+3PKk1F
	 anXF0rlaqsuL3YEFnsFrewAbQbxz4mxUT/IK7m3MY797T1WIMg5hKT4FGnUsB4+VNe
	 0rRf1Sivh0ILGM/2Fz/+TOxY2I0o/lP1hb14GXrB8jjNhImqb+a4DRVOEWYLZmD+D0
	 5iJYK53zJXPvgodsPYjrD1mvM5a+HqLXGhkxWIyOjxXVrBcgzcwTEOJ0yBDVAUbmil
	 dgztCB+kcuDgrWF/Xtm4u7LNgIdhaMmf1qnEVzs6ZwizUt+3OPJxk3nkURYXSwMxqS
	 hAHv83wTNjj5g==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 23:59:04 +0200
Subject: [PATCH b4 v2 23/44] review-tui: only put back a branch b4 checked
 out itself
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v2-23-243fd19d322d@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=2660; i=brauner@kernel.org;
 h=from:subject:message-id; bh=c/U/tjhmnE67J4oYXh33ShyKtL7hvomUhtpD0qwkWeA=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlSs3W158quebggsWxMbs+Ld9vJHOxgiEjeuctXnXN+
 wkOW5fc7yhlYRDjYpAVU2RxaDcJl1vOU7HZKFMDZg4rE8gQBi5OAZiIzUFGhhXbeqcvT4i5eHNW
 Q0lU7v4ZU8zmJaQ3f+v33d2nZLhIOIPhf7T67b0cM7iPcW+1Y+nZ6MXFyaVg1D/1RWnPIe2pRY3
 bGAE=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

The branch recorded at startup was checked back out at exit even when
the user moved HEAD themselves from another terminal sharing the
worktree. Only undo a checkout that landed on a review branch, the
only kind either app makes.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/review_tui/_entry.py      | 10 +++++++++-
 src/b4/review_tui/_review_app.py |  7 +++++++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/src/b4/review_tui/_entry.py b/src/b4/review_tui/_entry.py
index ece97da..6dc71a4 100644
--- a/src/b4/review_tui/_entry.py
+++ b/src/b4/review_tui/_entry.py
@@ -174,9 +174,17 @@ def run_tracking_tui(
         # This covers two cases:
         # - ReviewApp checked out the review branch (shell suspend/agent)
         # - TrackingApp checked out a new series via create_review_branch
+        # Both land on a review branch, and that is the only case we may undo.
+        # Anything else means the user moved HEAD themselves -- possibly hours
+        # ago, from another terminal sharing this worktree -- and the branch
+        # recorded when we started is stale, not something to check back out.
         if original_branch:
             current = b4.git_get_current_branch(topdir)
-            if current and current != original_branch:
+            if (
+                current
+                and current != original_branch
+                and current.startswith(b4.review.REVIEW_BRANCH_PREFIX)
+            ):
                 logger.info(
                     'Checking out %s and starting tracking UI...', original_branch
                 )
diff --git a/src/b4/review_tui/_review_app.py b/src/b4/review_tui/_review_app.py
index 778a8f6..0982f55 100644
--- a/src/b4/review_tui/_review_app.py
+++ b/src/b4/review_tui/_review_app.py
@@ -2164,6 +2164,13 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
         """Switch back to the original branch after shell/agent use."""
         if not self.branch_checked_out or not self._original_branch:
             return
+        # Only undo our own checkout. If HEAD is no longer on the review
+        # branch we left it on, something else moved it -- the shell we just
+        # suspended into, or another terminal in the same worktree -- and it
+        # is not ours to move back.
+        if b4.git_get_current_branch(self._topdir) != self._branch:
+            self.branch_checked_out = False
+            return
         ecode, _out = b4.git_run_command(
             self._topdir, ['checkout', self._original_branch], logstderr=True
         )

-- 
2.53.0

