Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657033939B0
	for <tools@linux.kernel.org>; Wed, 24 Jun 2026 08:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782291124; cv=none; b=Bfvopy1Zr7b0Nv7RMN/K0jNhnVp0XmT02dYTPpOtpDKZhEclj1GubCjtLZhNDlpFHAIZxc6L2n73bkqxzR7gGXI00GDftOpz/yCtIB0ZROX6cT2qms8gVF/JYXmrNb8djgkRi8p2pWofP8jzeorbjA9MdpQ35BIOFNolbJV+NLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782291124; c=relaxed/simple;
	bh=Dur+1ET2bnAzroMMqFCmHB7FzaueBrAzZlgEPdGuF8M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zh/wQGtC05cS9bhl1tjMK68A5b4aRFFl7VXJBgVurR0ESFMykdvg+jc3Zk4vkswq8WaTxclcXXeyJme1R0ohgQ5vUTk9WeZ2K0Ny1drJPrXXkIvnYXoDeqOALQM4P2QmYKdhJcI7rtBO3VxR1puYCaYQY4FhSg5pMIzxsvIWMDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DRVMhLkU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DRVMhLkU"
Received: by smtp.kernel.org (Postfix)
	id 14E461F00A3D; Wed, 24 Jun 2026 08:52:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31FD11F000E9;
	Wed, 24 Jun 2026 08:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782291123;
	bh=koQdD6pdFgap62cTlvE8EewTnMxtLWlz9RU1XCK/xEQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=DRVMhLkUbsWBIpuvDnnBS9MxeTWWRl0UOCUKWDva3Kvqf+xaToYu9w7Wok5XIz61q
	 9v/I0k1srLqmEViMbEhdj669+BCniXV7FHC0WEhl5GmOUhPwlrXhYSvopHy/CIvMvh
	 KUkbyAKtQYKNaKppKnwEZ5IosS1lYOM5GRhxhvPyJmOuvtOH735Bc56J3EQX2kVYNL
	 rOiobN7CkCSW/f5c7jmXnJDTuUPD0a/yMDM50VjFrnGDH+C7bsvSt3A1H8ieemF92c
	 OX82Fz2aC1SkOc9c7ijIht3KAq6fecJel1Skuc/KXi94OsRC41C32TCtihcAjfWaFT
	 3Yx9g3X9aHKUw==
From: Christian Brauner <brauner@kernel.org>
Date: Wed, 24 Jun 2026 10:51:57 +0200
Subject: [PATCH b4 v2 5/7] shazam: note subshell alternative to the
 --resolve two-phase model
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-shazam-resolve-native-am-v2-5-97b3a1bc497a@kernel.org>
References: <20260624-shazam-resolve-native-am-v2-0-97b3a1bc497a@kernel.org>
In-Reply-To: <20260624-shazam-resolve-native-am-v2-0-97b3a1bc497a@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-cd519
X-Developer-Signature: v=1; a=openpgp-sha256; l=1991; i=brauner@kernel.org;
 h=from:subject:message-id; bh=Dur+1ET2bnAzroMMqFCmHB7FzaueBrAzZlgEPdGuF8M=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWRZz1p9fUKPjsicP3lSMcsm5y548ZEjsJ+HxUnXzPfCt
 7a/mbK/OkpZGMS4GGTFFFkc2k3C5ZbzVGw2ytSAmcPKBDKEgYtTACbyV5nhr2gJQ8rWJ0yrI84L
 iB3ZF6E+Jd/S4l6NA8/vP5/jWm/MnMLIcC4ves2FUD7ZxUlyGvwZ9QJ9S6VMst5pLZiVvzzjQPQ
 9NgA=
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

