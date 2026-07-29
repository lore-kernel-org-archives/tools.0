Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7289D397E73
	for <tools@linux.kernel.org>; Wed, 29 Jul 2026 10:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785321891; cv=none; b=VfxpgimwWVTzgj6CjiWEdApEIBLR7pz2P1ZAx7JBGm2AvH2Q3M4VyxIERjVprMV9sJZ0RAJr5JRgtieAgh9rYoXy5TQQs3PuKH1JJVkIxcW+isqPWs0z9bkFCPOhhJqkZSejFsP865m5FZsFzNOOh+XxQ8Dv4bZ0GTiZQrRnKS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785321891; c=relaxed/simple;
	bh=ShQeMUvwmR37V6+1kkqxD/lUmV6CiWZoMi5az8b4dBQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FbDy+P/uBZE3aRbGCeQ4benXJUDpXUArHmQj1WMTfzRlKseg4GQk8R1oRL0h2FL0yO584LCp5on60wokNNYtbdCu+Hvdx5UNF9r0g6nEZauAip7JScGya8hrNTje6Qh5rZpto+k5h6cBMKwlFdcZfqz4wMK6DejKFJjXVl96KFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BWPe1eMs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BWPe1eMs"
Received: by smtp.kernel.org (Postfix)
	id 505041F00ACA; Wed, 29 Jul 2026 10:44:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E39B1F000E9;
	Wed, 29 Jul 2026 10:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785321880;
	bh=gyp9EEy54oLTCxQ5jt6sOgZtX++tWDP0dwl/d5Kh7TI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=BWPe1eMsWT74UfvbSOanFLlUMPVu8RWQXQGJ0cJiVnT46R0VGF2PaaPPFEZ2ELcD6
	 n16OC21Um3C83dqnlMc06ibD/6/EZUagBnWOvgkTNAZ1R9/qb5ibU5rRjDAR/Lyo7E
	 6VIFF84rxyoV4j6sIlRz23qknMn9cDJF5jIh+OYyP2mrICCAeXYathnSJtahnC8Dhh
	 LkvVvazK+gQy9rmmCH2Rf9aNyasAuFWjWxoPFGlJ36TT1YOUrWUk1WWh1szEUMSBXo
	 HshkNzl1nu3XVvWdEcOe13yHpoyDVMbNkRNPrcyhIA82Eesh5cEh/FTab+fnF+lfp+
	 H+u58Q5nYOXEw==
From: Christian Brauner <brauner@kernel.org>
Date: Wed, 29 Jul 2026 12:44:32 +0200
Subject: [PATCH b4 5/6] send: use the scratch-worktree overrides when
 tagging a sent series
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-work-b4-scratch-worktrees-v1-5-e96995158d4a@kernel.org>
References: <20260729-work-b4-scratch-worktrees-v1-0-e96995158d4a@kernel.org>
In-Reply-To: <20260729-work-b4-scratch-worktrees-v1-0-e96995158d4a@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-b7988
X-Developer-Signature: v=1; a=openpgp-sha256; l=3172; i=brauner@kernel.org;
 h=from:subject:message-id; bh=ShQeMUvwmR37V6+1kkqxD/lUmV6CiWZoMi5az8b4dBQ=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWRl3pxw9MDR7jPn0zarPZ4xe/qSl5+Frp2Mu2TrwaD0O
 uTdon0leR2lLAxiXAyyYoosDu0m4XLLeSo2G2VqwMxhZQIZwsDFKQATmXuA4Z/9ldtCejwL3Wae
 ZbVKs9jr+IXNha+n9/FLIReb7Rk/Zx9jZNjyqd5VyUn1a2FoL6tf98YpddO/XLDZyXPMWaPi0h1
 /dWYA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

When the cover lives in a commit, which is the default cover strategy,
reroll() builds the sent tag out of a scratch worktree: sparse
checkout, cherry-pick the series onto the base, fetch the result back.
That checkout is the one fixed in git_fetch_am_into_repo() and it dies
the same way with submodule.recurse=true.

Nothing tells the user. The whole block sits under a try that logs
"Error tagging the revision" and carries on, so b4 send finishes
normally and the sent tag for the revision is simply never created.

The cherry-pick keeps the user's signing config. Its commits are what
the tag points at, so they outlive the worktree.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/__init__.py | 2 +-
 src/b4/ez.py       | 8 ++++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index d418cee..bc4a797 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -140,7 +140,7 @@ LINKADDR = 'https://patch.msgid.link'
 # answer. Each override is inert where the other matters, so the one list
 # serves every scratch-worktree git command. Commits that outlive the worktree
 # are the exception and keep the user's signing config: the real apply in
-# git_fetch_am_into_repo. Fetching *out of* a
+# git_fetch_am_into_repo, the cherry-pick in ez.reroll(). Fetching *out of* a
 # worktree takes nothing -- that one runs in the user's repo, not in the
 # scratch, so the user's config still governs it.
 SCRATCH_GIT_OPTS: List[str] = [
diff --git a/src/b4/ez.py b/src/b4/ez.py
index 268d783..ec922e4 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -3302,19 +3302,23 @@ def reroll(
                 with b4.git_temp_worktree(topdir, base_commit) as gwt:
                     logger.debug('Preparing a sparse worktree')
                     ecode, out = b4.git_run_command(
-                        gwt, ['sparse-checkout', 'set'], logstderr=True
+                        gwt,
+                        [*b4.SCRATCH_GIT_OPTS, 'sparse-checkout', 'set'],
+                        logstderr=True,
                     )
                     if ecode > 0:
                         logger.critical('Error running sparse-checkout set')
                         logger.critical(out)
                         raise RuntimeError
                     ecode, out = b4.git_run_command(
-                        gwt, ['checkout', '-f'], logstderr=True
+                        gwt, [*b4.SCRATCH_GIT_OPTS, 'checkout', '-f'], logstderr=True
                     )
                     if ecode > 0:
                         logger.critical('Error running checkout into sparse workdir')
                         logger.critical(out)
                         raise RuntimeError
+                    # No SCRATCH_GIT_OPTS: the sent tag points at these commits,
+                    # so the user's signing config stays in force.
                     gitargs = ['cherry-pick', f'{start_commit}..{end_commit}']
                     ecode, out = b4.git_run_command(gwt, gitargs, logstderr=True)
                     if ecode > 0:

-- 
2.53.0

