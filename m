Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4B2340416
	for <tools@linux.kernel.org>; Wed, 12 Aug 2026 21:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786571232; cv=none; b=uKumBvjLc2vpSPebI7t/uQEGBeH2IFOEN2tb1hYfaL8pEyR2ZJiQerMuCL7VYH3VnUFm9Br1gn3URGnepWaM/vaTL9oQZyjCK1KOgWT5qACKax5nGG/GG104MCgD8DE5Lrq3JPdyFgh1b8l26jOyjV5yR9qcUQx9mTfel4e2APY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786571232; c=relaxed/simple;
	bh=fSjTX2LnYqmLhFWRAi002sIvjCwMWndDH+0fc0z35S8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ft/3px64MDC1HYYYpLl0SSXU7w8na+q2CDcuSDfA8i8CTcrfBQ7vZiwxyFu/2D47D+TMcBbvsPeAD159vkzTkqRp5raW5r7aGzO4tVm/S5+VfQ+TCqQwZHpbEpwxuWlQJqgC9qMJlgATEtIIawL0re7SpCKYrrw0GLJGSNf4KRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XehXSjLV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XehXSjLV"
Received: by smtp.kernel.org (Postfix)
	id 4E77E1F00A3A; Wed, 12 Aug 2026 21:47:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77DA91F000E9;
	Wed, 12 Aug 2026 21:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786571231;
	bh=nTcYB2AJSjZXmJq3k39QJMJjK52JNfN1wU6AixudA54=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=XehXSjLVga38Cz/hQrgmLEdgG29+vc+Y2CCE2BZoWhEODm3Wd6IZQnEiFy6Z8xg/o
	 QPfG+K6cM/ZMpcvzww7iAYcfYBQodABIoU4oxWxnwE/5B2gdxSQA0SwKwa93seslH/
	 AhkSQAU5tslgc9nI8TY7KGka26lQIedrS1hJVqn/CnkuYw0QjdssFBrG9K3IGA4Ftu
	 zE0uDPOT6pGHsX6rMorep4scTICpBDd2LY3Pv5/Ouza6MImBMGMBgipBTni/dP7ziG
	 HwP7yGb39jXI4rY9OEY/V5NmkpScdms7Y1LR5VXZqBjdcCi06u594hUQagzYp8gnnl
	 MaUbZv/O/gL3Q==
From: Christian Brauner <brauner@kernel.org>
Date: Wed, 12 Aug 2026 23:46:43 +0200
Subject: [PATCH RFC v2 02/25] review: do not clear fields a re-adding
 caller does not know
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-work-b4-multiver-rows-v2-2-305d53cd723a@kernel.org>
References: <20260812-work-b4-multiver-rows-v2-0-305d53cd723a@kernel.org>
In-Reply-To: <20260812-work-b4-multiver-rows-v2-0-305d53cd723a@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.17-dev-362b8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2344; i=brauner@kernel.org;
 h=from:subject:message-id; bh=fSjTX2LnYqmLhFWRAi002sIvjCwMWndDH+0fc0z35S8=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTVvLz56t3y+qI8vQmTzuzTuDDjrqr9tAm3NDXkl19j2
 iN5Ivz18Y5SFgYxLgZZMUUWh3aTcLnlPBWbjTI1YOawMoEMYeDiFICJJHMxMjyY9v1Blfbj2/fX
 +ZoH8HvM9K+Y4ZN/8FxtvbZYQ9nnBglGhrUmvxYeqfnzK93UXOvTmViZTAbj4OikN7MEdPkF0u8
 u4wMA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

add_series_to_db()'s UPSERT arm writes pw_series_id and fingerprint
straight from the excluded row, so every re-add clears whatever the
caller did not happen to know.

The callers do not all know both.  The Patchwork tracker re-adds a series
to attach its pw id and has no fingerprint.  rescan_branches() replays a
branch and has neither.  A CLI re-track has the fingerprint and no pw id.
Each one dropped what the others had recorded, leaving a series that no
longer matched by content, or one that lost its Patchwork link.

Passing None means "not known here", not "clear it".  Use COALESCE.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/review/tracking.py | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/src/b4/review/tracking.py b/src/b4/review/tracking.py
index a0c4ca4f..52b9a897 100644
--- a/src/b4/review/tracking.py
+++ b/src/b4/review/tracking.py
@@ -449,7 +449,15 @@ def add_series_to_db(
     added_at: Optional[str] = None,
     is_rethreaded: bool = False,
 ) -> int:
-    """Add a series to the tracking database. Returns the track_id."""
+    """Add a series to the tracking database. Returns the track_id.
+
+    On conflict the identity fields converge instead of overwriting: a
+    caller that does not know the Patchwork id or the fingerprint leaves
+    an existing one in place.  Re-adds come from callers that never
+    learned those fields -- the Patchwork tracker attaching its id,
+    rescan_branches replaying a branch -- and each used to wipe whatever
+    the others had recorded.
+    """
     if added_at is None:
         added_at = datetime.datetime.now(datetime.timezone.utc).isoformat()
     cursor = conn.execute(
@@ -466,8 +474,8 @@ def add_series_to_db(
             added_at = COALESCE(series.added_at, excluded.added_at),
             message_id = excluded.message_id,
             num_patches = excluded.num_patches,
-            pw_series_id = excluded.pw_series_id,
-            fingerprint = excluded.fingerprint,
+            pw_series_id = COALESCE(excluded.pw_series_id, series.pw_series_id),
+            fingerprint = COALESCE(excluded.fingerprint, series.fingerprint),
             is_rethreaded = excluded.is_rethreaded
         RETURNING track_id
     """,

-- 
2.53.0

