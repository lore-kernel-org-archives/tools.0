Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9923314B9
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 21:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785535143; cv=none; b=BE9hXd2DreZttka065IxYc8G+nNtafaSUXBuvrWfUPs8M0PJCvV779Bq5U0QOnX8SNyvw8HJR4sP5mjDT1zJvSq2HHK/k1jeDh7teFC85oJSzLe9on9eYye2NeoPVlHARYAlXZO/YKcqE8sui2J2rcFl/XVHtb9gUojuEGi+xYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785535143; c=relaxed/simple;
	bh=BDPKt2RLGrv4rIKQuk7sXKg4gjYbIrDPQWCGYYlkQ/k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jKubEE03HbURJ5Fx388ptSCPoYEnZ6ThOi07Tn7MLidpE8BPV2fGvtSR2t7NkTEnzMklw7TV9reilKIKd/mzcOV7LmaHsLogA1idw8xGR9o8vtzwAEj6xMdzaRRJLUBTYzyt2o3l66ZpflZlfBQq4LwxWPFnqrQD/k7G82nKEhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A7vADRsb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A7vADRsb"
Received: by smtp.kernel.org (Postfix)
	id BC5661F00ACA; Fri, 31 Jul 2026 21:59:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEADF1F00AC4;
	Fri, 31 Jul 2026 21:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785535142;
	bh=VIh43oKb0bGl6Z0BuYj0L2nY46BYE1lvU/cMS0H+pjU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=A7vADRsb7XZPwxiEVGRbznCvA55dpPWFsQ+aTiVKTbb5FAK9dzfo1zWpQdQ8kW6NS
	 HdeW/DAWfJjvlZ1mZf5+I3mpa5bcb2UaF8hxsbfyFR/6az7OJlH0GjTQ/GZ3KobYwt
	 4uuRxqtQviJkkrBa1OrHIrtCiLaMRsLZWfRvEudNfnYtVZPPdc2fdpZAkDe27I8icQ
	 xCt+oSuCzy/CtTWdA4jF0h11Pidb0HePH8ZQn4ugneri7hGoYbP/btr3Zxwcv8lV84
	 pnQwbGHjk4BYBlKCOcVnNi2V3zkKYErkaSmvrHW6xInxCtov76aWF3fVoLMZYc2k08
	 bT6mS5Z0u+yHg==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 23:58:48 +0200
Subject: [PATCH b4 v2 07/44] tests: cover an unwritable series archive
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v2-7-243fd19d322d@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=1689; i=brauner@kernel.org;
 h=from:subject:message-id; bh=BDPKt2RLGrv4rIKQuk7sXKg4gjYbIrDPQWCGYYlkQ/k=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlSs3y/PZ/o2VI3vzQzkfbjomE9OdxXMs61ybzs3vVm
 pdfvqwO7ihlYRDjYpAVU2RxaDcJl1vOU7HZKFMDZg4rE8gQBi5OAZjIpjpGht7sn/sZ3a1SDFOa
 DdmnB95kCLCy1t43n23pY64/BQyvuhn+u2bWGP4qdtCMTOJp/R769JLqtw2Lthhf7yw0e3WOb8M
 lRgA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

A failing write comes back as (False, detail) and leaves the review
branch and the series status alone, so the archive can be retried.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/tests/test_review.py | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/src/tests/test_review.py b/src/tests/test_review.py
index b0e924e..5fdb608 100644
--- a/src/tests/test_review.py
+++ b/src/tests/test_review.py
@@ -4742,3 +4742,24 @@ class TestArchiveSeries:
         assert ok, detail
         assert not b4.git_branch_exists(repo, branch)
         assert self._db_status() == 'archived'
+
+    def test_unwritable_archive_is_reported_not_raised(
+        self, tmp_path: Any, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """Archiving happens after a thank-you has gone out, so an I/O
+        failure must come back as (False, detail).  Raising here would be
+        caught upstream and shown as a send failure, telling the maintainer
+        to send a note that is already on the list."""
+        repo = self._make_repo(tmp_path)
+        branch = f'b4/review/{self.CHANGE_ID}'
+
+        def boom(*args: Any, **kwargs: Any) -> None:
+            raise OSError(28, 'No space left on device')
+
+        monkeypatch.setattr('b4.ez.write_to_tar', boom)
+        ok, detail = review.archive_series(repo, self.IDENTIFIER, self.CHANGE_ID, 1)
+        assert not ok
+        assert 'No space left on device' in detail
+        # Nothing was destroyed, so the maintainer can simply retry
+        assert b4.git_branch_exists(repo, branch)
+        assert self._db_status() == 'accepted'

-- 
2.53.0

