Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257B639A801
	for <tools@linux.kernel.org>; Mon, 13 Apr 2026 22:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776118115; cv=none; b=hb5e0X/WlwkTRtaRVAKVexHgAKywQSCAwtlY+Pguw6ktOR7GqTowwNea76tWFmL0kNMQM6px1aKRcxTgokTewMnvZPcmE69MSBb7I6YwViyV/9aAqrNoNHIlRpAPG5WAiWOtDtT1ER4dyX4O8ItucTMfPDLujSyW07HSqelzXUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776118115; c=relaxed/simple;
	bh=h3K7CEANfVLJc/wnp1hjqPZAgvalnuoK+l5KrEqMblc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j0hGTYs5Fu9mhkYTOmH+q1VqIZxg2CIjCYxIyN4Rl8oGLmA4rFx0gycmoLIeIW1TRMlPL38NVusVb3MMK1/xKl/KdjwU/r+0tclH4DJD0hyhbZYipoqTbhXXf3IzZe/O6Ed5H3Ox7XC+TiPlU6qM2+w1cq/8fJzrssPMxQDzEPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Go5YOYEy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Go5YOYEy"
Received: by smtp.kernel.org (Postfix)
	id 1E373C2BCB5; Mon, 13 Apr 2026 22:08:35 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0C291C2BCB6
	for <tools@kernel.org>; Mon, 13 Apr 2026 22:08:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0C291C2BCB6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8cb40149037so463803485a.2
        for <tools@kernel.org>; Mon, 13 Apr 2026 15:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776118113; x=1776722913; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YBnn84XArLUx0zMuBIgoePqSqRpGZT7+Ch2XKVdJ4Cc=;
        b=Go5YOYEyW4iHVy8S9lMZjd4ju9OOZ/DNqBmgBt2RJP7utxhnBVCzZY6oS2Fd00lDRL
         N2b2pvpdp3MD7syf6m4ng7vW4xsc8kF4Bv0nwFOxYDT3ttOT6FkRx49nsHCj4U5v/1XZ
         KZnbbJ0fkYLmIm9A9PSbC/B+BS2c9+LknNzF4ewu6+ItwWt36zaQvHol5k/TUo0MdEjZ
         iVIpPO+rjsgUKgdhJEwf8BC5JyIY0Kc7/9Yb9BWe9iUq6MTqmq9cpTMDhq7PYGMeinpo
         yTQRLlmfG3UhSUAxiJICo1bR9lBHx+H+rsZpIP+SaTC0IuWaLccFQELcGEr5KAk4c2KP
         +g6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776118113; x=1776722913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YBnn84XArLUx0zMuBIgoePqSqRpGZT7+Ch2XKVdJ4Cc=;
        b=I6V5i16PBTFB573vBPpjMs75bor0I7w4W2rqa1Ewm7lYViIuZ0B+zw7cBO7k5vDOmI
         aOasaiz4qnEG/9ye3YDQXEmpu33enn1LiFoKKilxK/T/Ohn66+GsFbU6WomHVFtJ8VgD
         TDOHY+9gWBp8qX8w6Kne5L7gsn6G27JiogxTUGGETG1qP1x3H0K14cWj72rqEPHusOPD
         /Am9HYgOhD5vzsZJy0bGAqADnZyBHX9SXkxkDcSQd5pDT2FHmL3FUkibWkIKhlpQFhf1
         1LKYRUHDL9FheC1oY2JW0o8D6b5yzoEdfYRuLgYJJZJD8GHvMWmIvP58BznqalbeFHD6
         O5nQ==
X-Gm-Message-State: AOJu0YxnZQzyG/FPomZpwjlxHZKTp5CFI+e9r5I2nzKKMN/Isfj75i7b
	gO1+mWfNaP5YdQkPnFKdiK1hNerxnyzSbBiWt4LGi33gxUxbIJrwJiPx
X-Gm-Gg: AeBDies85ePk5HpzMftOrViVkQvmEx6vSoIVNf1WXNV1rh02a9rSoG6QEhNEcLFt3FH
	IxkXWmw9uJRMb2tNFA+m5hYYixMW3LRTc/uh7jqyHy8oOfR6R3E/Wn/3apqtWBbO/8WD5Wu7myT
	A2pk8zQOQDoalH2m4YVAejgIYLvqo/2/CflUEUgzhxXMNJova4RfV5jNNs214yZlhn6LbgNGq7s
	MRKEV+EGkvu1e/Iww1lPtxnwye+a4sL/kiYFSyKGfoi+i0xTdMvqp7bwYs/Q8saVtuBbXhDwMfI
	aYx02FrLNPNbQF/DDDxGTcdDQC4CYY5qDxpuaah+3w687JtweoezB3GArLe7LSFVWJTgjgEKr62
	T5kV9eF0Pqj3aRwNYsStX/GBfRt1RfqoewJd8pclYdBJJnH/4oWiywVjRQi0C/ndjxPDk7QY+5M
	nM9Tp7ez7qQI2Q0ayHHSAJlZABKImH4jxwHRTxMNsNhZN6KE3utrp0sZMbBBzDyamsT0LjuYAAy
	RgNBxwpGRumyAajZ99TbyIYZUnuo+FYSMX052mCUIaVlERgQI3ZHGa/GtYWFsWm4LQ1bmbYXDgu
	sfr+JbD8GqYP2HS9hqa9razx9n542Sa8Zu2dShemxWDfZ3j1UVZ5OeuYvmnD/4Hu
X-Received: by 2002:a05:620a:1a11:b0:8d6:838a:c97c with SMTP id af79cd13be357-8ddcf1b8a38mr2284020985a.32.1776118112751;
        Mon, 13 Apr 2026 15:08:32 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2600:4808:6353:5c00:c007:ed8:60aa:a884])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ddb8d6e387sm907506185a.30.2026.04.13.15.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 15:08:32 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 13 Apr 2026 18:08:24 -0400
Subject: [PATCH v2 10/14] Add authheaders stub and typed callable
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-harden-type-checking-v2-10-1ba6056288d9@gmail.com>
References: <20260413-harden-type-checking-v2-0-1ba6056288d9@gmail.com>
In-Reply-To: <20260413-harden-type-checking-v2-0-1ba6056288d9@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1776118098; l=6876;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=h3K7CEANfVLJc/wnp1hjqPZAgvalnuoK+l5KrEqMblc=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QELVySgfe6zV6Nmx+6EaL49gxmdHndAGkIShveZHaWrfIGr/1C7AsUroI51L/TslTfSgiradjWG
 PCud28Gafgwc=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

Add a generated authheaders stub under typings so the type checkers can
resolve the package. Then store authenticate_message directly on
LoreNode as a typed callable and update the authheaders tests to use
that shape.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 src/liblore/node.py              | 26 +++++++++++++++++++-------
 tests/test_auth_headers.py       | 31 ++++++++++++++++++-------------
 typings/authheaders/__init__.pyi | 13 +++++++++++++
 3 files changed, 50 insertions(+), 20 deletions(-)

diff --git a/src/liblore/node.py b/src/liblore/node.py
index f9817c1..8935dbf 100644
--- a/src/liblore/node.py
+++ b/src/liblore/node.py
@@ -13,11 +13,10 @@ import os
 import re
 import subprocess
 import time
-import types
 import urllib.parse
 from datetime import datetime, timezone
 from email.message import EmailMessage
-from typing import TYPE_CHECKING, TypedDict
+from typing import TYPE_CHECKING, Protocol, TypedDict
 
 import requests
 
@@ -44,6 +43,19 @@ class _LoreNodeInitKwargs(TypedDict, total=False):
     cache_ttl: int
 
 
+class _AuthenticateMessage(Protocol):
+    def __call__(
+        self,
+        msg: bytes,
+        authserv_id: str,
+        *,
+        dkim: bool = ...,
+        dmarc: bool = ...,
+        arc: bool = ...,
+        spf: bool = ...,
+    ) -> str: ...
+
+
 def _get_config_from_git(
     regexp: str,
     multivals: list[str] | None = None,
@@ -206,12 +218,12 @@ class LoreNode:
 
         if cache_dir is not None:
             os.makedirs(cache_dir, exist_ok=True)
-        self._authheaders: types.ModuleType | None = None
+        self._authenticate_message: _AuthenticateMessage | None = None
         if add_auth_headers:
             try:
-                import authheaders  # type: ignore[import-untyped]
+                import authheaders
 
-                self._authheaders = authheaders
+                self._authenticate_message = authheaders.authenticate_message
             except ImportError:
                 raise LibloreError(
                     'authheaders library is required for add_auth_headers. '
@@ -721,11 +733,11 @@ class LoreNode:
 
     def _authenticate_msgs(self, msgs: list[EmailMessage]) -> None:
         """Add Authentication-Results headers via authheaders."""
-        if self._authheaders is None:
+        if self._authenticate_message is None:
             return
         for msg in msgs:
             msg_bytes = msg.as_bytes()
-            auth_result = self._authheaders.authenticate_message(
+            auth_result = self._authenticate_message(
                 msg_bytes,
                 'liblore',
                 dkim=True,
diff --git a/tests/test_auth_headers.py b/tests/test_auth_headers.py
index b51050c..e149863 100644
--- a/tests/test_auth_headers.py
+++ b/tests/test_auth_headers.py
@@ -14,7 +14,12 @@ import pytest
 import responses
 
 from liblore import LibloreError
-from liblore.node import LoreNode
+from liblore.node import LoreNode, _AuthenticateMessage
+
+
+class _FakeAuthHeaders(ModuleType):
+    authenticate_message: _AuthenticateMessage
+
 
 # =====================================================================
 # Import-time validation
@@ -28,16 +33,16 @@ class TestAuthHeadersImport:
                 LoreNode(add_auth_headers=True)
 
     def test_ok_when_authheaders_installed(self) -> None:
-        fake = ModuleType('authheaders')
-        fake.authenticate_message = MagicMock()  # type: ignore[attr-defined]  # ty:ignore[unresolved-attribute]
+        fake = _FakeAuthHeaders('authheaders')
+        fake.authenticate_message = MagicMock()
         with patch.dict(sys.modules, {'authheaders': fake}):
             node = LoreNode(add_auth_headers=True)
-            assert node._authheaders is not None
+            assert node._authenticate_message is not None
             node.close()
 
     def test_default_is_disabled(self) -> None:
         node = LoreNode()
-        assert node._authheaders is None
+        assert node._authenticate_message is None
         node.close()
 
 
@@ -55,8 +60,8 @@ class TestAuthenticateMsgs:
         assert 'Authentication-Results' not in msg
 
     def test_adds_header_when_enabled(self) -> None:
-        fake = ModuleType('authheaders')
-        fake.authenticate_message = MagicMock(  # type: ignore[attr-defined]  # ty:ignore[unresolved-attribute]
+        fake = _FakeAuthHeaders('authheaders')
+        fake.authenticate_message = MagicMock(
             return_value='Authentication-Results: liblore; dkim=pass header.d=example.com',
         )
         with patch.dict(sys.modules, {'authheaders': fake}):
@@ -81,8 +86,8 @@ class TestAuthenticateMsgs:
             node.close()
 
     def test_skips_empty_result(self) -> None:
-        fake = ModuleType('authheaders')
-        fake.authenticate_message = MagicMock(return_value='')  # type: ignore[attr-defined]  # ty:ignore[unresolved-attribute]
+        fake = _FakeAuthHeaders('authheaders')
+        fake.authenticate_message = MagicMock(return_value='')
         with patch.dict(sys.modules, {'authheaders': fake}):
             node = LoreNode(add_auth_headers=True)
             msg = EmailMessage()
@@ -94,8 +99,8 @@ class TestAuthenticateMsgs:
             node.close()
 
     def test_multiple_messages(self) -> None:
-        fake = ModuleType('authheaders')
-        fake.authenticate_message = MagicMock(  # type: ignore[attr-defined]  # ty:ignore[unresolved-attribute]
+        fake = _FakeAuthHeaders('authheaders')
+        fake.authenticate_message = MagicMock(
             side_effect=[
                 'liblore; dkim=pass',
                 'Authentication-Results: liblore; dkim=fail',
@@ -125,8 +130,8 @@ class TestAuthenticateMsgs:
 class TestAuthInFetchMethods:
     @pytest.fixture()
     def auth_node(self) -> Iterator[tuple[LoreNode, responses.RequestsMock]]:
-        fake = ModuleType('authheaders')
-        fake.authenticate_message = MagicMock(  # type: ignore[attr-defined]  # ty:ignore[unresolved-attribute]
+        fake = _FakeAuthHeaders('authheaders')
+        fake.authenticate_message = MagicMock(
             return_value='Authentication-Results: liblore; dkim=pass',
         )
         with patch.dict(sys.modules, {'authheaders': fake}):
diff --git a/typings/authheaders/__init__.pyi b/typings/authheaders/__init__.pyi
new file mode 100644
index 0000000..ed4f61e
--- /dev/null
+++ b/typings/authheaders/__init__.pyi
@@ -0,0 +1,13 @@
+"""
+This type stub file was generated by pyright.
+"""
+
+def authenticate_message(
+    msg: bytes,
+    authserv_id: str,
+    *,
+    dkim: bool = ...,
+    dmarc: bool = ...,
+    arc: bool = ...,
+    spf: bool = ...,
+) -> str: ...

-- 
2.53.0

