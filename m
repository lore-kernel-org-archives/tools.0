Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D360F547061
	for <tools@linux.kernel.org>; Thu, 15 Oct 2026 00:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792022660; cv=none; b=GguBFPNlfWuECsingUhVCeBNYpDhXc/x6f1VPX/ariN2BUKRHRuVGdLHKp1mkWE7z1Lb38JOF9x+Dc6853KE2UXmeudSnYiHXGSyzUJfYfWsE+gVVehJfwO0lFLK7OlG3e6SDpuXipbk2hJqzJtJoZZkGYtGwOv9tpk9qm/sklQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792022660; c=relaxed/simple;
	bh=gHTd4ByjOjgFKoJBheZ9Dc9kMnzoPMRBg5rA1guCfWk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hsrR782pKHNVC42uBhzW5/vR5JIxVco4YYMuDqVn3qRAGsPTXK767fhLSc6eQesgOFYgBlP6NGfCqTVgxxhLDX9mSNW5iG8rnFfV8vYVM1izHZOQF5HC6lvbOuyXLMJMlVzsdXmhi1Q97dzdupvybhjRX5cUsJLuDtTSVhkU73k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MkUpue3w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MkUpue3w"
Received: by smtp.kernel.org (Postfix)
	id D0C541F000C4; Thu, 15 Oct 2026 00:04:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E8601F000C9;
	Thu, 15 Oct 2026 00:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792022658;
	bh=/PNuBhYQf/8QuOJL37UcOYzrNKUXtDxehRY2hSi3zDM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=MkUpue3wLR3jnTLp0vqA7W9Oj1s24oZUP2QkKK4DZwvRynC2cu/sg+i5a9qnubE66
	 AgUBFAxB3yyCX5uWdPYcr4BugOcXnwlY1eS0aF3Zn3KHlnL37GZSjyaFXa+aH9JuPo
	 +JVWr2KM4b5H3LdhloUWuk0T4Os81VIOYasCyhSX0PRckFkZk0cN/9ZnIErfcsgfo7
	 aO4K7Xvh98M7+cPy8o8ZNjoYNKfP1kU1nqoVvRP1I9Mb/rBlxelQda1wvRG3LDyTPs
	 9FUEhrRT+hg3HynutrcYGtnx+8ZXI1dAWY/qmXmf7Wxrj4L48HSUhGu32oe5DhhmRc
	 SNRdtEFHau75g==
From: Brian Masney <masneyb@kernel.org>
Date: Wed, 14 Oct 2026 20:03:41 -0400
Subject: [PATCH b4 4/4] review-tui: change the Patchwork delegate from the
 pw browser
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261014-pw-delegate-v1-4-a393ae92152a@kernel.org>
References: <20261014-pw-delegate-v1-0-a393ae92152a@kernel.org>
In-Reply-To: <20261014-pw-delegate-v1-0-a393ae92152a@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Brian Masney <masneyb@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=25231; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=gHTd4ByjOjgFKoJBheZ9Dc9kMnzoPMRBg5rA1guCfWk=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLIuSNRtmrv1YQbf/K/n/xbnn9nN5jx5X5OtC4vqjNkJY
 Y/mzPqyvaOUhUGMi0FWTJFlSa5RQUTqKtt7dzRZYOawMoEMYeDiFICJ7DrA8N9dRT42+OLiW9f9
 Zy2SlBX8ulao3f7NyfsyvQJHUuuez2di+KctfeK2nKurrfqUBz1Hjt5hvc6vr73IlPE2g8ur7T5
 uFQwA
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The Patchwork browser shows who a series is delegated to, and can filter
on it, but changing the delegate still means going to the web UI. Add a
'd' key that offers the project's maintainers, plus "(no delegate)", and
sets the chosen one on every patch in the series. Like 's', it acts on
every marked series when any are marked, asks for confirmation first,
and can be stopped with Esc.

Assisted-by: LLM
Signed-off-by: Brian Masney <masneyb@kernel.org>
---
 docs/maintainer/review.rst   |   6 ++
 src/b4/review_tui/_modals.py | 168 +++++++++++++++++++++++++++++++++++++++++++
 src/b4/review_tui/_pw_app.py | 160 ++++++++++++++++++++++++++++++++++++++++-
 src/tests/test_tui_pw.py     | 155 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 488 insertions(+), 1 deletion(-)

diff --git a/docs/maintainer/review.rst b/docs/maintainer/review.rst
index fc708dd82055..d493460576ce 100644
--- a/docs/maintainer/review.rst
+++ b/docs/maintainer/review.rst
@@ -826,6 +826,7 @@ there you can:
 * View CI check details for a series (``c``)
 * Track a series directly from the Patchwork list (``t``)
 * Set or change the Patchwork state for a series (``s``)
+* Change the Patchwork delegate for a series (``d``)
 * Hide and unhide series (``h``/``u``)
 * Toggle display of hidden series (``H``)
 * Refresh the series list from Patchwork (``r``)
@@ -843,6 +844,11 @@ To set the state of many series at once, mark them first (``space``, or
 changes anything. While the states are being set, press ``Esc`` to stop
 after the current patch.
 
+Press ``d`` to delegate a series to another project maintainer, or to
+clear its delegate. Patchwork only accepts project maintainers as
+delegates, so the list offers only those. Like ``s``, it acts on every
+marked series when any are marked.
+
 B4 also keeps Patchwork up to date as you work through the review
 lifecycle. This works for any tracked series that Patchwork knows
 about, not only the series you track from the Patchwork browser. B4
diff --git a/src/b4/review_tui/_modals.py b/src/b4/review_tui/_modals.py
index bcdbba2250cc..1d2e82c133c7 100644
--- a/src/b4/review_tui/_modals.py
+++ b/src/b4/review_tui/_modals.py
@@ -361,6 +361,7 @@ PW_HELP_LINES = [
     '  [bold]c[/bold]         View CI check details\n',
     '  [bold]t[/bold]         Track series for review\n',
     '  [bold]s[/bold]         Set state (marked series, or current)\n',
+    '  [bold]d[/bold]         Set delegate (marked series, or current)\n',
     '  [bold]h[/bold]         Hide series\n',
     '  [bold]u[/bold]         Unhide series (when showing hidden)\n',
     '\n',
@@ -2711,6 +2712,143 @@ def SetStateConfirmScreen(
     )
 
 
+class DelegateOption(ListItem):
+    """A selectable user entry in the set-delegate dialog.
+
+    A *user_id* of None is the "no delegate" entry.
+    """
+
+    def __init__(
+        self,
+        user_id: Optional[int],
+        username: str,
+        label: str,
+        highlighted: bool = False,
+    ) -> None:
+        super().__init__()
+        self.user_id = user_id
+        self.username = username
+        self._label = label
+        self._highlighted = highlighted
+
+    def compose(self) -> ComposeResult:
+        marker = '> ' if self._highlighted else '  '
+        yield Label(f'{marker}{self._label}', markup=False)
+
+
+class SetDelegateScreen(
+    JKListNavMixin, ModalScreen[Optional[Tuple[Optional[int], str]]]
+):
+    """Modal to pick a new Patchwork delegate for a series.
+
+    *users* are the project maintainers, as returned by
+    :func:`b4.review.pw_fetch_maintainers`.  Returns (user_id, username) on
+    confirm, with (None, '') meaning "clear the delegate", or None on cancel.
+    """
+
+    _list_id = '#delegate-list'
+
+    BINDINGS = [
+        Binding('j', 'cursor_down', 'Down', show=False),
+        Binding('k', 'cursor_up', 'Up', show=False),
+        Binding('enter', 'confirm', 'Confirm'),
+        Binding('escape', 'cancel', 'Cancel'),
+        Binding('q', 'cancel', 'Cancel', show=False),
+    ]
+
+    DEFAULT_CSS = """
+    SetDelegateScreen {
+        align: center middle;
+    }
+    #delegate-dialog {
+        width: 70;
+        height: auto;
+        max-height: 80%;
+        border: solid $accent;
+        background: $surface;
+        padding: 1 2;
+    }
+    #delegate-list {
+        height: auto;
+        max-height: 20;
+    }
+    """
+
+    def __init__(self, users: List[Dict[str, Any]], current_delegate: str) -> None:
+        super().__init__()
+        self._users = users
+        self._current_delegate = current_delegate
+
+    def compose(self) -> ComposeResult:
+        options = [
+            DelegateOption(None, '', '(no delegate)', not self._current_delegate)
+        ]
+        for u in self._users:
+            label = u['username']
+            if u.get('name'):
+                label = f'{label} ({u["name"]})'
+            options.append(
+                DelegateOption(
+                    u['id'],
+                    u['username'],
+                    label,
+                    u['username'] == self._current_delegate,
+                )
+            )
+        with Vertical(id='delegate-dialog'):
+            yield Label('Set delegate (Enter=confirm, Esc=cancel):')
+            yield ListView(*options, id='delegate-list')
+
+    def on_mount(self) -> None:
+        lv = self.query_one('#delegate-list', ListView)
+        lv.focus()
+        # Pre-select the current delegate
+        for i, child in enumerate(lv.children):
+            if (
+                isinstance(child, DelegateOption)
+                and child.username == self._current_delegate
+            ):
+                lv.index = i
+                break
+
+    def action_confirm(self) -> None:
+        self._do_confirm()
+
+    def on_list_view_selected(self, event: ListView.Selected) -> None:
+        event.stop()
+        self._do_confirm()
+
+    def _do_confirm(self) -> None:
+        lv = self.query_one('#delegate-list', ListView)
+        child = lv.highlighted_child
+        if not isinstance(child, DelegateOption):
+            self.dismiss(None)
+            return
+        self.dismiss((child.user_id, child.username))
+
+    def action_cancel(self) -> None:
+        self.dismiss(None)
+
+
+def SetDelegateConfirmScreen(
+    num_series: int, num_patches: int, delegate: str
+) -> ConfirmScreen:
+    """Build a confirmation screen for a bulk Patchwork delegate change."""
+    if delegate:
+        subject = f'Delegating {num_series} series to "{delegate}"'
+    else:
+        subject = f'Clearing the delegate of {num_series} series'
+    return ConfirmScreen(
+        title='Set Delegate',
+        body=[
+            f'{num_patches} patches will be updated on the Patchwork server.',
+            '',
+            'Are you sure?',
+        ],
+        subject=subject,
+    )
+
+
 # Seconds to wait for one Patchwork PATCH. Esc can only stop the run
 # between requests, so a hung request must not block it for ever.
 PW_PATCH_TIMEOUT = 30
@@ -2903,6 +3041,36 @@ class ApplyStateModal(ModalScreen[ApplyStateResult]):
             self.dismiss(self._result())
 
 
+class ApplyDelegateModal(ApplyStateModal):
+    """Modal showing progress while changing the delegate of patches.
+
+    A *delegate_id* of None clears the delegate.  The result's
+    ``new_state`` carries the new delegate's username ('' when cleared).
+    """
+
+    def __init__(
+        self,
+        pwkey: str,
+        pwurl: str,
+        patch_ids: List[int],
+        delegate_id: Optional[int],
+        delegate_name: str,
+        series_name: str,
+    ) -> None:
+        super().__init__(pwkey, pwurl, patch_ids, delegate_name, False, series_name)
+        self._delegate_id = delegate_id
+
+    def _title(self) -> str:
+        if self._delegate_id is None:
+            return 'Clearing delegate'
+        return f'Setting delegate to: {self._new_state}'
+
+    def _payload(self) -> Dict[str, Any]:
+        # Patchwork treats an empty relational field as null, which clears
+        # the delegate.
+        return {'delegate': '' if self._delegate_id is None else self._delegate_id}
+
+
 class UpdateAllScreen(ModalScreen[Dict[str, Any]]):
     """Modal showing progress while updating all tracked series.
 
diff --git a/src/b4/review_tui/_pw_app.py b/src/b4/review_tui/_pw_app.py
index 6e99488d7e35..27eb50c191c3 100644
--- a/src/b4/review_tui/_pw_app.py
+++ b/src/b4/review_tui/_pw_app.py
@@ -38,11 +38,14 @@ from b4.review_tui._common import (
 )
 from b4.review_tui._modals import (
     PW_HELP_LINES,
+    ApplyDelegateModal,
     ApplyStateModal,
     ApplyStateResult,
     CIChecksScreen,
     HelpScreen,
     LimitScreen,
+    SetDelegateConfirmScreen,
+    SetDelegateScreen,
     SetStateConfirmScreen,
     SetStateScreen,
 )
@@ -263,6 +266,7 @@ class PwApp(LoreNodeShutdownMixin, App[None]):
         'track_series': 'Series',
         'toggle_mark': 'Series',
         'set_state': 'Series',
+        'set_delegate': 'Series',
         'hide_series': 'Series',
         'refresh': 'App',
         'limit': 'App',
@@ -283,6 +287,7 @@ class PwApp(LoreNodeShutdownMixin, App[None]):
         Binding('t', 'track_series', 'track'),
         Binding('space', 'toggle_mark', 'mark', key_display='space'),
         Binding('s', 'set_state', 'set state'),
+        Binding('d', 'set_delegate', 'delegate'),
         Binding('h', 'hide_series', 'hide'),
         # App-global actions
         Binding('r', 'refresh', 'refresh'),
@@ -327,6 +332,10 @@ class PwApp(LoreNodeShutdownMixin, App[None]):
         # large-backlog notice this session (it pops up once, not every reload).
         self._backlog_count: int = 0
         self._backlog_notice_shown: bool = False
+        # Project maintainers (the users a patch can be delegated to),
+        # fetched the first time the delegate picker is opened.
+        self._maintainers: Optional[List[Dict[str, Any]]] = None
+        self._delegate_targets: List[Dict[str, Any]] = []
         self._load_local_data()
         self._load_tracking_data()
 
@@ -467,6 +476,16 @@ class PwApp(LoreNodeShutdownMixin, App[None]):
                 if isinstance(err, liblore.OperationCancelledError):
                     return
                 self.notify(f'Error retrieving series: {err}', severity='error')
+        elif event.worker.name == '_fetch_maintainers':
+            if event.state == WorkerState.SUCCESS:
+                self._maintainers = event.worker.result or []
+                self._open_delegate_picker()
+            elif event.state == WorkerState.ERROR:
+                self._delegate_targets = []
+                self.notify(
+                    f'Error fetching project maintainers: {event.worker.error}',
+                    severity='error',
+                )
 
     async def _populate(self, series_list: List[Dict[str, Any]]) -> None:
         loading = self.query('#pw-loading')
@@ -729,7 +748,7 @@ class PwApp(LoreNodeShutdownMixin, App[None]):
         return None
 
     def _state_targets(self) -> List[Dict[str, Any]]:
-        """Series the set-state action applies to.
+        """Series the set-state and set-delegate actions apply to.
 
         All marked series when any are marked, otherwise the highlighted row.
         Marked series are resolved from the full listing so the action still
@@ -847,6 +866,145 @@ class PwApp(LoreNodeShutdownMixin, App[None]):
             item.refresh_label()
         self._update_title_selection()
 
+    def action_set_delegate(self) -> None:
+        """Change the Patchwork delegate of the marked (or highlighted) series."""
+        targets = self._state_targets()
+        if not targets:
+            return
+        self._delegate_targets = targets
+        if self._maintainers is None:
+            self.notify('Fetching project maintainers…', timeout=3)
+            self.run_worker(
+                self._fetch_maintainers,
+                name='_fetch_maintainers',
+                thread=True,
+                exit_on_error=False,
+            )
+            return
+        self._open_delegate_picker()
+
+    def _fetch_maintainers(self) -> List[Dict[str, Any]]:
+        from b4.review_tui._common import _quiet_worker
+
+        with _quiet_worker():
+            return b4.review.pw_fetch_maintainers(
+                self._pwkey, self._pwurl, self._pwproj
+            )
+
+    def _open_delegate_picker(self) -> None:
+        targets = self._delegate_targets
+        self._delegate_targets = []
+        if not targets:
+            return
+        if not self._maintainers:
+            self.notify(
+                'This Patchwork project has no maintainers to delegate to',
+                severity='warning',
+            )
+            return
+        item = self._get_highlighted_item()
+        current = (item.series.get('delegate') or '') if item is not None else ''
+        self.push_screen(
+            SetDelegateScreen(self._maintainers, current),
+            callback=lambda result: self._on_set_delegate(result, targets),
+        )
+
+    def _on_set_delegate(
+        self,
+        result: Optional[Tuple[Optional[int], str]],
+        targets: List[Dict[str, Any]],
+    ) -> None:
+        if result is None:
+            return
+        user_id, username = result
+        patch_ids: List[int] = []
+        for s in targets:
+            patch_ids.extend(s.get('patch_ids', []))
+        if not patch_ids:
+            self.notify('No patch IDs for selected series', severity='warning')
+            return
+
+        def _apply(label: str) -> None:
+            self.push_screen(
+                ApplyDelegateModal(
+                    self._pwkey, self._pwurl, patch_ids, user_id, username, label
+                ),
+                callback=lambda res: self._on_delegate_complete(res, targets),
+            )
+
+        if len(targets) == 1:
+            _apply(targets[0].get('name') or '(no subject)')
+            return
+
+        # Several series in one go: let the user check the count first.
+        label = f'{len(targets)} series ({len(patch_ids)} patches)'
+
+        def _on_confirm(confirmed: Optional[bool]) -> None:
+            if confirmed:
+                _apply(label)
+
+        self.push_screen(
+            SetDelegateConfirmScreen(len(targets), len(patch_ids), username),
+            callback=_on_confirm,
+        )
+
+    async def _on_delegate_complete(
+        self, result: Optional[ApplyStateResult], targets: List[Dict[str, Any]]
+    ) -> None:
+        assert result is not None
+        delegate = result.new_state
+        what = f'delegated to {delegate}' if delegate else 'undelegated'
+        # As with set state, only a series whose every patch was updated
+        # takes the new delegate; the rest stay marked for another try.
+        done = [
+            s
+            for s in targets
+            if s.get('patch_ids')
+            and all(pid in result.done_ids for pid in s['patch_ids'])
+        ]
+        ok = len(result.done_ids)
+        if result.cancelled:
+            self.notify(
+                f'Stopped: {len(done)} of {len(targets)} series {what} ({ok} patches)',
+                severity='warning',
+            )
+        elif result.fail:
+            msg = f'{ok} updated, {result.fail} failed'
+            if result.error:
+                msg += f': {escape(result.error)}'
+            self.notify(msg, severity='warning')
+        elif len(targets) == 1:
+            self.notify(f'{ok} patch(es) {what}', severity='information')
+        else:
+            self.notify(
+                f'{len(targets)} series {what} ({ok} patches)',
+                severity='information',
+            )
+        for s in done:
+            s['delegate'] = delegate
+            self._selected_ids.discard(s.get('id'))
+
+        items = self._visible_items()
+        # The delegate column only shows when the visible rows disagree, so a
+        # change can make it appear or disappear: rebuild the list then.
+        show_delegate = len({it.series.get('delegate') or '' for it in items}) > 1
+        if items and show_delegate != items[0].show_delegate:
+            lv = self.query_one('#pw-list', ListView)
+            index = lv.index
+            await self._refresh_list()
+            if index is not None:
+                try:
+                    self.query_one('#pw-list', ListView).index = index
+                except Exception:
+                    pass
+            return
+        done_ids = {s.get('id') for s in done}
+        for item in items:
+            if item.series.get('id') in done_ids:
+                item.selected = False
+                item.refresh_label()
+        self._update_title_selection()
+
     def action_track_series(self) -> None:
         if not self._tracking_enabled:
             self.notify(
diff --git a/src/tests/test_tui_pw.py b/src/tests/test_tui_pw.py
index 1d7f62681f26..af3ac9d38af5 100644
--- a/src/tests/test_tui_pw.py
+++ b/src/tests/test_tui_pw.py
@@ -21,6 +21,7 @@ import requests
 pytest.importorskip('textual')
 
 from textual.widgets import Label, ListView, ProgressBar
+from textual.worker import WorkerFailed
 
 import b4
 import b4.review
@@ -31,6 +32,7 @@ from b4.review_tui._modals import (
     PW_PATCH_TIMEOUT,
     ApplyStateModal,
     ConfirmScreen,
+    SetDelegateScreen,
     SetStateScreen,
 )
 from b4.review_tui._pw_app import PwApp, PwFetchProgress
@@ -493,6 +495,7 @@ class _FakePwSession:
 
     def __init__(self) -> None:
         self.patched: List[str] = []
+        self.payloads: List[Any] = []
         self.timeouts: List[Optional[float]] = []
 
     def patch(
@@ -503,6 +506,7 @@ class _FakePwSession:
         timeout: Optional[float] = None,
     ) -> _FakeResp:
         self.patched.append(url)
+        self.payloads.append(data)
         self.timeouts.append(timeout)
         return _FakeResp()
 
@@ -937,6 +941,157 @@ class TestPwApplyErrorText:
 # ---------------------------------------------------------------------------
 
 
+def _pw_maintainers() -> List[Dict[str, Any]]:
+    return [
+        {'id': 7, 'username': 'alice', 'name': 'Alice A', 'email': 'a@example.com'},
+        {'id': 9, 'username': 'bob', 'name': '', 'email': 'b@example.com'},
+    ]
+
+
+class TestPwSetDelegate:
+    """`d` delegates the marked (or highlighted) series to a maintainer."""
+
+    def _install(
+        self, monkeypatch: pytest.MonkeyPatch, series: List[Dict[str, Any]]
+    ) -> _FakePwSession:
+        fake = _FakePwSession()
+        monkeypatch.setattr(
+            b4, 'get_patchwork_session', lambda key, url: (fake, 'https://pw/api')
+        )
+        self.maintainer_calls = 0
+
+        def _maintainers(*a: Any, **k: Any) -> List[Dict[str, Any]]:
+            self.maintainer_calls += 1
+            return _pw_maintainers()
+
+        monkeypatch.setattr(b4.review, 'pw_fetch_maintainers', _maintainers)
+        _install_series(monkeypatch, series)
+        return fake
+
+    @pytest.mark.asyncio
+    async def test_delegate_highlighted(self, monkeypatch: pytest.MonkeyPatch) -> None:
+        fake = self._install(monkeypatch, [_mk_series(1), _mk_series(2)])
+        app = PwApp('k', 'https://pw.example.org', 'proj')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await app.workers.wait_for_complete()
+            await pilot.pause()
+            app.query_one('#pw-list', ListView).index = 1
+            await pilot.press('d')
+            await app.workers.wait_for_complete()
+            await pilot.pause()
+            assert isinstance(app.screen, SetDelegateScreen)
+            # "(no delegate)" first, then the maintainers.
+            lv = app.screen.query_one('#delegate-list', ListView)
+            assert len(lv.children) == 3
+            await app.screen.dismiss((7, 'alice'))
+            await pilot.pause()
+            await app.workers.wait_for_complete()
+            await pilot.pause()
+
+            by_id = {s['id']: s for s in app._all_series}
+            assert by_id[1].get('delegate', '') == ''
+            assert by_id[2]['delegate'] == 'alice'
+            assert fake.patched == [
+                'https://pw/api/patches/20/',
+                'https://pw/api/patches/21/',
+            ]
+            assert fake.payloads == [{'delegate': 7}, {'delegate': 7}]
+            # Delegates now differ, so the delegate column shows up.
+            assert all(it.show_delegate for it in app._visible_items())
+            # The cursor stays on the row that was changed.
+            assert app.query_one('#pw-list', ListView).index == 1
+
+            # The maintainers are fetched once and reused.
+            await pilot.press('d')
+            await pilot.pause()
+            assert isinstance(app.screen, SetDelegateScreen)
+            assert self.maintainer_calls == 1
+
+    @pytest.mark.asyncio
+    async def test_bulk_delegate_confirms(
+        self, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        fake = self._install(monkeypatch, [_mk_series(1), _mk_series(2), _mk_series(3)])
+        app = PwApp('k', 'https://pw.example.org', 'proj')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await app.workers.wait_for_complete()
+            await pilot.pause()
+            app.action_toggle_mark()
+            app.action_toggle_mark()
+            await pilot.pause()
+            assert app._selected_ids == {1, 2}
+            app.action_set_delegate()
+            await app.workers.wait_for_complete()
+            await pilot.pause()
+            await app.screen.dismiss((9, 'bob'))
+            await pilot.pause()
+            assert isinstance(app.screen, ConfirmScreen)
+            assert (
+                static_text(app.screen.query_one('#confirm-title'))
+                == 'Delegating 2 series to "bob"'
+            )
+            assert fake.patched == []
+            await pilot.press('y')
+            await pilot.pause()
+            await app.workers.wait_for_complete()
+            await pilot.pause()
+
+            by_id = {s['id']: s for s in app._all_series}
+            assert by_id[1]['delegate'] == 'bob'
+            assert by_id[2]['delegate'] == 'bob'
+            assert by_id[3].get('delegate', '') == ''
+            assert len(fake.patched) == 4
+            assert app._selected_ids == set()
+
+    @pytest.mark.asyncio
+    async def test_clear_delegate(self, monkeypatch: pytest.MonkeyPatch) -> None:
+        series = _mk_series(1)
+        series['delegate'] = 'alice'
+        fake = self._install(monkeypatch, [series])
+        app = PwApp('k', 'https://pw.example.org', 'proj')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await app.workers.wait_for_complete()
+            await pilot.pause()
+            app.action_set_delegate()
+            await app.workers.wait_for_complete()
+            await pilot.pause()
+            screen = app.screen
+            assert isinstance(screen, SetDelegateScreen)
+            # The current delegate is pre-selected.
+            lv = screen.query_one('#delegate-list', ListView)
+            assert lv.index == 1
+            lv.index = 0
+            await pilot.press('enter')
+            await pilot.pause()
+            await app.workers.wait_for_complete()
+            await pilot.pause()
+
+            assert app._all_series[0]['delegate'] == ''
+            assert fake.payloads == [{'delegate': ''}, {'delegate': ''}]
+
+    @pytest.mark.asyncio
+    async def test_maintainer_fetch_error(
+        self, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        self._install(monkeypatch, [_mk_series(1)])
+
+        def _boom(*a: Any, **k: Any) -> List[Dict[str, Any]]:
+            raise RuntimeError('Patchwork API error: 404 Not Found')
+
+        monkeypatch.setattr(b4.review, 'pw_fetch_maintainers', _boom)
+        app = PwApp('k', 'https://pw.example.org', 'proj')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await app.workers.wait_for_complete()
+            await pilot.pause()
+            app.action_set_delegate()
+            with pytest.raises(WorkerFailed):
+                await app.workers.wait_for_complete()
+            await pilot.pause()
+            assert not isinstance(app.screen, SetDelegateScreen)
+            # A later press tries the fetch again.
+            assert app._maintainers is None
+
+
 class TestPwFetchMaintainers:
     """pw_fetch_maintainers reads the project's maintainers list."""
 

-- 
2.55.0

