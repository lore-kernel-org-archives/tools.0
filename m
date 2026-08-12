Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E313EFD24
	for <tools@linux.kernel.org>; Wed, 12 Aug 2026 21:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786571266; cv=none; b=etkLvfRnd9EZ7A7WVfbi8UcFXuX/oR+nMatCMsR02RqyrPL+GKwQ00dH1/7Cs/KVEoLA4SEQcYssbw9LUJCns5E7RuaRiLkTZXBSFtjEA4FcU4MP88BruA+1c6xJ7sBjT4myp0xdiDxW6u6x9eLKaT6CAGSvJk5F7gm2fp+s3As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786571266; c=relaxed/simple;
	bh=T2+aZ9Y/74LFJm24vkXE2JwakN5ojcL5g0BVwIaxd/c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kGnIdND8NxvNzGnpwSVcwstkedSe3nSi50Byo0ZS76r7b64gc4yTg8PWT+Z64Mcmt9PNSJjCOnEcVK+DKGBAAwjvGrqzoMjqaa+nk9xOtFnxcGe1iVVy/mC+mKkZBjihOZ8vjojzBBs+nsJQVmmzUJiaaMsSXxE2QFefzrOCv28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U8Tur6mo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U8Tur6mo"
Received: by smtp.kernel.org (Postfix)
	id 272CA1F00A3D; Wed, 12 Aug 2026 21:47:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 083071F000E9;
	Wed, 12 Aug 2026 21:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786571263;
	bh=BImLEIIOCH9fT231mcyCHxyVlWaikdx0G3VUGnfFpyE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=U8Tur6moeXp16n6YlcaNUXBsaVme9gcPa/HcGPMeDf8wEXpBO/Lpvzc0RWsl59sbY
	 JO+Bci+pMyv5JA+rgythdDie2TFkdY8zcsaHs0e6NAbHU8n54ftPbJsHC6mjAGQR/M
	 58jPZkU2GqwzDsN0sJf7gdpHAx/JsiVAdxeDyR73z6lyyThzjEUn/GYxfrU5Yxb9FS
	 p373dNp7JJju4Ik7OctLK2WD/H44LkqDoUpa3mEI/Kfq8L4xRyg7GGhxB8x/Kbjklp
	 7DwnkipBvfIic2VgIualLXGE9GvslXzMnsl0eRbtyhPyZOGXh5qQ5SXSwdjTDLzgOX
	 pmpLFFJBCJeug==
From: Christian Brauner <brauner@kernel.org>
Date: Wed, 12 Aug 2026 23:47:06 +0200
Subject: [PATCH RFC v2 25/25] review-tui: test per-version tracker rows
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260812-work-b4-multiver-rows-v2-25-305d53cd723a@kernel.org>
References: <20260812-work-b4-multiver-rows-v2-0-305d53cd723a@kernel.org>
In-Reply-To: <20260812-work-b4-multiver-rows-v2-0-305d53cd723a@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.17-dev-362b8
X-Developer-Signature: v=1; a=openpgp-sha256; l=70246; i=brauner@kernel.org;
 h=from:subject:message-id; bh=T2+aZ9Y/74LFJm24vkXE2JwakN5ojcL5g0BVwIaxd/c=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTVvLx9Y+7WXZd3nImduKL/iW5bWxbD6nuJUzN5L7/0e
 cli3nfzXkcpC4MYF4OsmCKLQ7tJuNxynorNRpkaMHNYmUCGMHBxCsBEFOYx/NMs2m2VFJi5LUJk
 bVHmo4Kr/M+fV5fOPvFpz85uTT3RKT8Z/pm3Zzi1V4c8FLYwjN7G+tQufIfjl6OuV/Ktn898vUV
 /PgcA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Cover the expansion affordance and toggling, tracked-revision marking,
child-row selection state, survival of expansion and cursor position
across DB reloads and limit filtering, child-row thread opening with the
right revision, direct child range-diff, expand-all, the details-panel
version row, and NULL-count rendering.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/tests/test_tui_tracking.py | 1629 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 1626 insertions(+), 3 deletions(-)

diff --git a/src/tests/test_tui_tracking.py b/src/tests/test_tui_tracking.py
index 7ba2443e..17cdf41a 100644
--- a/src/tests/test_tui_tracking.py
+++ b/src/tests/test_tui_tracking.py
@@ -11,11 +11,14 @@ core user workflows: series listing, navigation, filtering,
 status transitions, and modal interactions.
 """
 
+import contextlib
 import datetime
 import email.message
 import os
 import pathlib
+import re
 import sqlite3
+import time
 from typing import Any, Callable, Dict, List, Optional, Tuple
 from unittest.mock import patch
 
@@ -23,7 +26,7 @@ import pytest
 
 pytest.importorskip('textual')
 
-from textual.widgets import Input, ListView, Static
+from textual.widgets import Input, Label, ListView, Static
 
 import b4
 import b4.review
@@ -36,6 +39,7 @@ from b4 import (
     _worktree_inprogress_op,
     _worktree_merge_in_progress,
 )
+from b4.review_tui._lite_app import LiteThreadScreen
 from b4.review_tui._modals import (
     ActionItem,
     ActionScreen,
@@ -45,17 +49,21 @@ from b4.review_tui._modals import (
     HelpScreen,
     LimitScreen,
     LinkRevisionScreen,
+    RangeDiffScreen,
     RebaseScreen,
     SnoozeScreen,
     TakeConfirmScreen,
     TargetBranchScreen,
 )
 from b4.review_tui._tracking_app import (
+    TrackedRevisionItem,
     TrackedSeriesItem,
     TrackingApp,
     _build_base_suggestions,
     _detect_initial_base,
     _effective_tier,
+    _format_version,
+    _msgs_fields,
     _resolve_worktree_take_conflict,
     _shazam_merge_flags,
     _take_worktree,
@@ -5995,8 +6003,6 @@ class TestRethreadFlagReachesTheThreadFetch:
         self, tmp_path: pathlib.Path
     ) -> None:
         """The viewer's series dict is what selects the reassembly path."""
-        from b4.review_tui._lite_app import LiteThreadScreen
-
         seen: Dict[str, Any] = {}
 
         def _capture(series: Dict[str, Any], identifier: str) -> List[Any]:
@@ -6017,6 +6023,27 @@ class TestRethreadFlagReachesTheThreadFetch:
         assert seen['is_rethreaded'] is True
         assert seen['revision'] == 2
 
+    @pytest.mark.asyncio
+    async def test_a_plain_version_row_reports_its_own_flag(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        """v1 is not rethreaded, so its row must not inherit v2's flag."""
+        self._seed_rethreaded('rt-child')
+
+        app = TrackingApp('rt-child')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            await pilot.press('x')
+            await pilot.pause()
+            await pilot.press('j')
+            await pilot.pause()
+            with patch.object(app, 'push_screen') as mock_push:
+                await pilot.press('e')
+                await pilot.pause()
+            screen = mock_push.call_args[0][0]
+            assert screen._tracking_info['revision'] == 1
+            assert screen._tracking_info['is_rethreaded'] is False
+
 
 class TestUpdateAllDoesNotForceThePoll:
     """'u' asks about one series; 'U' must not force the schedule everywhere.
@@ -6064,6 +6091,45 @@ class TestDiscoverOlderAction:
             keys = [key for key, _label in getattr(app.screen, '_actions')]
             assert 'discover' in keys
 
+    @pytest.mark.asyncio
+    async def test_conflicts_suppress_the_nothing_found_notice(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        """A run that skipped every version it found reports 0 found.
+
+        Saying "No older revisions found" and then listing four of them is
+        two notifications contradicting each other in the same toast stack.
+        """
+        _seed_db(
+            'test-discover-both',
+            [{'change_id': 'cid-d', 'revision': 5, 'status': 'new'}],
+        )
+        notices: List[str] = []
+
+        app = TrackingApp('test-discover-both')
+        with patch.object(
+            tracking,
+            'discover_older_revisions',
+            lambda *a, **kw: {
+                'found': 0,
+                'revisions': [],
+                'conflicts': [1, 2],
+                'error': None,
+            },
+        ):
+            async with app.run_test(size=(120, 30)) as pilot:
+                await pilot.pause()
+                with patch.object(
+                    TrackingApp,
+                    'notify',
+                    lambda self, msg, **kw: notices.append(str(msg)),
+                ):
+                    app.action_discover_older()
+                    await app.workers.wait_for_complete()
+                    await pilot.pause()
+        assert not any('No older revisions found' in n for n in notices), notices
+        assert any('v1, v2' in n for n in notices), notices
+
     @pytest.mark.asyncio
     async def test_action_runs_discovery(self, tmp_path: pathlib.Path) -> None:
         _seed_db(
@@ -6092,3 +6158,1560 @@ class TestDiscoverOlderAction:
                 await app.workers.wait_for_complete()
                 await pilot.pause()
         assert calls == [('test-discover-run', 'cid-d')]
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
+        'UPDATE revisions SET message_count = 5, seen_message_count = 3'
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
+def _selected_rev(app: TrackingApp) -> Optional[Any]:
+    """Read _selected_revision without narrowing it for the rest of the test."""
+    return app._selected_revision
+
+
+def _version_row_shown(app: TrackingApp) -> bool:
+    """Whether the details panel's Version: row is currently displayed."""
+    return bool(app.query_one('#detail-version-row').display)
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
+    then 5 for the total, a separator and 4 for the badge.  Slicing it
+    asserts that parent and child rows agree on the column layout.
+    """
+    return text[29:39].strip()
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
+            assert _selected_rev(app) is None
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
+            sel_rev = _selected_rev(app)
+            assert sel_rev is not None
+            assert sel_rev['revision'] == 1
+            assert app._selected_series is not None
+            assert app._selected_series['change_id'] == 'multi-1'
+
+            # Back on the parent row the version selection is cleared
+            await pilot.press('k')
+            await pilot.pause()
+            assert _selected_rev(app) is None
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
+            assert not app._expanded_rows
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
+    async def test_filtering_everything_away_drops_the_selection(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        """An empty list must not leave a version row selected.
+
+        The empty-list branch returns above the block that re-derives the
+        selection from the cursor, so the stale pair kept every series
+        action enabled -- and on a version row 'd' skips the picker and
+        range-diffs a series the list is no longer showing.
+        """
+        _seed_multiver('expand-empty')
+
+        app = TrackingApp('expand-empty')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            await pilot.press('x')
+            await pilot.pause()
+            await pilot.press('j')
+            await pilot.pause()
+            # Bound to a local: asserting on the attribute narrows it for
+            # the rest of the function, and mypy then calls the checks
+            # below unreachable.
+            on_child = app._selected_revision
+            assert on_child is not None
+
+            await pilot.press('l')
+            await pilot.pause()
+            app.screen.query_one('#limit-input', Input).value = 'nomatch-xyzzy'
+            await pilot.press('enter')
+            await pilot.pause()
+            assert len(app.query('#tracking-list')) == 0
+            assert app.query_one('#tracking-empty', Static)
+            assert app._selected_revision is None
+            assert app._selected_series is None
+            assert app.check_action('range_diff', ()) is False
+            # 'thread' is ungated and self-guards instead; with nothing
+            # selected it must open no screen.
+            depth = len(app.screen_stack)
+            app.action_thread()
+            await pilot.pause()
+            assert len(app.screen_stack) == depth
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
+            assert app._expanded_rows == {('multi-a', 2), ('multi-b', 2)}
+
+            await pilot.press('X')
+            await pilot.pause()
+            assert len(_list_items(app)) == 2
+            assert not app._expanded_rows
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
+            assert _msgs_column(_row_text(items[2])) == '5 (2)'
+            assert _msgs_column(_row_text(items[0])) == '5 (2)'
+
+    def test_missing_seen_count_reads_the_same_both_ways(self) -> None:
+        """A pre-v11 row can arrive with a total but no seen count.
+
+        The Msgs column and the details panel one line below it must not
+        answer that differently.
+        """
+        assert _msgs_fields(5, None) == ('5', '', False)
+        assert '5 msgs (0 unseen)' in _format_version(
+            {'revision': 2, 'message_count': 5, 'seen_message_count': None},
+            {'revision': 3},
+        )
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
+            assert not _version_row_shown(app)
+
+            await pilot.press('x')
+            await pilot.pause()
+            await pilot.press('j')
+            await pilot.press('j')
+            await pilot.pause()
+            assert _version_row_shown(app)
+            text = _static_text(app.query_one('#detail-version', Static))
+            assert text.startswith('v2 (tracked)')
+            assert '5 msgs (2 unseen)' in text
+            assert ', posted ' in text
+
+            # A version that was never fetched has no counts to show
+            await pilot.press('k')
+            await pilot.pause()
+            text = _static_text(app.query_one('#detail-version', Static))
+            assert text.startswith('v1')
+            assert '(tracked)' not in text
+            assert '- msgs (- unseen)' in text
+
+            # The catalog knows no patch count or send date per revision, so
+            # neither is filled in from the tracked revision.
+            subj = _static_text(app.query_one('#detail-subject', Static))
+            assert subj.startswith('[v1] ')
+            assert _static_text(app.query_one('#detail-sent', Static)) == 'Unknown'
+
+            # Back on the parent row the version detail disappears
+            await pilot.press('k')
+            await pilot.pause()
+            assert not _version_row_shown(app)
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
+    async def test_d_enabled_when_only_synthesized_row_makes_two(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        """Both gates count the tracked revision the same way.
+
+        Gating d on a raw catalog count once left an expanded version row
+        with d disabled.  Tracking a series now catalogues the revision it
+        tracks, so the two counts agree by construction rather than by the
+        merge helper patching one of them up.
+        """
+        _seed_multiver('child-rangediff-gate', tracked=2, revisions=[3])
+
+        app = TrackingApp('child-rangediff-gate')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            sel = app._selected_series
+            assert sel is not None
+            assert len(sel.get('_revisions') or []) == 2
+            assert len(app._merge_tracked_revision(sel)) == 2
+            assert app.check_action('toggle_expand', ()) is True
+            assert app.check_action('range_diff', ()) is True
+
+            await pilot.press('x')
+            await pilot.pause()
+            await pilot.press('j')
+            await pilot.press('j')
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
+            mock_diff.assert_called_once_with('multi-1', 2, 3)
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
+            assert 'abandon' in actions
+            # 'r' is greyed out on another version's row because it checks out
+            # the *tracked* revision; the menu has to refuse it too, or the
+            # checkout the guard declines is one extra keystroke away.
+            assert 'review' not in actions
+            await pilot.press('escape')
+            await pilot.pause()
+            assert app._selected_series is not None
+            assert app._selected_series['change_id'] == 'multi-1'
+
+
+class TestUnseenVersionSignal:
+    """The collapsed row has to show that a non-tracked version has mail."""
+
+    @staticmethod
+    def _set_counts(identifier: str, rev: int, total: int, seen: int) -> None:
+        conn = tracking.get_db(identifier)
+        conn.execute(
+            'UPDATE revisions SET message_count = ?, seen_message_count = ?'
+            ' WHERE change_id = ? AND revision = ?',
+            (total, seen, 'multi-1', rev),
+        )
+        conn.commit()
+        conn.close()
+
+    @pytest.mark.asyncio
+    async def test_marker_flags_unread_on_an_older_version(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        _seed_multiver('unseen-child')
+        # v1 has 3 unread; the tracked v2 has none of its own.
+        self._set_counts('unseen-child', 1, 7, 4)
+
+        app = TrackingApp('unseen-child')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            item = _list_items(app)[0]
+            assert isinstance(item, TrackedSeriesItem)
+            assert item.has_unseen_versions
+            assert '▸' in _row_text(item)
+
+    @pytest.mark.asyncio
+    async def test_tracked_revisions_own_unread_does_not_flag_it(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        """The Msgs column already carries the tracked revision's badge."""
+        _seed_multiver('unseen-tracked-only')
+        # Only the tracked v2 has an unread delta (5 total, 3 seen).
+        for rev in (1, 3):
+            self._set_counts('unseen-tracked-only', rev, 4, 4)
+
+        app = TrackingApp('unseen-tracked-only')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            item = _list_items(app)[0]
+            assert isinstance(item, TrackedSeriesItem)
+            assert not item.has_unseen_versions
+
+    @pytest.mark.asyncio
+    async def test_never_counted_versions_do_not_flag_it(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        """A NULL count is "unknown", not "all unread"."""
+        _seed_multiver('unseen-null')
+
+        app = TrackingApp('unseen-null')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            item = _list_items(app)[0]
+            assert isinstance(item, TrackedSeriesItem)
+            assert not item.has_unseen_versions
+
+
+class TestVersionRowDetails:
+    @pytest.mark.asyncio
+    async def test_attestation_is_not_shown_for_another_version(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        """Attestation is stored per series row, so it describes v2 only."""
+        _seed_multiver('att-version')
+        conn = tracking.get_db('att-version')
+        conn.execute(
+            "UPDATE series SET attestation = 'signed:dkim/example.com'"
+            " WHERE change_id = 'multi-1'"
+        )
+        conn.commit()
+        conn.close()
+
+        app = TrackingApp('att-version')
+
+        def att_shown() -> bool:
+            return bool(app.query_one('#detail-attestation-row').display)
+
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            assert att_shown()
+
+            # Move onto a child row for a different version.
+            await pilot.press('x')
+            await pilot.pause()
+            await pilot.press('j')
+            await pilot.pause()
+            sel = _selected_rev(app)
+            assert sel is not None and sel['revision'] == 1
+            assert not att_shown()
+
+            # ...and back on the tracked version's own row it returns.
+            await pilot.press('k')
+            await pilot.pause()
+            assert att_shown()
+
+
+class TestNeedsUpdateHintSurvivesTheMergedList:
+    @pytest.mark.asyncio
+    async def test_hint_is_shown_when_the_catalog_is_empty(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        """The row's '*' flag and the panel have to agree.
+
+        The merged version list always carries the tracked revision, so the
+        panel started rendering 'Revisions: v1' for a series with no catalog
+        data at all -- contradicting the '*' the same row was flying, and
+        leaving the documented "tracking data needs a refresh" hint
+        unreachable.
+        """
+        _seed_db(
+            'needs-update-hint',
+            [
+                {
+                    'change_id': 'no-cat',
+                    'revision': 1,
+                    'subject': '[PATCH] thing: do it',
+                    # Not one of the branch-backed states, or the startup
+                    # rescan marks it gone and the flag is suppressed.
+                    'status': 'accepted',
+                }
+            ],
+        )
+
+        app = TrackingApp('needs-update-hint')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            assert app._all_series[0].get('needs_update')
+            row = app.query_one('#detail-revisions-row')
+            assert row.display
+            assert 'run [u]pdate' in _static_text(
+                app.query_one('#detail-revisions', Static)
+            )
+
+    @pytest.mark.asyncio
+    async def test_hint_survives_the_v11_catalog_backfill(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        """A migrated database must not lose the hint on the way in.
+
+        Schema v11 backfills a catalog row for every series row, so a
+        never-swept series stopped looking any different from one that was
+        swept and found nothing: counting catalog rows put the '*' flag and
+        the panel hint permanently out of reach for every upgrading user.
+        """
+        _seed_db(
+            'needs-update-migrated',
+            [
+                {
+                    'change_id': 'migrated',
+                    'revision': 2,
+                    'subject': '[PATCH v2] thing: do it',
+                    'status': 'accepted',
+                }
+            ],
+        )
+        conn = tracking.get_db('needs-update-migrated')
+        # Exactly what the migration leaves behind: an entry mirroring the
+        # tracked revision, and no watermark, because no sweep has run.
+        tracking.add_revision(conn, 'migrated', 2, 'migrated-v2@example.com')
+        conn.execute('UPDATE revisions SET last_update_check = NULL')
+        conn.commit()
+        conn.close()
+
+        app = TrackingApp('needs-update-migrated')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            assert app._all_series[0].get('needs_update')
+            assert 'run [u]pdate' in _static_text(
+                app.query_one('#detail-revisions', Static)
+            )
+
+    @pytest.mark.asyncio
+    async def test_no_hint_once_a_sweep_has_run(self, tmp_path: pathlib.Path) -> None:
+        """A v1 series has no other version to find, and must not nag."""
+        _seed_db(
+            'needs-update-swept',
+            [
+                {
+                    'change_id': 'swept',
+                    'revision': 1,
+                    'subject': '[PATCH] thing: do it',
+                    'status': 'accepted',
+                }
+            ],
+        )
+        conn = tracking.get_db('needs-update-swept')
+        tracking.add_revision(conn, 'swept', 1, 'swept-v1@example.com')
+        conn.execute(
+            "UPDATE revisions SET last_update_check = '2026-03-10T10:00:00+00:00'"
+        )
+        conn.commit()
+        conn.close()
+
+        app = TrackingApp('needs-update-swept')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            assert not app._all_series[0].get('needs_update')
+
+
+class TestVersionRowDates:
+    def test_panel_dates_are_local_not_a_utc_slice(self) -> None:
+        """The details panel and the version row must not disagree by a day.
+
+        The row converts to local time on purpose; the panel used to slice
+        the stored ISO string, so within the local offset of midnight the
+        two rendered different dates for the same revision.
+        """
+        old_tz = os.environ.get('TZ')
+        os.environ['TZ'] = 'Australia/Sydney'
+        time.tzset()
+        try:
+            stamp = '2026-03-12T23:30:00+00:00'
+            out = _tracking_app._format_version(
+                {
+                    'revision': 1,
+                    'message_count': 4,
+                    'seen_message_count': 4,
+                    'found_at': stamp,
+                    'last_mail_at': stamp,
+                },
+                {'revision': 2},
+            )
+            # 23:30 UTC is already the 13th in Sydney; the ISO slice says 12th.
+            assert ', posted 2026-03-13' in out
+            assert ', last activity 2026-03-13' in out
+            assert _tracking_app._local_stamp(stamp, '%d %b') == '13 Mar'
+        finally:
+            if old_tz is None:
+                os.environ.pop('TZ', None)
+            else:
+                os.environ['TZ'] = old_tz
+            time.tzset()
+
+    def test_unparseable_stamp_renders_empty(self) -> None:
+        assert _tracking_app._local_stamp('not a date', '%d %b') == ''
+        assert _tracking_app._local_stamp(None, '%d %b') == ''
+
+
+class TestDuplicateChangeIdRows:
+    """rescan_branches can leave one change_id with two live series rows."""
+
+    @staticmethod
+    def _seed(identifier: str) -> None:
+        conn = tracking.init_db(identifier)
+        for rev, added in ((2, '2026-03-01T00:00:00+00:00'), (5, '2026-03-02')):
+            conn.execute(
+                'INSERT INTO series (change_id, revision, message_id, subject,'
+                ' sender_name, sender_email, sent_at, added_at, status,'
+                " num_patches) VALUES ('dup',?,?,?,'Dee','dee@example.com',"
+                "?,?,'new',2)",
+                (
+                    rev,
+                    f'dup-v{rev}@example.com',
+                    f'[PATCH v{rev} 0/2] dup: a series',
+                    added,
+                    added,
+                ),
+            )
+        for rev in (1, 2, 5):
+            tracking.add_revision(conn, 'dup', rev, f'dup-v{rev}@example.com')
+        conn.commit()
+        conn.close()
+
+    @pytest.mark.asyncio
+    async def test_expanding_one_row_leaves_its_twin_collapsed(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        """Expansion is per row, not per change_id.
+
+        Both rows are rendered separately and carry different tracked
+        revisions, so keying the expansion on the change_id alone unfolded
+        the pair together and gave each an identical set of child rows.
+        """
+        self._seed('dup-expand')
+
+        app = TrackingApp('dup-expand')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            items = _list_items(app)
+            assert len(items) == 2
+            first_rev = items[0].series['revision']
+
+            await pilot.press('x')
+            await pilot.pause()
+            items = _list_items(app)
+            # One parent grew three children; the other is untouched.
+            assert len(items) == 5
+            assert app._expanded_rows == {('dup', first_rev)}
+            parents = [i for i in items if isinstance(i, TrackedSeriesItem)]
+            assert [p.expanded for p in parents] == [True, False]
+
+    @pytest.mark.asyncio
+    async def test_unread_on_a_twins_revision_is_not_this_rows_badge(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        """Another live row's revision is that row's business, not this one's.
+
+        Its counts are badged in its own Msgs column; accenting this row's
+        expander for them reports "an older version of this series has new
+        mail" about a version this series never tracked.
+        """
+        self._seed('dup-badge')
+        conn = tracking.get_db('dup-badge')
+        # Unread mail on v5 -- which the other live row tracks.
+        conn.execute(
+            'UPDATE revisions SET message_count = 9, seen_message_count = 4'
+            " WHERE change_id = 'dup' AND revision = 5"
+        )
+        conn.commit()
+        conn.close()
+
+        app = TrackingApp('dup-badge')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            by_rev = {
+                i.series['revision']: i
+                for i in _list_items(app)
+                if isinstance(i, TrackedSeriesItem)
+            }
+            # v5 is the other row's own tracked revision...
+            assert by_rev[2].has_unseen_versions is False
+            # ...and v5's row does not badge itself for it either.
+            assert by_rev[5].has_unseen_versions is False
+
+
+class TestLimitCursorRestore:
+    @pytest.mark.asyncio
+    async def test_cursor_returns_after_a_limit_matched_nothing(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        """Clearing the selection must not also drop the restore hint.
+
+        The empty branch has to forget what is selected, or every action
+        stays enabled against a row the list no longer shows -- but the
+        stashed focus is only a hint, and dropping it lands the cursor at
+        the top once the filter is cleared again.
+        """
+        _seed_db('limit-empty', [SAMPLE_SERIES[0], SAMPLE_SERIES[1]])
+
+        app = TrackingApp('limit-empty')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            await pilot.press('j')
+            await pilot.pause()
+            selected = app._selected_series
+            assert selected is not None
+            target = selected['change_id']
+
+            app._limit_pattern = 'nothing-matches-this'
+            app._stash_focus()
+            await app._refresh_list()
+            await pilot.pause()
+            while_empty = app._selected_series
+            assert while_empty is None
+
+            app._limit_pattern = ''
+            await app._refresh_list()
+            await pilot.pause()
+            restored = app._selected_series
+            assert restored is not None
+            assert restored['change_id'] == target
+
+
+class TestExpandAllScope:
+    @pytest.mark.asyncio
+    async def test_expand_all_ignores_filtered_out_series(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        """[X] judged "already expanded?" against rows the filter hides."""
+        _seed_multiver('expand-scope', change_id='multi-1')
+        conn = tracking.get_db('expand-scope')
+        tracking.add_series_to_db(
+            conn,
+            change_id='other-1',
+            revision=2,
+            subject='[PATCH v2 0/2] other: hidden series',
+            sender_name='Hidden Hank',
+            sender_email='hank@example.com',
+            sent_at='2026-03-11T10:00:00+00:00',
+            message_id='other-1-v2@example.com',
+            num_patches=2,
+        )
+        for rev in (1, 2):
+            tracking.add_revision(conn, 'other-1', rev, f'other-1-v{rev}@example.com')
+        conn.close()
+
+        app = TrackingApp('expand-scope')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            # Hide 'other-1' behind the limit filter.
+            app._limit_pattern = 'multi'
+            await app._refresh_list()
+            await pilot.pause()
+            assert len(_list_items(app)) == 1
+
+            app.action_expand_all()
+            await pilot.pause()
+            # The visible series expanded, and the hidden one was not
+            # counted when deciding expand-vs-collapse.
+            assert app._expanded_rows == {('multi-1', 2)}
+            assert len(_list_items(app)) == 4
+
+    @pytest.mark.asyncio
+    async def test_expand_all_collapse_leaves_hidden_series_alone(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        """[X] collapsing must not fold up what the filter is hiding."""
+        _seed_multiver('collapse-scope', change_id='multi-1')
+        conn = tracking.get_db('collapse-scope')
+        tracking.add_series_to_db(
+            conn,
+            change_id='other-1',
+            revision=2,
+            subject='[PATCH v2 0/2] other: hidden series',
+            sender_name='Hidden Hank',
+            sender_email='hank@example.com',
+            sent_at='2026-03-11T10:00:00+00:00',
+            message_id='other-1-v2@example.com',
+            num_patches=2,
+        )
+        for rev in (1, 2):
+            tracking.add_revision(conn, 'other-1', rev, f'other-1-v{rev}@example.com')
+        conn.close()
+
+        app = TrackingApp('collapse-scope')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            # Expand both, then hide one behind the limit filter.
+            app.action_expand_all()
+            await pilot.pause()
+            assert app._expanded_rows == {('multi-1', 2), ('other-1', 2)}
+            app._limit_pattern = 'multi'
+            await app._refresh_list()
+            await pilot.pause()
+
+            app.action_expand_all()
+            await pilot.pause()
+            # Only the displayed series collapsed.
+            assert app._expanded_rows == {('other-1', 2)}
+
+
+class TestUnseenVersionMarkerRendering:
+    """The computed flag has to reach the glyph, not just the attribute."""
+
+    @pytest.mark.asyncio
+    async def test_the_marker_is_accented_when_an_older_version_has_mail(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        _seed_multiver('unseen-style')
+        conn = tracking.get_db('unseen-style')
+        conn.execute(
+            'UPDATE revisions SET message_count = 7, seen_message_count = 4'
+            " WHERE change_id = 'multi-1' AND revision = 1"
+        )
+        conn.commit()
+        conn.close()
+
+        app = TrackingApp('unseen-style')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            label = _list_items(app)[0].query_one(Label)
+            marker_spans = [
+                span
+                for span in label.content.spans
+                if label.content.plain[span.start : span.end] == '▸'
+            ]
+            assert marker_spans, 'the ▸ marker carries no style'
+            assert 'bold' in str(marker_spans[0].style)
+
+    @pytest.mark.asyncio
+    async def test_the_marker_is_plain_when_nothing_is_unread(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        _seed_multiver('unseen-style-none')
+
+        app = TrackingApp('unseen-style-none')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            label = _list_items(app)[0].query_one(Label)
+            marker_spans = [
+                span
+                for span in label.content.spans
+                if label.content.plain[span.start : span.end] == '▸'
+            ]
+            assert marker_spans == []
+
+
+class TestStatusActionsKeepTheVersionRow:
+    @pytest.mark.asyncio
+    async def test_waiting_from_a_version_row_stays_there(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        """A status change says nothing about which versions the series has.
+
+        Setting a target branch already left the cursor alone; snooze,
+        unsnooze, waiting and thank bounced it up to the parent, so two
+        status-only actions taken from the same row disagreed about where
+        the cursor belonged afterwards.
+        """
+        _seed_multiver('status-keeps-row')
+        app = TrackingApp('status-keeps-row')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            await pilot.press('x')
+            await pilot.pause()
+            await pilot.press('j')  # onto the first version row
+            await pilot.pause()
+            before = app.query_one('#tracking-list', ListView).index
+            assert isinstance(_list_items(app)[before], TrackedRevisionItem)
+            picked = _list_items(app)[before].rev['revision']
+
+            app.action_waiting()
+            await pilot.pause()
+            await pilot.pause()
+
+            item = _list_items(app)[
+                app.query_one('#tracking-list', ListView).index or 0
+            ]
+            assert isinstance(item, TrackedRevisionItem)
+            assert item.rev['revision'] == picked
+            assert app._selected_revision is not None
+            assert app._selected_revision['revision'] == picked
+
+
+class TestVersionRowDateIsLocal:
+    @pytest.mark.asyncio
+    async def test_the_date_is_rendered_in_local_time(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        """The column stores UTC; showing it raw puts a row a day out.
+
+        23:00 UTC is the next day in any eastward zone, which is exactly
+        when a maintainer notices the version row and the thread viewer
+        disagreeing about the same message.
+
+        Plain environ save/restore, not monkeypatch.setenv: the fixture
+        undoes its env change after this method's finally block, so the
+        last tzset() here would run with TZ unset and leave libc's cached
+        zone disagreeing with os.environ for the rest of the process.
+        """
+        old_tz = os.environ.get('TZ')
+        os.environ['TZ'] = 'Australia/Sydney'
+        time.tzset()
+        try:
+            _seed_multiver('rowdate-local')
+            conn = tracking.get_db('rowdate-local')
+            conn.execute(
+                "UPDATE revisions SET last_mail_at = '2026-03-11T23:30:00+00:00'"
+                " WHERE change_id = 'multi-1' AND revision = 1"
+            )
+            conn.commit()
+            conn.close()
+
+            app = TrackingApp('rowdate-local')
+            async with app.run_test(size=(120, 30)) as pilot:
+                await pilot.pause()
+                await pilot.press('x')
+                await pilot.pause()
+                child = _list_items(app)[1]
+                assert isinstance(child, TrackedRevisionItem)
+                assert '12 Mar' in _row_text(child)
+        finally:
+            if old_tz is None:
+                os.environ.pop('TZ', None)
+            else:
+                os.environ['TZ'] = old_tz
+            time.tzset()
+
+    @pytest.mark.asyncio
+    async def test_the_date_touches_neither_neighbour(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        """The date shares the submitter field with the version label.
+
+        Both are variable width, so the check is that blanks separate the
+        date from the version beside it and from the counts after it, and
+        that Subject still starts on the same column as the parent row's --
+        which is the column the header describes.
+        """
+        _seed_multiver('rowdate-gap')
+        conn = tracking.get_db('rowdate-gap')
+        conn.execute(
+            "UPDATE revisions SET last_mail_at = '2026-03-11T10:00:00+00:00'"
+            " WHERE change_id = 'multi-1' AND revision = 1"
+        )
+        conn.commit()
+        conn.close()
+
+        app = TrackingApp('rowdate-gap')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            await pilot.press('x')
+            await pilot.pause()
+            items = _list_items(app)
+            child = items[1]
+            assert isinstance(child, TrackedRevisionItem)
+            text = _row_text(child)
+            assert 'multi: test series' in text
+            # Blank on both sides of the date, whatever it renders as.
+            assert re.search(r'v1 +11 Mar +', text)
+            # Subject starts where the parent's does, and the header says so.
+            assert text.index('multi: test series') == _row_text(items[0]).index('[v2,')
+
+
+class TestConflictNoticeKeepsItsKeyHint:
+    def test_the_link_key_survives_markup_rendering(self) -> None:
+        """notify() renders Rich markup, so a bare [l] is eaten as a tag."""
+        from textual.content import Content
+
+        from b4.review_tui._tracking_app import _conflicts_notice
+
+        notice = _conflicts_notice([2, 3])
+        rendered = Content.from_markup(notice).plain
+        assert 'v2, v3' in rendered
+        assert '[l]' in rendered
+        # ...and nothing was mistaken for a style along the way.
+        assert Content.from_markup(notice).spans == []
+
+
+class TestDiscoveryErrorSurvivesMarkupRendering:
+    """A lore exception is arbitrary text, and notify() parses markup."""
+
+    def test_a_bracketed_subject_is_not_swallowed(self) -> None:
+        """Lowercase-initial brackets parse as a style tag and vanish."""
+        from textual.content import Content
+
+        from b4.review_tui._tracking_app import _discovery_error_notice
+
+        notice = _discovery_error_notice('no match for [patch v2 1/3] foo: fix')
+        rendered = Content.from_markup(notice).plain
+        assert '[patch v2 1/3] foo: fix' in rendered
+        assert Content.from_markup(notice).spans == []
+
+    def test_a_closing_tag_does_not_raise(self) -> None:
+        """An unbalanced '[/...]' raises MarkupError inside the toast."""
+        from textual.content import Content
+
+        from b4.review_tui._tracking_app import _discovery_error_notice
+
+        notice = _discovery_error_notice('cannot read [/var/tmp/x] while fetching')
+        rendered = Content.from_markup(notice).plain
+        assert '[/var/tmp/x]' in rendered
+
+
+class TestVersionRowActionGating:
+    @pytest.mark.asyncio
+    async def test_range_diff_is_offered_on_a_thanked_series(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        """[x] expands in every state, and the docs promise 'd' on a child."""
+        _seed_multiver('gate-thanked')
+        conn = tracking.get_db('gate-thanked')
+        tracking.update_series_status(conn, 'multi-1', 'thanked', revision=2)
+        conn.close()
+
+        app = TrackingApp('gate-thanked')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            assert app.check_action('toggle_expand', ()) is True
+            assert app.check_action('range_diff', ()) is True
+
+    @pytest.mark.asyncio
+    async def test_review_is_disabled_on_another_version(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        """'r' checks out the tracked revision, not the highlighted one."""
+        _seed_multiver('gate-review')
+        app = TrackingApp('gate-review')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            assert app.check_action('review', ()) is True
+            await pilot.press('x')
+            await pilot.pause()
+            # Cursor onto v1 -- not the tracked v2.
+            await pilot.press('j')
+            await pilot.pause()
+            assert _selected_rev(app) is not None
+            assert app.check_action('review', ()) is False
+            # ...and on the tracked revision's own row it is fine again.
+            await pilot.press('j')
+            await pilot.pause()
+            assert _selected_rev(app) is not None
+            assert app.check_action('review', ()) is True
+
+    @pytest.mark.asyncio
+    async def test_take_and_rebase_are_disabled_on_another_version(
+        self, gitdir: str
+    ) -> None:
+        """Both act on the review branch, which holds the tracked revision.
+
+        'r' was greyed out for that reason from the start; these two build
+        and move the very same branch, so offering them on a v1 row runs
+        them against v2 while every label on screen says v1.
+        """
+        # A real branch, or the startup rescan turns 'reviewing' into 'gone'
+        # and neither action is offered in any case.
+        _create_review_branch(gitdir, 'multi-1', identifier='gate-take', revision=2)
+        _seed_multiver('gate-take')
+        conn = tracking.get_db('gate-take')
+        tracking.update_series_status(conn, 'multi-1', 'reviewing', revision=2)
+        conn.close()
+
+        app = TrackingApp('gate-take')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            assert app.check_action('take', ()) is True
+            assert app.check_action('rebase', ()) is True
+            await pilot.press('x')
+            await pilot.pause()
+            # Cursor onto v1 -- not the tracked v2.
+            await pilot.press('j')
+            await pilot.pause()
+            assert _selected_rev(app) is not None
+            assert app.check_action('take', ()) is False
+            assert app.check_action('rebase', ()) is False
+            # ...and the action menu drops them for the same row.
+            await pilot.press('a')
+            await pilot.pause()
+            assert isinstance(app.screen, ActionScreen)
+            lv = app.screen.query_one('#action-list', ListView)
+            from b4.review_tui._modals import ActionItem
+
+            offered = [c.key for c in lv.children if isinstance(c, ActionItem)]
+            assert 'take' not in offered
+            assert 'rebase' not in offered
+            # An action that does not touch the branch is still there.
+            assert 'snooze' in offered
+            await pilot.press('escape')
+
+
+class TestThreadViewLeavesNoStaleFocus:
+    """Viewing a version's thread must not capture a later reload.
+
+    _stash_focus() is a hint for the *next* _refresh_list(), and every
+    other caller reloads immediately.  action_thread() instead pushes a
+    screen and returns, so the hint outlives the action -- and re-reading
+    an already-read thread writes nothing, leaving the DB mtime alone and
+    _check_db_changed() asleep, so nothing consumes it either.  The next
+    reload from an unrelated action then parks the cursor on the version
+    row the maintainer looked at, arming _selected_revision behind their
+    back.
+    """
+
+    @pytest.mark.asyncio
+    async def test_a_viewed_version_does_not_capture_a_later_reload(
+        self, tmp_path: pathlib.Path, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        from textual.screen import ModalScreen
+
+        class _StubThreadScreen(ModalScreen[None]):
+            """Stands in for LiteThreadScreen: pushes and pops, no fetch."""
+
+            def __init__(self, *args: Any, **kwargs: Any) -> None:
+                super().__init__()
+
+        monkeypatch.setattr(
+            'b4.review_tui._lite_app.LiteThreadScreen', _StubThreadScreen
+        )
+        # Re-reading a thread whose counts have not moved writes nothing, so
+        # in the real flow the mtime poller stays asleep and never reloads.
+        # The startup rescan does touch the DB here, so pin the poller off
+        # rather than race its one-second timer.
+        monkeypatch.setattr(TrackingApp, '_check_db_changed', lambda self: None)
+
+        # Seeded oldest-first: the list sorts newest-tracked first, so
+        # 'multi-b' heads the list and 'multi-a' follows it.
+        _seed_multiver('thread-focus', change_id='multi-a')
+        _seed_multiver('thread-focus', change_id='multi-b')
+
+        app = TrackingApp('thread-focus')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            items = _list_items(app)
+            assert [i.series['change_id'] for i in items] == ['multi-b', 'multi-a']
+
+            # Expand 'multi-a' and put the cursor on its v1 row.
+            await pilot.press('j')
+            await pilot.pause()
+            await pilot.press('x')
+            await pilot.pause()
+            await pilot.press('j')
+            await pilot.pause()
+            on_child = app._selected_revision
+            assert on_child is not None
+            assert on_child['revision'] == 1
+
+            # View that version's thread and come back.  Nothing about the
+            # thread changed, so no reload happens on the way out.
+            depth = len(app.screen_stack)
+            app.action_thread()
+            await pilot.pause()
+            assert len(app.screen_stack) == depth + 1
+            app.pop_screen()
+            await pilot.pause()
+
+            # The hint must not outlive the action that set it.
+            assert app._focus_change_id is None
+            assert app._focus_revision is None
+
+            # Navigate back up to 'multi-b' and abandon it -- a reload that
+            # deliberately does not stash a focus of its own.
+            await pilot.press('k')
+            await pilot.press('k')
+            await pilot.pause()
+            selected = app._selected_series
+            assert selected is not None
+            assert selected['change_id'] == 'multi-b'
+
+            app._on_abandon_confirmed(True, 'multi-b', 'b4/review/multi-b', False)
+            await pilot.pause()
+
+            # The cursor lands on a series row, not on the version row that
+            # was looked at three actions ago.
+            lv = app.query_one('#tracking-list', ListView)
+            landed = lv.highlighted_child
+            assert isinstance(landed, TrackedSeriesItem)
+            assert app._selected_revision is None
+
+
+class TestExpandAllWithoutASelection:
+    """[X] needs no selection, so it must not restore by row index.
+
+    _stash_focus() records a hint only when something is selected, and
+    expanding is precisely the operation that inserts rows above the
+    cursor -- so the index fallback lands somewhere unrelated.
+    """
+
+    @pytest.mark.asyncio
+    async def test_expand_all_keeps_the_highlighted_series(
+        self, tmp_path: pathlib.Path, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        # The mtime poller re-stashes and reloads on its own timer; pin it
+        # off so this exercises [X]'s restore and not a race with it.
+        monkeypatch.setattr(TrackingApp, '_check_db_changed', lambda self: None)
+
+        # Display order is newest-tracked first: multi-c, multi-b, multi-a.
+        for change_id in ('multi-a', 'multi-b', 'multi-c'):
+            _seed_multiver('expand-nosel', change_id=change_id)
+
+        app = TrackingApp('expand-nosel')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            assert [i.series['change_id'] for i in _list_items(app)] == [
+                'multi-c',
+                'multi-b',
+                'multi-a',
+            ]
+
+            # Put the cursor on the last row, away from index 0.
+            await pilot.press('j')
+            await pilot.press('j')
+            await pilot.pause()
+            selected = app._selected_series
+            assert selected is not None
+            target = selected['change_id']
+            assert target == 'multi-a'
+
+            # Close the details panel: the selection goes, the cursor stays.
+            await pilot.press('escape')
+            await pilot.pause()
+            assert app._selected_series is None
+
+            await pilot.press('X')
+            await pilot.pause()
+            assert len(_list_items(app)) == 12  # 3 parents + 3 versions each
+
+            # Still the same series, and still its parent row.
+            lv = app.query_one('#tracking-list', ListView)
+            landed = lv.highlighted_child
+            assert isinstance(landed, TrackedSeriesItem)
+            assert landed.series['change_id'] == target
+            assert app._selected_revision is None
+
+
+class TestTargetBranchKeepsTheVersionRow:
+    """Setting a target branch must not repaint the panel for another row.
+
+    [t] acts on the series whichever row the cursor is on, which is fine
+    -- but its callback refreshes the details panel without saying which
+    version the cursor is sitting on, so the panel silently reverts to
+    the tracked revision while the cursor visibly stays on the child row.
+    """
+
+    @pytest.mark.asyncio
+    async def test_setting_a_target_keeps_the_panel_on_the_version_row(
+        self, tmp_path: pathlib.Path, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        # The mtime poller would reload and repaint on its own timer; pin
+        # it off so this pins the callback's own behaviour.
+        monkeypatch.setattr(TrackingApp, '_check_db_changed', lambda self: None)
+        _seed_multiver('target-version-row')
+
+        app = TrackingApp('target-version-row')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            await pilot.press('x')
+            await pilot.pause()
+            await pilot.press('j')
+            await pilot.pause()
+            on_child = app._selected_revision
+            assert on_child is not None
+            assert on_child['revision'] == 1
+            assert _version_row_shown(app)
+
+            app._on_target_branch_set('sound/for-next')
+            await pilot.pause()
+
+            # The cursor never moved, so the panel must still describe the
+            # version it is on.
+            still_on = app._selected_revision
+            assert still_on is not None
+            assert still_on['revision'] == 1
+            assert _version_row_shown(app)

-- 
2.53.0

