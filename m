Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A979037C911
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 21:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785535155; cv=none; b=EzPjdRpAeippNIdi4LaUr6yqDAbpLIddW+uj5Ra8WPa6Bh2Adfr67Cv+Q0sXu/RlVJ7dou82/4oLMKXa+POo5GUJdVTRTUzOi2bPA+5KFY3sRO9hFSjcZeQfmQNxGnvlSvV8Rfg+P4fejlWKCkuvu99RbknGWgnF5kcNa33RvHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785535155; c=relaxed/simple;
	bh=VlD8yBTlsO5tREwvM+0NiJxy4wxd/LJtc/EeYQrTVtg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gKlc5d4amBrRkVnB4mUTV5VuCc2D+TDDQZXK2dsW4Ck6z65hdtZG9UVqQlbiMUVyc6fT+qwkw86QNzfw73e0ZxNnQgU/54c90QmxGY6w5coJxbrt9/VAh8LnTaEsjWsDuiAeUQ0WOIp5ZaVH8JCDbVqC4YZt81MBpd79LXKSSW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ao6bicc5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ao6bicc5"
Received: by smtp.kernel.org (Postfix)
	id 99F851F00ACA; Fri, 31 Jul 2026 21:59:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC9F81F00AC4;
	Fri, 31 Jul 2026 21:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785535154;
	bh=Vy4UKUQHiOQmFHmEnRk1gpZc3oLVa8y0fyoJl4sHalE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ao6bicc5iU63arZaLBnMML++7bRjnEaEIjuvp04zc88ef1sb09OwQ4tolrOEExCnf
	 GFzfyyz07mV8UeeUX4H4pfPOKSGAj+CBdTYih6JNUXQCx0Hd0B6mq7aL9gYlBdMLRZ
	 LgwhBOgAUnwl1xCOs/6rRLY/FE6LVkDdXsC7yDdJXkHIzHlyRMSBszqd6TErIt8Oti
	 99jTHx90DZwSPCFiVPmOpiHpJw3PrdHH52DvDipTyI0F9IG5Y3TDf3pgj7OhMQ41An
	 LatOBrapZLLPiwqr2mti8VEveISpGs/5DriTN6Hhug3rb/G3M6DKiIHzZfwdlqe8jf
	 Acziv98uoUY9A==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 23:58:58 +0200
Subject: [PATCH b4 v2 17/44] edit_in_editor: work in the tree the caller
 names
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v2-17-243fd19d322d@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=5739; i=brauner@kernel.org;
 h=from:subject:message-id; bh=VlD8yBTlsO5tREwvM+0NiJxy4wxd/LJtc/EeYQrTVtg=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlSs22yn+fuDF86nO222u6Vz63sPuv8t3PIv1c8q3GC
 ab5JnlKHaUsDGJcDLJiiiwO7Sbhcst5KjYbZWrAzGFlAhnCwMUpABNZv5SR4d5ExXZHk471Juuv
 ux+dnbNlxlYTxtYTTZMO3zZQ1NvINIWRYXOn/++y12x5t8u3aJVN+3NzS5nGigeXRGW/8p9KPLB
 vHgsA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

The scratch file, the branch lookup and the core.editor lookup all
came from the process cwd. The review TUI scopes every other git call
to session['topdir']; this was the one place where the tree was
implied rather than named. Add a topdir argument and have the review
TUI pass the one it already tracks.

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

