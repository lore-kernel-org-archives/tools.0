Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546FD399364
	for <tools@linux.kernel.org>; Mon, 13 Apr 2026 22:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776118109; cv=none; b=QY9jYFAMnvIZt5rM2Bt+XVrexucTHNKUIZO5vqfr4r4FLo1/aCXU6jtUlhcQGHAG/aN3qYSVcNqRtJN4UYaHxHY8sRzmrgiUNoLN7wsApw1Vl3RKsYTlrQmuZD53KjwmxGnAmm9EpKmoJQdal+PEJAnwv6cq/qmlJIX2xhZlM3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776118109; c=relaxed/simple;
	bh=YfM8YwhY9EYmg8kY/OFWxeLoSLrHslmFYRisFzdofWg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S3YSw+efaX4EjUarS4iAGVnelk0BnfZdpF4WLHQBfRQuuEwe0kUUysXKlqZCVHIIPSMttPkKTSB0SVUgxLLzkP/kDTdGvlv5JvEiyVzBHUmq0eeCpDXkK8HmW1DsSFbjWVOM9+dMSB3GTxJmjqeX5HkSo6hfnQ+lUYk7kaOJ/SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EvrBt9ky; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EvrBt9ky"
Received: by smtp.kernel.org (Postfix)
	id 10186C2BCB3; Mon, 13 Apr 2026 22:08:29 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 34CB5C2BCAF
	for <tools@kernel.org>; Mon, 13 Apr 2026 22:08:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 34CB5C2BCAF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8cb20bcff5aso455529185a.3
        for <tools@kernel.org>; Mon, 13 Apr 2026 15:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776118107; x=1776722907; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4GNM6ll6B08XrLVUyj5VpTLYMdHh2nsWvCQp/zOH9x4=;
        b=EvrBt9kyVTp4cXvq1rCuRaR4z2b84pajyWlEDOBSShZCvH88aR4kSGhkY1pKq8iaMn
         LDN7ALrh8PFzN7+iYrXVwyQJ9dRAx+pagEx0lm3kijZEdbUYZrUrpYfTGSe3JLhlHfOf
         nOqqIjP48DIQYYG1DoIIAOkzNnKqy0hxWmWoQ26ye7SL7iNHfw97WQa9wZEaLpzqqPgw
         y02OtA5RSdOLx16IU1xa35yDPAy/I22ZLgUoBZ9+yFN3zkxkzK1vU+MRDt8eLovu0mX/
         yMA/qeArnoz8C25Vhm2HK37R+gITHWcp0eiFRY3rCu9vIEWoxldLMTP1Z7I95NpKzbmM
         1KdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776118107; x=1776722907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4GNM6ll6B08XrLVUyj5VpTLYMdHh2nsWvCQp/zOH9x4=;
        b=G3eRhajtt4JxgAvLXlJCUx9KBoicKKSfQNsA6qim7RNA4Mxb470+ASQErOvT6mZbpA
         Vno/vECuEXYWNTTr4q+2reu9RslhcEWUwiVg0cHRTLFb+33vVbrCjG7kIRASvqp6p4Ub
         LrqIVdq/0V0Zch6uS4gWjGIBbwMZfmbmISyLsZ1WwukH79LFjiYWsnjHxD2r6Yz7un3R
         wn0mMmxJ+2kqWzND+5xd8wV53V58oiD/gVUmMEycYWE5gwZDTK6+Vg24yIvu7B6f6KzT
         PhoAGKUQj+MJ+nOGmyDznV5V+4n+6AAVkYbFZIBLu7UKwzK/Aaixf8EEFUN4WeQI71NO
         bDZw==
X-Gm-Message-State: AOJu0YyHkax196IEaEwQ21aweQiJhd2Bhr060FJsS9Gvwsz1C05uxKJt
	BMTemXWUZjVddZUe0g0R0CW8cUfcRqWeCGgRjjzEJYs6MBYHEDb498Df8Hw1QQ==
X-Gm-Gg: AeBDieukdmjQBBWkSML4w8yR2N+FyYr8R9piVU6g6WDujoBmH3+BQqEw3RcwMNTi6QO
	pLVZVWnBu3JYm6zIuxhom2lXEShcvkj0wvCa/BdThYn9k+h8lTDowJ8EY6hthAfBkLXTEwkjSZe
	hVUoCRITSG3lowFLSmmTicX2IR9BTVDu92fO9UB+lkkgxcrMQQLhBYj6tBlxZt4et2/qQi794X8
	LL1zRGHLcKJZRg1H/Ev4Hx7GinfunVSLCzw58DH1/cj+3oxp4YJ92QEmWS3zfUOBkCqUxTaAuBn
	QgUA5YUr76lOIfd0HYS5fYXj05cz2QkN7zj+SzIQcJla2JVbi5tRiuua7wy0TJfUgDC1qWIzQYO
	PH1ixHu0kFA88qyUtJJKP/XbXJ1MhHnFjsif5ShyAgC4gNuMvKqdA4pogtFlBFjFJkXUXpYI6PH
	lHbPxXwApn7p3Mkk//isW7bEI1focS+ig/SdUmzGIBZt4Qtto0wkbU9VJZfKERpwjKup0KBbzh5
	4l4fz7fyXKGRzJFQVt5UQD1JUCAcHxdU84puZxSbzrDFE3sOYjHY4OPwj0hwtAdTV+X3PrB9myg
	UQqOHpAS93X9WDu1p+GhRyV2/mnlHF9IvSrEBa4cSr3swwPTxP0o8MAQTwZSLmKf
X-Received: by 2002:a05:620a:4109:b0:8cd:9322:d446 with SMTP id af79cd13be357-8ddcd8f6d2cmr2256973885a.22.1776118107080;
        Mon, 13 Apr 2026 15:08:27 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2600:4808:6353:5c00:c007:ed8:60aa:a884])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ddb8d6e387sm907506185a.30.2026.04.13.15.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 15:08:26 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 13 Apr 2026 18:08:19 -0400
Subject: [PATCH v2 05/14] Add pyright strict checks to CI
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-harden-type-checking-v2-5-1ba6056288d9@gmail.com>
References: <20260413-harden-type-checking-v2-0-1ba6056288d9@gmail.com>
In-Reply-To: <20260413-harden-type-checking-v2-0-1ba6056288d9@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1776118098; l=3655;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=YfM8YwhY9EYmg8kY/OFWxeLoSLrHslmFYRisFzdofWg=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QFtJT0YhMnzrhkEDsnRIRRPaXj17wlRTvC/hh+bNjpsnriBmiFGA2LGh7clUx8HSjceWuqYptXE
 hAlmN1+ZuLAM=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

Configure pyright in strict mode and run it from the b4 CI checker.

Allow private-usage checks to be disabled only for tests via a pyright
execution environment override, and silence missing type stubs for the
optional authheaders dependency.

Add a small number of casts in tests to satisfy pyright. These casts
should be removed in a follow-up commit by tightening the mocked types
further.
---
 ci.sh               |  1 +
 pyproject.toml      | 11 ++++++++---
 src/liblore/node.py |  2 +-
 tests/test_node.py  | 11 ++++++++---
 4 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/ci.sh b/ci.sh
index ec0baf8..4b07fa2 100755
--- a/ci.sh
+++ b/ci.sh
@@ -5,4 +5,5 @@ set -eu
 uv run ruff format --check
 uv run ruff check
 uv run mypy .
+uv run pyright
 uv run pytest --durations=0
diff --git a/pyproject.toml b/pyproject.toml
index 9bfadbe..7a96d23 100644
--- a/pyproject.toml
+++ b/pyproject.toml
@@ -39,6 +39,7 @@ Repository = "https://git.kernel.org/pub/scm/utils/liblore/liblore.git"
 dev = [
     "build",
     "mypy",
+    "pyright",
     "pytest",
     "pytest-asyncio",
     "ruff",
@@ -53,9 +54,13 @@ asyncio_default_fixture_loop_scope = "function"
 [tool.mypy]
 strict = true
 
-[[tool.mypy.overrides]]
-module = "authheaders"
-ignore_missing_imports = true
+[tool.pyright]
+typeCheckingMode = "strict"
+
+executionEnvironments = [
+    # We're testing private APIs quite a bit.
+    { root = "tests", reportPrivateUsage = false },
+]
 
 [tool.ruff.lint]
 extend-select = ["I"]
diff --git a/src/liblore/node.py b/src/liblore/node.py
index 503428b..095ba4f 100644
--- a/src/liblore/node.py
+++ b/src/liblore/node.py
@@ -195,7 +195,7 @@ class LoreNode:
         self._authheaders: types.ModuleType | None = None
         if add_auth_headers:
             try:
-                import authheaders
+                import authheaders  # type: ignore[import-untyped]
 
                 self._authheaders = authheaders
             except ImportError:
diff --git a/tests/test_node.py b/tests/test_node.py
index 8f4ccac..af140db 100644
--- a/tests/test_node.py
+++ b/tests/test_node.py
@@ -7,6 +7,7 @@ import gzip
 import os
 from datetime import datetime, timezone
 from email.message import EmailMessage
+from typing import cast
 from unittest.mock import MagicMock, call, patch
 
 import pytest
@@ -25,7 +26,9 @@ class TestSessionManagement:
         node = LoreNode()
         s = node._get_session()
         assert s is not None
-        assert 'liblore/' in s.headers['User-Agent']
+        user_agent = s.headers['User-Agent']
+        assert isinstance(user_agent, str)
+        assert 'liblore/' in user_agent
         node.close()
 
     def test_returns_same_session(self) -> None:
@@ -74,7 +77,9 @@ class TestSessionManagement:
     def test_default_no_plus(self) -> None:
         node = LoreNode()
         s = node._get_session()
-        assert '+' not in s.headers['User-Agent']
+        user_agent = s.headers['User-Agent']
+        assert isinstance(user_agent, str)
+        assert '+' not in user_agent
         node.close()
 
     def test_set_requests_session(self) -> None:
@@ -1008,7 +1013,7 @@ class TestProbeOrigins:
         def fake_head(url: str, **kwargs: object) -> MagicMock:
             headers = kwargs.get('headers', {})
             assert isinstance(headers, dict)
-            captured_headers.append(headers)
+            captured_headers.append(cast(dict[str, str], headers))
             resp = MagicMock()
             resp.status_code = 200
             return resp

-- 
2.53.0

