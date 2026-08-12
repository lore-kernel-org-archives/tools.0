Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B00406261
	for <tools@linux.kernel.org>; Wed, 12 Aug 2026 21:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786571265; cv=none; b=lYGq/u0JEWqdCvyJvdi9AQPyuHTqzmTMPINoXONYa3zRZpieoVtU/Lvna9IzPNDwflZWatV4H3C27KJ/BsrSBKlzEp17rkTn9N3T5hEiPLF3RaUhk5RtT6acH2UVicwECMjrZfD5KEncBYqk28iJ8rqjuknSLFOBDRoS5DLL1Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786571265; c=relaxed/simple;
	bh=AvnpGCFcN/IOLXqadfnoBqd12rpVU+s9eOB+pzsDkG8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eKmn3nlEk8qwm3bCGIkdosZknIki66v7FWgAOfLY3X4fHxm0C5tIGKtaJOcH+dBIrRMmGEttO5mMuGpAhPEtPXIs1ZlK98yretjSI0C/2NH1rS2h45ltzt/nD5rer+t4hhVitq23Gz1qy14Ge9Vb81eIJQlu+lWphxX3AsBszGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ECxmLiRK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ECxmLiRK"
Received: by smtp.kernel.org (Postfix)
	id 9CE191F00A3A; Wed, 12 Aug 2026 21:47:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 909CC1F000E9;
	Wed, 12 Aug 2026 21:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786571261;
	bh=2x47lwq087Qo4Mj/6I10xomDdsvmcpBVooix0N7D6YU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ECxmLiRK5fwUHFlHU5ROJcZWnHjdaWqt0VmCb2M6kakMuiBrCAqWU6Nb7miY0sdFN
	 Z2OIl5wYh15EjgD9NPo21nx2zeoM16re6fBcbPwdDwnkzglO/E9x7FVMtqSn3lY/MR
	 HKx2drT9b2VStLhNLPH+6XWZl2IAXetNBbf2pkMrIhjx3/yB8FIaNrYofNDYS95TtQ
	 pIznC5TF2jv5q8B8Mtcc4n0WkCvIam+x79PKUhC7jfpYXY9Igu9r3FIW3WS/dGMmf0
	 yUrADNN51Hcun67ar7PIFqVvFTdw5dK6kEkW964tOmcaECjXR/UYTWv1XPVkWbFvr+
	 a7EyvXNuvk00Q==
From: Christian Brauner <brauner@kernel.org>
Date: Wed, 12 Aug 2026 23:47:05 +0200
Subject: [PATCH RFC v2 24/25] review-tui: expand tracked series into
 per-version rows
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260812-work-b4-multiver-rows-v2-24-305d53cd723a@kernel.org>
References: <20260812-work-b4-multiver-rows-v2-0-305d53cd723a@kernel.org>
In-Reply-To: <20260812-work-b4-multiver-rows-v2-0-305d53cd723a@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.17-dev-362b8
X-Developer-Signature: v=1; a=openpgp-sha256; l=68699; i=brauner@kernel.org;
 h=from:subject:message-id; bh=AvnpGCFcN/IOLXqadfnoBqd12rpVU+s9eOB+pzsDkG8=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTVvLy9epHzSQamo8W3t6onzU7SM8la+JYpnZfp0nstr
 vjoreVuHaUsDGJcDLJiiiwO7Sbhcst5KjYbZWrAzGFlAhnCwMUpABMRm8nwV+5zzunNX/1etjRE
 lUyX51jSq2p/893hf1wMrybcVX1dPYORYf8xd4M7+8t3zkhYmBw0JWob/yOX6AUidlkTlhWe+BO
 awgUA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Series with more than one known version become expandable.  'x' unfolds
indented child rows, one per catalog revision with the tracked one
starred, showing per-version unread badges and activity dates; 'X'
toggles every series at once.  Enter or 'e' on a child opens that
revision's thread with revision-correct seen syncing, 'd' range-diffs it
against the tracked revision directly, and every other action keeps
operating on the parent series.  Expansion state and the
(change_id, revision) cursor position survive the periodic DB-mtime
reloads and limit filtering.

Focusing a series for the next rebuild goes through a helper that also
clears the stashed version.  The stash outlives a screen that closed
without rebuilding the list, so a plain _focus_change_id assignment would
drop the cursor onto a child row nobody selected, and it is that row the
thread and range-diff actions read.

has_multiple_revisions loses its last reader here.  It counts raw catalog
rows, which miss a tracked revision the catalog never recorded.  The bulk
revision-count query goes with it: the remaining caller needs the grouped
rows anyway, so counting them is a dict lookup rather than a second pass
over the table.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 docs/maintainer/review.rst         |  40 ++
 src/b4/review/tracking.py          |   8 -
 src/b4/review_tui/_modals.py       |   7 +
 src/b4/review_tui/_tracking_app.py | 743 +++++++++++++++++++++++++++++++------
 src/tests/test_review_tracking.py  |  11 -
 src/tests/test_tui_tracking.py     |  27 +-
 6 files changed, 707 insertions(+), 129 deletions(-)

diff --git a/docs/maintainer/review.rst b/docs/maintainer/review.rst
index 5ddd9dd2..8c04e7c1 100644
--- a/docs/maintainer/review.rst
+++ b/docs/maintainer/review.rst
@@ -188,12 +188,17 @@ Key           Action
 ``e``         Thread — open the lite thread viewer (see below)
 ``a``         Action menu — context-sensitive actions (see below)
 ``d``         Range-diff between revisions
+``x``         Expand or collapse the per-version rows of a series marked
+              with ``▸`` (see :ref:`version_rows`)
 ``u``         Update — fetch latest trailers and check for newer
               revisions for the selected series; press ``Escape`` or
               ``q`` to cancel
 ``U``         Update all — same as ``u`` but for all tracked series
               (skipping snoozed); press ``Escape`` or ``q`` to cancel
               mid-run — series already updated are saved
+``X``         Expand or collapse the version rows of every multi-version
+              series in the current list at once (so a ``l`` limit scopes
+              it, in both directions)
 ``l``         Limit — filter the list of displayed series. Plain text
               matches subjects and submitters; ``s:<status>`` filters
               by status, ``t:<target-branch>`` by target branch, and
@@ -328,6 +333,41 @@ the tracking database and displayed without re-checking on subsequent
 views. The attestation check honours the :term:`b4.attestation-policy`
 and :term:`b4.attestation-staleness-days` configuration options.
 
+.. _version_rows:
+
+Version rows
+~~~~~~~~~~~~
+
+A series whose catalog holds more than one known version is marked with
+a ``▸`` before its subject. Press ``x`` to expand it into one child row
+per version (``X`` expands or collapses every such series at once). An
+asterisk marks the version the series currently tracks:
+
+.. code-block:: none
+
+   ▾ [PATCH v3,00/12] introduce the frobnicator
+     ├─ v1   12 Mar    4      introduce the frobnicator
+     ├─ v2   02 Apr    9 (3)  introduce the frobnicator
+     └─ v3*  28 Apr   15      introduce the frobnicator
+
+Each row carries that version's own message count and unread badge, so
+follow-up mail arriving on an older version's thread is still visible.
+On a version row, ``Enter`` or ``e`` opens that version's thread and
+``d`` range-diffs it against the tracked revision, skipping the revision
+picker. Every other key still acts on the parent series, except the four
+actions that drive the review branch: ``r`` (review), and **Take**,
+**Rebase** and **Upgrade** in the ``a`` action menu. That branch always
+holds the revision the series tracks, so on any other version's row ``r``
+is greyed out and the three menu entries are not offered.
+
+Update sweeps poll a few non-tracked versions of each series for new
+mail, least-recently-checked first, so a series with many versions
+fills in over successive sweeps and then keeps cycling through them —
+a late reply to an old version is noticed however many versions there
+are. Every version is browsable on demand regardless.
+
+.. versionadded:: v0.17
+
 Lite thread viewer
 ~~~~~~~~~~~~~~~~~~
 Pressing ``e`` on any series opens a mutt-style thread viewer that
diff --git a/src/b4/review/tracking.py b/src/b4/review/tracking.py
index 843808c4..7f08258e 100644
--- a/src/b4/review/tracking.py
+++ b/src/b4/review/tracking.py
@@ -2551,14 +2551,6 @@ def get_all_newest_revisions(conn: sqlite3.Connection) -> dict[str, int]:
     return {row[0]: int(row[1]) for row in cursor.fetchall()}
 
 
-def get_all_revision_counts(conn: sqlite3.Connection) -> dict[str, int]:
-    """Return {change_id: revision_count} for all change_ids."""
-    cursor = conn.execute(
-        'SELECT change_id, COUNT(*) FROM revisions GROUP BY change_id'
-    )
-    return {row[0]: int(row[1]) for row in cursor.fetchall()}
-
-
 def get_all_revisions_grouped(
     conn: sqlite3.Connection,
 ) -> dict[str, list[dict[str, Any]]]:
diff --git a/src/b4/review_tui/_modals.py b/src/b4/review_tui/_modals.py
index 23d5f566..8be61319 100644
--- a/src/b4/review_tui/_modals.py
+++ b/src/b4/review_tui/_modals.py
@@ -328,9 +328,16 @@ TRACKING_HELP_LINES = [
     '  [bold]d[/bold]         Range-diff between revisions\n',
     '  [bold]a[/bold]         Open action menu (take, rebase, etc.)\n',
     '  [bold]u[/bold]         Update selected series\n',
+    '  [bold]x[/bold]         Expand/collapse the version rows of a ▸ series\n',
+    '\n',
+    '[bold]Version rows[/bold]\n',
+    '  v2*           Asterisk marks the revision the series tracks\n',
+    '  [bold]Enter[/bold] / [bold]e[/bold] View the thread of that version\n',
+    '  [bold]d[/bold]         Range-diff that version against the tracked one\n',
     '\n',
     '[bold]App[/bold]\n',
     '  [bold]U[/bold]         Update all tracked series\n',
+    '  [bold]X[/bold]         Expand/collapse all multi-version series\n',
     '  [bold]l[/bold]         Filter series by pattern\n',
     '  [bold]s[/bold]         Suspend to shell\n',
     '  [bold]p[/bold]         Switch to Patchwork TUI\n',
diff --git a/src/b4/review_tui/_tracking_app.py b/src/b4/review_tui/_tracking_app.py
index 37377758..e4a64b6e 100644
--- a/src/b4/review_tui/_tracking_app.py
+++ b/src/b4/review_tui/_tracking_app.py
@@ -28,6 +28,7 @@ from typing import (
     List,
     Literal,
     Optional,
+    Set,
     Tuple,
     Union,
 )
@@ -544,6 +545,46 @@ def _conflicts_notice(conflicts: List[int]) -> str:
     )
 
 
+def _local_stamp(stamp: Optional[str], fmt: str) -> str:
+    """Render a stored UTC timestamp in local time, or '' if unusable.
+
+    Every date the app shows is local, and these columns hold UTC, so
+    slicing the ISO string instead puts a version up to a day out from the
+    Date: header the thread viewer displays for the very same message --
+    and out of step with the version row rendering the same value.
+    """
+    if not stamp:
+        return ''
+    try:
+        return datetime.datetime.fromisoformat(stamp).astimezone().strftime(fmt)
+    except (ValueError, TypeError):
+        return ''
+
+
+def _format_version(rev: Dict[str, Any], series: Dict[str, Any]) -> str:
+    """Summarize one known version of *series* for the details panel."""
+    revision = rev.get('revision', 1)
+    out = f'v{revision}'
+    if revision == series.get('revision', 1):
+        out += ' (tracked)'
+    count = rev.get('message_count')
+    if count is None:
+        out += ' — - msgs (- unseen)'
+    else:
+        unseen = _unseen_delta(count, rev.get('seen_message_count'))
+        out += f' — {count} msgs ({unseen} unseen)'
+    # 'posted', not 'found': discovery dates a revision from its own Date:
+    # header, so the column holds when the version went out rather than when
+    # b4 noticed it (see add_revision).
+    posted = _local_stamp(rev.get('found_at'), '%Y-%m-%d')
+    if posted:
+        out += f', posted {posted}'
+    last_mail = _local_stamp(rev.get('last_mail_at'), '%Y-%m-%d')
+    if last_mail:
+        out += f', last activity {last_mail}'
+    return out
+
+
 def _format_snooze_until(value: str) -> str:
     """Format a snoozed_until value for display.
 
@@ -793,7 +834,23 @@ def _append_msgs(
     label.append(f'{badge:<4s}', style=badge_style)
 
 
-class TrackedSeriesItem(ListItem):
+class TrackingListItem(ListItem):
+    """A row of the tracking list: a series, or one version of one.
+
+    Carrying ``rev`` on both kinds is what lets every handler ask "which
+    series and which version is the cursor on?" once, instead of each one
+    re-deriving it from the row's type.
+    """
+
+    series: Dict[str, Any]
+    rev: Optional[Dict[str, Any]] = None
+
+    @property
+    def selection(self) -> Tuple[Dict[str, Any], Optional[Dict[str, Any]]]:
+        return self.series, self.rev
+
+
+class TrackedSeriesItem(TrackingListItem):
     """A single tracked series entry in the listing."""
 
     DEFAULT_CSS = """
@@ -805,9 +862,18 @@ class TrackedSeriesItem(ListItem):
     }
     """
 
-    def __init__(self, series: Dict[str, Any]) -> None:
+    def __init__(
+        self,
+        series: Dict[str, Any],
+        expanded: bool = False,
+        has_versions: bool = False,
+        has_unseen_versions: bool = False,
+    ) -> None:
         super().__init__()
         self.series = series
+        self.expanded = expanded
+        self.has_versions = has_versions
+        self.has_unseen_versions = has_unseen_versions
         status = series.get('status', 'new')
         if _effective_tier(series) >= 2:
             self.add_class('non-actionable')
@@ -843,6 +909,11 @@ class TrackedSeriesItem(ListItem):
         width = len(str(num_patches)) if num_patches > 0 else 1
         parts = extras + [f'v{revision}', f'{"0" * width}/{num_patches:0{width}d}']
         subject_display = f'[{",".join(parts)}] {ls.subject}'
+        # Series with more than one known version can be expanded with [x]
+        marker = ''
+        if self.has_versions:
+            # U+25BE black down-pointing / U+25B8 black right-pointing triangle
+            marker = '▾' if self.expanded else '▸'
         if display_width(submitter) > 20:
             while display_width(submitter) > 19:
                 submitter = submitter[:-1]
@@ -865,7 +936,99 @@ class TrackedSeriesItem(ListItem):
             self.series.get('message_count'),
             self.series.get('seen_message_count'),
         )
-        label.append(f'  {symbol}{flag}  {subject_display}')
+        # The expander shares the 4-wide status field with the status
+        # symbol and the suffix flag rather than taking a column of its
+        # own: appended after it, the Subject column would sit two to the
+        # right on multi-version series only, leaving the list ragged and
+        # every row out of step with the header.
+        label.append(f'  {symbol}{flag}')
+        if marker:
+            # Accented when a version other than the tracked one has unread
+            # mail: the Msgs column above covers the tracked revision only,
+            # so without this the row is identical whether or not an older
+            # version just received a reply.
+            marker_style = ''
+            if self.has_unseen_versions:
+                marker_style = f'bold {resolve_styles(self.app)["warning"]}'
+            label.append(marker, style=marker_style)
+        else:
+            label.append(' ')
+        label.append(' ')
+        label.append(subject_display)
+        yield Label(label, markup=False)
+
+
+class TrackedRevisionItem(TrackingListItem):
+    """A single known version of an expanded series.
+
+    Rendered as a child row underneath its TrackedSeriesItem, with the
+    submitter column replaced by a tree glyph and the version number.
+    """
+
+    DEFAULT_CSS = """
+    TrackedRevisionItem Label {
+        text-style: dim;
+    }
+    """
+
+    # Narrowed from the base, which allows None for series rows: a version
+    # row always has one, and callers read it without a None check.
+    rev: Dict[str, Any]
+
+    def __init__(
+        self,
+        series: Dict[str, Any],
+        rev: Dict[str, Any],
+        is_tracked: bool,
+        is_last: bool,
+    ) -> None:
+        super().__init__()
+        self.series = series
+        # pyright anchors the narrowing above to this assignment, and rejects
+        # it because a mutable attribute's type is invariant.
+        self.rev = rev  # pyright: ignore[reportIncompatibleVariableOverride]
+        self.is_tracked = is_tracked
+        self.is_last = is_last
+
+    def compose(self) -> ComposeResult:
+        # U+2514/U+251C box drawings light up-and-right / vertical-and-right
+        tree = '└─' if self.is_last else '├─'
+        mark = '*' if self.is_tracked else ''
+        version = f'  {tree} v{self.rev.get("revision", 1)}{mark}'
+        # Date of the last known activity, falling back to when the revision
+        # was posted.  It shares the 20-wide submitter field with the version
+        # number rather than taking the parent's status columns: those carry
+        # the status symbol and the expander, and a date under a header that
+        # reads 'S' describes neither.  There is room here -- the deepest
+        # version label is nine columns of a twenty-column field.
+        date_str = _local_stamp(
+            self.rev.get('last_mail_at') or self.rev.get('found_at'), '%d %b'
+        )
+        # Show each version's own title, prefix-stripped -- the version
+        # column already carries the vN part.  Fall back to the series
+        # subject when the catalog has none.
+        rev_subject = self.rev.get('subject') or self.series.get('subject') or ''
+        if rev_subject:
+            rev_subject = b4.LoreSubject(rev_subject).subject
+        label = RichText(no_wrap=True, overflow='ellipsis')
+        # Version left, date right, both inside the submitter field.  The
+        # date is truncated rather than padded, so a locale whose abbreviated
+        # month runs long cannot push the field wide and shift the columns
+        # after it.
+        label.append(pad_display(f'{version:<10s}{date_str:.9s}', 20))
+        # Attestation (1), separator (1) and A·R·T (7) stay blank
+        label.append(' ' * 9)
+        _append_msgs(
+            label,
+            self.app,
+            self.rev.get('message_count'),
+            self.rev.get('seen_message_count'),
+        )
+        # The six the parent spends on status, expander and marker, so
+        # Subject starts at the same column on both -- and on the header.
+        label.append(' ' * 6)
+        if rev_subject:
+            label.append(rev_subject)
         yield Label(label, markup=False)
 
 
@@ -967,10 +1130,12 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
         'check': 'Series',
         'thread': 'Series',
         'range_diff': 'Series',
+        'toggle_expand': 'Series',
         'action': 'Series',
         'update_one': 'Series',
         'target_branch': 'Series',
         'update_all': 'App',
+        'expand_all': 'App',
         'process_queue': 'App',
         'limit': 'App',
         'suspend': 'App',
@@ -992,7 +1157,9 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
         Binding('a', 'action', 'action'),
         Binding('u', 'update_one', 'update'),
         Binding('d', 'range_diff', 'range-diff'),
+        Binding('x', 'toggle_expand', 'versions'),
         # App-global actions
+        Binding('X', 'expand_all', 'Expand all', key_display='X'),
         Binding('l', 'limit', 'limit'),
         Binding('s', 'suspend', 'shell'),
         Binding('p', 'patchwork', 'patchwork'),
@@ -1024,6 +1191,15 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
         self._patatt_sign = patatt_sign
         self._all_series: List[Dict[str, Any]] = []
         self._selected_series: Optional[Dict[str, Any]] = None
+        # Rows showing per-version child rows, and the child row (if any) the
+        # cursor is on — both survive a list rebuild.  Keyed by (change_id,
+        # tracked revision), not change_id alone: rescan_branches can leave a
+        # change_id with more than one live series row and the list renders
+        # each separately, so a bare change_id expands both at once.
+        self._expanded_rows: set[Tuple[str, int]] = set()
+        self._selected_revision: Optional[Dict[str, Any]] = None
+        self._focus_series_revision: Optional[int] = None
+        self._focus_revision: Optional[int] = None
         self._limit_pattern: str = ''
         self._db_mtime: float = 0.0
         # Detect patchwork configuration
@@ -1048,7 +1224,6 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
         # when u/U update runs or actions change tracking data.
         self._cached_branch_tips: Optional[Dict[str, str]] = None
         self._cached_newest_revisions: Optional[Dict[str, int]] = None
-        self._cached_revision_counts: Optional[Dict[str, int]] = None
         self._cached_revisions: Optional[Dict[str, List[Dict[str, Any]]]] = None
         # A None value is a branch whose tip carries no tracking trailer
         # block; cached as a miss so the refill below converges.
@@ -1059,22 +1234,98 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
     def _invalidate_caches(self, change_id: Optional[str] = None) -> None:
         """Drop cached data so the next _load_series re-fetches.
 
-        If change_id is given, only evict that series from the ART
-        cache (branch tips and revision data are cheap dict lookups
-        and get rebuilt from the bulk query anyway).  Without
-        change_id, drop everything.
+        If change_id is given, evict just that series from the ART cache
+        and drop the rest; without change_id, drop the ART cache wholesale
+        too.  Keeping the other series' ART entries is the point of the
+        targeted form: recomputing one is a `git cat-file` per branch.
+
+        The revision caches have to go even for a targeted invalidation:
+        _load_series only refills them when _cached_newest_revisions is
+        None, so leaving them in place pins the version rows, the expander
+        marker and both revision-count gates to pre-action data -- and
+        _check_db_changed cannot heal it, because the caller re-stamps the
+        DB mtime on the way through.
         """
         if change_id is not None:
             branch_name = f'b4/review/{change_id}'
             if self._cached_art_counts and branch_name in self._cached_art_counts:
                 del self._cached_art_counts[branch_name]
+            # Re-resolved: an upgrade renames a branch onto this one and the
+            # batch trusts the SHA it is handed.  Dropped rather than
+            # refetched here: _load_series refills a None dict with the same
+            # `git for-each-ref`, so resolving it inline only moves that
+            # subprocess onto the message pump -- and every handler that
+            # invalidates without reloading pays for a batch it never reads.
+            self._cached_branch_tips = None
+            self._cached_newest_revisions = None
+            self._cached_revisions = None
             return
         self._cached_branch_tips = None
         self._cached_newest_revisions = None
-        self._cached_revision_counts = None
         self._cached_revisions = None
         self._cached_art_counts = None
 
+    def _focus_series(self, change_id: str, keep_version: bool = False) -> None:
+        """Focus a series row on the next rebuild, not one of its versions.
+
+        Clearing the stashed version matters: it outlives a screen that
+        closed without rebuilding the list, and would otherwise drop the
+        cursor onto a child row nobody selected.
+
+        *keep_version* holds the cursor where it already is, for an action
+        that changes the series' status and nothing about which versions it
+        has.  Without it, snoozing from a version row bounced the cursor up
+        to the parent while setting a target branch from the same row left
+        it alone -- two status-only actions disagreeing about where the
+        cursor belongs.  It stays off for the actions that repoint the
+        series at another revision, where the stashed version names a row
+        that may no longer exist.
+        """
+        self._focus_change_id = change_id
+        # Left unset otherwise: the action that focuses a series may be the
+        # one that moved it to another revision, so only the change_id is
+        # reliable.
+        self._focus_series_revision = None
+        self._focus_revision = None
+        if not keep_version:
+            return
+        series = self._selected_series
+        if series is None or series.get('change_id') != change_id:
+            return
+        self._focus_series_revision = series.get('revision')
+        if self._selected_revision is not None:
+            self._focus_revision = self._selected_revision.get('revision')
+
+    @staticmethod
+    def _row_key(series: Dict[str, Any]) -> Tuple[str, int]:
+        """Identity of a list row: a change_id can own more than one."""
+        return (series.get('change_id', ''), series.get('revision', 1))
+
+    def _stash_focus(self) -> None:
+        """Remember the highlighted row so the next _refresh_list restores it.
+
+        Falls back to the row under the cursor when nothing is selected:
+        [escape] clears the selection without moving the cursor, and the
+        list-wide actions that follow ([X]) need no selection at all.  With
+        no hint, _refresh_list restores by absolute index -- into a list
+        whose length [X] has just changed.
+        """
+        series = self._selected_series
+        if series is None:
+            try:
+                item = self.query_one('#tracking-list', ListView).highlighted_child
+            except NoMatches:
+                item = None
+            if isinstance(item, TrackingListItem):
+                series = item.series
+        if series:
+            self._focus_change_id, self._focus_series_revision = self._row_key(series)
+        self._focus_revision = (
+            self._selected_revision.get('revision')
+            if self._selected_revision is not None
+            else None
+        )
+
     def _refresh_msg_count(self, series: Dict[str, Any], total_messages: int) -> None:
         """Opportunistically refresh message count after fetching messages."""
         if not self._identifier:
@@ -1118,6 +1369,9 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
             with Horizontal(classes='details-row', id='detail-revisions-row'):
                 yield Static('Revisions:', classes='details-label')
                 yield Static('', id='detail-revisions', markup=False)
+            with Horizontal(classes='details-row', id='detail-version-row'):
+                yield Static('Version:', classes='details-label')
+                yield Static('', id='detail-version', markup=False)
             with Horizontal(classes='details-row', id='detail-branch-row'):
                 yield Static('Branch:', classes='details-label')
                 yield Static('', id='detail-branch', markup=False)
@@ -1169,10 +1423,7 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
                     # Reload so the new revisions show up right away; if a
                     # modal is up, the DB mtime poll picks it up instead.
                     if len(self.app.screen_stack) == 1:
-                        if self._selected_series:
-                            self._focus_change_id = self._selected_series.get(
-                                'change_id'
-                            )
+                        self._stash_focus()
                         self._invalidate_caches()
                         self._load_series()
                 elif not conflicts:
@@ -1204,8 +1455,7 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
                 # pick up the change once the modal closes.
                 if len(self.app.screen_stack) > 1:
                     return
-                if self._selected_series:
-                    self._focus_change_id = self._selected_series.get('change_id')
+                self._stash_focus()
                 self._invalidate_caches()
                 self._load_series()
 
@@ -1239,24 +1489,30 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
         except Exception:
             conn = None
         if self._cached_newest_revisions is None and conn:
+            # Both land together or neither: the guard tests the first, so
+            # a partial fill would never be retried and the version rows
+            # would stay gone for the rest of the session.
             try:
-                self._cached_newest_revisions = (
-                    b4.review.tracking.get_all_newest_revisions(conn)
-                )
-                self._cached_revision_counts = (
-                    b4.review.tracking.get_all_revision_counts(conn)
-                )
-                self._cached_revisions = b4.review.tracking.get_all_revisions_grouped(
-                    conn
-                )
+                all_newest = b4.review.tracking.get_all_newest_revisions(conn)
+                all_grouped = b4.review.tracking.get_all_revisions_grouped(conn)
             except Exception:
                 pass
+            else:
+                self._cached_newest_revisions = all_newest
+                self._cached_revisions = all_grouped
         newest_revisions = self._cached_newest_revisions or {}
-        revision_counts = self._cached_revision_counts or {}
         all_revisions = self._cached_revisions or {}
         if conn:
             conn.close()
 
+        # Live rows grouped by change_id, so version merging sees every
+        # revision a sibling row tracks -- the same rule
+        # get_revisions_with_tracked applies on the DB side.  _all_series
+        # is already archive-free.
+        live_rows: Dict[str, List[Dict[str, Any]]] = {}
+        for series in self._all_series:
+            live_rows.setdefault(series.get('change_id', ''), []).append(series)
+
         # --- First pass: branch existence + revision flags ---
         art_branches: Dict[str, str] = {}
         for series in self._all_series:
@@ -1271,17 +1527,21 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
             newest = newest_revisions.get(change_id)
             if newest is not None and newest > current_rev:
                 series['has_newer'] = True
-            rev_count = revision_counts.get(change_id, 0)
-            if rev_count > 1:
-                series['has_multiple_revisions'] = True
-            if rev_count == 0 and series.get('status') not in (
-                'new',
-                'gone',
-                'snoozed',
-            ):
-                series['needs_update'] = True
             # Stash revisions list for the detail panel
             series['_revisions'] = all_revisions.get(change_id, [])
+            series['_sibling_rows'] = live_rows.get(change_id) or [series]
+            # Whether revision data was ever fetched.  The v11 backfill gives
+            # every series row a catalog entry, so discount the one mirroring
+            # this row and fall back to the sweep watermark.
+            rev_count = len(series['_revisions'])
+            if any(r.get('revision') == current_rev for r in series['_revisions']):
+                rev_count -= 1
+            if (
+                rev_count <= 0
+                and not series.get('last_update_check')
+                and series.get('status') not in ('new', 'gone', 'snoozed')
+            ):
+                series['needs_update'] = True
 
             # Collect branches needing ART counts
             if topdir and series.get('status') in (
@@ -1327,6 +1587,25 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
             if branch_name in art_map:
                 series['art'] = art_map[branch_name]
 
+        # _row_key carries the tracked revision, so an upgrade moves a row out
+        # from under its key and silently collapses it.  Migrated only for a
+        # change_id owning one row, the only unambiguous successor.
+        if self._expanded_rows:
+            live: Dict[str, set[int]] = {}
+            for series in self._all_series:
+                cid, rev = self._row_key(series)
+                live.setdefault(cid, set()).add(rev)
+            kept: set[Tuple[str, int]] = set()
+            for cid, rev in self._expanded_rows:
+                revs = live.get(cid)
+                if not revs:
+                    continue
+                if rev in revs:
+                    kept.add((cid, rev))
+                elif len(revs) == 1:
+                    kept.add((cid, next(iter(revs))))
+            self._expanded_rows = kept
+
         # Tag accepted series that have a queued thank-you letter.
         # This is a display-only pseudo-state, not stored in the DB.
         queued_cids = b4.ty.get_queued_change_ids(dryrun=self._email_dryrun)
@@ -1358,8 +1637,7 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
         except OSError:
             return
         if mtime != self._db_mtime:
-            if self._selected_series:
-                self._focus_change_id = self._selected_series.get('change_id')
+            self._stash_focus()
             self._invalidate_caches()
             self._load_series()
 
@@ -1396,12 +1674,16 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
                     return False
         return True
 
+    def _displayed_series(self) -> List[Dict[str, Any]]:
+        """The series the list is currently showing, limit filter applied."""
+        if not self._limit_pattern:
+            return self._all_series
+        return [
+            s for s in self._all_series if self._matches_limit(s, self._limit_pattern)
+        ]
+
     async def _refresh_list(self) -> None:
-        display_series = self._all_series
-        if self._limit_pattern:
-            display_series = [
-                s for s in display_series if self._matches_limit(s, self._limit_pattern)
-            ]
+        display_series = self._displayed_series()
 
         try:
             left = self.query_one('#title-left', Static)
@@ -1419,6 +1701,15 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
         left.update(title_text)
 
         scroll_y = ReplacementListView.capture_scroll(self, '#tracking-list')
+        # Where the cursor already is, as the fallback for when no focus
+        # hint is stashed.  An expand queues _refresh_list directly rather
+        # than through _load_series, so two can land in one message-pump
+        # batch and the second would otherwise find the hint consumed and
+        # send the cursor to the top.
+        try:
+            prev_index = self.query_one('#tracking-list', ListView).index or 0
+        except NoMatches:
+            prev_index = 0
 
         # Suppress rendering while we swap old widgets for new ones.
         # Without this, the remove-then-mount sequence can produce a
@@ -1437,27 +1728,95 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
                     id='tracking-empty',
                 )
                 await self.mount(empty, before=self.query_one(Footer))
+                # Nothing is highlighted and this returns above the block that
+                # re-derives the selection, so a stale one would keep acting on
+                # a hidden series.  The focus hint stays: it is only a hint.
+                self._selected_series = None
+                self._selected_revision = None
+                self.refresh_bindings()
                 return
 
             header_text = f'{"Submitter":<20s}{"A":>1s} {"A·R·T":>7s}  {"Msgs":<8s}{"S":<6s}{"Subject"}'
             header = Static(header_text, id='tracking-header')
 
-            list_items: List[ListItem] = [TrackedSeriesItem(s) for s in display_series]
+            # Revisions another live row of the same change_id tracks and
+            # badges itself.  From every live row, not the filtered view: a
+            # sibling the limit hides still owns its revision.
+            tracked_elsewhere: Dict[str, Set[int]] = {}
+            for other in self._all_series:
+                tracked_elsewhere.setdefault(other.get('change_id', ''), set()).add(
+                    other.get('revision', 1)
+                )
+
+            list_items: List[ListItem] = []
+            for series in display_series:
+                revs = self._merge_tracked_revision(series)
+                has_versions = len(revs) > 1
+                tracked = series.get('revision', 1)
+                expanded = has_versions and self._row_key(series) in self._expanded_rows
+                mine = tracked_elsewhere.get(series.get('change_id', ''), set()) - {
+                    tracked
+                }
+                list_items.append(
+                    TrackedSeriesItem(
+                        series,
+                        expanded=expanded,
+                        has_versions=has_versions,
+                        has_unseen_versions=any(
+                            _unseen_delta(
+                                rev.get('message_count'),
+                                rev.get('seen_message_count'),
+                            )
+                            > 0
+                            for rev in revs
+                            if rev.get('revision') != tracked
+                            and rev.get('revision') not in mine
+                        ),
+                    )
+                )
+                if not expanded:
+                    continue
+                for idx, rev in enumerate(revs):
+                    list_items.append(
+                        TrackedRevisionItem(
+                            series,
+                            rev,
+                            is_tracked=rev.get('revision') == tracked,
+                            is_last=idx == len(revs) - 1,
+                        )
+                    )
             lv = ReplacementListView(*list_items, id='tracking-list', scroll_y=scroll_y)
             await self.mount(header, before=self.query_one(Footer))
             await self.mount(lv, before=self.query_one(Footer))
 
-        new_index = 0
+        new_index = min(prev_index, len(list_items) - 1) if list_items else 0
         if self._focus_change_id:
-            for idx, item in enumerate(list_items):
-                if (
-                    isinstance(item, TrackedSeriesItem)
-                    and item.series.get('change_id') == self._focus_change_id
-                ):
-                    new_index = idx
-                    break
+            parents = [
+                (idx, item)
+                for idx, item in enumerate(list_items)
+                if isinstance(item, TrackedSeriesItem)
+                and item.series.get('change_id') == self._focus_change_id
+            ]
+            # A change_id can own more than one live row.  Prefer the one whose
+            # revision was stashed, and fall back to the first: an upgrade
+            # moves the row's revision out from under the stash, and
+            # _focus_series() deliberately stashes no revision at all.
+            chosen = next(
+                (
+                    idx
+                    for idx, item in parents
+                    if item.series.get('revision') == self._focus_series_revision
+                ),
+                parents[0][0] if parents else None,
+            )
+            if chosen is not None:
+                new_index = chosen
+                if self._focus_revision is not None:
+                    new_index = self._find_focus_child(list_items, chosen)
             self._focus_change_id = None
+            self._focus_series_revision = None
         lv.index = new_index
+        self._focus_revision = None
         lv.focus()
 
         # Populate the details panel for the highlighted item now that
@@ -1466,10 +1825,29 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
         # Also sync _selected_series here so action_action() reads fresh
         # status without waiting for the async Highlighted message to
         # be processed from the queue.
-        highlighted = lv.highlighted_child
-        if isinstance(highlighted, TrackedSeriesItem):
-            self._selected_series = highlighted.series
-            self._show_details(highlighted.series)
+        self._select(lv.highlighted_child)
+
+    def _select(self, item: Optional[ListItem]) -> None:
+        """Make *item* the selection and mirror it into the details panel."""
+        if not isinstance(item, TrackingListItem):
+            return
+        self._selected_series, self._selected_revision = item.selection
+        self._show_details(self._selected_series, rev=self._selected_revision)
+
+    def _find_focus_child(self, list_items: List[ListItem], parent_idx: int) -> int:
+        """Index of the _focus_revision child row below *parent_idx*.
+
+        Falls back to the parent index when that version is no longer
+        listed — it may have gone away, or the series may have been
+        collapsed since the focus was stashed.
+        """
+        for idx in range(parent_idx + 1, len(list_items)):
+            item = list_items[idx]
+            if not isinstance(item, TrackedRevisionItem):
+                break
+            if item.rev.get('revision') == self._focus_revision:
+                return idx
+        return parent_idx
 
     def action_limit(self) -> None:
         self.push_screen(
@@ -1484,8 +1862,7 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
         if result is None:
             return
         self._limit_pattern = result
-        if self._selected_series:
-            self._focus_change_id = self._selected_series.get('change_id')
+        self._stash_focus()
         self._load_series()
 
     def action_cursor_down(self) -> None:
@@ -1500,17 +1877,55 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
         except Exception:
             pass
 
+    def action_toggle_expand(self) -> None:
+        """Show or hide the version rows of the selected series."""
+        series = self._selected_series
+        if not series or len(self._merge_tracked_revision(series)) < 2:
+            return
+        key = self._row_key(series)
+        if key in self._expanded_rows:
+            self._expanded_rows.discard(key)
+            # The highlighted version row is about to go away
+            self._selected_revision = None
+        else:
+            self._expanded_rows.add(key)
+        self._stash_focus()
+        self.call_later(self._refresh_list)
+
+    def action_expand_all(self) -> None:
+        """Expand every multi-version series, or collapse them all."""
+        # Scoped to what the limit filter is showing: judging "are they all
+        # expanded already?" against hidden rows makes the first press
+        # expand nothing the maintainer can see.
+        expandable = {
+            self._row_key(s)
+            for s in self._displayed_series()
+            if len(self._merge_tracked_revision(s)) > 1
+        }
+        if not expandable:
+            return
+        if expandable - self._expanded_rows:
+            self._expanded_rows |= expandable
+        else:
+            # Collapsing is scoped the same way, or a series the filter
+            # hides silently folds back up.
+            self._expanded_rows -= expandable
+            self._selected_revision = None
+        self._stash_focus()
+        self.call_later(self._refresh_list)
+
     def on_list_view_highlighted(self, event: ListView.Highlighted) -> None:
         if event.list_view.id != 'tracking-list':
             return
-        item = event.item
-        if isinstance(item, TrackedSeriesItem):
-            self._selected_series = item.series
-            self._show_details(item.series)
+        self._select(event.item)
         self.refresh_bindings()
 
     def on_list_view_selected(self, event: ListView.Selected) -> None:
         if event.list_view.id == 'tracking-list':
+            # A version row opens that version's thread
+            if isinstance(event.item, TrackedRevisionItem):
+                self.action_thread()
+                return
             if not self._selected_series:
                 return
             status = self._selected_series.get('status', 'new')
@@ -1568,12 +1983,35 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
         'snoozed': frozenset(
             {'review', 'range_diff', 'unsnooze', 'abandon', 'target_branch'}
         ),
-        'thanked': frozenset({'review', 'archive'}),
-        'gone': frozenset({'abandon', 'review'}),
+        # range_diff is available wherever version rows are: [x] expands a
+        # series in any state, and 'd' on a child row is documented to work.
+        # It needs no branch -- compute_range_diff reconstructs both sides
+        # from the catalog.
+        'thanked': frozenset({'review', 'range_diff', 'archive'}),
+        'gone': frozenset({'abandon', 'review', 'range_diff'}),
     }
     # All state-gated actions (union of all per-state sets)
     _GATED_ACTIONS = frozenset().union(*_STATE_ACTIONS.values())
 
+    # Acts on the revision the series tracks, not the row under the cursor:
+    # refused on another version's row by both the key and the action menu.
+    # 'review' checks the review branch out; 'take' and 'rebase' operate on
+    # that same branch, built from the tracked revision; 'upgrade' archives
+    # it, applies the newer revision and renames the result back.  All four
+    # would otherwise run against a version the cursor is not on.
+    #
+    # 'upgrade' is also gated in check_action directly, which returns for it
+    # before this frozenset is consulted; this entry covers the action menu.
+    _TRACKED_ONLY_ACTIONS = frozenset({'review', 'take', 'rebase', 'upgrade'})
+
+    def _on_other_version(self) -> bool:
+        """Whether the cursor is on a version row that is not the tracked one."""
+        if self._selected_revision is None or self._selected_series is None:
+            return False
+        return self._selected_revision.get('revision') != self._selected_series.get(
+            'revision'
+        )
+
     def check_action(self, action: str, parameters: Tuple[Any, ...]) -> Optional[bool]:
         """Hide status-specific actions based on the selected series."""
         if action == 'process_queue':
@@ -1588,8 +2026,20 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
             # any state that can hold one (including accepted/thanked, e.g. a
             # series kept back from auto-archiving because a newer revision
             # appeared), not only a checked-out 'reviewing' branch.
+            #
+            # It still moves the review branch, though -- archive, git am,
+            # rename -- against the revision the series tracks, so it is
+            # refused on another version's row for the same reason review,
+            # take and rebase are.  It cannot go in _TRACKED_ONLY_ACTIONS:
+            # this branch returns before that check is reached.
+            return (
+                bool(self._selected_series and self._selected_series.get('has_newer'))
+                and not self._on_other_version()
+            )
+        if action == 'toggle_expand':
             return bool(
-                self._selected_series and self._selected_series.get('has_newer')
+                self._selected_series
+                and len(self._merge_tracked_revision(self._selected_series)) > 1
             )
         if action in self._GATED_ACTIONS:
             if not self._selected_series:
@@ -1597,8 +2047,18 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
             status = self._selected_series.get('status', 'new')
             if action not in self._STATE_ACTIONS.get(status, frozenset()):
                 return False
+            if action in self._TRACKED_ONLY_ACTIONS and self._on_other_version():
+                # These act on the review branch, which holds the revision
+                # the series tracks and not the one the cursor is sitting
+                # on.  Every other key acting on the parent is harmless;
+                # these build or move a branch, so they are greyed out
+                # rather than quietly doing that for a different version.
+                return False
             if action == 'range_diff':
-                return bool(self._selected_series.get('has_multiple_revisions'))
+                # Same predicate as toggle_expand: a raw catalog count
+                # misses a tracked revision the catalog never recorded,
+                # leaving an expanded version row with 'd' disabled.
+                return len(self._merge_tracked_revision(self._selected_series)) > 1
             if action == 'target_branch':
                 return self._has_target_branches
             return True
@@ -1657,6 +2117,13 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
             if status != 'thanked':
                 actions.append(('abandon', 'Abandon series'))
             actions.append(('archive', 'Archive series'))
+        if self._on_other_version():
+            # _on_action_selected dispatches directly, so Textual never
+            # consults check_action for a menu pick.  Only this rule, though:
+            # the menu deliberately offers actions no key binds.
+            actions = [
+                entry for entry in actions if entry[0] not in self._TRACKED_ONLY_ACTIONS
+            ]
         self.push_screen(
             ActionScreen(actions, shortcuts=_ACTION_SHORTCUTS),
             callback=self._on_action_selected,
@@ -1822,10 +2289,19 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
         self._checkout_new_series()
 
     def action_thread(self) -> None:
-        """View a series thread in the lite thread viewer."""
+        """View a series thread in the lite thread viewer.
+
+        A highlighted version row views that version's thread; otherwise
+        the thread of the revision the series tracks.
+        """
         if not self._selected_series:
             return
-        message_id = self._selected_series.get('message_id', '')
+        source = (
+            self._selected_revision
+            if self._selected_revision is not None
+            else self._selected_series
+        )
+        message_id = source.get('message_id', '')
         if not message_id:
             self.notify('No message-id available for this series', severity='error')
             return
@@ -1834,10 +2310,16 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
             tracking_info = {
                 'identifier': self._identifier,
                 'change_id': self._selected_series.get('change_id', ''),
-                'revision': self._selected_series.get('revision', 1),
-                'is_rethreaded': bool(self._selected_series.get('is_rethreaded')),
+                'revision': source.get('revision', 1),
+                'is_rethreaded': bool(source.get('is_rethreaded')),
             }
-        self._focus_change_id = self._selected_series.get('change_id')
+        # No _stash_focus() here.  Viewing a thread rebuilds nothing by
+        # itself -- re-reading an already-read thread writes nothing, so the
+        # DB-mtime poll does not fire -- and the hint would then outlive the
+        # screen and be spent by whatever reloads next, parking the cursor
+        # on this series' version row from an unrelated action.  The only
+        # rebuild that can follow is _check_db_changed's, which stashes for
+        # itself.
         from b4.review_tui._lite_app import LiteThreadScreen
 
         self.push_screen(
@@ -2225,8 +2707,17 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
         # Exit to review mode
         self.exit(branch_name)
 
-    def _show_details(self, series: Dict[str, Any]) -> None:
+    def _show_details(
+        self, series: Dict[str, Any], rev: Optional[Dict[str, Any]] = None
+    ) -> None:
+        """Fill the details panel for *series*, or for one of its versions.
 
+        With *rev* given the version-specific fields (subject, link) come
+        from that revision instead of the tracked one.  Fields the catalog
+        does not carry per revision -- the patch count and the sent date --
+        are suppressed rather than filled in from the tracked revision,
+        which would attribute another version's numbers to this one.
+        """
         try:
             panel = self.query_one('#details-panel', Vertical)
         except NoMatches:
@@ -2234,11 +2725,17 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
 
         raw_subject = series.get('subject', '(no subject)')
         revision = series.get('revision', 1)
+        other_version = rev is not None and rev.get('revision') != revision
+        if rev is not None:
+            raw_subject = rev.get('subject') or raw_subject
+            revision = rev.get('revision', revision)
         num_patches = series.get('num_patches', 0) or 0
         ls = b4.LoreSubject(raw_subject)
         extras = ls.get_extra_prefixes(exclude=['patch'])
         width = len(str(num_patches)) if num_patches > 0 else 1
-        parts = extras + [f'v{revision}', f'{"0" * width}/{num_patches:0{width}d}']
+        parts = extras + [f'v{revision}']
+        if not other_version:
+            parts.append(f'{"0" * width}/{num_patches:0{width}d}')
         subject = f'[{",".join(parts)}] {ls.subject}'
 
         sender_name = series.get('sender_name', 'Unknown')
@@ -2249,15 +2746,21 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
 
         # Create link URL from message-id using linkmask
         link_url = ''
-        if message_id:
+        if rev is not None:
+            link_url = rev.get('link') or ''
+            message_id = rev.get('message_id', '')
+        if not link_url and message_id:
             config = b4.get_main_config()
             linkmask = config.get('linkmask', b4.LOREADDR + '/%s')
             if isinstance(linkmask, str) and '%s' in linkmask:
                 link_url = linkmask % message_id
 
-        # Convert ISO date to RFC 822 in local timezone
+        # Convert ISO date to RFC 822 in local timezone.  Only the tracked
+        # revision has a recorded send date; for the others the Version:
+        # row below reports what the catalog does know (first seen, last
+        # activity).
         sent_str = 'Unknown'
-        sent_at = series.get('sent_at', '')
+        sent_at = '' if other_version else series.get('sent_at', '')
         if sent_at:
             try:
                 dt = datetime.datetime.fromisoformat(sent_at)
@@ -2282,11 +2785,15 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
         self.query_one('#detail-changeid', Static).update(change_id)
         self.query_one('#detail-link', Static).update(link_url)
 
-        # Attestation row
-        att = series.get('attestation') or ''
+        # Attestation row.  Stored per series row, so it describes the
+        # tracked revision only -- showing it beside another version's
+        # subject would report that version as signed and verified.
+        att = '' if other_version else (series.get('attestation') or '')
         att_row = self.query_one('#detail-attestation-row', Horizontal)
         att_widget = self.query_one('#detail-attestation', Static)
-        if att == 'pending' or att == '':
+        if other_version:
+            att_row.display = False
+        elif att == 'pending' or att == '':
             att_widget.update(RichText('pending (run [u]pdate)', style='dim'))
             att_row.display = True
         elif att == 'none':
@@ -2300,12 +2807,21 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
             else:
                 att_row.display = False
 
-        # Show known revisions (precomputed in _load_series)
+        # Show known revisions (precomputed in _load_series).  Merged the
+        # same way the version rows are, so the list cannot disagree with
+        # the rows displayed directly above it.
         revisions_row = self.query_one('#detail-revisions-row', Horizontal)
-        revs = series.get('_revisions', [])
-        if revs:
+        revs = self._merge_tracked_revision(series)
+        rev_widget = self.query_one('#detail-revisions', Static)
+        if series.get('needs_update'):
+            # Checked before the list, not after: the merged list always
+            # carries at least the tracked revision, so an `if revs:` would
+            # shadow this hint and leave the row's '*' flag unexplained.
+            rev_widget.add_class('has-upgrade')
+            rev_widget.update('run [u]pdate to load revision data')
+            revisions_row.display = True
+        elif revs:
             rev_str = ', '.join(f'v{r["revision"]}' for r in revs)
-            rev_widget = self.query_one('#detail-revisions', Static)
             if series.get('has_newer'):
                 newest = max(r['revision'] for r in revs)
                 rev_str += f' (v{newest} available — upgrade with [a]ction)'
@@ -2315,13 +2831,17 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
             rev_widget.update(rev_str)
             revisions_row.display = True
         else:
-            if series.get('needs_update'):
-                rev_widget = self.query_one('#detail-revisions', Static)
-                rev_widget.add_class('has-upgrade')
-                rev_widget.update('run [u]pdate to load revision data')
-                revisions_row.display = True
-            else:
-                revisions_row.display = False
+            revisions_row.display = False
+
+        # Describe the highlighted version row, if any
+        version_row = self.query_one('#detail-version-row', Horizontal)
+        if rev is not None:
+            self.query_one('#detail-version', Static).update(
+                _format_version(rev, series)
+            )
+            version_row.display = True
+        else:
+            version_row.display = False
 
         # Show branch name for series with a review branch
         status = series.get('status', 'new')
@@ -2485,8 +3005,11 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
         else:
             self.notify('Target branch cleared')
 
-        # Refresh details panel
-        self._show_details(series)
+        # Refresh details panel, for the row the cursor is actually on:
+        # dropping the version here reverts the panel to the tracked
+        # revision's subject and attestation while a version row is still
+        # highlighted.
+        self._show_details(series, rev=self._selected_revision)
 
     def action_update_one(self) -> None:
         """Fetch thread and update revisions/trailers for the selected series."""
@@ -2498,7 +3021,7 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
         linkmask = str(config.get('linkmask', 'https://lore.kernel.org/r/%s'))
         topdir = b4.git_get_toplevel()
 
-        self._focus_change_id = self._selected_series.get('change_id')
+        self._stash_focus()
         self.push_screen(
             UpdateAllScreen(
                 [self._selected_series],
@@ -2523,8 +3046,7 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
         # Skip snoozed series during update-all
         update_list = [s for s in self._all_series if s.get('status') != 'snoozed']
 
-        if self._selected_series:
-            self._focus_change_id = self._selected_series.get('change_id')
+        self._stash_focus()
         self.push_screen(
             UpdateAllScreen(update_list, self._identifier, linkmask, topdir),
             callback=self._on_update_complete,
@@ -2579,6 +3101,7 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
         if self._selected_series is not None:
             panel.styles.height = 0
             self._selected_series = None
+            self._selected_revision = None
 
     def action_take(self) -> None:
         """Show take options dialog for the selected series."""
@@ -2856,7 +3379,7 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
         if not confirmed:
             return
         take_screen.accept_series = confirm_screen.accept_series
-        self._focus_change_id = change_id
+        self._focus_series(change_id)
         self._invalidate_caches(change_id)
         if method == 'merge':
             with self.suspend():
@@ -3844,9 +4367,22 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
         change_id = self._selected_series.get('change_id', '')
         current_rev = self._selected_series.get('revision', 1)
 
+        # A highlighted version row already names the other side of the
+        # diff, so skip the picker.
+        if self._selected_revision is not None:
+            other_rev = self._selected_revision.get('revision')
+            if other_rev is not None and other_rev != current_rev:
+                with self.suspend():
+                    self._do_range_diff(change_id, current_rev, other_rev)
+                return
+
         try:
             conn = b4.review.tracking.get_db(self._identifier)
-            revisions = b4.review.tracking.get_revisions(conn, change_id)
+            # The same set the [d] gate counts and compute_range_diff
+            # resolves against: a raw catalog read misses a revision only a
+            # sibling series row names, and offers a picker with nothing in
+            # it on a row the binding was enabled for.
+            revisions = b4.review.tracking.get_revisions_with_tracked(conn, change_id)
             conn.close()
         except Exception as ex:
             self.notify(f'Could not load revisions: {ex}', severity='error')
@@ -4190,7 +4726,7 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
             self.notify(f'Linked v{rev} (absorbed a duplicate)')
         else:
             self.notify(f'Linked v{rev}')
-        self._focus_change_id = change_id
+        self._focus_series(change_id)
         self._invalidate_caches(change_id)
         self._load_series()
 
@@ -4214,7 +4750,7 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
             self.notify(f'Could not update revision: {ex}', severity='error')
             return
         self.notify(f'Now tracking v{target_rev}')
-        self._focus_change_id = change_id
+        self._focus_series(change_id)
         self._invalidate_caches(change_id)
         self._load_series()
 
@@ -4695,7 +5231,7 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
             _wait_for_enter()
 
         # Return to the tracking list with the upgraded series focused
-        self._focus_change_id = change_id
+        self._focus_series(change_id)
         self._invalidate_caches(change_id)
         self._load_series()
 
@@ -4722,7 +5258,7 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
             branch_name = f'b4/review/{change_id}'
             b4.review.update_tracking_status(topdir, branch_name, 'waiting')
         self.notify('Series moved to waiting')
-        self._focus_change_id = change_id
+        self._focus_series(change_id, keep_version=True)
         self._invalidate_caches(change_id)
         self._load_series()
 
@@ -4788,7 +5324,7 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
         self._last_snooze_input = result.get('input', '')
 
         self.notify(f'Snoozed, {_format_snooze_until(until_value)}')
-        self._focus_change_id = change_id
+        self._focus_series(change_id, keep_version=True)
         self._invalidate_caches(change_id)
         self._load_series()
 
@@ -4825,7 +5361,7 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
             return
 
         self.notify(f'Unsnoozed, restored to {previous_status}')
-        self._focus_change_id = change_id
+        self._focus_series(change_id, keep_version=True)
         self._invalidate_caches(change_id)
         self._load_series()
 
@@ -5205,7 +5741,7 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
                     b4.review.update_tracking_status(topdir, review_branch, 'thanked')
             if archive_after:
                 self._archive_after_thanks(series)
-            self._focus_change_id = change_id
+            self._focus_series(change_id, keep_version=True)
             self._invalidate_caches(change_id)
             self._load_series()
         except Exception as ex:
@@ -5293,8 +5829,7 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
             self.notify(', '.join(parts) if parts else 'Queue empty')
             self._refresh_queue_indicator()
             if delivered_series:
-                if self._selected_series:
-                    self._focus_change_id = self._selected_series.get('change_id')
+                self._stash_focus()
                 self._load_series()
 
         self.push_screen(
diff --git a/src/tests/test_review_tracking.py b/src/tests/test_review_tracking.py
index 532c65c9..03aa3407 100644
--- a/src/tests/test_review_tracking.py
+++ b/src/tests/test_review_tracking.py
@@ -1068,17 +1068,6 @@ class TestRevisions:
         assert review_tracking.get_all_newest_revisions(conn) == {}
         conn.close()
 
-    def test_get_all_revision_counts(self, tmp_path: pytest.TempPathFactory) -> None:
-        """Verify bulk revision-count query returns correct counts."""
-        conn = review_tracking.init_db('rev-bulk-count-test')
-        review_tracking.add_revision(conn, 'change-a', 1, 'a-v1@example.com')
-        review_tracking.add_revision(conn, 'change-a', 2, 'a-v2@example.com')
-        review_tracking.add_revision(conn, 'change-a', 3, 'a-v3@example.com')
-        review_tracking.add_revision(conn, 'change-b', 1, 'b-v1@example.com')
-        result = review_tracking.get_all_revision_counts(conn)
-        assert result == {'change-a': 3, 'change-b': 1}
-        conn.close()
-
     def test_get_all_revisions_grouped(self, tmp_path: pytest.TempPathFactory) -> None:
         """Verify bulk grouped revisions returns correct per-change-id lists."""
         conn = review_tracking.init_db('rev-bulk-grouped-test')
diff --git a/src/tests/test_tui_tracking.py b/src/tests/test_tui_tracking.py
index d6233afe..7ba2443e 100644
--- a/src/tests/test_tui_tracking.py
+++ b/src/tests/test_tui_tracking.py
@@ -4663,7 +4663,7 @@ class TestLoadSeriesCaching:
             await pilot.pause()
             assert app._cached_branch_tips is not None
             assert app._cached_newest_revisions is not None
-            assert app._cached_revision_counts is not None
+            assert app._cached_revisions is not None
 
     @pytest.mark.asyncio
     async def test_caches_survive_db_poll_no_change(
@@ -4697,14 +4697,26 @@ class TestLoadSeriesCaching:
             # https://github.com/python/mypy/issues/9457:
             # app._cached_branch_tips is stale-narrowed across a method call.
             assert app._cached_newest_revisions is None  # type: ignore[unreachable]
-            assert app._cached_revision_counts is None
+            assert app._cached_revisions is None
             assert app._cached_art_counts is None
 
     @pytest.mark.asyncio
     async def test_selective_invalidation_keeps_other_caches(
         self, tmp_path: pathlib.Path
     ) -> None:
-        """_invalidate_caches(change_id) only evicts that ART entry."""
+        """_invalidate_caches(change_id) evicts one ART entry and the revisions.
+
+        The revision caches have to go: _load_series only refills them when
+        _cached_newest_revisions is None, so keeping them pins the version
+        rows and both revision-count gates to pre-action data.
+
+        What the targeted form protects is the *other* series' ART entries,
+        each of which costs a `git cat-file` to rebuild.  The branch tips
+        are one `git for-each-ref` for all of them, and _load_series already
+        refills a None dict with it -- resolving them here instead only put
+        that subprocess on the message pump, in a handler that may never
+        reload at all.
+        """
         _seed_db('cache-sel-inv', SAMPLE_SERIES)
 
         app = TrackingApp('cache-sel-inv')
@@ -4719,9 +4731,12 @@ class TestLoadSeriesCaching:
             # Alpha evicted, bravo still there
             assert 'b4/review/test-change-alpha' not in app._cached_art_counts
             assert 'b4/review/test-change-bravo' in app._cached_art_counts
-            # Other caches untouched
-            assert app._cached_branch_tips is not None
-            assert app._cached_newest_revisions is not None
+            # Branch tips are dropped, not re-resolved inline: one
+            # for-each-ref refills them, and _load_series already runs it.
+            assert app._cached_branch_tips is None
+            # Revision data is dropped so the next load re-reads it
+            assert app._cached_newest_revisions is None
+            assert app._cached_revisions is None
 
     @pytest.mark.asyncio
     async def test_revisions_stashed_in_series(self, tmp_path: pathlib.Path) -> None:

-- 
2.53.0

