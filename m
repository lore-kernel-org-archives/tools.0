Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EC64052DC
	for <tools@linux.kernel.org>; Wed, 12 Aug 2026 21:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786571261; cv=none; b=tMKH222U9M+KyvGxDJqz9xhYh0PYgSFR60CRSzx7iboUDnx0a2beQCT0qzcDM5uos8JQxE95+gQOEsNmJJ82fx/E8Jowow6J4qBLWPdfJI/n1M5Y0x7Yrc1bKxuVRz/T+PY6o/QkTppKgX09fBCPVjerZkB4kRndH5iA+rmbpGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786571261; c=relaxed/simple;
	bh=CSAkMXBQ0uNKKe0EZ5SjHXL5wF8tYw6qcLWuCHC3slY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q3jjeUKsIdtMxd72rO0APrlaHYaLmiP5s+fzGSYNG8A55O3NHSsA6wcUNlil6W1CKZ4XWJATl4ivBfuEBxAzXgFEJNTiBCUwuP7EXg14A1dMKGnt0GlkxA12y+Yx0COrY+Im9uGz6P00G/SkT4BzfFZffKcrG2uujGzvRUC5cUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O7CYcAUs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O7CYcAUs"
Received: by smtp.kernel.org (Postfix)
	id 30EE01F00A3F; Wed, 12 Aug 2026 21:47:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52C101F000E9;
	Wed, 12 Aug 2026 21:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786571260;
	bh=MbKA7Q/k6B6G2HB1mGy2/Bwisw3QDAwV/m3SouWbyAg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=O7CYcAUsb/gWPWVNGx3VVwFMnRZXEIpNpSHzco/LUBoNaL1MsE+X5R1NLhpjSBwC/
	 gK6PJcFXyoU4YK+Ymlo9FcX+7ZusPrH8WpASYQQbMBTR4A1K38lEyAcKWF3gsCiUw5
	 lpE6WkE/gIdqHS8gqolIj7Qnb3iU1BcTqA2Puv7/AL0T8d1xjAzT8bHQB1KC8krEak
	 eRhmR3bcs8Jw1hAcM6gwbpghrK6hgi28pUu5guIyRZEG5ccyjI3IVC1UHSqjlmHYg8
	 k/K2pxpOZreP5pn27P07lpk2VkXvmfPU6b1fUaZtdhJ1EClKzyyMfJJ4Efni73oWm2
	 STCsqj6DuF+sA==
From: Christian Brauner <brauner@kernel.org>
Date: Wed, 12 Aug 2026 23:47:04 +0200
Subject: [PATCH RFC v2 23/25] review-tui: give the unseen badge a column of
 its own
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260812-work-b4-multiver-rows-v2-23-305d53cd723a@kernel.org>
References: <20260812-work-b4-multiver-rows-v2-0-305d53cd723a@kernel.org>
In-Reply-To: <20260812-work-b4-multiver-rows-v2-0-305d53cd723a@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.17-dev-362b8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2357; i=brauner@kernel.org;
 h=from:subject:message-id; bh=CSAkMXBQ0uNKKe0EZ5SjHXL5wF8tYw6qcLWuCHC3slY=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTVvLzN9vSTkvViU//9s45Gsgde47vCzCnbtu59w9YtL
 q4fa0zud5SyMIhxMciKKbI4tJuEyy3nqdhslKkBM4eVCWQIAxenAExkrhMjQ0/PcWs2rmNTVwbt
 /Rhrxz73klvAjyyH159Ylj48sUPJKJfhf0Z3HoMzy4OAKZySr6csDVXZ8o9zUdjOj68SY5ska41
 XcwMA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

The Msgs column packs the thread total and the unseen badge into adjacent
fields, so a two-digit total and a badge render as "15(3)" and read as a
single number.

Put a separator between them and widen the badge to four columns, so a
two-digit unseen count still fits, and move the header label over the
field it now describes.

Assisted-by: claude-opus-5
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/review_tui/_tracking_app.py | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/src/b4/review_tui/_tracking_app.py b/src/b4/review_tui/_tracking_app.py
index 53466498..37377758 100644
--- a/src/b4/review_tui/_tracking_app.py
+++ b/src/b4/review_tui/_tracking_app.py
@@ -772,7 +772,13 @@ def _append_msgs(
     message_count: Optional[int],
     seen_message_count: Optional[int],
 ) -> None:
-    """Append the Msgs column (total + unseen badge) to *label*."""
+    """Append the Msgs column (total + unseen badge) to *label*.
+
+    Ten columns: two of lead-in, three for the total, a separator, four for
+    the badge.  The separator is what keeps a two-digit total and a badge
+    from reading as one number, and the badge is four wide so a two-digit
+    unseen count still fits inside the field.
+    """
     base, badge, base_accent = _msgs_fields(message_count, seen_message_count)
     base_style = ''
     badge_style = ''
@@ -783,7 +789,8 @@ def _append_msgs(
         if badge:
             badge_style = accent
     label.append(f'  {base.rjust(3)}', style=base_style)
-    label.append(f'{badge:<3s}', style=badge_style)
+    label.append(' ')
+    label.append(f'{badge:<4s}', style=badge_style)
 
 
 class TrackedSeriesItem(ListItem):
@@ -1432,7 +1439,7 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
                 await self.mount(empty, before=self.query_one(Footer))
                 return
 
-            header_text = f'{"Submitter":<20s}{"A":>1s} {"A·R·T":>7s}  {"Msgs":>6s}  {"S":<4s}{"Subject"}'
+            header_text = f'{"Submitter":<20s}{"A":>1s} {"A·R·T":>7s}  {"Msgs":<8s}{"S":<6s}{"Subject"}'
             header = Static(header_text, id='tracking-header')
 
             list_items: List[ListItem] = [TrackedSeriesItem(s) for s in display_series]

-- 
2.53.0

