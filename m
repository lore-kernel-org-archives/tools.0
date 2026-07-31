Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4863314B9
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 21:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785535158; cv=none; b=fy8NZlJXiME+YWlKL46jlvOTZrs6yDb15TguS5RW5qwD5mP1UqC4XNQl3mx/wjiCxr3axAP+IcX1TmfSCjYqSkGNEZ4J43WX0rKNXQJEa6M2TJ2PdxzdGbtAGYJFKVhgKcq8f127VwNXBWYsF7s/L7ll/9Dmeh2bTENOq0xYuJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785535158; c=relaxed/simple;
	bh=ZiJODX96H3IppWwyZfvZzKPQ3Hw/2Hs07SvYlOF/joE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ifSorrpUBVoanjq0lkfi3f09Jd/oLJW5aAViKKnHRnlfdIzBd0/fqYeb/WvIQljPRt8K8UnVRBU+bLJTVCCZGl3XSttJk9XyGfuqKshzJ1VOFpIb6PPEB+9wytQFveLB6MkuzO09LzWc5EFW6ajAhBUF4nGDhxr0VWLiqiXHbzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oxYWpwVa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oxYWpwVa"
Received: by smtp.kernel.org (Postfix)
	id EE0C41F00ACA; Fri, 31 Jul 2026 21:59:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A9F21F00AC4;
	Fri, 31 Jul 2026 21:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785535156;
	bh=3OjRDZxpIWDHVdTbySjuDIyF4KHB0P8g2Dpb0+Vnyjo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=oxYWpwVarJz77wMEPGRrkLUs8ELqSJ9cA9YH9HDyBzk8IVHY0QLzI48DgvPGEngDr
	 QhUc/55AjaHc+miSRX1htwqCarA4vmtwmlJJa2IbnSIrgryQ9mx4ea2BFRuzdfSdcL
	 6FuHyCzZwIyLVz6FSK2GmuBPRWEf57+ElwlDm078eGq1+nwUiiDfYzOtx+qC++dddw
	 XNvExMtTxfRxPVHGHJG5N6CbmB0kDo7ifWiP0jhDeWOC1kolozev6qAg6y+vvS8YIV
	 gPVuLJc7vFLPeMJY2DvSmBHEorz2o49r/kFtXd4lPgzcbP0YZV/Y6heM0BnmbDPVSV
	 0ZZ7T//XkT1WA==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 23:59:00 +0200
Subject: [PATCH b4 v2 19/44] ty: edit the thank-you review in the tree it
 was pointed at
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v2-19-243fd19d322d@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=2183; i=brauner@kernel.org;
 h=from:subject:message-id; bh=ZiJODX96H3IppWwyZfvZzKPQ3Hw/2Hs07SvYlOF/joE=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlSs32UH4lcWBqr/qh3p9Wux64OK/vD47cwr/n4kqtu
 lfVH8qaOkpZGMS4GGTFFFkc2k3C5ZbzVGw2ytSAmcPKBDKEgYtTACaSpM7wPyJD6lCe2dOtKx9G
 nXqjaCQ6w/r0YbklkjkV76O/PJSdU8TIMGfT48mbFZ3l3y7fcyBBZO/T0M0igdY/jrv5fU7Jbpy
 gyA4A
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

interactive_ty_review() hands the gitdir "b4 ty -g" was given to
everything it calls except the editor, so the scratch file and the
core.editor lookup used the process cwd. Pass it there too.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/ty.py         |  4 +++-
 src/tests/test_ty.py | 10 +++++++---
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/src/b4/ty.py b/src/b4/ty.py
index 5e225a7..a23a339 100644
--- a/src/b4/ty.py
+++ b/src/b4/ty.py
@@ -582,7 +582,9 @@ def interactive_ty_review(
         sections.append((str(jsondata['subject']), details))
 
     buf = render_ty_review(sections)
-    edited = b4.edit_in_editor(buf, filehint='b4-ty-review.COMMIT_EDITMSG')
+    edited = b4.edit_in_editor(
+        buf, filehint='b4-ty-review.COMMIT_EDITMSG', topdir=gitdir
+    )
     try:
         skipped = parse_ty_review(edited, sections)
     except ValueError as ex:
diff --git a/src/tests/test_ty.py b/src/tests/test_ty.py
index ddf3d7e..ce299fc 100644
--- a/src/tests/test_ty.py
+++ b/src/tests/test_ty.py
@@ -1,7 +1,7 @@
 import os
 import pathlib
 from email.message import EmailMessage
-from typing import List, Optional, Tuple
+from typing import Any, List, Optional, Tuple
 
 import pytest
 
@@ -123,7 +123,9 @@ def test_interactive_ty_review_drops_skipped(monkeypatch: pytest.MonkeyPatch) ->
         },
     ]
 
-    def fake_edit(bdata: bytes, filehint: str = 'COMMIT_EDITMSG') -> bytes:
+    def fake_edit(
+        bdata: bytes, filehint: str = 'COMMIT_EDITMSG', **kwargs: Any
+    ) -> bytes:
         # Maintainer skips the pull request, keeps the patch series.
         text = bdata.decode('utf-8').replace('+ [GIT PULL]', 'x [GIT PULL]')
         return text.encode('utf-8')
@@ -157,7 +159,9 @@ def test_interactive_ty_review_keeps_all_when_pristine(
         },
     ]
 
-    def fake_edit(bdata: bytes, filehint: str = 'COMMIT_EDITMSG') -> bytes:
+    def fake_edit(
+        bdata: bytes, filehint: str = 'COMMIT_EDITMSG', **kwargs: Any
+    ) -> bytes:
         return bdata
 
     monkeypatch.setattr(b4, 'edit_in_editor', fake_edit)

-- 
2.53.0

