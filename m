Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B263314B9
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 21:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785535151; cv=none; b=FAbOi+SeqcO9BMDKCwVFRVqlMFNpMug7QrMOtsvn3oG6+9gzW4FGv10yoi+yjH2ZHJ9SVogkVM7ddYlZ30OHwcgZGNvYgN1dmxMYkaFBp1Z+aNwPsz03dDKINF/KpKDfDNqOl66AzQTOpW/Fb1H1f3gt1oTujFpSCtTBdErrBXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785535151; c=relaxed/simple;
	bh=BRyM4csXhxAl+FJ21EMmMfnh6VLsnYW3i4rsY6ELV6I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UDQzi2mpukR/ve4S0ynn4yCO3t+8BnKZtg5CvMf54jA+w9M6lqQSXnav8r5nOdGvdX3gn6YWO2x1xVzhOOTkhzrIUib+zPHg72//4IHTPPUkcp/51mSOw8KRk0M2BIgXZzbVlkwJ+LSYgSsUDWyKMwpXLKr8r5mO2DZ+s5OmCKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=emlnZfld; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="emlnZfld"
Received: by smtp.kernel.org (Postfix)
	id CD3561F00ACA; Fri, 31 Jul 2026 21:59:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A64E1F00AC4;
	Fri, 31 Jul 2026 21:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785535149;
	bh=0tCXxLYUp6P5SUbuz0aRG9ebJQrmqFX2t1pZGPeMbWg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=emlnZfldobuRAGAnlopUT8GIvghcvV1hhbPpLscHNi+q9Q4kgdouw9swSYxauST9d
	 Hc2+hl+3o52tepXCGA35OcQ0FpBHNVPco+d6oZB2HT/HBDAqtKEP+l1/V83kDe1jMy
	 PxMEFhqF5TdIeelays/2PVyULyQ3J29uDfO++vacwepEI5Qs1tDhl/8KCiru6VvQqZ
	 gvDUl7DPiIi0oV9fRRgsbe8AhzNd87NkHPw7pJrcGyjHr1POHEinUaZfLe+ZXrSoNq
	 tf27+M/5i6RHFhjpVrV5/bj1PaLT7Q1GpgMdu2wvo9dqlsQk0iztHAS18FssXO6MgK
	 xfR2pPwE96ufw==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 23:58:54 +0200
Subject: [PATCH b4 v2 13/44] ty: check reachability in the repository the
 commit landed in
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260731-work-b4-editor-branch-guard-v2-13-243fd19d322d@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=7874; i=brauner@kernel.org;
 h=from:subject:message-id; bh=BRyM4csXhxAl+FJ21EMmMfnh6VLsnYW3i4rsY6ELV6I=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlSs1uk5pn6vH41NpFtydfDc4OybGWXT0xq/vCNG+G8
 uaO31KdHaUsDGJcDLJiiiwO7Sbhcst5KjYbZWrAzGFlAhnCwMUpABPJLGFkOG7uOM8rSk2jRPj8
 tcU7On2vh4fK7fpl/X52rPEnmwmTKxn+qc+dsqX7b+Eq67mGDy2MrvnO3VwV3cN65emGJoHMG3a
 WPAA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

The local half of the publish check ran in the process cwd. "b4 review
cron" resolves a topdir per project and never chdirs, so a sweep
checks ancestry against the wrong repository and the thanks waits
forever. Take the repository as an argument and pass the topdir the
queue sweep already has. Pass it to ls-remote too, so repository-local
config applies.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/ty.py         | 32 +++++++++++++++++++++++---------
 src/tests/test_ty.py | 28 +++++++++++++++++++++-------
 2 files changed, 44 insertions(+), 16 deletions(-)

diff --git a/src/b4/ty.py b/src/b4/ty.py
index 9fe5f40..5e225a7 100644
--- a/src/b4/ty.py
+++ b/src/b4/ty.py
@@ -1050,7 +1050,7 @@ def get_check_repo_for_branch(
 
 
 def commit_reachable_on_remote(
-    commit: str, repo_url: str, branch: str = ''
+    commit: str, repo_url: str, branch: str = '', gitdir: Optional[str] = None
 ) -> Optional[bool]:
     """Check if a commit is reachable from a branch advertised by repo_url.
 
@@ -1066,8 +1066,14 @@ def commit_reachable_on_remote(
     deleted), any advertised branch is accepted as before.
 
     Ancestry is computed locally against the advertised tips, so tips we
-    do not have objects for are ignored. Returns True/False, or None if
-    the state could not be determined (e.g. the remote is unreachable).
+    do not have objects for are ignored.  That happens in *gitdir* — the
+    repository the commit was applied in.  It defaults to the process
+    cwd, which is only right for callers that operate on it; a queue
+    sweep covering several projects must name the tree each message
+    belongs to.
+
+    Returns True/False, or None if the state could not be determined
+    (e.g. the remote is unreachable).
     """
     gitargs = [
         '-c',
@@ -1078,7 +1084,7 @@ def commit_reachable_on_remote(
         '--heads',
         repo_url,
     ]
-    ecode, out = b4.git_run_command(None, gitargs)
+    ecode, out = b4.git_run_command(gitdir, gitargs)
     if ecode > 0:
         logger.debug('ls-remote failed for %s (exit code %s)', repo_url, ecode)
         return None
@@ -1104,7 +1110,7 @@ def commit_reachable_on_remote(
     # for them, so treat them as not containing the commit
     stdin = ('\n'.join(sorted(tips)) + '\n').encode()
     _ecode, out = b4.git_run_command(
-        None, ['cat-file', '--batch-check=%(objectname) %(objecttype)'], stdin=stdin
+        gitdir, ['cat-file', '--batch-check=%(objectname) %(objecttype)'], stdin=stdin
     )
     known: List[str] = []
     for line in out.splitlines():
@@ -1116,7 +1122,7 @@ def commit_reachable_on_remote(
         return False
     # Empty output means every commit reachable from ours is also
     # reachable from one of the known tips, i.e. ours is published
-    ecode, out = b4.git_run_command(None, ['rev-list', '-1', commit, '--not', *known])
+    ecode, out = b4.git_run_command(gitdir, ['rev-list', '-1', commit, '--not', *known])
     if ecode > 0:
         logger.debug('rev-list failed for %s (exit code %s)', commit, ecode)
         return None
@@ -1124,7 +1130,11 @@ def commit_reachable_on_remote(
 
 
 def _check_published(
-    checkurl: str, checkcommit: str, checkrepo: str, checkbranch: str = ''
+    checkurl: str,
+    checkcommit: str,
+    checkrepo: str,
+    checkbranch: str = '',
+    gitdir: Optional[str] = None,
 ) -> Optional[bool]:
     """Tri-state publish check for a queued thanks message.
 
@@ -1140,7 +1150,9 @@ def _check_published(
     if checkurl and not checkrepo:
         checkrepo = _get_check_repo(checkurl) or ''
     if checkcommit and checkrepo:
-        return commit_reachable_on_remote(checkcommit, checkrepo, branch=checkbranch)
+        return commit_reachable_on_remote(
+            checkcommit, checkrepo, branch=checkbranch, gitdir=gitdir
+        )
     if not checkurl:
         return True
     try:
@@ -1453,7 +1465,9 @@ def _process_queue_locked(
 
         # Check if the commit is publicly visible
         if not dryrun and (checkurl or (checkcommit and checkrepo)):
-            published = _check_published(checkurl, checkcommit, checkrepo, checkbranch)
+            published = _check_published(
+                checkurl, checkcommit, checkrepo, checkbranch, gitdir=topdir
+            )
             if published is None:
                 still_pending += 1
                 if progress_cb:
diff --git a/src/tests/test_ty.py b/src/tests/test_ty.py
index 54fa6d4..610e5af 100644
--- a/src/tests/test_ty.py
+++ b/src/tests/test_ty.py
@@ -503,7 +503,9 @@ def test_process_queue_passes_branch(
 
     calls: List[Tuple[str, str, str]] = []
 
-    def fake_reachable(commit: str, repo_url: str, branch: str = '') -> Optional[bool]:
+    def fake_reachable(
+        commit: str, repo_url: str, branch: str = '', gitdir: Optional[str] = None
+    ) -> Optional[bool]:
         calls.append((commit, repo_url, branch))
         return False
 
@@ -530,7 +532,9 @@ def test_process_queue_holds_unpublished(
 
     calls: List[Tuple[str, str]] = []
 
-    def fake_reachable(commit: str, repo_url: str, branch: str = '') -> Optional[bool]:
+    def fake_reachable(
+        commit: str, repo_url: str, branch: str = '', gitdir: Optional[str] = None
+    ) -> Optional[bool]:
         calls.append((commit, repo_url))
         return False
 
@@ -580,7 +584,9 @@ def test_process_queue_lock_held(
     monkeypatch.chdir(repo)
     _queue_test_message()
     monkeypatch.setattr(
-        b4.ty, 'commit_reachable_on_remote', lambda commit, repo_url, branch='': False
+        b4.ty,
+        'commit_reachable_on_remote',
+        lambda commit, repo_url, branch='', gitdir=None: False,
     )
     with b4.lockfile_nb(b4.ty._get_queue_lock_path()):
         with pytest.raises(b4.LockHeldError):
@@ -599,7 +605,9 @@ def test_process_queue_check_only(
     monkeypatch.chdir(repo)
     _queue_test_message()
     monkeypatch.setattr(
-        b4.ty, 'commit_reachable_on_remote', lambda commit, repo_url, branch='': True
+        b4.ty,
+        'commit_reachable_on_remote',
+        lambda commit, repo_url, branch='', gitdir=None: True,
     )
 
     def _no_send(dryrun: bool = False) -> Tuple[None, str]:
@@ -627,7 +635,9 @@ def test_process_queue_explicit_topdir(
     monkeypatch.chdir(repo)
     _queue_test_message()
     monkeypatch.setattr(
-        b4.ty, 'commit_reachable_on_remote', lambda commit, repo_url, branch='': True
+        b4.ty,
+        'commit_reachable_on_remote',
+        lambda commit, repo_url, branch='', gitdir=None: True,
     )
     outside = tmp_path / 'elsewhere'
     outside.mkdir()
@@ -665,7 +675,9 @@ def test_process_queue_finalizes_thanked(
 
     _queue_test_message()
     monkeypatch.setattr(
-        b4.ty, 'commit_reachable_on_remote', lambda commit, repo_url, branch='': True
+        b4.ty,
+        'commit_reachable_on_remote',
+        lambda commit, repo_url, branch='', gitdir=None: True,
     )
     monkeypatch.setattr(b4, 'get_smtp', lambda dryrun=False: (None, 't@example.com'))
     monkeypatch.setattr(b4, 'send_mail', lambda *args, **kwargs: 1)
@@ -738,7 +750,9 @@ def _series_status(identifier: str, change_id: str = 'test-change-id') -> str:
 
 def _mock_delivery(monkeypatch: pytest.MonkeyPatch) -> None:
     monkeypatch.setattr(
-        b4.ty, 'commit_reachable_on_remote', lambda commit, repo_url, branch='': True
+        b4.ty,
+        'commit_reachable_on_remote',
+        lambda commit, repo_url, branch='', gitdir=None: True,
     )
     monkeypatch.setattr(b4, 'get_smtp', lambda dryrun=False: (None, 't@example.com'))
     monkeypatch.setattr(b4, 'send_mail', lambda *args, **kwargs: 1)

-- 
2.53.0

