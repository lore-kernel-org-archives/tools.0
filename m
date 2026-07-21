Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC101400DE1
	for <tools@linux.kernel.org>; Tue, 21 Jul 2026 20:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784665271; cv=none; b=lPGoELy6DZ/e8lHYl5dYSBgyDK3HaLC28Q4pnHIzRipRQ/4gqGXq5eOiE+XkQUeJquu6dRN0RMdqCFl71vsixN/edlG68w+0BMYbuJv/9dtDDiBZSjDqWJ+uU0+8gPXklI4Js2AdE3qxqyWEanVwp+J5Q5l70776io4tyDcJh/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784665271; c=relaxed/simple;
	bh=QJde8/Q8WiMYzFKrDh1UrNsSTRA8SXaVN48WMp3z6RI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mVG0NgYO8cL5WEjAbHmBz2uQfSP881dN6jycty1IlkmKRGlSPaRPH4CXwBiyrcfJt/Qmd2nn7gbz+KkTtpi7ETGs/Q65A5xIjZCSAYOQnIAsQJqaQ4TF8actTsXMfyR7r9HTINrd3MII4y6MH4UseZJHo1rno5GpHoGIu8Ps6KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B6/hPegt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B6/hPegt"
Received: by smtp.kernel.org (Postfix)
	id 900CB1F00A3D; Tue, 21 Jul 2026 20:21:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA8F51F000E9;
	Tue, 21 Jul 2026 20:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784665270;
	bh=TXrrJVrygBnUUzlhU6twIg/rLmvITLJgo3mKkC7/s5Y=;
	h=From:Subject:Date:To:Cc;
	b=B6/hPegtEiPFUzRCa9CI2Lg6u9cC+gewPv7WprmYdHutJVhHWpi2Kn/4FihF6tilO
	 ZeKLh/ilu02r2YZ6fKgJvSCNbIWM0lqvkDrs1JNRjZo7TDNx6QmubemG8R31hnqL+B
	 aYmJdf/7YGZr5yzmpDnJpkSTWqlg7TWDxZqmIaookA1sx3quqFnOELSHlW5E41lwSE
	 R+w/vzOd8jA3YdpENfHsjXLb9gvQ94vOv/2hgMKksemRYXzclyA09fTdcec8cf6EJf
	 XgsxohTZfqSDirDHzsXHYjv+Xu2f9Tt4txGqis3dLZ4EBkIWUutiMWN7PUXqi92tQp
	 QjyqwOU3c/2aw==
From: Christian Brauner <brauner@kernel.org>
Subject: [PATCH b4 0/4] review: keep the unread badge alive for applied
 series
Date: Tue, 21 Jul 2026 22:21:00 +0200
Message-Id: <20260721-work-b4-accepted-unread-badge-v1-0-28581acc4988@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKzUX2oC/yWM0QrCMAwAf2Xk2cBWOwV/RXxI2uiq2I2kU2Hs3
 +308Y7jFjDRJAanZgGVV7I05grdroEwUL4JplgZXOsO7dF1+B71geyRQpCpSMQ5q1BEplhjCux
 47/veC0N9TCrX9Pn9z8AeLn9nM98llG28VUwmyEo5DJt6khVRWNcvVNTQV54AAAA=
X-Change-ID: 20260721-work-b4-accepted-unread-badge-acb2b34554eb
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-4217c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1262; i=brauner@kernel.org;
 h=from:subject:message-id; bh=QJde8/Q8WiMYzFKrDh1UrNsSTRA8SXaVN48WMp3z6RI=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTFX9m6NSs5oN1hV0fkqXX2pkIRGhb1yZsb278EtKelJ
 z92DrrVUcrCIMbFICumyOLQbhIut5ynYrNRpgbMHFYmkCEMXJwCMBGeCEaGhTdeJe+8+fXhrujl
 lg/urI+4rLSe8wDronk9vpd94/gi7jIy/KurnNfInbtPsK23Wtj17py/24uveoSFcfvaR6wVfRr
 EAQA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Pressing 'u' on a tracked series fetches the whole thread no matter
its status, but update_series_tracking() refused to refresh
message_count for accepted/thanked/snoozed series. Since the unread
badge is message_count - seen_message_count, new follow-up mail on an
applied series never showed up in the tracking TUI.

The status filter predates folding the count update into the main
update loop, back when each count check cost extra lore round-trips
per series. Today the thread is already in hand, so the filter only
hides mail.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
Christian Brauner (4):
      review: keep refreshing message counts after a series is applied
      review: test the applied-series message-count refresh
      review: drop tests for the batch message-count updater
      review: drop the unused batch message-count updater

 src/b4/review/_review.py          |   9 +-
 src/b4/review/tracking.py         | 209 -------------------
 src/tests/test_review_tracking.py | 417 ++++++++------------------------------
 3 files changed, 86 insertions(+), 549 deletions(-)
---
base-commit: 4217c3e5d3e1eb259626142fd71b91ec6d5e3d1e
change-id: 20260721-work-b4-accepted-unread-badge-acb2b34554eb

