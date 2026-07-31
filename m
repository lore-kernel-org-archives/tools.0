Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14D73B05AC
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 09:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785489689; cv=none; b=L5T++4IXSaDjKaf7Qn7e8WUjhF+8ynK/iJDq2NIS0SEE/ghGm5yE4UrD4SVygjE16j2dL++Yia1M+FdtrB3kAwSftpcCwR0OHWYOCrwVyQde5CFDoQTPw4FpYGngKPMPLSaxBfoAChCTVVbMwKeHi/dal2DTAEAaTyeYycawtjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785489689; c=relaxed/simple;
	bh=0+optHxrO5PdizQKImz/oeX+68AErv9zFj2pvsLhYzw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XR3wIdvHBQs9aXKb00MWxKy39YG3V7NHuPITxXcmRcXCBQR7mu22SzbGKWN1YvkI8phgAdcY2mnsGYyogyQ/FXvHQvU7jmpqsAJLlcqAL39H5SiEeyxUpClNoQiwF+ldKxygaLpPzEE282UwF2dkP9vo778wNT2/orrcUBVkwjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mERv+mBG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mERv+mBG"
Received: by smtp.kernel.org (Postfix)
	id ED0CB1F00A3A; Fri, 31 Jul 2026 09:21:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A7C31F000E9;
	Fri, 31 Jul 2026 09:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785489687;
	bh=Xh6Uw2Nt8ZeJGK4ZJDHR/dT8aXrXsan/Habt/GWO6KQ=;
	h=From:Subject:Date:To:Cc;
	b=mERv+mBG/0LP8nzNDa+9S94w0Qcbo6EIfKgZ6h1fwBvgXyFaQR/pYpx6DWTjOz8EP
	 KmwSgxlbqgOFE7lbpCzHqaXcb7h2HHcGaFfJhistWJzQ989LclziChqHoFN10Xz3N5
	 5Pvc3Gt1Xk0iZB/rKGKQDcwldcMIfSw5Bya2HK/JNFfRB1cTUQ1JpWL7W024CR7eGL
	 nxtvQSzhqc2C18Q/cUGv3lz45P+lSHoUrwNmgbpefEmQRD9Hv8XZuS28aoD5/HEHfy
	 r73A2QZMYNlXpXim6Y5JTcm35n2wCRdOuCQmZ+UDyiPW4v96fii22iRXFIeAWwV0o4
	 ZhH6Fg0GHjtXQ==
From: Christian Brauner <brauner@kernel.org>
Subject: [PATCH b4 00/27] Stop the editor branch guard from eating review
 replies
Date: Fri, 31 Jul 2026 11:20:59 +0200
Message-Id: <20260731-work-b4-editor-branch-guard-v1-0-de68a7c8e4cb@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPtobGoC/y3Myw6CMBCF4Vchs3Yil6LBVzEupu0A1XDJTKsmh
 HcX1OX5c/ItoCyBFS7ZAsLPoGEat1EcMnA9jR1j8NuGMi9P+bkq8DXJA61B9iFOglZodD12icQ
 j2cZUtWsbqnPYhFm4De+vfgVr4PZrmuydXdzZ/WVJ+e/sKc0ahWk4DqSRBdb1AwsRsOOlAAAA
X-Change-ID: 20260731-work-b4-editor-branch-guard-ab9435cf9a50
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=5938; i=brauner@kernel.org;
 h=from:subject:message-id; bh=0+optHxrO5PdizQKImz/oeX+68AErv9zFj2pvsLhYzw=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlZIrmXRUKqtJczSj3NX7yfYM8voN5lyNCPi1tmSjRe
 S0mcolkRykLgxgXg6yYIotDu0m43HKeis1GmRowc1iZQIYwcHEKwEWcGBnWhc/Z5xlam9yaYJRg
 8PnBtU+z7654zlrd+zBk3bR+RY5LjAx7O+60r3Q8s7X+qP+ulQWB5+Ncyr4+jtn22Zg3U1MrpZ0
 bAA==
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Reported from a live "b4 review tui" session. The reply editor sat open
across a branch switch made in the same worktree from another terminal,
and quitting the editor dumped the reply into /tmp and took the whole
TUI down with a RuntimeError.

Digging into that turned up four separate problems, one patch each.

1) The branch guard in edit_in_editor() was written for "b4 prep
   --edit-cover", which stores the edited text in the tracking commit of
   whatever branch HEAD points at. It lives in the shared helper and
   reads HEAD unconditionally, so it fires for callers that write to an
   explicit ref too. The review TUI stores replies with
   save_tracking_ref() on the review branch and reads the patches by
   SHA, so HEAD is not involved anywhere in the flow. For those callers
   the guard only destroys work. It is opt-in now and only the three
   b4 prep callers take it.

2) The guard read HEAD, and the editor scratch file was created, in
   whatever tree the process happened to be sitting in rather than the
   one the edit belongs to. For the review TUI those are the same today,
   so that patch removes an assumption rather than fixing a bug -- but
   it is exactly the assumption the rest of that app is written to
   avoid, and naming the tree moves the core.editor lookup to it as
   well. edit_in_editor() takes that tree as an argument now.

3) An exception from the editor inside "with app.suspend()" unwinds out
   of the key handler and tears the app down, losing every other unsaved
   change in the session. Four of the eight TUI call sites had no
   handler at all and the rest had grown their own. They share one
   helper now that notifies and returns None.

4) The review TUI records the branch to restore when it starts and
   checks it back out when it exits, even when the user is the one who
   moved HEAD. That can happen from another terminal sharing the
   worktree. Both restore paths confirm the checkout was b4's own first.

The patches before those are follow-up fixes to review-tracker code that
went in last round. Outgoing mail is marked read on every send path and
not just on review replies, the messages database is closed and
configured like the tracking one next to it, archiving a series reports
a write failure instead of raising it into the send path that called it,
and the publish check for a queued thank-you runs in the repository the
commit was applied in rather than in the process cwd.

The last three carry the same reasoning onto the review send path, which
had been left with the shape the thank-you path just lost. Bookkeeping
there gets its own error handler, a tracking write that does not land is
reported instead of dropped and the tracking database is closed when
archiving fails.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
Christian Brauner (27):
      review-tui: mark all outgoing mail as read, not just review replies
      tests: cover the shared outgoing-seen helper
      review: close the messages database when auto-marking fails
      review: use the same busy timeout for both review databases
      review: drop the unused return value from set_flags_bulk()
      review: don't let archiving a series raise
      tests: cover an unwritable series archive
      review-tui: keep post-send bookkeeping out of the send error path
      tests: cover the thank-you send's post-send bookkeeping
      review-tui: say when a take didn't complete
      tests: cover the unaccepted take in the thank-and-archive chain
      review-tui: use the shared helper to delete a review branch
      ty: check reachability in the repository the commit landed in
      tests: cover the publish check using the repository it is given
      edit_in_editor: make the branch guard opt-in
      tests: cover the opt-in branch guard in edit_in_editor
      edit_in_editor: work in the tree the caller names
      tests: cover edit_in_editor working in the caller's tree
      tui: route editor launches through one non-fatal helper
      tests: cover an editor failure leaving the review TUI standing
      review-tui: only put back a branch b4 checked out itself
      tests: cover the review TUI's branch-restore guard
      tests: pin the default branch in the queue-delivery fixture
      ty: an unknown remote tip is undetermined, not unpublished
      review-tui: keep post-send bookkeeping out of the review send error path
      tests: cover the review send's post-send bookkeeping
      review: close the tracking database when archiving fails

 src/b4/__init__.py                 |  76 ++++++++++++-----
 src/b4/bugs/_tui.py                |  37 +++------
 src/b4/ez.py                       |  14 +++-
 src/b4/review/_review.py           |  80 +++++++++++-------
 src/b4/review/messages.py          |  13 ++-
 src/b4/review_tui/_common.py       |  26 ++++++
 src/b4/review_tui/_entry.py        |  10 ++-
 src/b4/review_tui/_lite_app.py     |  25 +++---
 src/b4/review_tui/_review_app.py   | 122 ++++++++++++++++------------
 src/b4/review_tui/_tracking_app.py |  79 +++++++++---------
 src/b4/tui/__init__.py             |   3 +
 src/b4/tui/_common.py              |  27 +++++++
 src/b4/ty.py                       |  48 ++++++++---
 src/tests/test___init__.py         | 118 +++++++++++++++++++++++++++
 src/tests/test_ez.py               |  16 +++-
 src/tests/test_messages.py         |  87 ++++++++++----------
 src/tests/test_review.py           |  21 +++++
 src/tests/test_tui_review.py       | 162 ++++++++++++++++++++++++++++++++++++-
 src/tests/test_tui_tracking.py     |  85 ++++++++++++++++++-
 src/tests/test_ty.py               |  66 ++++++++++++---
 20 files changed, 850 insertions(+), 265 deletions(-)
---
base-commit: af86560d1c2fb7476e2a9d33925a6eaf0292100a
change-id: 20260731-work-b4-editor-branch-guard-ab9435cf9a50

