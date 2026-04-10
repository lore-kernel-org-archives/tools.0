Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554EB3E0226
	for <tools@linux.kernel.org>; Fri, 10 Apr 2026 22:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775860689; cv=none; b=cwmVg8bf30xs/eWvIUKmG0rhg6sadkr6dQpdZtMn+ysziVWBhmF4m8cdlyZDZhnEpHJHUhTeI6oqU6R8qRZJvzyOKWRvz/3e1gmUwBrIqgwaVNWl1q+rfQ8Cb88QNLC5jpxkBKYDNgaJGBXBnrsUTMfi1NWACMKPXjrE/1GeR44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775860689; c=relaxed/simple;
	bh=yPo5eKUtRKjEI5Fl49h4jS+xBDTsnwa6qqsrN1tCEk8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J0YQ+mt48HvkJ/G/celME2H3U/UA3pNyISbAmcfT03gGy6R6vDO0CbCw6PDX4lFI8q1V7kDQ7YXEKhwWLM7hIkQNmTRcLWvmjncJNWLxU7lJDM799dwYYfzPZy3ucSm8sBOovaT1/XTidKDfeUfazwQ3grNF/QWhb5JVoF1sTV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=snOhdYlE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="snOhdYlE"
Received: by smtp.kernel.org (Postfix)
	id 3C1A0C2BCB0; Fri, 10 Apr 2026 22:38:09 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 379BFC19424
	for <tools@kernel.org>; Fri, 10 Apr 2026 22:38:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 379BFC19424
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8d1b746f522so281097885a.0
        for <tools@kernel.org>; Fri, 10 Apr 2026 15:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775860687; x=1776465487; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nk9chgIf4jwRN3a8k3IYagBvMUki2QO3EPgvQBnOxFA=;
        b=snOhdYlEt5wr7Jw1Apcl8MZraDpcxX4KxZ/Uuugm3YIqbuuCmoUSqjzgoFjQNWAdF1
         vzH2W7KrrvAUQEpEBFNvXlfPM9bXCSOtNDQN5OWucbEeWQ6PfthmUyHJTQeLWAg8p1J9
         Rsx6/R3O9yj74SlVfI9YPpNmdg6yGDIEJAz5qZTzahrRzNfmUa+du9nty1P6wL59AROm
         JziiS1BifmFx7X5Ibwf0y0/RH6/7HAVNsodAf028pR2ColENsyj7AcvH6hF/2DTnR9+c
         XmysD0MqV6/ikd16J1+2iC+mjLto/lhaBvRbWKmNEWLsOGD/SSQZK3c5mgewg/VOKNXz
         eRdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775860687; x=1776465487;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nk9chgIf4jwRN3a8k3IYagBvMUki2QO3EPgvQBnOxFA=;
        b=NpVCE8HvhexKx0kYN3cvDJe+ZxKbn1yNh7+EelrdJ1Ws6ai8w9dZBkPXfPOvhZzWlW
         KuixPCkH38nHoEGm8x1ArxmZOQQnEScHckB+7KUv0NLF6jys4O/cFhe/TQPZGbTnCfs9
         wbtfiAZipuFuu0XAQxCoW/yuxtemNY36eMmm0mR5KpDDkcII5wLCfjHrvz6380kVUy3l
         7MFa+FJvxKgLwmToA7yhVEo5yLfvrVE7ZVCM08ruVRuw9plTgFOI74xUQ3dY+Iq4dTg8
         YpMY+1njDTiXfJpgZLP+8SBqT9Tovrg7e1KLkWgIJ9myo4wG+MkNO6LsiATtEGFoaApV
         S8mQ==
X-Gm-Message-State: AOJu0YxpedFljL+sAapOtY7Z1ffGNRP14ljbf8Pxl7ogVb/Ky+aWqj8V
	LwaUxLkhfczkzNezK6P19+UI0hDOt284XuOMZ/N5SKThmOrea2S/3mlx
X-Gm-Gg: AeBDietqUhxIJqA10HtV82j9hRm4anb9rxHwgPm9ftRbZvyWJVlnZwCTDuGmr1/blx6
	9BgVF+rZkSgcNMzOORyfWLANR+j8mnYALYRq26sDZ++chNEK5l+dd2PEQ9Eq7pxzlw2A6/z41vR
	bFLEheyaV32L2zFw7Ub4ehHhXCTMjasgZ4EP1jPGaiUTvqvupwj+XuCix7lcpr/F5jvDCfEQcrP
	/V4jFsmZAz9ex7KZ+kSRZTrVhaTm4/BvrwXTb+jfSXx968Z/pryaWTFxGIldqG/hBBkLAuQ6NNH
	h3HJEmcCCFRcGby3odE4JWJmAstSwL9vQK9whiZokRppyDHrmUz/GhoFlTn3rXbzlF6QRnHFgk3
	4eXCZJCrCX7D4qASfDu6vWdiJWbVvTl1fczHSjGlf7EpRVhQ0+wT+h1e0dk/LEX8VtPXG37AU7E
	My771R7mGabHmIP0uJDHjK3iJjIiZ8L83RkymjsX1MbHVujUsEEKqUsS5hVVTsO76Y4Ir8zkpyy
	L5lftHLOO7IyReeLqdtGTiNY+DymJzicdnIBJ6tAIGMda7kAs5D//M19J9HDqzEyuaSgfJImj9B
	GAykAPZeqf978ntbLiK1DVIbzegm9Dg5f8YJDTDVA1y5Ho0hLofl
X-Received: by 2002:a05:620a:7116:b0:8d7:531:cb95 with SMTP id af79cd13be357-8ddcf2bfa0emr729695185a.39.1775860687093;
        Fri, 10 Apr 2026 15:38:07 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([208.80.35.36])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ac849db735sm41370096d6.2.2026.04.10.15.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 15:38:06 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 10 Apr 2026 18:38:02 -0400
Subject: [PATCH 11/14] Replace batch mocks with subclasses
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-harden-type-checking-v1-11-fcf314d9d748@gmail.com>
References: <20260410-harden-type-checking-v1-0-fcf314d9d748@gmail.com>
In-Reply-To: <20260410-harden-type-checking-v1-0-fcf314d9d748@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1775860675; l=7783;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=yPo5eKUtRKjEI5Fl49h4jS+xBDTsnwa6qqsrN1tCEk8=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKL1Qt3INT9VFPD1TP+NGfpmLvEFitbqNC8O+VgquYUqTsfNoYNHlBYIELqYC6vdSSg1FDmnsbg
 IJbtJ+UJl5Qk=
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

