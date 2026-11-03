Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793730830;
	b=ftNK+xzR/gwddV5QaiKXkNelwX5z8uWVZ54DJvsS0IMPag5b9HdhCzlonnOhtoeVN/Wg
	 iwAEJKtxrU1354cIe41rO29BlQZJVt2EpVgjltMZ5YV9+x5Tjk6gcGwCqw08wQzhvmI9U
	 LmBp8s3hCpdR4lkGH18vDeZ8SMvOqxKk/up2/odhFc6cwPTLZ9+6f8+4rSAsH80TNj18K
	 8OJ6aLgeLmz8SBO8jxLxIwMMZePLAvMsGyZzo+60D3QuYtCmawmyGnFbyV80xQ49qeK94
	 7Kt69qgRkJ5LCV5Q4zYees9ifyZSqmUaedRJN8Rt1aEta1skHZHgjepXYLOo7mbBnbA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793730830;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=OU6AahFBOXvJk6aEvzZa/RlzCpRtGDYhU/Faz8C3nGE=;
	b=v0rf+AnA/U5yEY1DNkYQvVZXu6IAMMTQRPKV/r9refYnrivCaDK1JEE2+mzL3rq6PhPc
	 nfxy6V6qIUSwg7eSZbmv5PLdWAN6VYlHzensh4gG1WhA2gYEjZOyIFMHYezi/rWcAXZko
	 kiSDhUWFK+dCUqNlSIUgN2BQHLPXTK+DeH08MelhHKDzOaQkEHJuIBnAdipdjuXNQiXET
	 P0y2LqlXB56PeBs+UwT0nYqMUkp3ez/2SEvNTJYRI+PUbU5J8yae1T1SA/K/U8Dsydiix
	 OESaa+f6SrkDvunEVeujLSKcONBCScAN440ERTodYDDM5SnCFdAJQpqGgUIyXX33QuQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VbJbxPNf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AB0606A328
	for <tools@linux.kernel.org>; Tue,  3 Nov 2026 18:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VbJbxPNf
Received: by smtp.kernel.org (Postfix)
	id 79C5F1F00A15; Tue,  3 Nov 2026 18:33:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793730829;
	b=mh5S79av1TlwOYSvqSACE+L2uydZzZLLrvsd8tuf7WK8zM+tnJVC9pJcSbhzKSbIhBCE
	 eRCMTWdKvTiR15HExhqIh/+2ERvC5I1wH73x2HuGBg52Ieqw91r/UpQqKfYnQAdrlnlWt
	 /0M54DgsHGt6pjHFGerkPKSI9TQ1qacycTsIX0OqsFV8xMdhAWTYQ04t7FMHFvbsvJZ0m
	 ZBG++wFz8rvLWVxMHq0tQFEEAxIjTxP9W7McK3/DJALqqD8QY9JhWCrSK0C7lNKM5jNoW
	 fpKSnCKvOnMVkDm8BIcxxxrwZFaa1disMgjCIj2+OwSeyYu+wiMCCY61BtX7BFVouiQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793730829;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=OU6AahFBOXvJk6aEvzZa/RlzCpRtGDYhU/Faz8C3nGE=;
	b=B459wDPosPJKCFMZI042hGLovGNtUxhHBFMCVbBB1Ep0POailoVV+R4YdeBNBlnO441o
	 YOWxdBQxrQ37bUu4V247BHNiFExOzM6J/5jWgra9VizO877fco5nEfuyn+4LcULYx1l2M
	 GE2KGlpnj474U8pX0BO00JR9B1vHvQWNzHNBYV9tkm7liIM47kd6Uhib03MNrPGMXi9fb
	 BGEIQ7wSCORBBx8uendXKr77I2cGHyYZ/XhwLxrrWfVPhkvw/+Jcnlo648cd6xj4L8Rl2
	 SkEhhdzZLKTMGTuIqycwepWjZQ5gJ5bm+XgRQEKuC+tSYVQsYJlEljgQo7l0uqkxuPQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 33E351F000C1
	for <tools@kernel.org>; Tue,  3 Nov 2026 18:33:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 33E351F000C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49d05d51553so29982865e9.2
        for <tools@kernel.org>; Tue, 03 Nov 2026 10:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793730815; x=1794335615; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OU6AahFBOXvJk6aEvzZa/RlzCpRtGDYhU/Faz8C3nGE=;
        b=VbJbxPNfEVRGRZnpXQp8H9i1QGTxVnQb89+udO2TSc/8+osHjS0dkBBLSDxy1auLIE
         7pIQA22xrcHkA+kRsMsev06azvkJ0LZpp9tXZqYxjaPMRu19ehfEP7yN9C45SYOZXV3e
         aVIR7W2gywH5DaP1R5iBxsfakEL10gcKog/h6rT3jwLwg7YBiQcZlHxnCZ/fo4fPgj+4
         Po2ckKdr5Atu9h690mTk7hhyYZ3RSi2di89uhu122jFSIhvVVeFjHrGDjIMJoVmBpSaV
         S/KeLuuSWs7+Vuvw2OS1lew8DvyzbYMMO0hbhrm39kBTMzdqetqM3Bsxl5y3Sq5vSwEN
         ouJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793730815; x=1794335615;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OU6AahFBOXvJk6aEvzZa/RlzCpRtGDYhU/Faz8C3nGE=;
        b=ZoiyVI94ZJU9zd5rysr7vVub+RG1HUJGysPTNbReyr6f/3abSjqnQeMRXo6E/V5ik1
         ccUOCW4Uq6j+8rrXae7w1ZGWnIv2NnTAhHD8EkQdW7VZ5w7EDZXuQ0TO0ey0F4t8FyDU
         wNdxAf1ypw8qix1/0xWQec4cDI/VXb9KmVmMq8SWgKh2XtI6Z2uX3YllXehDykTdE4AT
         drK+MQQ572MV1UeJtXYYAuJrWlD1yMt75Fiujp0p1fy2K6Xvr4oIQ+T6LubhCHBxunw9
         1EOt5qeh/JDd8N0HqfQ9kHz6V8Zez6iSuxIJ6nUdg0wLSSUOCLkhupJEtvg+d9z/eWkz
         DJcA==
X-Gm-Message-State: APuU4Z+xmb7yEUvumea7VvwnsW4nHPt4aylfbyGgLI6inhoGBOzaSIui
	MHujYgqoQMZXX5E+h8ISP3l7C/fAMP9PvzYRJu4zDzhpB8VDmZqIU7O6S9/P+OZq
X-Gm-Gg: AYBFou0HbBsZGt4BiYg1ApW1ATxYSlrls/uWwUBm38D4fzK2odTlCr48kMC5gBw9qdd
	5dIZbd5Z8SO8avhKahk3FQEOlVRbKzJ+MoZ2ADjh9ndJkDn3Oyb7MbkWmlZNq/1yWEbOiXmOP2w
	N2P438pEGRQC21O2wWUylBflsKNNLq9hqX2vvr/m4yh1oHcJwCpWHnwJgeIFXiJEXDAz55B1f8i
	JzaGvABULPqws8CTPBxjJpit/iOxIiNoDXjbbBAB60QPyK3T5FsmCIiRux5YbLeQM+DYXcj8T8i
	ce3qloXMpTYmtarvNUKxEY34Z5VhFoKQ8oM5+XoLK6fTxr4HQU06EyIjw2yNwuNL1H8Viq2Cdli
	5gYdiNxt/7AopSpEzdwICLUCkVEIQjbcvjGQmRa+VZ6lV/f9MENV+t3KEnBBN4ipDdlMM4vy3M0
	1bRWxD24YSOF8yyWfW0zNFrZJljgCOux+89VD4kl2RqJztI4LV4OMlLX2OLPo2c7dn4Knu0nbj7
	TXSkxKnDPHPL7X5ShR1n1KaqkcMzw2wF0peWKUC2L9if5pwkMiyymkXl9W+Z/heJ4mlIpSOsZCt
	YxekYk9i73UF0J+330lVfT2mBmSg/fupjoR5Xm1L6bq3ug0=
X-Received: by 2002:a05:600c:674a:b0:4a1:fb23:68f0 with SMTP id 5b1f17b1804b1-4ac14ec788emr322427655e9.3.1793730815227;
        Tue, 03 Nov 2026 10:33:35 -0800 (PST)
Received: from 990pro.localdomain ([185.68.248.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b40ff10f00sm1749315e9.2.2026.11.03.10.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:33:34 -0800 (PST)
From: Bernhard Kaindl <bernhardkaindl7@gmail.com>
Date: Tue, 03 Nov 2026 19:33:32 +0100
Subject: [PATCH b4 1/4] review: add an optional threaded follow-up list
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
Message-Id: <20261103-view-follow-ups-threaded-v1-1-11c2e2211a9f@gmail.com>
References: <20261103-view-follow-ups-threaded-v1-0-11c2e2211a9f@gmail.com>
In-Reply-To: <20261103-view-follow-ups-threaded-v1-0-11c2e2211a9f@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Bernhard Kaindl <bernhardkaindl7@gmail.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793730813; l=31692;
 i=bernhardkaindl7@gmail.com; s=20261024; h=from:subject:message-id;
 bh=YW8gFbAFiqYWUcxb0cCsbBWWz8eDNdbWPxANIIzEYGU=;
 b=lPtHKXZV6Xc8v6IDLAR5FOhJAqhh9cg+tPdxDEAp3GLnXBIY3msnsR0Xqk+DJjkbWvnHep35J
 QTfuUnvEssQCm60CsFoNYkr/B+z6sF/7pBqKVambGz7iwMpt5opOjCg
X-Developer-Key: i=bernhardkaindl7@gmail.com; a=ed25519;
 pk=oIjnI/us0Uh5d/WP18V5IQq/FrLPUp+W0JAhJ9QCQIs=

The review sidebar lists follow-ups chronologically, which can separate
a reply from the message it answers. Allow switching to a threaded
list based on In-Reply-To, retaining chronological order among siblings
and finding the nearest visible ancestor when a message is hidden.

Compact the start of deep branches from two columns per reply level
to one as needed to keep names visible. Measure terminal cell widths,
recompute the layout on sidebar resize, and preserve the selected
message so reply actions still address the intended follow-up.

Keep the chronological list as the default and document the F key.
Exercise ordering, selected reply headers, filtered and cyclic parents,
and responsive indentation without sending mail.

Assisted-by: gpt-6.1-terra
Signed-off-by: Bernhard Kaindl <bernhardkaindl7@gmail.com>
---
 docs/maintainer/review.rst       |   7 +
 src/b4/review_tui/_modals.py     |   1 +
 src/b4/review_tui/_review_app.py | 121 ++++++++++--
 src/tests/test_tui_review.py     | 387 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 504 insertions(+), 12 deletions(-)

diff --git a/docs/maintainer/review.rst b/docs/maintainer/review.rst
index dd645e0..ae6731b 100644
--- a/docs/maintainer/review.rst
+++ b/docs/maintainer/review.rst
@@ -455,6 +455,7 @@ Key                        Action
 ``n``                      Notes — view or edit review notes
 ``f``                      Followups — toggle follow-up messages and external
                            inline comments from lore
+``F``                      Toggle threaded follow-up list
 ``a``                      Agent — run review LLM agent (if configured)
 ``d``                      Done — toggle "done" state on the current patch
 ``x``                      Skip — toggle "skip" state on the current patch
@@ -821,6 +822,12 @@ blob in the review branch); if no local copy exists, it fetches from
 lore in the background. The ``f`` key is a toggle — pressing it again
 hides the follow-up display.
 
+Press ``F`` to open follow-ups as a threaded list, or to switch an open
+chronological list to threaded order. Press ``F`` again to hide the list.
+In the threaded list, replies appear below their parent messages;
+indentation is compacted as needed when the sidebar narrows. The selected
+message remains selected when switching views or resizing.
+
 Follow-up messages appear as coloured panels below the diff, showing
 threading depth (replies indented visually), along with From, Date, and
 Message-ID headers for easy cross-referencing with your mail client.
diff --git a/src/b4/review_tui/_modals.py b/src/b4/review_tui/_modals.py
index 77bb5ad..8d5bdfe 100644
--- a/src/b4/review_tui/_modals.py
+++ b/src/b4/review_tui/_modals.py
@@ -1197,6 +1197,7 @@ def _review_help_lines(has_agent: bool = False) -> List[str]:
         '  [bold]r[/bold]         Open $EDITOR for reply (inline comments parsed)\n',
         '  [bold]n[/bold]         View/edit notes\n',
         '  [bold]f[/bold]         Toggle follow-up comments from lore\n',
+        '  [bold]F[/bold]         Toggle follow-ups in threaded view\n',
         '  [bold]d[/bold]         Toggle patch done state\n',
         '  [bold]x[/bold]         Toggle patch skip state\n',
         '  [bold]H[/bold]         Toggle hiding of skipped patches\n',
diff --git a/src/b4/review_tui/_review_app.py b/src/b4/review_tui/_review_app.py
index 1e70bc6..dfedca4 100644
--- a/src/b4/review_tui/_review_app.py
+++ b/src/b4/review_tui/_review_app.py
@@ -12,13 +12,14 @@ import re
 import subprocess
 from typing import Any, Dict, List, Optional, Set, Tuple
 
+from rich.cells import cell_len
 from rich.rule import Rule
 from rich.syntax import Syntax
 from rich.text import Text
 from textual.app import App, ComposeResult
 from textual.binding import Binding
 from textual.containers import Horizontal, Vertical
-from textual.events import Click
+from textual.events import Click, Resize
 from textual.widgets import Label, ListItem, ListView, RichLog, Static
 
 import b4
@@ -112,18 +113,32 @@ class PatchListItem(ListItem):
 class FollowupItem(ListItem):
     """A follow-up entry in the patch list sidebar."""
 
-    def __init__(self, name: str, display_idx: int, msgid: str) -> None:
+    def __init__(
+        self, name: str, display_idx: int, msgid: str, indent: int = 4
+    ) -> None:
         super().__init__()
         self.display_idx = display_idx
         self.msgid = msgid
         self._display_name = name
+        self._indent = indent
 
     def compose(self) -> ComposeResult:
-        st = Static(f'\u00a0\u00a0\u00a0\u00a0{self._display_name}', markup=False)
+        st = Static('\u00a0' * self._indent + self._display_name, markup=False)
         st.styles.text_style = 'dim'
         yield st
 
 
+class PatchListView(ListView):
+    def on_resize(self, event: Resize) -> None:
+        app = self.app
+        if (
+            isinstance(app, ReviewApp)
+            and app._followup_tree
+            and app._show_external_comments
+        ):
+            app.call_after_refresh(app._populate_patch_list)
+
+
 class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
     """Textual app for b4 review TUI."""
 
@@ -209,7 +224,7 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
     """
 
     # Actions visible only in review mode
-    _REVIEW_ACTIONS = frozenset({'followups', 'agent'})
+    _REVIEW_ACTIONS = frozenset({'followups', 'toggle_followup_tree', 'agent'})
     # Actions visible only in email mode
     _EMAIL_ACTIONS = frozenset({'edit_tocc', 'send'})
 
@@ -218,6 +233,7 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
         'edit_note': 'Review',
         'edit_reply': 'Review',
         'followups': 'Review',
+        'toggle_followup_tree': 'Review',
         'agent': 'Review',
         'prior_review': 'Review',
         'patch_done': 'Review',
@@ -242,6 +258,7 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
         Binding('N', 'edit_note', 'note', key_display='N'),
         Binding('r', 'edit_reply', 'reply'),
         Binding('f', 'followups', 'followups'),
+        Binding('F', 'toggle_followup_tree', 'thread view', key_display='F'),
         Binding('a', 'agent', 'agent'),
         Binding('d', 'patch_done', 'done'),
         Binding('x', 'patch_skip', 'skip'),
@@ -309,9 +326,11 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
         self._comment_positions: List[int] = []
         self._followup_positions: Dict[str, int] = {}
         self._followup_comments: Dict[int, List[Dict[str, Any]]] = {}
+        self._followup_parents: Dict[str, Optional[str]] = {}
         self._followup_header_map: Dict[int, Dict[str, Any]] = {}
         self._selected_followup_msgid: Optional[str] = None
         self._show_external_comments: bool = False
+        self._followup_tree: bool = False
         self._collapsed_comment_lines: Dict[int, Tuple[str, int]] = {}
         self._reply_sent: bool = False
         self._hide_skipped: bool = False
@@ -346,7 +365,7 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
         yield Static(id='title-bar', markup=False)
         with Horizontal():
             with Vertical(id='left-pane'):
-                yield ListView(id='patch-list')
+                yield PatchListView(id='patch-list')
                 yield Static(id='trailer-overlay', markup=False)
             yield RichLog(
                 id='diff-viewer',
@@ -400,6 +419,7 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
     def _populate_patch_list(self) -> None:
         """Populate or refresh the patch list widget."""
         lv = self.query_one('#patch-list', ListView)
+        selected_followup = self._selected_followup_msgid
         lv.clear()
 
         total = len(self._commit_shas)
@@ -417,7 +437,9 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
             if 0 == self._selected_idx:
                 restore_index = new_count
             new_count += 1
-            self._append_followup_items(lv, 0)
+            selected_offset = self._append_followup_items(lv, 0, selected_followup)
+            if selected_offset is not None:
+                restore_index = new_count + selected_offset
             new_count += len(self._followup_comments.get(0, []))
 
         # Patch entries
@@ -438,7 +460,11 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
             if patch_num == self._selected_idx:
                 restore_index = new_count
             new_count += 1
-            self._append_followup_items(lv, patch_num)
+            selected_offset = self._append_followup_items(
+                lv, patch_num, selected_followup
+            )
+            if selected_offset is not None:
+                restore_index = new_count + selected_offset
             new_count += len(self._followup_comments.get(patch_num, []))
 
         if new_count > 0:
@@ -452,15 +478,82 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
 
             self.call_after_refresh(_restore)
 
-    def _append_followup_items(self, lv: ListView, display_idx: int) -> None:
+    def _append_followup_items(
+        self, lv: ListView, display_idx: int, selected_msgid: Optional[str]
+    ) -> Optional[int]:
         """Append FollowupItem entries to *lv* for each follow-up message."""
         fc_list = self._followup_comments.get(display_idx, [])
         if not fc_list:
-            return
-        for e in fc_list:
+            return None
+        entries = (
+            self._thread_followups(fc_list)
+            if self._followup_tree
+            else [(entry, 0) for entry in fc_list]
+        )
+        compacted: Set[str] = set()
+        path: List[str] = []
+        if self._followup_tree:
+            for entry, depth in entries:
+                path = path[:depth]
+                path.append(str(entry.get('msgid', '')))
+                name = str(
+                    entry.get('fromname') or entry.get('fromemail') or '(unknown)'
+                )
+                overflow = 4 + 2 * depth + cell_len(name) - lv.content_size.width
+                compacted.update(path[1 : 1 + min(depth, max(0, overflow))])
+
+        path = []
+        selected_offset = None
+        for offset, (e, depth) in enumerate(entries):
             name = str(e.get('fromname') or e.get('fromemail') or '(unknown)')
             msgid = str(e.get('msgid', ''))
-            lv.append(FollowupItem(name, display_idx, msgid))
+            path = path[:depth]
+            path.append(msgid)
+            indent = 4 + sum(1 if ancestor in compacted else 2 for ancestor in path[1:])
+            lv.append(FollowupItem(name, display_idx, msgid, indent))
+            if msgid == selected_msgid:
+                selected_offset = offset
+        return selected_offset
+
+    def _thread_followups(
+        self, entries: List[Dict[str, Any]]
+    ) -> List[Tuple[Dict[str, Any], int]]:
+        """Order follow-ups by parent, keeping siblings in chronological order."""
+        msgids = {entry.get('msgid') for entry in entries}
+        children: Dict[Optional[str], List[Dict[str, Any]]] = {}
+        for entry in entries:
+            parent = getattr(entry.get('lmsg'), 'in_reply_to', None)
+            seen: Set[str] = set()
+            while parent and parent not in msgids and parent not in seen:
+                seen.add(parent)
+                parent = self._followup_parents.get(parent)
+            if parent not in msgids or parent == entry.get('msgid'):
+                parent = None
+            children.setdefault(parent, []).append(entry)
+
+        ordered: List[Tuple[Dict[str, Any], int]] = []
+        visited: Set[str] = set()
+        for root in children.get(None, []) + entries:
+            stack = [(root, 0)]
+            while stack:
+                entry, depth = stack.pop()
+                msgid = str(entry.get('msgid', ''))
+                if msgid in visited:
+                    continue
+                visited.add(msgid)
+                ordered.append((entry, depth))
+                stack.extend(
+                    (child, depth + 1) for child in reversed(children.get(msgid, []))
+                )
+        return ordered
+
+    def action_toggle_followup_tree(self) -> None:
+        """Toggle threaded ordering and follow-up visibility."""
+        if self._show_external_comments and not self._followup_tree:
+            self._followup_tree = True
+            self._populate_patch_list()
+            return
+        self.action_followups(threaded=True)
 
     def _refresh_patch_item(self, display_idx: int) -> None:
         """Refresh a single patch list item's label."""
@@ -1941,6 +2034,9 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
         lmbx = b4.LoreMailbox()
         for msg in msgs:
             lmbx.add_message(msg)
+        self._followup_parents = {
+            msgid: lmsg.in_reply_to for msgid, lmsg in lmbx.msgid_map.items()
+        }
 
         # Build patch_msgids: msgid -> display_idx
         patch_msgids: Dict[str, int] = {}
@@ -2099,8 +2195,9 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
 
         return integrated
 
-    def action_followups(self) -> None:
+    def action_followups(self, threaded: bool = False) -> None:
         """Toggle follow-up comments on/off."""
+        self._followup_tree = threaded
         # ── Toggle off ────────────────────────────────────────────────────────
         if self._show_external_comments:
             self._show_external_comments = False
diff --git a/src/tests/test_tui_review.py b/src/tests/test_tui_review.py
index e164bf6..21fd2e2 100644
--- a/src/tests/test_tui_review.py
+++ b/src/tests/test_tui_review.py
@@ -29,6 +29,7 @@ import b4.review.tracking
 from b4.review_tui._common import filter_range_diff_for_commit
 from b4.review_tui._review_app import FollowupItem, PatchListItem, ReviewApp
 
+from .helpers.mail import MINIMAL_DIFF, make_msg
 from .helpers.tracking import create_review_branch
 from .helpers.tui import CUT_BUFFER, CUT_INSTRUCTION, CUT_TRIMMED
 
@@ -373,6 +374,392 @@ class TestFollowupSelection:
             compose.assert_called_once_with(entries[1])
 
 
+class TestFollowupTree:
+    def test_tree_keeps_orphans_and_breaks_cycles(self, gitdir: str) -> None:
+        branch, _shas = _create_review_branch_with_patches(
+            gitdir, 'followup-tree-cycles', ['patch 1']
+        )
+        app = ReviewApp(_build_session(gitdir, branch))
+        entries = [
+            {'msgid': 'cycle-a', 'lmsg': mock.Mock(in_reply_to='cycle-b')},
+            {'msgid': 'cycle-b', 'lmsg': mock.Mock(in_reply_to='cycle-a')},
+            {'msgid': 'orphan', 'lmsg': mock.Mock(in_reply_to='missing')},
+            {'msgid': 'self', 'lmsg': mock.Mock(in_reply_to='self')},
+        ]
+        ordered = app._thread_followups(entries)
+        assert [(entry['msgid'], depth) for entry, depth in ordered] == [
+            ('orphan', 0),
+            ('self', 0),
+            ('cycle-a', 0),
+            ('cycle-b', 1),
+        ]
+
+    @pytest.mark.asyncio
+    async def test_tree_groups_replies_and_preserves_reply_target(
+        self, gitdir: str
+    ) -> None:
+        branch, _shas = _create_review_branch_with_patches(
+            gitdir,
+            'followup-tree',
+            ['patch 1'],
+            series_extra={'header-info': {'msgid': 'cover@example.com'}},
+        )
+        app = ReviewApp(_build_session(gitdir, branch))
+        messages = [
+            make_msg('cover@example.com', '[PATCH 0/1] Test series'),
+            make_msg(
+                'bernhard@example.com',
+                'Re: [PATCH 0/1] Test series',
+                from_addr='Bernhard <bernhard@example.com>',
+                date='Mon, 23 Mar 2026 12:00:00 +0000',
+                body='First review.\n',
+                in_reply_to='cover@example.com',
+            ),
+            make_msg(
+                'andrew@example.com',
+                'Re: [PATCH 0/1] Test series',
+                from_addr='Andrew <andrew@example.com>',
+                date='Mon, 23 Mar 2026 12:01:00 +0000',
+                body='Another review.\n',
+                in_reply_to='cover@example.com',
+            ),
+            make_msg(
+                'ryo@example.com',
+                'Re: [PATCH 0/1] Test series',
+                from_addr='Ryo <ryo@example.com>',
+                date='Mon, 23 Mar 2026 12:02:00 +0000',
+                body='Response to the first review.\n',
+                in_reply_to='bernhard@example.com',
+                references='<cover@example.com> <bernhard@example.com>',
+                to='Bernhard <bernhard@example.com>',
+                cc='List <list@example.com>',
+            ),
+        ]
+        with (
+            mock.patch(
+                'b4.get_smtp', side_effect=AssertionError('SMTP forbidden')
+            ) as smtp,
+            mock.patch(
+                'b4.send_mail', side_effect=AssertionError('Sending forbidden')
+            ) as send,
+        ):
+            async with app.run_test(size=(120, 30)) as pilot:
+                await pilot.pause()
+                app._show_external_comments = True
+                app._load_followup_msgs(messages)
+                await pilot.pause()
+                lv = app.query_one('#patch-list', ListView)
+                items = [item for item in lv.children if isinstance(item, FollowupItem)]
+                assert [item.msgid for item in items] == [
+                    'bernhard@example.com',
+                    'andrew@example.com',
+                    'ryo@example.com',
+                ]
+
+                app._followup_tree = True
+                app._populate_patch_list()
+                await pilot.pause()
+                items = [item for item in lv.children if isinstance(item, FollowupItem)]
+                assert [item.msgid for item in items] == [
+                    'bernhard@example.com',
+                    'ryo@example.com',
+                    'andrew@example.com',
+                ]
+                assert [item._indent for item in items] == [4, 6, 4]
+
+                lv.index = lv.children.index(items[1])
+                await pilot.pause()
+                with mock.patch.object(app, '_compose_followup_reply') as compose:
+                    await pilot.press('r')
+                assert compose.call_args.args[0]['msgid'] == 'ryo@example.com'
+
+                await pilot.pause()
+                app._followup_tree = False
+                app.call_later(app._populate_patch_list)
+                await pilot.pause()
+                assert _selected_followup(app) == 'ryo@example.com'
+                items = [item for item in lv.children if isinstance(item, FollowupItem)]
+                assert [item.msgid for item in items] == [
+                    'bernhard@example.com',
+                    'andrew@example.com',
+                    'ryo@example.com',
+                ]
+                app._followup_tree = True
+                app.call_later(app._populate_patch_list)
+                await pilot.pause()
+                assert _selected_followup(app) == 'ryo@example.com'
+
+                entry = next(
+                    entry
+                    for entry in app._followup_comments[0]
+                    if entry['msgid'] == 'ryo@example.com'
+                )
+                original_make_reply = entry['lmsg'].make_reply
+                outgoing = []
+
+                def capture_reply(body: str) -> email.message.EmailMessage:
+                    msg: email.message.EmailMessage = original_make_reply(body)
+                    outgoing.append(msg)
+                    return msg
+
+                with (
+                    mock.patch(
+                        'b4.review_tui._review_app.suspend_and_edit',
+                        return_value=b'Thanks for the response.\n',
+                    ),
+                    mock.patch.object(
+                        entry['lmsg'], 'make_reply', side_effect=capture_reply
+                    ),
+                ):
+                    await pilot.press('r')
+                    await pilot.pause()
+                    assert len(outgoing) == 1
+                    assert str(outgoing[0]['In-Reply-To']) == '<ryo@example.com>'
+                    assert '<ryo@example.com>' in str(outgoing[0]['References'])
+                    assert 'ryo@example.com' in str(outgoing[0]['To'])
+                    assert 'list@example.com' in str(outgoing[0]['Cc'])
+                    smtp.assert_not_called()
+                    send.assert_not_called()
+                    await pilot.press('escape')
+                    await pilot.pause()
+                    smtp.assert_not_called()
+                    send.assert_not_called()
+
+    @pytest.mark.asyncio
+    async def test_tree_compacts_deep_branch_and_restores_it_on_resize(
+        self, gitdir: str
+    ) -> None:
+        from rich.cells import cell_len
+
+        branch, _shas = _create_review_branch_with_patches(
+            gitdir, 'followup-tree-width', ['patch 1']
+        )
+        app = ReviewApp(_build_session(gitdir, branch))
+        entries = []
+        for index in range(9):
+            entries.append(
+                {
+                    'msgid': f'node-{index}@example.com',
+                    'fromname': 'Ryo 高 reviewer'
+                    if index == 8
+                    else f'Reviewer {index}',
+                    'fromemail': f'reviewer-{index}@example.com',
+                    'date': datetime.datetime(
+                        2026, 1, index + 1, tzinfo=datetime.timezone.utc
+                    ),
+                    'body': 'A reply.',
+                    'lmsg': mock.Mock(
+                        in_reply_to=f'node-{index - 1}@example.com' if index else None
+                    ),
+                }
+            )
+        entries.append(
+            {
+                'msgid': 'other@example.com',
+                'fromname': 'Other reviewer',
+                'fromemail': 'other@example.com',
+                'date': datetime.datetime(2026, 1, 10, tzinfo=datetime.timezone.utc),
+                'body': 'A separate review.',
+                'lmsg': mock.Mock(in_reply_to=None),
+            }
+        )
+        async with app.run_test(size=(200, 40)) as pilot:
+            await pilot.pause()
+            app._followup_comments = {0: entries}
+            app._show_external_comments = True
+            app._followup_tree = True
+            app._populate_patch_list()
+            await pilot.pause()
+            lv = app.query_one('#patch-list', ListView)
+            items = [item for item in lv.children if isinstance(item, FollowupItem)]
+            assert [item._indent for item in items] == list(range(4, 22, 2)) + [4]
+
+            lv.index = lv.children.index(items[8])
+            await pilot.pause()
+            assert _selected_followup(app) == 'node-8@example.com'
+            widths = []
+            populate = app._populate_patch_list
+
+            def observe_populate() -> None:
+                widths.append(lv.content_size.width)
+                populate()
+
+            with mock.patch.object(
+                app, '_populate_patch_list', side_effect=observe_populate
+            ):
+                await pilot.resize_terminal(100, 40)
+            await pilot.pause()
+            items = [item for item in lv.children if isinstance(item, FollowupItem)]
+            indents = [item._indent for item in items[:9]]
+            gaps = [right - left for left, right in zip(indents, indents[1:])]
+            assert indents[0] == 4
+            assert indents[-1] < 20, (
+                app.size,
+                lv.size,
+                lv.content_size,
+                indents,
+                widths,
+            )
+            assert widths[-1] == lv.content_size.width
+            overflow = max(
+                0, 20 + cell_len(items[8]._display_name) - lv.content_size.width
+            )
+            assert gaps == [1] * overflow + [2] * (8 - overflow)
+            assert items[-1]._indent == 4
+            assert (
+                items[8]._indent + cell_len(items[8]._display_name)
+                <= lv.content_size.width
+            )
+            assert _selected_followup(app) == 'node-8@example.com'
+
+            await pilot.resize_terminal(200, 40)
+            await pilot.pause()
+            items = [item for item in lv.children if isinstance(item, FollowupItem)]
+            assert [item._indent for item in items] == list(range(4, 22, 2)) + [4]
+            assert _selected_followup(app) == 'node-8@example.com'
+
+            entries[8]['fromname'] = 'A' * 80
+            app._populate_patch_list()
+            await pilot.pause()
+            items = [item for item in lv.children if isinstance(item, FollowupItem)]
+            assert [item._indent for item in items[:9]] == list(range(4, 13))
+            assert items[-1]._indent == 4
+
+    @pytest.mark.asyncio
+    async def test_tree_follows_ancestors_hidden_by_body_filter(
+        self, gitdir: str
+    ) -> None:
+        branch, _shas = _create_review_branch_with_patches(
+            gitdir,
+            'followup-tree-hidden',
+            ['patch 1'],
+            series_extra={'header-info': {'msgid': 'cover@example.com'}},
+        )
+        app = ReviewApp(_build_session(gitdir, branch))
+        cover = make_msg('cover@example.com', '[PATCH 0/1] Test series')
+        root = make_msg(
+            'root@example.com',
+            'Re: [PATCH 0/1] Test series',
+            body='First review.\n',
+            in_reply_to='cover@example.com',
+            date='Mon, 23 Mar 2026 12:00:00 +0000',
+        )
+        sibling = make_msg(
+            'sibling@example.com',
+            'Re: [PATCH 0/1] Test series',
+            body='Another review.\n',
+            in_reply_to='cover@example.com',
+            date='Mon, 23 Mar 2026 12:01:00 +0000',
+        )
+        hidden = make_msg(
+            'hidden@example.com',
+            'Re: [PATCH 0/1] Test series',
+            body='Hidden parent.\n',
+            in_reply_to='root@example.com',
+            date='Mon, 23 Mar 2026 12:02:00 +0000',
+        )
+        child = make_msg(
+            'child@example.com',
+            'Re: [PATCH 0/1] Test series',
+            body='Reply to hidden parent.\n',
+            in_reply_to='hidden@example.com',
+            date='Mon, 23 Mar 2026 12:03:00 +0000',
+        )
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            app._show_external_comments = True
+            with mock.patch(
+                'b4.mbox.minimize_thread', return_value=[cover, root, sibling, child]
+            ):
+                app._load_followup_msgs([cover, root, sibling, hidden, child])
+            app._followup_tree = True
+            app._populate_patch_list()
+            await pilot.pause()
+            lv = app.query_one('#patch-list', ListView)
+            items = [item for item in lv.children if isinstance(item, FollowupItem)]
+            assert [item.msgid for item in items] == [
+                'root@example.com',
+                'child@example.com',
+                'sibling@example.com',
+            ]
+            assert [item._indent for item in items] == [4, 6, 4]
+
+    @pytest.mark.asyncio
+    async def test_followup_shortcuts(self, gitdir: str) -> None:
+        change_id = 'followup-shortcuts'
+        patch_id = f'{change_id}-patch1@example.com'
+        branch, _shas = _create_review_branch_with_patches(
+            gitdir,
+            change_id,
+            ['patch 1'],
+            series_extra={'header-info': {'msgid': 'cover@example.com'}},
+        )
+        app = ReviewApp(_build_session(gitdir, branch))
+        messages = [
+            make_msg('cover@example.com', '[PATCH 0/1] Test series'),
+            make_msg(
+                patch_id,
+                '[PATCH 1/1] patch 1',
+                body=MINIMAL_DIFF,
+                in_reply_to='cover@example.com',
+            ),
+            make_msg(
+                'review@example.com',
+                'Re: [PATCH 1/1] patch 1',
+                body='Please clarify this change.\n',
+                in_reply_to=patch_id,
+            ),
+            make_msg(
+                'reply@example.com',
+                'Re: [PATCH 1/1] patch 1',
+                body='I will clarify it.\n',
+                in_reply_to='review@example.com',
+            ),
+        ]
+        with mock.patch('b4.get_pi_thread_by_msgid', return_value=messages) as fetch:
+            async with app.run_test(size=(120, 30)) as pilot:
+                for key, visible, threaded in (
+                    ('F', True, True),
+                    ('F', False, True),
+                    ('f', True, False),
+                    ('F', True, True),
+                    ('F', False, True),
+                    ('f', True, False),
+                    ('f', False, False),
+                    ('F', True, True),
+                    ('f', False, False),
+                    ('F', True, True),
+                ):
+                    fetch_count = fetch.call_count
+                    switching = (
+                        key == 'F'
+                        and app._show_external_comments
+                        and not app._followup_tree
+                    )
+                    await pilot.press(key)
+                    await app.workers.wait_for_complete()
+                    await pilot.pause()
+                    if switching:
+                        assert fetch.call_count == fetch_count
+                    assert app._show_external_comments == visible
+                    assert app._followup_tree == threaded
+                    items = [
+                        item
+                        for item in app.query_one('#patch-list', ListView).children
+                        if isinstance(item, FollowupItem)
+                    ]
+                    if visible:
+                        assert [item.msgid for item in items] == [
+                            'review@example.com',
+                            'reply@example.com',
+                        ]
+                        assert [item._indent for item in items] == (
+                            [4, 6] if threaded else [4, 4]
+                        )
+                    else:
+                        assert not items
+
+
 class TestFollowupSnipMarker:
     """Quick follow-up replies expose and resolve the snip marker."""
 

-- 
2.43.0

