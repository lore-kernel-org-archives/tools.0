Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794402777;
	b=0MYHXcXYwQj7dLkfqmY6o3B+a6T0+TM/EJ9n3zc7DI9ATlFJYBIgRhrOg/Tiw3I9a5LR
	 jWN1IBclwdQ3UU6AZ8Eh+q5zAK8rx7hIEd7cgbXHP60yC+bXCtlvnmQh3nR+oi6Qd4cyS
	 5DxBVHlkBsabjAhtcsM7Hm+M+zchvCJ3KeMQbWJk0Lq1hALLkJHJqVkNoos/Pop4MMuMq
	 DqvSIqpo27KwlCEodVGxh4BYXm3z8/Q8us+2wNLcK0E5BsxhCPl8yCrsBfL5XhsZihwW1
	 mRGRvx2bYEfHCEZx+k47atCmnadjLnd8buEh2xMuwVqeSav+7sv1BEB8ckLiW4TmBTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402777;
	h=Received:Delivered-To:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=UNwRUwrdlJnAMIOwLwfF7N+NuPiWW8f2lKkCeSYQTcE=;
	b=uBEq734hQuD+hVj/tjaliusZiN45FiVIdpUotURPT0/YmXS/CPR2RLREDdrGATwIrS3u
	 yuT8fhFk1lM9MpRI6zZDGt15BuhOMOuj434muz49pDmcqJC1Xa2wPdWNhNDfCqzkDtjUx
	 25epxnU1j8f7Ka8mmPVpQjKdWVzX5Pny04bGL8s6YgcwXtFlK105P0P6nBLRroHge9WTT
	 bDe7gTAOhtqcoBVt1bbFx+uQx/tywRj9+vW5CBW6pslfcF29kMJBVvobQw29gkD/SpU+9
	 t/YKevMLz+Zycat59JuI5Bg+1dTG/TqpMZ52eBLuTsizQ+DbK7WvfKlRCO5LFIZdtVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hVfaorot;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D974606A327
	for <tools@linux.kernel.org>; Wed, 11 Nov 2026 13:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hVfaorot
Received: by smtp.kernel.org (Postfix)
	id 2CB731F00A08; Wed, 11 Nov 2026 13:12:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71C2E1F00A05;
	Wed, 11 Nov 2026 13:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794402777;
	bh=UNwRUwrdlJnAMIOwLwfF7N+NuPiWW8f2lKkCeSYQTcE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=hVfaoroto+negO9XWSsm4W+RDjx7tRYXfZJ5BdCCi3RrwzAZisECNncjbtZSrAKWn
	 O0jFvnXpm3mSL5L1JwOleU1KCSyrvPQOaFnPFy4sx7+QMurThDba3pnfuqF13luVPc
	 Db7RfmT+4/aH/pvndCTHe7bk6KoT77xqvaGpgE+AfZe+7/l4Q5yVfJC5CVaFDKZTJw
	 0R721OfOPSKO+wVmpHeH9FnFMOsEKn8lj8XWmuCWmnatabJuyP3FmrK0iGnBMujIjm
	 fibGaTrmVj88Z9H1kYuYx84HaMJ5rFSP7ZTkBMKUuSRh5hBnM0tiH+pRAHbQpZTvsi
	 XqdlMEGYibv5Q==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 11 Nov 2026 13:12:42 +0000
Subject: [PATCH b4 1/2] review: tui: Share review ordering between note
 displays
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
Message-Id: <20261111-notes-no-cover-v1-1-b9b0d883742b@kernel.org>
References: <20261111-notes-no-cover-v1-0-b9b0d883742b@kernel.org>
In-Reply-To: <20261111-notes-no-cover-v1-0-b9b0d883742b@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5045; i=broonie@kernel.org;
 h=from:subject:message-id; bh=8HJCchfinDRCPp/785dQ1Dm3Fh4w7hhyJ5op3fEOIHA=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLK+ZF71m/tjrkzMzENXu3+kclVJTsm/f9fs8Gqjf0+N2
 LX16hfN6ShlYRDjYpAVU2SJy+J+WV/yeg3fwYVtMHNYmUCGMHBxCsBEjggx/Pd5IOa6YGdxfH74
 412uh10XJFyec1H5WO3DaTL+HM/1LBQY/pepRnZf45+91q5mubq9RMW/1lveB05oKe04dnirybd
 qBw4A
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The review summary and notes viewer both order the current user's
review before other reviewers. Extract that ordering into a shared
helper which also retains the target each review belongs to, keeping the
displayed reviews and note actions unchanged.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 src/b4/review_tui/_review_app.py | 44 ++++++++++++++++------------------------
 1 file changed, 17 insertions(+), 27 deletions(-)

diff --git a/src/b4/review_tui/_review_app.py b/src/b4/review_tui/_review_app.py
index 1e70bc6..455a73a 100644
--- a/src/b4/review_tui/_review_app.py
+++ b/src/b4/review_tui/_review_app.py
@@ -36,7 +36,6 @@ from b4.review_tui._common import (
     _chain_has_additional_patch,
     _fix_ansi_theme,
     _get_followup_depth,
-    _has_review_data,
     _make_initials,
     _quiet_worker,
     _render_email_to_viewer,
@@ -896,24 +895,11 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
             overlay.display = False
             return
 
-        all_reviews = target.get('reviews', {})
-        if not all_reviews or not _has_review_data(all_reviews):
-            overlay.display = False
-            return
-
         ts = resolve_styles(self)
         my_email = str(self._usercfg.get('email', ''))
-        # Build ordered list: current user first, then others sorted by email
-        ordered: List[Tuple[str, Dict[str, Any]]] = []
-        if my_email in all_reviews:
-            ordered.append((my_email, all_reviews[my_email]))
-        for addr in sorted(all_reviews):
-            if addr != my_email:
-                ordered.append((addr, all_reviews[addr]))
-
         text = Text()
         has_content = False
-        for rev_email, review in ordered:
+        for rev_email, review, review_target in self._get_display_reviews(target):
             if not (
                 review.get('trailers')
                 or review.get('reply', '')
@@ -922,7 +908,7 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
             ):
                 continue
 
-            colour = self._reviewer_colour(rev_email, target, ts)
+            colour = self._reviewer_colour(rev_email, review_target, ts)
             if rev_email == my_email:
                 header = 'Your review'
             else:
@@ -1024,6 +1010,17 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
             return self._patches[patch_idx]
         return {}
 
+    def _get_display_reviews(
+        self, target: Dict[str, Any]
+    ) -> List[Tuple[str, Dict[str, Any], Dict[str, Any]]]:
+        """Return reviews and their targets, with the current user's review first."""
+        reviews = target.get('reviews', {})
+        my_email = str(self._usercfg.get('email', ''))
+        return [
+            (addr, reviews[addr], target)
+            for addr in sorted(reviews, key=lambda addr: (addr != my_email, addr))
+        ]
+
     def _ensure_review(self, target: Dict[str, Any]) -> Dict[str, Any]:
         """Return the current user's review sub-dict, creating it if needed."""
         return b4.review._ensure_my_review(target, self._usercfg)
@@ -1528,8 +1525,8 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
         if not target:
             return
 
-        all_reviews = target.get('reviews', {})
-        has_any_notes = any(r.get('note', '') for r in all_reviews.values())
+        display_reviews = self._get_display_reviews(target)
+        has_any_notes = any(r.get('note', '') for _addr, r, _target in display_reviews)
 
         if not has_any_notes:
             # No notes at all — go straight to the external editor
@@ -1538,16 +1535,9 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
 
         # Build formatted text showing all reviewers' notes
         my_email = str(self._usercfg.get('email', ''))
-        ordered: List[Tuple[str, Dict[str, Any]]] = []
-        if my_email in all_reviews:
-            ordered.append((my_email, all_reviews[my_email]))
-        for addr in sorted(all_reviews):
-            if addr != my_email:
-                ordered.append((addr, all_reviews[addr]))
-
         ts = resolve_styles(self)
         note_entries: List[Tuple[str, str, str]] = []
-        for rev_email, review in ordered:
+        for rev_email, review, review_target in display_reviews:
             note = review.get('note', '')
             if not note:
                 continue
@@ -1556,7 +1546,7 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
             else:
                 name = review.get('name', rev_email)
                 header = name
-            colour = self._reviewer_colour(rev_email, target, ts)
+            colour = self._reviewer_colour(rev_email, review_target, ts)
             note_entries.append((header, colour, note))
 
         def _on_note(result: Optional[str]) -> None:

-- 
2.47.3

