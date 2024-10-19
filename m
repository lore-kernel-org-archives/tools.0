Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526BE1CC8A3
	for <tools@linux.kernel.org>; Sat, 19 Oct 2024 03:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729309505; cv=none; b=eigr0l016aF94MEX1Pd3LNQiwmPlt45nnjI1IESz4bKVZ0P3O2hUGVDt1nX25Nez6pcKYOufF+So0fT7GobXseFj3btCgdjHR21J4i3S0qryQ3/RI2PCtaOzNRaxdVUq+uleHFtMjPEuGunVixCg24vOF8WVGuJk4GilvL4SLPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729309505; c=relaxed/simple;
	bh=hxmOuVQH60ZLbL2j3RTvuHGprd8QBJyhuHWYx+JXv/o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=PNxirHzMjUXL6m2Iq4fAgoU6B4L0z9zSsTE95ebdembq6h9X9FfYapaeJ+AisxFhMryP66Ccv3ahX5pivZgQltabBGugD+7Bs5UrY9EzJzdJt54akRL5yCC0wCVX3S6j9gxv89t9NrO0u3seORZRNbEyYeKZTeScSWbytO36FzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=ZGkUARn0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="ZGkUARn0"
Received: by smtp.kernel.org (Postfix)
	id 0682BC4CECD; Sat, 19 Oct 2024 03:45:05 +0000 (UTC)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A73D1C4CEC7
	for <tools@kernel.org>; Sat, 19 Oct 2024 03:45:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A73D1C4CEC7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1729309499;
	bh=DM9JNhr3gGCRdj1FM+GfI7N5YAvwAcKvhZSr48JmPwA=;
	h=From:Date:Subject:To:Cc;
	b=ZGkUARn0nDto9WJZhNS+JIGOftXmIDjgZS6LnEbW+x1NVmBzuZ1+EM6jdTh2uMMgU
	 tKPY0ktiQdC/7ocqqpIlf/UjDmaO3UPpbEDLfl9w10gTqzcY6ldaL6H+U1KeJ7VLAd
	 GX+NhZFjNYZ2l0V2hqQDII2qc9u0hdwozfX6GaNGfgxm/G23dyXn/jULB9YVeWvZTd
	 SVLM6hm4/QUwdrvjI00tAvuxEY1GhuQTmZ75c0p9FcrJa6uwqGNLmbFAdOnPg9KlSj
	 f0lYf+cPZr7YtRzNypJZFb5dMPpcYivyVyxMFofS/lUwSuFyoUzf8Thp7AznwxSsx6
	 0g1ufyeOLQfqA==
Received: by codeconstruct.com.au (Postfix, from userid 10001)
	id 008E568435; Sat, 19 Oct 2024 11:44:58 +0800 (AWST)
From: Matt Johnston <matt@codeconstruct.com.au>
Date: Sat, 19 Oct 2024 11:44:47 +0800
Subject: [PATCH b4] Create patches with --default-prefix
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241019-pr-diff-prefix-v1-1-435e6c256e2f@codeconstruct.com.au>
X-B4-Tracking: v=1; b=H4sIAC4rE2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDA0NL3YIi3ZTMtDQgnZqWWaGblGyckpZmaWqWaGSgBNQEEQYbGK2UZKI
 UW1sLAGJNfMVkAAAA
X-Change-ID: 20241019-pr-diff-prefix-bc3dff956a20
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Matt Johnston <matt@codeconstruct.com.au>
X-Mailer: b4 0.15-dev-85e1d
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729309497; l=1115;
 i=matt@codeconstruct.com.au; s=20241018; h=from:subject:message-id;
 bh=hxmOuVQH60ZLbL2j3RTvuHGprd8QBJyhuHWYx+JXv/o=;
 b=12eLBOCVPeSv/Ww6WH2TwjQ6EpUocIBvfOhA9nEd7G3cYwfRT8ACFNbLryWw8J4tvM5Pe2T6b
 SMcnUhF//uhCHmQQu9l+0AjHR7WwkqKzYPpSSkYPgzyJtKcz0hYwnCj
X-Developer-Key: i=matt@codeconstruct.com.au; a=ed25519;
 pk=exersTcCYD/pEBOzXGO6HkLd6kKXRuWxHhj+LXn3DYE=

This matches the behaviour of `git format-patch` to ignore diff.noprefix
config (added in git 2.41.0 [1]). Otherwise b4 generated patches will
be missing the top level a/ b/ prefix when diff.noprefix config is set.

[1] https://github.com/git/git/commit/c169af8f7ab521cc47b59f104db78847e324a3cb

Signed-off-by: Matt Johnston <matt@codeconstruct.com.au>
---
 src/b4/__init__.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 5115a9cd9b8746f84eb104a2be69fe121724167e..7ecff36005149300d8ae716a3d4a7da813a01b51 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -3469,6 +3469,7 @@ def git_range_to_patches(gitdir: Optional[str], start: str, end: str,
                 '--binary',
                 '--patch-with-stat',
                 '--encoding=utf-8',
+                '--default-prefix',
                 commit,
             ],
             decode=False,

---
base-commit: 2a6338e451a0c1e81f214f48c820c1e52d76b2f1
change-id: 20241019-pr-diff-prefix-bc3dff956a20

Best regards,
-- 
Matt Johnston <matt@codeconstruct.com.au>

