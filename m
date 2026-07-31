Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D0830C158
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 09:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785489711; cv=none; b=MQ7Cw0nXield3HBB3fXBu2mVAUjPWEhbyrBlC/yU6FFYmETSLMyxBBqcanFuq9Asr4VKjovW48i37AChtom8IIGaI7mAc3pV00HRIgMeglDnAT9hJlfYGSpR0Ao3ZRVq8aIhMFTkV0r9HqQGVI+CjueUEkzspRmaGjaHZDzRYGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785489711; c=relaxed/simple;
	bh=Jk/e36QcwEJZTD1Bja/XZ9Cb9fBEvadaav5CzooUc2g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rcYZzYhYe48JhXcSUkz6HZzXD6Gy7Z/eUPSGqjvInzfjswqyRCC37CgyA0j7HNNQE/zBG5MUMexNGRdxtX/xhGTqnFovKIY4KMRP67gkhwSe6R8Llj90GFIVE5LbtRRUuQ4swnYecMSJn2qjlAbLQr9yeT/Ev8yD8FpDflRw2bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jjFGax5I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jjFGax5I"
Received: by smtp.kernel.org (Postfix)
	id 123861F00A3A; Fri, 31 Jul 2026 09:21:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4482C1F000E9;
	Fri, 31 Jul 2026 09:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785489710;
	bh=KcdClY0d2D26zbypXw/otRsIAaa5n0hwJ/eDnx4KSwk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=jjFGax5IDHA6SQifjGuhe9/DoUb4A37vvdXUM9+Y7CAuKBUppXx388Q/Ytr3BHdEd
	 EZetp16V9lVLCc2IJtTBJOTC/G2MW7mZtWkAx464Iol1WDwayb+4nwoH0bspx5ezyT
	 8rSTsU3EcOaFsTnJ5yPlaVTPeQ948to+4nBMRl9An2zj+mhHXTi4bg3g4n0ydSpDvd
	 nILWafEAByL4A4l7yhZStkmLtkOd4DCl6bwGhs+BYj3lkptJww+4YC8+Ih9bTgktra
	 LSYk9cxeJgQkafvaU2Gp1j9KMQYS8a5VDpO/oup5VMfCwoClGf4pkWkH+ao1u5YIt3
	 9T0rr5bQfWiWQ==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 11:21:18 +0200
Subject: [PATCH b4 19/27] tui: route editor launches through one non-fatal
 helper
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v1-19-de68a7c8e4cb@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v1-0-de68a7c8e4cb@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v1-0-de68a7c8e4cb@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=11389; i=brauner@kernel.org;
 h=from:subject:message-id; bh=Jk/e36QcwEJZTD1Bja/XZ9Cb9fBEvadaav5CzooUc2g=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlZIqtKP6+I8jukP9sQ+nZidK1QacEH1W5y28JedCtv
 ShDy2B+RykLgxgXg6yYIotDu0m43HKeis1GmRowc1iZQIYwcHEKwERMcxn+8Fkn6MUe/PiTRfPM
 5kmP58RZrgl+p3zOzVKup+HF/5+r1jH8T80wmjXHMia3bXOQu1XBmv29nHqzWqtEnyQwCuppHZ7
 IDwA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

An exception from edit_in_editor() inside "with app.suspend()" unwinds
out of the key handler and tears the whole app down. A RuntimeError
there costs the user every other unsaved change in the session and drops
them on a traceback with the terminal freshly un-suspended. Four of the
eight call sites had no handler at all. The other four each grew their
own and two of those only wrote to the log, which nobody sees because
the app repaints over it on resume.

Give them one helper. suspend_and_edit() suspends, edits and turns any
failure into a notification and a None return, so the caller just bails
out of the current action and the app stays up. It takes the topdir
argument too, so callers that know which worktree they are driving keep
saying so.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/bugs/_tui.py                | 37 ++++++++++---------------------------
 src/b4/review_tui/_common.py       |  3 +++
 src/b4/review_tui/_lite_app.py     |  6 ++++--
 src/b4/review_tui/_review_app.py   | 35 +++++++++++++++++++----------------
 src/b4/review_tui/_tracking_app.py |  8 +++-----
 src/b4/tui/__init__.py             |  3 +++
 src/b4/tui/_common.py              | 27 +++++++++++++++++++++++++++
 7 files changed, 69 insertions(+), 50 deletions(-)

diff --git a/src/b4/bugs/_tui.py b/src/b4/bugs/_tui.py
index 603a756..fc02ed3 100644
--- a/src/b4/bugs/_tui.py
+++ b/src/b4/bugs/_tui.py
@@ -51,6 +51,7 @@ from b4.tui import (
     pad_display,
     resolve_styles,
     reviewer_colours,
+    suspend_and_edit,
 )
 from ezgb import Bug, BugSummary, Comment, GitBugRepo, Status
 
@@ -818,15 +819,9 @@ class BugDetailScreen(ModalScreen[None]):
             '     Everything between these markers will be removed. -->\n'
             '\n'
         ) % self.bug.id[:7]
-        with self.app.suspend():
-            try:
-                result = b4.edit_in_editor(
-                    template.encode(),
-                    filehint='bug-comment.md',
-                )
-            except Exception as exc:
-                logger.critical('Editor error: %s', exc)
-                return
+        result = suspend_and_edit(self.app, template.encode(), 'bug-comment.md')
+        if result is None:
+            return
         # Strip HTML comments and check if anything remains
         import re
 
@@ -963,15 +958,9 @@ class BugDetailScreen(ModalScreen[None]):
     def _reply_edit_loop(
         self, lmsg: 'b4.LoreMessage', reply_text: str, is_reedit: bool = False
     ) -> None:
-        with self.app.suspend():
-            try:
-                result = b4.edit_in_editor(
-                    reply_text.encode(),
-                    filehint='reply.eml',
-                )
-            except Exception as exc:
-                logger.critical('Editor error: %s', exc)
-                return
+        result = suspend_and_edit(self.app, reply_text.encode(), 'reply.eml')
+        if result is None:
+            return
 
         edited = result.decode(errors='replace')
         if edited.strip() == reply_text.strip() and not is_reedit:
@@ -2252,15 +2241,9 @@ class BugListApp(JKListNavMixin, App[None]):
             '     Everything between these markers will be removed. -->\n'
             '\n'
         )
-        with self.suspend():
-            try:
-                result = b4.edit_in_editor(
-                    template.encode(),
-                    filehint='new-bug.md',
-                )
-            except Exception as exc:
-                logger.critical('Editor error: %s', exc)
-                return
+        result = suspend_and_edit(self, template.encode(), 'new-bug.md')
+        if result is None:
+            return
         import re
 
         text = result.decode(errors='replace')
diff --git a/src/b4/review_tui/_common.py b/src/b4/review_tui/_common.py
index 33ab7ea..372f899 100644
--- a/src/b4/review_tui/_common.py
+++ b/src/b4/review_tui/_common.py
@@ -100,6 +100,9 @@ from b4.tui._common import (
 from b4.tui._common import (
     reviewer_colours as reviewer_colours,
 )
+from b4.tui._common import (
+    suspend_and_edit as suspend_and_edit,
+)
 from b4.tui._common import (
     worker_cancelled as worker_cancelled,
 )
diff --git a/src/b4/review_tui/_lite_app.py b/src/b4/review_tui/_lite_app.py
index 86a201e..951057f 100644
--- a/src/b4/review_tui/_lite_app.py
+++ b/src/b4/review_tui/_lite_app.py
@@ -30,6 +30,7 @@ from b4.review_tui._common import (
     pad_display,
     resolve_styles,
     run_lore_worker,
+    suspend_and_edit,
 )
 from b4.review_tui._modals import FollowupReplyPreviewScreen
 
@@ -771,8 +772,9 @@ class LiteThreadScreen(ModalScreen[None]):
             quoted = '\n'.join(f'> {line}' for line in body.splitlines())
             editor_text = f'On {orig_date}, {orig_author} wrote:\n{quoted}\n\n'
 
-        with self.app.suspend():
-            result = b4.edit_in_editor(editor_text.encode(), filehint='reply.eml')
+        result = suspend_and_edit(self.app, editor_text.encode(), 'reply.eml')
+        if result is None:
+            return
         reply_text = result.decode(errors='replace')
         if reply_text == editor_text:
             self.app.notify('No changes made')
diff --git a/src/b4/review_tui/_review_app.py b/src/b4/review_tui/_review_app.py
index 74f6aa0..778a8f6 100644
--- a/src/b4/review_tui/_review_app.py
+++ b/src/b4/review_tui/_review_app.py
@@ -53,6 +53,7 @@ from b4.review_tui._common import (
     resolve_styles,
     reviewer_colours,
     run_lore_worker,
+    suspend_and_edit,
     worker_cancelled,
 )
 from b4.review_tui._modals import (
@@ -1327,13 +1328,14 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
                     '', all_reviews, my_email, commit_msg=self._cover_text
                 )
 
-        with self.suspend():
-            result = b4.edit_in_editor(
-                editor_text.encode(),
-                filehint='reply.b4-review.eml',
-                topdir=self._topdir,
-            )
-
+        result = suspend_and_edit(
+            self,
+            editor_text.encode(),
+            'reply.b4-review.eml',
+            topdir=self._topdir,
+        )
+        if result is None:
+            return
         if not result:
             self.notify('Editor returned no content')
             return
@@ -1450,11 +1452,11 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
     def _edit_note_in_editor(self, target: Dict[str, Any], existing: str) -> None:
         """Launch $EDITOR for the maintainer's note on *target*."""
         editor_text = existing + self._NOTE_FOOTER
-        with self.suspend():
-            result = b4.edit_in_editor(
-                editor_text.encode(), filehint='note.txt', topdir=self._topdir
-            )
-
+        result = suspend_and_edit(
+            self, editor_text.encode(), 'note.txt', topdir=self._topdir
+        )
+        if result is None:
+            return
         if not result:
             self.notify('Editor returned no content')
             return
@@ -1716,10 +1718,11 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
             quoted = '\n'.join(f'> {line}' for line in body.splitlines())
             editor_text = f'On {orig_date}, {orig_author} wrote:\n{quoted}\n\n'
 
-        with self.suspend():
-            result = b4.edit_in_editor(
-                editor_text.encode(), filehint='reply.eml', topdir=self._topdir
-            )
+        result = suspend_and_edit(
+            self, editor_text.encode(), 'reply.eml', topdir=self._topdir
+        )
+        if result is None:
+            return
         reply_text = result.decode(errors='replace')
         if reply_text == editor_text:
             self.notify('No changes made')
diff --git a/src/b4/review_tui/_tracking_app.py b/src/b4/review_tui/_tracking_app.py
index 99964d0..6171d78 100644
--- a/src/b4/review_tui/_tracking_app.py
+++ b/src/b4/review_tui/_tracking_app.py
@@ -63,6 +63,7 @@ from b4.review_tui._common import (
     pad_display,
     resolve_styles,
     run_lore_worker,
+    suspend_and_edit,
 )
 from b4.review_tui._modals import (
     QUEUE_BUSY,
@@ -4920,11 +4921,8 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
     ) -> None:
         """Open the thank-you message in $EDITOR and re-show preview."""
         msg_bytes = msg.as_bytes(policy=b4.emlpolicy)
-        try:
-            with self.suspend():
-                edited = b4.edit_in_editor(msg_bytes, filehint='thanks.eml')
-        except Exception as ex:
-            self.notify(f'Editor error: {ex}', severity='error')
+        edited = suspend_and_edit(self, msg_bytes, 'thanks.eml')
+        if edited is None:
             return
         new_msg = email.parser.BytesParser(policy=b4.emlpolicy).parsebytes(edited)
         self._show_thank_preview(
diff --git a/src/b4/tui/__init__.py b/src/b4/tui/__init__.py
index ab9186e..26b2197 100644
--- a/src/b4/tui/__init__.py
+++ b/src/b4/tui/__init__.py
@@ -33,6 +33,7 @@ if TYPE_CHECKING:
         pad_display,
         resolve_styles,
         reviewer_colours,
+        suspend_and_edit,
     )
     from b4.tui._modals import (
         ActionItem,
@@ -68,6 +69,7 @@ __all__ = [
     'pad_display',
     'resolve_styles',
     'reviewer_colours',
+    'suspend_and_edit',
 ]
 
 _LAZY_ATTRS: dict[str, str] = {
@@ -91,6 +93,7 @@ _LAZY_ATTRS: dict[str, str] = {
     'pad_display': '_common',
     'resolve_styles': '_common',
     'reviewer_colours': '_common',
+    'suspend_and_edit': '_common',
     'ActionItem': '_modals',
     'ActionScreen': '_modals',
     'ConfirmScreen': '_modals',
diff --git a/src/b4/tui/_common.py b/src/b4/tui/_common.py
index 48052d5..076e986 100644
--- a/src/b4/tui/_common.py
+++ b/src/b4/tui/_common.py
@@ -44,6 +44,33 @@ def notify_quit_hint(app: 'App[Any]') -> None:
     app.notify("Press 'Q' (capital) to quit", severity='warning')
 
 
+def suspend_and_edit(
+    app: 'App[Any]',
+    bdata: bytes,
+    filehint: str,
+    *,
+    topdir: Optional[str] = None,
+) -> Optional[bytes]:
+    """Drop out of the TUI and run the user's editor on *bdata*.
+
+    Returns what they saved, or ``None`` if the editor could not be run --
+    it has already been reported through a notification by then.  Letting
+    that escape instead would unwind out of the key handler and tear the app
+    down, taking every other unsaved change in the session with it, over an
+    editor that would not start.
+
+    *topdir* is the working tree the edit belongs to; pass the one the app
+    operates on, since it need not be the tree b4 was started in.
+    """
+    try:
+        with app.suspend():
+            return b4.edit_in_editor(bdata, filehint=filehint, topdir=topdir)
+    except Exception as ex:
+        logger.debug('Editor failed: %s', ex, exc_info=True)
+        app.notify(f'Editor error: {ex}', severity='error')
+        return None
+
+
 def worker_cancelled() -> bool:
     """Return ``True`` if the active Textual thread worker was cancelled.
 

-- 
2.53.0

