Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684813B3898
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 09:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785489706; cv=none; b=sTjcMYJOdpCS4AsvcCT6bWN+048TAONi30Eq4fx6R6wTsifmPzVB8mXitu1Hni2NXLVhB7hX6amP6/0rA+VJ7o/qKltr2zbWEomOSRViP3dK+EI0xcsHvmLBnU/1k4m51ZglDWOmv1WzpbEm8BYz1gxgnoa3mo0eBuT8tgDc740=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785489706; c=relaxed/simple;
	bh=1/KdNeW202jEjUudOGe8IqxmGcH5JIDl1zK+dBZJKmo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HIK8Zg1R8n0HqsxugLSbpN1J33xStWIguqNOVJLrkwe/+OA6olIddDj6tQs8bXnNkGIVsC0UyF6PORbF6Eu+tL1/gKLxYEGrp8nGyb5X3FzOkgEjMzX7q7pwkVnOyfBrsE2Dy3nvTJ56xC4OV1xAIi6aCpaYC20hXa2PJ1GgU4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ee0103Dr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ee0103Dr"
Received: by smtp.kernel.org (Postfix)
	id 66CF81F00A3A; Fri, 31 Jul 2026 09:21:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97ECC1F00A3D;
	Fri, 31 Jul 2026 09:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785489705;
	bh=8XCsKBTbOdnU0Pu4aese0QgAClSdqifITi8kRkQPvbg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ee0103DrKcg9gK8C4a6EyxXau/m8lSS1XP1TZjXqd7Gke5s63sKwiOs/NMA+ALiHy
	 2yaIV7ujsu6Zl2SMDEYvh0scXSc6YF9GSqiXiJ9eh3X9nNcLnLWkQGD8WnW4SoCFYp
	 XV4V9LmVAlTr55lcWffVNs5rlKkq4c5gBn2jLwWw/UBNdM9oMaX+x3UYZS5owG7rjb
	 MOYnnCZJ2Z+aWuJzPblZJ734KJ69EHAkvoml/RtfsH36eVCV3U2Phn3U3JVQY7AAp/
	 pR/18ttbJbw7wedEzovwKhyTmuykUVsm4NVEGaj/1d/0iprcMherdHxtDt37lfKMG2
	 SdSDcicU/O+oA==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 11:21:14 +0200
Subject: [PATCH b4 15/27] edit_in_editor: make the branch guard opt-in
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v1-15-de68a7c8e4cb@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v1-0-de68a7c8e4cb@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v1-0-de68a7c8e4cb@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=9067; i=brauner@kernel.org;
 h=from:subject:message-id; bh=1/KdNeW202jEjUudOGe8IqxmGcH5JIDl1zK+dBZJKmo=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlZIrxCc3dwzXhevaVJypTTfZovrCojNbTmGIQWCOp+
 Ht2LfuWjlIWBjEuBlkxRRaHdpNwueU8FZuNMjVg5rAygQxh4OIUgInMXsXwz2DpBeG7N4WWZc09
 qvPDuz9wdkrY3hdf1XsZ9+fYb3ioHszwv7DVINZqnWXV8SfpAt77v4m+uShkbt/MsciAVeH1jDf
 zWAA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

The guard is there for "b4 prep --edit-cover", which stores the edited
text in the tracking commit of whatever branch HEAD points at. Switching
branches while the editor is open would clobber an unrelated series. But
it sits in the shared editor helper and reads HEAD unconditionally, so
every other caller pays for it too.

That is wrong for callers that write to an explicit ref. The review TUI
stores a reply with save_tracking_ref() on the review branch and reads
the patch being replied to by SHA. HEAD is not involved anywhere in that
flow. Leaving the reply editor open across a branch switch is easy
enough to do, since the TUI suspends and the worktree it runs in is
shared with the user's other terminals. When it happens the reply is
dumped into /tmp and we get a RuntimeError back. The guard throws away
the very text it is meant to protect to prevent a collision that can't
happen.

Make it opt-in. guard_branch names the branch the result will be written
to and only the three b4 prep callers that write to the current branch
pass it.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/__init__.py   | 62 +++++++++++++++++++++++++++++++++++-----------------
 src/b4/ez.py         | 14 +++++++++---
 src/tests/test_ez.py | 16 ++++++++++----
 3 files changed, 65 insertions(+), 27 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index e837a10..3d22c89 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -6172,11 +6172,30 @@ def _suspend_to_shell(
         subprocess.run([shell], env=env, cwd=cwd)
 
 
-def edit_in_editor(bdata: bytes, filehint: str = 'COMMIT_EDITMSG') -> bytes:
-    # To avoid losing the cover letter, ensure that we are still on the same
-    # branch as when the cover-letter was originally opened.
-    read_branch = git_get_current_branch()
+def edit_in_editor(
+    bdata: bytes,
+    filehint: str = 'COMMIT_EDITMSG',
+    *,
+    guard_branch: bool = False,
+) -> bytes:
+    """Open the user's editor on bdata and return what they saved.
+
+    guard_branch opts into a collision check, and only callers that store
+    the result into whatever branch HEAD happens to point at may set it
+    (b4 prep keeps the cover letter in the current branch's tracking commit,
+    so a branch switch mid-edit would clobber an unrelated series).  HEAD is
+    read before and after the editor runs; if it moved, the text is saved to
+    a temporary file and RuntimeError is raised.
 
+    Callers that write to an explicit ref must leave it unset: HEAD is not
+    where their data lands, so refusing the edit would throw away the user's
+    work to prevent a collision that cannot happen.
+    """
+    # Read before the edit and compare after, so this can never end up
+    # comparing two different points in time.  A detached HEAD reads as None
+    # and still guards: None is not a branch we started on, so checking one
+    # out mid-edit is caught like any other switch.
+    read_branch = git_get_current_branch() if guard_branch else None
     corecfg = get_config_from_git(r'core\..*')
     editor = (
         os.environ.get('GIT_EDITOR')
@@ -6213,23 +6232,26 @@ def edit_in_editor(bdata: bytes, filehint: str = 'COMMIT_EDITMSG') -> bytes:
     # of the edited text expects unix endings, so canonicalize here.
     bdata = bdata.replace(b'\r\n', b'\n').replace(b'\r', b'\n')
 
-    write_branch = git_get_current_branch()
-    if write_branch != read_branch:
-        with tempfile.NamedTemporaryFile(
-            mode='wb', prefix=f'old-{read_branch}'.replace('/', '-'), delete=False
-        ) as save_file:
-            save_file.write(bdata)
-            logger.critical(
-                'Editing started on branch %s, but current branch is %s.',
-                read_branch,
-                write_branch,
-            )
-            logger.critical(
-                'To avoid a collision, your text was saved in %s', save_file.name
+    if guard_branch:
+        write_branch = git_get_current_branch()
+        if write_branch != read_branch:
+            with tempfile.NamedTemporaryFile(
+                mode='wb',
+                prefix=f'old-{read_branch}'.replace('/', '-'),
+                delete=False,
+            ) as save_file:
+                save_file.write(bdata)
+                logger.critical(
+                    'Editing started on branch %s, but current branch is %s.',
+                    read_branch,
+                    write_branch,
+                )
+                logger.critical(
+                    'To avoid a collision, your text was saved in %s', save_file.name
+                )
+            raise RuntimeError(
+                f'Branch changed during file editing, the temporary file was saved at {save_file.name}'
             )
-        raise RuntimeError(
-            f'Branch changed during file editing, the temporary file was saved at {save_file.name}'
-        )
     return bdata
 
 
diff --git a/src/b4/ez.py b/src/b4/ez.py
index ec922e4..b17a078 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -1163,7 +1163,9 @@ def edit_cover() -> None:
     is_prep_branch(mustbe=True)
     cover, tracking = load_cover()
     bcover = cover.encode()
-    new_bcover = b4.edit_in_editor(bcover, filehint='COMMIT_EDITMSG')
+    # store_cover() writes to whatever branch is current, so refuse the edit
+    # rather than overwrite another series' cover letter.
+    new_bcover = b4.edit_in_editor(bcover, filehint='COMMIT_EDITMSG', guard_branch=True)
     if new_bcover == bcover:
         logger.info('Cover letter unchanged.')
         return
@@ -1183,7 +1185,9 @@ def edit_deps() -> None:
     deps = '\n'.join(prereqs)
     toedit = f'{deps}\n{DEPS_HELP}'
     bdata = toedit.encode()
-    new_bdata = b4.edit_in_editor(bdata, filehint='prereqs.yaml')
+    # Same as edit_cover(): the prerequisites land in the current branch's
+    # tracking commit.
+    new_bdata = b4.edit_in_editor(bdata, filehint='prereqs.yaml', guard_branch=True)
     if new_bdata == bdata:
         logger.info('Dependencies unchanged.')
         return
@@ -1629,7 +1633,11 @@ def interactive_trailer_review(
         sections.append((clmsg.subject, disp))
 
     buf = render_trailer_review(sections)
-    edited = b4.edit_in_editor(buf, filehint='b4-trailers.COMMIT_EDITMSG')
+    # The kept trailers are applied by rewriting the current branch's commits,
+    # so a branch switch while the editor is open would target the wrong series.
+    edited = b4.edit_in_editor(
+        buf, filehint='b4-trailers.COMMIT_EDITMSG', guard_branch=True
+    )
     try:
         rejected_idx = parse_trailer_review(edited, sections)
     except ValueError as ex:
diff --git a/src/tests/test_ez.py b/src/tests/test_ez.py
index 97a3bd2..6371ae7 100644
--- a/src/tests/test_ez.py
+++ b/src/tests/test_ez.py
@@ -892,7 +892,9 @@ def test_interactive_trailer_review_drops_and_remembers(
         'commitA': cast(b4.LoreMessage, _Commit('[PATCH 1/1] do a thing', 'patchid-A'))
     }
 
-    def fake_edit(bdata: bytes, filehint: str = 'COMMIT_EDITMSG') -> bytes:
+    def fake_edit(
+        bdata: bytes, filehint: str = 'COMMIT_EDITMSG', **kwargs: Any
+    ) -> bytes:
         # Maintainer rejects the Reviewed-by, keeps the Acked-by.
         text = bdata.decode('utf-8')
         text = text.replace('  + Reviewed-by:', '  x Reviewed-by:')
@@ -939,7 +941,9 @@ def test_interactive_trailer_review_same_trailer_two_patches(
         'commitB': cast(b4.LoreMessage, _Commit('[PATCH 2/2] second', 'patchid-B')),
     }
 
-    def fake_edit(bdata: bytes, filehint: str = 'COMMIT_EDITMSG') -> bytes:
+    def fake_edit(
+        bdata: bytes, filehint: str = 'COMMIT_EDITMSG', **kwargs: Any
+    ) -> bytes:
         # Reject only the first occurrence -- the copy under PATCH 1/2.
         return bdata.decode('utf-8').replace('  + ', '  x ', 1).encode('utf-8')
 
@@ -983,7 +987,9 @@ def test_trailers_interactive_reject_persists_across_runs(
         b4.mbox.main(cmdargs)
         assert e.value.code == 0
 
-    def fake_edit(bdata: bytes, filehint: str = 'COMMIT_EDITMSG') -> bytes:
+    def fake_edit(
+        bdata: bytes, filehint: str = 'COMMIT_EDITMSG', **kwargs: Any
+    ) -> bytes:
         # Reject the only follow-up trailer (Reviewed-by: Follow Upper).
         text = bdata.decode('utf-8')
         text = text.replace('  + Reviewed-by:', '  x Reviewed-by:')
@@ -1066,7 +1072,9 @@ def test_trailers_fuzzy_composes_with_interactive(
 
     seen = {'offered': False}
 
-    def fake_edit(bdata: bytes, filehint: str = 'COMMIT_EDITMSG') -> bytes:
+    def fake_edit(
+        bdata: bytes, filehint: str = 'COMMIT_EDITMSG', **kwargs: Any
+    ) -> bytes:
         # The fuzzy-matched Reviewed-by must be presented for review; accept it
         # by leaving the text unchanged.
         if b'Reviewed-by: Follow Upper' in bdata:

-- 
2.53.0

