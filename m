Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C9E37F8C9
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 21:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785535191; cv=none; b=f13Z4jCe7zKme6UkM1lO16WOH29vE2CRoOTD+bKcK8tOwiAEF/I0QFcKOV1H1uyh4RyWlUJsP8N77CcIAxVbW4jXZaBRCcNqrl4s6nFK7kN9NOlZSpQrEumCENXpuXbadihKnZLjUJhnmNsJkHbhOMDB/ent5x67IP8vppRPU7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785535191; c=relaxed/simple;
	bh=4ysCgsycjqW5jqzd2dfO5RNt61XhliJF/+LiPK7BCz0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ChVa0c8py4SjIw1fC7nygdNX3ovK0Fd3tDv+tRwXf/hHQSzcZaMpasBGxbibPit+ZdkEmL+AEt1FIkUKODcwzTW7Vjk7nRPQ9W+pVTCBvTwcmcb5YYjJeke2bifj4aubJPCU5LV+I4iZ6YtIXl7prjdBLEeEaObzNcZ8xJrcc8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O/6nEaBl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O/6nEaBl"
Received: by smtp.kernel.org (Postfix)
	id B5F3D1F00ADB; Fri, 31 Jul 2026 21:59:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E75BC1F00AC4;
	Fri, 31 Jul 2026 21:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785535186;
	bh=jdc3mT2QZgazq6z7Hpvm4jTwAdKggFPFIrOziCjVkNY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=O/6nEaBl6Yq2XVfY9Pgjg/cIrbeUL5dhZJLA+G7f8228NjBxZUMq4QmUMVXN4yDxH
	 Nvntg49HmqFcy+z5PMWsLS1fybXzaLc9OFcxjmQO3ON2pjFKtKVWpzVBiajwocfCWJ
	 fnSWoDCLf84/P0ep0FFf4qIvy8Oc5Q24y1utNKqvrKXrbqWvPKs6VHeoqqwMMt1+D5
	 Hb2YtnDqbka6LbS/vxght4vSG/gH2FVZRVKhu3JFMfkSXVKojal5sy4biK7IdSv5oI
	 CoEL/Y9VpfQ2NVyDA0yXZ6weq/uKXP+0Md+5gdGqGd8py/mCSR1PLMQn6wo/GdCPgN
	 2feQSEkAYcu6g==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 23:59:25 +0200
Subject: [PATCH b4 v2 44/44] tests: cover the branch delete leaving the
 worktree on a branch
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v2-44-243fd19d322d@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=6548; i=brauner@kernel.org;
 h=from:subject:message-id; bh=4ysCgsycjqW5jqzd2dfO5RNt61XhliJF/+LiPK7BCz0=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlSs11dFjmtP3eY8/6VJ+lj9dkH1F+Pf/Xts2m/71kH
 q9tnnvqa0cpC4MYF4OsmCKLQ7tJuNxynorNRpkaMHNYmUCGMHBxCsBE+IoZGQ5Mm7/MhH2rfvDn
 /aJitdcNpj2xY5BW+bvvgnJy3NE47/mMDC8nztwsmnjdQ21dB/O+hC6HbTwi3A17dk/tWcZuIFC
 uwgUA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Abandoning and archiving both get a case. A session that started
detached gets its own commit back, and deleting a branch HEAD was
never on moves nothing.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/tests/test_tui_tracking.py | 136 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 136 insertions(+)

diff --git a/src/tests/test_tui_tracking.py b/src/tests/test_tui_tracking.py
index 5a8b914..37f0e85 100644
--- a/src/tests/test_tui_tracking.py
+++ b/src/tests/test_tui_tracking.py
@@ -1649,6 +1649,142 @@ class TestTrackingAbandon:
             assert cursor.fetchone() is None
             conn.close()
 
+    @pytest.mark.asyncio
+    async def test_abandon_from_the_branch_lands_on_a_branch(self, gitdir: str) -> None:
+        """Deleting the branch HEAD is on detaches it to the parent commit
+        first, because that is all delete_review_branch() can name.  Left
+        that way the session ends on a commit with no branch on it, and the
+        restore in run_tracking_tui() reads a detached HEAD as no branch of
+        ours and declines to help."""
+        identifier = 'test-abandon-onbranch'
+        change_id = 'abandon-onbranch-1'
+        branch_name = _create_review_branch(gitdir, change_id, identifier=identifier)
+        _seed_db(
+            identifier,
+            [
+                {
+                    'change_id': change_id,
+                    'subject': '[PATCH] abandon from the branch',
+                    'status': 'reviewing',
+                    'message_id': 'abo@ex.com',
+                }
+            ],
+        )
+        ecode, _out = b4.git_run_command(gitdir, ['checkout', '-q', branch_name])
+        assert ecode == 0
+
+        app = TrackingApp(identifier, 'master')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            app._on_abandon_confirmed(True, change_id, branch_name, True)
+            await pilot.pause()
+
+        assert not b4.git_branch_exists(gitdir, branch_name)
+        assert b4.git_get_current_branch(gitdir) == 'master'
+
+    @pytest.mark.asyncio
+    async def test_archive_from_the_branch_lands_on_a_branch(self, gitdir: str) -> None:
+        """Archiving deletes the branch at the end, so it detaches HEAD the
+        same way abandoning does."""
+        identifier = 'test-archive-onbranch'
+        change_id = 'archive-onbranch-1'
+        branch_name = _create_review_branch(
+            gitdir, change_id, identifier=identifier, with_patch=True
+        )
+        _seed_db(
+            identifier,
+            [
+                {
+                    'change_id': change_id,
+                    'subject': '[PATCH] archive from the branch',
+                    'status': 'accepted',
+                    'message_id': 'aro@ex.com',
+                }
+            ],
+        )
+        ecode, _out = b4.git_run_command(gitdir, ['checkout', '-q', branch_name])
+        assert ecode == 0
+
+        app = TrackingApp(identifier, 'master')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            assert app._archive_branch(change_id, 1, branch_name)
+            await pilot.pause()
+
+        assert not b4.git_branch_exists(gitdir, branch_name)
+        assert b4.git_get_current_branch(gitdir) == 'master'
+
+    @pytest.mark.asyncio
+    async def test_abandon_lands_back_on_a_detached_head(self, gitdir: str) -> None:
+        """A session that started detached came from a commit, not a branch.
+
+        delete_review_branch() can only name the deleted branch's parent, so
+        without the session's own starting point the user is left parked on
+        whatever that happens to be."""
+        identifier = 'test-abandon-detached'
+        change_id = 'abandon-detached-1'
+        branch_name = _create_review_branch(gitdir, change_id, identifier=identifier)
+        _seed_db(
+            identifier,
+            [
+                {
+                    'change_id': change_id,
+                    'subject': '[PATCH] abandon detached',
+                    'status': 'reviewing',
+                    'message_id': 'abd@ex.com',
+                }
+            ],
+        )
+        ecode, out = b4.git_run_command(gitdir, ['rev-parse', 'master'])
+        assert ecode == 0
+        start_sha = out.strip()
+        ecode, _out = b4.git_run_command(gitdir, ['checkout', '-q', branch_name])
+        assert ecode == 0
+
+        app = TrackingApp(
+            identifier, None, original_head=['checkout', '--detach', start_sha]
+        )
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            app._on_abandon_confirmed(True, change_id, branch_name, True)
+            await pilot.pause()
+
+        assert not b4.git_branch_exists(gitdir, branch_name)
+        assert b4.git_get_current_branch(gitdir) is None
+        ecode, out = b4.git_run_command(gitdir, ['rev-parse', 'HEAD'])
+        assert ecode == 0
+        assert out.strip() == start_sha
+
+    @pytest.mark.asyncio
+    async def test_abandon_from_elsewhere_leaves_head_alone(self, gitdir: str) -> None:
+        """HEAD was never on the deleted branch, so nothing moved it and
+        nothing should move it back."""
+        identifier = 'test-abandon-elsewhere'
+        change_id = 'abandon-elsewhere-1'
+        branch_name = _create_review_branch(gitdir, change_id, identifier=identifier)
+        _seed_db(
+            identifier,
+            [
+                {
+                    'change_id': change_id,
+                    'subject': '[PATCH] abandon from elsewhere',
+                    'status': 'reviewing',
+                    'message_id': 'abe@ex.com',
+                }
+            ],
+        )
+        ecode, _out = b4.git_run_command(gitdir, ['checkout', '-q', '-b', 'mine'])
+        assert ecode == 0
+
+        app = TrackingApp(identifier, 'master')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            app._on_abandon_confirmed(True, change_id, branch_name, True)
+            await pilot.pause()
+
+        assert not b4.git_branch_exists(gitdir, branch_name)
+        assert b4.git_get_current_branch(gitdir) == 'mine'
+
 
 class TestTrackingWaiting:
     """Tests for the 'mark as waiting' workflow."""

-- 
2.53.0

