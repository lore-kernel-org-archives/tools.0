Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0A7442B15
	for <tools@linux.kernel.org>; Fri, 18 Sep 2026 19:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789758212; cv=none; b=AeW2o6zDkoLl4hsY9aLEY4UMxMzOxRV1MrePvNDXasHiooqVAcU5pa3aTEB+NKRaT3LckAE7K/rZowp/dFdUGyPY5bah/m423gd469Xm74jVkfYAp/6gXC/lfwUi9MiWUiNqyV1fVefqCcNHFWJ/oKQG/NfD1UkMr8LS8swTsR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789758212; c=relaxed/simple;
	bh=bAyZNOuLVx0jn3wPWKXcXvTSrV9BEEL2A4rxugFCGko=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KMpL0b4APkFLMi6bHL8lBb1P7p8RjaKqeWXKxGpWHSFFpoACiSbD8/2z6zwkdo8fGUn+858wTspExFPm6SZa3+4DULIRF+1UczuiC7DJM0ToHw81LWzuSfeY9LhY60+UbLZNxF/Y+oJbKhEJJS+NPZvd4JqdKpARqyLbjo/Fuq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZMdPxsdu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZMdPxsdu"
Received: by smtp.kernel.org (Postfix)
	id 1925D1F00899; Fri, 18 Sep 2026 19:03:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A60DA1F008A2;
	Fri, 18 Sep 2026 19:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789758192;
	bh=7h758SbcCcDZP/fy6lKWKJ/zqyP8yBcj1zWltSpEUC0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ZMdPxsduNdDVJskpJTf//zMFuw685ciDrGGh1J/0Z9WzN4C7DgR2TT00+v9AfnuyK
	 /Nx867o7nsRvpDHgjrMjWx6J4Xykn+bbaIlLxRxNceo2gbRNT24uLAgn7RBY3OEmjG
	 VoPD7Bx/7akQKnndxzyPws341cS+hAVFQP15eaEeKhi2Zb/5cTetKH32vM+NReMg/A
	 D8Y+U5SlO6nNPMxvaBp5mzM8vOdJKWQ3iBdEWExB7NOPDjJOmIIEcYwqysr27hp+kZ
	 rCZEq5erOmiFesk9SmiiHDtiw6U2JkiCAebx+ebKGhiyUnxlqaUBQhJTsXJ3UNCQVY
	 znN0KDFWG4TaA==
From: Tamir Duberstein <tamird@kernel.org>
Date: Fri, 18 Sep 2026 15:02:55 -0400
Subject: [PATCH patatt v2 4/4] Import PyNaCl unconditionally
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-stronger-type-checking-v2-4-37de1d8a6c86@kernel.org>
References: <20260918-stronger-type-checking-v2-0-37de1d8a6c86@kernel.org>
In-Reply-To: <20260918-stronger-type-checking-v2-0-37de1d8a6c86@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3716; i=tamird@kernel.org;
 h=from:subject:message-id; bh=bAyZNOuLVx0jn3wPWKXcXvTSrV9BEEL2A4rxugFCGko=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDFlru14el3wqvc/+54xF9arLmld/n34ptlZ4Mce/y89iM
 wPu6XZc6ZjIwiDGxWAppsiSKHpob3rq7T2yme+Ow8xhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkY6BjrGDFycAjDVCV8Y/nA9872wg20ux85jk76/Lmg6sGLKPL7L3EVBnJ5Luw7OXbqH4X+R80R
 T0bvvVzRfC7ZKyFVcazR9krhI/IUNNVbbLwmnWbEBAA==
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

PyNaCl is already a required runtime dependency, but missing imports
are only reported when signing, verification, or key generation runs.

Import the required symbols at module load time and remove the
RuntimeError wrappers and test skip for an unavailable dependency.
Incomplete installations then fail when patatt is imported.

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
Assisted-by: LLM
---
 src/patatt/__init__.py | 25 ++++---------------------
 tests/conftest.py      |  6 +-----
 2 files changed, 5 insertions(+), 26 deletions(-)

diff --git a/src/patatt/__init__.py b/src/patatt/__init__.py
index 7254fcc..6b61a18 100644
--- a/src/patatt/__init__.py
+++ b/src/patatt/__init__.py
@@ -23,10 +23,11 @@ import urllib.parse
 import warnings
 from io import BytesIO
 from pathlib import Path
-from typing import TYPE_CHECKING, Dict, List, Optional, Tuple, Union
+from typing import Dict, List, Optional, Tuple, Union
 
-if TYPE_CHECKING:
-    from nacl.signing import SigningKey
+from nacl.encoding import Base64Encoder
+from nacl.exceptions import BadSignatureError
+from nacl.signing import SigningKey, VerifyKey
 
 GitConfigType = Dict[str, Union[str, List[str]]]
 AttestationResult = Tuple[
@@ -455,12 +456,6 @@ class DevsigHeader:
 
     @staticmethod
     def _sign_ed25519(payload: bytes, privkey: bytes) -> tuple[bytes, bytes]:
-        try:
-            from nacl.encoding import Base64Encoder
-            from nacl.signing import SigningKey
-        except ModuleNotFoundError as ex:
-            raise RuntimeError('This operation requires PyNaCl libraries') from ex
-
         if privkey not in KEYCACHE:
             sk = SigningKey(privkey, encoder=Base64Encoder)
             vk = base64.b64encode(sk.verify_key.encode())
@@ -479,13 +474,6 @@ class DevsigHeader:
 
     @staticmethod
     def _validate_ed25519(sigdata: bytes, pubkey: bytes) -> bytes:
-        try:
-            from nacl.encoding import Base64Encoder
-            from nacl.exceptions import BadSignatureError
-            from nacl.signing import VerifyKey
-        except ModuleNotFoundError as ex:
-            raise RuntimeError('This operation requires PyNaCl libraries') from ex
-
         vk = VerifyKey(pubkey, encoder=Base64Encoder)
         try:
             return vk.verify(sigdata, encoder=Base64Encoder)
@@ -1769,11 +1757,6 @@ def cmd_validate(cmdargs: argparse.Namespace, config: GitConfigType) -> None:
 
 
 def cmd_genkey(cmdargs: argparse.Namespace, config: GitConfigType) -> None:
-    try:
-        from nacl.signing import SigningKey
-    except ModuleNotFoundError as ex:
-        raise RuntimeError('This operation requires PyNaCl libraries') from ex
-
     # Do we have the signingkey defined?
     usercfg = get_config_from_git(r'user\..*')
     if not config.get('identity'):
diff --git a/tests/conftest.py b/tests/conftest.py
index 2d5c0b6..9e92937 100644
--- a/tests/conftest.py
+++ b/tests/conftest.py
@@ -6,6 +6,7 @@ from pathlib import Path
 from typing import Generator
 
 import pytest
+from nacl.signing import SigningKey
 
 from patatt import DevsigHeader, PatattMessage
 
@@ -51,11 +52,6 @@ def patatt_message(sample_email_bytes: bytes) -> PatattMessage:
 @pytest.fixture
 def sample_ed25519_key_pair() -> dict[str, bytes]:
     """Generate a sample ed25519 key pair for testing."""
-    try:
-        from nacl.signing import SigningKey
-    except ImportError:
-        pytest.skip('PyNaCl not installed, skipping ed25519 tests')
-
     # Generate a key pair
     private_key = SigningKey.generate()
     public_key = private_key.verify_key

-- 
2.56.0.rc0.682.g1951b10616.frankengit

