Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496D21A6800
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 21:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785535166; cv=none; b=u8ctbzWfm9Vl9VVazXd0b/8OdWMcRhbiGewq6Raq/0+tzzovhUlBEbDkTxcBufVjLNF9nSQuKysnU6XH/P8SMfpbT81eYeJQ+K9IBLdZcOfi+XsExtgSDR159gMIaDPmqrpKWrEUOUHh4isACK9i5aQwL3WLWTp50PY91SMwiss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785535166; c=relaxed/simple;
	bh=ag2sIgd/JFhAHwkaVh9QS+DUbYIG4LmgwRRIG6Q4EuI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wda/TJg/ndfxh+BeQ3xXMPJh6sflxtNL/uNorQMQ2HQyRvtdkeMJv8UfbHlFNJAqEzPJ+LqRfH4urb6CGJPTc0n6avnkM/bxDMeRRKWkKUP9yJ8b1bjdneP29gZMsPZ84HcjHdzR6qpl1o3QUEb2EJGtRl4dLf8yTdbwHHiyRkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q5VbEkDD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q5VbEkDD"
Received: by smtp.kernel.org (Postfix)
	id 401D61F00ADF; Fri, 31 Jul 2026 21:59:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 721391F00AC4;
	Fri, 31 Jul 2026 21:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785535165;
	bh=lRAFgda79ViqAdno4WAsw7xkL9scGkfFGriYpht150k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Q5VbEkDDw+nw+Ibfu8o5cJdbCZLdwy1CQY23beHjgn+XOzCSrsKvVrhR9WcaGG4p0
	 6doxTEJ6dVV1C0glTZkkFA+y5k7rKXQmwGkBmZqUT0E7emX/ymWZ1CdV118PpU1vXN
	 BZqTkIXO54kPEeZDLLdMsdN0zevgEEdP88GXPd34VexpziLoGupTotO0mAbT08YqRy
	 d+XY5NsoyhOMG/+hsKduKaqubjNd+dJLiTdjsmqCl8xkum68Z3AfhOQp25D6uFJxL5
	 +V6TZx6+L1H8uFViZ6P3iKE1XFVP+tuSOYGK7NDkPecJSRfSWRxwYhj/PQPzDldy/7
	 LKEnh+pADfviA==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 23:59:07 +0200
Subject: [PATCH b4 v2 26/44] tests: cover the restore from a detached HEAD
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v2-26-243fd19d322d@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=5242; i=brauner@kernel.org;
 h=from:subject:message-id; bh=ag2sIgd/JFhAHwkaVh9QS+DUbYIG4LmgwRRIG6Q4EuI=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlSs35KHD89NS/mY8SnjOd4X12V2LNtAsXli+Zb7jhn
 MI+Znfjex2lLAxiXAyyYoosDu0m4XLLeSo2G2VqwMxhZQIZwsDFKQAT2czK8M96X6bQpes1+Q/i
 vx+oqPbdZhzsvvTrqeik+Sunq3JHCFxlZPhz503DPdU9ZnlJGvPjeKouf5DRMFtQ1Hb5vOiJ/b6
 KLJwA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

The helper names the branch when there is one and the commit when
there is not, the session records it, and the review app puts HEAD
back on the commit it started detached at.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/tests/test___init__.py   | 30 +++++++++++++++++++++
 src/tests/test_tui_review.py | 63 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 93 insertions(+)

diff --git a/src/tests/test___init__.py b/src/tests/test___init__.py
index 9433606..b5e1f70 100644
--- a/src/tests/test___init__.py
+++ b/src/tests/test___init__.py
@@ -1352,3 +1352,33 @@ def test_edit_in_editor_reads_core_editor_from_topdir(
 
     assert b4.edit_in_editor(b'note\n', filehint='note.txt', topdir=other) == b'note\n'
     assert seen.read_text() == 'topdir'
+
+
+def test_git_head_restore_args_names_the_branch(gitdir: str) -> None:
+    assert b4.git_head_restore_args(gitdir) == ['checkout', 'master']
+
+
+def test_git_head_restore_args_names_the_commit_when_detached(gitdir: str) -> None:
+    """A detached HEAD is a starting point too, and the only thing that can
+    be named for it is the commit."""
+    ecode, out = b4.git_run_command(gitdir, ['rev-parse', 'HEAD'])
+    assert ecode == 0, out
+    sha = out.strip()
+    ecode, out = b4.git_run_command(gitdir, ['checkout', '-q', '--detach'])
+    assert ecode == 0, out
+    assert b4.git_head_restore_args(gitdir) == ['checkout', '--detach', sha]
+
+
+def test_git_head_restore_args_round_trip(gitdir: str) -> None:
+    """Running what it returns puts HEAD back exactly where it was read."""
+    ecode, out = b4.git_run_command(gitdir, ['checkout', '-q', '--detach'])
+    assert ecode == 0, out
+    restore = b4.git_head_restore_args(gitdir)
+
+    ecode, out = b4.git_run_command(gitdir, ['checkout', '-q', '-b', 'elsewhere'])
+    assert ecode == 0, out
+    ecode, out = b4.git_run_command(gitdir, restore)
+    assert ecode == 0, out
+
+    assert b4.git_get_current_branch(gitdir) is None
+    assert b4.git_head_restore_args(gitdir) == restore
diff --git a/src/tests/test_tui_review.py b/src/tests/test_tui_review.py
index 8ac6113..3d78ec3 100644
--- a/src/tests/test_tui_review.py
+++ b/src/tests/test_tui_review.py
@@ -662,3 +662,66 @@ class TestBranchRestore:
         app._restore_original_branch()
         assert b4.git_get_current_branch(gitdir) == 'master'
         assert app.branch_checked_out is False
+
+    def test_restore_lands_back_on_a_detached_head(self, gitdir: str) -> None:
+        """A session that started detached has a commit to go back to, and a
+        branch name is not it -- so nothing used to put the user back."""
+        branch, _shas = _create_review_branch_with_patches(
+            gitdir, 'restore-detached', ['patch 1']
+        )
+        ecode, _out = b4.git_run_command(
+            gitdir, ['checkout', '-q', '--detach', 'master']
+        )
+        assert ecode == 0
+        ecode, out = b4.git_run_command(gitdir, ['rev-parse', 'HEAD'])
+        assert ecode == 0
+        start_sha = out.strip()
+
+        session = _build_session(gitdir, branch)
+        session['original_head'] = ['checkout', '--detach', start_sha]
+        app = ReviewApp(session)
+        assert app._ensure_branch_checked_out()
+        assert b4.git_get_current_branch(gitdir) == branch
+
+        app._restore_original_branch()
+        assert b4.git_get_current_branch(gitdir) is None
+        ecode, out = b4.git_run_command(gitdir, ['rev-parse', 'HEAD'])
+        assert ecode == 0
+        assert out.strip() == start_sha
+        assert app.branch_checked_out is False
+
+
+class TestSessionRestorePoint:
+    """_prepare_review_session() records where HEAD has to go back to."""
+
+    def test_records_the_branch(self, gitdir: str) -> None:
+        import argparse
+
+        branch, _shas = _create_review_branch_with_patches(
+            gitdir, 'session-head-branch', ['patch 1']
+        )
+        ecode, _out = b4.git_run_command(gitdir, ['checkout', '-q', 'master'])
+        assert ecode == 0
+        session = b4.review._prepare_review_session(argparse.Namespace(branch=branch))
+        assert session['original_branch'] == 'master'
+        assert session['original_head'] == ['checkout', 'master']
+
+    def test_records_a_detached_head(self, gitdir: str) -> None:
+        """Without the commit there is no name for where the user was, so the
+        review app has nothing to put them back on."""
+        import argparse
+
+        branch, _shas = _create_review_branch_with_patches(
+            gitdir, 'session-head-detached', ['patch 1']
+        )
+        ecode, _out = b4.git_run_command(
+            gitdir, ['checkout', '-q', '--detach', 'master']
+        )
+        assert ecode == 0
+        ecode, out = b4.git_run_command(gitdir, ['rev-parse', 'HEAD'])
+        assert ecode == 0, out
+        sha = out.strip()
+
+        session = b4.review._prepare_review_session(argparse.Namespace(branch=branch))
+        assert session['original_branch'] is None
+        assert session['original_head'] == ['checkout', '--detach', sha]

-- 
2.53.0

