Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB637395D86
	for <tools@linux.kernel.org>; Fri, 17 Jul 2026 22:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784327915; cv=none; b=NZ/g73kmnDPcZ1LIQAjevIMekv6U7xYXSVgX81O/0PlZ6A6DJfiwd+no0pAqX7IJ6zUX0Yxkt+44mOjtwWfywX9AeySsKNxaQrz66HUGwLU6EKv7n9GTbeUXFhBCobAT91zBA/Fcr4n0C1ZZEdySmcQr5vo7H6HeY7HhmhiFfHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784327915; c=relaxed/simple;
	bh=hpb42e8ki+zAqoR4UHIwxbqfIpEKCURvg2rKfPv9FZw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jPEkmT9xOlGOALgDEcfANKtbAf7ckTIW/HpFVrPrvGBkZR2GVpgPwpoHrRJiuu40QjdZ56sK5DzN711IwLBX6Xujz5pogaVBiUzsT1oPSvuGnlocGeyPOrR7/ZKomTNg+F4rR5aXKwwX802StwN32nryauYZHIIdQZ7IOF9g/Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ct8H441T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ct8H441T"
Received: by smtp.kernel.org (Postfix)
	id A8EDA1F00A3D; Fri, 17 Jul 2026 22:38:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2C101F000E9;
	Fri, 17 Jul 2026 22:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784327913;
	bh=bKuZ5RXhrJLBNOyhVoPXpmz2x0SlPT2IAaboO+Em9KU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ct8H441TTnQziL6UcDc8HK9/rEU32ZkQRmExOEenpHApE4BqSYN2kDn1zH2l23H/J
	 8xQL+huN7niomtElDKCj2PgrLlwRaE7Pn1MGsMGSh90uJIU9JkN0K7X7MvcqZezYYH
	 yax0kdRGy+yBW1tMB2mnDF0oHOe2YtqQ9Nv5EqHCVDIl6ZTNR4+botmiiA0MJ8fyMB
	 DZvU7v5itZ2wwuazkuCRO3a1NXLH/TZPqWDTE/TSMNSTV/VhioISX58XBpflgzt6/0
	 JpHNnaUpcqaoQabr7JCDFituyHZworSxC7kglq3oR8xD8CHBEEKAT7swWuHbFCiL7z
	 dyWoEY/aKzWaA==
From: Christian Brauner <brauner@kernel.org>
Date: Sat, 18 Jul 2026 00:37:45 +0200
Subject: [PATCH RFC 09/11] review-tui: extract the Msgs column renderer
 from TrackedSeriesItem
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260718-work-b4-multiver-rows-v1-9-3c539d2a3095@kernel.org>
References: <20260718-work-b4-multiver-rows-v1-0-3c539d2a3095@kernel.org>
In-Reply-To: <20260718-work-b4-multiver-rows-v1-0-3c539d2a3095@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-4217c
X-Developer-Signature: v=1; a=openpgp-sha256; l=4868; i=brauner@kernel.org;
 h=from:subject:message-id; bh=hpb42e8ki+zAqoR4UHIwxbqfIpEKCURvg2rKfPv9FZw=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWRFrbvZ9c/hnnyvtcfVCWcfl93/+v3spmWlFmkzJB6eP
 r5gg8O3tx2lLAxiXAyyYoosDu0m4XLLeSo2G2VqwMxhZQIZwsDFKQATYT/HyLD0FYO6vUiU+FQ7
 50WLdq0/EqZqnRYcnB0qVuvNo352jzgjwwtDi/OBzwyXaPopTA2O5Llsteqbz90tqr8mtP+aVHM
 6hAkA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

The tracker list computes the Msgs column (thread total plus an unseen
badge) inline in TrackedSeriesItem.compose().  Per-version child rows
need the exact same column, so pull the computation out into
_msgs_fields() and the styled append into _append_msgs().

No functional change.

Assisted-by: LLM
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/review_tui/_tracking_app.py | 95 ++++++++++++++++++++++----------------
 1 file changed, 54 insertions(+), 41 deletions(-)

diff --git a/src/b4/review_tui/_tracking_app.py b/src/b4/review_tui/_tracking_app.py
index cc20ad6..8800383 100644
--- a/src/b4/review_tui/_tracking_app.py
+++ b/src/b4/review_tui/_tracking_app.py
@@ -516,6 +516,54 @@ def _format_attestation(att: str, app: Any = None) -> Optional[RichText]:
     return text
 
 
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
+    delta = (
+        message_count - seen_message_count
+        if (seen_message_count is not None and message_count > seen_message_count)
+        else 0
+    )
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
 
@@ -553,36 +601,6 @@ class TrackedSeriesItem(ListItem):
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
@@ -605,17 +623,12 @@ class TrackedSeriesItem(ListItem):
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

