Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06B3379C2A
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 21:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785535164; cv=none; b=iD4oP9HPfXOf3nrr3dkChnrXTovyEj8DqtMb6fDc/06JbvtYRX3KpN7edAEfP8WIwpDPwhO6gsDgVX4qcIXxj0HZWc9O3ZRdJvKIvZQvJ3rfXnmEG66zObxBzxp+nBFR6ghontj3r46Yj1ir2ViwSblyY5UJTZdGDEn6X4D97ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785535164; c=relaxed/simple;
	bh=xFF2x8+ImMiAPtAvMKkBz+rs/uvKwtVsAubgHhED8PI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H59YweOO66JMHxjIz4hWAqAv1+SX1cjKekrOynIOFm66lvrE6eiIeMJzaoetddBnPUfRvrq/RqNzEHzqdG9njQ7T2BvLYCY6E+4W7IIzLZbM8Dsvisk1hrigpgT1vQsiL7xrL5uXP4QHQWQST1dDRJ/NEAxa+BouDaGk4XKs1u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xy3C1+68; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xy3C1+68"
Received: by smtp.kernel.org (Postfix)
	id DCCC91F00ACF; Fri, 31 Jul 2026 21:59:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19C7E1F00AC4;
	Fri, 31 Jul 2026 21:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785535162;
	bh=tOPrW3JEPjjWu8PRIKq3lqZMBU50ycGKDZEetP2tP6E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Xy3C1+685s9XY0c8cUpqi0WoAxvG1fwtqFbvVrmhwSGAgJgM5/PcfRvwvNJ+aZX8p
	 oawRqZ2MwNydAxLSxDb4AjycXbESRGjWfivS67bikIZh5SxnKO7Zs1Ar8ipAABaxmz
	 TyQetzrBqESxmTHBfgpvhF+hkBH+plte3srs0sNkxilqzMtEIo4bHs/EASdsbhmol1
	 1eXFC44BjvHjwkM5Q9KR2vmkVpdCVnDEV51dJxBL6zd/Wilg3591dvPyWOAzCf4E1p
	 LJprPDC9/nd7oGWDdtesNATJ2KDNwod4rboVIRjhQ2OvtH4+nJnJA2IhaUAPDmoEnJ
	 60DbGo74sy1UA==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 23:59:05 +0200
Subject: [PATCH b4 v2 24/44] tests: cover the review TUI's branch-restore
 guard
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v2-24-243fd19d322d@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=2202; i=brauner@kernel.org;
 h=from:subject:message-id; bh=xFF2x8+ImMiAPtAvMKkBz+rs/uvKwtVsAubgHhED8PI=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlSs2JreXw0N1/SLF2z7cre/UyhUOOv36a+o3vIsudU
 MWsjMrHHaUsDGJcDLJiiiwO7Sbhcst5KjYbZWrAzGFlAhnCwMUpABM52s/wz1LVu+jn4+yFcpNr
 OwV2hgR2fPm4riiyNPX21zN8XzP94xgZHjVMXfRjVr/BqTXSzA+tFXLWR33PeeESk6XNcFhpe6c
 zGwA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

A checkout the user made is left alone. One the TUI made itself is
still undone.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/tests/test_tui_review.py | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/src/tests/test_tui_review.py b/src/tests/test_tui_review.py
index e168b24..8ac6113 100644
--- a/src/tests/test_tui_review.py
+++ b/src/tests/test_tui_review.py
@@ -626,3 +626,39 @@ class TestEditorFailure:
             assert notified.call_args.kwargs.get('severity') == 'error'
             reviews = app._patches[0].get('reviews', {})
             assert not reviews.get(my_email, {}).get('reply')
+
+
+class TestBranchRestore:
+    """b4 only puts back a branch it moved itself."""
+
+    def test_restore_skips_a_checkout_b4_did_not_make(self, gitdir: str) -> None:
+        """The worktree the TUI runs in is shared with the user's other
+        terminals; a branch they switched to there is not ours to undo."""
+        branch, _shas = _create_review_branch_with_patches(
+            gitdir, 'restore-foreign', ['patch 1']
+        )
+        session = _build_session(gitdir, branch)
+        session['original_branch'] = 'master'
+        app = ReviewApp(session)
+        app.branch_checked_out = True
+
+        ecode, _out = b4.git_run_command(gitdir, ['checkout', '-q', '-b', 'mine'])
+        assert ecode == 0
+
+        app._restore_original_branch()
+        assert b4.git_get_current_branch(gitdir) == 'mine'
+        assert app.branch_checked_out is False
+
+    def test_restore_undoes_b4s_own_checkout(self, gitdir: str) -> None:
+        branch, _shas = _create_review_branch_with_patches(
+            gitdir, 'restore-own', ['patch 1']
+        )
+        session = _build_session(gitdir, branch)
+        session['original_branch'] = 'master'
+        app = ReviewApp(session)
+        assert app._ensure_branch_checked_out()
+        assert b4.git_get_current_branch(gitdir) == branch
+
+        app._restore_original_branch()
+        assert b4.git_get_current_branch(gitdir) == 'master'
+        assert app.branch_checked_out is False

-- 
2.53.0

