Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E489137750
	for <tools@linux.kernel.org>; Sun, 28 Jun 2026 06:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782626620; cv=pass; b=f6eO1rdaRIm33Fq+3dWAshuQZTcrpY62MA4iIUpIFlPE/DMjvy7efsnPV6/oC6/zjVCMS9zjQLqTx6rtX2VSSaTgNIHEvBNPZNHw6AbZdFtj8qUin16c4t52Lh3CCtK2wZ37o6+0DGCKHD6gvryWAL4Zd6UFd2IPQZnNaxeS+Uc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782626620; c=relaxed/simple;
	bh=ITxmuV/Aw0sOns5W5EtEIH7XrbS6ZTAIhMpGo7tSKtU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JpP7AVTBXg1v53L7ZGdD0N9RJY3lllCawIq6v/uUPALlDYqPIk1IIUFfxHgrSUSKuCZ0mfsFaFrEYIcnvuLeWKL9sUBVdYTikeh6Kb9PZEp+P7fI0nV/1t9WlukN1BzRoz7jk1J5XYI3dex2t4uljSkWKJRisUGOjDQlVQZRwMU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=fail (0-bit key) header.d=rsg.ci.i.u-tokyo.ac.jp header.i=@rsg.ci.i.u-tokyo.ac.jp header.b=FYY6b3Ve reason="key not found in DNS"; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=rsg.ci.i.u-tokyo.ac.jp header.i=@rsg.ci.i.u-tokyo.ac.jp header.b="FYY6b3Ve"
Received: by smtp.kernel.org (Postfix)
	id 5FF251F00A3A; Sun, 28 Jun 2026 06:03:37 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=49.212.243.89
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1782626617;
	b=vbDMsvXjcBFSN0yPYKRXuTilDgiJZFYBIiPO6/ZeiiOjWvxFpUZ3EKHk6zVql9cFh1QC
	 KAeNsWbgO4cY3KKKI0yvJDs3B+h8qJs9GJXKJp1SDKs5pxKuquT5eN5ZkvIQKtrgCwiqh
	 fKVicFocH16C/zx0d0LhL7d2U1XwpWo687kiyYx90fnyQzWMJYdbEzsSVz9exKkN2Usdb
	 Pj1wP60cvKB4nyDucja2jEWxFwproxVhEz7KhGxlGRY9YmT//crSWVfO6EFuSulu+TqRI
	 Z7YM4Je3+PK6znr2gD+FIcDDjCe+gLjM3c1S3Kr1Zr0SPpJSRbbk9H659Rf/4Y7HImA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1782626617;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=d7/CfHtvcbbOr9YWBdjRB+SY5LduS9uXxnKneuQPHWg=;
	b=cZXTGLYQp836BuUxTlVvyRAaLzQ1W2/Vq0VAkAAR2OTY4dh09N49eRcipaYspWP8Nvpg
	 TMWJnyAJuCufD9xd/paWSIcQt2+Mtf6Mv1/LVABAqydMh6Q8utnIhhzlCXFkV4GDFtb5E
	 U9fizovf6spcuMmfQL/o2iW1iC13MzzFAnVjETs1ZIKB2mzvAEovLfmchKUbcMQJ2kNpi
	 A449Vgf6HAPz8ba1ALCh+4E6pUyidNq2S5tadYhzgN+ZTeHh/N2danXWWIrANS+fl8Kum
	 SmO4wmIgz9maDcOp3JKPxmuUZpKDOhWvtIX8JR+WSzRGbpDNQh4/DjeIm3d3t/nBLAA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dmarc=pass header.from=rsg.ci.i.u-tokyo.ac.jp;
	spf=pass smtp.mailfrom=rsg.ci.i.u-tokyo.ac.jp;
	arc=none smtp.remote-ip=49.212.243.89
Received: from www3579.sakura.ne.jp (www3579.sakura.ne.jp [49.212.243.89])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8BD641F000E9
	for <tools@kernel.org>; Sun, 28 Jun 2026 06:03:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 8BD641F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=rsg.ci.i.u-tokyo.ac.jp
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=rsg.ci.i.u-tokyo.ac.jp
Received: from h183.csg.ci.i.u-tokyo.ac.jp (h183.csg.ci.i.u-tokyo.ac.jp [133.11.54.183])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 65S63LT7061457
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Sun, 28 Jun 2026 15:03:27 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=d7/CfHtvcbbOr9YWBdjRB+SY5LduS9uXxnKneuQPHWg=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-Id:To:Subject:Date;
        s=rs20250326; t=1782626607; v=1;
        b=FYY6b3Ve5P93R4LL3z0CsIPqkdn6WG7wfoSWgd8dcKS4/0/keVnU93ZX9VLrLT+L
         /4KccEvPS7gX6DZY7mdg0Xfv1IHtD1Fd8ao9A+r5Hs8UMnkwqz8rMM2/e+DUoF/T
         po3PaBcm/qCS5VgGEY/7Vr05NOcrZ3irh3BNMn39S16nOS8ylv04TcRR4YTnp6ZH
         rE+MidF0V4DPKenp49w3ouEQqinBMywQt2QW9UjBi/kUGmq3lRh/xEMSnBHLcRYO
         7g4+is/c/gq2NmMDJK7IMbj+Y8P7b/Mj5K3anosFDYVg4k2/UJDCM5HkkcqiEn4h
         qm4nHPeET+OCDDR/CUhTFw==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Date: Sun, 28 Jun 2026 15:03:21 +0900
Subject: [PATCH b4] prep: keep auto-to-cc trailers before cover changelogs
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260628-prep-v1-1-8ac18db0abf3@rsg.ci.i.u-tokyo.ac.jp>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMyw5AMBBFf0XuWpNqZDx+RSyowVggLSIR/65Yn
 pN77gXPTtijjC44PsTLMgdI4gh2bOaBlXSBYbQhTSZXq+NVGUtaFxnZnglhGmQv53dToU1R/87
 v7cR2e3vc9wOGzOYJbAAAAA==
X-Change-ID: 20260628-prep-2c600976cfe6
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
X-Mailer: b4 0.16-dev-40eef
X-Developer-Signature: v=1; a=openpgp-sha256; l=5722;
 i=odaki@rsg.ci.i.u-tokyo.ac.jp; h=from:subject:message-id;
 bh=ITxmuV/Aw0sOns5W5EtEIH7XrbS6ZTAIhMpGo7tSKtU=;
 b=owGbwMvMwCWmMbc20y1CyJDxtFoSQ5bDTt2Oqb8VV65Ly/i2orSk/qx89wM2lrDS5NBXdfWTL
 rK3p97rKGVhEONikBVTZEkp2s2tEV37qTAhvgVmDisTyBAGLk4BmIjmT4b/jhvvTBY9pRskaLg2
 cvmTVP6P/sZcJze8MbCxCJy9/uCLy4wMhyfF9h+8Kn3Y7q3Ekf8Lb897//PvVZ3yqOfnCu8x7BR
 +wwwA
X-Developer-Key: i=odaki@rsg.ci.i.u-tokyo.ac.jp; a=openpgp;
 fpr=AEDC03C9AF734F2EC26A7BFFA4BAEAA73536753C

After get_body_parts() stopped splitting free-form messages on every
"---" line, prep --auto-to-cc no longer saw existing cover trailers
when they were followed by the generated changelog block. That made it
append duplicate To:/Cc: trailers below the changelog.

Teach auto-to-cc to collect existing cover recipients with the same
broad trailer scan used by the send path. Then let fix_trailers()
treat the cover's "---" line as a separator even when the cover has no
diff, so new To:/Cc: trailers are inserted before the changelog instead
of being appended below it.

Add a regression test for a rerolled cover whose existing To: trailer is
above "Changes in v2:".

Closes: https://github.com/mricon/b4/issues/78
Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Assisted-by: Codex gpt-5.5
---
 src/b4/__init__.py   |  6 ++++--
 src/b4/ez.py         |  7 ++++---
 src/tests/test_ez.py | 42 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 50 insertions(+), 5 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index d7b41ee..5ad1c39 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -2896,6 +2896,7 @@ class LoreMessage:
     @staticmethod
     def get_body_parts(
         body: str,
+        force_patch_separator: bool = False,
     ) -> Tuple[List[LoreTrailer], str, List[LoreTrailer], str, str]:
         # remove any starting/trailing blank lines
         body = body.replace('\r', '')
@@ -2917,7 +2918,7 @@ class LoreMessage:
         # diff content. Free-form replies should not be split on '---', which
         # may appear as a visual separator unrelated to any patch.
         parts = [body]
-        if DIFF_RE.search(body) or DIFFSTAT_RE.search(body):
+        if force_patch_separator or DIFF_RE.search(body) or DIFFSTAT_RE.search(body):
             parts = re.split(r'^---\s*\n', body, maxsplit=1, flags=re.M)
             if len(parts) == 2:
                 basement = parts[1]
@@ -2972,6 +2973,7 @@ class LoreMessage:
 
     def fix_trailers(
         self,
+        force_patch_separator: bool = False,
         extras: Optional[List[LoreTrailer]] = None,
         copyccs: bool = False,
         addmysob: bool = False,
@@ -2982,7 +2984,7 @@ class LoreMessage:
         config = get_main_config()
 
         bheaders, message, btrailers, basement, signature = LoreMessage.get_body_parts(
-            self.body
+            self.body, force_patch_separator=force_patch_separator
         )
 
         sobtr = LoreTrailer()
diff --git a/src/b4/ez.py b/src/b4/ez.py
index 268d783..3f43176 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -3865,9 +3865,8 @@ def auto_to_cc() -> None:
 
     logger.debug('Getting addresses from cover letter')
     cover, tracking = load_cover(strip_comments=False)
-    parts = b4.LoreMessage.get_body_parts(cover)
     seen = set()
-    for ltr in parts[2]:
+    for ltr in b4.LoreMessage.find_trailers(cover)[0]:
         if not ltr.addr:
             continue
         seen.add(ltr.addr[1])
@@ -3922,7 +3921,9 @@ def auto_to_cc() -> None:
         cmsg.set_payload(cover, charset='utf-8')
         clm = b4.LoreMessage(cmsg)
         fallback_order = str(config.get('send-trailer-order', 'To,Cc,*'))
-        clm.fix_trailers(extras=extras, fallback_order=fallback_order)
+        clm.fix_trailers(
+            force_patch_separator=True, extras=extras, fallback_order=fallback_order
+        )
         logger.info('---')
         logger.info('You can trim/expand this list with: b4 prep --edit-cover')
         store_cover(clm.body, tracking)
diff --git a/src/tests/test_ez.py b/src/tests/test_ez.py
index 192b000..b0b8570 100644
--- a/src/tests/test_ez.py
+++ b/src/tests/test_ez.py
@@ -635,6 +635,48 @@ def test_mixin_cover_keeps_notes_with_midsection_trailer_line() -> None:
     assert body.index('base-commit:') > body.index('diff --git')
 
 
+def test_auto_to_cc_sees_cover_trailers_before_changelog(prepdir: str) -> None:
+    fname = os.path.join(prepdir, 'auto-to-cc.txt')
+    with open(fname, 'w') as fh:
+        fh.write('content\n')
+    ecode, out = b4.git_run_command(None, ['add', fname], logstderr=True)
+    assert ecode == 0, f'git add failed: {out}'
+    ecode, out = b4.git_run_command(
+        None, ['commit', '-m', 'feat: exercise auto-to-cc'], logstderr=True
+    )
+    assert ecode == 0, f'git commit failed: {out}'
+
+    _cover, tracking = b4.ez.load_cover()
+    cover = (
+        'Cover title\n'
+        '\n'
+        'Cover body text.\n'
+        '\n'
+        'To: list@example.com\n'
+        '\n'
+        '---\n'
+        'Changes in v2:\n'
+        '- some change\n'
+        '- Link to v1: https://example.com/r/msgid%40example.com\n'
+    )
+    b4.ez.store_cover(cover, tracking)
+    b4.MAIN_CONFIG.update(
+        {
+            'send-series-to': 'test@example.com',
+            'send-series-cc': 'reviewer@example.com',
+        }
+    )
+
+    b4.ez.auto_to_cc()
+
+    new_cover, _tracking = b4.ez.load_cover()
+    assert new_cover.count('To: test@example.com') == 1
+    assert new_cover.count('Cc: reviewer@example.com') == 1
+    assert new_cover.index('Cc: reviewer@example.com') < new_cover.index(
+        'Changes in v2:'
+    )
+
+
 # A single patch whose commit message body is empty: the payload jumps straight
 # from the (header-borne) subject to the '---' cutline. This is what b4 emits
 # when the author leaves the commit message blank.

---
base-commit: 4217c3e5d3e1eb259626142fd71b91ec6d5e3d1e
change-id: 20260628-prep-2c600976cfe6

Best regards,
--  
Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>

