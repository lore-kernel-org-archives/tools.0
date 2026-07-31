Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B5637E302
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 21:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785535173; cv=none; b=TgLHC1/BSmU9CKGo5jwtMWgwaCzwtFz6H5ITK6/fgH3SlB9CwZb8aU7zJcp2Y31GJ4iZZDOGOcgGm/X/8TxDpklc9vyG6+A2nDIprcoRdfZ7R3YdDIxyoRuR26UNYQUmPOSjH6vb7+M/XTPV8Ba1SnaM9kj75bWUJ8joA2sLfoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785535173; c=relaxed/simple;
	bh=dogCkoywW3pVzL97Hf1S5MLi2wShbbOgLaGIoGrpJr0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NVdClLCf+DeKPsFH7LSsM3kH36wP67xajIjgtyY41F5t0aVXmjxrbwY5nGz+4lAwHvlMMNycUkCMa+qM1ajniimC6p2jKFcQ/r8jBIrUS857AsjEIKgtz3+mIEFmPv1s3fkvOVkrvUN8/aEFe+oSPHn4xRvkZV9BE69Xp0pFLik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XAEmSQfN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XAEmSQfN"
Received: by smtp.kernel.org (Postfix)
	id 506561F00ACA; Fri, 31 Jul 2026 21:59:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8242D1F00AC4;
	Fri, 31 Jul 2026 21:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785535172;
	bh=EoiakkI7oKvNH9+3fSpxq6hGwIjIa7Z1UjWRHhvHHzo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=XAEmSQfN0SJ313DQdeMTaoYz0f9+r2kCzg85xPsBrzGKJ+FIoih//drTKxcoeS/gL
	 4tOn4RDW6cHvGMJBsNmVR6wYWIzrj9R0zsjLaFryeA3hPOXJZTv1RqCHcI27FJgl4D
	 ohhDbiKk+wGgm8VkntJJNX9s7TowFBUBoWWlhKi4jRQ5ObiJXpn/giRefTWK3IV1GL
	 WhMh1EFFXdRxvSj07fb6Fu+NO+dXOnRmbFFxL2NmxI19kdpCKjatEZXrDgW1vY1QEa
	 wrSPBXAVIwi3YsQihek9fkt5SEaufxzGd56desiBUX17BP2eajYGCCJivE1SOhj7N6
	 r7X5qWCw1Tg2Q==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 23:59:13 +0200
Subject: [PATCH b4 v2 32/44] review: clean up a review branch that cannot
 be finished
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v2-32-243fd19d322d@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=3447; i=brauner@kernel.org;
 h=from:subject:message-id; bh=dogCkoywW3pVzL97Hf1S5MLi2wShbbOgLaGIoGrpJr0=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlSs1p9tjO+n5nxPtZ7NtEfr697dTNvzLs7PbZgpYTL
 q15+XzW1Y5SFgYxLgZZMUUWh3aTcLnlPBWbjTI1YOawMoEMYeDiFICJlLxn+B/pVfM9McvoiNja
 MyeOT+F1zljwooHtTcs/D2OPkkUN/u6MDCfjFLY9NJz5f3krj82pBe4p7w4XG9u5flD1WV+6e2d
 CAQ8A
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

create_review_branch() checks the new branch out before building it.
Two of the three failures after that point put the caller back and
delete the branch; the one that cannot read the patch range just
exits. A detached start got no cleanup at all, and the leftover branch
made the next attempt fail with "Branch already exists".

Route all three through one cleanup helper that restores via
git_head_restore_args(), so a detached start has somewhere to go back
to.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/review/_review.py | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/src/b4/review/_review.py b/src/b4/review/_review.py
index c3aa8e9..5a9f0d1 100644
--- a/src/b4/review/_review.py
+++ b/src/b4/review/_review.py
@@ -283,11 +283,16 @@ def create_review_branch(
         logger.critical('Branch %s already exists', branch_name)
         sys.exit(1)
 
-    # Save current branch for potential restore on error
-    current_branch: Optional[str] = None
-    ecode, out = b4.git_run_command(topdir, ['symbolic-ref', '--short', 'HEAD'])
-    if ecode == 0:
-        current_branch = out.strip()
+    # Save the current position for potential restore on error: everything
+    # past the checkout below runs on the new branch, and git refuses to
+    # delete the branch HEAD is sitting on.
+    restore_head = b4.git_head_restore_args(topdir)
+
+    def drop_half_built_branch() -> None:
+        """Put the caller back and take the unfinished branch with us."""
+        if restore_head:
+            b4.git_run_command(topdir, restore_head, logstderr=True)
+        b4.git_run_command(topdir, ['branch', '-D', branch_name], logstderr=True)
 
     # Resolve base_commit to a concrete hash before checkout changes HEAD
     ecode, out = b4.git_run_command(
@@ -316,10 +321,7 @@ def create_review_branch(
         logger.critical(out.strip())
         # Abort the cherry-pick if in progress
         b4.git_run_command(topdir, ['cherry-pick', '--abort'], logstderr=True)
-        # Restore previous branch
-        if current_branch:
-            b4.git_run_command(topdir, ['checkout', current_branch], logstderr=True)
-        b4.git_run_command(topdir, ['branch', '-D', branch_name], logstderr=True)
+        drop_half_built_branch()
         sys.exit(1)
 
     # Record the first patch commit (the one right after base)
@@ -328,6 +330,9 @@ def create_review_branch(
     )
     if ecode > 0 or not out.strip():
         logger.critical('Unable to determine first patch commit')
+        # HEAD is on a branch that was never finished, as in the other two
+        # post-checkout failures around this one.
+        drop_half_built_branch()
         sys.exit(1)
     all_commits = out.strip().splitlines()
     prereq_commits = all_commits[:num_prereqs]
@@ -420,10 +425,7 @@ def create_review_branch(
     if ecode > 0:
         logger.critical('Unable to create tracking commit')
         logger.critical(out.strip())
-        # Restore previous branch
-        if current_branch:
-            b4.git_run_command(topdir, ['checkout', current_branch], logstderr=True)
-        b4.git_run_command(topdir, ['branch', '-D', branch_name], logstderr=True)
+        drop_half_built_branch()
         sys.exit(1)
 
     # Mark cover + patch messages as Seen in the messages DB

-- 
2.53.0

