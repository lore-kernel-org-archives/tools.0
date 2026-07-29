Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8623446BF5
	for <tools@linux.kernel.org>; Wed, 29 Jul 2026 10:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785321893; cv=none; b=NKDJR30LCW3MGhWuUhO1paZ9yzc1XGM/fp31dsyfjnCpibAUyAqLIS5f3R3ERg8hJjrXubsg/VE2rC1bCBfRgAt1k8l+s5KQooU7wIPa0Dm2VOrv8Oni4yXHW4zIfQ3ddD+K6cIannCWGUNsRslbZ32NYPaTwx0YyxpadUtDUno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785321893; c=relaxed/simple;
	bh=0o1yrXJhrO3MOkocU+3uC2Df43ODA71xhrCACcHgQKM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LeCy9LgtMR2BSxi+c5EFvz5DE89LZTl0pbV9hS3QFGz3gY5Ge1EmErvIZgCf2+3Vi1Wi5yQZKsgQMZBVPONVnHSXe6J14+eWNZVyjROheRaOJwM9Nw3DIgRxR/9X0o+SiKB89e4FjSyfX9HlGt1I2BC7wEoInHSwLCyy+ozxswU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BC6pf2/5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BC6pf2/5"
Received: by smtp.kernel.org (Postfix)
	id DE24A1F00A3F; Wed, 29 Jul 2026 10:44:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 137541F000E9;
	Wed, 29 Jul 2026 10:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785321877;
	bh=6z+BkW8K6+fG6x/bywzFEucY5gp1W9l0bbZKYLDqCKM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=BC6pf2/5KGBK1I84sZIqNJtoUfrnSEeNnwwzK2aMA/zXl8AoMOOca+2/XdnQmaapa
	 cydPh3XXAQkDXDb/1n5qWpV6PBZWqUmryruPOYI1TRkr845OSIMNycfaTQatL2Dv8J
	 YuaZDFJ1GdX+NuQNZTFNe3kctcPQgqwWZyXUy3h9mjflUREjyPKDRNlLWyMOddGjml
	 VD1xsoLSDMLFsutG0n8R/7UdIdcuFaDQN047QhTyBIN1ykMXK8Nq31syvsLMbgcb+G
	 ImFHsJjhPJ49rsAHPLR8kAY0UEt+s2QSRriXlMlz03PHj+pDHkaFgIF7ZQUkpdU8OA
	 CUo8ewV11Epeg==
From: Christian Brauner <brauner@kernel.org>
Date: Wed, 29 Jul 2026 12:44:30 +0200
Subject: [PATCH b4 3/6] review-tui: use the shared scratch-worktree
 overrides for test applies
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-work-b4-scratch-worktrees-v1-3-e96995158d4a@kernel.org>
References: <20260729-work-b4-scratch-worktrees-v1-0-e96995158d4a@kernel.org>
In-Reply-To: <20260729-work-b4-scratch-worktrees-v1-0-e96995158d4a@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-b7988
X-Developer-Signature: v=1; a=openpgp-sha256; l=8044; i=brauner@kernel.org;
 h=from:subject:message-id; bh=0o1yrXJhrO3MOkocU+3uC2Df43ODA71xhrCACcHgQKM=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWRl3pyQ+nvFDef643Erwy4JduquPSEX9HL7mg0XFZoPc
 O1gYM5w6ShlYRDjYpAVU2RxaDcJl1vOU7HZKFMDZg4rE8gQBi5OAZiImQfDP21Dcb3OKUbXQw3E
 L0uwbnKYVK1c+3LiEl2RL+9/Hk1UWM3wz2jjZVGRjfzfLX9OvOy3IL2iN/lacVqFlvMJM9vMbwJ
 +7AA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

The test-apply paths build the same sparse scratch worktree in five
places, the four modal am probes and the take flow's cherry-pick probe.
Each of them passes -c commit.gpgsign=false on the apply by hand and
nothing at all on the checkout.

That checkout is the bug just fixed in git_fetch_am_into_repo(). With
submodule.recurse=true the probe's checkout -f dies in any repo that
carries submodules, so every test apply reported a failure that had
nothing to do with the patches.

Let's switch all five sites to SCRATCH_GIT_OPTS. gpgsign means nothing
to a checkout and recursion means nothing to am and cherry-pick, so the
one list serves every command and the applies keep behaving as before.
The per-site "# No signing" comments go with it.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/review_tui/_modals.py       | 44 ++++++++++++++++++++++++--------------
 src/b4/review_tui/_tracking_app.py | 11 ++++++----
 2 files changed, 35 insertions(+), 20 deletions(-)

diff --git a/src/b4/review_tui/_modals.py b/src/b4/review_tui/_modals.py
index 89253bc..1d8ea4f 100644
--- a/src/b4/review_tui/_modals.py
+++ b/src/b4/review_tui/_modals.py
@@ -1075,15 +1075,18 @@ class TakeConfirmScreen(ModalScreen[bool]):
             # Test apply in a temporary sparse worktree
             try:
                 with b4.git_temp_worktree(topdir, resolved_base) as gwt:
-                    ecode, out = b4.git_run_command(gwt, ['sparse-checkout', 'set'])
+                    ecode, out = b4.git_run_command(
+                        gwt, [*b4.SCRATCH_GIT_OPTS, 'sparse-checkout', 'set']
+                    )
                     if ecode > 0:
                         return False, 'failed to set up worktree'
-                    ecode, out = b4.git_run_command(gwt, ['checkout', '-f'])
+                    ecode, out = b4.git_run_command(
+                        gwt, [*b4.SCRATCH_GIT_OPTS, 'checkout', '-f']
+                    )
                     if ecode > 0:
                         return False, 'failed to checkout base'
-                    # No signing: gpg would prompt while the TUI owns the tty.
                     ecode, out = b4.git_run_command(
-                        gwt, ['-c', 'commit.gpgsign=false', 'am'], stdin=ambytes
+                        gwt, [*b4.SCRATCH_GIT_OPTS, 'am'], stdin=ambytes
                     )
                     if ecode > 0:
                         for line in out.splitlines():
@@ -2069,15 +2072,18 @@ class RebaseScreen(ModalScreen[bool]):
         with _quiet_worker():
             try:
                 with b4.git_temp_worktree(topdir, branch) as gwt:
-                    ecode, out = b4.git_run_command(gwt, ['sparse-checkout', 'set'])
+                    ecode, out = b4.git_run_command(
+                        gwt, [*b4.SCRATCH_GIT_OPTS, 'sparse-checkout', 'set']
+                    )
                     if ecode > 0:
                         return False, 'failed to set up worktree'
-                    ecode, out = b4.git_run_command(gwt, ['checkout', '-f'])
+                    ecode, out = b4.git_run_command(
+                        gwt, [*b4.SCRATCH_GIT_OPTS, 'checkout', '-f']
+                    )
                     if ecode > 0:
                         return False, 'failed to checkout base'
-                    # No signing: gpg would prompt while the TUI owns the tty.
                     ecode, out = b4.git_run_command(
-                        gwt, ['-c', 'commit.gpgsign=false', 'am'], stdin=ambytes
+                        gwt, [*b4.SCRATCH_GIT_OPTS, 'am'], stdin=ambytes
                     )
                     if ecode > 0:
                         for line in out.splitlines():
@@ -2342,15 +2348,18 @@ class TargetBranchScreen(ModalScreen[Optional[str]]):
         with _quiet_worker():
             try:
                 with b4.git_temp_worktree(topdir, branch) as gwt:
-                    ecode, out = b4.git_run_command(gwt, ['sparse-checkout', 'set'])
+                    ecode, out = b4.git_run_command(
+                        gwt, [*b4.SCRATCH_GIT_OPTS, 'sparse-checkout', 'set']
+                    )
                     if ecode > 0:
                         return False, 'failed to set up worktree'
-                    ecode, out = b4.git_run_command(gwt, ['checkout', '-f'])
+                    ecode, out = b4.git_run_command(
+                        gwt, [*b4.SCRATCH_GIT_OPTS, 'checkout', '-f']
+                    )
                     if ecode > 0:
                         return False, 'failed to checkout base'
-                    # No signing: gpg would prompt while the TUI owns the tty.
                     ecode, out = b4.git_run_command(
-                        gwt, ['-c', 'commit.gpgsign=false', 'am'], stdin=ambytes
+                        gwt, [*b4.SCRATCH_GIT_OPTS, 'am'], stdin=ambytes
                     )
                     if ecode > 0:
                         for line in out.splitlines():
@@ -3059,15 +3068,18 @@ class BaseSelectionScreen(ModalScreen[Optional[str]]):
         with _quiet_worker():
             try:
                 with b4.git_temp_worktree(topdir, base) as gwt:
-                    ecode, out = b4.git_run_command(gwt, ['sparse-checkout', 'set'])
+                    ecode, out = b4.git_run_command(
+                        gwt, [*b4.SCRATCH_GIT_OPTS, 'sparse-checkout', 'set']
+                    )
                     if ecode > 0:
                         return False, 'failed to set up worktree'
-                    ecode, out = b4.git_run_command(gwt, ['checkout', '-f'])
+                    ecode, out = b4.git_run_command(
+                        gwt, [*b4.SCRATCH_GIT_OPTS, 'checkout', '-f']
+                    )
                     if ecode > 0:
                         return False, 'failed to checkout base'
-                    # No signing: gpg would prompt while the TUI owns the tty.
                     ecode, out = b4.git_run_command(
-                        gwt, ['-c', 'commit.gpgsign=false', 'am'], stdin=ambytes
+                        gwt, [*b4.SCRATCH_GIT_OPTS, 'am'], stdin=ambytes
                     )
                     if ecode > 0:
                         # Extract just the "Patch failed" line
diff --git a/src/b4/review_tui/_tracking_app.py b/src/b4/review_tui/_tracking_app.py
index 2b29dc1..efdfeaf 100644
--- a/src/b4/review_tui/_tracking_app.py
+++ b/src/b4/review_tui/_tracking_app.py
@@ -3370,11 +3370,15 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
             with b4.git_temp_worktree(topdir, target_head) as gwt:
                 # Set up sparse checkout for minimal disk usage
                 ecode, out = b4.git_run_command(
-                    gwt, ['sparse-checkout', 'set'], logstderr=True
+                    gwt,
+                    [*b4.SCRATCH_GIT_OPTS, 'sparse-checkout', 'set'],
+                    logstderr=True,
                 )
                 if ecode != 0:
                     logger.warning('Could not set up sparse checkout: %s', out.strip())
-                ecode, out = b4.git_run_command(gwt, ['checkout', '-f'], logstderr=True)
+                ecode, out = b4.git_run_command(
+                    gwt, [*b4.SCRATCH_GIT_OPTS, 'checkout', '-f'], logstderr=True
+                )
                 if ecode != 0:
                     logger.warning(
                         'Could not checkout sparse worktree: %s', out.strip()
@@ -3382,8 +3386,7 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
 
                 # Try cherry-picking the commits
                 gitargs = [
-                    '-c',
-                    'commit.gpgsign=false',
+                    *b4.SCRATCH_GIT_OPTS,
                     'cherry-pick',
                     f'{base_commit}..{series_tip}',
                 ]

-- 
2.53.0

