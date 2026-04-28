Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC65E388E41
	for <tools@linux.kernel.org>; Tue, 28 Apr 2026 09:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777368571; cv=none; b=GYXFVa0fvXdbYGeQG5tISgJSqj7pfOGbfD+8u/yyek8HPsS9XeBNeX1U4XR2YyYgtTqFgI1OBT5WP5iPUCgLUZn2t2bv92jgcN9vxl5WBsCCxfNeQACprAXPIy3QWWGPrn9e4adahldLkfPlJfOVqV/CYV8L9WR658+t9W/HE5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777368571; c=relaxed/simple;
	bh=sYPDFWmWwhXVbG8HunntQfGm4cz4k87aC5bCiwwY7b8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=beF9M2qbrRyxaA65qFyrQfoXdbArSISelmBTx+U85uxjwTxuGeCGaT35akNh3vAbMomviby8bQ2O+h++HfmaVqDBgSqhfYLulAsX3edFDRpUIlv7/C7gRxn75Tciu0Gg2uXzGAJ6ZZ9f2QCRj/mZacTCWA0x9fqnMS3qkCazfpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZyWNX0Nc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZyWNX0Nc"
Received: by smtp.kernel.org (Postfix)
	id E0279C2BCB5; Tue, 28 Apr 2026 09:29:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44C1DC2BCC7;
	Tue, 28 Apr 2026 09:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777368570;
	bh=sYPDFWmWwhXVbG8HunntQfGm4cz4k87aC5bCiwwY7b8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZyWNX0NcdXAnzj7WV8zAw6PnIYl6JTpAAOtLfb3IuT31SSPT7cKsdhSXj16/uia+e
	 ZcRrZ9wHeFaEpmmINRsnLhMdKtsL1b1ga+J+hgl52KKOtAASX2ikXaOIaYLfArnauJ
	 YGfR+EkTjtWwxZSDc2dCp/9q+HwPVnVWTBPrIPWBNtvIyEAttY8fMWFechzCqEr/Cz
	 iwyvkFiHixYQw9FExsxkKTVeOGz+CSH4yeq4M2vzFiG96fW2jFVuiL5igg4Up6lxlm
	 BoDer1jMVfWxAbOGWFHZhOJew+7/+9D8/E+cL6F7ucxy/JOoBZ/6wMxdakC3Dn1o+e
	 8CC/GijVACLmA==
From: "Matthieu Baerts (NGI0)" <matttbe@kernel.org>
Date: Tue, 28 Apr 2026 11:29:15 +0200
Subject: [PATCH b4 2/3] review: sashiko: fix URLs
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-sashiko-patchset-api-v1-2-24d4ac34b4ae@kernel.org>
References: <20260428-sashiko-patchset-api-v1-0-24d4ac34b4ae@kernel.org>
In-Reply-To: <20260428-sashiko-patchset-api-v1-0-24d4ac34b4ae@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Matthieu Baerts (NGI0)" <matttbe@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3093; i=matttbe@kernel.org;
 h=from:subject:message-id; bh=sYPDFWmWwhXVbG8HunntQfGm4cz4k87aC5bCiwwY7b8=;
 b=owGbwMvMwCVWo/Th0Gd3rumMp9WSGDI/1H6XvmBw9Z/t1rXMVxSYSqzi+i7ObX8yyUJ6q+TDC
 f/7mm0/d5SyMIhxMciKKbJIt0Xmz3xexVvi5WcBM4eVCWQIAxenAEzkSTsjw/UKEcHllelF5yX6
 fy91cl5281fw54MZtpq99162FO5eW87IsELpbZvVuwS93gQL+SeLSgXZZ17cnZy+9n1NStVDU08
 1LgA=
X-Developer-Key: i=matttbe@kernel.org; a=openpgp;
 fpr=E8CB85F76877057A6E27F77AF6B7824F4269A073

The displayed URL is currently leading to a 404, e.g.

  https://sashiko.dev/patch/93

I don't know if this URL was working at some points, but it is no longer
now. This one works:

  https://sashiko.dev/#/patchset/93

And in case of a series, ?part=X can be used, e.g.

  https://sashiko.dev/#/patchset/93?part=2

Assisted-by: My-reading-glasses
Signed-off-by: Matthieu Baerts (NGI0) <matttbe@kernel.org>
---
 src/b4/review/checks.py         | 5 ++++-
 src/tests/test_review_checks.py | 4 ++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/src/b4/review/checks.py b/src/b4/review/checks.py
index 2ff825f..942935e 100644
--- a/src/b4/review/checks.py
+++ b/src/b4/review/checks.py
@@ -462,7 +462,7 @@ def _run_builtin_sashiko(msg: EmailMessage, sashiko_url: str) -> List[Dict[str,
     reviews = data.get('reviews', [])
     patches = data.get('patches', [])
     base_url = sashiko_url.rstrip('/')
-    patchset_url = f'{base_url}/patch/{ps_id}' if ps_id else ''
+    patchset_url = f'{base_url}/#/patchset/{ps_id if ps_id else msgid}'
 
     # Build a map from patch message-id to sashiko patch id
     patch_id_by_msgid: Dict[str, int] = {}
@@ -526,8 +526,10 @@ def _run_builtin_sashiko(msg: EmailMessage, sashiko_url: str) -> List[Dict[str,
     if sashiko_patch_id is None:
         return []
 
+    i = 1
     for review in reviews:
         if review.get('patch_id') == sashiko_patch_id:
+            patchset_url += f'?part={i}'
             review_status = review.get('status', '')
             if review_status == 'Skipped':
                 result_msg = review.get('result', '') or 'Skipped'
@@ -570,6 +572,7 @@ def _run_builtin_sashiko(msg: EmailMessage, sashiko_url: str) -> List[Dict[str,
             if findings:
                 result['details'] = json.dumps(findings)
             return [result]
+        i += 1
 
     # No review found for this patch
     return [
diff --git a/src/tests/test_review_checks.py b/src/tests/test_review_checks.py
index 1469bf3..ad0f222 100644
--- a/src/tests/test_review_checks.py
+++ b/src/tests/test_review_checks.py
@@ -861,7 +861,7 @@ class TestRunBuiltinSashiko:
         assert '1 critical' in results[0]['summary']
         assert '1 high' in results[0]['summary']
         assert '1 low' in results[0]['summary']
-        assert results[0]['url'] == 'https://sashiko.dev/patch/93'
+        assert results[0]['url'] == 'https://sashiko.dev/#/patchset/93'
         # Details should be valid JSON
         details = json.loads(results[0]['details'])
         assert len(details) == 3  # 1 low + 1 critical + 1 high
@@ -992,7 +992,7 @@ class TestRunBuiltinSashiko:
         msg = _make_msg(msgid='patch1@example.com')
         results = checks._run_builtin_sashiko(msg, 'https://sashiko.dev/')
         # Trailing slash should not cause double slash
-        assert results[0]['url'] == 'https://sashiko.dev/patch/93'
+        assert results[0]['url'] == 'https://sashiko.dev/#/patchset/93?part=1'
 
 
 class TestSashikoAutoWire:

-- 
2.53.0

