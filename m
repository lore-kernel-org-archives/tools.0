Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94581DB356
	for <tools@linux.kernel.org>; Tue, 23 Jun 2026 09:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782206835; cv=none; b=UOXBvonp/l+eu5KXYecA6lg0WWNq8hJHSl4HOKQQhRPoKucG5M54iG5224MGzqNKD7VnvsMuWOGKNLOBi0Q8Xyyl8UrgCITXqNRszjOSn3KsayYK0SVRibTmynQbybdm7Z7LvQ5B62Om1oGqESq0J+kLP4vLdrulqfbAi5km5Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782206835; c=relaxed/simple;
	bh=si7EzAA+vZyHxJkWdrMf/cOQxebIAtmTKddsc67dSHo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rxfWwDEiCffPN5COLB9I9pK5joff2dYJKRNJ+iGXp57w/B7sCqPeomTSr5D5MGal5z9xnnGy1DQF0GHA6ZzLCsaoM/LCUWFWRr8ccL8Awrtslqu/RvOq2tQC26ggynitUboCzoLbFEZKTXVJ77YodbRcmYy4+BXqx7M/eXhSnrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KCprbFl6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KCprbFl6"
Received: by smtp.kernel.org (Postfix)
	id 93F1D1F00A3D; Tue, 23 Jun 2026 09:27:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA18C1F000E9;
	Tue, 23 Jun 2026 09:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782206833;
	bh=HiXbHWNV2k0QR8yb0o8HozTl2OY9ZbkqbEfC0dnC1f4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KCprbFl6CPAaAMCYkjSwpy+UvHGRmxi4wT8fXxZwy4ijiS4tFSJyXbcmj6N2P1X2u
	 AxfNuZJmmMpFFd6tz4rPdlznUipTY93wqWxrnRPolauVnq0CSSL+OwdGhX6h+3ENfy
	 Sn0Xsk6zGDTq0Avs7IxEWJFp+j3df9aIXoQfLEeQMYVR8cvGdLIMRGKG9WOi4S2kl0
	 +VhOxr8pqN7LHB9+KgdI2MrmrZZgNJ4DDSo9kYb7/UCHgfCdB9l/fhRmrXLwvCBZpc
	 beZQ3e65kpZVNY189Xzf+skN0n0ftVteNAkz2NCDot5xUHWNs2v5bc0fdFFKA11ix5
	 GZcZ0yYKcNHTg==
From: Christian Brauner <brauner@kernel.org>
Date: Tue, 23 Jun 2026 11:27:06 +0200
Subject: [PATCH b4 2/2] review-tui: test patchwork multi-select and bulk
 state changes
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-20260623-review-tui-pw-multiselect-v1-2-2470add1453c@kernel.org>
References: <20260623-20260623-review-tui-pw-multiselect-v1-0-2470add1453c@kernel.org>
In-Reply-To: <20260623-20260623-review-tui-pw-multiselect-v1-0-2470add1453c@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-2c782
X-Developer-Signature: v=1; a=openpgp-sha256; l=11660; i=brauner@kernel.org;
 h=from:subject:message-id; bh=si7EzAA+vZyHxJkWdrMf/cOQxebIAtmTKddsc67dSHo=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWRZBebG9mmGz/zwr91N8en2dZNs5sfc/tktdL+A9XLmv
 lXvts2J6ShlYRDjYpAVU2RxaDcJl1vOU7HZKFMDZg4rE8gQBi5OAZjIbjtGhs9tF264W4ZOztOt
 Wur3wu7PxAPRm3sOx+cy8xbMOVwUosjIsNbh9ZOaPAF1gV03mPqO8v5jWTZFwEdgAuuxvmPsc7w
 mcwMA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Cover the new selection layer in the Patchwork browser:

- marking: Space marks the highlighted series and advances the cursor,
  toggling clears a single mark, the title shows the count, and the row
  renders a leading '*'; 'a' marks then clears all shown rows; Esc drops
  every mark; a refresh prunes marks for series that have gone away.
- bulk set-state: 's' on several marked series PATCHes every patch across
  them and consumes the marks, while with nothing marked it still acts on
  the highlighted row alone. The Patchwork session is faked, so the tests
  assert which patches were updated without any network access.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/tests/test_tui_pw.py | 245 ++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 244 insertions(+), 1 deletion(-)

diff --git a/src/tests/test_tui_pw.py b/src/tests/test_tui_pw.py
index c244602..2360166 100644
--- a/src/tests/test_tui_pw.py
+++ b/src/tests/test_tui_pw.py
@@ -14,13 +14,14 @@ from typing import Any, Dict, List
 from unittest import mock
 
 import pytest
-from textual.widgets import Label, ProgressBar
+from textual.widgets import Label, ListView, ProgressBar
 
 import b4
 import b4.review
 import b4.review.tracking as tracking
 import liblore
 from b4.review._review import PwFetchResult
+from b4.review_tui._modals import SetStateScreen
 from b4.review_tui._pw_app import PwApp, PwFetchProgress
 
 # ---------------------------------------------------------------------------
@@ -442,3 +443,245 @@ class TestPwLoadingProgress:
             assert bar.total is None
             status = app.query_one('#pw-loading-status', Label)
             assert 'Loading 204 patches' in _static_text(status)
+
+
+# ---------------------------------------------------------------------------
+# Multi-select marking and bulk state changes
+# ---------------------------------------------------------------------------
+
+
+def _mk_series(sid: int, state: str = 'new') -> Dict[str, Any]:
+    """A Patchwork series row carrying two patches."""
+    return {
+        'id': sid,
+        'name': f'series {sid}',
+        'msgid': f's{sid}@example.com',
+        'state': state,
+        'submitter': 'Someone',
+        'date': '2026-06-01T00:00:00',
+        'check': 'pending',
+        'patch_ids': [sid * 10, sid * 10 + 1],
+    }
+
+
+def _pw_states() -> List[Dict[str, Any]]:
+    return [
+        {'slug': 'new', 'name': 'New'},
+        {'slug': 'reviewing', 'name': 'Reviewing'},
+        {'slug': 'accepted', 'name': 'Accepted'},
+    ]
+
+
+class _FakeResp:
+    def raise_for_status(self) -> None:
+        return None
+
+
+class _FakePwSession:
+    """Records PATCH calls so a test can assert which patches were updated."""
+
+    def __init__(self) -> None:
+        self.patched: List[str] = []
+
+    def patch(self, url: str, data: Any = None, stream: bool = False) -> _FakeResp:
+        self.patched.append(url)
+        return _FakeResp()
+
+
+def _install_series(
+    monkeypatch: pytest.MonkeyPatch, series: List[Dict[str, Any]]
+) -> None:
+    monkeypatch.setattr(
+        b4.review,
+        'pw_fetch_series',
+        lambda *a, **k: PwFetchResult(series, len(series), None),
+    )
+    monkeypatch.setattr(b4.review, 'pw_fetch_states', lambda *a, **k: _pw_states())
+    monkeypatch.setattr(b4, 'git_get_toplevel', lambda: None)
+
+
+class TestPwMarkSelection:
+    """Marking series with space/a/Esc tracks ids and renders a leading '*'."""
+
+    @pytest.mark.asyncio
+    async def test_space_marks_and_advances(
+        self, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        _install_series(monkeypatch, [_mk_series(1), _mk_series(2), _mk_series(3)])
+        app = PwApp('k', 'https://pw.example.org', 'proj')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await app.workers.wait_for_complete()
+            await pilot.pause()
+            lv = app.query_one('#pw-list', ListView)
+            assert lv.index == 0
+
+            await pilot.press('space')
+            await pilot.pause()
+            # First series marked and the cursor stepped to the second row.
+            assert app._selected_ids == {1}
+            assert lv.index == 1
+            assert '1 selected' in _static_text(app.query_one('#pw-title'))
+
+            await pilot.press('space')
+            await pilot.pause()
+            assert app._selected_ids == {1, 2}
+
+            # Toggling a marked row clears just that mark.
+            lv.index = 0
+            app.action_toggle_mark()
+            await pilot.pause()
+            assert app._selected_ids == {2}
+
+    @pytest.mark.asyncio
+    async def test_marker_glyph_rendered(self, monkeypatch: pytest.MonkeyPatch) -> None:
+        _install_series(monkeypatch, [_mk_series(1), _mk_series(2)])
+        app = PwApp('k', 'https://pw.example.org', 'proj')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await app.workers.wait_for_complete()
+            await pilot.pause()
+            item = app._get_highlighted_item()
+            assert item is not None
+            assert not _static_text(item.query_one(Label)).startswith('*')
+            app.action_toggle_mark()
+            await pilot.pause()
+            assert _static_text(item.query_one(Label)).startswith('*')
+
+    @pytest.mark.asyncio
+    async def test_mark_all_then_unmark_all(
+        self, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        _install_series(monkeypatch, [_mk_series(1), _mk_series(2), _mk_series(3)])
+        app = PwApp('k', 'https://pw.example.org', 'proj')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await app.workers.wait_for_complete()
+            await pilot.pause()
+            app.action_mark_all()
+            await pilot.pause()
+            assert app._selected_ids == {1, 2, 3}
+            # A second mark-all, with everything already marked, clears them.
+            app.action_mark_all()
+            await pilot.pause()
+            assert app._selected_ids == set()
+
+    @pytest.mark.asyncio
+    async def test_escape_clears_marks(self, monkeypatch: pytest.MonkeyPatch) -> None:
+        _install_series(monkeypatch, [_mk_series(1), _mk_series(2)])
+        app = PwApp('k', 'https://pw.example.org', 'proj')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await app.workers.wait_for_complete()
+            await pilot.pause()
+            app.action_mark_all()
+            await pilot.pause()
+            assert app._selected_ids == {1, 2}
+            await pilot.press('escape')
+            await pilot.pause()
+            assert app._selected_ids == set()
+            assert all(not it.selected for it in app._visible_items())
+
+    @pytest.mark.asyncio
+    async def test_marks_pruned_on_refetch(
+        self, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """A re-fetch keeps marks for surviving series and drops vanished ones."""
+        _install_series(monkeypatch, [_mk_series(1), _mk_series(2), _mk_series(3)])
+        app = PwApp('k', 'https://pw.example.org', 'proj')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await app.workers.wait_for_complete()
+            await pilot.pause()
+            app.action_mark_all()
+            await pilot.pause()
+            assert app._selected_ids == {1, 2, 3}
+            # Series 3 is gone on the next fetch.
+            monkeypatch.setattr(
+                b4.review,
+                'pw_fetch_series',
+                lambda *a, **k: PwFetchResult([_mk_series(1), _mk_series(2)], 2, None),
+            )
+            await app.action_refresh()
+            await app.workers.wait_for_complete()
+            await pilot.pause()
+            assert app._selected_ids == {1, 2}
+
+
+class TestPwBulkSetState:
+    """`s` applies the chosen state to every marked series, else the current."""
+
+    @pytest.mark.asyncio
+    async def test_set_state_applies_to_all_marked(
+        self, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        fake = _FakePwSession()
+        monkeypatch.setattr(
+            b4, 'get_patchwork_session', lambda key, url: (fake, 'https://pw/api')
+        )
+        _install_series(monkeypatch, [_mk_series(1), _mk_series(2), _mk_series(3)])
+        app = PwApp('k', 'https://pw.example.org', 'proj')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await app.workers.wait_for_complete()
+            await pilot.pause()
+            # Mark the first two series (each toggle advances the cursor).
+            app.action_toggle_mark()
+            await pilot.pause()
+            app.action_toggle_mark()
+            await pilot.pause()
+            assert app._selected_ids == {1, 2}
+
+            app.action_set_state()
+            await pilot.pause()
+            assert isinstance(app.screen, SetStateScreen)
+            await app.screen.dismiss(('reviewing', False))
+            await pilot.pause()
+            await app.workers.wait_for_complete()
+            await pilot.pause()
+
+            by_id = {s['id']: s for s in app._all_series}
+            assert by_id[1]['state'] == 'reviewing'
+            assert by_id[2]['state'] == 'reviewing'
+            # The unmarked third series is untouched.
+            assert by_id[3]['state'] == 'new'
+            # One PATCH per patch across the two marked series.
+            assert len(fake.patched) == 4
+            # Marks are consumed once applied.
+            assert app._selected_ids == set()
+
+    @pytest.mark.asyncio
+    async def test_set_state_falls_back_to_highlighted(
+        self, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        fake = _FakePwSession()
+        monkeypatch.setattr(
+            b4, 'get_patchwork_session', lambda key, url: (fake, 'https://pw/api')
+        )
+        _install_series(monkeypatch, [_mk_series(1), _mk_series(2)])
+        app = PwApp('k', 'https://pw.example.org', 'proj')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await app.workers.wait_for_complete()
+            await pilot.pause()
+            # No marks: act on the highlighted (second) row only.
+            app.query_one('#pw-list', ListView).index = 1
+            app.action_set_state()
+            await pilot.pause()
+            await app.screen.dismiss(('accepted', False))
+            await pilot.pause()
+            await app.workers.wait_for_complete()
+            await pilot.pause()
+
+            by_id = {s['id']: s for s in app._all_series}
+            assert by_id[1]['state'] == 'new'
+            assert by_id[2]['state'] == 'accepted'
+            assert len(fake.patched) == 2
+
+    @pytest.mark.asyncio
+    async def test_set_state_needs_states_loaded(
+        self, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        _install_series(monkeypatch, [_mk_series(1)])
+        app = PwApp('k', 'https://pw.example.org', 'proj')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await app.workers.wait_for_complete()
+            await pilot.pause()
+            # States never arrived: the action warns and opens nothing.
+            app._states = []
+            app.action_set_state()
+            await pilot.pause()
+            assert not isinstance(app.screen, SetStateScreen)

-- 
2.53.0

