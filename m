Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3275530E0F2
	for <tools@linux.kernel.org>; Fri,  7 Aug 2026 18:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786126117; cv=none; b=FNaxX2c9/ZVbj3n5H8nnuaEI1yNrzutfsewNN3Bb3rQNGIkF1Wl5DXWvNiGnwMp0IQzKsfBIuu4gFwtkpRFc9NZL0/+pAFMXsl9fgVYHKjPf97q9wc6gUdoMa/rNqVSyFf5cP0xBYEWGyXgIvPCF1PeS7NLsopWaRA+DXyG83n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786126117; c=relaxed/simple;
	bh=baGkcqwq5gsyWY9YpHxNp/9WErsLwMEZFZSf4165c0w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rUeVFlCbLPJLEd640UyIUNmENPPx6lcIW6c/1LnZvISRR7IQKcnzbledx1svXwXqeu2K6lRKEj3pIpCs0bqr1tWdBpFPU38ffonfB0i2hCzYpVj5bOzEE7vqUfg5lZWPslP8FWi7X3/4X8p8esR8V8Bz9fJBvb72krIn1IdWEJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pz5XRyOb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pz5XRyOb"
Received: by smtp.kernel.org (Postfix)
	id E121D1F00A3A; Fri,  7 Aug 2026 18:08:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C962D1F000E9;
	Fri,  7 Aug 2026 18:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786126112;
	bh=h36kjrzVKq2uFAm8ejakfXzDO+jOqR91WBmMaTpJBRI=;
	h=From:To:Cc:Subject:Date;
	b=Pz5XRyObvo3zeaVUwhSm908eUEq7MRboPJDpUW+/BkMQpQbmlk9h4YTgeV9uqq+K7
	 GFrkmSMQ962QW01OoRQkq2JM0bDA2vjYiHFw7HlDOs15hkrek9+FItcwDYcxstdERp
	 hsg/ZXkNHiKRgYHItN4aO4wktz0mnLX5HAmWqRJhJZgZgSHgkL3zgqSYJ5CKF5TDo6
	 ATuf7v6R1OmebdTQqXgrtjjEWruhYvmamrcbojAoJfR8l/wezJy3xyENSO/3WAEfx/
	 k6qVw8NbX7MH5WIe2mtCRAipdEH1OnEMyXbG3JBfVd2wR04EJEM+mMMMqEFbvNK77E
	 Npp+pf56Qk7fA==
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] review-tui: Provide progress indications when upgrading a series
Date: Fri,  7 Aug 2026 19:02:09 +0100
Message-ID: <20260807180213.599509-1-broonie@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Upgrading a series, especially a large series, can sometimes be a slow
operation. It can take a while to figure out the base commit to use, and
network operations can be slow. At the moment we just have a "Fetching new
revision" interstitial which can be displayed for many tens of seconds with
no indication as to what it's actually doing.

Add progress messages to the interstitial indicating what is currently
happening, helping reassure users that progress is being made and providing
hints about the source of any problems that are seen.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 src/b4/__init__.py                 | 29 +++++++---
 src/b4/review/_review.py           | 19 ++++--
 src/b4/review_tui/_modals.py       | 16 +++++-
 src/b4/review_tui/_tracking_app.py | 29 +++++++++-
 src/tests/test_rethread.py         | 35 ++++++++++++
 src/tests/test_review_tracking.py  | 48 +++++++++++++++-
 src/tests/test_tui_modals.py       | 17 ++++++
 src/tests/test_tui_tracking.py     | 92 ++++++++++++++++++++++++++++++
 8 files changed, 266 insertions(+), 19 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index a52b001..f34638a 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -37,6 +37,7 @@ from pathlib import Path
 from typing import (
     Any,
     BinaryIO,
+    Callable,
     Dict,
     Generator,
     Iterator,
@@ -5533,28 +5534,38 @@ def discover_rethread_series(msgid: str, nocache: bool = False) -> List[str]:
 
 
 def fetch_rethread_messages(
-    msgids: List[str], nocache: bool = False
+    msgids: List[str],
+    nocache: bool = False,
+    progress_cb: Optional[Callable[[int, int], None]] = None,
 ) -> Tuple[List[str], List[EmailMessage]]:
     """Fetch messages for multiple msgids, deduplicating across threads.
 
     Returns (msgids, all_msgs) where msgids is the input list (for
     pipeline use) and all_msgs contains all fetched messages with
-    duplicates removed.
+    duplicates removed.  *progress_cb*, when provided, is called as
+    ``progress_cb(completed, total)`` before the first request and after
+    every message-id has been attempted.
     """
     all_msgs: List[EmailMessage] = []
     seen: Set[str] = set()
+    total = len(msgids)
 
-    for msgid in msgids:
+    if progress_cb is not None:
+        progress_cb(0, total)
+
+    for completed, msgid in enumerate(msgids, 1):
         logger.info('Retrieving series: %s', msgid)
         thread_msgs = get_pi_thread_by_msgid(msgid, nocache=nocache)
         if not thread_msgs:
             logger.warning('Could not retrieve %s, skipping', msgid)
-            continue
-        for msg in thread_msgs:
-            c_msgid = LoreMessage.get_clean_msgid(msg)
-            if c_msgid and c_msgid not in seen:
-                all_msgs.append(msg)
-                seen.add(c_msgid)
+        else:
+            for msg in thread_msgs:
+                c_msgid = LoreMessage.get_clean_msgid(msg)
+                if c_msgid and c_msgid not in seen:
+                    all_msgs.append(msg)
+                    seen.add(c_msgid)
+        if progress_cb is not None:
+            progress_cb(completed, total)
 
     if not all_msgs:
         raise LookupError('Could not retrieve any of the specified messages')
diff --git a/src/b4/review/_review.py b/src/b4/review/_review.py
index 5fa4d2a..7fe746b 100644
--- a/src/b4/review/_review.py
+++ b/src/b4/review/_review.py
@@ -184,13 +184,17 @@ def _retrieve_messages(message_id: str) -> List[email.message.EmailMessage]:
 
 
 def retrieve_series_messages(
-    series: Dict[str, Any], identifier: str
+    series: Dict[str, Any],
+    identifier: str,
+    progress_cb: Optional[Callable[[int, int], None]] = None,
 ) -> List[email.message.EmailMessage]:
     """Fetch messages for a tracked series, using stored patch info when available.
 
     For rethreaded series, reads the series_patches table to fetch each
     patch individually and runs the rethread pipeline. For normal series,
-    falls back to the standard single-msgid retrieval.
+    falls back to the standard single-msgid retrieval.  *progress_cb*, when
+    provided, reports completed and total thread fetches; the normal path is
+    a single request, while rethreaded series can report each patch thread.
     """
     change_id = series.get('change_id', '')
     revision = series.get('revision')
@@ -205,7 +209,9 @@ def retrieve_series_messages(
         if patches:
             msgids = [p['message_id'] for p in patches if p['position'] > 0]
             if len(msgids) >= 2:
-                _msgids, all_msgs = b4.fetch_rethread_messages(msgids, nocache=True)
+                _msgids, all_msgs = b4.fetch_rethread_messages(
+                    msgids, nocache=True, progress_cb=progress_cb
+                )
                 _cover_msgid, msgs = b4.LoreSeries.rethread_series(msgids, all_msgs)
                 if not msgs:
                     raise LookupError(
@@ -215,7 +221,12 @@ def retrieve_series_messages(
 
     if not message_id:
         raise LookupError('No message-id for this series')
-    return _retrieve_messages(message_id)
+    if progress_cb is not None:
+        progress_cb(0, 1)
+    msgs = _retrieve_messages(message_id)
+    if progress_cb is not None:
+        progress_cb(1, 1)
+    return msgs
 
 
 def _get_lore_series(
diff --git a/src/b4/review_tui/_modals.py b/src/b4/review_tui/_modals.py
index 4acfd0d..fb3f229 100644
--- a/src/b4/review_tui/_modals.py
+++ b/src/b4/review_tui/_modals.py
@@ -1575,7 +1575,8 @@ class WorkerScreen(ModalScreen[Any]):
     """Generic modal that runs a callable in a worker thread.
 
     Shows a loading indicator while the callable runs.  Dismisses with
-    the return value on success or None on error/cancel.
+    the return value on success or None on error/cancel.  Pass *status* to
+    add a progress line that callers can refresh with :meth:`update_status`.
 
     Usage::
 
@@ -1609,18 +1610,29 @@ class WorkerScreen(ModalScreen[Any]):
         text-style: bold;
         margin-bottom: 1;
     }
+    #ws-status {
+        margin-bottom: 1;
+    }
     """
 
-    def __init__(self, title: str, fn: Any) -> None:
+    def __init__(self, title: str, fn: Any, status: str = '') -> None:
         super().__init__()
         self._title = title
         self._fn = fn
+        self._status = status
 
     def compose(self) -> ComposeResult:
         with Vertical(id='ws-dialog'):
             yield Static(self._title, id='ws-title', markup=False)
+            if self._status:
+                yield Static(self._status, id='ws-status', markup=False)
             yield LoadingIndicator()
 
+    def update_status(self, text: str) -> None:
+        """Update the optional progress text from the UI thread."""
+        if self.is_attached:
+            self.query_one('#ws-status', Static).update(text)
+
     def on_mount(self) -> None:
         # run_lore_worker() sheds any stale cancel flag before the fetch and
         # runs with exit_on_error=False, so a fetch failure surfaces through
diff --git a/src/b4/review_tui/_tracking_app.py b/src/b4/review_tui/_tracking_app.py
index 5b7a756..b02fb5a 100644
--- a/src/b4/review_tui/_tracking_app.py
+++ b/src/b4/review_tui/_tracking_app.py
@@ -4069,6 +4069,17 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
             return
 
         # Phase 1: fetch series and compute base in a worker thread
+        worker_screen: WorkerScreen
+
+        def _set_fetch_status(status: str) -> None:
+            self.call_from_thread(worker_screen.update_status, status)
+
+        def _fetch_progress(completed: int, total: int) -> None:
+            if total > 1:
+                _set_fetch_status(
+                    f'Fetching patch threads {completed}/{total}\N{HORIZONTAL ELLIPSIS}'
+                )
+
         def _fetch_update() -> Tuple[b4.LoreSeries, bytes, str, str, int]:
             with _quiet_worker():
                 target_series = dict(self._selected_series or {})
@@ -4076,10 +4087,18 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
                 target_series['revision'] = target_rev
                 target_series['is_rethreaded'] = target_is_rethreaded
                 msgs = b4.review.retrieve_series_messages(
-                    target_series, self._identifier
+                    target_series,
+                    self._identifier,
+                    progress_cb=_fetch_progress,
                 )
                 lser = b4.review._get_lore_series(msgs)
 
+                patch_count = sum(patch is not None for patch in lser.patches[1:])
+                patch_label = 'patch' if patch_count == 1 else 'patches'
+                _set_fetch_status(
+                    f'Preparing {patch_count} {patch_label}\N{HORIZONTAL ELLIPSIS}'
+                )
+
                 am_msgs = lser.get_am_ready(
                     noaddtrailers=True,
                     addmysob=False,
@@ -4097,13 +4116,19 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
                 ambytes = ifh.getvalue()
 
                 # Determine best base: configured, series-specified or guessed
+                _set_fetch_status('Finding base commit\N{HORIZONTAL ELLIPSIS}')
                 topdir = b4.git_get_toplevel()
                 initial_base, base_hint = _detect_initial_base(lser, topdir)
 
                 return lser, ambytes, initial_base, base_hint, len(am_msgs)
 
+        worker_screen = WorkerScreen(
+            'Fetching new revision\u2026',
+            _fetch_update,
+            status=f'Fetching v{target_rev} from lore\u2026',
+        )
         self.push_screen(
-            WorkerScreen('Fetching new revision\u2026', _fetch_update),
+            worker_screen,
             callback=lambda result: self._on_update_prepared(
                 result,
                 change_id,
diff --git a/src/tests/test_rethread.py b/src/tests/test_rethread.py
index 8c9888a..2e44fe2 100644
--- a/src/tests/test_rethread.py
+++ b/src/tests/test_rethread.py
@@ -570,6 +570,41 @@ class TestDiscoverRethreadSeries:
         assert result == ['p1@x']
 
 
+# ===========================================================================
+# fetch_rethread_messages progress tests
+# ===========================================================================
+class TestFetchRethreadMessagesProgress:
+    def test_reports_every_attempted_thread(self) -> None:
+        """Progress includes the initial state and failed thread fetches."""
+        p1 = _make_msg('p1@x', '[PATCH 1/2] First fix')
+        p3 = _make_msg('p3@x', '[PATCH 2/2] Second fix')
+        threads = {
+            'p1@x': [p1],
+            'missing@x': [],
+            'p3@x': [p3],
+        }
+        progress: List[Tuple[int, int]] = []
+
+        with mock.patch(
+            'b4.get_pi_thread_by_msgid',
+            side_effect=lambda msgid, **_kwargs: threads[msgid],
+        ):
+            returned_ids, msgs = b4.fetch_rethread_messages(
+                list(threads),
+                nocache=True,
+                progress_cb=lambda completed, total: progress.append(
+                    (completed, total)
+                ),
+            )
+
+        assert returned_ids == ['p1@x', 'missing@x', 'p3@x']
+        assert [b4.LoreMessage.get_clean_msgid(msg) for msg in msgs] == [
+            'p1@x',
+            'p3@x',
+        ]
+        assert progress == [(0, 3), (1, 3), (2, 3), (3, 3)]
+
+
 # ===========================================================================
 # Prefer a properly-threaded resend over stitched patches
 # (feature/rethread-upgrade-compose)
diff --git a/src/tests/test_review_tracking.py b/src/tests/test_review_tracking.py
index 64778be..79fc2cc 100644
--- a/src/tests/test_review_tracking.py
+++ b/src/tests/test_review_tracking.py
@@ -4124,18 +4124,62 @@ class TestRetrieveSeriesMessagesRethreadSeam:
         }
 
         reassembled = [mock.Mock(), mock.Mock(), mock.Mock()]
+        forwarded_callback: list[Any] = []
+
+        def _fetch_rethread_messages(
+            msgids: list[str], nocache: bool = False, progress_cb: Any = None
+        ) -> tuple[list[str], list[Any]]:
+            assert nocache is True
+            forwarded_callback.append(progress_cb)
+            return msgids, reassembled
+
+        progress_cb = mock.Mock()
         with (
             mock.patch(
                 'b4.fetch_rethread_messages',
-                return_value=(['p1@q', 'p2@q', 'p3@q'], reassembled),
+                side_effect=_fetch_rethread_messages,
             ),
             mock.patch(
                 'b4.LoreSeries.rethread_series',
                 return_value=('p1@q', reassembled),
             ),
         ):
-            out = b4.review.retrieve_series_messages(series, 'rt-up-seam')
+            out = b4.review.retrieve_series_messages(
+                series, 'rt-up-seam', progress_cb=progress_cb
+            )
         assert out == reassembled
+        assert forwarded_callback == [progress_cb]
+
+    def test_normal_fetch_reports_single_step_progress(self) -> None:
+        """A normal single-thread fetch reports its start and completion."""
+        series = {
+            'change_id': 'cid',
+            'revision': 6,
+            'message_id': 'v6-root@example.com',
+            'is_rethreaded': False,
+        }
+        msgs = [mock.Mock()]
+        events: list[Any] = []
+
+        def _retrieve(message_id: str) -> list[Any]:
+            events.append(('fetch', message_id))
+            return msgs
+
+        with mock.patch('b4.review._review._retrieve_messages', side_effect=_retrieve):
+            out = b4.review.retrieve_series_messages(
+                series,
+                'rt-up-seam-normal',
+                progress_cb=lambda completed, total: events.append(
+                    ('progress', completed, total)
+                ),
+            )
+
+        assert out == msgs
+        assert events == [
+            ('progress', 0, 1),
+            ('fetch', 'v6-root@example.com'),
+            ('progress', 1, 1),
+        ]
 
 
 class TestRethreadFlagCarriedOnLink:
diff --git a/src/tests/test_tui_modals.py b/src/tests/test_tui_modals.py
index 5a19cdd..e66d43e 100644
--- a/src/tests/test_tui_modals.py
+++ b/src/tests/test_tui_modals.py
@@ -1262,6 +1262,23 @@ class TestWorkerScreen:
     (msgid 21fe13c1-5c9a-4a47-b97b-251da4748aea@sirena.org.uk).
     """
 
+    @pytest.mark.asyncio
+    async def test_status_line_can_be_updated(self) -> None:
+        """The optional status line is visible and can be refreshed."""
+        app = ModalTestApp()
+        screen = WorkerScreen('Working…', lambda: 'done', status='Fetching 0/2…')
+        with mock.patch('b4.review_tui._modals.run_lore_worker'):
+            async with app.run_test() as pilot:
+                app.push_screen(screen)
+                await pilot.pause()
+
+                status = screen.query_one('#ws-status', Static)
+                assert _static_text(status) == 'Fetching 0/2…'
+
+                screen.update_status('Fetching 1/2…')
+                await pilot.pause()
+                assert _static_text(status) == 'Fetching 1/2…'
+
     @pytest.mark.asyncio
     async def test_on_mount_resets_cancel_flag(self) -> None:
         """A fetch must clear any stale cancel flag before it runs."""
diff --git a/src/tests/test_tui_tracking.py b/src/tests/test_tui_tracking.py
index 5ee2a24..e2cd31d 100644
--- a/src/tests/test_tui_tracking.py
+++ b/src/tests/test_tui_tracking.py
@@ -3806,6 +3806,98 @@ class TestUpdateRevisionWorkflow:
                 ).WorkerScreen,
             )
 
+    def test_fetch_worker_reports_progress(self, tmp_path: pathlib.Path) -> None:
+        """Fetching an upgrade should describe each potentially slow step."""
+        identifier = 'test-update-progress'
+        change_id = 'update-progress-1'
+        _seed_db(
+            identifier,
+            [
+                {
+                    'change_id': change_id,
+                    'subject': '[PATCH v1] progress test',
+                    'status': 'reviewing',
+                    'message_id': 'v1@ex.com',
+                }
+            ],
+        )
+        conn = tracking.get_db(identifier)
+        tracking.add_revision(
+            conn,
+            change_id,
+            2,
+            'v2@ex.com',
+            subject='[PATCH v2] progress test',
+            is_rethreaded=True,
+        )
+        conn.close()
+
+        captured: Dict[str, Any] = {}
+        statuses: List[str] = []
+
+        def _retrieve(
+            series: Dict[str, Any],
+            project: str,
+            progress_cb: Optional[Callable[[int, int], None]] = None,
+        ) -> List[email.message.EmailMessage]:
+            captured['series'] = series
+            captured['project'] = project
+            captured['progress_cb'] = progress_cb
+            assert progress_cb is not None
+            progress_cb(0, 3)
+            progress_cb(1, 3)
+            progress_cb(3, 3)
+            return [email.message.EmailMessage()]
+
+        lser = _make_mock_lser(expected=3)
+        mock_patch = lser.patches[0]
+        assert mock_patch is not None
+        lser.patches = [None, mock_patch, mock_patch, mock_patch]
+        am_msgs = [email.message.EmailMessage() for _ in range(3)]
+
+        app = TrackingApp(identifier)
+        with (
+            patch.object(app, 'push_screen') as push_screen,
+            patch.object(
+                app,
+                'call_from_thread',
+                side_effect=lambda _update, status: statuses.append(status),
+            ),
+            patch(
+                'b4.review.retrieve_series_messages',
+                side_effect=_retrieve,
+            ),
+            patch('b4.review._get_lore_series', return_value=lser),
+            patch.object(lser, 'get_am_ready', return_value=am_msgs),
+            patch(
+                'b4.save_git_am_mbox',
+                side_effect=lambda _msgs, dest: dest.write(b'mbox'),
+            ),
+            patch('b4.git_get_toplevel', return_value='/repo'),
+            patch(
+                'b4.review_tui._tracking_app._detect_initial_base',
+                return_value=('base-sha', 'base hint'),
+            ),
+        ):
+            app._do_update_revision(change_id, 1, 2)
+            worker_screen = push_screen.call_args.args[0]
+
+            assert worker_screen._status == 'Fetching v2 from lore…'
+            result = worker_screen._fn()
+
+        assert captured['project'] == identifier
+        assert captured['series']['revision'] == 2
+        assert captured['series']['is_rethreaded'] is True
+        assert callable(captured['progress_cb'])
+        assert statuses == [
+            'Fetching patch threads 0/3…',
+            'Fetching patch threads 1/3…',
+            'Fetching patch threads 3/3…',
+            'Preparing 3 patches…',
+            'Finding base commit…',
+        ]
+        assert result[-1] == 3
+
     # --- Phase 2: _on_update_prepared (base selection screen) ------------
 
     @pytest.mark.asyncio
-- 
2.47.3

