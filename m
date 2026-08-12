Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD7A3EFD24
	for <tools@linux.kernel.org>; Wed, 12 Aug 2026 21:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786571260; cv=none; b=ghEa9JgZUadC5e/JN9nuC4KIWcRp8TgNxjuvnBHU3vBO3cH9wCur3y6tm6Q5720DTQjWbi6XY1j2vxFdcfx1f1Ln3MA73xGZo0tBLwjrhkRZOISSN3fDom7pT8YclvsQUoEg+vUw340oIqnxLiRJcraHCesdIJaUj4r40XazzPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786571260; c=relaxed/simple;
	bh=LgwVt/I3OLRlJ4BZCfAEKSiO3AQyGZ5U/T8xX+QWnFg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GG1hd3iTcobJ1Y2MwII6R05SartgcnfgRLZppvmS5aIpDt7B/AvHHZUs0DZmM/62B3d9GK3HN6Kq21W0/XSQ7K+U7wZ36/bbq9hl8PcbeJ1qNca0UkeK2o1zX2JCXTUmg3/Zx0B/KNwd/IAJCPLgA+kl9TXa4xtX5TfmiNA1wI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GPo3KGG5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GPo3KGG5"
Received: by smtp.kernel.org (Postfix)
	id E85EC1F00A3D; Wed, 12 Aug 2026 21:47:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C7591F000E9;
	Wed, 12 Aug 2026 21:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786571258;
	bh=pFrNNbmdf1uor1j+OUES0EDvlmJE3Cu70xQA8VLiGUk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=GPo3KGG5XGhDfZnXjXF8HXS4nzwQXzKnfX9z8e+z36Er/kciiopP/9JnhtqrUq9Vf
	 M4biNGAuCcua2qrTCQnB1csg1Xxz5KtMqpkeSrfdExMh9B+/13OnGtkgIoksMeVLZK
	 nj3zzN4oMBedwtl7gLwIDEqlNgUjAK832+Q6Lu21f1Hg56hAAokBb85MvC7sg5Y+lQ
	 P6YehVRUetnFaEDSx1AG+h2s5FkGcGDcmvmRSVlUhYcxssUam0xXnn33k9Judk7by/
	 LQlbSl85CCWB/OszciATw/d/04cAhXu9m3L1d/uIwty9T5RA/U+U2J+KzJjCxxMMAz
	 Cb/eEu4jp3Bzg==
From: Christian Brauner <brauner@kernel.org>
Date: Wed, 12 Aug 2026 23:47:03 +0200
Subject: [PATCH RFC v2 22/25] review-tui: extract the Msgs column renderer
 from TrackedSeriesItem
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260812-work-b4-multiver-rows-v2-22-305d53cd723a@kernel.org>
References: <20260812-work-b4-multiver-rows-v2-0-305d53cd723a@kernel.org>
In-Reply-To: <20260812-work-b4-multiver-rows-v2-0-305d53cd723a@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.17-dev-362b8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5433; i=brauner@kernel.org;
 h=from:subject:message-id; bh=LgwVt/I3OLRlJ4BZCfAEKSiO3AQyGZ5U/T8xX+QWnFg=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTVvLz9KWry450Vix7F6KYoz7ab66jYOmtx5LmP/+YVq
 iSf1Qtb11HKwiDGxSArpsji0G4SLrecp2KzUaYGzBxWJpAhDFycAjCRGwqMDA9/t9dMbuDmDeN5
 t+v2H53f0UEMq7P1HFhdRWQOneRRN2VkWC/cs8EwwXb6ykJ9fdN1fzQuX9ERODdn//9jrju6blW
 /5AAA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

The tracker list computes the Msgs column, a thread total plus an unseen
badge, inline in TrackedSeriesItem.compose().  Per-version child rows
need the same column, so pull the computation out into _msgs_fields() and
the styled append into _append_msgs().

No functional change.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/review_tui/_tracking_app.py | 107 +++++++++++++++++++++++--------------
 1 file changed, 66 insertions(+), 41 deletions(-)

diff --git a/src/b4/review_tui/_tracking_app.py b/src/b4/review_tui/_tracking_app.py
index 999513ca..53466498 100644
--- a/src/b4/review_tui/_tracking_app.py
+++ b/src/b4/review_tui/_tracking_app.py
@@ -726,6 +726,66 @@ def _format_attestation(att: str, app: Any = None) -> Optional[RichText]:
     return text
 
 
+def _unseen_delta(
+    message_count: Optional[int], seen_message_count: Optional[int]
+) -> int:
+    """Unseen messages in a thread, for every renderer of that number.
+
+    An absent seen count means nothing is known to have been read yet --
+    but the counts are written in pairs, so in practice that only happens
+    on rows migrated in from a database predating them.  Treat it as
+    "nothing unseen" rather than "everything unseen": two renderers
+    disagreeing about a missing value is worse than either answer.
+    """
+    if message_count is None or seen_message_count is None:
+        return 0
+    return max(0, message_count - seen_message_count)
+
+
+def _msgs_fields(
+    message_count: Optional[int], seen_message_count: Optional[int]
+) -> Tuple[str, str, bool]:
+    """Render the Msgs column for a (total, seen) message count pair.
+
+    Returns (base, badge, base_accent): "1" (all seen), "6" accented (all
+    new), "6" + "(3)" (mixed).  A never-fetched thread has no count and
+    renders as "-".  The badge is accented whenever it is non-empty.
+    """
+    if message_count is None:
+        return '-', '', False
+    if message_count == 0:
+        return '0', '', False
+    delta = _unseen_delta(message_count, seen_message_count)
+    if delta == message_count:
+        # All follow-ups are new
+        return str(message_count), '', True
+    if delta > 0:
+        # Mixed: total + (unseen)
+        return str(message_count), f'({delta})', False
+    # All seen
+    return str(message_count), '', False
+
+
+def _append_msgs(
+    label: RichText,
+    app: Any,
+    message_count: Optional[int],
+    seen_message_count: Optional[int],
+) -> None:
+    """Append the Msgs column (total + unseen badge) to *label*."""
+    base, badge, base_accent = _msgs_fields(message_count, seen_message_count)
+    base_style = ''
+    badge_style = ''
+    if base_accent or badge:
+        accent = f'bold {resolve_styles(app)["warning"]}'
+        if base_accent:
+            base_style = accent
+        if badge:
+            badge_style = accent
+    label.append(f'  {base.rjust(3)}', style=base_style)
+    label.append(f'{badge:<3s}', style=badge_style)
+
+
 class TrackedSeriesItem(ListItem):
     """A single tracked series entry in the listing."""
 
@@ -770,36 +830,6 @@ class TrackedSeriesItem(ListItem):
             art_str = f'{a}·{r}·{t}'
         else:
             art_str = '-'
-        fc = self.series.get('message_count')
-        sc = self.series.get('seen_message_count')
-        if fc is not None:
-            delta = (fc - sc) if (sc is not None and fc > sc) else 0
-        else:
-            delta = 0
-        # Msgs display: "1" (all seen), "6" accent (all new), "6(3)" mixed
-        if fc is None:
-            fu_base = '-'
-            fu_badge = ''
-            base_accent = False
-        elif fc == 0:
-            fu_base = '0'
-            fu_badge = ''
-            base_accent = False
-        elif delta == fc:
-            # All follow-ups are new
-            fu_base = str(fc)
-            fu_badge = ''
-            base_accent = True
-        elif delta > 0:
-            # Mixed: total + (unseen)
-            fu_base = str(fc)
-            fu_badge = f'({delta})'
-            base_accent = False
-        else:
-            # All seen
-            fu_base = str(fc)
-            fu_badge = ''
-            base_accent = False
         # Build compact prefix using LoreSubject to extract subsystem/modifier tokens
         ls = b4.LoreSubject(subject)
         extras = ls.get_extra_prefixes(exclude=['patch'])
@@ -822,17 +852,12 @@ class TrackedSeriesItem(ListItem):
             label.append(' ')
         label.append(' ')
         label.append(art_str.rjust(7))
-        base_style = ''
-        badge_style = ''
-        if base_accent or fu_badge:
-            ts = resolve_styles(self.app)
-            accent = f'bold {ts["warning"]}'
-            if base_accent:
-                base_style = accent
-            if fu_badge:
-                badge_style = accent
-        label.append(f'  {fu_base.rjust(3)}', style=base_style)
-        label.append(f'{fu_badge:<3s}', style=badge_style)
+        _append_msgs(
+            label,
+            self.app,
+            self.series.get('message_count'),
+            self.series.get('seen_message_count'),
+        )
         label.append(f'  {symbol}{flag}  {subject_display}')
         yield Label(label, markup=False)
 

-- 
2.53.0

