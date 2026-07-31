Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402A2372EC5
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 21:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785535152; cv=none; b=PqJqSQnYGEUElTX2mYqHtPUqEJe4WaqC7F9Wjlo/hj1DbUQHq0OC7Bjt8UVNEkDP8BasBGuO/UUIVgXM8Ukzk05wtvVw+WtuSwwbIZX7keGsFWFx8lScJeYjS8pGov6OraGlbczGdSCsrzRGY6uTu86lW1qABkJvqEpJYPkl+w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785535152; c=relaxed/simple;
	bh=3lAsUhbE8Ar8tx1HzUywSXFV2mxPkUl1ogiYYG8U5qk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F2Z3d2o6LhRyhfG4PBTTiVwVuvnbG8a/xeIOdC/+HnHUR0CnOR/D2/rHURuGH0mZvYvaCIgEU3Vrk1TBBdlC5Lgi7wFT5VrVb4cB1b/5N7Gx6BtXH3pQtbkWZ7gc3eq/4TyHjK7VZl08oZtPO7JqN0Joic+pl5rwLC7/YrHyUL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c0FAS8k8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c0FAS8k8"
Received: by smtp.kernel.org (Postfix)
	id 0620F1F00ACF; Fri, 31 Jul 2026 21:59:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36CCF1F00AC4;
	Fri, 31 Jul 2026 21:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785535150;
	bh=1gl+50hfgiijsXqDIPrIHrIodIpxTDKFmf7hlOAwTtE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=c0FAS8k8fbd7sPWMyBpodwLAM3F2K5ElnL5MsoyU7Xkryyz5aoZYaR3vrHT1btRTl
	 b4JX/MS3v71RvdIQ9HNmUIiFF/59NI5je7L2fabqyJAeNjNs9V5oXPB7nLQCTmNrnR
	 gm/zlNRYbEvt8/c/U+U0pPOqExZCXI0OG3iVT4hHOYyJTXBQ+wxFq1BzpRJ+iJhb60
	 a72Kq7yvMkdmhYY1yyAbAekX4x9FgXl3ckpJGzHPKQ0ACQT/Weu7WGOGyx9Pj949dj
	 hi7qQru+D+vnmaDyYOEo0uMVFA2QSwhS6gV5AgTvC3LOWBTE2lNJ1d11dU/VpOqFZB
	 8HjQwzaBIPqVw==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 23:58:55 +0200
Subject: [PATCH b4 v2 14/44] tests: cover the publish check using the
 repository it is given
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v2-14-243fd19d322d@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=1944; i=brauner@kernel.org;
 h=from:subject:message-id; bh=3lAsUhbE8Ar8tx1HzUywSXFV2mxPkUl1ogiYYG8U5qk=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlSs2O6X31tUbQbiO7kLDu9s+vcj7wl6n81di+QTVUM
 lFo4i/VjlIWBjEuBlkxRRaHdpNwueU8FZuNMjVg5rAygQxh4OIUgIlYyTAy/PxymPn8a6NZEdZb
 nSq1eXfKK6lnT03YbNbiz9u+VGlPCiPDNZuiNRw24bnxi0rOCPM2VnLxKLhL/ZzCJvT36OXNGl7
 cAA==
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Run the check from a different repository than the one the commit was
pushed from and verify that naming the right tree is what makes the
answer come out.

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

