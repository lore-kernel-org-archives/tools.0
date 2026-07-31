Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BD437B3E4
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 21:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785535157; cv=none; b=pl0UTtqShZSWVIF2bnyvWSxJXbUUyL6MsWxGqNGigGgaJqkK91ItFXCENu9x3J/VHP7gQWTAKV0CEcmJgdcP+y+/rt1uCGtzWepDWBaEyt3hshBQGW++XyHRteh7cYYTkTi0bKuMPOqtosQQ2cORocqlSQimhW7r1WBB3amfRRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785535157; c=relaxed/simple;
	bh=EU9kMxCsz61L+3S4fx3ZkYlcM/ePOISJm77ip5AlsGI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OnxYlEhWFlNZ6R0QvN+SZ/Hm6MvZDwHlHNUwqoGZRee9tXuDejdOFulSVJ1brXfxqvj5TP+4L53Nt8PvO9nKw3oMMPGZiVl28hybrbqLpa4wlAoEy2dWPoHSUSNd3KxF86t8c1OX1dewdqYJ4GpLzo7ppx2gblKfOLEi1t4R3d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T5zlVkVr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T5zlVkVr"
Received: by smtp.kernel.org (Postfix)
	id C37991F00ACF; Fri, 31 Jul 2026 21:59:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 005D01F00AC4;
	Fri, 31 Jul 2026 21:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785535155;
	bh=tPY/wd8gJqjVXjs0NRraxOpyaojGAtEM1xy0mCAyIk4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=T5zlVkVryzSdvLUmgeZ9UUSdfEaFJQiI/riuVq9UX8LDmLRB3Yq5NALv66x49inuX
	 hjxuRH3w/dnkWqQa1VRBHhJGgbVrOC84EZmJ7/mejGRaghulqX+gxxvY3c1YfRFMWf
	 cMEH78amfm/0o8Am8HHycfvFXOg+GEJAilTuetewfCtFGZ+KG9AUa+SqrjYUf/99bb
	 234vf8MFNbpkDWdQojuNNxvDVXxQ+jIfaJgLQaI/44tXtdkb326dFItwZgPQa56Ifb
	 NHKHbiWK/njxGSHYFZHgWeCUhH1eQImfgIfPy8VSxbMDu3zYnGk6BqsW73bCtZtpGA
	 CuLVrCYw2pshg==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 23:58:59 +0200
Subject: [PATCH b4 v2 18/44] tests: cover edit_in_editor working in the
 caller's tree
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v2-18-243fd19d322d@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=3017; i=brauner@kernel.org;
 h=from:subject:message-id; bh=EU9kMxCsz61L+3S4fx3ZkYlcM/ePOISJm77ip5AlsGI=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlSs3eej4t6Ebmi2TV4liG9Pv6thO0cl/7LLj24l4eh
 7jN7+3ZHaUsDGJcDLJiiiwO7Sbhcst5KjYbZWrAzGFlAhnCwMUpABOR1mb4p707ZKH3NzHTM3KB
 a2c2moVujpzZaWPrrr7ZsWahyIS5FYwMV+0cy2eumXLkxiMb93BFUV2DTwJz9iV9z7hov3RTvak
 wCwA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Run against a linked worktree on a different branch than the cwd and
check that core.editor is read from that tree too.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/tests/test___init__.py | 54 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/src/tests/test___init__.py b/src/tests/test___init__.py
index d9addac..9433606 100644
--- a/src/tests/test___init__.py
+++ b/src/tests/test___init__.py
@@ -1298,3 +1298,57 @@ def test_edit_in_editor_guard_covers_a_detached_head(
         assert saved.read_bytes() == b'my trailers\n'
     finally:
         saved.unlink()
+
+
+def test_edit_in_editor_follows_the_topdir_it_is_given(
+    gitdir: str, tmp_path: pathlib.Path, monkeypatch: pytest.MonkeyPatch
+) -> None:
+    """topdir, not the process cwd, decides where the scratch file lands and
+    which HEAD the guard reads.
+
+    The TUIs may be driven from a different worktree than the one holding the
+    branch they operate on, so cwd is the wrong repository to ask."""
+    linked = str(tmp_path / 'linked')
+    ecode, out = b4.git_run_command(
+        gitdir, ['worktree', 'add', '-b', 'elsewhere', linked], logstderr=True
+    )
+    assert ecode == 0, out
+    seen = tmp_path / 'editor-argv1'
+    # Move the *cwd* repository's HEAD while the editor is open. The guard is
+    # on, so if it were reading cwd rather than topdir this would refuse.
+    monkeypatch.setenv(
+        'GIT_EDITOR',
+        _fake_editor(
+            tmp_path, f'printf %s "$1" > {seen}; git -C "{gitdir}" checkout -q -b side'
+        ),
+    )
+
+    # cwd is still on master; only the linked worktree is on 'elsewhere'.
+    assert b4.git_get_current_branch(gitdir) == 'master'
+    edited = b4.edit_in_editor(
+        b'note\n', filehint='note.txt', topdir=linked, guard_branch=True
+    )
+    assert edited == b'note\n'
+    assert seen.read_text().startswith(linked + os.sep)
+    assert b4.git_get_current_branch(gitdir) == 'side'
+    assert b4.git_get_current_branch(linked) == 'elsewhere'
+
+
+def test_edit_in_editor_reads_core_editor_from_topdir(
+    gitdir: str, tmp_path: pathlib.Path, monkeypatch: pytest.MonkeyPatch
+) -> None:
+    """core.editor is read from the named tree too, so a repository-local
+    setting is the one belonging to the branch being edited."""
+    other = str(tmp_path / 'other')
+    ecode, out = b4.git_run_command(None, ['init', '-b', 'master', other])
+    assert ecode == 0, out
+    seen = tmp_path / 'which-editor'
+    b4.git_set_config(
+        other, 'core.editor', _fake_editor(tmp_path, f'printf topdir > {seen}')
+    )
+    b4.git_set_config(gitdir, 'core.editor', 'false')
+    for var in ('GIT_EDITOR', 'VISUAL', 'EDITOR'):
+        monkeypatch.delenv(var, raising=False)
+
+    assert b4.edit_in_editor(b'note\n', filehint='note.txt', topdir=other) == b'note\n'
+    assert seen.read_text() == 'topdir'

-- 
2.53.0

