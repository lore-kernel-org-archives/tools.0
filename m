Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0DB359A9D
	for <tools@linux.kernel.org>; Fri, 20 Mar 2026 19:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774036646; cv=none; b=IhrBM4kKPM0A35EuKYjVrH5DGkHGSEv5xnZpuxX5pC1s/NEGjzKuvdW05jUT+Z8xO+xNBPhlkAaPcZ1Pmica+29+4YWRV+/J6Z+BHi0dDLXWXwRa+v9JFKCtl1szox2PFOG2WGrOjkCwoZhA1smnRRXiFDN8xNE2pC/F9tvzvY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774036646; c=relaxed/simple;
	bh=7OK6SQDpDvxdmZNgcH6qHpGmDrdo/c0v6qvglLJSleg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WWJOsnIk0zUJt0tb0J+uxMrgf1wrhdGCxF3QGbu1ZVOyT7Ze6q7G+BWRgk/QCVAOmviJY6wtl38VwiUozi0AYHO6oISIrLrQe2BMguCQriOxdo/VpLZYLtCnhQ/JERz5G9+/mHJcthLNehWTVFxwL/cHjJFEJrfarHrd/UCjxjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fj0QV16e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fj0QV16e"
Received: by smtp.kernel.org (Postfix)
	id C27A3C2BC87; Fri, 20 Mar 2026 19:57:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A6DBDC4CEF7;
	Fri, 20 Mar 2026 19:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774036645;
	bh=7OK6SQDpDvxdmZNgcH6qHpGmDrdo/c0v6qvglLJSleg=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=fj0QV16eUKgBFfkTh2R8FOcxGvsJmWdIhQczZh0rFRq1IWjnXYYZS8pqI/hF5OIyC
	 Qqf8mCoAMzIrnEoHSN0IiDpU8cwkIvl8GrsOSUqxw8h0Yz9DXc3feTT+JgTn361/cG
	 Zj5vGaxmE9qYdy0AdwD6hMGWvGuw92A/KmArM0arACGHozdmjLMW6UhyUffBDn65I2
	 f0mzmRVHGpwHrIPw6MS3RPmyGOmnngJzmuH3U2TSxYSs4mG+28w/DeKigh8bohED9B
	 fnP/bKcki6ZWklSUJ9AQNo7pzaiJ0YGS2j2ljFcDGp1MvplnhGPsKpPvXouYd32S/i
	 Vy7qxnk/+8C1g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 914561099B30;
	Fri, 20 Mar 2026 19:57:25 +0000 (UTC)
From: Dave Marquardt via B4 Relay <devnull+davemarq.linux.ibm.com@kernel.org>
Date: Fri, 20 Mar 2026 14:57:24 -0500
Subject: [PATCH b4] prep: Make `b4 prep --edit-cover` remove already_ran
 file under $GIT_DIR
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-fix-edit-cover-with-workspace-v1-1-6023305b0f93@linux.ibm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0Q6CMAyF4VchvbbJHAaJr2K8YF2RasJIO8CE8
 O5OufxPcr4NjFXY4FZtoLyISRpLnE8V0NCNT0aJpcE737jaO+zlgxwlI6WFFVfJA65J3zZ1xEj
 BteTrNjbhCsWYlMvh798hXOBxbDaHF1P+wbDvXyti+g6FAAAA
X-Change-ID: 20260320-fix-edit-cover-with-workspace-cb08c238d6b7
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Dave Marquardt <davemarq@linux.ibm.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774036645; l=2942;
 i=davemarq@linux.ibm.com; s=20260216; h=from:subject:message-id;
 bh=wG9tDn/tdqEtNmXCivhG+G9IX8uEt4PbH8HvACzz4Hw=;
 b=yhu4x3KU5C9yEwIKnvDPhkVJPeFspiRBz1Hfv2FLpjkDz9oaN6Ouh8hoXu7jTXAO1A9CnAHT+
 J+z6FtalcOkAewTJTsfOhrgLsh4mX0CDqraptH3NQEfw7JCe79ECpiL
X-Developer-Key: i=davemarq@linux.ibm.com; a=ed25519;
 pk=vy0/nfobrje6EqZxuyw6a3ZstytG8WK2vf5Y3xtGrEg=
X-Endpoint-Received: by B4 Relay for davemarq@linux.ibm.com/20260216 with
 auth_id=689
X-Original-From: Dave Marquardt <davemarq@linux.ibm.com>
Reply-To: davemarq@linux.ibm.com

From: Dave Marquardt <davemarq@linux.ibm.com>



---
The `b4 prep --edit-cover` code calls git-filter-repo to update the
cover letter. When using a Git worktree, the user may get a confusing
message like

    Invoking git-filter-repo to update the cover letter.
    The previous run is older than a day (/home/davemarq/linux/linux/.git/worktrees/ibmvfc-fpin-bis/filter-repo/already_ran already exists).
    See "Already Ran" section in the manual for more information.
    Treat this run as a continuation of filtering in the previous run (Y/N)? n

There's code in run_frf() that removes
<top-level>/.git/filter-repo/already_ran, which may have been left
behind by git-filter-repo. This doesn't work for Git worktrees, where
the file is $GIT_DIR/filter-repo/already_ran. GIT_DIR is set to a
worktree-unique directory under the repository top level directory in
the worktree case. This update uses $GIT_DIR, which works for both
repositories and worktrees.

Signed-off-by: Dave Marquardt <davemarq@linux.ibm.com>
---
 src/b4/__init__.py | 10 ++++++++++
 src/b4/ez.py       |  8 ++++----
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 46f3598..5a3c249 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -4029,6 +4029,16 @@ def git_get_toplevel(path: Optional[str] = None) -> Optional[str]:
         topdir = lines[0]
     return topdir
 
+def git_get_gitdir(path: Optional[str] = None) -> Optional[str]:
+    topdir = None
+    # Are we in a git tree and if so, what is our git-dir?
+    gitargs = ['rev-parse', '--git-dir']
+    lines = git_get_command_lines(path, gitargs)
+    if len(lines) == 1:
+        topdir = lines[0]
+        if not pathlib.PurePath(topdir).is_absolute():
+            topdir = Path.cwd().joinpath(topdir)
+    return topdir
 
 def git_get_common_dir(path: Optional[str] = None) -> Optional[str]:
     gitargs = ['rev-parse', '--git-common-dir']
diff --git a/src/b4/ez.py b/src/b4/ez.py
index 9b0e010..b7afab5 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -156,10 +156,10 @@ def run_frf(frf: fr.RepoFilter) -> None:
     logger.debug('Running git-filter-repo...')
     frf.run()
     logger.debug('git-filter-repo complete')
-    gtl = b4.git_get_toplevel()
-    if isinstance(gtl, str):
-        # Remove .git/filter-repo/already_ran
-        already_ran = os.path.join(gtl, '.git', 'filter-repo', 'already_ran')
+    gitdir = b4.git_get_gitdir()
+    if isinstance(gitdir, str):
+        # Remove $GIT_DIR/filter-repo/already_ran
+        already_ran = os.path.join(gitdir, 'filter-repo', 'already_ran')
         if os.path.exists(already_ran):
             logger.debug('Removing %s', already_ran)
             os.remove(already_ran)

---
base-commit: bc6c4d853c7eace3b7f325cbd17dfe2d67760fb7
change-id: 20260320-fix-edit-cover-with-workspace-cb08c238d6b7

Best regards,
--  
Dave Marquardt <davemarq@linux.ibm.com>


