Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E62136D517
	for <tools@linux.kernel.org>; Wed, 12 Aug 2026 21:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786571248; cv=none; b=XfwNptpDUFgPGnS48kqamfIeJJ58PfG2sWtN9YEYzgOSWFok5Ul8t03Ap8iM4UcPfemdw38j9YuhVi/WjKns5EpYIYY4nz6QbWQzOGZzNZFpJt75HvfvSAdgcvq01WDUXpgz3y4eRC4VldswDxJDho8yz8AYyqDF0yZsN2Fr7Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786571248; c=relaxed/simple;
	bh=nnOWzMF6mmmBUf8O/oXyRTQXljafmNqgk/OnKnwJAwo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DfozaxYZJcjSVu284ow7ea9pdru5Ma6SnffBxHQJ7/vSCJI8/JYtEMLrkp7tbTwKq4tg1JEKCH4yb421xgjtoPPOlg1M4HV+cABjoeNKLzNXkDfyIOefBIb8fyereXqtaySNshtLOdTmSnxOAIwLgCtkQmjvPzFle5VubOcQ3ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=boUQQ/C5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="boUQQ/C5"
Received: by smtp.kernel.org (Postfix)
	id 5A39B1F000E9; Wed, 12 Aug 2026 21:47:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 364331F00A3F;
	Wed, 12 Aug 2026 21:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786571246;
	bh=bS6GFUZjjxr3A0RsPMyas5dMpXg9Ugp7TBdR1SpwRM4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=boUQQ/C5C1jAWZZyHWlZpsYBNOEOlDUpq+ly6xrpSa8xSErcu4LzsmGB/yrx/mrwt
	 jIULMknOJOy1MVV0HUHBowis/PlD6pShbxclzouLDlgEo7lxlJPpkySSvPLY9GvcdH
	 Ey2RryKzoLhS+ooNDQvaHDvLeduzFg1B0Ui5Jtr3d0exmHYZLIUxGbrceK/2ZY7vMi
	 50RcCOKyKx8KTtVMizdurtmq336Jk6C2IEnUiLPtOwF2CfdXZ+1PgxxrAsY7/Yae/J
	 TLpahziFmuwtmfjbeTsb5CFqJ39iTz4Hhw77CbVqp0EA7pWXfksWmMpcKdaZ011MgZ
	 sV3ZYvziD7EJw==
From: Christian Brauner <brauner@kernel.org>
Date: Wed, 12 Aug 2026 23:46:54 +0200
Subject: [PATCH RFC v2 13/25] review: test the per-revision poll sweep
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260812-work-b4-multiver-rows-v2-13-305d53cd723a@kernel.org>
References: <20260812-work-b4-multiver-rows-v2-0-305d53cd723a@kernel.org>
In-Reply-To: <20260812-work-b4-multiver-rows-v2-0-305d53cd723a@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.17-dev-362b8
X-Developer-Signature: v=1; a=openpgp-sha256; l=42605; i=brauner@kernel.org;
 h=from:subject:message-id; bh=nnOWzMF6mmmBUf8O/oXyRTQXljafmNqgk/OnKnwJAwo=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTVvLxlUFu08JqZQHGQp/1E/iS1Xv0Y/tZF6l8XulTWu
 KuttZfsKGVhEONikBVTZHFoNwmXW85TsdkoUwNmDisTyBAGLk4BmMjalQz/48Xm+7wXmsj3Yfny
 9t/ht95N/hTlvEbr4C8Z5b9cCTpP+BkZLvbtqT2oeE1sZpiz9utDodXOQnofeRQ39hetOe7FpcP
 EBAA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Cover the sweep wiring around update_revision_message_counts(): a busy
branch keeping its poll while the ref is left alone, the thread snapshot
moving onto the catalog row so seen_bump stops re-counting read mail,
offline not counting as a failed poll, a poll that raises being counted
rather than dropped at debug level, and the cron reporting of
per-revision results and unreachable revisions.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/tests/test_review.py          | 688 ++++++++++++++++++++++++++++++++++++++
 src/tests/test_review_tracking.py | 281 ++++++++++++++++
 src/tests/test_tui_tracking.py    |  29 ++
 3 files changed, 998 insertions(+)

diff --git a/src/tests/test_review.py b/src/tests/test_review.py
index 4f566898..a7c9cb15 100644
--- a/src/tests/test_review.py
+++ b/src/tests/test_review.py
@@ -1,9 +1,11 @@
 import argparse
 import email.message
 import importlib.util
+import io
 import json
 import logging
 import os
+import sqlite3
 from typing import Any, Dict, Iterator, List, Optional, Tuple, Union
 from unittest import mock
 
@@ -11,6 +13,7 @@ import pytest
 
 import b4
 import b4.review.tracking
+import liblore
 from b4 import review, review_tui
 from b4.review import _review
 from b4.review._review import REVIEW_MAGIC_MARKER, check_series_attestation
@@ -4855,3 +4858,688 @@ class TestCreateReviewBranchCleanup:
         assert ecode == 0
         assert head.strip() == tip
         assert not b4.git_branch_exists(gitdir, branch)
+
+
+def test_update_all_tracking_polls_revisions_capped(
+    monkeypatch: pytest.MonkeyPatch,
+) -> None:
+    """The sweep must actually drive the per-revision poller, with a cap.
+
+    Uncapped this is one lore round-trip per known older revision of every
+    tracked series on every 'U' press.
+    """
+    series = [
+        {'change_id': 'a', 'subject': 's-a', 'status': 'new', 'sender_name': 'A'},
+        {'change_id': 'b', 'subject': 's-b', 'status': 'reviewing', 'sender_name': 'B'},
+    ]
+    monkeypatch.setattr(
+        b4.review.tracking, 'get_all_tracked_series', lambda identifier: series
+    )
+    monkeypatch.setattr(
+        review,
+        'update_series_tracking',
+        lambda one, identifier, linkmask, topdir=None: {
+            'new_revisions': 0,
+            'new_trailers': 0,
+            'error': None,
+        },
+    )
+    calls: List[Dict[str, Any]] = []
+
+    def fake_counts(
+        identifier: str,
+        series_list: List[Dict[str, Any]],
+        topdir: Optional[str] = None,
+        max_revisions_per_series: Optional[int] = None,
+        cancel_cb: Optional[Any] = None,
+        status_cb: Optional[Any] = None,
+        force: bool = False,
+    ) -> Dict[str, int]:
+        calls.append(
+            {
+                'change_ids': [s['change_id'] for s in series_list],
+                'cap': max_revisions_per_series,
+                'cancel_cb': cancel_cb,
+                'force': force,
+            }
+        )
+        return {'updated': 5, 'new_mail': 2, 'errors': 0}
+
+    monkeypatch.setattr(
+        b4.review.tracking, 'update_revision_message_counts', fake_counts
+    )
+    result = review.update_all_tracking(
+        'poller',
+        'https://lore.example/r/%s',
+        cancel_cb=lambda: False,
+    )
+    # One call for the whole list: the poller loops internally and applies
+    # the cap per series, so handing it a series at a time only reopened the
+    # database once per entry.
+    assert [c['change_ids'] for c in calls] == [['a', 'b']]
+    assert {c['cap'] for c in calls} == {b4.review.tracking.REVISION_POLL_LIMIT}
+    assert all(c['cancel_cb'] is not None for c in calls)
+    # Nothing asked for a forced poll, so recently checked versions keep
+    # their minimum-age schedule.
+    assert all(c['force'] is False for c in calls)
+    # The summary reports new mail, not every row the poller touched.
+    assert result['revision_counts_updated'] == 2
+    assert result['revision_errors'] == 0
+
+
+def test_update_all_tracking_reports_revision_poll_errors(
+    monkeypatch: pytest.MonkeyPatch,
+) -> None:
+    """A poller that never works must not look like a quiet mailing list.
+
+    Counted apart from result['errors'], which drives the per-series error
+    report: a revision that will not fetch is not a series that failed.
+    """
+    series = [{'change_id': 'a', 'subject': 's-a', 'status': 'new', 'sender_name': 'A'}]
+    monkeypatch.setattr(
+        b4.review.tracking, 'get_all_tracked_series', lambda identifier: series
+    )
+    monkeypatch.setattr(
+        review,
+        'update_series_tracking',
+        lambda one, identifier, linkmask, topdir=None: {
+            'new_revisions': 0,
+            'new_trailers': 0,
+            'error': None,
+        },
+    )
+    monkeypatch.setattr(
+        b4.review.tracking,
+        'update_revision_message_counts',
+        lambda *a, **kw: {'updated': 0, 'new_mail': 0, 'errors': 3, 'polled': 0},
+    )
+    result = review.update_all_tracking('poller-err', 'https://lore.example/r/%s')
+    assert result['revision_errors'] == 3
+    assert result['revision_polled'] == 0
+    assert result['errors'] == 0
+
+
+def test_update_all_tracking_feeds_poll_progress(
+    monkeypatch: pytest.MonkeyPatch,
+) -> None:
+    """The poll phase reports through the same callback as the series loop.
+
+    It runs after the bar has reached N/N and can be minutes of lore
+    traffic; without its own progress the update modal reads as hung.
+    """
+    series = [{'change_id': 'a', 'subject': 's-a', 'status': 'new', 'sender_name': 'A'}]
+    monkeypatch.setattr(
+        b4.review.tracking, 'get_all_tracked_series', lambda identifier: series
+    )
+    monkeypatch.setattr(
+        review,
+        'update_series_tracking',
+        lambda one, identifier, linkmask, topdir=None: {
+            'new_revisions': 0,
+            'new_trailers': 0,
+            'error': None,
+        },
+    )
+
+    def fake_counts(
+        identifier: str,
+        series_list: List[Dict[str, Any]],
+        topdir: Optional[str] = None,
+        max_revisions_per_series: Optional[int] = None,
+        cancel_cb: Optional[Any] = None,
+        status_cb: Optional[Any] = None,
+        force: bool = False,
+    ) -> Dict[str, int]:
+        assert status_cb is not None
+        status_cb(series_list[0]['subject'])
+        return {'updated': 0, 'new_mail': 0, 'errors': 0, 'polled': 1}
+
+    monkeypatch.setattr(
+        b4.review.tracking, 'update_revision_message_counts', fake_counts
+    )
+    seen: List[Any] = []
+    review.update_all_tracking(
+        'poll-progress',
+        'https://lore.example/r/%s',
+        progress_cb=lambda c, t, s: seen.append((c, t, s)),
+    )
+    # Held at N/N: the series loop already drove the bar there, and the
+    # poller hands over a subject and nothing else, so there is no second
+    # count to walk it backwards.  The label carries the poll's progress.
+    polled = [(c, t) for c, t, s in seen if s.startswith('Polling earlier')]
+    assert polled == [(1, 1)]
+
+
+@pytest.mark.parametrize(
+    ('polled', 'fresh', 'level'),
+    [(0, 3, 'WARNING'), (2, 3, 'DEBUG'), (0, 0, 'DEBUG')],
+)
+def test_cron_reports_unreachable_revisions_only_when_nothing_polled(
+    monkeypatch: pytest.MonkeyPatch,
+    caplog: pytest.LogCaptureFixture,
+    polled: int,
+    fresh: int,
+    level: str,
+) -> None:
+    """One dead message-id must not mail the maintainer on every sweep.
+
+    Nothing ever retires a revision whose message-id is permanently gone:
+    it keeps its place in the rotation and fails again on every pass.  A
+    sweep that polled something has a working poller and says so quietly.
+    And an empty sweep is only worth cron mail when something failed for
+    the *first* time: a known-dead revision (attempted before, never
+    fetched once) failing again is old news -- gating on the other
+    revisions' success alone still mailed forever whenever the dead one
+    was the only candidate at all.
+    """
+    monkeypatch.setattr(
+        _review,
+        'update_all_tracking',
+        lambda identifier, linkmask, topdir=None, **kw: {
+            'series_checked': 1,
+            'series_updated': 0,
+            'errors': 0,
+            'gone': 0,
+            'followup_updated': 0,
+            'revision_counts_updated': 0,
+            'revision_errors': 3,
+            'revision_fresh_errors': fresh,
+            'revision_polled': polled,
+            'branch_busy_skipped': 0,
+            'error_details': [],
+            'cancelled': False,
+        },
+    )
+    with caplog.at_level(logging.DEBUG, logger=b4.logger.name):
+        _review._cron_update('cron-poller', None)
+    records = [r for r in caplog.records if 'Could not poll' in r.getMessage()]
+    assert [r.levelname for r in records] == [level]
+
+
+def test_update_all_tracking_cancelled_poller_stops_sweep(
+    monkeypatch: pytest.MonkeyPatch,
+) -> None:
+    """Cancellation now reaches the handler -- the fetch helpers used to
+    swallow OperationCancelledError, making that branch unreachable.
+
+    The poll is one batched call after the series loop, so a cancel raised
+    there marks the sweep cancelled without unwinding the per-series work
+    that already finished.  A cancel the *maintainer* asks for still stops
+    the series loop itself: it checks cancel_cb at the top of every pass.
+    """
+    series = [
+        {'change_id': 'a', 'subject': 's-a', 'status': 'new', 'sender_name': 'A'},
+        {'change_id': 'b', 'subject': 's-b', 'status': 'new', 'sender_name': 'B'},
+    ]
+    monkeypatch.setattr(
+        b4.review.tracking, 'get_all_tracked_series', lambda identifier: series
+    )
+    monkeypatch.setattr(
+        review,
+        'update_series_tracking',
+        lambda one, identifier, linkmask, topdir=None: {
+            'new_revisions': 0,
+            'new_trailers': 0,
+            'error': None,
+        },
+    )
+
+    def cancelled(*a: Any, **kw: Any) -> Dict[str, int]:
+        raise liblore.OperationCancelledError('Request cancelled')
+
+    monkeypatch.setattr(b4.review.tracking, 'update_revision_message_counts', cancelled)
+    result = review.update_all_tracking('poller-cancel', 'https://lore.example/r/%s')
+    assert result['cancelled'] is True
+    assert result['series_checked'] == 2
+
+
+def _stub_sweep(monkeypatch: pytest.MonkeyPatch, series: List[Dict[str, Any]]) -> None:
+    """Point update_all_tracking at *series* with a no-op per-series update."""
+    monkeypatch.setattr(
+        b4.review.tracking, 'get_all_tracked_series', lambda identifier: series
+    )
+    monkeypatch.setattr(
+        review,
+        'update_series_tracking',
+        lambda one, identifier, linkmask, topdir=None: {
+            'new_revisions': 0,
+            'new_trailers': 0,
+            'error': None,
+        },
+    )
+
+
+def test_a_busy_branch_still_polls_its_revisions(
+    monkeypatch: pytest.MonkeyPatch,
+) -> None:
+    """Only the branch is left alone, not the per-revision poll.
+
+    The poll writes DB rows and a loose blob and moves no ref, while a
+    series under review is normally the checked-out branch -- so skipping
+    it there is skipping it almost always, and late replies to old
+    versions stop being noticed at all.
+    """
+    series = [
+        {'change_id': 'a', 'subject': 's-a', 'status': 'new', 'sender_name': 'A'},
+        {'change_id': 'b', 'subject': 's-b', 'status': 'new', 'sender_name': 'B'},
+    ]
+    monkeypatch.setattr(
+        b4.review.tracking, 'get_all_tracked_series', lambda identifier: series
+    )
+    monkeypatch.setattr(
+        review,
+        'update_series_tracking',
+        lambda one, identifier, linkmask, topdir=None: {
+            'new_revisions': 0,
+            'new_trailers': 0,
+            'error': None,
+            'branch_busy': one['change_id'] == 'a',
+        },
+    )
+    polled: List[str] = []
+
+    def _record(
+        identifier: str, series_list: List[Dict[str, Any]], **kw: Any
+    ) -> Dict[str, int]:
+        polled.extend(s['change_id'] for s in series_list)
+        return {'updated': 0, 'new_mail': 0, 'errors': 0}
+
+    monkeypatch.setattr(b4.review.tracking, 'update_revision_message_counts', _record)
+    result = review.update_all_tracking('poll-co', 'https://lore.example/r/%s')
+    # 'a' is the checked-out one, and it is still handed to the poller.
+    assert polled == ['a', 'b']
+    assert result['branch_busy_skipped'] == 1
+
+
+def test_update_all_tracking_forwards_the_forced_poll(
+    monkeypatch: pytest.MonkeyPatch,
+) -> None:
+    """A user-initiated sweep polls recently checked versions too.
+
+    The poller's minimum-age skip exists for unattended sweeps; on an
+    explicit u/U it silently withheld exactly the per-version counts the
+    refresh was pressed for.
+    """
+    series = [{'change_id': 'a', 'subject': 's-a', 'status': 'new', 'sender_name': 'A'}]
+    monkeypatch.setattr(
+        b4.review.tracking, 'get_all_tracked_series', lambda identifier: series
+    )
+    monkeypatch.setattr(
+        review,
+        'update_series_tracking',
+        lambda one, identifier, linkmask, topdir=None: {
+            'new_revisions': 0,
+            'new_trailers': 0,
+            'error': None,
+        },
+    )
+    forced: List[bool] = []
+
+    def fake_counts(
+        identifier: str,
+        series_list: List[Dict[str, Any]],
+        force: bool = False,
+        **kw: Any,
+    ) -> Dict[str, int]:
+        forced.append(force)
+        return {'updated': 0, 'new_mail': 0, 'errors': 0}
+
+    monkeypatch.setattr(
+        b4.review.tracking, 'update_revision_message_counts', fake_counts
+    )
+    review.update_all_tracking(
+        'force-poll', 'https://lore.example/r/%s', force_revision_poll=True
+    )
+    assert forced == [True]
+
+
+def test_busy_reported_only_when_an_update_was_forgone(
+    monkeypatch: pytest.MonkeyPatch,
+) -> None:
+    """The busy-branch report follows the statuses whose branch the sweep writes.
+
+    branch_busy guards every ref writer, but an accepted or thanked
+    series' branch was never going to be written -- counting it made the
+    'N checked-out branch(es) left alone' toast report branches the sweep
+    never touches, on every sweep, for as long as they stay checked out.
+    """
+    monkeypatch.setattr(b4, 'git_worktree_busy', lambda topdir, branch: True)
+    monkeypatch.setattr(
+        b4.review.tracking, 'store_revision_thread_blob', lambda *a, **kw: None
+    )
+    monkeypatch.setattr(b4.review.tracking, '_store_thread_blob', lambda *a, **kw: None)
+
+    def _run(status: str) -> Dict[str, Any]:
+        identifier = f'cog-{status}'
+        change_id = f'cog-{status}-cid'
+        conn = b4.review.tracking.init_db(identifier)
+        b4.review.tracking.add_series_to_db(
+            conn,
+            change_id,
+            1,
+            'Subject',
+            'Author',
+            'a@example.com',
+            '2024-01-15T10:00:00+00:00',
+            'cover@example.com',
+            2,
+        )
+        b4.review.tracking.update_series_status(conn, change_id, status)
+        conn.close()
+
+        msg = email.message.EmailMessage()
+        msg['Message-Id'] = f'<{change_id}-r1@example.com>'
+        msg['Date'] = 'Mon, 27 Jul 2026 10:00:00 +0000'
+        mock_lmbx = mock.Mock()
+        mock_lmbx.series = {}
+        mock_lmbx.covers = {}
+        mock_lmbx.get_series.return_value = None
+        series_dict: Dict[str, Any] = {
+            'change_id': change_id,
+            'revision': 1,
+            'status': status,
+            'message_id': 'cover@example.com',
+        }
+        with (
+            mock.patch(
+                'b4.review._review.retrieve_series_messages', return_value=[msg]
+            ),
+            mock.patch('b4.LoreMailbox', return_value=mock_lmbx),
+        ):
+            return review.update_series_tracking(
+                series_dict, identifier, 'https://example.com/%s', topdir='/nonexistent'
+            )
+
+    assert _run('reviewing').get('branch_busy') is True
+    assert not _run('accepted').get('branch_busy')
+
+
+def _seed_catalog_blob(identifier: str, blob_sha: str) -> None:
+    conn = b4.review.tracking.init_db(identifier)
+    b4.review.tracking.add_revision(conn, 'cid', 1, 'v1@x')
+    conn.execute(
+        "UPDATE revisions SET thread_blob = ? WHERE change_id = 'cid'", (blob_sha,)
+    )
+    conn.commit()
+    conn.close()
+
+
+def test_prev_thread_msgids_reads_the_catalog_snapshot(
+    monkeypatch: pytest.MonkeyPatch,
+) -> None:
+    """The catalog row's blob outranks the tracking commit's.
+
+    The catalog copy advances on every counted fetch, including sweeps
+    that leave a checked-out branch's ref alone; the tracking commit's
+    blob is frozen then, and deriving seen bumps from it re-counted the
+    same read messages as new on every sweep.
+    """
+    _seed_catalog_blob('prev-snap', 'c0ffee')
+    msgs = []
+    for i in range(2):
+        msg = email.message.EmailMessage()
+        msg['Message-Id'] = f'<prev-{i}@example.com>'
+        msg['Date'] = 'Mon, 27 Jul 2026 10:00:00 +0000'
+        msg.set_content('body')
+        msgs.append(msg)
+    buf = io.BytesIO()
+    b4.save_mboxrd_mbox(msgs, buf)
+    asked: List[str] = []
+
+    def _mbox(topdir: str, sha: str) -> bytes:
+        asked.append(sha)
+        return buf.getvalue()
+
+    monkeypatch.setattr(b4.review.tracking, 'get_thread_mbox', _mbox)
+
+    def _no_branch(*a: Any, **kw: Any) -> bool:
+        raise AssertionError('tracking commit consulted despite a catalog snapshot')
+
+    monkeypatch.setattr(b4, 'git_branch_exists', _no_branch)
+    got = _review._prev_thread_msgids('/nonexistent', 'prev-snap', 'cid', 1)
+    assert asked == ['c0ffee']
+    assert got == {'prev-0@example.com', 'prev-1@example.com'}
+
+
+def test_prev_thread_msgids_pruned_catalog_blob_is_no_snapshot(
+    monkeypatch: pytest.MonkeyPatch,
+) -> None:
+    """A recorded blob that no longer reads back yields None, not a fallback.
+
+    The tracking commit's copy is older than the pruned one, and bumps
+    against it were already applied; "cannot tell which messages are
+    new" is the honest answer.
+    """
+    _seed_catalog_blob('prev-gcd', 'deadbeef')
+    monkeypatch.setattr(b4.review.tracking, 'get_thread_mbox', lambda topdir, sha: None)
+
+    def _no_branch(*a: Any, **kw: Any) -> bool:
+        raise AssertionError('tracking commit consulted despite a catalog snapshot')
+
+    monkeypatch.setattr(b4, 'git_branch_exists', _no_branch)
+    assert _review._prev_thread_msgids('/nonexistent', 'prev-gcd', 'cid', 1) is None
+
+
+def test_a_raising_poller_is_counted_not_swallowed(
+    monkeypatch: pytest.MonkeyPatch,
+) -> None:
+    """At debug level the whole feature can break while sweeps look clean."""
+    _stub_sweep(
+        monkeypatch,
+        [{'change_id': 'a', 'subject': 's-a', 'status': 'new', 'sender_name': 'A'}],
+    )
+
+    def _boom(*a: Any, **kw: Any) -> Dict[str, int]:
+        raise sqlite3.OperationalError('database is locked')
+
+    monkeypatch.setattr(b4.review.tracking, 'update_revision_message_counts', _boom)
+    result = review.update_all_tracking('poll-raise', 'https://lore.example/r/%s')
+    assert result['revision_errors'] == 1
+    # Still not a per-series failure: the series itself updated fine.
+    assert result['errors'] == 0
+
+
+def test_a_cancelled_sweep_does_not_start_the_poller(
+    monkeypatch: pytest.MonkeyPatch,
+) -> None:
+    """The poll is minutes of lore traffic; a cancel must land before it."""
+    _stub_sweep(
+        monkeypatch,
+        [{'change_id': 'a', 'subject': 's-a', 'status': 'new', 'sender_name': 'A'}],
+    )
+    called: List[int] = []
+
+    def _record(*a: Any, **kw: Any) -> Dict[str, int]:
+        called.append(1)
+        return {'updated': 0, 'new_mail': 0, 'errors': 0}
+
+    monkeypatch.setattr(b4.review.tracking, 'update_revision_message_counts', _record)
+    review.update_all_tracking(
+        'poll-cancelled', 'https://lore.example/r/%s', cancel_cb=lambda: True
+    )
+    assert called == []
+
+
+class TestCancelledPollKeepsItsTally:
+    """A cancel mid-poll must not discard the work already committed.
+
+    The per-revision poller commits each revision as it goes, so a cancel
+    raised on revision N leaves revisions 1..N-1 counted in the database.
+    Reporting that sweep as `{'revision_polled': 0}` makes those badges
+    appear with nothing having announced them -- and makes a permanently
+    broken poller read exactly like a cancelled one.
+    """
+
+    @staticmethod
+    def _msgs(count: int) -> List[Any]:
+        """A thread of *count* messages, each carrying a Date header."""
+        out: List[Any] = []
+        for i in range(count):
+            msg = email.message.EmailMessage()
+            msg['Message-ID'] = f'<poll-{i}@example.com>'
+            msg['Subject'] = f'Re: [PATCH] thing ({i})'
+            msg['Date'] = 'Tue, 07 Jul 2026 12:00:00 +0000'
+            msg.set_content(f'body {i}')
+            out.append(msg)
+        return out
+
+    def test_partial_poll_tallies_survive_a_cancel(
+        self, monkeypatch: pytest.MonkeyPatch, tmp_path: Any
+    ) -> None:
+        identifier = 'poll-cancel-partial'
+        conn = b4.review.tracking.init_db(identifier)
+        # Two older versions, both already counted once: a second fetch that
+        # grows is then real new mail rather than a first count, which the
+        # sweep deliberately does not report as new mail.
+        for rev in (1, 2):
+            b4.review.tracking.add_revision(conn, 'a', rev, f'a-v{rev}@example.com')
+        conn.execute(
+            'UPDATE revisions SET message_count = 2, seen_message_count = 2'
+            " WHERE change_id = 'a'"
+        )
+        conn.commit()
+        conn.close()
+
+        series = [
+            {
+                'change_id': 'a',
+                'revision': 3,
+                'subject': 's-a',
+                'status': 'new',
+                'sender_name': 'A',
+            }
+        ]
+        monkeypatch.setattr(b4, 'can_network', True)
+        monkeypatch.setattr(
+            b4.review.tracking, 'get_all_tracked_series', lambda identifier: series
+        )
+        monkeypatch.setattr(
+            review,
+            'update_series_tracking',
+            lambda one, identifier, linkmask, topdir=None: {
+                'new_revisions': 0,
+                'new_trailers': 0,
+                'error': None,
+            },
+        )
+
+        fetched: List[int] = []
+
+        def fetch(
+            identifier_: str,
+            conn_: Any,
+            change_id: str,
+            rev: Dict[str, Any],
+        ) -> List[Any]:
+            fetched.append(int(rev['revision']))
+            if len(fetched) == 1:
+                # Grew 2 -> 3: one revision's worth of genuine new mail,
+                # committed before the cancel lands.
+                return TestCancelledPollKeepsItsTally._msgs(3)
+            raise liblore.OperationCancelledError('Request cancelled')
+
+        monkeypatch.setattr(b4.review.tracking, '_fetch_revision_thread_msgs', fetch)
+
+        result = review.update_all_tracking(identifier, 'https://lore.example/r/%s')
+
+        # One revision completed, the next raised.
+        assert len(fetched) == 2
+        assert result['cancelled'] is True
+
+        # The completed revision really is committed -- this is the work the
+        # summary below has to account for, not a hypothetical.
+        conn = b4.review.tracking.get_db(identifier)
+        grown = conn.execute(
+            "SELECT COUNT(*) FROM revisions WHERE change_id = 'a' AND message_count = 3"
+        ).fetchone()[0]
+        conn.close()
+        assert grown == 1
+
+        # ...so the sweep must report it rather than returning zeros.
+        assert result['revision_polled'] == 1
+        assert result['revision_counts_updated'] == 1
+
+
+class TestExplicitUpdateReachesASnoozedSeries:
+    """[u] on one row is a question about that row, [U] is a sweep.
+
+    An explicit single-series update already spends the larger network
+    cost on a snoozed series -- update_all_tracking does not filter a
+    caller-supplied series_list, so the tracked revision's thread is
+    fetched and its trailers re-read.  Declining only the cheaper
+    per-revision top-up afterwards is not a network-thrift policy, it is
+    an inconsistency: the maintainer asked about this series and got a
+    partial answer with nothing saying so.  The scheduled sweep keeps
+    skipping snoozed rows, which is what 'snoozed' is for.
+    """
+
+    @staticmethod
+    def _seed(identifier: str) -> List[Dict[str, Any]]:
+        conn = b4.review.tracking.init_db(identifier)
+        for rev in (1, 2):
+            b4.review.tracking.add_revision(conn, 'snz', rev, f'snz-v{rev}@example.com')
+        conn.close()
+        return [
+            {
+                'change_id': 'snz',
+                'revision': 2,
+                'subject': 's-snz',
+                'status': 'snoozed',
+                'sender_name': 'S',
+            }
+        ]
+
+    def _run(
+        self,
+        identifier: str,
+        monkeypatch: pytest.MonkeyPatch,
+        forced: bool,
+    ) -> List[int]:
+        series_list = self._seed(identifier)
+        monkeypatch.setattr(b4, 'can_network', True)
+        monkeypatch.setattr(
+            review,
+            'update_series_tracking',
+            lambda one, ident, linkmask, topdir=None: {
+                'new_revisions': 0,
+                'new_trailers': 0,
+                'error': None,
+            },
+        )
+        fetched: List[int] = []
+
+        def fetch(
+            ident: str, conn: Any, change_id: str, rev: Dict[str, Any]
+        ) -> List[Any]:
+            fetched.append(int(rev['revision']))
+            msg = email.message.EmailMessage()
+            msg['Message-ID'] = '<snz-reply@example.com>'
+            msg['Date'] = 'Tue, 07 Jul 2026 12:00:00 +0000'
+            msg.set_content('late reply')
+            return [msg]
+
+        monkeypatch.setattr(b4.review.tracking, '_fetch_revision_thread_msgs', fetch)
+        review.update_all_tracking(
+            identifier,
+            'https://lore.example/r/%s',
+            series_list=series_list,
+            force_revision_poll=forced,
+        )
+        return fetched
+
+    def test_u_polls_the_older_versions_of_a_snoozed_series(
+        self, monkeypatch: pytest.MonkeyPatch, tmp_path: Any
+    ) -> None:
+        """[u] is the maintainer asking now -- answer about every version."""
+        assert self._run('snooze-forced', monkeypatch, forced=True) == [1]
+
+    def test_the_scheduled_sweep_still_leaves_a_snoozed_series_alone(
+        self, monkeypatch: pytest.MonkeyPatch, tmp_path: Any
+    ) -> None:
+        """...but nothing unattended goes near it.
+
+        Pinned alongside the case above so the fix cannot be "drop
+        skip_statuses", which would put every snoozed series back into
+        the cron sweep's lore budget.
+        """
+        assert self._run('snooze-sweep', monkeypatch, forced=False) == []
diff --git a/src/tests/test_review_tracking.py b/src/tests/test_review_tracking.py
index df867938..e2fcdf85 100644
--- a/src/tests/test_review_tracking.py
+++ b/src/tests/test_review_tracking.py
@@ -5054,6 +5054,27 @@ class TestUpdateSkipsABusyWorktree:
         # DB-side maintenance still ran
         assert result.get('counts_updated') is True
 
+    def test_a_quiescent_checkout_is_written(self, gitdir: str) -> None:
+        """Checked out is not busy, so the branch section is entered.
+
+        Skipping every checkout deferred the tracking commit for as long
+        as a series stayed under review -- which is most of its life --
+        over a write that cannot disturb a worktree standing still.  It
+        reaches the mocked-away series and fails on the sentinel error,
+        which is what shows it got that far.
+        """
+        change_id = 'co-quiescent'
+        branch = _create_review_branch(
+            gitdir, change_id, self._tracking_data(change_id)
+        )
+        ecode, _ = b4.git_run_command(gitdir, ['checkout', branch])
+        assert ecode == 0
+
+        result = self._run_update(gitdir, change_id)
+
+        assert result.get('branch_busy') is None
+        assert result.get('error') == 'Could not find series v1 in retrieved messages'
+
     def test_parked_branch_still_updated(self, gitdir: str) -> None:
         """Control: with the branch not checked out the section is entered
         (and fails on the mocked-away series — the sentinel error)."""
@@ -7942,6 +7963,60 @@ class TestPrunedThreadBlobIsReCached:
         )
         assert stored == [8]
 
+    @staticmethod
+    def _quiet_tracked_update(
+        identifier: str, monkeypatch: pytest.MonkeyPatch, blob_alive: bool
+    ) -> list[int]:
+        """Run the tracked revision's writer over an unchanged thread."""
+        conn = review_tracking.init_db(identifier)
+        review_tracking.add_revision(conn, 'cid', 1, 'v1@x')
+        conn.execute(
+            'UPDATE revisions SET message_count = 2, seen_message_count = 2,'
+            " thread_blob = 'deadbeef' WHERE change_id = 'cid' AND revision = 1"
+        )
+        conn.commit()
+        conn.close()
+        stored: list[int] = []
+        monkeypatch.setattr(
+            review_tracking, '_thread_blob_exists', lambda topdir, sha: blob_alive
+        )
+        monkeypatch.setattr(
+            review_tracking,
+            'store_revision_thread_blob',
+            lambda conn, topdir, change_id, revision, msgs: stored.append(len(msgs)),
+        )
+        conn = review_tracking.get_db(identifier)
+        review_tracking.update_message_count_from_msgs(
+            conn, 'cid', 1, _thread_msgs(2), topdir='/nonexistent'
+        )
+        conn.close()
+        return stored
+
+    def test_a_gc_d_blob_is_replaced_on_a_quiet_tracked_update(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """The tracked revision is the one the poller never covers.
+
+        _tracked_revisions keeps the poll off it, so its writer's quiet
+        path is the only place that can notice git gc took its thread --
+        and a settled series (accepted, thanked, waiting on a new version)
+        is exactly the one whose count stops moving for weeks.  Left
+        unnoticed, _prev_thread_msgids reads back nothing and the
+        maintainer's own replies badge as unread on the next sweep that
+        does see mail.
+        """
+        assert self._quiet_tracked_update('tracked-blob-gc', monkeypatch, False) == [2]
+
+    def test_a_live_blob_is_left_alone_on_a_quiet_tracked_update(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """Same rule as the poller's: existence, not a rewrite.
+
+        Re-serializing an mbox that is already stored under that SHA would
+        also throw away a stitched series_blob that is still good.
+        """
+        assert self._quiet_tracked_update('tracked-blob-live', monkeypatch, True) == []
+
 
 class TestSeenWritersStayConsistent:
     @staticmethod
@@ -8071,3 +8146,209 @@ class TestMigrationDeclinesWhatItCannotCarry:
         conn.close()
         assert 'branch_sha' not in series_cols
         assert 'branch_sha' in chg_cols
+
+
+class TestForceLiftsTheSnoozedSkip:
+    """Snoozed is a sweep policy, not a fact about the series.
+
+    'u' on a snoozed row already updates that series' tracked revision, so
+    silently declining to poll its other versions answers half the request.
+    'U' and the cron sweep never set force, so they keep skipping.
+    """
+
+    def _polled(
+        self, identifier: str, status: str, force: bool, monkeypatch: pytest.MonkeyPatch
+    ) -> int:
+        conn = review_tracking.init_db(identifier)
+        review_tracking.add_series_to_db(
+            conn,
+            change_id='cid',
+            revision=2,
+            subject='[PATCH v2] s',
+            sender_name='S',
+            sender_email='s@e.com',
+            sent_at='2026-01-01T00:00:00+00:00',
+            message_id='v2@x',
+            num_patches=1,
+        )
+        review_tracking.add_revision(conn, 'cid', 1, 'v1@x')
+        conn.close()
+        monkeypatch.setattr(b4, 'can_network', True)
+        seen: list[int] = []
+
+        def _fetch(
+            identifier: str,
+            conn: Any,
+            change_id: str,
+            rev: Dict[str, Any],
+        ) -> list[EmailMessage]:
+            seen.append(int(rev['revision']))
+            return _thread_msgs(3)
+
+        monkeypatch.setattr(review_tracking, '_fetch_revision_thread_msgs', _fetch)
+        review_tracking.update_revision_message_counts(
+            identifier,
+            [_poller_series('cid', 2, 'v2@x', status=status)],
+            force=force,
+        )
+        return len(seen)
+
+    def test_a_sweep_still_skips_snoozed(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        assert self._polled('snz-sweep', 'snoozed', False, monkeypatch) == 0
+
+    def test_asking_directly_polls_it(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        assert self._polled('snz-force', 'snoozed', True, monkeypatch) == 1
+
+    def test_archived_is_skipped_even_then(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """No tracking-list row means no way to ask, so nothing to lift."""
+        assert self._polled('arc-force', 'archived', True, monkeypatch) == 0
+
+
+class TestThreadBlobIsHashedOnce:
+    """Both writers of the snapshot want the same blob.
+
+    Blobs are content-addressed, so serializing the mbox a second time and
+    running hash-object on it again produces the SHA the first write
+    already returned -- at the cost of a second subprocess, on every sweep
+    for every series whose count moved.
+    """
+
+    def test_one_write_serves_the_catalog_and_the_tracking_commit(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        conn = review_tracking.init_db('blob-once')
+        review_tracking.add_revision(conn, 'cid', 1, 'v1@x')
+
+        writes: list[int] = []
+
+        def _fake_write(topdir: str, msgs: Any) -> str:
+            writes.append(len(msgs))
+            return 'a' * 40
+
+        monkeypatch.setattr(review_tracking, '_write_mbox_blob', _fake_write)
+        msg = EmailMessage()
+        msg['Message-Id'] = '<v1@x>'
+        msg['Date'] = 'Mon, 27 Jul 2026 10:00:00 +0000'
+
+        assert review_tracking.update_message_count_from_msgs(
+            conn, 'cid', 1, [msg], topdir='/nonexistent'
+        )
+        conn.close()
+        assert writes == [1]
+
+    def test_a_failed_write_still_lets_the_second_writer_try(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """None is 'no SHA to reuse', not 'do not bother'."""
+        conn = review_tracking.init_db('blob-once-fail')
+        review_tracking.add_revision(conn, 'cid', 1, 'v1@x')
+
+        writes: list[int] = []
+
+        def _failing_write(topdir: str, msgs: Any) -> None:
+            writes.append(len(msgs))
+            return None
+
+        monkeypatch.setattr(review_tracking, '_write_mbox_blob', _failing_write)
+        msg = EmailMessage()
+        msg['Message-Id'] = '<v1@x>'
+        msg['Date'] = 'Mon, 27 Jul 2026 10:00:00 +0000'
+
+        review_tracking.update_message_count_from_msgs(
+            conn, 'cid', 1, [msg], topdir='/nonexistent'
+        )
+        conn.close()
+        assert writes == [1, 1]
+
+
+class TestThreadBlobResolution:
+    """A frozen tracking commit must not serve a stale thread.
+
+    A sweep whose branch is checked out -- the normal state for a series
+    under review -- advances the catalog copy and leaves the tracking
+    commit's behind.  Every reader of the snapshot has to prefer the
+    catalog, or the follow-ups that raised the unread badge are exactly
+    the ones it cannot see.
+    """
+
+    @staticmethod
+    def _blob(gitdir: str, text: str) -> str:
+        """A real blob, so the existence check has something to find."""
+        ecode, out = b4.git_run_command(
+            gitdir, ['hash-object', '-w', '--stdin'], stdin=text.encode()
+        )
+        assert ecode == 0
+        return out.strip()
+
+    @staticmethod
+    def _enroll(gitdir: str, identifier: str) -> None:
+        review_tracking.save_repo_metadata(
+            b4.git_get_common_dir(gitdir) or gitdir, identifier
+        )
+
+    @staticmethod
+    def _block(**extra: Any) -> Dict[str, Any]:
+        """A tracking-commit series block, spelled the way b4 writes one."""
+        block: Dict[str, Any] = {
+            'change-id': 'cid',
+            'revision': 2,
+            'thread-blob': 'stalesha',
+        }
+        block.update(extra)
+        return block
+
+    def _seed(self, gitdir: str, identifier: str, blob: Optional[str]) -> None:
+        conn = review_tracking.init_db(identifier)
+        review_tracking.add_revision(conn, 'cid', 2, 'v2@x')
+        if blob is not None:
+            review_tracking.set_revision_thread_blob(conn, 'cid', 2, blob)
+        conn.close()
+        self._enroll(gitdir, identifier)
+
+    def test_catalog_wins_over_a_frozen_tracking_commit(self, gitdir: str) -> None:
+        fresh = self._blob(gitdir, 'the thread as the sweep last counted it')
+        self._seed(gitdir, 'blob-resolve', fresh)
+        assert review_tracking.resolve_thread_blob(gitdir, self._block()) == fresh
+
+    def test_the_block_is_read_rather_than_described(self, gitdir: str) -> None:
+        """The id comes out of the block, so it cannot disagree with it.
+
+        save_tracking_ref() writes 'change-id'.  A reader handed the id
+        beside the block asked for 'change_id', got '', and fell through to
+        the frozen copy without a word -- the catalog lookup is guarded on
+        a non-empty id, so the miss is silent.  With no second argument to
+        get wrong, a block carrying no id at all is what is left.
+        """
+        fresh = self._blob(gitdir, 'fresh')
+        self._seed(gitdir, 'blob-keys', fresh)
+        block = self._block()
+        del block['change-id']
+        assert review_tracking.resolve_thread_blob(gitdir, block) == 'stalesha'
+
+    def test_falls_back_to_the_tracking_commit(self, gitdir: str) -> None:
+        """Rows written before the catalog had a copy still resolve."""
+        self._seed(gitdir, 'blob-fallback', None)
+        assert review_tracking.resolve_thread_blob(gitdir, self._block()) == 'stalesha'
+
+    def test_a_pruned_catalog_blob_is_not_a_snapshot(self, gitdir: str) -> None:
+        """gc takes loose blobs; the SHA on the row outlives them.
+
+        Thread blobs are written with hash-object -w and referenced only
+        from the database, so a recorded SHA can name an object that is no
+        longer there.  Returning it anyway shadows the tracking commit's
+        copy -- a different blob, which may well still be readable -- and
+        hands the caller a dead SHA where it had a working one before the
+        catalog existed.
+        """
+        self._seed(gitdir, 'blob-pruned', 'd' * 40)
+        assert review_tracking.resolve_thread_blob(gitdir, self._block()) == 'stalesha'
+
+    def test_no_topdir_still_answers(self) -> None:
+        assert review_tracking.resolve_thread_blob(None, {'thread-blob': 'x'}) == 'x'
+        assert review_tracking.resolve_thread_blob(None, {}) == ''
diff --git a/src/tests/test_tui_tracking.py b/src/tests/test_tui_tracking.py
index cc80e7b1..2803bf3d 100644
--- a/src/tests/test_tui_tracking.py
+++ b/src/tests/test_tui_tracking.py
@@ -6001,3 +6001,32 @@ class TestRethreadFlagReachesTheThreadFetch:
             screen._fetch_thread()
         assert seen['is_rethreaded'] is True
         assert seen['revision'] == 2
+
+
+class TestUpdateAllDoesNotForceThePoll:
+    """'u' asks about one series; 'U' must not force the schedule everywhere.
+
+    Both keys push the same UpdateAllScreen, so a single flag on the screen
+    made 'U' bypass the minimum-age skip for every non-snoozed series --
+    REVISION_POLL_LIMIT round-trips apiece where a scheduled sweep would
+    have done almost none.
+    """
+
+    @pytest.mark.asyncio
+    async def test_u_forces_and_capital_u_does_not(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        _seed_db('force-scope', SAMPLE_SERIES)
+        seen = []
+
+        app = TrackingApp('force-scope')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            with patch.object(
+                app, 'push_screen', lambda s, callback=None: seen.append(s)
+            ):
+                app.action_update_one()
+                app.action_update_all()
+        assert len(seen) == 2
+        assert seen[0]._force_revision_poll is True
+        assert seen[1]._force_revision_poll is False

-- 
2.53.0

