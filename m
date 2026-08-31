Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CB7381B0C
	for <tools@linux.kernel.org>; Mon, 31 Aug 2026 20:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788208129; cv=none; b=FGNgJ0wLQCBSiZ3+PWHYlr6IQ1gG7iICzAlDqtgosJgIww6HtbedhXjOhOXoVPD/mCdQOGwUepMhxuTTf7Z5wK83h9iSb9fXw+vfC8r0pSypFU9XV0XsYCs8WDjGWo1ZPSjrPmofxEOMMozYYn2dgENjdPzVtIPkc/N3LMPCE4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788208129; c=relaxed/simple;
	bh=Gosn+4yxLkrMg7lc4YaNqWMGSe+kC+htL3sIniSY8jk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ssyBXK92TpV8Adq9G9gaXuc0EkWSDfr5l75v6Qoq3Dfkpm9iQM432Ftc84FIvCOUFaJ9eD9k+9UuM7mZDhz2qhuWMt2qJ5q4/jjZkEfqb3A042RIw+2FqSvj051unJkvdQu62OtG/bcFBHhHfaaAgq2ekj/T4Sqo0u2iTfp8ZnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fG2cYtz2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fG2cYtz2"
Received: by smtp.kernel.org (Postfix)
	id E70761F00A3D; Mon, 31 Aug 2026 20:28:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D91681F000E9;
	Mon, 31 Aug 2026 20:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788208126;
	bh=0DbHQCj+CWrfmtxDwB55n9BjndSnl8yr4CUo9+vfdVY=;
	h=From:To:Cc:Subject:Date;
	b=fG2cYtz211RJOeeKVotekbzEn4AMyZqPbZm+kh/2HdWmEdxygsb5+dtTiDeuQetAk
	 TiZQo8aJXtxet/W/h2PixWeWEzWQbjSX8t2L8pQmxQ2alYBNnbgbo3vZ/sRtQva9gN
	 MbAl1QMi2aKJSTx4NJTMxwZwIb/10/WteO1+SGVBdAsLGxg4lWR0Ezkhvjdisbb4tn
	 Wnstvo5zF6Yc+NBE9iwXAFUtbC4IY9JSsDC5v4PoTVv4N2I+cdbmAhuuHLMFqDko7a
	 5I02AEJc09oNhBWMuhauKVbgzbVTU+WUiIxjXy1igRvV267+YPQdvGQ8fToTI87Zaa
	 Z3290H3WDXSIw==
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: tools@kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] review: Add a 'cleanup' command
Date: Mon, 31 Aug 2026 21:28:23 +0100
Message-ID: <20260831202823.577965-1-broonie@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For the most part it is possible to synchronise b4 review state between
repositories by synchronising the b4/review branches that it uses. Where
this falls apart is when branches are deleted, for example when they are
archived after being applied. That causes b4 to keep the branch in the UI
but mark it as 'Gone', frequent syncing and archiving of branches on
multiple systems can lead to rather a lot of such branches which clogs
things up.

Add a 'b4 review cleanup' command intended to be run when synchronising
branches that deletes everything marked as Gone, doing so in one database
transaction in order to avoid races with concurrent users.

Given that this is destructive a --dry-run option is also added,
allowing the user to see what would be deleted without actually doing so.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 docs/maintainer/review.rst       |  16 +++
 src/b4/command.py                |  19 +++
 src/b4/man/b4.1.rst              |   5 +
 src/b4/review/_review.py         |   2 +
 src/b4/review/tracking.py        |  90 +++++++++++-
 src/tests/test_review_cleanup.py | 228 +++++++++++++++++++++++++++++++
 6 files changed, 357 insertions(+), 3 deletions(-)
 create mode 100644 src/tests/test_review_cleanup.py

diff --git a/docs/maintainer/review.rst b/docs/maintainer/review.rst
index ca063269..47aa8e7b 100644
--- a/docs/maintainer/review.rst
+++ b/docs/maintainer/review.rst
@@ -1068,6 +1068,13 @@ completed series (creates a ``.tar.gz`` in
 ``$XDG_DATA_HOME/b4/review-archived/``). Select **Abandon** to delete
 the series and review branch entirely.
 
+To abandon all tracked series already in the ``gone`` state, run::
+
+    b4 review cleanup
+
+Use ``b4 review cleanup --dry-run`` to list the affected series without
+deleting any tracking records.
+
 .. _snooze_details:
 
 Snoozing a series
@@ -1305,6 +1312,15 @@ Optional flags
 ``-i IDENTIFIER, --identifier IDENTIFIER``
   Project identifier (required if not in an enrolled repository).
 
+``b4 review cleanup``
+~~~~~~~~~~~~~~~~~~~~~
+``-i IDENTIFIER, --identifier IDENTIFIER``
+  Project identifier (required if not in an enrolled repository).
+
+``--dry-run``
+  List the ``gone`` series that would be abandoned without changing the
+  tracking database.
+
 ``b4 review tui``
 ~~~~~~~~~~~~~~~~~
 ``-i IDENTIFIER, --identifier IDENTIFIER``
diff --git a/src/b4/command.py b/src/b4/command.py
index 6c51e283..00c4c84b 100644
--- a/src/b4/command.py
+++ b/src/b4/command.py
@@ -594,6 +594,25 @@ def setup_parser() -> argparse.ArgumentParser:
         help='Project identifier (required if not in an enrolled repository)',
     )
 
+    # b4 review cleanup
+    sp_rev_cleanup = rev_subparsers.add_parser(
+        'cleanup', help='Abandon all tracked series in the gone state'
+    )
+    sp_rev_cleanup.add_argument(
+        '-i',
+        '--identifier',
+        dest='identifier',
+        default=None,
+        help='Project identifier (required if not in an enrolled repository)',
+    )
+    sp_rev_cleanup.add_argument(
+        '--dry-run',
+        dest='dryrun',
+        action='store_true',
+        default=False,
+        help='List the gone series that would be abandoned without deleting any records',
+    )
+
     # b4 review show-info
     sp_rev_showinfo = rev_subparsers.add_parser(
         'show-info', help='Show review branch info in a format suitable for scripting'
diff --git a/src/b4/man/b4.1.rst b/src/b4/man/b4.1.rst
index 46a50767..8eae8448 100644
--- a/src/b4/man/b4.1.rst
+++ b/src/b4/man/b4.1.rst
@@ -316,6 +316,11 @@ For options and their descriptions, see ``b4 review --help`` and
   any tracked series regardless of status, including archived ones the
   TUI no longer shows.
 
+``b4 review cleanup [--dry-run]``
+  Abandon every tracked series in the ``gone`` state. With ``--dry-run``,
+  list the series that would be cleaned up without changing the tracking
+  database.
+
 ``b4 review tui``
   Launch the review TUI.
 
diff --git a/src/b4/review/_review.py b/src/b4/review/_review.py
index a3753323..ef181a1a 100644
--- a/src/b4/review/_review.py
+++ b/src/b4/review/_review.py
@@ -472,6 +472,8 @@ def main(cmdargs: argparse.Namespace) -> None:
         b4.review.tracking.cmd_track(cmdargs)
     elif cmdargs.review_subcmd == 'forget':
         b4.review.tracking.cmd_forget(cmdargs)
+    elif cmdargs.review_subcmd == 'cleanup':
+        b4.review.tracking.cmd_cleanup(cmdargs)
     elif cmdargs.review_subcmd == 'show-info':
         cmd_show_info(cmdargs)
     elif cmdargs.review_subcmd == 'cron':
diff --git a/src/b4/review/tracking.py b/src/b4/review/tracking.py
index c913a8c2..74d7bd5b 100644
--- a/src/b4/review/tracking.py
+++ b/src/b4/review/tracking.py
@@ -873,6 +873,84 @@ def cmd_forget(cmdargs: argparse.Namespace) -> None:
     logger.info('Forgot series: %s', change_id)
 
 
+def cmd_cleanup(cmdargs: argparse.Namespace) -> None:
+    """Abandon every tracked series whose status is ``gone``.
+
+    A Gone series has no review branch left to remove, so cleanup only erases
+    its tracking records.  As with the TUI's abandon action, all records for a
+    change-id are removed together, including known revisions and patches.
+    """
+    topdir = b4.git_get_toplevel()
+    identifier = resolve_identifier(cmdargs, topdir)
+    if not identifier:
+        logger.critical('Could not determine project identifier.')
+        logger.critical('Run from an enrolled repository or specify -i identifier')
+        sys.exit(1)
+
+    if not db_exists(identifier):
+        logger.critical('Project not enrolled: %s', identifier)
+        logger.critical('Run "b4 review enroll" first')
+        sys.exit(1)
+
+    dryrun = bool(getattr(cmdargs, 'dryrun', False))
+    conn = get_db(identifier)
+    gone_series: Dict[str, Tuple[int, str]] = {}
+    try:
+        # Keep the candidate snapshot and all deletions in one write
+        # transaction so nothing else can revive something between us
+        # listing the branches and deleting them.
+        if not dryrun:
+            conn.execute('BEGIN IMMEDIATE')
+        rows = conn.execute("""
+            SELECT current.change_id, current.revision, current.subject
+              FROM series AS current
+             WHERE current.status = 'gone'
+               AND NOT EXISTS (
+                   SELECT 1 FROM series AS newer
+                    WHERE newer.change_id = current.change_id
+                      AND newer.revision > current.revision
+               )
+             ORDER BY current.change_id
+        """).fetchall()
+
+        # A legacy database can contain more than one series row for the same
+        # change-id.  Only the newest row represents the logical series'
+        # current state: an older Gone revision must not cause a newer active
+        # one to be abandoned.  Deleting a current Gone series still removes
+        # the whole change-id.
+        for change_id, revision, subject in rows:
+            if change_id not in gone_series:
+                gone_series[str(change_id)] = (
+                    int(revision),
+                    subject or '(no subject)',
+                )
+
+        if not gone_series:
+            logger.info('No Gone series to clean up.')
+            return
+
+        if dryrun:
+            logger.info('Gone series that would be abandoned:')
+        else:
+            logger.info('Abandoning Gone series:')
+        for change_id, (revision, subject) in gone_series.items():
+            logger.info('  %s (v%d): %s', change_id, revision, subject)
+
+        if dryrun:
+            logger.info('Dry run: %d Gone series would be abandoned.', len(gone_series))
+            return
+
+        for change_id in gone_series:
+            delete_series(conn, change_id, commit=False)
+        conn.commit()
+    finally:
+        if conn.in_transaction:
+            conn.rollback()
+        conn.close()
+
+    logger.info('Abandoned %d Gone series.', len(gone_series))
+
+
 def get_tracked_pw_series_ids(identifier: str) -> set[int]:
     """Get the set of Patchwork series IDs that are tracked for a project."""
     if not db_exists(identifier):
@@ -2949,13 +3027,18 @@ def rescan_branches(
 
 
 def delete_series(
-    conn: sqlite3.Connection, change_id: str, revision: Optional[int] = None
+    conn: sqlite3.Connection,
+    change_id: str,
+    revision: Optional[int] = None,
+    *,
+    commit: bool = True,
 ) -> None:
     """Delete a series from the database.
 
     When *revision* is given only that specific revision is removed;
     otherwise all revisions sharing the *change_id* are removed (legacy
-    behaviour kept for backwards compatibility).
+    behaviour kept for backwards compatibility).  Set *commit* to False when
+    the deletion is part of a larger caller-managed transaction.
     """
     if revision is not None:
         conn.execute(
@@ -2974,4 +3057,5 @@ def delete_series(
         conn.execute('DELETE FROM revisions WHERE change_id = ?', (change_id,))
         conn.execute('DELETE FROM series WHERE change_id = ?', (change_id,))
         conn.execute('DELETE FROM series_patches WHERE change_id = ?', (change_id,))
-    conn.commit()
+    if commit:
+        conn.commit()
diff --git a/src/tests/test_review_cleanup.py b/src/tests/test_review_cleanup.py
new file mode 100644
index 00000000..ffd7b2b3
--- /dev/null
+++ b/src/tests/test_review_cleanup.py
@@ -0,0 +1,228 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (C) 2026 Arm Ltd.
+
+import argparse
+import logging
+import sqlite3
+from typing import Dict
+from unittest import mock
+
+import pytest
+
+import b4.command
+from b4 import review
+from b4.review import tracking
+
+
+def test_cleanup_parser_and_dispatch() -> None:
+    parser = b4.command.setup_parser()
+    cmdargs = parser.parse_args(
+        ['review', 'cleanup', '--dry-run', '--identifier', 'project']
+    )
+
+    assert cmdargs.review_subcmd == 'cleanup'
+    assert cmdargs.dryrun is True
+    assert cmdargs.identifier == 'project'
+
+    with mock.patch('b4.review.tracking.cmd_cleanup') as cleanup:
+        review.main(cmdargs)
+
+    cleanup.assert_called_once_with(cmdargs)
+
+
+class TestCmdCleanup:
+    @staticmethod
+    def _seed(identifier: str, statuses: Dict[str, str]) -> None:
+        conn = tracking.init_db(identifier)
+        for revision, (change_id, status) in enumerate(statuses.items(), 1):
+            tracking.add_series_to_db(
+                conn,
+                change_id,
+                revision,
+                f'Subject for {change_id}',
+                'Author',
+                'author@example.com',
+                '2026-08-01T10:00:00+00:00',
+                f'{change_id}@example.com',
+                1,
+            )
+            tracking.update_series_status(conn, change_id, status, revision=revision)
+            tracking.add_revision(conn, change_id, revision, f'{change_id}@example.com')
+            conn.execute(
+                'INSERT INTO series_patches '
+                '(change_id, revision, position, message_id, subject) '
+                'VALUES (?, ?, ?, ?, ?)',
+                (
+                    change_id,
+                    revision,
+                    1,
+                    f'{change_id}-patch@example.com',
+                    f'Patch for {change_id}',
+                ),
+            )
+        conn.commit()
+        conn.close()
+
+    @staticmethod
+    def _row_counts(identifier: str, change_id: str) -> Dict[str, int]:
+        conn = tracking.get_db(identifier)
+        counts = {
+            table: conn.execute(
+                f'SELECT COUNT(*) FROM {table} WHERE change_id = ?', (change_id,)
+            ).fetchone()[0]
+            for table in ('series', 'revisions', 'series_patches')
+        }
+        conn.close()
+        return counts
+
+    def test_abandons_only_gone_series(self) -> None:
+        identifier = 'cleanup-gone'
+        statuses = {
+            'gone-one': 'gone',
+            'keep-new': 'new',
+            'gone-two': 'gone',
+            'keep-archived': 'archived',
+        }
+        self._seed(identifier, statuses)
+
+        # Abandon removes the whole logical series, not just the revision in
+        # the series table.  Keep extra known-revision data under one Gone
+        # change-id so a revision-scoped deletion would leave evidence behind.
+        conn = tracking.get_db(identifier)
+        tracking.add_revision(conn, 'gone-one', 99, 'gone-one-v99@example.com')
+        conn.execute(
+            'INSERT INTO series_patches '
+            '(change_id, revision, position, message_id, subject) '
+            'VALUES (?, ?, ?, ?, ?)',
+            (
+                'gone-one',
+                99,
+                1,
+                'gone-one-v99-patch@example.com',
+                'Extra known revision patch',
+            ),
+        )
+        conn.commit()
+        conn.close()
+
+        tracking.cmd_cleanup(argparse.Namespace(identifier=identifier, dryrun=False))
+
+        for change_id, status in statuses.items():
+            counts = self._row_counts(identifier, change_id)
+            if status == 'gone':
+                assert counts == {'series': 0, 'revisions': 0, 'series_patches': 0}
+            else:
+                assert counts == {'series': 1, 'revisions': 1, 'series_patches': 1}
+
+    def test_uses_newest_revision_status(self) -> None:
+        identifier = 'cleanup-current-status'
+        conn = tracking.init_db(identifier)
+        for change_id, statuses in (
+            ('keep-current', ('gone', 'reviewing')),
+            ('clean-current', ('reviewing', 'gone')),
+        ):
+            for revision, status in enumerate(statuses, 1):
+                tracking.add_series_to_db(
+                    conn,
+                    change_id,
+                    revision,
+                    f'{change_id} v{revision}',
+                    'Author',
+                    'author@example.com',
+                    '2026-08-01T10:00:00+00:00',
+                    f'{change_id}-v{revision}@example.com',
+                    1,
+                )
+                tracking.update_series_status(
+                    conn, change_id, status, revision=revision
+                )
+                tracking.add_revision(
+                    conn,
+                    change_id,
+                    revision,
+                    f'{change_id}-v{revision}@example.com',
+                )
+        conn.close()
+
+        tracking.cmd_cleanup(argparse.Namespace(identifier=identifier, dryrun=False))
+
+        assert self._row_counts(identifier, 'keep-current')['series'] == 2
+        assert self._row_counts(identifier, 'clean-current') == {
+            'series': 0,
+            'revisions': 0,
+            'series_patches': 0,
+        }
+
+    def test_failure_rolls_back_the_batch(
+        self, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        identifier = 'cleanup-rollback'
+        self._seed(identifier, {'gone-one': 'gone', 'gone-two': 'gone'})
+        original_delete = tracking.delete_series
+        calls = 0
+
+        def fail_on_second_delete(
+            conn: sqlite3.Connection,
+            change_id: str,
+            revision: int | None = None,
+            *,
+            commit: bool = True,
+        ) -> None:
+            nonlocal calls
+            calls += 1
+            if calls == 2:
+                raise RuntimeError('simulated cleanup failure')
+            original_delete(conn, change_id, revision, commit=commit)
+
+        monkeypatch.setattr(tracking, 'delete_series', fail_on_second_delete)
+
+        with pytest.raises(RuntimeError, match='simulated cleanup failure'):
+            tracking.cmd_cleanup(
+                argparse.Namespace(identifier=identifier, dryrun=False)
+            )
+
+        for change_id in ('gone-one', 'gone-two'):
+            assert self._row_counts(identifier, change_id) == {
+                'series': 1,
+                'revisions': 1,
+                'series_patches': 1,
+            }
+
+    def test_dry_run_lists_candidates_without_deleting(
+        self, caplog: pytest.LogCaptureFixture
+    ) -> None:
+        identifier = 'cleanup-dry-run'
+        statuses = {
+            'gone-one': 'gone',
+            'keep-new': 'new',
+            'gone-two': 'gone',
+        }
+        self._seed(identifier, statuses)
+
+        with caplog.at_level(logging.INFO, logger='b4'):
+            tracking.cmd_cleanup(argparse.Namespace(identifier=identifier, dryrun=True))
+
+        assert 'gone-one' in caplog.text
+        assert 'Subject for gone-one' in caplog.text
+        assert 'gone-two' in caplog.text
+        assert 'Subject for gone-two' in caplog.text
+        assert 'keep-new' not in caplog.text
+        assert 'Dry run' in caplog.text
+        for change_id in statuses:
+            assert self._row_counts(identifier, change_id) == {
+                'series': 1,
+                'revisions': 1,
+                'series_patches': 1,
+            }
+
+    def test_no_gone_series_is_a_noop(self, caplog: pytest.LogCaptureFixture) -> None:
+        identifier = 'cleanup-empty'
+        self._seed(identifier, {'keep-new': 'new'})
+
+        with caplog.at_level(logging.INFO, logger='b4'):
+            tracking.cmd_cleanup(
+                argparse.Namespace(identifier=identifier, dryrun=False)
+            )
+
+        assert 'No Gone series to clean up' in caplog.text
+        assert self._row_counts(identifier, 'keep-new')['series'] == 1
-- 
2.47.3

