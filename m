Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794933893;
	b=yp/mB/XDejzjfVyneSPyKzrf+ZFKlTLa+k+y8TuWepvNPw4CuHl2l1uXJ9SuJeHpenkc
	 jt+9PmWtS9Lw8I73vzdryzoarwB3GAdWkUGsYVNz470L9Nk0123L5QKT2TUK+7pQN3OTg
	 ipP66dZp7bkWuGv7vLWeKCKu6AOZEANoeeKGK1r69StylsxLTzHbbUZet+UdFumwgHy9c
	 VE863qOmgArdXijuqVlfJayTZGXZXSTfA4SgvM5KGs83Chet3TVSvxrNvLAn4EkCAKDmY
	 Zx/p5KoqCYeFf3RdlwZ9RQGfRLE+26EHsPbH0q/P5HZRPKi5uwgbQ/eXK9wkyZQ+DVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933893;
	h=Received:Delivered-To:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=vzioWAnQhl8Ygb+5ESwAJK8IOMfo2vl63aEHBa3ztDI=;
	b=TD3BRkaN9re/DG8VEaym+ocxNt8/Q1neSwq/wOM+j+B5vVY1ZkDWLkxZx9r9mtH/yJpp
	 zvPUZGDjfXxbm8LfLHEcGV8HysxlknbZ7Su7oCJPzLxFudztu221FEBK4JCexGkfrThWF
	 yMguFbjxc8oj2HsBpukL0+XlUalaWNUdGs7cqOCw35hE6pLwTET92VZ+DtoRcxselyeX+
	 KFx+wLbBLWAtv46NbV6+xcWj4fPOdcOOr6jUm0/RX2SQ9m4QDA6RmhKZwMqexQeleWbwe
	 u2phm8picL20MRFbIjyXim+EVD1SDE3RwFJ491cJXwnjS5+HUQRk8AQzL1R2/8gtZAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="KjCTy/ce";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548D7606A330
	for <tools@linux.kernel.org>; Tue, 17 Nov 2026 16:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KjCTy/ce
Received: by smtp.kernel.org (Postfix)
	id 44DCF1F000CC; Tue, 17 Nov 2026 16:44:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9D831F000CF;
	Tue, 17 Nov 2026 16:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794933893;
	bh=vzioWAnQhl8Ygb+5ESwAJK8IOMfo2vl63aEHBa3ztDI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KjCTy/cezr5Q9tKI9iT2MW/Xz0Y7wU/54MZK11d+qg5TDcoBJXuRVMNz986LC57Er
	 kV+hlLQWrZ9QAe/+SauP/1mCj0mLBRkoBCQGFgYg0Qh9anP94n5gxUJAf3NQaZhZNE
	 MlPFR/ZgmAub0PbbZmZEbDU9lNUa1SxqVseJtPgYkDlbCPnfi8xUeBx8BdNFGR8OXB
	 dFLLKGyXlUiE5T8sdlS41j0pBE1e0T6uRjUAnemVGZDa/gR1Z8aRgEnFE05Jl+LDYn
	 Uo+PB+iUs6/KtmXskOpqFyDePvuzYagO0S23uuXssM9+yaq2NPKhWddJSk5qhAndgd
	 ZALrcoRlGAVpw==
From: Brian Masney <masneyb@kernel.org>
Date: Tue, 17 Nov 2026 11:44:41 -0500
Subject: [PATCH b4 2/2] review: tui: correctly walk a series when a message
 is missing from the lore archive
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-lore-missing-msg-id-fix-v1-2-a5d13a11eb10@kernel.org>
References: <20261117-lore-missing-msg-id-fix-v1-0-a5d13a11eb10@kernel.org>
In-Reply-To: <20261117-lore-missing-msg-id-fix-v1-0-a5d13a11eb10@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Brian Masney <masneyb@kernel.org>
X-Mailer: b4 0.17-dev-f88af
X-Developer-Signature: v=1; a=openpgp-sha256; l=12315; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=bRA/OogNtNJmjFf06sfA60gICYwtEday0a8vuWZawm0=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLL+tDRoT7lYUHZjkc3BqC8/K6d/zaj4ePD0u3SVyY5aL
 KHXmY9zdZSyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjCR+VMZ/oowXFBsvndF0Lqs
 WD0+YC+PtcIhqdbKq04PF9+N/SAg2czw3607XY9vbQqToc/zkpDrbKvz9j7IX6xrsUD20K02lSW
 GfAA=
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

When a parent message does not make it's way into the lore archive, walk
the references to look for the closet ancestor that is available to
allow parsing what all is available.

A practical effect of this bug is that it can cause a trailer that
someone left will not be picked up. For example, look at the thread
linked below in the review TUI and the message from Jerome, along with
his Reviewed-by, does not show up in the TUI. With this change, the
message from Jerome shows up, along with his Reviewed-by tag.

Link: https://lore.kernel.org/linux-clk/20261112-upstream-clk-divider-large-rates-v2-0-18f3bb888b0c@baylibre.com/
Assisted-by: LLM
Signed-off-by: Brian Masney <masneyb@kernel.org>
---
 src/b4/review/tracking.py        | 38 +++++++++++++++++++++++++---
 src/b4/review_tui/_common.py     | 46 +++++++++++++++++++++++++++++++---
 src/b4/review_tui/_review_app.py |  6 ++---
 src/tests/test_tui_review.py     | 54 +++++++++++++++++++++++++++++++++++++++-
 4 files changed, 133 insertions(+), 11 deletions(-)

diff --git a/src/b4/review/tracking.py b/src/b4/review/tracking.py
index 5a1a91fb3737..048a8c357c2b 100644
--- a/src/b4/review/tracking.py
+++ b/src/b4/review/tracking.py
@@ -2756,10 +2756,33 @@ def get_thread_mbox(topdir: str, blob_sha: str) -> Optional[bytes]:
     return out
 
 
+def _next_known_from_references_local(
+    missing: str,
+    references: Optional[List[str]],
+    patch_msgids: Dict[str, int],
+    msgid_map: Dict[str, Any],
+) -> Optional[str]:
+    """Find the closest known ancestor of *missing* using References.
+
+    Duplicated from review_tui._common to avoid a cross-layer import.
+    """
+    if not references:
+        return None
+    try:
+        candidates = references[: references.index(missing)]
+    except ValueError:
+        candidates = references
+    for refid in reversed(candidates):
+        if refid in patch_msgids or refid in msgid_map:
+            return refid
+    return None
+
+
 def _resolve_patch_for_followup_local(
     in_reply_to: Optional[str],
     patch_msgids: Dict[str, int],
     msgid_map: Dict[str, Any],
+    references: Optional[List[str]] = None,
 ) -> Optional[int]:
     """Walk the in_reply_to chain to find which patch a follow-up belongs to.
 
@@ -2774,7 +2797,10 @@ def _resolve_patch_for_followup_local(
         seen.add(current)
         lmsg = msgid_map.get(current)
         if lmsg is None:
-            break
+            current = _next_known_from_references_local(
+                current, references, patch_msgids, msgid_map
+            )
+            continue
         current = lmsg.in_reply_to
     return None
 
@@ -2783,6 +2809,7 @@ def _get_followup_depth_local(
     in_reply_to: Optional[str],
     patch_msgids: Dict[str, int],
     msgid_map: Dict[str, Any],
+    references: Optional[List[str]] = None,
     max_depth: int = 5,
 ) -> int:
     """Return the threading depth of a follow-up relative to its patch.
@@ -2800,7 +2827,10 @@ def _get_followup_depth_local(
         seen.add(current)
         lmsg = msgid_map.get(current)
         if lmsg is None:
-            break
+            current = _next_known_from_references_local(
+                current, references, patch_msgids, msgid_map
+            )
+            continue
         depth += 1
         current = lmsg.in_reply_to
     return min(depth, max_depth)
@@ -2843,7 +2873,7 @@ def _parse_msgs_to_followup_comments(
     followup_comments: Dict[int, List[Dict[str, Any]]] = {}
     for lmsg in sorted(lmbx.followups, key=lambda m: m.date):
         display_idx = _resolve_patch_for_followup_local(
-            lmsg.in_reply_to, patch_msgids, lmbx.msgid_map
+            lmsg.in_reply_to, patch_msgids, lmbx.msgid_map, lmsg.references
         )
         if display_idx is None:
             continue
@@ -2865,7 +2895,7 @@ def _parse_msgs_to_followup_comments(
             'msgid': lmsg.msgid,
             'subject': lmsg.subject,
             'depth': _get_followup_depth_local(
-                lmsg.in_reply_to, patch_msgids, lmbx.msgid_map
+                lmsg.in_reply_to, patch_msgids, lmbx.msgid_map, lmsg.references
             ),
         }
         followup_comments.setdefault(display_idx, []).append(entry)
diff --git a/src/b4/review_tui/_common.py b/src/b4/review_tui/_common.py
index 41aab1ac87e2..81d46597c124 100644
--- a/src/b4/review_tui/_common.py
+++ b/src/b4/review_tui/_common.py
@@ -712,15 +712,42 @@ def _write_followup_comments(
 _FOLLOWUP_MAX_DEPTH = 5
 
 
+def _next_known_from_references(
+    missing: str,
+    references: Optional[List[str]],
+    patch_msgids: Dict[str, int],
+    msgid_map: Dict[str, 'b4.LoreMessage'],
+) -> Optional[str]:
+    """Find the closest known ancestor of *missing* using References.
+
+    When a message in the in_reply_to chain is not in the thread (e.g. it
+    never made it to the archive), the References header of the follow-up
+    still lists the rest of the ancestry.  Return the nearest entry before
+    *missing* that is either a series patch or a message we have.
+    """
+    if not references:
+        return None
+    try:
+        candidates = references[: references.index(missing)]
+    except ValueError:
+        candidates = references
+    for refid in reversed(candidates):
+        if refid in patch_msgids or refid in msgid_map:
+            return refid
+    return None
+
+
 def _get_followup_depth(
     in_reply_to: Optional[str],
     patch_msgids: Dict[str, int],
     msgid_map: Dict[str, 'b4.LoreMessage'],
+    references: Optional[List[str]] = None,
 ) -> int:
     """Return the threading depth of a follow-up relative to its patch.
 
     Depth 0 = direct reply to a patch; depth N = N hops through follow-up
     replies. Capped at _FOLLOWUP_MAX_DEPTH to prevent runaway indentation.
+    Missing messages in the chain are skipped using *references*.
     """
     depth = 0
     seen: Set[str] = set()
@@ -731,7 +758,10 @@ def _get_followup_depth(
         seen.add(current)
         lmsg = msgid_map.get(current)
         if lmsg is None:
-            break
+            current = _next_known_from_references(
+                current, references, patch_msgids, msgid_map
+            )
+            continue
         depth += 1
         current = lmsg.in_reply_to
     return min(depth, _FOLLOWUP_MAX_DEPTH)
@@ -741,9 +771,12 @@ def _resolve_patch_for_followup(
     in_reply_to: Optional[str],
     patch_msgids: Dict[str, int],
     msgid_map: Dict[str, 'b4.LoreMessage'],
+    references: Optional[List[str]] = None,
 ) -> Optional[int]:
     """Walk the in_reply_to chain to find which patch a follow-up belongs to.
 
+    If a message in the chain is missing from the thread, fall back to
+    *references* (the follow-up's References header) to keep walking.
     Returns the display index (0=cover, 1..N=patches) or None.
     """
     seen: Set[str] = set()
@@ -754,7 +787,10 @@ def _resolve_patch_for_followup(
         seen.add(current)
         lmsg = msgid_map.get(current)
         if lmsg is None:
-            break
+            current = _next_known_from_references(
+                current, references, patch_msgids, msgid_map
+            )
+            continue
         current = lmsg.in_reply_to
     return None
 
@@ -763,6 +799,7 @@ def _chain_has_additional_patch(
     in_reply_to: Optional[str],
     patch_msgids: Dict[str, int],
     msgid_map: Dict[str, 'b4.LoreMessage'],
+    references: Optional[List[str]] = None,
 ) -> bool:
     """Check whether the in-reply-to chain passes through a message that
     contains its own diff before reaching a known series patch.
@@ -779,7 +816,10 @@ def _chain_has_additional_patch(
         seen.add(current)
         lmsg = msgid_map.get(current)
         if lmsg is None:
-            break
+            current = _next_known_from_references(
+                current, references, patch_msgids, msgid_map
+            )
+            continue
         if lmsg.has_diff:
             return True
         current = lmsg.in_reply_to
diff --git a/src/b4/review_tui/_review_app.py b/src/b4/review_tui/_review_app.py
index 97cc3e778db6..fa38143688cd 100644
--- a/src/b4/review_tui/_review_app.py
+++ b/src/b4/review_tui/_review_app.py
@@ -1934,7 +1934,7 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
         all_followups = lmbx.followups + lmbx.unknowns
         for lmsg in sorted(all_followups, key=lambda m: m.date):
             display_idx = _resolve_patch_for_followup(
-                lmsg.in_reply_to, patch_msgids, lmbx.msgid_map
+                lmsg.in_reply_to, patch_msgids, lmbx.msgid_map, lmsg.references
             )
             if display_idx is None:
                 continue
@@ -1966,11 +1966,11 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
                 'subject': lmsg.full_subject,
                 'reply': lmsg.reply,
                 'depth': _get_followup_depth(
-                    lmsg.in_reply_to, patch_msgids, lmbx.msgid_map
+                    lmsg.in_reply_to, patch_msgids, lmbx.msgid_map, lmsg.references
                 ),
                 'lmsg': lmsg,
                 'replies-to-diff': _chain_has_additional_patch(
-                    lmsg.in_reply_to, patch_msgids, lmbx.msgid_map
+                    lmsg.in_reply_to, patch_msgids, lmbx.msgid_map, lmsg.references
                 ),
             }
             self._followup_comments.setdefault(display_idx, []).append(entry)
diff --git a/src/tests/test_tui_review.py b/src/tests/test_tui_review.py
index e164bf646154..b212e7f7aa85 100644
--- a/src/tests/test_tui_review.py
+++ b/src/tests/test_tui_review.py
@@ -26,7 +26,11 @@ from textual.widgets import ListView
 import b4
 import b4.review
 import b4.review.tracking
-from b4.review_tui._common import filter_range_diff_for_commit
+from b4.review_tui._common import (
+    _get_followup_depth,
+    _resolve_patch_for_followup,
+    filter_range_diff_for_commit,
+)
 from b4.review_tui._review_app import FollowupItem, PatchListItem, ReviewApp
 
 from .helpers.tracking import create_review_branch
@@ -1029,3 +1033,51 @@ class TestPatchListItemPreMountStyling:
         """The held reference must be what compose() yields, not a copy."""
         item = PatchListItem('a patch', 1, 'done')
         assert list(item.compose()) == [item._label]
+
+
+class TestFollowupThreadingMissingParent:
+    """A follow-up whose In-Reply-To parent never reached the archive must
+    still be attached to its patch by walking its References header."""
+
+    # cover <- patch1 <- review <- reply <- (missing) <- late-reply
+    PATCH_MSGIDS = {'cover@x': 0, 'patch1@x': 1}
+    REFERENCES = ['cover@x', 'patch1@x', 'review@x', 'reply@x', 'missing@x']
+
+    @staticmethod
+    def _msgid_map() -> Dict[str, Any]:
+        return {
+            'review@x': mock.Mock(in_reply_to='patch1@x', has_diff=False),
+            'reply@x': mock.Mock(in_reply_to='review@x', has_diff=False),
+        }
+
+    def test_resolves_patch_through_references(self) -> None:
+        assert (
+            _resolve_patch_for_followup(
+                'missing@x', self.PATCH_MSGIDS, self._msgid_map(), self.REFERENCES
+            )
+            == 1
+        )
+
+    def test_depth_skips_missing_parent(self) -> None:
+        assert (
+            _get_followup_depth(
+                'missing@x', self.PATCH_MSGIDS, self._msgid_map(), self.REFERENCES
+            )
+            == 2
+        )
+
+    def test_without_references_is_unresolved(self) -> None:
+        assert (
+            _resolve_patch_for_followup(
+                'missing@x', self.PATCH_MSGIDS, self._msgid_map()
+            )
+            is None
+        )
+
+    def test_tracking_copy_resolves_patch_through_references(self) -> None:
+        assert (
+            b4.review.tracking._resolve_patch_for_followup_local(
+                'missing@x', self.PATCH_MSGIDS, self._msgid_map(), self.REFERENCES
+            )
+            == 1
+        )

-- 
2.56.1

