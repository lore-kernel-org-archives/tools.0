Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADED13EFD24
	for <tools@linux.kernel.org>; Wed, 12 Aug 2026 21:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786571252; cv=none; b=Vxtri7UcHkqTwnww2NVAEFW+AUHBIqga+kOGYfO33yjACSM1g/VY8o+5tieoZ72X8u4FGGhtIXJEFNDXFhX1raQ9GI7/a+k3jOqs3AldTbrfuv1p707JXUfowdIosYbSRTEIr29T4DbYKGOqIqJDd+PeTTAEQO8GWS9rF3Lcogg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786571252; c=relaxed/simple;
	bh=YH2ROfwNDO57fLECxO23pXNe4erhrtGcLL+pQZrfFgM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ulxgTaCVLxzSPzzhaoYWGdknhzzU83JMTuFg19c9VbntM9rEMWZaiHyY/NlHgNvah5+PrY+cFh+Qo1v0XGKJAfn/ePUjQO/xRcmK0TqZw7Xw/IlZeHhyN0G6Cxndx6kX6l6KPp+W2fABzNDDcNLi/X4i4czn8ugUWsBfB3NPwcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bf32zvQs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bf32zvQs"
Received: by smtp.kernel.org (Postfix)
	id 8D4301F00A3D; Wed, 12 Aug 2026 21:47:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F8931F00A3A;
	Wed, 12 Aug 2026 21:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786571250;
	bh=Qc0m2xf5zy7ZLwzBOSV4wsOWUNmGTqeHFOq1wxD3XCk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Bf32zvQsLpdVyeRdMDvUX+PDCg7G9VDaJ31mjRtE0VFzFweCJy2NNRiA7FUyd3bAu
	 bWzf1E1M7ZZZqPg6mCYMVXQEDh3A6lwT4kOV0B0RPezZnQJa9TDdxOVwN3T/IZtV/X
	 3dnJIV9OcUsZf5GCA3rQMhzm3jHKPIEoh1hDP2ZG5IsBfLMaGB/ZCaAdH5+S3Znxcz
	 gUzu+QNrUMHzhkhao6SJA+nkLInelzeEu6YcN7S1z5QkWn4HRnZFV7g9KxoSrSGGzQ
	 0873RwN0xYOsfAkrG3E5ov/YVnIItK8j9exVsQIUmcIEWXZOU5P56cwGtazOU6RU5Y
	 iKfBuMF7frMQQ==
From: Christian Brauner <brauner@kernel.org>
Date: Wed, 12 Aug 2026 23:46:57 +0200
Subject: [PATCH RFC v2 16/25] review-tui: test revision resolution and the
 range-diff fallback
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-work-b4-multiver-rows-v2-16-305d53cd723a@kernel.org>
References: <20260812-work-b4-multiver-rows-v2-0-305d53cd723a@kernel.org>
In-Reply-To: <20260812-work-b4-multiver-rows-v2-0-305d53cd723a@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.17-dev-362b8
X-Developer-Signature: v=1; a=openpgp-sha256; l=17596; i=brauner@kernel.org;
 h=from:subject:message-id; bh=YH2ROfwNDO57fLECxO23pXNe4erhrtGcLL+pQZrfFgM=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTVvLxl6th7xWH2Kr8jNsc5L/QwlD99wxKa7r1bcHrSl
 C7ehf/kOkpZGMS4GGTFFFkc2k3C5ZbzVGw2ytSAmcPKBDKEgYtTACZi/JmRofXyqq53XQtzj98s
 ulfwjdfIlU3VMvajbwoDj2H7VOklsxgZNi/Y65v+PvWbr3gug/6Usk0npJS1nkoFXplbe8HkftA
 5VgA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Cover merge_tracked_revisions() and get_revisions_with_tracked(): the
synthesized entry, every live series row contributing one, and neither
blob nor read state coming across.  Cover fetch_fake_am_range()'s three
sources: the stitched series blob, a cached thread that does hold the
whole series, and the lore refetch for one that does not, including the
incomplete cache kept as a fallback and the stitched result stored back.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/tests/test_review_tracking.py | 105 +++++++++++++++
 src/tests/test_tui_review.py      | 274 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 378 insertions(+), 1 deletion(-)

diff --git a/src/tests/test_review_tracking.py b/src/tests/test_review_tracking.py
index e2fcdf85..145fac8f 100644
--- a/src/tests/test_review_tracking.py
+++ b/src/tests/test_review_tracking.py
@@ -8352,3 +8352,108 @@ class TestThreadBlobResolution:
     def test_no_topdir_still_answers(self) -> None:
         assert review_tracking.resolve_thread_blob(None, {'thread-blob': 'x'}) == 'x'
         assert review_tracking.resolve_thread_blob(None, {}) == ''
+
+
+class TestGetRevisionsWithTracked:
+    def test_the_tracked_revision_is_always_present(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        """Manually linking a newer version used to record only that one.
+
+        Tracking a series now catalogues the revision it tracks, so the
+        entry is a real row rather than one synthesized on read -- which is
+        also what gives its read state somewhere to live.
+        """
+        conn = review_tracking.init_db('with-tracked')
+        review_tracking.add_series_to_db(
+            conn,
+            change_id='cid',
+            revision=2,
+            subject='[PATCH v2] thing',
+            sender_name='n',
+            sender_email='e@x',
+            sent_at='2026-01-01T00:00:00+00:00',
+            message_id='v2@x',
+            num_patches=1,
+        )
+        review_tracking.add_revision(conn, 'cid', 3, 'v3@x')
+        conn.commit()
+        revs = review_tracking.get_revisions_with_tracked(conn, 'cid')
+        conn.close()
+        assert [r['revision'] for r in revs] == [2, 3]
+        tracked = revs[0]
+        assert tracked['message_id'] == 'v2@x'
+
+    def test_two_live_series_rows_both_resolve(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        """rescan_branches can leave a change_id with two live rows.
+
+        The tracking list renders a row per live series row, and every
+        gate that offers the range-diff counts the same way, so both
+        revisions have to be resolvable here -- picking one would enable
+        an action on a version this function cannot find a message-id for.
+        """
+        conn = review_tracking.init_db('tracked-ambiguous')
+        for rev in (2, 5):
+            conn.execute(
+                'INSERT INTO series (change_id, revision, message_id, subject,'
+                " sender_name, sender_email, status) VALUES (?,?,?,?,?,?,'new')",
+                ('cid', rev, f'v{rev}@x', f'subj v{rev}', 'A', 'a@x'),
+            )
+        conn.commit()
+        revs = review_tracking.get_revisions_with_tracked(conn, 'cid')
+        conn.close()
+        assert [r['revision'] for r in revs] == [2, 5]
+        assert [r['message_id'] for r in revs] == ['v2@x', 'v5@x']
+
+    def test_present_tracked_revision_is_left_alone(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        conn = review_tracking.init_db('with-tracked-noop')
+        review_tracking.add_series_to_db(
+            conn,
+            change_id='cid',
+            revision=2,
+            subject='[PATCH v2] thing',
+            sender_name='S',
+            sender_email='s@e.com',
+            sent_at='2026-01-01T00:00:00+00:00',
+            message_id='v2@x',
+            num_patches=1,
+        )
+        review_tracking.add_revision(conn, 'cid', 2, 'v2@x')
+        conn.commit()
+        revs = review_tracking.get_revisions_with_tracked(conn, 'cid')
+        conn.close()
+        assert [r['revision'] for r in revs] == [2]
+        assert revs[0]['source'] == 'heuristic'
+
+
+class TestMergeTrackedRevisionsHelper:
+    """One merge rule for the DB resolver and the TUI's version rows."""
+
+    def test_every_series_row_resolves(self) -> None:
+        revs = [
+            {
+                'change_id': 'cid',
+                'revision': 2,
+                'message_id': 'v2@x',
+                'message_count': 4,
+            }
+        ]
+        rows = [
+            {'revision': 3, 'message_id': 'v3@x', 'subject': 's3'},
+            {'revision': 2, 'message_id': 'v2@x', 'subject': 's2'},
+            {'revision': 1, 'message_id': ''},
+        ]
+        merged = review_tracking.merge_tracked_revisions('cid', revs, rows)
+        assert [r['revision'] for r in merged] == [2, 3]
+        # The catalog row wins over a synthesized twin.
+        assert merged[0]['message_count'] == 4
+        synth = merged[1]
+        assert synth['source'] == 'tracked'
+        assert synth['message_id'] == 'v3@x'
+        # No read state: the entry supplies a message-id, not a badge.
+        assert synth['message_count'] is None
+        assert synth['seen_message_count'] is None
diff --git a/src/tests/test_tui_review.py b/src/tests/test_tui_review.py
index 8c4ce039..641b61c8 100644
--- a/src/tests/test_tui_review.py
+++ b/src/tests/test_tui_review.py
@@ -10,7 +10,7 @@ cosmetic commit edits (e.g. reworded subjects via git rebase -i).
 """
 
 import json
-from typing import Any, Dict, List, Tuple
+from typing import Any, Dict, List, Optional, Tuple
 from unittest import mock
 
 import pytest
@@ -18,6 +18,7 @@ import pytest
 pytest.importorskip('textual')
 
 import b4
+import b4.mbox
 import b4.review
 import b4.review.tracking
 from b4.review_tui._review_app import ReviewApp
@@ -995,3 +996,274 @@ class TestRangeDiffBindingGate:
         # Range-diff is a review-mode action; email mode hides it
         app._preview_mode = True
         assert app.check_action('range_diff', ()) is False
+
+
+class TestIncompleteCachedThreadBlob:
+    """A blob the poller cached may hold only part of a series."""
+
+    @staticmethod
+    def _revisions() -> List[Dict[str, Any]]:
+        return [
+            {
+                'revision': 1,
+                'message_id': 'x@example.com',
+                'thread_blob': 'cafebabe',
+            }
+        ]
+
+    @staticmethod
+    def _series(complete: bool, patches: int) -> mock.Mock:
+        """A LoreSeries stub holding *patches* of its patches."""
+        lser = mock.Mock()
+        lser.complete = complete
+        # patches[0] is the cover slot, which _known_patches skips.
+        lser.patches = [None] + [mock.Mock() for _ in range(patches)]
+        lser.make_fake_am_range.return_value = ('start', 'end')
+        return lser
+
+    def _patch_blob(
+        self,
+        monkeypatch: pytest.MonkeyPatch,
+        complete: bool,
+        patches: int = 1,
+        then: Optional[List[mock.Mock]] = None,
+    ) -> mock.Mock:
+        """Make the cached blob decode to a series with the given completeness.
+
+        *then*, when given, is what the later _series_from() calls decode
+        to, in order -- a series blob, the thread blob and the lore refetch
+        are all parsed by the same helper, so each needs its own
+        LoreMailbox result.
+        """
+        lser = self._series(complete, patches)
+        monkeypatch.setattr(
+            b4.review.tracking, 'get_thread_mbox', lambda topdir, sha: b'From x\n'
+        )
+        monkeypatch.setattr(b4, 'split_and_dedupe_pi_results', lambda raw: ['m'])
+        results = [lser] + list(then or [])
+        lmbx = mock.Mock()
+        lmbx.get_series.side_effect = lambda *a, **kw: (
+            results.pop(0) if len(results) > 1 else results[0]
+        )
+        monkeypatch.setattr(b4, 'LoreMailbox', lambda: lmbx)
+        return lser
+
+    def test_an_incomplete_blob_is_used_when_the_refetch_fails(
+        self, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """An incomplete range-diff beats none.
+
+        Discarding the blob outright turned a 'd' that used to work into a
+        silent failure whenever the refetch could not run -- offline, lore
+        down, or a message-id that 404s.
+        """
+        from b4.review_tui._common import fetch_fake_am_range
+
+        lser = self._patch_blob(monkeypatch, complete=False)
+        monkeypatch.setattr(b4, 'get_lore_node', lambda: mock.Mock())
+        monkeypatch.setattr(b4, 'get_pi_thread_by_msgid', lambda msgid, **kw: None)
+
+        assert fetch_fake_am_range('/nonexistent', self._revisions(), 1) == (
+            'start',
+            'end',
+        )
+        assert lser.make_fake_am_range.called
+
+    def test_a_more_complete_refetch_replaces_the_cached_blob(
+        self, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """Otherwise the same refetch repeats on every press of 'd'.
+
+        The poller re-stores what it counted, so nothing else ever replaces
+        a blob holding one patch's thread.
+        """
+        from b4.review_tui._common import fetch_fake_am_range
+
+        better = self._series(complete=True, patches=4)
+        self._patch_blob(monkeypatch, complete=False, patches=1, then=[better])
+        monkeypatch.setattr(b4, 'get_lore_node', lambda: mock.Mock())
+        monkeypatch.setattr(
+            b4, 'get_pi_thread_by_msgid', lambda msgid, **kw: ['a', 'b']
+        )
+        monkeypatch.setattr(
+            b4.mbox,
+            'get_extra_series',
+            lambda msgs, direction=1, wantvers=None, nocache=False: list(msgs),
+        )
+        recached: List[Tuple[int, int]] = []
+        fetch_fake_am_range(
+            '/nonexistent',
+            self._revisions(),
+            1,
+            recache=lambda rev, msgs: recached.append((rev, len(msgs))),
+        )
+        assert recached == [(1, 2)]
+        assert better.make_fake_am_range.called
+
+    def test_a_refetch_that_is_no_better_is_not_recorded_as_a_stitch(
+        self, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """A short refetch must not decide the range-diff -- or be cached.
+
+        Lore can truncate, and a rethreaded version's per-patch queries can
+        come back incomplete, so the fuller cached thread is what this
+        range-diff is built from.  Those same bytes must not then be
+        written back as the version's series blob: nothing was stitched,
+        and `series_blob` means "every patch of this version" -- which is
+        exactly what the thread arm has just found they are not.  Filed
+        under that name they are read back as an answer, and since a
+        settled version's thread never changes again, nothing ever drops
+        them.
+        """
+        from b4.review_tui._common import fetch_fake_am_range
+
+        worse = self._series(complete=False, patches=1)
+        cached = self._patch_blob(monkeypatch, complete=False, patches=3, then=[worse])
+        monkeypatch.setattr(b4, 'get_lore_node', lambda: mock.Mock())
+        monkeypatch.setattr(
+            b4, 'get_pi_thread_by_msgid', lambda msgid, **kw: ['a', 'b']
+        )
+        monkeypatch.setattr(
+            b4.mbox,
+            'get_extra_series',
+            lambda msgs, direction=1, wantvers=None, nocache=False: list(msgs),
+        )
+        recached: List[Tuple[int, List[Any]]] = []
+        assert fetch_fake_am_range(
+            '/nonexistent',
+            self._revisions(),
+            1,
+            recache=lambda rev, msgs: recached.append((rev, msgs)),
+        ) == ('start', 'end')
+        # Nothing was stitched, so nothing is recorded as a stitch.
+        assert recached == []
+        # And the range-diff is built from the cache, not the short refetch.
+        assert cached.make_fake_am_range.called
+        assert not worse.make_fake_am_range.called
+
+    def test_an_incomplete_improvement_is_used_but_not_recorded(
+        self, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """Fuller than the thread is still not every patch.
+
+        Using it is right -- it is the best reconstruction there is -- but
+        recording it would let the series-blob arm hand it back as the
+        whole version on the next press, without the completeness test
+        that just judged it short.
+        """
+        from b4.review_tui._common import fetch_fake_am_range
+
+        better = self._series(complete=False, patches=3)
+        self._patch_blob(monkeypatch, complete=False, patches=1, then=[better])
+        monkeypatch.setattr(b4, 'get_lore_node', lambda: mock.Mock())
+        monkeypatch.setattr(
+            b4, 'get_pi_thread_by_msgid', lambda msgid, **kw: ['a', 'b']
+        )
+        monkeypatch.setattr(
+            b4.mbox,
+            'get_extra_series',
+            lambda msgs, direction=1, wantvers=None, nocache=False: list(msgs),
+        )
+        recached: List[int] = []
+        assert fetch_fake_am_range(
+            '/nonexistent',
+            self._revisions(),
+            1,
+            recache=lambda rev, msgs: recached.append(rev),
+        ) == ('start', 'end')
+        assert better.make_fake_am_range.called
+        assert recached == []
+
+    def test_an_incomplete_series_blob_is_a_fallback_not_an_answer(
+        self, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """Otherwise a short stitch pins every later range-diff to itself.
+
+        The blob is dropped when its thread changes, and a settled old
+        version's thread never does -- so trusting a short stitch here is
+        for ever, and silently: the log line reads 'using cached series
+        blob' either way, while the thread arm would have said the version
+        was incomplete and refetched.
+        """
+        from b4.review_tui._common import fetch_fake_am_range
+
+        thread = self._series(complete=False, patches=1)
+        better = self._series(complete=True, patches=4)
+        stitched = self._patch_blob(
+            monkeypatch, complete=False, patches=2, then=[thread, better]
+        )
+        monkeypatch.setattr(b4, 'get_lore_node', lambda: mock.Mock())
+        monkeypatch.setattr(
+            b4, 'get_pi_thread_by_msgid', lambda msgid, **kw: ['a', 'b']
+        )
+        monkeypatch.setattr(
+            b4.mbox,
+            'get_extra_series',
+            lambda msgs, direction=1, wantvers=None, nocache=False: list(msgs),
+        )
+        revisions = self._revisions()
+        revisions[0]['series_blob'] = 'deadbeef'
+        recached: List[int] = []
+        assert fetch_fake_am_range(
+            '/nonexistent',
+            revisions,
+            1,
+            recache=lambda rev, msgs: recached.append(rev),
+        ) == ('start', 'end')
+        assert better.make_fake_am_range.called
+        assert not stitched.make_fake_am_range.called
+        assert recached == [1]
+
+    def test_a_complete_series_blob_short_circuits_everything(
+        self, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """A whole version, already stitched, cannot be improved on.
+
+        It was stored because the thread would not do, and it is dropped
+        the moment that thread changes, so paying for the stitching passes
+        again buys nothing.
+        """
+        from b4.review_tui._common import fetch_fake_am_range
+
+        stitched = self._patch_blob(monkeypatch, complete=True, patches=2)
+        fetched: List[str] = []
+        monkeypatch.setattr(b4, 'get_lore_node', lambda: mock.Mock())
+        monkeypatch.setattr(
+            b4, 'get_pi_thread_by_msgid', lambda msgid, **kw: fetched.append(msgid)
+        )
+        revisions = self._revisions()
+        revisions[0]['series_blob'] = 'deadbeef'
+        recached: List[int] = []
+        assert fetch_fake_am_range(
+            '/nonexistent',
+            revisions,
+            1,
+            recache=lambda rev, msgs: recached.append(rev),
+        ) == ('start', 'end')
+        assert stitched.make_fake_am_range.called
+        assert fetched == []
+        assert recached == []
+
+    def test_a_complete_blob_is_not_refetched(
+        self, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """The cache still has to hit in the normal case."""
+        from b4.review_tui._common import fetch_fake_am_range
+
+        self._patch_blob(monkeypatch, complete=True)
+        fetched: List[str] = []
+        monkeypatch.setattr(b4, 'get_lore_node', lambda: mock.Mock())
+        monkeypatch.setattr(
+            b4,
+            'get_pi_thread_by_msgid',
+            lambda msgid, **kw: fetched.append(msgid),
+        )
+        recached: List[int] = []
+        assert fetch_fake_am_range(
+            '/nonexistent',
+            self._revisions(),
+            1,
+            recache=lambda rev, msgs: recached.append(rev),
+        ) == ('start', 'end')
+        assert fetched == []
+        assert recached == []

-- 
2.53.0

