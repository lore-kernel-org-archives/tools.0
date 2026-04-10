Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A39D3A6F19
	for <tools@linux.kernel.org>; Fri, 10 Apr 2026 22:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775860688; cv=none; b=GnwBj58jNImTHaV3slk2yWP9qPSijGRjkkU6pDWNBsIXY+ND5Ky6d/4XhbS3Gu8wES1xM4eioU5wwa4Thbw3d6oz+yBDEVrjVQy0/VsNKV7GUZ8TQmBtU4d2cYn3ImEGwSUVYCMS9OV137VVTQtiqf9RNWsy1pxIvLp8Z2+unQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775860688; c=relaxed/simple;
	bh=mNLyHRWv9/6X9CqWG0J3mCRoc71fHJ7gyWOF8hIBeNI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hZWyNp9XazGguJAih33VYijZJqIpVMlyoCNoa4bheGlHHrbkNVoIIgzE8mgAsp0CK89m7nPPmSAYfKz4hwFFiypV+OqKEU/B1KUnMUMbqq0C13YxwkOI2fGqne7am345MUTK4XfmzEyYfO18VLfePjCEYMgfooWCiHrCk421XCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H2f7Cx17; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H2f7Cx17"
Received: by smtp.kernel.org (Postfix)
	id 44E73C2BC9E; Fri, 10 Apr 2026 22:38:08 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3D3C4C2BCB0
	for <tools@kernel.org>; Fri, 10 Apr 2026 22:38:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3D3C4C2BCB0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-89fc349b5c2so20625796d6.0
        for <tools@kernel.org>; Fri, 10 Apr 2026 15:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775860686; x=1776465486; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HXkKdcQ2v7PcMRU1WORbUWDiLKed1gHsToRx4Y02yDo=;
        b=H2f7Cx17TSElT689tRC9CqxjIN/7rtYGZphdwSXrc0ZL03u7CydVXM47jlEt9EzvFV
         g5mS/5jeQbhsM88ymJxrTivbETjnNRozIMepDnkG6fPhBlsT1UM9uIFVY0Lbq30dCgHI
         zOdlVX4C3aqH0fnE0ZW7J0oRshboJ0M1W+93hN8YiptqoDzEwaiB5ukZRwdUYTJla81q
         AzUeuxt++vbEgpR7fQMf4nz4zWUItINp5afl7yCPjtaHD3B3YQJw4UDQLMnNejd5AODb
         WLPKMHZ6xB7I0VC2/8MYsCiq1GjjiqdexOhz6gWjT1+RxjEzIGmccc2dTpYnGAxJwu0y
         O2kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775860686; x=1776465486;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HXkKdcQ2v7PcMRU1WORbUWDiLKed1gHsToRx4Y02yDo=;
        b=dxmPFejAPz+0jhieU0maU6h6RSUWxojRfDiptQFv73gUdjdiisSDUuYR0JEY2FJuTD
         86IDwNimgxkAqkXosNv/qTAS161MFXoo1P69v4qATUzkAhgCQ8r6Emg9+sp5D/XpH1di
         MHHEYesT3SH5K70gq56pREx1SzMfhZ2gn5SgNjqvP88JTFInsVDUk79JJIZ4UR+0Uu37
         DNpxG5uiyTI/DQ2/jSahk5SABcp8FZGmk9CaCQYCT4l3/AW57D1bGK/eSO2INiLfkapL
         f2GQ6BbfzX4zNR+61bJz7HgNGQxei3NCiOzJO7hp61BYmWyK2iVvw/ZXc+Uke2Cxh0FH
         5CtA==
X-Gm-Message-State: AOJu0YytMbnpEFiMM8Ac0/ECrUOzwxGqOFLCA/uRa/OVQg96/ZAIBwMP
	QN4bcFBwOgVMRKGcj/0YhSWMVYBzLs0l06PZVLWkP4U1Yy2pDgUmJ2zA3KM93w==
X-Gm-Gg: AeBDieus/lOTDN52QVNkuv1tQQbB2owj8e4WlXWlwz58c1TeQkYz4V76I4dvbAtAgGN
	BaFV9E1Opj6yJnJJr03WccOpQqhWjoiamGGrE6ANimsCV5nrkOy/k+pE7lpB0Q5lxKRSEGS0kJT
	qGcEzCw4Iw4eIP+cmUvQC+qJOncc8CNZKx+lCtHB2H2MStTUfdT4nzgTCV2caEkqEYTQx4mtmbx
	qW4IAEBZD58MZUN+UnT8EERsir0QPolQKr0HIi0Qr2gp+pIm7+j6d31XCpcaqWGQDzrbH0V3CDx
	4QveumrS0TvS7hF6XcN/tY7hYYel3Bh+f7fY717YNME3WITUJiKr7NT6M1dmO+d9aXuTicPYpN1
	UgM14D5YBQ1SsBp+/juk6rBijZtdpib7XyXO55pPYd7EX+sgsTrU0BVrPFYGkXRW8DGcC9hSo7k
	v/xJscH+sqPJiKPQ221JZnu0y05WHzRw+iUobF3yHlGNG+8OOhlYcNzUTRgLfBO08LpZ9ghP4r0
	P+ClN1l36YVrZng/x7ERU3/9IZI6ji1lllMFqvgSOKQfMbVAeWMb0HXYF6xKnPJZLKdzG64UPhQ
	JREIiLBIZAjrmg2uR0lF59k8fgdDHf2sNgor3ON8ZPU1u/anWkfQ
X-Received: by 2002:a05:6214:611c:b0:8a1:2f43:1038 with SMTP id 6a1803df08f44-8ac862915b8mr68297356d6.29.1775860686030;
        Fri, 10 Apr 2026 15:38:06 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([208.80.35.36])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ac849db735sm41370096d6.2.2026.04.10.15.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 15:38:05 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 10 Apr 2026 18:38:01 -0400
Subject: [PATCH 10/14] Add authheaders stub and typed callable
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-harden-type-checking-v1-10-fcf314d9d748@gmail.com>
References: <20260410-harden-type-checking-v1-0-fcf314d9d748@gmail.com>
In-Reply-To: <20260410-harden-type-checking-v1-0-fcf314d9d748@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1775860675; l=6876;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=mNLyHRWv9/6X9CqWG0J3mCRoc71fHJ7gyWOF8hIBeNI=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QAr9lMmkMQbhxqhhtVaThAiq2kTVBFwINeHeTlOL4em5JXeKFYLSevSkKmU9mxMs7GotP9q4y2W
 ++EOxxtwjgQM=
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
index 4835169..4d38bdf 100644
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

