Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1E03B19A5
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 09:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785489697; cv=none; b=mHIqkRQGVL2WfiY44AcEQApr6NaFLaQ8PfBaSh5k0XdVH9GZrZ20F9flzEL3VRXzs05Dx9qZt/0IwHsZwJX/8vMPGYmcvb15I/2gUZniOIfP0YGZs1k7PUwFoM+1cQLn+46/hdx2TT5lduzojafzP+6Z+IFqTkVAJxdL5nmA0SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785489697; c=relaxed/simple;
	bh=bpzDdHf1B7110GjidLwmBHjBrbHRC5bkXmNhJfDuBGQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tRjf++C11Ybf2x+K1+aakt1vA5BQQRNWyvBwLmCpDSFbqVzHT/4Oj3uWanIvEM+HCSo47T5Wyzz+PLgIA7SBFXxSFLPYIdFDAzHBjldywEUsPG55L2VbJI0F/T30WmFT35HkBBy/wDLibSSwTbnhVPqgsV5eRus0DYNOsiZPf38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ahkjwEcz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ahkjwEcz"
Received: by smtp.kernel.org (Postfix)
	id 1C7621F00A3A; Fri, 31 Jul 2026 09:21:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FDE01F000E9;
	Fri, 31 Jul 2026 09:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785489696;
	bh=daCL8z/Zq90Z1xWB45akxYIYbDnKlFn9z5gFiW0/50A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ahkjwEczBnHEnrM8U6OTRmN7fxcDRKXgfGqfd+KBxjKuyVCTiFYHtYHOr2c/ByVYh
	 vylT7tTAr/0+cZyjGZZyFRIPhhJQyS+sDHQqIW/B6fGopku5R1j6tksTrnT5ofb6yE
	 mvERKH0Ap/6OkvE8J/RgvrBxS4UbF3dj8Zic7bOZczVZ33y16Xw2SHWrnaJcVkgnZg
	 j6Qz7x8yzWMmfoAnzhw0dME81qQ7V64l7OCShKsrcNVWGexnvCPidAq1XgxSpo+h+K
	 3cpwIBDMVkjF4KGPUNBt0i7BR5WVmZEwnJmy4GLkYwBIMxF0o05NsprKgcWfAXqQyG
	 t4I4YrRp0LWuw==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 11:21:06 +0200
Subject: [PATCH b4 07/27] tests: cover an unwritable series archive
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v1-7-de68a7c8e4cb@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v1-0-de68a7c8e4cb@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v1-0-de68a7c8e4cb@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=1739; i=brauner@kernel.org;
 h=from:subject:message-id; bh=bpzDdHf1B7110GjidLwmBHjBrbHRC5bkXmNhJfDuBGQ=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlZIrGHV+mnneAYU0K21Xhbn4+ce1LSrvqveRXHe6ap
 q1Vcziko5SFQYyLQVZMkcWh3SRcbjlPxWajTA2YOaxMIEMYuDgFYCLdhxn+h/4Ur7nK0aLCt+nz
 /IAMo+3vWys2L+ONF1T/c3SVrvOrEkaGvdJuiyf9Prtrp3qNaKrirmfrdRYszj1vsSpp/sZjv1m
 1OAA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Check what the thank-you paths depend on. A failing write comes back as
(False, detail) and leaves the review branch and the series status
alone, so the archive can simply be retried.

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

