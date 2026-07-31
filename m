Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16B73B3C0F
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 09:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785489716; cv=none; b=jJwvIqEv41d1nppHGLYwQboJbui5WXUW8PMHR50jhRpchCn35B+Zh6UrWPx5SULyiifsGCpC5JjePfVZ3pPe0PTpKzxPSe4S3DEQy+Q8d4Vb7aybtz6LsLWdtERv1RH0w6j0zZFl1ojuZ8PIJlQGxUigZVe1B3hnvrpj8lPGTpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785489716; c=relaxed/simple;
	bh=t8U9MfrhXsvMJB+3o/myLQwegIwkfNNWRU1F7nxOpAI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tn9JZAxNN6ottPtdvoSCbZ7fXXYKKZZYZtKVuUzkrWU/4L3J/pps9QeAO2iCs9OX/eBBTqE7n780Bp14l78S6kcJXjD1UfTpipV0AJP85kMvA4Fira20XMVOup6+LK7yMrXlLrOY63lQ8WUu0EkRliq6JEMSwQBno/j1olEKDgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mGAy+nh8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mGAy+nh8"
Received: by smtp.kernel.org (Postfix)
	id B11E01F00A3A; Fri, 31 Jul 2026 09:21:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E457A1F000E9;
	Fri, 31 Jul 2026 09:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785489714;
	bh=Oay0oFbAy8Z/Trr5XYVQaxHTD2aXIcBwWdeqIOoj1BI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=mGAy+nh8lrlCxpn2/doQkjX3wQn2RBqQTSX+AUMrS8peLeLtQmbXw9o5ZDTG1qiK3
	 jnPa9dRqTCdL459IQwkPRLQJeJ+gDVwYRqtjmmmR6Pf6kj0fyuTu0C2aqL2arPNWFV
	 CEPlVeAAN1ay2+w2FuqTEKw8gGEITuLaYOUCSTfkWE3CU2hjqr6mmQkTm23XFG69I8
	 Du7H86R9aIf3pVh+CQwr5v16O6FrXTrIK3hlh3j2FlPqMrx9ycLE7tmOuBF06IDFGw
	 se0NrIbvUh0nMyQGfahg1saVadV781Kz89fCTSEOnmQ9mEQXtTugcfCJYX9Cpfydv1
	 RMWIQDLFEgOiA==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 11:21:22 +0200
Subject: [PATCH b4 23/27] tests: pin the default branch in the
 queue-delivery fixture
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v1-23-de68a7c8e4cb@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v1-0-de68a7c8e4cb@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v1-0-de68a7c8e4cb@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=1603; i=brauner@kernel.org;
 h=from:subject:message-id; bh=t8U9MfrhXsvMJB+3o/myLQwegIwkfNNWRU1F7nxOpAI=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlZIqlx8w+d29Dc7fShXcVEkb/BLlVLx+LLJy7hXmq9
 tyFU5c5dpSyMIhxMciKKbI4tJuEyy3nqdhslKkBM4eVCWQIAxenAExEIoKR4fV+Pud5zFtm3p3g
 U28u9EfkjHuzwt2JogXMSZXpEyQVXjL8z9wgvCf6tKPx8vv/H0xY0PA/5rnU/IORRk+2rLCP/sa
 RxgcA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

test_commit_reachable_unknown_tips clones a bare repository that it
seeded by pushing to refs/heads/master, but it created that repository
with a plain "git init --bare". The clone takes its HEAD from the
remote, so with an init.defaultBranch of anything other than "master" it
ends up on an unborn branch. The commit meant to advance the remote
becomes an unrelated root commit and the push after it is rejected as a
non-fast-forward.

The test then fails on a setup assertion and never gets to what it is
about. Name the initial branch so the fixture builds the repository it
means to build no matter what the developer has configured.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/tests/test_ty.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/src/tests/test_ty.py b/src/tests/test_ty.py
index ddf3d7e..5b08587 100644
--- a/src/tests/test_ty.py
+++ b/src/tests/test_ty.py
@@ -316,7 +316,10 @@ def test_commit_reachable_unknown_tips(
     pub = str(tmp_path / 'pub')
     other = str(tmp_path / 'other')
     _init_repo(local)
-    ecode, out = b4.git_run_command(None, ['init', '--bare', pub])
+    # -b master: the clone below takes its HEAD from this repository, and an
+    # init.defaultBranch of 'main' would leave it on an unborn branch, with
+    # the "advance the remote" commit landing as an unrelated root commit.
+    ecode, out = b4.git_run_command(None, ['init', '--bare', '-b', 'master', pub])
     assert ecode == 0, out
     monkeypatch.chdir(local)
     c1 = _commit_empty('c1')

-- 
2.53.0

