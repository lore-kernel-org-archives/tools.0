Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793804828;
	b=YUnaAQy43dT8Kkff2R+WCyAqAgj5YDkLmyaGwlqH8Dl8VJsiqiCi9SFYB6HlD3ulBdoX
	 PRQ+wrN014IFbQxUCX3G7aguL6qp3GQuYGs9hUJ2VYMNWb5LTjqryVjnjPDtbSJdWgcKG
	 EmhqFqOi5x6yv37UBIz0wF4JxqpSfCD1xX6ueh6hy1O11AcF5e5UazWQWX82IKxmR1TyH
	 FYQ98xkKk+Z25fFVDZXtEIXOtrXPh2esAMbCfWMnHwBXeW3TAhyKQOrzMMlBncoE1fRxS
	 z8na9WqWydLq8q87dnQErNxjKWInf1PqYIUdyaThE5YbVKCGnZg/M5WIL7bw+zQKckw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793804828;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:DKIM-Signature:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=iW0lhBE/sLXWzKfCOMpEO8T7tWJJre+7qNevIwpb6Sk=;
	b=sq/N05UbiK0Dwl53yYxEk5ImWZS1d0FQ4/3qCsKU+9bh/rGZg/06B1UKaM/Zw7+TXokf
	 pgSAUomIAsBbKmlS3I0zYqrHahRjX6EqQOKaNd2MAqJt1iroUrFo87tkng5S/6u5/DBOo
	 PHG5tPtBGlWLlM4TaYpTyWr9/hAGOAmb7ugfJ4tkpjvvPyZTwDnCLnSTdRv6oSa0uYj8x
	 yAyx+jR73skRLFkoBBBN8c5MuMEdeK6W2/D6jZfsP6GWzucQG4Mxpq+UClgu+IbqSB7ZE
	 7j+PLsZ15qsgjWQ+M8+xup2wX1fW2dbBNY59qsFYzjmWvAyc8nG5Pw6XuoUfAPpD23Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=hsal.es header.i=@hsal.es header.a=rsa-sha256 header.s=MBO0001 header.b=vBHeN+49;
	arc=fail smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FDC606A33A
	for <tools@linux.kernel.org>; Wed,  4 Nov 2026 15:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hsal.es header.i=@hsal.es header.a=rsa-sha256 header.s=MBO0001 header.b=vBHeN+49
Received: by smtp.kernel.org (Postfix)
	id CE2AB1F00A17; Wed,  4 Nov 2026 15:07:06 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=80.241.56.171
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793804826;
	b=oWV6r//RiI/ZKi5q5iwJv8fXTbcLNL+p0+hiUqNXWowsxUmxlh4jadnkUesNeDy8uvj4
	 bmeNfi/UeknaHaeUX8F8z4lZtJjDXVvLQoSokwmkS4iTiECA4KTIIHDaWnLic4qNE6LLA
	 VLTRK+Uz2SmWYVJnTH31IOODqHU+nb8IG8B/NoLv3wor2Wu5xMQvWBEoEIpjly7AfP1oC
	 RoQD3+NYeSSqRya7uqLj7jdrdHgjBsm6tFEYlZX9wCnW09S0P6xteKym036gyaxKDDjjC
	 g5QNME6XuSCrzbL/jVkPsJWxfNHv5KDZKBw9xxrqSLcB3DwkBAAJZP+2dIAe1HRIhgA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793804826;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Rspamd-Queue-Id;
	bh=iW0lhBE/sLXWzKfCOMpEO8T7tWJJre+7qNevIwpb6Sk=;
	b=UvElxCXkvV/KnLpmjTQS5idHyx4zxHb+EnscqRTsZ4cpfh58WqkGzydKiGcVIm9nah1q
	 EwfWDAOTuZzVb6R/rwJkDcJoQWPFkqbUptnvxiUQyF+hZ0/91buAOgds8tRDWFvRZP8Mr
	 hWE0+5bQzEgYPfBd3oW1vzXmJ2EZA7553oh8PD61pI0+AGwxrP6DmSKSyaHNfzOjjICX7
	 YIWiTFO1tzzRPBHvcpklQVT480APHpeQCQjtayP74T/mmIb83cCOq2eV6hi5CmpxK6uzf
	 nhv0EBllXuAWRBgzu5oLC6j+spY9Ka07n7ffHdDCtgFH33uXuVtRRUe5NZayJwO/qyw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=hsal.es header.i=@hsal.es header.a=rsa-sha256 header.s=MBO0001 header.b=vBHeN+49;
	dmarc=pass header.from=hsal.es;
	spf=pass smtp.mailfrom=hsal.es;
	arc=none smtp.remote-ip=80.241.56.171
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D748D1F000C1
	for <tools@kernel.org>; Wed,  4 Nov 2026 15:07:04 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hsal.es header.i=@hsal.es header.a=rsa-sha256 header.s=MBO0001 header.b=vBHeN+49
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org D748D1F000C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=hsal.es
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=hsal.es
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4jKTLZ5JZjzMllX;
	Wed, 04 Nov 2026 16:07:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hsal.es; s=MBO0001;
	t=1793804822;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iW0lhBE/sLXWzKfCOMpEO8T7tWJJre+7qNevIwpb6Sk=;
	b=vBHeN+49lKCkfU3kOV7J6FQ1z2lwX2FZlbLxyGCetLnS14nVVLrH5UKVJ4I3w/b82gavdw
	kHkOy76EHIDdgKHAsbmFYfITAgMGkr3gnrTsjxBeM4ev+bivpJWPdhW8+Zcv4dqFf4IHv5
	8me7Kpfuf4OnJTXKSDDRxw6ZGIg2mAtC/Ab8RLOI48YDkg2CTj6Dn79jkOQGpw2OA7gVab
	5Fq+A1aeSYcGug13uT2ZWMhWU8jRxwS6gvC+vptzVfEwxMzGITTUyUsljj0UzutTiRrYj7
	HtxjZeREDsyVTrc3qNr4t0+Mz7bZTcN2sdLEHBaysj3sBKwSBSAtLXl5pV54jw==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of hugo@hsal.es designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=hugo@hsal.es
From: Hugo Sales <hugo@hsal.es>
To: tools@kernel.org
Cc: konstantin@linuxfoundation.org,
	Hugo Sales <hugo@hsal.es>
Subject: [PATCH patatt] Keep identity lookups out of KEYCACHE
Date: Wed,  4 Nov 2026 15:06:58 +0000
Message-ID: <20261104150658.2189226-1-hugo@hsal.es>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4jKTLZ5JZjzMllX

get_algo_keydata() caches (algo, keydata) in KEYCACHE under the signer
identity, and _sign_openpgp() caches the key's fingerprint in the same
dict under the key ID. With user.signingkey set to the same string as
user.email, which is a common way to name a GPG key, _sign_openpgp()
finds the identity's tuple and takes it as the fingerprint. Signing the
first message then fails, with a TypeError in 0.7.0 and on the
isinstance assert on master

Cache identity lookups in their own dict, and add a test that a signing
key spelled like the identity leaves nothing in KEYCACHE

The asserts on a cache hit only narrowed KEYCACHE's union type for the
type checkers. IDENTITYCACHE holds one type, so they go

Signed-off-by: Hugo Sales <hugo@hsal.es>
---
I hit this with user.signingkey = hugo@hsal.es, which gpg resolves to my
key. Setting patatt.signingkey = openpgp:<keyid> works around it until a
release has the fix
---
 src/patatt/__init__.py              | 18 +++++++----------
 tests/unit/test_get_algo_keydata.py | 30 +++++++++++++++++++++++++----
 2 files changed, 33 insertions(+), 15 deletions(-)

diff --git a/src/patatt/__init__.py b/src/patatt/__init__.py
index 0a430f4..1484be1 100644
--- a/src/patatt/__init__.py
+++ b/src/patatt/__init__.py
@@ -55,10 +55,10 @@ REQ_HDRS: list[bytes] = [b'from', b'subject']
 OPT_HDRS: list[bytes] = [b'message-id']
 
 # Quick cache for key info
-KEYCACHE: dict[
-    str | bytes,
-    bytes | tuple[SigningKey, bytes] | tuple[str, str] | None,
-] = {}
+KEYCACHE: dict[str | bytes, bytes | tuple[SigningKey, bytes] | None] = {}
+# Signing algorithm and key data per identity, kept apart from KEYCACHE
+# because an identity can be spelled like a key ID
+IDENTITYCACHE: dict[str, tuple[str, str]] = {}
 # Quick cache for config settings
 CONFIGCACHE: dict[str, GitConfigType] = {}
 
@@ -1442,12 +1442,8 @@ def get_algo_keydata(config: GitConfigType) -> tuple[str, str]:
             f'Identity must be a string, got {type(identity).__name__}'
         )
 
-    if (cached := KEYCACHE.get(identity)) is not None:
-        assert isinstance(cached, tuple)
-        algo, keydata = cached
-        assert isinstance(algo, str)
-        assert isinstance(keydata, str)
-        return algo, keydata
+    if (cached := IDENTITYCACHE.get(identity)) is not None:
+        return cached
 
     if not config.get('signingkey'):
         user_signingkey = usercfg.get('signingkey')
@@ -1507,7 +1503,7 @@ def get_algo_keydata(config: GitConfigType) -> tuple[str, str]:
         logger.critical('E: Unknown key type: %s', sk)
         raise ConfigurationError(f'Unknown key type: {sk}')
 
-    KEYCACHE[identity] = (algo, keydata)
+    IDENTITYCACHE[identity] = (algo, keydata)
     return algo, keydata
 
 
diff --git a/tests/unit/test_get_algo_keydata.py b/tests/unit/test_get_algo_keydata.py
index 4d9b7e6..d03da39 100644
--- a/tests/unit/test_get_algo_keydata.py
+++ b/tests/unit/test_get_algo_keydata.py
@@ -4,6 +4,7 @@ from unittest.mock import MagicMock, patch
 import pytest
 
 from patatt import (
+    IDENTITYCACHE,
     KEYCACHE,
     GitConfigType,
     NoKeyError,
@@ -34,8 +35,9 @@ class TestGetAlgoKeydataSSHSigningKey:
     """Tests for the user.signingkey + gpg.format detection in get_algo_keydata."""
 
     def setup_method(self) -> None:
-        """Clear KEYCACHE before each test to avoid cross-test pollution."""
+        """Clear the caches before each test to avoid cross-test pollution."""
         KEYCACHE.clear()
+        IDENTITYCACHE.clear()
 
     @patch('patatt.get_config_from_git')
     def test_ssh_format_uses_openssh(self, mock_gcfg: MagicMock) -> None:
@@ -125,9 +127,9 @@ class TestGetAlgoKeydataSSHSigningKey:
         assert algo == 'openssh'
 
     @patch('patatt.get_config_from_git')
-    def test_keycache_hit_skips_lookup(self, mock_gcfg: MagicMock) -> None:
-        """When identity is already in KEYCACHE, return cached result directly."""
-        KEYCACHE['cached@example.com'] = ('openssh', '/cached/key')
+    def test_identitycache_hit_skips_lookup(self, mock_gcfg: MagicMock) -> None:
+        """When identity is already in IDENTITYCACHE, return cached result directly."""
+        IDENTITYCACHE['cached@example.com'] = ('openssh', '/cached/key')
 
         mock_gcfg.side_effect = _make_mock_get_config(
             usercfg={'email': 'cached@example.com'},
@@ -139,6 +141,26 @@ class TestGetAlgoKeydataSSHSigningKey:
         assert algo == 'openssh'
         assert keydata == '/cached/key'
 
+    @patch('patatt.get_config_from_git')
+    def test_signingkey_equal_to_identity_stays_out_of_keycache(
+        self, mock_gcfg: MagicMock
+    ) -> None:
+        """A signing key spelled like the identity must not leave a tuple in KEYCACHE.
+
+        _sign_openpgp() caches fingerprints in KEYCACHE by key ID, so a tuple
+        stored there under the same string would come back as the fingerprint
+        """
+        mock_gcfg.side_effect = _make_mock_get_config(
+            usercfg={'email': 'test@example.com', 'signingkey': 'test@example.com'},
+            gpgcfg={},
+        )
+        config: GitConfigType = {'identity': 'test@example.com'}
+        algo, keydata = get_algo_keydata(config)
+
+        assert (algo, keydata) == ('openpgp', 'test@example.com')
+        assert 'test@example.com' not in KEYCACHE
+        assert IDENTITYCACHE['test@example.com'] == ('openpgp', 'test@example.com')
+
     @patch('patatt.get_config_from_git')
     def test_unknown_gpg_format_defaults_to_openpgp(self, mock_gcfg: MagicMock) -> None:
         """An unrecognized gpg.format value should fall through to openpgp."""
-- 
2.56.0

