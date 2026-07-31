Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9B537DE9B
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 21:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785535167; cv=none; b=LzV4p5JX+ip9N+JbhcwiEcHPIiRc9LGYxab5BKodDy5dkBK28cjrxfh/vZKcruk57f1QuxV3sL9TK5WWu0pIzrxxeAK2FWeHLA1uC2jGyvpTDLnlpUKEW4IPNdFz7F5fc7iidAG7Dr1BnyRLlXrzK4a//DTb5ceQmoXmQZXvwZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785535167; c=relaxed/simple;
	bh=H2AWmZrYE2XLJfSwu/ZgZD2cptVCwtKGSRucwMuTUWU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=czQx5+PX+I0KXtR8KVRUkIyphPPo4I1vGYU2+/e29ImKOmUxqmfaxvVxktS9T2qiY0lNnabEcQpRq/c7Vr6fVEjrDBENRIrIGXAROiBh2/CbOzaQQ7/nYUCdwIOidvsV5yMK+pt+4ft+GutV2ZKci4pyvqhKG/EHag7uZktoMd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fq/EFRuq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fq/EFRuq"
Received: by smtp.kernel.org (Postfix)
	id 695A11F00ACA; Fri, 31 Jul 2026 21:59:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AAC21F00AC4;
	Fri, 31 Jul 2026 21:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785535166;
	bh=g7I+aLlAmgURaI5Y2Y3LhjQ/MIUYGsOlZzOR4pxm/RE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=fq/EFRuqMw5rYSvdgxkTl+lApQY4zJFHJSvSrLAkXpudl+WjTOV0VhBGqQR1AQ0Vq
	 5VZ8i1QSJuwTJwnvEz1GnQuEaVsK1W4dSUPp+XcocRqz4LQQ4ZIp02pW6b4U79YDFU
	 3csNrnTyJK1YM5q1UGGX9VJv3s4poFwQ5uRZlshRkF/F2tk8LVqaJwx3J+pjH5Ns0x
	 xvrUAbh87eaRYHfJPpIFjizS9SmzdS/6cIkoqocVW6dhTeSzs+M9snygJmg9nfKFGV
	 qdOuOwETBGOOkSRbX9urGA1LxKtBIuHi9MBmQ3WcNYP+th8E6YVHBpMDKeOEzzO8K7
	 1U7zjy4pTuK0g==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 23:59:08 +0200
Subject: [PATCH b4 v2 27/44] tests: pin the default branch in the
 queue-delivery fixture
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v2-27-243fd19d322d@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=1189; i=brauner@kernel.org;
 h=from:subject:message-id; bh=H2AWmZrYE2XLJfSwu/ZgZD2cptVCwtKGSRucwMuTUWU=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlSs3Zmfltv0aSlw1rdcnSi1dfzZCtq9O+sV5gSsf20
 2l7xW5f7ihlYRDjYpAVU2RxaDcJl1vOU7HZKFMDZg4rE8gQBi5OAZhIkB8jQ8uGHSf4X2aFz9ff
 sufm7zI+k/03r3O419x5WTfl2IwXv8MYGT5E/hM485IznHviFOY63rUh9y7bv9ks/WXKFYH3a7n
 8k3gB
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

The fixture pushes to refs/heads/master but creates the bare
repository with a plain "git init --bare", so any other
init.defaultBranch leaves the clone on an unborn branch and the test
fails during setup. Name the initial branch.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/tests/test_ty.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/src/tests/test_ty.py b/src/tests/test_ty.py
index 968d672..8ca5184 100644
--- a/src/tests/test_ty.py
+++ b/src/tests/test_ty.py
@@ -355,7 +355,10 @@ def test_commit_reachable_unknown_tips(
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

