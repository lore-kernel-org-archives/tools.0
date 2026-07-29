Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3A6425CF0
	for <tools@linux.kernel.org>; Wed, 29 Jul 2026 09:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785319108; cv=none; b=b8rXzyd19vIMicpZDLNSoOZbR9RbrgDY/A5ljpE2NUoTHLOzFZEIgtAo+EjtnsZVbWpBA9U102hMoD8offWq51OHCgB/pXcmCkTnOCbTS1JVLgYtHjHFVFzNRTG7EmGe7B/k1NmI5SlMVTGUOn1BrPyKstS/hL+hw+MHVTeDZCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785319108; c=relaxed/simple;
	bh=kx+51QBxzf6ba8tQKcUjLaogXsijo9RseqTEfxNUcfM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XfF8Q0TDLDo9zBBIf+cDYGAQMaNdNIaCFgihcLaHtRMUCd3DcRiLOxmj4080EN4YN/EEWC5q+CUwNU6eDkN6984o2zBuSDDBXwbvBJDXc/+GBqvBDpqSt79muFnXx+eahJ3Ci2SLGrO4FxV6KCMQzRloXqqJt2ocfZBdC0KNOXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D+bCd9o7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D+bCd9o7"
Received: by smtp.kernel.org (Postfix)
	id E1D381F00A3D; Wed, 29 Jul 2026 09:58:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16D9F1F000E9;
	Wed, 29 Jul 2026 09:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785319106;
	bh=ePzfel1b3W3qTLuM26XRoeDORcxtIO7jfmmtUJOJ3C8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=D+bCd9o7dUyDu0rGgdD1HmQtZsJ0kw2tJWlGdrFw98bR3X6ru0i/v6THS07ZLANT0
	 Ar/Ei3+WwL3bzSbiGNCXOlfXOIprscA1YTkfCwWsnUTlcpTgqKOD0gR8djAZfkhZAg
	 xoKpUKVhc9Q/hCTAu4TxQl+5As2uCmeZHL9BMV+u0eqcMkg2z5G8ma9TvyanFJphj4
	 A3JIhEc7ulLE4J45pb7Bnu0yDJTIQkC4/7zJ5SedZ1zSx7h5tCibN53e5JbnmAV0ZX
	 iyD6EVAXM730SVAPiRuo1PGz8LW3BMuBxY1dIERMbR+7DqFYNkcX4FYUenLKFLJMf1
	 I4GCQTfnaprOw==
From: Christian Brauner <brauner@kernel.org>
Date: Wed, 29 Jul 2026 11:58:19 +0200
Subject: [PATCH b4 1/2] b4 tui: preserve list scroll position across
 ListView rebuilds
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260729-work-b4-tui-scroll-preserve-v1-1-42be22445eaf@kernel.org>
References: <20260729-work-b4-tui-scroll-preserve-v1-0-42be22445eaf@kernel.org>
In-Reply-To: <20260729-work-b4-tui-scroll-preserve-v1-0-42be22445eaf@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-b7988
X-Developer-Signature: v=1; a=openpgp-sha256; l=10415; i=brauner@kernel.org;
 h=from:subject:message-id; bh=kx+51QBxzf6ba8tQKcUjLaogXsijo9RseqTEfxNUcfM=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWRlnjvQkJVqWjr19SUT9xUXrmh5xu8MLorbbhBusnjLz
 l2bWF4YdJSyMIhxMciKKbI4tJuEyy3nqdhslKkBM4eVCWQIAxenAEzER43hf5T47WdNP0+9mG+c
 Met1qxrn6SnRVrd0FU5ssd6852ph/x1GhgNbJ39qV1A3mCC77kOu36L7ET9UVGbFmX/cqXMpoLt
 BjwkA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

The tracking and bugs TUIs rebuild their list wholesale on every
refresh. The old ListView is removed and a freshly constructed one is
created so the scroll position dies with the old widget.  Restoring
the cursor index alone only scrolls the minimum needed to reveal that
row and so after every rebuild (updating a series with 'u', a status
change, the db-mtime poll) the viewport visibly jumped towards the top
while the cursor stayed on the right entry.

Add ReplacementListView to b4.tui and use it for both tracker-style
lists.  It captures the predecessor's scroll offset and seeds the
replacement's scroll state on mount, before the first paint, so the
swap is invisible:

- set_scroll() seeds scroll_y: scroll_to() would clamp against the
  zero virtual size of the not-yet-laid-out widget.  The first reflow
  re-validates the value, clamping it if the new list is shorter.

- scroll_target_y is seeded as well: wheel and page scrolling compute
  from it, so leaving it at 0 would snap the view back to the top on
  the first scroll tick.

- The scrollbar thumb is positioned manually: nothing syncs it when
  the first reflow's re-validation does not change scroll_y.

There is deliberately no initial_index. ListView's default of 0
schedules a scroll-into-view for row 0 on mount, which would fire
after the restore and undo it.  The index is assigned explicitly after
mounting instead.  That schedules a minimal scroll-into-view which is
a no-op when the restored offset already shows the row, and otherwise
keeps the cursor visible (e.g. after a re-sort moved it).

The patchwork and lite lists rebuild without any cursor restore, and
the bug-detail comment list jumps to the top or end by design, so
those keep constructing plain ListViews.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/bugs/_tui.py                | 11 ++++++--
 src/b4/review_tui/_common.py       |  3 +++
 src/b4/review_tui/_tracking_app.py |  9 +++++--
 src/b4/tui/__init__.py             |  3 +++
 src/b4/tui/_common.py              | 55 +++++++++++++++++++++++++++++++++++++-
 5 files changed, 76 insertions(+), 5 deletions(-)

diff --git a/src/b4/bugs/_tui.py b/src/b4/bugs/_tui.py
index c383e94..c301af7 100644
--- a/src/b4/bugs/_tui.py
+++ b/src/b4/bugs/_tui.py
@@ -42,6 +42,7 @@ from b4.tui import (
     ConfirmScreen,
     JKListNavMixin,
     LimitScreen,
+    ReplacementListView,
     SeparatedFooter,
     _quiet_worker,
     _wait_for_enter,
@@ -2038,7 +2039,11 @@ class BugListApp(JKListNavMixin, App[None]):
             seen = self._seen_counts.get(bug.id, count)
             unseen = max(0, count - seen)
             items.append(BugListItem(bug, unseen=unseen))
-        lv = ListView(*items, id='bug-list')
+        lv = ReplacementListView(
+            *items,
+            id='bug-list',
+            scroll_y=ReplacementListView.capture_scroll(self, '#bug-list'),
+        )
 
         with self.app.batch_update():
             old_lv = self.query_one('#bug-list', ListView)
@@ -2046,12 +2051,14 @@ class BugListApp(JKListNavMixin, App[None]):
             await self.mount(lv, before=self.query_one('#details-panel', Vertical))
 
         # Restore cursor to previously focused bug
+        new_index = 0
         if self._focus_bug_id:
             for idx, item in enumerate(items):
                 if item.bug.id == self._focus_bug_id:
-                    lv.index = idx
+                    new_index = idx
                     self._focus_bug_id = None
                     break
+        lv.index = new_index
         lv.focus()
 
     async def on_worker_state_changed(self, event: Worker.StateChanged) -> None:
diff --git a/src/b4/review_tui/_common.py b/src/b4/review_tui/_common.py
index 873681b..935f553 100644
--- a/src/b4/review_tui/_common.py
+++ b/src/b4/review_tui/_common.py
@@ -46,6 +46,9 @@ from b4.tui._common import (
 from b4.tui._common import (
     JKListNavMixin as JKListNavMixin,
 )
+from b4.tui._common import (
+    ReplacementListView as ReplacementListView,
+)
 from b4.tui._common import (
     SeparatedFooter as SeparatedFooter,
 )
diff --git a/src/b4/review_tui/_tracking_app.py b/src/b4/review_tui/_tracking_app.py
index 2b29dc1..59c52e9 100644
--- a/src/b4/review_tui/_tracking_app.py
+++ b/src/b4/review_tui/_tracking_app.py
@@ -43,6 +43,7 @@ from b4.review_tui._common import (
     QUIT_BINDINGS,
     CheckRunnerMixin,
     LoreNodeShutdownMixin,
+    ReplacementListView,
     SeparatedFooter,
     _fix_ansi_theme,
     _quiet_worker,
@@ -1276,6 +1277,8 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
             title_text += f' (limit: {self._limit_pattern})'
         left.update(title_text)
 
+        scroll_y = ReplacementListView.capture_scroll(self, '#tracking-list')
+
         # Suppress rendering while we swap old widgets for new ones.
         # Without this, the remove-then-mount sequence can produce a
         # single intermediate frame showing only the title bar before
@@ -1299,19 +1302,21 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
             header = Static(header_text, id='tracking-header')
 
             list_items: List[ListItem] = [TrackedSeriesItem(s) for s in display_series]
-            lv = ListView(*list_items, id='tracking-list')
+            lv = ReplacementListView(*list_items, id='tracking-list', scroll_y=scroll_y)
             await self.mount(header, before=self.query_one(Footer))
             await self.mount(lv, before=self.query_one(Footer))
 
+        new_index = 0
         if self._focus_change_id:
             for idx, item in enumerate(list_items):
                 if (
                     isinstance(item, TrackedSeriesItem)
                     and item.series.get('change_id') == self._focus_change_id
                 ):
-                    lv.index = idx
+                    new_index = idx
                     break
             self._focus_change_id = None
+        lv.index = new_index
         lv.focus()
 
         # Populate the details panel for the highlighted item now that
diff --git a/src/b4/tui/__init__.py b/src/b4/tui/__init__.py
index 82ae122..ab9186e 100644
--- a/src/b4/tui/__init__.py
+++ b/src/b4/tui/__init__.py
@@ -15,6 +15,7 @@ if TYPE_CHECKING:
     from b4.tui._common import (
         QUIT_BINDINGS,
         JKListNavMixin,
+        ReplacementListView,
         SeparatedFooter,
         _addrs_to_lines,
         _fix_ansi_theme,
@@ -48,6 +49,7 @@ __all__ = [
     'ConfirmScreen',
     'JKListNavMixin',
     'LimitScreen',
+    'ReplacementListView',
     'SeparatedFooter',
     'ToCcScreen',
     '_addrs_to_lines',
@@ -71,6 +73,7 @@ __all__ = [
 _LAZY_ATTRS: dict[str, str] = {
     'QUIT_BINDINGS': '_common',
     'JKListNavMixin': '_common',
+    'ReplacementListView': '_common',
     'SeparatedFooter': '_common',
     '_addrs_to_lines': '_common',
     '_fix_ansi_theme': '_common',
diff --git a/src/b4/tui/_common.py b/src/b4/tui/_common.py
index 5b68ee8..48052d5 100644
--- a/src/b4/tui/_common.py
+++ b/src/b4/tui/_common.py
@@ -14,7 +14,9 @@ from typing import Any, Dict, List, Optional, Protocol
 
 from textual.app import App, ComposeResult
 from textual.binding import Binding
-from textual.widgets import Footer, ListView
+from textual.css.query import NoMatches
+from textual.dom import DOMNode
+from textual.widgets import Footer, ListItem, ListView
 from textual.widgets._footer import FooterKey
 from textual.worker import NoActiveWorker, get_current_worker
 
@@ -267,6 +269,57 @@ def _validate_addrs(text: str) -> Optional[str]:
     return None
 
 
+class ReplacementListView(ListView):
+    """A ListView that replaces a predecessor without moving the viewport.
+
+    The tracker-style screens rebuild their ListView wholesale on every
+    refresh, so the scroll position dies with the old widget.  Restoring
+    the cursor index alone only scrolls the minimum needed to reveal
+    that row, which made the viewport visibly jump towards the top on
+    every refresh.  Capture the predecessor's offset with
+    :meth:`capture_scroll` before removing it, pass it as *scroll_y*,
+    and the replacement seeds its scroll state on mount, before the
+    first paint.
+
+    There is deliberately no ``initial_index``: ListView's default of 0
+    schedules a scroll-into-view for row 0 on mount, which would fire
+    after the restore and undo it.  Assign ``index`` explicitly after
+    mounting instead — that schedules a minimal scroll-into-view which
+    is a no-op when the restored offset already shows the row, and
+    otherwise keeps the cursor visible (e.g. after a re-sort moved it).
+    """
+
+    def __init__(
+        self, *children: ListItem, scroll_y: float = 0.0, id: Optional[str] = None
+    ) -> None:
+        super().__init__(*children, initial_index=None, id=id)
+        self._replaced_scroll_y = scroll_y
+
+    @staticmethod
+    def capture_scroll(node: DOMNode, selector: str) -> float:
+        """Return the scroll offset of *selector*'s ListView, or 0.0."""
+        try:
+            return node.query_one(selector, ListView).scroll_y
+        except NoMatches:
+            return 0.0
+
+    def on_mount(self) -> None:
+        if not self._replaced_scroll_y:
+            return
+        # scroll_to() cannot seed the position here: layout hasn't run
+        # yet, so it would clamp against a zero virtual size.  The first
+        # reflow re-validates these values against the real size, which
+        # clamps them if the new list is shorter.  scroll_target_y feeds
+        # wheel/page scrolling, and nothing syncs the scrollbar thumb
+        # when that re-validation is a no-op, so seed both as well.
+        self.set_scroll(None, self._replaced_scroll_y)
+        self.set_reactive(
+            ListView.scroll_target_y,  # pyright: ignore[reportArgumentType] # cannot pick Reactive's class-access __get__ overload
+            float(round(self._replaced_scroll_y)),
+        )
+        self.vertical_scrollbar.position = round(self._replaced_scroll_y)
+
+
 class _ListViewHost(Protocol):
     _list_id: str
 

-- 
2.53.0

