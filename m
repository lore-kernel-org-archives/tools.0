Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED5B3EFD24
	for <tools@linux.kernel.org>; Wed, 12 Aug 2026 21:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786571257; cv=none; b=IaiZLjtZaikI8j1rANKkv4GMNeew2w/gWobxf0Wp7tq5C8EESRMvTrUgXyX7xmlkNS/UeNszv9C1ojkbACbZC/V9HzSK/8//Qeo0+BeFZIW8QSzinRjo3tqPrAmPyCy9+Qm1VzXEH5pKZXyE/x1uUZ81aOyEp9hhLsNdCaJ7HmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786571257; c=relaxed/simple;
	bh=p+ylV5S0hn32Gg2HExIJTbWq7VQpVaOPuBqPGmJKE4I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PRvxl+zoT5yyeQPCfdyNTz+vNEEOu4DnMo4OU+R7I98bFOzcKT0OtuSsux//RfqUUIvMVQFwAlj5IR2r58wS+ZSqVVpBYTo8PpleBNEvrlO5FLkpVK9Y3PKZZbwzPgHmt8KvprIAnUTzw0VqRSRHh5PCrQc9Pp4i+ltLXNmaN14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OWhkokmx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OWhkokmx"
Received: by smtp.kernel.org (Postfix)
	id 2D1AF1F00A3D; Wed, 12 Aug 2026 21:47:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 533531F000E9;
	Wed, 12 Aug 2026 21:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786571256;
	bh=dCwbZiZhhOook74OfPWNNyvg7z9eJX3YnWTTeencIWM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=OWhkokmxVtLqoZgJHKV+xIC/JxOti0+OuVCy6VCmg71hg/cLVRp4g+6GdByGz0yL3
	 4fXRq9wp7X4DQZt+tYl1II18npn9nTzDfFuEwenoVV7Z5OObRdPyqRLG4eL6wPdihk
	 H5t4bYKVC9AE6T33q+81FRP9BPfSFcTJhagdGmnkohzWnFAZJrBBh/1dbg7CDKJ20t
	 iXcGziofHVprTGN5I+m359jQir2sPWzJrL98y21nzfBPg7iLqny2F11/dsfvilNKhv
	 hLIEaKyYcwa8JPJ/sGleF/3Stk7g0bTpQElXgcW8tGKikMt231EB16kZVcaZrLWn5i
	 6CFhZqs0xkK0A==
From: Christian Brauner <brauner@kernel.org>
Date: Wed, 12 Aug 2026 23:47:01 +0200
Subject: [PATCH RFC v2 20/25] review-tui: add a "Find older revisions"
 action
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260812-work-b4-multiver-rows-v2-20-305d53cd723a@kernel.org>
References: <20260812-work-b4-multiver-rows-v2-0-305d53cd723a@kernel.org>
In-Reply-To: <20260812-work-b4-multiver-rows-v2-0-305d53cd723a@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.17-dev-362b8
X-Developer-Signature: v=1; a=openpgp-sha256; l=10519; i=brauner@kernel.org;
 h=from:subject:message-id; bh=p+ylV5S0hn32Gg2HExIJTbWq7VQpVaOPuBqPGmJKE4I=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTVvLy9+b1NwMN3oVsrHkauXpe+7dLmJY5ptV9EXUSfi
 Ea+fP75XkcpC4MYF4OsmCKLQ7tJuNxynorNRpkaMHNYmUCGMHBxCsBEbDcy/E/u6AyZfpr/yafN
 Dx6/fXQujfVLqWX0Sv79qTcXnjc/fmMhI8OlGy3xqa4bumVXG1a7f/ddZf9t76nVy9L9+R3drv3
 ef48XAA==
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Offer discover_older_revisions() from the tracker's action menu, wherever
manual revision linking is offered.  The search runs in a lore worker; on
success the list reloads, deferring to the DB mtime poll when a modal is
up.

The documentation also gains the "Link a revision" line the partial block
never listed, although that action has been offered for partial series
all along.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 docs/maintainer/review.rst         |  9 ++++
 src/b4/review_tui/_tracking_app.py | 96 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 105 insertions(+)

diff --git a/docs/maintainer/review.rst b/docs/maintainer/review.rst
index ca063269..5ddd9dd2 100644
--- a/docs/maintainer/review.rst
+++ b/docs/maintainer/review.rst
@@ -252,6 +252,8 @@ actions depend on the series status:
 * ``[s]`` **Snooze** — defer until a date, duration, or git tag
 * ``[U]`` **Upgrade** — switch to a newer revision (when available)
 * ``[l]`` **Link a revision** — manually associate a revision by message-id
+* ``[o]`` **Find older revisions** — search lore for versions posted before
+  the series was tracked
 * ``[A]`` **Abandon** / ``[x]`` **Archive**
 
 **Partial** (some patches applied, remainder still in review):
@@ -262,6 +264,9 @@ actions depend on the series status:
 * ``[w]`` **Mark as waiting** — waiting on a new revision
 * ``[s]`` **Snooze** — defer until later
 * ``[U]`` **Upgrade** — switch to a newer revision (when available)
+* ``[l]`` **Link a revision** — manually associate a revision by message-id
+* ``[o]`` **Find older revisions** — search lore for versions posted before
+  the series was tracked
 * ``[A]`` **Abandon** / ``[x]`` **Archive**
 
 **New / gone:**
@@ -270,6 +275,8 @@ actions depend on the series status:
 * ``[U]`` **Upgrade** — switch to a newer revision (new only, when available)
 * ``[s]`` **Snooze** — defer until later (new only)
 * ``[l]`` **Link a revision** — manually associate a revision by message-id (new only)
+* ``[o]`` **Find older revisions** — search lore for versions posted before
+  the series was tracked (new only)
 * ``[A]`` **Abandon**
 
 **Waiting:**
@@ -277,6 +284,8 @@ actions depend on the series status:
 * ``[U]`` **Upgrade** — switch to the newer revision (when available)
 * ``[r]`` **Review** — return to reviewing
 * ``[l]`` **Link a revision** — manually associate a revision by message-id
+* ``[o]`` **Find older revisions** — search lore for versions posted before
+  the series was tracked
 * ``[A]`` **Abandon** / ``[x]`` **Archive**
 
 **Snoozed:**
diff --git a/src/b4/review_tui/_tracking_app.py b/src/b4/review_tui/_tracking_app.py
index f0ad512a..999513ca 100644
--- a/src/b4/review_tui/_tracking_app.py
+++ b/src/b4/review_tui/_tracking_app.py
@@ -32,6 +32,7 @@ from typing import (
     Union,
 )
 
+from rich.markup import escape
 from rich.text import Text as RichText
 from textual.app import App, ComposeResult
 from textual.binding import Binding
@@ -45,6 +46,7 @@ import b4.mbox
 import b4.review
 import b4.review.tracking
 import b4.ty
+import liblore
 from b4.review._review import NO_COVER_NOTE
 from b4.review_tui._common import (
     QUIT_BINDINGS,
@@ -65,6 +67,7 @@ from b4.review_tui._common import (
     resolve_styles,
     run_lore_worker,
     suspend_and_edit,
+    worker_cancelled,
 )
 from b4.review_tui._modals import (
     QUEUE_BUSY,
@@ -105,6 +108,7 @@ _ACTION_SHORTCUTS: Dict[str, str] = {
     'unsnooze': 'u',
     'upgrade': 'U',
     'link': 'l',
+    'discover': 'o',
     'thank': 't',
     'abandon': 'A',
     'archive': 'x',
@@ -514,6 +518,32 @@ def _resolve_worktree_take_conflict(
     return True
 
 
+def _discovery_error_notice(error: str) -> str:
+    """Message for a discovery run that came back with an error.
+
+    *error* is a lore exception's text, so it is escaped rather than
+    trusted: notify() renders Rich markup, and an unescaped bracket in it
+    is either swallowed as a style tag -- taking the diagnostic the message
+    exists to carry -- or, when the text holds a '[/...]' path fragment,
+    raises MarkupError inside the toast render.  See _conflicts_notice.
+    """
+    return f'Older-revision search failed: {escape(error)}'
+
+
+def _conflicts_notice(conflicts: List[int]) -> str:
+    """Message for versions a discovery run found another series tracking.
+
+    The ``[l]`` is escaped because notify() renders Rich markup: unescaped
+    it is parsed as a style tag, and the one key the message exists to name
+    is dropped from what the maintainer actually reads.
+    """
+    clist = ', '.join(f'v{r}' for r in conflicts)
+    return (
+        f'{clist} already tracked as a separate series'
+        f' — use {escape("[l]")} to link and absorb'
+    )
+
+
 def _format_snooze_until(value: str) -> str:
     """Format a snoozed_until value for display.
 
@@ -1089,6 +1119,44 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
             elif event.state == WorkerState.ERROR:
                 self.notify('Could not fetch series', severity='error')
             return
+        if event.worker.name == '_discover_older':
+            if event.state == WorkerState.SUCCESS:
+                result = event.worker.result or {}
+                error = result.get('error')
+                found = result.get('found', 0)
+                conflicts = result.get('conflicts') or []
+                if error == 'offline':
+                    # Not a failure, just nothing to search with.
+                    self.notify('Offline — cannot search for older revisions')
+                elif error:
+                    self.notify(_discovery_error_notice(str(error)), severity='error')
+                elif found:
+                    # found is len(revisions), so the list is never empty here.
+                    rlist = ', '.join(f'v{r}' for r in result.get('revisions') or [])
+                    self.notify(f'Found and added: {rlist}')
+                    # Reload so the new revisions show up right away; if a
+                    # modal is up, the DB mtime poll picks it up instead.
+                    if len(self.app.screen_stack) == 1:
+                        if self._selected_series:
+                            self._focus_change_id = self._selected_series.get(
+                                'change_id'
+                            )
+                        self._invalidate_caches()
+                        self._load_series()
+                elif not conflicts:
+                    # Only when there is nothing else to say.  A run that
+                    # found versions and skipped every one of them as a
+                    # conflict reports 0 found, and saying "none found"
+                    # ahead of the list of them contradicts itself.
+                    self.notify('No older revisions found')
+                if conflicts:
+                    self.notify(_conflicts_notice(conflicts), severity='warning')
+            elif event.state == WorkerState.ERROR:
+                if isinstance(event.worker.error, liblore.OperationCancelledError):
+                    # Shutting down or navigating away, not a failure.
+                    return
+                self.notify('Older-revision search failed', severity='error')
+            return
         if event.worker.name != '_startup_rescan':
             return
         if event.state == WorkerState.SUCCESS:
@@ -1516,6 +1584,7 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
                 actions.append(('upgrade', 'Upgrade to newer revision'))
             if status == 'new':
                 actions.append(('link', 'Manually link a revision'))
+                actions.append(('discover', 'Find older revisions'))
             actions.append(('abandon', 'Abandon series'))
             if status == 'new':
                 actions.append(('waiting', 'Mark as waiting on new revision'))
@@ -1548,6 +1617,7 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
                 actions.append(('thank', 'Send thank-you'))
             if status in ('reviewing', 'replied', 'partial', 'waiting'):
                 actions.append(('link', 'Manually link a revision'))
+                actions.append(('discover', 'Find older revisions'))
             # 'Return to reviewing' sits just above the abandon/archive block
             # rather than at the top of the menu.
             if status in ('accepted', 'partial', 'thanked'):
@@ -1572,6 +1642,7 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
             'thank': self.action_thank,
             'upgrade': self.action_update_revision,
             'link': self.action_link_revision,
+            'discover': self.action_discover_older,
             'archive': self.action_archive,
             'waiting': self.action_waiting,
             'snooze': self.action_snooze,
@@ -3957,6 +4028,31 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
             ),
         )
 
+    def action_discover_older(self) -> None:
+        """Search lore for older revisions of the selected series."""
+        if not self._selected_series or not self._identifier:
+            return
+        series = dict(self._selected_series)
+        config = b4.get_main_config()
+        linkmask = str(config.get('linkmask', ''))
+        topdir = b4.git_get_toplevel()
+        identifier = self._identifier
+        self.notify('Searching lore for older revisions…')
+
+        def _discover() -> Dict[str, Any]:
+            # The search machinery logs to the console; keep it from
+            # scribbling over the TUI.
+            with _quiet_worker():
+                return b4.review.tracking.discover_older_revisions(
+                    identifier,
+                    series,
+                    linkmask,
+                    topdir=topdir,
+                    cancel_cb=worker_cancelled,
+                )
+
+        run_lore_worker(self, _discover, name='_discover_older')
+
     def action_link_revision(self) -> None:
         """Manually link another revision to the selected series by msgid.
 

-- 
2.53.0

