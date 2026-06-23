Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75A83A544D
	for <tools@linux.kernel.org>; Tue, 23 Jun 2026 20:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782246870; cv=none; b=d9TLRnWTgCkpqlNqxoVhT7Rw6uYDFX8GgywzbQB1xbDY9wbZ8UP37fxBb5oJzpLhUhAPHIEtGAH8PG0/tWVPLUPv89XZwQvWK2GPt+pKiL7k22QWIBdpR8gRIkqh+8TmFlqC9wKkie8Pk/OjR51MGoJ26ePMEcdLkI3nC3TYSbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782246870; c=relaxed/simple;
	bh=jeX3gP4SesXkMDiypLQjn9RPx4slkTHpqjHdJB5dmGo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z1qhFdFFBgUnmt9iuuvU1R6u5ZJRDEzVAOR8tobwymTC/jRBkwCrCtYC3UgpBuMVF5kGxuheC3Yvv7bnuwv3SuAt35+thHBxKzs7Cp3MyIZ10jST/n1vHyM445p0JiB6E44kbDZxRIx2ZqYgQwa3wEEf1GaQDzccKgxBatbNJUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IF4R9D09; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IF4R9D09"
Received: by smtp.kernel.org (Postfix)
	id B19601F00A3D; Tue, 23 Jun 2026 20:34:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBCC01F000E9;
	Tue, 23 Jun 2026 20:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782246869;
	bh=4+VV78YotdWbOG0Rza5azyu0OKB4IZuRaqI7fmKpQJI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=IF4R9D09FSHoMsVU2/k7CPsCCN/h3H2OF7cDQm+ydiodJlP54X7c/WDBU6pxpqAG/
	 33rQV2pL44wPXmeBzcQ6hVaCrT4BmHiLhqwP5Loh0rA7TQUQmJfFlHfAwcgGYDXM/Z
	 5Y3BgYRT81GYIMUCn0FEt21LaHbqNBcFaKRvohxSNUKlmyriARJx4b/POmLH1JW/wF
	 TgItYS+PVsZaaYf/4rU7SIb5AFPN3KHL0A8jZawFmuI2fw1rtdC3fRORFzXdD0hhJ+
	 Jl+BdfosLSMVsL8FbhOAqmuZAldgbtEa2K2aSUkFgMAQp6obMSAdJHnjD/HUmExkeh
	 cahsP2w4Mmp3Q==
From: Christian Brauner <brauner@kernel.org>
Date: Tue, 23 Jun 2026 22:34:20 +0200
Subject: [PATCH b4 v2 4/6] review-tui: run take->merge abort in the target
 branch's worktree
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-20260623-review-tui-take-am-worktree-v2-4-2cbbab5d5441@kernel.org>
References: <20260623-20260623-review-tui-take-am-worktree-v2-0-2cbbab5d5441@kernel.org>
In-Reply-To: <20260623-20260623-review-tui-take-am-worktree-v2-0-2cbbab5d5441@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-e850d
X-Developer-Signature: v=1; a=openpgp-sha256; l=2907; i=brauner@kernel.org;
 h=from:subject:message-id; bh=jeX3gP4SesXkMDiypLQjn9RPx4slkTHpqjHdJB5dmGo=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWRZvT2/fdmJkw52RiqzJdQn7jq/dNYlscXS7Dv5HXmMT
 Z/ZNypHdZSyMIhxMciKKbI4tJuEyy3nqdhslKkBM4eVCWQIAxenAExkeRYjwwXWRzqhIULPy3SD
 nZhOC4dvvZfYwr72VGGtzDm7t7ZNXAz/tF2Npp++eE0g+v3Cl282rn2kMFuiRdl8wYJHwuXChi1
 pvAA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

take->merge applies a series in whichever worktree holds the target branch.
git_run_command() addresses that worktree with --git-dir when it is the
primary worktree (its .git is a directory), which sets the git dir but not
the work tree -- git then takes the work tree from the process cwd. The
production merge sidesteps this by running git -C merge_dir, but two calls
on the same path do not pass rundir and so run in b4's cwd instead: the
git merge --abort on the failure path, and the pytest-only non-interactive
merge.

When review is driven from a different worktree than the target's -- the
case _take_worktree() exists for -- and the target lives in the primary
worktree, a conflicting take leaves the conflict in merge_dir (written
there via -C) but then aborts against the wrong work tree. git merge
--abort reports success and clears MERGE_HEAD, yet the conflict markers
stay in the target worktree and b4's own checkout is rewritten from the
target's index: the target is left dirty and an unrelated worktree is
clobbered, both silently.

Pass rundir=merge_dir to both calls so they run in the target worktree,
matching the production git -C merge_dir and take->am's git-am, which
already anchors with rundir=am_dir.

Fixes: db9a629c3e95 ("review-tui: run take->merge in the target branch's worktree")
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/review_tui/_tracking_app.py | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/src/b4/review_tui/_tracking_app.py b/src/b4/review_tui/_tracking_app.py
index a16f845..ef61e0e 100644
--- a/src/b4/review_tui/_tracking_app.py
+++ b/src/b4/review_tui/_tracking_app.py
@@ -2825,7 +2825,9 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
                     '--no-edit',
                     'FETCH_HEAD',
                 ] + mergeflags
-                ecode, out = b4.git_run_command(merge_dir, mergeargs, logstderr=True)
+                ecode, out = b4.git_run_command(
+                    merge_dir, mergeargs, logstderr=True, rundir=merge_dir
+                )
             else:
                 # Run git directly with an inherited tty (under the caller's
                 # suspend()) so git can open the editor, like _suspend_to_shell.
@@ -2853,7 +2855,9 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
                     'Merge failed%s', f': {out.strip()}' if out.strip() else ''
                 )
                 logger.critical('Aborting merge...')
-                b4.git_run_command(merge_dir, ['merge', '--abort'], logstderr=True)
+                b4.git_run_command(
+                    merge_dir, ['merge', '--abort'], logstderr=True, rundir=merge_dir
+                )
                 _wait_for_enter()
                 return
 

-- 
2.53.0

