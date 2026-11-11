Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794402778;
	b=Hj34Gj5Pzexeac0SlnW9nlrt4bNLW8FvGaSLkhCEAQPl9+HtsEEtq8lkpzbAQeCLNvsc
	 D7Mhz5L87Cp1eZUT1BQRZ2eVMosMkRb1kFcFcHWhdlmNlW938M+pPBDvyd9w1dczCDfYX
	 vFYfpjEDAI0h/+tigsqimTPp5YENHXZC3NWmRR+hDtMcClz+fsdibjzAuBKvsd3PfepAF
	 TIbtKtGm/QZo+JM1wDIwCDdJFM3AgOED52NIiNEVzdnAaEJbOflkrY7/ZN/KLHJUhsJLX
	 MQSLOCbR/s30dld835y+eWDviq3tLRiV7d4MJZCrpn7PY4VLNQR+k7N8D0YBqGKl0kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402778;
	h=Received:Delivered-To:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=07yrtiHPG/rNm2svdoSxhqUi4iN+xeKYhGzQBGhT3Lw=;
	b=z8mhTmRv3zf0Nk0YCoYtfkWiLrmAoafJtGc5xKJMun9n5K9jhbpgpOBitwlyFTD8MrYm
	 DdGcM4Ztkds1Oyi2nJURIaq1ZhdCpcrS2HPfw99T7t5AF8MZskpsdjK6kmRgw02TeF51Z
	 UvCsJsqa9jvONcDkk6953dxAwtu9CAxvj9D1VHUgogNuGfniDQxmprlSUzeXwU30V7V57
	 149u1MtqpmH7VfN4kOgbE/a+wWOU2mhxWI41FMvCbDeTvu2xnEp2d8+/gokgx1M5UWZXQ
	 z07EhzZcwcmBeUwYGwCZEOCJ2f0NT4DEH+wXESOzPZwKLVc5VkOe20v0s9lfP/5BCYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AjKC3cx8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75803606A327
	for <tools@linux.kernel.org>; Wed, 11 Nov 2026 13:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AjKC3cx8
Received: by smtp.kernel.org (Postfix)
	id 667461F00A0A; Wed, 11 Nov 2026 13:12:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E79B1F00A05;
	Wed, 11 Nov 2026 13:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794402778;
	bh=07yrtiHPG/rNm2svdoSxhqUi4iN+xeKYhGzQBGhT3Lw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=AjKC3cx8so9D5uif/DRMY46yDOP7HB+OsGhO7XdMCTxxDmd3O3VMnm0/eCCInCp7j
	 qlB6/HeR8eOMJjptuv7On1ILIz2c9VxHEdcSeo9YJ0aG/T9Ro6IEYCSUgccBQi8jVa
	 WlSRYH113R8MX92CMvrgbKcwRCTqIx+jz5RhutDiUNdYIn7Kx1Gl2Njx2mCeZFGkbs
	 txxop3i0GDRF7VRa3Q+aFVcvQIJlBqij3/6VHPr3y1x031Pxt214D7EJ1eNQS9ajxi
	 MZCAv1ABF8FMYJcGQaE27y525ZsVvPaUqYB4g5ZAdCO1Ghnlnq5jzAucoO/hadeoj9
	 UhNcWbSVNBCXA==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 11 Nov 2026 13:12:43 +0000
Subject: [PATCH b4 2/2] review: tui: Show series notes when there is no
 cover letter
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-notes-no-cover-v1-2-b9b0d883742b@kernel.org>
References: <20261111-notes-no-cover-v1-0-b9b0d883742b@kernel.org>
In-Reply-To: <20261111-notes-no-cover-v1-0-b9b0d883742b@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=16862; i=broonie@kernel.org;
 h=from:subject:message-id; bh=wcGLohFaYM4NMrY2I6EQiI2ofH3VT/2c4n4vSILTC14=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLK+ZF6VYNFkZll9ffsHu1Obt85+v7b0dMN+y7UJPrdto
 72Me9QndJSyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAiN34y/I/cvbjsS0/3rzc5
 DGvP9T8WW+zH8UNyTsg+Lu3/Lcc05Z8x/I+6aGexeWv8gy/3Tr+8NM9AaelLkdKba8Ima9wynlz
 ycSsfAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

Series without a cover letter hide the series entry in the patch list,
leaving agent notes stored in series.reviews inaccessible. This mainly
impacts single patches but will also affect any multi-patch serieses
that are sent without a cover letter.

Show series notes alongside the selected patch's notes in the review
summary and notes viewer, labelled (series). Keep each review in its
original tracking dictionary so notes from the same reviewer remain
separate and existing stored reviews need no migration.

Editing still changes the current patch's note. Delete all removes the
notes displayed from both targets while preserving comments, trailers
and notes on other patches. Keep cover-letter behaviour unchanged.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 docs/maintainer/review.rst         |   5 +
 src/b4/review_tui/_review_app.py   |  68 ++++++++---
 src/tests/test_tui_review_notes.py | 240 +++++++++++++++++++++++++++++++++++++
 3 files changed, 297 insertions(+), 16 deletions(-)

diff --git a/docs/maintainer/review.rst b/docs/maintainer/review.rst
index 5a3e9d9..1a9a076 100644
--- a/docs/maintainer/review.rst
+++ b/docs/maintainer/review.rst
@@ -446,6 +446,11 @@ Key                        Action
 ``Q``                      Quit (bare ``q`` only shows a reminder)
 =========================  =============================================
 
+For series without a cover letter, the notes viewer (``N``) and review
+summary also show series-level notes alongside the selected patch's notes.
+These are labelled ``(series)``. Editing changes your note on the selected
+patch; deleting all notes removes all notes shown in the viewer.
+
 **Email preview mode keybindings**
 
 ==========  ============================================================
diff --git a/src/b4/review_tui/_review_app.py b/src/b4/review_tui/_review_app.py
index 455a73a..c4ab642 100644
--- a/src/b4/review_tui/_review_app.py
+++ b/src/b4/review_tui/_review_app.py
@@ -913,6 +913,8 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
                 header = 'Your review'
             else:
                 header = review.get('name', rev_email)
+            if review_target is not target:
+                header += ' (series)'
 
             if has_content:
                 text.append('\n')
@@ -1013,13 +1015,32 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
     def _get_display_reviews(
         self, target: Dict[str, Any]
     ) -> List[Tuple[str, Dict[str, Any], Dict[str, Any]]]:
-        """Return reviews and their targets, with the current user's review first."""
-        reviews = target.get('reviews', {})
+        """Reviews to display, with their original targets for attribution.
+
+        Without a cover letter there is no series entry in the patch list.
+        Show its notes alongside each patch, keeping the review data separate
+        so the same reviewer can have both a patch note and a series note.
+        """
+        targets = [target]
+        if not self._has_cover and target is not self._series:
+            targets.append(self._series)
         my_email = str(self._usercfg.get('email', ''))
-        return [
-            (addr, reviews[addr], target)
-            for addr in sorted(reviews, key=lambda addr: (addr != my_email, addr))
-        ]
+        entries: List[Tuple[str, Dict[str, Any], Dict[str, Any]]] = []
+        for review_target in targets:
+            reviews = review_target.get('reviews', {})
+            for addr in sorted(reviews, key=lambda addr: (addr != my_email, addr)):
+                review = reviews[addr]
+                if review_target is not target:
+                    # Only notes belong in this extra display: comments and
+                    # trailers remain attached to the message they refer to.
+                    if not review.get('note'):
+                        continue
+                    review = {
+                        'name': review.get('name', addr),
+                        'note': review['note'],
+                    }
+                entries.append((addr, review, review_target))
+        return entries
 
     def _ensure_review(self, target: Dict[str, Any]) -> Dict[str, Any]:
         """Return the current user's review sub-dict, creating it if needed."""
@@ -1546,6 +1567,8 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
             else:
                 name = review.get('name', rev_email)
                 header = name
+            if review_target is not target:
+                header += ' (series)'
             colour = self._reviewer_colour(rev_email, review_target, ts)
             note_entries.append((header, colour, note))
 
@@ -1558,7 +1581,12 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
                 )
                 self._edit_note_in_editor(target, my_note)
             elif result == '__DELETE__':
-                self._delete_all_notes(target)
+                self._delete_all_notes(
+                    target,
+                    include_series=any(
+                        t is not target for _a, _r, t in display_reviews
+                    ),
+                )
 
         self.push_screen(NoteScreen(note_entries), _on_note)
 
@@ -1602,15 +1630,22 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
         else:
             self.notify('Note deleted')
 
-    def _delete_all_notes(self, target: Dict[str, Any]) -> None:
-        """Delete notes from all reviewers on *target*."""
-        all_reviews = target.get('reviews', {})
+    def _delete_all_notes(
+        self, target: Dict[str, Any], include_series: bool = False
+    ) -> None:
+        """Delete all displayed notes from their original review targets."""
+        targets = [target]
+        if include_series:
+            targets.append(self._series)
         changed = False
-        for review in all_reviews.values():
-            if 'note' in review:
-                del review['note']
-                changed = True
-        if changed:
+        for note_target in targets:
+            all_reviews = note_target.get('reviews', {})
+            if not any('note' in review for review in all_reviews.values()):
+                continue
+            for review in all_reviews.values():
+                if 'note' in review:
+                    del review['note']
+                    changed = True
             # Clean up any reviewers that now have empty data
             my_email = self._usercfg.get('email', '')
             for addr in list(all_reviews):
@@ -1622,9 +1657,10 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
                     or rev.get('note', '')
                 ):
                     if addr == my_email:
-                        b4.review._cleanup_review(target, self._usercfg)
+                        b4.review._cleanup_review(note_target, self._usercfg)
                     else:
                         del all_reviews[addr]
+        if changed:
             self._save_tracking()
             self._refresh_patch_item(self._selected_idx)
             self._show_content(self._selected_idx)
diff --git a/src/tests/test_tui_review_notes.py b/src/tests/test_tui_review_notes.py
new file mode 100644
index 0000000..0802db4
--- /dev/null
+++ b/src/tests/test_tui_review_notes.py
@@ -0,0 +1,240 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+"""Series notes remain accessible when a review has no cover letter."""
+
+import copy
+from typing import Any, Dict
+from unittest import mock
+
+import pytest
+
+pytest.importorskip('textual')
+
+from textual.widgets import Static
+
+import b4.review
+from b4.review._review import NO_COVER_NOTE
+from b4.review_tui._modals import NoteScreen
+from b4.review_tui._review_app import ReviewApp
+
+from .test_tui_review import _build_session, _create_review_branch_with_patches
+
+AGENT = 'agent@example.com'
+SERIES_NOTE = 'Series summary.\n\nA detailed observation about the whole series.'
+
+
+def _session(gitdir: str, count: int = 1, *, has_cover: bool = False) -> Dict[str, Any]:
+    branch, _shas = _create_review_branch_with_patches(
+        gitdir, 'coverless-notes', [f'Patch {i}' for i in range(1, count + 1)]
+    )
+    session = _build_session(gitdir, branch)
+    if not has_cover:
+        session['cover_text'] = f'Patch series\n\n{NO_COVER_NOTE}'
+    session['series']['reviews'] = {
+        AGENT: {'name': 'Review Agent', 'source': 'agent', 'note': SERIES_NOTE}
+    }
+    return session
+
+
+def _stored_app(session: Dict[str, Any]) -> ReviewApp:
+    assert b4.review.save_tracking_ref(
+        session['topdir'], session['branch'], session['cover_text'], session['tracking']
+    )
+    return ReviewApp(_build_session(session['topdir'], session['branch']))
+
+
+def _overlay_text(app: ReviewApp) -> str:
+    overlay = app.query_one('#trailer-overlay', Static)
+    with mock.patch.object(overlay, 'update', wraps=overlay.update) as update:
+        app._refresh_trailer_overlay()
+    assert overlay.display
+    return str(update.call_args.args[0])
+
+
+@pytest.mark.asyncio
+async def test_coverless_series_only_note_visible_without_moving_stored_data(
+    gitdir: str,
+) -> None:
+    session = _session(gitdir)
+    app = _stored_app(session)
+    before = copy.deepcopy(app._tracking)
+    ecode, original_tip = b4.git_run_command(gitdir, ['rev-parse', app._branch])
+    assert ecode == 0
+
+    async with app.run_test(size=(120, 30)) as pilot:
+        await pilot.pause()
+        assert app._selected_idx == 1
+        overlay = _overlay_text(app)
+        assert 'Review Agent (series)' in overlay
+        assert 'Series summary.' in overlay
+        assert 'view full note with N' in overlay
+        with mock.patch.object(app, '_edit_note_in_editor') as editor:
+            await pilot.press('N')
+            await pilot.pause()
+            editor.assert_not_called()
+        assert isinstance(app.screen, NoteScreen)
+        assert [(h, n) for h, _colour, n in app.screen._note_entries] == [
+            ('Review Agent (series)', SERIES_NOTE)
+        ]
+        await pilot.press('escape')
+        await pilot.pause()
+        assert app._tracking == before
+
+    _, stored = b4.review.load_tracking(gitdir, app._branch)
+    assert stored == before
+    assert b4.git_run_command(gitdir, ['rev-parse', app._branch]) == (0, original_tip)
+
+
+@pytest.mark.asyncio
+async def test_coverless_series_note_shown_with_each_patch_without_merging_reviewer(
+    gitdir: str,
+) -> None:
+    session = _session(gitdir, 2)
+    for idx, patch in enumerate(session['patches'], 1):
+        patch['reviews'] = {
+            AGENT: {'name': 'Review Agent', 'note': f'Patch {idx} observation.'}
+        }
+    app = _stored_app(session)
+
+    async with app.run_test(size=(120, 30)) as pilot:
+        await pilot.pause()
+        for idx in (1, 2):
+            app._show_content(idx)
+            await pilot.pause()
+            overlay = _overlay_text(app)
+            assert 'Series summary.' in overlay
+            assert f'Patch {idx} observation.' in overlay
+            assert f'Patch {3 - idx} observation.' not in overlay
+            await pilot.press('N')
+            await pilot.pause()
+            assert isinstance(app.screen, NoteScreen)
+            assert [(h, n) for h, _colour, n in app.screen._note_entries] == [
+                ('Review Agent', f'Patch {idx} observation.'),
+                ('Review Agent (series)', SERIES_NOTE),
+            ]
+            await pilot.press('escape')
+            await pilot.pause()
+
+
+@pytest.mark.asyncio
+async def test_real_cover_keeps_series_notes_separate(gitdir: str) -> None:
+    session = _session(gitdir, has_cover=True)
+    session['patches'][0]['reviews'] = {
+        AGENT: {'name': 'Review Agent', 'note': 'Patch observation.'}
+    }
+    app = _stored_app(session)
+
+    async with app.run_test(size=(120, 30)) as pilot:
+        await pilot.pause()
+        for idx, expected, excluded in (
+            (0, SERIES_NOTE, 'Patch observation.'),
+            (1, 'Patch observation.', 'Series summary.'),
+        ):
+            app._show_content(idx)
+            await pilot.pause()
+            overlay = _overlay_text(app)
+            assert expected.splitlines()[0] in overlay
+            assert excluded not in overlay
+            assert '(series)' not in overlay
+            await pilot.press('N')
+            await pilot.pause()
+            assert isinstance(app.screen, NoteScreen)
+            assert [(h, n) for h, _colour, n in app.screen._note_entries] == [
+                ('Review Agent', expected)
+            ]
+            await pilot.press('escape')
+            await pilot.pause()
+
+
+@pytest.mark.asyncio
+@pytest.mark.parametrize('existing_patch_note', ['', 'My patch note.'])
+async def test_edit_from_combined_notes_edits_current_patch_only(
+    gitdir: str, existing_patch_note: str
+) -> None:
+    session = _session(gitdir)
+    my_email = str(session['usercfg']['email'])
+    session['series']['reviews'][my_email] = {
+        'name': 'Maintainer',
+        'note': 'My series note.',
+    }
+    if existing_patch_note:
+        session['patches'][0]['reviews'] = {
+            my_email: {'name': 'Maintainer', 'note': existing_patch_note}
+        }
+    app = _stored_app(session)
+    series_before = copy.deepcopy(app._series)
+
+    async with app.run_test(size=(120, 30)) as pilot:
+        await pilot.pause()
+        await pilot.press('N')
+        await pilot.pause()
+        assert isinstance(app.screen, NoteScreen)
+        with mock.patch(
+            'b4.review_tui._review_app.suspend_and_edit',
+            return_value=b'Updated patch note.',
+        ) as edit:
+            await pilot.press('e')
+            await pilot.pause()
+        edit.assert_called_once()
+        editor_text = edit.call_args.args[1].decode()
+        assert editor_text == existing_patch_note + app._NOTE_FOOTER
+        assert app._patches[0]['reviews'][my_email]['note'] == 'Updated patch note.'
+        assert app._series == series_before
+
+    _, stored = b4.review.load_tracking(gitdir, app._branch)
+    assert stored['series'] == series_before
+    assert stored['patches'][0]['reviews'][my_email]['note'] == 'Updated patch note.'
+
+
+@pytest.mark.asyncio
+async def test_delete_removes_displayed_notes_and_preserves_other_review_data(
+    gitdir: str,
+) -> None:
+    session = _session(gitdir, 2)
+    my_email = str(session['usercfg']['email'])
+    comment = {'path': 'file1.txt', 'line': 1, 'text': 'Keep this inline comment.'}
+    trailer = 'Reviewed-by: Maintainer <maintainer@example.com>'
+    session['series']['reviews'][AGENT]['comments'] = [comment]
+    session['series']['reviews'][my_email] = {
+        'name': 'Maintainer',
+        'note': 'My series note.',
+        'trailers': [trailer],
+    }
+    session['patches'][0]['reviews'] = {
+        AGENT: {
+            'name': 'Review Agent',
+            'note': 'Patch observation.',
+            'comments': [comment],
+        },
+        my_email: {
+            'name': 'Maintainer',
+            'note': 'My patch note.',
+            'trailers': [trailer],
+        },
+        'other@example.com': {'name': 'Other', 'note': 'A note with no other data.'},
+    }
+    session['patches'][1]['reviews'] = {
+        AGENT: {'name': 'Review Agent', 'note': 'Keep other patch note.'}
+    }
+    app = _stored_app(session)
+    expected = copy.deepcopy(app._tracking)
+    for target in (expected['series'], expected['patches'][0]):
+        for review in target['reviews'].values():
+            review.pop('note', None)
+    del expected['patches'][0]['reviews']['other@example.com']
+
+    async with app.run_test(size=(120, 30)) as pilot:
+        await pilot.pause()
+        await pilot.press('N')
+        await pilot.pause()
+        assert isinstance(app.screen, NoteScreen)
+        await pilot.press('d')
+        await pilot.pause()
+        assert app._tracking == expected
+        overlay = _overlay_text(app)
+        assert 'Series summary.' not in overlay
+        assert 'Patch observation.' not in overlay
+        assert '1 comments across 1 files' in overlay
+        assert 'Reviewed-by' in overlay
+
+    _, stored = b4.review.load_tracking(gitdir, app._branch)
+    assert stored == expected

-- 
2.47.3

