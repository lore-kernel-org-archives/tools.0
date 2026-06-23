Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7193B27C5
	for <tools@linux.kernel.org>; Tue, 23 Jun 2026 23:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782258106; cv=none; b=Ly/a0y6iG6lVGgTE4L6MVGu/2NLUX5oFTRrJ8+WATs4mygar1fjEche1ZYPC/qDZTh5/N+ZO6e5JBq98awpfyHOGbZpfzt3KgH+8XPjIs9wGGstnbC6bgBFRM/pqGr1fxx0q9W7kkKLD5Hgq9WktJ+bocCSdph1Ii8okA2BnNME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782258106; c=relaxed/simple;
	bh=3obZ7tUEC+5FX1V+c2DwsxmOnj5qInQgWcwwRIrkHwM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=doRwXlX3i+/kTOrucKXE/rBYLUW2HNm6Hf6L8GKiIrPZJUsYjCYkyn9pIvFHfV9Cy0jveLMh6u0zkc64dq3paZxbC69C3hO1QNR5d1UzXk6ZD/Ai8EjAuUiuhqVlw/4sRCyv/Qc8uet9JsMoZCGKM9aUyN5lIahbHpOBwNErn9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n5iFWhVw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n5iFWhVw"
Received: by smtp.kernel.org (Postfix)
	id 3BEAB1F00A3F; Tue, 23 Jun 2026 23:41:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F1DA1F000E9;
	Tue, 23 Jun 2026 23:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782258105;
	bh=CqAkZ0GYIvDm0jMsLNVGMGNHd7g+kxxCC6Eva8EVI3g=;
	h=From:Subject:Date:To:Cc;
	b=n5iFWhVw6bV0hPRmBynSrtHBA5QzkHv6gog20L0JoRJCW3GdiiXY7nTUogunCWIt/
	 xPJ6p13m/D9gpqzl1D89DdAZNf4zbd+lly9UAE4i4egLvnT5ZQUDj9ErrwuH2jtwk4
	 Me3y9oruYKZctV0wVppjWbvNR842pZqSuK2yi21Qn+H14scChG7Voz6QB5EoCxuyu8
	 4XFGdUFy12pdMP0b0G7iideWH2I2ZaW6ufbnrWhWgzs0HT749VFFRfv22YVWeEGIrn
	 LY/2TFL+MoytvsRrXpFmwviD3R9yuW55s3l+dOic9Djhjj8pQda2YUmgtCrOKn5AdM
	 B4AmB1Fe27sYA==
From: Christian Brauner <brauner@kernel.org>
Subject: [PATCH b4 0/5] shazam: stop --resolve from silently dropping
 commits
Date: Wed, 24 Jun 2026 01:41:35 +0200
Message-Id: <20260624-shazam-resolve-native-am-v1-0-91f5e5678998@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK8ZO2oC/yWMwQrCMBBEf6Xs2UBMNRR/RTxs4tas2FR2YxFL/
 91ET8N7zMwKSsKkcOpWEFpYec4V9rsOYsJ8I8PXyuCs89a73mjCD05GSOfHQiZj4RrVxKMfafB
 D7L2FOn8Kjfz+XZ8hHODyd/oKd4qlfbZWQCUTBHNMTU2ohQS27QtyqXAemQAAAA==
X-Change-ID: 20260623-shazam-resolve-native-am-c56fe868c360
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-6067f
X-Developer-Signature: v=1; a=openpgp-sha256; l=4873; i=brauner@kernel.org;
 h=from:subject:message-id; bh=3obZ7tUEC+5FX1V+c2DwsxmOnj5qInQgWcwwRIrkHwM=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWRZS27/aX7g68ULWx7+1c4UNv+xTHdygevBY0Kb+4xk/
 84+tCZAuKOUhUGMi0FWTJHFod0kXG45T8Vmo0wNmDmsTCBDGLg4BWAiKToMf+VWtbTYHH7k13yP
 4UeV5qu+EzrZ3HqL93f8Wz1v7qkcE2WGf2qPsmbff3ZiYVfGI/Xo0M79tR/SK2f9/yqe99D9Qe6
 zYywA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

b4 shazam --resolve exists to help land a series that doesn't apply
cleanly. The problem that motivated this series is that, while resolving,
it can silently drop whole commits from the merge it produces: you end up
with a merge that is quietly missing changes, and nothing in the output
points at what went missing.

Why they vanish

When git am can't apply the series, the old --resolve path merged the
patches that did apply, then replayed each remaining patch with
"git apply --3way" and staged the result with "git add -u".

git apply --3way can only do its three-way merge if the blob IDs recorded
in the patch's "index <old>..<new>" lines are present in your object
store. For patches that arrived over email those blobs usually aren't
there -- which is frequently the very reason git am -3 failed to begin
with. In that case git apply --3way falls back to a plain apply, fails
with "patch does not apply", and exits non-zero having written nothing at
all: no conflict markers, no unmerged index entries.

The replay loop assumed any non-zero exit meant "conflict markers are in
the tree." It advanced past the patch and asked you to resolve conflicts
that did not exist, so b4 shazam --continue happily resumed at the next
patch. The skipped patch's changes never entered the merge -- they were
simply gone, with no warning. A patch that only adds a new file can
disappear the same way when it rides along with a change that can't be
applied.

How this fixes it

Stop replaying patches with git apply entirely. On a conflict, b4 already
leaves the in-progress git am parked in a throwaway worktree; keep it
there and finish it natively:

    cd <worktree printed by b4>
    # resolve the conflicted files
    git am --continue        # or: git am --skip

git am drives the whole remaining series through git's own machinery,
which stops on every patch it cannot apply and never silently skips one.
Once it is done, b4 shazam --continue fetches the fully-applied series and
merges it exactly once -- the same merge a clean b4 shazam makes. Because
every patch now goes through git am, nothing can vanish. This also brings
--resolve in line with how the review TUI already resolves conflicts.

Since both now resolve am conflicts the same way, the series starts by
lifting the worktree plumbing the TUI already had -- detecting an
in-progress git am, and fetching the finished result out of the worktree
before dropping it -- into b4 core, and shazam reuses it rather than
growing its own copy.

Resolving conflicts in subdirectory files

One gap hid behind that guarantee. The series is applied in a sparse
worktree where only root-level files are materialized, and git's 3-way
merge refuses to touch skip-worktree paths. So a conflict in a
subdirectory file -- the common case for real series -- still made
git am -3 abort with a clean index: no markers, nothing to resolve. The
user was pointed at a conflict that was not there, git am --continue
dead-ended, and git am --skip silently dropped the patch. Only root-file
conflicts, which the tests happened to use, ever worked.

git_fetch_am_into_repo now rebuilds a full worktree on a conflict before
handing it back -- abort the partial am, disable sparse-checkout, replay --
so the conflict is recorded with real markers to resolve. b4 shazam
--resolve and the review TUI both apply through this one function, so both
are fixed, and a regression test drives a subdirectory conflict end to end.

The same commit hardens the rest of the flow: b4 shazam --abort no longer
crashes on a corrupt state file, --continue refuses up front on a dirty
working tree (keeping its state so it stays re-runnable), a failed
worktree fetch leaves the resolved am in place to retry, and the docs now
note that --continue merges with -M and leaves FETCH_HEAD with -H.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
Christian Brauner (5):
      review-tui: lift worktree am-conflict helpers into b4 core
      shazam: resolve conflicts via native git-am, never dropping patches
      shazam: test native-am conflict resolution keeps every patch
      shazam: resolve conflicts in subdirectory files, not just the repo root
      shazam: note subshell alternative to the --resolve two-phase model

 docs/maintainer/am-shazam.rst      |  41 ++--
 src/b4/__init__.py                 |  88 ++++++-
 src/b4/mbox.py                     | 485 +++++++++++++++----------------------
 src/b4/review_tui/_tracking_app.py |  61 +----
 src/tests/test_three_way_merge.py  | 480 +++++++++++++++++++++++++-----------
 src/tests/test_tui_tracking.py     |   2 +-
 6 files changed, 662 insertions(+), 495 deletions(-)
---
base-commit: 0a1954d329ab57f7aab40743fad7dc6e3c45d35d
change-id: 20260623-shazam-resolve-native-am-c56fe868c360

