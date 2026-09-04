Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200303905F5
	for <tools@linux.kernel.org>; Fri,  4 Sep 2026 14:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788533992; cv=pass; b=NwIXN4CGluOrUVyRpp1hiT6sO/XR3Alvaw6NK/pPC2rXP0PfozRGZOjLPhvlUb0LnU89m9vjSREegnrJHb8rYa47WZYIWkfzs135e9+OkpOhPIsLrK09MXrheWXAvFxy1H4dpgc5TgXDH7IftudwkMyyqfjDaVfQavPe3v9XYl0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788533992; c=relaxed/simple;
	bh=x/vmE3LWeSabFJBKebD1odDu6y7mZQBKpTDMsA9KS+M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oMDBfyqKFWi666dC70FU4VKCw1kCYEGx3H897f5nQMb/iBeLS/yPsU7RJrp7Af5U35Mef5+VQ++WVscq9Iccr/1zF5iC2AyLzb4g/GmHgTrusZyG/Wq2AYeftkbG5x6qUU+ZX8S3Y8JH6vrgE/izMxVRdzsDIJujsxL3katpwdw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=BkGDTYcN; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="BkGDTYcN"
Received: by smtp.kernel.org (Postfix)
	id DE8DA1F00A3E; Fri,  4 Sep 2026 14:59:50 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=130.117.225.111
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1788533990;
	b=snDJjjGkIFgl4rUprv92iPRt7UQCkfoW4IjvvUyAH2kOBN34QachI2cAS73k57ZIX2lo
	 r0yUR5t51PPs/khadpt1FBnRWP436AUXSMVxjxFv36mn8kzM5NTVhp/Yyu+puBkDF4nlJ
	 C7QjR1Dh0Ge2wBJv4Kh5kBSDVnze85Qp7IFLrtwKMjll+1wn50+uT7WM1KcSOuqSTorU9
	 ikjTMYUhw4+yejKAiqZNAUHrSt8aVOdnqLjQu86LeeBC+pli9TRRgd9jIe/Pb47l7QV7A
	 M7i3rZLSUyNlHxqYXeKeiRLvkYGN1OEyRVziH2jVdoIZBtQZ3T0cjZo8uU65NATxKqg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788533990;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=WJrLiHT3YrA8ChBPX9pZp92d7y0DAxmkh7A5XbSJKcY=;
	b=G3pfOXLYNM9UhBG5IP71MNMNkNdfCgqiIUTwSRXYT2d8L8/JZ3PMTXwpLqXQrM93cieH
	 AdAmtxvW1nK7uzZaZC5YAr8Rg4gixFMjUEkuJnxuH8ulJ1lEtVD2/u7Dfb7bzmYVM69Bk
	 F8ngJqusiHyjtShfLEVzGD4KbOUM8xNol6QWw5NH4ELJzqhiGnC3vTY/RiWr+NwfDEMWe
	 YPJWWe26/wqkSHcyxVW84w66cgTt2FWSf+pj/+M8hw2fcm3tngB5ToJsyhm+paNr1ngV9
	 r9fr9AbS9ahQ9gGyncBLFMPdR5x1tBf2JGYH0kXmD+txZn6/RUoxjmTgmYIrvoB8YsA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=virtuozzo.com header.i=@virtuozzo.com header.a=rsa-sha256 header.s=relay header.b=BkGDTYcN;
	dmarc=pass header.from=virtuozzo.com;
	spf=pass smtp.mailfrom=virtuozzo.com;
	arc=none smtp.remote-ip=130.117.225.111
Received: from relay.virtuozzo.com (relay.virtuozzo.com [130.117.225.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0EF5F1F00A3D
	for <tools@kernel.org>; Fri,  4 Sep 2026 14:59:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=virtuozzo.com header.i=@virtuozzo.com header.a=rsa-sha256 header.s=relay header.b=BkGDTYcN
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 0EF5F1F00A3D
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=virtuozzo.com; s=relay; h=MIME-Version:Message-ID:Date:Subject:From:
	Content-Type; bh=WJrLiHT3YrA8ChBPX9pZp92d7y0DAxmkh7A5XbSJKcY=; b=BkGDTYcNm5+B
	Mucgmal1oZeibxqM85XJWUDmJvBEiIe9PE5kTOf+qWLCFZNzgj1GYWc6rwdOmodbOPZjIKI0L7ss8
	DTXN2mU3ZcBvPoycrLVm6v2AeGm1awbD5ryCxO1mhqViLJlgSh1h8/EIxZ6EyLWGyZfWWDSjcsOye
	UsexvhKmvhJMAhSF2xZ6FRApYSh1sCHc2Grj9fDr3ZZuqmwrLtSZl8Fwo4JrPW5nbK4qBPUU5+1Eg
	wN7U5tU0F6Wamx22lRcEw2tJyz17H8AdfJAW/pYEqvJ2MY8+JFiZ+duYilyPp+goy2WzkBrGJHDC6
	h6RtZfYiNkX9rbaY4G7i7w==;
Received: from ch-demo-asa.virtuozzo.com ([130.117.225.8] helo=f0.vzint.dev)
	by relay.virtuozzo.com with esmtp (Exim 4.96)
	(envelope-from <khorenko@virtuozzo.com>)
	id 1x2VLp-006gpV-3A;
	Fri, 04 Sep 2026 16:59:38 +0200
From: Konstantin Khorenko <khorenko@virtuozzo.com>
To: tools@kernel.org
Cc: Konstantin Khorenko <khorenko@virtuozzo.com>
Subject: [PATCH b4] review: separate revisions from paths when diffing a commit
Date: Fri,  4 Sep 2026 16:59:41 +0200
Message-ID: <20260904145941.1414684-1-khorenko@virtuozzo.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reviewing a series fails with "Could not generate diff" whenever the
work tree contains a file or directory named after the commit being
diffed:

  $ mkdir 1b7771486ae3d9dec8959dbb4da51e535364fb8e
  $ git diff 1b7771486ae3d9dec8959dbb4da51e535364fb8e~1 \
            1b7771486ae3d9dec8959dbb4da51e535364fb8e
  fatal: ambiguous argument '1b7771486ae3d9dec8959dbb4da51e535364fb8e':
  both revision and filename

Any tooling that names its output after a bare SHA (review notes,
logs, build artifacts) can shadow the revision this way. Both
arguments here are always revisions, so terminate them with '--' at
every site that diffs a commit against its parent.

Signed-off-by: Konstantin Khorenko <khorenko@virtuozzo.com>
Assisted-by: claude-sonnet-5
---
 src/b4/review/_review.py         | 14 ++++++++++----
 src/b4/review_tui/_review_app.py |  8 +++++---
 2 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/src/b4/review/_review.py b/src/b4/review/_review.py
index a375332..07a0d51 100644
--- a/src/b4/review/_review.py
+++ b/src/b4/review/_review.py
@@ -1305,7 +1305,9 @@ def reanchor_patch_comments(
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
@@ -1461,7 +1463,9 @@ def _integrate_agent_reviews(
         # Resolve comment positions against the real diff
         if comments:
             sha = commit_shas[idx]
-            ecode, real_diff = b4.git_run_command(topdir, ['diff', f'{sha}~1', sha])
+            ecode, real_diff = b4.git_run_command(
+                topdir, ['diff', f'{sha}~1', sha, '--']
+            )
             if ecode == 0:
                 _resolve_comment_positions(real_diff, comments)
 
@@ -1855,7 +1859,7 @@ def _integrate_sashiko_reviews(
         # Resolve comment positions against the real diff, then fall back
         # to structured finding locations for any still-unpositioned comments.
         sha = commit_shas[idx]
-        ecode, real_diff = b4.git_run_command(topdir, ['diff', f'{sha}~1', sha])
+        ecode, real_diff = b4.git_run_command(topdir, ['diff', f'{sha}~1', sha, '--'])
         if ecode == 0:
             _resolve_comment_positions(real_diff, comments)
             if locations_by_file:
@@ -1950,7 +1954,9 @@ def _integrate_followup_inline_comments(
 
             # Resolve positions against the real diff
             sha = commit_shas[idx]
-            ecode, real_diff = b4.git_run_command(topdir, ['diff', f'{sha}~1', sha])
+            ecode, real_diff = b4.git_run_command(
+                topdir, ['diff', f'{sha}~1', sha, '--']
+            )
             if ecode == 0:
                 _resolve_comment_positions(real_diff, comments)
 
diff --git a/src/b4/review_tui/_review_app.py b/src/b4/review_tui/_review_app.py
index da60455..26ce90a 100644
--- a/src/b4/review_tui/_review_app.py
+++ b/src/b4/review_tui/_review_app.py
@@ -699,7 +699,9 @@ from b4.review_tui._modals import (
                     viewer.write(Rule(style='dim'))
                     viewer.write(Text(''))
 
-        ecode, diff_out = b4.git_run_command(self._topdir, ['diff', f'{sha}~1', sha])
+        ecode, diff_out = b4.git_run_command(
+            self._topdir, ['diff', f'{sha}~1', sha, '--']
+        )
         if ecode > 0:
             viewer.write(Text('Could not generate diff', style=ts['error']))
             return
@@ -1336,7 +1338,7 @@ from b4.review_tui._modals import (
                 return
             sha = self._commit_shas[patch_idx]
             ecode, real_diff = b4.git_run_command(
-                self._topdir, ['diff', f'{sha}~1', sha]
+                self._topdir, ['diff', f'{sha}~1', sha, '--']
             )
             if ecode > 0:
                 self.notify('Could not get diff', severity='error')
@@ -2054,7 +2056,7 @@ from b4.review_tui._modals import (
 
                 sha = self._commit_shas[idx]
                 ecode, real_diff = b4.git_run_command(
-                    self._topdir, ['diff', f'{sha}~1', sha]
+                    self._topdir, ['diff', f'{sha}~1', sha, '--']
                 )
                 if ecode == 0:
                     b4.review._resolve_comment_positions(real_diff, comments)
-- 
2.43.0

