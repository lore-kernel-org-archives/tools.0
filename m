Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877FE1A6800
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 21:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785535180; cv=none; b=kYynaxBla5t1W00xj0GsjrUaUB9RGAFZi+ls6RBsjhllGP/uWMrEOJ3d6M7IOXgjhPtuPvN6LKybgDYNElQz5IDN29Q4VB7zmMKpbuwUn4Z4A+t8W5QuO9LpsFsV23kRiGHB0yZco+6pyNT+p3vC3yiS3z1p2RAt+5W8zERxALM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785535180; c=relaxed/simple;
	bh=PepcQ1jQ7t7zvFZw528O2R/kjQRuo722trqSlday5TM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HGpnQ29x+wSILNN+lhjD92BGaGNMGtmZIsu+piai1Zo0K6MTsXUuciNULyhl3WnNFu0/dJ5D8cSLyECWqgpRDK/pSsmxU+SqgD49upJiBDxko29QN2HfZ+qMyHWxhrJBvmJG8u3lNus89wc+ShajbBNI9s2ynHbPYSmLo8VjlAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oDiszH/Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oDiszH/Y"
Received: by smtp.kernel.org (Postfix)
	id 866181F00ACF; Fri, 31 Jul 2026 21:59:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B81F01F00AC4;
	Fri, 31 Jul 2026 21:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785535179;
	bh=tz9kDMXmeQ9z15P/4RDeKV9bMb3/Lphc7lMLDGqu4cI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=oDiszH/YC6jeY54x1EYi7HPXMIEDZM4Sfr9FsCpCAPoYsheE3r+MAkpaYeH9OoInO
	 2LvQN0lul7KmMpDMkW6yK4Z+aCiAw25csGKHElY1m39etGEw70z/sycfZAvLViNxK9
	 0Cul75jh6nThN5nMY64MK/Dz+6lDbvyj5H5uLCJuPFEZBqm2yZjSTQtdZfGZd+4yyG
	 4HPDpyxr0AaZXShAI/4uwbUPljXc+ktaRQWUW/d/XNYul5LkV1WO3OGuvT8Dy+4xYC
	 br18hgrtBw01SQEIzrHXFsVKQh+CHZLy6UjeSraZKtdb3SLaLEbVGPkQrwNKTUwYuQ
	 SexBeIB5MkbjA==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 23:59:19 +0200
Subject: [PATCH b4 v2 38/44] tests: cover the tracking TUI restoring the
 branch on the way out
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v2-38-243fd19d322d@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=5533; i=brauner@kernel.org;
 h=from:subject:message-id; bh=PepcQ1jQ7t7zvFZw528O2R/kjQRuo722trqSlday5TM=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlSs2JDzk1VysjaMua8HuMvqIZWgmhxUoZnU3xf5abL
 8m8UP6ro5SFQYyLQVZMkcWh3SRcbjlPxWajTA2YOaxMIEMYuDgFYCIeaYwMa35vPGgtuCu9+rK4
 7Ku7pz9yfvHOOng8LfPtCkf35D9vGBgZDv3rm5pQ62P5seIW3+Y8hnKLx5IXVIQffQ7Si7byO1j
 FCAA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Three ways the restore was missed: a tracking app that moves HEAD and
quits, the same from a detached HEAD, and a status sync whose tracking
read exits rather than raising.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/tests/test_tui_tracking.py | 107 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/src/tests/test_tui_tracking.py b/src/tests/test_tui_tracking.py
index 7b2ffb9..ef79aeb 100644
--- a/src/tests/test_tui_tracking.py
+++ b/src/tests/test_tui_tracking.py
@@ -27,6 +27,7 @@ from textual.widgets import Input, ListView, Static
 import b4
 import b4.review
 import b4.review.tracking as tracking
+import b4.review_tui._entry as _entry
 from b4 import (
     _abort_worktree_op,
     _worktree_has_unmerged,
@@ -5363,3 +5364,109 @@ class TestTestApplySubmoduleRecurse:
         screen = TakeConfirmScreen('linear', 'master', branch)
         ok, detail = screen._test_take()
         assert ok, f'take test-apply recursed: {detail}'
+
+
+class TestTrackingEntryBranchRestore:
+    """run_tracking_tui() puts the worktree back on the way out."""
+
+    def test_quitting_after_an_upgrade_restores_the_branch(self, gitdir: str) -> None:
+        """The tracking list has actions of its own that move HEAD.
+
+        Upgrading a series to a newer revision checks out an upgrade branch
+        and renames it onto the review branch.  Quitting from the list then
+        went straight out of the loop, past a restore that only ran after a
+        review pass, and left the worktree on the review branch.
+        """
+        ecode, _out = b4.git_run_command(gitdir, ['checkout', '-q', '-b', 'work'])
+        assert ecode == 0
+        review_branch = 'b4/review/entry-restore-1'
+
+        class _MovesHeadThenQuits:
+            PATCHWORK_SENTINEL = TrackingApp.PATCHWORK_SENTINEL
+
+            def __init__(
+                self, identifier: str, original_branch: Optional[str], **kw: Any
+            ) -> None:
+                pass
+
+            def run(self, mouse: bool = True) -> Optional[str]:
+                b4.git_run_command(gitdir, ['checkout', '-q', '-b', review_branch])
+                return None
+
+        with patch.object(_entry, 'TrackingApp', _MovesHeadThenQuits):
+            _entry.run_tracking_tui('test-entry-restore')
+
+        assert b4.git_get_current_branch(gitdir) == 'work'
+
+    def test_quitting_after_an_upgrade_restores_a_detached_head(
+        self, gitdir: str
+    ) -> None:
+        """A session that started detached has a commit to go back to, and
+        putting the user on a branch instead is not restoring anything."""
+        ecode, out = b4.git_run_command(gitdir, ['rev-parse', 'HEAD'])
+        assert ecode == 0
+        start_sha = out.strip()
+        ecode, _out = b4.git_run_command(gitdir, ['checkout', '-q', '--detach'])
+        assert ecode == 0
+        review_branch = 'b4/review/entry-restore-detached'
+
+        class _MovesHeadThenQuits:
+            PATCHWORK_SENTINEL = TrackingApp.PATCHWORK_SENTINEL
+
+            def __init__(
+                self, identifier: str, original_branch: Optional[str], **kw: Any
+            ) -> None:
+                pass
+
+            def run(self, mouse: bool = True) -> Optional[str]:
+                b4.git_run_command(gitdir, ['checkout', '-q', '-b', review_branch])
+                return None
+
+        with patch.object(_entry, 'TrackingApp', _MovesHeadThenQuits):
+            _entry.run_tracking_tui('test-entry-restore-detached')
+
+        assert b4.git_get_current_branch(gitdir) is None
+        ecode, out = b4.git_run_command(gitdir, ['rev-parse', 'HEAD'])
+        assert ecode == 0
+        assert out.strip() == start_sha
+
+    def test_a_failed_tracking_load_still_restores_the_branch(
+        self, gitdir: str
+    ) -> None:
+        """load_tracking() exits rather than raising on a branch carrying no
+        tracking commit, and SystemExit is not an Exception, so it sailed past
+        the status sync's guard and out of run_tracking_tui() -- taking the
+        branch restore with it."""
+        ecode, _out = b4.git_run_command(gitdir, ['checkout', '-q', '-b', 'work'])
+        assert ecode == 0
+        review_branch = 'b4/review/entry-syncfail-1'
+        runs = {'n': 0}
+
+        class _ReviewsThenQuits:
+            PATCHWORK_SENTINEL = TrackingApp.PATCHWORK_SENTINEL
+
+            def __init__(
+                self, identifier: str, original_branch: Optional[str], **kw: Any
+            ) -> None:
+                pass
+
+            def run(self, mouse: bool = True) -> Optional[str]:
+                runs['n'] += 1
+                if runs['n'] > 1:
+                    return None
+                b4.git_run_command(gitdir, ['checkout', '-q', '-b', review_branch])
+                return review_branch
+
+        with (
+            patch.object(_entry, 'TrackingApp', _ReviewsThenQuits),
+            patch.object(_entry, 'ReviewApp'),
+            patch.object(
+                b4.review,
+                '_prepare_review_session',
+                return_value={'series': {'revision': 1}},
+            ),
+            patch.object(b4.review, 'load_tracking', side_effect=SystemExit(1)),
+        ):
+            _entry.run_tracking_tui('test-entry-syncfail')
+
+        assert b4.git_get_current_branch(gitdir) == 'work'

-- 
2.53.0

