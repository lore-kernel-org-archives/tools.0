Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B63363C46
	for <tools@linux.kernel.org>; Tue, 23 Jun 2026 09:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782206832; cv=none; b=HavMEmkEomZrSOuISBuPteXdpsGyiuZefco9t/eoT5T0DFfJWlHejwgT2E++N5rgXTn3R9cfYJ8EdVT832VteYsOoeMLH43XMMvLQ0NSBjzsqlFN6RHIwwtMZKqvc4//YYTY+gp0ZJt78mHqqPi9V/zgwGZfU5qhdkPeQRJc0uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782206832; c=relaxed/simple;
	bh=B672KyZckSmSB0/e3KxrepKwehozJ7odJGm734ebxMQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AWvhJHqcHHwo46uDvdI+vg8WPcnvP9y+IEuLWmQJp9RxSLxJo1uP60HEK3puCoSaQLY26GKP442cTtJH1Zip56MJnVHMh8PPFzzAqw78k3gaH2hvMPvbuJ+iAiiSZF5+J0xZmhRGiW8a2ZIOp/p8AH52OWmy9mOnpyyD7mmgOBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MEPRSVHn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MEPRSVHn"
Received: by smtp.kernel.org (Postfix)
	id D13801F00A3A; Tue, 23 Jun 2026 09:27:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 072291F000E9;
	Tue, 23 Jun 2026 09:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782206830;
	bh=vzvbB7+7REeyrtMeKpLVFibc+ugERoiZKkgZC1pQJLQ=;
	h=From:Subject:Date:To:Cc;
	b=MEPRSVHnU+HWl08kBziyyOW3ULZyQs/9q/qIXjGf05BrLJqXYMtJgQX8recgtEcrD
	 VZI5zHdZakmhfInjXK7Kk0fqcf9jwPYTkZiqpnkev+mnQqff9PrfQ6Fv/4FNL8GJyl
	 mciXL6HSZOXuGjgsax82NibhQN3HExQuIgypH2MI574e1AA06VLWG79MopIf9opZ+I
	 1Lde9+SeF0ococeWEyniKy4v67T7OhvjAj8f4eNonHtMJUMS/nB8G9chrnDS8px3Aa
	 0l/BqdawnjV5gsKCnvAx+tGZ6V5MmV94UKSnfJLstBZoaDHpsAthRR6wfOBL1iiMRR
	 CwHYNoMAvfVPw==
From: Christian Brauner <brauner@kernel.org>
Subject: [PATCH b4 0/2] review-tui: mark and bulk-set state in the
 Patchwork browser
Date: Tue, 23 Jun 2026 11:27:04 +0200
Message-Id: <20260623-20260623-review-tui-pw-multiselect-v1-0-2470add1453c@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGhROmoC/z2NwQ6CMBBEf4Xs2U2wQkV/xXho6yproJJuKySEf
 7fVxNu8ycvMCkKBSeBcrRDozcIvn2G/q8D1xj8I+ZYZVK10rdUB/6HYNGNMjNOMYxoiCw3kIjq
 tWjq1XWfVEfLQFOjOy/fkAraB66+TZJ9ZL+vFskYIbTDe9aUajUQKsG0f2e0mcqMAAAA=
X-Change-ID: 20260623-20260623-review-tui-pw-multiselect-c625e9588b27
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-2c782
X-Developer-Signature: v=1; a=openpgp-sha256; l=1877; i=brauner@kernel.org;
 h=from:subject:message-id; bh=B672KyZckSmSB0/e3KxrepKwehozJ7odJGm734ebxMQ=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWRZBebu0GjUecG6M7CAN3rLk/bOX3s+c//+f/mP2F1Oi
 6K0ThHOjlIWBjEuBlkxRRaHdpNwueU8FZuNMjVg5rAygQxh4OIUgIksZGZk2HRZ0lLw02TvuS/u
 hAelBCzocvldIfZAfGfZsYzOfU2dzAz/rPZePfHo2rvt330Fbv6aO/X6rsmlf/7yv58a63xVpHZ
 aDAMA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

The Patchwork browser in the review TUI (b4 review -> p) could only set
the state on the single highlighted series: 's' opened the state picker
for whatever row the cursor was on. Triaging a batch -- say, marking a
dozen applied series as Accepted -- meant repeating the same pick once
per row.

Add a selection layer to the listing so one state change can cover many
series at once. Space marks or unmarks the highlighted series and steps
to the next row, 'a' marks or clears every row currently shown, and Esc
drops all marks; marked rows carry a leading '*' and the title shows an
"N selected" count. 's' then applies the chosen state to every marked
series in a single pass, and falls back to the highlighted row when
nothing is marked, so the existing single-series workflow is unchanged.

Marks are resolved against the full listing rather than the visible rows,
so they survive the limit and show-hidden toggles and still apply to
series scrolled out of the current filter; they are pruned to the series
that still exist after a refresh. The REST state changes already iterated
a flat list of patch ids, so the apply modal simply receives the union of
patch ids across the marked series plus a summary label -- no new network
machinery.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
Christian Brauner (2):
      review-tui: set patchwork state on multiple series at once
      review-tui: test patchwork multi-select and bulk state changes

 src/b4/review_tui/_modals.py |   7 +-
 src/b4/review_tui/_pw_app.py | 201 +++++++++++++++++++++++++++++------
 src/tests/test_tui_pw.py     | 245 ++++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 417 insertions(+), 36 deletions(-)
---
base-commit: e7e48f19f7a553e80dea9c8dd267887cb3a3cf09
change-id: 20260623-20260623-review-tui-pw-multiselect-c625e9588b27

