Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793736346;
	b=J+ScY+ZEGu6G9y1LytKkdsPiuM6xODKUyXW/JBRjLbE32GPf/T76TFLW52IEZYw7bmiv
	 HaALFWyhTnHjuuUlzCHIkMBjJOqsIpTuBk9TJsGh7kSN2kNM0+a/xy7ivCkBXJWiW7Qiw
	 OSJDlK6nZHKB1SKfYNq3VjxBNgxephVwI5AQyjIU65n1Ef1LCujl6HPfs79+bb9n7WKYX
	 Jz7Hxoxd2t3V0k7GYeZMoAFdb8lyGLaC9ujV0LLVQs+YtpZEJzc6h5JS0MOqDjz4fz2MN
	 xtbLkg1U9W4Jdc0f6WzWTbrsRH6nLNaQaLWzX+cnS1LJyWBpomuOow8vT8Og2v206LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793736346;
	h=Received:Delivered-To:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=Ku8KvRqwa3AYkJZ9HeSesgZoCmnAk+59PCI7rEo22Xk=;
	b=KkVSfOlEyQ6TceB0iKARfJyS/Ws+zEoAEmeKJc3Q1C47DkFHkhJR/DYR9fTswNzB58N2
	 IWhE5TP71+uuQ961nCvtFZBiG25LNNt2cv7tWkJdr0qvS+7vgdKHizz5Qwn+7tckblCPh
	 g5Gn8dsMnnC+ErnsJnqT5Mu5kfmPeXKkc5PMbpRpUgQqtYHcPztgSLVKe4oMWg0czhRdA
	 5KTwe0pgOrulEAFCM18X69G5jHVrR4pb9IiPRl/cXUK02re7onDm6SYTd0m21YaakIXIl
	 sGMfh+4I06VgG7lChAEhppEvTwBm1272C1YlYKvvpFrQUZLPu6AAuEjJM7qZGLsJf1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C9FKekiV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00121606A324
	for <tools@linux.kernel.org>; Tue,  3 Nov 2026 20:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C9FKekiV
Received: by smtp.kernel.org (Postfix)
	id E67F31F000C1; Tue,  3 Nov 2026 20:05:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CDAF1F00919;
	Tue,  3 Nov 2026 20:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793736345;
	bh=Ku8KvRqwa3AYkJZ9HeSesgZoCmnAk+59PCI7rEo22Xk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=C9FKekiVCbb+b6+5eMCF1KCCYSORMmTxPAs6Hjm/aKTGGJh3MUP1eHj5NIX9x/I0x
	 bC2VUnXvMW1KIJj9qEZ58CQJkATt4INS8KtY2ZMtFqvn0S83z7CU71900J3RWtRcoV
	 imRyMXIbEyReIyi/Y6xs8b1IXvKekBw+kRbzFBkJvBK5bL6dqSMRy7rcBK+5wCEolq
	 LnajFnpphbE97WakBQlnfOAQen54LK+GxwCEnD2KVlQm0rrZ3O80cYP4Cyn/vm2CBA
	 VxzbhB17auJoL/eK5D9wy+aMVrY9PLy8NJefs6MXC5gUalvifeV7NDj99zulvdcT21
	 rElP/pdqxbk4Q==
From: Brian Masney <masneyb@kernel.org>
Date: Tue, 03 Nov 2026 15:05:35 -0500
Subject: [PATCH b4 2/2] add tests for b4.send-me-too
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-review-send-me-too-v1-2-0d23443820b7@kernel.org>
References: <20261103-review-send-me-too-v1-0-0d23443820b7@kernel.org>
In-Reply-To: <20261103-review-send-me-too-v1-0-0d23443820b7@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Brian Masney <masneyb@kernel.org>
X-Mailer: b4 0.17-dev-17634
X-Developer-Signature: v=1; a=openpgp-sha256; l=3445; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=fjCXmu9EglbaIi36d3/fssjIUVk6iygvLTkCLf8M+GU=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJe2U2d0TFlcuflYzz/rYP2WmcJXz3MM8/NLCdu8+zvE
 Uv92GbGdZSyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjCRt/KMDK/6AzwnN9lvqjDZ
 v8Duoqvb1iX/D71QbSw/nmdoo2K1aiojwxY9XzWWJL+0qxGvZ6zgmXeud74yR/gk+3t8s4+EVb+
 MZAcA
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Add tests for the b4.send-me-too configuration option.

Signed-off-by: Brian Masney <masneyb@kernel.org>
---
 src/tests/test___init__.py | 37 +++++++++++++++++++++++++++++++++++++
 src/tests/test_review.py   | 20 ++++++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/src/tests/test___init__.py b/src/tests/test___init__.py
index 764829d7e756..ac900220c457 100644
--- a/src/tests/test___init__.py
+++ b/src/tests/test___init__.py
@@ -2618,6 +2618,43 @@ def test_git_head_restore_args_round_trip(gitdir: str) -> None:
     assert b4.git_head_restore_args(gitdir) == restore
 
 
+class TestAddMeToo:
+    """b4.send-me-too Ccs the user unless they are already a recipient."""
+
+    @staticmethod
+    def _msg(cc: Optional[str] = None) -> email.message.EmailMessage:
+        msg = email.message.EmailMessage()
+        msg['From'] = 'Alice <alice@example.org>'
+        msg['To'] = 'bob@example.org'
+        if cc:
+            msg['Cc'] = cc
+        return msg
+
+    def test_adds_sender_to_cc(self) -> None:
+        msg = self._msg()
+        b4.add_me_too(msg)
+        assert msg['Cc'] == 'Test Override <test-override@example.com>'
+
+    def test_appends_to_existing_cc(self) -> None:
+        msg = self._msg(cc='carol@example.org')
+        b4.add_me_too(msg)
+        assert msg['Cc'] == (
+            'carol@example.org, Test Override <test-override@example.com>'
+        )
+
+    def test_skips_existing_recipient(self) -> None:
+        msg = self._msg(cc='TEST-OVERRIDE@example.com')
+        b4.add_me_too(msg)
+        assert msg['Cc'] == 'TEST-OVERRIDE@example.com'
+
+    @pytest.mark.parametrize('value', ['no', 'False', '0'])
+    def test_disabled(self, monkeypatch: pytest.MonkeyPatch, value: str) -> None:
+        monkeypatch.setitem(b4.MAIN_CONFIG, 'send-me-too', value)
+        msg = self._msg()
+        b4.add_me_too(msg)
+        assert msg['Cc'] is None
+
+
 class TestUnicodeControlChars:
     """The Cf-character guard in get_am_message() must raise BadCharsError
     instead of calling sys.exit(), so that interactive front-ends (the
diff --git a/src/tests/test_review.py b/src/tests/test_review.py
index e40dd35def9e..a19397671c35 100644
--- a/src/tests/test_review.py
+++ b/src/tests/test_review.py
@@ -2132,6 +2132,26 @@ class TestBuildReviewEmail:
         assert msg['To'] == 'custom@example.com'
         assert msg['Cc'] == 'other@example.com'
 
+    def test_send_me_too_ccs_reviewer(self) -> None:
+        msg = self._build(self._make_series(cc='other@example.com'))
+        assert msg is not None
+        assert msg['Cc'] == (
+            'maintainer@example.com, other@example.com, Reviewer <reviewer@example.com>'
+        )
+
+    def test_send_me_too_disabled(self, monkeypatch: pytest.MonkeyPatch) -> None:
+        monkeypatch.setitem(b4.MAIN_CONFIG, 'send-me-too', 'no')
+        msg = self._build()
+        assert msg is not None
+        assert msg['Cc'] == 'maintainer@example.com'
+
+    def test_send_me_too_skipped_for_edited_recipients(self) -> None:
+        series = self._make_series(to='custom@example.com', cc='')
+        series['header-info']['tocc-edited'] = True
+        msg = self._build(series)
+        assert msg is not None
+        assert msg['Cc'] is None
+
 
 # -- Tests for get_reference_message() ---------------------------------------
 

-- 
2.56.0

