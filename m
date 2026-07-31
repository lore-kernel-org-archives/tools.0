Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEED1A6800
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 21:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785535174; cv=none; b=QACF0ltaVL0Bk6gPHrjnozj4Ir6eYEk7UEt3hqL684HLoRd3fkGAPbwscPSi/4SFTT+6LOVLBVksNy/QS5TG5ejQwqcXhdDSMWwvDKZbh39C1ACyb2bHAOmxnqh73AQRh3rabn7N5itkMWyEaJBCHLZLsN+auYodidHlCm0oLU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785535174; c=relaxed/simple;
	bh=1TBXUbSoOGpOW6hIkHWX8FyHts5sI7d93EPVBKhEuPg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d6RyybplacURwafvVERMANYGo4vklUUhUDeW8uozsVRQKflZ6eUHBtCBJxbetwBxsrH6Harw4ESXoRshcz4fcLc9oOjeF4Y/Q4UTel4mTxYpk09aE3HLOYpj5O9zwjBKzpxvglY1NFwsL2y/2QYOu87lL5agVFk+5xrhDFYJRW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jlcjj2sS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jlcjj2sS"
Received: by smtp.kernel.org (Postfix)
	id 7A6851F00ACA; Fri, 31 Jul 2026 21:59:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC3741F00AC4;
	Fri, 31 Jul 2026 21:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785535173;
	bh=pjJX2UnDtaVtaX9eCgAzG02zX9PrwYRlhvBrDtueCbA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Jlcjj2sSeZPO8F+XcqPN6OFbTOft3VIrpOoGzpz6zQ03Vun5gm2bpMtSNz6GBgaAO
	 fMD53wk2H3sAV8EzD9dBpkFw/aerw5tOn/iTm2iRo+9GUcbxXKOotnGXcIBG3fqe8t
	 CYXDnLixRsd2Ktdm9Sn1V1p88dXOrFReBY7naELaRGtAobwZ8JCY8/J3RjuFyzRtf4
	 SV0vuS5P5vkklb0JVTIg30wJ5+ksCtaOFLEiLGYJxmgcCU3Ydm/J+eOeUeN0Xcc84+
	 UZ3fgng9+5UUmepjE/8dsJKVhs9CJ32IrKXdfX48TfGCzevVtJVbH9Oo3jI6Cia0W1
	 yPWr5zTeyZ4zg==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 23:59:14 +0200
Subject: [PATCH b4 v2 33/44] tests: cover create_review_branch cleaning up
 a half-built branch
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v2-33-243fd19d322d@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=5174; i=brauner@kernel.org;
 h=from:subject:message-id; bh=1TBXUbSoOGpOW6hIkHWX8FyHts5sI7d93EPVBKhEuPg=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlSs1x5Ou6P+lVittZCQ//Na/elxxlC/Q4P0n0684d4
 ovTFH39O0pZGMS4GGTFFFkc2k3C5ZbzVGw2ytSAmcPKBDKEgYtTACYyR57hv2fwgumLLNsOKYg/
 OHeZ7/Z6ng83Mq08/PSb01dZxoinT2P4K3Puj8qLqUn7Akru2pvzpac2/c58x3pz86PTjR9SXhw
 qZwQA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Both starting points with the patch range failing to read: from a
branch and from a detached HEAD. The detached case starts at the tip
rather than the base, so restoring to the base would not pass.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/tests/test_review.py | 92 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/src/tests/test_review.py b/src/tests/test_review.py
index 5fdb608..4f56689 100644
--- a/src/tests/test_review.py
+++ b/src/tests/test_review.py
@@ -3,6 +3,7 @@ import email.message
 import importlib.util
 import json
 import logging
+import os
 from typing import Any, Dict, Iterator, List, Optional, Tuple, Union
 from unittest import mock
 
@@ -4763,3 +4764,94 @@ class TestArchiveSeries:
         # Nothing was destroyed, so the maintainer can simply retry
         assert b4.git_branch_exists(repo, branch)
         assert self._db_status() == 'accepted'
+
+
+class TestCreateReviewBranchCleanup:
+    """A branch that cannot be finished is not left checked out."""
+
+    @staticmethod
+    def _seed_fetch_head(gitdir: str) -> Tuple[str, str]:
+        """Leave a commit for the cherry-pick to land, as FETCH_HEAD.
+
+        Returns (base, tip): the commit to build the review branch on, and
+        the one waiting in FETCH_HEAD.
+        """
+        ecode, base = b4.git_run_command(gitdir, ['rev-parse', 'HEAD'])
+        assert ecode == 0
+        base = base.strip()
+
+        with open(os.path.join(gitdir, 'file1.txt'), 'a') as fh:
+            fh.write('review branch cleanup\n')
+        b4.git_run_command(gitdir, ['add', 'file1.txt'])
+        ecode, _out = b4.git_run_command(gitdir, ['commit', '-m', 'cleanup test'])
+        assert ecode == 0
+        ecode, tip = b4.git_run_command(gitdir, ['rev-parse', 'HEAD'])
+        assert ecode == 0
+        tip = tip.strip()
+        with open(os.path.join(gitdir, '.git', 'FETCH_HEAD'), 'w') as fh:
+            fh.write(f'{tip}\t\tbranch\n')
+        ecode, _out = b4.git_run_command(gitdir, ['reset', '--hard', base])
+        assert ecode == 0
+        return base, tip
+
+    @staticmethod
+    def _create_with_unreadable_range(gitdir: str, branch: str, base: str) -> None:
+        """Run create_review_branch() with the patch range failing to read."""
+        real_run = b4.git_run_command
+
+        def _fail_revlist(
+            topdir: Any, args: List[str], *a: Any, **kw: Any
+        ) -> Tuple[int, Union[str, bytes]]:
+            if args[:2] == ['rev-list', '--reverse']:
+                return 1, ''
+            return real_run(topdir, args, *a, **kw)
+
+        with mock.patch.object(b4, 'git_run_command', side_effect=_fail_revlist):
+            with pytest.raises(SystemExit):
+                review.create_review_branch(
+                    gitdir,
+                    branch,
+                    base,
+                    b4.LoreSeries(1, 1),
+                    'https://example.com/x',
+                    'https://example.com/%s',
+                )
+
+    def test_cleans_up_when_the_patch_range_cannot_be_read(self, gitdir: str) -> None:
+        """Everything between the checkout and the tracking commit runs with
+        HEAD already on the new branch.  Bailing out there without restoring
+        leaves the caller standing on a branch that was never finished, which
+        the two neighbouring failures below it already knew to avoid."""
+        ecode, _out = b4.git_run_command(gitdir, ['checkout', '-q', '-b', 'work'])
+        assert ecode == 0
+        base, _tip = self._seed_fetch_head(gitdir)
+
+        branch = 'b4/review/cleanup-test'
+        self._create_with_unreadable_range(gitdir, branch, base)
+
+        assert b4.git_get_current_branch(gitdir) == 'work'
+        assert not b4.git_branch_exists(gitdir, branch)
+
+    def test_cleans_up_from_a_detached_head(self, gitdir: str) -> None:
+        """A detached HEAD has no branch name to go back to, and skipping the
+        restore on that account costs both halves of the cleanup: git refuses
+        to delete the branch HEAD is standing on, so the caller keeps the
+        stranding *and* the leftover.  The name comes from the change-id, so
+        the next attempt at that series then walks into 'already exists'.
+
+        Detached at the FETCH_HEAD tip rather than at the base, so restoring
+        to the base the branch was created at does not pass for remembering
+        where HEAD actually was.
+        """
+        base, tip = self._seed_fetch_head(gitdir)
+        ecode, _out = b4.git_run_command(gitdir, ['checkout', '-q', '--detach', tip])
+        assert ecode == 0
+
+        branch = 'b4/review/cleanup-detached'
+        self._create_with_unreadable_range(gitdir, branch, base)
+
+        assert b4.git_get_current_branch(gitdir) is None
+        ecode, head = b4.git_run_command(gitdir, ['rev-parse', 'HEAD'])
+        assert ecode == 0
+        assert head.strip() == tip
+        assert not b4.git_branch_exists(gitdir, branch)

-- 
2.53.0

