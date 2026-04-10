Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFE53DF01A
	for <tools@linux.kernel.org>; Fri, 10 Apr 2026 22:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775860681; cv=none; b=qo1+1pUzaP9BRB4SHsbw/KM7f2caZp/OoVyoV1fUJNSNQF2+gYJvbR7G/61bPDuS5aHwOYq89pkrafPn8od3Yg9FWjM0mk9JG/f1Q39bC6qt5QYSGgCwCBGQtITDIVsquuP33yjdoPkk5SFa/FLyvkVRl4l4WvB/eLFHqhTgHQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775860681; c=relaxed/simple;
	bh=gCzP3bDi2EO/ZVtCST8fRc4HF5DzOp1olnMiQN56NLM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bMSQr4bL0Bthjiu7lzLppcvg3X3EgCPIQiHcvEX8bwFPo8/AkWpYazPTL2vcYQ4pBCiVNuxJHgU8xOHyE/5H/MZFa3ATz2h9jyHjBvsG24kUxPatRgxcJS3lC3Abyy3KPqLFAVCNj4iBQFbq47Q4c13ud9SzaOPJuSfiiE3Zlsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qzs/lrZh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qzs/lrZh"
Received: by smtp.kernel.org (Postfix)
	id AA7D3C19421; Fri, 10 Apr 2026 22:38:01 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C3722C19424
	for <tools@kernel.org>; Fri, 10 Apr 2026 22:37:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C3722C19424
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8d583bfc415so388984385a.2
        for <tools@kernel.org>; Fri, 10 Apr 2026 15:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775860679; x=1776465479; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AJ31O9GfSLmGLiGY1j1WNcXQJA/TXMiluvpWrjAYJic=;
        b=qzs/lrZhgNLCa4DiolQAGLktJy6y+mtxS2eejiiZHa0pLTmrC8faaBdDtYmIl1K7Jv
         Qik0P3OdccjSFGuBLU0fcbSX/9np+Gr0PKz7WLtfhRr8pWz90a3NDXH4jOAuZ/75deKm
         i5PI4piR/IObdFn6i5yJqS6UjtjOoA/pQQYsemHUW3R4YUUvaoxtRSyGZcXIOOfg12r6
         jI/BZ8NHMsx+nSHsbir8MSOSemwxNySZHJEcLbGuOv/kl6xyNDZ+t2QBO5Sq9z+ObHnb
         MaHUmngOIlbuGhJOPMqqW4HlYDh56Afwc9vYncOOeD2rfpYRTxEiQCnKv10N3yZk9/Nf
         aQkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775860679; x=1776465479;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AJ31O9GfSLmGLiGY1j1WNcXQJA/TXMiluvpWrjAYJic=;
        b=LSwK98/mfQ6mAPYMuZCZdTprtxz6LFWZA+W/PLWeWSOKnNLUbdOBplcbew6yBGypz6
         Rd81CGo2qbtlttdyG4hSzynYQYtIqTEBiIt0ynUnp+DmoHVW3Zph0F5vepesOkLksEYf
         LDMncOQKFIrgiwSjm6Jc7yktQkQ20SNR8AvWjfgWH7ldNCpM9ztS5YS0bB/po4oNT7SG
         bqz1FqCdlv5g7zHs30fhvM0HF+CpSoc/ICRNMmOEPBs32Czx0nm4KCrrNCNKlQoOkHN3
         +IiB+MmS2t24RaLRYY8Z+LaDx+ITOirfKtsFcs5S3sLK49fDmj3NXOCoEE2mqTz8rvPb
         jMKQ==
X-Gm-Message-State: AOJu0Yy+Gbc2Xn8+vI/1zakqIB52MJLQuvTOkYe+yBZZB8E9pDD1Vxvj
	WdKpbC5T0R44ehkDbXAcYNxB9Vn3U8g6MbA97IQRRQYiwPOydx9IpEcl
X-Gm-Gg: AeBDiesWhK8wZoU+hMkeUKPuw0U3hgOnxQYNcVtzXiuMnvDF7RsithpleUhG0WXwija
	2gr5JMIhwUhHYh47IX6T8a5r9gpcK6SdqWzKQxw0ss5o8awOjhB6ngqr7kx2Ops6hLULpN3TlzV
	tqM3K2DkqIOOqjUt2HRQx+gy1tNDCaRtfIYRc546OWkqTex8lr23Qdqy5JCVRXKfJOBAh7IGAUa
	Rtb00WetfPNbC+lhMR4kfXPrR2wLcukusNah+rANL6MPIxQpPA7V1B5+t8LPYUxy9kYJ6Riyhx4
	k64Y0thgLLUyNLM50vlzzAsSStCfvsbU8D8oIc4ezwaDAMPw7MPwMFMhfEEXhlPLW1ipn/EsOlF
	RSQ5BrIk7umXPEpjCl/KYGSZ21388jfcx6IWn296xNQ119gRDDQuIEISBaBhjpMh7emVR9fO0gk
	ML/t+Xga0quRKtGfblYiDhaekVkbWETPDo7yKdzgC69cPLxMfqRR5FJQ9FQPeaBp6UHltUl2GVt
	oXjlZhki9roT+PkqbZYeqx515uwqzpx82Q1ix75BoFGkoHOx2Czy6tqBTEOeHmbZQSC3FZ4uxb8
	hSB8iPoqOrRegNSI2HpCYpY8wnvOsH4P+fSvLVM8fz+y+H0pPrDs
X-Received: by 2002:a05:620a:4504:b0:8cd:8569:b945 with SMTP id af79cd13be357-8ddcd40a014mr758624085a.13.1775860678499;
        Fri, 10 Apr 2026 15:37:58 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([208.80.35.36])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ac849db735sm41370096d6.2.2026.04.10.15.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 15:37:57 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 10 Apr 2026 18:37:53 -0400
Subject: [PATCH 02/14] Type make_msg and drop test suppressions
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260410-harden-type-checking-v1-2-fcf314d9d748@gmail.com>
References: <20260410-harden-type-checking-v1-0-fcf314d9d748@gmail.com>
In-Reply-To: <20260410-harden-type-checking-v1-0-fcf314d9d748@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1775860674; l=26459;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=gCzP3bDi2EO/ZVtCST8fRc4HF5DzOp1olnMiQN56NLM=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QFUrpD5S42suND5B6sv+I8pR/eidDuhWnFyAZ3jAmjOTLfa900ZHdKb9pUW1bdS6cYnqK7QJyFk
 Q6ot73uaBRAU=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

Replace the make_msg class helper with a typed callable fixture and
update tests to call it directly. This keeps argument checking in the
tests while simplifying the fixture implementation.

Remove the temporary mypy suppressions now that the underlying typing
issues are fixed in the test code.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 pyproject.toml             | 13 --------
 tests/conftest.py          | 79 ++++++++++++++++++++++++++--------------------
 tests/test_auth_headers.py |  4 +--
 tests/test_email_utils.py  | 60 ++++++++++++++++++-----------------
 tests/test_formatting.py   | 74 ++++++++++++++++++++++---------------------
 tests/test_message.py      | 10 +++---
 tests/test_thread.py       | 34 ++++++++++----------
 7 files changed, 140 insertions(+), 134 deletions(-)

diff --git a/pyproject.toml b/pyproject.toml
index e31a05c..7c9e1da 100644
--- a/pyproject.toml
+++ b/pyproject.toml
@@ -57,18 +57,5 @@ strict = true
 module = "authheaders"
 ignore_missing_imports = true
 
-[[tool.mypy.overrides]]
-module = [
-    "test_email_utils",
-    "test_formatting",
-    "test_message",
-    "test_thread",
-]
-disable_error_code = ["attr-defined"]
-
-[[tool.mypy.overrides]]
-module = "test_auth_headers"
-disable_error_code = ["unused-ignore"]
-
 [tool.ruff]
 target-version = "py39"
diff --git a/tests/conftest.py b/tests/conftest.py
index cf1a9c7..b84fc35 100644
--- a/tests/conftest.py
+++ b/tests/conftest.py
@@ -4,6 +4,7 @@ from __future__ import annotations
 
 import email.utils
 import textwrap
+from typing import Protocol
 
 import pytest
 
@@ -12,41 +13,51 @@ from email.message import EmailMessage
 from liblore import emlpolicy
 
 
+class MsgFactory(Protocol):
+    def __call__(
+        self,
+        subject: str = ...,
+        from_addr: tuple[str, str] = ...,
+        msgid: str | None = ...,
+        in_reply_to: str | None = ...,
+        references: list[str] | None = ...,
+        body: str = ...,
+        date: str | None = ...,
+    ) -> EmailMessage: ...
+
+
 @pytest.fixture()
-def make_msg() -> type:
-    """Factory fixture that returns a helper class for building test messages."""
-
-    class MsgFactory:
-        _counter = 0
-
-        @classmethod
-        def create(
-            cls,
-            subject: str = 'Test message',
-            from_addr: tuple[str, str] = ('Test User', 'test@example.com'),
-            msgid: str | None = None,
-            in_reply_to: str | None = None,
-            references: list[str] | None = None,
-            body: str = 'Hello, world!\n',
-            date: str | None = None,
-        ) -> EmailMessage:
-            cls._counter += 1
-            if msgid is None:
-                msgid = f'msg{cls._counter}@example.com'
-            msg = EmailMessage(policy=emlpolicy)
-            msg['Subject'] = subject
-            msg['From'] = email.utils.formataddr(from_addr)
-            msg['Message-Id'] = f'<{msgid}>'
-            if in_reply_to:
-                msg['In-Reply-To'] = f'<{in_reply_to}>'
-            if references:
-                msg['References'] = ' '.join(f'<{r}>' for r in references)
-            if date:
-                msg['Date'] = date
-            msg.set_content(body)
-            return msg
-
-    return MsgFactory
+def make_msg() -> MsgFactory:
+    """Factory fixture that returns a helper callable for test messages."""
+    counter = 0
+
+    def create(
+        subject: str = 'Test message',
+        from_addr: tuple[str, str] = ('Test User', 'test@example.com'),
+        msgid: str | None = None,
+        in_reply_to: str | None = None,
+        references: list[str] | None = None,
+        body: str = 'Hello, world!\n',
+        date: str | None = None,
+    ) -> EmailMessage:
+        nonlocal counter
+        counter += 1
+        if msgid is None:
+            msgid = f'msg{counter}@example.com'
+        msg = EmailMessage(policy=emlpolicy)
+        msg['Subject'] = subject
+        msg['From'] = email.utils.formataddr(from_addr)
+        msg['Message-Id'] = f'<{msgid}>'
+        if in_reply_to:
+            msg['In-Reply-To'] = f'<{in_reply_to}>'
+        if references:
+            msg['References'] = ' '.join(f'<{r}>' for r in references)
+        if date:
+            msg['Date'] = date
+        msg.set_content(body)
+        return msg
+
+    return create
 
 
 @pytest.fixture()
diff --git a/tests/test_auth_headers.py b/tests/test_auth_headers.py
index 6c524b5..9edf4cd 100644
--- a/tests/test_auth_headers.py
+++ b/tests/test_auth_headers.py
@@ -67,8 +67,8 @@ class TestAuthenticateMsgs:
             assert msg['Authentication-Results'] == (
                 'liblore; dkim=pass header.d=example.com'
             )
-            fake.authenticate_message.assert_called_once()  # type: ignore[attr-defined]
-            call_kwargs = fake.authenticate_message.call_args  # type: ignore[attr-defined]
+            fake.authenticate_message.assert_called_once()
+            call_kwargs = fake.authenticate_message.call_args
             assert call_kwargs[0][1] == 'liblore'
             assert call_kwargs[1]['dkim'] is True
             assert call_kwargs[1]['dmarc'] is True
diff --git a/tests/test_email_utils.py b/tests/test_email_utils.py
index 97c4ff3..ad8775f 100644
--- a/tests/test_email_utils.py
+++ b/tests/test_email_utils.py
@@ -4,6 +4,8 @@ from __future__ import annotations
 
 from email.message import EmailMessage
 
+from conftest import MsgFactory
+
 from liblore import emlpolicy
 from liblore.utils import (
     msg_get_author,
@@ -16,43 +18,43 @@ from liblore.utils import (
 
 
 class TestMsgGetSubject:
-    def test_plain_subject(self, make_msg: type) -> None:
-        msg = make_msg.create(subject='Just a plain subject')
+    def test_plain_subject(self, make_msg: MsgFactory) -> None:
+        msg = make_msg(subject='Just a plain subject')
         assert msg_get_subject(msg) == 'Just a plain subject'
 
-    def test_no_strip(self, make_msg: type) -> None:
-        msg = make_msg.create(subject='[PATCH v3 2/5] subsys: fix thing')
+    def test_no_strip(self, make_msg: MsgFactory) -> None:
+        msg = make_msg(subject='[PATCH v3 2/5] subsys: fix thing')
         assert msg_get_subject(msg) == '[PATCH v3 2/5] subsys: fix thing'
 
-    def test_strip_patch_prefix(self, make_msg: type) -> None:
-        msg = make_msg.create(subject='[PATCH v3 2/5] subsys: fix thing')
+    def test_strip_patch_prefix(self, make_msg: MsgFactory) -> None:
+        msg = make_msg(subject='[PATCH v3 2/5] subsys: fix thing')
         assert msg_get_subject(msg, strip_prefixes=True) == 'subsys: fix thing'
 
-    def test_strip_re_and_prefix(self, make_msg: type) -> None:
-        msg = make_msg.create(subject='Re: [PATCH] Something cool')
+    def test_strip_re_and_prefix(self, make_msg: MsgFactory) -> None:
+        msg = make_msg(subject='Re: [PATCH] Something cool')
         assert msg_get_subject(msg, strip_prefixes=True) == 'Something cool'
 
-    def test_strip_multiple_prefixes(self, make_msg: type) -> None:
-        msg = make_msg.create(subject='[RFC PATCH v2 0/3] [net-next] New feature')
+    def test_strip_multiple_prefixes(self, make_msg: MsgFactory) -> None:
+        msg = make_msg(subject='[RFC PATCH v2 0/3] [net-next] New feature')
         result = msg_get_subject(msg, strip_prefixes=True)
         assert result == 'New feature'
 
-    def test_strip_aw_prefix(self, make_msg: type) -> None:
-        msg = make_msg.create(subject='Aw: [PATCH] German reply')
+    def test_strip_aw_prefix(self, make_msg: MsgFactory) -> None:
+        msg = make_msg(subject='Aw: [PATCH] German reply')
         assert msg_get_subject(msg, strip_prefixes=True) == 'German reply'
 
     def test_no_subject(self) -> None:
         msg = EmailMessage(policy=emlpolicy)
         assert msg_get_subject(msg) == ''
 
-    def test_strip_no_brackets(self, make_msg: type) -> None:
-        msg = make_msg.create(subject='No brackets here')
+    def test_strip_no_brackets(self, make_msg: MsgFactory) -> None:
+        msg = make_msg(subject='No brackets here')
         assert msg_get_subject(msg, strip_prefixes=True) == 'No brackets here'
 
 
 class TestMsgGetAuthor:
-    def test_normal_from(self, make_msg: type) -> None:
-        msg = make_msg.create(from_addr=('Jane Doe', 'jane@example.com'))
+    def test_normal_from(self, make_msg: MsgFactory) -> None:
+        msg = make_msg(from_addr=('Jane Doe', 'jane@example.com'))
         name, addr = msg_get_author(msg)
         assert name == 'Jane Doe'
         assert addr == 'jane@example.com'
@@ -72,23 +74,23 @@ class TestMsgGetAuthor:
 
 
 class TestMsgGetPayload:
-    def test_plain_body(self, make_msg: type) -> None:
-        msg = make_msg.create(body='This is the body.\n')
+    def test_plain_body(self, make_msg: MsgFactory) -> None:
+        msg = make_msg(body='This is the body.\n')
         assert 'This is the body.' in msg_get_payload(msg)
 
-    def test_strip_signature(self, make_msg: type) -> None:
-        msg = make_msg.create(body='Body text.\n-- \nMy Sig\n')
+    def test_strip_signature(self, make_msg: MsgFactory) -> None:
+        msg = make_msg(body='Body text.\n-- \nMy Sig\n')
         result = msg_get_payload(msg, strip_signature=True)
         assert 'Body text.' in result
         assert 'My Sig' not in result
 
-    def test_keep_signature(self, make_msg: type) -> None:
-        msg = make_msg.create(body='Body text.\n-- \nMy Sig\n')
+    def test_keep_signature(self, make_msg: MsgFactory) -> None:
+        msg = make_msg(body='Body text.\n-- \nMy Sig\n')
         result = msg_get_payload(msg, strip_signature=False)
         assert 'My Sig' in result
 
-    def test_strip_quoted(self, make_msg: type) -> None:
-        msg = make_msg.create(body='My reply.\n> Quoted line.\nMore text.\n')
+    def test_strip_quoted(self, make_msg: MsgFactory) -> None:
+        msg = make_msg(body='My reply.\n> Quoted line.\nMore text.\n')
         result = msg_get_payload(msg, strip_quoted=True)
         assert 'My reply.' in result
         assert 'Quoted line.' not in result
@@ -118,12 +120,12 @@ class TestMsgGetRecipients:
 
 
 class TestSortMsgsByReceived:
-    def test_sorts_by_date(self, make_msg: type) -> None:
-        msg1 = make_msg.create(
+    def test_sorts_by_date(self, make_msg: MsgFactory) -> None:
+        msg1 = make_msg(
             msgid='older@x.com',
             date='Mon, 01 Jan 2024 00:00:00 +0000',
         )
-        msg2 = make_msg.create(
+        msg2 = make_msg(
             msgid='newer@x.com',
             date='Tue, 02 Jan 2024 00:00:00 +0000',
         )
@@ -132,8 +134,8 @@ class TestSortMsgsByReceived:
         assert result[0]['Message-Id'] == '<older@x.com>'
         assert result[1]['Message-Id'] == '<newer@x.com>'
 
-    def test_skips_dateless(self, make_msg: type) -> None:
-        msg = make_msg.create()
+    def test_skips_dateless(self, make_msg: MsgFactory) -> None:
+        msg = make_msg()
         # No Date header set at all — del it if make_msg added one
         if 'Date' in msg:
             del msg['Date']
diff --git a/tests/test_formatting.py b/tests/test_formatting.py
index 45afa64..a13593e 100644
--- a/tests/test_formatting.py
+++ b/tests/test_formatting.py
@@ -6,6 +6,8 @@ import pytest
 
 from email.message import EmailMessage
 
+from conftest import MsgFactory
+
 from liblore.utils import (
     clean_header,
     format_addrs,
@@ -165,9 +167,9 @@ class TestGetMsgAsBytes:
 
 
 class TestMinimizeThread:
-    def test_headers_filtered(self, make_msg: type) -> None:
+    def test_headers_filtered(self, make_msg: MsgFactory) -> None:
         """Only headers in MINIMIZE_KEEP_HEADERS are kept."""
-        msg = make_msg.create(subject='Test', body='Hello.\n')
+        msg = make_msg(subject='Test', body='Hello.\n')
         msg['X-Custom'] = 'should be dropped'
         msg['List-Id'] = '<test.example.com>'
         result = minimize_thread([msg])
@@ -176,9 +178,9 @@ class TestMinimizeThread:
         assert result[0]['X-Custom'] is None
         assert result[0]['List-Id'] is None
 
-    def test_keep_headers_default(self, make_msg: type) -> None:
+    def test_keep_headers_default(self, make_msg: MsgFactory) -> None:
         """All default MINIMIZE_KEEP_HEADERS are preserved when present."""
-        msg = make_msg.create(
+        msg = make_msg(
             subject='Test',
             from_addr=('Alice', 'alice@example.com'),
             body='Hello.\n',
@@ -200,9 +202,9 @@ class TestMinimizeThread:
         assert mmsg['Reply-To'] is not None
         assert mmsg['In-Reply-To'] is not None
 
-    def test_custom_keep_headers(self, make_msg: type) -> None:
+    def test_custom_keep_headers(self, make_msg: MsgFactory) -> None:
         """Callers can override which headers to keep."""
-        msg = make_msg.create(subject='Test', body='Hello.\n',
+        msg = make_msg(subject='Test', body='Hello.\n',
                               date='Mon, 01 Jan 2024 00:00:00 +0000')
         result = minimize_thread([msg], keep_headers=('Subject',))
         assert len(result) == 1
@@ -210,10 +212,10 @@ class TestMinimizeThread:
         assert result[0]['From'] is None
         assert result[0]['Date'] is None
 
-    def test_multi_level_quotes_stripped(self, make_msg: type) -> None:
+    def test_multi_level_quotes_stripped(self, make_msg: MsgFactory) -> None:
         """Lines with >> (multi-level quoting) are removed."""
         body = 'My reply.\n> Single quote.\n>> Double quote.\nMore text.\n'
-        msg = make_msg.create(body=body)
+        msg = make_msg(body=body)
         result = minimize_thread([msg])
         assert len(result) == 1
         text = result[0].get_payload()
@@ -222,26 +224,26 @@ class TestMinimizeThread:
         assert 'Double quote.' not in text
         assert 'More text.' in text
 
-    def test_empty_quote_lines_stripped(self, make_msg: type) -> None:
+    def test_empty_quote_lines_stripped(self, make_msg: MsgFactory) -> None:
         """Bare '>' lines are cleaned up."""
         body = 'Reply.\n>\n> Real quote.\nMore text.\n'
-        msg = make_msg.create(body=body)
+        msg = make_msg(body=body)
         result = minimize_thread([msg])
         text = result[0].get_payload()
         assert 'Reply.' in text
         assert 'Real quote.' in text
         assert 'More text.' in text
 
-    def test_bottom_quotes_dropped(self, make_msg: type) -> None:
+    def test_bottom_quotes_dropped(self, make_msg: MsgFactory) -> None:
         """Trailing quoted blocks at the end of a message are dropped."""
         body = 'My reply.\n> Original message.\n'
-        msg = make_msg.create(body=body)
+        msg = make_msg(body=body)
         result = minimize_thread([msg])
         text = result[0].get_payload()
         assert 'My reply.' in text
         assert 'Original message.' not in text
 
-    def test_diff_preserved(self, make_msg: type) -> None:
+    def test_diff_preserved(self, make_msg: MsgFactory) -> None:
         """Messages with diff content are not minimized."""
         body = (
             '> Quoted context.\n'
@@ -252,42 +254,42 @@ class TestMinimizeThread:
             '-old\n'
             '+new\n'
         )
-        msg = make_msg.create(body=body)
+        msg = make_msg(body=body)
         result = minimize_thread([msg])
         text = result[0].get_payload()
         assert 'diff --git' in text
         assert 'Quoted context.' in text
 
-    def test_diffstat_preserved(self, make_msg: type) -> None:
+    def test_diffstat_preserved(self, make_msg: MsgFactory) -> None:
         """Messages with diffstat content are not minimized."""
         body = '> Quoted.\n 3 files changed, 10 insertions(+), 5 deletions(-)\n'
-        msg = make_msg.create(body=body)
+        msg = make_msg(body=body)
         result = minimize_thread([msg])
         text = result[0].get_payload()
         assert 'Quoted.' in text
         assert '3 files changed' in text
 
-    def test_empty_after_minimize_dropped(self, make_msg: type) -> None:
+    def test_empty_after_minimize_dropped(self, make_msg: MsgFactory) -> None:
         """Messages that become empty after minimization are dropped."""
         body = '> Only quoted text.\n>> And deeper quotes.\n'
-        msg = make_msg.create(body=body)
+        msg = make_msg(body=body)
         result = minimize_thread([msg])
         assert len(result) == 0
 
-    def test_signature_preserved(self, make_msg: type) -> None:
+    def test_signature_preserved(self, make_msg: MsgFactory) -> None:
         """Compliant signatures are kept after quote processing."""
         body = 'My reply.\n-- \nJane Doe\n'
-        msg = make_msg.create(body=body)
+        msg = make_msg(body=body)
         result = minimize_thread([msg])
         text = result[0].get_payload()
         assert 'My reply.' in text
         assert '-- \n' in text
         assert 'Jane Doe' in text
 
-    def test_trailing_quote_before_sig_dropped(self, make_msg: type) -> None:
+    def test_trailing_quote_before_sig_dropped(self, make_msg: MsgFactory) -> None:
         """A trailing quoted block before a signature is dropped."""
         body = 'My reply.\n> Huge quoted original.\n> More quoting.\n-- \nJane Doe\n'
-        msg = make_msg.create(body=body)
+        msg = make_msg(body=body)
         result = minimize_thread([msg])
         text = result[0].get_payload()
         assert 'My reply.' in text
@@ -295,14 +297,14 @@ class TestMinimizeThread:
         assert 'More quoting.' not in text
         assert 'Jane Doe' in text
 
-    def test_only_quotes_before_sig_dropped(self, make_msg: type) -> None:
+    def test_only_quotes_before_sig_dropped(self, make_msg: MsgFactory) -> None:
         """Message with only quotes before a signature is dropped entirely."""
         body = '> Only quoted text.\n-- \nJane Doe\n'
-        msg = make_msg.create(body=body)
+        msg = make_msg(body=body)
         result = minimize_thread([msg])
         assert len(result) == 0
 
-    def test_reduce_quote_context(self, make_msg: type) -> None:
+    def test_reduce_quote_context(self, make_msg: MsgFactory) -> None:
         """Long quoted blocks are reduced to the last paragraph."""
         body = (
             'On Monday, Julius Caesar wrote:\n'
@@ -318,7 +320,7 @@ class TestMinimizeThread:
             '> Third paragraph line two.\n'
             'My reply here.\n'
         )
-        msg = make_msg.create(body=body)
+        msg = make_msg(body=body)
         result = minimize_thread([msg], reduce_quote_context=True)
         text = result[0].get_payload()
         assert '... skip 7 lines ...' in text
@@ -328,7 +330,7 @@ class TestMinimizeThread:
         assert 'Second paragraph' not in text
         assert 'My reply here.' in text
 
-    def test_reduce_quote_context_short_quote_untouched(self, make_msg: type) -> None:
+    def test_reduce_quote_context_short_quote_untouched(self, make_msg: MsgFactory) -> None:
         """Quotes with 5 or fewer skippable lines are left alone."""
         body = (
             '> Line one.\n'
@@ -337,29 +339,29 @@ class TestMinimizeThread:
             '> Last para.\n'
             'Reply.\n'
         )
-        msg = make_msg.create(body=body)
+        msg = make_msg(body=body)
         result = minimize_thread([msg], reduce_quote_context=True)
         text = result[0].get_payload()
         assert 'skip' not in text
         assert 'Line one.' in text
         assert 'Last para.' in text
 
-    def test_reduce_quote_context_off_by_default(self, make_msg: type) -> None:
+    def test_reduce_quote_context_off_by_default(self, make_msg: MsgFactory) -> None:
         """Long quotes are untouched when reduce_quote_context is False."""
         lines = ''.join(f'> Line {i}.\n' for i in range(20))
         body = f'{lines}Reply.\n'
-        msg = make_msg.create(body=body)
+        msg = make_msg(body=body)
         result = minimize_thread([msg])
         text = result[0].get_payload()
         assert 'skip' not in text
         assert 'Line 0.' in text
         assert 'Line 19.' in text
 
-    def test_reduce_quote_context_preserves_sig(self, make_msg: type) -> None:
+    def test_reduce_quote_context_preserves_sig(self, make_msg: MsgFactory) -> None:
         """Signature is preserved when reducing quote context."""
         lines = ''.join(f'> Line {i}.\n' for i in range(10))
         body = f'On Monday, someone wrote:\n{lines}>\n> Last para.\nReply.\n-- \nKR\n'
-        msg = make_msg.create(body=body)
+        msg = make_msg(body=body)
         result = minimize_thread([msg], reduce_quote_context=True)
         text = result[0].get_payload()
         assert 'skip' in text
@@ -368,11 +370,11 @@ class TestMinimizeThread:
         assert '-- \n' in text
         assert 'KR' in text
 
-    def test_multiple_messages(self, make_msg: type) -> None:
+    def test_multiple_messages(self, make_msg: MsgFactory) -> None:
         """Multiple messages in a thread are all processed."""
-        msg1 = make_msg.create(body='First message.\n')
-        msg2 = make_msg.create(body='Reply.\n> First message.\n')
-        msg3 = make_msg.create(body='> Only quotes.\n')
+        msg1 = make_msg(body='First message.\n')
+        msg2 = make_msg(body='Reply.\n> First message.\n')
+        msg3 = make_msg(body='> Only quotes.\n')
         result = minimize_thread([msg1, msg2, msg3])
         # msg3 should be dropped (all quotes)
         assert len(result) == 2
diff --git a/tests/test_message.py b/tests/test_message.py
index 1a20afb..947e112 100644
--- a/tests/test_message.py
+++ b/tests/test_message.py
@@ -4,6 +4,8 @@ from __future__ import annotations
 
 from email.message import EmailMessage
 
+from conftest import MsgFactory
+
 from liblore.utils import clean_header, get_clean_msgid, parse_message
 
 
@@ -35,16 +37,16 @@ class TestCleanHeader:
 
 
 class TestGetCleanMsgid:
-    def test_extracts_msgid(self, make_msg: type) -> None:
-        msg = make_msg.create(msgid='test123@example.com')
+    def test_extracts_msgid(self, make_msg: MsgFactory) -> None:
+        msg = make_msg(msgid='test123@example.com')
         assert get_clean_msgid(msg) == 'test123@example.com'
 
     def test_missing_header(self) -> None:
         msg = EmailMessage()
         assert get_clean_msgid(msg) is None
 
-    def test_custom_header(self, make_msg: type) -> None:
-        msg = make_msg.create(in_reply_to='parent@example.com')
+    def test_custom_header(self, make_msg: MsgFactory) -> None:
+        msg = make_msg(in_reply_to='parent@example.com')
         assert get_clean_msgid(msg, 'In-Reply-To') == 'parent@example.com'
 
 
diff --git a/tests/test_thread.py b/tests/test_thread.py
index b404a2a..62a9a1e 100644
--- a/tests/test_thread.py
+++ b/tests/test_thread.py
@@ -2,35 +2,37 @@
 """Tests for liblore.thread."""
 from __future__ import annotations
 
+from conftest import MsgFactory
+
 from liblore.utils import get_clean_msgid, get_strict_thread
 
 
 class TestGetStrictThread:
-    def test_simple_thread(self, make_msg: type) -> None:
-        root = make_msg.create(msgid='root@x.com', subject='Root')
-        reply = make_msg.create(
+    def test_simple_thread(self, make_msg: MsgFactory) -> None:
+        root = make_msg(msgid='root@x.com', subject='Root')
+        reply = make_msg(
             msgid='reply@x.com',
             subject='Re: Root',
             in_reply_to='root@x.com',
         )
-        unrelated = make_msg.create(msgid='other@x.com', subject='Other')
+        unrelated = make_msg(msgid='other@x.com', subject='Other')
         result = get_strict_thread([root, reply, unrelated], 'root@x.com')
         assert result is not None
         ids = {get_clean_msgid(m) for m in result}
         assert ids == {'root@x.com', 'reply@x.com'}
 
-    def test_returns_none_for_missing_msgid(self, make_msg: type) -> None:
-        msg = make_msg.create(msgid='exists@x.com')
+    def test_returns_none_for_missing_msgid(self, make_msg: MsgFactory) -> None:
+        msg = make_msg(msgid='exists@x.com')
         result = get_strict_thread([msg], 'nonexistent@x.com')
         assert result is None
 
-    def test_noparent(self, make_msg: type) -> None:
-        parent = make_msg.create(msgid='parent@x.com')
-        child = make_msg.create(
+    def test_noparent(self, make_msg: MsgFactory) -> None:
+        parent = make_msg(msgid='parent@x.com')
+        child = make_msg(
             msgid='child@x.com',
             in_reply_to='parent@x.com',
         )
-        grandchild = make_msg.create(
+        grandchild = make_msg(
             msgid='grandchild@x.com',
             in_reply_to='child@x.com',
         )
@@ -44,10 +46,10 @@ class TestGetStrictThread:
         assert 'child@x.com' in ids
         assert 'grandchild@x.com' in ids
 
-    def test_references_chain(self, make_msg: type) -> None:
-        msg1 = make_msg.create(msgid='a@x.com')
-        msg2 = make_msg.create(msgid='b@x.com', references=['a@x.com'])
-        msg3 = make_msg.create(
+    def test_references_chain(self, make_msg: MsgFactory) -> None:
+        msg1 = make_msg(msgid='a@x.com')
+        msg2 = make_msg(msgid='b@x.com', references=['a@x.com'])
+        msg3 = make_msg(
             msgid='c@x.com',
             references=['a@x.com', 'b@x.com'],
         )
@@ -55,8 +57,8 @@ class TestGetStrictThread:
         assert result is not None
         assert len(result) == 3
 
-    def test_single_message(self, make_msg: type) -> None:
-        msg = make_msg.create(msgid='solo@x.com')
+    def test_single_message(self, make_msg: MsgFactory) -> None:
+        msg = make_msg(msgid='solo@x.com')
         result = get_strict_thread([msg], 'solo@x.com')
         assert result is not None
         assert len(result) == 1

-- 
2.53.0

