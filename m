Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1994738F22D
	for <tools@linux.kernel.org>; Tue, 23 Jun 2026 23:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782258113; cv=none; b=PAp/3X62GadgnR1FGUteNfPzC8HSf4xsQ/5m6z8kQAstmCdvGU4LaYxhIBzDvjMp/DLGvWJmBVzDjE+F6mttpbeflwQwwRoOP2lbpKf1+jvy0slIPiv7yDItCjm7gKHe0Gm3rCSaeeVI+yHpuvqSNNRa50B9R9R5ri9tfQGsHmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782258113; c=relaxed/simple;
	bh=Dur+1ET2bnAzroMMqFCmHB7FzaueBrAzZlgEPdGuF8M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CKiyrjdiFbkO4tJJYusHf3TU8+APBDfXvawjsV634uxYaHnhMl8FQCVcmCYp7Rv+LLoHVHWOz1wGiqAs8oC/96HUDMCONdH6yELOpwz8k46SK8miBm2JqUI3H8BjzejI3o3jIQdz6YnpVCbVBk2zHQ03u/5+9hBTRnaZUWokNqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E4VpgqI0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E4VpgqI0"
Received: by smtp.kernel.org (Postfix)
	id F293A1F00A3D; Tue, 23 Jun 2026 23:41:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 248281F000E9;
	Tue, 23 Jun 2026 23:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782258111;
	bh=koQdD6pdFgap62cTlvE8EewTnMxtLWlz9RU1XCK/xEQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=E4VpgqI0/axLu/blbdnOfbLxf16ndqcZu4Kdr7jRLPm9jScZV1MsERKgE6htcnAXG
	 Pp4uh8SPk/3IDUH4yaIx3ukxKtc1syUfhnJbgGsx/xxFnwWDORUrifMtR6ZTEtl4l4
	 gBxFIOAgcd4Y+/Fv8OlDbrZXlZgSoKknjaENsmz8Yo+UA0Dc/zfvtehVKu6VhrlYZe
	 MTX7L50k9rk8w2SehAK9olESRTc6uYw79ExUiUGKZQ7clUGO8sEu69mwAtcSM0fZ53
	 VXhZbIYXZQ4Jzfsdm7Bw50LNaPUkNQBp/lnJSIdVImpZwBBSSYN/OfEJoGnFzz/gYr
	 hUiF6yvPnswjw==
From: Christian Brauner <brauner@kernel.org>
Date: Wed, 24 Jun 2026 01:41:40 +0200
Subject: [PATCH b4 5/5] shazam: note subshell alternative to the --resolve
 two-phase model
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-shazam-resolve-native-am-v1-5-91f5e5678998@kernel.org>
References: <20260624-shazam-resolve-native-am-v1-0-91f5e5678998@kernel.org>
In-Reply-To: <20260624-shazam-resolve-native-am-v1-0-91f5e5678998@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-6067f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1991; i=brauner@kernel.org;
 h=from:subject:message-id; bh=Dur+1ET2bnAzroMMqFCmHB7FzaueBrAzZlgEPdGuF8M=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWRZS26f0RKTvjbofOecb1mqDDd2HirQltvqGeI+9eUZ4
 8r4HXctO0pZGMS4GGTFFFkc2k3C5ZbzVGw2ytSAmcPKBDKEgYtTACaS4MXIsG2NfO3JQ3/eac66
 FPb92WXh9TN3Pai9r6o/M0nJtWJP5QmGf0q3OOL0bofNXzsnQMUv4myCllHLJIv7k5XEfi2vPLa
 xggkA
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

