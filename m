Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA02448BBB
	for <tools@linux.kernel.org>; Wed, 29 Jul 2026 10:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785321887; cv=none; b=Jm3g9wVY3Kk/t+HYEkhM9kuXqZANcgo4d+8QHTPazAqImML7BTr4b9T5SjzUHi9kzQIGj6K5Xw0GoWSMV5lUv1WTx8PbDS5okru7/ixU07+QW2fUnvetsH+TokJPGFjAvLpfOkxKxIyFTV0sMZng3nB3yNwP97Eo4eYRablr6/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785321887; c=relaxed/simple;
	bh=ihLj2SvA+LTg3IxOHust1d084fPtTMBsmyjFT5WjnuM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sDh0QjRKkXz36kAoJ/QPhVgMvBiiftKVOXbuLKB2JWV+TruRkDY56jPE2Vrm2yHCPbUDsMUt3OiEQBNdEf35r9N+qe/AhmvSIXJOZ9cp69oa08t8dNlmeWySy09TIvxQZyoUaMyDlR6Gtqn4+Ck6uxBkkhtw9EGxf1SQ+OQ1aNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iug9PKNo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iug9PKNo"
Received: by smtp.kernel.org (Postfix)
	id 210961F00AC4; Wed, 29 Jul 2026 10:44:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EE3F1F000E9;
	Wed, 29 Jul 2026 10:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785321879;
	bh=dprx3Kh64SSzRo0FfOsiW5dDNDWJLCEr4PT3myaSWv4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Iug9PKNoT+gpqdOdQV17YqmFnuFVNiLK8RhuuC55wso8Afr4VHZ+nNjSsECRilm1V
	 eksFJwPQh02ILBdwJvszQOkAsujweP65yyN1ZhJt9hhYY/zjthv/dmJfxZJzUFGtmy
	 08DhOJzMJrZ6sUCKWD3CKoAcIgDSH8LrZjG2+ffMnEZN9U69FJpCH1Y5WA02I2Php1
	 q9mdfz4q3+2LyH0SGDvs2C9HAv/Y4GivxX8CZ8h/qxwnix+SK5mc4ALBVy4qXu9Dfw
	 Yld5A6JDl6e04O2dggL9MPFl912mlJPSSUMCO/OtDpSi6Ieo+D0haJgYSqAFhQnhVQ
	 AupoUYGR6ClYQ==
From: Christian Brauner <brauner@kernel.org>
Date: Wed, 29 Jul 2026 12:44:31 +0200
Subject: [PATCH b4 4/6] fake-am: use the scratch-worktree overrides in the
 staging worktree
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-work-b4-scratch-worktrees-v1-4-e96995158d4a@kernel.org>
References: <20260729-work-b4-scratch-worktrees-v1-0-e96995158d4a@kernel.org>
In-Reply-To: <20260729-work-b4-scratch-worktrees-v1-0-e96995158d4a@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-b7988
X-Developer-Signature: v=1; a=openpgp-sha256; l=1889; i=brauner@kernel.org;
 h=from:subject:message-id; bh=ihLj2SvA+LTg3IxOHust1d084fPtTMBsmyjFT5WjnuM=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWRl3pwQYdEVNeXzX8VF/WYFGRGG5/xSNLns2Wtlgz/EG
 01/uW52RykLgxgXg6yYIotDu0m43HKeis1GmRowc1iZQIYwcHEKwET2xjP8lbtQvNb4OWOJr6Z4
 vHTTrxMJP/tPLsroPLbgi6jnCuVtOYwM/0L7yxrdux+b7f5nkGHCGGrhL8I1i/OCsZLYT+P1U9O
 5AA==
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

make_fake_am_range() has a throwaway worktree of its own. It stages the
blobs the series expects to find, commits that tree, resets onto it and
ams the patches on top to get a commit range b4 can diff against. b4
diff goes through it, and so do the review TUI's range-diff and its
three-way merge prep.

The reset recurses like any other. A series that touches a submodule
puts a gitlink into the synthesized tree, and the reset then dies in
the same fresh worktree with no submodule clones. The am is worse.
Those commits exist to compute a diff range and nothing ever references
them, but git still reaches for the user's signing key, and with a card
that is not plugged in the whole range fails.

Both get SCRATCH_GIT_OPTS.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/__init__.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 1a883b4..d418cee 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -1449,13 +1449,15 @@ class LoreSeries:
                 return None, None
             start_commit = out.strip()
             logger.debug('start_commit=%s', start_commit)
-            git_run_command(dfn, ['reset', '--hard', start_commit])
+            git_run_command(dfn, [*SCRATCH_GIT_OPTS, 'reset', '--hard', start_commit])
 
             ifh = io.BytesIO()
             save_git_am_mbox(msgs, ifh)
             ambytes = ifh.getvalue()
 
-            ecode, out = git_run_command(dfn, ['am'], stdin=ambytes, logstderr=True)
+            ecode, out = git_run_command(
+                dfn, [*SCRATCH_GIT_OPTS, 'am'], stdin=ambytes, logstderr=True
+            )
             if ecode > 0:
                 logger.critical('ERROR: Could not fake-am version v%s', self.revision)
                 return None, None

-- 
2.53.0

