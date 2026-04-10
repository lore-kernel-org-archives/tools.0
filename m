Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0FD3A6F19
	for <tools@linux.kernel.org>; Fri, 10 Apr 2026 22:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775860691; cv=none; b=t1FuXqx8v2SG04qusXk4Aug10Trr0WXMQDmqxaJbaVb/Bhxd28M6sG9QJpGqt7+aLD7Xg/9u4EXnQwhp9mrsw5iGK7Ng32ihcxjvjBsX9mvYvc/T1Xupr9QZJP01D9NQMMr3DajtCmiq3BrapXzshyhslf+uUda3koQen9Me8Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775860691; c=relaxed/simple;
	bh=1LBcifREtX1YtAHd+/HwO00gIcWkWU/aWGam2IwmQjY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hBuQ1Mo1Zr16xNc3nYt1TN4yYxxN4S27AQKJxqtHN/hIcOfY887sZz78bqq6KRtYvDruJc+9WrLTF0WBcRQwhGdmG6lwY4Iz6VMg5N4KsO9W5oqLDalAZ3jdNIteGoQTPR6S9vcRDOdnOa/AFpEkNC8uhl9hf1iVfbcTVyFU9ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RnennJTh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RnennJTh"
Received: by smtp.kernel.org (Postfix)
	id 086B6C2BC9E; Fri, 10 Apr 2026 22:38:11 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E8B74C19421
	for <tools@kernel.org>; Fri, 10 Apr 2026 22:38:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E8B74C19421
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8d76492e51bso253225785a.0
        for <tools@kernel.org>; Fri, 10 Apr 2026 15:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775860689; x=1776465489; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wZLuOZU8uAsNtK63rQS90Br6hnDqeadAzH8ej5iZR54=;
        b=RnennJThzJQDZkA/wWZGNB8b1mm+GJnmV4YcPnChgGIrnqmhx8qqK36/ZkMkAtQA48
         rG0ADDYwijcDRpevUbcfZKXWyS1p1pAse2Ff+Vm04log2gYFOAhQnt+fhJ7HXujxmLGe
         EEO2Y/4Lu1nRYQnFgCIWoVhRamOwyIlaeSUguITZ5ltKaZrQDz7lQOojIpsu0Oi+jVxR
         4lcOhaRGyFHUtxvEchuUz60/Wa+qF4fVFjZ/MjyZIwUhGLMzCOJW16NBcf3Sf1TibtTI
         qI/a25VMnQrmvJgLop/ZOZ68Vw8GFjsrzU8X/ko5kK005rHVWu9fUdp7wnZE0IRdG/xr
         7gag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775860689; x=1776465489;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wZLuOZU8uAsNtK63rQS90Br6hnDqeadAzH8ej5iZR54=;
        b=QSw7Gqzd66sB9dgSSyK5FTnC6Ydw18y/7Eae6I9beM5GcY5O0+1hVVLJCNSwIi9+xb
         OTDFXb6qthQD/RoOCubum2tRUD0asyOXcRJljKl6f2j7tj+mtiFMzzguCdYalrG1p31E
         aSFHKK7wygzGG3sIdUtgjSFqOdJkMeeXY9PyU3xgQt+JurklPCFJF/ZvLpgqhfFcNYV9
         opUAkZa3pyfLGBEKouD9NLZqrsZmTZ3FA8mqLGZ1kwQlBfCNoCeybDe1D+XzmW/AykHA
         AZ14JkM3UPGyDQ2g6dmEL9zq7tMuJvvkeTE7up2UXib0Q50IDpaqC4cgrsotVrjLEWDf
         kINQ==
X-Gm-Message-State: AOJu0YwQCLTYESsTmJy9v3/Dd3ev9HSclXLoZpRYjQuKVIJlLyCZilci
	6JZan8vghKrd+ZGWO7YX9RpBUSoMlfz8xFaQjAgaA/qPNibhtFetJ5M2
X-Gm-Gg: AeBDiev/fgQcSwTyY/9xVPP1E9vcbSZxIh9q3tMPfIjdwiS2dd9UHLbEDX+iMkdwI14
	xTGnWjoz+2CVhR3ilC9yTuc/CXsABrMDgrB8zs1ZSKEpwWyIgySF/E03ZiOuMGCnUxjfU/HG7d8
	AyyWFsOi5OlvlEmSckJGqRZd7O5CyFU8Xw/qeT/Xfud/Uj3aPkFxDjBwg/TCRJtUIoi86/dm9kF
	OskO+T6XOXhVpIg/29o8dnZDywClx3wjgsoHQtAY9vJatyrKI/ixRkT1sRCk+aBBIxuRS6h89Kc
	uD0DvJA7OGpC95HooWmCIOFexvfvncTpAQeJ82Vhxb9H5kT4ekg9pZj8fcsC7mD/uRGwFv1XBmG
	HQ9sNDqLdlC7bICKBV+mltDf8g/nnQjymfcg5cfxq7zi3/R6R7rbOFQ4yXVQ32HgDbIvtS/ppJb
	83gk57FSmXTbwXTMeRmFAedxIl1EMFk6IGtPSC3T9YEg+IzU/uATjoemhdBhY0UJwIwgCuiVRDV
	98fT/UUNW+JQ69ZbSALpacMM7Upukc3egg1VnBSA5ifn0PmyfaJppeQ6tCsUM3iNvoDkO9zHVzB
	uxLkhRmi5va0/k6kJaJx6NubsfIZuwibX50W+TPKkacHauLyAia2
X-Received: by 2002:a05:620a:d85:b0:8cf:e0fe:f227 with SMTP id af79cd13be357-8ddcdae2f67mr770457985a.26.1775860688909;
        Fri, 10 Apr 2026 15:38:08 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([208.80.35.36])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ac849db735sm41370096d6.2.2026.04.10.15.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 15:38:08 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 10 Apr 2026 18:38:04 -0400
Subject: [PATCH 13/14] Update README for uv-based dev checks
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-harden-type-checking-v1-13-fcf314d9d748@gmail.com>
References: <20260410-harden-type-checking-v1-0-fcf314d9d748@gmail.com>
In-Reply-To: <20260410-harden-type-checking-v1-0-fcf314d9d748@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1775860675; l=999;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=1LBcifREtX1YtAHd+/HwO00gIcWkWU/aWGam2IwmQjY=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QBbQ9o9QeMjeuwBeR7nIFeFZEucE63vlW5wTVLUkTRruEC1EK2FG+AaqK9hSCjJelFywQkaOoDd
 WaxkB8ZtwTgM=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

Document the development workflow in terms of `uv` and mention `pyright`,
`ty check`, and `ruff format`.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 README.md | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/README.md b/README.md
index 3709d7e..2f61036 100644
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
+uv run--all-extras --all-groups pytest
 ```
 
 Type checking:
 
 ```shell
-mypy src/liblore/ --strict
+uv run--all-extras --all-groups ty check
+uv run--all-extras --all-groups mypy .
+uv run--all-extras --all-groups pyright
 ```
 
 Linting:
 
 ```shell
-ruff check src/liblore/
+uv run--all-extras --all-groups ruff format --check
+uv run--all-extras --all-groups ruff check
 ```
 
 ## Bug Reports

-- 
2.53.0

