Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2903B0AFA
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 09:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785489705; cv=none; b=jcD1bhZuil5e+hyr7Z5jyWcqufGpTlP10FHa95fA0WaNvDQTZl8jL/4LrZ9iLF2KvniYWH518HQhauMKLhFDtBiWcNoGvd3ca13haqKYbE2paQGSDYE/aT/4bEVUQ0GYuQagFP3kc+SK24/t8ljmR3f6gL/dAJQMopDCEazCFeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785489705; c=relaxed/simple;
	bh=Q6bGROAGnjYdgNMfIQusAWibvJQPNUxgR/q6CJOd8wE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CcfmvB+L2ybIkmzMtNjZSN9NUxPVtnNLBbd4DKIXlKkvb5DVgivwoKSVDQAtoazIDqC6s3EbhTyZF97p8CRrJdgmu1+PKPr84TAldY2Q7N6ycY5szs/m93coQB4rVbcJ7Bj9gNhi7r0LwQASSQ0K0oQB16SNHYeU6E3zJ6fFBxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KbTwgkiI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KbTwgkiI"
Received: by smtp.kernel.org (Postfix)
	id 3D2C11F000E9; Fri, 31 Jul 2026 09:21:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FB2B1F00A3D;
	Fri, 31 Jul 2026 09:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785489704;
	bh=fMHz63GM6S+yvSD4t0TQMUoYFQN6kCOj/n3CspqZtnw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KbTwgkiIjrc2Aekv6ILd7CAj+GfDopqU91t1psEfMN5HTERfHqpBBMdVZmA204dyg
	 5ah9okt+frBemyJd6YrQ/85fhveJoMLfpVnJItDhpBPcf2bVcRKcZgqY0eRQGogmL5
	 wOdVx4sE2Lc+mhDyHbbmS85AGjsiMaKmsgR6Lzov+SV8zYIsVxJPdtnrDNOs0me3kS
	 kSaNh3Bzvg/k0A/5xAVj75Ctm24Fab/FedEPzN/YwcV/oz4N+w+xUB0Q1n8ZCPmtwK
	 Y+bGDucUyKXRuhuZmOhIsXEqjjaQhafKA/aQR3L6WNk8dmLeWZLjmh/70PV/DU/YL6
	 2e5Ckp/OSdakw==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 11:21:13 +0200
Subject: [PATCH b4 14/27] tests: cover the publish check using the
 repository it is given
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v1-14-de68a7c8e4cb@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v1-0-de68a7c8e4cb@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v1-0-de68a7c8e4cb@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=2008; i=brauner@kernel.org;
 h=from:subject:message-id; bh=Q6bGROAGnjYdgNMfIQusAWibvJQPNUxgR/q6CJOd8wE=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlZIpJvDT1kTspWHrQqlYoMiMzPMlFge1cykXxQ9u7N
 q08mDKlo5SFQYyLQVZMkcWh3SRcbjlPxWajTA2YOaxMIEMYuDgFYCImWxgZDh19K5Epy/Fv/jT3
 Txqb6w9mG9zrXSvXmRkbdPiEvNP/TkaGOYsnVOSUVvEUt081PV2yMWBPpXCQPVfGvYC0qm07QqL
 ZAQ==
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Run it from a directory that is a git repository but not the one the
commit was pushed from, which is what a multi-project cron sweep looks
like, and check that naming the right tree is what makes the answer come
out.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/tests/test_ty.py | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/src/tests/test_ty.py b/src/tests/test_ty.py
index 610e5af..ddf3d7e 100644
--- a/src/tests/test_ty.py
+++ b/src/tests/test_ty.py
@@ -364,6 +364,34 @@ def test_commit_reachable_branch_filter(
     assert b4.ty.commit_reachable_on_remote(c2, pub, branch='gone') is True
 
 
+def test_commit_reachable_uses_the_gitdir_it_is_given(
+    monkeypatch: pytest.MonkeyPatch, tmp_path: pathlib.Path
+) -> None:
+    """Ancestry is computed in the named repository, not the process cwd.
+
+    'b4 review cron' sweeps several projects from whatever directory the
+    scheduler happened to start it in, so the cwd is nobody's repository."""
+    local = str(tmp_path / 'local')
+    pub = str(tmp_path / 'pub')
+    elsewhere = str(tmp_path / 'elsewhere')
+    _init_repo(local)
+    _init_repo(elsewhere)
+    ecode, out = b4.git_run_command(None, ['init', '--bare', pub])
+    assert ecode == 0, out
+    monkeypatch.chdir(local)
+    c1 = _commit_empty('c1')
+    ecode, out = b4.git_run_command(None, ['push', pub, 'HEAD:refs/heads/master'])
+    assert ecode == 0, out
+
+    # An unrelated cwd knows none of the advertised tips, so on its own it
+    # cannot see the commit -- the objects live in 'local'.
+    monkeypatch.chdir(elsewhere)
+    assert b4.ty.commit_reachable_on_remote(c1, pub, branch='master') is not True
+    assert (
+        b4.ty.commit_reachable_on_remote(c1, pub, branch='master', gitdir=local) is True
+    )
+
+
 def test_get_check_repo_for_branch_priority(
     monkeypatch: pytest.MonkeyPatch, tmp_path: pathlib.Path
 ) -> None:

-- 
2.53.0

