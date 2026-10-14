Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB2F44E662
	for <tools@linux.kernel.org>; Wed, 14 Oct 2026 11:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791978792; cv=none; b=YT0+JKWwZejzlJHCvY0qlEdc0AYjUedOEO+RIQWAIoSAaJ8h02WBNSWiWPX2m6uqXloXYCbdciS1aW0qsdFSsPOy/GxPQzg9WjleT/ML/MW7mItFDpck1xefzWTBb4snI/JFrCAiFwkWf6/O2nMR7SJ2mIQA3zCvljrlOIxIXks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791978792; c=relaxed/simple;
	bh=N1E+Ragnn5FddJXCM0HOSVhhLvdXbCYcQVKdrhc6bak=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qM89fGJaqm2I9nYeEU4Jr/Rw5o4LqbcqvFn/Q69TqysoE19YplK681FTUM3sdRQsQG7lUZGvUI1tBieIjIaQnV/yFIsJG6wo4Y+HOPk6yg3CnfPltMV1JJ01Q/LzPHvMhyB6GQbVa798ewAD+ADZVywjrjhK1/iMKclpO+pBUNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A8UCBbox; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A8UCBbox"
Received: by smtp.kernel.org (Postfix)
	id B8CB51F00893; Wed, 14 Oct 2026 11:53:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE8021F000FF;
	Wed, 14 Oct 2026 11:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791978785;
	bh=DnMRuX4O2YpqVcRKXzljaOrvYngeB/EhWpb2s7SYyxM=;
	h=From:To:Cc:Subject:Date;
	b=A8UCBboxJBYqK5pUU9aiiYAxJ3HILE24zkfXGEsYRVeE5JMWv+Co3ch+JTEHcBikD
	 oiMijlSvgeu6NFKB65cXfMHrktVq+nQ04p27GdzDH7OcsLGO+CBdRt1+dhmG5IiAPq
	 0dfAQI9uthKhQdCvy3OB52fQp8t61Ftyc8ctw5ZhVllmCdSqqQSXHvJCMvBWraOvOS
	 CpgHZHhQ7NoiljQEPjl7tCiDaPUgPSHioD/b+O4yP2af42QKRaqXc+NbZ0PXO8VSaJ
	 uqztzXVC5X71wk2hhMoxVcj4TIcVzTgR0LI1APco+hsAJy7oTsA6uXpmldGQAKI11B
	 oem+kVzMpT1Eg==
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] review: Refresh series after manually linking a new revision
Date: Wed, 14 Oct 2026 12:49:58 +0100
Message-ID: <20261014115111.303997-1-broonie@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When a new revision is manually linked to an existing series by message ID
the new version is not immediately visible in the UI, you need to do an
update of the series to cause it to become visible and allow the series to
be upgraded. Fix this by forcing an immediate update as part of linking the
series, splitting action_update_one() to separate the UI hook from the
implementation.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 src/b4/review_tui/_tracking_app.py | 19 ++++++--
 src/tests/test_tui_tracking.py     | 74 +++++++++++++++++++++++++++++-
 2 files changed, 87 insertions(+), 6 deletions(-)

diff --git a/src/b4/review_tui/_tracking_app.py b/src/b4/review_tui/_tracking_app.py
index 4ae826e..e202eb0 100644
--- a/src/b4/review_tui/_tracking_app.py
+++ b/src/b4/review_tui/_tracking_app.py
@@ -2635,15 +2635,17 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
             self.notify('No series selected', severity='warning')
             return
 
+        self._update_series(self._selected_series)
+
+    def _update_series(self, series: Dict[str, Any]) -> None:
+        """Fetch thread and update revisions/trailers for a specific series."""
         config = b4.get_main_config()
         linkmask = str(config.get('linkmask', 'https://lore.kernel.org/r/%s'))
         topdir = b4.git_get_toplevel()
 
-        self._focus_change_id = self._selected_series.get('change_id')
+        self._focus_change_id = series.get('change_id')
         self.push_screen(
-            UpdateAllScreen(
-                [self._selected_series], self._identifier, linkmask, topdir
-            ),
+            UpdateAllScreen([series], self._identifier, linkmask, topdir),
             callback=self._on_update_complete,
         )
 
@@ -4322,7 +4324,14 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
         else:
             self.notify(f'Linked v{rev}')
         self._focus_change_id = change_id
-        self._invalidate_caches(change_id)
+        for series in b4.review.tracking.get_all_tracked_series(self._identifier):
+            if (
+                series.get('change_id') == change_id
+                and series.get('status') != 'archived'
+            ):
+                self._update_series(series)
+                return
+        self._invalidate_caches()
         self._load_series()
 
     def _do_switch_revision(
diff --git a/src/tests/test_tui_tracking.py b/src/tests/test_tui_tracking.py
index 03c7f3d..8c18b40 100644
--- a/src/tests/test_tui_tracking.py
+++ b/src/tests/test_tui_tracking.py
@@ -47,6 +47,7 @@ from b4.review_tui._modals import (
     ConfirmScreen,
     HelpScreen,
     LimitScreen,
+    LinkRevisionConfirmScreen,
     LinkRevisionScreen,
     RebaseScreen,
     SnoozeScreen,
@@ -66,6 +67,7 @@ from b4.review_tui._tracking_app import (
     _worktree_for_branch,
 )
 
+from .helpers.mail import MINIMAL_DIFF, make_msg
 from .helpers.tracking import create_review_branch, seed_db
 from .helpers.tui import static_text
 
@@ -1646,7 +1648,7 @@ class TestTrackingSnoozeRemembersChoice:
 
 
 class TestLinkRevisionAction:
-    """The 'link a revision' action is offered and opens the input modal."""
+    """Manually linking a revision updates the thread and revision display."""
 
     @pytest.mark.asyncio
     async def test_link_action_offered_and_dispatches(
@@ -1676,6 +1678,76 @@ class TestLinkRevisionAction:
             assert isinstance(app.screen, LinkRevisionScreen)
             await pilot.press('escape')
 
+    @pytest.mark.asyncio
+    @pytest.mark.parametrize('outcome', ['updated', 'busy', 'cancelled'])
+    async def test_link_refreshes_thread_and_revisions(
+        self, tmp_path: pathlib.Path, outcome: str
+    ) -> None:
+        identifier = 'test-link-refresh'
+        change_id = 'link-1'
+        seed_db(
+            identifier,
+            [
+                {'change_id': 'unrelated'},
+                {
+                    'change_id': change_id,
+                    'subject': '[PATCH] linkable series',
+                    'message_id': 'link-v1@ex.com',
+                    'revisions': [1],
+                },
+            ],
+        )
+        lmbx = b4.LoreMailbox()
+        lmbx.add_message(
+            make_msg('link-v2@ex.com', '[PATCH v2] linkable series', body=MINIMAL_DIFF)
+        )
+        lser = lmbx.get_series()
+        assert lser is not None
+
+        app = TrackingApp(identifier, focus_change_id=change_id)
+        with (
+            patch.object(tracking, 'fetch_series_for_link', return_value=lser),
+            patch.object(
+                b4.review,
+                'update_all_tracking',
+                return_value={'series_checked': 1},
+                side_effect=b4.LockHeldError('busy') if outcome == 'busy' else None,
+            ) as update,
+        ):
+            async with app.run_test(size=(120, 30)) as pilot:
+                await pilot.pause()
+                await pilot.press('a', 'l')
+                await pilot.pause()
+                app.screen.query_one('#link-rev-input', Input).value = 'link-v2@ex.com'
+                await pilot.press('enter')
+                await app.workers.wait_for_complete()
+                await pilot.pause()
+                assert isinstance(app.screen, LinkRevisionConfirmScreen)
+                update.assert_not_called()
+
+                await pilot.press('escape' if outcome == 'cancelled' else 'enter')
+                await app.workers.wait_for_complete()
+                await pilot.pause()
+
+                if outcome == 'cancelled':
+                    update.assert_not_called()
+                    assert 'v2' not in static_text(
+                        app.query_one('#detail-revisions', Static)
+                    )
+                    return
+
+                update.assert_called_once()
+                updated_series = update.call_args.kwargs['series_list']
+                assert [s['change_id'] for s in updated_series] == [change_id]
+                assert app._selected_series is not None
+                assert app._selected_series['change_id'] == change_id
+                assert 'v2' in static_text(app.query_one('#detail-revisions', Static))
+                assert any('v1→v2' in row for row in _rendered_rows(app))
+                await pilot.press('a')
+                await pilot.pause()
+                assert 'upgrade' in _get_action_keys(app)
+                await pilot.press('escape')
+
 
 class TestSeriesLifecycle:
     """End-to-end lifecycle: new → reviewing → waiting → reviewing
-- 
2.47.3

