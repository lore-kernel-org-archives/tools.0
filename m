Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F7C39A075
	for <tools@linux.kernel.org>; Mon, 13 Apr 2026 22:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776118114; cv=none; b=cBIRIWYs7M3nAsiXD9BDhSssmrpmUHqpzCeSaAEbs43wMM+HKtMUHYmFH+PuyJaOikpcfAYTQ46tXq2F0Vm4Hccgyvapz8VEF7xL16E+RJrBWBRtNbJCeP3DOy6j4FZ9y8w4DR5ofN3i0bM678hKVNnXWwVTuRr4l364+ZPqzyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776118114; c=relaxed/simple;
	bh=uQfeV9y79y6wvsMMFoo9/CTmCUhbdtVRAK98YxUitFk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dYn2CO+x5nSESiCpTiJGnc01olUGl5OwIwt82YgLIqxWCo4fskGshUHWaOhF29eu4jdRW46BG2hf6jIqsRIKm+U0d0kQ/+ExroVEx17tuOZoVNIM6WKj0oBwsrgFtqGfZ9ax5dPiwNg0SWowr8WvMeddQMUY3tJKVTJP6gasVYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=emHUkL6/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="emHUkL6/"
Received: by smtp.kernel.org (Postfix)
	id 97B1BC2BCB3; Mon, 13 Apr 2026 22:08:33 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CD711C2BCB7
	for <tools@kernel.org>; Mon, 13 Apr 2026 22:08:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CD711C2BCB7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8d68f702851so780783485a.0
        for <tools@kernel.org>; Mon, 13 Apr 2026 15:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776118112; x=1776722912; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xs03g/qfKTgU8RRBhgHTIqECyPqSkX7dgHQpEM0zL9Q=;
        b=emHUkL6/0Dxbn+OuC5Sr2kuoeh6uXwnjiCbbo8shQ3J8U3KwXJlFi6OZ0cbl+zsXbU
         iwd5Sqvm2tuMokq/SOmcHHLpy5XYyvn6EBIiqgtCeQh7Pa1i5Or+R8NfcwYckc2NMo3O
         hZy2FCHzRMbLKOdHqvtiUAH1tPrlNBNPbyLJdHMkHITyr6aR85M7seqWgse+Cfz6Q5k0
         AxdbWeR4xFEpfL3u9om7hEZgDxQOiG4Xt3tgymOWm9gCA8x7FODeArbItZA7Kyn5IRIB
         /F8P3f1eUBR1k0QJlBhbbBZ/0l5xLdObZtz93KY6+EDP+653yvzvMEPAoYfOxHvL5RQt
         dEzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776118112; x=1776722912;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xs03g/qfKTgU8RRBhgHTIqECyPqSkX7dgHQpEM0zL9Q=;
        b=BK4FrUXyvfuGBOvmzDDB3xzCZKV+oZ46XDrTLS9fYJ9XBJx+jtqTjL07KI0BDJeZIP
         zfhZFdOEFavnBqIRtf+4ckqFOm5WmhvBUjS1Mfj6ST73r/qHIkwZejYI4/YG6r1wfY2P
         XVFLG71XsoENRQgLwOfp6WM1zI1CrrYfxlGxJm/8Gbl7Cp8FfyWpv43NKCWrm8chywI6
         t+dzeZIIg8+2nBgxSk+ZjyJH8ftV3kDRgs4j4j2sIAx3EYSr7KoHj2uoWEnsE+gThSGD
         3OpZRz6ixz0fOT6gI6zxghA9zG2QHP/L44yQGRTnnv+mM9gD8wJCPac9zpN1oZ+I+P7l
         g2Mg==
X-Gm-Message-State: AOJu0Yye0bcHQY9d5Gw/ERTSK/WX1VtAQW2rm+DZhin4bANzcPFaFMHB
	QcqBUsifFtfgO9tD8v7LuLper/+W0azRgC/1wo73969TxJ2Fnnwn3Bm1
X-Gm-Gg: AeBDievbOq8Z4nYVFRu1tPC+LgOCd2C0HggvGsIdAQ7v+DtdoxeJYBMmesJ017csFzU
	qYYxuj+VD+iwFXDLYNOuNinP5Tt3+gzLActIi/e9m4TeNHsnHo6i7Rmle5KFQxJG6pJWbi8sDVL
	KQnSFC8fGT/UhaNBDwX/Z73juaIkWaaME2BH4abe6gzZgQxl0QJyaT9ieDBLGgtXScP76Tvwk8J
	Viw7wMzbKwhZQAzeX4dc0LL3luPIjC8D6PcmXEQXYdPo2GdOVyaBbSR4syK0kydt6hQ4Tm00j/6
	IDkXwav75tPPTiM7mTtL+prJR04PZAwMgYP331kJTXsFu/bplX9JE4xKpcodQaH2H6hvevZBraj
	sJie6vp4cG6B8NzTzwlQkmRjnMIdUNtpkVdVwVdNfHCYvCFF85MeOkUGZj5ngMVdNaLd3Xkwikl
	FBbc8bhNwD70qvjJZb5FsqfOaLNBYTYSnmN3Z7HpjVRbYU/D2l5lbIOim4uLxCNl58prEGKduF4
	6YRk12326k2J8wzIRQhqNejuSKHB2skBmsMmKwBc5cwzpdVLC+Uqm1Una0m6/ZgQn4YynpsfoOo
	XPt7JPQxalpJ1iW4TIXvww2UAiscWvzE89IKULC/9d2gsTDBmSAJhKqNt3iEsO4y
X-Received: by 2002:a05:620a:4489:b0:8b2:e666:70d with SMTP id af79cd13be357-8ddcf7ae416mr2173951385a.43.1776118111787;
        Mon, 13 Apr 2026 15:08:31 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2600:4808:6353:5c00:c007:ed8:60aa:a884])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ddb8d6e387sm907506185a.30.2026.04.13.15.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 15:08:31 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 13 Apr 2026 18:08:23 -0400
Subject: [PATCH v2 09/14] Type from_git_config keyword arguments
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-harden-type-checking-v2-9-1ba6056288d9@gmail.com>
References: <20260413-harden-type-checking-v2-0-1ba6056288d9@gmail.com>
In-Reply-To: <20260413-harden-type-checking-v2-0-1ba6056288d9@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1776118098; l=2148;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=uQfeV9y79y6wvsMMFoo9/CTmCUhbdtVRAK98YxUitFk=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QNHllwT3/n0zaPSR8OLQKm8rgCHSEtad9ZWdXjRrIpvdr0rxKQGh2Klrosx0FtVoTyWSGVqwiRm
 ik3PXzY10ug4=
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
index 1b0463e..f9817c1 100644
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
+    cache_dir: str | None
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

