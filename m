Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70772395D86
	for <tools@linux.kernel.org>; Fri, 17 Jul 2026 22:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784327918; cv=none; b=EV8Pu5/n72sGyKiZgJXeFdn/ViQa1TU/dTZlv6K69pOVCztQjPyOGzucYFEpm1fKXw0kYLE0/0kN+CiTMK/x1pqjJlL2nshoViyXzB4sTmOj0/x+lxX2Sv8hYuvKesZYfauCmyhud1J22XZVobfumeiwH00BGXDaHfZsqCeeC6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784327918; c=relaxed/simple;
	bh=xxvfndwoOR69+qF8vHXUZzrVG9KiE31+e2s/Mmdh8aM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C1rR63YTiZjovshMOstlN78SWzKWHsYiHn6gfGqyQksYYpT8kmdVPnC5Spu9T7fwClqhyE7LQ3VU8qqLD82n1zt6XVk9BP7R4hlcqDrnQRb1X+RNJIrhjNpNFzjlR+uGO4xNXXIjDc+VvROEoBuE82iRoRhqp+VCYLhJW7OjHro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iT4E7Xul; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iT4E7Xul"
Received: by smtp.kernel.org (Postfix)
	id 6CA0F1F00A3A; Fri, 17 Jul 2026 22:38:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A1271F000E9;
	Fri, 17 Jul 2026 22:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784327916;
	bh=4It39Hp9NerYG5AQEPHxkHZCA100BEEDF7ml+mdr+NU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=iT4E7XultXoo0DzWcKsqY1Lo/BfDNb2J32pKXjbkFNULJpjXYIS6H9ojUUEydDzFa
	 6c886qI3rdLi6kX5P2ngY5T2/O12UCYATZ18JRxvq17m6OkyOqD6wMfJo2Tr/bK2/j
	 vUQ9jubE9IeyVPK17bWghyBt7v4L9zseOIP6kEKrlb4B4vcLQ//2tXVODk5qNDY+iK
	 s+m+EcLZPm6WYCU7tqO5uaMYnhraYiZWLGYyFEAqKbOpi8a8RiuikF7CQ7HMAy1zRl
	 SOI/KJK5pfN6EwU1SQ8gGtBl1RQLMbMdVF4uLlJ+UVJz36erZ/B5koqwI1jjBRmD5k
	 bGrYdubumotcw==
From: Christian Brauner <brauner@kernel.org>
Date: Sat, 18 Jul 2026 00:37:47 +0200
Subject: [PATCH RFC 11/11] review-tui: test per-version tracker rows
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260718-work-b4-multiver-rows-v1-11-3c539d2a3095@kernel.org>
References: <20260718-work-b4-multiver-rows-v1-0-3c539d2a3095@kernel.org>
In-Reply-To: <20260718-work-b4-multiver-rows-v1-0-3c539d2a3095@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-4217c
X-Developer-Signature: v=1; a=openpgp-sha256; l=23359; i=brauner@kernel.org;
 h=from:subject:message-id; bh=xxvfndwoOR69+qF8vHXUZzrVG9KiE31+e2s/Mmdh8aM=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWRFrbt5aaH+fYWZM/6ctkzT5L/s/6bU4F2C6evZqgsTx
 IKaRP8+7ChlYRDjYpAVU2RxaDcJl1vOU7HZKFMDZg4rE8gQBi5OAZgIdxXD/8A/i4um+yw54L/s
 lWHNDK93YtvnrrBsu1Nm5WrbUv2N6R4jw36Ty+5FZTLi5zXXqW6690ot4f1b75S6Tb5Hjrrrn9v
 IxwMA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Cover the expansion affordance and toggling, tracked-revision
marking, child-row selection state, survival of expansion and cursor
position across DB reloads and limit filtering, child-row thread
opening with the right revision, direct child range-diff, expand-all,
details-panel version row, and NULL-count rendering.

Assisted-by: LLM
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/tests/test_tui_tracking.py | 534 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 533 insertions(+), 1 deletion(-)

diff --git a/src/tests/test_tui_tracking.py b/src/tests/test_tui_tracking.py
index e9d646e..0d4be62 100644
--- a/src/tests/test_tui_tracking.py
+++ b/src/tests/test_tui_tracking.py
@@ -11,6 +11,7 @@ core user workflows: series listing, navigation, filtering,
 status transitions, and modal interactions.
 """
 
+import contextlib
 import datetime
 import email.message
 import os
@@ -19,7 +20,7 @@ from typing import Any, Dict, List, Optional, Tuple
 from unittest.mock import patch
 
 import pytest
-from textual.widgets import Input, ListView, Static
+from textual.widgets import Input, Label, ListView, Static
 
 import b4
 import b4.review
@@ -30,6 +31,7 @@ from b4 import (
     _worktree_inprogress_op,
     _worktree_merge_in_progress,
 )
+from b4.review_tui._lite_app import LiteThreadScreen
 from b4.review_tui._modals import (
     ActionItem,
     ActionScreen,
@@ -38,10 +40,12 @@ from b4.review_tui._modals import (
     HelpScreen,
     LimitScreen,
     LinkRevisionScreen,
+    RangeDiffScreen,
     SnoozeScreen,
     TargetBranchScreen,
 )
 from b4.review_tui._tracking_app import (
+    TrackedRevisionItem,
     TrackedSeriesItem,
     TrackingApp,
     _resolve_worktree_take_conflict,
@@ -1544,6 +1548,534 @@ class TestTrackingDetailPanel:
             assert 'alpha' in app._selected_series.get('subject', '')
 
 
+# ---------------------------------------------------------------------------
+# Per-version child rows
+# ---------------------------------------------------------------------------
+
+
+def _seed_multiver(
+    identifier: str,
+    change_id: str = 'multi-1',
+    tracked: int = 2,
+    revisions: Optional[List[int]] = None,
+) -> None:
+    """Seed a series tracking v*tracked* with *revisions* in the catalog.
+
+    The tracked revision has message counts (5 total, 2 unseen); the
+    other revisions were never fetched, so their counts stay NULL.
+    """
+    conn = tracking.init_db(identifier)
+    tracking.add_series_to_db(
+        conn,
+        change_id=change_id,
+        revision=tracked,
+        subject=f'[PATCH v{tracked} 0/2] multi: test series',
+        sender_name='Vera Version',
+        sender_email='vera@example.com',
+        sent_at='2026-03-10T10:00:00+00:00',
+        message_id=f'{change_id}-v{tracked}@example.com',
+        num_patches=2,
+    )
+    conn.execute(
+        'UPDATE series SET message_count = 5, seen_message_count = 3'
+        ' WHERE change_id = ? AND revision = ?',
+        (change_id, tracked),
+    )
+    conn.commit()
+    for rev in [1, 2, 3] if revisions is None else revisions:
+        tracking.add_revision(
+            conn,
+            change_id,
+            rev,
+            f'{change_id}-v{rev}@example.com',
+            subject=f'[PATCH v{rev} 0/2] multi: test series',
+        )
+    conn.close()
+
+
+def _list_items(app: TrackingApp) -> List[Any]:
+    """Every row currently in the tracking list, parents and children."""
+    return list(app.query_one('#tracking-list', ListView).children)
+
+
+def _row_text(item: Any) -> str:
+    """The rendered text of a single tracking list row."""
+    return _static_text(item.query_one(Label))
+
+
+def _msgs_column(text: str) -> str:
+    """The Msgs column of a rendered row (total + unseen badge).
+
+    Fixed offset: 20 (submitter) + 1 (attestation) + 1 + 7 (A·R·T) = 29,
+    then 5 for the total and 3 for the badge.  Slicing it asserts that
+    parent and child rows agree on the column layout.
+    """
+    return text[29:37].strip()
+
+
+class TestVersionExpansion:
+    """Tests for expanding a series into per-version child rows."""
+
+    @pytest.mark.asyncio
+    async def test_affordance_only_with_multiple_versions(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        """Only a series with more than one known version gets the marker."""
+        _seed_multiver('expand-affordance')
+        conn = tracking.get_db('expand-affordance')
+        tracking.add_series_to_db(
+            conn,
+            change_id='single-1',
+            revision=1,
+            subject='[PATCH] single: just one version',
+            sender_name='Sam Single',
+            sender_email='sam@example.com',
+            sent_at='2026-03-11T10:00:00+00:00',
+            message_id='single-v1@example.com',
+            num_patches=1,
+        )
+        tracking.add_revision(conn, 'single-1', 1, 'single-v1@example.com')
+        conn.close()
+
+        app = TrackingApp('expand-affordance')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            rows = {i.series['change_id']: _row_text(i) for i in _list_items(app)}
+            assert '▸' in rows['multi-1']
+            assert '▸' not in rows['single-1']
+
+    @pytest.mark.asyncio
+    async def test_x_expands_into_child_rows(self, tmp_path: pathlib.Path) -> None:
+        """x adds one child row per known version, oldest first."""
+        _seed_multiver('expand-toggle')
+
+        app = TrackingApp('expand-toggle')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            assert len(_list_items(app)) == 1
+
+            await pilot.press('x')
+            await pilot.pause()
+            items = _list_items(app)
+            assert len(items) == 4
+            assert isinstance(items[0], TrackedSeriesItem)
+            assert items[0].expanded
+            assert '▾' in _row_text(items[0])
+            children = items[1:]
+            assert all(isinstance(c, TrackedRevisionItem) for c in children)
+            assert [c.rev['revision'] for c in children] == [1, 2, 3]
+
+    @pytest.mark.asyncio
+    async def test_x_collapses_again(self, tmp_path: pathlib.Path) -> None:
+        """A second x hides the child rows and restores the parent cursor."""
+        _seed_multiver('expand-collapse')
+
+        app = TrackingApp('expand-collapse')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            await pilot.press('x')
+            await pilot.pause()
+            # Collapse from a child row — focus must return to the parent
+            await pilot.press('j')
+            await pilot.pause()
+            assert app._selected_revision is not None
+
+            await pilot.press('x')
+            await pilot.pause()
+            items = _list_items(app)
+            assert len(items) == 1
+            assert '▸' in _row_text(items[0])
+            assert app._selected_revision is None
+            assert app.query_one('#tracking-list', ListView).index == 0
+
+    @pytest.mark.asyncio
+    async def test_tracked_version_is_marked(self, tmp_path: pathlib.Path) -> None:
+        """The child row for the tracked revision carries an asterisk."""
+        _seed_multiver('expand-marker')
+
+        app = TrackingApp('expand-marker')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            await pilot.press('x')
+            await pilot.pause()
+            children = _list_items(app)[1:]
+            marked = [c for c in children if c.is_tracked]
+            assert len(marked) == 1
+            assert marked[0].rev['revision'] == 2
+            assert 'v2*' in _row_text(marked[0])
+            assert 'v1*' not in _row_text(children[0])
+            assert 'v3*' not in _row_text(children[2])
+
+    @pytest.mark.asyncio
+    async def test_highlighting_child_keeps_parent_series(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        """A child row selects its version, but the series stays the parent."""
+        _seed_multiver('expand-select')
+
+        app = TrackingApp('expand-select')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            await pilot.press('x')
+            await pilot.pause()
+
+            await pilot.press('j')
+            await pilot.pause()
+            assert app._selected_revision is not None
+            assert app._selected_revision['revision'] == 1
+            assert app._selected_series is not None
+            assert app._selected_series['change_id'] == 'multi-1'
+
+            # Back on the parent row the version selection is cleared
+            await pilot.press('k')
+            await pilot.pause()
+            assert app._selected_revision is None
+            assert app._selected_series is not None
+            assert app._selected_series['change_id'] == 'multi-1'
+
+    @pytest.mark.asyncio
+    async def test_expansion_and_cursor_survive_db_reload(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        """An external DB change rebuilds the list without losing the child."""
+        _seed_multiver('expand-reload')
+
+        app = TrackingApp('expand-reload')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            await pilot.press('x')
+            await pilot.pause()
+            await pilot.press('j')
+            await pilot.press('j')
+            await pilot.pause()
+            assert app._selected_revision is not None
+            assert app._selected_revision['revision'] == 2
+
+            # Bump the mtime the way another b4 process writing the DB would
+            db_path = tracking.get_db_path('expand-reload')
+            stamp = os.path.getmtime(db_path) + 10
+            os.utime(db_path, (stamp, stamp))
+            app._check_db_changed()
+            await pilot.pause()
+
+            items = _list_items(app)
+            assert len(items) == 4
+            assert isinstance(items[2], TrackedRevisionItem)
+            assert app.query_one('#tracking-list', ListView).index == 2
+            assert app._selected_revision is not None
+            assert app._selected_revision['revision'] == 2
+
+    @pytest.mark.asyncio
+    async def test_x_is_noop_on_single_version_series(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        """A series with only the tracked version has nothing to expand."""
+        _seed_db('expand-single', [SAMPLE_SERIES[1]])
+
+        app = TrackingApp('expand-single')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            await pilot.press('x')
+            await pilot.pause()
+            assert len(_list_items(app)) == 1
+            assert not app._expanded_change_ids
+
+    @pytest.mark.asyncio
+    async def test_expansion_survives_limit_filter(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        """Setting and clearing a limit keeps the series expanded."""
+        _seed_multiver('expand-limit')
+
+        app = TrackingApp('expand-limit')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            await pilot.press('x')
+            await pilot.pause()
+            assert len(_list_items(app)) == 4
+
+            await pilot.press('l')
+            await pilot.pause()
+            app.screen.query_one('#limit-input', Input).value = 'multi'
+            await pilot.press('enter')
+            await pilot.pause()
+            assert len(_list_items(app)) == 4
+
+            await pilot.press('l')
+            await pilot.pause()
+            app.screen.query_one('#limit-input', Input).value = ''
+            await pilot.press('enter')
+            await pilot.pause()
+            assert len(_list_items(app)) == 4
+
+    @pytest.mark.asyncio
+    async def test_expand_all_toggles_every_series(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        """X expands all multi-version series, then collapses them."""
+        _seed_multiver('expand-all', change_id='multi-a')
+        _seed_multiver('expand-all', change_id='multi-b')
+
+        app = TrackingApp('expand-all')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            assert len(_list_items(app)) == 2
+
+            await pilot.press('X')
+            await pilot.pause()
+            assert len(_list_items(app)) == 8  # 2 parents + 3 versions each
+            assert app._expanded_change_ids == {'multi-a', 'multi-b'}
+
+            await pilot.press('X')
+            await pilot.pause()
+            assert len(_list_items(app)) == 2
+            assert not app._expanded_change_ids
+
+            # A partially expanded list expands the rest before collapsing
+            await pilot.press('x')
+            await pilot.pause()
+            assert len(_list_items(app)) == 5
+            await pilot.press('X')
+            await pilot.pause()
+            assert len(_list_items(app)) == 8
+
+    @pytest.mark.asyncio
+    async def test_child_msgs_column(self, tmp_path: pathlib.Path) -> None:
+        """Child counts render like the parent, with '-' when never fetched."""
+        _seed_multiver('expand-msgs')
+
+        app = TrackingApp('expand-msgs')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            await pilot.press('x')
+            await pilot.pause()
+            items = _list_items(app)
+            # v1 was never fetched, v2 is tracked (5 messages, 2 unseen)
+            assert items[1].rev['message_count'] is None
+            assert _msgs_column(_row_text(items[1])) == '-'
+            assert _msgs_column(_row_text(items[2])) == '5(2)'
+            assert _msgs_column(_row_text(items[0])) == '5(2)'
+
+    @pytest.mark.asyncio
+    async def test_child_rows_show_subjects(self, tmp_path: pathlib.Path) -> None:
+        """Every version row carries its own prefix-stripped title."""
+        _seed_multiver('expand-subject', revisions=[1, 2])
+        conn = tracking.get_db('expand-subject')
+        tracking.add_revision(
+            conn,
+            'multi-1',
+            3,
+            'multi-1-v3@example.com',
+            subject='[PATCH v3 0/2] multi: renamed after review',
+        )
+        conn.close()
+
+        app = TrackingApp('expand-subject')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            await pilot.press('x')
+            await pilot.pause()
+            items = _list_items(app)
+            # Versions keeping the series title still show it -- an empty
+            # subject cell reads as missing data.
+            assert 'multi: test series' in _row_text(items[1])
+            assert 'multi: test series' in _row_text(items[2])
+            # A retitled version shows its own title, prefix-stripped.
+            assert 'multi: renamed after review' in _row_text(items[3])
+            assert '[PATCH v3' not in _row_text(items[3])
+
+    @pytest.mark.asyncio
+    async def test_details_panel_version_row(self, tmp_path: pathlib.Path) -> None:
+        """The Version row describes the highlighted child, and hides for parents."""
+        _seed_multiver('expand-details')
+
+        app = TrackingApp('expand-details')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            row = app.query_one('#detail-version-row')
+            assert not row.display
+
+            await pilot.press('x')
+            await pilot.pause()
+            await pilot.press('j')
+            await pilot.press('j')
+            await pilot.pause()
+            assert row.display
+            text = _static_text(app.query_one('#detail-version', Static))
+            assert text.startswith('v2 (tracked)')
+            assert '5 msgs (2 unseen)' in text
+            assert ', found ' in text
+
+            # A version that was never fetched has no counts to show
+            await pilot.press('k')
+            await pilot.pause()
+            text = _static_text(app.query_one('#detail-version', Static))
+            assert text.startswith('v1')
+            assert '(tracked)' not in text
+            assert '- msgs (- unseen)' in text
+
+            # Back on the parent row the version detail disappears
+            await pilot.press('k')
+            await pilot.pause()
+            assert not row.display
+
+
+class TestChildRowActions:
+    """Tests for actions taken while a version row is highlighted."""
+
+    @pytest.mark.asyncio
+    async def test_e_opens_that_version_thread(self, tmp_path: pathlib.Path) -> None:
+        """e on a child views the child's thread, not the tracked one."""
+        _seed_multiver('child-thread')
+
+        app = TrackingApp('child-thread')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            await pilot.press('x')
+            await pilot.pause()
+            await pilot.press('j')
+            await pilot.pause()
+
+            with patch.object(app, 'push_screen') as mock_push:
+                await pilot.press('e')
+                await pilot.pause()
+
+            assert mock_push.call_count == 1
+            screen = mock_push.call_args[0][0]
+            assert isinstance(screen, LiteThreadScreen)
+            assert screen._message_id == 'multi-1-v1@example.com'
+            assert screen._tracking_info is not None
+            assert screen._tracking_info['change_id'] == 'multi-1'
+            assert screen._tracking_info['revision'] == 1
+
+    @pytest.mark.asyncio
+    async def test_enter_opens_that_version_thread(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        """Enter on a child opens the thread instead of the action menu."""
+        _seed_multiver('child-enter')
+
+        app = TrackingApp('child-enter')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            await pilot.press('x')
+            await pilot.pause()
+            for _ in range(3):
+                await pilot.press('j')
+            await pilot.pause()
+
+            with patch.object(app, 'push_screen') as mock_push:
+                await pilot.press('enter')
+                await pilot.pause()
+
+            assert mock_push.call_count == 1
+            screen = mock_push.call_args[0][0]
+            assert isinstance(screen, LiteThreadScreen)
+            assert screen._message_id == 'multi-1-v3@example.com'
+            assert screen._tracking_info is not None
+            assert screen._tracking_info['revision'] == 3
+
+    @pytest.mark.asyncio
+    async def test_e_on_parent_still_opens_tracked_thread(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        """With no child highlighted, e views the tracked revision's thread."""
+        _seed_multiver('child-parent-thread')
+
+        app = TrackingApp('child-parent-thread')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+
+            with patch.object(app, 'push_screen') as mock_push:
+                await pilot.press('e')
+                await pilot.pause()
+
+            screen = mock_push.call_args[0][0]
+            assert screen._message_id == 'multi-1-v2@example.com'
+            assert screen._tracking_info['revision'] == 2
+
+    @pytest.mark.asyncio
+    async def test_d_range_diffs_child_against_tracked(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        """d on a child diffs it against the tracked revision, no picker."""
+        _seed_multiver('child-rangediff')
+
+        app = TrackingApp('child-rangediff')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            await pilot.press('x')
+            await pilot.pause()
+            for _ in range(3):
+                await pilot.press('j')
+            await pilot.pause()
+            assert app._selected_revision is not None
+            assert app._selected_revision['revision'] == 3
+
+            with (
+                patch.object(app, '_do_range_diff') as mock_diff,
+                patch.object(app, 'suspend', return_value=contextlib.nullcontext()),
+            ):
+                await pilot.press('d')
+                await pilot.pause()
+
+            mock_diff.assert_called_once_with('multi-1', 2, 3)
+            assert not isinstance(app.screen, RangeDiffScreen)
+
+    @pytest.mark.asyncio
+    async def test_d_on_tracked_child_shows_picker(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        """The tracked version has no implied other side — pick one."""
+        _seed_multiver('child-rangediff-self')
+
+        app = TrackingApp('child-rangediff-self')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            await pilot.press('x')
+            await pilot.pause()
+            await pilot.press('j')
+            await pilot.press('j')
+            await pilot.pause()
+            assert app._selected_revision is not None
+            assert app._selected_revision['revision'] == 2
+
+            with patch.object(app, '_do_range_diff') as mock_diff:
+                await pilot.press('d')
+                await pilot.pause()
+                assert isinstance(app.screen, RangeDiffScreen)
+                await pilot.press('escape')
+                await pilot.pause()
+
+            mock_diff.assert_not_called()
+
+    @pytest.mark.asyncio
+    async def test_series_actions_use_parent_from_child_row(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        """The action menu on a child row acts on the parent series."""
+        _seed_multiver('child-action')
+
+        app = TrackingApp('child-action')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            await pilot.press('x')
+            await pilot.pause()
+            await pilot.press('j')
+            await pilot.pause()
+
+            await pilot.press('a')
+            await pilot.pause()
+            assert isinstance(app.screen, ActionScreen)
+            lv = app.screen.query_one('#action-list', ListView)
+            actions = [c.key for c in lv.children if isinstance(c, ActionItem)]
+            assert 'review' in actions
+            await pilot.press('escape')
+            await pilot.pause()
+            assert app._selected_series is not None
+            assert app._selected_series['change_id'] == 'multi-1'
+
+
 class TestTrackingMultipleSeries:
     """Tests for workflows involving multiple series."""
 

-- 
2.53.0

