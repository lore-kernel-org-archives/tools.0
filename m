Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F579323D
	for <tools@linux.kernel.org>; Fri,  6 Jun 2025 19:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749239482; cv=none; b=NEO6Q301K2nQBJ5E6WGA/UbWFsj/ZSsVdLwHevGlBguVwpjHcGWWGFsHy8UPRgRh98SE8ITa3BEhjfeYqMaXTSPf/B8HCegEblDq5eVaS/VBRPO/xpbp8ChmIMqJhM7BLdds1gwrwwJds6gn7aO0dpd9x4IHJPjgONLX/gOEOTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749239482; c=relaxed/simple;
	bh=KeXcHdJ0lHsnqrgwU+Nnyl2zN0G465xw4ThlygqFoyQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qAvGuHJYZ4JhJ84SDGRTL8fvi0xSTb0Ow+RQEVuRoAXqGVrO9DisQfmtehHvKG9jChfppPMSW7KzWVb5OlsDygZblqnm22st6/VFvBF8BDfh2ipCUV3+E3jPypt8hhNsuRlDC+d1RNJDROJ2RoIpr63lHd/prp0RlcY+c58T33M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lJlerqRv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lJlerqRv"
Received: by smtp.kernel.org (Postfix)
	id 43906C4CEEE; Fri,  6 Jun 2025 19:51:22 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4F0C4C4CEEB
	for <tools@kernel.org>; Fri,  6 Jun 2025 19:51:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4F0C4C4CEEB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-48d71b77cc0so30002331cf.1
        for <tools@kernel.org>; Fri, 06 Jun 2025 12:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749239480; x=1749844280; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xaw5TzOqfhNdv6ZGvO+rU5na8Y4e1G+My6jeP4k3FXE=;
        b=lJlerqRvYe8Kay69L/3o7c67sqSIo/YfOavawUfcRS4+Vd/Uf3fE1G+5qzrkY2xkWh
         zC9bEqv5a9im1KvzCRcBIbaxKPx9uefYSD/YW04GsYIDVC1vZHW57hhdBCQV5sQxPIJw
         okZNj/5Maxcmq+KcLed39x5vhljZgP6jFRoOxEqpdu/bqtLV8dkWgwg8/2mib6iL44Gg
         BSCYxkHLWlSV3S4JEO72CdJYekle7Y0SWO6DYzsf3qHJybmX3ZEA1DclHqrxltm6OSQJ
         ES7iARgv2Kj88pUDB3qaQIHZ/jUtoY0nGZa2DQBfaKc4SIwBEAne6Nk9sjyosOs7SkUK
         oxKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749239480; x=1749844280;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xaw5TzOqfhNdv6ZGvO+rU5na8Y4e1G+My6jeP4k3FXE=;
        b=WwQ9w7XP3nMCGXyDhxlG7wLlgG0iCnMkLjJXCi/B4aejIUJEUqH20aSVZEZS0Xs8MU
         C+4ccmyDd91ae7KwykWJVIfxFfWxTOEn6nrK8eBN3/MRYJ2UfDzflxXg75LhEmULHw4m
         mugrQVllJvI3TuF4DejS/aCWNM3BWpSSLVF7gQkjZHwMPe87eMJy/i1Y/Jci6XzftQoU
         ZbX+8LG2VsB5k8BldALs4tYEt5koDFcPFd21urzzEXl9IYhOdS6GeT1QuKCZ6c+hjTqZ
         d3tMa+ZBsBX8H2p/OKmT5PfvnNxixqyTeiCn3HCkTVY4twPVZtACZvHD5N/OfwnQIL/j
         Vdhg==
X-Gm-Message-State: AOJu0Yy0dwQyMZDmhmwVB0rF8/OZg/9iGTPyGkYESDZ9cDgy6ZNBVdVc
	cJQpF7tKL1K0O/d5Q55VjXadTZPgOdnhHo/e8jVhXFx2hZp5RBR/CrzE
X-Gm-Gg: ASbGncuaEI4r/bWs0GmvrTR4s//cbnoJO6wg6XjfotCLyOSZFnfpz/72eQurDgEDdRf
	eHRFcvUHdNu77fRE0Q6g0p1Ohm5u5OFvU0x6uqL0lbkDDmoSAo18oXAMASSAfZahZuLTv1uW+Oa
	akuw+WQ0XGb64IBNJcgxiIExz1XMFe4bF8oHIU5qnIxyv7jptJ0agxWOLDlImdeb+EA+2MLfpaF
	cXfyor9s4FktnjL4yyNA6A84oJXFMM/UGjPFnJH+rz1646n7oh2GP16EwowxsKxLy2PUTDjDUz2
	JlsQncIrTYv3kJzv0zXSEJwZpgNHsKQHygad7I0gI6pVa11zV9jEx5r4v08G2HB224lWkKW/ARm
	V1BHJ3ye7
X-Google-Smtp-Source: AGHT+IFRex6XqhhU1Kv4mXQNvfF+FeXUM+CApDXJgARCfDnPRtC7XaCL2ConkSoZgg8jCDzKqFTQfg==
X-Received: by 2002:a05:622a:1f06:b0:4a6:ef77:4a11 with SMTP id d75a77b69052e-4a6ef774c4amr10682001cf.5.1749239480025;
        Fri, 06 Jun 2025 12:51:20 -0700 (PDT)
Received: from tamird-mac.local ([2600:4041:5be7:7c00:d553:69f3:49b:5c70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a619895298sm17718521cf.81.2025.06.06.12.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 12:51:19 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 06 Jun 2025 15:51:14 -0400
Subject: [PATCH b4 03/10] Specify dependencies in pyproject.toml
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250606-uv-compat-v1-3-c76c1c8d6eeb@gmail.com>
References: <20250606-uv-compat-v1-0-c76c1c8d6eeb@gmail.com>
In-Reply-To: <20250606-uv-compat-v1-0-c76c1c8d6eeb@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

This reduces the setuptools-specific configuration slightly.

Add `pip-tools` to `dev` dependencies and use it to regenerate
`requirements.txt` with `uv run pip-compile > requirements.txt`.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 pyproject.toml   | 11 +++++++----
 requirements.in  |  4 ----
 requirements.txt |  8 ++++----
 3 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/pyproject.toml b/pyproject.toml
index ddc4e02..7264a9d 100644
--- a/pyproject.toml
+++ b/pyproject.toml
@@ -22,10 +22,16 @@ classifiers = [
     "Topic :: Software Development",
     "Topic :: Utilities",
 ]
-dynamic = ["dependencies"]
+dependencies = [
+    "requests>=2.24,<3.0",
+    "git-filter-repo>=2.30,<3.0",
+    "dkimpy>=1.0,<2.0",
+    "patatt>=0.6,<2.0",
+]
 
 [dependency-groups]
 dev = [
+    "pip-tools",
     "pytest",
     "types-requests",
 ]
@@ -35,9 +41,6 @@ completion = [
     "shtab>=1.7",
 ]
 
-[tool.setuptools.dynamic]
-dependencies = { file = ["requirements.in"] }
-
 [tool.setuptools.packages.find]
 where = ['src']
 exclude = ['tests*']
diff --git a/requirements.in b/requirements.in
deleted file mode 100644
index 9288803..0000000
--- a/requirements.in
+++ /dev/null
@@ -1,4 +0,0 @@
-requests>=2.24,<3.0
-git-filter-repo>=2.30,<3.0
-dkimpy>=1.0,<2.0
-patatt>=0.6,<2.0
diff --git a/requirements.txt b/requirements.txt
index c93f748..1862617 100644
--- a/requirements.txt
+++ b/requirements.txt
@@ -156,7 +156,7 @@ charset-normalizer==3.3.2 \
     # via requests
 dkimpy==1.1.6 \
     --hash=sha256:0ce72d961f443e8f9f05694b354542dee534e08e2b8c5b60c62d5daca7c1da0f
-    # via -r requirements.in
+    # via b4 (pyproject.toml)
 dnspython==2.6.1 \
     --hash=sha256:5ef3b9680161f6fa89daf8ad451b5f1a33b18ae8a1c6778cdf4b43f08c0a6e50 \
     --hash=sha256:e8f0f9c23a7b7cb99ded64e6c3a6f3e701d78f50c55e002b839dea7225cff7cc
@@ -164,7 +164,7 @@ dnspython==2.6.1 \
 git-filter-repo==2.38.0 \
     --hash=sha256:c2646206dfdbf06ce27c06c5b77ea33209d8e32d1e33f6bd4c25b1ccc59f9864 \
     --hash=sha256:fe1753e18f0bd6d3c9b57868c8011ae7d056a6ebab706706396a15ef5312725e
-    # via -r requirements.in
+    # via b4 (pyproject.toml)
 idna==3.7 \
     --hash=sha256:028ff3aadf0609c1fd278d8ea3089299412a7a8b9bd005dd08b9f8285bcb5cfc \
     --hash=sha256:82fee1fc78add43492d3a1898bfa6d8a904cc97d8427f683ed8e798d07761aa0
@@ -172,7 +172,7 @@ idna==3.7 \
 patatt==0.6.3 \
     --hash=sha256:980826f6529d2576c267ca1f564d5bef046cb47e54215bb598ed6c4b9b2d0a28 \
     --hash=sha256:fd763660cb847aab623cbb9891240b6c10c39cc9bfca73cd3b03d40a5eb1c552
-    # via -r requirements.in
+    # via b4 (pyproject.toml)
 pycparser==2.22 \
     --hash=sha256:491c8be9c040f5390f5bf44a5b07752bd07f56edf992381b05c701439eec10f6 \
     --hash=sha256:c3702b6d3dd8c7abc1afa565d7e63d53a1d0bd86cdc24edd75470f4de499cfcc
@@ -192,7 +192,7 @@ pynacl==1.5.0 \
 requests==2.32.3 \
     --hash=sha256:55365417734eb18255590a9ff9eb97e9e1da868d4ccd6402399eaf68af20a760 \
     --hash=sha256:70761cfe03c773ceb22aa2f671b4757976145175cdfca038c02654d061d6dcc6
-    # via -r requirements.in
+    # via b4 (pyproject.toml)
 urllib3==2.2.1 \
     --hash=sha256:450b20ec296a467077128bff42b73080516e71b56ff59a60a02bef2232c4fa9d \
     --hash=sha256:d0570876c61ab9e520d776c38acbbb5b05a776d3f9ff98a5c8fd5162a444cf19

-- 
2.49.0

