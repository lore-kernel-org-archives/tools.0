Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451E9378D94
	for <tools@linux.kernel.org>; Wed, 29 Jul 2026 10:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785321881; cv=none; b=RUMKLM8DT9+a+xltmcL5cOTkJOPHbfhTtuOGZCQbsGqORd5GbcmkneNaruvFn/+OLvuT8urfzI7AyTPNL5qcDxJVwpDPcVO28IDe6/5tyaSWverWPbmwT/9Xn8LxLCSWuakPef1Pm5+YUHBJeHMJYG/1rUKK44tn/WqQuJWbuOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785321881; c=relaxed/simple;
	bh=WOC61+N+yMSrSlWPKPV8LKR/+jQ4/U//mGLpeO+B6sc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=i5bWfQnGJJCwxZ0RMFuM5lAJ+NGCOaHag5MeQvRuuq6Yatmzlns7BXjylUF/VaxEW9CTl3rEAtxmOlGEC2w8HaWA9PAO/rr5ljTYXV3UU/rSwKBWxE/Q82qR5sJ5GqPvMM4uyvrSJAICMsyceNY0m2+vA2eHNOcxQ6JastsvFtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NBdgHEas; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NBdgHEas"
Received: by smtp.kernel.org (Postfix)
	id 18FB51F00A3A; Wed, 29 Jul 2026 10:44:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 458721F000E9;
	Wed, 29 Jul 2026 10:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785321874;
	bh=Z3m/XRslxY0egFZU0X/pvGYKWjfbZDrjgSdp8HWTtZc=;
	h=From:Subject:Date:To:Cc;
	b=NBdgHEaskElieOG+FMCKvy3whaQu4f43LdrnoSHq1rJgAqiFvlsRCVkGya689uHMf
	 7Oycv3C3JWyGh4OUFyTEWnvJ4VFn5cOjAlOW05TE206LIAWlqxq0XgxX+1GdgFBVKH
	 Mk7CGbzN1kajlM4BtmlcLS18UPGN4YsvXZfCd79HO/KhldjgLngBYRaKKkUP9MX1Xr
	 gPsOWW6gx7tYi6LBBI8uaFAEDAu972siSGyGKtIvByQm9DOPH4K/mXfYYHun/DCMZk
	 c66GarI2UPZ7RpGiKBDbQ81gcWvBY2+ZEc+j9RlzbMQhIq3SQfjaxu953mJDxSsGIm
	 5ROMYLJ5k8NTg==
From: Christian Brauner <brauner@kernel.org>
Subject: [PATCH b4 0/6] Keep the user's git config out of b4's scratch
 worktrees
Date: Wed, 29 Jul 2026 12:44:27 +0200
Message-Id: <20260729-work-b4-scratch-worktrees-v1-0-e96995158d4a@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIvZaWoC/yWMSw7CMAwFr1J5TaQShUK4CurCcV0SEC2yw0eqe
 neSspzRe7OAsiRWODcLCL+TpnkqsN81QBGnK5s0FAbb2q49Wm8+s9xNcEZJMFPcOAuzmrHzNPD
 JOvQHKP+n8Ji+W/sCwUH/d/oKN6Zco3UVUNkEwYliVQ/UzALr+gN3Bro3mgAAAA==
X-Change-ID: 20260729-work-b4-scratch-worktrees-f69cde824a95
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-b7988
X-Developer-Signature: v=1; a=openpgp-sha256; l=2202; i=brauner@kernel.org;
 h=from:subject:message-id; bh=WOC61+N+yMSrSlWPKPV8LKR/+jQ4/U//mGLpeO+B6sc=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWRl3pxw2aDD94Rn6BefmmnW87h8jpjb1ArdPGPGxhIzU
 UZxyea3HaUsDGJcDLJiiiwO7Sbhcst5KjYbZWrAzGFlAhnCwMUpABOZxs/IMMsovmFDqm++c73Q
 LpZ3gqUn1nxzSZS5O7vX2uiPh0iwAcM/1VcqBWIJcceX78suuaD/+/6+BS0357TN2cTUcfaKjFc
 qAwA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

With submodule.recurse=true in the user's config b4 cannot apply
anything in a repo that carries submodules. The scratch worktree's
sparse checkout recurses, looks for the per-worktree submodule clones a
just-created worktree cannot have, and dies:

    fatal: not a git repository: ../../worktrees/b4-shazam-worktree/modules/ezgb
    fatal: could not reset submodule index

That takes review-branch creation, b4 shazam and the TUI's test applies
with it. The b4 repo itself is affected through its vendored
patatt/liblore/ezgb submodules.

Everything b4 does in those worktrees is thrown away when the call
returns, so they can run with overrides of their own: no submodule
recursion and no gpg signing. SCRATCH_GIT_OPTS carries both, since each
is inert where the other matters, and every scratch worktree switches
over to it: the shazam apply, the TUI's five hand-rolled test applies,
the fake-am staging worktree and the sent-tag worktree in b4 send. The
commits that outlive their worktree keep the user's signing config.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
Christian Brauner (6):
      git_run_command: look past -c overrides for the subcommand
      shazam: ignore the user's submodule.recurse in the scratch worktree
      review-tui: use the shared scratch-worktree overrides for test applies
      fake-am: use the scratch-worktree overrides in the staging worktree
      send: use the scratch-worktree overrides when tagging a sent series
      tests: exercise the scratch worktrees under submodule.recurse

 src/b4/__init__.py                 |  43 +++++++++--
 src/b4/ez.py                       |   8 +-
 src/b4/review_tui/_modals.py       |  44 +++++++----
 src/b4/review_tui/_tracking_app.py |  11 ++-
 src/tests/conftest.py              |  52 ++++++++++++-
 src/tests/test___init__.py         |  15 ++++
 src/tests/test_ez.py               |  45 +++++++++++-
 src/tests/test_tui_tracking.py     | 146 ++++++++++++++++++++++++++++++++++++-
 8 files changed, 332 insertions(+), 32 deletions(-)
---
base-commit: 99fe195c0aa5a88be5033f87cad22bc32d27cbfe
change-id: 20260729-work-b4-scratch-worktrees-f69cde824a95

