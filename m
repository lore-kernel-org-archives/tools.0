Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A5C39A051
	for <tools@linux.kernel.org>; Mon, 13 Apr 2026 22:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776118117; cv=none; b=mX3Nj1+941pb9O4o7QANWDN0j31bxBefYkqW6YZHQ4Qfoii2ryC3Bn6fi1VlwsiXOzAbhZ3hFTQCPYzA70eDjU2uI9TxvO65SaYrOURCL7APTRXL+7B2ezrkIXPUREc7ipAuKHB6M3CvtYZyJmHUCfJh7eEiWm6YXP0/n0kMNgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776118117; c=relaxed/simple;
	bh=J7l36ywoiaVbG0u2x0v0hlY1olVJOUVciVIsm/mlgS0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XOW347LyBx8Ard7MCVgycL1Jd+cgwjSVYuCOK/525np3BAaA9x6kcQGmm6n1eQuSsx9mnVoJ3+9XLiFKmfmh0RNgikzXyA1AospwnXVNiNaoftjzMkJYZ3OEZ/tFnxfkQnU3vNdFh212vOhJLmLI+V/8mt1/Uvmpr2kvMGWlVjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rRA3y559; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rRA3y559"
Received: by smtp.kernel.org (Postfix)
	id BF2B6C2BCB5; Mon, 13 Apr 2026 22:08:37 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 013BCC2BCF4
	for <tools@kernel.org>; Mon, 13 Apr 2026 22:08:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 013BCC2BCF4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8dbbc6c16b2so630648385a.0
        for <tools@kernel.org>; Mon, 13 Apr 2026 15:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776118116; x=1776722916; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yj7vjiB/wjFkAP0P9oDDPfnoWzt/HYCPEQ3P8jds+50=;
        b=rRA3y559MZwIFrI9n9e/LZf6pbBVJX0ejU7yo9hmZY3vmPhHDGUE8Lo0WBtjpB3mHO
         mlZSg+sUl3KUSQyhZHOLDccrcY3LEJu0IQAhbwGclaB3F6K7ZvMDeZILKzp07k0MauTi
         0ZGHP/44UjFzF57OlT3TUblMnx9SddO1c5nOgyYhiVl+IQYMagW8+BsnWQ1zbs0I9Px9
         EDuQnxjvFe0M0TIDomhyuekp9fUtd2xru7EcgqiPAMHxK2WqDnxqgbRfG2ni/ROSXfR0
         xYOfnvGUjxmaz2BakAErBhzyHU8gHt5WiQFxV+S90PLNIzJcNMXSrvK1CwLk5xEB7IRL
         PqVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776118116; x=1776722916;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Yj7vjiB/wjFkAP0P9oDDPfnoWzt/HYCPEQ3P8jds+50=;
        b=h66qqD8sjAWxrZHCWcU9UVMe8vVFQgqv3Ibb7FU5SGMMJbiQagUn1kab9gVxBPcrQG
         jTQdnEjEWXFJCB+x8PSo7QRhtSnHXu+3DeI2AP3DMLJL9KKXiNXDCoDJrZp6lRUbJvct
         Lchmy+NFuC27oT/j9p3fBGMyLM9cSpeMJKYXPuuR2Ue0pzhodY/Dt7nflnlH6BcPzkce
         8s116iHKxm67uDpPvjXF19BkkvVeVM1PM6AiTl6Zwe1UZptYcpT+SDBIb0mKLr3fm+ox
         wWg+eD0X+8rv2kEZuvHu7cwDu00UHxFUvtP1uVB+60KvnXrzF2O14ePsYWILSVFoxTRW
         9xMA==
X-Gm-Message-State: AOJu0Yzj15IE4pnYzNyr4vkYFsjub363mxT927ozen+1btq6golJOLuL
	PHXosjPL7rofMBgwj6sF512nDhdo2U0ya2nuaXSJp57K7thPSRkPuWKX97XWIS+v
X-Gm-Gg: AeBDieuvR+DEmVm57m3kkFvVU4/RMRwBQpWCOS33BAyAVCOL0e2LMBSRhEbRK4t/Law
	3ljZLjOjyCDk3IX119aQBn+k2Jx8Ufk85lnanoszHlhmKykngzG7C6omDeOXuC6AT8r2RY+Tg7H
	d1Cgdhb6I2trlpHRMcMYfVQbfxs8/fWH+Nxin3O4KwYTQVZnzavZTTEh2ESwFh5x4Yi1O/+GqVm
	nf+Viui7oVd6RF9MFoqIvJHyMDLbbzrVsehych/col9tyspuEOlaYkHVkHj3mcCACmBure+z56c
	aXkBrAc6Ez0Eo7PfKhdqzaA5EPe2EJxiaDk/IctA2iy+DuKpLurhxv0ZvSRD9IKP2OP0BK4BLaY
	tiT0MG+Zu4avEgATG4a52DipBXjKFKYHKNZOe6FDZnF4FmBoK4Cr6xt6RWGF7eINSr4pkMEOhex
	na8MU684nAj9BobTwcmP1NOzmqDNWEsMFnIoWlk/43Oe12SDa7dEyICdmRlBpWQt1oooDoPmmoB
	6OR/8P/3H4IAEX7DGVyN2EcvS4YMqI/hGZAzyDrKvbpaZerFs1bT83Fz4FecZhtn728Y/kQCT5u
	SMskHCTprHX5lkxaMcIwJcNgocJhoF45N9Me66Kz5ZjNJYhwFo4gHmyrxkceVbbo
X-Received: by 2002:a05:620a:4623:b0:8d9:26ca:7e3 with SMTP id af79cd13be357-8dc46ec7850mr2640007785a.41.1776118115993;
        Mon, 13 Apr 2026 15:08:35 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2600:4808:6353:5c00:c007:ed8:60aa:a884])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ddb8d6e387sm907506185a.30.2026.04.13.15.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 15:08:35 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 13 Apr 2026 18:08:27 -0400
Subject: [PATCH v2 13/14] Update README for uv-based dev checks
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-harden-type-checking-v2-13-1ba6056288d9@gmail.com>
References: <20260413-harden-type-checking-v2-0-1ba6056288d9@gmail.com>
In-Reply-To: <20260413-harden-type-checking-v2-0-1ba6056288d9@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1776118099; l=1005;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=J7l36ywoiaVbG0u2x0v0hlY1olVJOUVciVIsm/mlgS0=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QDb3ZhRA8j3BNdqSDK/RcKFpJV9bpST+ezsaT9qOUW3Oru7XrNJtnAT3hhbOvVAVldHBw2z1ET6
 BA/pE9HdlHwI=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

Document the development workflow in terms of `uv` and mention `pyright`,
`ty check`, and `ruff format`.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 README.md | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/README.md b/README.md
index 3709d7e..1c3863e 100644
--- a/README.md
+++ b/README.md
@@ -613,25 +613,28 @@ except LibloreError:
 Install with development dependencies:
 
 ```shell
-pip install -e ".[dev]"
+uv sync --all-extras --all-groups
 ```
 
 Run the test suite:
 
 ```shell
-pytest
+uv run --all-extras --all-groups pytest
 ```
 
 Type checking:
 
 ```shell
-mypy src/liblore/ --strict
+uv run --all-extras --all-groups ty check
+uv run --all-extras --all-groups mypy .
+uv run --all-extras --all-groups pyright
 ```
 
 Linting:
 
 ```shell
-ruff check src/liblore/
+uv run --all-extras --all-groups ruff format --check
+uv run --all-extras --all-groups ruff check
 ```
 
 ## Bug Reports

-- 
2.53.0

