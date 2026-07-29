Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FBC3CF208
	for <tools@linux.kernel.org>; Wed, 29 Jul 2026 08:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785315510; cv=none; b=DrFen3xZIJoeJSJ+RZSPGlgOumBVjQ6T9ERcYJb3QNfmY8GedT4VLoGBM8JGcBNA2IF8TOjncE+FcYQ6rqbTMd2DE63mF3keOV18ZpW5tT4ZkDnFyPDoDuJr5Ize54ccaKBylW1W14WJOwi29PYEtkpIX7R+nnPdS7+b/ALvxCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785315510; c=relaxed/simple;
	bh=NFDmKWYpKLdx5whHiUW5A0sZu6b5mycNipK+S9Q4hdU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=e2x4HL/stctCV5unrIhFIU3ivAaiuyTQgj2HYAxGpn65/4OXzwirPw5escJ98XCC0MDhM9v74TLrLaUPfJlzGOKlRJLjR/7F5f92lAlF16GHvTqc26gkhpaWNq+4xMYWAxCOgz1eB/WIdHjddFjpuT3Ps89MnpPOowZWfrjWAw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fBO24aDo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fBO24aDo"
Received: by smtp.kernel.org (Postfix)
	id 5C95C1F00A3D; Wed, 29 Jul 2026 08:58:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AAEE1F00A3A;
	Wed, 29 Jul 2026 08:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785315509;
	bh=DI2X0A9n2lXs0EGjoV5rWmQBaj1Sl1Q6HwvgzFtSVyU=;
	h=From:Subject:Date:To:Cc;
	b=fBO24aDoHCUn6vICB2Z9lS14KGKu/iq6cVE+B9riA4/Hqhh/wgjfXqDXd6lstgO3H
	 vnexAAo+lXrXwoDSEHpVgJ9SE6TKl6Cjqb/+QY4myO2rFXAaLrwywgnjo8GsruhAWB
	 Qy5HoBQowGgyQ7JqBt7xff/VsGKWiES4e3Ltq3xxyEvG0AVJ2S2NNo7lRtOVwrT4oX
	 ij3/nWS4DJnVlBc7jjUr2B1TGqYbHEkPlcCgBRa3fc9kq3nob4VaPDHOn/bjHIaAsB
	 C3MDbNTUk0pZo4Rjv7CiHTWHnHjxTPC0IYy1SMwzKUNZYI6j3mS31RRTjQeV3Lu6JM
	 DGKXKfqWVfI4w==
From: Christian Brauner <brauner@kernel.org>
Subject: [PATCH b4 0/2] b4 review: cover-letter titling on the update path
Date: Wed, 29 Jul 2026 10:58:16 +0200
Message-Id: <20260729-work-b4-cover-subject-v1-0-718507ed317b@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKjAaWoC/y2MQQ7CMAwEv1L5jEUIFVX4CuohDqY1iAQ5pSBV/
 TsJcJzR7C6QWYUzHJsFlGfJkmKB3aaBMPo4MMq5MFhjD6azDl9Jb0gthjSzYn7SlcOELnhDgff
 UeQdl+1C+yPv7ewJqof+5f14Pa0U+M5L6GMaqksogcXv3eWKFdf0AVXOEqJ0AAAA=
X-Change-ID: 20260729-work-b4-cover-subject-9ca0bce3b7a9
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-99fe1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1708; i=brauner@kernel.org;
 h=from:subject:message-id; bh=NFDmKWYpKLdx5whHiUW5A0sZu6b5mycNipK+S9Q4hdU=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWRlHtjSpijoryfZauFsZLhitfSRf/OmyM9eoPP4TIfYy
 9n6ugfjOkpZGMS4GGTFFFkc2k3C5ZbzVGw2ytSAmcPKBDKEgYtTACZS9ouR4cQeZ8u+fz7BnB89
 YhK7eKV858ldzlCLebhRe2OaefSr44wMk/9kbd9178rh5RbnNfY62jnrLVBjaj3GknZfiiO96uF
 udgA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Commit 83551c65f68d ("review: identify discovered revisions by their
cover letter") fixed how discovered revisions are identified, but the
copy of the recording loop in update_series_tracking() -- what
pressing 'u' in the tracking TUI runs -- was left as is. Newly
discovered revisions were still identified by their first present
patch, so upgrading a series re-titled it after patch 1/N, and since
series.subject is only written on track or upgrade, the row kept that
title forever.

Patch 1 routes the update path through the shared helper, re-derives a
stale series title from the cover letter on update (never from the
first-patch fallback, which would mis-title coverless series), and
makes the upgrade dialog use the resolved series' own title instead of
the catalog's.

Patch 2 adds the missing coverage: integration tests driving real
messages through a real LoreMailbox, unit tests pinning
realign_series_subject() to its narrow contract, and TUI tests for the
upgrade dialog title.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
Christian Brauner (2):
      b4 review: identify updated revisions by their cover letter too
      b4 review: test cover-letter titling on the update path

 src/b4/review/_review.py           |  35 +++----
 src/b4/review/tracking.py          |  40 ++++++++
 src/b4/review_tui/_tracking_app.py |   9 ++
 src/tests/test_review_tracking.py  | 204 +++++++++++++++++++++++++++++++++++--
 src/tests/test_tui_tracking.py     | 106 +++++++++++++++++--
 5 files changed, 356 insertions(+), 38 deletions(-)
---
base-commit: 99fe195c0aa5a88be5033f87cad22bc32d27cbfe
change-id: 20260729-work-b4-cover-subject-9ca0bce3b7a9

