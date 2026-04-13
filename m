Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E00B39A051
	for <tools@linux.kernel.org>; Mon, 13 Apr 2026 22:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776118112; cv=none; b=FH8jFkdQrxQvt1giALj6B560+zZzfwxtmNJ/JKz+4aWx2sJNEZQXp1TXfOmVg9hBTGP5BKYo37C9u5M+TlO7xI3zFJj0jXVlL9RqGSCgoL91GCEZmnWUBR3tOaF7dhbCmYCvgIcWUmdbWplEfBXGZeeu7yYcPbo8WgPB2FDUuaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776118112; c=relaxed/simple;
	bh=hlXqxnoBcHCKrY82IOpHbk5/DYU6ELVZZWgEey8MVp0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IyV6GgAejleE/uClmSilTsJ3FrjUYvj9GzWnOw4bTtAI/443Nz7pXijQ0dJsLQlZRMaKZOY5NN8/sgIlBdAnlpV/xPLhogWBJhe+LiATzoRcweMmFc8HGYu3pcCKykUD9whtFJvcmCVbr1/mGOj3+sMaUOPa1div/dsXMgx7WYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SM5wi21K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SM5wi21K"
Received: by smtp.kernel.org (Postfix)
	id 18AC8C2BCB5; Mon, 13 Apr 2026 22:08:32 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BD130C2BCB3
	for <tools@kernel.org>; Mon, 13 Apr 2026 22:08:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BD130C2BCB3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8c6f21c2d81so371662385a.2
        for <tools@kernel.org>; Mon, 13 Apr 2026 15:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776118110; x=1776722910; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ItqfJVIU3cMOjdyUdGRIBC0AKJIJB3GWJND2rMF5OM=;
        b=SM5wi21KGihV5vmRxLEXHeiGcUcrS5FvgshH04jPHgzm5NmsJRcZTlXVBt6oqd8EXp
         ZwFO1f3pU5bW6P0KT3NNNLKXTk2hMdEaR20JGdhDXADk6T6A3jh94ubtyq2aPbtAqssf
         H2LmdRyBYQksRjt5JF97uW9Iml1/MzNep6GhOvUG1jjzzmc5o+3i+eD6UcC43o45k7oD
         3f1iFjvbCno4TIwD6tedtscBcNEU0dLD4PrCXl12Sl6QUZBoI/SbVRP6nBtLged2Zecs
         yOXjFkX11VbTWozxj8hrThgGnxQnMcTKW1SUEKE4IswPDLd+tqIyrVyyGkqLdsJwpYyn
         ocgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776118110; x=1776722910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9ItqfJVIU3cMOjdyUdGRIBC0AKJIJB3GWJND2rMF5OM=;
        b=SO5M3dk8iC/MKylfXpjlutf+DWY6WE322Vou0spMpaij2Mg3TD/CmxKq8rHzGRBiCh
         apUmTNwgU/LRR5PuNyk/0f1Co6bEea8llO7VT7S9D9cwHIbKOG797i4/u5aN9CyYTHff
         mz+Qf5VIxrWkR0EZQM3BaPrWRmm3lAHk+yEatDB0cim+u3fY6qMQaz+0MnHeQNrA1W2K
         ajIlkyh+7BaIB504N0INDrGOpNMZ4Yrpx8o/Zeeadat5YAQKOu1ZtYJsjwiGL7Qx3135
         R7oKwPGlw4XENI9XAUmJR5ZdONX8HyCtRZIdzR3rM3dWOsUX+VhKj1Cuvu8DRNTN5gTS
         JmOw==
X-Gm-Message-State: AOJu0Yw7b062owQPB/cWoeCCHFCHz726yBjwFVYWbmJccF1J7X0U+/qq
	B7jffQVOURrJBHcWyYXgom+IvS7c8s6L82NhS4gQsHcQbB/w3lzfNTf5
X-Gm-Gg: AeBDietTflje1LqXVo028jm4zqayoPiwaWq+Q6thWQfzJu+pAQZLnnYhWGp+4HphBci
	8KREFdyjsmo5Kk2Gf3PwUXr0e35Xolkpg4WI4IbmXhJkWvTctY7FAHajd8Wq5D06dgRcvrjkJJs
	tLvvpdFzC993k/aJslW/1ATfjEk5QmNJ43E8JrL2wybCgPNZjHyKHoNulKnCsfoVM++gqoSaP/E
	CFQJYp1RPUeMgj08c3kHYkvb519Di3pyuulkakzSJDpmEHdEFRomsnfFNeUr8MFLrcdWVAP4BSg
	RsGGT/vqIy3S3GfK9wespQ8DyUBmtHd5p8V9Tol2ZV5NznC3HRmtY+UEX7TVzNOi6xrLvOTwlO6
	ga7ZQTjVHkuZCQ5/era8A8z6CvzsjMFm6uorBQF/mb3674LuvDI6zojPEZ+bF5vMAP07tyyDwMM
	59p/799y2LgEOdRsJJfENoX4yHYbQi0f9og07rH00NhXbIVgOzWAoO/K3U1BNWPQ1U0Id511ymO
	FST/nYo2X9L34HLY1DUXbcy6Z66j6aFOw2V7mStlRCOuiZKYsfMBmIhFqeoGsTz+AK6VfPi43W3
	NN6ghg1XvwJjC9FYM8rRzfBquausujNZqx/Q/ygEG5CSgIlKQ/tNUQ6oByUdkmAK
X-Received: by 2002:a05:620a:2686:b0:8d6:838a:c98c with SMTP id af79cd13be357-8ddcecbd1a5mr2293968185a.34.1776118109549;
        Mon, 13 Apr 2026 15:08:29 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2600:4808:6353:5c00:c007:ed8:60aa:a884])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ddb8d6e387sm907506185a.30.2026.04.13.15.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 15:08:29 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 13 Apr 2026 18:08:21 -0400
Subject: [PATCH v2 07/14] Add ty checks to CI
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260413-harden-type-checking-v2-7-1ba6056288d9@gmail.com>
References: <20260413-harden-type-checking-v2-0-1ba6056288d9@gmail.com>
In-Reply-To: <20260413-harden-type-checking-v2-0-1ba6056288d9@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1776118098; l=11038;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=hlXqxnoBcHCKrY82IOpHbk5/DYU6ELVZZWgEey8MVp0=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QLCrBhGaa/f2beiCdKL59w97qzSeh5CK7YnieE1GyvpTI6D4dHgHuR6xcryAoGdE/7UKRzynFGV
 yJLP9x46hHgk=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

Add ty to the development dependencies and enable all ty rules. Run ty
in the b4 CI check script so its diagnostics are surfaced with the other
checks.

Use `ty check --add-ignore` to suppress existing errors.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 ci.sh                      |  1 +
 pyproject.toml             |  4 ++++
 src/liblore/node.py        |  2 +-
 tests/test_auth_headers.py | 10 +++++-----
 tests/test_node.py         | 30 +++++++++++++++---------------
 5 files changed, 26 insertions(+), 21 deletions(-)

diff --git a/ci.sh b/ci.sh
index 4b07fa2..c97c853 100755
--- a/ci.sh
+++ b/ci.sh
@@ -4,6 +4,7 @@ set -eu
 
 uv run ruff format --check
 uv run ruff check
+uv run ty check
 uv run mypy .
 uv run pyright
 uv run pytest --durations=0
diff --git a/pyproject.toml b/pyproject.toml
index a160edd..37c85a7 100644
--- a/pyproject.toml
+++ b/pyproject.toml
@@ -44,6 +44,7 @@ dev = [
     "pytest-asyncio",
     "responses",
     "ruff",
+    "ty",
     "types-requests",
 ]
 
@@ -63,6 +64,9 @@ executionEnvironments = [
     { root = "tests", reportPrivateUsage = false },
 ]
 
+[tool.ty.rules]
+all = "error"
+
 [tool.ruff.lint]
 extend-select = ["ARG", "I"]
 
diff --git a/src/liblore/node.py b/src/liblore/node.py
index 095ba4f..1b0463e 100644
--- a/src/liblore/node.py
+++ b/src/liblore/node.py
@@ -319,7 +319,7 @@ class LoreNode:
                 except ValueError:
                     pass
 
-        node = cls(url, **kwargs)  # type: ignore[arg-type]
+        node = cls(url, **kwargs)  # type: ignore[arg-type]  # ty:ignore[invalid-argument-type]
 
         val = gitcfg.get('useragentplus')
         if isinstance(val, str) and val:
diff --git a/tests/test_auth_headers.py b/tests/test_auth_headers.py
index f1c240a..b51050c 100644
--- a/tests/test_auth_headers.py
+++ b/tests/test_auth_headers.py
@@ -29,7 +29,7 @@ class TestAuthHeadersImport:
 
     def test_ok_when_authheaders_installed(self) -> None:
         fake = ModuleType('authheaders')
-        fake.authenticate_message = MagicMock()  # type: ignore[attr-defined]
+        fake.authenticate_message = MagicMock()  # type: ignore[attr-defined]  # ty:ignore[unresolved-attribute]
         with patch.dict(sys.modules, {'authheaders': fake}):
             node = LoreNode(add_auth_headers=True)
             assert node._authheaders is not None
@@ -56,7 +56,7 @@ class TestAuthenticateMsgs:
 
     def test_adds_header_when_enabled(self) -> None:
         fake = ModuleType('authheaders')
-        fake.authenticate_message = MagicMock(  # type: ignore[attr-defined]
+        fake.authenticate_message = MagicMock(  # type: ignore[attr-defined]  # ty:ignore[unresolved-attribute]
             return_value='Authentication-Results: liblore; dkim=pass header.d=example.com',
         )
         with patch.dict(sys.modules, {'authheaders': fake}):
@@ -82,7 +82,7 @@ class TestAuthenticateMsgs:
 
     def test_skips_empty_result(self) -> None:
         fake = ModuleType('authheaders')
-        fake.authenticate_message = MagicMock(return_value='')  # type: ignore[attr-defined]
+        fake.authenticate_message = MagicMock(return_value='')  # type: ignore[attr-defined]  # ty:ignore[unresolved-attribute]
         with patch.dict(sys.modules, {'authheaders': fake}):
             node = LoreNode(add_auth_headers=True)
             msg = EmailMessage()
@@ -95,7 +95,7 @@ class TestAuthenticateMsgs:
 
     def test_multiple_messages(self) -> None:
         fake = ModuleType('authheaders')
-        fake.authenticate_message = MagicMock(  # type: ignore[attr-defined]
+        fake.authenticate_message = MagicMock(  # type: ignore[attr-defined]  # ty:ignore[unresolved-attribute]
             side_effect=[
                 'liblore; dkim=pass',
                 'Authentication-Results: liblore; dkim=fail',
@@ -126,7 +126,7 @@ class TestAuthInFetchMethods:
     @pytest.fixture()
     def auth_node(self) -> Iterator[tuple[LoreNode, responses.RequestsMock]]:
         fake = ModuleType('authheaders')
-        fake.authenticate_message = MagicMock(  # type: ignore[attr-defined]
+        fake.authenticate_message = MagicMock(  # type: ignore[attr-defined]  # ty:ignore[unresolved-attribute]
             return_value='Authentication-Results: liblore; dkim=pass',
         )
         with patch.dict(sys.modules, {'authheaders': fake}):
diff --git a/tests/test_node.py b/tests/test_node.py
index fc94d9f..f4a3495 100644
--- a/tests/test_node.py
+++ b/tests/test_node.py
@@ -500,19 +500,19 @@ class TestBatchGetThreadByMsgid:
         node = LoreNode()
         thread_a = [EmailMessage()]
         thread_b = [EmailMessage(), EmailMessage()]
-        node.get_thread_by_msgid = MagicMock(side_effect=[thread_a, thread_b])  # type: ignore[method-assign]
+        node.get_thread_by_msgid = MagicMock(side_effect=[thread_a, thread_b])  # type: ignore[method-assign]  # ty:ignore[invalid-assignment]
 
         with patch('liblore.node.time.sleep') as mock_sleep:
             results = node.batch_get_thread_by_msgid(['a@x', 'b@x'])
 
         assert results == [thread_a, thread_b]
-        assert node.get_thread_by_msgid.call_count == 2
+        assert node.get_thread_by_msgid.call_count == 2  # ty:ignore[unresolved-attribute]
         mock_sleep.assert_called_once_with(0.1)
 
     def test_no_sleep_for_single_msgid(self) -> None:
         node = LoreNode()
         thread = [EmailMessage()]
-        node.get_thread_by_msgid = MagicMock(return_value=thread)  # type: ignore[method-assign]
+        node.get_thread_by_msgid = MagicMock(return_value=thread)  # type: ignore[method-assign]  # ty:ignore[invalid-assignment]
 
         with patch('liblore.node.time.sleep') as mock_sleep:
             results = node.batch_get_thread_by_msgid(['only@x'])
@@ -522,7 +522,7 @@ class TestBatchGetThreadByMsgid:
 
     def test_passes_kwargs(self) -> None:
         node = LoreNode()
-        node.get_thread_by_msgid = MagicMock(return_value=[EmailMessage()])  # type: ignore[method-assign]
+        node.get_thread_by_msgid = MagicMock(return_value=[EmailMessage()])  # type: ignore[method-assign]  # ty:ignore[invalid-assignment]
 
         with patch('liblore.node.time.sleep'):
             node.batch_get_thread_by_msgid(
@@ -532,7 +532,7 @@ class TestBatchGetThreadByMsgid:
                 since='20240101',
             )
 
-        node.get_thread_by_msgid.assert_called_once_with(
+        node.get_thread_by_msgid.assert_called_once_with(  # ty:ignore[unresolved-attribute]
             'a@x',
             strict=False,
             sort=True,
@@ -541,7 +541,7 @@ class TestBatchGetThreadByMsgid:
 
     def test_sleep_count_matches_gaps(self) -> None:
         node = LoreNode()
-        node.get_thread_by_msgid = MagicMock(return_value=[EmailMessage()])  # type: ignore[method-assign]
+        node.get_thread_by_msgid = MagicMock(return_value=[EmailMessage()])  # type: ignore[method-assign]  # ty:ignore[invalid-assignment]
 
         with patch('liblore.node.time.sleep') as mock_sleep:
             node.batch_get_thread_by_msgid(['a@x', 'b@x', 'c@x'])
@@ -550,14 +550,14 @@ class TestBatchGetThreadByMsgid:
 
     def test_empty_list(self) -> None:
         node = LoreNode()
-        node.get_thread_by_msgid = MagicMock()  # type: ignore[method-assign]
+        node.get_thread_by_msgid = MagicMock()  # type: ignore[method-assign]  # ty:ignore[invalid-assignment]
 
         with patch('liblore.node.time.sleep') as mock_sleep:
             results = node.batch_get_thread_by_msgid([])
 
         assert results == []
         mock_sleep.assert_not_called()
-        node.get_thread_by_msgid.assert_not_called()
+        node.get_thread_by_msgid.assert_not_called()  # ty:ignore[unresolved-attribute]
 
 
 # =====================================================================
@@ -570,19 +570,19 @@ class TestBatchGetThreadByQuery:
         node = LoreNode()
         result_a = [EmailMessage()]
         result_b = [EmailMessage(), EmailMessage()]
-        node.get_thread_by_query = MagicMock(side_effect=[result_a, result_b])  # type: ignore[method-assign]
+        node.get_thread_by_query = MagicMock(side_effect=[result_a, result_b])  # type: ignore[method-assign]  # ty:ignore[invalid-assignment]
 
         with patch('liblore.node.time.sleep') as mock_sleep:
             results = node.batch_get_thread_by_query(['q1', 'q2'])
 
         assert results == [result_a, result_b]
-        assert node.get_thread_by_query.call_count == 2
+        assert node.get_thread_by_query.call_count == 2  # ty:ignore[unresolved-attribute]
         mock_sleep.assert_called_once_with(0.1)
 
     def test_no_sleep_for_single_query(self) -> None:
         node = LoreNode()
         result = [EmailMessage()]
-        node.get_thread_by_query = MagicMock(return_value=result)  # type: ignore[method-assign]
+        node.get_thread_by_query = MagicMock(return_value=result)  # type: ignore[method-assign]  # ty:ignore[invalid-assignment]
 
         with patch('liblore.node.time.sleep') as mock_sleep:
             results = node.batch_get_thread_by_query(['only_query'])
@@ -592,7 +592,7 @@ class TestBatchGetThreadByQuery:
 
     def test_sleep_count_matches_gaps(self) -> None:
         node = LoreNode()
-        node.get_thread_by_query = MagicMock(return_value=[EmailMessage()])  # type: ignore[method-assign]
+        node.get_thread_by_query = MagicMock(return_value=[EmailMessage()])  # type: ignore[method-assign]  # ty:ignore[invalid-assignment]
 
         with patch('liblore.node.time.sleep') as mock_sleep:
             node.batch_get_thread_by_query(['q1', 'q2', 'q3', 'q4'])
@@ -601,14 +601,14 @@ class TestBatchGetThreadByQuery:
 
     def test_empty_list(self) -> None:
         node = LoreNode()
-        node.get_thread_by_query = MagicMock()  # type: ignore[method-assign]
+        node.get_thread_by_query = MagicMock()  # type: ignore[method-assign]  # ty:ignore[invalid-assignment]
 
         with patch('liblore.node.time.sleep') as mock_sleep:
             results = node.batch_get_thread_by_query([])
 
         assert results == []
         mock_sleep.assert_not_called()
-        node.get_thread_by_query.assert_not_called()
+        node.get_thread_by_query.assert_not_called()  # ty:ignore[unresolved-attribute]
 
 
 # =====================================================================
@@ -1928,7 +1928,7 @@ class TestUserAgentPlusProperty:
         """Property has no setter — assignment raises AttributeError."""
         node = LoreNode()
         with pytest.raises(AttributeError):
-            node.user_agent_plus = 'nope'  # type: ignore[misc]
+            node.user_agent_plus = 'nope'  # type: ignore[misc]  # ty:ignore[invalid-assignment]
 
 
 # =====================================================================

-- 
2.53.0

