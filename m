Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7AF351C04
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 21:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785535154; cv=none; b=gNTGOIxgjaMl91HIMML6ibsjTmRXw53MIyTTijDJ6vZPviQO0HeW0pq6EPBWUUW7TpZ41ttWoHO+tQ/qri8s3YbUn6Z/ajb7k0TetPUg0eGYQuN27Hr2TL0+GHST5WLVNKsa9DZqo3FU0nhM8yFylT424LN1RLK17AXVjFNivwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785535154; c=relaxed/simple;
	bh=gZafRAtL+5RIZBTJt/5sAkg6AC7NS9mpWQfxCecNTJM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AoLvwHcJodLxOsqBiBjhjSWPKkA23/0UVcIswOnCqYOM2urvLIMA7uzepQCgpN8CJLYKIs1XKbkeYHKLiKf+JTUb1R8zoRNsRZObNRSDjRtuFfq4bOdfnV7IzUoxi673ynumRv5S5wIYkCEB4wHeTPsn80LNJQ4IZY/po0SVlFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hw/kKbNE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hw/kKbNE"
Received: by smtp.kernel.org (Postfix)
	id 70BD91F00ACF; Fri, 31 Jul 2026 21:59:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1A531F00AC4;
	Fri, 31 Jul 2026 21:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785535153;
	bh=TGYiZ4QpbozS7IyVYdUGIpP9km7y2Buagiilq9y2GH0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=hw/kKbNEHEg7jABrquxWuechWbZ9+F9Dv9DlBfAUONFpxaexzniSOXFxGFnlfDtqU
	 XlrSH2/aTFg9iI+HVrxtrmKNTNtl7TuS/kgagRRWZ2sqyIzWqD0SSNjcsi8Ke9L3+P
	 ON2ROB7U7zdhbIDSm/GDm4SyxdnFJOhjPYxWvkUwkPf1S83jvyjaPezeu9dxk6qNbj
	 o5rhH6e/3N05VyR2hKX3eag+egWorpBx/wcUD+Y0AInULm0qiMlTR0r20sPScl924r
	 nJhg9txoNZTlkJVZQujFNqSTksvO10abgZpLto/W01ujA737QnWcASVPsg2PcFN71K
	 tRaBze9YP5PCA==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 23:58:57 +0200
Subject: [PATCH b4 v2 16/44] tests: cover the opt-in branch guard in
 edit_in_editor
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v2-16-243fd19d322d@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=3507; i=brauner@kernel.org;
 h=from:subject:message-id; bh=gZafRAtL+5RIZBTJt/5sAkg6AC7NS9mpWQfxCecNTJM=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlSs3eLbtz0nRJi3SWI52Tkhq3vLHaPCv+AvdnFYGMl
 nXhxUEHOkpZGMS4GGTFFFkc2k3C5ZbzVGw2ytSAmcPKBDKEgYtTACbSdZWRof/RqllVTKdMjDY+
 yLDbwfZLroh5p9yztSaTH3kbMi19WMDwk3HieS2+kjUsv71LXmy/Mjv52+L9FQK+E9tVr6012lP
 rxgoA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

A caller that does not opt in keeps its text across a branch switch.
One that does is refused and the text is kept in a temporary file.

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

