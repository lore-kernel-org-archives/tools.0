Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4F838D6AD
	for <tools@linux.kernel.org>; Wed, 24 Jun 2026 08:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782291117; cv=none; b=B4EJjelYEaVq4E0Ll70xAs89o918hWKtzMAjLuGFz/ybkh3axP7bdkeexm4zTyR8BRJllR8iQUzxmhf8Mb1sRkKkk2mKjgM6+zI/HXPs1Nb3qggRtLm65a1EWuJT6MiEbs1+4we5yimkI507rwH9EPo++0Q1DLmDDt3J/M6cHLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782291117; c=relaxed/simple;
	bh=nhK5vAsYRiC9Jzzm1/+2bE8Pgo0DG/v8MFv0sh8aX5Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bEcare7bigc3v06EW8hlTZUUfPF0ZymTcGneb6ZLB7ddgpfuY0fCzke65kqjEHOP+nmu7/kEOyLsGQrsN0bZbV0qkrICTC81gLGNbEodRI9t2xBAuRUuRxcIU8iAfOJqC9k50e24Z7DZApDi2KSahImY5YKT6UhkSWoAxVAKmhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QzFeq9fh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QzFeq9fh"
Received: by smtp.kernel.org (Postfix)
	id 9903A1F00A3A; Wed, 24 Jun 2026 08:51:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C363F1F000E9;
	Wed, 24 Jun 2026 08:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782291116;
	bh=WBXw1oJtd7S1mjHgwWc4qfKJjN0OIeTiY5wfz551tuQ=;
	h=From:Subject:Date:To:Cc;
	b=QzFeq9fhFptPbSFHECiuRTJ5bjpmwy/esqvKAFLIUxcxcOCnDSmrJAu70t3jR0KSh
	 lrcDiI7BXgdWwkLogHYhfUaT19yzht40QKXFYvrC8Hh1nEpKsHi8QjqG3y187HxKAA
	 e8vNot6UDjYhNStmJWf7rjdP6fazBqw241HF1jDdbwF92kn7d+cfDLizPIG+Qkb/yA
	 oSg61Au5yjTm5M1uwNV2fGwGwRr4MQxGNR2/fVPy1aa6gCb6xq5evvyeeqaKQrjx1s
	 4LeR0XHtm90vdmdqRa8ME27oXMPsZXm2BPMXpkNV9ZsWrQPQGuFYFjkDfPAryBLAMD
	 bcHvcOvcWzbKg==
From: Christian Brauner <brauner@kernel.org>
Subject: [PATCH b4 v2 0/7] shazam: stop --resolve from silently dropping
 commits
Date: Wed, 24 Jun 2026 10:51:52 +0200
Message-Id: <20260624-shazam-resolve-native-am-v2-0-97b3a1bc497a@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKiaO2oC/3WOyxKCMAxFf4XJ2jo8K7jyPxwWpQaoQnGSyqgM/
 26Lbl1l7kly5i7ASAYZjtEChLNhM1kf0l0Eule2Q2EuPkMapzKWaSa4V281CkKehhmFVc744Yk
 uZIulLHUmY/Dvd8LWPDf1GZoc6i/jR3NF7YIzXDWKUTSkrO4DGhU7pLDoDbuJXluxOdkkvw75/
 w5zImJRJW2BhTyUVVWebkgWh/1EHdTrun4AItDjF/AAAAA=
X-Change-ID: 20260623-shazam-resolve-native-am-c56fe868c360
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-cd519
X-Developer-Signature: v=1; a=openpgp-sha256; l=5300; i=brauner@kernel.org;
 h=from:subject:message-id; bh=nhK5vAsYRiC9Jzzm1/+2bE8Pgo0DG/v8MFv0sh8aX5Y=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWRZz1pVwaYWXvNgqS8b64UNbde5I1OKHzwTuJZcsS1mw
 eG8f2ozO0pZGMS4GGTFFFkc2k3C5ZbzVGw2ytSAmcPKBDKEgYtTACayzpbhf6FGM99C6zQ/hprd
 9QovV2vIvjlwPubETqkbUSGLuNSvHWFkmKO258dl566tpl137YT1jorXnVPjMHhqtmL3f+UvE8p
 XMQEA
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
Changes in v2:
- Fixed b4 shazam conflict resolutin and aligned it with TUIs behavior.
- Link to v1: https://patch.msgid.link/20260624-shazam-resolve-native-am-v1-0-91f5e5678998@kernel.org

---
Christian Brauner (7):
      review-tui: lift worktree am-conflict helpers into b4 core
      shazam: resolve conflicts via native git-am, never dropping patches
      shazam: test native-am conflict resolution keeps every patch
      shazam: resolve conflicts in subdirectory files, not just the repo root
      shazam: note subshell alternative to the --resolve two-phase model
      shazam: resolve --resolve conflicts inline via a subshell
      shazam: test the inline --resolve subshell flow

 docs/maintainer/am-shazam.rst      |  46 ++--
 src/b4/__init__.py                 | 231 ++++++++++++++++++-
 src/b4/command.py                  |  14 --
 src/b4/mbox.py                     | 414 ++++++---------------------------
 src/b4/review_tui/_tracking_app.py | 109 +--------
 src/b4/tui/_common.py              |  58 +----
 src/tests/test_three_way_merge.py  | 455 +++++++++++++++++++++----------------
 src/tests/test_tui_tracking.py     |   4 +-
 8 files changed, 590 insertions(+), 741 deletions(-)
---
base-commit: 0a1954d329ab57f7aab40743fad7dc6e3c45d35d
change-id: 20260623-shazam-resolve-native-am-c56fe868c360

