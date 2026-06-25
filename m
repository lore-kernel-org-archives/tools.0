Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440223CE481
	for <tools@linux.kernel.org>; Thu, 25 Jun 2026 12:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782389922; cv=none; b=U5o+dTTW73cgX0Z98qQyDZffweUOlax5ZxISPbqL1YAv9aKzK+lJFlVwCGdL86BXtJgIH7bgU70oD9iGHr7mILvi8STKbcnfvr6JFN435Lks65ZuzShHib0jkzEQIvK3jofIiJZFlQt6P9SNtFr21BXfuoLYXBz6zyhN6NarmBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782389922; c=relaxed/simple;
	bh=lPCTlS8LeYTG9llcU4m1y98/EQ1BOf4aexZYOMSU/LM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nkegpCn9RKTMKrNkg5bnNYXlTP45vGOtPhMhPwyBZqy3CB1hRPgJrrCmvqd4fkjjZphtqmd8KP+d8jsRKphH38nR7cB96VYPOLH0YJb1xcMtdQ1JKBxSdxDhdpp9iSdS91/O63dAHXB1XNl6fX2B3JcUjjG7IqQsj2WtlViPzCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TkL2WBQn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TkL2WBQn"
Received: by smtp.kernel.org (Postfix)
	id 088381F00A3A; Thu, 25 Jun 2026 12:18:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 311A01F000E9;
	Thu, 25 Jun 2026 12:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782389920;
	bh=mVS/5YcrpjmMJ5Ssk8ndE9ISisJJVvjwAySu2ozLjXw=;
	h=From:Subject:Date:To:Cc;
	b=TkL2WBQnOSTYBk6oPSXJWeftE7RRCoXB9v1geIV18Wiu9R+p30Nau1KEPDeZlB5o9
	 4d2VfOpgDRu3TPzx9Np4kDtmLN0PFA7b8cp5fEfFaKiWGx+En6bGcITqjkHlklm7xC
	 XzbXNjy0uPHW1SAr7C0kImmX7cAWmkyrtCqN0+s2iPBNazg/B4/2lBt3zLdHuzWpkI
	 nPEmarCz83G+ca31rz2zuWuSDq1wmEazJPnxAmCQJrGuN5IXr8rGET5xLj0mUBc0ju
	 spclrStNoWCdIhfFant/jYHB4EEi24rGzmGh29gjcIeNmdyCTSmwl2MYaz/1n2x68v
	 giRTzuwdEZKJw==
From: Christian Brauner <brauner@kernel.org>
Subject: [PATCH RFC 0/2] review-tui: add a "cherry-pick + merge" take
 method
Date: Thu, 25 Jun 2026 14:18:35 +0200
Message-Id: <20260625-20260625-review-tui-take-cherry-pick-merge-v1-0-8ba4809d048a@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJscPWoC/z2NzQrCMBCEX6Xs2YX+0CBeBR/Aa/GQpFuzlsayS
 f2h9N1NFLzNDN/MrBBImAIcihWEHhz47pOpdgVYp/2VkPvkoS5rVaq6xb/IND0xLoxRj4TWkcg
 bZ7YjTiSp2ex12yjTm2qwkAZnoYFf37MOzqcjXH5hWMyNbMw3GTM6EBrR3rocTTpEEti2D7Rx5
 l2sAAAA
X-Change-ID: 20260625-20260625-review-tui-take-cherry-pick-merge-38a536bdb1fc
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-d56bb
X-Developer-Signature: v=1; a=openpgp-sha256; l=2532; i=brauner@kernel.org;
 h=from:subject:message-id; bh=lPCTlS8LeYTG9llcU4m1y98/EQ1BOf4aexZYOMSU/LM=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTZysxfMlNC6G9N9Vbdhwf4++5YHi3JKrS6s1XKnzOvP
 2OrpMKljlIWBjEuBlkxRRaHdpNwueU8FZuNMjVg5rAygQxh4OIUgIlcNmFk2Dgld7VAwUb1rxHz
 XpY8+DT97pcDE5Y7XzYJ6X5Xe8ah+ysjQ9eJgnfuXEI+umYJn7t9Pq998vKr1607njZOiRbff/b
 +YQIA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

The review TUI's Take dialog can apply a series three ways: merge (a
cover-letter merge commit of the whole series), linear (git am onto the
target branch), or cherry-pick (pick a subset and git am it). It could
not do the combination a maintainer often wants: take a hand-picked
subset of a series *and* record it as a cover-letter merge commit -- the
equivalent of "b4 shazam -M -P".

That path was already half-wired. When some patches were marked skipped,
the "merge" method fell through to the patch picker and merged just the
non-skipped patches -- _do_take_merge already builds its mbox from a
cherry-pick selection. But with nothing pre-skipped there was no way to
ask for it: "merge" always took the whole series.

This series turns it into a first-class choice. A new method,
"cherry-pick + merge" (merge-pick), always opens the patch picker like
cherry-pick and then routes through the merge path like merge:

  - _on_take_confirmed always shows the picker for merge-pick;
  - _on_take_final dispatches it to _do_take_merge;
  - the apply self-test bases it at the series base-commit, like merge;
  - it is accepted as a b4.review-default-take-method value.

The picker's existing pre-deselection of skipped patches is reused, so
cherry-pick + merge over a series that has skips starts with those
patches deselected, like the other picker paths.

Patch 1 adds the method and updates the docs; patch 2 extends
TestMergeTakeSkipRouting to cover the new routing -- the picker always
opens, the chosen method survives the picker, and the final dispatch
lands on _do_take_merge rather than git am.

ci.sh checkers (ruff format/check, ty) are clean on the changed sources,
and the tui-tracking, tui-modals, tui-review, and three-way-merge suites
pass (213 tests).

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
Christian Brauner (2):
      review-tui: add cherry-pick+merge take method
      review-tui: test the cherry-pick+merge take method

 docs/config.rst                    |  5 +--
 docs/releases.rst                  | 10 ++++++
 docs/reviewer/getting-started.rst  |  6 ++--
 src/b4/review_tui/_modals.py       |  7 ++--
 src/b4/review_tui/_tracking_app.py | 26 ++++++++-------
 src/tests/test_tui_tracking.py     | 66 ++++++++++++++++++++++++++++++++++++++
 6 files changed, 102 insertions(+), 18 deletions(-)
---
base-commit: 0a1954d329ab57f7aab40743fad7dc6e3c45d35d
change-id: 20260625-20260625-review-tui-take-cherry-pick-merge-38a536bdb1fc

