Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193A6331EBA
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 21:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785535136; cv=none; b=HMy4sZPAc4jM6XdBVXBXP4Qnjp8g7OitDHR3WmottMVUav9Limy6cAe5rDM27mxHL0sF23j6o5VxQbH5qMofcBY8Hu5c1v80T8tgBRhIFywAG9qrExCrnIrJqoOYBsK5nQjUTUmbM3bVxCdC8ZxuuYddFC7bsAjCFp8dd4HCj1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785535136; c=relaxed/simple;
	bh=nxehQx9qzFDsc8WYIKli7XH/STb8vNyevaOu5JzgQMo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EOg5XI4HHIT4HxOUIxmrunyZSG1pR3kmGToRkv7uUqSRc+pVkzgXITNbDnd0evgA60+IQXNeCPgKeGerfhEbg9IANwyBeyBmnUUeclBwpsZsY5XPEey3F6TvZgQ4AK+xB5YqndW02Vv2fAJfjCAu6szEBhNRTqLjUiJXwtoyJ8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P9RY4Bky; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P9RY4Bky"
Received: by smtp.kernel.org (Postfix)
	id 866CE1F00ACF; Fri, 31 Jul 2026 21:58:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B26AF1F00AC4;
	Fri, 31 Jul 2026 21:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785535134;
	bh=JeEFMW8VlkzkF9yBiqLLCbve5jWARAMVyvrK6C8I4yg=;
	h=From:Subject:Date:To:Cc;
	b=P9RY4BkyQqQwBRqiAs5tshmQGsjpWzoE/ZIr2prxRnqLwG/APT4aMgkyDEHngvT2p
	 pggeLfKwbMtr1dt99mMjQgJp3beWqA8iaA65N1cKp57zlZV4hOpNPxLC18ZC8B9lf3
	 srorx1cZ/EisFVGM8pV5MyZ1ZJlNNDhO8zUKgY9jhzyHINhIsMjlAr3mBPuL8GAXIT
	 YXr78CTGOZITcNIcaqGjbkDVrIsIWRZgWKdBJCjIqGJcBg5dmkwc/8i/4Jacut75Yc
	 ZTZ3BjwsMjZm/+jhaIKZbMz15U00U1b9W1LEKWoZdpQNtMGSxVPLyljYnGn6CtJSOx
	 WNdAa3FRR6vQw==
From: Christian Brauner <brauner@kernel.org>
Subject: [PATCH b4 v2 00/44] Stop the editor branch guard from eating
 review replies
Date: Fri, 31 Jul 2026 23:58:41 +0200
Message-Id: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJIabWoC/42OSw6CQBBEr2J6bSv/jyvvYVj0DA2MyCc9gBrC3
 QX0AC5fpfKqZrAshi1cDjMIT8aarl3BOx5AV9SWjCZfGTzHi5zYd/HZSY0qQM7N0AkqoVZXWI4
 kOZJKAz/URUqhA6uhFy7Ma7ffQAWQfTM7qjvrYdNuLUWWf54tGns7CFNzbsgOLFujMnbdeu8nJ
 3e3/fVnctHBnKOEYp1woNW1Zmn5ceqkhGxZlg9jv142/wAAAA==
X-Change-ID: 20260731-work-b4-editor-branch-guard-ab9435cf9a50
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=7129; i=brauner@kernel.org;
 h=from:subject:message-id; bh=nxehQx9qzFDsc8WYIKli7XH/STb8vNyevaOu5JzgQMo=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlSs2y4rc2umz0/iN7y6RwoylJ7k2vkh5X3GTOPjJjW
 6bE9zjHjlIWBjEuBlkxRRaHdpNwueU8FZuNMjVg5rAygQxh4OIUgIm8ecTI8OD21nlqoqJ6uX/E
 3Ka8VN30zedFjXLdiTVR2mpXk1K1rzMyfJbmVlA/dkxJa2pyqn+Dkd+7znel3xl/5Thneq6asWM
 fPwA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Reported from a live "b4 review tui" session: a reply editor left
open across a branch switch dumped the reply into /tmp and took the
TUI down with a RuntimeError. Digging into that turned up four editor
problems, one patch each:

- The branch guard in edit_in_editor() exists for b4 prep, which
  writes to the branch HEAD is on, but it fired for callers that
  write to an explicit ref. It is opt-in now.
- edit_in_editor() worked in the process cwd rather than the tree the
  edit belongs to. Callers name the tree now, "b4 ty -g" included.
- An editor exception inside app.suspend() tore the whole session
  down. The call sites share one non-fatal helper.
- The TUI checked its start branch back out even when the user was
  the one who moved HEAD. Both restore paths only undo b4's own
  checkout.

The patches before those are follow-up fixes to last round's review
tracker work: outgoing mail is marked read on every send path, the
review databases get consistent closing and timeouts, archiving
reports failures instead of raising into the send path, post-send
bookkeeping is kept out of the send error handlers, --email-dry-run
no longer records sends that never happened, a take whose record
could not be written is told apart from one that never ran, and the
queued-thanks publish check runs in the repository the commit landed
in and warns when the remote's tips are entirely absent from it.

The last group puts the worktree back wherever the TUI moved it.
Restores record a position rather than a branch name so a detached
HEAD works too, the tracking loop restores however it ends,
create_review_branch() cleans up on every failure, the SystemExit
that b4 helpers exit with is caught where only Exception was, and
deleting the branch HEAD is on lands the user back where the session
started.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
Changes in v2:
- Put the worktree back when a revision upgrade moves HEAD onto the
  review branch.
- Restore the branch however run_tracking_tui() ends, not only after a
  review pass.
- Catch the SystemExit that create_review_branch() and load_tracking()
  exit with, in the upgrade error path, the series checkout and the
  status sync.
- Clean up after create_review_branch() when the patch range cannot be
  read.
- Land HEAD back where the session started when abandoning or archiving
  deletes the branch it is on.
- Record the restore point as a position rather than a branch, so every
  restore works from a detached HEAD.
- Stop --email-dry-run from recording a send that never happened.
- Tell a take whose patches landed but whose record could not be
  written apart from one that never ran.
- Close the tracking database when the status sync fails.
- Edit the "b4 ty -g" review in the tree it was pointed at.
- Trim the commit messages and the cover letter.
- Link to v1: https://patch.msgid.link/20260731-work-b4-editor-branch-guard-v1-0-de68a7c8e4cb@kernel.org

---
Christian Brauner (44):
      review-tui: mark all outgoing mail as read, not just review replies
      tests: cover the shared outgoing-seen helper
      review: close the messages database when auto-marking fails
      review: use the same busy timeout for both review databases
      review: drop the unused return value from set_flags_bulk()
      review: don't let archiving a series raise
      tests: cover an unwritable series archive
      review-tui: keep post-send bookkeeping out of the send error path
      tests: cover the thank-you send's post-send bookkeeping
      review-tui: say which way a take did not reach 'accepted'
      tests: cover the take statuses in the thank-and-archive chain
      review-tui: use the shared helper to delete a review branch
      ty: check reachability in the repository the commit landed in
      tests: cover the publish check using the repository it is given
      edit_in_editor: make the branch guard opt-in
      tests: cover the opt-in branch guard in edit_in_editor
      edit_in_editor: work in the tree the caller names
      tests: cover edit_in_editor working in the caller's tree
      ty: edit the thank-you review in the tree it was pointed at
      tests: cover the ty review editing in the named tree
      tui: route editor launches through one non-fatal helper
      tests: cover an editor failure leaving the review TUI standing
      review-tui: only put back a branch b4 checked out itself
      tests: cover the review TUI's branch-restore guard
      review-tui: put HEAD back where it was when it was not on a branch
      tests: cover the restore from a detached HEAD
      tests: pin the default branch in the queue-delivery fixture
      ty: an unknown remote tip is undetermined, not unpublished
      review-tui: keep post-send bookkeeping out of the review send error path
      tests: cover the review send's post-send bookkeeping
      review: close the tracking database when archiving fails
      review: clean up a review branch that cannot be finished
      tests: cover create_review_branch cleaning up a half-built branch
      review-tui: put the branch back after a revision upgrade
      tests: cover the revision upgrade's branch handling
      review-tui: restore the original branch however the tracking loop ends
      review-tui: do not let a failed tracking load skip the branch restore
      tests: cover the tracking TUI restoring the branch on the way out
      review-tui: close the tracking database when the status sync fails
      tests: cover the status sync closing its database
      review-tui: catch the exit a failed checkout reports itself with
      tests: cover a failed checkout leaving the tracking list standing
      review-tui: put the user back when the branch they are on is deleted
      tests: cover the branch delete leaving the worktree on a branch

 src/b4/__init__.py                 |  93 ++++-
 src/b4/bugs/_tui.py                |  37 +-
 src/b4/ez.py                       |  14 +-
 src/b4/review/_review.py           | 114 +++---
 src/b4/review/messages.py          |  13 +-
 src/b4/review_tui/_common.py       |  26 ++
 src/b4/review_tui/_entry.py        | 181 +++++----
 src/b4/review_tui/_lite_app.py     |  25 +-
 src/b4/review_tui/_review_app.py   | 137 ++++---
 src/b4/review_tui/_tracking_app.py | 321 +++++++++------
 src/b4/tui/__init__.py             |   3 +
 src/b4/tui/_common.py              |  27 ++
 src/b4/ty.py                       |  52 ++-
 src/tests/test___init__.py         | 148 +++++++
 src/tests/test_ez.py               |  16 +-
 src/tests/test_messages.py         |  87 ++--
 src/tests/test_review.py           | 113 ++++++
 src/tests/test_tui_review.py       | 238 ++++++++++-
 src/tests/test_tui_tracking.py     | 804 ++++++++++++++++++++++++++++++++++++-
 src/tests/test_ty.py               | 111 ++++-
 20 files changed, 2115 insertions(+), 445 deletions(-)
---
base-commit: af86560d1c2fb7476e2a9d33925a6eaf0292100a
change-id: 20260731-work-b4-editor-branch-guard-ab9435cf9a50

