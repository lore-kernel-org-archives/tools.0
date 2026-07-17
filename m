Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0BD390C81
	for <tools@linux.kernel.org>; Fri, 17 Jul 2026 22:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784327917; cv=none; b=M7e0bomV/aqiNnyfXeWnTf+Mh0Fmx7CEqNroVeTMxNqv37lmmQqNVwGg3HV/xaNiGh8CdY3+XwCS3+Y2zunS/n5PHRKG4bZ9Or6XtwJg29W16mdWnuVSi/Ro5HnUvLgAq5lThcBcLGU3s2vWKgyfblG1xo3hlhobGMCe7yDr35E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784327917; c=relaxed/simple;
	bh=Oy4IMKbIEoxvLGRd7Ch2zaDd4VWXO5DAYVDq0oAXSzg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L+JYkhXQsoIV0oPuZeAxJsQFIK1FD/PkAimOLQHkr6N+HAQGq5jR6OwuYha1LwgLbjEgSaJH7V6HSX9qAcAHXekdmQP+FLSmhkVopda/C8vGka5W1x91jC8hHGOeln/L4DdPV7+BWS8X3Vjl+dwDUNF2iFx2Aogt6n91Deiyv2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aCA4xKDz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aCA4xKDz"
Received: by smtp.kernel.org (Postfix)
	id 1700B1F00A3E; Fri, 17 Jul 2026 22:38:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D9DC1F000E9;
	Fri, 17 Jul 2026 22:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784327915;
	bh=WJpYlmokOeQSFQY9nasrvimKBQgoyivyyPDYTxMnrEo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=aCA4xKDzWDuiQw6W86njq7PsE+XsubNM+COPhrED5Dg6euC1Ql1+qiHmDspMJU+zP
	 +0z8rDoS6axixewSstLSmCyQG18rDe509bKdT+z3aZg2wO/ONKTJqEuOBw0FkiWUsw
	 ciaWMIP8rkeoutAJfbvcC5Mpxpes7qLmvFS0DuLNh3rv9KAi0n6bP6h9ZBNXToR+dB
	 5OVUh6Sb1avC/mEieJaVvrVaQcK98FcHFxTlXGXf9auhoMwykUaUlgQHZ5alRJ0LrU
	 At2LAaq2BXcgw9lxmlORTRb1HP0YXvhzRN+EnVzpXNuAiZmjw48+hN5ORaqkW2jrbU
	 jB5ppBge3CBSg==
From: Christian Brauner <brauner@kernel.org>
Date: Sat, 18 Jul 2026 00:37:46 +0200
Subject: [PATCH RFC 10/11] review-tui: expand tracked series into
 per-version rows
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260718-work-b4-multiver-rows-v1-10-3c539d2a3095@kernel.org>
References: <20260718-work-b4-multiver-rows-v1-0-3c539d2a3095@kernel.org>
In-Reply-To: <20260718-work-b4-multiver-rows-v1-0-3c539d2a3095@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-4217c
X-Developer-Signature: v=1; a=openpgp-sha256; l=25850; i=brauner@kernel.org;
 h=from:subject:message-id; bh=Oy4IMKbIEoxvLGRd7Ch2zaDd4VWXO5DAYVDq0oAXSzg=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWRFrbsps+Gg5/uZvfXyFfem/gw3XjlbY1avGLtrnu/sq
 6z+Yp7FHaUsDGJcDLJiiiwO7Sbhcst5KjYbZWrAzGFlAhnCwMUpABPZP4mRYeL/tIetV/bNFJGT
 eapio3/bQ2OGl9c1mwPuIo7+RTOm1zMy7JDcsvxh3xf/fwsS5nM/8a86b7L5Ddfi15aOmgYBPjp
 32QA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Series with more than one known version become expandable: 'x'
unfolds indented child rows (one per catalog revision, the tracked
one starred) showing per-version unread badges and activity dates,
'X' toggles every series at once.  Enter or 'e' on a child opens that
revision's thread with revision-correct seen syncing, 'd' range-diffs
it against the tracked revision directly, and every other action
keeps operating on the parent series.  Expansion state and the
(change_id, revision) cursor position survive the periodic DB-mtime
reloads and limit filtering.

Assisted-by: LLM
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/review_tui/_modals.py       |   7 +
 src/b4/review_tui/_tracking_app.py | 282 ++++++++++++++++++++++++++++++++++---
 2 files changed, 266 insertions(+), 23 deletions(-)

diff --git a/src/b4/review_tui/_modals.py b/src/b4/review_tui/_modals.py
index 5943426..32f92a3 100644
--- a/src/b4/review_tui/_modals.py
+++ b/src/b4/review_tui/_modals.py
@@ -328,9 +328,16 @@ TRACKING_HELP_LINES = [
     '  [bold]d[/bold]         Range-diff between revisions\n',
     '  [bold]a[/bold]         Open action menu (take, rebase, etc.)\n',
     '  [bold]u[/bold]         Update selected series\n',
+    '  [bold]x[/bold]         Expand/collapse the version rows of a ▸ series\n',
+    '\n',
+    '[bold]Version rows[/bold]\n',
+    '  v2*           Asterisk marks the revision the series tracks\n',
+    '  [bold]Enter[/bold] / [bold]e[/bold] View the thread of that version\n',
+    '  [bold]d[/bold]         Range-diff that version against the tracked one\n',
     '\n',
     '[bold]App[/bold]\n',
     '  [bold]U[/bold]         Update all tracked series\n',
+    '  [bold]X[/bold]         Expand/collapse all multi-version series\n',
     '  [bold]l[/bold]         Filter series by pattern\n',
     '  [bold]s[/bold]         Suspend to shell\n',
     '  [bold]p[/bold]         Switch to Patchwork TUI\n',
diff --git a/src/b4/review_tui/_tracking_app.py b/src/b4/review_tui/_tracking_app.py
index 8800383..3135781 100644
--- a/src/b4/review_tui/_tracking_app.py
+++ b/src/b4/review_tui/_tracking_app.py
@@ -334,6 +334,27 @@ def _resolve_worktree_take_conflict(
     return True
 
 
+def _format_version(rev: Dict[str, Any], series: Dict[str, Any]) -> str:
+    """Summarize one known version of *series* for the details panel."""
+    revision = rev.get('revision', 1)
+    out = f'v{revision}'
+    if revision == series.get('revision', 1):
+        out += ' (tracked)'
+    count = rev.get('message_count')
+    if count is None:
+        out += ' — - msgs (- unseen)'
+    else:
+        unseen = max(0, int(count) - int(rev.get('seen_message_count') or 0))
+        out += f' — {count} msgs ({unseen} unseen)'
+    found_at = rev.get('found_at') or ''
+    if found_at:
+        out += f', found {found_at[:10]}'
+    last_activity = rev.get('last_activity_at') or ''
+    if last_activity:
+        out += f', last activity {last_activity[:10]}'
+    return out
+
+
 def _format_snooze_until(value: str) -> str:
     """Format a snoozed_until value for display.
 
@@ -576,9 +597,10 @@ class TrackedSeriesItem(ListItem):
     }
     """
 
-    def __init__(self, series: Dict[str, Any]) -> None:
+    def __init__(self, series: Dict[str, Any], expanded: bool = False) -> None:
         super().__init__()
         self.series = series
+        self.expanded = expanded
         status = series.get('status', 'new')
         effective = 'queued' if series.get('queued') else status
         if _STATUS_TIER.get(effective, 2) >= 2:
@@ -607,6 +629,11 @@ class TrackedSeriesItem(ListItem):
         width = len(str(num_patches)) if num_patches > 0 else 1
         parts = extras + [f'v{revision}', f'{"0" * width}/{num_patches:0{width}d}']
         subject_display = f'[{",".join(parts)}] {ls.subject}'
+        # Series with more than one known version can be expanded with [x]
+        if len(TrackingApp._merge_tracked_revision(self.series)) > 1:
+            # U+25BE black down-pointing / U+25B8 black right-pointing triangle
+            marker = '▾' if self.expanded else '▸'
+            subject_display = f'{marker} {subject_display}'
         if display_width(submitter) > 20:
             while display_width(submitter) > 19:
                 submitter = submitter[:-1]
@@ -633,6 +660,68 @@ class TrackedSeriesItem(ListItem):
         yield Label(label, markup=False)
 
 
+class TrackedRevisionItem(ListItem):
+    """A single known version of an expanded series.
+
+    Rendered as a child row underneath its TrackedSeriesItem, with the
+    submitter column replaced by a tree glyph and the version number.
+    """
+
+    DEFAULT_CSS = """
+    TrackedRevisionItem Label {
+        text-style: dim;
+    }
+    """
+
+    def __init__(
+        self,
+        series: Dict[str, Any],
+        rev: Dict[str, Any],
+        is_tracked: bool,
+        is_last: bool,
+    ) -> None:
+        super().__init__()
+        self.series = series
+        self.rev = rev
+        self.is_tracked = is_tracked
+        self.is_last = is_last
+
+    def compose(self) -> ComposeResult:
+        # U+2514/U+251C box drawings light up-and-right / vertical-and-right
+        tree = '└─' if self.is_last else '├─'
+        mark = '*' if self.is_tracked else ''
+        version = f'  {tree} v{self.rev.get("revision", 1)}{mark}'
+        # Date of the last known activity, falling back to when the
+        # revision was first seen.
+        date_str = ''
+        stamp = self.rev.get('last_activity_at') or self.rev.get('found_at') or ''
+        if stamp:
+            try:
+                date_str = datetime.datetime.fromisoformat(stamp).strftime('%d %b')
+            except (ValueError, TypeError):
+                date_str = ''
+        # Show each version's own title, prefix-stripped -- the version
+        # column already carries the vN part.  Fall back to the series
+        # subject when the catalog has none.
+        rev_subject = self.rev.get('subject') or self.series.get('subject') or ''
+        if rev_subject:
+            rev_subject = b4.LoreSubject(rev_subject).subject
+        label = RichText(no_wrap=True, overflow='ellipsis')
+        label.append(pad_display(version, 20))
+        # Attestation (1), separator (1) and A·R·T (7) stay blank
+        label.append(' ' * 9)
+        _append_msgs(
+            label,
+            self.app,
+            self.rev.get('message_count'),
+            self.rev.get('seen_message_count'),
+        )
+        label.append(f'  {date_str:<6s}')
+        if rev_subject:
+            label.append(f'  {rev_subject}')
+        yield Label(label, markup=False)
+
+
 class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
     """Textual app for browsing tracked series.
 
@@ -731,10 +820,12 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
         'check': 'Series',
         'thread': 'Series',
         'range_diff': 'Series',
+        'toggle_expand': 'Series',
         'action': 'Series',
         'update_one': 'Series',
         'target_branch': 'Series',
         'update_all': 'App',
+        'expand_all': 'App',
         'process_queue': 'App',
         'limit': 'App',
         'suspend': 'App',
@@ -756,7 +847,9 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
         Binding('a', 'action', 'action'),
         Binding('u', 'update_one', 'update'),
         Binding('d', 'range_diff', 'range-diff'),
+        Binding('x', 'toggle_expand', 'versions'),
         # App-global actions
+        Binding('X', 'expand_all', 'Expand all', key_display='X', show=False),
         Binding('l', 'limit', 'limit'),
         Binding('s', 'suspend', 'shell'),
         Binding('p', 'patchwork', 'patchwork'),
@@ -782,6 +875,11 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
         self._patatt_sign = patatt_sign
         self._all_series: List[Dict[str, Any]] = []
         self._selected_series: Optional[Dict[str, Any]] = None
+        # Series showing per-version child rows, and the child row (if any)
+        # the cursor is on — both survive a list rebuild.
+        self._expanded_change_ids: set[str] = set()
+        self._selected_revision: Optional[Dict[str, Any]] = None
+        self._focus_revision: Optional[int] = None
         self._limit_pattern: str = ''
         self._db_mtime: float = 0.0
         # Detect patchwork configuration
@@ -829,6 +927,16 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
         self._cached_revisions = None
         self._cached_art_counts = None
 
+    def _stash_focus(self) -> None:
+        """Remember the highlighted row so the next _refresh_list restores it."""
+        if self._selected_series:
+            self._focus_change_id = self._selected_series.get('change_id')
+        self._focus_revision = (
+            self._selected_revision.get('revision')
+            if self._selected_revision is not None
+            else None
+        )
+
     def _refresh_msg_count(self, series: Dict[str, Any], total_messages: int) -> None:
         """Opportunistically refresh message count after fetching messages."""
         if not self._identifier:
@@ -872,6 +980,9 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
             with Horizontal(classes='details-row', id='detail-revisions-row'):
                 yield Static('Revisions:', classes='details-label')
                 yield Static('', id='detail-revisions', markup=False)
+            with Horizontal(classes='details-row', id='detail-version-row'):
+                yield Static('Version:', classes='details-label')
+                yield Static('', id='detail-version', markup=False)
             with Horizontal(classes='details-row', id='detail-branch-row'):
                 yield Static('Branch:', classes='details-label')
                 yield Static('', id='detail-branch', markup=False)
@@ -950,8 +1061,7 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
                 # pick up the change once the modal closes.
                 if len(self.app.screen_stack) > 1:
                     return
-                if self._selected_series:
-                    self._focus_change_id = self._selected_series.get('change_id')
+                self._stash_focus()
                 self._invalidate_caches()
                 self._load_series()
 
@@ -1141,8 +1251,7 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
         except OSError:
             return
         if mtime != self._db_mtime:
-            if self._selected_series:
-                self._focus_change_id = self._selected_series.get('change_id')
+            self._stash_focus()
             self._invalidate_caches()
             self._load_series()
 
@@ -1216,7 +1325,26 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
             header_text = f'{"Submitter":<20s}{"A":>1s} {"A·R·T":>7s}  {"Msgs":>6s}  {"S":<4s}{"Subject"}'
             header = Static(header_text, id='tracking-header')
 
-            list_items: List[ListItem] = [TrackedSeriesItem(s) for s in display_series]
+            list_items: List[ListItem] = []
+            for series in display_series:
+                revs = self._merge_tracked_revision(series)
+                expanded = (
+                    len(revs) > 1
+                    and series.get('change_id', '') in self._expanded_change_ids
+                )
+                list_items.append(TrackedSeriesItem(series, expanded=expanded))
+                if not expanded:
+                    continue
+                tracked = series.get('revision', 1)
+                for idx, rev in enumerate(revs):
+                    list_items.append(
+                        TrackedRevisionItem(
+                            series,
+                            rev,
+                            is_tracked=rev.get('revision') == tracked,
+                            is_last=idx == len(revs) - 1,
+                        )
+                    )
             lv = ListView(*list_items, id='tracking-list')
             await self.mount(header, before=self.query_one(Footer))
             await self.mount(lv, before=self.query_one(Footer))
@@ -1228,8 +1356,11 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
                     and item.series.get('change_id') == self._focus_change_id
                 ):
                     lv.index = idx
+                    if self._focus_revision is not None:
+                        lv.index = self._find_focus_child(list_items, idx)
                     break
             self._focus_change_id = None
+        self._focus_revision = None
         lv.focus()
 
         # Populate the details panel for the highlighted item now that
@@ -1239,10 +1370,30 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
         # status without waiting for the async Highlighted message to
         # be processed from the queue.
         highlighted = lv.highlighted_child
-        if isinstance(highlighted, TrackedSeriesItem):
+        if isinstance(highlighted, TrackedRevisionItem):
+            self._selected_series = highlighted.series
+            self._selected_revision = highlighted.rev
+            self._show_details(highlighted.series, rev=highlighted.rev)
+        elif isinstance(highlighted, TrackedSeriesItem):
             self._selected_series = highlighted.series
+            self._selected_revision = None
             self._show_details(highlighted.series)
 
+    def _find_focus_child(self, list_items: List[ListItem], parent_idx: int) -> int:
+        """Index of the _focus_revision child row below *parent_idx*.
+
+        Falls back to the parent index when that version is no longer
+        listed — it may have gone away, or the series may have been
+        collapsed since the focus was stashed.
+        """
+        for idx in range(parent_idx + 1, len(list_items)):
+            item = list_items[idx]
+            if not isinstance(item, TrackedRevisionItem):
+                break
+            if item.rev.get('revision') == self._focus_revision:
+                return idx
+        return parent_idx
+
     def action_limit(self) -> None:
         self.push_screen(
             LimitScreen(
@@ -1255,8 +1406,7 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
         if result is None:
             return
         self._limit_pattern = result
-        if self._selected_series:
-            self._focus_change_id = self._selected_series.get('change_id')
+        self._stash_focus()
         self._load_series()
 
     def action_cursor_down(self) -> None:
@@ -1271,17 +1421,58 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
         except Exception:
             pass
 
+    def action_toggle_expand(self) -> None:
+        """Show or hide the version rows of the selected series."""
+        series = self._selected_series
+        if not series or len(self._merge_tracked_revision(series)) < 2:
+            return
+        change_id = series.get('change_id', '')
+        if change_id in self._expanded_change_ids:
+            self._expanded_change_ids.discard(change_id)
+            # The highlighted version row is about to go away
+            self._selected_revision = None
+        else:
+            self._expanded_change_ids.add(change_id)
+        self._stash_focus()
+        self.call_later(self._refresh_list)
+
+    def action_expand_all(self) -> None:
+        """Expand every multi-version series, or collapse them all."""
+        expandable = {
+            s.get('change_id', '')
+            for s in self._all_series
+            if len(self._merge_tracked_revision(s)) > 1
+        }
+        if not expandable:
+            return
+        if expandable - self._expanded_change_ids:
+            self._expanded_change_ids |= expandable
+        else:
+            self._expanded_change_ids.clear()
+            self._selected_revision = None
+        self._stash_focus()
+        self.call_later(self._refresh_list)
+
     def on_list_view_highlighted(self, event: ListView.Highlighted) -> None:
         if event.list_view.id != 'tracking-list':
             return
         item = event.item
-        if isinstance(item, TrackedSeriesItem):
+        if isinstance(item, TrackedRevisionItem):
+            self._selected_series = item.series
+            self._selected_revision = item.rev
+            self._show_details(item.series, rev=item.rev)
+        elif isinstance(item, TrackedSeriesItem):
             self._selected_series = item.series
+            self._selected_revision = None
             self._show_details(item.series)
         self.refresh_bindings()
 
     def on_list_view_selected(self, event: ListView.Selected) -> None:
         if event.list_view.id == 'tracking-list':
+            # A version row opens that version's thread
+            if isinstance(event.item, TrackedRevisionItem):
+                self.action_thread()
+                return
             if not self._selected_series:
                 return
             status = self._selected_series.get('status', 'new')
@@ -1355,6 +1546,11 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
             return bool(self._pwkey and self._pwurl and self._pwproj)
         if action == 'action':
             return self._selected_series is not None
+        if action == 'toggle_expand':
+            return bool(
+                self._selected_series
+                and len(self._merge_tracked_revision(self._selected_series)) > 1
+            )
         if action in self._GATED_ACTIONS:
             if not self._selected_series:
                 return False
@@ -1581,10 +1777,19 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
         self._checkout_new_series()
 
     def action_thread(self) -> None:
-        """View a series thread in the lite thread viewer."""
+        """View a series thread in the lite thread viewer.
+
+        A highlighted version row views that version's thread; otherwise
+        the thread of the revision the series tracks.
+        """
         if not self._selected_series:
             return
-        message_id = self._selected_series.get('message_id', '')
+        source = (
+            self._selected_revision
+            if self._selected_revision is not None
+            else self._selected_series
+        )
+        message_id = source.get('message_id', '')
         if not message_id:
             self.notify('No message-id available for this series', severity='error')
             return
@@ -1593,10 +1798,10 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
             tracking_info = {
                 'identifier': self._identifier,
                 'change_id': self._selected_series.get('change_id', ''),
-                'revision': self._selected_series.get('revision', 1),
-                'is_rethreaded': bool(self._selected_series.get('is_rethreaded')),
+                'revision': source.get('revision', 1),
+                'is_rethreaded': bool(source.get('is_rethreaded')),
             }
-        self._focus_change_id = self._selected_series.get('change_id')
+        self._stash_focus()
         from b4.review_tui._lite_app import LiteThreadScreen
 
         self.push_screen(
@@ -1608,7 +1813,8 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
             )
         )
 
-    def _merge_tracked_revision(self, series: Dict[str, Any]) -> List[Dict[str, Any]]:
+    @staticmethod
+    def _merge_tracked_revision(series: Dict[str, Any]) -> List[Dict[str, Any]]:
         """Known revisions of a series, guaranteed to include the tracked one.
 
         The revisions catalog is not guaranteed a row for the tracked
@@ -2042,8 +2248,14 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
         # Exit to review mode
         self.exit(branch_name)
 
-    def _show_details(self, series: Dict[str, Any]) -> None:
+    def _show_details(
+        self, series: Dict[str, Any], rev: Optional[Dict[str, Any]] = None
+    ) -> None:
+        """Fill the details panel for *series*, or for one of its versions.
 
+        With *rev* given the version-specific fields (subject, link) come
+        from that revision instead of the tracked one.
+        """
         try:
             panel = self.query_one('#details-panel', Vertical)
         except NoMatches:
@@ -2051,6 +2263,9 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
 
         raw_subject = series.get('subject', '(no subject)')
         revision = series.get('revision', 1)
+        if rev is not None:
+            raw_subject = rev.get('subject') or raw_subject
+            revision = rev.get('revision', revision)
         num_patches = series.get('num_patches', 0) or 0
         ls = b4.LoreSubject(raw_subject)
         extras = ls.get_extra_prefixes(exclude=['patch'])
@@ -2066,7 +2281,10 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
 
         # Create link URL from message-id using linkmask
         link_url = ''
-        if message_id:
+        if rev is not None:
+            link_url = rev.get('link') or ''
+            message_id = rev.get('message_id', '')
+        if not link_url and message_id:
             config = b4.get_main_config()
             linkmask = config.get('linkmask', b4.LOREADDR + '/%s')
             if isinstance(linkmask, str) and '%s' in linkmask:
@@ -2149,6 +2367,16 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
             else:
                 revisions_row.display = False
 
+        # Describe the highlighted version row, if any
+        version_row = self.query_one('#detail-version-row', Horizontal)
+        if rev is not None:
+            self.query_one('#detail-version', Static).update(
+                _format_version(rev, series)
+            )
+            version_row.display = True
+        else:
+            version_row.display = False
+
         # Show branch name for series with a review branch
         status = series.get('status', 'new')
         branch_row = self.query_one('#detail-branch-row', Horizontal)
@@ -2324,7 +2552,7 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
         linkmask = str(config.get('linkmask', 'https://lore.kernel.org/r/%s'))
         topdir = b4.git_get_toplevel()
 
-        self._focus_change_id = self._selected_series.get('change_id')
+        self._stash_focus()
         self.push_screen(
             UpdateAllScreen(
                 [self._selected_series], self._identifier, linkmask, topdir
@@ -2345,8 +2573,7 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
         # Skip snoozed series during update-all
         update_list = [s for s in self._all_series if s.get('status') != 'snoozed']
 
-        if self._selected_series:
-            self._focus_change_id = self._selected_series.get('change_id')
+        self._stash_focus()
         self.push_screen(
             UpdateAllScreen(update_list, self._identifier, linkmask, topdir),
             callback=self._on_update_complete,
@@ -2389,6 +2616,7 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
         if self._selected_series is not None:
             panel.styles.height = 0
             self._selected_series = None
+            self._selected_revision = None
 
     def action_take(self) -> None:
         """Show take options dialog for the selected series."""
@@ -3589,6 +3817,15 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
         change_id = self._selected_series.get('change_id', '')
         current_rev = self._selected_series.get('revision', 1)
 
+        # A highlighted version row already names the other side of the
+        # diff, so skip the picker.
+        if self._selected_revision is not None:
+            other_rev = self._selected_revision.get('revision')
+            if other_rev is not None and other_rev != current_rev:
+                with self.suspend():
+                    self._do_range_diff(change_id, current_rev, other_rev)
+                return
+
         try:
             conn = b4.review.tracking.get_db(self._identifier)
             revisions = b4.review.tracking.get_revisions(conn, change_id)
@@ -5107,8 +5344,7 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
             self.notify(', '.join(parts) if parts else 'Queue empty')
             self._refresh_queue_indicator()
             if delivered_series:
-                if self._selected_series:
-                    self._focus_change_id = self._selected_series.get('change_id')
+                self._stash_focus()
                 self._load_series()
 
         self.push_screen(

-- 
2.53.0

