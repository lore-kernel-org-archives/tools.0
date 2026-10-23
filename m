Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792769252;
	b=sIJxaFfjfBusVKycdV9kUcWKy+hxxYZ1jANES5fHWzxvpDlTQr+C1d7qbRAs2tMBB7o7
	 oZjd4U/QuBhVJw/VNf3S0xkM++Nd3U6OpGVqw+n6dHytKo8yq7AVNi5Y9yESD0+avx4g7
	 E9lxLWIMjx4jfq61eAt9ftpRa2OERNvYmLaLXHbm3CTUtiurKN1N/KG/aUp0907PvOyQ2
	 BFbT3sxXyf9PoYa55eQRq6N6DpahuOrJIJorQ1N4gEoxqN4SkdwfTAu3B0uCpRpZpE6bf
	 MfLcZDCEhouk/GsVgbEbuLu7WaNs8lWY20dNWZqNhjsE8HMJBRVaO0b50weaJ7JqN5A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792769252;
	h=Received:Delivered-To:Received:DMARC-Filter:DKIM-Signature:Received:
	 X-Zone-Loop:x-campaign-type:x-transaction-id:x-swg-uid:X-Mailer:
	 Message-ID:x-swg-bid:Feedback-ID:x-campaign-id:x-client-id:
	 X-Originating-IP:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Developer-Signature:X-Developer-Key:X-Bm-Milter-Handled:
	 X-Bm-Transport-Timestamp;
	bh=P/RLiHXMBlJYirhHO8F9Ebq9hhowcm31EGJVZf7sAGw=;
	b=wxfnXMQtNcCKwDY9hGiAx1ybI8am4+oHP7cBvv8EU1j3hCXe9VrOtUdxMgcNGcU4tKE7
	 D6L7vIOeNc1wVt1B1ok7kVZWZwK6kDG41uBlVlbTOOFYLHdNG5fU2Jg9kq8VKgvukmR1m
	 vQAfM1hnEjIGo5FKkgnaxwroiete1Li3y4JxwFI8soei3ryR/YF/OnoaueCNT5jStepKN
	 8Q9ncwPROJp0niVnWz05SK2hC4AdhBYSijZz4dALiZpfXYtfQLxiy7U5fLIQwwD9DFaU7
	 9/OiEGIeYpV81tmaKk5XRIxneG+FBl3U3H8EQuqb7kiYDTaPJUr45DHJQ0LQyaOqerA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=QfuhEHFN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A12B606A31A
	for <tools@linux.kernel.org>; Fri, 23 Oct 2026 15:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=QfuhEHFN
Received: by smtp.kernel.org (Postfix)
	id 10F301F01828; Fri, 23 Oct 2026 15:27:31 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=185.255.28.34
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792769251;
	b=xNaXhxEL8sw+jUEuNj3Bvc/YW25itiQ88k542zJH5+8jOxva4jwW9VVQ7TXA5n4LTh4r
	 0TbFh29J1AbgyaGunMH/jz+n49V9+sVONOLCrs6eseEubpnNuRhliM3ZGoA+DUy7Izhpz
	 +tw9F1GqJF8xGYHJAhAETVov79dhx02u9lQOHs58R7mQT1gb3hWVk1s5XEdJftC3vI/Yg
	 DGGaDR1QTwjIL7LrQV5v0REWd2lFYzUImxPU0ZuZrN9lqSi8ZtH3mQlwIURY2mpHSXGAV
	 mpmak8GTVcDR/iZi5ipue393h3lPsAZNUWxuiqngqvohq7waJ0DhlXtyfKJDcEwzuSg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792769251;
	h=DMARC-Filter:DKIM-Signature:Received:X-Zone-Loop:x-campaign-type:
	 x-transaction-id:x-swg-uid:X-Mailer:Message-ID:x-swg-bid:Feedback-ID:
	 x-campaign-id:x-client-id:X-Originating-IP:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Developer-Signature:X-Developer-Key:
	 X-Bm-Milter-Handled:X-Bm-Transport-Timestamp;
	bh=P/RLiHXMBlJYirhHO8F9Ebq9hhowcm31EGJVZf7sAGw=;
	b=eFZaVQO0LzvRR2RDK+ilbBeDtG0spRho9dyPYcKc7zaDXmX+a3fdIClDX/1LD9VhhLEL
	 qb/jvVSZbnepZ5AD1982WXHYyC4CM+X3We+j/fu5TZrW0m4V5d/iPdYsgwPwGGSBbubRS
	 0zulAlx8URms/es7XeiVHi7tvaSpw9FrU5OZIHfg8rnu2hKiN3IrXvtjkV4zCLWHaYsX1
	 lGf3+/x5VnmkuL5V3rJGg9w2QPBbLZukyz7japFMNS5oQFaSjK2ew6WvKx4TJgx/8nkoq
	 +S6sjB7D6WNNaRd/vYsRWSwqAPrTd2r7x/4KrTRTtqdGzHkFi9w5gPujKJOFFAWQhAw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=QfuhEHFN;
	dmarc=pass header.from=vates.tech;
	spf=pass smtp.mailfrom=swg.vates.tech;
	arc=none smtp.remote-ip=185.255.28.34
Received: from prod-mta-13-01.swg-srv.net (prod-mta-13-01.swg-srv.net [185.255.28.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BDC031F01825
	for <tools@kernel.org>; Fri, 23 Oct 2026 15:27:28 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=QfuhEHFN
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org BDC031F01825
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=vates.tech
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=swg.vates.tech
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=P/RLiHXMBlJYirhHO8F9Ebq9hhowcm31EGJVZf7sAGw=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:feedback-id;
 b=QfuhEHFNNJmmM6ZAGuQu4Cb9ZDGatOJNnMY/UN+7FBfzKr3iiBeKwCdeVm6Ymo+t8S1+1I0FV
 Inx1VNlEjYbyCzYOZhzJEGGyaZaXkW3bs7vnvy5gf4xW1ZAPHagw/GAmlKkHC0to2Ar28Uj1kZB
 5FYHtV1Mt759iYmxloYGK73v3M5aCXLJLZFg/p37yY+swLSF5NkThvbstxhul9U+z+iWD9LNWAN
 JV1KC1ZHL8Xvz8YqADIjKYdxZrfOjq4JCx55K9lvQNcS3yCUJPv584cb0ogkML797lfmg6KaFRu
 vaCGwUaCaxvFcuoJA0jyWKQkr51WQ//kKmeJh826rfRQ==
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender: 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id 1a1695fb28e000f79f.001
 for <tools@kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 23 Oct 2026 15:27:21 +0000
X-Zone-Loop: c5c9c36f900edb9971423e3ba75807573aa879e1b10a
x-campaign-type: default
x-transaction-id: 00a3e38b-d917-457f-9372-3f2e4a003dd7
x-swg-uid: 01-a726fe79-e6d2-44b4-90b1-1cec61742cc9
X-Mailer: Sweego
Message-ID:
 <1792769241.8631fc262581453bbf619ec5b2062170.1a1695fb28e000f79f@vates.tech>
x-swg-bid: 1792769241.8631fc262581453bbf619ec5b2062170.1a1695fb28e000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
Received: from [192.168.1.37] (lfbn-gre-1-371-96.w90-112.abo.wanadoo.fr [90.112.87.96])
	(Authenticated sender: baptiste.le-duc)
	by mail2.vates.fr (Postfix) with ESMTPSA id CCEB6800CF;
	Fri, 23 Oct 2026 17:27:20 +0200 (CEST)
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Date: Fri, 23 Oct 2026 17:27:10 +0200
Subject: [PATCH b4] review: send what was added since the last review send
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/zWMywqDMBAAf0X23FATRWx/pXjIY9UtNSm79gHiv
 zdp6XGGYTYQZEKBc7UB45OEUsygDxX42cYJFYXMYGrT6do0qkT4UoIxqJHTom5W1r/tQ6v1qfc
 Ouwby4s440vu7v4BrYfg5ebgr+rV8S+WsoHJso5+LSkwTxeOSv8iw7x+UBKkJpAAAAA==
X-Change-ID: 20261023-review-send-from-last-review-8d41198cbe63
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Baptiste Le Duc <baptiste.le-duc@vates.tech>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792769235; l=17380;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=SnNxtIZiW6ofMXVjoP+MkRL2W8pQthJEl+V1FaBVEoA=;
 b=nEP0yile6TgdF3UMUohuIcEGLIsxTyPFrZZnrLz31kjsn90gbY9zs6HVqAdBFkoG2zDKIeF7P
 TWoD96ZAWmkBtdsrG2O+lRwTPR74amyhASzTUljmevD8gYw4iGvOf89
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792769240917

Once a review was sent, every review in the series was stamped with
sent-revision and collect_review_emails() skipped it for good. A
comment or trailer added afterwards on the same revision was kept in
the tracking data but never sent, and the TUI only said "No review
data to send.", so there was no way to follow up on a patch.

Record what each send carried in a 'sent' entry, reuse sent-revision,
and make _build_review_email() send only the trailers and comments
added since.

The reply buffer is sent exactly as written, so it cannot be cut down
to what is new. Instead, move a sent reply out of the review into
sent['replies']: the next edit then starts from a fresh buffer, where
the comments already sent are shown read-only like other reviewers'
ones, and only what is typed now is sent. The sent comments and
trailers are kept in the review, and the sent replies still show in
the prior review context built on upgrade.

A review sent by an older b4 has sent-revision but no sent entry, so
what went out is unknown: keep skipping it. On send, the TUI says so in
place of "No review data to send." when nothing else is left, or warns
that those reviews are not resent alongside the others.

Update unit tests accordingly: TestCollectReviewEmails mocks
_build_review_email(), which now holds the filtering, so make the mock run
_review_to_send() for the existing sent-revision tests to still check that
sent reviews are skipped. Add tests checking that a comment added after a
send goes out alone, and that a reply edited after a send only carries
the new comment.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
 src/b4/review/__init__.py        |  6 ++++
 src/b4/review/_review.py         | 72 +++++++++++++++++++++++++++++++++++-----
 src/b4/review/tracking.py        |  3 +-
 src/b4/review_tui/_review_app.py | 46 +++++++++++++++++--------
 src/tests/test_review.py         | 63 +++++++++++++++++++++++++++++++++--
 5 files changed, 164 insertions(+), 26 deletions(-)

diff --git a/src/b4/review/__init__.py b/src/b4/review/__init__.py
index 5da89d4..63de534 100644
--- a/src/b4/review/__init__.py
+++ b/src/b4/review/__init__.py
@@ -20,6 +20,8 @@ from b4.review._review import (
     _integrate_agent_reviews,
     _integrate_followup_inline_comments,
     _integrate_sashiko_reviews,
+    _mark_review_sent,
+    _merge_sent,
     _normalize_line_endings,
     _parse_reply_trailers,
     _prepare_review_session,
@@ -28,6 +30,7 @@ from b4.review._review import (
     _resolve_comment_positions,
     _resolve_message_positions,
     _retrieve_messages,
+    _review_to_send,
     _set_patch_state,
     _strip_note_footer,
     _strip_subject,
@@ -67,6 +70,9 @@ __all__ = [
     '_sync_reply_trailers',
     'TRAILER_MENU_NAMES',
     '_build_review_email',
+    '_review_to_send',
+    '_mark_review_sent',
+    '_merge_sent',
     '_integrate_agent_reviews',
     '_extract_comments_from_quoted_reply',
     '_integrate_sashiko_reviews',
diff --git a/src/b4/review/_review.py b/src/b4/review/_review.py
index b69a7f0..147ed2c 100644
--- a/src/b4/review/_review.py
+++ b/src/b4/review/_review.py
@@ -6,6 +6,7 @@
 __author__ = 'Konstantin Ryabitsev <konstantin@linuxfoundation.org>'
 
 import argparse
+import copy
 import datetime
 import email.message
 import email.utils
@@ -1051,7 +1052,11 @@ def _get_patch_state(target: Dict[str, Any], usercfg: b4.ConfigDictT) -> str:
         return 'draft'
     if trailer_keys & _APPROVAL_TRAILER_KEYS:
         return 'done'
-    if review.get('comments') or review.get('reply', ''):
+    if (
+        review.get('comments')
+        or review.get('reply', '')
+        or review.get('sent', {}).get('replies')
+    ):
         return 'draft'
     my_email = str(usercfg.get('email', ''))
     # Auto-detect a review I already sent to the list before tracking this
@@ -2090,8 +2095,10 @@ def _render_quoted_diff_with_comments(
     # External comments: (text, attribution, provenance) — rendered with | prefix.
     entries: List[Tuple[Dict[str, Any], str, str]] = []
     if my_email in all_reviews:
+        sent = all_reviews[my_email].get('sent', {}).get('comments', [])
         for c in all_reviews[my_email].get('comments', []):
-            entries.append((c, '', ''))
+            # Already sent: show it read-only so it is not sent again
+            entries.append((c, f'<{my_email}> (sent)' if c in sent else '', ''))
     for addr in sorted(all_reviews):
         if addr == my_email:
             continue
@@ -3746,6 +3753,10 @@ def _build_review_email(
 
     Returns None if there is nothing to send.
     """
+    to_send = _review_to_send(review)
+    if to_send is None:
+        return None
+    review = to_send
     trailers = review.get('trailers', [])
     reply_text = review.get('reply', '')
     comments = review.get('comments', [])
@@ -3905,6 +3916,55 @@ def _build_review_email(
     return msg
 
 
+def _review_to_send(review: Dict[str, Any]) -> Optional[Dict[str, Any]]:
+    """Return what of *review* is left to send, or None if it was sent.
+
+    ``sent`` holds what earlier sends carried, so only the trailers and
+    comments added since are returned; with no ``sent``, the whole review
+    is.  A sent reply is moved out of the review, so any reply left is new.
+    """
+    if 'sent' not in review and review.get('sent-revision'):
+        # Sent by a b4 that did not record what went out
+        return None
+    sent = review.get('sent', {})
+    to_send = dict(review)
+    to_send['trailers'] = [
+        t for t in review.get('trailers', []) if t not in sent.get('trailers', [])
+    ]
+    to_send['comments'] = [
+        c for c in review.get('comments', []) if c not in sent.get('comments', [])
+    ]
+    return to_send
+
+
+def _mark_review_sent(review: Dict[str, Any], revision: int) -> None:
+    """Record what a send of *review* carried, see _review_to_send().
+
+    The reply is moved to ``sent``, so that the next edit starts from a
+    fresh buffer and does not send the same text again.
+    """
+    review['sent-revision'] = revision
+    replies = review.get('sent', {}).get('replies', [])
+    replies = replies + [r for r in [review.pop('reply', '')] if r]
+    review['sent'] = copy.deepcopy(
+        {
+            'trailers': review.get('trailers', []),
+            'comments': review.get('comments', []),
+            'replies': replies,
+        }
+    )
+
+
+def _merge_sent(review: Dict[str, Any], key: str, items: List[Any]) -> List[Any]:
+    """Return the sent *key* items of *review* followed by the new *items*.
+
+    A reply buffer edited after a send only holds what is new, so this
+    keeps the sent trailers or comments in the review.
+    """
+    sent: List[Any] = review.get('sent', {}).get(key, [])
+    return sent + [i for i in items if i not in sent]
+
+
 def collect_review_emails(
     series: Dict[str, Any],
     patches: List[Dict[str, Any]],
@@ -3923,11 +3983,7 @@ def collect_review_emails(
 
     # Cover letter review (maintainer only)
     cover_review = series.get('reviews', {}).get(my_email, {})
-    if (
-        cover_review
-        and cover_review.get('patch-state') != 'skip'
-        and cover_review.get('sent-revision') is None
-    ):
+    if cover_review and cover_review.get('patch-state') != 'skip':
         msg = _build_review_email(series, None, cover_review, cover_text, topdir, None)
         if msg is not None:
             msgs.append(msg)
@@ -3937,8 +3993,6 @@ def collect_review_emails(
         patch_review = patch_meta.get('reviews', {}).get(my_email, {})
         if not patch_review or patch_review.get('patch-state') == 'skip':
             continue
-        if patch_review.get('sent-revision') is not None:
-            continue
         commit_sha = commit_shas[idx] if idx < len(commit_shas) else None
         msg = _build_review_email(
             series, patch_meta, patch_review, cover_text, topdir, commit_sha
diff --git a/src/b4/review/tracking.py b/src/b4/review/tracking.py
index 57fd141..e186a67 100644
--- a/src/b4/review/tracking.py
+++ b/src/b4/review/tracking.py
@@ -2918,7 +2918,8 @@ def render_prior_review_context(
         """Render a single reviewer's feedback for one patch or cover letter."""
         out: List[str] = []
         note = review.get('note', '').strip()
-        reply = review.get('reply', '').strip()
+        replies = review.get('sent', {}).get('replies', []) + [review.get('reply', '')]
+        reply = '\n\n'.join(r.strip() for r in replies if r.strip())
         trailers: List[Any] = review.get('trailers', [])
         comments: List[Any] = review.get('comments', [])
         if note:
diff --git a/src/b4/review_tui/_review_app.py b/src/b4/review_tui/_review_app.py
index 1e70bc6..643fa77 100644
--- a/src/b4/review_tui/_review_app.py
+++ b/src/b4/review_tui/_review_app.py
@@ -873,6 +873,7 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
                 )
             return
 
+        review = b4.review._review_to_send(review) or {}
         if not review or not (
             review.get('trailers') or review.get('reply', '') or review.get('comments')
         ):
@@ -1208,7 +1209,9 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
                     reply_text, result, self._default_identity
                 )
                 review['reply'] = reply_text
-                trailers_now = b4.review._parse_reply_trailers(reply_text)
+                trailers_now = b4.review._merge_sent(
+                    review, 'trailers', b4.review._parse_reply_trailers(reply_text)
+                )
                 if trailers_now:
                     review['trailers'] = trailers_now
                 else:
@@ -1415,18 +1418,24 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
         #
         # _extract_editor_comments strips | lines (unadopted external
         # comments) before parsing, so only adopted ones are kept.
-        new_comments = b4.review._extract_editor_comments(
-            reply_text,
-            diff_text=real_diff,
-            message_text=message_text,
-            basement_text=basement_text,
+        new_comments = b4.review._merge_sent(
+            review,
+            'comments',
+            b4.review._extract_editor_comments(
+                reply_text,
+                diff_text=real_diff,
+                message_text=message_text,
+                basement_text=basement_text,
+            ),
         )
         if new_comments:
             review['comments'] = new_comments
         else:
             review.pop('comments', None)
 
-        trailer_strs = b4.review._parse_reply_trailers(reply_text)
+        trailer_strs = b4.review._merge_sent(
+            review, 'trailers', b4.review._parse_reply_trailers(reply_text)
+        )
         if trailer_strs:
             review['trailers'] = trailer_strs
         else:
@@ -1766,9 +1775,22 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
             self._topdir,
             self._commit_shas,
         )
+        legacy = None
+        for target in [self._series] + list(self._patches):
+            review = b4.review._get_my_review(target, self._usercfg)
+            if review.get('patch-state') == 'skip':
+                continue
+            if b4.review._review_to_send(review) is None:
+                legacy = 'sent by an older b4 that did not record their content'
+                break
         if not msgs:
-            self.notify('No review data to send.')
+            if legacy:
+                self.notify(f'Nothing new to send: reviews were {legacy}.')
+            else:
+                self.notify('No review data to send.')
             return
+        if legacy:
+            self.notify(f'Not resending reviews {legacy}.', severity='warning')
 
         def _on_send_confirmed(confirmed: Optional[bool]) -> None:
             if not confirmed:
@@ -1805,16 +1827,14 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
             try:
                 self._reply_sent = True
                 self._tracking['series']['status'] = 'replied'
-                # Stamp sent-revision on every non-skip review so that
-                # if this series is later upgraded to a newer revision,
-                # the upgrade step can detect which reviews were already
-                # sent and auto-skip the unchanged patches.
+                # Record what every non-skip review carried, so that the
+                # next send only carries what is added since.
                 my_email = str(self._usercfg.get('email', 'unknown@example.com'))
                 current_rev = int(self._series.get('revision', 1))
                 for target in [self._series] + list(self._patches):
                     review = target.get('reviews', {}).get(my_email, {})
                     if review and review.get('patch-state') != 'skip':
-                        review['sent-revision'] = current_rev
+                        b4.review._mark_review_sent(review, current_rev)
                 if not self._save_tracking():
                     # Silence here means the next session offers these reviews
                     # as unsent and the maintainer sends them twice.
diff --git a/src/tests/test_review.py b/src/tests/test_review.py
index e40dd35..f29ec58 100644
--- a/src/tests/test_review.py
+++ b/src/tests/test_review.py
@@ -4146,9 +4146,15 @@ class TestGetLoreSeriesVersionMismatch:
 # -- Tests for collect_review_emails() ----------------------------------------
 
 
-@mock.patch(
-    'b4.review._review._build_review_email', return_value=mock.sentinel.email_msg
-)
+def _fake_review_email(_series: Any, _patch: Any, rev: Dict[str, Any], *_: Any) -> Any:
+    """Stand in for _build_review_email(), keeping its filtering of what was sent."""
+    to_send = review._review_to_send(rev)
+    if to_send and (to_send['trailers'] or to_send['comments']):
+        return mock.sentinel.email_msg
+    return None
+
+
+@mock.patch('b4.review._review._build_review_email', side_effect=_fake_review_email)
 @mock.patch(
     'b4.get_user_config',
     return_value={'name': 'Maintainer', 'email': 'maintainer@example.com'},
@@ -4269,6 +4275,57 @@ class TestCollectReviewEmails:
         )
         assert len(msgs) == 1
 
+    def test_sends_only_comments_added_after_send(
+        self, _cfg: mock.Mock, _build: mock.Mock
+    ) -> None:
+        """A comment added after a send goes out alone in a second email."""
+        old = {'path': 'a.c', 'line': 1, 'text': 'old'}
+        new = {'path': 'a.c', 'line': 2, 'text': 'new'}
+        my_review = self._review(comments=[old])
+        review._mark_review_sent(my_review, 1)
+        series = self._make_series()
+        patch = self._make_patch({self.MY_EMAIL: my_review})
+        assert (
+            review.collect_review_emails(series, [patch], 'cover', '', ['sha1']) == []
+        )
+        my_review['comments'].append(new)
+        msgs = review.collect_review_emails(series, [patch], 'cover', '', ['sha1'])
+        assert len(msgs) == 1
+        to_send = review._review_to_send(my_review)
+        assert to_send is not None
+        assert to_send['comments'] == [new]
+        assert to_send['trailers'] == []
+
+    def test_reply_edited_after_send_carries_only_new_text(
+        self, _cfg: mock.Mock, _build: mock.Mock
+    ) -> None:
+        """A sent reply is not sent again when the buffer is edited later."""
+        diff = (
+            'diff --git a/a.c b/a.c\n'
+            '--- a/a.c\n'
+            '+++ b/a.c\n'
+            '@@ -1,2 +1,2 @@\n'
+            '+one\n'
+            '+two\n'
+        )
+        old = {'path': 'b/a.c', 'line': 1, 'text': 'old'}
+        my_review = self._review(comments=[old], reply='> +one\n\nold\n')
+        review._mark_review_sent(my_review, 1)
+        assert 'reply' not in my_review
+        assert my_review['sent']['replies'] == ['> +one\n\nold\n']
+
+        reviews = {self.MY_EMAIL: my_review}
+        text = review._render_quoted_diff_with_comments(diff, reviews, self.MY_EMAIL)
+        assert '| old' in text
+        text = text.replace('> +two\n', '> +two\n\nnew\n')
+        new = review._extract_editor_comments(text, diff_text=diff)
+        assert [c['text'] for c in new] == ['new']
+        my_review['comments'] = review._merge_sent(my_review, 'comments', new)
+        assert [c['text'] for c in my_review['comments']] == ['old', 'new']
+        to_send = review._review_to_send(my_review)
+        assert to_send is not None
+        assert [c['text'] for c in to_send['comments']] == ['new']
+
 
 def _cron_args(**kwargs: Any) -> argparse.Namespace:
     defaults: Dict[str, Any] = {

---
base-commit: ce4c1158edb292caca0ce4a6087e5edecc1b0371
change-id: 20261023-review-send-from-last-review-8d41198cbe63

Best regards,
--  
Baptiste Le Duc <baptiste.le-duc@vates.tech>

