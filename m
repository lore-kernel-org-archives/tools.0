Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB77E246BD5
	for <tools@linux.kernel.org>; Fri, 17 Jul 2026 22:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784327911; cv=none; b=DOGfdC8WLpBwjUq15907Qwy8EA23u4N7aT6ikzDu9Fu8S7Rj2Sd9s1zn67P65lFp/Dma3cK+KvC7IcuOZx8wDo9CeYQnT+yWrUtq6UX8DfzGS6yxYQvkTAwzv0DSwvyN7SsyJE6LP4DybYKssMf7E9GHg0Bv+AExAFNrGC6V2g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784327911; c=relaxed/simple;
	bh=ahDVEoruCY7DVj3Al7YWSi1o1Gexl3/LZiooJYXusTc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ENBclUz61TpZrPlyLbtmK+Labyl5tVGVLjkx7nYPnqrmZg4UgqbIuB0NHoRox+JPqNlKJSvJSOXkQRsfQ01jWVOKWRQe5/Cyl0RwUCpkxFeF5v7gjN6IKFsIwxkCubdZBFHjHqAFm0mfgukJxHns7Xq6DX6n+vtOiF/qeRgkmUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gDR43o3P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gDR43o3P"
Received: by smtp.kernel.org (Postfix)
	id A80581F00A3D; Fri, 17 Jul 2026 22:38:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C8CB1F000E9;
	Fri, 17 Jul 2026 22:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784327910;
	bh=Y+0l0BhCgyo6kOLxcpDAiet7CC1pYGJkWg/9gI9nNSE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=gDR43o3Pt+gwVdbmv33Sv6RHSX2uy/LQ8LRayQNNJFKvTADVd0U5Ubzoo8aZLG2b4
	 afhUKKksUuIHHfoy/0tu8q4jcAjH8fVPBY9Jzz2vlDtvQXmLC6hTFtHeVtIFbuq6qL
	 sOeopfYOc6q0S26WI5qmKhFkJ3kBJcH3vkDqFh1dlOtURgRvOzxV+pqi/6R6DznTgJ
	 Tfq4Q8ybzYzTeVd7jWXqUywpMe4OUzsv6TmZuN9sKd7C+hG/qtSt0BUMZj6VAf1XPX
	 9dsnxnKHuTGs87jKNv+SVM6Qqv/AA7ZK5gN5dCdR+Ga1tLFn+NRW3J/e5PKdd4KwvI
	 WqNc6zN4tmaKA==
From: Christian Brauner <brauner@kernel.org>
Date: Sat, 18 Jul 2026 00:37:43 +0200
Subject: [PATCH RFC 07/11] review-tui: add a "Find older revisions" action
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260718-work-b4-multiver-rows-v1-7-3c539d2a3095@kernel.org>
References: <20260718-work-b4-multiver-rows-v1-0-3c539d2a3095@kernel.org>
In-Reply-To: <20260718-work-b4-multiver-rows-v1-0-3c539d2a3095@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-4217c
X-Developer-Signature: v=1; a=openpgp-sha256; l=5499; i=brauner@kernel.org;
 h=from:subject:message-id; bh=ahDVEoruCY7DVj3Al7YWSi1o1Gexl3/LZiooJYXusTc=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWRFrbuZvXXXmqPr+Y48PZnbIeoUf+gg79yOmImnVtzkm
 uQssff7/Y5SFgYxLgZZMUUWh3aTcLnlPBWbjTI1YOawMoEMYeDiFICJpLQx/K+Wkjx50aDTKPzR
 nZa9i45nXN90sfO45cMprg/U/wcYrZRi+B+1UjXmjXspI6+UvdSD58rTf0kn9h3IfbOB2/yQnrX
 GdSYA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Offer discover_older_revisions() from the tracker's action menu,
available wherever manual revision linking is.  The search runs in a
lore worker; on success the list reloads (deferring to the DB mtime
poll when a modal is up).

Assisted-by: LLM
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/review_tui/_tracking_app.py | 55 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/src/b4/review_tui/_tracking_app.py b/src/b4/review_tui/_tracking_app.py
index 3057367..cc20ad6 100644
--- a/src/b4/review_tui/_tracking_app.py
+++ b/src/b4/review_tui/_tracking_app.py
@@ -90,6 +90,7 @@ _ACTION_SHORTCUTS: Dict[str, str] = {
     'unsnooze': 'u',
     'upgrade': 'U',
     'link': 'l',
+    'discover': 'o',
     'thank': 't',
     'abandon': 'A',
     'archive': 'x',
@@ -891,6 +892,36 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
             elif event.state == WorkerState.ERROR:
                 self.notify('Could not fetch series', severity='error')
             return
+        if event.worker.name == '_discover_older':
+            if event.state == WorkerState.SUCCESS:
+                result = event.worker.result or {}
+                error = result.get('error')
+                found = result.get('found', 0)
+                if error:
+                    self.notify(
+                        f'Older-revision search failed: {error}', severity='error'
+                    )
+                elif found:
+                    revs = result.get('revisions') or []
+                    if revs:
+                        rlist = ', '.join(f'v{r}' for r in revs)
+                        self.notify(f'Found and added: {rlist}')
+                    else:
+                        self.notify(f'Found {found} older revision(s)')
+                    # Reload so the new revisions show up right away; if a
+                    # modal is up, the DB mtime poll picks it up instead.
+                    if len(self.app.screen_stack) == 1:
+                        if self._selected_series:
+                            self._focus_change_id = self._selected_series.get(
+                                'change_id'
+                            )
+                        self._invalidate_caches()
+                        self._load_series()
+                else:
+                    self.notify('No older revisions found')
+            elif event.state == WorkerState.ERROR:
+                self.notify('Older-revision search failed', severity='error')
+            return
         if event.worker.name != '_startup_rescan':
             return
         if event.state == WorkerState.SUCCESS:
@@ -1338,6 +1369,7 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
                 actions.append(('upgrade', 'Upgrade to newer revision'))
             if status == 'new':
                 actions.append(('link', 'Manually link a revision'))
+                actions.append(('discover', 'Find older revisions'))
             actions.append(('abandon', 'Abandon series'))
             if status == 'new':
                 actions.append(('waiting', 'Mark as waiting on new revision'))
@@ -1365,6 +1397,7 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
                 actions.append(('thank', 'Send thank-you'))
             if status in ('reviewing', 'replied', 'partial', 'waiting'):
                 actions.append(('link', 'Manually link a revision'))
+                actions.append(('discover', 'Find older revisions'))
             # 'Return to reviewing' sits just above the abandon/archive block
             # rather than at the top of the menu.
             if status in ('accepted', 'partial', 'thanked'):
@@ -1389,6 +1422,7 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
             'thank': self.action_thank,
             'upgrade': self.action_update_revision,
             'link': self.action_link_revision,
+            'discover': self.action_discover_older,
             'archive': self.action_archive,
             'waiting': self.action_waiting,
             'snooze': self.action_snooze,
@@ -3882,6 +3916,27 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
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
+                    identifier, series, linkmask, topdir=topdir
+                )
+
+        run_lore_worker(self, _discover, name='_discover_older')
+
     def action_link_revision(self) -> None:
         """Manually link another revision to the selected series by msgid.
 

-- 
2.53.0

