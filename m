Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795636703;
	b=pwpRl9goBGEYoYILByixjXIvEtEC9id7n9DY5JMMjUps3tfYt/jsHulr+QoyNMgs/Gp0
	 fDPwfJyFLt9J80mYhqkEqlPj+NF3s+E8kEPtTNUaSxbK3hXqIHwkswqN3yaKXTmPmgBU3
	 v1ExI2sVxAzy8cxd0qTb3u3unroLoh1mMwQoyFvycgi15AzMqhxXd8VZ9iDgtqs1jyO/q
	 ZcFMQrD56iFaYSug7VCaVjOPVp3/AeSO/st3l1FxSC1P7/1Nt7QZfuR5/2C2KO5TEfcsF
	 H8Cn683wlbDtr64qSrLcH1iPxGgVCVOukwqKlV0K4tedAz7eYDbN6+LeE0THQmLXvTQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795636703;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:X-ICL-RepId:
	 Dkim-Signature:mail-alias-created-date:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Info-Out:X-JNJ;
	bh=HWRRqWGa4GUVZKDUtGacysEMlKFNzFfMvMZPLFl7FeA=;
	b=UuceBhRDjGFnofgEBDI0dLQ75a+dzfTYMDAiRcrV4r1ArzZLuiFNKHQ0sdG/VKW6maSU
	 mpVPXjpZqFVZitDpvnP2kfgFNiIH1KAOjJw74Wu4z8IyhGDPzCCXOckn2+BsOwia05yv4
	 oUS/+3RFMn2xW7igVJqIkjx9P15b0wXXo51iiVu+dvTX7h1SFAKOA2E6fijLlzfWOHniV
	 y8GIxQMell1dfgcK0MKZ510QnBHNNvZZPyxSaEyZCmcWY8mte6NPx3Za5Ue0oFMYI84DS
	 ke33CjDWuBp+GJ/YWU1fPRZcK1EMOjcplatrh+euEIN2ipHypJFJjmHYwvUyklEQunw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=shuye.dev header.i=@shuye.dev header.a=rsa-sha256 header.s=sig1 header.b=b0Pb8zra;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACB5606A31E
	for <tools@linux.kernel.org>; Wed, 25 Nov 2026 19:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=shuye.dev header.i=@shuye.dev header.a=rsa-sha256 header.s=sig1 header.b=b0Pb8zra
Received: by smtp.kernel.org (Postfix)
	id 4B4BE1F000CF; Wed, 25 Nov 2026 19:58:23 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=57.103.67.102
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795636703;
	b=0gXrWueka8MeA/Jbt5U5kDugrielnuI/Krfj9msKbYyLl7IDJitLPGxDZooAsL8tlUGk
	 uq2ztraVvqkzhRDRCxntCxnHB4RpDx1JSBteFARswNSAV64NOFe8XsB62Y3CoG+R4JzA9
	 GJYHsQCfade+1MBKZxVwfNSoV9zGPjKYQNX93YXRMpHbmL7YbHN25LJojWkdhaIK49Wad
	 1lfCJ42GARuOydMwWn1sPaFKnnGRrNYht2VCH9kDDez2prV8wNdgoI77sHA9CnO6eycz9
	 H16adVQT6iw96TiBM1ZVbEJOv5o0WzmsNUfm0VU3lXXqJ9BYUYo9fo5z6Y0R9FsulFw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795636703;
	h=DMARC-Filter:Received:X-ICL-RepId:Dkim-Signature:
	 mail-alias-created-date:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Info-Out:X-JNJ;
	bh=HWRRqWGa4GUVZKDUtGacysEMlKFNzFfMvMZPLFl7FeA=;
	b=PRMipCkoCRWxS399cBMfNUIhv+U98cCVNGMhylTvIrwbnCTqO7DgdqQoLBTSXNJwdQf+
	 TlBnP0m+pZIDq7VSBKM2yLDOX54/mm4nXh76RGOK0LSkwQA7DspW24netwnDJwVcfXXNT
	 gzZCPF+02V7c6tT40d6RjMGARLIgfUUuM2VDvkiK8Ax5v1MGlDqh3qBbrhduWGaa25F00
	 +ujIlqyuOeIlejH+oiugoOBWJMgYpiwLYPBKO/Ez6TC1x0KS9J6dZ+MLtVgXWfLI3r4fT
	 ijccjsRr7VcoYyo2ElNxexENpzLoyu9nnJT7E0TD+OIw7pUDgnaO22AyIVcEasmgVlg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=shuye.dev header.i=@shuye.dev header.a=rsa-sha256 header.s=sig1 header.b=b0Pb8zra;
	dmarc=pass header.from=shuye.dev;
	spf=pass smtp.mailfrom=shuye.dev;
	arc=none smtp.remote-ip=57.103.67.102
Received: from outbound.pv.icloud.com (pv-2006j-snip4-10.eps.apple.com [57.103.67.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 693A01F000C4
	for <tools@kernel.org>; Wed, 25 Nov 2026 19:58:19 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=shuye.dev header.i=@shuye.dev header.a=rsa-sha256 header.s=sig1 header.b=b0Pb8zra
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 693A01F000C4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=shuye.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=shuye.dev
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-7 (Postfix) with ESMTPS id DBFDF1800159;
	Wed, 25 Nov 2026 19:58:15 +0000 (UTC)
X-ICL-RepId: 01a21449-92a1-79bd-9a98-bfd6410f4242
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shuye.dev; s=sig1; t=1795636698; x=1827172698; bh=HWRRqWGa4GUVZKDUtGacysEMlKFNzFfMvMZPLFl7FeA=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=b0Pb8zraPYPGqr8NRLVmJXT20kvbbbXqBacDiomcRV9qBGHhvUKiUgQIOuO7uU33aSGF+K0BlZzjV68W5dvUV12KpzUoNk/mL7iBx00GQTYU9EN7+JVGKM2uEK0jltI249LZxZ69NzElooN6WXwk6Z4LYEQaWRXImw+9kfN1DY01I8Z6DXYwSMmENZWGEehD3BuL9pTOL/ziEO8q3ujbLTCg1Vti0lz8xq/mnS/vGGygGw1w/voas6YB7FPWeiHU3KeCg9iG9jdj3Er/TLLzICMEn/XJPYUXvfHmq2CeRZSfWDjp8pwVLTaemYI4e2FKByRcKJhbgMpwPGhzcwlJRA==
mail-alias-created-date: 1658105457252
Received: from shuye.dev (unknown [17.156.192.29])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-7 (Postfix) with ESMTPSA id B674D1800107;
	Wed, 25 Nov 2026 19:58:14 +0000 (UTC)
From: Ye Shu <hello@shuye.dev>
Date: Wed, 25 Nov 2026 11:57:59 -0800
Subject: [PATCH b4] send: support sendemail.smtpDomain in gitconfig
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-smtp-domain-v1-1-9002c1f3ef21@shuye.dev>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MTQqAIBBA4avIrBN00P6uEi2spppFJhoRSHdPW
 n6L9zIkikwJepEh0s2JT1+gKwHz7vxGkpdiQIW11mhlOq4gl/Nw7GXXTJ3FVhmrEEoRIq38/Lc
 BJgPj+34fgJ4fYQAAAA==
X-Change-ID: 20261125-smtp-domain-97b952804502
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2961; i=hello@shuye.dev;
 h=from:subject:message-id; bh=v0jolYBVIO1Oyym7NbCV4mOM6iThlNAf8XcSHfX2Nfw=;
 b=owEBbQKS/ZANAwAKAWrdZni68N7qAcsmYgBrBz3Vlck5Pc5NXtCg6M1kTpsYoZVmPnsHs4OC5
 razOmvOepqJAjMEAAEKAB0WIQTaiAWzOwE7Z7uq/ZNq3WZ4uvDe6gUCawc91QAKCRBq3WZ4uvDe
 6kyID/9aAsXPc4Yta0lnbCdj9tQPTAGns6qQAUqet6viEomA0R9p8H31xvhTYgAvvhpTuKQDY6f
 BXE1IsgGTdXmhD71L8/13L2WplZcKdwjoa3E4ElKSIhLtXpODJSdGnGKzlsGpksPK5C5fP2nVKG
 T0u0djT3gcwW4st071XGa2IQSvmkajJybfM2SLlUfqi+rVWWBZ3CLsfBadujFjU0QDykJDMjcPS
 T+J0etlE66nOP89G8lq5h2ttXh05wR4un1+eb4R9pWL0BfUehjVZD+68bC+nsAD6N/42wPcvUUc
 PYkxGZTG0/kklmNvEgz+cxjWIJA/EVedyvRkxyN/RVaqKq7aErmviwWPHvIQZP2gMJNFHWE+nwm
 OpgwQRZWy8AA4v/MvjbeQ0Jx9dADEDgil415NcV/Omg6We0LqCBkyTOxbbrHMu+/UMA2TUCDGTX
 Qx+Y7Sz9jNeKZsfVyZYHQGY8A0tb1bG4KF1uKW4rvXPlH3GrkthJfJ7SPgRNWzqxesi/i4P2wwv
 AhEp0o+mc96Y5ak8j1Vlun9c00V9GlFr9MoKfdkOzI4ps6426hCM3S+y4Dbrzi83akeNt/Tt2o0
 Y3K4BvO755fNT1jcbyhFtts9+40vkg628GoSEEgTDMQ18v9GKnG88W1q7TQISDU2X3C+c+nHbw9
 Dzr5XHREot5N7bA==
X-Developer-Key: i=hello@shuye.dev; a=openpgp;
 fpr=F021058172993F4D228EDB6972FF4E8B377057DE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA3OSBTYWx0ZWRfX/o+ijGfCMQHv
 fNFbtKGkq6pe1ckB0sjgIpiKuoo2ScZLuRq9rO0pbk8y1RteQZA03fP0aJoRajiyAsXTfugZO7f
 bRios+jmThBHhSEH1CEe54UVUUqhcoQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA3OSBTYWx0ZWRfX6sjyaqb+qHXx
 GkSEyYBd+0ZAXyk16gUh3E5Zhfc1ewuRYmMTRbUOr9JREtChKL4YbZMPxYZ2+lCPxb/mcZ1btgl
 0IXNW3LqYtT6GdVt66Dlj61Mi+Forr3n0+JF4qQePueLKfN8Gbj6hafYC3lV0GH03a21/aGvUur
 /NvM3YMDo5IjajKXfzlFaQ+WMK3fd+AFRIFa0Pa9iV58g+QcAJLemzi/h1rthVtnTWJMlbOpfwg
 UK7jMwdXhIjIpP7bs+TNEsyjZDovZLZgQv+jVuNMPz4zK2cyH8KvK44+BFJWgz9nMc5oC4dcMBN
 ZxF7U+jzq1T2CDnsi43ri8bNl+bBWXa1bWTs0OebI3GBiSauzJfKS4AjepyaZg=
X-Proofpoint-GUID: BrROMNXhgkG4xqlUzyzpnkX552XSeBdz
X-Proofpoint-ORIG-GUID: BrROMNXhgkG4xqlUzyzpnkX552XSeBdz
X-Authority-Info-Out: v=2.4 cv=KOvPn1Fo c=1 sm=1 tr=0 ts=6b073dd8
 cx=c_apl:c_pps:t_out a=aW9mcIavGNWWFvFFKOxBSA==:117
 a=aW9mcIavGNWWFvFFKOxBSA==:17 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kibvr5HLtuNvmma_iept:22 a=th0q2FIQvm5gKUiVmdG8:22
 a=anyJmfQTAAAA:8 a=QIhr-27iAAAA:8 a=u2y7GZ_IqAphloqISUYA:9 a=QEXdDO2ut3YA:10
 a=cgaYBWEFosGJW4rWv5Lf:22
X-JNJ: AAAAAAABkwGdSF8GlS7mCRiSyqAgNCeNRkYipkN86Es1WqVuSnG8QHsw65hNB+zWhNJy3j
 NcXhafZvd/0Lwte6dEQsAWSug3kstmxez9C2/nz/fayMCePQN8pjWjRppNcL8gTLAaROfB
 gHQyQV1WvaZv5nfoom4XgyBZps5mRqaOrnWq7L5fLC/etQm3PSp9v4JWp7iCU0WMVXjfEN
 CKoeoHzY+Ok1uIGG+5yoH62ENBWoAKDbaCSVI6dJG+WJM2DsShqS4iDvDQ7IHMjNMNLZbj
 49gMVmGG9gNVu0ucl1B9BW4w5dMNV0tzuVWt6RHCvpgB9vOB+5Apc/il+k0UQc0Dy/dJVt
 GzgFBqVoMLOW4/BxWPSqEuU09QjfoXbJC036zsze3WLShLbm1X1tHWluLiqLYpKsyuOO33
 OzIwKg9n4Imyk1d1inAaOUl73Zkk/5w0R/48yEWaeqX8gilxBaqQ19KsS+wd9mm5PdGsd1
 vYL4UU98WC7MyIGwPolq6r8dAYZkBCBxJz98ulXZsWq5XPvst9Bp4mH76D0tywY1KdI3TI
 uqc5qNXX44HjMKPp18sslRaWrHPnD9HVWHlYNTPVcvRL38w9KNHjBuRlcHscndJMTejZhU
 nDwfP54GbrBTfHXilcdAy5ROTvWt6EcBrnkhR/N94Cr0/itA8kF1yUN7qIA2bkPl7qntYl
 o7j+yUfkciiPn8mtW1OztX9/HaKDo+P45NgcUCggbVbFJOjGwYA+iHj96pBzB+8dpOzLxb
 PLkFFlPqq4PbgvAH5P6gP90ARol4HCEZZgItyWnl48K5fdJmv+41eOkn78cLqCsucPFtDU
 4ugHnmiNGd49mRwA+0m1gPQfGHIctAr1ckI2EeRp7YBAZUyPTx+8w+5NNyNdGAR84sC73H
 I3TDVTjHYcoCGhJBcLoH2RjoYleAu25XINx59rwTs4Pw0jEc7O1R6tj4dMcLI5rsn6anHN
 Q3vQ28OuY4oM1iSkKke1I+6mZiFnATxx+93NCGojRrJjhtvdUcH2eLgygufMFKv0KysrIi
 CLDQZjaP/BLAEgVYibJwkNeSq4f8U+iALSTpzaZJRHB7raWmQjrDuleXql6tqEEY/ijq2D
 x57qpoV7kSmM0hPpZvJfpqxDNuWxW+QpDKmEd+b4hEa8s9iyf1rLb9fLhfC+hEg5Q1m//G
 Rsj5NgdaZJ7faOAAljTKDjTjk=

When using own SMTP server, b4 does not set, and let smtplib derive the
local HELO/EHLO domain. Its default behavior often results in internal
FQDNs and IP addresses exposed and saved on the mailing list archive.

git-send-email provides the sendemail.smtpDomain configuration option to
override the HELO/EHLO domain, which b4 currently does not recognize.

Support sendemail.smtpDomain by passing its value to smtplib, allowing
users to control their SMTP HELO/EHLO domain without relying on an
external SMTP client, while preserving the existing behavior when the
option is unset.

Tested preview submission through SMTP with sendemail.smtpDomain
configured and confirmed that the configured domain appears in the
Received header.

Link: https://git-scm.com/docs/git-send-email
Signed-off-by: Ye Shu <hello@shuye.dev>
---
 src/b4/__init__.py         |  3 +++
 src/tests/test___init__.py | 24 ++++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 558d1c2..e32a65b 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -6457,6 +6457,9 @@ def get_smtp(
     smtpargs: Dict[str, Any] = dict()
     if timeout > 0:
         smtpargs['timeout'] = timeout
+    smtpdomain = sconfig.get('smtpdomain')
+    if smtpdomain:
+        smtpargs['local_hostname'] = str(smtpdomain)
 
     encryption = sconfig.get('smtpencryption')
     if dryrun:
diff --git a/src/tests/test___init__.py b/src/tests/test___init__.py
index d0cd818..b9365c9 100644
--- a/src/tests/test___init__.py
+++ b/src/tests/test___init__.py
@@ -2553,6 +2553,30 @@ class TestSignBeforeConnect:
     ) -> None:
         assert self._capture_timeout(monkeypatch, timeout_cfg) == expected
 
+    def test_smtp_domain(self, monkeypatch: pytest.MonkeyPatch) -> None:
+        monkeypatch.setattr(
+            b4,
+            'SENDEMAIL_CONFIG',
+            {
+                'smtpserver': 'smtp.example.org',
+                'smtpserverport': '465',
+                'smtpdomain': 'outbound.example.org',
+                'smtpencryption': 'ssl',
+                'smtpauth': 'none',
+                'from': 'alice@example.org',
+            },
+        )
+        monkeypatch.setattr(b4, 'get_main_config', dict)
+
+        def _fake_ssl(host: str, port: int, **kwargs: Any) -> _FakeSMTP:
+            assert kwargs.get('local_hostname') == 'outbound.example.org'
+            return _FakeSMTP(list())
+
+        monkeypatch.setattr(smtplib, 'SMTP_SSL', _fake_ssl)
+        smtp, _ = b4.get_smtp()
+        assert isinstance(smtp, b4.SMTPConnector)
+        smtp()
+
     def test_bad_timeout_is_rejected(self, monkeypatch: pytest.MonkeyPatch) -> None:
         monkeypatch.setattr(
             b4,

---
base-commit: da10773a4d9ae608ab072f265e15876b65dcd680
change-id: 20261125-smtp-domain-97b952804502

Best regards,
--  
Ye Shu <hello@shuye.dev>

