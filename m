Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3D4442FA5
	for <tools@linux.kernel.org>; Wed, 29 Jul 2026 10:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785321888; cv=none; b=ISo/ocwQ4UCkZIXNkYBWUpF+i9Mc4t+29BSU+mzNR7q9u8Mb7/HURvvLo4i699zU3O++SpKEpeqqFtHQnPqTiFpTTkBCi1K8MJ9Xt2vzQ+ZP5Hqjjw1Gu0Ll8A+HXw5bcIwXeJwVqb1ypA3mz8q/Nlgp3iVVxOjKpJDaiHYnIas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785321888; c=relaxed/simple;
	bh=axk8ROGRvNdTHDakuAFXWzuutREQtLQrGYyavo8nRx4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DsM4rP0X3urb04pOsd/7Gy9GbMQAB71jAaRIp/BK/qy07ODFXFVqDeZX0zzzu9USJiWjyqoEYvSrJ3BnN0/mWWxaQ33v3mJp2CWGwew9wgDPpf4OcvI61b88ImcoBqGHcgniSqoOP44eMKygbVVFVzpgFnlhRJ5/m1rfQ8z5Fhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NyNKBIaH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NyNKBIaH"
Received: by smtp.kernel.org (Postfix)
	id AADD11F00A3E; Wed, 29 Jul 2026 10:44:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D70A51F000E9;
	Wed, 29 Jul 2026 10:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785321876;
	bh=IDfEJP3IJ4VayiYbh2uZc+c0WKhXBOeri02Uuvs4xyE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=NyNKBIaHaukOZmfJmpUoegpRkSLFjeisj33Vxj1beQq2S27MlarxLHYIKbNobOQCI
	 cdagq2Tz7w6kiHsGUVBwBNspDIMGRyeaupksMsx8Zcsar5rqCel0nTb0+vaMQg/Boy
	 RrI2YaKrynESDL2filla3O/puwQQPS4vR+k0bOSDGPJ0iZzIyBY+WyuqCwUfgt9b0K
	 XXO9fSkOyIvYfdgIQq7v9r2SpUEZEwg4CExAHj656Jwmq2IacqQS1WBb4x9niw0oP2
	 K3ch19oTyp0iEe1U75f6bZMzbcBkyPmNT5pLE52PuQQCzlNqCHvdqzD3n1u/yhLfPI
	 jjqIj1ibHAyiA==
From: Christian Brauner <brauner@kernel.org>
Date: Wed, 29 Jul 2026 12:44:29 +0200
Subject: [PATCH b4 2/6] shazam: ignore the user's submodule.recurse in the
 scratch worktree
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-work-b4-scratch-worktrees-v1-2-e96995158d4a@kernel.org>
References: <20260729-work-b4-scratch-worktrees-v1-0-e96995158d4a@kernel.org>
In-Reply-To: <20260729-work-b4-scratch-worktrees-v1-0-e96995158d4a@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-b7988
X-Developer-Signature: v=1; a=openpgp-sha256; l=4292; i=brauner@kernel.org;
 h=from:subject:message-id; bh=axk8ROGRvNdTHDakuAFXWzuutREQtLQrGYyavo8nRx4=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWRl3pwQaP11TvKR1Wt83Orf7U+tOWzaK31lRweTifxxv
 6cq4Q9/d5SyMIhxMciKKbI4tJuEyy3nqdhslKkBM4eVCWQIAxenAExEgJnhr/SfgpksYvXcHauV
 WB2XbOXdILksRuimdkbIptXdNRv65RgZuqvXB+3xfbD1r0VTu/3ftmvLXkkUmM1wWmdSuXdqtEI
 yLwA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

With submodule.recurse=true in the user's config every apply through
git_fetch_am_into_repo() fails in a repo that carries submodules. That
covers b4 shazam and review-branch creation in the review TUI:

    Magic: Preparing a sparse worktree
    Error running checkout into sparse workdir
    fatal: not a git repository: ../../worktrees/b4-shazam-worktree/modules/ezgb
    fatal: could not reset submodule index

git gives every linked worktree its own submodule clones under
.git/worktrees/<name>/modules/ and a just-created worktree has none, so
the recursing sparse checkout dies looking for them. The b4 repo itself
is affected through its vendored patatt/liblore/ezgb submodules.

Everything b4 does in that worktree is thrown away when the call
returns, so the user's checkout conveniences have no business running
there. Let's add SCRATCH_GIT_OPTS with the two overrides a git command
in a scratch worktree needs, no submodule recursion and no gpg signing,
the same override the TUI's test applies already pass by hand. The
sparse-checkout and the checkout get it.

The fetch out of the worktree takes nothing. It runs in the user's own
repo rather than in the scratch worktree, so the user's config is the
right one there, and a recursing fetch does not trip over the missing
clones anyway.

The apply itself keeps the user's config. Its commits are the real
series and not scratch throwaways, so signing stays in force. The
replay-on-full-worktree fallback needs nothing. Neither git-am nor
git-sparse-checkout consults submodule.recurse (checked on git 2.53).

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/__init__.py | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 8afbbab..1a883b4 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -132,6 +132,24 @@ DEVSIG_HDR = 'X-Developer-Signature'
 LOREADDR = 'https://lore.kernel.org'
 LINKADDR = 'https://patch.msgid.link'
 
+# Overrides for git commands b4 runs inside its own scratch worktrees. A fresh
+# linked worktree has no per-worktree submodule clones, so a checkout or reset
+# obeying submodule.recurse=true dies with "fatal: not a git repository:
+# .../worktrees/<wt>/modules/<name>"; and unattended commit-creating commands
+# must never gpg-sign -- signing hangs on a pinentry prompt no terminal will
+# answer. Each override is inert where the other matters, so the one list
+# serves every scratch-worktree git command. Commits that outlive the worktree
+# are the exception and keep the user's signing config: the real apply in
+# git_fetch_am_into_repo. Fetching *out of* a
+# worktree takes nothing -- that one runs in the user's repo, not in the
+# scratch, so the user's config still governs it.
+SCRATCH_GIT_OPTS: List[str] = [
+    '-c',
+    'submodule.recurse=false',
+    '-c',
+    'commit.gpgsign=false',
+]
+
 DEFAULT_CONFIG: ConfigDictT = {
     'midmask': LOREADDR + '/all/%s',
     'searchmask': LOREADDR + '/all/?x=m&q=%s',
@@ -5972,19 +5990,24 @@ def git_fetch_am_into_repo(
     try:
         logger.info('Magic: Preparing a sparse worktree')
         ecode, out = git_run_command(
-            gwt, ['sparse-checkout', 'set'], logstderr=True, rundir=gwt
+            gwt,
+            [*SCRATCH_GIT_OPTS, 'sparse-checkout', 'set'],
+            logstderr=True,
+            rundir=gwt,
         )
         if ecode > 0:
             logger.critical('Error running sparse-checkout set')
             logger.critical(out)
             raise RuntimeError
         ecode, out = git_run_command(
-            gwt, ['checkout', '-f'], logstderr=True, rundir=gwt
+            gwt, [*SCRATCH_GIT_OPTS, 'checkout', '-f'], logstderr=True, rundir=gwt
         )
         if ecode > 0:
             logger.critical('Error running checkout into sparse workdir')
             logger.critical(out)
             raise RuntimeError
+        # No SCRATCH_GIT_OPTS on the apply: its commits are the real series,
+        # not scratch throwaways, so the user's signing config stays in force.
         amargs = ['am']
         if am_flags:
             amargs.extend(am_flags)

-- 
2.53.0

