Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671DF346A10
	for <tools@linux.kernel.org>; Mon, 20 Apr 2026 01:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776648273; cv=none; b=OgQ+gdANbq278v7dAV4Z/Dv/8hhZkpKT9bFlh+2XNU3/sxbDSPN9Pw8Xdt6NEnTweR3Dgrg02KXFj1RM2G/dwNDBOD3v+3KJFntlxH9if5J/9uUKMReH0z7NHm7RqoEFTb9vzAz3Mr3E6SOOyGvn6pPIpBUx1x5uaGSn2sw+Z3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776648273; c=relaxed/simple;
	bh=F7WtgOy9vqg4RZMAx5me6lxxjYBgwAhvmMyFKCHh694=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HGjbhaO1mM+3Sld2SH1FKpC0rwqCBK+mssobjMDvh5e/mxQ2qQHUEsITA//OFJVxP7lGdoV1y1GuXvVVihJG5SiypKyObQpR19G+MBb8JxnZTqcLnyQatArXHkQDttbE/yyuLeZ/+srL+dR7C9oe3mrPnSkJP7WH0GtMAhXEpXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KS4WcDdJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KS4WcDdJ"
Received: by smtp.kernel.org (Postfix)
	id E136DC2BCB5; Mon, 20 Apr 2026 01:24:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9E6BC2BCAF;
	Mon, 20 Apr 2026 01:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776648272;
	bh=F7WtgOy9vqg4RZMAx5me6lxxjYBgwAhvmMyFKCHh694=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KS4WcDdJ7QM6QKxTEccKWC7n1v6YUQhjYzBiR9UF9/2X/lDxCje80ut6d2JP/aHa9
	 CD1D8ukpuXvQ2J57lhJPXet9NjKAeYBCpgKU2vxen2N/WRIjS9kzACilLTO55j6Qnk
	 6A7Sy+qT+mTI3AAco3WX/mAydk1mgmMkYNY2vcn8PyHDrrVOBtI5XpxnLRmOiJvffZ
	 +Q80TfTdWCsTCvPZassnIj442D35qQwUG4cmmaGgyJJID0nUbYzOLpI6uVp8g90LTd
	 ej6ZQQZt5u0WkalBD+h6uUoz8JF0H2k0OAQWPBVSz1GcgVDzDIQ58c3ilvAXik+jZF
	 84mX2J2FVxnfA==
From: Tamir Duberstein <tamird@kernel.org>
Date: Sun, 19 Apr 2026 21:22:27 -0400
Subject: [PATCH patatt 7/7] Import PyNaCl unconditionally
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260419-stronger-type-checking-v1-7-5c108048d2c7@kernel.org>
References: <20260419-stronger-type-checking-v1-0-5c108048d2c7@kernel.org>
In-Reply-To: <20260419-stronger-type-checking-v1-0-5c108048d2c7@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3555; i=tamird@kernel.org;
 h=from:subject:message-id; bh=F7WtgOy9vqg4RZMAx5me6lxxjYBgwAhvmMyFKCHh694=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlP65+ySXOetrn+v2X/pJ+v9m++ZevJ8FLMIi1A2Ofxk
 VyX6pLVHRNZGMS4GCzFFFkSRQ/tTU+9vUc2891xmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHQMeYgYtTAKb6TD4jw4FdhqG6VdWesbOzBdq3d3Tr6s7lbFhSIy3jpeSoNm9TC8N/z9TYfWK
 fN0tvqf3L9Cbp6D/3+u/6Gv3HtD/vvqBwii+CBwA=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

PyNaCl became a non-optional runtime dependency in
7eb7dfaf4c9f6028519f5209041da1cb61302cd8, so importing it lazily and
translating missing imports to RuntimeError only hides packaging
problems.

Import the required PyNaCl symbols at module load time and remove the
matching test skip for an unavailable dependency.

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
 src/patatt/__init__.py | 22 ++++------------------
 tests/conftest.py      |  6 +-----
 2 files changed, 5 insertions(+), 23 deletions(-)

diff --git a/src/patatt/__init__.py b/src/patatt/__init__.py
index b20074a..5c8a480 100644
--- a/src/patatt/__init__.py
+++ b/src/patatt/__init__.py
@@ -24,6 +24,10 @@ from io import BytesIO
 from pathlib import Path
 from typing import Any, Dict, List, Optional, Set, Tuple, Union
 
+from nacl.encoding import Base64Encoder
+from nacl.exceptions import BadSignatureError
+from nacl.signing import SigningKey, VerifyKey
+
 GitConfigType = Dict[str, Union[str, List[str]]]
 AttestationResult = Tuple[
     int, Optional[str], Optional[str], Optional[str], Optional[str], List[str]
@@ -450,12 +454,6 @@ class DevsigHeader:
     @staticmethod
     def _sign_ed25519(payload: bytes, privkey: bytes) -> Tuple[bytes, bytes]:
         global KEYCACHE
-        try:
-            from nacl.encoding import Base64Encoder
-            from nacl.signing import SigningKey
-        except ModuleNotFoundError:
-            raise RuntimeError('This operation requires PyNaCl libraries')
-
         if privkey not in KEYCACHE:
             sk = SigningKey(privkey, encoder=Base64Encoder)
             vk = base64.b64encode(sk.verify_key.encode())
@@ -469,13 +467,6 @@ class DevsigHeader:
 
     @staticmethod
     def _validate_ed25519(sigdata: bytes, pubkey: bytes) -> bytes:
-        try:
-            from nacl.encoding import Base64Encoder
-            from nacl.exceptions import BadSignatureError
-            from nacl.signing import VerifyKey
-        except ModuleNotFoundError:
-            raise RuntimeError('This operation requires PyNaCl libraries')
-
         vk = VerifyKey(pubkey, encoder=Base64Encoder)
         try:
             return vk.verify(sigdata, encoder=Base64Encoder)
@@ -1734,11 +1725,6 @@ def cmd_validate(cmdargs: argparse.Namespace, config: GitConfigType) -> None:
 
 
 def cmd_genkey(cmdargs: argparse.Namespace, config: GitConfigType) -> None:
-    try:
-        from nacl.signing import SigningKey
-    except ModuleNotFoundError:
-        raise RuntimeError('This operation requires PyNaCl libraries')
-
     # Do we have the signingkey defined?
     usercfg = get_config_from_git(r'user\..*')
     if not config.get('identity'):
diff --git a/tests/conftest.py b/tests/conftest.py
index a2d2124..2301d1b 100644
--- a/tests/conftest.py
+++ b/tests/conftest.py
@@ -4,6 +4,7 @@ from pathlib import Path
 from typing import Dict, Generator
 
 import pytest
+from nacl.signing import SigningKey
 
 from patatt import DevsigHeader, PatattMessage
 
@@ -49,11 +50,6 @@ def patatt_message(sample_email_bytes: bytes) -> PatattMessage:
 @pytest.fixture
 def sample_ed25519_key_pair() -> Dict[str, bytes]:
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
2.53.0

