Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FFF3E0226
	for <tools@linux.kernel.org>; Fri, 10 Apr 2026 22:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775860687; cv=none; b=a6IK1/tI9vVjU3VmUKB7ggH2Mg7UkvTUMBcqFrtwfFv3JkGw+4ps5hNWTL3zviMPEP2EVnbvZC9J79N9tdfFH0S3qUwRU7RkG+ieTYjLMZwgqi+PzuQt22kXe4ajynI5z0Fw9ywHjwv9tWKvXZRr5eeUSHPFlD8fQ6JZAiagB7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775860687; c=relaxed/simple;
	bh=yp32EJbO1NC4lSt0NGuRGaZoPIQVhGkBrHPJC+eKInQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pLsJtDr4q2gRoqlS5L3vWgFFwUgambu+Q1rVJ3Uyrv0tuvms9waEOixGERDrmG/VAKSevqvP4o+ZMrVFJgkJajSVpDHDPbtX2w9OpAHFFfApAvC0k8Dp5s5+W07hQpx9ijIBHeadEfhwtPFWWbr6ARwiTlm7fl4Sd8oX32e29pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HtsGuOu8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HtsGuOu8"
Received: by smtp.kernel.org (Postfix)
	id D29F5C2BCC6; Fri, 10 Apr 2026 22:38:06 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E7191C2BCB0
	for <tools@kernel.org>; Fri, 10 Apr 2026 22:38:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E7191C2BCB0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8a032383008so29461546d6.1
        for <tools@kernel.org>; Fri, 10 Apr 2026 15:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775860685; x=1776465485; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tk4LYxW3jPDoh4hOi6GurVjoDNmfZQOIsRCFiCGInv0=;
        b=HtsGuOu8fa8bRBMS3q0Ya4QUj5hjzNKX1ndDdQkdgQrbtPPekaeog26SpLlwkQb/xB
         paF6MVEVSBKw5B9qzoY6189u8QXFJTVXbrqKJITESPgeNbk3gYHuTW2aBJv6ZwcOUnFC
         lmI+tqioNkn6Rjj/bBfw0+/RjQRf4pE0sVGu/ZR+RCLJ9hkJNOoTcp6v1kCADvxLrmsn
         PSQJwbcDKGiusdpff9YlwLBHR7fTx3fS8GlSJD2nHmTSSjsZ1txhLYLx69swNy8pPoFK
         kME9PlL6TekqxZ9MHCDcfTxv2azF4f04epkgK7jlJDpHDJ14xNB461JejoKjH8xrvdgE
         a8zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775860685; x=1776465485;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Tk4LYxW3jPDoh4hOi6GurVjoDNmfZQOIsRCFiCGInv0=;
        b=nP64uC44a3rtOoQNwNftnb/pUb3VbD+t5+45/UMpZs2UGNiQHBSZTn3+t/tdVPF8To
         Arz3al5Mb74hl/VlAyAyrPdb2KyFJEGzPkBNN230j5u4oypx+qp8gVrbHVWUCHx558bb
         5/63fDq0Q2wqRM3tQgYZn0w9YGBRqOF4aPBactu08RvcMvz8iB+R+2NVwMJfzI/r/kEM
         /eD2RXWtDPhFwa5gNn9Bn++nx/PNeg+Hvq7QT5oGMaooumdUjKyzudwBtyPr6vbnFoYh
         W+Tz0hMN/hSoKZKhBJNodPrMvnkw2xBQAh3WXvK7S9wEV9CrROv1d+D+owLN+AI9Jd5b
         3rSw==
X-Gm-Message-State: AOJu0YxsKCzGsUZKJ+qR3NlyaS5ywS/4zARwe/DgXDhQBu8Rh8Jli+AJ
	fZl94+ixHviiEIgTnW3ZQywWlJ2BJxTnfcG0rAZxl4+y9BBba5xI83joyhEdFg==
X-Gm-Gg: AeBDievVSFLm/ba9zKQHUeEMjrS8C7CDD+enkdsD1dtsLN2sdsPKXSP63dgGvaLRXhb
	7GTE4vtZjHm6PZdp8ncCn+Oc1OgvsJJbU6MDz3aFcJW8hEGXC19QrR7YRJ+BMllEUpa5ZJLbo32
	iucEMqushQFCdkQ1toyNk0z+G9D5yQPe0E6XVLP80B2yhTuvGi59zRUk6FWCgXCQcLMAhighe3Z
	QtGBwd90l2V6UvbqsIlgCeFmm2108v9skUubex7uEUFkw4Ou9UhasJnmMlsZdIKz0UWD0GWbKeb
	bKp5SH3WuMoxFpoMpQhpIP6/lA0LWveCisoT2EzIBrsRiXABuDQDUKZ5eTb/5VLmeq1b8ZwDIWu
	/PsZ3gq3ksFJerqfqBmsv13FCsaxB/EVH6fuV6XKKEwPyGu1UupcVFjOvEEB8wyL2VOOkORgmeD
	AzouYrvfSRbd90VAgtGGz6qur+oi/BdeB8SLB1u5bwLgDmMoheSbQeSlJkowXCtOiKF5E1Y2XHe
	2X7MEu/++Meff+ldNK115D8kZXe8tyIwCW/jQAJv2yql/9J9C+Mhpb7/imKvpWjOb6QVaj1igCy
	BVKrtiIWtBre3qQsN3XKKhPycA+ZQo+SIYvyI/Cj7+Qm5bK5Ph3K
X-Received: by 2002:a05:6214:4c92:b0:89c:47a0:390b with SMTP id 6a1803df08f44-8ac862e5f0fmr70116676d6.47.1775860684940;
        Fri, 10 Apr 2026 15:38:04 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([208.80.35.36])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ac849db735sm41370096d6.2.2026.04.10.15.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 15:38:04 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 10 Apr 2026 18:38:00 -0400
Subject: [PATCH 09/14] Type from_git_config keyword arguments
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-harden-type-checking-v1-9-fcf314d9d748@gmail.com>
References: <20260410-harden-type-checking-v1-0-fcf314d9d748@gmail.com>
In-Reply-To: <20260410-harden-type-checking-v1-0-fcf314d9d748@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1775860675; l=2141;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=yp32EJbO1NC4lSt0NGuRGaZoPIQVhGkBrHPJC+eKInQ=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QA5x9DyEvfH2DdPrWDGV0/tvWXpeQcY2KPZFanCdhIvuM6LTSrW8EREa93nwc7tp0NbKOLIjsWG
 mZRePs4wRwQU=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

Define a TypedDict for LoreNode constructor keyword arguments and
annotate from_git_config with an unpacked kwargs signature.

This removes the constructor-call type suppressions while keeping
git-config defaults and caller overrides unchanged.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 pyproject.toml      |  1 +
 src/liblore/node.py | 18 ++++++++++++++++--
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/pyproject.toml b/pyproject.toml
index 37c85a7..387757c 100644
--- a/pyproject.toml
+++ b/pyproject.toml
@@ -46,6 +46,7 @@ dev = [
     "ruff",
     "ty",
     "types-requests",
+    "typing-extensions",
 ]
 
 [tool.pytest.ini_options]
diff --git a/src/liblore/node.py b/src/liblore/node.py
index 1b0463e..4835169 100644
--- a/src/liblore/node.py
+++ b/src/liblore/node.py
@@ -17,6 +17,7 @@ import types
 import urllib.parse
 from datetime import datetime, timezone
 from email.message import EmailMessage
+from typing import TYPE_CHECKING, TypedDict
 
 import requests
 
@@ -29,6 +30,19 @@ from liblore.utils import (
 
 logger = logging.getLogger(__name__)
 
+if TYPE_CHECKING:
+    from typing_extensions import Unpack
+
+
+class _LoreNodeInitKwargs(TypedDict, total=False):
+    fallback_urls: list[str] | None
+    auto_probe: bool
+    probe_timeout: float
+    probe_ttl: int
+    add_auth_headers: bool
+    cache_dir: str
+    cache_ttl: int
+
 
 def _get_config_from_git(
     regexp: str,
@@ -212,7 +226,7 @@ class LoreNode:
     def from_git_config(
         cls,
         url: str = 'https://lore.kernel.org/all',
-        **kwargs: object,
+        **kwargs: Unpack[_LoreNodeInitKwargs],
     ) -> LoreNode:
         """Create a :class:`LoreNode` using settings from git config.
 
@@ -319,7 +333,7 @@ class LoreNode:
                 except ValueError:
                     pass
 
-        node = cls(url, **kwargs)  # type: ignore[arg-type]  # ty:ignore[invalid-argument-type]
+        node = cls(url, **kwargs)
 
         val = gitcfg.get('useragentplus')
         if isinstance(val, str) and val:

-- 
2.53.0

