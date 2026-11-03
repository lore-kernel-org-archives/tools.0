Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793730822;
	b=XkZoa/da5kWAGu7GUL6NUYoo/tLzQCYANsc8cqWuGh6LSjFUD1u4J9g0Zv2vcmQpykc/
	 +0ItNhMocTPFvVVyojTJmKUs3d8Z4zRQaHR6r9y5nLT8SPNYl6t29JGVWPL8TMexOQQME
	 Xh/cpZ5aoOck1JugNKcyqNIVowpA5Jnc+yTUnGD1d7thi7zC+c1S8oBk/GpdUAqgfzr1e
	 8jDH/aThkbuJQKLUHEC/oJQNzCkuYDTCM7tnr+8RusXJVlV8wpKbMvBQTrRlewpAQlxrT
	 trI7eYikQ4yC7Q5giDIIUC0XYeyo1cFe8sMt7pkPSrbcNpWlQlOg8X3N2SYBbv/xgYA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793730822;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=SlQF7Rs+0mG4XHRRem7mu5BGZQek87cOriaywcOfeXU=;
	b=U9ouGGqW9EgQ5MWSEoEey9V5UKXwJ8HMcB51V5I/PV46MTuxfwhcyaVxdnS3e8mQ9vkM
	 isEwQejSMuVz1GuCB6/fsWxfcl2fWsIJYSzy+VZtRyKGcnGtxU4CLcBJTJy+hemfY+ZBD
	 hoeQ9tx84W5eln0hXk1aOzJVXs+GXfDZ3B9Ahv/UqGUcONE4jj1Xc7AWwtqhSNvNsSbPY
	 eJtYvAPCwNDIMl3XZiWKqht4xzf13fq9jX6SLz95AiHpZsIOHrvMKstwF9/09+NEvx3O3
	 38ly2ClBioyCYpyWQdiLtf1hw9aWewWSyF/CoDUZ06Cn5OTUwZsAUWDSO+4J6OYpIkg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q6TgE6Sf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB907606A329
	for <tools@linux.kernel.org>; Tue,  3 Nov 2026 18:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q6TgE6Sf
Received: by smtp.kernel.org (Postfix)
	id 4DAAB1F00A2B; Tue,  3 Nov 2026 18:33:41 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793730821;
	b=e7lsAm9BWJ3fyNQlf5MDJBo/ALL0IrBCbVpcCdm2+PViLCpIqOtM0zKYvMBdu9FWa1FW
	 bmLpYlC/3KVhkJS7uop8MBoBKZF0wCARYVBFNGHmmAEpLo7OJdidrgJVu0/AutSDxlLRH
	 IgnEqg7GsiGAhP96YhPFKdjnMU1crfQ5YNWJblqGIznWLRmZg3tsoMeUY69ad7YENkBCA
	 b7gYgkWISlbzFLLissgU0cRSrx2T0B3rFXO/TU9yKQXDg1X1FV9QUi4OjoprVOvppCVA0
	 lEWQn7ddDSwzh7mgrpLQPzl3jAYEaHUY1j7NC5c5PyBhV50cwkd0Pgx6Jiz4abkmKFA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793730821;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=SlQF7Rs+0mG4XHRRem7mu5BGZQek87cOriaywcOfeXU=;
	b=UZj25QMZaWv4wtnuiWmwOoHKxr24x/ucOKWqExgKf7LP/Hp/7Lp/07bBcRgmQ02S8YKV
	 KNFfrd6ZTf4Rm5I2bFNSDIpc86liXmbxOIVsipzcmJdQBhXNcCnGR3jP9LNe1zJ1V0Ntc
	 Z1HFjRy9pulLUySwmWAy5FI3lGzNIg6uCxpOA58IF7KNoPTfdqjVnd7p8DlvDqZ4LsHn6
	 m2eLc4GHIEdRCotyNDVcMkLzpB5ODAL3KtUwzpmyuKAS6FLr5zNVf+Jbh1Ysn8QomXMwZ
	 H9jQsUc7v/2twIVLgrxswRJz1bInOqImszzooAQsfwg+D1bLMh6q1EkREwplSEX5nig==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q6TgE6Sf;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 162571F00A1E
	for <tools@kernel.org>; Tue,  3 Nov 2026 18:33:38 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q6TgE6Sf
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 162571F00A1E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48bbb06e746so2271255f8f.3
        for <tools@kernel.org>; Tue, 03 Nov 2026 10:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793730817; x=1794335617; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SlQF7Rs+0mG4XHRRem7mu5BGZQek87cOriaywcOfeXU=;
        b=Q6TgE6SfRL2/inGGM6PONHu5cYOJISh8RYdyt9wJ7tRRs3vwZYWhck3JPOF6f7oqhh
         f1F9gFn0TKPEvvsgUeB7AZobRELAxPRGwzfzp4HdmVUuwwsm3WIh/HhhDRJ+cZi227Z+
         6h142F0eWf2SjKsVWgL0w9j+ev38GkyhyFsce3/A/QzUNo5frdrcKnTtpN99DaOwU6QY
         0sPPIQNrVpFWGDwzOw1KQhCsTdxDXYVVpRi13Su9BE37Qny2ah2qixj5MoieeJ4INVof
         UkhI3k33E9P8IDeWBwRSS66T6boedewOkHDR+6ZvUbctE3GtBfWS6C5aFbpEEeGkXkOP
         HyIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793730817; x=1794335617;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SlQF7Rs+0mG4XHRRem7mu5BGZQek87cOriaywcOfeXU=;
        b=xM2HfhIcu4Ml7n53+m1U3XR5TOWn0vxTekr253/rvaUeTxBrSqSBtFDx2b/CBW0XlC
         6kMef8p92I+Mk1f9cS8/iJsiSlcU0EiRw8LKSd6Z2fe5fSBUW+me1iYA/q6h/A7G9zqX
         Qu3wJ3hVsAhFgp7SJNzUHaKKLCzM2YMr6oQpywNarLL4ORAlEVoTuFTpqGYxEiPj1pPo
         lAQDZmQyKGl/elw40AQx+x0Sj64tgvAlWKdh7oM4S/aLiTtXyZPXBCtd+EhQ4+hMhtlj
         sje9t7OxDnGdQVGoO6vVj6knIHRtFm84TG9DBzqcJHHWD/ip2rc37cq1tE9IUlmWePXE
         kLeg==
X-Gm-Message-State: APuU4Z8v9p9X7OAtYPDSRChxFPUkZHZO0gs7vWMRHXRZEAnRwSrFCjCt
	UsSJXp3SS/GdYExAgvNRhiaOtc1Zqd/BsUNk+0hIWT0Br2xmsL251pi4G6u5ZHTf
X-Gm-Gg: AYBFou1ocrxZtp8d+dW8t+1zNlhCAjCAeutS/WNeIWM67MgWTTd5o0w3Ke8Ndb4N2T/
	Kt/m8Lgfus4uZwYAUCPbSm298R2LWvHaz1ENCqCIzauf8Vyvf4I1PY1CSHAtpJuoI6FEwDfYQa/
	2qJ1MX0Q8akbAD9jocy9vFtMkqQS5d2ajdIMHl1mXzJIAhw5jSEE+VJCeInUwRW0hAVvaxlK/sd
	16Bxg1/1aRj63C6YG+fQM3vGnuoHRQ3Js2MwobRUzL6nl8QGXC9uXz+BgVEqJtESRElMkWOTfyR
	dvwqGzotes5DfmDGktiliNlCbmAYYDJzJNA0t8ZPoKbAXtd6fD0benVgIfLhtpX8JnShirbEtIW
	1mOmpCVtq7q8ALMGrgT0j//cWcIL8eiezDdtMIHXPOXJZvOvlyp0Npb6pF1zkAyDab5jPLJdSH5
	InY+xUMPF85JusIWi82L8nRpvH2lVzM/PpAVvy/IocaGKE1LYya4CZqSdz9cGgmGSC3uCLDEWcJ
	UfyvYjTiS9Vi4WFdOQ1G1N4WoQOPEy3DP4WYj3ZilTbZFsVn4z7l9FZuA2QQE/X1qCxEMnquela
	A5aujf3R0CfAJBP++gVES2/Q/7C1xG1fBYctdejPl7PqHg==
X-Received: by 2002:a05:600c:3b88:b0:4a1:cf60:dcc3 with SMTP id 5b1f17b1804b1-4ac187a6ffcmr338893025e9.29.1793730817195;
        Tue, 03 Nov 2026 10:33:37 -0800 (PST)
Received: from 990pro.localdomain ([185.68.248.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b40ff10f00sm1749315e9.2.2026.11.03.10.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:33:36 -0800 (PST)
From: Bernhard Kaindl <bernhardkaindl7@gmail.com>
Date: Tue, 03 Nov 2026 19:33:35 +0100
Subject: [PATCH b4 4/4] review: refresh follow-ups in the background
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
Message-Id: <20261103-view-follow-ups-threaded-v1-4-11c2e2211a9f@gmail.com>
References: <20261103-view-follow-ups-threaded-v1-0-11c2e2211a9f@gmail.com>
In-Reply-To: <20261103-view-follow-ups-threaded-v1-0-11c2e2211a9f@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Bernhard Kaindl <bernhardkaindl7@gmail.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793730813; l=37262;
 i=bernhardkaindl7@gmail.com; s=20261024; h=from:subject:message-id;
 bh=06fZciaDer8oJeaZDVsdn/tsonQFHQtTSs5W9Ipgn/g=;
 b=ira1jumyIKsFh9fNI+7AbbSKd6LWijd8hyO4dTVIt2x1JDoH+ZewDQjQTyPwq7AWGcIoMq0er
 wUNVGzjahf6Cxktd+BShE00NeDCOF1Fx7ASMlo8xZMiCX5be9MRQQh6
X-Developer-Key: i=bernhardkaindl7@gmail.com; a=ed25519;
 pk=oIjnI/us0Uh5d/WP18V5IQq/FrLPUp+W0JAhJ9QCQIs=

Show the saved thread first, then fetch newer follow-ups from lore
without blocking the existing view. Merge fetched messages by Message-ID
and update the display only while the request is still current.

Keep the cached messages if lore is unavailable or some patch threads
cannot be fetched. Retain refreshed messages for the current review
session without rewriting the tracked thread snapshot.

Signed-off-by: Bernhard Kaindl <bernhardkaindl7@gmail.com>
---
 docs/maintainer/review.rst       |  11 +-
 src/b4/review_tui/_review_app.py | 139 +++++++---
 src/tests/test_tui_review.py     | 577 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 687 insertions(+), 40 deletions(-)

diff --git a/docs/maintainer/review.rst b/docs/maintainer/review.rst
index ae6731b..6b11d4a 100644
--- a/docs/maintainer/review.rst
+++ b/docs/maintainer/review.rst
@@ -817,10 +817,13 @@ in the patch selection dialog.
 **Follow-up messages**
 
 Press ``f`` to load and display follow-up messages for the series being
-reviewed. B4 first checks the locally cached thread (stored as a git
-blob in the review branch); if no local copy exists, it fetches from
-lore in the background. The ``f`` key is a toggle — pressing it again
-hides the follow-up display.
+reviewed. B4 first displays the locally cached thread, if available,
+then fetches updates from lore in the background. New replies are added
+to the open follow-up display. If the refresh fails, cached messages
+remain visible and b4 warns that they may be out of date. Refreshed
+messages are kept for the current review session; the stored thread in
+the review branch is not changed. The ``f`` key is a toggle — pressing
+it again hides the follow-up display.
 
 Press ``F`` to open follow-ups as a threaded list, or to switch an open
 chronological list to threaded order. Press ``F`` again to hide the list.
diff --git a/src/b4/review_tui/_review_app.py b/src/b4/review_tui/_review_app.py
index 39ac7bd..0979d06 100644
--- a/src/b4/review_tui/_review_app.py
+++ b/src/b4/review_tui/_review_app.py
@@ -12,6 +12,7 @@ import re
 import subprocess
 from typing import Any, Dict, List, Optional, Set, Tuple
 
+import liblore.utils
 from rich.cells import cell_len
 from rich.rule import Rule
 from rich.syntax import Syntax
@@ -49,7 +50,6 @@ from b4.review_tui._common import (
     _write_followup_trailers,
     compute_range_diff,
     filter_range_diff_for_commit,
-    get_thread_msgs,
     logger,
     mark_outgoing_seen,
     notify_quit_hint,
@@ -331,6 +331,8 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
         self._selected_followup_msgid: Optional[str] = None
         self._show_external_comments: bool = False
         self._followup_tree: bool = False
+        self._followup_generation: int = 0
+        self._followup_cache: Optional[List[email.message.EmailMessage]] = None
         self._collapsed_comment_lines: Dict[int, Tuple[str, int]] = {}
         self._reply_sent: bool = False
         self._hide_skipped: bool = False
@@ -2219,6 +2221,7 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
     def action_followups(self, threaded: bool = False) -> None:
         """Toggle follow-up comments on/off."""
         self._followup_tree = threaded
+        self._followup_generation += 1
         # ── Toggle off ────────────────────────────────────────────────────────
         if self._show_external_comments:
             self._show_external_comments = False
@@ -2235,52 +2238,93 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
 
         self._show_external_comments = True
 
-        # ── Try local blob first, fall back to lore in background ────────────
         blob_sha = self._series.get('thread-blob', '')
+        cached = self._followup_cache
+        generation = self._followup_generation
         self.notify('Loading follow-ups\u2026')
         run_lore_worker(
             self,
-            lambda: self._fetch_followups_bg(cover_msgid, blob_sha),
+            lambda: self._fetch_followups_bg(cover_msgid, blob_sha, cached, generation),
             name='_followup_worker',
         )
 
-    def _fetch_rethreaded_threads(
-        self, blob_sha: str
+    def _fetch_lore_followups(
+        self, msgid: str
     ) -> Optional[List[email.message.EmailMessage]]:
+        try:
+            return b4.get_pi_thread_by_msgid(msgid, nocache=True, quiet=True) or None
+        except liblore.OperationCancelledError:
+            raise
+        except Exception as ex:
+            logger.debug('follow-up refresh failed: %s', ex, exc_info=True)
+            return None
+
+    def _fetch_rethreaded_threads(
+        self, generation: int
+    ) -> Tuple[List[email.message.EmailMessage], bool]:
         """Fetch threads for each real patch in a rethreaded series."""
         all_msgs: List[email.message.EmailMessage] = []
         seen_msgids: Set[str] = set()
         fetched_patches: Set[str] = set()
+        incomplete = False
         for patch_meta in self._patches:
-            # One lore fetch per patch; bail promptly on cancel/exit.
-            if worker_cancelled():
-                break
+            if worker_cancelled() or generation != self._followup_generation:
+                return [], True
             pmsgid = patch_meta.get('header-info', {}).get('msgid', '')
-            if not pmsgid or pmsgid in fetched_patches:
+            if not pmsgid:
+                incomplete = True
+                continue
+            if pmsgid in fetched_patches:
                 continue
             fetched_patches.add(pmsgid)
-            thread = get_thread_msgs(
-                self._topdir, pmsgid, blob_sha=blob_sha, quiet=True
-            )
+            thread = self._fetch_lore_followups(pmsgid)
             if thread:
                 for msg in thread:
                     c_msgid = b4.LoreMessage.get_clean_msgid(msg)
                     if c_msgid and c_msgid not in seen_msgids:
                         all_msgs.append(msg)
                         seen_msgids.add(c_msgid)
-        return all_msgs or None
+            else:
+                incomplete = True
+        return all_msgs, incomplete or not fetched_patches
+
+    def _fetch_followups_bg(
+        self,
+        cover_msgid: str,
+        blob_sha: str,
+        cached: Optional[List[email.message.EmailMessage]],
+        generation: int,
+    ) -> None:
+        """Display cached follow-ups, then refresh them from Lore."""
+
+        def publish(msgs: List[email.message.EmailMessage]) -> None:
+            if generation != self._followup_generation:
+                return
+            self._followup_cache = msgs
+            self._load_followup_msgs(msgs)
+            self._mark_followup_msgs_seen(msgs)
+            self._detect_maintainer_replies(msgs)
 
-    def _fetch_followups_bg(self, cover_msgid: str, blob_sha: str) -> None:
-        """Load follow-ups from local blob or lore (background thread)."""
         try:
             with _quiet_worker():
+                if cached is None and blob_sha:
+                    try:
+                        mbox_bytes = b4.review.tracking.get_thread_mbox(
+                            self._topdir, blob_sha
+                        )
+                        if mbox_bytes:
+                            cached = liblore.utils.split_mbox(mbox_bytes) or None
+                    except Exception as ex:
+                        logger.debug('follow-up snapshot failed: %s', ex, exc_info=True)
+                if cached:
+                    self.app.call_from_thread(publish, cached)
+                if worker_cancelled() or generation != self._followup_generation:
+                    return
                 if self._series.get('is-rethreaded'):
-                    # Rethreaded series: fetch each real patch's thread
-                    msgs = self._fetch_rethreaded_threads(blob_sha)
+                    msgs, incomplete = self._fetch_rethreaded_threads(generation)
                 else:
-                    msgs = get_thread_msgs(
-                        self._topdir, cover_msgid, blob_sha=blob_sha, quiet=True
-                    )
+                    msgs = self._fetch_lore_followups(cover_msgid) or []
+                    incomplete = not msgs
         except liblore.OperationCancelledError:
             # The fetch was cancelled (app shutdown or navigating away).
             # Leave the UI as-is rather than surfacing a spurious error.
@@ -2291,11 +2335,22 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
             # "Loading follow-ups…" notice dangling.  Fall through to the
             # not-loaded path, which notifies and still shows the patch list.
             logger.debug('follow-up fetch failed: %s', ex, exc_info=True)
-            msgs = None
+            msgs = []
+            incomplete = True
 
+        if worker_cancelled() or generation != self._followup_generation:
+            return
         if not msgs:
 
             def _no_msgs() -> None:
+                if generation != self._followup_generation:
+                    return
+                if cached:
+                    self.notify(
+                        'Lore refresh incomplete; follow-ups may be out of date',
+                        severity='warning',
+                    )
+                    return
                 self.notify('Could not load thread', severity='error')
                 # Still refresh to show external comments (sashiko etc.)
                 self._populate_patch_list()
@@ -2304,23 +2359,35 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
             self.app.call_from_thread(_no_msgs)
             return
 
-        # Cache the thread locally if we fetched from lore.
-        if not blob_sha:
-            change_id = self._series.get('change-id')
-            if change_id:
-                with _quiet_worker():
-                    new_sha = b4.review.tracking._store_thread_blob(
-                        self._topdir, change_id, msgs
-                    )
-                if new_sha:
-                    self._series['thread-blob'] = new_sha
+        merged = list(cached or [])
+        positions = {
+            msgid: index
+            for index, msg in enumerate(merged)
+            if (msgid := b4.LoreMessage.get_clean_msgid(msg))
+        }
+        for msg in msgs:
+            msgid = b4.LoreMessage.get_clean_msgid(msg)
+            if msgid and msgid in positions:
+                merged[positions[msgid]] = msg
+            else:
+                if msgid:
+                    positions[msgid] = len(merged)
+                merged.append(msg)
+        if not cached or [msg.as_bytes() for msg in merged] != [
+            msg.as_bytes() for msg in cached
+        ]:
+            self.app.call_from_thread(publish, merged)
 
-        def _finish() -> None:
-            self._load_followup_msgs(msgs)
-            self._mark_followup_msgs_seen(msgs)
-            self._detect_maintainer_replies(msgs)
+        if incomplete:
+
+            def _warn() -> None:
+                if generation == self._followup_generation:
+                    self.notify(
+                        'Lore refresh incomplete; follow-ups may be out of date',
+                        severity='warning',
+                    )
 
-        self.app.call_from_thread(_finish)
+            self.app.call_from_thread(_warn)
 
     def _mark_followup_msgs_seen(self, msgs: List[Any]) -> None:
         """Mark all follow-up messages as Seen in the messages DB."""
diff --git a/src/tests/test_tui_review.py b/src/tests/test_tui_review.py
index c463f47..ce62f17 100644
--- a/src/tests/test_tui_review.py
+++ b/src/tests/test_tui_review.py
@@ -11,12 +11,15 @@ via git rebase -i), range-diff filtering and gating, check-detail
 rendering, and the branch-restore logic on exit.
 """
 
+import asyncio
 import datetime
 import email.message
 import json
+import threading
 from typing import Any, Dict, List, Optional, Tuple
 from unittest import mock
 
+import liblore.utils
 import pytest
 
 pytest.importorskip('textual')
@@ -873,6 +876,580 @@ class TestFollowupTree:
                         assert not items
 
 
+def _create_cached_followups(
+    gitdir: str, change_id: str
+) -> Tuple[str, str, List[email.message.EmailMessage]]:
+    patch_id = f'{change_id}-patch1@example.com'
+    branch = create_review_branch(
+        gitdir,
+        change_id,
+        patch_messages=['patch 1'],
+        series_extra={'header-info': {'msgid': 'cover@example.com'}},
+    )
+    messages = [
+        make_msg('cover@example.com', '[PATCH 0/1] Test series'),
+        make_msg(
+            patch_id,
+            '[PATCH 1/1] patch 1',
+            body=MINIMAL_DIFF,
+            in_reply_to='cover@example.com',
+        ),
+        make_msg(
+            'review@example.com',
+            'Re: [PATCH 1/1] patch 1',
+            body='Please clarify this change.\n',
+            in_reply_to=patch_id,
+        ),
+        make_msg(
+            'reply@example.com',
+            'Re: [PATCH 1/1] patch 1',
+            body='I will clarify it.\n',
+            in_reply_to='review@example.com',
+        ),
+    ]
+    stale_sha = b4.review.tracking._store_thread_blob(gitdir, change_id, messages[:-1])
+    assert stale_sha
+    return branch, stale_sha, messages
+
+
+class TestFollowupRefresh:
+    @pytest.mark.parametrize('select_followup', [False, True])
+    @pytest.mark.asyncio
+    async def test_refresh_preserves_viewer_scroll_position(
+        self, gitdir: str, select_followup: bool
+    ) -> None:
+        change_id = 'followup-scroll'
+        branch, _stale_sha, messages = _create_cached_followups(gitdir, change_id)
+        messages[2].set_payload(
+            '\n'.join(f'Review line {index}' for index in range(80))
+        )
+        assert b4.review.tracking._store_thread_blob(gitdir, change_id, messages[:-1])
+        app = ReviewApp(_build_session(gitdir, branch))
+        started = threading.Event()
+        release = threading.Event()
+
+        def fetch(_msgid: str, **_kwargs: Any) -> Any:
+            started.set()
+            assert release.wait(10)
+            return messages
+
+        with mock.patch('b4.get_pi_thread_by_msgid', side_effect=fetch):
+            async with app.run_test(size=(120, 30)) as pilot:
+                try:
+                    await pilot.press('f')
+                    assert await asyncio.to_thread(started.wait, 5)
+                    patch_list = app.query_one('#patch-list', ListView)
+                    patch_item = next(
+                        item
+                        for item in patch_list.children
+                        if isinstance(item, PatchListItem) and item.patch_idx == 1
+                    )
+                    patch_list.index = patch_list.children.index(patch_item)
+                    await pilot.pause()
+                    if select_followup:
+                        item = next(
+                            child
+                            for child in patch_list.children
+                            if isinstance(child, FollowupItem)
+                        )
+                        patch_list.index = patch_list.children.index(item)
+                        await pilot.pause()
+                        assert _selected_followup(app) == 'review@example.com'
+                    viewer = app.query_one('#diff-viewer', RichLog)
+                    viewer.scroll_to(y=20, animate=False)
+                    await pilot.pause()
+                    before = viewer.scroll_y
+                    assert before > 0
+                finally:
+                    release.set()
+                await app.workers.wait_for_complete()
+                await pilot.pause()
+                assert viewer.scroll_y == before
+                if select_followup:
+                    assert _selected_followup(app) == 'review@example.com'
+
+    @pytest.mark.parametrize('cached', [False, True])
+    @pytest.mark.parametrize('error', [None, RuntimeError('Lore unavailable')])
+    @pytest.mark.asyncio
+    async def test_failed_refresh_preserves_available_snapshot(
+        self, gitdir: str, cached: bool, error: Optional[Exception]
+    ) -> None:
+        branch, _stale_sha, _messages = _create_cached_followups(
+            gitdir, 'followup-offline'
+        )
+        app = ReviewApp(_build_session(gitdir, branch))
+        if not cached:
+            app._series['thread-blob'] = ''
+        with (
+            mock.patch(
+                'b4.get_pi_thread_by_msgid', return_value=None, side_effect=error
+            ),
+            mock.patch.object(app, 'notify') as notify,
+        ):
+            async with app.run_test(size=(120, 30)) as pilot:
+                await pilot.press('f')
+                await app.workers.wait_for_complete()
+                await pilot.pause()
+                if cached:
+                    assert [entry['msgid'] for entry in app._followup_comments[1]] == [
+                        'review@example.com'
+                    ]
+                    notify.assert_any_call(
+                        'Lore refresh incomplete; follow-ups may be out of date',
+                        severity='warning',
+                    )
+                else:
+                    assert not app._followup_comments
+                    notify.assert_any_call('Could not load thread', severity='error')
+
+    @pytest.mark.asyncio
+    async def test_cancelled_refresh_leaves_cached_followups_visible(
+        self, gitdir: str
+    ) -> None:
+        branch, _stale_sha, _messages = _create_cached_followups(
+            gitdir, 'followup-cancel'
+        )
+        app = ReviewApp(_build_session(gitdir, branch))
+        with (
+            mock.patch(
+                'b4.get_pi_thread_by_msgid',
+                side_effect=liblore.OperationCancelledError('cancelled'),
+            ),
+            mock.patch.object(app, 'notify') as notify,
+        ):
+            async with app.run_test(size=(120, 30)) as pilot:
+                await pilot.press('f')
+                await app.workers.wait_for_complete()
+                await pilot.pause()
+                assert [entry['msgid'] for entry in app._followup_comments[1]] == [
+                    'review@example.com'
+                ]
+                assert not any(
+                    call.kwargs.get('severity') in {'error', 'warning'}
+                    for call in notify.call_args_list
+                )
+
+    @pytest.mark.parametrize('blob_sha', ['', '0' * 40])
+    @pytest.mark.asyncio
+    async def test_missing_snapshot_fetches_fresh_followups(
+        self, gitdir: str, blob_sha: str
+    ) -> None:
+        branch, _stale_sha, messages = _create_cached_followups(
+            gitdir, 'followup-missing-cache'
+        )
+        app = ReviewApp(_build_session(gitdir, branch))
+        app._series['thread-blob'] = blob_sha
+        with mock.patch('b4.get_pi_thread_by_msgid', return_value=messages) as lore:
+            async with app.run_test(size=(120, 30)) as pilot:
+                await pilot.press('f')
+                await app.workers.wait_for_complete()
+                await pilot.pause()
+                lore.assert_called_once_with(
+                    'cover@example.com', nocache=True, quiet=True
+                )
+                assert [entry['msgid'] for entry in app._followup_comments[1]] == [
+                    'review@example.com',
+                    'reply@example.com',
+                ]
+
+    @pytest.mark.asyncio
+    async def test_refresh_merges_new_and_cached_followups(self, gitdir: str) -> None:
+        branch, _stale_sha, messages = _create_cached_followups(
+            gitdir, 'followup-merge'
+        )
+        app = ReviewApp(_build_session(gitdir, branch))
+        with mock.patch(
+            'b4.get_pi_thread_by_msgid', return_value=messages[:2] + messages[3:]
+        ):
+            async with app.run_test(size=(120, 30)) as pilot:
+                await pilot.press('F')
+                await app.workers.wait_for_complete()
+                await pilot.pause()
+                assert [entry['msgid'] for entry in app._followup_comments[1]] == [
+                    'review@example.com',
+                    'reply@example.com',
+                ]
+
+    @pytest.mark.asyncio
+    async def test_unchanged_refresh_does_not_rebuild_view(self, gitdir: str) -> None:
+        branch, stale_sha, _messages = _create_cached_followups(gitdir, 'followup-same')
+        app = ReviewApp(_build_session(gitdir, branch))
+        mbox = b4.review.tracking.get_thread_mbox(gitdir, stale_sha)
+        assert mbox is not None
+        messages = liblore.utils.split_mbox(mbox)
+        with (
+            mock.patch('b4.get_pi_thread_by_msgid', return_value=messages),
+            mock.patch.object(
+                app, '_load_followup_msgs', wraps=app._load_followup_msgs
+            ) as load,
+        ):
+            async with app.run_test(size=(120, 30)) as pilot:
+                await pilot.press('f')
+                await app.workers.wait_for_complete()
+                await pilot.pause()
+                load.assert_called_once()
+
+    @pytest.mark.asyncio
+    async def test_cached_followups_are_visible_during_refresh(
+        self, gitdir: str
+    ) -> None:
+        branch, _stale_sha, messages = _create_cached_followups(gitdir, 'followup-live')
+        messages.append(
+            make_msg(
+                'earlier@example.com',
+                'Re: [PATCH 1/1] patch 1',
+                date='Mon, 23 Mar 2026 11:00:00 +0000',
+                body='An earlier review.\n',
+                in_reply_to='followup-live-patch1@example.com',
+            )
+        )
+        app = ReviewApp(_build_session(gitdir, branch))
+        started = threading.Event()
+        release = threading.Event()
+
+        def fetch(_msgid: str, **_kwargs: Any) -> Any:
+            started.set()
+            assert release.wait(10)
+            return messages
+
+        with mock.patch('b4.get_pi_thread_by_msgid', side_effect=fetch):
+            async with app.run_test(size=(120, 30)) as pilot:
+                try:
+                    await pilot.press('F')
+                    assert await asyncio.to_thread(started.wait, 3)
+                    await pilot.pause()
+                    assert [entry['msgid'] for entry in app._followup_comments[1]] == [
+                        'review@example.com'
+                    ]
+                    patch_list = app.query_one('#patch-list', ListView)
+                    selected = next(
+                        item
+                        for item in patch_list.children
+                        if isinstance(item, FollowupItem)
+                    )
+                    patch_list.index = patch_list.children.index(selected)
+                    await pilot.pause()
+                    assert _selected_followup(app) == 'review@example.com'
+                    app._patches[0]['reviews'] = {
+                        'reviewer@example.com': {'note': 'Keep this edit'}
+                    }
+                    assert app._save_tracking()
+                finally:
+                    release.set()
+                await app.workers.wait_for_complete()
+                await pilot.pause()
+                assert [entry['msgid'] for entry in app._followup_comments[1]] == [
+                    'earlier@example.com',
+                    'review@example.com',
+                    'reply@example.com',
+                ]
+                assert _selected_followup(app) == 'review@example.com'
+                _cover, tracking = b4.review.load_tracking(gitdir, branch)
+                assert tracking['patches'][0]['reviews']['reviewer@example.com'] == {
+                    'note': 'Keep this edit'
+                }
+
+    @pytest.mark.asyncio
+    async def test_switch_to_threaded_during_refresh(self, gitdir: str) -> None:
+        branch, _stale_sha, messages = _create_cached_followups(
+            gitdir, 'followup-switch'
+        )
+        app = ReviewApp(_build_session(gitdir, branch))
+        started = threading.Event()
+        release = threading.Event()
+
+        def fetch(_msgid: str, **_kwargs: Any) -> Any:
+            started.set()
+            assert release.wait(10)
+            return messages
+
+        with mock.patch('b4.get_pi_thread_by_msgid', side_effect=fetch) as lore:
+            async with app.run_test(size=(120, 30)) as pilot:
+                try:
+                    await pilot.press('f')
+                    assert await asyncio.to_thread(started.wait, 5)
+                    await pilot.press('F')
+                    assert app._show_external_comments and app._followup_tree
+                finally:
+                    release.set()
+                await app.workers.wait_for_complete()
+                await pilot.pause()
+                items = [
+                    item
+                    for item in app.query_one('#patch-list', ListView).children
+                    if isinstance(item, FollowupItem)
+                ]
+                assert [item.msgid for item in items] == [
+                    'review@example.com',
+                    'reply@example.com',
+                ]
+                assert [item._indent for item in items] == [4, 6]
+                lore.assert_called_once_with(
+                    'cover@example.com', nocache=True, quiet=True
+                )
+
+    @pytest.mark.parametrize('uppercase', [False, True])
+    @pytest.mark.asyncio
+    async def test_refresh_does_not_replace_own_draft_comments(
+        self, gitdir: str, uppercase: bool
+    ) -> None:
+        branch, _stale_sha, messages = _create_cached_followups(
+            gitdir, 'followup-own-draft'
+        )
+        app = ReviewApp(_build_session(gitdir, branch))
+        email_addr = str(app._usercfg['email'])
+        messages.append(
+            make_msg(
+                'my-review@example.com',
+                'Re: [PATCH 1/1] patch 1',
+                from_addr=f'Me <{email_addr.upper() if uppercase else email_addr}>',
+                in_reply_to='followup-own-draft-patch1@example.com',
+                body=(
+                    '> diff --git a/foo.c b/foo.c\n'
+                    '> @@ -1,3 +1,4 @@\n'
+                    '> +    bar();\n\n'
+                    'Earlier feedback.\n'
+                ),
+            )
+        )
+        started = threading.Event()
+        release = threading.Event()
+
+        def fetch(_msgid: str, **_kwargs: Any) -> Any:
+            started.set()
+            assert release.wait(10)
+            return messages
+
+        draft = [{'path': 'foo.c', 'line': 1, 'text': 'My unsent draft'}]
+        with mock.patch('b4.get_pi_thread_by_msgid', side_effect=fetch):
+            async with app.run_test(size=(120, 30)) as pilot:
+                try:
+                    await pilot.press('f')
+                    assert await asyncio.to_thread(started.wait, 5)
+                    app._patches[0]['reviews'] = {email_addr: {'comments': draft}}
+                    assert app._save_tracking()
+                finally:
+                    release.set()
+                await app.workers.wait_for_complete()
+                await pilot.pause()
+                assert app._patches[0]['reviews'][email_addr]['comments'] == draft
+                assert set(app._patches[0]['reviews']) == {email_addr}
+                _cover, tracking = b4.review.load_tracking(gitdir, branch)
+                assert (
+                    tracking['patches'][0]['reviews'][email_addr]['comments'] == draft
+                )
+
+    @pytest.mark.asyncio
+    async def test_rethreaded_partial_refresh_keeps_cached_replies(
+        self, gitdir: str
+    ) -> None:
+        change_id = 'followup-rethreaded'
+        patch_ids = [f'{change_id}-patch{index}@example.com' for index in (1, 2)]
+        branch = create_review_branch(
+            gitdir,
+            change_id,
+            patch_messages=['patch 1', 'patch 2'],
+            series_extra={
+                'header-info': {'msgid': patch_ids[0]},
+                'is-rethreaded': True,
+            },
+        )
+        patches = [
+            make_msg(
+                patch_ids[index], f'[PATCH {index + 1}/2] patch', body=MINIMAL_DIFF
+            )
+            for index in range(2)
+        ]
+        reviews = [
+            make_msg(
+                f'review-{index + 1}@example.com',
+                f'Re: [PATCH {index + 1}/2] patch',
+                body=f'Comment on patch {index + 1}.\n',
+                in_reply_to=patch_ids[index],
+            )
+            for index in range(2)
+        ]
+        reply = make_msg(
+            'reply-1@example.com',
+            'Re: [PATCH 1/2] patch',
+            body='A new response.\n',
+            in_reply_to='review-1@example.com',
+        )
+        stale_sha = b4.review.tracking._store_thread_blob(
+            gitdir, change_id, patches + reviews
+        )
+        assert stale_sha
+        app = ReviewApp(_build_session(gitdir, branch))
+
+        def fetch(msgid: str, **_kwargs: Any) -> Any:
+            if msgid == patch_ids[0]:
+                return [patches[0], reviews[0], reply]
+            raise RuntimeError('Second patch unavailable')
+
+        with (
+            mock.patch('b4.get_pi_thread_by_msgid', side_effect=fetch) as lore,
+            mock.patch.object(app, 'notify') as notify,
+        ):
+            async with app.run_test(size=(120, 30)) as pilot:
+                await pilot.press('F')
+                await app.workers.wait_for_complete()
+                await pilot.pause()
+
+                assert lore.call_args_list == [
+                    mock.call(patch_ids[0], nocache=True, quiet=True),
+                    mock.call(patch_ids[1], nocache=True, quiet=True),
+                ]
+                assert [entry['msgid'] for entry in app._followup_comments[1]] == [
+                    'review-1@example.com',
+                    'reply-1@example.com',
+                ]
+                assert [entry['msgid'] for entry in app._followup_comments[2]] == [
+                    'review-2@example.com'
+                ]
+                notify.assert_any_call(
+                    'Lore refresh incomplete; follow-ups may be out of date',
+                    severity='warning',
+                )
+
+    @pytest.mark.asyncio
+    async def test_checked_out_branch_keeps_updates_in_session(
+        self, gitdir: str
+    ) -> None:
+        branch, stale_sha, messages = _create_cached_followups(
+            gitdir, 'followup-checked-out'
+        )
+        status, output = b4.git_run_command(gitdir, ['checkout', '-q', branch])
+        assert status == 0, output
+        app = ReviewApp(_build_session(gitdir, branch))
+
+        with (
+            mock.patch(
+                'b4.get_pi_thread_by_msgid', side_effect=[messages, None]
+            ) as lore,
+            mock.patch('b4.review.tracking._store_thread_blob') as store,
+            mock.patch.object(app, 'notify') as notify,
+        ):
+            async with app.run_test(size=(120, 30)) as pilot:
+                await pilot.press('f')
+                await app.workers.wait_for_complete()
+                await pilot.pause()
+                await pilot.press('f')
+                await pilot.press('f')
+                await app.workers.wait_for_complete()
+                await pilot.pause()
+
+                assert [entry['msgid'] for entry in app._followup_comments[1]] == [
+                    'review@example.com',
+                    'reply@example.com',
+                ]
+                assert lore.call_count == 2
+                store.assert_not_called()
+                notify.assert_any_call(
+                    'Lore refresh incomplete; follow-ups may be out of date',
+                    severity='warning',
+                )
+                _cover, tracking = b4.review.load_tracking(gitdir, branch)
+                assert tracking['series']['thread-blob'] == stale_sha
+
+    @pytest.mark.asyncio
+    async def test_older_refresh_cannot_replace_newer_followups(
+        self, gitdir: str
+    ) -> None:
+        branch, _stale_sha, messages = _create_cached_followups(gitdir, 'followup-race')
+        app = ReviewApp(_build_session(gitdir, branch))
+        newer = make_msg(
+            'newer@example.com',
+            'Re: [PATCH 1/1] patch 1',
+            body='Another response.\n',
+            in_reply_to='reply@example.com',
+        )
+        started = threading.Event()
+        release = threading.Event()
+        newer_loaded = threading.Event()
+        lock = threading.Lock()
+        fetch_count = 0
+        original_load = app._load_followup_msgs
+
+        def fetch(_msgid: str, **_kwargs: Any) -> Any:
+            nonlocal fetch_count
+            with lock:
+                fetch_count += 1
+                number = fetch_count
+            if number == 1:
+                started.set()
+                assert release.wait(10)
+                return messages[:-1]
+            return messages + [newer]
+
+        def observe_load(loaded: List[Any]) -> None:
+            original_load(loaded)
+            if any(
+                b4.LoreMessage.get_clean_msgid(msg) == 'newer@example.com'
+                for msg in loaded
+            ):
+                newer_loaded.set()
+
+        with (
+            mock.patch('b4.get_pi_thread_by_msgid', side_effect=fetch),
+            mock.patch.object(app, '_load_followup_msgs', side_effect=observe_load),
+        ):
+            async with app.run_test(size=(120, 30)) as pilot:
+                try:
+                    await pilot.press('f')
+                    assert await asyncio.to_thread(started.wait, 5)
+                    await pilot.press('f')
+                    await pilot.press('F')
+                    assert await asyncio.to_thread(newer_loaded.wait, 5)
+                finally:
+                    release.set()
+                await app.workers.wait_for_complete()
+                await pilot.pause()
+
+                assert fetch_count == 2
+                assert app._show_external_comments and app._followup_tree
+                assert [entry['msgid'] for entry in app._followup_comments[1]] == [
+                    'review@example.com',
+                    'reply@example.com',
+                    'newer@example.com',
+                ]
+
+    @pytest.mark.asyncio
+    async def test_hiding_followups_discards_inflight_results(
+        self, gitdir: str
+    ) -> None:
+        branch, _stale_sha, messages = _create_cached_followups(gitdir, 'followup-hide')
+        app = ReviewApp(_build_session(gitdir, branch))
+        started = threading.Event()
+        release = threading.Event()
+
+        def fetch(_msgid: str, **_kwargs: Any) -> Any:
+            started.set()
+            assert release.wait(10)
+            return messages
+
+        with mock.patch('b4.get_pi_thread_by_msgid', side_effect=fetch):
+            async with app.run_test(size=(120, 30)) as pilot:
+                try:
+                    await pilot.press('F')
+                    assert await asyncio.to_thread(started.wait, 5)
+                    await pilot.press('F')
+                finally:
+                    release.set()
+                await app.workers.wait_for_complete()
+                await pilot.pause()
+
+                assert not app._show_external_comments
+                assert not app._followup_comments
+                assert app._followup_cache is not None
+                assert [
+                    b4.LoreMessage.get_clean_msgid(msg) for msg in app._followup_cache
+                ] == [
+                    'cover@example.com',
+                    'followup-hide-patch1@example.com',
+                    'review@example.com',
+                ]
+
+
 class TestFollowupSnipMarker:
     """Quick follow-up replies expose and resolve the snip marker."""
 

-- 
2.43.0

