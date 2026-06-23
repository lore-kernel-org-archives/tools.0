Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8CF30B514
	for <tools@linux.kernel.org>; Tue, 23 Jun 2026 16:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782230501; cv=none; b=DHJorj0YmHIAClE/vNtPYjZ+a+/jj8oT3YdYT5vsHovmeySgjeseOTVbRaY8OZGDSulBpoOhNIr2fRFQQzQJNnh2ZpxVd+5J1vIeSvWbokH/swg///o2RrW1IdO1oGa1hsrj7HiJyzVNiUHSJrGcPlZGfEsTn208wiX60dRbJfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782230501; c=relaxed/simple;
	bh=9+13ymQ0eheiiENgknU6E2FRGwvsgbqCqPZF/7qF3x8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BkDLwIyX+R4FB9mvRqMqRMFVQBgPZoh/a7tfFijdy3MCDpFSi7Eyj+oMiCxSH2pfU6atI4BviGdf2OOayGmQjRlgDJX2kaqaKlkdQ/UZ+7GiO9aLwVV6XEDOOgM66XeDU8Rmz8Ou6lmc2Om4ULngQ70CMuqPsxYvs7tpB9+fLVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dm6Jt0y7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dm6Jt0y7"
Received: by smtp.kernel.org (Postfix)
	id B16401F00A3D; Tue, 23 Jun 2026 16:01:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2CEB1F000E9;
	Tue, 23 Jun 2026 16:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782230500;
	bh=Rx+EskYIIuW7o4axHFyxIn9lEjl1uUQfgOIZQDZuKrQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=dm6Jt0y7b+S2wdcG6GA8GWMQr0JbJdPFzJMzWRh32LSARY6+tTLi7ZEbp/4iUej/x
	 3Az2Hls+VthuL7Ght/TO1Wh+NYjXao1/koJrY8zsd3ZSDTPAw8X+QWqYJwGI9B5SQZ
	 JuLc05cKnd9CmaHuOQjLRxfWmlVkmyqMbPiTysyf2H90r9zcfZBGzgCB5YF71jvbWh
	 WStlzkmTXdOc8BgJTCttvDIaVrG94rgLNN/NtEPOax6SOml9HPFsXD8THoKELDYWcJ
	 yssReXESxC5UxlaYLrBeACPHyGa/G0YwVCJoLxJaIjck3mjhi+dKl2Ry7fTD6Y5CK0
	 KLKJz9lJoLedQ==
From: Christian Brauner <brauner@kernel.org>
Date: Tue, 23 Jun 2026 18:01:32 +0200
Subject: [PATCH b4 4/6] review-tui: run take->merge abort in the target
 branch's worktree
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-20260623-review-tui-take-am-worktree-v1-4-e8a2140a287e@kernel.org>
References: <20260623-20260623-review-tui-take-am-worktree-v1-0-e8a2140a287e@kernel.org>
In-Reply-To: <20260623-20260623-review-tui-take-am-worktree-v1-0-e8a2140a287e@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-50a61
X-Developer-Signature: v=1; a=openpgp-sha256; l=2907; i=brauner@kernel.org;
 h=from:subject:message-id; bh=9+13ymQ0eheiiENgknU6E2FRGwvsgbqCqPZF/7qF3x8=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWRZrb3XvNqTV+TcPZUVumLm7Lu99c/2ffp4h89j2VbzX
 5NY9jpM7ihlYRDjYpAVU2RxaDcJl1vOU7HZKFMDZg4rE8gQBi5OAZiIFzPD/9prf7LO1oqESE6+
 HfhgcxCD2/bP53O+NYpLKpStjgqwL2H4K7GjZ8Z+aV1Vxl/CCTovGiMX5jcsu3evboaqaEwb67u
 HHAA=
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
index 0496eaa..7d296f5 100644
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

