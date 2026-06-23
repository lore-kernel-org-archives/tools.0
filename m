Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FF22C11EE
	for <tools@linux.kernel.org>; Tue, 23 Jun 2026 20:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782246865; cv=none; b=O8xLtFl4gQ63oYeBZp+uRHwevdzkHl2GyMC/6HpMm4eNuVKvb8PuWcLRC9H7Zm4Wg/ktbfM+cuRRhBG0qZ3JLfUzlesXELBlN7p5uhUIdbh1iaBZtv4s5gLLbO6sMREPtrFvj9BeCDOe9jGnGaCZ1vaoYpk3810AWFFLRahzq8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782246865; c=relaxed/simple;
	bh=0e7Wy1w/F27iPzstTKFsIKybkZPPSj12z3k4emm8tDw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NApbnEiuHYPbc53bFZBZdXuDBwNH92fBRMrE6QH4sUI8hSvcHEXC7Cp0UN3XKVmULl6srXu7+rvDgUfsMV2V6ZgZ4vVf+JztBFqjxTA7ZKHPktunZHiYSeqzs8k6p99IhUifYhQdHCHqauVynHhCpW2dilEWFC3AbaR312o5iXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aSADd5Th; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aSADd5Th"
Received: by smtp.kernel.org (Postfix)
	id 68B4D1F00A3A; Tue, 23 Jun 2026 20:34:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D6F71F000E9;
	Tue, 23 Jun 2026 20:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782246864;
	bh=L4m6PCMpXKegTnSOFqAm3CFZqF9DoCH/u8pWemnnDy0=;
	h=From:Subject:Date:To:Cc;
	b=aSADd5Th4Os/Anx4bNqtorSoFLXF1fE4HfXPw7LvX4m9rvzGSXQtDzx3qSbbIHhyr
	 d2+7XLHpth8H3T9iJMYU7ZAEmljXXvJA6ZX1jMNF+c609DzuevcmkYeT5vtckd4ulp
	 s66wmBlQFzUMwPFu5v++W67K8x/mA8wTk5aotOwAqpl7rgVBHl+6uftF3M32yGv1pX
	 DZUrBc+ecOdtje4HINNcN3Hv3AwzJj9xw6yiXPFmUDpuVyz+la0IZVlVS0HzEgavyN
	 bwi01EFMFTm1BC0N0+uKd+Yq0LZQdwUsiiik5G4wmRBsi5wR9Zhuhk+xWPfiCoNH1m
	 3L2zHHhvg9lqw==
From: Christian Brauner <brauner@kernel.org>
Subject: [PATCH b4 v2 0/6] review-tui: worktree-aware takes, resolve
 take->merge conflicts in place
Date: Tue, 23 Jun 2026 22:34:16 +0200
Message-Id: <20260623-20260623-review-tui-take-am-worktree-v2-0-2cbbab5d5441@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMjtOmoC/5WO3Q7BQBCFX0Xm2sh2UcuV9xAX0zp0lVZmVxHpu
 +tW4t7dnJ98c94UoB6BNpM3KToffNsMwk4nVFbSnMD+MGiyxuYmt3P+HamNB8e75yg1WK78aLW
 OCvDaleLmcEuYnAbUTXH0z/HNjooF7b9euBdnlDHxU6uQAC5UmrJK1lVChKag8iG2+hpHdtkI+
 W9Pl7FhOLHZwoh1K2xraIPLrNUT7fu+/wD/Z5RdCAEAAA==
X-Change-ID: 20260623-20260623-review-tui-take-am-worktree-98ca83e85e06
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-e850d
X-Developer-Signature: v=1; a=openpgp-sha256; l=4203; i=brauner@kernel.org;
 h=from:subject:message-id; bh=0e7Wy1w/F27iPzstTKFsIKybkZPPSj12z3k4emm8tDw=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWRZvT337DXviTVix+Oneu/S01v5puH5tPOsXWpcbz4eC
 nmSrTlDtqOUhUGMi0FWTJHFod0kXG45T8Vmo0wNmDmsTCBDGLg4BWAiq1sZGc732ax7vebw4p2p
 ct6vP5n2Tvsq9Hq3hZ7gJNdS7fxwsXWMDF8KVvWdsRFwynl+tcaiLyv516dMzr/MG3XesoQ82nF
 FlhcA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

b4 review's "take" action applies a reviewed series to a target branch by
one of two methods: a merge (git merge) or a linear/cherry-pick apply (git
am). Review is often driven from a different worktree than the one the
series is applied into, and the target branch may be checked out in yet
another worktree, so a take has to run wherever the target branch lives and
never disturb the current checkout. This series makes both take methods do
that correctly and teaches take->merge to resolve conflicts in place.

Worktree handling (take->am and take->merge):

  - take->am checked the target branch out in the *current* worktree, so
    applying to a branch already checked out elsewhere failed outright
    ("fatal: 'vfs.fixes' is already used by worktree ..."), and otherwise
    clobbered whatever was checked out where review was being driven from.
    It now runs git-am in the worktree that holds the target branch, or a
    throwaway one when it is checked out nowhere.

  - take->merge already picked that worktree, but its "git merge --abort"
    (and the non-interactive merge used by the tests) still ran in b4's own
    cwd. On a conflict that left the markers in the target worktree while
    rewriting b4's checkout from the target's index -- silently dirtying one
    worktree and clobbering another. Both calls are now anchored to the
    target worktree.

  - Both methods need the same "find or create the right worktree, then
    clean up after" dance, so it is factored into one _take_worktree()
    context manager shared by merge and am.

In-place conflict resolution:

  A conflicting take->merge used to abort the merge and discard the take,
  forcing the user to start over. take->am already drops the user into a
  shell to finish (or abort) the conflict by hand; take->merge now does the
  same, matching "b4 shazam". Finishing the conflicted merge in place keeps
  the merged-in side fully reachable, so no commit is silently dropped --
  unlike "b4 shazam --resolve", which replays patches with "git apply
  --3way" + "git add -u" and so omits a patch that only adds a new file. The
  shared "drop to a shell, then check what the user did" logic is factored
  into _resolve_worktree_take_conflict() and used by both methods.

Concretely, a conflicting take->merge reports the conflict and drops you
into a shell (prompt marked "(b4 conflict)") in the target worktree; you
finish the merge and Ctrl-d back to the review UI:

    CONFLICT (content): Merge conflict in fs/namei.c
    Merge conflict:
    You can resolve the conflict now.
    ... When done, Ctrl-d to return to review UI.
    (b4 conflict) $ git add -A
    (b4 conflict) $ git merge --continue
    (b4 conflict) $ exit
    Conflict resolved, series merged.
    Merged b4/review/vfs-fixes into vfs.fixes
    Press Enter to continue...

Exiting with the merge unfinished -- or "git merge --abort" -- drops the
take instead of recording it.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
Changes in v2:
- No functional changes; type-checker (pyright/ty/mypy) fixes only.
- _take_worktree(): annotate the @contextmanager as Generator[...]
  instead of Iterator[...].
- Tests: fix two `# type: ignore` codes (attr-defined -> assignment)
  and drop a now-unused ignore.
- Link to v1: https://patch.msgid.link/20260623-20260623-review-tui-take-am-worktree-v1-0-e8a2140a287e@kernel.org

---
Christian Brauner (6):
      review-tui: factor cross-worktree take setup into _take_worktree
      review-tui: run take->am in the target branch's worktree
      review-tui: test cross-worktree takes
      review-tui: run take->merge abort in the target branch's worktree
      review-tui: resolve take->merge conflicts in place
      review-tui: test take->merge conflict resolution

 src/b4/review_tui/_tracking_app.py | 353 +++++++++++++++++++-----------
 src/tests/test_tui_tracking.py     | 426 ++++++++++++++++++++++++++++++++++++-
 2 files changed, 653 insertions(+), 126 deletions(-)
---
base-commit: 42c0c1e6eccec7b067aa8072bf3a77c43f9fc0bd
change-id: 20260623-20260623-review-tui-take-am-worktree-98ca83e85e06

