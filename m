Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF72409615
	for <tools@linux.kernel.org>; Thu, 23 Jul 2026 08:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784795623; cv=none; b=cxvJetYR+W0jUVX0OzZIhSnPK9V2LJH2+niMFsh6j/RWLsNkFkPO1CUpNV0ar5L/z8kABp5eYDsRuUSPLwbcuyJVTDjz7A2yaI/c3z8c3gY1h8RcmD5LhuDbbceEqHp6GGcFaLD5G7V1r439QDtYz4TxBOcxwhCMcDWI7v1o+bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784795623; c=relaxed/simple;
	bh=sq5zaP5qYsnNMbjqXLEkpDlu2YeXVrYT8HNZwvQX8ks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n+upNP7Kx7+HYGqUxxmIIJnWr0jzux5gAVMhOWW0xZXzyhlnaDYMT8nBQJ+kQURWmGInrrULu/OjA/xANxj+62EBvNTZbNZe64BwbXq8SGL/qOrsD92coBwpiNBrFpnsnGDawsPusekPpYD0g1nRKhFvHJfqa6/1AquU+mZnqi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y3CPXA5K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y3CPXA5K"
Received: by smtp.kernel.org (Postfix)
	id 8B9781F00A3A; Thu, 23 Jul 2026 08:33:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54F421F000E9;
	Thu, 23 Jul 2026 08:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784795621;
	bh=lKA6TaYkDDPv6L0DVugzq/20L6wl4MLyWuyPWCD+yc4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Y3CPXA5Kpn4S58er/yNNMAX0opOHx3YgBis1qRYgofWQ4Hnnp4e0C5lk/vXWr+ni3
	 wEwiK5iOxYHBx8OqbTOmMGU5OxeMHqKXlv7ElfjJE7a+YgTRO7QkJa3CQFf7wpcnRA
	 /X/nvp6JM7O8/XVKYqjj0530qxrNUtxQi2h02CO7WXnU5vDonQtBXJ9yNou5s27kad
	 dwOOmHUqzBj0BummkG4ensaWT0VzE2hJLAOlExGS94e8J2PFDU4aMj48HRJRSekvBX
	 MYCz9lxZ+fpk3OzLZH9qDGflRzP9R6h+f+CFeyaC0dXPvjKHMiW1x2JbC6Od/wsUKe
	 g6iIYbBhlxESQ==
From: Christian Brauner <brauner@kernel.org>
Date: Thu, 23 Jul 2026 10:33:36 +0200
Subject: [PATCH b4 2/2] tests: guard the test-apply probes against gpg
 signing
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-work-b4-testapply-nosign-v1-2-a7cb7105e06f@kernel.org>
References: <20260723-work-b4-testapply-nosign-v1-0-a7cb7105e06f@kernel.org>
In-Reply-To: <20260723-work-b4-testapply-nosign-v1-0-a7cb7105e06f@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 "str = 'test"@example.com'
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=7224; i=brauner@kernel.org;
 h=from:subject:message-id; bh=sq5zaP5qYsnNMbjqXLEkpDlu2YeXVrYT8HNZwvQX8ks=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWQlXnxYMO1B433eC6GzF2wz3ZKcce0Ru9mPet3Dl8T7n
 QOdrh472VHKwiDGxSArpsji0G4SLrecp2KzUaYGzBxWJpAhDFycAjCR3PuMDGts9l3+wpu3YuMB
 l8v3V2jU3TX9umvqbBG+zEdHoo1krvYw/A/psavbNm+pi8TlpdnvX/cGPv24fOEh17DaJSGaxnu
 uG/ABAA==
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Test gpg override as best as possible. The tests force
commit.gpgsign=true with gpg.program=/bin/false through appended
GIT_CONFIG_* environment entries so a probe that regresses into signing
fails the apply and the test.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/tests/test_tui_tracking.py | 113 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 109 insertions(+), 4 deletions(-)

diff --git a/src/tests/test_tui_tracking.py b/src/tests/test_tui_tracking.py
index c987022..a809037 100644
--- a/src/tests/test_tui_tracking.py
+++ b/src/tests/test_tui_tracking.py
@@ -36,12 +36,15 @@ from b4 import (
 from b4.review_tui._modals import (
     ActionItem,
     ActionScreen,
+    BaseSelectionScreen,
     CherryPickScreen,
     ConfirmScreen,
     HelpScreen,
     LimitScreen,
     LinkRevisionScreen,
+    RebaseScreen,
     SnoozeScreen,
+    TakeConfirmScreen,
     TargetBranchScreen,
 )
 from b4.review_tui._tracking_app import (
@@ -121,10 +124,13 @@ def _create_review_branch(
     subject: str = 'Test series',
     sender_name: str = 'Test Author',
     sender_email: str = 'test@example.com',
+    with_patch: bool = False,
 ) -> str:
     """Create a fake b4 review branch with a proper tracking commit.
 
-    Returns the branch name.
+    With ``with_patch``, a real patch commit modifying file1.txt sits
+    between the base and the tracking commit, and the tracking metadata
+    describes it.  Returns the branch name.
     """
     branch_name = f'b4/review/{change_id}'
     # Get current HEAD as base
@@ -134,6 +140,24 @@ def _create_review_branch(
     # Create the branch at HEAD
     ecode, _ = b4.git_run_command(gitdir, ['branch', branch_name, base_sha])
     assert ecode == 0
+    parent_sha = base_sha
+    patches: List[Dict[str, Any]] = []
+    if with_patch:
+        ecode, _ = b4.git_run_command(gitdir, ['checkout', branch_name])
+        assert ecode == 0
+        with open(os.path.join(gitdir, 'file1.txt'), 'a') as fh:
+            fh.write(f'{change_id} tweak\n')
+        b4.git_run_command(gitdir, ['add', 'file1.txt'])
+        ecode, _ = b4.git_run_command(
+            gitdir, ['commit', '-m', f'{change_id}: tweak file1']
+        )
+        assert ecode == 0
+        ecode, parent_sha = b4.git_run_command(gitdir, ['rev-parse', 'HEAD'])
+        assert ecode == 0
+        parent_sha = parent_sha.strip()
+        ecode, _ = b4.git_run_command(gitdir, ['checkout', 'master'])
+        assert ecode == 0
+        patches = [{'title': f'{change_id}: tweak file1', 'link': ''}]
     # Build tracking metadata
     trk = {
         'series': {
@@ -148,11 +172,11 @@ def _create_review_branch(
             'complete': True,
             'base-commit': base_sha,
             'prerequisite-commits': [],
-            'first-patch-commit': base_sha,
+            'first-patch-commit': parent_sha,
             'header-info': {},
         },
         'followups': [],
-        'patches': [],
+        'patches': patches,
     }
     commit_msg = f'{subject}\n\n{b4.review.make_review_magic_json(trk)}'
     # Create an empty tracking commit on the branch
@@ -161,7 +185,7 @@ def _create_review_branch(
     tree = tree.strip()
     ecode, new_sha = b4.git_run_command(
         gitdir,
-        ['commit-tree', tree, '-p', base_sha],
+        ['commit-tree', tree, '-p', parent_sha],
         stdin=commit_msg.encode(),
     )
     assert ecode == 0
@@ -4140,3 +4164,84 @@ class TestDoTakeMergeConflict:
         common_dir = b4.git_get_common_dir(gitdir)
         assert common_dir is not None
         assert not os.path.isdir(os.path.join(common_dir, 'b4-take-worktree'))
+
+
+def _poison_gpg_signing(monkeypatch: pytest.MonkeyPatch) -> None:
+    """Force commit.gpgsign=true with a signing backend that always fails.
+
+    The appended entries override conftest's gpgsign=false injection, so
+    any git command that tries to sign fails outright; only a command
+    that explicitly disables signing (git -c commit.gpgsign=false, which
+    outranks environment config) can create commits.
+
+    gpg.format is pinned because the suite does not isolate the global
+    git config: under gpg.format=ssh git signs through gpg.ssh.program
+    and never looks at gpg.program, so the probes would sign happily and
+    these tests would pass with the fix reverted.
+
+    Build fixtures before poisoning -- they commit normally.
+    """
+    entries = [
+        ('commit.gpgsign', 'true'),
+        ('gpg.format', 'openpgp'),
+        ('gpg.program', '/bin/false'),
+    ]
+    count = int(os.environ.get('GIT_CONFIG_COUNT', '0'))
+    monkeypatch.setenv('GIT_CONFIG_COUNT', str(count + len(entries)))
+    for idx, (key, value) in enumerate(entries, start=count):
+        monkeypatch.setenv(f'GIT_CONFIG_KEY_{idx}', key)
+        monkeypatch.setenv(f'GIT_CONFIG_VALUE_{idx}', value)
+
+
+def _one_patch_mbox(gitdir: str) -> bytes:
+    """Build mbox bytes for one patch that applies cleanly to master."""
+    ecode, _ = b4.git_run_command(gitdir, ['checkout', '-b', 'sign-tweak'])
+    assert ecode == 0
+    with open(os.path.join(gitdir, 'file1.txt'), 'a') as fh:
+        fh.write('sign-tweak\n')
+    b4.git_run_command(gitdir, ['add', 'file1.txt'])
+    ecode, _ = b4.git_run_command(gitdir, ['commit', '-m', 'sign-tweak file1'])
+    assert ecode == 0
+    ecode, mbox = b4.git_run_command(
+        gitdir, ['format-patch', '-1', '--stdout'], decode=False
+    )
+    assert ecode == 0
+    b4.git_run_command(gitdir, ['checkout', 'master'])
+    b4.git_run_command(gitdir, ['branch', '-D', 'sign-tweak'])
+    return mbox
+
+
+class TestTestApplyNoSigning:
+    """Throwaway test-applies must never gpg-sign their commits.
+
+    With commit.gpgsign=true and a card-backed key, a signing git-am in a
+    modal worker pops pinentry on the tty the live TUI owns -- the TUI
+    repaints over the prompt and swallows the PIN, hanging the apply.
+    With gpg poisoned to always fail, these pass only if the test-apply
+    disables signing.
+    """
+
+    @pytest.mark.parametrize(
+        'screen_cls',
+        [RebaseScreen, TargetBranchScreen, BaseSelectionScreen],
+        ids=lambda c: c.__name__,
+    )
+    def test_static_test_apply_does_not_sign(
+        self,
+        gitdir: str,
+        monkeypatch: pytest.MonkeyPatch,
+        screen_cls: Any,
+    ) -> None:
+        ambytes = _one_patch_mbox(gitdir)
+        _poison_gpg_signing(monkeypatch)
+        ok, detail = screen_cls._test_apply_at(ambytes, 'master')
+        assert ok, f'{screen_cls.__name__} test-apply tried to sign: {detail}'
+
+    def test_take_confirm_test_apply_does_not_sign(
+        self, gitdir: str, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        branch = _create_review_branch(gitdir, 'sign-take', with_patch=True)
+        _poison_gpg_signing(monkeypatch)
+        screen = TakeConfirmScreen('linear', 'master', branch)
+        ok, detail = screen._test_take()
+        assert ok, f'take test-apply tried to sign: {detail}'

-- 
2.53.0

