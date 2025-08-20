Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CFF320CBA
	for <tools@linux.kernel.org>; Wed, 20 Aug 2025 14:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755701719; cv=none; b=X0qW7FW8OwtGAooZhKEDCg9Cqye9s2L8dK1cdwjZJ1C2WD3qAcF96x6iG/pPuGWcycSpclfV9jFx749vDCgLugL/2ydDnd6JL8dWEUZPjvOK9W/TdlwsG7xLSCHsMXsG47fuS2p3Oxn/UioNehDvxSw1BaXZMlCT0ptNhANIm1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755701719; c=relaxed/simple;
	bh=XkFoMEFev3Z2MyjyHgzWfc0mIlwNn6MTvv6E+uCrlQ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dZky/JxoHb8UuRQWUD6UIoe5i4tIcdANvF92zMz9v1COIwEzmjT1QXQIpgyCiC+wnxeRu9bcR7xL5uid8N/FkxftLp1NGwxcCwkmqSiwkD921PqQwgWyjiu3FbKVefCT6EJf4dPb00KMK64UxRDUhOFl+gFffu6jB6hOeLfxN9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G9oRD3ls; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G9oRD3ls"
Received: by smtp.kernel.org (Postfix)
	id 8CECDC4CEE7; Wed, 20 Aug 2025 14:55:17 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 99485C116C6
	for <tools@kernel.org>; Wed, 20 Aug 2025 14:55:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 99485C116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-afcb7acfde3so954137166b.3
        for <tools@kernel.org>; Wed, 20 Aug 2025 07:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755701714; x=1756306514; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=goCm9hKxSWFSUPZQNPWLBt44GcwikM878BdTmM9u7Lo=;
        b=G9oRD3lsFUHoup4lUP0mBWY4T/pAvA0I8YsyMqdyrIPNDJFjDWz/vao9nqqSA07DgX
         1YTe3/+x9DOd9Qh7Zz7VuqQ8td+PQgOGq7zuTJGTh3CAEHUm6w/8SOfLjy1dmgMM+jiR
         Qt/9PYtV4H7yV8dFOfDDPAuRXPNQo2mCI63vwBbweCF0evG5G7cXUQiWls8XQCAQu3aQ
         lIev4MCrm0aPo3Dt2No023dEOAVLbox0p7CFmF89UC+YvBHK/b3gGWgLBKxcv2I3w85b
         kK+OsOV8rqM6uPgXod6haRYmGssz/DdvdgnrREa0nRcL2KQiJzx9hMOB9seAgJuL1Krw
         BsRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755701714; x=1756306514;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=goCm9hKxSWFSUPZQNPWLBt44GcwikM878BdTmM9u7Lo=;
        b=uKknr4CG3UySJPjOOO1lCXzq8pLXdWFeLzn+dBEoP2EXFBZhBC13ksBCz8EBS2qjo2
         8p+3y97aYkMmjBer/a16De3TGy7Z2xQweuNDsFHTW1VKivymehnFc5GESWNSye6bACMP
         NE7YQCaxIEGM46hOpEVgqhOwLJFzshIyi0v3VDio195lg9R3ac5q7WL6ajnGTLUkeV0V
         Qkk4CiTWYt/pXHnS5DTsMjoX/HGs5bGm58fvbg0tZKh0NeXRNGZcLgRUxwG/uH/lAIzW
         M/EJ26+dABVUVCpMO7vz4VanKFKEv5oOLiRWj/P5D0qq7ZKJxGwo6BKkfJOm9GkZH3A/
         eCCw==
X-Gm-Message-State: AOJu0YwxlkY2IMvGuKFadO2OHstvrL+tHUFUEHUDtXmC/b1QcVlhpEtv
	nKPqh8epneyyeWpaLHhRVqVtgkeY5G5e6d2WDtj5D55V2IKPQvIXvgXGe+9Fup4q8wa113t3x5c
	1s5is7iA=
X-Gm-Gg: ASbGncsLM73zt+ZAlgev+BljnegKvW717JgDA8ZTaUSJR0QhcrxwVqJGysyO8/JQ0Cs
	F9Hx5rgVVBVr5gPZGiQ8YAvajhkB0IKWo7GiPcNpdSDNZKM/nDSlu6L6e5YNEnk38kclE6WZo8E
	bqPkFLjni1iNkSnNH4prh6TnDx/RhyWRu4IFrsbTOgcWhKr7ybPF10ybl5Ux0nRdGirFY14ny50
	Ly3k85dwNsGmZsfJkaKNuWncs7JockxtMxL3XD9zqiREQWZL2BuxQPMI42kmDJhBOV/E6AQwd8n
	h76gXItPuqMheZ6N+sF5mPK9axmHR8hK7/11Yu18DxjR70bqdb7Db7m/2+mLRtJqZN0aAfCNozp
	BlpoBuKjedbfolhbTP4Dr2kmq+mNRNG3i7W+fRN3J7L17CVuZ5Q26DwTKONpThd1h98XU
X-Google-Smtp-Source: AGHT+IGpTa6ROfhUGBeHPqjuHa6iNvdFj2kpd9iL9G+TW+D4pIa9NeEYYfAJqpaN6Qpuy6eCXenP8A==
X-Received: by 2002:a17:907:7286:b0:af9:a53a:6b38 with SMTP id a640c23a62f3a-afdf00a0e0bmr307018766b.20.1755701713775;
        Wed, 20 Aug 2025 07:55:13 -0700 (PDT)
Received: from [127.0.1.1] (athedsl-4441256.home.otenet.gr. [79.129.180.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded3070dbsm187606866b.46.2025.08.20.07.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 07:55:13 -0700 (PDT)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Wed, 20 Aug 2025 17:55:05 +0300
Subject: [PATCH b4 3/3] docs: add auto-list-unreviewed documentation
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-auto-unreviewed-v1-3-b0af9cac4b4d@linaro.org>
References: <20250820-auto-unreviewed-v1-0-b0af9cac4b4d@linaro.org>
In-Reply-To: <20250820-auto-unreviewed-v1-0-b0af9cac4b4d@linaro.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
X-Mailer: b4 0.15-dev-b423f
X-Developer-Signature: v=1; a=openpgp-sha256; l=2040;
 i=manos.pitsidianakis@linaro.org; h=from:subject:message-id;
 bh=XkFoMEFev3Z2MyjyHgzWfc0mIlwNn6MTvv6E+uCrlQ8=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FLQVhjcHgzQi9mZ
 25RQWNzbVlnQm9wZUhOWlhOV0dwMzYxcEVJVU1aZUFxWExzSDRtCk0xMUF6ODd4WDhXYjQ2cllQ
 L1NKQWpNRUFBRUtBQjBXSVFUTVhCdE9SS0JXODRkd0hSQjNLY2R3ZjM0SjBBVUMKYUtYaHpRQUt
 DUkIzS2Nkd2YzNEowTGNURC85cVpWYldydEgrTU9Kait3d3M2c212NVlVb1BjLzdPNHUyQ0xuOA
 pkMS82SFdFVVp5R0hianBmQmIyR002ZG1wS204Q0hZNWJTVWgwN3BxZG1pU1ZLNVYvMXo4eWt2T
 mJ2Y00wUlZQCk12ZU1SejdDdjMrZ3BzMXkyUzlMZW9JenFjOGZ3VU4xcFkwQzY5cnFKcmRXMHk5
 UGtEbEdSTG5XajdQYVl3aTEKR2pZZG5hSXRTVDI4b2N6cXJsVXlNU2g1N3U3elNTTU9sZGI3emF
 5WEp3dTVPOWNUaDBmNXRjblVCY1JkNWJrQwpnckhybXpabllnWnJmWUMrUDRJelhFWTN2ZjRFOH
 JCSkMycG9GZEc1aGp1QzJNSXQrT1M2cGhxME5ZRFpVaWpBCnFLYWoweld4K1RIWm9oR2I3SWhEN
 Ug5NklEelZ0NTJDRmwxK0NDWk02NStxN1lQN3JlcjRubUg3NmhkaDh0a1MKZ1ZrcmhYRy81Z2JH
 U2Iyd3dkV2VsZlMwK09TRzJLTnhidXN5T3NXL3h1QTlqRzdBTEo3ZFZTL3Zha1dXSGo4egpNR2J
 OWHBjYkZ2OUNGWG1sN2IyN1M2bFd5K1hiajFzenNkRHA4SjBsNG11bXJxS0hRVVllaXc4d0NFSn
 BQSHRFCjFmdjRBZFQ0OHI3K2RUNXZxSGR4b3NwTU9SNHJCT0VNQ1laM3pVU3NSNEk5YzFNYjRsc
 lp1b0hFTjZLNld4K20KT0VENDliMjNOUTRHc2xzZ2t0YS9ZVzh6Tnk0bER1ZnB5UUZyU3V3ZFBG
 OFd4NUJGNFB0Z0g5ckNUV2xTTDVnSApEVXpXMFlWSFV6U2JLUWVCUGt5d3ZBVk00REkvcm91U1Z
 uWUZpTTZjaUNFQURYM0NnVk92VUhIRmJNU0Izb1dMClp6b1VCQT09Cj1rMWN0Ci0tLS0tRU5EIF
 BHUCBNRVNTQUdFLS0tLS0K
X-Developer-Key: i=manos.pitsidianakis@linaro.org; a=openpgp;
 fpr=7C721DF9DB3CC7182311C0BF68BC211D47B421E1

Add documentation for the ``b4.auto-list-unreviewed`` config value as well
as the ``b4 prep --auto-list-unreviewed`` command.

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 docs/config.rst     | 10 ++++++++++
 src/b4/man/b4.1.rst |  8 ++++++++
 2 files changed, 18 insertions(+)

diff --git a/docs/config.rst b/docs/config.rst
index 0f30d4e..e9898cd 100644
--- a/docs/config.rst
+++ b/docs/config.rst
@@ -459,6 +459,16 @@ Contributor-oriented settings
       [b4]
       prep-pre-flight-checks = disable-needs-auto-to-cc, needs-checking
 
+``b4.auto-list-unreviewed`` (v0.15+)
+  Automatically populate cover letter with list of patches missing review tags,
+  which might be useful for large series that only miss a few reviews.
+  This can be explicitly overridden for a series with the
+  ``b4 prep --auto-list-unreviewed`` and ``b4 prep --no-auto-list-unreviewed`` commands.
+  Note that b4 will never generate an unreviewed list for the first revision of
+  a series.
+
+  Default: ``no``
+
 
 To document
 -----------
diff --git a/src/b4/man/b4.1.rst b/src/b4/man/b4.1.rst
index 5adae9e..aa31219 100644
--- a/src/b4/man/b4.1.rst
+++ b/src/b4/man/b4.1.rst
@@ -261,6 +261,14 @@ For options, see the output of ``b4 prep --help``, ``b4 trailers
   Find all addresses that need to receive a copy of the patch series
   submission and add them to the cover letter.
 
+``b4 prep --auto-list-unreviewed``
+  Automatically populate cover letter with list of patches missing review tags,
+  which might be useful for large series that only miss a few reviews. Use
+  ``--no-auto-list-unreviewed`` to disable this.
+  This will override the default ``b4.auto-list-unreviewed`` configuration option.
+  Note that b4 will never generate an unreviewed list for the first revision of
+  a series.
+
 ``b4 prep --check``
   Run the configured checks on your series to identify any potential
   problems. For Linux kernel, this runs ``checkpatch.pl`` with the

-- 
2.47.2

