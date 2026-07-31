Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128EA3B0AFA
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 09:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785489702; cv=none; b=hojBoPZe/hRyvLT7QmuVIYIpBMmnUCPuo/fvFslL0ZYkaY4L1ko89hc072dakRGVIZ4+kr1uU+RYVPQnsn6p0E8xUfGFJ81zd245o32zOzzCy/1L8sctjESvI60OW1NS2oNp4xSYShoIKv+nf0pLSAPwiuIaXGV5hahLPr4j/SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785489702; c=relaxed/simple;
	bh=QeHcNTmAlKG2BcoNkHTzwVOOqoU+S3vUdYC27zCay9Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LaJ2Der+PdLtYBR/7aH1PadYaSc6i8DGm8c+KX1VUOW+uVA+g7myGte+SUqwBdmAOAyf3lk4StRdEqytIA2VIkCRGdxDjRmpgKTemxWZhhvjAdtPi1dCR5EEftn1F58fMnqP+V8V/8x8+sHV4MvP+JDwo18CLfgz8EFQjYJ+8eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FNxmMvWI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FNxmMvWI"
Received: by smtp.kernel.org (Postfix)
	id B972F1F00A3A; Fri, 31 Jul 2026 09:21:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECFFA1F000E9;
	Fri, 31 Jul 2026 09:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785489700;
	bh=OQ7rkGqSDUFEjCiS6H8fL3cCqbfRM//61Sp2E15HgkU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=FNxmMvWIFw7gAYyrXajQA7gQQ/57HEPwLybLMeSWTprWNrscp3z1Vtt9i0nEyPf1N
	 kiFeWZcHvhCfSNHb7XTZDqgQ04d+M1Admbi8vh+BAmqXyXsR7XbWNEEpet8ib0VD+2
	 B2z5i7/59ka6PJQhzHMSXUBIJ86TKIpCj58s59n+1O67UzDP/WKfUPbO5s/YaVu1tM
	 Zs89uoXEUC29YG0ReW1Lnu4gAeIhfh+wWC9TkNBR8D0fFAeRj8jvUtUYCDrAN7UoEu
	 X75NFojcfZCFB+xcjCwiSZw1V9h9qby33grtucSOjU3u9p2WPb0T3plB2Y1Cp1RVtd
	 wp6KIoP22Qk0w==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 11:21:10 +0200
Subject: [PATCH b4 11/27] tests: cover the unaccepted take in the
 thank-and-archive chain
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v1-11-de68a7c8e4cb@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v1-0-de68a7c8e4cb@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v1-0-de68a7c8e4cb@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=2273; i=brauner@kernel.org;
 h=from:subject:message-id; bh=QeHcNTmAlKG2BcoNkHTzwVOOqoU+S3vUdYC27zCay9Y=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlZIqKzKyPVPD/udyg5Mmd6Tpr/A6uDRBzF7u4XMrzh
 cZThlPXOkpZGMS4GGTFFFkc2k3C5ZbzVGw2ytSAmcPKBDKEgYtTACbSdJnhr/x95zTrlOsRR6TV
 JkkIP9XbayYr5XUk7MjXX39/7eT/0c7wV0bFuTVQv27TzNcri94sZnd6s0nOgC1m9fPdl535/nM
 rcgIA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

The aborted take already has a case. Add the other path that returns
None, accept unchecked in the dialog, so the two stay apart, and give
the harness a knob for it.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/tests/test_tui_tracking.py | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/src/tests/test_tui_tracking.py b/src/tests/test_tui_tracking.py
index e6a25a4..fe68daa 100644
--- a/src/tests/test_tui_tracking.py
+++ b/src/tests/test_tui_tracking.py
@@ -4421,7 +4421,10 @@ class TestTakeThankArchiveChain:
     flow only when the take leaves the series fully accepted."""
 
     def _run_take_final(
-        self, take_status: Optional[str], thank_and_archive: bool
+        self,
+        take_status: Optional[str],
+        thank_and_archive: bool,
+        accept_series: bool = True,
     ) -> Tuple[List[Tuple[Dict[str, Any], bool]], List[str]]:
         """Drive _on_take_final with a mocked take returning *take_status*.
 
@@ -4434,9 +4437,9 @@ class TestTakeThankArchiveChain:
         notices: List[str] = []
         app = TrackingApp.__new__(TrackingApp)
         take_screen: Any = SimpleNamespace(
-            accept_series=True, thank_and_archive=thank_and_archive
+            accept_series=accept_series, thank_and_archive=thank_and_archive
         )
-        confirm_screen: Any = SimpleNamespace(accept_series=True)
+        confirm_screen: Any = SimpleNamespace(accept_series=accept_series)
         series = {'change_id': 'chain-1', 'subject': 'x', 'status': 'reviewing'}
         with (
             patch.object(TrackingApp, 'suspend', lambda self: contextlib.nullcontext()),
@@ -4491,6 +4494,11 @@ class TestTakeThankArchiveChain:
         assert not thanks
         assert any('take did not complete' in n for n in notices)
 
+    def test_unaccepted_take_does_not_chain(self) -> None:
+        thanks, notices = self._run_take_final(None, True, accept_series=False)
+        assert not thanks
+        assert any('not marked accepted' in n for n in notices)
+
     def test_unchecked_box_never_chains(self) -> None:
         thanks, notices = self._run_take_final('accepted', False)
         assert not thanks

-- 
2.53.0

