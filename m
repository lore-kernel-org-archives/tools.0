Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9293A6F19
	for <tools@linux.kernel.org>; Fri, 10 Apr 2026 22:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775860689; cv=none; b=pJlENutByae3LIrYs7FgRIzRgbyg0v0FcteeYFtMFwnkaz5WGqy4U2bD10T0KLFscSw+IB6ZerOQxEdOPANP6EosQ3m9+oBA6DNUZCW6Hctpg+VMmYN6mMj7CSz0V3HjQ72tPcwSJyefVCI8e6vWOvLox7xjIXblz0kgfHxZII0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775860689; c=relaxed/simple;
	bh=M1jIVrk0RLZNGAPLoYjY/plY0pVt6z1t2aeTkRXcU14=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hP7G7fb8qKQ+/oEsrSnwx+QUt8mYv8jivImi6w3VTOa/1baISjl9eZG7AMM2rlLZSrN8EwrlLX/unoPLljQ+gLXFnlVBWS4PREDzhkzo1Ebq9N5ydRuZspwmDeL88QuckguVJL8DiKHzzIqKRNVbHxTtH+cLytk+xTzROGW9Zow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A7bh3eub; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A7bh3eub"
Received: by smtp.kernel.org (Postfix)
	id D37DEC2BCB0; Fri, 10 Apr 2026 22:38:08 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0624EC19421
	for <tools@kernel.org>; Fri, 10 Apr 2026 22:38:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0624EC19421
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8cb5c9ba82bso351659685a.2
        for <tools@kernel.org>; Fri, 10 Apr 2026 15:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775860683; x=1776465483; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r+Z3R1NzLEn3gHNHh+mEnUFAAMLrOskuoZs8rZkIpss=;
        b=A7bh3eubXr6fBRvcc3H9XO9rEGj7SGrInox8Uu58FkkZQtq3amI0YiZTC2PH9H1S0g
         8HKPOSkO3QSzAF7EdNCd/M4L+0cQYZYCQyHjf96aO0ddLzXfyqiClXXCs04L7dqHV9sT
         3wyhDwH4lXKBLp5GIhw8MkU0GhzvQHdyyniG4lQ4UJENKhd92eeywne7ZMmWP2cf2J9m
         rJCigI5impBbwLWAwjh5sLnlT9IJWzs3kxIMqE1jXByESI5w1qyNJWJ//q7vTgC53yT8
         fiM/ypXZkuwp2Pl2NJqS5LB16sHPsirL7Ok7J9lumrArEDtZdT2eGmjk29tYH2Rhvy5j
         jJhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775860683; x=1776465483;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r+Z3R1NzLEn3gHNHh+mEnUFAAMLrOskuoZs8rZkIpss=;
        b=bvfe2D23EJbsqTWe184fbkbrbv8dc3Qf0ubiAOeuV8IeLo7aCahuU3Yp9OFy5JCbOA
         oCmkf2BRDmx7jJypJZbcR7oAEsZdweyzVHRpy37B1OVQUL1sOJggbV/pqCMQNDaGZAFe
         CzCPdbWZn+dOc2rJPHJyu6WSrQLHZeQxmTd/vPIeV3CCxWGZvVm3zCO3Z3yfQOTV5zrT
         mJV5QkyNAJkihhWEKZaIORGq/pwYIUKXbJQwXTNqrhjP84H6V0Oy3N8oeexpFNmD/X2k
         6jFjMVTN4rQL0oTLWBJt/gc2VDX5HDO9LwPj1QM0gA7rEuDzvOTDR8rc6/+Vs9XGPwa1
         8wIg==
X-Gm-Message-State: AOJu0YzAFNqMVsyk4p0BD55BPhLJgQbulKyrQW9+66ignmY/gKJMiUEG
	GiOhL6gYQ6xAsiG1ANUFVPvNmx6wW51kRSPy6otT/cBQNEp8XNuqFEvu
X-Gm-Gg: AeBDietpwLj+Rid9rLapj19pg4fRDehGorP4ODtfUZ72P2nv9cTf6oSVhX539WG/ByN
	wjpMdYyxfG1YZr51IRmIVAZx/1WKVRsFlB035wNrmL88ReaPJhhJapl8jZO9xgKuWsAVmHRZJwj
	+ZUvp3K7S7AcHxLpZs5UzbajNuQ43WM8A0eLSWOQ7/FLiblXCj/jrEn/vM+s2G7xwu1s9anmzAt
	Prl/Q4uV1OjsKz+0xjbp1NvusgMxSh58tl/KdHwSaOQwl2fYsY97Gze4FZvHIrA7Q+hLqFplhqw
	4Ta+NzQqzhgKvQ5/KPVRHdeE5g0oQV/30dlAijKM0GWoRrq2R26whM6Emw0DnBNmT4irC3AKKra
	TqijkTmJVaSlokWMF+AgrjwnuP+2fg97nKgzTxIA8lXS0+i7ks4B0xZiS4dc0s4JFR6f7cCnmdU
	0pNEzCZE4Yx4BLxyhv0qxIYzS4BhXC0v/sjSRYqpttj78mPSV4h41fuf404MEJAqNkg3+zQdFR5
	gQ9b/EKvff+VuUfJ/4jhQXk1ps4qCD9qx0q+GGSfbVq193enDuaNu2SsKo2962MdhvBctLZfnDF
	H1LJWASn2fa4opIXBK41rdRC68hrwUdXp1h33GbA4Py5j53UIHBt
X-Received: by 2002:a05:6214:598a:b0:89c:e7b9:56d4 with SMTP id 6a1803df08f44-8ac8615803fmr82266996d6.9.1775860682238;
        Fri, 10 Apr 2026 15:38:02 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([208.80.35.36])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ac849db735sm41370096d6.2.2026.04.10.15.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 15:38:01 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 10 Apr 2026 18:37:57 -0400
Subject: [PATCH 06/14] Replace HTTP session mocks with responses
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260410-harden-type-checking-v1-6-fcf314d9d748@gmail.com>
References: <20260410-harden-type-checking-v1-0-fcf314d9d748@gmail.com>
In-Reply-To: <20260410-harden-type-checking-v1-0-fcf314d9d748@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1775860674; l=97602;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=M1jIVrk0RLZNGAPLoYjY/plY0pVt6z1t2aeTkRXcU14=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QNHGXdQ4Aqc+TAQKsP81inSVIt5dyIcObIagKa77g9VTpZ+W7MG0LdN+8oD/KfOGwVS7npzpy9A
 D6YpPAR0PAwI=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

Convert networking tests from patched requests sessions to responses
mocks. Each test now registers requests on a local RequestsMock so
expected HTTP traffic is declared inline.

Add an autouse responses fixture to block real network access outside
explicit mock blocks.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 pyproject.toml             |    3 +-
 tests/conftest.py          |    9 +-
 tests/test_auth_headers.py |   45 +-
 tests/test_cache.py        |  213 +++---
 tests/test_node.py         | 1708 ++++++++++++++++++++++++--------------------
 5 files changed, 1100 insertions(+), 878 deletions(-)

diff --git a/pyproject.toml b/pyproject.toml
index 7a96d23..a160edd 100644
--- a/pyproject.toml
+++ b/pyproject.toml
@@ -42,6 +42,7 @@ dev = [
     "pyright",
     "pytest",
     "pytest-asyncio",
+    "responses",
     "ruff",
     "types-requests",
 ]
@@ -63,7 +64,7 @@ executionEnvironments = [
 ]
 
 [tool.ruff.lint]
-extend-select = ["I"]
+extend-select = ["ARG", "I"]
 
 [tool.ruff.format]
 quote-style = "single"
diff --git a/tests/conftest.py b/tests/conftest.py
index 28fedaf..ea52d95 100644
--- a/tests/conftest.py
+++ b/tests/conftest.py
@@ -6,13 +6,20 @@ from __future__ import annotations
 import email.utils
 import textwrap
 from email.message import EmailMessage
-from typing import Protocol
+from typing import Iterator, Protocol
 
 import pytest
+import responses as responses_
 
 from liblore import emlpolicy
 
 
+@pytest.fixture(autouse=True)
+def _block_network() -> Iterator[None]:  # pyright: ignore[reportUnusedFunction]
+    with responses_.RequestsMock():
+        yield
+
+
 class MsgFactory(Protocol):
     def __call__(
         self,
diff --git a/tests/test_auth_headers.py b/tests/test_auth_headers.py
index 8cec624..f1c240a 100644
--- a/tests/test_auth_headers.py
+++ b/tests/test_auth_headers.py
@@ -7,9 +7,11 @@ import gzip
 import sys
 from email.message import EmailMessage
 from types import ModuleType
+from typing import Iterator
 from unittest.mock import MagicMock, patch
 
 import pytest
+import responses
 
 from liblore import LibloreError
 from liblore.node import LoreNode
@@ -122,7 +124,7 @@ class TestAuthenticateMsgs:
 
 class TestAuthInFetchMethods:
     @pytest.fixture()
-    def auth_node(self, sample_mbox: bytes) -> LoreNode:
+    def auth_node(self) -> Iterator[tuple[LoreNode, responses.RequestsMock]]:
         fake = ModuleType('authheaders')
         fake.authenticate_message = MagicMock(  # type: ignore[attr-defined]
             return_value='Authentication-Results: liblore; dkim=pass',
@@ -133,26 +135,41 @@ class TestAuthInFetchMethods:
         self._fake = fake
         self._patcher = patch.dict(sys.modules, {'authheaders': fake})
         self._patcher.start()
-
-        mock_session = MagicMock()
-        mock_resp = MagicMock()
-        mock_resp.status_code = 200
-        mock_resp.content = gzip.compress(sample_mbox)
-        mock_session.get.return_value = mock_resp
-        mock_session.post.return_value = mock_resp
-        node.set_requests_session(mock_session)
-        return node
+        with responses.RequestsMock() as rsps:
+            yield node, rsps
 
     def teardown_method(self) -> None:
         if hasattr(self, '_patcher'):
             self._patcher.stop()
 
-    def test_get_thread_by_msgid(self, auth_node: LoreNode) -> None:
-        msgs = auth_node.get_thread_by_msgid('first@example.com')
+    def test_get_thread_by_msgid(
+        self,
+        auth_node: tuple[LoreNode, responses.RequestsMock],
+        sample_mbox: bytes,
+    ) -> None:
+        node, rsps = auth_node
+        rsps.add(
+            responses.GET,
+            'https://lore.kernel.org/all/first%40example.com/t.mbox.gz',
+            body=gzip.compress(sample_mbox),
+            status=200,
+        )
+        msgs = node.get_thread_by_msgid('first@example.com')
         for msg in msgs:
             assert msg['Authentication-Results'] == 'liblore; dkim=pass'
 
-    def test_get_thread_by_query(self, auth_node: LoreNode) -> None:
-        msgs = auth_node.get_thread_by_query('test query')
+    def test_get_thread_by_query(
+        self,
+        auth_node: tuple[LoreNode, responses.RequestsMock],
+        sample_mbox: bytes,
+    ) -> None:
+        node, rsps = auth_node
+        rsps.add(
+            responses.POST,
+            'https://lore.kernel.org/all/?x=m&q=test+query',
+            body=gzip.compress(sample_mbox),
+            status=200,
+        )
+        msgs = node.get_thread_by_query('test query')
         for msg in msgs:
             assert msg['Authentication-Results'] == 'liblore; dkim=pass'
diff --git a/tests/test_cache.py b/tests/test_cache.py
index b822e7c..2313a6b 100644
--- a/tests/test_cache.py
+++ b/tests/test_cache.py
@@ -6,9 +6,9 @@ from __future__ import annotations
 import gzip
 import os
 from pathlib import Path
-from unittest.mock import MagicMock
 
 import pytest
+import responses
 
 from liblore import LoreNode, RemoteError
 
@@ -121,109 +121,154 @@ class TestProperties:
 class TestCachedMethods:
     """Integration tests: verify cache hit avoids network, cache miss hits network."""
 
-    def _make_node(
-        self, tmp_path: Path, sample_mbox: bytes
-    ) -> tuple[LoreNode, MagicMock]:
+    def _make_node(self, tmp_path: Path, _sample_mbox: bytes) -> LoreNode:
         node = LoreNode(
             'https://lore.kernel.org/all', cache_dir=str(tmp_path), cache_ttl=60
         )
-        mock_session = MagicMock()
-        mock_resp = MagicMock()
-        mock_resp.status_code = 200
-        mock_resp.content = gzip.compress(sample_mbox)
-        mock_session.get.return_value = mock_resp
-        mock_session.post.return_value = mock_resp
-        node.set_requests_session(mock_session)
-        return node, mock_session
+        return node
 
     def test_get_mbox_by_msgid_caches(self, tmp_path: Path, sample_mbox: bytes) -> None:
-        node, mock_session = self._make_node(tmp_path, sample_mbox)
-        result1 = node.get_mbox_by_msgid('test@example.com')
-        result2 = node.get_mbox_by_msgid('test@example.com')
-        assert result1 == result2 == sample_mbox
-        # Network should only be hit once
-        assert mock_session.get.call_count == 1
+        with responses.RequestsMock() as rsps:
+            node = self._make_node(tmp_path, sample_mbox)
+            rsps.add(
+                responses.GET,
+                'https://lore.kernel.org/all/test%40example.com/t.mbox.gz',
+                body=gzip.compress(sample_mbox),
+                status=200,
+            )
+            result1 = node.get_mbox_by_msgid('test@example.com')
+            result2 = node.get_mbox_by_msgid('test@example.com')
+            assert result1 == result2 == sample_mbox
+            # Network should only be hit once
+            assert len(rsps.calls) == 1
 
     def test_get_mbox_by_query_caches(self, tmp_path: Path, sample_mbox: bytes) -> None:
-        node, mock_session = self._make_node(tmp_path, sample_mbox)
-        result1 = node.get_mbox_by_query('test query')
-        result2 = node.get_mbox_by_query('test query')
-        assert result1 == result2 == sample_mbox
-        assert mock_session.post.call_count == 1
+        with responses.RequestsMock() as rsps:
+            node = self._make_node(tmp_path, sample_mbox)
+            rsps.add(
+                responses.POST,
+                'https://lore.kernel.org/all/?x=m&q=test+query',
+                body=gzip.compress(sample_mbox),
+                status=200,
+            )
+            result1 = node.get_mbox_by_query('test query')
+            result2 = node.get_mbox_by_query('test query')
+            assert result1 == result2 == sample_mbox
+            assert len(rsps.calls) == 1
 
     def test_get_mbox_by_query_full_threads_separate_key(
         self, tmp_path: Path, sample_mbox: bytes
     ) -> None:
-        node, mock_session = self._make_node(tmp_path, sample_mbox)
-        node.get_mbox_by_query('test', full_threads=False)
-        node.get_mbox_by_query('test', full_threads=True)
-        # Different full_threads values = different cache keys = two network calls
-        assert mock_session.post.call_count == 2
+        with responses.RequestsMock() as rsps:
+            node = self._make_node(tmp_path, sample_mbox)
+            rsps.add(
+                responses.POST,
+                'https://lore.kernel.org/all/?x=m&q=test',
+                body=gzip.compress(sample_mbox),
+                status=200,
+            )
+            rsps.add(
+                responses.POST,
+                'https://lore.kernel.org/all/?x=m&t=1&q=test',
+                body=gzip.compress(sample_mbox),
+                status=200,
+            )
+            node.get_mbox_by_query('test', full_threads=False)
+            node.get_mbox_by_query('test', full_threads=True)
+            # Different full_threads values = different cache keys = two network calls
+            assert len(rsps.calls) == 2
 
     def test_get_message_by_msgid_caches(self, tmp_path: Path) -> None:
-        node = LoreNode(
-            'https://lore.kernel.org/all', cache_dir=str(tmp_path), cache_ttl=60
-        )
-        mock_session = MagicMock()
-        mock_resp = MagicMock()
-        mock_resp.status_code = 200
-        mock_resp.content = b'raw email bytes'
-        mock_resp.raise_for_status = MagicMock()
-        mock_session.get.return_value = mock_resp
-        node.set_requests_session(mock_session)
-
-        result1 = node.get_message_by_msgid('test@example.com')
-        result2 = node.get_message_by_msgid('test@example.com')
-        assert result1 == result2 == b'raw email bytes'
-        assert mock_session.get.call_count == 1
+        with responses.RequestsMock() as rsps:
+            node = LoreNode(
+                'https://lore.kernel.org/all', cache_dir=str(tmp_path), cache_ttl=60
+            )
+            rsps.add(
+                responses.GET,
+                'https://lore.kernel.org/all/test%40example.com/raw',
+                body=b'raw email bytes',
+                status=200,
+            )
+
+            result1 = node.get_message_by_msgid('test@example.com')
+            result2 = node.get_message_by_msgid('test@example.com')
+            assert result1 == result2 == b'raw email bytes'
+            assert len(rsps.calls) == 1
 
     def test_cache_expired_refetches(self, tmp_path: Path, sample_mbox: bytes) -> None:
-        node, mock_session = self._make_node(tmp_path, sample_mbox)
-        node._cache_ttl = 1
-        node.get_mbox_by_msgid('test@example.com')
-        assert mock_session.get.call_count == 1
-        # Backdate the cache file
-        for f in tmp_path.glob('*.lore.cache'):
-            os.utime(f, (0, 0))
-        node.get_mbox_by_msgid('test@example.com')
-        assert mock_session.get.call_count == 2
+        with responses.RequestsMock() as rsps:
+            node = self._make_node(tmp_path, sample_mbox)
+            rsps.add(
+                responses.GET,
+                'https://lore.kernel.org/all/test%40example.com/t.mbox.gz',
+                body=gzip.compress(sample_mbox),
+                status=200,
+            )
+            rsps.add(
+                responses.GET,
+                'https://lore.kernel.org/all/test%40example.com/t.mbox.gz',
+                body=gzip.compress(sample_mbox),
+                status=200,
+            )
+            node._cache_ttl = 1
+            node.get_mbox_by_msgid('test@example.com')
+            assert len(rsps.calls) == 1
+            # Backdate the cache file
+            for f in tmp_path.glob('*.lore.cache'):
+                os.utime(f, (0, 0))
+            node.get_mbox_by_msgid('test@example.com')
+            assert len(rsps.calls) == 2
 
     def test_no_cache_no_files(self, tmp_path: Path, sample_mbox: bytes) -> None:
-        """When cache_dir is None, no files are written."""
-        node = LoreNode('https://lore.kernel.org/all')
-        mock_session = MagicMock()
-        mock_resp = MagicMock()
-        mock_resp.status_code = 200
-        mock_resp.content = gzip.compress(sample_mbox)
-        mock_session.get.return_value = mock_resp
-        node.set_requests_session(mock_session)
-
-        node.get_mbox_by_msgid('test@example.com')
-        # tmp_path should be empty since we didn't set cache_dir to it
-        assert list(tmp_path.iterdir()) == []
+        with responses.RequestsMock() as rsps:
+            """When cache_dir is None, no files are written."""
+            node = LoreNode('https://lore.kernel.org/all')
+            rsps.add(
+                responses.GET,
+                'https://lore.kernel.org/all/test%40example.com/t.mbox.gz',
+                body=gzip.compress(sample_mbox),
+                status=200,
+            )
+
+            node.get_mbox_by_msgid('test@example.com')
+            # tmp_path should be empty since we didn't set cache_dir to it
+            assert list(tmp_path.iterdir()) == []
 
     def test_fetch_thread_since_not_cached(
         self, tmp_path: Path, sample_mbox: bytes
     ) -> None:
-        """_fetch_thread_since should NOT be cached."""
-        node, mock_session = self._make_node(tmp_path, sample_mbox)
-        node._fetch_thread_since('test@example.com', 'dt:20240101..')
-        node._fetch_thread_since('test@example.com', 'dt:20240101..')
-        # Both calls should hit the network
-        assert mock_session.post.call_count == 2
+        with responses.RequestsMock() as rsps:
+            """_fetch_thread_since should NOT be cached."""
+            node = self._make_node(tmp_path, sample_mbox)
+            rsps.add(
+                responses.POST,
+                'https://lore.kernel.org/all/test%40example.com/?x=m&q=dt%3A20240101..',
+                body=gzip.compress(sample_mbox),
+                status=200,
+            )
+            node._fetch_thread_since('test@example.com', 'dt:20240101..')
+            node._fetch_thread_since('test@example.com', 'dt:20240101..')
+            # Both calls should hit the network
+            assert len(rsps.calls) == 2
 
     def test_error_not_cached(self, tmp_path: Path) -> None:
-        """Network errors should not be cached."""
-        node = LoreNode(
-            'https://lore.kernel.org/all', cache_dir=str(tmp_path), cache_ttl=60
-        )
-        mock_session = MagicMock()
-        mock_resp = MagicMock()
-        mock_resp.status_code = 404
-        mock_session.get.return_value = mock_resp
-        node.set_requests_session(mock_session)
-
-        with pytest.raises(RemoteError):
-            node.get_mbox_by_msgid('bad@example.com')
-        # No cache file should be written
-        assert list(tmp_path.glob('*.lore.cache')) == []
+        with responses.RequestsMock() as rsps:
+            """Network errors should not be cached."""
+            node = LoreNode(
+                'https://lore.kernel.org/all', cache_dir=str(tmp_path), cache_ttl=60
+            )
+            rsps.add(
+                responses.GET,
+                'https://lore.kernel.org/all/bad%40example.com/t.mbox.gz',
+                status=404,
+            )
+            rsps.add(
+                responses.HEAD,
+                'https://lore.kernel.org/bad%40example.com/',
+                status=404,
+            )
+
+            with pytest.raises(RemoteError):
+                node.get_mbox_by_msgid('bad@example.com')
+            # No cache file should be written
+            assert list(tmp_path.glob('*.lore.cache')) == []
diff --git a/tests/test_node.py b/tests/test_node.py
index af140db..fc94d9f 100644
--- a/tests/test_node.py
+++ b/tests/test_node.py
@@ -7,15 +7,22 @@ import gzip
 import os
 from datetime import datetime, timezone
 from email.message import EmailMessage
-from typing import cast
 from unittest.mock import MagicMock, call, patch
 
 import pytest
 import requests
+import responses
 
 from liblore import RemoteError
 from liblore.node import LoreNode
 
+
+def request_url(rsps: responses.RequestsMock, index: int) -> str:
+    url = rsps.calls[index].request.url
+    assert url is not None
+    return url
+
+
 # =====================================================================
 # Session management
 # =====================================================================
@@ -125,345 +132,367 @@ class TestSessionManagement:
 
 class TestGetMboxByMsgid:
     def test_returns_raw_bytes(self, sample_mbox: bytes) -> None:
-        node = LoreNode('https://lore.kernel.org/all')
-        mock_session = MagicMock()
-        mock_resp = MagicMock()
-        mock_resp.status_code = 200
-        mock_resp.content = gzip.compress(sample_mbox)
-        mock_session.get.return_value = mock_resp
-        node.set_requests_session(mock_session)
+        with responses.RequestsMock() as rsps:
+            node = LoreNode('https://lore.kernel.org/all')
+            rsps.add(
+                responses.GET,
+                'https://lore.kernel.org/all/first%40example.com/t.mbox.gz',
+                body=gzip.compress(sample_mbox),
+                status=200,
+            )
 
-        result = node.get_mbox_by_msgid('first@example.com')
-        assert result == sample_mbox
+            result = node.get_mbox_by_msgid('first@example.com')
+            assert result == sample_mbox
 
     def test_http_error(self) -> None:
-        node = LoreNode('https://lore.kernel.org/all')
-        mock_session = MagicMock()
-        mock_resp = MagicMock()
-        mock_resp.status_code = 500
-        mock_session.get.return_value = mock_resp
-        node.set_requests_session(mock_session)
+        with responses.RequestsMock() as rsps:
+            node = LoreNode('https://lore.kernel.org/all')
+            rsps.add(
+                responses.GET,
+                'https://lore.kernel.org/all/test%40x.com/t.mbox.gz',
+                status=500,
+            )
 
-        with pytest.raises(RemoteError, match='Server returned an error'):
-            node.get_mbox_by_msgid('test@x.com')
+            with pytest.raises(RemoteError, match='Server returned an error'):
+                node.get_mbox_by_msgid('test@x.com')
 
     def test_404_falls_back_to_head_redirect(self, sample_mbox: bytes) -> None:
-        """On 404, try HEAD against the bare origin to discover the list path."""
-        node = LoreNode('https://lore.kernel.org/all')
-        mock_session = MagicMock()
-
-        # First GET returns 404
-        mock_404 = MagicMock()
-        mock_404.status_code = 404
-
-        # HEAD follows redirect and succeeds
-        mock_head = MagicMock()
-        mock_head.status_code = 200
-        mock_head.url = 'https://lore.kernel.org/tools/test%40example.com/'
-
-        # Second GET (to resolved URL) succeeds
-        mock_200 = MagicMock()
-        mock_200.status_code = 200
-        mock_200.content = gzip.compress(sample_mbox)
-
-        mock_session.get.side_effect = [mock_404, mock_200]
-        mock_session.head.return_value = mock_head
-        node.set_requests_session(mock_session)
+        with responses.RequestsMock() as rsps:
+            """On 404, try HEAD against the bare origin to discover the list path."""
+            node = LoreNode('https://lore.kernel.org/all')
+            # First GET returns 404
+            rsps.add(
+                responses.GET,
+                'https://lore.kernel.org/all/test%40example.com/t.mbox.gz',
+                status=404,
+            )
+            # HEAD follows redirect and succeeds
+            rsps.add(
+                responses.HEAD,
+                'https://lore.kernel.org/test%40example.com/',
+                status=302,
+                headers={
+                    'Location': 'https://lore.kernel.org/tools/test%40example.com/'
+                },
+            )
+            rsps.add(
+                responses.HEAD,
+                'https://lore.kernel.org/tools/test%40example.com/',
+                status=200,
+            )
+            # Second GET (to resolved URL) succeeds
+            rsps.add(
+                responses.GET,
+                'https://lore.kernel.org/tools/test%40example.com/t.mbox.gz',
+                body=gzip.compress(sample_mbox),
+                status=200,
+            )
 
-        result = node.get_mbox_by_msgid('test@example.com')
-        assert result == sample_mbox
-        # Verify the HEAD was sent to the bare origin
-        mock_session.head.assert_called_once()
-        head_url = mock_session.head.call_args[0][0]
-        assert head_url == 'https://lore.kernel.org/test%40example.com/'
+            result = node.get_mbox_by_msgid('test@example.com')
+            assert result == sample_mbox
+            # Verify the HEAD was sent to the bare origin
+            assert request_url(rsps, 1) == 'https://lore.kernel.org/test%40example.com/'
 
     def test_404_no_redirect_raises(self) -> None:
-        """When HEAD also 404s (no redirect), raise RemoteError."""
-        node = LoreNode('https://lore.kernel.org/all')
-        mock_session = MagicMock()
-
-        mock_404 = MagicMock()
-        mock_404.status_code = 404
-
-        mock_head_404 = MagicMock()
-        mock_head_404.status_code = 404
-
-        mock_session.get.return_value = mock_404
-        mock_session.head.return_value = mock_head_404
-        node.set_requests_session(mock_session)
+        with responses.RequestsMock() as rsps:
+            """When HEAD also 404s (no redirect), raise RemoteError."""
+            node = LoreNode('https://lore.kernel.org/all')
+            rsps.add(
+                responses.GET,
+                'https://lore.kernel.org/all/nonexistent%40example.com/t.mbox.gz',
+                status=404,
+            )
+            rsps.add(
+                responses.HEAD,
+                'https://lore.kernel.org/nonexistent%40example.com/',
+                status=404,
+            )
 
-        with pytest.raises(RemoteError, match='Server returned an error: 404'):
-            node.get_mbox_by_msgid('nonexistent@example.com')
+            with pytest.raises(RemoteError, match='Server returned an error: 404'):
+                node.get_mbox_by_msgid('nonexistent@example.com')
 
 
 class TestGetMboxByQuery:
     def test_returns_raw_bytes(self, sample_mbox: bytes) -> None:
-        node = LoreNode('https://lore.kernel.org/all')
-        mock_session = MagicMock()
-        mock_resp = MagicMock()
-        mock_resp.status_code = 200
-        mock_resp.content = gzip.compress(sample_mbox)
-        mock_session.post.return_value = mock_resp
-        node.set_requests_session(mock_session)
+        with responses.RequestsMock() as rsps:
+            node = LoreNode('https://lore.kernel.org/all')
+            rsps.add(
+                responses.POST,
+                'https://lore.kernel.org/all/?x=m&q=test+query',
+                body=gzip.compress(sample_mbox),
+                status=200,
+            )
 
-        result = node.get_mbox_by_query('test query')
-        assert result == sample_mbox
+            result = node.get_mbox_by_query('test query')
+            assert result == sample_mbox
 
     def test_full_threads_adds_t_param(self, sample_mbox: bytes) -> None:
-        node = LoreNode('https://lore.kernel.org/all')
-        mock_session = MagicMock()
-        mock_resp = MagicMock()
-        mock_resp.status_code = 200
-        mock_resp.content = gzip.compress(sample_mbox)
-        mock_session.post.return_value = mock_resp
-        node.set_requests_session(mock_session)
+        with responses.RequestsMock() as rsps:
+            node = LoreNode('https://lore.kernel.org/all')
+            rsps.add(
+                responses.POST,
+                'https://lore.kernel.org/all/?x=m&t=1&q=test+query',
+                body=gzip.compress(sample_mbox),
+                status=200,
+            )
 
-        node.get_mbox_by_query('test query', full_threads=True)
-        url = mock_session.post.call_args[0][0]
-        assert '&t=1&' in url
+            node.get_mbox_by_query('test query', full_threads=True)
+            url = request_url(rsps, 0)
+            assert '&t=1&' in url
 
     def test_no_full_threads_omits_t_param(self, sample_mbox: bytes) -> None:
-        node = LoreNode('https://lore.kernel.org/all')
-        mock_session = MagicMock()
-        mock_resp = MagicMock()
-        mock_resp.status_code = 200
-        mock_resp.content = gzip.compress(sample_mbox)
-        mock_session.post.return_value = mock_resp
-        node.set_requests_session(mock_session)
+        with responses.RequestsMock() as rsps:
+            node = LoreNode('https://lore.kernel.org/all')
+            rsps.add(
+                responses.POST,
+                'https://lore.kernel.org/all/?x=m&q=test+query',
+                body=gzip.compress(sample_mbox),
+                status=200,
+            )
 
-        node.get_mbox_by_query('test query')
-        url = mock_session.post.call_args[0][0]
-        assert 't=1' not in url
+            node.get_mbox_by_query('test query')
+            url = request_url(rsps, 0)
+            assert 't=1' not in url
 
     def test_http_error(self) -> None:
-        node = LoreNode('https://lore.kernel.org/all')
-        mock_session = MagicMock()
-        mock_resp = MagicMock()
-        mock_resp.status_code = 500
-        mock_session.post.return_value = mock_resp
-        node.set_requests_session(mock_session)
-
-        with pytest.raises(RemoteError, match='Server returned an error'):
-            node.get_mbox_by_query('test')
+        with responses.RequestsMock() as rsps:
+            node = LoreNode('https://lore.kernel.org/all')
+            rsps.add(
+                responses.POST,
+                'https://lore.kernel.org/all/?x=m&q=test',
+                status=500,
+            )
 
+            with pytest.raises(RemoteError, match='Server returned an error'):
+                node.get_mbox_by_query('test')
 
-# =====================================================================
-# get_thread_by_msgid
-# =====================================================================
+    # =====================================================================
+    # get_thread_by_msgid
+    # =====================================================================
 
 
 class TestGetThreadByMsgid:
     def test_full_thread(self, sample_mbox: bytes) -> None:
-        node = LoreNode('https://lore.kernel.org/all')
-        mock_session = MagicMock()
-        mock_resp = MagicMock()
-        mock_resp.status_code = 200
-        mock_resp.content = gzip.compress(sample_mbox)
-        mock_session.get.return_value = mock_resp
-        node.set_requests_session(mock_session)
-
-        msgs = node.get_thread_by_msgid('first@example.com')
-        assert len(msgs) >= 1
-        # Without since, fetches full thread via GET /{msgid}/t.mbox.gz
-        mock_session.get.assert_called_once()
+        with responses.RequestsMock() as rsps:
+            node = LoreNode('https://lore.kernel.org/all')
+            rsps.add(
+                responses.GET,
+                'https://lore.kernel.org/all/first%40example.com/t.mbox.gz',
+                body=gzip.compress(sample_mbox),
+                status=200,
+            )
+
+            msgs = node.get_thread_by_msgid('first@example.com')
+            assert len(msgs) >= 1
+            # Without since, fetches full thread via GET /{msgid}/t.mbox.gz
+            assert len(rsps.calls) == 1
 
     def test_query_contains_msgid(self, sample_mbox: bytes) -> None:
-        node = LoreNode('https://lore.kernel.org/all')
-        mock_session = MagicMock()
-        mock_resp = MagicMock()
-        mock_resp.status_code = 200
-        mock_resp.content = gzip.compress(sample_mbox)
-        mock_session.get.return_value = mock_resp
-        node.set_requests_session(mock_session)
-
-        node.get_thread_by_msgid('first@example.com')
-        call_url = mock_session.get.call_args[0][0]
-        assert 'first%40example.com' in call_url or 'first@example.com' in call_url
-        assert call_url.endswith('/t.mbox.gz')
+        with responses.RequestsMock() as rsps:
+            node = LoreNode('https://lore.kernel.org/all')
+            rsps.add(
+                responses.GET,
+                'https://lore.kernel.org/all/first%40example.com/t.mbox.gz',
+                body=gzip.compress(sample_mbox),
+                status=200,
+            )
+
+            node.get_thread_by_msgid('first@example.com')
+            call_url = request_url(rsps, 0)
+            assert 'first%40example.com' in call_url or 'first@example.com' in call_url
+            assert call_url.endswith('/t.mbox.gz')
 
     def test_since_uses_dt_prefix(self, sample_mbox: bytes) -> None:
-        node = LoreNode('https://lore.kernel.org/all')
-        mock_session = MagicMock()
-        mock_resp = MagicMock()
-        mock_resp.status_code = 200
-        mock_resp.content = gzip.compress(sample_mbox)
-        mock_session.post.return_value = mock_resp
-        node.set_requests_session(mock_session)
-
-        node.get_thread_by_msgid('first@example.com', since='20240101')
-        call_url = mock_session.post.call_args[0][0]
-        assert 'dt%3A20240101' in call_url or 'dt:20240101' in call_url
-        assert 'first%40example.com' in call_url or 'first@example.com' in call_url
+        with responses.RequestsMock() as rsps:
+            node = LoreNode('https://lore.kernel.org/all')
+            rsps.add(
+                responses.POST,
+                'https://lore.kernel.org/all/first%40example.com/?x=m&q=dt%3A20240101..',
+                body=gzip.compress(sample_mbox),
+                status=200,
+            )
+
+            node.get_thread_by_msgid('first@example.com', since='20240101')
+            call_url = request_url(rsps, 0)
+            assert 'dt%3A20240101' in call_url or 'dt:20240101' in call_url
+            assert 'first%40example.com' in call_url or 'first@example.com' in call_url
 
     def test_raises_on_empty(self) -> None:
-        node = LoreNode('https://lore.kernel.org/all')
-        mock_session = MagicMock()
-        mock_resp = MagicMock()
-        mock_resp.status_code = 200
-        mock_resp.content = gzip.compress(b'')
-        mock_session.get.return_value = mock_resp
-        node.set_requests_session(mock_session)
+        with responses.RequestsMock() as rsps:
+            node = LoreNode('https://lore.kernel.org/all')
+            rsps.add(
+                responses.GET,
+                'https://lore.kernel.org/all/nonexistent%40x.com/t.mbox.gz',
+                body=gzip.compress(b''),
+                status=200,
+            )
 
-        with pytest.raises(LookupError):
-            node.get_thread_by_msgid('nonexistent@x.com')
+            with pytest.raises(LookupError):
+                node.get_thread_by_msgid('nonexistent@x.com')
 
     def test_sort_parameter(self, sample_mbox: bytes) -> None:
-        node = LoreNode('https://lore.kernel.org/all')
-        mock_session = MagicMock()
-        mock_resp = MagicMock()
-        mock_resp.status_code = 200
-        mock_resp.content = gzip.compress(sample_mbox)
-        mock_session.get.return_value = mock_resp
-        node.set_requests_session(mock_session)
+        with responses.RequestsMock() as rsps:
+            node = LoreNode('https://lore.kernel.org/all')
+            rsps.add(
+                responses.GET,
+                'https://lore.kernel.org/all/first%40example.com/t.mbox.gz',
+                body=gzip.compress(sample_mbox),
+                status=200,
+            )
 
-        msgs = node.get_thread_by_msgid('first@example.com', sort=True)
-        assert len(msgs) >= 1
+            msgs = node.get_thread_by_msgid('first@example.com', sort=True)
+            assert len(msgs) >= 1
 
-
-# =====================================================================
-# get_thread_updates_since
-# =====================================================================
+    # =====================================================================
+    # get_thread_updates_since
+    # =====================================================================
 
 
 class TestGetThreadUpdatesSince:
     def test_returns_messages(self, sample_mbox: bytes) -> None:
-        node = LoreNode('https://lore.kernel.org/all')
-        mock_session = MagicMock()
-        mock_resp = MagicMock()
-        mock_resp.status_code = 200
-        mock_resp.content = gzip.compress(sample_mbox)
-        mock_session.post.return_value = mock_resp
-        node.set_requests_session(mock_session)
-
-        since = datetime(2024, 1, 15, 12, 0, 0, tzinfo=timezone.utc)
-        msgs = node.get_thread_updates_since('first@example.com', since)
-        assert len(msgs) >= 1
-        mock_session.post.assert_called_once()
+        with responses.RequestsMock() as rsps:
+            node = LoreNode('https://lore.kernel.org/all')
+            rsps.add(
+                responses.POST,
+                'https://lore.kernel.org/all/first%40example.com/?x=m&q=rt%3A1705320000..',
+                body=gzip.compress(sample_mbox),
+                status=200,
+            )
+
+            since = datetime(2024, 1, 15, 12, 0, 0, tzinfo=timezone.utc)
+            msgs = node.get_thread_updates_since('first@example.com', since)
+            assert len(msgs) >= 1
+            assert len(rsps.calls) == 1
 
     def test_empty_returns_empty_list(self) -> None:
-        node = LoreNode('https://lore.kernel.org/all')
-        mock_session = MagicMock()
-        mock_resp = MagicMock()
-        mock_resp.status_code = 200
-        mock_resp.content = gzip.compress(b'')
-        mock_session.post.return_value = mock_resp
-        node.set_requests_session(mock_session)
+        with responses.RequestsMock() as rsps:
+            node = LoreNode('https://lore.kernel.org/all')
+            rsps.add(
+                responses.POST,
+                'https://lore.kernel.org/all/first%40example.com/?x=m&q=rt%3A1705320000..',
+                body=gzip.compress(b''),
+                status=200,
+            )
 
-        since = datetime(2024, 1, 15, 12, 0, 0, tzinfo=timezone.utc)
-        msgs = node.get_thread_updates_since('first@example.com', since)
-        assert msgs == []
+            since = datetime(2024, 1, 15, 12, 0, 0, tzinfo=timezone.utc)
+            msgs = node.get_thread_updates_since('first@example.com', since)
+            assert msgs == []
 
     def test_converts_datetime_to_rt_epoch(self, sample_mbox: bytes) -> None:
-        node = LoreNode('https://lore.kernel.org/all')
-        mock_session = MagicMock()
-        mock_resp = MagicMock()
-        mock_resp.status_code = 200
-        mock_resp.content = gzip.compress(sample_mbox)
-        mock_session.post.return_value = mock_resp
-        node.set_requests_session(mock_session)
-
-        since = datetime(2024, 3, 15, 8, 30, 45, tzinfo=timezone.utc)
-        epoch = int(since.timestamp())  # 1710491445
-        node.get_thread_updates_since('first@example.com', since)
-        call_url = mock_session.post.call_args[0][0]
-        assert f'rt%3A{epoch}' in call_url or f'rt:{epoch}' in call_url
-        assert 'first%40example.com' in call_url or 'first@example.com' in call_url
+        with responses.RequestsMock() as rsps:
+            node = LoreNode('https://lore.kernel.org/all')
+            since = datetime(2024, 3, 15, 8, 30, 45, tzinfo=timezone.utc)
+            epoch = int(since.timestamp())  # 1710491445
+            rsps.add(
+                responses.POST,
+                f'https://lore.kernel.org/all/first%40example.com/?x=m&q=rt%3A{epoch}..',
+                body=gzip.compress(sample_mbox),
+                status=200,
+            )
+            node.get_thread_updates_since('first@example.com', since)
+            call_url = request_url(rsps, 0)
+            assert f'rt%3A{epoch}' in call_url or f'rt:{epoch}' in call_url
+            assert 'first%40example.com' in call_url or 'first@example.com' in call_url
 
     def test_with_sort(self, sample_mbox: bytes) -> None:
-        node = LoreNode('https://lore.kernel.org/all')
-        mock_session = MagicMock()
-        mock_resp = MagicMock()
-        mock_resp.status_code = 200
-        mock_resp.content = gzip.compress(sample_mbox)
-        mock_session.post.return_value = mock_resp
-        node.set_requests_session(mock_session)
-
-        since = datetime(2024, 1, 15, 12, 0, 0, tzinfo=timezone.utc)
-        msgs = node.get_thread_updates_since(
-            'first@example.com',
-            since,
-            sort=True,
-        )
-        assert len(msgs) >= 1
+        with responses.RequestsMock() as rsps:
+            node = LoreNode('https://lore.kernel.org/all')
+            rsps.add(
+                responses.POST,
+                'https://lore.kernel.org/all/first%40example.com/?x=m&q=rt%3A1705320000..',
+                body=gzip.compress(sample_mbox),
+                status=200,
+            )
 
-    def test_server_error_returns_empty_list(self) -> None:
-        node = LoreNode('https://lore.kernel.org/all')
-        mock_session = MagicMock()
-        mock_resp = MagicMock()
-        mock_resp.status_code = 404
-        mock_session.post.return_value = mock_resp
-        node.set_requests_session(mock_session)
+            since = datetime(2024, 1, 15, 12, 0, 0, tzinfo=timezone.utc)
+            msgs = node.get_thread_updates_since(
+                'first@example.com',
+                since,
+                sort=True,
+            )
+            assert len(msgs) >= 1
 
-        since = datetime(2024, 1, 15, 12, 0, 0, tzinfo=timezone.utc)
-        msgs = node.get_thread_updates_since('first@example.com', since)
-        assert msgs == []
+    def test_server_error_returns_empty_list(self) -> None:
+        with responses.RequestsMock() as rsps:
+            node = LoreNode('https://lore.kernel.org/all')
+            rsps.add(
+                responses.POST,
+                'https://lore.kernel.org/all/first%40example.com/?x=m&q=rt%3A1705320000..',
+                status=404,
+            )
 
+            since = datetime(2024, 1, 15, 12, 0, 0, tzinfo=timezone.utc)
+            msgs = node.get_thread_updates_since('first@example.com', since)
+            assert msgs == []
 
-# =====================================================================
-# get_thread_by_query
-# =====================================================================
+    # =====================================================================
+    # get_thread_by_query
+    # =====================================================================
 
 
 class TestGetThreadByQuery:
     def test_posts_query(self, sample_mbox: bytes) -> None:
-        node = LoreNode('https://lore.kernel.org/all')
-        mock_session = MagicMock()
-        mock_resp = MagicMock()
-        mock_resp.status_code = 200
-        mock_resp.content = gzip.compress(sample_mbox)
-        mock_session.post.return_value = mock_resp
-        node.set_requests_session(mock_session)
+        with responses.RequestsMock() as rsps:
+            node = LoreNode('https://lore.kernel.org/all')
+            rsps.add(
+                responses.POST,
+                'https://lore.kernel.org/all/?x=m&q=test+query',
+                body=gzip.compress(sample_mbox),
+                status=200,
+            )
 
-        msgs = node.get_thread_by_query('test query')
-        assert len(msgs) == 2
-        mock_session.post.assert_called_once()
+            msgs = node.get_thread_by_query('test query')
+            assert len(msgs) == 2
+            assert len(rsps.calls) == 1
 
     def test_query_with_date_filter(self, sample_mbox: bytes) -> None:
-        node = LoreNode('https://lore.kernel.org/all')
-        mock_session = MagicMock()
-        mock_resp = MagicMock()
-        mock_resp.status_code = 200
-        mock_resp.content = gzip.compress(sample_mbox)
-        mock_session.post.return_value = mock_resp
-        node.set_requests_session(mock_session)
-
-        node.get_thread_by_query('test d:20240101..')
-        call_url = mock_session.post.call_args[0][0]
-        assert 'd%3A20240101' in call_url or 'd:20240101' in call_url
+        with responses.RequestsMock() as rsps:
+            node = LoreNode('https://lore.kernel.org/all')
+            rsps.add(
+                responses.POST,
+                'https://lore.kernel.org/all/?x=m&q=test+d%3A20240101..',
+                body=gzip.compress(sample_mbox),
+                status=200,
+            )
 
+            node.get_thread_by_query('test d:20240101..')
+            call_url = request_url(rsps, 0)
+            assert 'd%3A20240101' in call_url or 'd:20240101' in call_url
 
-# =====================================================================
-# get_message_by_msgid
-# =====================================================================
+    # =====================================================================
+    # get_message_by_msgid
+    # =====================================================================
 
 
 class TestGetMessageByMsgid:
     def test_fetches_raw(self) -> None:
-        node = LoreNode('https://lore.kernel.org/all')
-        mock_session = MagicMock()
-        mock_resp = MagicMock()
-        mock_resp.status_code = 200
-        mock_resp.content = b'raw email bytes'
-        mock_resp.raise_for_status = MagicMock()
-        mock_session.get.return_value = mock_resp
-        node.set_requests_session(mock_session)
+        with responses.RequestsMock() as rsps:
+            node = LoreNode('https://lore.kernel.org/all')
+            rsps.add(
+                responses.GET,
+                'https://lore.kernel.org/all/test%40x.com/raw',
+                body=b'raw email bytes',
+                status=200,
+            )
 
-        result = node.get_message_by_msgid('test@x.com')
-        assert result == b'raw email bytes'
+            result = node.get_message_by_msgid('test@x.com')
+            assert result == b'raw email bytes'
 
     def test_raises_remote_error(self) -> None:
-        node = LoreNode('https://lore.kernel.org/all')
-        mock_session = MagicMock()
-        mock_session.get.side_effect = Exception('connection refused')
-        node.set_requests_session(mock_session)
-
-        with pytest.raises(RemoteError):
-            node.get_message_by_msgid('test@x.com')
+        with responses.RequestsMock() as rsps:
+            node = LoreNode('https://lore.kernel.org/all')
+            rsps.add(
+                responses.GET,
+                'https://lore.kernel.org/all/test%40x.com/raw',
+                body=requests.ConnectionError('connection refused'),
+            )
 
+            with pytest.raises(RemoteError):
+                node.get_message_by_msgid('test@x.com')
 
-# =====================================================================
-# batch_get_thread_by_msgid
-# =====================================================================
+    # =====================================================================
+    # batch_get_thread_by_msgid
+    # =====================================================================
 
 
 class TestBatchGetThreadByMsgid:
@@ -589,244 +618,287 @@ class TestBatchGetThreadByQuery:
 
 class TestValidate:
     def test_valid_url(self) -> None:
-        node = LoreNode('https://lore.kernel.org/lkml')
-        mock_session = MagicMock()
-        mock_resp = MagicMock()
-        mock_resp.status_code = 200
-        mock_session.head.return_value = mock_resp
-        node.set_requests_session(mock_session)
-
-        node.validate()
-        mock_session.head.assert_called_once_with(
-            'https://lore.kernel.org/lkml/_/text/help/'
-        )
+        with responses.RequestsMock() as rsps:
+            node = LoreNode('https://lore.kernel.org/lkml')
+            rsps.add(
+                responses.HEAD,
+                'https://lore.kernel.org/lkml/_/text/help/',
+                status=200,
+            )
 
-    def test_not_public_inbox(self) -> None:
-        node = LoreNode('https://example.com/not-pi')
-        mock_session = MagicMock()
-        mock_resp = MagicMock()
-        mock_resp.status_code = 404
-        mock_session.head.return_value = mock_resp
-        node.set_requests_session(mock_session)
-
-        with pytest.raises(RemoteError, match='does not appear'):
             node.validate()
+            assert request_url(rsps, 0) == 'https://lore.kernel.org/lkml/_/text/help/'
 
-    def test_connection_error(self) -> None:
-        node = LoreNode('https://unreachable.example.com')
-        mock_session = MagicMock()
-        mock_session.head.side_effect = Exception('connection refused')
-        node.set_requests_session(mock_session)
+    def test_not_public_inbox(self) -> None:
+        with responses.RequestsMock() as rsps:
+            node = LoreNode('https://example.com/not-pi')
+            rsps.add(
+                responses.HEAD,
+                'https://example.com/not-pi/_/text/help/',
+                status=404,
+            )
 
-        with pytest.raises(RemoteError, match='Failed to reach'):
-            node.validate()
+            with pytest.raises(RemoteError, match='does not appear'):
+                node.validate()
 
+    def test_connection_error(self) -> None:
+        with responses.RequestsMock() as rsps:
+            node = LoreNode('https://unreachable.example.com')
+            rsps.add(
+                responses.HEAD,
+                'https://unreachable.example.com/_/text/help/',
+                body=requests.ConnectionError('connection refused'),
+            )
 
-# =====================================================================
-# URL fallback
-# =====================================================================
+            with pytest.raises(RemoteError, match='Failed to reach'):
+                node.validate()
+
+    # =====================================================================
+    # URL fallback
+    # =====================================================================
 
 
 class TestFallback:
     """Tests for the fallback_urls feature."""
 
     def test_no_fallbacks_unchanged(self, sample_mbox: bytes) -> None:
-        """Without fallback_urls, behavior is identical to before."""
-        node = LoreNode('https://lore.kernel.org/all')
-        mock_session = MagicMock()
-        mock_resp = MagicMock()
-        mock_resp.status_code = 200
-        mock_resp.content = gzip.compress(sample_mbox)
-        mock_session.get.return_value = mock_resp
-        node.set_requests_session(mock_session)
-
-        result = node.get_mbox_by_msgid('test@example.com')
-        assert result == sample_mbox
-        assert mock_session.get.call_count == 1
-        url = mock_session.get.call_args[0][0]
-        assert url.startswith('https://lore.kernel.org/')
+        with responses.RequestsMock() as rsps:
+            """Without fallback_urls, behavior is identical to before."""
+            node = LoreNode('https://lore.kernel.org/all')
+            rsps.add(
+                responses.GET,
+                'https://lore.kernel.org/all/test%40example.com/t.mbox.gz',
+                body=gzip.compress(sample_mbox),
+                status=200,
+            )
+
+            result = node.get_mbox_by_msgid('test@example.com')
+            assert result == sample_mbox
+            assert len(rsps.calls) == 1
+            url = request_url(rsps, 0)
+            assert url.startswith('https://lore.kernel.org/')
 
     def test_fallback_on_connection_error(self, sample_mbox: bytes) -> None:
-        """Primary raises ConnectionError, fallback succeeds."""
-        node = LoreNode(
-            'https://lore.kernel.org/all',
-            fallback_urls=['http://mirror.local'],
-        )
-        mock_session = MagicMock()
-        mock_resp = MagicMock()
-        mock_resp.status_code = 200
-        mock_resp.content = gzip.compress(sample_mbox)
-        mock_session.get.side_effect = [
-            requests.ConnectionError('refused'),
-            mock_resp,
-        ]
-        node.set_requests_session(mock_session)
-
-        result = node.get_mbox_by_msgid('test@example.com')
-        assert result == sample_mbox
-        assert mock_session.get.call_count == 2
-        # First call goes to the fallback (tried first)
-        first_url = mock_session.get.call_args_list[0][0][0]
-        assert first_url.startswith('http://mirror.local/all/')
-        # Second call goes to the canonical URL
-        second_url = mock_session.get.call_args_list[1][0][0]
-        assert second_url.startswith('https://lore.kernel.org/all/')
+        with responses.RequestsMock() as rsps:
+            """Primary raises ConnectionError, fallback succeeds."""
+            node = LoreNode(
+                'https://lore.kernel.org/all',
+                fallback_urls=['http://mirror.local'],
+            )
+            rsps.add(
+                responses.GET,
+                'http://mirror.local/all/test%40example.com/t.mbox.gz',
+                body=requests.ConnectionError('refused'),
+            )
+            rsps.add(
+                responses.GET,
+                'https://lore.kernel.org/all/test%40example.com/t.mbox.gz',
+                body=gzip.compress(sample_mbox),
+                status=200,
+            )
+
+            result = node.get_mbox_by_msgid('test@example.com')
+            assert result == sample_mbox
+            assert len(rsps.calls) == 2
+            # First call goes to the fallback (tried first)
+            first_url = request_url(rsps, 0)
+            assert first_url.startswith('http://mirror.local/all/')
+            # Second call goes to the canonical URL
+            second_url = request_url(rsps, 1)
+            assert second_url.startswith('https://lore.kernel.org/all/')
 
     def test_fallback_on_timeout(self, sample_mbox: bytes) -> None:
-        """Primary raises Timeout, fallback succeeds."""
-        node = LoreNode(
-            'https://lore.kernel.org/all',
-            fallback_urls=['https://ams.lore.kernel.org'],
-        )
-        mock_session = MagicMock()
-        mock_resp = MagicMock()
-        mock_resp.status_code = 200
-        mock_resp.content = gzip.compress(sample_mbox)
-        mock_session.get.side_effect = [
-            requests.Timeout('timed out'),
-            mock_resp,
-        ]
-        node.set_requests_session(mock_session)
+        with responses.RequestsMock() as rsps:
+            """Primary raises Timeout, fallback succeeds."""
+            node = LoreNode(
+                'https://lore.kernel.org/all',
+                fallback_urls=['https://ams.lore.kernel.org'],
+            )
+            rsps.add(
+                responses.GET,
+                'https://ams.lore.kernel.org/all/test%40example.com/t.mbox.gz',
+                body=requests.Timeout('timed out'),
+            )
+            rsps.add(
+                responses.GET,
+                'https://lore.kernel.org/all/test%40example.com/t.mbox.gz',
+                body=gzip.compress(sample_mbox),
+                status=200,
+            )
 
-        result = node.get_mbox_by_msgid('test@example.com')
-        assert result == sample_mbox
-        assert mock_session.get.call_count == 2
+            result = node.get_mbox_by_msgid('test@example.com')
+            assert result == sample_mbox
+            assert len(rsps.calls) == 2
 
     def test_fallback_on_5xx(self, sample_mbox: bytes) -> None:
-        """Primary returns 500, fallback returns 200."""
-        node = LoreNode(
-            'https://lore.kernel.org/all',
-            fallback_urls=['http://mirror.local'],
-        )
-        mock_session = MagicMock()
-        mock_500 = MagicMock()
-        mock_500.status_code = 500
-        mock_200 = MagicMock()
-        mock_200.status_code = 200
-        mock_200.content = gzip.compress(sample_mbox)
-        mock_session.get.side_effect = [mock_500, mock_200]
-        node.set_requests_session(mock_session)
-
-        result = node.get_mbox_by_msgid('test@example.com')
-        assert result == sample_mbox
-        assert mock_session.get.call_count == 2
+        with responses.RequestsMock() as rsps:
+            """Primary returns 500, fallback returns 200."""
+            node = LoreNode(
+                'https://lore.kernel.org/all',
+                fallback_urls=['http://mirror.local'],
+            )
+            rsps.add(
+                responses.GET,
+                'http://mirror.local/all/test%40example.com/t.mbox.gz',
+                status=500,
+            )
+            rsps.add(
+                responses.GET,
+                'https://lore.kernel.org/all/test%40example.com/t.mbox.gz',
+                body=gzip.compress(sample_mbox),
+                status=200,
+            )
+
+            result = node.get_mbox_by_msgid('test@example.com')
+            assert result == sample_mbox
+            assert len(rsps.calls) == 2
 
     def test_no_fallback_on_4xx(self) -> None:
-        """4xx is not retriable — fallback should NOT be tried."""
-        node = LoreNode(
-            'https://lore.kernel.org/all',
-            fallback_urls=['http://mirror.local'],
-        )
-        mock_session = MagicMock()
-        mock_resp = MagicMock()
-        mock_resp.status_code = 404
-        mock_session.get.return_value = mock_resp
-        node.set_requests_session(mock_session)
+        with responses.RequestsMock() as rsps:
+            """4xx is not retriable — fallback should NOT be tried."""
+            node = LoreNode(
+                'https://lore.kernel.org/all',
+                fallback_urls=['http://mirror.local'],
+            )
+            rsps.add(
+                responses.GET,
+                'http://mirror.local/all/test%40example.com/t.mbox.gz',
+                status=404,
+            )
+            rsps.add(
+                responses.HEAD,
+                'https://lore.kernel.org/test%40example.com/',
+                status=404,
+            )
 
-        with pytest.raises(RemoteError, match='Server returned an error'):
-            node.get_mbox_by_msgid('test@example.com')
-        # Only 1 call — the fallback, which returned 404, no retry
-        assert mock_session.get.call_count == 1
+            with pytest.raises(RemoteError, match='Server returned an error'):
+                node.get_mbox_by_msgid('test@example.com')
+            # Fallback returns 404, then redirect discovery also returns 404.
+            assert len(rsps.calls) == 2
 
     def test_all_hosts_fail_connection(self) -> None:
-        """All origins raise ConnectionError → RemoteError."""
-        node = LoreNode(
-            'https://lore.kernel.org/all',
-            fallback_urls=['http://mirror.local'],
-        )
-        mock_session = MagicMock()
-        mock_session.get.side_effect = requests.ConnectionError('refused')
-        node.set_requests_session(mock_session)
+        with responses.RequestsMock() as rsps:
+            """All origins raise ConnectionError → RemoteError."""
+            node = LoreNode(
+                'https://lore.kernel.org/all',
+                fallback_urls=['http://mirror.local'],
+            )
+            rsps.add(
+                responses.GET,
+                'http://mirror.local/all/test%40example.com/t.mbox.gz',
+                body=requests.ConnectionError('refused'),
+            )
+            rsps.add(
+                responses.GET,
+                'https://lore.kernel.org/all/test%40example.com/t.mbox.gz',
+                body=requests.ConnectionError('refused'),
+            )
 
-        with pytest.raises(RemoteError, match='All hosts failed'):
-            node.get_mbox_by_msgid('test@example.com')
-        assert mock_session.get.call_count == 2
+            with pytest.raises(RemoteError, match='All hosts failed'):
+                node.get_mbox_by_msgid('test@example.com')
+            assert len(rsps.calls) == 2
 
     def test_all_hosts_fail_5xx(self) -> None:
-        """All origins return 5xx → caller gets the error response."""
-        node = LoreNode(
-            'https://lore.kernel.org/all',
-            fallback_urls=['http://mirror.local'],
-        )
-        mock_session = MagicMock()
-        mock_resp = MagicMock()
-        mock_resp.status_code = 503
-        mock_session.get.return_value = mock_resp
-        node.set_requests_session(mock_session)
-
-        # get_mbox_by_msgid checks status_code and raises RemoteError
-        with pytest.raises(RemoteError, match='Server returned an error'):
-            node.get_mbox_by_msgid('test@example.com')
-        assert mock_session.get.call_count == 2
+        with responses.RequestsMock() as rsps:
+            """All origins return 5xx → caller gets the error response."""
+            node = LoreNode(
+                'https://lore.kernel.org/all',
+                fallback_urls=['http://mirror.local'],
+            )
+            rsps.add(
+                responses.GET,
+                'http://mirror.local/all/test%40example.com/t.mbox.gz',
+                status=503,
+            )
+            rsps.add(
+                responses.GET,
+                'https://lore.kernel.org/all/test%40example.com/t.mbox.gz',
+                status=503,
+            )
+
+            # get_mbox_by_msgid checks status_code and raises RemoteError
+            with pytest.raises(RemoteError, match='Server returned an error'):
+                node.get_mbox_by_msgid('test@example.com')
+            assert len(rsps.calls) == 2
 
     def test_all_hosts_fail_no_raise(self) -> None:
-        """_fetch_thread_since path: all fail, returns empty list."""
-        node = LoreNode(
-            'https://lore.kernel.org/all',
-            fallback_urls=['http://mirror.local'],
-        )
-        mock_session = MagicMock()
-        mock_resp = MagicMock()
-        mock_resp.status_code = 503
-        mock_session.post.return_value = mock_resp
-        node.set_requests_session(mock_session)
+        with responses.RequestsMock() as rsps:
+            """_fetch_thread_since path: all fail, returns empty list."""
+            node = LoreNode(
+                'https://lore.kernel.org/all',
+                fallback_urls=['http://mirror.local'],
+            )
+            rsps.add(
+                responses.POST,
+                'http://mirror.local/all/test%40example.com/?x=m&q=dt%3A20240101..',
+                status=503,
+            )
+            rsps.add(
+                responses.POST,
+                'https://lore.kernel.org/all/test%40example.com/?x=m&q=dt%3A20240101..',
+                status=503,
+            )
 
-        result = node._fetch_thread_since('test@example.com', 'dt:20240101..')
-        assert result == []
-        assert mock_session.post.call_count == 2
+            result = node._fetch_thread_since('test@example.com', 'dt:20240101..')
+            assert result == []
+            assert len(rsps.calls) == 2
 
     def test_url_rewriting_preserves_path(self, sample_mbox: bytes) -> None:
-        """Verify full URL rewriting with scheme change."""
-        node = LoreNode(
-            'https://lore.kernel.org/all',
-            fallback_urls=['http://mymirror.local'],
-        )
-        mock_session = MagicMock()
-        mock_resp = MagicMock()
-        mock_resp.status_code = 200
-        mock_resp.content = gzip.compress(sample_mbox)
-        # First call (fallback) succeeds
-        mock_session.get.return_value = mock_resp
-        node.set_requests_session(mock_session)
-
-        node.get_mbox_by_msgid('test@example.com')
-        url = mock_session.get.call_args_list[0][0][0]
-        assert url.startswith('http://mymirror.local/all/')
-        assert url.endswith('/t.mbox.gz')
+        with responses.RequestsMock() as rsps:
+            """Verify full URL rewriting with scheme change."""
+            node = LoreNode(
+                'https://lore.kernel.org/all',
+                fallback_urls=['http://mymirror.local'],
+            )
+            rsps.add(
+                responses.GET,
+                'http://mymirror.local/all/test%40example.com/t.mbox.gz',
+                body=gzip.compress(sample_mbox),
+                status=200,
+            )
+
+            node.get_mbox_by_msgid('test@example.com')
+            url = request_url(rsps, 0)
+            assert url.startswith('http://mymirror.local/all/')
+            assert url.endswith('/t.mbox.gz')
 
     def test_url_rewriting_post(self, sample_mbox: bytes) -> None:
-        """Verify URL rewriting works for POST requests too."""
-        node = LoreNode(
-            'https://lore.kernel.org/all',
-            fallback_urls=['https://ams.lore.kernel.org'],
-        )
-        mock_session = MagicMock()
-        mock_resp = MagicMock()
-        mock_resp.status_code = 200
-        mock_resp.content = gzip.compress(sample_mbox)
-        mock_session.post.return_value = mock_resp
-        node.set_requests_session(mock_session)
+        with responses.RequestsMock() as rsps:
+            """Verify URL rewriting works for POST requests too."""
+            node = LoreNode(
+                'https://lore.kernel.org/all',
+                fallback_urls=['https://ams.lore.kernel.org'],
+            )
+            rsps.add(
+                responses.POST,
+                'https://ams.lore.kernel.org/all/?x=m&q=test+query',
+                body=gzip.compress(sample_mbox),
+                status=200,
+            )
 
-        node.get_mbox_by_query('test query')
-        url = mock_session.post.call_args[0][0]
-        assert url.startswith('https://ams.lore.kernel.org/all/')
+            node.get_mbox_by_query('test query')
+            url = request_url(rsps, 0)
+            assert url.startswith('https://ams.lore.kernel.org/all/')
 
     def test_validate_does_not_use_fallback(self) -> None:
-        """validate() hits canonical URL only, ignoring fallbacks."""
-        node = LoreNode(
-            'https://lore.kernel.org/all',
-            fallback_urls=['http://mirror.local'],
-        )
-        mock_session = MagicMock()
-        mock_session.head.side_effect = Exception('connection refused')
-        node.set_requests_session(mock_session)
+        with responses.RequestsMock() as rsps:
+            """validate() hits canonical URL only, ignoring fallbacks."""
+            node = LoreNode(
+                'https://lore.kernel.org/all',
+                fallback_urls=['http://mirror.local'],
+            )
+            rsps.add(
+                responses.HEAD,
+                'https://lore.kernel.org/all/_/text/help/',
+                body=requests.ConnectionError('connection refused'),
+            )
 
-        with pytest.raises(RemoteError, match='Failed to reach'):
-            node.validate()
-        # Only 1 call to the canonical URL — no fallback
-        assert mock_session.head.call_count == 1
-        url = mock_session.head.call_args[0][0]
-        assert 'lore.kernel.org' in url
+            with pytest.raises(RemoteError, match='Failed to reach'):
+                node.validate()
+            # Only 1 call to the canonical URL — no fallback
+            assert len(rsps.calls) == 1
+            url = request_url(rsps, 0)
+            assert 'lore.kernel.org' in url
 
     def test_invalid_fallback_url_no_scheme(self) -> None:
         """Fallback URL without scheme raises LibloreError."""
@@ -857,37 +929,43 @@ class TestFallback:
         assert node.hostname == 'lore.kernel.org'
 
     def test_multiple_fallbacks_tried_in_order(self, sample_mbox: bytes) -> None:
-        """With 3 fallbacks, they are tried in the configured order."""
-        node = LoreNode(
-            'https://lore.kernel.org/all',
-            fallback_urls=[
-                'http://mirror1.local',
-                'https://ams.lore.kernel.org',
-            ],
-        )
-        mock_session = MagicMock()
-        mock_resp = MagicMock()
-        mock_resp.status_code = 200
-        mock_resp.content = gzip.compress(sample_mbox)
-        mock_session.get.side_effect = [
-            requests.ConnectionError('refused'),
-            requests.ConnectionError('refused'),
-            mock_resp,
-        ]
-        node.set_requests_session(mock_session)
-
-        result = node.get_mbox_by_msgid('test@example.com')
-        assert result == sample_mbox
-        assert mock_session.get.call_count == 3
-        urls = [c[0][0] for c in mock_session.get.call_args_list]
-        assert urls[0].startswith('http://mirror1.local/')
-        assert urls[1].startswith('https://ams.lore.kernel.org/')
-        assert urls[2].startswith('https://lore.kernel.org/')
+        with responses.RequestsMock() as rsps:
+            """With 3 fallbacks, they are tried in the configured order."""
+            node = LoreNode(
+                'https://lore.kernel.org/all',
+                fallback_urls=[
+                    'http://mirror1.local',
+                    'https://ams.lore.kernel.org',
+                ],
+            )
+            rsps.add(
+                responses.GET,
+                'http://mirror1.local/all/test%40example.com/t.mbox.gz',
+                body=requests.ConnectionError('refused'),
+            )
+            rsps.add(
+                responses.GET,
+                'https://ams.lore.kernel.org/all/test%40example.com/t.mbox.gz',
+                body=requests.ConnectionError('refused'),
+            )
+            rsps.add(
+                responses.GET,
+                'https://lore.kernel.org/all/test%40example.com/t.mbox.gz',
+                body=gzip.compress(sample_mbox),
+                status=200,
+            )
 
+            result = node.get_mbox_by_msgid('test@example.com')
+            assert result == sample_mbox
+            assert len(rsps.calls) == 3
+            urls = [request_url(rsps, i) for i in range(len(rsps.calls))]
+            assert urls[0].startswith('http://mirror1.local/')
+            assert urls[1].startswith('https://ams.lore.kernel.org/')
+            assert urls[2].startswith('https://lore.kernel.org/')
 
-# =====================================================================
-# Origin probing
-# =====================================================================
+    # =====================================================================
+    # Origin probing
+    # =====================================================================
 
 
 class TestProbeOrigins:
@@ -927,49 +1005,54 @@ class TestProbeOrigins:
         assert node._all_origins == origins
 
     def test_probe_unreachable_sorted_last(self) -> None:
-        """Unreachable origins get inf elapsed and sort to the end."""
-        node = LoreNode(
-            'https://lore.kernel.org/all',
-            fallback_urls=['https://dead.example.com'],
-        )
-
-        def fake_head(url: str, **kwargs: object) -> MagicMock:
-            if 'dead' in url:
-                raise requests.ConnectionError('refused')
-            resp = MagicMock()
-            resp.status_code = 200
-            return resp
+        with responses.RequestsMock() as rsps:
+            """Unreachable origins get inf elapsed and sort to the end."""
+            node = LoreNode(
+                'https://lore.kernel.org/all',
+                fallback_urls=['https://dead.example.com'],
+            )
 
-        with patch('liblore.node.requests.head', side_effect=fake_head):
+            rsps.add(
+                responses.HEAD,
+                'https://dead.example.com/manifest.js.gz',
+                body=requests.ConnectionError('refused'),
+            )
+            rsps.add(
+                responses.HEAD,
+                'https://lore.kernel.org/manifest.js.gz',
+                status=200,
+            )
             results = node.probe_origins()
 
-        assert len(results) == 2
-        # canonical should be first (reachable), dead last
-        assert results[0][0] == 'https://lore.kernel.org'
-        assert results[0][1] < float('inf')
-        assert results[1][0] == 'https://dead.example.com'
-        assert results[1][1] == float('inf')
+            assert len(results) == 2
+            # canonical should be first (reachable), dead last
+            assert results[0][0] == 'https://lore.kernel.org'
+            assert results[0][1] < float('inf')
+            assert results[1][0] == 'https://dead.example.com'
+            assert results[1][1] == float('inf')
 
     def test_probe_4xx_treated_as_unreachable(self) -> None:
-        """Origins returning 4xx are treated as unreachable."""
-        node = LoreNode(
-            'https://lore.kernel.org/all',
-            fallback_urls=['https://nomanifest.example.com'],
-        )
-
-        def fake_head(url: str, **kwargs: object) -> MagicMock:
-            resp = MagicMock()
-            if 'nomanifest' in url:
-                resp.status_code = 404
-            else:
-                resp.status_code = 200
-            return resp
+        with responses.RequestsMock() as rsps:
+            """Origins returning 4xx are treated as unreachable."""
+            node = LoreNode(
+                'https://lore.kernel.org/all',
+                fallback_urls=['https://nomanifest.example.com'],
+            )
 
-        with patch('liblore.node.requests.head', side_effect=fake_head):
+            rsps.add(
+                responses.HEAD,
+                'https://nomanifest.example.com/manifest.js.gz',
+                status=404,
+            )
+            rsps.add(
+                responses.HEAD,
+                'https://lore.kernel.org/manifest.js.gz',
+                status=200,
+            )
             results = node.probe_origins()
 
-        assert results[0][0] == 'https://lore.kernel.org'
-        assert results[1][1] == float('inf')
+            assert results[0][0] == 'https://lore.kernel.org'
+            assert results[1][1] == float('inf')
 
     def test_probe_single_origin_noop(self) -> None:
         """With only one origin, probe is a no-op."""
@@ -980,265 +1063,321 @@ class TestProbeOrigins:
         assert node._probe_done is True
 
     def test_probe_uses_manifest_url(self) -> None:
-        """Probe hits /manifest.js.gz on each origin."""
-        node = LoreNode(
-            'https://lore.kernel.org/all',
-            fallback_urls=['http://mirror.local'],
-        )
-        probed_urls: list[str] = []
-
-        def fake_head(url: str, **kwargs: object) -> MagicMock:
-            probed_urls.append(url)
-            resp = MagicMock()
-            resp.status_code = 200
-            return resp
-
-        with patch('liblore.node.requests.head', side_effect=fake_head):
+        with responses.RequestsMock() as rsps:
+            """Probe hits /manifest.js.gz on each origin."""
+            node = LoreNode(
+                'https://lore.kernel.org/all',
+                fallback_urls=['http://mirror.local'],
+            )
+            probed_urls: list[str] = []
+
+            def callback(
+                request: requests.PreparedRequest,
+            ) -> tuple[int, dict[str, str], str]:
+                assert request.url is not None
+                probed_urls.append(request.url)
+                return 200, {}, ''
+
+            rsps.add_callback(
+                responses.HEAD,
+                'http://mirror.local/manifest.js.gz',
+                callback=callback,
+            )
+            rsps.add_callback(
+                responses.HEAD,
+                'https://lore.kernel.org/manifest.js.gz',
+                callback=callback,
+            )
             node.probe_origins()
 
-        assert len(probed_urls) == 2
-        assert 'http://mirror.local/manifest.js.gz' in probed_urls
-        assert 'https://lore.kernel.org/manifest.js.gz' in probed_urls
+            assert len(probed_urls) == 2
+            assert 'http://mirror.local/manifest.js.gz' in probed_urls
+            assert 'https://lore.kernel.org/manifest.js.gz' in probed_urls
 
     def test_probe_sends_user_agent(self) -> None:
-        """Probe requests include the configured User-Agent."""
-        node = LoreNode(
-            'https://lore.kernel.org/all',
-            fallback_urls=['http://mirror.local'],
-        )
-        node.set_user_agent('myapp', '1.0')
+        with responses.RequestsMock() as rsps:
+            """Probe requests include the configured User-Agent."""
+            node = LoreNode(
+                'https://lore.kernel.org/all',
+                fallback_urls=['http://mirror.local'],
+            )
+            node.set_user_agent('myapp', '1.0')
 
-        captured_headers: list[dict[str, str]] = []
+            captured_headers: list[dict[str, str]] = []
 
-        def fake_head(url: str, **kwargs: object) -> MagicMock:
-            headers = kwargs.get('headers', {})
-            assert isinstance(headers, dict)
-            captured_headers.append(cast(dict[str, str], headers))
-            resp = MagicMock()
-            resp.status_code = 200
-            return resp
+            def callback(
+                request: requests.PreparedRequest,
+            ) -> tuple[int, dict[str, str], str]:
+                captured_headers.append(dict(request.headers))
+                return 200, {}, ''
 
-        with patch('liblore.node.requests.head', side_effect=fake_head):
+            rsps.add_callback(
+                responses.HEAD,
+                'http://mirror.local/manifest.js.gz',
+                callback=callback,
+            )
+            rsps.add_callback(
+                responses.HEAD,
+                'https://lore.kernel.org/manifest.js.gz',
+                callback=callback,
+            )
             node.probe_origins()
 
-        for h in captured_headers:
-            assert h['User-Agent'] == 'myapp/1.0'
+            for h in captured_headers:
+                assert h['User-Agent'] == 'myapp/1.0'
 
     def test_auto_probe_triggers_on_first_request(
         self,
         sample_mbox: bytes,
     ) -> None:
-        """With auto_probe=True, first _request() triggers probe."""
-        node = LoreNode(
-            'https://lore.kernel.org/all',
-            fallback_urls=['https://fast.example.com'],
-            auto_probe=True,
-        )
-        mock_session = MagicMock()
-        mock_resp = MagicMock()
-        mock_resp.status_code = 200
-        mock_resp.content = gzip.compress(sample_mbox)
-        mock_session.get.return_value = mock_resp
-        node.set_requests_session(mock_session)
-
-        def fake_head(url: str, **kwargs: object) -> MagicMock:
-            resp = MagicMock()
-            resp.status_code = 200
-            return resp
-
-        with patch('liblore.node.requests.head', side_effect=fake_head):
+        with responses.RequestsMock() as rsps:
+            """With auto_probe=True, first _request() triggers probe."""
+            node = LoreNode(
+                'https://lore.kernel.org/all',
+                fallback_urls=['https://fast.example.com'],
+                auto_probe=True,
+            )
+            rsps.add(
+                responses.HEAD,
+                'https://fast.example.com/manifest.js.gz',
+                status=200,
+            )
+            rsps.add(
+                responses.HEAD,
+                'https://lore.kernel.org/manifest.js.gz',
+                status=200,
+            )
+            rsps.add(
+                responses.GET,
+                'https://fast.example.com/all/test%40example.com/t.mbox.gz',
+                body=gzip.compress(sample_mbox),
+                status=200,
+            )
             node.get_mbox_by_msgid('test@example.com')
 
-        assert node._probe_done is True
+            assert node._probe_done is True
 
     def test_auto_probe_only_once(self, sample_mbox: bytes) -> None:
-        """auto_probe fires only on the first request, not subsequent ones."""
-        node = LoreNode(
-            'https://lore.kernel.org/all',
-            fallback_urls=['https://fast.example.com'],
-            auto_probe=True,
-        )
-        mock_session = MagicMock()
-        mock_resp = MagicMock()
-        mock_resp.status_code = 200
-        mock_resp.content = gzip.compress(sample_mbox)
-        mock_session.get.return_value = mock_resp
-        node.set_requests_session(mock_session)
-
-        probe_count = 0
-
-        def fake_head(url: str, **kwargs: object) -> MagicMock:
-            nonlocal probe_count
-            probe_count += 1
-            resp = MagicMock()
-            resp.status_code = 200
-            return resp
-
-        with patch('liblore.node.requests.head', side_effect=fake_head):
+        with responses.RequestsMock() as rsps:
+            """auto_probe fires only on the first request, not subsequent ones."""
+            node = LoreNode(
+                'https://lore.kernel.org/all',
+                fallback_urls=['https://fast.example.com'],
+                auto_probe=True,
+            )
+            probe_count = 0
+
+            def callback(
+                _request: requests.PreparedRequest,
+            ) -> tuple[int, dict[str, str], str]:
+                nonlocal probe_count
+                probe_count += 1
+                return 200, {}, ''
+
+            rsps.add_callback(
+                responses.HEAD,
+                'https://fast.example.com/manifest.js.gz',
+                callback=callback,
+            )
+            rsps.add_callback(
+                responses.HEAD,
+                'https://lore.kernel.org/manifest.js.gz',
+                callback=callback,
+            )
+            rsps.add(
+                responses.GET,
+                'https://fast.example.com/all/first%40example.com/t.mbox.gz',
+                body=gzip.compress(sample_mbox),
+                status=200,
+            )
+            rsps.add(
+                responses.GET,
+                'https://fast.example.com/all/second%40example.com/t.mbox.gz',
+                body=gzip.compress(sample_mbox),
+                status=200,
+            )
             node.get_mbox_by_msgid('first@example.com')
             first_probe_count = probe_count
             node.get_mbox_by_msgid('second@example.com')
 
-        # Second request should NOT trigger another probe
-        assert probe_count == first_probe_count
+            # Second request should NOT trigger another probe
+            assert probe_count == first_probe_count
 
     def test_probe_cache_write_and_read(self, tmp_path: object) -> None:
-        """Probe results are cached and restored on next probe call."""
-        cache_dir = str(tmp_path)
-        node1 = LoreNode(
-            'https://lore.kernel.org/all',
-            fallback_urls=['https://fast.example.com'],
-            cache_dir=cache_dir,
-        )
-
-        def fake_head(url: str, **kwargs: object) -> MagicMock:
-            resp = MagicMock()
-            resp.status_code = 200
-            return resp
+        with responses.RequestsMock() as rsps:
+            """Probe results are cached and restored on next probe call."""
+            cache_dir = str(tmp_path)
+            node1 = LoreNode(
+                'https://lore.kernel.org/all',
+                fallback_urls=['https://fast.example.com'],
+                cache_dir=cache_dir,
+            )
 
-        with patch('liblore.node.requests.head', side_effect=fake_head):
+            rsps.add(
+                responses.HEAD,
+                'https://fast.example.com/manifest.js.gz',
+                status=200,
+            )
+            rsps.add(
+                responses.HEAD,
+                'https://lore.kernel.org/manifest.js.gz',
+                status=200,
+            )
             with patch('liblore.node.time.monotonic') as mock_mono:
                 # fast: 0.1s, canonical: 0.5s
                 mock_mono.side_effect = [0.0, 0.1, 0.0, 0.5]
                 node1.probe_origins()
 
-        expected_order = node1._all_origins[:]
+            expected_order = node1._all_origins[:]
 
-        # New node with same origins should get cached order
-        node2 = LoreNode(
-            'https://lore.kernel.org/all',
-            fallback_urls=['https://fast.example.com'],
-            cache_dir=cache_dir,
-        )
-        # Without patching requests.head — cache should be used
-        node2.probe_origins()
-        assert node2._all_origins == expected_order
+            # New node with same origins should get cached order
+            node2 = LoreNode(
+                'https://lore.kernel.org/all',
+                fallback_urls=['https://fast.example.com'],
+                cache_dir=cache_dir,
+            )
+            # Without patching requests.head — cache should be used
+            node2.probe_origins()
+            assert node2._all_origins == expected_order
 
     def test_probe_cache_expired(self, tmp_path: object) -> None:
-        """Expired probe cache triggers a fresh probe."""
-        cache_dir = str(tmp_path)
-        node = LoreNode(
-            'https://lore.kernel.org/all',
-            fallback_urls=['https://fast.example.com'],
-            cache_dir=cache_dir,
-            probe_ttl=10,
-        )
-
-        def fake_head(url: str, **kwargs: object) -> MagicMock:
-            resp = MagicMock()
-            resp.status_code = 200
-            return resp
+        with responses.RequestsMock() as rsps:
+            """Expired probe cache triggers a fresh probe."""
+            cache_dir = str(tmp_path)
+            node = LoreNode(
+                'https://lore.kernel.org/all',
+                fallback_urls=['https://fast.example.com'],
+                cache_dir=cache_dir,
+                probe_ttl=10,
+            )
 
-        with patch('liblore.node.requests.head', side_effect=fake_head):
+            rsps.add(
+                responses.HEAD,
+                'https://fast.example.com/manifest.js.gz',
+                status=200,
+            )
+            rsps.add(
+                responses.HEAD,
+                'https://lore.kernel.org/manifest.js.gz',
+                status=200,
+            )
             node.probe_origins()
 
-        # Backdate cache file to force expiry
-        import glob as glob_mod
-
-        for f in glob_mod.glob(os.path.join(cache_dir, '*.lore.cache')):
-            os.utime(f, (0, 0))
+            # Backdate cache file to force expiry
+            import glob as glob_mod
 
-        probe_called = False
+            for f in glob_mod.glob(os.path.join(cache_dir, '*.lore.cache')):
+                os.utime(f, (0, 0))
 
-        def fake_head_2(url: str, **kwargs: object) -> MagicMock:
-            nonlocal probe_called
-            probe_called = True
-            resp = MagicMock()
-            resp.status_code = 200
-            return resp
-
-        node._probe_done = False
-        with patch('liblore.node.requests.head', side_effect=fake_head_2):
+            node._probe_done = False
+            rsps.add(
+                responses.HEAD,
+                'https://fast.example.com/manifest.js.gz',
+                status=200,
+            )
+            rsps.add(
+                responses.HEAD,
+                'https://lore.kernel.org/manifest.js.gz',
+                status=200,
+            )
             node.probe_origins()
-
-        assert probe_called
+            assert len(rsps.calls) == 4
 
     def test_probe_cache_ignored_when_origins_change(
         self,
         tmp_path: object,
     ) -> None:
-        """Cache is ignored when the set of origins differs."""
-        cache_dir = str(tmp_path)
-        node1 = LoreNode(
-            'https://lore.kernel.org/all',
-            fallback_urls=['https://fast.example.com'],
-            cache_dir=cache_dir,
-        )
-
-        def fake_head(url: str, **kwargs: object) -> MagicMock:
-            resp = MagicMock()
-            resp.status_code = 200
-            return resp
+        with responses.RequestsMock() as rsps:
+            """Cache is ignored when the set of origins differs."""
+            cache_dir = str(tmp_path)
+            node1 = LoreNode(
+                'https://lore.kernel.org/all',
+                fallback_urls=['https://fast.example.com'],
+                cache_dir=cache_dir,
+            )
 
-        with patch('liblore.node.requests.head', side_effect=fake_head):
+            rsps.add(
+                responses.HEAD,
+                'https://fast.example.com/manifest.js.gz',
+                status=200,
+            )
+            rsps.add(
+                responses.HEAD,
+                'https://lore.kernel.org/manifest.js.gz',
+                status=200,
+            )
             node1.probe_origins()
 
-        # New node with DIFFERENT fallbacks
-        node2 = LoreNode(
-            'https://lore.kernel.org/all',
-            fallback_urls=['https://other.example.com'],
-            cache_dir=cache_dir,
-        )
-
-        probe_called = False
-
-        def fake_head_2(url: str, **kwargs: object) -> MagicMock:
-            nonlocal probe_called
-            probe_called = True
-            resp = MagicMock()
-            resp.status_code = 200
-            return resp
+            # New node with DIFFERENT fallbacks
+            node2 = LoreNode(
+                'https://lore.kernel.org/all',
+                fallback_urls=['https://other.example.com'],
+                cache_dir=cache_dir,
+            )
 
-        with patch('liblore.node.requests.head', side_effect=fake_head_2):
+            rsps.add(
+                responses.HEAD,
+                'https://other.example.com/manifest.js.gz',
+                status=200,
+            )
+            rsps.add(
+                responses.HEAD,
+                'https://lore.kernel.org/manifest.js.gz',
+                status=200,
+            )
             node2.probe_origins()
 
-        # Different origins → cache miss → fresh probe
-        assert probe_called
+            # Different origins → cache miss → fresh probe
+            assert len(rsps.calls) == 4
 
     def test_probe_nocache_skips_cache(self, tmp_path: object) -> None:
-        """nocache=True forces a live probe even when cache is fresh."""
-        cache_dir = str(tmp_path)
-        node = LoreNode(
-            'https://lore.kernel.org/all',
-            fallback_urls=['https://fast.example.com'],
-            cache_dir=cache_dir,
-        )
-
-        def fake_head(url: str, **kwargs: object) -> MagicMock:
-            resp = MagicMock()
-            resp.status_code = 200
-            return resp
+        with responses.RequestsMock() as rsps:
+            """nocache=True forces a live probe even when cache is fresh."""
+            cache_dir = str(tmp_path)
+            node = LoreNode(
+                'https://lore.kernel.org/all',
+                fallback_urls=['https://fast.example.com'],
+                cache_dir=cache_dir,
+            )
 
-        # First probe — populates cache
-        with patch('liblore.node.requests.head', side_effect=fake_head):
+            rsps.add(
+                responses.HEAD,
+                'https://fast.example.com/manifest.js.gz',
+                status=200,
+            )
+            rsps.add(
+                responses.HEAD,
+                'https://lore.kernel.org/manifest.js.gz',
+                status=200,
+            )
+            # First probe — populates cache
             with patch('liblore.node.time.monotonic') as mock_mono:
                 mock_mono.side_effect = [0.0, 0.1, 0.0, 0.5]
                 node.probe_origins()
 
-        # Second probe with nocache — should do a live probe, not read cache
-        probe_called = False
-
-        def fake_head_2(url: str, **kwargs: object) -> MagicMock:
-            nonlocal probe_called
-            probe_called = True
-            resp = MagicMock()
-            resp.status_code = 200
-            return resp
-
-        node._probe_done = False
-        with patch('liblore.node.requests.head', side_effect=fake_head_2):
+            # Second probe with nocache — should do a live probe, not read cache
+            node._probe_done = False
+            rsps.add(
+                responses.HEAD,
+                'https://fast.example.com/manifest.js.gz',
+                status=200,
+            )
+            rsps.add(
+                responses.HEAD,
+                'https://lore.kernel.org/manifest.js.gz',
+                status=200,
+            )
             with patch('liblore.node.time.monotonic') as mock_mono:
-                mock_mono.side_effect = [0.0, 0.2, 0.0, 0.3]
+                mock_mono.side_effect = [0.0, 1.0, 2.0, 3.0]
                 results = node.probe_origins(nocache=True)
 
-        assert probe_called
-        # Results should have real timing, not 0.0
-        assert all(elapsed > 0.0 for _, elapsed in results)
-
+            assert len(rsps.calls) == 4
+            # Results should have real timing, not 0.0
+            assert all(elapsed > 0.0 for _, elapsed in results)
 
-# =====================================================================
-# Git config integration
-# =====================================================================
+    # =====================================================================
+    # Git config integration
+    # =====================================================================
 
 
 class TestFromGitConfig:
@@ -1687,71 +1826,84 @@ class TestFromGitConfigSubsections:
 class TestRequest:
     """Tests for the public request() method."""
 
-    def test_delegates_to_private_request(self, sample_mbox: bytes) -> None:
-        """request() delegates to _request() with raise_on_error=True."""
-        node = LoreNode('https://lore.kernel.org/all')
-        mock_session = MagicMock()
-        mock_resp = MagicMock()
-        mock_resp.status_code = 200
-        mock_session.get.return_value = mock_resp
-        node.set_requests_session(mock_session)
+    def test_delegates_to_private_request(self) -> None:
+        with responses.RequestsMock() as rsps:
+            """request() delegates to _request() with raise_on_error=True."""
+            node = LoreNode('https://lore.kernel.org/all')
+            rsps.add(
+                responses.GET,
+                'https://lore.kernel.org/manifest.js.gz',
+                status=200,
+            )
 
-        resp = node.request('GET', 'https://lore.kernel.org/manifest.js.gz')
-        assert resp.status_code == 200
+            resp = node.request('GET', 'https://lore.kernel.org/manifest.js.gz')
+            assert resp.status_code == 200
 
-    def test_failover_works(self, sample_mbox: bytes) -> None:
-        """First origin fails, second succeeds."""
-        node = LoreNode(
-            'https://lore.kernel.org/all',
-            fallback_urls=['http://mirror.local'],
-        )
-        mock_session = MagicMock()
-        mock_200 = MagicMock()
-        mock_200.status_code = 200
-        mock_session.get.side_effect = [
-            requests.ConnectionError('refused'),
-            mock_200,
-        ]
-        node.set_requests_session(mock_session)
+    def test_failover_works(self) -> None:
+        with responses.RequestsMock() as rsps:
+            """First origin fails, second succeeds."""
+            node = LoreNode(
+                'https://lore.kernel.org/all',
+                fallback_urls=['http://mirror.local'],
+            )
+            rsps.add(
+                responses.GET,
+                'http://mirror.local/manifest.js.gz',
+                body=requests.ConnectionError('refused'),
+            )
+            rsps.add(
+                responses.GET,
+                'https://lore.kernel.org/manifest.js.gz',
+                status=200,
+            )
 
-        resp = node.request('GET', 'https://lore.kernel.org/manifest.js.gz')
-        assert resp.status_code == 200
-        assert mock_session.get.call_count == 2
+            resp = node.request('GET', 'https://lore.kernel.org/manifest.js.gz')
+            assert resp.status_code == 200
+            assert len(rsps.calls) == 2
 
     def test_raises_remote_error_when_all_fail(self) -> None:
-        """RemoteError raised when every origin fails."""
-        node = LoreNode(
-            'https://lore.kernel.org/all',
-            fallback_urls=['http://mirror.local'],
-        )
-        mock_session = MagicMock()
-        mock_session.get.side_effect = requests.ConnectionError('refused')
-        node.set_requests_session(mock_session)
+        with responses.RequestsMock() as rsps:
+            """RemoteError raised when every origin fails."""
+            node = LoreNode(
+                'https://lore.kernel.org/all',
+                fallback_urls=['http://mirror.local'],
+            )
+            rsps.add(
+                responses.GET,
+                'http://mirror.local/manifest.js.gz',
+                body=requests.ConnectionError('refused'),
+            )
+            rsps.add(
+                responses.GET,
+                'https://lore.kernel.org/manifest.js.gz',
+                body=requests.ConnectionError('refused'),
+            )
 
-        with pytest.raises(RemoteError, match='All hosts failed'):
-            node.request('GET', 'https://lore.kernel.org/manifest.js.gz')
+            with pytest.raises(RemoteError, match='All hosts failed'):
+                node.request('GET', 'https://lore.kernel.org/manifest.js.gz')
 
     def test_kwargs_forwarded(self) -> None:
         """Extra kwargs (e.g. timeout) are passed through."""
         node = LoreNode('https://lore.kernel.org/all')
-        mock_session = MagicMock()
-        mock_resp = MagicMock()
-        mock_resp.status_code = 200
-        mock_session.get.return_value = mock_resp
-        node.set_requests_session(mock_session)
+        with patch.object(
+            node, '_request', return_value=MagicMock(status_code=200)
+        ) as mock_request:
+            node.request(
+                'GET',
+                'https://lore.kernel.org/manifest.js.gz',
+                timeout=30,
+            )
 
-        node.request(
+        mock_request.assert_called_once_with(
             'GET',
             'https://lore.kernel.org/manifest.js.gz',
+            raise_on_error=True,
             timeout=30,
         )
-        _, kwargs = mock_session.get.call_args
-        assert kwargs['timeout'] == 30
-
 
-# =====================================================================
-# Public API: user_agent_plus property
-# =====================================================================
+    # =====================================================================
+    # Public API: user_agent_plus property
+    # =====================================================================
 
 
 class TestUserAgentPlusProperty:

-- 
2.53.0

