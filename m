Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4EA148FF3
	for <tools@linux.kernel.org>; Fri, 25 Oct 2024 20:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729887384; cv=none; b=Fd+AFN2/dv1+F16M5wigV8maoNFlLFad/zEbrof+1X8y/WNS4RoQDjhqBPVWHs0GEQg7dtqEm44EWAvwv0ledBkUU0L5vonx/IsN2sjUJu0iVCapavr2q3Fw3ngy5gEVoCXDdM6Y1N9D+jgm4i9yxg3uxEkQnwQUMVhTANZ05zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729887384; c=relaxed/simple;
	bh=TiOmfjWkD9eZWure12ije876wWJquasB4D9SrLpkFJo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dtK3t1h8k11bUbg33eX373Vp4QgcTlnZZ/dCompo2PYni983LO84ucEtmv47rgSA5Y4ohExwFgPhEejC+JFnntZsU5E9qUqnUJ4dNeRtVWOPciCipjXxU7HeGhQFFoGtHdyilnOLJrotEwteHgs/vsttF/R98Cm80SDL1dbfdUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mj+/nJe9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mj+/nJe9"
Received: by smtp.kernel.org (Postfix)
	id 4D64CC4CEE5; Fri, 25 Oct 2024 20:16:24 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 623DFC4CECC
	for <tools@kernel.org>; Fri, 25 Oct 2024 20:16:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 623DFC4CECC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7181c0730ddso1088930a34.2
        for <tools@kernel.org>; Fri, 25 Oct 2024 13:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729887382; x=1730492182; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W/XeZdsSRz+OxEf9GE2OFP7ZbIH3O55iQETRJ/i/gpc=;
        b=Mj+/nJe9vJo+s1cb9XKfv4FcbTVHH2IT/EMUda0xIFDBmXW/fccq52sT3lEZQQ5N72
         Ij3/bM0o61F/O53e0SijN9b1u0QTyjDtb987VOYf+XgRfwwv3z2v2WxMaJm+WwuPEegT
         vstkzK3AAGiIxf30HbhhvOJwLGHCdcL8g9HAAPaPifiop3/jTCbyO2Rs+j2xQA3XjzKn
         qWQyrvrUhCl7wyh1dyY+wEd/mJ9N127KYZ6xHvZoU05fHEHbcN2+6+whMCh41EBQSVre
         MbPqtmY8u7TOG1mfYC7SMuWRzSJeoNTSY7i2PGYM4EVejVwOlsAifkD7UCuVmHvbfsZI
         X/Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729887382; x=1730492182;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W/XeZdsSRz+OxEf9GE2OFP7ZbIH3O55iQETRJ/i/gpc=;
        b=dkgvymtNdcE9HOdNgZsLvHw7q9ry2KVprWdrBrrQp7AJV4L+axi00pq4LqNQ46+Uwj
         WlX2GxagGcInSTDPwrgGdbOujIwQYb6KzOTkGJW63G4TivRr6fXd2iNz3vEMQ6qu7x5L
         980NVqQq8dY4C15TODLWbKuqBB5+T2pr3W5dX3VtEOvmBellA8FuM3A2l2d2Rnu4TEbk
         HtL3h4PGNNVIU0CjDNLs9KmY1EJAKVbBZcYVWlikqaaKFTVG41wCxz7Itm5gHyHqXAJ3
         JXy5DcQQ0B2MNO3ovl37YEYkJJSQ/DH/+QzwkLHf7/7EHrIiHl7ru6zVSYg/sn1hW+ZH
         nZlw==
X-Gm-Message-State: AOJu0YzlfOKKfQfMMnbU34MEWWl462lAnj9ADRj4EIbU1GOmetU4it2w
	AqvWGHI2t9V4lUGwovERPScpeEzBM+LQ9WwIkkT6/tXQneGcMIZN
X-Google-Smtp-Source: AGHT+IGi/NbM51FlOEe2Pawo3vbuZAybzLwZ7Vwvjq0yoFRuhwBaSAwmJ1Ow7OGunZzMsv52su0ceQ==
X-Received: by 2002:a05:6358:7e0f:b0:1c3:7d12:708d with SMTP id e5c5f4694b2df-1c3f9e064e0mr90127455d.11.1729887382435;
        Fri, 25 Oct 2024 13:16:22 -0700 (PDT)
Received: from 156.1.168.192.in-addr.arpa (pool-100-37-170-231.nycmny.fios.verizon.net. [100.37.170.231])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4613237f394sm9124491cf.65.2024.10.25.13.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 13:16:21 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 25 Oct 2024 16:16:03 -0400
Subject: [PATCH b4 1/5] Add development dependencies
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-better-type-annotations-v1-1-9d7a00a8d754@gmail.com>
References: <20241025-better-type-annotations-v1-0-9d7a00a8d754@gmail.com>
In-Reply-To: <20241025-better-type-annotations-v1-0-9d7a00a8d754@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 pyproject.toml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/pyproject.toml b/pyproject.toml
index 31bfe3033650b2b251fcdcbab0456f4a67e914df..7c65c30efdb95fa40cc1f22933bcd62073db4f26 100644
--- a/pyproject.toml
+++ b/pyproject.toml
@@ -22,7 +22,13 @@ classifiers = [
     "Topic :: Software Development",
     "Topic :: Utilities",
 ]
-dynamic = ["dependencies", "optional-dependencies"]
+dynamic = ["dependencies"]
+
+[project.optional-dependencies]
+dev = [
+    "pytest",
+    "types-requests",
+]
 
 [tool.setuptools.dynamic]
 dependencies = { file = ["requirements.in"] }

-- 
2.47.0

