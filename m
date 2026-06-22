Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A04F3A6B82
	for <tools@linux.kernel.org>; Mon, 22 Jun 2026 12:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782130854; cv=none; b=qQGsDVcI246KB4PIWCgcEjxljmxdXYu9dcCrkesmJNnduIfr7SzPeBY/RbR3tZ/B8JlAzqolNBA8G8Tj/MEoR88Z8rfzIMkSA+ohPQvqQM+ikpdzYZLb5AA+g9HZvoE/tI18WPHEuE9MrGRYFoVLjjhqwyCWFXBNpnP77hPUlyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782130854; c=relaxed/simple;
	bh=TCsuKZ2x+DJvUXcPSokNUiPlxg8GX/RoE/BccS84+YQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jtFuibLSLr51jGDXWQUEyPLuCLVXjko/CyAcEFhdCbdXzOLe9pcezJ5CwThuxhyS8CxQvzgNfdPoD7HlmZdK5pVFt6rAfIMZiuvg0qWHhXdow+NaOVqn7PWMoKlpXaltLK4TlU5dwEXpPQcXFtvCOLIdM6UL13RHb2METBn8KsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=deKniiy6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="deKniiy6"
Received: by smtp.kernel.org (Postfix)
	id 219821F00A3F; Mon, 22 Jun 2026 12:20:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DDD71F000E9;
	Mon, 22 Jun 2026 12:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782130853;
	bh=USIc3E6zfRtnmPKvhn06SDoX+9wwXdkMAXFWoSqemjc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=deKniiy6cFu9LFxM/5XXV3y7f7Nry+sPsk7L02lbVGPWXPsrPGAoxcVw1F/4L54by
	 Q7YeBmkPAi2hLYWDcMfvLZ5hRZiPb+JgI6eBQCndP7zvQa35J4F7J9LwBPY5N/+box
	 pyr0GrWHkRR5AFR8mnyUOolrrnWDi5wDTVYAvyo4Pwvyo/3Mddd0DxKd6+dmjo2nDi
	 x9mZO8MTTUcJgvJCbcd7o6WC9Ez3ny5oHoVo+kyl8MC+zyGDMgw+hL22ZXWTqYcRVz
	 deaYVDxNYHKBP91GrnCbjipKs0kLRI49Ve0WrvBMzju82IpXdywtDwoNE9kW74xHXd
	 +GHibZ/emvBJQ==
From: Christian Brauner <brauner@kernel.org>
Date: Mon, 22 Jun 2026 14:20:43 +0200
Subject: [PATCH b4 1/3] review-tui: honor shazam-merge-flags in take->merge
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-review-tui-take-merge-v1-1-ad4893027e4d@kernel.org>
References: <20260622-review-tui-take-merge-v1-0-ad4893027e4d@kernel.org>
In-Reply-To: <20260622-review-tui-take-merge-v1-0-ad4893027e4d@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-04799
X-Developer-Signature: v=1; a=openpgp-sha256; l=7357; i=brauner@kernel.org;
 h=from:subject:message-id; bh=TCsuKZ2x+DJvUXcPSokNUiPlxg8GX/RoE/BccS84+YQ=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWRZaizyUYvx/vre01lhSti7w9XVLfpvtp12lGl1M39e/
 Mxp3oO+jlIWBjEuBlkxRRaHdpNwueU8FZuNMjVg5rAygQxh4OIUgIk8TGRkWGfz7Rr33uiVH1SN
 26zW3uTdbShT09H/wykodOFF2/+/tjP8L3trp9jXWRl838pNYMcV/dk378feNjtU/XTrrfCOj32
 f+AA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

The review TUI's take->merge path had drifted from "b4 shazam": it never
read b4.shazam-merge-flags, so --log, --stat and --gpg-sign were silently
dropped; only the take dialog's "add Link:" and "add Signed-off-by:"
checkboxes had any effect.  It also ran b4's own editor and then
`git merge --no-edit` through the stdio-capturing git_run_command, so git
could never open an editor -- which is the only way `git merge --log`
makes its shortlog visible.

Make it behave like shazam:

- Parse b4.shazam-merge-flags via a new _shazam_merge_flags() helper.
  Signed-off-by is stripped from the flags because the take dialog's
  checkbox already adds it to the body (and `git merge --signoff` does
  not dedup), but --log/--stat/--gpg-sign now reach git merge.
- Pass origin= to git_fetch_am_into_repo so FETCH_HEAD is labelled
  "patches from <link>", matching the shortlog header shazam produces.
- Write the cover with -F and let `git merge --edit` open the editor,
  run directly with an inherited tty under suspend() like
  _suspend_to_shell, so the appended --log shortlog is visible and
  editable.  The pytest path keeps --no-edit through the captured runner
  since tests have no tty.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/review_tui/_tracking_app.py | 80 ++++++++++++++++++++++++++++----------
 1 file changed, 60 insertions(+), 20 deletions(-)

diff --git a/src/b4/review_tui/_tracking_app.py b/src/b4/review_tui/_tracking_app.py
index fc1e1a6..959670a 100644
--- a/src/b4/review_tui/_tracking_app.py
+++ b/src/b4/review_tui/_tracking_app.py
@@ -15,7 +15,10 @@ import json
 import os
 import pathlib
 import re
+import shlex
 import sqlite3
+import subprocess
+import sys
 from string import Template
 from typing import Any, Dict, List, Literal, Optional, Tuple
 
@@ -134,6 +137,27 @@ _ACTIONABLE_STATUSES: frozenset[str] = frozenset(
 )
 
 
+def _shazam_merge_flags(config: Dict[str, Any]) -> List[str]:
+    """Extra ``git merge`` flags for the take->merge path from config.
+
+    Mirrors the ``b4 shazam`` CLI's handling of ``b4.shazam-merge-flags``
+    (e.g. ``--log``, ``--stat``, ``--gpg-sign``) so a merge taken from the
+    review TUI carries the same options.
+
+    Signed-off-by is deliberately dropped here: in the review TUI the merge
+    commit's SoB is controlled by the take dialog's "add Signed-off-by"
+    checkbox, which edits the merge message body directly. ``git merge
+    --signoff`` does not dedup against an existing trailer, so leaving it in
+    would append a second Signed-off-by line.
+    """
+    raw = str(config.get('shazam-merge-flags', '--signoff'))
+    if not raw:
+        return []
+    sp = shlex.shlex(raw, posix=True)
+    sp.whitespace_split = True
+    return [f for f in sp if f not in ('-s', '--signoff', '--no-signoff')]
+
+
 def _resolve_worktree_am_conflict(topdir: str, cex: 'b4.AmConflictError') -> bool:
     """Handle an AmConflictError by dropping the user into a shell.
 
@@ -2633,21 +2657,11 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
                 else:
                     body = stripped + '\n\n' + sob + '\n'
 
-        # Open editor
-        try:
-            edited = b4.edit_in_editor(body.encode(), filehint='MERGE_MSG')
-        except Exception as ex:
-            logger.critical('Editor error: %s', ex)
-            _wait_for_enter()
-            return
-        merge_msg = edited.decode(errors='replace').strip()
-        if not merge_msg:
-            logger.info('Empty merge message, aborting')
-            _wait_for_enter()
-            return
-
         # Apply trailer-amended patches in a sparse worktree and fetch
         # into FETCH_HEAD, so individual commits carry their trailers.
+        # The merge message is opened for editing below by git-merge --edit
+        # (mirroring "b4 shazam"), so the --log shortlog git appends is
+        # visible and editable there.
         base_commit = t_series.get('base-commit', '')
         if not base_commit:
             # Fall back to target branch HEAD
@@ -2660,7 +2674,11 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
 
         try:
             b4.git_fetch_am_into_repo(
-                topdir, ambytes, at_base=base_commit, am_flags=['-3']
+                topdir,
+                ambytes,
+                at_base=base_commit,
+                origin=t_series.get('link', ''),
+                am_flags=['-3'],
             )
         except b4.AmConflictError as cex:
             if not _resolve_worktree_am_conflict(topdir, cex):
@@ -2693,12 +2711,34 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
             return
         mmf = os.path.join(gitdir.strip(), 'b4-merge-msg')
         with open(mmf, 'w') as fh:
-            fh.write(merge_msg)
+            fh.write(body)
 
-        # Merge FETCH_HEAD (trailer-amended patches) instead of the
-        # review branch directly, so each commit carries its trailers.
-        gitargs = ['merge', '--no-ff', '--no-edit', '-F', mmf, 'FETCH_HEAD']
-        ecode, out = b4.git_run_command(topdir, gitargs, logstderr=True)
+        # Merge FETCH_HEAD (trailer-amended patches) instead of the review
+        # branch directly, so each commit carries its trailers. Mirror
+        # "b4 shazam": git-merge builds the final message from -F + the flags
+        # and opens the editor (--edit), so b4.shazam-merge-flags such as
+        # --log/--stat/--gpg-sign take effect and the appended shortlog is
+        # visible. Signed-off-by is left out of the flags -- it is already in
+        # the body via the take dialog's checkbox (see _shazam_merge_flags).
+        mergeflags = _shazam_merge_flags(config)
+        out = ''
+        if hasattr(sys, '_running_in_pytest'):
+            # Tests have no tty for an interactive editor; run the merge
+            # non-interactively through the captured runner, like the CLI does.
+            mergeargs = (
+                ['merge', '--no-ff', '-F', mmf, '--no-edit', 'FETCH_HEAD']
+                + mergeflags
+            )
+            ecode, out = b4.git_run_command(topdir, mergeargs, logstderr=True)
+        else:
+            # Run git directly with an inherited tty (under the caller's
+            # suspend()) so git can open the editor, like _suspend_to_shell.
+            mergeargs = (
+                ['git', '-C', topdir, 'merge', '--no-ff', '-F', mmf, '--edit',
+                 'FETCH_HEAD']
+                + mergeflags
+            )
+            ecode = subprocess.run(mergeargs).returncode
 
         # Clean up message file
         try:
@@ -2707,7 +2747,7 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
             pass
 
         if ecode != 0:
-            logger.critical('Merge failed: %s', out.strip())
+            logger.critical('Merge failed%s', f': {out.strip()}' if out.strip() else '')
             logger.critical('Aborting merge...')
             b4.git_run_command(topdir, ['merge', '--abort'], logstderr=True)
             b4.git_run_command(topdir, ['checkout', prev_branch], logstderr=True)

-- 
2.53.0

