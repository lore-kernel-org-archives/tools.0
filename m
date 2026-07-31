Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1FB3803C2
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 21:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785535169; cv=none; b=Ja1QCv9858YfcpyKbxvMGQn1VM5dc3S7aSwCn8JLm76KZ+OWdME+fX6sYmLZtOVgFhW8n/+cpZTG2tDo3sAhFSHVu+p6nxj9ZSiAXhoA+uIsR28pM1zkD/4GsDDRCZxThePsDvrt2wXDXDqT6B9SZ1HCfPrVxaQEaNLNghCrH1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785535169; c=relaxed/simple;
	bh=nx5okmp8Xuk2/S9hVlTgf0J9rGAbKhg1ewUNza7UReI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kl+T00ndCZ6Ts9ImzWABKXH9UCnCB1aZuJyoaBAyWkB1TqLaEJET8rz+9XPTxY5fONE0iG6AxwLljOHKVrIWEC8fkl3HO62IOjLcxPb6WxPb9G+iOeJIpw2Oy7hbouxnbfRCjK+sdE1Q97CUOW+Xpj0FimCfTa9cdRq04TPy4yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C86i4DA3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C86i4DA3"
Received: by smtp.kernel.org (Postfix)
	id 9D39B1F00ACA; Fri, 31 Jul 2026 21:59:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C41611F00AC4;
	Fri, 31 Jul 2026 21:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785535167;
	bh=VHQkHxfDYQRDLlLLGhsRfhLHeilS0rYxLQLjZVLn1lE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=C86i4DA3jpbM1Vay9xCGya6qyqWRdszI5juLNABEU49ABIVvCiqBiCiTWO5kQ36Vx
	 6IfzenmDlO5S4QArBAc3r1TFMfRtVSdFXTkALSnRMX7mQ95D5mo8qIKnZjtrP1Wm+X
	 3AaZVWS1NsRyyWRm7fg/iKMgCk8VjKRn+y81r5SNHCKuEMwY4LP5lQTIth9kqulyvV
	 NlENBxrAD2NDheOxyhJrMn336BJKetcKn5kOPxqSdzXmJT30wfkOCmzpfG2+UsfRjt
	 hGL4Z7/R29kGD5N7QTXxItQM1E8I3CPy8v53qHwaJJD5Oy9FHVx8q4E08yU/Xqxa3E
	 JYefRWJm3WRBg==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 23:59:09 +0200
Subject: [PATCH b4 v2 28/44] ty: an unknown remote tip is undetermined, not
 unpublished
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v2-28-243fd19d322d@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=3956; i=brauner@kernel.org;
 h=from:subject:message-id; bh=nx5okmp8Xuk2/S9hVlTgf0J9rGAbKhg1ewUNza7UReI=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlSs0xZ+W/48eSa9d6p0Smurvr8h0JsWPcV9XamgwaG
 fPqvS07SlkYxLgYZMUUWRzaTcLllvNUbDbK1ICZw8oEMoSBi1MAJrJCjJGhmfvhLt6uhoK8DVoK
 M4r5d4gWpWfEfJqY37K0dF3L+a2dDP+0dhiEJi3Tvr5bcWvWw6cdOzLfLr71y0Dj7trzdU4zvJq
 4AQ==
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

When none of the tips a remote advertises exist locally there is
nothing to compute ancestry against, and the check said "not yet
visible", which is normal waiting and reports nothing. A stale or
wrong repository therefore waited forever in silence.

Report a failed check as a failure rather than as waiting, and warn
when the remote's tips are entirely absent locally: that is a standing
misconfiguration, not a transient.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/ty.py         | 18 +++++++++++++++---
 src/tests/test_ty.py |  9 +++++----
 2 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/src/b4/ty.py b/src/b4/ty.py
index a23a339..e4b2867 100644
--- a/src/b4/ty.py
+++ b/src/b4/ty.py
@@ -1075,7 +1075,8 @@ def commit_reachable_on_remote(
     belongs to.
 
     Returns True/False, or None if the state could not be determined
-    (e.g. the remote is unreachable).
+    (e.g. the remote is unreachable, or none of the advertised tips are
+    in the local repository).
     """
     gitargs = [
         '-c',
@@ -1120,8 +1121,19 @@ def commit_reachable_on_remote(
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
index 8ca5184..3ccd6a4 100644
--- a/src/tests/test_ty.py
+++ b/src/tests/test_ty.py
@@ -350,7 +350,8 @@ def test_commit_reachable_unknown_tips(
     monkeypatch: pytest.MonkeyPatch, tmp_path: pathlib.Path
 ) -> None:
     """Advertised tips we have no objects for cannot prove anything, so
-    the check stays conservative (pending) until the next fetch."""
+    the answer is 'don't know' -- which keeps the message queued, but
+    reports a failed check rather than normal waiting."""
     local = str(tmp_path / 'local')
     pub = str(tmp_path / 'pub')
     other = str(tmp_path / 'other')
@@ -375,7 +376,7 @@ def test_commit_reachable_unknown_tips(
     assert ecode == 0, out
     monkeypatch.chdir(local)
     # c1 is actually published, but the only advertised tip is unknown here
-    assert b4.ty.commit_reachable_on_remote(c1, pub) is False
+    assert b4.ty.commit_reachable_on_remote(c1, pub) is None
 
 
 def test_commit_reachable_branch_filter(
@@ -426,9 +427,9 @@ def test_commit_reachable_uses_the_gitdir_it_is_given(
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

