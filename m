Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953B9246BD5
	for <tools@linux.kernel.org>; Fri, 17 Jul 2026 22:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784327900; cv=none; b=jW6TweyKrO734YRdibSu0ynFPxj4kgHwp7Or6oehwMRhOqxk8dslv/2agPtvvCXy6LQAjNhtSHRBCmkQmg8gU0ZbtgT/3PaUz6ZGjXSgxDya8p3R/fJZ5ZRc7uwnbII9Eo07ac/4mcy0hc0cpPjVEJP3hu9Q4aj9KUANrrQk3c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784327900; c=relaxed/simple;
	bh=j8t4CnwKfUlvG1l3Ak5JVosrnHd4xijaYFoxyOHRDdM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eD1SFdjY395DXQRaU4Eyw4HgAq8pcA8vd9EIstdpaKY+fxcqP7QwgbZKTf7mNp0sEmo02UwN25W0PsY9Kw9OQH99okE88n+BO2fmeb7hrnXLAGYrm1BL1fvAAluNr7OH8fckNo3k6FivQui5S932QGQ7BKhVjcj6oGNuNFM+DHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AG4Ry33K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AG4Ry33K"
Received: by smtp.kernel.org (Postfix)
	id 4D3011F00A3A; Fri, 17 Jul 2026 22:38:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 496DC1F000E9;
	Fri, 17 Jul 2026 22:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784327899;
	bh=QIxYIEPlr4uLdKKvy0uJyq2lnWpjXmpDmgh2IfWcqEs=;
	h=From:Subject:Date:To:Cc;
	b=AG4Ry33K5DgV2JqE9ft3aYWeLmvzv3FkLe+pqTS1+23KyVOLCnShTSnGFNm3wKb49
	 aw6ugWejUuXvC7fyTKiwjJi5FNpbE5e6zyhqxnPDNiOpzWD7EZHUho9eApEWI9sD2m
	 jhytPDpGRm6MYgU/mPSt9fuDMZRTAc0Dv5rTQCVr5kQRAdc612qy/Jd0bviqkqn1FO
	 sdnAH56y5lNdZe03PtKgcxW1kcVroHhZ3d0Xtq0J6Vv9+dExwPx36coMp6E4qwBVt1
	 5zCU9cBGS0gPD5I7HkOup7Ujkk+cgFEQ2mhOatf2VrML2JbWUoCq5MECEIHSCliyhW
	 FYBHbuDx2aPKg==
From: Christian Brauner <brauner@kernel.org>
Subject: [PATCH RFC 00/11] review: track and browse every version of a
 tracked series
Date: Sat, 18 Jul 2026 00:37:36 +0200
Message-Id: <20260718-work-b4-multiver-rows-v1-0-3c539d2a3095@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALCuWmoC/yWMQQ6CMBBFr0Jm7SRtVVC3Jh7ArXHR4iBVac1MA
 RPC3S26fC//vwmE2JPAoZiAafDiY8igVwXUrQ13Qn/LDEaZUlV6h2PkJ7oNdv0r+YEYOY6CpVq
 bxlWa9lsN+ftmavzn173A+XSE619K7x5Up6W4zJwVQsc21O2iOiuJGOb5C65C5d6XAAAA
X-Change-ID: 20260718-work-b4-multiver-rows-6032fb71e951
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-4217c
X-Developer-Signature: v=1; a=openpgp-sha256; l=3648; i=brauner@kernel.org;
 h=from:subject:message-id; bh=j8t4CnwKfUlvG1l3Ak5JVosrnHd4xijaYFoxyOHRDdM=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWRFrbv5Qdkw3741bNNUe8WlOTL1CQetHZYZar5RX+bOu
 tc6YSVfRykLgxgXg6yYIotDu0m43HKeis1GmRowc1iZQIYwcHEKwES2rWX4n1l0c+lzvpg8wZrv
 wXsfJdn9lXPlCuLnv2lbdXjSQdsTPgz/g+7mcK5otXrz801uSsL7gP/c59b25kW0fD778nfE1fV
 FzAA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

The review TUI binds all mail visibility to the revision a series is
tracked at: 'e' opens only the tracked thread, unread badges exist
only on the series row, and u/U updates poll only the tracked
revision.  Earlier versions of a series -- and the discussion that
shaped it -- are invisible even though the revisions catalog knows
they exist.

Make every known version of a tracked series a first-class citizen of
the mail-tracking machinery:

- The revisions catalog grows per-revision message counts (schema
  v11).  Reads stitch the series row over the catalog so the tracked
  revision's live counts win while archived upgrade leftovers never
  shadow anything.

- u/U updates poll every cataloged revision for new mail using the
  same incremental thread queries used elsewhere: zero database
  writes when a thread is quiet, a full refetch plus git-blob caching
  when something new arrived.  Rethreaded revisions sum their
  per-patch threads.

- A new "Find older revisions" action runs the b4 am/mbox backward
  search (change-id query when the cover carries one, subject+sender
  otherwise) with an explicit wantvers covering every previous
  version, records what it finds, and polls the new entries
  immediately so they arrive with counts and cached threads.  A
  retitled series without a change-id still needs manual linking --
  the same limitation b4 am -vN has.

- The tracker list gains expandable per-version rows: 'x' unfolds a
  series into child rows (tracked revision starred) with their own
  unread badges and activity dates, 'X' toggles all series at once.
  Enter/'e' on a child opens that version's thread with
  revision-correct seen syncing, and 'd' range-diffs it against the
  tracked revision directly.  Expansion and cursor state survive the
  periodic DB reloads and limit filtering.

Message-level read state was already keyed by message-id alone, so
Seen/Flagged/Answered flags apply across versions unchanged; this
series adds the missing count/badge and navigation layers on top.

Also included is a standalone fix for 'e' on rethreaded series, which
never passed is_rethreaded and thus fetched a single patch's thread
instead of reassembling the series from its per-patch message-ids.

The series is bisectable, with implementation and tests split
throughout.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
Christian Brauner (11):
      review-tui: fix rethreaded series thread viewing
      review: track message counts for all revisions of a series
      review: test per-revision message tracking
      review-tui: poll every revision on u/U updates
      review-tui: guarantee the tracked revision in revision lists
      review: add backward discovery of older series revisions
      review-tui: add a "Find older revisions" action
      review: test backward revision discovery
      review-tui: extract the Msgs column renderer from TrackedSeriesItem
      review-tui: expand tracked series into per-version rows
      review-tui: test per-version tracker rows

 src/b4/review/tracking.py          | 636 ++++++++++++++++++++++++----
 src/b4/review_tui/_lite_app.py     |   1 +
 src/b4/review_tui/_modals.py       |  27 ++
 src/b4/review_tui/_tracking_app.py | 464 ++++++++++++++++++---
 src/tests/test_review_tracking.py  | 823 +++++++++++++++++++++++++++++++++++++
 src/tests/test_tui_tracking.py     | 578 +++++++++++++++++++++++++-
 6 files changed, 2393 insertions(+), 136 deletions(-)
---
base-commit: 4217c3e5d3e1eb259626142fd71b91ec6d5e3d1e
change-id: 20260718-work-b4-multiver-rows-6032fb71e951

