Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F4B353347
	for <tools@linux.kernel.org>; Wed, 20 Aug 2025 14:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755701716; cv=none; b=bSijFKqd/u1td2L7iZP0RVPA8f0PRNo3PR3V7chY7vZpMLSpttvvgawxNnvK1wLhIQ+IfF3NZtaaCFbhWhzLLI6YW0vZZJ0f4FdllCu1Z2zNPZBUnqnebp05xGdybkiRvmJeD4rlweujOTFElr+xn95rsxwkdmNq1T2cbzpuEA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755701716; c=relaxed/simple;
	bh=6gbxgP9Hr3ENY8FuOdwQt5nd98oQ+P0t5eqNNf/MTJU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pTNyyAN37q3nBCk1yeHpUStMb3JTyuWUVJ6KSmoDPkpZCarPYOSY11vVl2qRnpv0elEPdAFvDzxsdUAYfKDKfjPGDg4U3V5OENbP+BHdhA3K0WI+qSbra/SBqdSWrFBBfPdqVQTBGZMphJ5nLFbFZjy9yPq4hINViVHMxqRKhwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ixBjOFwn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ixBjOFwn"
Received: by smtp.kernel.org (Postfix)
	id 1527EC113CF; Wed, 20 Aug 2025 14:55:15 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 218A5C116C6
	for <tools@kernel.org>; Wed, 20 Aug 2025 14:55:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 218A5C116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-afcb6856dfbso189953566b.1
        for <tools@kernel.org>; Wed, 20 Aug 2025 07:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755701712; x=1756306512; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o/6OcLuhfBjUTxTiD3b4U+TUCmlzoscdFGyUDk5fGW8=;
        b=ixBjOFwn1lo8T8DCX7fTi9DEpnfZO2DGJwQaergAfEORlzPLyfylVnI9FmMmBN2Oc4
         dFMaE4SpTkowXr5wFPaQEiDmpzLLrLZJ5+9HNJ6WhbmozcSTFzc1QcVz0W/MNb/hr0cm
         BYW47TXepEgsU6rBzHMcNyWKuSBRBKUEnbbvcbwVvtolHz4UL+IqovCnch6zB5THiM+w
         EHluDzeqddJt39vTl6InMIGpAIzFiix03cRg8V8FVUVxpyU5iP8BulZXPB5Hl6rDOu3H
         ar1Rv7f6eINLiR1FAOMNmtdAaCUgBpVFRiRgfsimd067z0oa+2dI8PIQKRm3zENT0rbn
         18JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755701712; x=1756306512;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o/6OcLuhfBjUTxTiD3b4U+TUCmlzoscdFGyUDk5fGW8=;
        b=O0abYNq06lYhTJnogdKwYOebxWJsu4TuoTlLRTemS/aEnYl/HL3HSbFR4YMo8fZ6+S
         XYcFXwQzVcPFO5++ryyMslQCQZuUL/nxJlK4cCYIpw4AlBjKD6FlgRaboyyz+OGrPNEn
         nXzxIHmkg7f9FdtxDOBn1bDb6dJKalIBhlaaXMA8uQPdHftom7ThPCINn7D7DTlzDUcL
         +iJDjCK9pPApkEItZrAkCXBuUr5QxTn4rV/Uqwy0tpTQoP3MAMlFc4la3uSchZZp5+6y
         8ixgB2T5sKaickWGheOMf8wt0uTO6OgfOPxr2x5gv+GmFj0fjPHPl4aJi+CtTtt52pWd
         t6jw==
X-Gm-Message-State: AOJu0YwpdZ7UEsVtx0OduoeSf8ak/4Ctjot12ceIUThogSJQlXt4/4mK
	ZKU5DJmp8x48Sgty2amr9ftdBbsCyOjvKrHwRiU48ZieGaj/TGD+Xko3N3Gd4mpLmkc=
X-Gm-Gg: ASbGncvVSmNw0nrNboHpxh/aycyrn+FmIWM+WgApuLwkeYUPJjEF/8kwm3XqvfVM/WT
	DFQDugMi61JToEbJ95jzOZ7y4h64wJxsEmOu91mTcXPS56hiGYHjmHC8+O/m4a/jGgbohWgTAGm
	F8Yg/+62j/zV4G7/0RndfWfHbg2A9KEXW/YbuAPbdQXMxxf31yxGFssDwErEe06ixd+w3YN5JJA
	le4+anLjn7Cg0wSSEpmomQ9INyyN+piev10lnhUHgqd75EeCt/hJp7Y90pjd3hT1qE7JReOhWCS
	vKZLETnfuxr4Vyf2zcM8A6WmZbGL65NGQ4YVjjoGkWJeMV52tK9egFVfHmuOJgHJuvYXcQ8V2Yh
	6W8BxpFD8ZyNqBfe7TnHkLMHCoDnyADjUx1ShFDOB8LQPhmVUGlW9HNjRQaXfdNKGISLu
X-Google-Smtp-Source: AGHT+IGdns8E7VvAn+peon44B3lZjhNqHrBMJQG4aCZDj6f0iinb5zpuD0KRKGprZwRhz8d/abGRHw==
X-Received: by 2002:a17:907:9807:b0:ad8:91e4:a931 with SMTP id a640c23a62f3a-afdee5177acmr324260866b.26.1755701711268;
        Wed, 20 Aug 2025 07:55:11 -0700 (PDT)
Received: from [127.0.1.1] (athedsl-4441256.home.otenet.gr. [79.129.180.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded3070dbsm187606866b.46.2025.08.20.07.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 07:55:11 -0700 (PDT)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Wed, 20 Aug 2025 17:55:03 +0300
Subject: [PATCH b4 1/3] Add LoreTrailer.is_code_review property
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-auto-unreviewed-v1-1-b0af9cac4b4d@linaro.org>
References: <20250820-auto-unreviewed-v1-0-b0af9cac4b4d@linaro.org>
In-Reply-To: <20250820-auto-unreviewed-v1-0-b0af9cac4b4d@linaro.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
X-Mailer: b4 0.15-dev-b423f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1316;
 i=manos.pitsidianakis@linaro.org; h=from:subject:message-id;
 bh=6gbxgP9Hr3ENY8FuOdwQt5nd98oQ+P0t5eqNNf/MTJU=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FLQVhjcHgzQi9mZ
 25RQWNzbVlnQm9wZUhOeGxVZDZyOTJySFVvNjNvV2lRY0U3SnVxCk8yWmxFSkdhRXRUWTF6RjBy
 YnlKQWpNRUFBRUtBQjBXSVFUTVhCdE9SS0JXODRkd0hSQjNLY2R3ZjM0SjBBVUMKYUtYaHpRQUt
 DUkIzS2Nkd2YzNEowR0xsRC85QzdvY0FmMEljS1VONGd4a1ZqMmpiSXJsVlIybkFRb3hBcHltSw
 pJMElXcHdtR2JYL0hFMlpyWGlpcjNSZmoyb3RLbHBLNmJhUGY3TXF2WWRHS2RNd1pUQS9Vb3Zoe
 FlXZkJ5SVVZCkQrVDM2MXF2RVFVQlRTRTV6bmtkTWVXWUtaK2NlLzlWU2Y1V2QzYm1CWE9ueHZo
 TGJXbmZ1MzZUS2xzYkJ0amwKRExRd0tScGdpT29QQ3dxd0k2QmZsOXdxQlZ3RUt2M1ZsalB5Wit
 KM2lpU2NOYlFwKzN3NG5aeW5maERyQU9zMgpjbk9YMTNwZk1haDdtamU0a1pHSlorRHQ0Tmljc1
 ZPVmRweCtFUk9LdkR1eHNoc3A3RTdjYWRiaXRpc0M2M1ZKCjBkSjNXdDkySGc3SSt3YjZpZ2ZkT
 UFxV1ZTWW5wZUJxZHV4MGdsblZOSzE1TGlEQk4zWWRoOGZlU1RPOFc5MmEKdndZTHE2Y1phbUtV
 YThQK1YrWnJrZHBpYzE1a2VZNUFqUjZTeTFpRkFJa2dkUjZRbW1vUVVkWEZPdjZVUVBsMwpqRXc
 yMmU2aG82UlRtemVwZ1BzdE90eUFLM3NLUHVoZWU2OWMrbzF3TFB0Wjk2bnBVRUtKMmNqQThRdH
 doNllvCmJIUW9aSERGKzcxOTJLdjFTU1Z4M0g0VXFCUDJTd1gzTkFldER5NHdJRGFBeHJVTnNRQ
 nZUbEQrSHJuTG12V24KK1VLLzRFb3pPODlJQ0k3SzZGaGZSS1VRSlR0VFVtVlQvSTZhaXhBTGR5
 Tzh6WDdacUI2VjlKV1ZwUy9zWGJ4NQpmZmVKcWlJMEYvWklIUzErcjJJSWI3RVI5S3FMbGZDRlN
 jYzFnd3RZL253S0VtUXFtYUNsN1A1L05yL0JDSDllCldjczNBdz09Cj1ZRmhnCi0tLS0tRU5EIF
 BHUCBNRVNTQUdFLS0tLS0K
X-Developer-Key: i=manos.pitsidianakis@linaro.org; a=openpgp;
 fpr=7C721DF9DB3CC7182311C0BF68BC211D47B421E1

Add helper to check if trailer is a code review tag.

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 src/b4/__init__.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index dd5eaf9..578356b 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -1058,6 +1058,8 @@ class LoreTrailer:
     # Small list of recognized utility trailers
     _utility: Set[str] = {'fixes', 'link', 'buglink', 'closes', 'obsoleted-by', 'message-id', 'change-id',
                           'base-commit', 'based-on'}
+    # Small list of recognized code review trailers
+    _code_review: Set[str] = {"reviewed-by", "acked-by"}
 
     def __init__(self, name: Optional[str] = None, value: Optional[str] = None, extinfo: Optional[str] = None,
                  msg: Optional[EmailMessage] = None):
@@ -1113,6 +1115,11 @@ class LoreTrailer:
             return '(origin unknown)'
         return self.lmsg.msgid
 
+    @property
+    def is_code_review(self) -> bool:
+        """Returns True if trailer is a known code review trailer."""
+        return self.lname in self._code_review
+
     def email_eq(self, cmp_email: str, fuzzy: bool = True) -> bool:
         if not self.addr:
             return False

-- 
2.47.2

