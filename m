Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9BB39A051
	for <tools@linux.kernel.org>; Mon, 13 Apr 2026 22:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776118116; cv=none; b=nPcWQ59tmO08/TH0YukYUD0mMWK5MT44JCB2C9CtwwgW4cQ0AiK6FIKgVun9jFbHzYSTdgduJt5i7otp0FXM6QSUeoiLKabY0W2gZUMP1aDHGzq2Ir7BW/P77n52E0ekkXGYhKxImnkMP2JN+JC/oyLxCcMDVYZjgDvWNlIQoKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776118116; c=relaxed/simple;
	bh=yPo5eKUtRKjEI5Fl49h4jS+xBDTsnwa6qqsrN1tCEk8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yg8p1krlqpWtD7URNopbosMAiR7r1FAJHbKo17z6Pf2g9yt+GSF/5i4Un4lAOiVVQh3zDyqt/Zo7TSVE3Fi9EWfKzXjUNDyJImUWmyV3XC7YpOr/oG+mM/vSus56Gb4roEDbNMt6xY5vlYAYL/NRiafF3hjEUh24P4OLjYjFgQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oGhRiNGi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oGhRiNGi"
Received: by smtp.kernel.org (Postfix)
	id 10518C2BCB3; Mon, 13 Apr 2026 22:08:36 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 17E59C2BCAF
	for <tools@kernel.org>; Mon, 13 Apr 2026 22:08:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 17E59C2BCAF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8cb3bae8d3eso427614785a.1
        for <tools@kernel.org>; Mon, 13 Apr 2026 15:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776118114; x=1776722914; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nk9chgIf4jwRN3a8k3IYagBvMUki2QO3EPgvQBnOxFA=;
        b=oGhRiNGi7qQookKqIhv5dP0phYHdqGDf3AKpwH077GbtDBN7IGpyecZfovXE5g2Jvl
         5CcUH0BQHSFSYrh6mBoCj9+Q+Ky+xv0twxsxx+l5XBKcqNhMgN8ruNXdGLf3M5RfEwIO
         /M74V02PgSQ1xjicn8LM1cqgece66Wpbzh7r9mIT88XELdJEm1nji2si/Gofm4TqJq1Q
         AkOmjTbSLOHZlMC7RcXPxjG8QzuRsxmaTUjNmqK32ISC1wUny5qSnOUckSwvoUM2GMUu
         zEt9Q2vt+o55sjEhCUftdZgRDYYywVohq7hpanZeBg/3FKtLQfrJG6foSHF0INKSfLWR
         H6PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776118114; x=1776722914;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nk9chgIf4jwRN3a8k3IYagBvMUki2QO3EPgvQBnOxFA=;
        b=GGFLS2psvLfW8JPKWT88UMAzoH9C+qdPko0ELc3zz6Vxa+FEE1izwl6jgiA2UdBYtD
         F9VVCQXTqj1HBCw75EFTbL52Mvly3eU1eCnqsytBxmFMTg8HpNIzzUncRv8x6RL0SBXr
         L5IiaQY7yrFga3GzCqByvfPPnAtCXmfqqvjxKtCSXhGAdTTyP7YaTXXInYk8dovNTHCx
         zMvQokBd1YhNs0uAUJZ/UqMiKeP1Xy6TKPQV/ShJntH/MAXNIZJdsCVquV8h1zLTLj0e
         yIsR831s1B5ttNNtBBh2SBGGwMgA+rkWdLMjOgqKDS7pPpOeOXF1OLdL3q2YN981sQ/B
         XeEg==
X-Gm-Message-State: AOJu0YwxmOcR85qesinSVumxo7IbOiKtL+q2+9e04TlrYju0jhIax4cm
	UUiNh2DNwXMUndQj9yUYx3EvdczGgid63C3NrxbXUejAktkC+Vr0zi8e
X-Gm-Gg: AeBDievB6FSjulvkFBLSaO4LaNNAStKhv6yaEcXB1ScCIlviXStBgUzccLzzqzv9J2B
	bEfhIqUtUXWPQzvsG3B/B1B2eMc+ndVhusFjti3QDnXZN9De4hzqw5xeibIepA8LKkR5Wtchnr5
	wJpSidS84GCU5ri069LMQx7WNAG3UTJLedqAFssXOj26cnwEXuJmxApK5wjrQ8hrgQPBpk22i1B
	OxdD8eUbdgQc1zEZcGxeppKJiPbZOEspxqabhVezCAGObWezFu3I10/5BxyzkFR159rasWNNN8k
	FYdxc1JsS/1cYk5H3NUqFe9zVXGARA1kxB/0x+7SRg7D/9KjS9JA1Um4ye7heA1H7crr+1BLwAX
	GV4dsEwuh6YfpMjVJcoJSVaWBlMepvRGctvgtUVPc8UjZWwCsWlJgui4H1bX957uWwfEMFP5Tp4
	eOn5m2VSXP38u3gDUwQeeCRLfqamo2Mqs1ZdCxxZIlKMPqeFxJmX38chskmBF7JxjyFA091yYpx
	Z2UYi0hv+CYmCQ9Voh9fw1P5g4nJNs/sC1yT1wubMk6ZuXy8ObT1ycQ4P05Cb+2nfpuczfrmplh
	Y+UjcUAImxbowpMgMvGGAt8nllPIMnT2cVVI5EZEuUR+fDcfSbTgwcQVK+GCQ6rm
X-Received: by 2002:a05:620a:6c0d:b0:8c5:2dbc:623e with SMTP id af79cd13be357-8ddcf9b4288mr2149277385a.50.1776118113861;
        Mon, 13 Apr 2026 15:08:33 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2600:4808:6353:5c00:c007:ed8:60aa:a884])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ddb8d6e387sm907506185a.30.2026.04.13.15.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 15:08:33 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 13 Apr 2026 18:08:25 -0400
Subject: [PATCH v2 11/14] Replace batch mocks with subclasses
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-harden-type-checking-v2-11-1ba6056288d9@gmail.com>
References: <20260413-harden-type-checking-v2-0-1ba6056288d9@gmail.com>
In-Reply-To: <20260413-harden-type-checking-v2-0-1ba6056288d9@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1776118098; l=7783;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=yPo5eKUtRKjEI5Fl49h4jS+xBDTsnwa6qqsrN1tCEk8=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QOOJT+1TWOtMrVeyXhHozhlFPmfJtNV7n0kVpzpvAXbGZbJpGPXDTKrBzc/MRP9eHBTuuNyN+mV
 ceYHgKGhsRQk=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

Replace method reassignment in the batch helper tests with small
LoreNode subclasses that override the fetch methods and record calls.
This removes the type-checking suppressions without adding more
patch-based mocking.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 tests/test_node.py | 88 +++++++++++++++++++++++++++++++-----------------------
 1 file changed, 51 insertions(+), 37 deletions(-)

diff --git a/tests/test_node.py b/tests/test_node.py
index 4abb4f4..73c79a3 100644
--- a/tests/test_node.py
+++ b/tests/test_node.py
@@ -12,6 +12,7 @@ from unittest.mock import MagicMock, call, patch
 import pytest
 import requests
 import responses
+from typing_extensions import override
 
 from liblore import RemoteError
 from liblore.node import LoreNode
@@ -496,24 +497,38 @@ class TestGetMessageByMsgid:
 
 
 class TestBatchGetThreadByMsgid:
+    class _Node(LoreNode):
+        def __init__(self, results: list[list[EmailMessage]]) -> None:
+            super().__init__()
+            self.calls: list[tuple[str, bool, bool, str | None]] = []
+            self._results = results
+
+        @override
+        def get_thread_by_msgid(
+            self,
+            msgid: str,
+            *,
+            strict: bool = True,
+            sort: bool = False,
+            since: str | None = None,
+        ) -> list[EmailMessage]:
+            self.calls.append((msgid, strict, sort, since))
+            return self._results.pop(0)
+
     def test_returns_ordered_results(self) -> None:
-        node = LoreNode()
         thread_a = [EmailMessage()]
         thread_b = [EmailMessage(), EmailMessage()]
-        node.get_thread_by_msgid = MagicMock(side_effect=[thread_a, thread_b])  # type: ignore[method-assign]  # ty:ignore[invalid-assignment]
-
+        node = self._Node([thread_a, thread_b])
         with patch('liblore.node.time.sleep') as mock_sleep:
             results = node.batch_get_thread_by_msgid(['a@x', 'b@x'])
 
         assert results == [thread_a, thread_b]
-        assert node.get_thread_by_msgid.call_count == 2  # ty:ignore[unresolved-attribute]
+        assert len(node.calls) == 2
         mock_sleep.assert_called_once_with(0.1)
 
     def test_no_sleep_for_single_msgid(self) -> None:
-        node = LoreNode()
         thread = [EmailMessage()]
-        node.get_thread_by_msgid = MagicMock(return_value=thread)  # type: ignore[method-assign]  # ty:ignore[invalid-assignment]
-
+        node = self._Node([thread])
         with patch('liblore.node.time.sleep') as mock_sleep:
             results = node.batch_get_thread_by_msgid(['only@x'])
 
@@ -521,9 +536,7 @@ class TestBatchGetThreadByMsgid:
         mock_sleep.assert_not_called()
 
     def test_passes_kwargs(self) -> None:
-        node = LoreNode()
-        node.get_thread_by_msgid = MagicMock(return_value=[EmailMessage()])  # type: ignore[method-assign]  # ty:ignore[invalid-assignment]
-
+        node = self._Node([[EmailMessage()]])
         with patch('liblore.node.time.sleep'):
             node.batch_get_thread_by_msgid(
                 ['a@x'],
@@ -532,32 +545,23 @@ class TestBatchGetThreadByMsgid:
                 since='20240101',
             )
 
-        node.get_thread_by_msgid.assert_called_once_with(  # ty:ignore[unresolved-attribute]
-            'a@x',
-            strict=False,
-            sort=True,
-            since='20240101',
-        )
+        assert node.calls == [('a@x', False, True, '20240101')]
 
     def test_sleep_count_matches_gaps(self) -> None:
-        node = LoreNode()
-        node.get_thread_by_msgid = MagicMock(return_value=[EmailMessage()])  # type: ignore[method-assign]  # ty:ignore[invalid-assignment]
-
+        node = self._Node([[EmailMessage()], [EmailMessage()], [EmailMessage()]])
         with patch('liblore.node.time.sleep') as mock_sleep:
             node.batch_get_thread_by_msgid(['a@x', 'b@x', 'c@x'])
 
         assert mock_sleep.call_args_list == [call(0.1), call(0.1)]
 
     def test_empty_list(self) -> None:
-        node = LoreNode()
-        node.get_thread_by_msgid = MagicMock()  # type: ignore[method-assign]  # ty:ignore[invalid-assignment]
-
+        node = self._Node([])
         with patch('liblore.node.time.sleep') as mock_sleep:
             results = node.batch_get_thread_by_msgid([])
 
         assert results == []
         mock_sleep.assert_not_called()
-        node.get_thread_by_msgid.assert_not_called()  # ty:ignore[unresolved-attribute]
+        assert node.calls == []
 
 
 # =====================================================================
@@ -566,24 +570,36 @@ class TestBatchGetThreadByMsgid:
 
 
 class TestBatchGetThreadByQuery:
+    class _Node(LoreNode):
+        def __init__(self, results: list[list[EmailMessage]]) -> None:
+            super().__init__()
+            self.calls: list[tuple[str, bool]] = []
+            self._results = results
+
+        @override
+        def get_thread_by_query(
+            self,
+            query: str,
+            *,
+            full_threads: bool = False,
+        ) -> list[EmailMessage]:
+            self.calls.append((query, full_threads))
+            return self._results.pop(0)
+
     def test_returns_ordered_results(self) -> None:
-        node = LoreNode()
         result_a = [EmailMessage()]
         result_b = [EmailMessage(), EmailMessage()]
-        node.get_thread_by_query = MagicMock(side_effect=[result_a, result_b])  # type: ignore[method-assign]  # ty:ignore[invalid-assignment]
-
+        node = self._Node([result_a, result_b])
         with patch('liblore.node.time.sleep') as mock_sleep:
             results = node.batch_get_thread_by_query(['q1', 'q2'])
 
         assert results == [result_a, result_b]
-        assert node.get_thread_by_query.call_count == 2  # ty:ignore[unresolved-attribute]
+        assert len(node.calls) == 2
         mock_sleep.assert_called_once_with(0.1)
 
     def test_no_sleep_for_single_query(self) -> None:
-        node = LoreNode()
         result = [EmailMessage()]
-        node.get_thread_by_query = MagicMock(return_value=result)  # type: ignore[method-assign]  # ty:ignore[invalid-assignment]
-
+        node = self._Node([result])
         with patch('liblore.node.time.sleep') as mock_sleep:
             results = node.batch_get_thread_by_query(['only_query'])
 
@@ -591,24 +607,22 @@ class TestBatchGetThreadByQuery:
         mock_sleep.assert_not_called()
 
     def test_sleep_count_matches_gaps(self) -> None:
-        node = LoreNode()
-        node.get_thread_by_query = MagicMock(return_value=[EmailMessage()])  # type: ignore[method-assign]  # ty:ignore[invalid-assignment]
-
+        node = self._Node(
+            [[EmailMessage()], [EmailMessage()], [EmailMessage()], [EmailMessage()]]
+        )
         with patch('liblore.node.time.sleep') as mock_sleep:
             node.batch_get_thread_by_query(['q1', 'q2', 'q3', 'q4'])
 
         assert mock_sleep.call_args_list == [call(0.1), call(0.1), call(0.1)]
 
     def test_empty_list(self) -> None:
-        node = LoreNode()
-        node.get_thread_by_query = MagicMock()  # type: ignore[method-assign]  # ty:ignore[invalid-assignment]
-
+        node = self._Node([])
         with patch('liblore.node.time.sleep') as mock_sleep:
             results = node.batch_get_thread_by_query([])
 
         assert results == []
         mock_sleep.assert_not_called()
-        node.get_thread_by_query.assert_not_called()  # ty:ignore[unresolved-attribute]
+        assert node.calls == []
 
 
 # =====================================================================

-- 
2.53.0

