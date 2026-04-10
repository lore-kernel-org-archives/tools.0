Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4A53A6F19
	for <tools@linux.kernel.org>; Fri, 10 Apr 2026 22:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775860683; cv=none; b=QPm7jR664bP8ZTL7TIO7gEQ563kGSZKfECoHPi78BI7D4DUuiNY6rhdSXdf+xaXduLE+MD18IDdU0SaAdxwjbCDoNW8MC9X5gMaZq6g6CwvWCTtwF6sXZ17fiWoQEofAY6Qzz5UssdeKA9g0Z+0eNs3KCYTSazOkeVBUvXauonA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775860683; c=relaxed/simple;
	bh=dDOWVhDYPw6fLeKLBANRFLAb9Xr2Ai1nvom50C8Gey8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VCKMRw/2rZ2Ja4jbVVREbYogFl70JbQl4n0d0Uq3uf0jKBCq2s5s17NkxxfxFmkUviVIducmLlAAmhR+xdI+oomOmqiTdleNwPd7LJejb6TwUE5kO/HB5f5S1IOgiGVolaik/58C7aBXLfWpahTIKrfq9JR5Q1hjEgUEFazfQLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fvngd9cO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fvngd9cO"
Received: by smtp.kernel.org (Postfix)
	id 31E88C2BC87; Fri, 10 Apr 2026 22:38:03 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3FC25C19421
	for <tools@kernel.org>; Fri, 10 Apr 2026 22:38:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3FC25C19421
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8d424af6282so283264785a.0
        for <tools@kernel.org>; Fri, 10 Apr 2026 15:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775860681; x=1776465481; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7qpjZGkrdmRj8MckvU+OxbiFiXKkY+U14b9XTlwLpWk=;
        b=Fvngd9cO2wOMxzOlx2iGoXaeRQNZh659Ci1PGRt20UoAXAFzttUGQ9tyGNRizLXLcV
         ehS1Mx8xyB2mku6fxjSA/+os+rrGIDZS9gtYoy0mbol/WgVu/70aKmmKMDNzAZZniHOB
         dnwPvFHJPKDAuiUYmJJFak//3UUf8XrU9pogRlHs/Xd3JBhrR2VSEQGchVFZqP6i8yXB
         bc2mWS4uQWl8J8W8FiVEIeAFvuB5C6yUWT7eSmH5uK4a68HYmeJHsRO/Y3NrONM74i/B
         38qWW/NLokWprWaZ4cajQ6r7CDhXsM1uw99RuW8bAYXusi21ffBvej/R4TTL9bxBCxVa
         5IEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775860681; x=1776465481;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7qpjZGkrdmRj8MckvU+OxbiFiXKkY+U14b9XTlwLpWk=;
        b=lkz7PLv7GUKCvJZN6juWDrCmL/GnkWND3tpzrmb5phfyflTvvSWJTDRQmKMlAzDcjk
         s6oMSX2ORmhMWb5+LTdYyeuEtz07T+rlRImyOS5nhvVdcfR4GgiS1PWNHx3WtRqgcVMR
         +sdqmDlEqVjK5EaK3OoMhEUPCPmw5vcy2+e47iR8yN6zFuaQ2NmN4ZuWvF+wVULLFg/U
         n1osuGKfr62NMdy5oIIrhpfw2qFDajpD+WrA0OtTnsJAtksmpILiRlRkkoQuJaznzRO8
         H3Y4G1fLiKt1AnHAdi+b+WRD3wWCqR+Zw2NxIuQNtJCAIBAg3OuPW4Dha0h4PbJVf6jV
         8AFw==
X-Gm-Message-State: AOJu0YyhJbxLH4lGfktRYGbhofj7hnX9aHtzX7/45f/l65XVXAr4I3lQ
	utByMPoSzJGQNY/NGtc5edHHlPoeOmrTbBlV5o9wSZMHN/RxEfvWDdzj
X-Gm-Gg: AeBDievRwhf2MNVj59u2otDWgdb7QeWo/a5ghMwE4RymmojtRrhx7OSUEnbTF/mIl+s
	AYiKglchokR+628Fkd0ZKfJrpJjkSF9lWZeHCo/nnD82XxDZgfPF9HP64VKVgm7YX9wT2FrGHQf
	JDDCNZMD0hFoEQsC7jAMzwjC16ZBtVwVtqXx+NFI8Y/sHd3WxETfPeoo989SKVTR9QHuT2vW37D
	/LI5ejPBlc68JNkZ31rf+4BnEtvMVSNKr6o5Unqf2ja7LWZvTTw4X/7ePxY0f9CCUq89Pgh9tSX
	nL9lE8VG1kdc0wcCJ3sPwu6M9dKYx2lXKApGqLUUnnVFT/gRwJjnKg762IgGeYpyEsdS+3g3fT8
	GVjMF0QzirEsMwDGR7PtqqU7NOv7GxUfCHQjiTQXK5sdIoFz0z9o42DjoA8mWb5DIQnm7YQEmK1
	VQxhrjjE8MuuFSBpJ0KJsbXGF4f6tPWX9lJAG+ou1PvOt5nhvqQJkLGxq3c+pwLDcqsij2cMvNI
	bs7/uGjoYd9zTB8oVvLDVVS1GZngTSPcPL/KAB4TpwbHzaFosABc23ct0m5fK9KpCxnGt+zaOzT
	WiZVsipTXuAsC1LI5cdUXZxuNz8Z0p6sysv2F3CXY5TVkQwSiPtl
X-Received: by 2002:a0c:e004:0:b0:89c:4f7f:8479 with SMTP id 6a1803df08f44-8ac861562e2mr68741086d6.6.1775860681128;
        Fri, 10 Apr 2026 15:38:01 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([208.80.35.36])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ac849db735sm41370096d6.2.2026.04.10.15.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 15:38:00 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 10 Apr 2026 18:37:56 -0400
Subject: [PATCH 05/14] Add pyright strict checks to CI
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-harden-type-checking-v1-5-fcf314d9d748@gmail.com>
References: <20260410-harden-type-checking-v1-0-fcf314d9d748@gmail.com>
In-Reply-To: <20260410-harden-type-checking-v1-0-fcf314d9d748@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1775860674; l=3971;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=dDOWVhDYPw6fLeKLBANRFLAb9Xr2Ai1nvom50C8Gey8=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QH5YsSHF1sEW3fiGzsQiyvii+UmPP/LiD8b8oLx5NsZ7NneV+xruGQQdFWBThlSRGPl3PITRiyu
 VwAuZFaIEwwU=
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
 pyproject.toml       | 11 ++++++++---
 src/liblore/node.py  |  2 +-
 tests/test_node.py   | 11 ++++++++---
 tools/b4-ci-check.py |  6 ++++++
 4 files changed, 23 insertions(+), 7 deletions(-)

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
diff --git a/tools/b4-ci-check.py b/tools/b4-ci-check.py
index 563e018..5690cd9 100644
--- a/tools/b4-ci-check.py
+++ b/tools/b4-ci-check.py
@@ -73,6 +73,12 @@ def main() -> None:
             pass_summary='mypy passed',
             run=mypy.api.run,
         ),
+        Check(
+            tool='pyright',
+            args=[],
+            pass_summary='pyright passed',
+            run=run_subprocess('pyright'),
+        ),
         Check(
             tool='pytest',
             args=['--durations=0'],

-- 
2.53.0

