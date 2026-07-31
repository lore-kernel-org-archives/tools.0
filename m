Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80453B1016
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 09:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785489709; cv=none; b=h8l6fF2PZv+PbFVyVdO88mdM/rXnp2P7K4Wz0is2T/7LIGUA6FtD5lo4aclNC/i5RSZVoC77HBGPTjeu6/GklS5VMmSsScJPhwVsVrW/TEAS/eeFuYUOf0JHtbB/XhJaJ24BhSHiwf6CuK4U2obhl6larD1wZFfIuSZ7CcI3fak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785489709; c=relaxed/simple;
	bh=f3aDPUOG1rlrB2RMykJ1KEEUQwxUfV6MqR7d3dOUo9U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mDpyAN/vVbQtZAuTooYNJwnD3PTDQDIsQZM9e2i9e+dvndxsAnVLUDiKj3UaxSxAW62A/hCzxlzqVrJHPsHDs1idBk6r4prOlP8RWoqtzvvO3dj4INDT7W23mXfynf9eOWcOs25NO/cUSTlsCMUPDRDkachbObTF48TZvTa59Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jEHMgIQc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jEHMgIQc"
Received: by smtp.kernel.org (Postfix)
	id B68151F00A3A; Fri, 31 Jul 2026 09:21:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E86141F000E9;
	Fri, 31 Jul 2026 09:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785489707;
	bh=ni6vi9OqeL2jA7GyCD0gAZ2nVAX4JzzpfYKoEaQ8keM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=jEHMgIQcIQtwfslEPOoBwY3vHEjVBRv73LjqgtiRNMVWdrrmneoAU0gwCMWSvwnMA
	 4n2KdzG3lQCeiq28QrxRGPjxjMUBNcrS3oV5FouLHA9emO6z6tG3FwkRZt1g5gQB9M
	 fj4ARxyOGh4MSbQ+dF6l4ZzIR3LboxI80db0NlVZ7uNn7nT1PSHBsVBiU+ScFk9wwl
	 5OTDTAkJN22/bV8isTF+tYAo8cZuiIDahfX9CNqB4+btL6MWBMbWY2g8DYCbgM2243
	 tlnod0736Y//0uCZDRvREqxU91eA/9yHW8/exJv5pnsyX4w7H/9HwbYFBd07+RjlrP
	 tHkqfaMvkdMgw==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 11:21:16 +0200
Subject: [PATCH b4 17/27] edit_in_editor: work in the tree the caller names
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v1-17-de68a7c8e4cb@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v1-0-de68a7c8e4cb@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v1-0-de68a7c8e4cb@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=6377; i=brauner@kernel.org;
 h=from:subject:message-id; bh=f3aDPUOG1rlrB2RMykJ1KEEUQwxUfV6MqR7d3dOUo9U=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlZIo9soyM7nYSKDwjK7yV9aW3TP8U3U8HdG931i3IX
 cpjEszXUcrCIMbFICumyOLQbhIut5ynYrNRpgbMHFYmkCEMXJwCMJGpuQz/1MS2ZTmIPbp9PPPu
 806RdTHS7+yWK1+w1Lq5+fBJQfUzjxj+8BUdWLRwxo8Jm1kfBsXrLpVZbD/D+f2XpxbiXz9Pnxo
 RyQcA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

The scratch file and the branch lookup both came from git_get_toplevel()
and git_get_current_branch() without an argument, so from wherever the
process happens to be sitting. That is fine for the b4 prep commands,
which are cwd-relative anyway. The review TUI is not: it scopes every
other git call to session['topdir'], and this was the one place left
where the tree it operates on was implied rather than named.

The two agree today -- session['topdir'] is git_get_toplevel() of the
cwd and b4 deliberately never chdirs -- so this is an assumption being
removed rather than a bug being fixed. It does change one thing: the
core.editor lookup moves to the named tree, so a repository-local
setting is the one belonging to the branch being edited.

Add a topdir argument for the tree the edit belongs to, use it for the
scratch directory, the HEAD reads and the config lookup, and have the
review TUI pass the one it already tracks.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/__init__.py               | 26 ++++++++++++++++++--------
 src/b4/review_tui/_review_app.py | 12 +++++++++---
 src/tests/test_tui_review.py     |  2 +-
 3 files changed, 28 insertions(+), 12 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 3d22c89..a22c28d 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -6176,10 +6176,17 @@ def edit_in_editor(
     bdata: bytes,
     filehint: str = 'COMMIT_EDITMSG',
     *,
+    topdir: Optional[str] = None,
     guard_branch: bool = False,
 ) -> bytes:
     """Open the user's editor on bdata and return what they saved.
 
+    topdir is the working tree the edit belongs to: the scratch file is
+    created there, and it is the tree HEAD is read from.  It defaults to the
+    working tree of the current directory, which is only right for callers
+    that operate on the process cwd -- anything driving a specific worktree
+    (the TUIs) must pass it explicitly.
+
     guard_branch opts into a collision check, and only callers that store
     the result into whatever branch HEAD happens to point at may set it
     (b4 prep keeps the cover letter in the current branch's tracking commit,
@@ -6191,12 +6198,16 @@ def edit_in_editor(
     where their data lands, so refusing the edit would throw away the user's
     work to prevent a collision that cannot happen.
     """
-    # Read before the edit and compare after, so this can never end up
-    # comparing two different points in time.  A detached HEAD reads as None
-    # and still guards: None is not a branch we started on, so checking one
-    # out mid-edit is caught like any other switch.
-    read_branch = git_get_current_branch() if guard_branch else None
-    corecfg = get_config_from_git(r'core\..*')
+    if topdir is None:
+        topdir = git_get_toplevel()
+    # Read before the edit and compare after, both in topdir, so this can
+    # never end up comparing two different repositories' HEADs.  A detached
+    # HEAD reads as None and still guards: None is not a branch we started
+    # on, so checking one out mid-edit is caught like any other switch.
+    read_branch = git_get_current_branch(topdir) if guard_branch else None
+    # core.editor comes from the same tree as everything else here, so a
+    # repository-local setting is the one belonging to the edited branch.
+    corecfg = get_config_from_git(r'core\..*', gitdir=topdir)
     editor = (
         os.environ.get('GIT_EDITOR')
         or corecfg.get('editor')
@@ -6206,7 +6217,6 @@ def edit_in_editor(
     )
     logger.debug('editor=%s', editor)
 
-    topdir = git_get_toplevel()
     if topdir is not None:
         p = Path(topdir)
     else:
@@ -6233,7 +6243,7 @@ def edit_in_editor(
     bdata = bdata.replace(b'\r\n', b'\n').replace(b'\r', b'\n')
 
     if guard_branch:
-        write_branch = git_get_current_branch()
+        write_branch = git_get_current_branch(topdir)
         if write_branch != read_branch:
             with tempfile.NamedTemporaryFile(
                 mode='wb',
diff --git a/src/b4/review_tui/_review_app.py b/src/b4/review_tui/_review_app.py
index 8139518..74f6aa0 100644
--- a/src/b4/review_tui/_review_app.py
+++ b/src/b4/review_tui/_review_app.py
@@ -1329,7 +1329,9 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
 
         with self.suspend():
             result = b4.edit_in_editor(
-                editor_text.encode(), filehint='reply.b4-review.eml'
+                editor_text.encode(),
+                filehint='reply.b4-review.eml',
+                topdir=self._topdir,
             )
 
         if not result:
@@ -1449,7 +1451,9 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
         """Launch $EDITOR for the maintainer's note on *target*."""
         editor_text = existing + self._NOTE_FOOTER
         with self.suspend():
-            result = b4.edit_in_editor(editor_text.encode(), filehint='note.txt')
+            result = b4.edit_in_editor(
+                editor_text.encode(), filehint='note.txt', topdir=self._topdir
+            )
 
         if not result:
             self.notify('Editor returned no content')
@@ -1713,7 +1717,9 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
             editor_text = f'On {orig_date}, {orig_author} wrote:\n{quoted}\n\n'
 
         with self.suspend():
-            result = b4.edit_in_editor(editor_text.encode(), filehint='reply.eml')
+            result = b4.edit_in_editor(
+                editor_text.encode(), filehint='reply.eml', topdir=self._topdir
+            )
         reply_text = result.decode(errors='replace')
         if reply_text == editor_text:
             self.notify('No changes made')
diff --git a/src/tests/test_tui_review.py b/src/tests/test_tui_review.py
index 7387bd2..b19e3f9 100644
--- a/src/tests/test_tui_review.py
+++ b/src/tests/test_tui_review.py
@@ -260,7 +260,7 @@ class TestReplyVerbatim:
         )
         seen: List[str] = []
 
-        def fake_editor(data: bytes, filehint: str = '') -> bytes:
+        def fake_editor(data: bytes, filehint: str = '', **kwargs: Any) -> bytes:
             seen.append(data.decode())
             return buffer.encode()
 

-- 
2.53.0

