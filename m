Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2784B379C2A
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 21:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785535159; cv=none; b=kwq+0UqKH21OvXLUbjH4gbI3fPrKk2bVCjozeANqysl3NG6sCGqDlWyB2CqP4P8NeQrNJvEhJsbRxThPgtBs0FbSXiT9xZAyIUcLiVcPKRi7l8SmUChtrZ2RPYoX0G55IJj7v556uvK/tZZDjYPyYFLlisqA3o9POXrnOWblDTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785535159; c=relaxed/simple;
	bh=XwUZAMoX72VnZAU0Ng0/z5wX1AN9UE+pQpOp5b3IwQI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=owifKfoqUKY+NphWFgJoAjhTb/BUCV7TTLidOP8EMjK8ft8DtoZiiBhZBJQVvYth9kutrrbdRQk/+nt7kBzBAyvgDB0iKE8O3mf4rvNepywzPzDxoYHLO+HRKzXdclEMJnq8KCy1gZlRWxQfPddR9ZhD2I7j+dKzw9uQ4Zj1qyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h0WdS6Pe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h0WdS6Pe"
Received: by smtp.kernel.org (Postfix)
	id 241061F00ACA; Fri, 31 Jul 2026 21:59:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 558581F00AC4;
	Fri, 31 Jul 2026 21:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785535158;
	bh=m3ZvO0iFhDGZBOkLzgluFtmUzyCSLoenpzUa3bZUoc8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=h0WdS6Pe0HyBoXVKmxSGEepfui1ING71NJdxhKIJDtpWQuIWZCI6JCZ7dvtgOgVMk
	 anHxSA5VLwAQ/EnoSX0Rw0mbN9mh8k4iuMejI278HhdbWOdLzjt89DG3wlGtL8Ymh/
	 J8t4hhA0XBvuhbGCvhap1tcusGGLparMsaAiTmzDYCpMImIPtdkuX4e3tY4OaWet+l
	 SEcLdKog/SKvbuwsPIoZY67ZOK+hvmQCJRDQIrDCYlW7lNCUcNGgWIH2dSAV0T3VQy
	 JDw08n4p0j0dNjdI/kpejQhmGnDUP9zojb59O8Xclf3Q7ENSM0YIqZh95bJDFNNJRS
	 14uWfosITq4CA==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 23:59:01 +0200
Subject: [PATCH b4 v2 20/44] tests: cover the ty review editing in the
 named tree
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v2-20-243fd19d322d@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=1851; i=brauner@kernel.org;
 h=from:subject:message-id; bh=XwUZAMoX72VnZAU0Ng0/z5wX1AN9UE+pQpOp5b3IwQI=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlSs1+b/lp0l2XhUtnf/2n9Pb1xNlV1VNWBzz8eI1DM
 3Hj/isT3TpKWRjEuBhkxRRZHNpNwuWW81RsNsrUgJnDygQyhIGLUwAmElTHyPDGLVHV3mzfUo/+
 R+8CGKyDjiXcTF5cdaV+AdvrA+7aM2MYGc707p3+ccGbc/KhjFlF6qlHNJj+LTh3wFk4IUviy+1
 fl/gA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Check that the editor is opened in the tree "b4 ty -g" was given
rather than the process cwd.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/tests/test_ty.py | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/src/tests/test_ty.py b/src/tests/test_ty.py
index ce299fc..968d672 100644
--- a/src/tests/test_ty.py
+++ b/src/tests/test_ty.py
@@ -170,6 +170,41 @@ def test_interactive_ty_review_keeps_all_when_pristine(
     assert kept == applied
 
 
+def test_interactive_ty_review_edits_in_the_named_tree(
+    monkeypatch: pytest.MonkeyPatch,
+) -> None:
+    """'b4 ty -g' names the tree the thank-yous belong to, so the editor runs
+    there: a repository-local core.editor is the one that applies, and the
+    scratch file lands inside that tree rather than wherever the process was
+    started from."""
+    applied: List[b4.ty.JsonDictT] = [
+        {
+            'subject': '[PATCH] Add frobnicator support',
+            'fromname': 'Foo Bar',
+            'fromemail': 'foo@example.com',
+            'sentdate': 'Mon, 1 Jan 2026 00:00:00 +0000',
+            'msgid': 'patch-1@example.com',
+            'trackfile': 'aaa.am',
+        },
+    ]
+    seen: List[Optional[str]] = []
+
+    def fake_edit(
+        bdata: bytes,
+        filehint: str = 'COMMIT_EDITMSG',
+        *,
+        topdir: Optional[str] = None,
+        guard_branch: bool = False,
+    ) -> bytes:
+        seen.append(topdir)
+        return bdata
+
+    monkeypatch.setattr(b4, 'edit_in_editor', fake_edit)
+
+    b4.ty.interactive_ty_review(applied, '/some/other/tree')
+    assert seen == ['/some/other/tree']
+
+
 def test_get_applied_info_picks_latest_and_lists_commits(
     monkeypatch: pytest.MonkeyPatch,
 ) -> None:

-- 
2.53.0

