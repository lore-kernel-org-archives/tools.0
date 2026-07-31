Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F79330C158
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 09:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785489707; cv=none; b=kXxDdl2LAoGUYSeEYRs+Dv3Q31frvSf308aNpW0iLjUPCGa9svMEB9PtRMC/PeDTJptta1J354byPfYFZt+Nn65/HvmdcbHJVwHE0GUdiMbJxSwwdO6DwwrmYq/oVd4OCKhBa4K7GtpDBTac5GMSqt6V1c+UX5RbOjdvGCjkrF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785489707; c=relaxed/simple;
	bh=AG7SUI8Fi+4eZcza/rEYqegtkWBPhurWIeezp6Mifls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VqJQvNB/3P7X6YVPYN4xBsywRnxszJAa4N5Xp7T30KNZr8Ky3FcZTTE+emhWGrxMFbI1FqEYwM4vhWmMdi2t+VyN7cDKIg1MZNdsITtqvtZaVvxae11qnqaX6ArtasG/qDV9G1bOV/De8CBC42UyWeQfJMUCuqm6yuoXhAhweS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XbsWT/f3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XbsWT/f3"
Received: by smtp.kernel.org (Postfix)
	id 8DF3D1F00A3D; Fri, 31 Jul 2026 09:21:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C144A1F000E9;
	Fri, 31 Jul 2026 09:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785489706;
	bh=V+g7yR/diVQJZU6i3x9YTSAapOxiIs+G6lqzT/pO13g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=XbsWT/f3yofRVe7JFj86MjCrn9zeZKKqxt+6WselLVyrXFg8JqJA4PK4WXSSoLz/J
	 nfk1bmo09M8XUVkkVMoCo1pDGfm/7XjgyMi9dDJ27ly6l+DCGc34Cd0xMISPwoRxRG
	 86nwdoLDNLsVvBuOzDN1A0gGYv9CFVBrjFlw24nzK7kwfmrXvX6jP3IF6pM9d30IsU
	 oZzwSCkDzcMUscclES6Ox/VW0saENPneE0Nj3vn3ihY61rp9Cf+WsRiDoOOsaTmryD
	 tf98U1pPsUB/v23yZ6dIemx+OrQp9dy0OB1k8fiXAV/5joCIzTwGsqR5cePF2iTB5v
	 vDrfzuCepCYZA==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 11:21:15 +0200
Subject: [PATCH b4 16/27] tests: cover the opt-in branch guard in
 edit_in_editor
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v1-16-de68a7c8e4cb@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v1-0-de68a7c8e4cb@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v1-0-de68a7c8e4cb@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=3526; i=brauner@kernel.org;
 h=from:subject:message-id; bh=AG7SUI8Fi+4eZcza/rEYqegtkWBPhurWIeezp6Mifls=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlZIrZxvxo+LrJ6dHKlUc/6HzQCbdZcf/pMweFdwfaB
 M8wLrv4tqOUhUGMi0FWTJHFod0kXG45T8Vmo0wNmDmsTCBDGLg4BWAimy4zMjyM+RPlc4hnouA6
 Nw7B6Tp+bfrr1QOYuVc9Ev0UFcQ5+wEjw92Hfu21Td/bNv/LCGj+xzh1NsfeqJ3/Lx1o+rPlUsJ
 pdx4A
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Both halves. A caller that doesn't opt in gets its text back across a
branch switch, and one that does is refused and keeps the text in a
temporary file.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/tests/test___init__.py | 64 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/src/tests/test___init__.py b/src/tests/test___init__.py
index b02ed12..d9addac 100644
--- a/src/tests/test___init__.py
+++ b/src/tests/test___init__.py
@@ -1234,3 +1234,67 @@ def test_git_run_command_log_fixup_looks_past_option_prefix(gitdir: str) -> None
     assert out.startswith('commit '), out
     sha = out.split('\n', 1)[0].split()[1]
     assert len(sha) == 40, f'log abbreviated the sha despite the fixup: {sha}'
+
+
+def _fake_editor(tmp_path: pathlib.Path, body: str) -> str:
+    """A stand-in $EDITOR that runs *body* and leaves the buffer alone."""
+    script = tmp_path / 'fake-editor.sh'
+    script.write_text(f'#!/bin/sh\n{body}\n')
+    script.chmod(0o755)
+    return str(script)
+
+
+def test_edit_in_editor_without_guard_survives_branch_switch(
+    gitdir: str, tmp_path: pathlib.Path, monkeypatch: pytest.MonkeyPatch
+) -> None:
+    """Callers that write to an explicit ref get their text back even if HEAD
+    moved while the editor was open.
+
+    The review TUI stores replies on the review branch and reads the patch it
+    is replying to by SHA, so a branch switch -- its own, or the user's in
+    another terminal sharing the worktree -- is none of its business."""
+    monkeypatch.setenv(
+        'GIT_EDITOR', _fake_editor(tmp_path, f'git -C "{gitdir}" checkout -q -b side')
+    )
+    assert b4.edit_in_editor(b'my reply\n', filehint='reply.eml') == b'my reply\n'
+    assert b4.git_get_current_branch(gitdir) == 'side'
+
+
+def test_edit_in_editor_guard_refuses_branch_switch(
+    gitdir: str, tmp_path: pathlib.Path, monkeypatch: pytest.MonkeyPatch
+) -> None:
+    """A caller that opts in is refused when HEAD has moved on, and its text
+    is preserved in a temporary file."""
+    monkeypatch.setenv(
+        'GIT_EDITOR', _fake_editor(tmp_path, f'git -C "{gitdir}" checkout -q -b side')
+    )
+    with pytest.raises(RuntimeError, match='Branch changed during file editing') as ex:
+        b4.edit_in_editor(b'my cover\n', guard_branch=True)
+
+    saved = pathlib.Path(str(ex.value).split(' saved at ')[-1])
+    try:
+        assert saved.read_bytes() == b'my cover\n'
+    finally:
+        saved.unlink()
+
+
+def test_edit_in_editor_guard_covers_a_detached_head(
+    gitdir: str, tmp_path: pathlib.Path, monkeypatch: pytest.MonkeyPatch
+) -> None:
+    """Starting detached is still a starting point worth guarding.
+
+    'b4 trailers -u' does not require a prep branch, so it can run with HEAD
+    detached and rewrite whatever branch is current when it applies."""
+    ecode, out = b4.git_run_command(gitdir, ['checkout', '-q', '--detach'])
+    assert ecode == 0, out
+    monkeypatch.setenv(
+        'GIT_EDITOR', _fake_editor(tmp_path, f'git -C "{gitdir}" checkout -q -b side')
+    )
+    with pytest.raises(RuntimeError, match='Branch changed during file editing') as ex:
+        b4.edit_in_editor(b'my trailers\n', guard_branch=True)
+
+    saved = pathlib.Path(str(ex.value).split(' saved at ')[-1])
+    try:
+        assert saved.read_bytes() == b'my trailers\n'
+    finally:
+        saved.unlink()

-- 
2.53.0

