Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D183A435A96
	for <tools@linux.kernel.org>; Tue, 21 Jul 2026 20:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784665272; cv=none; b=rkb6whTHQi0AJaQ05Id16rWcVNvKf0pqoR/w5MQzWI+50vY7TcVteg5/deOAyOurqZc+ZAQneYiyDZRBcYpwW698b4ugVI/XF6M0vUn1P3G4ghHnaaEt9AJu+3VZHaEfDXp1R1yWk4EqtEiaJK4YcioxREmtrSnZXangpvasvtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784665272; c=relaxed/simple;
	bh=VjIJCfxpeDmyE1QaFCBSHg5w9BiszYoOFoZ3XDDe+GQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=shCdmlR6q/QBWwGyKME2Qdg1O1mkdjezVzsz2Vp8ON9YOBUHrtz0knY5Yx9RISkR94jVXIiJ40Vs4z3tooQJIBiH+263nwkLPNX2oC4cjYN4/mLR9hff/aA6T8sC/rVmKhWFZStxX+6bjUEhmlnCfrtjmq7hV8f7THBBELwuDEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KqLRkAIB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KqLRkAIB"
Received: by smtp.kernel.org (Postfix)
	id C5B381F00A3D; Tue, 21 Jul 2026 20:21:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1B071F000E9;
	Tue, 21 Jul 2026 20:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784665271;
	bh=gaPSt80w51ddomogydO4lH8OitdzsxvyxIF5SbE4dXw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KqLRkAIBSikXHKdRf0uqK6aUAS+c7a6NuUlhYQhf+bBwdQWx1VsSmVQpiJCFVl7vi
	 wJPI0R8BuUwacd9smWfPkxe/vQMr9KLzCob/T+IZV7xzqfsi8KHTVRDzPL3CsIUdPm
	 wq/1SBDEY29j7a5iUiwEm3ABeNunJZx7EV+ebvro21mIW3hw0YSIrHgRkOvoT2sw9g
	 d0dDaG/UAI9W4ybHhH0ef5DZ07rlMMBWIh3kb9Rjft4BbGThHMIjRJagYPdStXjjKW
	 G6qTWkaUhp2+LcwchpitYIHDagPg/ToiiwTJH9R941mQAtM+HdUuJljaP6IUAATqW1
	 6kN08k3skSB5Q==
From: Christian Brauner <brauner@kernel.org>
Date: Tue, 21 Jul 2026 22:21:01 +0200
Subject: [PATCH b4 1/4] review: keep refreshing message counts after a
 series is applied
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-work-b4-accepted-unread-badge-v1-1-28581acc4988@kernel.org>
References: <20260721-work-b4-accepted-unread-badge-v1-0-28581acc4988@kernel.org>
In-Reply-To: <20260721-work-b4-accepted-unread-badge-v1-0-28581acc4988@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-4217c
X-Developer-Signature: v=1; a=openpgp-sha256; l=2317; i=brauner@kernel.org;
 h=from:subject:message-id; bh=VjIJCfxpeDmyE1QaFCBSHg5w9BiszYoOFoZ3XDDe+GQ=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTFX9k6M6l9xe5IpaImd09+OQ32xXw/HzsLvxV/1aXEm
 rwkK/5XRykLgxgXg6yYIotDu0m43HKeis1GmRowc1iZQIYwcHEKwERW2DAybLrGtaWm9fScY4+/
 6XhuiH717+tvIxZm0wnJhTUvjHmX9zAyPL+7rzU0v2KGwCsBBs4jX3kWV55UnJ8bzvU68kjVPXt
 efgA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Pressing 'u' fetches the full thread for every tracked series
regardless of status, but the message-count update at the end of
update_series_tracking() was skipped for accepted, thanked and snoozed
series. Once a series was applied, message_count stayed frozen at its
reviewing-days value, so the unread badge in the tracking TUI never
appeared again even though the new follow-up mail had just been
downloaded.

The skip list is a fossil from the old two-stage update flow, where
the separate update_message_counts() batch helper paid extra lore
round-trips per series and skipping inactive series was a real
saving. Now that counts are updated from the already-fetched thread
messages, the skip saves nothing. It only hides new mail. It was
also inconsistent: 'partial' (partially applied) series kept their
badge while fully applied ones lost it.

Drop the status filter. update_message_count_from_msgs() only bumps
message_count and leaves seen_message_count alone, so the badge
appears exactly when new mail arrives and still clears when the
thread is read.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/review/_review.py | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/src/b4/review/_review.py b/src/b4/review/_review.py
index 8c025ea..85aa815 100644
--- a/src/b4/review/_review.py
+++ b/src/b4/review/_review.py
@@ -2424,10 +2424,11 @@ def update_series_tracking(
             return result
 
     # Update message count and thread blob from the already-fetched
-    # thread messages.  This replaces the old separate Stage 2 call to
-    # update_message_counts(), avoiding duplicate lore lookups entirely.
-    skip_counts = frozenset(('archived', 'accepted', 'thanked', 'snoozed'))
-    if status not in skip_counts and thread_msgs and change_id:
+    # thread messages.  No status filtering here: the thread is already
+    # in hand, and the unread badge must keep working after a series
+    # moves past reviewing (accepted/thanked), or the maintainer never
+    # sees follow-up discussion on applied series.
+    if thread_msgs and change_id:
         try:
             conn = b4.review.tracking.get_db(identifier)
             b4.review.tracking.update_message_count_from_msgs(

-- 
2.53.0

