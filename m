Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D093C13ED
	for <tools@linux.kernel.org>; Tue, 10 Mar 2026 16:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773159786; cv=none; b=AuVnf/jrtU5vAVElQp5t8tfWGDCuzTkRsooHN4/PFTQSKlmVSZZFGHmRB5p3kt/9F/tQblwtgqK4whWZ+jlgjVcHgENzZDkn+fuX1zGf42PKb9ivLgu0w1NA3uCaplbbb68E4maV6/kzk/1vKpAOrWjt5Vnlc9vDvIAAB5pzOl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773159786; c=relaxed/simple;
	bh=0uXQ9oqDwZGADB+TsWwdzwvtridCAAYPOWEB6UBfOSU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LbL+lJfqBvdlRg6WsuBTxJoif5NmHTduFWK1eH5MJmpf+jNO/FKTLZjk/LXJJh6alznNH7+1e6nydl+O60la++9xZqVKTwgyCUGR6s2URCKhc5rSw6KiLD6g/amFt/rsVspY58zrbaFxWpuCKECMRTFynVfBCrPU+LQLV3Gy1Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T04qm3V1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T04qm3V1"
Received: by smtp.kernel.org (Postfix)
	id AF8D5C19425; Tue, 10 Mar 2026 16:23:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 220AFC19423;
	Tue, 10 Mar 2026 16:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773159785;
	bh=0uXQ9oqDwZGADB+TsWwdzwvtridCAAYPOWEB6UBfOSU=;
	h=From:Date:Subject:To:Cc:From;
	b=T04qm3V1NypFUk0ujvCAnOiuz/WeYYHJlnWjfmI1XWIey+Vm0SaCQQd+W/03ANOSy
	 w2BCQXBNpqc4FK2LYuVMcP9u5toQUQAoZcCGjw+CeeigKPjJqv0gdWLyUiEsxCjoh8
	 T/tahBy6wBO9GEYgayCyrz6tOwu8I+V+5k7tlVsUC5xuY2fbjmp6Ze1YNqe31OyzYG
	 KNi5dJQ+/1+xKZ6Q4ZG7XyMqCLQhoBvOQVoAtb7B1j7h7Wzw9muP6wJy1HN+B+2aCj
	 7EhdS0QdR96SmTZRckYOx3K7HeOhwX2/1HkohRGKdbcxnSdJstO2QnrIwhIClytGtf
	 LOEyzTmLf08ww==
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 10 Mar 2026 12:22:47 -0400
Subject: [PATCH b4] review: implement reply to selected follow-up
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-review-reply-followup-v1-1-c49160861213@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQ6CMBREr0JmbZNSDEavYlxQnOo3DW1aEQjh7
 hZdTd5k5q3ITMKMS7Ui8SNZwlCgPlTon93woJJ7YRhtWt3UWu0jTiWiX5QL3odpjOrUGOfOXWt
 Ii/KNiU7mn/cKe8Tt3+XRvti/dyG27QsoTiQzfQAAAA==
X-Change-ID: 20260310-review-reply-followup-732ff9a62eeb
To: "\"Kernel.org Tools\"" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@kernel.org>, Codex <noreply@openai.com>, 
 Tamir Duberstein <tamird@kernel.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=11499; i=tamird@kernel.org;
 h=from:subject:message-id; bh=0uXQ9oqDwZGADB+TsWwdzwvtridCAAYPOWEB6UBfOSU=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJkbXDM01mXOYPP5Xz1P9K6Qs/8VuU6lcG7XRm2uNUrL/
 hjMfqPeUcrCIMbFICumyJIoemhveurtPbKZ747DzGFlAhnCwMUpABOZzMTI8FFYQSN6kc22J9x7
 2znsdypNFU5pMuxZ1xzt3zO/7fqbS4wMK+MLBW25SpSnLL/0Lzg3M+/kc76Lb1JXXH2exKrYUvO
 NGwA=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

Reply to the selected follow-up instead of collapsing all follow-ups
from the same author into one sidebar target.

The review TUI grouped follow-ups by sender in the sidebar and keyed
scroll/reply targeting by sender address. That made later replies from
the same author indistinguishable, so selecting a nested follow-up could
not target that specific message.

Track follow-up sidebar items and positions by message-id instead. This
keeps distinct follow-ups selectable and lets preview-mode reply use the
currently selected follow-up as its target.

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
Co-authored-by: Codex <noreply@openai.com>
---
Signed-off-by: Tamir Duberstein <tamird@kernel.com>
---
 src/b4/review_tui/_review_app.py | 63 +++++++++++++++++++---------------------
 src/tests/test_review.py         | 63 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 93 insertions(+), 33 deletions(-)

diff --git a/src/b4/review_tui/_review_app.py b/src/b4/review_tui/_review_app.py
index 5d71c24..d66a668 100644
--- a/src/b4/review_tui/_review_app.py
+++ b/src/b4/review_tui/_review_app.py
@@ -10,7 +10,7 @@ import os
 import re
 import subprocess
 
-from typing import Any, Dict, List, Optional, Set, Tuple
+from typing import Any, Dict, List, Optional, Tuple
 
 import b4
 import b4.mbox
@@ -73,12 +73,12 @@ class PatchListItem(ListItem):
 
 
 class FollowupItem(ListItem):
-    """A follow-up commenter entry in the patch list sidebar."""
+    """A follow-up entry in the patch list sidebar."""
 
-    def __init__(self, name: str, display_idx: int, fromemail: str) -> None:
+    def __init__(self, name: str, display_idx: int, msgid: str) -> None:
         super().__init__()
         self.display_idx = display_idx
-        self.fromemail = fromemail
+        self.msgid = msgid
         self._display_name = name
 
     def compose(self) -> ComposeResult:
@@ -248,9 +248,10 @@ class ReviewApp(App[None]):
         self._selected_idx: int = 0 if self._has_cover else 1  # 0 = cover, 1..N = patches
         self._preview_mode: bool = False
         self._comment_positions: List[int] = []
-        self._followup_positions: Dict[Tuple[int, str], int] = {}
+        self._followup_positions: Dict[str, int] = {}
         self._followup_comments: Dict[int, List[Dict[str, Any]]] = {}
         self._followup_header_map: Dict[int, Dict[str, Any]] = {}
+        self._selected_followup_msgid: Optional[str] = None
         self._reply_sent: bool = False
 
     def compose(self) -> ComposeResult:
@@ -335,27 +336,14 @@ class ReviewApp(App[None]):
                     break
 
     def _append_followup_items(self, lv: ListView, display_idx: int) -> None:
-        """Append FollowupItem entries to *lv* for commenters on *display_idx*."""
+        """Append FollowupItem entries to *lv* for each follow-up message."""
         fc_list = self._followup_comments.get(display_idx, [])
         if not fc_list:
             return
-        # Count messages per participant
-        counts: Dict[str, int] = {}
-        names: Dict[str, str] = {}
         for e in fc_list:
-            email = e['fromemail']
-            counts[email] = counts.get(email, 0) + 1
-            if email not in names:
-                names[email] = e['fromname']
-        seen: Set[str] = set()
-        for e in sorted(fc_list, key=lambda x: x['date']):
-            if e['fromemail'] not in seen:
-                seen.add(e['fromemail'])
-                name = e['fromname']
-                n = counts[e['fromemail']]
-                if n > 1:
-                    name = f'{name} ({n})'
-                lv.append(FollowupItem(name, display_idx, e['fromemail']))
+            name = str(e.get('fromname') or e.get('fromemail') or '(unknown)')
+            msgid = str(e.get('msgid', ''))
+            lv.append(FollowupItem(name, display_idx, msgid))
 
     def _refresh_patch_item(self, display_idx: int) -> None:
         """Refresh a single patch list item's label."""
@@ -392,6 +380,7 @@ class ReviewApp(App[None]):
         self._comment_positions = []
         self._followup_positions = {}
         self._followup_header_map = {}
+        self._selected_followup_msgid = None
 
         self._selected_idx = display_idx
 
@@ -420,13 +409,14 @@ class ReviewApp(App[None]):
         # Show cover-level follow-up trailers
         _write_followup_trailers(viewer, self._tracking.get('followups', []), ts=ts)
         # Show cover-level follow-up comments
-        fc_author_pos: Dict[str, int] = {}
         _write_followup_comments(
             viewer, self._followup_comments.get(0, []),
-            self._comment_positions, fc_author_pos,
+            self._comment_positions,
             header_position_map=self._followup_header_map, ts=ts)
-        for email, pos in fc_author_pos.items():
-            self._followup_positions[(0, email)] = pos
+        for line_pos, entry in self._followup_header_map.items():
+            msgid = str(entry.get('msgid', ''))
+            if msgid:
+                self._followup_positions[msgid] = line_pos
 
     def _show_diff(self, viewer: RichLog, patch_idx: int) -> None:
         """Render a patch diff in the diff viewer with syntax colouring."""
@@ -569,14 +559,14 @@ class ReviewApp(App[None]):
                 viewer.write(Text(line))
 
         # Render follow-up comments at the bottom
-        fc_author_pos: Dict[str, int] = {}
         _write_followup_comments(
             viewer, self._followup_comments.get(patch_idx + 1, []),
-            self._comment_positions, fc_author_pos,
+            self._comment_positions,
             header_position_map=self._followup_header_map, ts=ts)
-        display_idx = patch_idx + 1
-        for email, pos in fc_author_pos.items():
-            self._followup_positions[(display_idx, email)] = pos
+        for line_pos, entry in self._followup_header_map.items():
+            msgid = str(entry.get('msgid', ''))
+            if msgid:
+                self._followup_positions[msgid] = line_pos
 
     def _show_email_preview(self, viewer: RichLog, display_idx: int) -> None:
         """Render the email that would be sent for the selected patch/cover."""
@@ -717,7 +707,8 @@ class ReviewApp(App[None]):
         """Show the parent patch for a follow-up item and scroll to its comment."""
         if self._selected_idx != item.display_idx:
             self._show_content(item.display_idx)
-        pos = self._followup_positions.get((item.display_idx, item.fromemail))
+        self._selected_followup_msgid = item.msgid
+        pos = self._followup_positions.get(item.msgid)
         if pos is not None:
             viewer = self.query_one('#diff-viewer', RichLog)
             viewer.scroll_to(y=pos, animate=False)
@@ -830,6 +821,8 @@ class ReviewApp(App[None]):
 
     def check_action(self, action: str, parameters: Tuple[Any, ...]) -> Optional[bool]:
         """Show/hide mode-specific bindings in the footer."""
+        if action == 'edit_reply' and self._selected_followup_msgid is not None:
+            return True
         if action == 'agent':
             config = b4.get_main_config()
             if not config.get('review-agent-command') or not config.get('review-agent-prompt-path'):
@@ -940,6 +933,11 @@ class ReviewApp(App[None]):
 
     def action_edit_reply(self) -> None:
         """Open $EDITOR for reply editing."""
+        if self._selected_followup_msgid is not None:
+            for entry in self._followup_comments.get(self._selected_idx, []):
+                if entry.get('msgid') == self._selected_followup_msgid:
+                    self._compose_followup_reply(entry)
+                    return
         target = self._get_current_review_target()
         if not target:
             return
@@ -1695,4 +1693,3 @@ class ReviewApp(App[None]):
         config = b4.get_main_config()
         has_agent = bool(config.get('review-agent-command') and config.get('review-agent-prompt-path'))
         self.push_screen(HelpScreen(_review_help_lines(has_agent=has_agent)))
-
diff --git a/src/tests/test_review.py b/src/tests/test_review.py
index bcea452..92559bc 100644
--- a/src/tests/test_review.py
+++ b/src/tests/test_review.py
@@ -10,6 +10,8 @@ import b4
 from b4 import review
 from b4 import review_tui
 from b4.review._review import REVIEW_MAGIC_MARKER
+from b4.review_tui._review_app import FollowupItem, ReviewApp
+from textual.widgets import ListView
 
 
 # -- Helper diffs used across tests ------------------------------------------
@@ -165,6 +167,67 @@ Check return value.
         assert comments[0]['line'] == 12
         assert comments[0]['text'] == 'Check return value.'
 
+
+class TestReviewAppFollowupItems:
+    """Tests for per-message follow-up selection in the review TUI."""
+
+    @staticmethod
+    def _make_session() -> Dict[str, Any]:
+        return {
+            'topdir': '/tmp',
+            'cover_text': 'Subject\n',
+            'tracking': {},
+            'series': {},
+            'patches': [{}],
+            'base_commit': '',
+            'commit_shas': ['deadbeef'],
+            'commit_subjects': ['Patch subject'],
+            'sha_map': {},
+            'abbrev_len': 12,
+            'default_identity': 'Tester <tester@example.com>',
+            'usercfg': {'name': 'Tester', 'email': 'tester@example.com'},
+            'cover_subject_clean': 'Subject',
+        }
+
+    def test_append_followup_items_keeps_each_message(self) -> None:
+        """Follow-up sidebar entries stay one-per-message, even per author."""
+        app = ReviewApp(self._make_session())
+        app._followup_comments = {
+            1: [
+                {
+                    'msgid': 'reply-1@example.com',
+                    'fromname': 'Alice',
+                    'fromemail': 'alice@example.com',
+                },
+                {
+                    'msgid': 'reply-2@example.com',
+                    'fromname': 'Alice',
+                    'fromemail': 'alice@example.com',
+                },
+            ],
+        }
+
+        async def _run() -> None:
+            async with app.run_test() as _pilot:
+                lv = app.query_one('#patch-list', ListView)
+                followups = [child for child in lv.children if isinstance(child, FollowupItem)]
+                assert len(followups) == 2
+                assert [child.msgid for child in followups] == [
+                    'reply-1@example.com',
+                    'reply-2@example.com',
+                ]
+
+        import asyncio
+        asyncio.run(_run())
+
+    def test_selected_followup_keeps_reply_action_in_preview(self) -> None:
+        """Reply stays enabled in preview mode for a selected follow-up."""
+        app = ReviewApp(self._make_session())
+        app._preview_mode = True
+        app._selected_followup_msgid = 'reply@example.com'
+
+        assert app.check_action('edit_reply', ()) is True
+
     def test_multiple_comments_same_hunk(self) -> None:
         """Multiple comments in the same hunk are all collected."""
         edited = """\

---
base-commit: 0547fc7a21a580b2a6854aaff1776def2761bba4
change-id: 20260310-review-reply-followup-732ff9a62eeb

Best regards,
--  
Tamir Duberstein <tamird@kernel.org>

