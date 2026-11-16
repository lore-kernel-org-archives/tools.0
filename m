Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864160;
	b=VZEUanCU6OVDU4axRA8xZhoW+5DaMj1b8QY+ByOoBUYl4PGsWz0xmCmNaT3CiTzEMTmZ
	 SUZ3nHt30NknrJ9z+b3VTXsRWU9yX5mraSXEcosr+Knbj+4EVi8PiWMyQn2EoXtc1TCmz
	 CC+sVkK3tWn8IOQzwttHrd+ox2EpIujv8BWiZSchR3GlhoCdgZ2DEx/iIJWl80K20EFSd
	 zKGk1sYR0lH7+/Ktb1TSJeJihyyNZzi3LpUhao9vrK/PbfcEHfwTuGAMtrzGWuJkw6sT0
	 1AvinqPERlBt2NDcnTEbwm0x3qqReCI7L0CHqewOOWsA1VPj2rDGBQ0qoSFeeDPHayQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864160;
	h=Received:Delivered-To:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=OAZf1uKdIANHQHru4HisJ8vWaTIKox93SrFO9Gr1TgE=;
	b=BZE4jPulrdxEATqFOGEDyWiRheVu4vuThr7tkHFvyd/MVbPCZZwBAtJdxFBwTHDdW/qt
	 EBQyMQ0t9UyXuFYBSCVnj2bNp+i5AhQmS57460xgCk5FhSWe8Ai6iwvZk+bjSqJX3CrgU
	 goUZLxQAM/HavU5n1cnVbiw3SZsEtrROM/MOUPidhTc1qgq6Oiw68sy99pqB8ai4NbcQ8
	 FcS2+34r09j4yJQMiQQ9BJP2af/4JB6RQca3WkqC9o2sdUBSgQbdbckyPxaSF+/5vQbXm
	 WZBdjpD92uElrl3hHAcjKdiCKRNMOsNxoR4q2Jbml7A+B8YZ0+PvvBn2Pr7epOyl1Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QIs7BIGc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5C5606A32F
	for <tools@linux.kernel.org>; Mon, 16 Nov 2026 21:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QIs7BIGc
Received: by smtp.kernel.org (Postfix)
	id 204DE1F000C8; Mon, 16 Nov 2026 21:22:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 056871F000C4;
	Mon, 16 Nov 2026 21:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794864160;
	bh=OAZf1uKdIANHQHru4HisJ8vWaTIKox93SrFO9Gr1TgE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=QIs7BIGctY2OsRgfvCP4BbivSrdjANRmKhmZc0aGfrT3lIf5tf+8BZkkiUy3VaPAz
	 lBk9LXFyiHQ1O+SjNHoLJbaICDGANan8OrLGXWHDZnytNg/0o8MsRIeaWFnfG+sd9C
	 wxPpXh8d6k3P8wSM4ImY/6wUSGXUGOK4uCLQkNHe3/8nb9FqxpADNXSuvYaSYr9XBo
	 vEptBLRS7w0SjnkNimTQ1hWv2y8S9n8lcA5EctuIHP18yr1iCf0OXt36sz50ECoNeT
	 Xk6NnGFZcDMlwVFImEABypc5K3jmrCL1IgKzbuWvoF4vWMVwMHq4o5BUE+9molQ+aw
	 k5WW/KoLCSpKg==
From: Brian Masney <masneyb@kernel.org>
Date: Mon, 16 Nov 2026 16:22:28 -0500
Subject: [PATCH b4 v2 2/2] add tests for b4.send-me-too
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
Message-Id: <20261116-review-send-me-too-v2-2-3e1e305e3272@kernel.org>
References: <20261116-review-send-me-too-v2-0-3e1e305e3272@kernel.org>
In-Reply-To: <20261116-review-send-me-too-v2-0-3e1e305e3272@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Brian Masney <masneyb@kernel.org>
X-Mailer: b4 0.17-dev-de01b
X-Developer-Signature: v=1; a=openpgp-sha256; l=5451; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=ImbQczQqUeZcyFiqCoWT987JKoHiI0nBog3DPUIMsjw=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJ+l0gcnBxjuHme1n8utoanOqcd+3Un9ZcfeJy+dIX1t
 Ey1hUePdJSyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjARl6WMDFMP/GuPZ+3yE0na
 2ariz82sMOlYN4sU52xDqU21l5NKzRj+KcXkVES3O6yPf315be/e3zuvrV3YrsrY66bzzyrv+zJ
 FVgA=
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Add tests for the b4.send-me-too configuration option for the review and
ty parts of b4.

Signed-off-by: Brian Masney <masneyb@kernel.org>
---
 src/tests/test___init__.py | 37 +++++++++++++++++++++++++++++++++++++
 src/tests/test_review.py   | 20 ++++++++++++++++++++
 src/tests/test_ty.py       | 41 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 98 insertions(+)

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
 
diff --git a/src/tests/test_ty.py b/src/tests/test_ty.py
index 269ce021306f..6a5fbed92ae1 100644
--- a/src/tests/test_ty.py
+++ b/src/tests/test_ty.py
@@ -1,3 +1,4 @@
+import email.utils
 import os
 import pathlib
 from email.message import EmailMessage
@@ -767,6 +768,46 @@ def test_generate_am_thanks_does_not_leak_between_branches(
     assert b4.MAIN_CONFIG['thanks-commit-url-mask'] is None
 
 
+def _make_ty_reply(metoo: Optional[bool], cc: str = '') -> EmailMessage:
+    jsondata = _am_jsondata('0123456789abcdef0123456789abcdef01234567')
+    jsondata['cc'] = cc
+    cmdargs = mock.Mock(metoo=metoo, since=None)
+    return b4.ty.make_reply('Thanks!', jsondata, None, cmdargs)
+
+
+@pytest.mark.parametrize(
+    'conf,metoo,expected',
+    [
+        ('yes', None, True),
+        ('no', None, False),
+        ('no', True, True),
+    ],
+)
+def test_make_reply_me_too(
+    monkeypatch: pytest.MonkeyPatch,
+    conf: str,
+    metoo: Optional[bool],
+    expected: bool,
+) -> None:
+    """--me-too wins; otherwise b4.send-me-too decides."""
+    monkeypatch.setitem(b4.MAIN_CONFIG, 'send-me-too', conf)
+    msg = _make_ty_reply(metoo)
+    if expected:
+        assert msg['Cc'] == 'Test <test@example.com>'
+    else:
+        assert msg['Cc'] is None
+
+
+def test_make_reply_me_too_keeps_existing_cc(
+    monkeypatch: pytest.MonkeyPatch,
+) -> None:
+    """Already being Cc'd on the original is enough; no duplicate added."""
+    monkeypatch.setitem(b4.MAIN_CONFIG, 'send-me-too', 'yes')
+    msg = _make_ty_reply(None, cc='Test <test@example.com>, other@example.com')
+    ccs = [x[1] for x in email.utils.getaddresses([str(msg['Cc'])])]
+    assert ccs == ['test@example.com', 'other@example.com']
+
+
 def test_queue_message_check_headers(
     monkeypatch: pytest.MonkeyPatch, tmp_path: pathlib.Path
 ) -> None:

-- 
2.56.1

