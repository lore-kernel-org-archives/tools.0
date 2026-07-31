Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBCE3B42D1
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 09:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785489717; cv=none; b=eFuvegMfAgtLVV7F8Uuv86hNMRxJM7VyG0T0GTMbqmW8c9tKvmQ5lP2ZWhl22o99v4WQBHlkG/0+Rimq5d9z+UIAOuJSF27lvWgu/anKizfSKK0AWUnW/cF5k2PSQRjUQoIJB7m1Z8LviRX76qzn78YQDIwFnnlZq194mem0lCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785489717; c=relaxed/simple;
	bh=CCmn99yqEmaBo0333/3D2ER5nh+vpk57DK1IPCxnHlc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jk0Zv+1dUNvP6fH1dGVpFcqFOuvWR0CGEB11I3Q9kDLXSsJGABKBmFuBuBXin9sw9NHgSy7AGfbozsHKsnL03MyvTrxxw/cPfgiQ7X9gT1hFJW0oYy0DEFhD7bAVo/KfMLss364kom9oaVVnKzzZR5BoVFTxnMqntMW4FA+rKE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cPjadHyw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cPjadHyw"
Received: by smtp.kernel.org (Postfix)
	id DD99A1F00A3D; Fri, 31 Jul 2026 09:21:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C5281F000E9;
	Fri, 31 Jul 2026 09:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785489715;
	bh=0gGnvK4RrV7XspYhqHEVrH8ehI2GRgFZBUAhIhS3/ko=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=cPjadHywZuLAlpJ0zEvndl1eOjdSk59w1B3jaap0vcTjmTGmE9KXgaIe5WN85jSex
	 fomJ8jRcg/HGpNPfDu90ylwASZWZrr2+NySyv8HUj7adyP1zyXz4D+tMKYO/fMbmME
	 TEuSzUdGdTfApuZAD/SAPGuVYJ0WPtFoxHqBlIJ1FZ8bBmn3kAPRVOzQAny6rlCsWC
	 EQYIfnNLJ9N0YQy2ipKStVwdNKXNPwhf2MlG65fKomcjkihV59i45J1IVJegPB6AyH
	 yvbJwWJnQkTkZSRh3THv5+cQ4KsJWKqw4E1t7LN7VB4E01jXSk60PUz7Qi7plANRNj
	 MOsTviTjEytLw==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 11:21:23 +0200
Subject: [PATCH b4 24/27] ty: an unknown remote tip is undetermined, not
 unpublished
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v1-24-de68a7c8e4cb@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v1-0-de68a7c8e4cb@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v1-0-de68a7c8e4cb@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=4786; i=brauner@kernel.org;
 h=from:subject:message-id; bh=CCmn99yqEmaBo0333/3D2ER5nh+vpk57DK1IPCxnHlc=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlZIrJNXzdLLrwpZSuYdq+lSdPGvZGsfpWnzX6K97Mv
 nPOV23zjlIWBjEuBlkxRRaHdpNwueU8FZuNMjVg5rAygQxh4OIUgIncL2dk2LTm+8F86eZN6ibB
 yka1qam3nH480zmiKHq3+odSmErma4b/5Z471P8x+78p5Hz4cWW8veiOif9DW9xW8QVkXOe7H1/
 BAQA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

When none of the tips a remote advertises exist in the local repository
there is nothing to compute ancestry against, and the publish check
returned False for "not yet visible". We can't see the commit either
way, so that is not something we know.

The queue keeps the message waiting either way, and so far the cron
report has kept quiet either way. "Not yet visible" is normal operation
and "Check failed" is deliberately grouped with it, because a remote we
could not reach is a transient that must not mail the maintainer on
every sweep. So a repository that is stale, or simply not the one the
series was applied in, waits forever without ever saying anything.

Make the tri-state honest, so that "b4 review cron --dry-run" and the
queue delivery modal name a failed check rather than normal waiting.
Then say the one thing we can positively identify: we have the remote's
answer, and none of it is in this repository. That is a standing
misconfiguration and not a transient, so it warns instead of debugging,
which is the level a delivery sweep lets through.

Narrowing the check to the branch named in the thanks message made this
easier to hit. The old check had every advertised head to look for and
now there is often exactly one.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/ty.py         | 18 +++++++++++++++---
 src/tests/test_ty.py |  9 +++++----
 2 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/src/b4/ty.py b/src/b4/ty.py
index 5e225a7..650ec84 100644
--- a/src/b4/ty.py
+++ b/src/b4/ty.py
@@ -1073,7 +1073,8 @@ def commit_reachable_on_remote(
     belongs to.
 
     Returns True/False, or None if the state could not be determined
-    (e.g. the remote is unreachable).
+    (e.g. the remote is unreachable, or none of the advertised tips are
+    in the local repository).
     """
     gitargs = [
         '-c',
@@ -1118,8 +1119,19 @@ def commit_reachable_on_remote(
         if len(chunks) == 2 and chunks[1] == 'commit':
             known.append(chunks[0])
     if not known:
-        logger.debug('No advertised heads of %s exist locally', repo_url)
-        return False
+        # Undetermined, not unpublished: without the objects we cannot
+        # say anything about the commit, and reporting "not yet visible"
+        # would hide a stale (or simply wrong) local repository behind
+        # what looks like normal waiting.  Warn rather than debug: a cron
+        # sweep silences narration but keeps warnings, and this one is a
+        # standing misconfiguration that would otherwise wait forever.
+        logger.warning(
+            'None of the heads advertised by %s exist in %s; cannot tell '
+            'whether the commit is published',
+            repo_url,
+            gitdir or os.getcwd(),
+        )
+        return None
     # Empty output means every commit reachable from ours is also
     # reachable from one of the known tips, i.e. ours is published
     ecode, out = b4.git_run_command(gitdir, ['rev-list', '-1', commit, '--not', *known])
diff --git a/src/tests/test_ty.py b/src/tests/test_ty.py
index 5b08587..f4537ba 100644
--- a/src/tests/test_ty.py
+++ b/src/tests/test_ty.py
@@ -311,7 +311,8 @@ def test_commit_reachable_unknown_tips(
     monkeypatch: pytest.MonkeyPatch, tmp_path: pathlib.Path
 ) -> None:
     """Advertised tips we have no objects for cannot prove anything, so
-    the check stays conservative (pending) until the next fetch."""
+    the answer is 'don't know' -- which keeps the message queued, but
+    reports a failed check rather than normal waiting."""
     local = str(tmp_path / 'local')
     pub = str(tmp_path / 'pub')
     other = str(tmp_path / 'other')
@@ -336,7 +337,7 @@ def test_commit_reachable_unknown_tips(
     assert ecode == 0, out
     monkeypatch.chdir(local)
     # c1 is actually published, but the only advertised tip is unknown here
-    assert b4.ty.commit_reachable_on_remote(c1, pub) is False
+    assert b4.ty.commit_reachable_on_remote(c1, pub) is None
 
 
 def test_commit_reachable_branch_filter(
@@ -387,9 +388,9 @@ def test_commit_reachable_uses_the_gitdir_it_is_given(
     assert ecode == 0, out
 
     # An unrelated cwd knows none of the advertised tips, so on its own it
-    # cannot see the commit -- the objects live in 'local'.
+    # cannot answer -- the objects live in 'local'.
     monkeypatch.chdir(elsewhere)
-    assert b4.ty.commit_reachable_on_remote(c1, pub, branch='master') is not True
+    assert b4.ty.commit_reachable_on_remote(c1, pub, branch='master') is None
     assert (
         b4.ty.commit_reachable_on_remote(c1, pub, branch='master', gitdir=local) is True
     )

-- 
2.53.0

