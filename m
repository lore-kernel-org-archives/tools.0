Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794314460;
	b=ozQXPerRfzNciUtLjLoyIgOyZph5kRvqhV7tJj+RFIeibqLWjgRlDH5paEF6kpxc9/6g
	 TAZeSq26bnKAz5zc6ZlwHpS8A40c/c7po2TSj1JfT9mxVwL94+ItQ7e8/Fx2mU21O1wBF
	 PZy++a8WnX5R19O1Kxf3KIf8ujKeWQm5pfoMZiJi+zA1CIQFzAckFgKQSXJxpdD9OEfzI
	 vAh3+HTHnZTgh/zYQSVd7Vg1cAIhdThit+Xoelcs+8hPdueTD6hOqVf6lSJ7XLQElzUnw
	 tNbaY4OkqbiXejRQ4QK+Nu8og4sGp+a/+1CNLohoaznnQtYPmPqcFCcg8QHcMU5xEGg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794314460;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Bm-Milter-Handled:
	 X-Bm-Transport-Timestamp;
	bh=rVL65aUKRqYQxF/9rRNWShtotyXZ6GtI6oOi+tdTSdE=;
	b=wKcRGUQpsVLg8XVvRD1k+/w4tBt/zYFxBEMeEsswh0Qq5AP06cKhbVeIC/+xUBpWZV62
	 Bl/b0LOpFdLdAkteLCcWnY8PukVidwJb6guyRbJV3Yp3UPeEZ6vOn0HXOozGTyl6oQbfa
	 O8QU5zRQ4c4gEPKpzvdzoD69uES4WRcAGGZrE64l//QSDhHBmDGUdzmNjYEJi8CZAgua7
	 Y6b+uaGK3NKzouTF8sTZtCw2QRZEU82w1y+IurD4aOoPNMZoMjqlzprjzSKE1VeXZu2pB
	 wzjbX01kDmC2NDKhBnf3In9rGppRrE6/FQEn68Hw5MBmGrMv3gvlOQPbeCTe74eb2Ig==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A2360A2626
	for <tools@linux.kernel.org>; Tue, 10 Nov 2026 12:40:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E55E61F008A6; Tue, 10 Nov 2026 12:40:58 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=94.136.29.106
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794314458;
	b=x4pxgmJWy5ArTVZE8l28ekiGOJgsiBWN1AqsRp2Tk+rYxGnnzPjOiEo/O8hUarSRjXDZ
	 dY1DcK7jKngLILZc/dSHkDlFivaJMuu9sPzu5xk8ZeLzitwYjxPwd2+4JKtD7bMBA5jBM
	 vXW2iVczg+8QVUutUwNgGDxW2pXyWqiLgSHmY4vozqkbpklNz0C6VLfIu7I8q0ZgnTcKu
	 2Zt0UZ1lzLsNreZVPIL70VH22VLYS0YnkjKGqyOnEyS5EJekwfN4L6+StGnDWbYacEp4T
	 7SzE+IB2lU+YVcddirww49XrqQVYOr7j/t7ppVbftxSzDrvtQ0px4whEzEknaTtX3zw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794314458;
	h=DMARC-Filter:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Bm-Milter-Handled:X-Bm-Transport-Timestamp;
	bh=rVL65aUKRqYQxF/9rRNWShtotyXZ6GtI6oOi+tdTSdE=;
	b=GRDzlXMeOiMwud/K3JSy1ST9Bwo+WfJH6psNjGt6Fi87dEW77JwV8tDwte0OY2HtiXKL
	 we1S2ne79HHpvl5GpvM8JExvPbnT/hk6itkZBvmh+Mogf/gBwZK6xQV8d68F+k5Knr0Aw
	 XmQ8GIYLtoRSBeAz7ZhvwCGXqjlG+i74pn4ACaBMAEDm0/+YWdcw1CkGvyzhoo08Sr0ld
	 IR97r2EMoTCkfbBS79cYvMgjNCQPG1v5MMQYr+OQdB9AMwcvcxFv/fLcFmap6wmx8B4/x
	 QhdU735OULK7bO+0Zxpm743+2TPEFSTQcZvYmQ70Kf5R1bxhCMiVxMlo+vUgc2fWevA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dmarc=none header.from=proxmox.com;
	spf=pass smtp.mailfrom=proxmox.com;
	arc=none smtp.remote-ip=94.136.29.106
Received: from proxmox-new.maurer-it.com (proxmox-new.maurer-it.com [94.136.29.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 162A71F008A1
	for <tools@kernel.org>; Tue, 10 Nov 2026 12:40:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 162A71F008A1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=proxmox.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=proxmox.com
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
	by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 99914481B5;
	Tue, 10 Nov 2026 13:40:55 +0100 (CET)
From: Gabriel Goller <g.goller@proxmox.com>
Date: Tue, 10 Nov 2026 13:40:47 +0100
Subject: [PATCH RFC b4 1/6] editor: refuse the edit when a detached HEAD
 moves
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-editor_refuse_the-v1-1-4b6e52f326a9@proxmox.com>
References: <20261110-editor_refuse_the-v1-0-4b6e52f326a9@proxmox.com>
In-Reply-To: <20261110-editor_refuse_the-v1-0-4b6e52f326a9@proxmox.com>
To: tools@kernel.org
Cc: Gabriel Goller <g.goller@proxmox.com>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Gabriel Goller <hey@gabriels.computer>
X-Mailer: b4 0.17-dev
X-Bm-Milter-Handled: 55990f41-d878-4baa-be0a-ee34c49e34d2
X-Bm-Transport-Timestamp: 1794314453606

From: Gabriel Goller <hey@gabriels.computer>

b4 prep writes the edited cover letter and dependencies into whatever
series HEAD points at, so edit_in_editor() refuses the edit when HEAD
switches branches while the editor is open. A detached HEAD has no
branch name to compare, so moving it to another commit went unnoticed,
and the text would land in whatever series is checked out afterwards.

When editing starts on a detached HEAD, compare the HEAD commit too.
On a branch, keep comparing only the branch name, so committing to the
branch while the editor is open stays allowed.

Signed-off-by: Gabriel Goller <hey@gabriels.computer>
---
 src/b4/__init__.py         | 45 ++++++++++++++++++++++++++++++++++-----------
 src/tests/test___init__.py | 45 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 79 insertions(+), 11 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 704ddec9b5c6..dd4fa2d10864 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -7754,7 +7754,9 @@ def edit_in_editor(
     (b4 prep keeps the cover letter in the current branch's tracking commit,
     so a branch switch mid-edit would clobber an unrelated series).  HEAD is
     read before and after the editor runs; if it moved, the text is saved to
-    a temporary file and RuntimeError is raised.
+    a temporary file and RuntimeError is raised.  On a branch, only switching
+    to another branch counts as moving.  On a detached HEAD there is no
+    branch to tell series apart, so any change of the HEAD commit counts.
 
     Callers that write to an explicit ref must leave it unset: HEAD is not
     where their data lands, so refusing the edit would throw away the user's
@@ -7767,6 +7769,10 @@ def edit_in_editor(
     # HEAD reads as None and still guards: None is not a branch we started
     # on, so checking one out mid-edit is caught like any other switch.
     read_branch = git_get_current_branch(topdir) if guard_branch else None
+    read_head = None
+    if guard_branch and read_branch is None:
+        ecode, out = git_run_command(topdir, ['rev-parse', '-q', '--verify', 'HEAD'])
+        read_head = out.strip() if ecode == 0 else None
     # core.editor comes from the same tree as everything else here, so a
     # repository-local setting is the one belonging to the edited branch.
     corecfg = get_config_from_git(r'core\..*', gitdir=topdir)
@@ -7806,23 +7812,40 @@ def edit_in_editor(
 
     if guard_branch:
         write_branch = git_get_current_branch(topdir)
-        if write_branch != read_branch:
+        write_head = None
+        if read_branch is None and write_branch is None:
+            ecode, out = git_run_command(
+                topdir, ['rev-parse', '-q', '--verify', 'HEAD']
+            )
+            write_head = out.strip() if ecode == 0 else None
+        if write_branch != read_branch or write_head != read_head:
+            if read_branch is not None:
+                prefix = f'old-{read_branch}'.replace('/', '-')
+            else:
+                prefix = f'old-detached-{(read_head or "")[:12]}-'
             with tempfile.NamedTemporaryFile(
-                mode='wb',
-                prefix=f'old-{read_branch}'.replace('/', '-'),
-                delete=False,
+                mode='wb', prefix=prefix, delete=False
             ) as save_file:
                 save_file.write(bdata)
-                logger.critical(
-                    'Editing started on branch %s, but current branch is %s.',
-                    read_branch,
-                    write_branch,
-                )
+                if write_branch != read_branch:
+                    logger.critical(
+                        'Editing started on branch %s, but current branch is %s.',
+                        read_branch,
+                        write_branch,
+                    )
+                    reason = 'Branch changed'
+                else:
+                    logger.critical(
+                        'Editing started on detached HEAD at %.12s, but HEAD is now at %.12s.',
+                        read_head,
+                        write_head,
+                    )
+                    reason = 'Detached HEAD moved'
                 logger.critical(
                     'To avoid a collision, your text was saved in %s', save_file.name
                 )
             raise RuntimeError(
-                f'Branch changed during file editing, the temporary file was saved at {save_file.name}'
+                f'{reason} during file editing, the temporary file was saved at {save_file.name}'
             )
     return bdata
 
diff --git a/src/tests/test___init__.py b/src/tests/test___init__.py
index 764829d7e756..58cbf4a8e35f 100644
--- a/src/tests/test___init__.py
+++ b/src/tests/test___init__.py
@@ -2534,6 +2534,51 @@ def test_edit_in_editor_guard_covers_a_detached_head(
         saved.unlink()
 
 
+def test_edit_in_editor_guard_refuses_a_moved_detached_head(
+    gitdir: str, tmp_path: pathlib.Path, monkeypatch: pytest.MonkeyPatch
+) -> None:
+    """Without a branch, the HEAD commit is all that tells two series apart,
+    so moving a detached HEAD to another commit is refused too."""
+    ecode, out = b4.git_run_command(gitdir, ['checkout', '-q', '--detach'])
+    assert ecode == 0, out
+    monkeypatch.setenv(
+        'GIT_EDITOR',
+        _fake_editor(tmp_path, f'git -C "{gitdir}" checkout -q --detach HEAD~1'),
+    )
+    with pytest.raises(RuntimeError, match='Detached HEAD moved during file') as ex:
+        b4.edit_in_editor(b'my cover\n', guard_branch=True)
+
+    saved = pathlib.Path(str(ex.value).split(' saved at ')[-1])
+    try:
+        assert saved.read_bytes() == b'my cover\n'
+        assert saved.name.startswith('old-detached-')
+    finally:
+        saved.unlink()
+
+
+def test_edit_in_editor_guard_allows_a_detached_head_that_stays(
+    gitdir: str, tmp_path: pathlib.Path, monkeypatch: pytest.MonkeyPatch
+) -> None:
+    ecode, out = b4.git_run_command(gitdir, ['checkout', '-q', '--detach'])
+    assert ecode == 0, out
+    monkeypatch.setenv('GIT_EDITOR', _fake_editor(tmp_path, 'true'))
+    assert b4.edit_in_editor(b'my cover\n', guard_branch=True) == b'my cover\n'
+
+
+def test_edit_in_editor_guard_allows_commits_on_the_same_branch(
+    gitdir: str, tmp_path: pathlib.Path, monkeypatch: pytest.MonkeyPatch
+) -> None:
+    """On a branch, the branch name tells series apart, so committing to it
+    while the editor is open is not a collision."""
+    monkeypatch.setenv(
+        'GIT_EDITOR',
+        _fake_editor(
+            tmp_path, f'git -C "{gitdir}" commit -q -s --allow-empty -m mid-edit'
+        ),
+    )
+    assert b4.edit_in_editor(b'my cover\n', guard_branch=True) == b'my cover\n'
+
+
 def test_edit_in_editor_follows_the_topdir_it_is_given(
     gitdir: str, tmp_path: pathlib.Path, monkeypatch: pytest.MonkeyPatch
 ) -> None:

-- 
2.56.0


