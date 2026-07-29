Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B028043E4BE
	for <tools@linux.kernel.org>; Wed, 29 Jul 2026 08:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785315517; cv=none; b=R42U6ULFN6A8jFrRbknyFlZmkOjaa5TEy8zm2MupZ+o1HUdJ45gS6IaVrrXbWn5UFW0NhuGD3Z0rKM2KtcQeIrS910e3gtH4MP0zv6geC2pLLmOhHe2mjqVuhF+h+9/QlFPIOSLGmWo7UuRYAOIppZEMsMZlWdr8pzj5ggAMxK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785315517; c=relaxed/simple;
	bh=eB70VBQQfwzUsmoOqPGgR9zpuEAEVor5qRFwDOwjdAo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NUg2LghlyUMQsYEP6JRKDJYIIdVDxE9LsdxZXfqHcaVNPxFl29nil0rpfcj6D7BMrRbEUwimCwELAVRWOtFYDZSpkuDIKEhDrr2aVveN28nai6blhgbJ5CB8s7+kK07/VlnkwP4cF2iqOTRi1+YDe25zcweBeIHnOFeWHbrAhpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AV01APga; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AV01APga"
Received: by smtp.kernel.org (Postfix)
	id D07F61F00A3D; Wed, 29 Jul 2026 08:58:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC0A41F000E9;
	Wed, 29 Jul 2026 08:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785315511;
	bh=+x+qZ89/1AMvjUpwz3fN6s/jTqwalWPpRSD/n4IOy+M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=AV01APgaJdn3XOSqNOA68+iReY4tGFiBO8in985VwC3WYNCeLWcuSoQZyaTO2n10n
	 9pkYvnCIT4/fTXnQ788OpkcqVgp7S04akpw0LF9uE+CgOTbWwEqMV3LoWEAUaULsOE
	 nD3htlvi8g27A8bDS0WmMKqRK6BAgEV6RItgkM6SkgDFw1Ik8fgjG0i0Fwl/pSudUz
	 /uvF6lG1D9Q+nZtB3Jo7OkWvVetKvsvMjbzRVEP3lqOa5b/duhAZhAJZJPw/5B3L6l
	 dmS3A1Ci6JZJdUv689C8VsU7Rf2UaHsysnP+IKiz0658cBXKdJaZSuzPxeppVNtQJN
	 /675pduVmYRqg==
From: Christian Brauner <brauner@kernel.org>
Date: Wed, 29 Jul 2026 10:58:18 +0200
Subject: [PATCH b4 2/2] b4 review: test cover-letter titling on the update
 path
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-work-b4-cover-subject-v1-2-718507ed317b@kernel.org>
References: <20260729-work-b4-cover-subject-v1-0-718507ed317b@kernel.org>
In-Reply-To: <20260729-work-b4-cover-subject-v1-0-718507ed317b@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-99fe1
X-Developer-Signature: v=1; a=openpgp-sha256; l=15243; i=brauner@kernel.org;
 h=from:subject:message-id; bh=eB70VBQQfwzUsmoOqPGgR9zpuEAEVor5qRFwDOwjdAo=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWRlHtjCFntg+o/Ml0+f/Hb5+HWWTBprv8Gr9VHrb3TEz
 mzeso+Vs6OUhUGMi0FWTJHFod0kXG45T8Vmo0wNmDmsTCBDGLg4BWAiN+IZ/pmFBXp7G3o8Dr97
 L1zVam9/GM95Vb72uVrnr0zZoagzaTvD/+DH2tv/Mwdrmz4WD9ZmDT9+PfbH6+/PcrT/aa/vren
 P4AEA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Cover the second revision-identification path, which had no tests of
its own: update_series_tracking() must name a newly discovered
revision after its cover letter, and must repair a series row that an
upgrade left titled after patch 1/N.

The integration tests drive the real code with real messages instead
of a mocked LoreMailbox -- a mock cannot tell a raw LoreSeries from a
get_series()'d one, and that distinction is the bug. Split a
_series_msgs() helper out of _build_lmbx() so the same series shape
feeds both a mailbox and a plain message list.

The unit tests pin realign_series_subject() to the contract that makes
it safe to run on every update: re-title from a cover letter, leave a
prefix-only formatting difference alone, and never write back the
first-patch fallback when the fetched thread has no cover -- that
would mis-title every coverless series.

At the TUI layer, assert the upgrade dialog shows and stores the
resolved series' own title rather than the stale catalog subject, and
falls back to the catalog when the resolved series never learned its
title and reports '(untitled)'.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/tests/test_review_tracking.py | 204 ++++++++++++++++++++++++++++++++++++--
 src/tests/test_tui_tracking.py    |  91 ++++++++++++++++-
 2 files changed, 284 insertions(+), 11 deletions(-)

diff --git a/src/tests/test_review_tracking.py b/src/tests/test_review_tracking.py
index 1eeb41e..ae6a732 100644
--- a/src/tests/test_review_tracking.py
+++ b/src/tests/test_review_tracking.py
@@ -2623,8 +2623,10 @@ class TestUpdateSeriesTrackingCounts:
         v1_mock = mock.Mock()
         v1_mock.revision = 1
         v1_mock.patches = [v1_patch, None, None, None]
+        v1_mock.fingerprint = None
         mock_lmbx = mock.Mock()
         mock_lmbx.series = {1: v1_mock}
+        mock_lmbx.covers = {}
         mock_lmbx.get_series.return_value = None
 
         series_dict: Dict[str, Any] = {
@@ -3514,16 +3516,11 @@ def _pos_diff(n: int) -> str:
     )
 
 
-def _build_lmbx(
+def _series_msgs(
     base: str, author: str, rev: int, n: int, cover: bool = False
-) -> 'b4.LoreMailbox':
-    """Build a LoreMailbox holding one n-patch series at the given revision.
-
-    With *cover*, a 0/n cover letter is included; it lands in the mailbox's
-    parse-time ``covers`` dict (never injected into the series, since these
-    tests do not run ``get_series()``).
-    """
-    lmbx = b4.LoreMailbox()
+) -> list[EmailMessage]:
+    """Return the messages making up an n-patch series at the given revision."""
+    msgs: list[EmailMessage] = []
     if cover:
         msg = EmailMessage()
         msg['Subject'] = f'[PATCH v{rev} 0/{n}] {base}: do things better'
@@ -3531,7 +3528,7 @@ def _build_lmbx(
         msg['Date'] = 'Thu, 19 Mar 2026 08:51:10 +0530'
         msg['Message-Id'] = f'<{base}-v{rev}-p0@example.com>'
         msg.set_payload('This series makes things better.\n')
-        lmbx.add_message(msg)
+        msgs.append(msg)
     for i in range(1, n + 1):
         msg = EmailMessage()
         msg['Subject'] = f'[PATCH v{rev} {i}/{n}] {base}: part {i}'
@@ -3539,6 +3536,21 @@ def _build_lmbx(
         msg['Date'] = 'Thu, 19 Mar 2026 08:51:12 +0530'
         msg['Message-Id'] = f'<{base}-v{rev}-p{i}@example.com>'
         msg.set_payload(_pos_diff(i))
+        msgs.append(msg)
+    return msgs
+
+
+def _build_lmbx(
+    base: str, author: str, rev: int, n: int, cover: bool = False
+) -> 'b4.LoreMailbox':
+    """Build a LoreMailbox holding one n-patch series at the given revision.
+
+    With *cover*, a 0/n cover letter is included; it lands in the mailbox's
+    parse-time ``covers`` dict (never injected into the series, since these
+    tests do not run ``get_series()``).
+    """
+    lmbx = b4.LoreMailbox()
+    for msg in _series_msgs(base, author, rev, n, cover=cover):
         lmbx.add_message(msg)
     return lmbx
 
@@ -3750,6 +3762,178 @@ class TestRecordDiscoveredCoverSubject:
         assert r6['subject'] == 'Manually linked subject'
 
 
+class TestUpdateSeriesTrackingCoverSubject:
+    """[u]pdate discovers revisions too, and must name them the same way.
+
+    update_series_tracking() recorded them by hand instead of going through
+    _record_discovered_revisions(), so it kept picking the first present patch
+    of a raw LoreSeries (bug 8bb6e4c).  That is the path the TUI actually runs,
+    so an upgrade re-titled the series after patch 1/N.
+    """
+
+    def _update(
+        self, identifier: str, change_id: str, revision: int, msgs: list[EmailMessage]
+    ) -> Dict[str, Any]:
+        series: Dict[str, Any] = {
+            'change_id': change_id,
+            'revision': revision,
+            'status': 'new',
+            'message_id': f'thing-v{revision}-p0@example.com',
+        }
+        with (
+            mock.patch('b4.review._review.retrieve_series_messages', return_value=msgs),
+            mock.patch('b4.review._review.check_series_attestation', return_value=None),
+        ):
+            return b4.review.update_series_tracking(
+                series, identifier, 'https://example.com/%s'
+            )
+
+    def test_discovered_revision_named_after_cover(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        identifier = 'ust-cover'
+        change_id = 'cid-U'
+        conn = review_tracking.init_db(identifier)
+        review_tracking.add_series_to_db(
+            conn,
+            change_id,
+            1,
+            'thing: do things better',
+            'Author',
+            'author@example.com',
+            '2026-03-19T08:51:10+00:00',
+            'thing-v1-p0@example.com',
+            3,
+        )
+        review_tracking.add_revision(
+            conn,
+            change_id,
+            1,
+            'thing-v1-p0@example.com',
+            subject='[PATCH v1 0/3] thing: do things better',
+        )
+        conn.close()
+
+        msgs = _series_msgs('thing', _AUTHOR, 1, 3, cover=True)
+        msgs += _series_msgs('thing', _AUTHOR, 2, 3, cover=True)
+        result = self._update(identifier, change_id, 1, msgs)
+
+        assert result['error'] is None
+        assert result['new_revisions'] == 1
+        conn = review_tracking.get_db(identifier)
+        revs = review_tracking.get_revisions(conn, change_id)
+        conn.close()
+        r2 = next(r for r in revs if r['revision'] == 2)
+        assert r2['subject'] == '[PATCH v2 0/3] thing: do things better'
+        assert r2['message_id'] == 'thing-v2-p0@example.com'
+
+    def test_stale_series_title_is_realigned(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        """A series an upgrade left titled after patch 1/N heals on update."""
+        identifier = 'ust-realign'
+        change_id = 'cid-V'
+        conn = review_tracking.init_db(identifier)
+        review_tracking.add_series_to_db(
+            conn,
+            change_id,
+            2,
+            '[PATCH v2 1/3] thing: part 1',
+            'Author',
+            'author@example.com',
+            '2026-03-19T08:51:12+00:00',
+            'thing-v2-p1@example.com',
+            3,
+        )
+        review_tracking.add_revision(
+            conn,
+            change_id,
+            2,
+            'thing-v2-p1@example.com',
+            subject='[PATCH v2 1/3] thing: part 1',
+        )
+        conn.close()
+
+        msgs = _series_msgs('thing', _AUTHOR, 2, 3, cover=True)
+        result = self._update(identifier, change_id, 2, msgs)
+
+        assert result['error'] is None
+        conn = review_tracking.get_db(identifier)
+        row = conn.execute(
+            'SELECT subject FROM series WHERE change_id = ? AND revision = ?',
+            (change_id, 2),
+        ).fetchone()
+        conn.close()
+        assert row['subject'] == '[PATCH v2 0/3] thing: do things better'
+
+
+class TestRealignSeriesSubject:
+    """realign_series_subject() re-titles only from an actual cover letter."""
+
+    def _seed(self, identifier: str, series_subject: str) -> None:
+        conn = review_tracking.init_db(identifier)
+        review_tracking.add_series_to_db(
+            conn,
+            'cid-A',
+            3,
+            series_subject,
+            'Author',
+            'author@example.com',
+            '2026-03-19T08:51:10+00:00',
+            'thing-v3-p1@example.com',
+            2,
+        )
+        conn.close()
+
+    def _realign(self, identifier: str, cover: bool) -> bool:
+        lmbx = _build_lmbx('thing', _AUTHOR, 3, 2, cover=cover)
+        conn = review_tracking.get_db(identifier)
+        ret = review_tracking.realign_series_subject(conn, 'cid-A', 3, lmbx)
+        conn.close()
+        return ret
+
+    def _subject(self, identifier: str) -> str:
+        conn = review_tracking.get_db(identifier)
+        row = conn.execute(
+            "SELECT subject FROM series WHERE change_id = 'cid-A'"
+        ).fetchone()
+        conn.close()
+        return str(row['subject'])
+
+    def test_realigns_first_patch_title(self, tmp_path: pytest.TempPathFactory) -> None:
+        self._seed('rsj-fix', '[PATCH v3 1/2] thing: part 1')
+        assert self._realign('rsj-fix', cover=True) is True
+        assert self._subject('rsj-fix') == '[PATCH v3 0/2] thing: do things better'
+
+    def test_prefix_only_difference_is_left_alone(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        """The track and upgrade paths format the prefix differently."""
+        self._seed('rsj-pfx', 'thing: do things better')
+        assert self._realign('rsj-pfx', cover=True) is False
+        assert self._subject('rsj-pfx') == 'thing: do things better'
+
+    def test_coverless_thread_never_overwrites(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        """Without a cover there is nothing better than what is stored.
+
+        Re-titling from the first-patch fallback would corrupt every correctly
+        titled row whose cover letter is not in the fetched thread.
+        """
+        self._seed('rsj-nocover', 'thing: do things better')
+        assert self._realign('rsj-nocover', cover=False) is False
+        assert self._subject('rsj-nocover') == 'thing: do things better'
+
+    def test_missing_series_row_is_a_noop(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        conn = review_tracking.init_db('rsj-none')
+        lmbx = _build_lmbx('thing', _AUTHOR, 3, 2, cover=True)
+        assert review_tracking.realign_series_subject(conn, 'cid-A', 3, lmbx) is False
+        conn.close()
+
+
 class TestCmdTrackRethreadUpgrade:
     """Layer 2 (integration): rethreaded vN+1 links onto a tracked vN."""
 
diff --git a/src/tests/test_tui_tracking.py b/src/tests/test_tui_tracking.py
index 8df38db..cd41d69 100644
--- a/src/tests/test_tui_tracking.py
+++ b/src/tests/test_tui_tracking.py
@@ -3363,7 +3363,10 @@ class TestDetectInitialBase:
 
 
 def _make_mock_lser(
-    revision: int = 2, expected: int = 1, complete: bool = False
+    revision: int = 2,
+    expected: int = 1,
+    complete: bool = False,
+    subject: str = '(untitled)',
 ) -> b4.LoreSeries:
     """Build a minimal LoreSeries usable by _on_update_* callbacks.
 
@@ -3374,6 +3377,7 @@ def _make_mock_lser(
 
     lser = b4.LoreSeries(revision, expected)
     lser.complete = complete
+    lser.subject = subject
     lser.fromname = 'Test Author'
     lser.fromemail = 'test@example.com'
     mock_patch = MagicMock()
@@ -3538,6 +3542,91 @@ class TestUpdateRevisionWorkflow:
 
             assert isinstance(app.screen, BaseSelectionScreen)
 
+    @pytest.mark.asyncio
+    async def test_prepared_prefers_series_own_title(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        """The fetched series' title wins over a stale catalog subject.
+
+        Regression (bug 8bb6e4c): the catalog may name patch 1/N when the
+        revision was recorded before its cover letter was seen, and the
+        upgrade carried that through to the series list.
+        """
+        identifier = 'test-update-title'
+        _seed_db(
+            identifier,
+            [
+                {
+                    'change_id': 'title-1',
+                    'subject': 'thing: do things better',
+                    'message_id': 'v1@ex.com',
+                }
+            ],
+        )
+        lser = _make_mock_lser(subject='thing: do things better')
+        result = (lser, b'fake mbox', 'abc123456789', '', 1)
+
+        app = TrackingApp(identifier)
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            app._on_update_prepared(
+                result,
+                'title-1',
+                1,
+                2,
+                'v2@ex.com',
+                '[PATCH v2 1/3] thing: part 1',
+                'b4/review/title-1',
+            )
+            await pilot.pause()
+            from b4.review_tui._modals import BaseSelectionScreen
+
+            assert isinstance(app.screen, BaseSelectionScreen)
+            assert app.screen._subject == 'thing: do things better'
+
+    @pytest.mark.asyncio
+    async def test_prepared_untitled_series_keeps_catalog_title(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        """A series that never learned its title must not beat the catalog.
+
+        LoreSeries carries an '(untitled)' placeholder until its cover or
+        patch 1 is seen; a thread missing both still am-preps (get_am_ready()
+        skips absent patches), and storing the placeholder would clobber a
+        good catalog subject.
+        """
+        identifier = 'test-update-untitled'
+        _seed_db(
+            identifier,
+            [
+                {
+                    'change_id': 'title-2',
+                    'subject': 'thing: do things better',
+                    'message_id': 'v1@ex.com',
+                }
+            ],
+        )
+        lser = _make_mock_lser(subject='(untitled)')
+        result = (lser, b'fake mbox', 'abc123456789', '', 1)
+
+        app = TrackingApp(identifier)
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            app._on_update_prepared(
+                result,
+                'title-2',
+                1,
+                2,
+                'v2@ex.com',
+                '[PATCH v2 0/3] thing: do things better',
+                'b4/review/title-2',
+            )
+            await pilot.pause()
+            from b4.review_tui._modals import BaseSelectionScreen
+
+            assert isinstance(app.screen, BaseSelectionScreen)
+            assert app.screen._subject == '[PATCH v2 0/3] thing: do things better'
+
     # --- Phase 3: _on_update_base_selected (apply + swap) ----------------
 
     @pytest.mark.asyncio

-- 
2.53.0

