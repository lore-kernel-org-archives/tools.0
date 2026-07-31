Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FE530C158
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 09:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785489714; cv=none; b=cOw6Lth0T+ScuPoOYzDP4ECz4J0me8BTqYqs+0+OJoh27I/hy0x1fiAlY5DpmoKtPRIGL2N9J50kvjOnUuvcbBmTdooaD+IlBF/0Hy94YS0m9TMeFDMf2S8HeqK8N3xeS9O6JFKLfX6LJAXrBh1liV/2KoTvVVHfjqoNlbRrxE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785489714; c=relaxed/simple;
	bh=EO1FCz/JeFaGAtFX/6wC7nzP34+BNvqzNH0crb7WX/k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CGTlitNKvdFchV6SmnNTqY3WrtPOHPxSrfiCjoNpQsVW5JDTI6sIeOadTDpJGgqZU3zeBVf6xxRDzPvGswKCMTEdQEpFBPZT7qowy10oUWHnLtnNpxXY0bHEgIhkqGXJ6lX4NvKkcgHikVBb20eIK5MjrFabvYqJayuaBWhNabk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gWkmGKtm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gWkmGKtm"
Received: by smtp.kernel.org (Postfix)
	id 89CD91F00A3D; Fri, 31 Jul 2026 09:21:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB5021F000E9;
	Fri, 31 Jul 2026 09:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785489713;
	bh=DuTyrzTQ3YIrKZK832bUldb3y+WtOy+qjVKNhTTl32g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=gWkmGKtmMSB+SwgclGJw4h38C0TZ0+6bxOa52G0pd3fU2gsrWVznpnwiUT/wS+K9T
	 9YXyVlkFQE8S7K1GkbZsLQSAe1e6sO0GGXe0DswtH0IcOALMj5s7a0EP1Q64uswiL/
	 DLnNatuqi2ocD4ffTrB2lUZ/qM6k2hVnq172qKsZ4xusa/lg+iG28i+BOPpF0uzcug
	 bKsG6fjaLYfsm4xEsXQXvTJkyv5pO1svMIr7Xkd/IscVNB5sIdndeIkj2eK5mWqOeY
	 S0CL3b23L2D1AlBkmsAbjm+koP3ChFrhSlYLPAYUAgay+nh1KNpUjCsMm/qkoQoknD
	 kbM2wuRnRcUxQ==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 11:21:21 +0200
Subject: [PATCH b4 22/27] tests: cover the review TUI's branch-restore
 guard
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v1-22-de68a7c8e4cb@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v1-0-de68a7c8e4cb@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v1-0-de68a7c8e4cb@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=2247; i=brauner@kernel.org;
 h=from:subject:message-id; bh=EO1FCz/JeFaGAtFX/6wC7nzP34+BNvqzNH0crb7WX/k=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlZIotubjznu3U5rLDq90rStceLJxlN+VB4yTPDYL7W
 A3K05OfdZSyMIhxMciKKbI4tJuEyy3nqdhslKkBM4eVCWQIAxenAEzETIGR4aZ/t7ndUk6GCX88
 OmYvulW8a+qdLRd7vp793HlSLvfghbMM/+sTHjVMWvSiZdLPTacbDDi/bXP9muXD9O/uzsicLYZ
 zb/EDAA==
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

One for each side. A checkout the user made in the shared worktree is
left alone and one the TUI made itself is still undone.

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

