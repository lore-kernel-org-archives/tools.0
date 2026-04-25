Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264093016EE
	for <tools@linux.kernel.org>; Sat, 25 Apr 2026 19:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777146608; cv=none; b=ljXqrF9FiXUbQ2MS77xmKsWbq2onvBqfgxBoQjCcrx1CcPovoDoBnIUfkVxf3HKZhyBkiTGgZFQA8w6UkF5SKZ35LZRrNm8DomCej09yL9Hq7CP5oflhr8v+fgAisFVMyI/s8KcKUbav2Gzw6FBmeEi14yAwzMrTqZcQVnwqyUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777146608; c=relaxed/simple;
	bh=fDnlL0he9EpAcBHROHm55DwVXT6AWkSSEsYHOfuVO3o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jWdynEN0GH9x3cK1v0utBtt79h2rZSqKIoEaMrB6/6+BH83BZ53ME02SrvgBkWm4ajJbD2CJ6+FJj8vGfvxVX9bPeV24U3JkcNh/7sl4H8gMVxgo9LM7F4a12NFcdeaxbeA+VRaTHaIdX9C79NeyuxOL4Lv3xVWrCcz9sZ2XbOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qjgMNrlY; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qjgMNrlY"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12c7288cfb9so207703c88.2
        for <tools@linux.kernel.org>; Sat, 25 Apr 2026 12:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777146606; x=1777751406; darn=linux.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SCtmbf72iJfNbexxfwcKW631XmuIKFBdU0JKqlZwVE4=;
        b=qjgMNrlY9zZFD+WpjpB1JyOJDaR4uL6nkLBbS9loVvlnb2xGlUnWHFRHJVVs9O9se1
         m0rTUr4SjaCtOb+sfOkHud0+GUNGsMMXIN3OE3hmC9s55fmLWscP4RXkvL+LRCVSjiIn
         o+QK27puvDYrzg86mDHTmpGQDv7fzV5oc+WlBLtSVlhER9qZgThrlY3s98DPSNzCI5w3
         RdMLLEfP+d7ImRBlC+ZBduBVgYhrprPpPwJAc0KMDuOAvNFH92/v0YQkHRSzgCdR5hcd
         7nEx+lwbUXhSn7iJxjyVR35A5t/xph9bdhDgOG3Vd0X1urGBb07fcWU5Q/EkGVV14BAW
         05HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777146606; x=1777751406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SCtmbf72iJfNbexxfwcKW631XmuIKFBdU0JKqlZwVE4=;
        b=X8wvgimrqJpa44Td22xsqLaax3cWXVYb3n5hqkQBeEGhhSlD3pYmb71dodXtn/Bntp
         H3Hp/LtSGFBp4xg5ZGL90vfRylDFw1pXefhEO2YlL7PjJmvl237s4kVrjnZHV5WeSRBi
         k7YRNM533fFCW4raHhI5Q5PWCSLJ4sVwv7YKYVW2/fSwizLART5zaiF5KhX1C3ecQyj5
         6orQyfMuqaGliUJBgkIBMJU/i4EVAFglyFvkI0VWtFt+svE3BauylkhGMg7MN9lIPRLN
         8HrRH9hXkMqGGYtppnWGiizRSRt0eelosCDYiShAJQ63V3uXH5vQYVP/T9gEXo9IB3Wy
         YTcg==
X-Gm-Message-State: AOJu0YzuUBLIsOznpUeHkTR9kK2iUqZHzR9of0+hETBPFrCjirISPgkE
	HlCrSBvG2C3M70ye6X/gdW/MnQZkXarOh10jiyvrVatBj/KIrshufhU2aIZa0Q==
X-Gm-Gg: AeBDieuUuvpQfw5ND4i9KTEK/a1ug7O8ttaggHFeWdWmFIqOXeG+vr9pJyDMwIpQ5E+
	GIqw1nhE6tWJZOhTsCZt/ZXKgSjDADzy2Y+bBTiSR2bQN+NDc3DLZQH3zAIoUI9a5ehRC/YavuG
	FhAJ3QspVkwZfd/xHrEKMNJfy+jt5vjAyyHuTMWxmwyEcCSRnbUwDyzWwQqbZqYVgZt647xW7DO
	IZTAVIUkWy91JUGaDY0XuFzc/PcbS0D4YjnGhYyoI9KqMVOaJNJujzUiGe3erteWOtLPslcAv5d
	3T94FvpKUJ9+vFRpt8gdt7S6lcpEDFc5P/DghIS4nt5Ihu9FWZU9t4uL88wEwUFhEn/Wfs+zTwR
	eWNkkSdMCqDJCc1udNCy84PzXjib5TETySVvurAfEzrjwxsSNVBIM5I5q1ET2V+qKcPbqfT3X1Y
	O0lVZJ94brauwWKTGelaeN81yTBOsiaHR0jFO1p6xUXvoxaj/qEZi2FLC6jWLbTVR5iRgJZik8h
	2moK07eFXCnA3PlJF7FlpYp
X-Received: by 2002:a05:7022:6b97:b0:12c:3d1c:d0d6 with SMTP id a92af1059eb24-12c73f66025mr7304519c88.1.1777146606147;
        Sat, 25 Apr 2026 12:50:06 -0700 (PDT)
Received: from localhost.localdomain (187.250.115.107.dsl.dyn.telnor.net. [187.250.115.107])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c74a20eb5sm48512078c88.14.2026.04.25.12.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 12:50:05 -0700 (PDT)
From: Adrian Neftali Sanchez <lutgaru@gmail.com>
To: tools@linux.kernel.org
Cc: konstantin@linuxfoundation.org,
	Adrian Neftali Sanchez <lutgaru@gmail.com>
Subject: [RFC PATCH 09/13] tests: replace NamedTemporaryFile with tmp_path in patatt fixture
Date: Sat, 25 Apr 2026 12:49:37 -0700
Message-ID: <20260425194943.1499-10-lutgaru@gmail.com>
X-Mailer: git-send-email 2.45.0.windows.1
In-Reply-To: <20260425194943.1499-1-lutgaru@gmail.com>
References: <20260425194943.1499-1-lutgaru@gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use pytest's built-in tmp_path fixture to store the ephemeral ed25519
private key instead of tempfile.NamedTemporaryFile.  This removes the
manual os.unlink teardown step (pytest removes the directory
automatically, even when a test raises) and also avoids the Windows
restriction that a NamedTemporaryFile with delete=True cannot be opened
by a second process while still open.

Signed-off-by: Adrian Neftali Sanchez <lutgaru@gmail.com>
---
 src/tests/test_patatt.py | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/src/tests/test_patatt.py b/src/tests/test_patatt.py
index de05277..3ed4711 100644
--- a/src/tests/test_patatt.py
+++ b/src/tests/test_patatt.py
@@ -6,6 +6,7 @@ Uses ephemeral ed25519 keys so no external key material is needed.
 import base64
 import email.message
 import os
+import pathlib
 import tempfile
 from collections.abc import Generator
 from typing import Tuple, Union
@@ -18,21 +19,29 @@ import patatt
 
 
 @pytest.fixture()
-def ed25519_keypair() -> Generator[Tuple[str, str, str, str], None, None]:
-    """Generate an ephemeral ed25519 keypair written to temp files.
-
-    Returns (privkey_path, verify_key_b64, identity, selector).
-    The private key file is written so patatt can find it via
-    signingkey = ed25519:/path/to/key.
+def ed25519_keypair(
+    tmp_path: pathlib.Path,
+    monkeypatch: pytest.MonkeyPatch,
+) -> Generator[Tuple[str, str, str, str], None, None]:
+    """Generate an ephemeral ed25519 keypair stored in patatt's data directory.
+
+    Returns (key_name, verify_key_b64, identity, selector).  The private key
+    is written to ``<tmp_path>/patatt/private/<key_name>.key``.  XDG_DATA_HOME
+    is pointed at ``tmp_path`` for the duration of the test so patatt resolves
+    the key by name without any OS-specific absolute-path handling.
+    patatt.KEYCACHE is cleared to prevent key material from a previous test
+    leaking into this one (all tests share the identity "test@example.com").
     """
     sk = SigningKey.generate()
     sk_b64 = base64.b64encode(sk.encode()).decode()
     vk_b64 = base64.b64encode(sk.verify_key.encode()).decode()
-    with tempfile.NamedTemporaryFile(mode='w', suffix='.key', delete=False) as fh:
-        fh.write(sk_b64)
-        privkey_path = fh.name
-    yield privkey_path, vk_b64, 'test@example.com', 'default'
-    os.unlink(privkey_path)
+    key_name = 'test-key'
+    private_dir = tmp_path / 'patatt' / 'private'
+    private_dir.mkdir(parents=True, exist_ok=True)
+    (private_dir / f'{key_name}.key').write_text(sk_b64)
+    monkeypatch.setenv('XDG_DATA_HOME', str(tmp_path))
+    monkeypatch.setattr(patatt, 'KEYCACHE', {})
+    yield key_name, vk_b64, 'test@example.com', 'default'
 
 
 @pytest.fixture()
-- 
2.45.0.windows.1

