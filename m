Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A485448B82
	for <tools@linux.kernel.org>; Wed, 29 Jul 2026 09:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785319109; cv=none; b=FHwaN0ecL9TaDQ0I0/ZdQj5TDdoqdt5g+FSFUs/s342VFXrsjGdGZxcbCHdLIEvPSyB7zoyaBgikUlthkHSiqJcMHkXRHMhXQbZfax440A9l0XOtbZ0ua5JHMskn37LLNbObLbLVtiU/eoK24NoiPf1yDiIOOepweYW7CfzRAcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785319109; c=relaxed/simple;
	bh=khVMnB77WHFxK2Qp/67KKzlaqpOrMpm7/bOVToCmQQ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k1dMN+3HTnLj+XQatVsVrYWtowf9r/oCHxzg/psAyVZBIuXPrpWOIVJO3B2cz3bGwnSaZcqkRV2NNMh+pXScIxI5U6/bC6px1fBdTtH+iqm03OZfEKXxl5ATKw4YU5kDH7xoG5vsj6c9E+tT6CQrqApkJzsHweB2JeIw9OARBpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OsNTPSmU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OsNTPSmU"
Received: by smtp.kernel.org (Postfix)
	id 3237D1F00A3A; Wed, 29 Jul 2026 09:58:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E3BB1F000E9;
	Wed, 29 Jul 2026 09:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785319108;
	bh=KD/3HOT6RZiHrwwXZPLF6LVL8d6w7YkoldHEhq02TII=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=OsNTPSmU3lJn3BI9CRrEhfhMpHbrDPBQaOf7O2GsfyXKIuQVtXaBfjzCR4rlML4ZT
	 sGNGILxQGuIsDJzvL5XIEVCVyfdeAR9lGhgSq159KzjgFR89MRflx20WgGrEUwWOWQ
	 Fi/NhoeutJKOYz36QFSW0tutMgVlfWoAatuqdboZCyXeJHnD+wrI61WWlp27KHMu0i
	 MuxJ2eEHo3/ti7YmUNfPMTt96EMDy/BMeWyrdOfkE2+Bv9ZF1ypF6q9eGA94U7jNrN
	 MD1plpDJY6apMHqKUI548nJ2iBjO0BLKz+usuXRaxYHwyjGSxM7LTzVSIlZ002v5Uh
	 0mCwjlGyQvosA==
From: Christian Brauner <brauner@kernel.org>
Date: Wed, 29 Jul 2026 11:58:20 +0200
Subject: [PATCH b4 2/2] tests: cover scroll preservation across list
 rebuilds
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-work-b4-tui-scroll-preserve-v1-2-42be22445eaf@kernel.org>
References: <20260729-work-b4-tui-scroll-preserve-v1-0-42be22445eaf@kernel.org>
In-Reply-To: <20260729-work-b4-tui-scroll-preserve-v1-0-42be22445eaf@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-b7988
X-Developer-Signature: v=1; a=openpgp-sha256; l=7736; i=brauner@kernel.org;
 h=from:subject:message-id; bh=khVMnB77WHFxK2Qp/67KKzlaqpOrMpm7/bOVToCmQQ4=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWRlnjtgsv0/K/cpRlcGL+tfPEqxrPnf11RUfrnOI8L6P
 o89JYqno5SFQYyLQVZMkcWh3SRcbjlPxWajTA2YOaxMIEMYuDgFYCJP2xh+szhvPJtb07hnc82n
 wnmsuzOc7+yRXcqw4aJ6/t/9s5zeb2Bk+B1ttlPvYefsKYfjrmwpqwzfytd/PHRnwfVkh7VRSx5
 kcwEA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Drive the cursor mid-viewport, reload the way the apps do after an
update, and assert the rebuilt list keeps the exact scroll offset,
cursor index, scrollbar thumb position, and selection.

The tracking test reloads via _load_series the way _on_update_complete
does after 'u'.  The bugs test drives BugListApp against a stubbed
repo (no git-bug or network) and reloads through the real
load_bugs-worker path the way _check_cache_changed does.

The cursor deliberately sits mid-viewport rather than at the bottom
edge: a plain rebuild's minimal scroll-into-view happens to reproduce
the bottom-edge offset exactly, which would let the test pass without
the fix.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/tests/test_tui_bugs.py     | 72 +++++++++++++++++++++++++++++++++++++++---
 src/tests/test_tui_tracking.py | 53 +++++++++++++++++++++++++++++++
 2 files changed, 120 insertions(+), 5 deletions(-)

diff --git a/src/tests/test_tui_bugs.py b/src/tests/test_tui_bugs.py
index c93dd94..c00b394 100644
--- a/src/tests/test_tui_bugs.py
+++ b/src/tests/test_tui_bugs.py
@@ -6,11 +6,13 @@
 """Unit tests for b4 bugs helpers.
 
 Tests the pure-logic functions in _import.py and _tui.py that don't
-need Textual, git-bug, or network access.
+need Textual, git-bug, or network access, plus one Textual-driven
+test of bug-list scroll preservation (with a stubbed repo, so still
+no git-bug or network).
 """
 
-from datetime import datetime, timezone
-from typing import Set
+from datetime import datetime, timedelta, timezone
+from typing import Set, cast
 from unittest import mock
 
 import pytest
@@ -33,7 +35,7 @@ from b4.bugs._tui import (
     build_label_text,
     label_color,
 )
-from ezgb import Bug, BugSummary, Comment, Identity, Status
+from ezgb import Bug, BugSummary, Comment, GitBugRepo, Identity, Status
 
 # ---------------------------------------------------------------------------
 # Helpers -- factory functions for real Bug and BugSummary objects
@@ -82,9 +84,10 @@ def make_summary(
     title: str = '',
     comment_count: int = 0,
     author_name: str = '',
+    bug_id: str | None = None,
 ) -> BugSummary:
     return BugSummary(
-        id='deadbeef' * 8,
+        id=bug_id or 'deadbeef' * 8,
         title=title,
         status=status,
         creator_id='test',
@@ -534,3 +537,62 @@ class TestQuitBindings:
         assert bmap['Q'].action == 'quit'
         assert bmap['q'].action == 'quit_hint'
         assert bmap['q'].show is False
+
+
+class TestRefreshScrollPreservation:
+    """The bug list is rebuilt wholesale on refresh; the viewport must stay put."""
+
+    @pytest.mark.asyncio
+    async def test_refresh_preserves_scroll_position(self) -> None:
+        from textual.widgets import ListView
+
+        many = [
+            make_summary(
+                bug_id=f'{i:064x}',
+                title=f'bug {i:02d}',
+                edited_at=_EPOCH + timedelta(hours=40 - i),
+            )
+            for i in range(40)
+        ]
+        repo = mock.Mock()
+        repo._repo = '/nonexistent/bugs-repo'
+        repo.list_bug_summaries.return_value = many
+
+        app = BugListApp(cast(GitBugRepo, repo))
+        async with app.run_test(size=(120, 30)) as pilot:
+            await app.workers.wait_for_complete()
+            await pilot.pause()
+            await pilot.pause()
+            lv = app.query_one('#bug-list', ListView)
+            # Move deep enough into the list that the view scrolls down,
+            # then back up a bit so the cursor sits mid-viewport rather
+            # than at the bottom edge (which a minimal scroll-into-view
+            # after the rebuild would happen to reproduce).
+            lv.index = 30
+            await pilot.pause()
+            await pilot.pause()
+            lv.index = 26
+            await pilot.pause()
+            await pilot.pause()
+            scroll_before = round(lv.scroll_y)
+            assert scroll_before > 0
+            selected = app._get_selected_bug()
+            assert selected is not None
+            bug_id = selected.id
+
+            # Reload the same way _check_cache_changed does
+            app._save_focus()
+            app.run_worker(app._load_bugs, name='load_bugs', thread=True)
+            await app.workers.wait_for_complete()
+            await pilot.pause()
+            await pilot.pause()
+            await pilot.pause()
+
+            new_lv = app.query_one('#bug-list', ListView)
+            assert new_lv is not lv
+            assert new_lv.index == 26
+            assert round(new_lv.scroll_y) == scroll_before
+            assert round(new_lv.vertical_scrollbar.position) == scroll_before
+            selected = app._get_selected_bug()
+            assert selected is not None
+            assert selected.id == bug_id
diff --git a/src/tests/test_tui_tracking.py b/src/tests/test_tui_tracking.py
index b4db46b..90c29b2 100644
--- a/src/tests/test_tui_tracking.py
+++ b/src/tests/test_tui_tracking.py
@@ -320,6 +320,59 @@ class TestTrackingNavigation:
             await pilot.pause()
             assert lv.index == 1
 
+    @pytest.mark.asyncio
+    async def test_refresh_preserves_scroll_position(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        """A list rebuild (e.g. after 'u') must not scroll the viewport."""
+        many = [
+            {
+                'change_id': f'test-change-{i:02d}',
+                'subject': f'[PATCH] series {i:02d}',
+                'sender_name': f'Author {i:02d}',
+                'sender_email': f'a{i:02d}@example.com',
+                'sent_at': f'2026-03-{(i % 27) + 1:02d}T10:00:00+00:00',
+                'message_id': f'series-{i:02d}-v1@example.com',
+            }
+            for i in range(40)
+        ]
+        _seed_db('test-scroll', many)
+
+        app = TrackingApp('test-scroll')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            lv = app.query_one('#tracking-list', ListView)
+            # Move deep enough into the list that the view scrolls down,
+            # then back up a bit so the cursor sits mid-viewport rather
+            # than at the bottom edge (which a minimal scroll-into-view
+            # after the rebuild would happen to reproduce).
+            lv.index = 30
+            await pilot.pause()
+            await pilot.pause()
+            lv.index = 26
+            await pilot.pause()
+            await pilot.pause()
+            scroll_before = round(lv.scroll_y)
+            assert scroll_before > 0
+            assert app._selected_series is not None
+            change_id = app._selected_series['change_id']
+
+            # Reload the same way _on_update_complete does after 'u'
+            app._focus_change_id = change_id
+            app._invalidate_caches()
+            app._load_series()
+            await pilot.pause()
+            await pilot.pause()
+            await pilot.pause()
+
+            new_lv = app.query_one('#tracking-list', ListView)
+            assert new_lv is not lv
+            assert new_lv.index == 26
+            assert round(new_lv.scroll_y) == scroll_before
+            assert round(new_lv.vertical_scrollbar.position) == scroll_before
+            assert app._selected_series is not None
+            assert app._selected_series['change_id'] == change_id
+
     @pytest.mark.asyncio
     async def test_help_opens_and_closes(self, tmp_path: pathlib.Path) -> None:
         _seed_db('test-help', SAMPLE_SERIES)

-- 
2.53.0

