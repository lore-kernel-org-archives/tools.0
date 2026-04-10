Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D7C3A6F19
	for <tools@linux.kernel.org>; Fri, 10 Apr 2026 22:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775860686; cv=none; b=XuOIlc8QIZrIEdsX3pmjQUA5B3KVhQ3gI3iqmz3HTDSvP1g0G+oBDg8IqWelQjv9IRVBJnMhkmRDHmzyTdAXa//KtZubz/boWHT/8aoE9XUoJtt4OXZrruYqKzLnyey25frZTSTLKTBUaripY3jh89W6nXA2QKoZkOzJzPIag3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775860686; c=relaxed/simple;
	bh=tHUnymnA1i/j8vuT9JB1JrrjdMg15Lhfo/K/+uqKBZk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PMg3Z/tZA+5FGdbZOXrVbyWaiGXee/75NOP+bATByg9LvkEdJ5MLcxS5vGqpvj0KPdAT+0sLOnmvZiCOYPrhr/NXuHY3t3FiQstJk0EL/UhgOqG2C1cXfGYuWR4bsYLiPNqMV23YPebXaY0pEUMK9+FZAEstZ6uqoX5/6Fy0im4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bKAbQmDU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bKAbQmDU"
Received: by smtp.kernel.org (Postfix)
	id 46A50C2BCF5; Fri, 10 Apr 2026 22:38:06 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 59CBAC2BC9E
	for <tools@kernel.org>; Fri, 10 Apr 2026 22:38:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 59CBAC2BC9E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8a58057d7baso28498286d6.1
        for <tools@kernel.org>; Fri, 10 Apr 2026 15:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775860683; x=1776465483; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gTijeCuvVE8b1Pgau7rlruxu9easg3t333Wjj2WDJNY=;
        b=bKAbQmDUm43I34C+VT3ZsrInoDvuRvaHy9KxEG0ja9jJlym0V+BWo8OHxSVt2C4ylW
         T2c+Q0wjIVRG+rW9pa4T+PpARGQKSKDcGgkHtyT/Zij72fddAO8qoPp4UpS30+U7ULnI
         bnFKCSoE1iBwmvUZ2MvToXErRoYgAs7pFj/KwNcGXGpf6mbqMJGhWY7Rlk/pc/HxzeM2
         Sb5XqKyMWvrNCWvTwq/2UtkR41S+cKANr1ChOJafs6FjIFyPEHFe6i24GfnD2CvsaEeJ
         cADzeR5wO832k+9cPn6uaKqluM2GUxDyjYbdCfUDYq9kY2d/Qck3iyEFH4DxVjy4++Uj
         0RaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775860683; x=1776465483;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gTijeCuvVE8b1Pgau7rlruxu9easg3t333Wjj2WDJNY=;
        b=HbL7xUApQM5mydlwwgy+dpkTceCA+BbD30v1rWRJXPRiuWUPRu7eM50Om2Gt1jE6f3
         33wYrwviYJxdMnW2M0b7pEpaHlpCa9CvtzlYeFuAdmh1wrFheU/WaP4qCIs2tNBMZBJP
         eaIOf+EjX+DisFl2vmEACHzxxTwuK2Iq8W8FjymLxSBiHTTFWoReNGfgHje75uwsh3i0
         gn3OcXd798oBBO3IVGtCCFWEL0fjnz2fWfsznxTAaBBUwpQ31dnexNESi6f8OOpWE57C
         rHnuGGCJBu8To5Hk7hhGvLbD2EuTaWA66ubFdhOY6R2GaUX5gaYLTQPuPEweTcBpF1ny
         97mg==
X-Gm-Message-State: AOJu0YzbToRUA1zRvYoDlwPBbm3NhhV2LzlK2FOFtBwlVFpoC2IufYFR
	twS75fFZZaKaJIUR5Y8/jKJZyphxL+8bWxblPX0ETgmThLLa7fZ8R96R
X-Gm-Gg: AeBDietfigzJoNJ1EqppSKu8rh9qMqazMmNzCnMNlH2pHrD0zBsHLGtbNuaMOCgNFxz
	h2QCQ6S1GuK39JNr21ToTtOazwMMepzSCHIdyocTi1XgDb6PC7T51qO+nbu6Ryuv3Zk1wIIrgxb
	1df2DOnzdIUKrjiNYuVpLsvHEnOw415xb02MplSJBUxD0g1NAMuPqhPEyBIf0ewJft+r2B21RBw
	f9hhkaqepS0i6iR5HUlWDNvaTcQMoOysE+/iS8wTNLrRyqBH3PH0cBnhvLYuK6lk3p6uMsl+lAG
	w0pJVtYU4W/5wMy6lWZ9xPzLM3T4ms+D8UgEzJZ9s9bYkmSuTCnmksnzkk5QjIGoIzq89N2MN4m
	YakzcD1ARL/6pnqXLXz9mCw69yuOXcHYYdjmRjgJXbh1IRPJfrdzHD5guPwLXTUOz1B9Aoh33v8
	9a0Bby0qug5FM4Al0SqeYRC1/3Jm9Zi/kN3o4HarsDGa5sAUBinUwiQdgg3jQ3KoInfsgiX+hEK
	8Moo0wzpWzCre40PNQglOEP5lU93SwmzojHE++Y/VcZKrI+5Vj89xcJlMlusYE1WBU6b2MXpUhX
	BP4FAqpnlJa4dvxjmYdHGlC7zUpT+55CA9mrOmKfphDLfz69hnmE
X-Received: by 2002:ad4:594d:0:b0:89f:4a69:44b9 with SMTP id 6a1803df08f44-8ac862b4dedmr74899416d6.40.1775860683149;
        Fri, 10 Apr 2026 15:38:03 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([208.80.35.36])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ac849db735sm41370096d6.2.2026.04.10.15.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 15:38:02 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 10 Apr 2026 18:37:58 -0400
Subject: [PATCH 07/14] Add ty checks to CI
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260410-harden-type-checking-v1-7-fcf314d9d748@gmail.com>
References: <20260410-harden-type-checking-v1-0-fcf314d9d748@gmail.com>
In-Reply-To: <20260410-harden-type-checking-v1-0-fcf314d9d748@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1775860675; l=11459;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=tHUnymnA1i/j8vuT9JB1JrrjdMg15Lhfo/K/+uqKBZk=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QM0VFx+YfOH5BC91RilS7HjcmL1ceLclNPs39M1X30otTziH1Kt0tllbDCE3dCgRcrdfopb9Pau
 uv5aytGxqzgY=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

Add ty to the development dependencies and enable all ty rules. Run ty
in the b4 CI check script so its diagnostics are surfaced with the other
checks.

Use `ty check --add-ignore` to suppress existing errors.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 pyproject.toml             |  4 ++++
 src/liblore/node.py        |  2 +-
 tests/test_auth_headers.py | 10 +++++-----
 tests/test_node.py         | 30 +++++++++++++++---------------
 tools/b4-ci-check.py       |  6 ++++++
 5 files changed, 31 insertions(+), 21 deletions(-)

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
diff --git a/tools/b4-ci-check.py b/tools/b4-ci-check.py
index 5690cd9..67278f1 100644
--- a/tools/b4-ci-check.py
+++ b/tools/b4-ci-check.py
@@ -65,6 +65,12 @@ def main() -> None:
             # https://github.com/astral-sh/ruff/issues/659
             run=run_subprocess('ruff'),
         ),
+        Check(
+            tool='ty',
+            args=['check', 'src', 'tests'],
+            pass_summary='ty passed',
+            run=run_subprocess('ty'),
+        ),
         # Mypy can emit JSON via "--output json", but b4 only renders details
         # as plain text, so preserving the normal formatter is more readable.
         Check(

-- 
2.53.0

