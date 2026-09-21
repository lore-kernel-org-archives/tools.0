Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35BC4F85A9
	for <tools@linux.kernel.org>; Mon, 21 Sep 2026 18:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790015005; cv=pass; b=Z0bVhdctZh1k2zEny9Gpvh7hNKnY2V8rFBUXGvDuRzBvq6ZcuxberR2gOvoEzR72mNg4smpB0uSS5KF/olLMdXcg64UigUFWjCV0Pbzz66bAWExv9whvZLTWjleQbIGYLo5yvA3bTDkhPhRhi1mWt924XH5tJln49f8rd2jvJeg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790015005; c=relaxed/simple;
	bh=fqgqxChufUP/oU6DYV3kqLvz6mywD1HvHN0MRKbJjP8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WWvt/t5yDB8dl+JytH8200jXzQUSouOcQzczequWa4BnmBx5xHfGt2OkTu86UQ8Jdh6w0irOBMgWiV3TIhYaKis9MzKJ+LenExvX5xIHTptkgDuFm++RPWPScW7/3yiHeGUnls1SGCkMZBfF35TzimMHE1rM/ZBF23ugm9PTSiU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=aJz9KoSE; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="aJz9KoSE"
Received: by smtp.kernel.org (Postfix)
	id 2A32A1F00893; Mon, 21 Sep 2026 18:23:23 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=130.117.225.111
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1790015003;
	b=dl4NTF+IDAdj8ypdbO3+9d0FLZ0iEdFebs5IrnyTcHMB6bpUkI6qmDX7FGE5NxVfVkT9
	 wg8jJw3EHY2UTpwIY+aCw10qe1RciDZNVddFpVd/E8YKYMYgeuG/v42BxVAvX3/hdtVeB
	 W+HZ6sn+VlHVfhPGN6sYwaSFJD23sEvtlCF8XwGnLWEWArik0NUV+8vOlZtaGMsVWmScP
	 r06tkc/OXFZbbXcM5J1vxFI7uRCjbRhYtAztyW4QiKcaC/RJXXg1wbNR0HQkS2dTG2pcb
	 0EimdWTk4coCGZo6A7ogTz9obkTfNzhkQdhFP8N0oBf8vfsi0AbuhN10XhD4cgtHe2A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790015003;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Fb8B+ytRn3stBRBDhUBDTLtlpc5w/mhr7dwkjYJPFGA=;
	b=tNmA6iYyvbtRYb3oFN3oSPIrm4xd5KAJ7xIla4/fZB/NHat7m5i4divRZ4+KoIxfkKyE
	 mgrNEl92mxy+ntoFiUfyZZQYSGEqsqDihFIxahZ1oZ5iAZEt43U7YVW76DgWNSGkWw88N
	 txrTlon5321JAp3xIOjY3Wrzh9d3z9HUCGBfsehhIMjWhuDVTB4McNB+A/MA7TAE3j2JO
	 r9J8yTPvg759nVoCuCz3NhAZ6tIQiJItdFkGtl4v3Xqb22Zq2aG7Hi7YjDGEeV0ZMqSo8
	 pp2RDmVMm5gPclKF6wzi0JSOMEDBXLXqgqBvhtxBF8UwwkErv1qjU0RI9uUOZ+2+tNw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=virtuozzo.com header.i=@virtuozzo.com header.a=rsa-sha256 header.s=relay header.b=aJz9KoSE;
	dmarc=pass header.from=virtuozzo.com;
	spf=pass smtp.mailfrom=virtuozzo.com;
	arc=none smtp.remote-ip=130.117.225.111
Received: from relay.virtuozzo.com (relay.virtuozzo.com [130.117.225.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 95C0A1F000FF
	for <tools@kernel.org>; Mon, 21 Sep 2026 18:23:21 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=virtuozzo.com header.i=@virtuozzo.com header.a=rsa-sha256 header.s=relay header.b=aJz9KoSE
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 95C0A1F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=virtuozzo.com; s=relay; h=Message-Id:Content-Type:MIME-Version:Subject:Date
	:From; bh=Fb8B+ytRn3stBRBDhUBDTLtlpc5w/mhr7dwkjYJPFGA=; b=aJz9KoSECAiSOXCPt67
	iiy7LyhNY72h+MWhXHtTscHH+dFkZTHJEUs8e+FEHWzWZFZZLYc91eqY1CeO+eAgM9ENG0rQYdorD
	L8ENsixFgRsNVXB5aHd6l2kEXFy8CKUSIw4GdqigJFr8jBrG1NeK1qDgKqjPDZtBMIm+Mi3JoZIDA
	lDF9aXSl0xiEDTd06M9GZiBuefdAoq6dx92r9l6rEi18OJ9pMIpugYZSONwDo8PX/+XjWk0PglkK9
	0WU9sm3jyE2R9kZkGrG8tAyK9QChnV1yLOE11DPa/31sYnhuGXACZ6OP4X2Zgz8ZDxHhbFKnGmLM6
	ylDOwX2bu09YIdQ==;
Received: from ch-demo-asa.virtuozzo.com ([130.117.225.8] helo=f0.sw.ru)
	by relay.virtuozzo.com with esmtp (Exim 4.96)
	(envelope-from <khorenko@virtuozzo.com>)
	id 1x8ich-0075cB-0o;
	Mon, 21 Sep 2026 20:23:05 +0200
From: Konstantin Khorenko <khorenko@virtuozzo.com>
Date: Mon, 21 Sep 2026 20:23:04 +0200
Subject: [PATCH b4 v2] Separate revisions from paths when git is handed a
 bare commit
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-kh-separate-revisions-v2-1-f7a828b1c174@virtuozzo.com>
X-B4-Tracking: v=1; b=H4sIAAd2sWoC/zWNwQ6CMBBEf8Xs2ZK2KcR68j8MB6iLrESWtIUoh
 H+3QLzNTGbmLRDQEwa4nhbwOFEg7pPR5xO4tuqfKOiRPGipC2m1El0rAg6VryKK/yCIRucyt9p
 YdAWk7eCxoc/+e4faQHlkYaxf6OJ2uLVaCpH9d4dPau8eHGmUya1RmUqiuBixcdlj3/FtIh9Hn
 mfOHL+hXNf1Bze/iRTFAAAA
X-Change-ID: 20260921-kh-separate-revisions-f25059249ec6
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Konstantin Khorenko <khorenko@virtuozzo.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=13590;
 i=khorenko@virtuozzo.com; h=from:subject:message-id;
 bh=fqgqxChufUP/oU6DYV3kqLvz6mywD1HvHN0MRKbJjP8=;
 b=owEBbQKS/ZANAwAKAVGWCkf5YVwqAcsmYgBqsXYR/g+rGAbvnjlwNItueBEzWpn0s/mP2unZe
 Zn73kvaC+GJAjMEAAEKAB0WIQRWD23IPcXT0GO9CCxRlgpH+WFcKgUCarF2EQAKCRBRlgpH+WFc
 Khm0D/9SkKUlvtfm5AQWEwINz+0tYphu7f5Xf7rXVYsrObVP96RGdabTpysdw9fr8ZBJwS8vOU2
 ltL8SIQU7soeLABGA/4CvrxyTwGWaEZERxubOlR+xdYtREqNG0D/ufa3JExJx0fDdSjMwZJeQ1V
 7pMqjW5We3mn6693PKAVV9gmYiiKxv/753NmZ/H67Oqz3NqedXKMeFQgFueGVwK8gdJqRfjCiFq
 skUS5yjtFTqh6/4z/Uon4fA2uGrVlWR+Kp65IOaS8DLmo9Z3WC1GxKH65NQ+VUpQQ6uO7wkd1VE
 jEGRjggb/browQdboe0CkWJd4NdiXwR8/yoMAWgDGYIQQkugXth8+d5cLjMhQ4wYaVg21A70FpJ
 dZ3/VV0IAoNdKo1HxPM7UNfEIrKe77yBwF4uQM5yJnkhVNxfd7TnamLmUbTSok9ioqwrOG6jN2J
 DFS8oRCCbsqCcTpxsJUpJKlSc7XQsfSTo1BHr8RnEpNbH+lHRy77XzrwTo9xkKAly/qyNeZje2v
 FtJRNQMrfGHgc2eAIqk6g/EjMA2yb5vLTvKTm2+3FaHtyR6u672E1aJwcz1Bz6301/xTDLoZBFX
 7rphsH1S0tPE2EWhjb1OSW03JBCaHffS2t2yMrUPKq2gG7t63TmQusmqnx1FFDxVehuamFTGI+k
 7Y5hGCMqUSH1d1A==
X-Developer-Key: i=khorenko@virtuozzo.com; a=openpgp;
 fpr=560F6DC83DC5D3D063BD082C51960A47F9615C2A

Reviewing a series fails with "Could not generate diff" whenever the
work tree contains a file or directory named after the commit being
diffed:

  $ mkdir 1b7771486ae3d9dec8959dbb4da51e535364fb8e
  $ git diff 1b7771486ae3d9dec8959dbb4da51e535364fb8e~1 \
            1b7771486ae3d9dec8959dbb4da51e535364fb8e
  fatal: ambiguous argument '1b7771486ae3d9dec8959dbb4da51e535364fb8e':
  both revision and filename

Any tooling that names its output after a bare SHA (review notes,
logs, build artifacts) can shadow the revision this way. "git show"
and "git log -1" reject a shadowed commit with the same error, so the
commit message and patch readers in review, dig, ty and prep fail the
same way. Range arguments such as "a..b" are not affected.

The arguments at these sites are always revisions, so terminate them
with '--' wherever a bare commit is passed to diff, show or log.

Signed-off-by: Konstantin Khorenko <khorenko@virtuozzo.com>
Assisted-by: claude-fable-5-1
---
Changes in v2:
- Terminate the "git show" and "git log -1" commit arguments with '--'
  as well, and the one "git diff" site v1 missed. (Konstantin Ryabitsev)
- Link to v1: https://patch.msgid.link/20260904145941.1414684-1-khorenko@virtuozzo.com
---
 src/b4/__init__.py                 |  2 +-
 src/b4/dig.py                      |  8 ++++----
 src/b4/ez.py                       |  4 ++--
 src/b4/review/_review.py           | 24 +++++++++++++++---------
 src/b4/review_tui/_review_app.py   | 12 +++++++-----
 src/b4/review_tui/_tracking_app.py |  2 +-
 src/b4/ty.py                       |  6 +++---
 7 files changed, 33 insertions(+), 25 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 584755a..65f20f6 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -4673,7 +4673,7 @@ def git_range_to_patches(
         logger.debug('showargs=%s', showargs)
         ecode, out = git_run_command(
             gitdir,
-            ['show'] + showargs + [commit],
+            ['show'] + showargs + [commit, '--'],
             decode=False,
         )
         if ecode > 0:
diff --git a/src/b4/dig.py b/src/b4/dig.py
index 24e15ff..d63c47a 100644
--- a/src/b4/dig.py
+++ b/src/b4/dig.py
@@ -62,7 +62,7 @@ try_diff_algos: List[str] = [
     # Make sure it has exactly one parent (not a merge)
     ecode, out = b4.git_run_command(
         topdir,
-        ['show', '--no-patch', '--format=%p', commit],
+        ['show', '--no-patch', '--format=%p', commit, '--'],
     )
     if ecode > 0:
         logger.error('Could not get commit info for %s', commit)
@@ -75,7 +75,7 @@ try_diff_algos: List[str] = [
     links: Set[str] = set()
     ecode, out = b4.git_run_command(
         topdir,
-        ['show', '--no-patch', '--format=%B', commit],
+        ['show', '--no-patch', '--format=%B', commit, '--'],
     )
     if ecode > 0:
         logger.error('Could not get commit message for %s', commit)
@@ -92,7 +92,7 @@ try_diff_algos: List[str] = [
     # Find commit's author and subject from git
     ecode, out = b4.git_run_command(
         topdir,
-        ['show', '--no-patch', '--format=%as%x00%ae%x00%an%x00%s', commit],
+        ['show', '--no-patch', '--format=%as%x00%ae%x00%an%x00%s', commit, '--'],
     )
     if ecode > 0:
         logger.error('Could not get commit info for %s', commit)
@@ -123,7 +123,7 @@ try_diff_algos: List[str] = [
         logger.debug('showargs=%s', showargs + [algoarg])
         ecode, bpatch = b4.git_run_command(
             topdir,
-            ['show'] + showargs + [algoarg] + [commit],
+            ['show'] + showargs + [algoarg] + [commit, '--'],
             decode=False,
         )
         if ecode > 0:
diff --git a/src/b4/ez.py b/src/b4/ez.py
index 618abb9..9e05b12 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -735,7 +735,7 @@ def load_cover(
             cover = ''
             tracking = dict()
         else:
-            gitargs = ['show', '-s', '--format=%B', cover_commit]
+            gitargs = ['show', '-s', '--format=%B', cover_commit, '--']
             ecode, out = b4.git_run_command(None, gitargs)
             if ecode > 0:
                 logger.critical('CRITICAL: unable to load cover letter')
@@ -1028,7 +1028,7 @@ def _rewrite_series_commits(
     if strategy == 'commit':
         return f'{cover_sha}~1'
     # tip-commit: read base-branch out of the known cover commit and fork off it
-    ecode, out = b4.git_run_command(None, ['show', '-s', '--format=%B', cover_sha])
+    ecode, out = b4.git_run_command(None, ['show', '-s', '--format=%B', cover_sha, '--'])
     if ecode > 0:
         logger.critical('CRITICAL: unable to read cover letter at %s', cover_sha)
         sys.exit(1)
diff --git a/src/b4/review/_review.py b/src/b4/review/_review.py
index b39f68d..1f408ab 100644
--- a/src/b4/review/_review.py
+++ b/src/b4/review/_review.py
@@ -537,7 +537,7 @@ def get_review_branch_patch_ids(
     for idx, sha in enumerate(out.strip().splitlines()):
         ecode, bpatch = b4.git_run_command(
             topdir,
-            ['show', '--format=email', '--binary', '--encoding=utf-8', sha],
+            ['show', '--format=email', '--binary', '--encoding=utf-8', sha, '--'],
             decode=False,
         )
         if ecode > 0:
@@ -559,7 +559,7 @@ def get_review_branch_patch_ids(
 
     Returns (cover_text, tracking_dict).
     """
-    ecode, out = b4.git_run_command(topdir, ['log', '-1', '--format=%B', branch])
+    ecode, out = b4.git_run_command(topdir, ['log', '-1', '--format=%B', branch, '--'])
     if ecode > 0:
         logger.critical('Unable to read tracking commit from %s', branch)
         sys.exit(1)
@@ -1347,7 +1347,9 @@ def reanchor_patch_comments(
             if not comments or not any(c.get('content') for c in comments):
                 continue
             if real_diff is None:
-                ecode, real_diff = b4.git_run_command(topdir, ['diff', f'{sha}~1', sha])
+                ecode, real_diff = b4.git_run_command(
+                    topdir, ['diff', f'{sha}~1', sha, '--']
+                )
                 if ecode != 0:
                     break
             _resolve_comment_positions(real_diff, comments)
@@ -1503,7 +1505,9 @@ def _integrate_agent_reviews(
         # Resolve comment positions against the real diff
         if comments:
             sha = commit_shas[idx]
-            ecode, real_diff = b4.git_run_command(topdir, ['diff', f'{sha}~1', sha])
+            ecode, real_diff = b4.git_run_command(
+                topdir, ['diff', f'{sha}~1', sha, '--']
+            )
             if ecode == 0:
                 _resolve_comment_positions(real_diff, comments)
 
@@ -1926,7 +1930,7 @@ def _integrate_sashiko_reviews(
         # Resolve comment positions against the real diff, then fall back
         # to structured finding locations for any still-unpositioned comments.
         sha = commit_shas[idx]
-        ecode, real_diff = b4.git_run_command(topdir, ['diff', f'{sha}~1', sha])
+        ecode, real_diff = b4.git_run_command(topdir, ['diff', f'{sha}~1', sha, '--'])
         if ecode == 0:
             _resolve_comment_positions(real_diff, comments)
             if locations_by_file:
@@ -2021,7 +2025,9 @@ def _integrate_followup_inline_comments(
 
             # Resolve positions against the real diff
             sha = commit_shas[idx]
-            ecode, real_diff = b4.git_run_command(topdir, ['diff', f'{sha}~1', sha])
+            ecode, real_diff = b4.git_run_command(
+                topdir, ['diff', f'{sha}~1', sha, '--']
+            )
             if ecode == 0:
                 _resolve_comment_positions(real_diff, comments)
 
@@ -3727,13 +3733,13 @@ def _build_review_email(
     elif comments and commit_sha and topdir:
         # Auto-generate reply from inline review comments
         ecode, commit_msg = b4.git_run_command(
-            topdir, ['show', '--format=%B', '--no-patch', commit_sha]
+            topdir, ['show', '--format=%B', '--no-patch', commit_sha, '--']
         )
         if ecode > 0:
             logger.warning('Could not get commit message for %s', commit_sha)
             return None
         ecode, diff_text = b4.git_run_command(
-            topdir, ['diff', f'{commit_sha}~1', commit_sha]
+            topdir, ['diff', f'{commit_sha}~1', commit_sha, '--']
         )
         if ecode > 0:
             logger.warning('Could not get diff for %s', commit_sha)
@@ -3747,7 +3753,7 @@ def _build_review_email(
         # Trailer-only reply: quote the first paragraph of the original
         if patch_meta is not None and commit_sha and topdir:
             ecode, commit_msg = b4.git_run_command(
-                topdir, ['show', '--format=%B', '--no-patch', commit_sha]
+                topdir, ['show', '--format=%B', '--no-patch', commit_sha, '--']
             )
             if ecode == 0 and commit_msg.strip():
                 # Strip the subject line (already in Subject: Re: header)
diff --git a/src/b4/review_tui/_review_app.py b/src/b4/review_tui/_review_app.py
index d3d6907..1e70bc6 100644
--- a/src/b4/review_tui/_review_app.py
+++ b/src/b4/review_tui/_review_app.py
@@ -596,7 +596,7 @@ from b4.review_tui._modals import (
 
         # Show commit message with subject as a bright heading
         ecode, commit_msg = b4.git_run_command(
-            self._topdir, ['show', '--format=%B', '--no-patch', sha]
+            self._topdir, ['show', '--format=%B', '--no-patch', sha, '--']
         )
         if ecode == 0 and commit_msg.strip():
             all_lines = commit_msg.strip().splitlines()
@@ -703,7 +703,9 @@ from b4.review_tui._modals import (
                     viewer.write(Rule(style='dim'))
                     viewer.write(Text(''))
 
-        ecode, diff_out = b4.git_run_command(self._topdir, ['diff', f'{sha}~1', sha])
+        ecode, diff_out = b4.git_run_command(
+            self._topdir, ['diff', f'{sha}~1', sha, '--']
+        )
         if ecode > 0:
             viewer.write(Text('Could not generate diff', style=ts['error']))
             return
@@ -1340,13 +1342,13 @@ from b4.review_tui._modals import (
                 return
             sha = self._commit_shas[patch_idx]
             ecode, real_diff = b4.git_run_command(
-                self._topdir, ['diff', f'{sha}~1', sha]
+                self._topdir, ['diff', f'{sha}~1', sha, '--']
             )
             if ecode > 0:
                 self.notify('Could not get diff', severity='error')
                 return
             ecode, commit_msg = b4.git_run_command(
-                self._topdir, ['show', '--format=%B', '--no-patch', sha]
+                self._topdir, ['show', '--format=%B', '--no-patch', sha, '--']
             )
             if ecode > 0:
                 self.notify('Could not get commit message', severity='error')
@@ -2076,7 +2078,7 @@ from b4.review_tui._modals import (
 
                 sha = self._commit_shas[idx]
                 ecode, real_diff = b4.git_run_command(
-                    self._topdir, ['diff', f'{sha}~1', sha]
+                    self._topdir, ['diff', f'{sha}~1', sha, '--']
                 )
                 if ecode == 0:
                     b4.review._resolve_comment_positions(real_diff, comments)
diff --git a/src/b4/review_tui/_tracking_app.py b/src/b4/review_tui/_tracking_app.py
index 4ca8d8a..77ff0d3 100644
--- a/src/b4/review_tui/_tracking_app.py
+++ b/src/b4/review_tui/_tracking_app.py
@@ -674,7 +674,7 @@ def _resolve_worktree_take_conflict(
 
 def _get_art_counts(topdir: str, branch: str) -> Optional[Tuple[int, int, int]]:
     """Load (Acked, Reviewed, Tested) trailer counts from a review branch."""
-    ecode, out = b4.git_run_command(topdir, ['log', '-1', '--format=%B', branch])
+    ecode, out = b4.git_run_command(topdir, ['log', '-1', '--format=%B', branch, '--'])
     if ecode > 0 or not out:
         return None
     return _parse_art_from_message(out)
diff --git a/src/b4/ty.py b/src/b4/ty.py
index bbce149..0b09c5e 100644
--- a/src/b4/ty.py
+++ b/src/b4/ty.py
@@ -84,7 +84,7 @@ def git_get_merge_id(
 
 
 def git_get_commit_message(gitdir: Optional[str], rev: str) -> Tuple[int, str]:
-    args = ['log', '--format=%B', '-1', rev]
+    args = ['log', '--format=%B', '-1', rev, '--']
     return b4.git_run_command(gitdir, args)
 
 
@@ -169,7 +169,7 @@ def auto_locate_pr(
         return None
 
     # Check that we are the author of the merge commit
-    gitargs = ['show', '--format=%ae', merge_commit_id]
+    gitargs = ['show', '--format=%ae', merge_commit_id, '--']
     out = b4.git_get_command_lines(gitdir, gitargs)
     if not out:
         logger.debug('Could not get merge commit author for %s', pr_commit_id)
@@ -531,7 +531,7 @@ def get_applied_info(
     best_date: Optional[str] = None
     for label, commit_id in entries:
         # %ct picks the latest; %cD is the RFC2822 date; %h the short hash.
-        gitargs = ['show', '-s', '--format=%ct%x00%cD%x00%h', commit_id]
+        gitargs = ['show', '-s', '--format=%ct%x00%cD%x00%h', commit_id, '--']
         out = b4.git_get_command_lines(gitdir, gitargs)
         if not out:
             continue

---
base-commit: e5168b69c2b0661c7a167eff8ddc5753c458b1d1
change-id: 20260921-kh-separate-revisions-f25059249ec6

Best regards,
--  
Konstantin Khorenko <khorenko@virtuozzo.com>

