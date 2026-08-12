Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192D733985A
	for <tools@linux.kernel.org>; Wed, 12 Aug 2026 21:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786571230; cv=none; b=gKdsfIRcTo4qe8WuJHAuDfo47YAUqSZj64AeV+zJGAwT+friixv8YF6fDcm/0oAHAvEmBB6DnfKm6a9MA4Ksl3saa8bEfioLTdGSdr4f5mtVTvP38OwY+hCJP8SE3n81eHo1cz9BzinKtalaMNPA8fOSJ4p8gjYhJ1xNsyB98wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786571230; c=relaxed/simple;
	bh=9aQILppuXC7bJq+r/SBGmDJ27+oQuzohz610nw+hUuQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=V9pWIz0N3qJWGe6Bc0Y1TJfe7+ZdOdA8k+kMc+KIZuqkfUPYOcmU0/L+G/Q6uFXrKwT/5QJ+/9DnQSkcD+zzlzdTyxPp8WHDR3EOTXGlJVqK/ktxLVbs5wsB/Z9Ppo84A3vmKK5OHRQ3+VutvlXHv2zgu+YYBZCIHFEjTgx2B3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cz98CsXT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cz98CsXT"
Received: by smtp.kernel.org (Postfix)
	id D34B31F00A3A; Wed, 12 Aug 2026 21:47:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0CF41F000E9;
	Wed, 12 Aug 2026 21:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786571228;
	bh=ek5ARoDKj14KSV2hZOnAORHS/O2Ql/kFRA9huKNhehs=;
	h=From:Subject:Date:To:Cc;
	b=cz98CsXTqxNb2T8G/WovgMPsNv43Dj3zrU8xDZyxvDR2u1b/Xyn97lgcPkGnHnN65
	 Yu66lZ1cKbsKUHg89xlP9EzgnJyYvwuWrQ0Ye2/IU+SZPWEiNyJOGvFFSJx7ZqHLa1
	 cW4ESfz6X/E2ZKyvE4FpHFP1UOkPkg7tjTyCWA/XGD8C4WEhtVrfQOAgtAh9ojXKOG
	 +G/oiB5HzHzkQ9nK66e78X/0yI2D/yhkV8RWpSO/XUfN0moy38aFaCoi0xCy+3yR9e
	 lgQOZlt5mBGsflhVnjgsqQzfI0r5kmJUwIJLm3i+M7e/3VJuLPmJLuE17XUZN4g/KK
	 auxBjHL5uKw+g==
From: Christian Brauner <brauner@kernel.org>
Subject: [PATCH RFC v2 00/25] review: track and browse every version of a
 tracked series
Date: Wed, 12 Aug 2026 23:46:41 +0200
Message-Id: <20260812-work-b4-multiver-rows-v2-0-305d53cd723a@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WOTQ6CMBCFr2Jm7Zi2CIorExMP4NawaHGUqlAzh
 aIh3F2KB3D5/r68ATyxJQ+7xQBMwXrrmkmo5QLKSjc3QnuZNCihMrGRW+wdP9Csse6erQ3EyK7
 3mIlEXc1GUp5KmLYvpqt9z9wznI4HKH6m78ydyjYSY81oT2hYN2UVrVr7ljgGlfWt4898K8iZ8
 udBkCgwKdMkvyidiDzdP4gbeq4c36AYx/ELRlNLUusAAAA=
X-Change-ID: 20260718-work-b4-multiver-rows-6032fb71e951
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.17-dev-362b8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4420; i=brauner@kernel.org;
 h=from:subject:message-id; bh=9aQILppuXC7bJq+r/SBGmDJ27+oQuzohz610nw+hUuQ=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTVvLxZxR3f80es0WSptpicjY3uWrl3mXsdLY0iU6Zd4
 6yo5L3QUcrCIMbFICumyOLQbhIut5ynYrNRpgbMHFYmkCEMXJwCMBEBaYb/jpkLF7DMtOQ32dex
 YJJiC8vf9R43GtUn7GoLfy2yefr+Gwz/vV7N/rG0+vEpjeVC4eHcnEs35gQ1HTYzNIkVOGO54aE
 GMwA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

The review TUI binds all mail visibility to the revision a series is
tracked at. 'e' opens only the tracked thread, unread badges exist only
on the series row, and u/U updates poll only the tracked revision.
Earlier versions of a series are invisible.

Make every known version of a tracked series a first-class citizen of the
mail-tracking machinery.

The revisions catalog becomes the only home for per-revision
read state (schema v11).

Per-change_id state moves the other way, onto a new `changes` table
(schema v12). There is one b4/review/<change_id> branch, so its sha
should not be stored once per version and read back with an ORDER BY.
The catalog-sync and the backward-search live there too.

u/U updates poll every cataloged revision for new mail using the same
thread queries used elsewhere. Neither lore nor b4 really support
incremental updates though. Lore misses that functionality afaict.

A new "Find older revisions" action runs the b4 am/mbox backward search.
It uses the change-id query when the cover carries one and subject+sender
otherwise. It records what it finds and polls the new entries
immediately. A retitled series without a change-id still needs manual
linking. The same limitation b4 am -vN has.

The tracker list gains expandable per-version rows. 'x' unfolds a
series into child rows. The tracked revision is starred. 'X' toggles all
series at once. Enter or 'e' on a child opens that version's thread with
revision-correct. 'd' range-diffs it against the tracked revision
directly.

Message-level read state was already keyed by message-id alone. So
Seen/Flagged/Answered flags apply across versions unchanged. This series
adds the count, badge and navigation layers on top.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
Changes in v2:
- Redesign the whole approach.

---
Christian Brauner (25):
      review-tui: fix rethreaded series thread viewing
      review: do not clear fields a re-adding caller does not know
      review-tui: keep the rethread flag on an upgraded series row
      review: guard the tracking-commit amend on the worktree, not the checkout
      review-tui: recompute an evicted A·R·T cache entry
      review: test the prerequisite fixes
      review: serialize schema migrations against a concurrent opener
      review: test the migration serialization
      review: track message counts for all revisions of a series
      review: give per-change_id state its own table
      review: test per-revision message tracking
      review-tui: poll every revision on u/U updates
      review: test the per-revision poll sweep
      review-tui: resolve the tracked revision in revision lists
      review-tui: fall back when a cached thread blob has no series
      review-tui: test revision resolution and the range-diff fallback
      review: skip the catalog mirror when nothing moved
      review: match a stray posting by message-id
      review: add backward discovery of older series revisions
      review-tui: add a "Find older revisions" action
      review: test the catalog mirror, stray matching and backward discovery
      review-tui: extract the Msgs column renderer from TrackedSeriesItem
      review-tui: give the unseen badge a column of its own
      review-tui: expand tracked series into per-version rows
      review-tui: test per-version tracker rows

 docs/maintainer/review.rst         |   49 +
 src/b4/__init__.py                 |   60 +
 src/b4/review/_review.py           |  284 +-
 src/b4/review/tracking.py          | 2378 ++++++++++++++--
 src/b4/review_tui/_common.py       |  177 +-
 src/b4/review_tui/_lite_app.py     |    1 +
 src/b4/review_tui/_modals.py       |   15 +
 src/b4/review_tui/_review_app.py   |    2 +-
 src/b4/review_tui/_tracking_app.py | 1083 ++++++--
 src/tests/conftest.py              |   23 +
 src/tests/test___init__.py         |   62 +
 src/tests/test_review.py           |  822 ++++++
 src/tests/test_review_tracking.py  | 5256 +++++++++++++++++++++++++++++++++++-
 src/tests/test_tui_modals.py       |    1 +
 src/tests/test_tui_review.py       |  274 +-
 src/tests/test_tui_tracking.py     | 1983 +++++++++++++-
 16 files changed, 11911 insertions(+), 559 deletions(-)
---
base-commit: 362b87aa4d036884c36e4bfb9cdbdee626aba3bf
change-id: 20260718-work-b4-multiver-rows-6032fb71e951

