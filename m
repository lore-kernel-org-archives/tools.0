Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D9F363C46
	for <tools@linux.kernel.org>; Tue, 23 Jun 2026 09:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782206833; cv=none; b=fZn5X8dkDZlAyPRoeMJzR4ZwhNRzhh6WlA98I/QX73i+vXqNUIuJs5a8GzjBL+w8MuSucs+/SjA/wmzXmUAdLs6prMXWQKyFiAVjhyccouijAtQbq7glMreQpwDfYDsbYpZj7zbFV6ueX0NKrpa90ExvEzDNmzG4kUoFsjB1JwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782206833; c=relaxed/simple;
	bh=9YFeQtdutPgHq2g4kcA7ELZryBDJQsuD2EybuMadChY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qWOvE1f9HO5lGS4ZxIeTKtwrSzQGseOHXAegr7CVixz3B/WcmIROrE5K8kuglOXqsjLtOSFPZlJ3VKX1w6wtHA+alNhfZQdjQHC4H+TRpv2D6oDmnTCyqb9lTHDSoB1P/2ssyte04RcVh0zOdueuDGu0UAea44E7bVzTc1MzjSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EbIwsGpm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EbIwsGpm"
Received: by smtp.kernel.org (Postfix)
	id 454AF1F00A3A; Tue, 23 Jun 2026 09:27:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AEB51F000E9;
	Tue, 23 Jun 2026 09:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782206832;
	bh=E+bgF866V45J0YV6dydfOCyC4m57VxhfkKgaV9NRYOo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=EbIwsGpmyoFYEctLPKEgAxZ9a+4nj2nU3pjlVqIvYy6X++1+r3DEh/FcU5+xTfmDD
	 HJDVfGhFhoEX5PjhDuJOhHWX9wcXGo9pEoeoGUzvszphsEPkcp4NQTlWGxlAgfPFbB
	 IUKn4OQo8kGyFWsFwC5JC1w7t3wFFPA0NKCJ+ikoKCmE0NClBAk64j5/KbEhDw0BqY
	 wkqBSuIjthkw0q646Aevwyfa6mpuFn8P1mcPC9AFO37GggVjRGhDcFm6AWrysKSkz4
	 TWZbF6jap7CcVWr4fTYRYgzNVjOfQ2CIdVHJI1AVwzoA8+noSuyz4RMSytkKZBSoZw
	 fybxMvBVq7kkw==
From: Christian Brauner <brauner@kernel.org>
Date: Tue, 23 Jun 2026 11:27:05 +0200
Subject: [PATCH b4 1/2] review-tui: set patchwork state on multiple series
 at once
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260623-20260623-review-tui-pw-multiselect-v1-1-2470add1453c@kernel.org>
References: <20260623-20260623-review-tui-pw-multiselect-v1-0-2470add1453c@kernel.org>
In-Reply-To: <20260623-20260623-review-tui-pw-multiselect-v1-0-2470add1453c@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-2c782
X-Developer-Signature: v=1; a=openpgp-sha256; l=17280; i=brauner@kernel.org;
 h=from:subject:message-id; bh=9YFeQtdutPgHq2g4kcA7ELZryBDJQsuD2EybuMadChY=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWRZBeaq39lg+HevhX7D74/iHsWuabJLzpeebzz9eG2b5
 E2rTQ5CHaUsDGJcDLJiiiwO7Sbhcst5KjYbZWrAzGFlAhnCwMUpABPZd5mR4aP+9O//XyQG68XG
 HVFWPGjy/8N885Lcc5E2GuXWLOufqzH8d1WdvyO0+s4GAynmlXOv8Bx6d/SUp1TFxgtza8uC9Pd
 5MwIA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

In the Patchwork browser (b4 review -> p) the 's' key only ever set the
state on the single highlighted series, so moving a stack of series to
the same state -- e.g. marking a batch as Accepted -- meant repeating the
pick once per row.

Add a selection layer to the listing. Space marks or unmarks the
highlighted series (and steps to the next row), 'a' marks or clears every
row currently shown, and Esc drops all marks. Marked rows get a leading
'*' and the title shows an "N selected" count. 's' now applies the chosen
state to every marked series in one pass, falling back to the highlighted
row when nothing is marked, so the single-series workflow is unchanged.

Marks are resolved against the full listing, so they survive limit and
hidden-toggle changes and still apply to rows scrolled out of the filter;
they are pruned to the series that still exist after a refresh. The state
PATCHes already ran over a flat list of patch ids, so the existing apply
modal just receives the union across the marked series plus a summary
label.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/review_tui/_modals.py |   7 +-
 src/b4/review_tui/_pw_app.py | 201 +++++++++++++++++++++++++++++++++++--------
 2 files changed, 173 insertions(+), 35 deletions(-)

diff --git a/src/b4/review_tui/_modals.py b/src/b4/review_tui/_modals.py
index d383fdc..51e6b4e 100644
--- a/src/b4/review_tui/_modals.py
+++ b/src/b4/review_tui/_modals.py
@@ -350,10 +350,15 @@ PW_HELP_LINES = [
     '  [bold]v[/bold]         View series in modal\n',
     '  [bold]c[/bold]         View CI check details\n',
     '  [bold]t[/bold]         Track series for review\n',
-    '  [bold]s[/bold]         Set Patchwork state\n',
+    '  [bold]s[/bold]         Set state (marked series, or current)\n',
     '  [bold]h[/bold]         Hide series\n',
     '  [bold]u[/bold]         Unhide series (when showing hidden)\n',
     '\n',
+    '[bold]Select[/bold]\n',
+    '  [bold]Space[/bold]     Mark/unmark series\n',
+    '  [bold]a[/bold]         Mark/unmark all shown\n',
+    '  [bold]Esc[/bold]       Clear marks\n',
+    '\n',
     '[bold]App[/bold]\n',
     '  [bold]r[/bold]         Refresh series list\n',
     '  [bold]l[/bold]         Filter series by pattern\n',
diff --git a/src/b4/review_tui/_pw_app.py b/src/b4/review_tui/_pw_app.py
index a6f680a..e70d017 100644
--- a/src/b4/review_tui/_pw_app.py
+++ b/src/b4/review_tui/_pw_app.py
@@ -72,11 +72,13 @@ def _format_series_label(
     tracked: bool,
     ts: Optional[Dict[str, str]] = None,
     show_delegate: bool = True,
+    selected: bool = False,
 ) -> Text:
     """Build a Text label for a series row.
 
     *ts* is a resolved theme styles dict from :func:`resolve_styles`.
     When *show_delegate* is ``False`` the delegate column is omitted.
+    *selected* marks the row for a bulk action with a leading ``*``.
     """
     track_mark = 'T' if tracked else ' '
     ci_state = series.get('check') or 'pending'
@@ -96,6 +98,8 @@ def _format_series_label(
     submitter = pad_display(series.get('submitter') or 'Unknown', 30)
     name = series.get('name') or '(no subject)'
     text = Text()
+    sel_style = (f'bold {ts["warning"]}' if ts else 'bold') if selected else ''
+    text.append('*' if selected else ' ', style=sel_style)
     text.append(track_mark)
     text.append('\u25cf', style=ci_style)
     if show_delegate:
@@ -112,12 +116,17 @@ class PwSeriesItem(ListItem):
     ACTION_REQUIRED_STATES = ('new', 'under-review')
 
     def __init__(
-        self, series: Dict[str, Any], tracked: bool = False, show_delegate: bool = True
+        self,
+        series: Dict[str, Any],
+        tracked: bool = False,
+        show_delegate: bool = True,
+        selected: bool = False,
     ) -> None:
         super().__init__()
         self.series = series
         self.tracked = tracked
         self.show_delegate = show_delegate
+        self.selected = selected
         state = series.get('state', 'new')
         if state not in self.ACTION_REQUIRED_STATES:
             self.add_class('--dimmed')
@@ -128,11 +137,28 @@ class PwSeriesItem(ListItem):
         ts = resolve_styles(self.app)
         yield Label(
             _format_series_label(
-                self.series, self.tracked, ts, show_delegate=self.show_delegate
+                self.series,
+                self.tracked,
+                ts,
+                show_delegate=self.show_delegate,
+                selected=self.selected,
             ),
             markup=False,
         )
 
+    def refresh_label(self) -> None:
+        """Re-render this row's label after a state/tracked/selected change."""
+        ts = resolve_styles(self.app)
+        self.query_one(Label).update(
+            _format_series_label(
+                self.series,
+                self.tracked,
+                ts,
+                show_delegate=self.show_delegate,
+                selected=self.selected,
+            )
+        )
+
 
 class PwApp(LoreNodeShutdownMixin, App[None]):
     """Textual app for browsing Patchwork series."""
@@ -228,6 +254,7 @@ class PwApp(LoreNodeShutdownMixin, App[None]):
         'view': 'Series',
         'ci_checks': 'Series',
         'track_series': 'Series',
+        'toggle_mark': 'Series',
         'set_state': 'Series',
         'hide_series': 'Series',
         'refresh': 'App',
@@ -242,9 +269,12 @@ class PwApp(LoreNodeShutdownMixin, App[None]):
         Binding('j', 'cursor_down', 'Down', show=False),
         Binding('k', 'cursor_up', 'Up', show=False),
         Binding('u', 'unhide_series', 'unhide', show=False),
+        Binding('a', 'mark_all', 'mark all', show=False),
+        Binding('escape', 'clear_marks', 'clear marks', show=False),
         # Series-specific actions
         Binding('c', 'ci_checks', 'ci checks'),
         Binding('t', 'track_series', 'track'),
+        Binding('space', 'toggle_mark', 'mark', key_display='space'),
         Binding('s', 'set_state', 'set state'),
         Binding('h', 'hide_series', 'hide'),
         # App-global actions
@@ -272,9 +302,14 @@ class PwApp(LoreNodeShutdownMixin, App[None]):
         self._states: List[Dict[str, Any]] = []
         self._hidden_ids: Set[int] = set()
         self._tracked_ids: Set[int] = set()
+        # Series ids marked for a bulk action (set state). Persists across
+        # limit/hidden toggles; pruned to still-existing series on (re)fetch.
+        self._selected_ids: Set[int] = set()
         self._show_hidden: bool = False
         self._limit_pattern: str = ''
         self._all_series: List[Dict[str, Any]] = []
+        # Title without the trailing "· N selected" suffix, set on each refresh.
+        self._base_title: str = ''
         self._tracking_identifier: Optional[str] = None
         self._tracking_enabled: bool = False
         self._track_ctx: Optional[Dict[str, Any]] = None
@@ -449,10 +484,12 @@ class PwApp(LoreNodeShutdownMixin, App[None]):
         )
 
     async def _refresh_list(self) -> None:
-        title = self.query_one('#pw-title', Static)
         widgets = list(self.query('#pw-header, #pw-list'))
         for widget in widgets:
             await widget.remove()
+        # Drop marks for series that no longer exist (e.g. after a re-fetch).
+        valid_ids = {s.get('id') for s in self._all_series if s.get('id') is not None}
+        self._selected_ids &= valid_ids
         visible = []
         hidden_count = 0
         for s in self._all_series:
@@ -486,24 +523,31 @@ class PwApp(LoreNodeShutdownMixin, App[None]):
         # deliberately not loaded, which would otherwise look like data loss.
         if self._window_days:
             base += f' · last {self._window_days} days'
-        title.update(base)
+        self._base_title = base
+        self._update_title_selection()
         if not visible:
             return
         # Hide the delegate column when all values are empty or identical
         delegates = {s.get('delegate', '') or '' for s, _h in visible}
         show_delegate = len(delegates) > 1
         if show_delegate:
-            header_text = f'   {"Date":<12s}{"State":<15s} {"Submitter":<30s} {"Delegate":<15s} {"Series"}'
+            header_text = f'    {"Date":<12s}{"State":<15s} {"Submitter":<30s} {"Delegate":<15s} {"Series"}'
         else:
             header_text = (
-                f'   {"Date":<12s}{"State":<15s} {"Submitter":<30s} {"Series"}'
+                f'    {"Date":<12s}{"State":<15s} {"Submitter":<30s} {"Series"}'
             )
         header = Static(header_text, id='pw-header')
         items = []
         for s, is_hidden in visible:
             sid = s.get('id')
             is_tracked = sid in self._tracked_ids if sid else False
-            item = PwSeriesItem(s, tracked=is_tracked, show_delegate=show_delegate)
+            is_selected = sid in self._selected_ids if sid else False
+            item = PwSeriesItem(
+                s,
+                tracked=is_tracked,
+                show_delegate=show_delegate,
+                selected=is_selected,
+            )
             if is_hidden:
                 item.add_class('--hidden')
             items.append(item)
@@ -574,6 +618,74 @@ class PwApp(LoreNodeShutdownMixin, App[None]):
         except Exception:
             pass
 
+    def _visible_items(self) -> List['PwSeriesItem']:
+        """All series rows currently mounted in the list view."""
+        try:
+            lv = self.query_one('#pw-list', ListView)
+        except Exception:
+            return []
+        return [c for c in lv.children if isinstance(c, PwSeriesItem)]
+
+    def _update_title_selection(self) -> None:
+        """Append a "· N selected" suffix to the title when marks are active."""
+        try:
+            title = self.query_one('#pw-title', Static)
+        except Exception:
+            return
+        base = self._base_title
+        count = len(self._selected_ids)
+        if count:
+            base = f'{base} · {count} selected'
+        title.update(base)
+
+    def action_toggle_mark(self) -> None:
+        """Mark/unmark the highlighted series, then advance the cursor."""
+        item = self._get_highlighted_item()
+        if item is None:
+            return
+        sid = item.series.get('id')
+        if sid is None:
+            return
+        if sid in self._selected_ids:
+            self._selected_ids.discard(sid)
+            item.selected = False
+        else:
+            self._selected_ids.add(sid)
+            item.selected = True
+        item.refresh_label()
+        self._update_title_selection()
+        self.action_cursor_down()
+
+    def action_mark_all(self) -> None:
+        """Mark every visible series, or unmark them all if already marked."""
+        items = self._visible_items()
+        if not items:
+            return
+        all_marked = all(item.series.get('id') in self._selected_ids for item in items)
+        for item in items:
+            sid = item.series.get('id')
+            if sid is None:
+                continue
+            if all_marked:
+                self._selected_ids.discard(sid)
+                item.selected = False
+            else:
+                self._selected_ids.add(sid)
+                item.selected = True
+            item.refresh_label()
+        self._update_title_selection()
+
+    def action_clear_marks(self) -> None:
+        """Drop all marks (Esc)."""
+        if not self._selected_ids:
+            return
+        self._selected_ids.clear()
+        for item in self._visible_items():
+            if item.selected:
+                item.selected = False
+                item.refresh_label()
+        self._update_title_selection()
+
     def action_view(self) -> None:
         """View a Patchwork series thread in the lite thread viewer."""
         item = self._get_highlighted_item()
@@ -614,58 +726,84 @@ class PwApp(LoreNodeShutdownMixin, App[None]):
             return child
         return None
 
+    def _state_targets(self) -> List[Dict[str, Any]]:
+        """Series the set-state action applies to.
+
+        All marked series when any are marked, otherwise the highlighted row.
+        Marked series are resolved from the full listing so the action still
+        covers rows hidden by the current limit filter.
+        """
+        if self._selected_ids:
+            return [s for s in self._all_series if s.get('id') in self._selected_ids]
+        item = self._get_highlighted_item()
+        return [item.series] if item is not None else []
+
     def action_set_state(self) -> None:
         if not self._states:
             self.notify('States not loaded yet', severity='warning')
             return
-        item = self._get_highlighted_item()
-        if item is None:
+        targets = self._state_targets()
+        if not targets:
             return
-        current_state = item.series.get('state', 'new')
+        item = self._get_highlighted_item()
+        current_state = item.series.get('state', 'new') if item is not None else 'new'
         self.push_screen(
             SetStateScreen(self._states, current_state),
-            callback=lambda result: self._on_set_state(result, item),
+            callback=lambda result: self._on_set_state(result, targets),
         )
 
     def _on_set_state(
-        self, result: Optional[Tuple[str, bool]], item: 'PwSeriesItem'
+        self, result: Optional[Tuple[str, bool]], targets: List[Dict[str, Any]]
     ) -> None:
         if result is None:
             return
         new_state, archived = result
-        patch_ids = item.series.get('patch_ids', [])
+        patch_ids: List[int] = []
+        for s in targets:
+            patch_ids.extend(s.get('patch_ids', []))
         if not patch_ids:
-            self.notify('No patch IDs for this series', severity='warning')
+            self.notify('No patch IDs for selected series', severity='warning')
             return
 
-        series_name = item.series.get('name', '(no subject)')
+        if len(targets) == 1:
+            label = targets[0].get('name', '(no subject)')
+        else:
+            label = f'{len(targets)} series ({len(patch_ids)} patches)'
         self.push_screen(
             ApplyStateModal(
-                self._pwkey, self._pwurl, patch_ids, new_state, archived, series_name
+                self._pwkey, self._pwurl, patch_ids, new_state, archived, label
             ),
-            callback=lambda res: self._on_apply_complete(res, item),
+            callback=lambda res: self._on_apply_complete(res, targets),
         )
 
     def _on_apply_complete(
-        self, result: Optional[Tuple[int, int, str]], item: 'PwSeriesItem'
+        self, result: Optional[Tuple[int, int, str]], targets: List[Dict[str, Any]]
     ) -> None:
         assert result is not None
         ok, fail, new_state = result
         if fail:
             self.notify(f'{ok} updated, {fail} failed', severity='warning')
-        else:
+        elif len(targets) == 1:
             self.notify(f'{ok} patch(es) set to {new_state}', severity='information')
-        item.series['state'] = new_state
-        if new_state in PwSeriesItem.ACTION_REQUIRED_STATES:
-            item.remove_class('--dimmed')
         else:
-            item.add_class('--dimmed')
-        ts = resolve_styles(self)
-        item.query_one(Label).update(
-            _format_series_label(
-                item.series, item.tracked, ts, show_delegate=item.show_delegate
+            self.notify(
+                f'{len(targets)} series set to {new_state} ({ok} patches)',
+                severity='information',
             )
-        )
+        mounted = {item.series.get('id'): item for item in self._visible_items()}
+        for s in targets:
+            s['state'] = new_state
+            item = mounted.get(s.get('id'))
+            if item is None:
+                continue
+            item.selected = False
+            if new_state in PwSeriesItem.ACTION_REQUIRED_STATES:
+                item.remove_class('--dimmed')
+            else:
+                item.add_class('--dimmed')
+            item.refresh_label()
+        self._selected_ids.clear()
+        self._update_title_selection()
 
     def action_track_series(self) -> None:
         if not self._tracking_enabled:
@@ -777,12 +915,7 @@ class PwApp(LoreNodeShutdownMixin, App[None]):
         self._tracked_ids.add(pw_series_id)
         item.tracked = True
         item.add_class('--tracked')
-        ts = resolve_styles(self)
-        item.query_one(Label).update(
-            _format_series_label(
-                item.series, True, ts, show_delegate=item.show_delegate
-            )
-        )
+        item.refresh_label()
         self.notify(
             f'Started tracking: {series_name}', severity='information', timeout=3
         )

-- 
2.53.0

