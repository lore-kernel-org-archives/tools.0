Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C5826ED3E
	for <tools@linux.kernel.org>; Tue, 23 Jun 2026 16:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782230496; cv=none; b=IYoiYmRxGyEAUmG5rkx05oQbXBEPOxbKczI+/wwiSSEDdj7m+7il0+5N9IC/e2ZpoNY/ZrSTmeiRdDpdv1Pb7wL6F5yX4QfUEj7dFIn7BemAt7g5oaWrGSIQjjth2cf1FD4bD/DPFCDkfikRSgBfr2vjSnXDA41cli5o28GOtlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782230496; c=relaxed/simple;
	bh=0oYgJXe96MxB2+ecKPIiwdn/6cXdutq9Stv/Z6//+9g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=M8h5rTv9/D/tEjJInK0fmm0/Urczzf6nWScL77k+RLsOsF4RpRn+NpFiRjMPO3gIAqq0qp4wINhbAYrLNLsrC1SJYNxzpNEOSDp21kecFo6vlcwzgQaIHd84fq/sdYZP9M8BEm5aArHH6DT/5GBXjSsR9sIlCp3mWGdjqaSM7X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FzQQTIDG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FzQQTIDG"
Received: by smtp.kernel.org (Postfix)
	id A41FE1F00A3D; Tue, 23 Jun 2026 16:01:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF27A1F000E9;
	Tue, 23 Jun 2026 16:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782230495;
	bh=GeyuJPObO6rs5lSS9nTSJpVmSizBvuQyOgK9Z0H8+yo=;
	h=From:Subject:Date:To:Cc;
	b=FzQQTIDGKP3I32QdbHsYsaO24sIV5DIZPRFxljaYX5eXTuh+zAwh2B4pPNelX4YQB
	 zOBBpsEZFfpjoOjLYme2KzlteWlDbIZ0Sp8RetHLOAXyV9hBfnzbvozvALVUeLv02D
	 72fAC475B0NbM+kDCUzCD8l5NYMcGT0MasFAd8s2UzlCuXJ8T9VVcqaVcD7QZNm7AY
	 BdVaRzmLrLdzfTDO9rzs1CqXBQbVZ9MX272e+fJrsOBmynIAIgSSTc6phRP1Ygoxpw
	 mHN9guKmmM393qQhovwllj2mzvvx0GhHu0DQOCx7wAfjZPMclemkG5TsYyuYDn16W1
	 JAH+WMQctNtYQ==
From: Christian Brauner <brauner@kernel.org>
Subject: [PATCH b4 0/6] review-tui: worktree-aware takes, resolve
 take->merge conflicts in place
Date: Tue, 23 Jun 2026 18:01:28 +0200
Message-Id: <20260623-20260623-review-tui-take-am-worktree-v1-0-e8a2140a287e@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANitOmoC/z2NwQ6CMBBEf4Xs2U0QtKn+iuGwraNUAphtERPCv
 0s18TbzMnmzUIQGRDoXCyleIYZx2Mp+V5BvZbiDw3XrVJWVKU1V8z/kNWZOU+AkHVh6nkftkgJ
 8sl5sDXtEaWhTPRW38P7eXMgdqPmxOLkHfMr+vHISwU5l8G1GvcQEpXX9AIWygVWlAAAA
X-Change-ID: 20260623-20260623-review-tui-take-am-worktree-98ca83e85e06
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-50a61
X-Developer-Signature: v=1; a=openpgp-sha256; l=3796; i=brauner@kernel.org;
 h=from:subject:message-id; bh=0oYgJXe96MxB2+ecKPIiwdn/6cXdutq9Stv/Z6//+9g=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWRZrb3H9JLV+Wx7g7XVFq+/F+2sjFz4jv74uzh7Y/E71
 2X24jL+HaUsDGJcDLJiiiwO7Sbhcst5KjYbZWrAzGFlAhnCwMUpABNp0WJkWPPhS4eovCEDm+Op
 nsXWpuoBZv8nvOf4bbdOxpDni8vdGkaGWTvW5WR9b3Sqy+RiVFe1mn34xozfT49XPUlSPXRu7x5
 jZgA=
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

