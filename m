Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CD63793DE
	for <tools@linux.kernel.org>; Wed, 29 Apr 2026 09:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777456481; cv=none; b=PVyEfcOJ29AUlXjJtiuq7WGNbbhxM2eyxEFbmDgVJhNcOrdRFrtgGr4A8Z7HbSpG68cwtaaA6jMtq5okXXHGlWmr+Lza64YzBWALxlzfai4yra2QC7NOZZXCD4HULaYW5IS0HDzh/KeqXnStQdJOvbhFqpa3bAuj69gR7J87iy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777456481; c=relaxed/simple;
	bh=A3ZjyX5BRnk39H5aZBWgspeC60fMsPdq1qT3KNvNEXc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=RPP+Z8+txYC+kHuyFmZSyW+lr5UHaEd0oLbWWW9ghVXGDVUAcIns6zAfwNDUieBbAIlPQfK7lTlZQtsQ0wAZNuCL2IAq2stCcrrl+kK8hfCK6R6oQpKMCoDSdG3S9FIAtPkzDxmLdmyrg420WTcMVmFihiD3GXelGWVpEwJUGJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b=vZijXHUF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="vZijXHUF"
Received: by smtp.kernel.org (Postfix)
	id 6BFA6C2BCC6; Wed, 29 Apr 2026 09:54:41 +0000 (UTC)
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 51B1DC19425
	for <tools@kernel.org>; Wed, 29 Apr 2026 09:54:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 51B1DC19425
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=narfation.org
Received: by dvalin.narfation.org (Postfix) id B91012035D;
	Wed, 29 Apr 2026 09:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1777456476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+40gsXhj5kvHLLoRdnQBx0oZv7lIwJWflWODCio0dqs=;
	b=vZijXHUFFrC0H4dFWxsCxC4QtrGGssdNheexSsC95JfzWVxtJX1X36mD/0hdvqQ8w82Cub
	TDyssTuOQzfSIPUePNST1K0DNgVB3cZ/shJhRVazLXqplqpUAQbWyRnKCXk2cgEdGn07Xc
	TPCFzW9KawhkverxGFL/BtuHod8WMNk=
From: Sven Eckelmann <sven@narfation.org>
Date: Wed, 29 Apr 2026 11:54:28 +0200
Subject: [PATCH b4] review: Fix sashiko patchset URL format
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-sashiko-patchset-url-v1-1-de8027029bca@narfation.org>
X-B4-Tracking: v=1; b=H4sIAFPV8WkC/yWMwQrCMBAFf6Xs2YUk1Ir+inhI4tOsSluyaRFK/
 93UHmdgZiFFFihdmoUyZlEZ+gr20FBMvn+C5V6ZnHGdad2Z1WuS98CjLzEpCk/5w90x4mRNgIW
 hmo4ZD/n+t1cKLd12p1N4IZbtR+v6A1rYkI18AAAA
X-Change-ID: 20260429-sashiko-patchset-url-65ce710be1e0
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Sven Eckelmann <sven@narfation.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2797; i=sven@narfation.org;
 h=from:subject:message-id; bh=A3ZjyX5BRnk39H5aZBWgspeC60fMsPdq1qT3KNvNEXc=;
 b=owGbwMvMwCXmy1+ufVnk62nG02pJDJkfr0Zs36KX1HpR3NRtTvhl/W9yh+8deH55+qatsiIT9
 xV+mX5mT0cJC4MYF4OsmCLLniv55zezv5X/PO3jUZg5rEwgQxi4OAVgIr33GBl2n++Yk77/yLON
 Zzx/HAp/e/1NeFv6kr8Wpz882Jv7LH+CHMP3rFmrpTKZq/ckC8V+SPj5xdpVYKOoCnuzz9zfbY/
 1zRkA
X-Developer-Key: i=sven@narfation.org; a=openpgp;
 fpr=522D7163831C73A635D12FE5EC371482956781AF

The sashiko server does not expose a direct `/patch/{ps_id}` endpoint.
Requesting https://sashiko.dev/patch/93 returns a 404, because the frontend
is a JavaScript single page application (SPA) that relies on the API to
fetch and render content dynamically.

The correct approach is to load the root page and pass the resource as a
URL fragment (anchor), e.g. https://sashiko.dev/#/patchset/93, so the SPA
can query the API and display the patchset accordingly.

Fixes: 5154a8c9934c ("review: integrate sashiko and follow-up inline comments")
Signed-off-by: Sven Eckelmann <sven@narfation.org>
---
Just noticed this while playing around with the Check functionality of
`b4 review tui`. I didn't actually ran the test suite.
---
 src/b4/review/checks.py         | 2 +-
 src/tests/test_review_checks.py | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/src/b4/review/checks.py b/src/b4/review/checks.py
index 36c0780..51378a9 100644
--- a/src/b4/review/checks.py
+++ b/src/b4/review/checks.py
@@ -462,7 +462,7 @@ def _run_builtin_sashiko(msg: EmailMessage, sashiko_url: str) -> List[Dict[str,
     reviews = data.get('reviews', [])
     patches = data.get('patches', [])
     base_url = sashiko_url.rstrip('/')
-    patchset_url = f'{base_url}/patch/{ps_id}' if ps_id else ''
+    patchset_url = f'{base_url}/#/patchset/{ps_id}' if ps_id else ''
 
     # Build a map from patch message-id to sashiko patch id
     patch_id_by_msgid: Dict[str, int] = {}
diff --git a/src/tests/test_review_checks.py b/src/tests/test_review_checks.py
index 1469bf3..9a43a76 100644
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
+        assert results[0]['url'] == 'https://sashiko.dev/#/patchset/93'
 
 
 class TestSashikoAutoWire:

---
base-commit: d5d981426ead3f490713ef5d2fd1aa3d0f13b005
change-id: 20260429-sashiko-patchset-url-65ce710be1e0

Best regards,
--  
Sven Eckelmann <sven@narfation.org>

