Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C47323D
	for <tools@linux.kernel.org>; Fri,  6 Jun 2025 19:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749239480; cv=none; b=pkpjChZShHpNRAWbTupCK0IR3E4Wr407VpH9mp/9paFhWxYKsTyySyG9iBWceYwUK/mMku+JhNeKhJdX88OzEQnJECnEacZVOl9PtlVdeu9Ku1axJev2vMM8zpNK1wuMxlxmjlRh8ZBZGZDN1Jf7oNSiTyDEXIqx9/JEqQCeJBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749239480; c=relaxed/simple;
	bh=WTlpzNYLMoUkeAVFKesr85u8nOkKX1GS24eEANmlSZQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QnUi+b/tfcWrrT8SE96sBi1rYJAxOGbYkBtshBiqPWi0Nxy2Cu3kBrv1Bjh7KJ1gkHv6J3VoCSh5kHKuQ08VaObxoOOaaqI0mrPzPrYFOmWl+ZT4l2dIxh7Mwwy1G5IbYnf2hQKzuEvmQfWKciHxfbM0aM5qaYdlMRHUOa9AJEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TvEfuWYg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TvEfuWYg"
Received: by smtp.kernel.org (Postfix)
	id 17E15C4CEF7; Fri,  6 Jun 2025 19:51:20 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 40A6AC4CEEB
	for <tools@kernel.org>; Fri,  6 Jun 2025 19:51:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 40A6AC4CEEB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4a43d2d5569so30530221cf.0
        for <tools@kernel.org>; Fri, 06 Jun 2025 12:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749239478; x=1749844278; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PmekmMqQFUEil4y8MZaLXXQO+uZj2SyQDQI29ud/G2A=;
        b=TvEfuWYgXO39umdsuWvG+NURk740TIBvV+cfpVnwiQTSoDcCnrGPgJ3iWOPDuLGsC8
         8W7JdchjF9PFdlDkdQnvt6rAykK9NAPW3ZNclBbuffTAbaZyeNX8NfAetBK3U1y1qHzg
         yMHD6fr7X2biJNj8RGWvjykticHL5xhf3bB6XgHoVF0BkAmIQKvvegHyu/2MhKUrWuhB
         /2Xj6FxAdTMJK3UPvBImyiSi2mJmNqP/6zYmXcHd8+SZ68LQ179E+u0anDYRfYJEbHhP
         gWD74RKg8yolncZLjJBbIAUCtqLY/kAv0DWrV673OMqaSl67pbyJ/yzp1H6Th7fjWG/T
         R9Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749239478; x=1749844278;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PmekmMqQFUEil4y8MZaLXXQO+uZj2SyQDQI29ud/G2A=;
        b=LRtjzeguyNp2Wtg1BOfYLALcVpGOWxdfwt/2MdLmpneSfCbehRFSTypwm8a5KIeLkR
         D8xvbpNuzwVFOwfAzpt4h2bv6wGfazS84JmvvrKhakey+mB0iYlIdDioAti76+D6Fdoe
         /5FRVSb6fMofMd4hR3Rg5AyM5DyWjOSTgGMTFEg6QgbyrtpI9ZT376foklbNMt8EJ0xM
         IUvC/SV4ypkA0K/19uT5sagUB7V4QqJPT/tRLsftLtSe6t2XSo8SSwp6l4wfmqkQ1z/l
         ecZdYvA2l5JRNefRPzbe1ikux6tHOSyUPhjHQskAnRuQhF+HFhtw3VYiVDdoj3gXWrwO
         ggpA==
X-Gm-Message-State: AOJu0Yy8Hi1jj00lW8+4La8YeKOUsZc72QCJcpFG+cjUMR4j6YThDtkN
	dQJP2zeIN2Sv1DemHuEfFW1cFcyzJcKBtkJTZ5Jsi1FjK8fp5TBr7YgQsShceYi2
X-Gm-Gg: ASbGncs+D0IMrnf1Fcx+Mgx50CJDAO1qrBSqRkYMstZ3pvc74NDjERsjOhIUBHSQA8G
	njpoPDV4/QQh9d838lgkJ4T2e+Bh5JqgOPQmqVAqk1nDfaQ7pkNgKYSVieYlj6k89X2eQSqL3Go
	qWVz/Bo1KwRIKDZounjb3DIP8P5km2hUZJPfyC3otKCOIyLEpKM8sliWUyRtyE41oCyDyj4oGGm
	hkUkN1+j5qpNSpLJs2jqXpEEli9gzDee8Xuq3giOUrM9x8IQF7IgOgAcVKRmbFsNE+QNz+6WYxC
	PAtacCKoaldUoE7DZqbDYBeO+mLHEBOCXL4/CIA9Od8CvRBFl0B0i7huGj0z0mcc5CT/t+2BgA=
	=
X-Google-Smtp-Source: AGHT+IE701BYZJetwXorw1yKfcLwwvxL748GUiWZ0hN5FI7Rs0+kzkcQDRv6KSlWSAJVoR9s2t5wXg==
X-Received: by 2002:a05:622a:4006:b0:4a5:8eef:f891 with SMTP id d75a77b69052e-4a5b9d9397bmr80197291cf.39.1749239478003;
        Fri, 06 Jun 2025 12:51:18 -0700 (PDT)
Received: from tamird-mac.local ([2600:4041:5be7:7c00:d553:69f3:49b:5c70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a619895298sm17718521cf.81.2025.06.06.12.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 12:51:17 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 06 Jun 2025 15:51:12 -0400
Subject: [PATCH b4 01/10] Use PEP-735 dependency groups
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250606-uv-compat-v1-1-c76c1c8d6eeb@gmail.com>
References: <20250606-uv-compat-v1-0-c76c1c8d6eeb@gmail.com>
In-Reply-To: <20250606-uv-compat-v1-0-c76c1c8d6eeb@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 pyproject.toml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/pyproject.toml b/pyproject.toml
index 58f7be2..658c704 100644
--- a/pyproject.toml
+++ b/pyproject.toml
@@ -24,11 +24,13 @@ classifiers = [
 ]
 dynamic = ["dependencies"]
 
-[project.optional-dependencies]
+[dependency-groups]
 dev = [
     "pytest",
     "types-requests",
 ]
+
+[project.optional-dependencies]
 shtab = [
     "shtab",
 ]

-- 
2.49.0

