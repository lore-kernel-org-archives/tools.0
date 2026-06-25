Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61BA3ADBA3
	for <tools@linux.kernel.org>; Thu, 25 Jun 2026 12:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782389383; cv=none; b=VOHCv8aWcPIHZiicA3RgtJCDO1mivzUwjVQQQJDy52lbbpG0BgVmkfN9GyL72daTBd9RXKZLHZMugZ/dLbe2F4fkdFq+egMGJWaulXGqkt2mmxVcpZ/m7zy7VY4/O+74wR5DBNsjQxGX7L1/RhTuhGdTdjNzAQluXYT/v2Dy5vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782389383; c=relaxed/simple;
	bh=Dur+1ET2bnAzroMMqFCmHB7FzaueBrAzZlgEPdGuF8M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q6FY2/yRcdzU4vxdhsGxnWyAFXvk7kkn6FwFnVRc9oPliXdJbL2DLDE9q5xxeylffij3ddN1pr7Fjs3/Df8oV+xPBtkC4LrY8zBLmgXmOR5UhPSc/A4ppT/Li7wEjubX1pLoNnuLYPgunSaQLqDnAZRl1G0fX3xfrgL4lPN1oFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XvafSPCm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XvafSPCm"
Received: by smtp.kernel.org (Postfix)
	id B4F2B1F00A3D; Thu, 25 Jun 2026 12:09:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFC121F000E9;
	Thu, 25 Jun 2026 12:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782389382;
	bh=koQdD6pdFgap62cTlvE8EewTnMxtLWlz9RU1XCK/xEQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=XvafSPCmdrzwsz9oM4DmY9J6se7qA0ccpRRhO/r0Yqf+AymlISNeTjuXh3wmn3Fad
	 Q9ETvVnOr0IVLGOKcAI81t58jGkajOwZ2xwOhggFUyBGy8iX69Do+7z/6p1z2iAVn/
	 /V/pMA0hqTRBQU5OSNxorUcAnO70uZRRDioUSU2+WWdtMQUvZghI7h/xtiN7JhYDwM
	 NUP2798oooo67suM5FNn65XS2dm7ho4jih7vK6u1Wl5VG2R6b3bqcyBCFtjVNJ4pQK
	 EkHpkAcCKuxOTBdJUQlP5ZF/5c7b+r7dVpVOloEsPdfZy1r1/ZKTDYM3HK17E0lyRf
	 KK7j29/NrMHHg==
From: Christian Brauner <brauner@kernel.org>
Date: Thu, 25 Jun 2026 14:09:25 +0200
Subject: [PATCH b4 v3 5/9] shazam: note subshell alternative to the
 --resolve two-phase model
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-shazam-resolve-native-am-v3-5-622b37a7f3b2@kernel.org>
References: <20260625-shazam-resolve-native-am-v3-0-622b37a7f3b2@kernel.org>
In-Reply-To: <20260625-shazam-resolve-native-am-v3-0-622b37a7f3b2@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-0a195
X-Developer-Signature: v=1; a=openpgp-sha256; l=1991; i=brauner@kernel.org;
 h=from:subject:message-id; bh=Dur+1ET2bnAzroMMqFCmHB7FzaueBrAzZlgEPdGuF8M=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTZStU7K+7e29YW6raoYfMWqZcb3gsw2cjafvf1Ed/iw
 XDp/CHPjlIWBjEuBlkxRRaHdpNwueU8FZuNMjVg5rAygQxh4OIUgIl472VkOHi2bY9CpmR3WvDp
 m4cslVfZKH413sKkZ8WsuXBK3JxHxYwMP/9ILpJ+GS2Tre5tVz+96FAe65fNgf9nP83sDXu5m1W
 eFQA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

b4 shazam --resolve parks the conflicted git am and exits, finishing in a
separate --continue process; the review TUI resolves the same conflict
synchronously by suspending to a shell. Record a TODO to converge on that
subshell model, which would drop the persisted state file and the
--continue/--abort commands.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/mbox.py | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/src/b4/mbox.py b/src/b4/mbox.py
index 374328a..7852c1a 100644
--- a/src/b4/mbox.py
+++ b/src/b4/mbox.py
@@ -1066,6 +1066,20 @@ def _begin_shazam_resolve(
     the user drives it to completion natively and nothing is silently dropped.
     The fully-applied series is merged once, by ``b4 shazam --continue``.
     """
+    # TODO: switch --resolve to a subshell model like the review TUI's
+    # _resolve_worktree_am_conflict -- suspend into a shell in the worktree
+    # (blocking subprocess.run; b4 stays the parent) and finish inline when it
+    # exits: fetch+merge on success, tear the worktree down on "git am --abort"
+    # or an unfinished am. That drops the persisted b4-shazam-state.json and the
+    # separate --continue/--abort commands, at the cost of the git-rebase-style
+    # two-phase UX. Two constraints make it robust:
+    #  - b4 must stay alive while the shell runs (no sys.exit/os.execvp until
+    #    cleanup has run); _run_shazam_merge may only execvp git-merge at the
+    #    very end, once the worktree is already dropped.
+    #  - guard the worktree with try/finally (or atexit + a SIGINT/SIGTERM
+    #    handler) so it is reclaimed even if b4 is killed while the shell is up --
+    #    a shell "trap ... EXIT" analogue. Keep it outcome-aware (finished vs
+    #    aborted), never an unconditional remove, or a half-done resolution dies.
     gwt = cex.worktree_path
     logger.critical('---')
     logger.critical(cex.output)

-- 
2.53.0

