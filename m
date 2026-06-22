Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1833009E2
	for <tools@linux.kernel.org>; Mon, 22 Jun 2026 12:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782130853; cv=none; b=m8iij65wrNoH8nYwuH9867Zgr499xemXaaowN4TCVXvsJBUtDABDdAkCMHJ4Sax0THrHgbGM2ynQzZ6zVPEwybhe2F+1oumedLdmaKcEXNVvZ7wsrbmUHtXALDXRDPBjQRrzVudEAP7ZpIZEqSGxZbV/Sou0/K1511mnJC6+TUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782130853; c=relaxed/simple;
	bh=rKo8jiwY7lYwLhgn2nM0abdcfoM9SQ5NTNRwsqDFtIg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=R5J2fUPP4pCkq7ZvWd+gXY9vlBc14my1hlTWBZOhLbWaN4IC8ephg9SRYjuNgTOdddfb04Kv5+y2AiSqg9TCj5ZpM5x0ceOQFnkVvycHCJdPDBNeIRb2STa+/gc5E8stGLwha7TuxP0aPm/2NFEHRewJlP8woWxq1AMq1vKr10U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=obEXkCbE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="obEXkCbE"
Received: by smtp.kernel.org (Postfix)
	id E529C1F00A3A; Mon, 22 Jun 2026 12:20:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 168931F000E9;
	Mon, 22 Jun 2026 12:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782130851;
	bh=YF1Aut7BRWLY8+H5ML3i7iao3CvZYR7ir+BrO+79i1o=;
	h=From:Subject:Date:To:Cc;
	b=obEXkCbElTKdK8WgwIc9UHmqDuC84LK+bUR86kEKKtNm1/9KO7ZhArfCG1ikm6dAy
	 uj8qxbQp1gCrU4evuZW1X48UTtoD3KtRvOLlVrmw9aVhWJqP8DvA5G/n4QxYVSJobT
	 yS31UEEnv4TZuasiSphxVEpJwzILuVMkdJAckWepdjJXqZXQYpyMIzxqxlNfbUoZV2
	 GYpM9fyaj1t5UW0a7p7Lzn5wIw8uSvhTRKTzz3H4HIAl9Gj/wXECSAohNCZS6nxkd4
	 Gec9qfZJJ/jTaMzW2quiG8uUEWMU8vvE3fpzMMPkEwwd29BP+YqL2D3eRZJrb4xkhb
	 dGgBjV6yhD5AA==
From: Christian Brauner <brauner@kernel.org>
Subject: [PATCH b4 0/3] review-tui: align take->merge with b4 shazam
Date: Mon, 22 Jun 2026 14:20:42 +0200
Message-Id: <20260622-review-tui-take-merge-v1-0-ad4893027e4d@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJooOWoC/yWM0QrCMBAEf6Xcs4E0aCv+ivhwias9pVXuUhVK/
 91EH2eY3YUMKjA6NAspXmLymAq0m4bSwNMVTs6FKfjQ+S4EVyO8XZ7FZb7DjdAStX0P7Hfw7CO
 V7VNxkc/v90hxS6e/sznekHI9rFVkg4vKUxqqGtkylNb1C78sqCOWAAAA
X-Change-ID: 20260622-review-tui-take-merge-177ee85e0a0b
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-04799
X-Developer-Signature: v=1; a=openpgp-sha256; l=2248; i=brauner@kernel.org;
 h=from:subject:message-id; bh=rKo8jiwY7lYwLhgn2nM0abdcfoM9SQ5NTNRwsqDFtIg=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWRZaiyyCd/dVmH2ZVbU5ZNf964pTu/7fFc+M+HA+Sk/Z
 Jsl1da96ihlYRDjYpAVU2RxaDcJl1vOU7HZKFMDZg4rE8gQBi5OAZgIkxnDP801B5Uebji3cOak
 Yw5rpmb99WSYGVzN/WBL9LbUmzM7vd8zMsx9u/8Z+4uPZs2fJ9uFskZsn75W9lxEB9uupCyLRHX
 mKh4A
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

The review TUI's "take" action (merge method) applies a reviewed series to
a target branch, but it had drifted from how `b4 shazam` behaves on the
command line in two annoying ways.

It ignored b4.shazam-merge-flags entirely, so --log, --stat and --gpg-sign
had no effect from the TUI, and because the cover was composed in b4's own
editor and then committed with `git merge --no-edit`, git never got a
chance to apply those flags or to show the --log shortlog for review.

Worse, it applied the merge by checking out the target branch in the
current worktree.  That clobbered whatever was checked out there, and when
the target was already checked out in another worktree it just failed:

    Could not checkout vfs-7.3.kfunc: fatal: 'vfs-7.3.kfunc' is already
    used by worktree at '/home/brauner/src/git/linux/vfs/vfs-7.3.kfunc'

which makes the whole thing unusable if you drive review from a different
worktree than the one you merge into, as I do.

So make the TUI take->merge behave like shazam: honor shazam-merge-flags,
write the cover with -F and let `git merge --edit` open it (with a real tty
under the TUI's suspend()) so the flags apply and the message -- shortlog
included -- can be reviewed before committing, and label FETCH_HEAD the way
shazam does.  Run the fetch and merge in whichever worktree already holds
the target branch, or a throwaway one when it isn't checked out anywhere,
instead of touching the current checkout -- so a series can be taken onto a
branch that lives in any worktree.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
Christian Brauner (3):
      review-tui: honor shazam-merge-flags in take->merge
      review-tui: run take->merge in the target branch's worktree
      review-tui: test shazam-merge-flags and worktree resolution

 src/b4/__init__.py                 |  16 ++-
 src/b4/review_tui/_modals.py       |   6 +-
 src/b4/review_tui/_tracking_app.py | 286 ++++++++++++++++++++++++-------------
 src/tests/test_tui_tracking.py     | 185 +++++++++++++++++++++++-
 4 files changed, 390 insertions(+), 103 deletions(-)
---
base-commit: 63c58f10c35d45a3ab9f63f22d285866b9f2fbee
change-id: 20260622-review-tui-take-merge-177ee85e0a0b

