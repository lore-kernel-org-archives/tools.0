Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1F43B38AE
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 09:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785489710; cv=none; b=uujFb36UTU94Tv1vQv0fVkTChgZK9lvWh0uUmEwL4Ute+/iCgmX7Qn+I05i2Sj/FjZnnXAjP2fUc+SnJB1CYWRCCWnVsFFf00HhE+KaNg8GWjEtPBPF83vWatGEi2GDK9H+ueHI/gznbzO8chEuldoqeHCLD2ApMXolnGEwjL0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785489710; c=relaxed/simple;
	bh=3Ur+dd9D/BCIz17/7jkRiGDdBQt9lr8m0nu0VewqzZc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HL7WB1OyXf2pFNCsXkfzofqd1WXkAjmpbZcfJycVyc0z3mUQ4ujxWw7V0ekP21iFa0u/J607NWi8+0Saw2MfArLV7Wwwn8Cpj+4NUQHjIiixfMhNDKle0SDo9rZtaSRLTuMpfm7JpGspFo6MKVosUJx3NyPVAKawUYf36EPhI8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ggzjJcdd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ggzjJcdd"
Received: by smtp.kernel.org (Postfix)
	id DE6411F00A3D; Fri, 31 Jul 2026 09:21:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CD8A1F000E9;
	Fri, 31 Jul 2026 09:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785489708;
	bh=eLZOwaAqiLTrCO7a2S8t4MLLG7+mb4szzgOKwesUHV8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ggzjJcdd34GJr/AhEMFfP4B2hGvCFC5oy1ibqd5YJHGyLaVs4vm5uvUmHHass/XZ7
	 Iyj8GvN+gNNYECeKyiuuIB9vO1F0thme13YOD9b1rsizRkbGo0r9cBcbLCR/Xwdne4
	 k9sZ5GVrX4ecek3hm33Wnlo7EhnWcOyhiOlyWJ28QcJCTZKh6Isg6vfhOtMlL7/xN5
	 UkGwBZNredy1mJ3O6gIHEqJK//mXnheJHPO3s/ATMPRWTwPvMGopZqD8OLWnT9MtUN
	 csUgYg1tw122aYuedUM45PYoFtPVsP5+a1ta5qet4yHHN1WRj9iedBrma9iV5nPzEX
	 ee7rixcnvBDIQ==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 11:21:17 +0200
Subject: [PATCH b4 18/27] tests: cover edit_in_editor working in the
 caller's tree
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v1-18-de68a7c8e4cb@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v1-0-de68a7c8e4cb@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v1-0-de68a7c8e4cb@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=3075; i=brauner@kernel.org;
 h=from:subject:message-id; bh=3Ur+dd9D/BCIz17/7jkRiGDdBQt9lr8m0nu0VewqzZc=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlZIq9vhd7rD5CoDhp7re/BhuCDoT78E9VZRS5Z5C68
 rz5RemfHaUsDGJcDLJiiiwO7Sbhcst5KjYbZWrAzGFlAhnCwMUpABPpUmRkWH9FZWv5x++/1ofP
 WlKW51xzTO9MZ/pD98LEFvng50IxeYwMr+d+XLfw0L998x7ZztppsaRzn2K4y8MZU2M0b0pfiVn
 3iAkA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Runs against a linked worktree sitting on a different branch than the
cwd, which is the case the argument was added for, and checks that
core.editor is read from that tree too.

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

