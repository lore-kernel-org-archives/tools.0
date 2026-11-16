Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794851865;
	b=UcpA3MPnRLEaPNLKgEotA+xE8ymj8eFK7hRRNs6BUzwjt3DDNKJA5sqTu4910Jn4ZV1H
	 j76FPxuk10qzeIFOgx7SH08w+GvfpLL13kG5u1lXz3t37TJQo2tgexOh3poiqemcb1pbx
	 lhwMzjQSTcnpuy7pLkZctyncFIHxhclWMOStS9Zd8mzsc5WY5il5EsuHCnlCwCDDmK1EY
	 MPSUTuflpt5peqypawfQLRfe3dkgwbKhvq4gy3jdAe4vhhSVLBj7ooj/W3LqS/bBZvLaF
	 8I1+t04J1lq//MMGiJ7vV4WUrcMZ6ZIRUcf5UOeIWaO8PR7vwGVweW6sAspgFsrhcug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851865;
	h=Received:Delivered-To:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=GcLrFfqENUmjwpcHBeYuH5XX5GSlhI01WbonU/y3EFM=;
	b=p/1C/B1Ici9UWhWQq6QMBPxbhPFgyUYdoAJZBa/17lDfAZkv7vKkLFVKAjj4UMrfY5lw
	 9f/eE/5aAaz//jxY9200YFPfTBSOBuYyDDypv11DzS3W4k4Ex9+IYdgbpMRowbLx0ss0p
	 nfPnbCXxY3eEoEuO1okJFl//eefmFC2Tdd9lv2gTP72c8nE4ixPRnTY+E34pAAU+yEvlB
	 t3kLMQUakLhVIAm1iu5bMi8mDRRR5buFxSZKVavZQ996RWXaz36VMDKHn17BlftJbG4Ky
	 C3mgiPwzyeGTHiGvgwRhkEZh47eiZ3XCmkhy+qCbfX8cjAc004ailkdFdU2t5nF7kXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fCtvP1Pg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373C7606A881
	for <tools@linux.kernel.org>; Mon, 16 Nov 2026 17:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fCtvP1Pg
Received: by smtp.kernel.org (Postfix)
	id D82021F000CA; Mon, 16 Nov 2026 17:57:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5894A1F000C4;
	Mon, 16 Nov 2026 17:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794851864;
	bh=GcLrFfqENUmjwpcHBeYuH5XX5GSlhI01WbonU/y3EFM=;
	h=From:Date:Subject:To:Cc;
	b=fCtvP1Pg6aFWy0Hf+0oeBG03Tsq6nhH/nXO7l2yxGj/Rr0mzRPIeGuIj7o6p3cJLJ
	 uJA9DwyWBkRTN5XBSVE+wSXMZ2mGbKJXUirNZ27pIlA9RWAT5qCSi4Zht7bUuiO6HQ
	 A04TjTGdtFe6aPnOSu8NlAArfCeqsRDxKCa+oJtEYENTtzStYzR0iAgG6hpuQ2ES70
	 Yf+LRH2jLb5wNsEIhDcuPxfsD5vGKlLhNxFq2Vh4xb7fg4j7TyzSl62L2p5tIdQtAd
	 +6WYuQvcR7VXOu3RLL9A8Wt+/D3tUENHUydoeOKAwSO5rJS+f3E79b+hZmtCh+tnAD
	 oJu+fmBgVVyuw==
From: Brian Masney <masneyb@kernel.org>
Date: Mon, 16 Nov 2026 12:57:36 -0500
Subject: [PATCH b4] tests: disable signing key in tests
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
Message-Id: <20261116-gpg-yubikey-tests-v1-1-a4513b3bf40d@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/yXMQQ6CMBAF0Ks0f80kFgitvYpxYctYRxMknWIkh
 LsbdfsWb4NyEVYEs6HwS1SeE4KxjUG6XabMJCOCQXtoB2vtQHnOtC5RHrxSZa1KnfPOHb3vYkp
 oDObCV3n/zhNij/PfdIl3TvWbYd8/psAy/3kAAAA=
X-Change-ID: 20261116-gpg-yubikey-tests-378779883bcc
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Brian Masney <masneyb@kernel.org>
X-Mailer: b4 0.17-dev-aef0a
X-Developer-Signature: v=1; a=openpgp-sha256; l=2040; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=jkg/Om+sEmIFnOtTn2gMD/rB7JZgqYelW07Vkz9tq9E=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJ+uwiJXLmZtvbm+cMJZtfvOlVWVW0JPta0WbOobzNPS
 5jiVM7rHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEyE/QIjw5uVBUEXbHrDciI9
 Pxo85t70tHHPCsW7D85sLxbeo/uuvJuRYe6UVbon7mt9M7ZPimzMqdlbNKvn/6+is4IyGfJsIVf
 qeAA=
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

When the user has commit signing enabled in their .gitconfig with a
Yubikey, the unit tests will stall while it waits for the user to
press the button on the Yubikey. Let's go ahead and just disable the
signing in the tests.

Assisted-by: LLM
Signed-off-by: Brian Masney <masneyb@kernel.org>
---
 src/tests/conftest.py | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/src/tests/conftest.py b/src/tests/conftest.py
index 12a62bfb771c..5d323962e843 100644
--- a/src/tests/conftest.py
+++ b/src/tests/conftest.py
@@ -37,10 +37,23 @@ def settestdefaults(
     )
     monkeypatch.setenv('XDG_DATA_HOME', str(tmp_path))
     monkeypatch.setenv('XDG_CACHE_HOME', str(tmp_path))
+    # Neutralize the user's signing config so tests never invoke gpg or
+    # open an editor (tag.gpgsign turns a lightweight tag into an
+    # annotated one that prompts for a message).
+    git_config_overrides = {
+        'commit.gpgsign': 'false',
+        'tag.gpgsign': 'false',
+        'tag.forcesignannotated': 'false',
+    }
     git_config_count = int(os.environ.get('GIT_CONFIG_COUNT', '0'))
-    monkeypatch.setenv('GIT_CONFIG_COUNT', str(git_config_count + 1))
-    monkeypatch.setenv(f'GIT_CONFIG_KEY_{git_config_count}', 'commit.gpgsign')
-    monkeypatch.setenv(f'GIT_CONFIG_VALUE_{git_config_count}', 'false')
+    monkeypatch.setenv(
+        'GIT_CONFIG_COUNT', str(git_config_count + len(git_config_overrides))
+    )
+    for idx, (key, value) in enumerate(
+        git_config_overrides.items(), start=git_config_count
+    ):
+        monkeypatch.setenv(f'GIT_CONFIG_KEY_{idx}', key)
+        monkeypatch.setenv(f'GIT_CONFIG_VALUE_{idx}', value)
     # This lets us avoid execvp-ing from inside b4 when testing
     monkeypatch.setattr(sys, '_running_in_pytest', True, raising=False)
 

---
base-commit: ce4c1158edb292caca0ce4a6087e5edecc1b0371
change-id: 20261116-gpg-yubikey-tests-378779883bcc

Best regards,
--  
Brian Masney <masneyb@kernel.org>

