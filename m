Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8D551CF56
	for <tools@linux.kernel.org>; Fri, 18 Sep 2026 19:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789758209; cv=none; b=KsZiTY1PCCi//T4HKPItFyI7f0YtJbH2+mQrExyblFDRkSRhiy1Sru5bTCwIDInxOxOE3r3wW8TiFCIDOmX4M8my0u2AQyw/OGYy3Mll3nvFCIc3XyCzFE8qYSl0VFhM/0KtYWz8y5HJsBE2Ms1GK1nHMEfMZonrBHAM+H5asyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789758209; c=relaxed/simple;
	bh=DM+vVSMxplcbeiTBGHcyXzt+OVwtPqhESVm7JefFNyo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CXRY+ypmPOYhGSZf2kfA7bpvA+2xihjAeJ5dcuH2AsROKKROcv9O0dpwbiXk9fZSPFepMeT96vi2DSppge5vjXEnsmsBsVH1pYlr5rYHlKgvfBd0L0epcFxPU2K4paFOccpdIZcmnV1w2bOjNwY9r+6TKBhjhmMTs/bHF3dyG2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MJ8mzE2K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MJ8mzE2K"
Received: by smtp.kernel.org (Postfix)
	id DB36C1F0089A; Fri, 18 Sep 2026 19:03:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 755291F00899;
	Fri, 18 Sep 2026 19:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789758190;
	bh=0A3F+hUpTYzSVc8LzXswOI+B3JVHnXpC0pPMWvNJCjA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=MJ8mzE2K6WtALVqOyEzB9BZFUnZxIy4Y9h6SQJjjGUoqsjKZ2FbIKzjeImoo8cbYS
	 Arz3BHPbyWo94ePBeXGfzMSSoL+Qp9UygNxGExed/BpJaWjMXbybRPDY55mt6cnjSo
	 Xlo6QTaGHylpyAKik8zwYZ4kdiXm5hWsSdcW16DQe6EteHhzcaAwnsr875bsCY6qkv
	 312Z0nMTxweMW9KWMqUyl/CIBhi0oGpqZ5vYE7H46Cd4f7y0xjwp3mGA4OkxCxmmQ/
	 zYXaq5ReJOhkx6IzOgw49naZJwY3dIDT8vhhIJaBlQWb6bx52+M+8aRYWG8c1LtJVD
	 GZjSJin3/cQ5g==
From: Tamir Duberstein <tamird@kernel.org>
Date: Fri, 18 Sep 2026 15:02:53 -0400
Subject: [PATCH patatt v2 2/4] Tighten local type and lint checks
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-stronger-type-checking-v2-2-37de1d8a6c86@kernel.org>
References: <20260918-stronger-type-checking-v2-0-37de1d8a6c86@kernel.org>
In-Reply-To: <20260918-stronger-type-checking-v2-0-37de1d8a6c86@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=71752; i=tamird@kernel.org;
 h=from:subject:message-id; bh=DM+vVSMxplcbeiTBGHcyXzt+OVwtPqhESVm7JefFNyo=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDFlru17o8je6rtqlxXVd64kL7+93VvpV6UtnNx6LPcl1/
 4Jf+7bTHRNZGMS4GCzFFFkSRQ/tTU+9vUc2891xmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHQMeYgYtTAKbaJYyRodOBI+Gh1/PgvMMZ4Sp6EQ/3KD7LePTK0/LF8ulfmriv+DH8947bsI6
 3yeD44cz1S80t9+Qzd12f/iPB1XIG78LyA/ctmAA=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

Remove pyright's unknown-type exemptions by annotating containers and
attestation results. Describe the shared key cache with its concrete
value types and narrow cached values at each consumer. Exercise real
Ed25519 signing and signed-message validation with reused key material.
Keep the public GPGBIN and SSHKBIN variables mutable, and limit
private-usage exemptions to tests.

Upgrade the locked Ruff from 0.15.22 to 0.16.8 and ty from 0.0.69 to
0.0.81. Adopt Ruff's expanded default checks alongside the existing
additional rules. Defer annotations so modern syntax remains compatible
with Python 3.8, simplify literals and string formatting, and make the
subprocess return-code policy explicit. Preserve the public RuntimeError
for missing non-OpenPGP keys with a narrow exemption and regression test.

Fix the existing Python 3.8 build and test-collection failures. The SPDX
license string added by b967423e2b9f ("Use SPDX license identifier in
pyproject.toml") requires a setuptools version that cannot run on Python
3.8. Use the compatible license table and require setuptools>=61 for
project metadata support. Defer the tuple annotation in the config test
added by 721af992b265 ("Fix multi-value config handling in
get_config_from_git()") so Python 3.8 can collect the tests.

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
Assisted-by: LLM
---
 docs/conf.py                           |   2 +-
 pyproject.toml                         |  20 +-
 src/patatt/__init__.py                 | 349 +++++++++++++++++----------------
 tests/conftest.py                      |   6 +-
 tests/test_validation.py               |  19 +-
 tests/unit/test_devsig_header.py       |  17 +-
 tests/unit/test_get_config_from_git.py |   2 +
 tests/unit/test_patatt_message.py      |   4 +-
 tests/unit/test_run_command.py         |   5 +-
 uv.lock                                |  76 +++----
 10 files changed, 272 insertions(+), 228 deletions(-)

diff --git a/docs/conf.py b/docs/conf.py
index ca8031a..37e6944 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -15,7 +15,7 @@ copyright = '2021-2026, Konstantin Ryabitsev'
 author = 'Konstantin Ryabitsev'
 
 # The version info (imported after sys.path is set up above)
-from patatt import __VERSION__  # noqa: E402
+from patatt import __VERSION__
 
 version = __VERSION__
 release = __VERSION__
diff --git a/pyproject.toml b/pyproject.toml
index 8d3de79..8e0472f 100644
--- a/pyproject.toml
+++ b/pyproject.toml
@@ -1,5 +1,5 @@
 [build-system]
-requires = ["setuptools>=42", "wheel"]
+requires = ["setuptools>=61", "wheel"]
 build-backend = "setuptools.build_meta"
 
 [project]
@@ -9,7 +9,7 @@ description = "A simple library to add cryptographic attestation to patches sent
 authors = [
     {name = "Konstantin Ryabitsev", email = "mricon@kernel.org"},
 ]
-license = "MIT-0"
+license = {text = "MIT-0"}
 readme = "README.rst"
 requires-python = ">=3.8"
 keywords = ["git", "patches", "attestation", "email", "workflow"]
@@ -84,17 +84,13 @@ quote-style = "single"
 [tool.pyright]
 typeCheckingMode = "strict"
 
-# Overly strict rules.
+# GPGBIN and SSHKBIN are mutable settings despite their uppercase names.
+# b4 also assigns GPGBIN directly, so its public name must be preserved.
 reportConstantRedefinition = false
-reportUnknownArgumentType = false
-reportUnknownLambdaType = false
-reportUnknownMemberType = false
-reportUnknownVariableType = false
-
-# False positives caused by underscore-prefixed functions used across files.
-# Might be good to clean this up.
-reportPrivateUsage = false
-reportUnusedFunction = false
+
+executionEnvironments = [
+    { root = "tests", reportPrivateUsage = false },
+]
 
 # Configure mypy in strict mode
 [tool.mypy]
diff --git a/src/patatt/__init__.py b/src/patatt/__init__.py
index bb087bb..d33ff68 100644
--- a/src/patatt/__init__.py
+++ b/src/patatt/__init__.py
@@ -1,8 +1,9 @@
-# -*- coding: utf-8 -*-
 #
 # Copyright (C) 2021-2026 by The Linux Foundation
 # SPDX-License-Identifier: MIT-0
 #
+from __future__ import annotations
+
 __author__ = 'Konstantin Ryabitsev <konstantin@linuxfoundation.org>'
 
 import argparse
@@ -22,15 +23,21 @@ import urllib.parse
 import warnings
 from io import BytesIO
 from pathlib import Path
-from typing import Any, Dict, List, Optional, Tuple, Union
+from typing import TYPE_CHECKING, Dict, List, Optional, Tuple, Union
+
+if TYPE_CHECKING:
+    from nacl.signing import SigningKey
 
 GitConfigType = Dict[str, Union[str, List[str]]]
+AttestationResult = Tuple[
+    int, Optional[str], Optional[str], Optional[str], Optional[str], List[str]
+]
 
 logger: logging.Logger = logging.getLogger(__name__)
 
 # Overridable via [patatt] parameters
-GPGBIN: Optional[str] = None
-SSHKBIN: Optional[str] = None
+GPGBIN: str | None = None
+SSHKBIN: str | None = None
 
 # Hardcoded defaults
 DEVSIG_HDR = b'X-Developer-Signature'
@@ -43,13 +50,16 @@ RES_NOKEY = 8
 RES_ERROR = 16
 RES_BADSIG = 32
 
-REQ_HDRS: List[bytes] = [b'from', b'subject']
-OPT_HDRS: List[bytes] = [b'message-id']
+REQ_HDRS: list[bytes] = [b'from', b'subject']
+OPT_HDRS: list[bytes] = [b'message-id']
 
 # Quick cache for key info
-KEYCACHE: Dict[Union[str, bytes], Any] = dict()
+KEYCACHE: dict[
+    str | bytes,
+    bytes | tuple[SigningKey, bytes] | tuple[str, str] | None,
+] = {}
 # Quick cache for config settings
-CONFIGCACHE: Dict[str, GitConfigType] = dict()
+CONFIGCACHE: dict[str, GitConfigType] = {}
 
 # My version
 __VERSION__ = '0.8.0'
@@ -64,16 +74,16 @@ class Error(Exception):
         errors: Optional list of detailed error messages.
     """
 
-    errors: Optional[List[str]]
+    errors: list[str] | None
 
-    def __init__(self, message: str, errors: Optional[List[str]] = None):
+    def __init__(self, message: str, errors: list[str] | None = None):
         super().__init__(message)
         self.errors = errors
 
     def __str__(self) -> str:
         s = super().__str__()
         if self.errors:
-            s = '%s: (%s)' % (s, ', '.join(self.errors))
+            s = '{}: ({})'.format(s, ', '.join(self.errors))
         return s
 
 
@@ -107,20 +117,20 @@ class DevsigHeader:
         hval: Optional raw header value to parse.
     """
 
-    _headervals: List[bytes]
-    _body_hash: Optional[bytes]
-    _order: List[str]
-    hval: Optional[bytes]
-    hdata: Dict[str, bytes]
+    _headervals: list[bytes]
+    _body_hash: bytes | None
+    _order: list[str]
+    hval: bytes | None
+    hdata: dict[str, bytes]
 
-    def __init__(self, hval: Optional[bytes] = None):
-        self._headervals = list()
+    def __init__(self, hval: bytes | None = None):
+        self._headervals = []
         self._body_hash = None
         # it doesn't need to be in any particular order,
         # but that's just anarchy, anarchy, I say!
         self._order = ['v', 'a', 't', 'l', 'i', 's', 'h', 'bh']
         self.hval = None
-        self.hdata = dict()
+        self.hdata = {}
 
         if hval:
             self.from_bytes(hval)
@@ -141,7 +151,7 @@ class DevsigHeader:
                 continue
             self.set_field(parts[0].decode(), parts[1])
 
-    def get_field_as_bytes(self, field: str) -> Optional[bytes]:
+    def get_field_as_bytes(self, field: str) -> bytes | None:
         """Get a header field value as bytes.
 
         Args:
@@ -152,7 +162,7 @@ class DevsigHeader:
         """
         return self.hdata.get(field)
 
-    def get_field_as_str(self, field: str) -> Optional[str]:
+    def get_field_as_str(self, field: str) -> str | None:
         """Get a header field value as a string.
 
         Args:
@@ -166,7 +176,7 @@ class DevsigHeader:
             return value.decode()
         return value
 
-    def get_field(self, field: str, decode: bool = False) -> Union[None, str, bytes]:
+    def get_field(self, field: str, decode: bool = False) -> None | str | bytes:
         """Get a header field value (deprecated).
 
         .. deprecated::
@@ -182,7 +192,7 @@ class DevsigHeader:
             return value.decode()
         return value
 
-    def set_field(self, field: str, value: Union[None, str, bytes]) -> None:
+    def set_field(self, field: str, value: None | str | bytes) -> None:
         """Set a header field value.
 
         Args:
@@ -196,7 +206,7 @@ class DevsigHeader:
             value = value.encode()
         self.hdata[field] = value
 
-    def set_body(self, body: bytes, maxlen: Optional[int] = None) -> None:
+    def set_body(self, body: bytes, maxlen: int | None = None) -> None:
         """Set the message body and compute its hash.
 
         Call this after git-mailinfo normalization.
@@ -220,7 +230,7 @@ class DevsigHeader:
         hashed.update(body)
         self._body_hash = base64.b64encode(hashed.digest())
 
-    def set_headers(self, headers: List[bytes], mode: str) -> None:
+    def set_headers(self, headers: list[bytes], mode: str) -> None:
         """Set message headers for signing or validation.
 
         Call this after git-mailinfo normalization.
@@ -233,8 +243,8 @@ class DevsigHeader:
             SigningError: If required headers are missing (sign mode).
             ValidationError: If required headers are not signed (validate mode).
         """
-        parsed = list()
-        allhdrs = set()
+        parsed: list[tuple[bytes, bytes]] = []
+        allhdrs: set[bytes] = set()
         # DKIM operates on headers in reverse order
         for header in reversed(headers):
             try:
@@ -247,16 +257,17 @@ class DevsigHeader:
 
         reqset = set(REQ_HDRS)
         optset = set(OPT_HDRS)
-        self._headervals = list()
+        self._headervals = []
         if mode == 'sign':
             # Make sure REQ_HDRS is a subset of allhdrs
             if not reqset.issubset(allhdrs):
                 raise SigningError(
-                    'The following required headers not present: %s'
-                    % (b', '.join(reqset.difference(allhdrs)).decode())
+                    'The following required headers not present: {}'.format(
+                        b', '.join(reqset.difference(allhdrs)).decode()
+                    )
                 )
             # Add optional headers that are actually present
-            optpresent = list(allhdrs.intersection(optset))
+            optpresent: list[bytes] = list(allhdrs.intersection(optset))
             signlist = REQ_HDRS + sorted(optpresent)
             self.hdata['h'] = b':'.join(signlist)
 
@@ -268,11 +279,12 @@ class DevsigHeader:
             # Make sure REQ_HEADERS are in this set
             if not reqset.issubset(set(signlist)):
                 raise ValidationError(
-                    'The following required headers not signed: %s'
-                    % (b', '.join(reqset.difference(set(signlist))).decode())
+                    'The following required headers not signed: {}'.format(
+                        b', '.join(reqset.difference(set(signlist))).decode()
+                    )
                 )
         else:
-            raise RuntimeError('Unknown set_header mode: %s' % mode)
+            raise RuntimeError(f'Unknown set_header mode: {mode}')
 
         for shname in signlist:
             if shname not in allhdrs:
@@ -298,7 +310,7 @@ class DevsigHeader:
         if not self._headervals:
             raise RuntimeError('Must use set_headers first')
 
-    def validate(self, keyinfo: Union[str, bytes, None]) -> Tuple[str, str]:
+    def validate(self, keyinfo: str | bytes | None) -> tuple[str, str]:
         """Validate the signature against the message content.
 
         Args:
@@ -309,6 +321,7 @@ class DevsigHeader:
             Tuple of (signing_key_id, sign_timestamp).
 
         Raises:
+            RuntimeError: If keyinfo is None for ed25519/openssh.
             BodyValidationError: If body hash doesn't match.
             ValidationError: If signature validation fails.
         """
@@ -338,7 +351,7 @@ class DevsigHeader:
 
         signtime: str
         if algo.startswith('openpgp'):
-            pubkey: Optional[bytes] = None
+            pubkey: bytes | None = None
             if isinstance(keyinfo, str):
                 pubkey = keyinfo.encode()
             else:
@@ -358,9 +371,9 @@ class DevsigHeader:
             skeyinfo = keyinfo
             bkeyinfo = keyinfo.encode()
         else:
-            # This cannot be None for any of the algorithms we support other than openpgp, done above
-            raise RuntimeError(
-                'keyinfo must be a string or bytes, not %s' % type(keyinfo).__name__
+            # Only openpgp accepts None; preserve the public RuntimeError contract.
+            raise RuntimeError(  # noqa: TRY004
+                f'keyinfo must be a string or bytes, not {type(keyinfo).__name__}'
             )
 
         if algo.startswith('ed25519'):
@@ -380,13 +393,11 @@ class DevsigHeader:
                 raise ValidationError('t= field is required for openssh sigs')
             signtime = _st
         else:
-            raise ValidationError('Unknown algorithm: %s' % algo)
+            raise ValidationError(f'Unknown algorithm: {algo}')
 
         return signkey, signtime
 
-    def sign(
-        self, keyinfo: Union[str, bytes], split: bool = True
-    ) -> Tuple[bytes, bytes]:
+    def sign(self, keyinfo: str | bytes, split: bool = True) -> tuple[bytes, bytes]:
         """Sign the message and generate signature header value.
 
         Args:
@@ -413,7 +424,7 @@ class DevsigHeader:
             skeyinfo = keyinfo
             bkeyinfo = keyinfo.encode()
 
-        hparts = list()
+        hparts: list[bytes] = []
         for fn in self._order:
             fv = self.get_field_as_bytes(fn)
             if fv is not None:
@@ -435,7 +446,7 @@ class DevsigHeader:
         elif algo.startswith('openssh'):
             bval, pkinfo = DevsigHeader._sign_openssh(digest, skeyinfo)
         else:
-            raise RuntimeError('Unknown a=%s' % algo)
+            raise RuntimeError(f'Unknown a={algo}')
 
         if split:
             return dshval + DevsigHeader.splitter(bval), pkinfo
@@ -443,8 +454,7 @@ class DevsigHeader:
         return dshval + bval, pkinfo
 
     @staticmethod
-    def _sign_ed25519(payload: bytes, privkey: bytes) -> Tuple[bytes, bytes]:
-        global KEYCACHE
+    def _sign_ed25519(payload: bytes, privkey: bytes) -> tuple[bytes, bytes]:
         try:
             from nacl.encoding import Base64Encoder
             from nacl.signing import SigningKey
@@ -456,7 +466,12 @@ class DevsigHeader:
             vk = base64.b64encode(sk.verify_key.encode())
             KEYCACHE[privkey] = (sk, vk)
         else:
-            sk, vk = KEYCACHE[privkey]
+            cached = KEYCACHE[privkey]
+            assert isinstance(cached, tuple)
+            cached_sk, cached_vk = cached
+            assert isinstance(cached_sk, SigningKey)
+            assert isinstance(cached_vk, bytes)
+            sk, vk = cached_sk, cached_vk
 
         bdata = sk.sign(payload, encoder=Base64Encoder)
 
@@ -478,11 +493,10 @@ class DevsigHeader:
             raise ValidationError('Failed to validate signature') from ex
 
     @staticmethod
-    def _sign_openssh(payload: bytes, keyfile: str) -> Tuple[bytes, bytes]:
-        global KEYCACHE
+    def _sign_openssh(payload: bytes, keyfile: str) -> tuple[bytes, bytes]:
         keypath = os.path.expanduser(os.path.expandvars(keyfile))
         if not os.access(keypath, os.R_OK):
-            raise SigningError('Unable to read openssh public key %s' % keypath)
+            raise SigningError(f'Unable to read openssh public key {keypath}')
         sshkargs = ['-Y', 'sign', '-n', 'patatt', '-f', keypath]
         ecode, out, err = sshk_run_command(sshkargs, payload)
         if ecode > 0:
@@ -507,7 +521,9 @@ class DevsigHeader:
             keyfp = chunks[1]
             KEYCACHE[keypath] = keyfp
         else:
-            keyfp = KEYCACHE[keypath]
+            cached = KEYCACHE[keypath]
+            assert isinstance(cached, bytes)
+            keyfp = cached
 
         return sigdata, keyfp
 
@@ -556,8 +572,7 @@ class DevsigHeader:
                 )
 
     @staticmethod
-    def _sign_openpgp(payload: bytes, keyid: str) -> Tuple[bytes, bytes]:
-        global KEYCACHE
+    def _sign_openpgp(payload: bytes, keyid: str) -> tuple[bytes, bytes]:
         gpgargs = ['-s', '-u', keyid]
         ecode, out, err = gpg_run_command(gpgargs, payload)
         if ecode > 0:
@@ -584,18 +599,19 @@ class DevsigHeader:
                         break
             KEYCACHE[keyid] = keyfp
         else:
-            keyfp = KEYCACHE[keyid]
+            cached = KEYCACHE[keyid]
+            assert cached is None or isinstance(cached, bytes)
+            keyfp = cached
 
         if keyfp is None:
-            raise SigningError('Could not find fingerprint for key %s' % keyid)
+            raise SigningError(f'Could not find fingerprint for key {keyid}')
 
         return bdata, keyfp
 
     @staticmethod
     def _validate_openpgp(
-        sigdata: bytes, pubkey: Optional[bytes]
-    ) -> Tuple[bytes, Tuple[bool, bool, bool, str, str]]:
-        global KEYCACHE
+        sigdata: bytes, pubkey: bytes | None
+    ) -> tuple[bytes, tuple[bool, bool, bool, str, str]]:
         bsigdata = base64.b64decode(sigdata)
         vrfyargs = ['--verify', '--output', '-', '--status-fd=2']
         if pubkey:
@@ -609,8 +625,10 @@ class DevsigHeader:
                 ]
                 if pubkey in KEYCACHE:
                     logger.debug('Reusing cached keyring')
+                    keyring = KEYCACHE[pubkey]
+                    assert isinstance(keyring, bytes)
                     with open(os.path.join(td, 'pub'), 'wb') as kfh:
-                        kfh.write(KEYCACHE[pubkey])
+                        kfh.write(keyring)
                 else:
                     logger.debug('Importing into new keyring')
                     gpgargs = keyringargs + ['--status-fd=1', '--import']
@@ -639,7 +657,7 @@ class DevsigHeader:
         raise ValidationError('Failed to validate PGP signature')
 
     @staticmethod
-    def _check_gpg_status(status: bytes) -> Tuple[bool, bool, bool, str, str]:
+    def _check_gpg_status(status: bytes) -> tuple[bool, bool, bool, str, str]:
         good = False
         valid = False
         trusted = False
@@ -649,24 +667,26 @@ class DevsigHeader:
         logger.debug(
             'GNUPG status:\n\t%s', status.decode().strip().replace('\n', '\n\t')
         )
-        if re.search(rb'^\[GNUPG:] GOODSIG ([0-9A-F]+)\s+(.*)$', status, flags=re.M):
+        if re.search(
+            rb'^\[GNUPG:] GOODSIG ([0-9A-F]+)\s+(.*)$', status, flags=re.MULTILINE
+        ):
             good = True
         if vs_matches := re.search(
             rb'^\[GNUPG:] VALIDSIG ([0-9A-F]+) (\d{4}-\d{2}-\d{2}) (\d+)',
             status,
-            flags=re.M,
+            flags=re.MULTILINE,
         ):
             valid = True
-            signkey = vs_matches.groups()[0].decode()
-            signtime = vs_matches.groups()[2].decode()
-        if re.search(rb'^\[GNUPG:] TRUST_(FULLY|ULTIMATE)', status, flags=re.M):
+            signkey = str(vs_matches.group(1), 'ascii')
+            signtime = str(vs_matches.group(3), 'ascii')
+        if re.search(rb'^\[GNUPG:] TRUST_(FULLY|ULTIMATE)', status, flags=re.MULTILINE):
             trusted = True
 
         return good, valid, trusted, signkey, signtime
 
     @staticmethod
     def splitter(longstr: bytes, limit: int = 75) -> bytes:
-        splitstr = list()
+        splitstr: list[bytes] = []
         first = True
         while len(longstr) > limit:
             at = limit
@@ -720,17 +740,17 @@ class PatattMessage:
         msgdata: Raw message bytes in RFC2822 format.
     """
 
-    headers: List[bytes]
+    headers: list[bytes]
     body: bytes
     lf: bytes
     signed: bool
-    canon_headers: Optional[List[bytes]]
-    canon_body: Optional[bytes]
-    canon_identity: Optional[str]
-    sigs: Optional[List[DevsigHeader]]
+    canon_headers: list[bytes] | None
+    canon_body: bytes | None
+    canon_identity: str | None
+    sigs: list[DevsigHeader] | None
 
     def __init__(self, msgdata: bytes):
-        self.headers = list()
+        self.headers = []
         self.body = b''
         self.lf = b'\n'
         self.signed = False
@@ -761,7 +781,7 @@ class PatattMessage:
         for line in re.sub(rb'[\r\n]*$', b'', m + p).split(b'\n'):
             self.canon_body += re.sub(rb'[\r\n]*$', b'', line) + b'\r\n'
 
-        idata = dict()
+        idata: dict[bytes, bytes] = {}
         for line in re.sub(rb'[\r\n]*$', b'', i).split(b'\n'):
             left, right = line.split(b':', 1)
             idata[left.lower()] = right.strip()
@@ -770,7 +790,7 @@ class PatattMessage:
         self.canon_identity = idata.get(b'email', b'').decode()
 
         # Now substituting headers returned by mailinfo
-        self.canon_headers = list()
+        self.canon_headers = []
         for header in self.headers:
             try:
                 left, right = header.split(b':', 1)
@@ -792,9 +812,9 @@ class PatattMessage:
     def sign(
         self,
         algo: str,
-        keyinfo: Union[str, bytes],
-        identity: Optional[str],
-        selector: Optional[str],
+        keyinfo: str | bytes,
+        identity: str | None,
+        selector: str | None,
     ) -> None:
         """Sign the message and add signature headers.
 
@@ -830,9 +850,9 @@ class PatattMessage:
             ds.set_field('s', selector)
 
         if algo not in ('ed25519', 'openpgp', 'openssh'):
-            raise SigningError('Unsupported algorithm: %s' % algo)
+            raise SigningError(f'Unsupported algorithm: {algo}')
 
-        ds.set_field('a', '%s-sha256' % algo)
+        ds.set_field('a', f'{algo}-sha256')
         if algo in ('ed25519', 'openssh'):
             # Set signing time for non-pgp sigs
             ds.set_field('t', str(int(time.time())))
@@ -848,9 +868,7 @@ class PatattMessage:
             b'i=%s' % identity.encode(),
             b'a=%s' % algo.encode(),
         ]
-        if algo == 'openpgp':
-            idata.append(b'fpr=%s' % pkinfo)
-        elif algo == 'openssh':
+        if algo == 'openpgp' or algo == 'openssh':
             idata.append(b'fpr=%s' % pkinfo)
         else:
             idata.append(b'pk=%s' % pkinfo)
@@ -861,8 +879,8 @@ class PatattMessage:
         self.headers.append(dkhdr.encode().encode() + self.lf)
 
     def validate(
-        self, identity: str, pkey: Union[bytes, str, None], trim_body: bool = False
-    ) -> Tuple[str, str]:
+        self, identity: str, pkey: bytes | str | None, trim_body: bool = False
+    ) -> tuple[str, str]:
         """Validate the signature for a specific identity.
 
         Args:
@@ -886,7 +904,7 @@ class PatattMessage:
                 vds = ds
                 break
         if vds is None:
-            raise ValidationError('No signatures matching identity %s' % identity)
+            raise ValidationError(f'No signatures matching identity {identity}')
 
         self.git_canonicalize()
         if not self.canon_headers or not self.canon_body:
@@ -955,7 +973,7 @@ class PatattMessage:
         if not len(self.headers) or not len(self.body):
             raise RuntimeError('Not a valid RFC2822 message')
 
-    def get_sigs(self) -> List[DevsigHeader]:
+    def get_sigs(self) -> list[DevsigHeader]:
         """Extract and return all signature headers from the message.
 
         Returns:
@@ -969,7 +987,7 @@ class PatattMessage:
             return self.sigs
 
         ldshn = DEVSIG_HDR.lower()
-        self.sigs = list()
+        self.sigs = []
         from_id = None
 
         for header in self.headers:
@@ -993,7 +1011,7 @@ class PatattMessage:
         return self.sigs
 
     @staticmethod
-    def _get_git_mailinfo(payload: bytes) -> Tuple[bytes, bytes, bytes]:
+    def _get_git_mailinfo(payload: bytes) -> tuple[bytes, bytes, bytes]:
         with tempfile.TemporaryDirectory(suffix='.git-mailinfo') as td:
             mf = os.path.join(td, 'm')
             pf = os.path.join(td, 'p')
@@ -1004,7 +1022,7 @@ class PatattMessage:
             if ecode > 0:
                 logger.debug('FAILED  : Failed running git-mailinfo:')
                 logger.debug(err.decode())
-                raise RuntimeError('Failed to run git-mailinfo: %s' % err.decode())
+                raise RuntimeError(f'Failed to run git-mailinfo: {err.decode()}')
 
             with open(mf, 'rb') as mfh:
                 m = mfh.read()
@@ -1029,10 +1047,10 @@ def get_data_dir() -> Path:
 
 
 def _run_command(
-    cmdargs: List[str],
-    stdin: Optional[bytes] = None,
-    env: Optional[Dict[str, str]] = None,
-) -> Tuple[int, bytes, bytes]:
+    cmdargs: list[str],
+    stdin: bytes | None = None,
+    env: dict[str, str] | None = None,
+) -> tuple[int, bytes, bytes]:
     logger.debug('Running %s', ' '.join(cmdargs))
     # Redirect stdout/stderr to real temporary files instead of capture_output
     # pipes. gpg auto-starts daemon children (gpg-agent, scdaemon) that inherit
@@ -1043,7 +1061,13 @@ def _run_command(
     # uses the controlling terminal rather than stdout.
     with tempfile.TemporaryFile() as outf, tempfile.TemporaryFile() as errf:
         cp = subprocess.run(
-            cmdargs, input=stdin, env=env, stdout=outf, stderr=errf, text=False
+            cmdargs,
+            input=stdin,
+            env=env,
+            stdout=outf,
+            stderr=errf,
+            text=False,
+            check=False,
         )
         outf.seek(0)
         errf.seek(0)
@@ -1054,11 +1078,11 @@ def _run_command(
 
 
 def git_run_command(
-    gitdir: Optional[str],
-    args: List[str],
-    stdin: Optional[bytes] = None,
-    env: Optional[Dict[str, str]] = None,
-) -> Tuple[int, bytes, bytes]:
+    gitdir: str | None,
+    args: list[str],
+    stdin: bytes | None = None,
+    env: dict[str, str] | None = None,
+) -> tuple[int, bytes, bytes]:
     if gitdir:
         args = ['git', '--git-dir', gitdir, '--no-pager'] + args
     else:
@@ -1068,17 +1092,17 @@ def git_run_command(
 
 def get_config_from_git(
     regexp: str,
-    section: Optional[str] = None,
-    defaults: Optional[Dict[str, Union[str, List[str]]]] = None,
-    multivals: Optional[List[str]] = None,
+    section: str | None = None,
+    defaults: dict[str, str | list[str]] | None = None,
+    multivals: list[str] | None = None,
 ) -> GitConfigType:
     if multivals is None:
-        multivals = list()
+        multivals = []
 
     args = ['config', '-z', '--get-regexp', regexp]
     _, bout, _ = git_run_command(None, args)
     if defaults is None:
-        defaults = dict()
+        defaults = {}
 
     if not len(bout):
         return defaults
@@ -1111,11 +1135,11 @@ def get_config_from_git(
             if cfgkey in multivals:
                 curval = gitconfig.get(cfgkey)
                 if isinstance(curval, list):
-                    newval = list(curval)
+                    newval: list[str] = list(curval)
                 elif isinstance(curval, str):
                     newval = [curval]
                 else:
-                    newval = list()
+                    newval = []
                 newval.append(value)
                 gitconfig[cfgkey] = newval
             else:
@@ -1127,8 +1151,8 @@ def get_config_from_git(
 
 
 def gpg_run_command(
-    cmdargs: List[str], stdin: Optional[bytes] = None
-) -> Tuple[int, bytes, bytes]:
+    cmdargs: list[str], stdin: bytes | None = None
+) -> tuple[int, bytes, bytes]:
     gpgbin, _ = set_bin_paths(None)
     cmdargs = [
         gpgbin,
@@ -1140,14 +1164,14 @@ def gpg_run_command(
 
 
 def sshk_run_command(
-    cmdargs: List[str], stdin: Optional[bytes] = None
-) -> Tuple[int, bytes, bytes]:
+    cmdargs: list[str], stdin: bytes | None = None
+) -> tuple[int, bytes, bytes]:
     _, sshkbin = set_bin_paths(None)
     cmdargs = [sshkbin] + cmdargs
     return _run_command(cmdargs, stdin)
 
 
-def get_git_toplevel(gitdir: Optional[str] = None) -> str:
+def get_git_toplevel(gitdir: str | None = None) -> str:
     cmdargs = ['git']
     if gitdir:
         cmdargs += ['--git-dir', gitdir]
@@ -1219,7 +1243,7 @@ def make_byhash_path(keytype: str, identity: str, selector: str) -> Path:
 
 def get_public_key(
     source: str, keytype: str, identity: str, selector: str
-) -> Tuple[bytes, str]:
+) -> tuple[bytes, str]:
     """Look up a public key from a keyring source.
 
     Searches for the key at the standard path first, then falls back to
@@ -1248,7 +1272,7 @@ def get_public_key(
         parts = source.split(':', 4)
         if len(parts) < 4:
             raise ConfigurationError(
-                'Invalid ref, must have at least 3 colons: %s' % source
+                f'Invalid ref, must have at least 3 colons: {source}'
             )
         gitrepo = parts[1]
         gitref = parts[2]
@@ -1277,7 +1301,7 @@ def get_public_key(
             if ecode == 0:
                 gitref = out.decode().strip()
         if not gitref:
-            raise KeyError('Could not figure out current ref in %s' % gittop)
+            raise KeyError(f'Could not figure out current ref in {gittop}')
 
         keysrc = f'{gitref}:{subpath}'
         cmdargs = ['show', keysrc]
@@ -1294,9 +1318,9 @@ def get_public_key(
                 ecode, out, _ = git_run_command(gittop, cmdargs)
                 if ecode == 0:
                     logger.debug('KEYSRC  : %s (symlinked)', keysrc)
-                    return out, 'ref:%s:%s' % (gittop, keysrc)
+                    return out, f'ref:{gittop}:{keysrc}'
             logger.debug('KEYSRC  : %s', keysrc)
-            return out, 'ref:%s:%s' % (gittop, keysrc)
+            return out, f'ref:{gittop}:{keysrc}'
 
         # Does it exist on disk but hasn't been committed yet?
         fullpath = Path(gitrepo) / subpath
@@ -1313,7 +1337,7 @@ def get_public_key(
         ecode, out, _ = git_run_command(gittop, cmdargs)
         if ecode == 0:
             logger.debug('KEYSRC  : %s (by-hash)', keysrc)
-            return out, 'ref:%s:%s' % (gittop, keysrc)
+            return out, f'ref:{gittop}:{keysrc}'
 
         # Check disk for by-hash path
         fullpath = Path(gitrepo) / byhash_subpath
@@ -1322,7 +1346,7 @@ def get_public_key(
                 logger.debug('KEYSRC  : %s (by-hash)', fullpath)
                 return fh.read(), str(fullpath)
 
-        raise KeyError('Could not find %s in %s:%s' % (subpath, gittop, gitref))
+        raise KeyError(f'Could not find {subpath} in {gittop}:{gitref}')
 
     # It's a disk path, then
     # Expand ~ and env vars
@@ -1343,20 +1367,20 @@ def get_public_key(
             logger.debug('Loaded key from %s (by-hash)', byhash_fullpath)
             return fh.read(), str(byhash_fullpath)
 
-    raise KeyError('Could not find %s' % fullpath)
+    raise KeyError(f'Could not find {fullpath}')
 
 
-def _load_messages(cmdargs: argparse.Namespace) -> Dict[str, bytes]:
+def _load_messages(cmdargs: argparse.Namespace) -> dict[str, bytes]:
     import sys
 
+    messages: dict[str, bytes] = {}
     if len(cmdargs.msgfile):
         # Load all message from the files passed to make sure they all parse correctly
-        messages = dict()
         for msgfile in cmdargs.msgfile:
             with open(msgfile, 'rb') as fh:
                 messages[msgfile] = fh.read()
     elif not sys.stdin.isatty():
-        messages = {'-': sys.stdin.buffer.read()}
+        messages['-'] = sys.stdin.buffer.read()
     else:
         logger.critical(
             'E: Pipe a message to sign or pass filenames with individual messages'
@@ -1369,9 +1393,9 @@ def _load_messages(cmdargs: argparse.Namespace) -> Dict[str, bytes]:
 def sign_message(
     msgdata: bytes,
     algo: str,
-    keyinfo: Union[str, bytes],
-    identity: Optional[str],
-    selector: Optional[str],
+    keyinfo: str | bytes,
+    identity: str | None,
+    selector: str | None,
 ) -> bytes:
     """Sign an RFC2822 message and return the signed message bytes.
 
@@ -1390,7 +1414,7 @@ def sign_message(
     return pm.as_bytes()
 
 
-def set_bin_paths(config: Optional[GitConfigType]) -> Tuple[str, str]:
+def set_bin_paths(config: GitConfigType | None) -> tuple[str, str]:
     global GPGBIN, SSHKBIN
     if GPGBIN is None:
         if config and config.get('gpg-bin'):
@@ -1417,8 +1441,7 @@ def set_bin_paths(config: Optional[GitConfigType]) -> Tuple[str, str]:
     return GPGBIN, SSHKBIN
 
 
-def get_algo_keydata(config: GitConfigType) -> Tuple[str, str]:
-    global KEYCACHE
+def get_algo_keydata(config: GitConfigType) -> tuple[str, str]:
     # Do we have the signingkey defined?
     usercfg = get_config_from_git(r'user\..*')
     if not config.get('identity') and usercfg.get('email'):
@@ -1428,11 +1451,15 @@ def get_algo_keydata(config: GitConfigType) -> Tuple[str, str]:
     identity = config.get('identity')
     if not isinstance(identity, str):
         raise ConfigurationError(
-            'Identity must be a string, got %s' % type(identity).__name__
+            f'Identity must be a string, got {type(identity).__name__}'
         )
 
     if identity in KEYCACHE:
-        algo, keydata = KEYCACHE[identity]
+        cached = KEYCACHE[identity]
+        assert isinstance(cached, tuple)
+        algo, keydata = cached
+        assert isinstance(algo, str)
+        assert isinstance(keydata, str)
         return algo, keydata
 
     if not config.get('signingkey'):
@@ -1446,7 +1473,7 @@ def get_algo_keydata(config: GitConfigType) -> Tuple[str, str]:
                 user_signingkey,
             )
             logger.info('N: Override by setting patatt.signingkey')
-            config['signingkey'] = '%s:%s' % (key_algo, user_signingkey)
+            config['signingkey'] = f'{key_algo}:{user_signingkey}'
         else:
             logger.critical('E: patatt.signingkey is not set')
             logger.critical('E: Perhaps you need to run genkey first?')
@@ -1455,7 +1482,7 @@ def get_algo_keydata(config: GitConfigType) -> Tuple[str, str]:
     sk = config.get('signingkey')
     if not isinstance(sk, str):
         raise ConfigurationError(
-            'Signing key must be a string, got %s' % type(sk).__name__
+            f'Signing key must be a string, got {type(sk).__name__}'
         )
     if sk.startswith('ed25519:'):
         algo = 'ed25519'
@@ -1477,7 +1504,7 @@ def get_algo_keydata(config: GitConfigType) -> Tuple[str, str]:
                         keysrc = str(skey)
 
         if not keysrc:
-            raise ConfigurationError('Could not find the key matching %s' % identifier)
+            raise ConfigurationError(f'Could not find the key matching {identifier}')
 
         logger.info('N: Using ed25519 key: %s', keysrc)
         with open(keysrc, 'r') as fh:
@@ -1491,13 +1518,13 @@ def get_algo_keydata(config: GitConfigType) -> Tuple[str, str]:
         keydata = sk[8:]
     else:
         logger.critical('E: Unknown key type: %s', sk)
-        raise ConfigurationError('Unknown key type: %s' % sk)
+        raise ConfigurationError(f'Unknown key type: {sk}')
 
     KEYCACHE[identity] = (algo, keydata)
     return algo, keydata
 
 
-def rfc2822_sign(message: bytes, config: Optional[GitConfigType] = None) -> bytes:
+def rfc2822_sign(message: bytes, config: GitConfigType | None = None) -> bytes:
     if config is None:
         config = get_main_config()
     algo, keydata = get_algo_keydata(config)
@@ -1512,7 +1539,7 @@ def rfc2822_sign(message: bytes, config: Optional[GitConfigType] = None) -> byte
     return pm.as_bytes()
 
 
-def get_main_config(section: Optional[str] = None) -> GitConfigType:
+def get_main_config(section: str | None = None) -> GitConfigType:
     """Load patatt configuration from git config.
 
     Args:
@@ -1523,7 +1550,6 @@ def get_main_config(section: Optional[str] = None) -> GitConfigType:
         Configuration dictionary with keyring sources and settings.
         Results are cached per section.
     """
-    global CONFIGCACHE
     if section:
         csection = section
     else:
@@ -1535,7 +1561,7 @@ def get_main_config(section: Optional[str] = None) -> GitConfigType:
     )
     # Append some extra keyring locations
     if 'keyringsrc' not in config or not isinstance(config['keyringsrc'], list):
-        config['keyringsrc'] = list()
+        config['keyringsrc'] = []
     assert isinstance(config['keyringsrc'], list)  # Just to make lint checkers shut up
     config['keyringsrc'] += [
         'ref:::.keys',
@@ -1551,7 +1577,7 @@ def get_main_config(section: Optional[str] = None) -> GitConfigType:
 def cmd_sign(cmdargs: argparse.Namespace, config: GitConfigType) -> None:
     try:
         messages = _load_messages(cmdargs)
-    except IOError as ex:
+    except OSError as ex:
         logger.critical('E: %s', ex)
         sys.exit(1)
 
@@ -1582,10 +1608,8 @@ def cmd_sign(cmdargs: argparse.Namespace, config: GitConfigType) -> None:
 
 
 def validate_message(
-    msgdata: bytes, sources: List[str], trim_body: bool = False
-) -> List[
-    Tuple[int, Optional[str], Optional[str], Optional[str], Optional[str], List[str]]
-]:
+    msgdata: bytes, sources: list[str], trim_body: bool = False
+) -> list[AttestationResult]:
     """Validate all signatures in an RFC2822 message.
 
     Args:
@@ -1599,11 +1623,7 @@ def validate_message(
 
         Result codes: RES_VALID, RES_BADSIG, RES_NOKEY, RES_NOSIG, RES_ERROR
     """
-    attestations: List[
-        Tuple[
-            int, Optional[str], Optional[str], Optional[str], Optional[str], List[str]
-        ]
-    ] = list()
+    attestations: list[AttestationResult] = []
     pm = PatattMessage(msgdata)
     if not pm.signed:
         logger.debug('message is not signed')
@@ -1614,7 +1634,7 @@ def validate_message(
 
     # Find all identities for which we have public keys
     for ds in pm.get_sigs():
-        errors = list()
+        errors: list[str] = []
         a = ds.get_field_as_str('a')
         i = ds.get_field_as_str('i')
         s = ds.get_field_as_str('s')
@@ -1637,7 +1657,7 @@ def validate_message(
         elif a.startswith('openssh'):
             algo = 'openssh'
         else:
-            errors.append('%s/%s Unknown algorigthm: %s' % (i, s, a))
+            errors.append(f'{i}/{s} Unknown algorigthm: {a}')
             attestations.append((RES_ERROR, i, t, None, a, errors))
             continue
 
@@ -1650,7 +1670,7 @@ def validate_message(
                 pass
 
         if not pkey and algo in ('ed25519', 'openssh'):
-            errors.append('%s/%s no matching %s key found' % (i, s, algo))
+            errors.append(f'{i}/{s} no matching {algo} key found')
             attestations.append((RES_NOKEY, i, t, None, algo, errors))
             continue
 
@@ -1658,17 +1678,17 @@ def validate_message(
             signkey, signtime = pm.validate(i, pkey, trim_body=trim_body)
             if keysrc is None:
                 # Default keyring used
-                keysrc = '(default keyring)/%s' % signkey
+                keysrc = f'(default keyring)/{signkey}'
             attestations.append((RES_VALID, i, signtime, keysrc, algo, errors))
         except NoKeyError:
             # Not in default keyring
-            errors.append('%s/%s no matching openpgp key found' % (i, s))
+            errors.append(f'{i}/{s} no matching openpgp key found')
             attestations.append((RES_NOKEY, i, t, None, algo, errors))
         except ValidationError:
             if keysrc is None:
                 errors.append('failed to validate using default keyring')
             else:
-                errors.append('failed to validate using %s' % keysrc)
+                errors.append(f'failed to validate using {keysrc}')
             attestations.append((RES_BADSIG, i, t, keysrc, algo, errors))
 
     return attestations
@@ -1681,26 +1701,28 @@ def cmd_validate(cmdargs: argparse.Namespace, config: GitConfigType) -> None:
         # Try to open as an mbox file
         try:
             mbox = mailbox.mbox(cmdargs.msgfile[0])
-        except IOError as ex:
+        except OSError as ex:
             logger.critical('E: %s', ex)
             sys.exit(1)
 
-        messages = dict()
+        messages: dict[str, bytes] = {}
         for msg in mbox:
-            subject = msg.get('Subject', 'No subject')
+            subject = str(msg.get('Subject', 'No subject'))
             messages[subject] = msg.as_bytes()
     else:
         try:
             messages = _load_messages(cmdargs)
-        except IOError as ex:
+        except OSError as ex:
             logger.critical('E: %s', ex)
             sys.exit(1)
 
     ddir = get_data_dir()
     pdir = ddir / 'public'
-    sources = config.get('keyringsrc', list())
-    if not isinstance(sources, list):
-        sources = [sources]
+    raw_sources = config.get('keyringsrc', [])
+    if isinstance(raw_sources, list):
+        sources = raw_sources
+    else:
+        sources = [raw_sources]
 
     if str(pdir) not in sources:
         sources.append(str(pdir))
@@ -1715,8 +1737,7 @@ def cmd_validate(cmdargs: argparse.Namespace, config: GitConfigType) -> None:
         try:
             attestations = validate_message(msgdata, sources, trim_body=trim_body)
             for result, identity, _signtime, keysrc, _algo, errors in attestations:
-                if result > highest_err:
-                    highest_err = result
+                highest_err = max(highest_err, result)
 
                 if result == RES_VALID:
                     logger.critical('  PASS | %s, %s', identity, fn)
diff --git a/tests/conftest.py b/tests/conftest.py
index a2d2124..2d5c0b6 100644
--- a/tests/conftest.py
+++ b/tests/conftest.py
@@ -1,7 +1,9 @@
+from __future__ import annotations
+
 import base64
 import tempfile
 from pathlib import Path
-from typing import Dict, Generator
+from typing import Generator
 
 import pytest
 
@@ -47,7 +49,7 @@ def patatt_message(sample_email_bytes: bytes) -> PatattMessage:
 
 
 @pytest.fixture
-def sample_ed25519_key_pair() -> Dict[str, bytes]:
+def sample_ed25519_key_pair() -> dict[str, bytes]:
     """Generate a sample ed25519 key pair for testing."""
     try:
         from nacl.signing import SigningKey
diff --git a/tests/test_validation.py b/tests/test_validation.py
index c399f14..13fbae8 100644
--- a/tests/test_validation.py
+++ b/tests/test_validation.py
@@ -3,7 +3,7 @@ from pathlib import Path
 
 import pytest
 
-from patatt import RES_VALID, validate_message
+from patatt import RES_VALID, PatattMessage, validate_message
 
 
 @pytest.mark.parametrize(
@@ -33,8 +33,25 @@ def test_validate(sample_file: str) -> None:
     valid_signatures = [r for r in results if r[0] == RES_VALID]
     assert valid_signatures, 'Should find at least one valid signature'
 
+    # Reusing cached key material must preserve validation results.
+    assert validate_message(signed_data, [sources_path]) == results
+
     # Print validation details for debugging
     print(f'Found {len(valid_signatures)} valid signatures:')
     for result in valid_signatures:
         _status, _algo, keytype, identity, selector, _errors = result
         print(f'  - {keytype} signature by {identity} ({selector})')
+
+
+@pytest.mark.parametrize('sample_file', ['ed25519-signed.txt', 'openssh-signed.txt'])
+def test_validate_requires_public_key(sample_file: str) -> None:
+    sample_path = Path(__file__).parent.parent / 'samples' / sample_file
+    message = PatattMessage(sample_path.read_bytes())
+    signature = message.get_sigs()[0]
+    identity = signature.get_field_as_str('i')
+    assert identity is not None, 'Sample signature must identify its signer'
+
+    with pytest.raises(
+        RuntimeError, match='keyinfo must be a string or bytes, not NoneType'
+    ):
+        message.validate(identity, None)
diff --git a/tests/unit/test_devsig_header.py b/tests/unit/test_devsig_header.py
index 7b6e461..7f09b81 100644
--- a/tests/unit/test_devsig_header.py
+++ b/tests/unit/test_devsig_header.py
@@ -1,3 +1,5 @@
+from __future__ import annotations
+
 import base64
 import hashlib
 from io import BytesIO
@@ -76,7 +78,7 @@ class TestDevsigHeader:
         header = DevsigHeader()
 
         # Parse the sample email to get headers
-        headers = []
+        headers: list[bytes] = []
         with BytesIO(sample_email_bytes) as fh:
             while True:
                 line = fh.readline()
@@ -109,8 +111,11 @@ class TestDevsigHeader:
         with pytest.raises(RuntimeError, match='Must use set_headers first'):
             header.sanity_check()
 
-    # @pytest.mark.skipif(True, reason="Requires actual ed25519 keys")
-    # def test_sign_ed25519(self, sample_ed25519_key_pair: Dict[str, bytes]) -> None:
-    #     """Test signing with ed25519."""
-    #     # This test would require actual keys and more setup
-    #     pass
+    def test_sign_ed25519(self, sample_ed25519_key_pair: dict[str, bytes]) -> None:
+        """Sign and verify with both freshly loaded and cached key data."""
+        for payload in (b'first message', b'second message'):
+            signed, public_key = DevsigHeader._sign_ed25519(
+                payload, sample_ed25519_key_pair['private']
+            )
+            assert public_key == sample_ed25519_key_pair['public']
+            assert DevsigHeader._validate_ed25519(signed, public_key) == payload
diff --git a/tests/unit/test_get_config_from_git.py b/tests/unit/test_get_config_from_git.py
index 91ce00e..1df239a 100644
--- a/tests/unit/test_get_config_from_git.py
+++ b/tests/unit/test_get_config_from_git.py
@@ -1,3 +1,5 @@
+from __future__ import annotations
+
 from unittest.mock import MagicMock, patch
 
 from patatt import get_config_from_git
diff --git a/tests/unit/test_patatt_message.py b/tests/unit/test_patatt_message.py
index 17d4a30..0511a5d 100644
--- a/tests/unit/test_patatt_message.py
+++ b/tests/unit/test_patatt_message.py
@@ -1,4 +1,4 @@
-from typing import Tuple
+from __future__ import annotations
 
 import pytest
 
@@ -49,7 +49,7 @@ This is a test body.
         """Test git canonicalization of message."""
 
         # Mock _get_git_mailinfo to avoid actual git command execution
-        def mock_get_git_mailinfo(payload: bytes) -> Tuple[bytes, bytes, bytes]:
+        def mock_get_git_mailinfo(payload: bytes) -> tuple[bytes, bytes, bytes]:
             # Return mock metadata, patch, and info
             metadata = (
                 b'Author: Test User\nEmail: test@example.com\nSubject: Test email\n'
diff --git a/tests/unit/test_run_command.py b/tests/unit/test_run_command.py
index f7eb775..13f88c9 100644
--- a/tests/unit/test_run_command.py
+++ b/tests/unit/test_run_command.py
@@ -1,6 +1,7 @@
+from __future__ import annotations
+
 import threading
 import time
-from typing import List, Tuple
 
 from patatt import _run_command
 
@@ -26,7 +27,7 @@ def test_run_command_does_not_wait_for_lingering_child() -> None:
     Runs the call in a daemon thread so a regression surfaces as a prompt
     assertion failure at RETURN_DEADLINE rather than hanging the test suite.
     """
-    holder: List[Tuple[int, bytes, bytes]] = []
+    holder: list[tuple[int, bytes, bytes]] = []
 
     def target() -> None:
         holder.append(_run_command(LINGER_CMD))
diff --git a/uv.lock b/uv.lock
index 53ca93b..a8a7e98 100644
--- a/uv.lock
+++ b/uv.lock
@@ -1269,27 +1269,27 @@ wheels = [
 
 [[package]]
 name = "ruff"
-version = "0.15.22"
+version = "0.16.8"
 source = { registry = "https://pypi.org/simple" }
-sdist = { url = "https://files.pythonhosted.org/packages/3a/06/ae069393fc66e8ff33036d4b368003833bf6e88ccf182e17e7a2f1c754fd/ruff-0.15.22.tar.gz", hash = "sha256:3f15175b1fb580126f58285a5dae6b2ea89000136d980c64499211f116b54809", size = 4785063, upload-time = "2026-07-16T15:14:13.244Z" }
+sdist = { url = "https://files.pythonhosted.org/packages/ba/78/449cb84790bd5cc3823b2652ee405a4558856e5c4195aee3a16bf7b3eb5d/ruff-0.16.8.tar.gz", hash = "sha256:9247bf92b5f04d825c8639a4fe423ec2e4222acd9222e58412b0dab7e442798b", size = 4938814, upload-time = "2026-09-16T15:54:46.688Z" }
 wheels = [
-    { url = "https://files.pythonhosted.org/packages/23/18/ee54b7ae1e121be7a28ea6da4b67564ebb0530e183a54415ab7e3bcd2c4e/ruff-0.15.22-py3-none-linux_armv6l.whl", hash = "sha256:44423e73493737f5e7c5b41d475483898ff37afcdae38bc3da5085e29af1c2d8", size = 10781258, upload-time = "2026-07-16T15:13:19.452Z" },
-    { url = "https://files.pythonhosted.org/packages/2f/d2/2520cb14761ddbeaf57642a76942fc36adcbdbe53b4532241995f6fc485c/ruff-0.15.22-py3-none-macosx_10_12_x86_64.whl", hash = "sha256:b82c6482946e9eda7ff2e091d25b8bad3f718684e1916d41bd56873cee05b697", size = 10999477, upload-time = "2026-07-16T15:13:23.318Z" },
-    { url = "https://files.pythonhosted.org/packages/c9/10/74e53572aa758dfaa678c2a2646b5c5515d884b7ca56be4d2ce03ca4b560/ruff-0.15.22-py3-none-macosx_11_0_arm64.whl", hash = "sha256:11c1c715af53a09f714e011106bffc419751ec8232fcb5da42173284ea3fec6f", size = 10466716, upload-time = "2026-07-16T15:13:26.162Z" },
-    { url = "https://files.pythonhosted.org/packages/1e/cc/44eaaf0844e028182f2d0a8f2190d0f359159aed0a9e5ab861d892f1ae2a/ruff-0.15.22-py3-none-manylinux_2_17_aarch64.manylinux2014_aarch64.whl", hash = "sha256:742a29cf29bddb7c8327895d6a10e0e6c5b38a96dd407af9b5d0857f809c0576", size = 10892644, upload-time = "2026-07-16T15:13:29.229Z" },
-    { url = "https://files.pythonhosted.org/packages/9f/21/8edf559014d2b0f82beea19cfb713993ad802ccda16868769979c6090a84/ruff-0.15.22-py3-none-manylinux_2_17_armv7l.manylinux2014_armv7l.whl", hash = "sha256:72af58b951b0ae395935ae79763dc349bc0eb706319d28f7a33ad2cfb3cfc178", size = 10576719, upload-time = "2026-07-16T15:13:32.35Z" },
-    { url = "https://files.pythonhosted.org/packages/bf/1e/3a13abd392a3b50b62e5938a831f9ab6e588358cacad5c18545b716d2182/ruff-0.15.22-py3-none-manylinux_2_17_i686.manylinux2014_i686.whl", hash = "sha256:62d425005c1835eb24e2ee4161cb90e8db263415f4a71c8c72c33abaa6c0c224", size = 11376494, upload-time = "2026-07-16T15:13:35.958Z" },
-    { url = "https://files.pythonhosted.org/packages/bf/3e/422d3d95bcf04dd78e1aeac22184d4f9a8fb2c01865d39d44618484a0317/ruff-0.15.22-py3-none-manylinux_2_17_ppc64le.manylinux2014_ppc64le.whl", hash = "sha256:e8b9b3f8779a4f08c969defc3c8c35abffaa757e601ed5ae66d6d1db6519969a", size = 12208370, upload-time = "2026-07-16T15:13:39.185Z" },
-    { url = "https://files.pythonhosted.org/packages/1e/91/5d065a0e0a02bf4813f5119ad278462eed081d2b832eb7c021ade0ec9e65/ruff-0.15.22-py3-none-manylinux_2_17_s390x.manylinux2014_s390x.whl", hash = "sha256:1e0dd1b2e4d3d585f897a0d137cbf4eaf6223bef4e8ce34d6bb12556c5f9249e", size = 11581098, upload-time = "2026-07-16T15:13:42.132Z" },
-    { url = "https://files.pythonhosted.org/packages/f6/f9/a0d4871d12fae702eb1f41b686caf05f1f8b124dc6db6f784f53d74918fa/ruff-0.15.22-py3-none-manylinux_2_17_x86_64.manylinux2014_x86_64.whl", hash = "sha256:365523eb91d9224e1bcb03b022fbf0facb8f9e23792a2c53d9d4b3924bdbdebb", size = 11399422, upload-time = "2026-07-16T15:13:45.2Z" },
-    { url = "https://files.pythonhosted.org/packages/18/80/c843a5176cddbceb0b7e8dd41cf9993490796c1c469348d384f5a5c13c56/ruff-0.15.22-py3-none-manylinux_2_31_riscv64.whl", hash = "sha256:fabfd168afdf29fee5be98b831efa9683c94d7c5a3b58b9ce5a2e38444589a74", size = 11381683, upload-time = "2026-07-16T15:13:48.46Z" },
-    { url = "https://files.pythonhosted.org/packages/d4/00/8485de0ae92239438a36cfc51350db9b9e85c9ebdfaea91b18e422706662/ruff-0.15.22-py3-none-musllinux_1_2_aarch64.whl", hash = "sha256:225dbf095a87f1d9f90f5fd7924d2613ee452a75a4308c63a8f50f761787aa7c", size = 10850295, upload-time = "2026-07-16T15:13:51.655Z" },
-    { url = "https://files.pythonhosted.org/packages/fa/91/24977ec2ec72eaf15e4394ace2959fdff2dd1e14f03e005e838023407169/ruff-0.15.22-py3-none-musllinux_1_2_armv7l.whl", hash = "sha256:1877d63b9d24ed278744f1523fd11b85540566d54641f97c566d7d9dc5ca5296", size = 10579640, upload-time = "2026-07-16T15:13:54.79Z" },
-    { url = "https://files.pythonhosted.org/packages/9c/47/9b51216951974df1f263ac19da550d34252e0ed7218c25f10c5ef9ed7517/ruff-0.15.22-py3-none-musllinux_1_2_i686.whl", hash = "sha256:a1606c510bd7215680d32efab38965f7cdec3ef69f5170a3f4791404ffdd5262", size = 11105077, upload-time = "2026-07-16T15:13:57.915Z" },
-    { url = "https://files.pythonhosted.org/packages/c2/47/20e9d4a3b8016778acea5fc32bb50d35d207500a17ddb529ffa6996feef8/ruff-0.15.22-py3-none-musllinux_1_2_x86_64.whl", hash = "sha256:630479b18625f5ffc373f77603a22a9f8ac0acd7ff0501178b5db28ec71e9c64", size = 11490980, upload-time = "2026-07-16T15:14:01.032Z" },
-    { url = "https://files.pythonhosted.org/packages/4d/76/3f72d8fc38c1cb77b38c56a70da9d0c17700cc1cc50f9649c9d3c8f5ba71/ruff-0.15.22-py3-none-win32.whl", hash = "sha256:e5ba0e4a13fd14abbed2a77b517a3911290c6c6c59ef67784328d1668fab76cf", size = 10789165, upload-time = "2026-07-16T15:14:04.16Z" },
-    { url = "https://files.pythonhosted.org/packages/cb/46/4965251734c2b6fcdca1b1b187d20bcac3af0ee5b083b89c910bb961ce3a/ruff-0.15.22-py3-none-win_amd64.whl", hash = "sha256:9be63ba1eb936acd2d1342fb8337c356353706fce233b2a15a09a97037e6acde", size = 11938297, upload-time = "2026-07-16T15:14:07.316Z" },
-    { url = "https://files.pythonhosted.org/packages/57/c9/e69b1ff4c8b69093ef08b8919ab767af0569666865b39c30a8795d88d3c6/ruff-0.15.22-py3-none-win_arm64.whl", hash = "sha256:e1168075b72158510839f250027659cdd78476f40507dd517892304c41318661", size = 11298172, upload-time = "2026-07-16T15:14:10.51Z" },
+    { url = "https://files.pythonhosted.org/packages/ac/25/6071aabc530e9be7e2c195e8fe3f7aea2735405b6cf447212832d7811831/ruff-0.16.8-py3-none-linux_armv6l.whl", hash = "sha256:6ffbd6d87383c1edf5f6fa890f10200950240d7c1a16052a19a09d3a2307dd38", size = 10048966, upload-time = "2026-09-16T15:53:57.605Z" },
+    { url = "https://files.pythonhosted.org/packages/54/98/07f90ecbc74dd5fb5764f11f2bc774d6a7cffef92d2ff5f5b4e9e23c754e/ruff-0.16.8-py3-none-macosx_10_12_x86_64.whl", hash = "sha256:42ed6b878ed61e3acca92f2730a17acff39286944ea82398544696366a6f925e", size = 10165498, upload-time = "2026-09-16T15:54:01.14Z" },
+    { url = "https://files.pythonhosted.org/packages/fe/1f/e6a712e3b47cad4a40600134105ed193cb773f618a42eb7ba323cb812cc0/ruff-0.16.8-py3-none-macosx_11_0_arm64.whl", hash = "sha256:7ea781c7f2afba8c6a505ea0fb3f994020249e0c450635f5381286fea6b46170", size = 9830004, upload-time = "2026-09-16T15:54:03.998Z" },
+    { url = "https://files.pythonhosted.org/packages/23/f2/311a08776d75d81c7676e20b6b020ae63cbe881fcdc7a8dd64e6e18bdd93/ruff-0.16.8-py3-none-manylinux_2_17_aarch64.manylinux2014_aarch64.whl", hash = "sha256:8efeae3bbe414a5efefda11a792dfb51ef90ac48d50c4830de2f644caf3e8659", size = 9986558, upload-time = "2026-09-16T15:54:06.804Z" },
+    { url = "https://files.pythonhosted.org/packages/f3/ed/37b6cb3d3ba8c73e68ae3eb1d502383beb5aa05a582bb7bb3a922f929f54/ruff-0.16.8-py3-none-manylinux_2_17_armv7l.manylinux2014_armv7l.whl", hash = "sha256:3a79b795469fef7fc6e908b218eed2eb17332afd85031db6480dc864560e69b2", size = 9877332, upload-time = "2026-09-16T15:54:09.552Z" },
+    { url = "https://files.pythonhosted.org/packages/22/cc/40873a8f36ad084cc540d55fcca7077264d5b13b24659e9180c176fb2b08/ruff-0.16.8-py3-none-manylinux_2_17_i686.manylinux2014_i686.whl", hash = "sha256:3fdc5563cdc50555e6fba39322850860e9267c1b3d12c26a74729d8604c3c812", size = 10507125, upload-time = "2026-09-16T15:54:12.152Z" },
+    { url = "https://files.pythonhosted.org/packages/c3/e4/fc91a642b78ccbab6b9477720f3644ae7a10a9bcce69a934679cd64f62bc/ruff-0.16.8-py3-none-manylinux_2_17_ppc64le.manylinux2014_ppc64le.whl", hash = "sha256:34508983c70665578dab88f5223d8e6228307e1135398ca8bfc8b7e9501e282b", size = 11336694, upload-time = "2026-09-16T15:54:15.489Z" },
+    { url = "https://files.pythonhosted.org/packages/c2/3d/bbd2a9a600a4e73dc3e7548a249c8d1671273464b55822c6fae50f602dff/ruff-0.16.8-py3-none-manylinux_2_17_s390x.manylinux2014_s390x.whl", hash = "sha256:644bb578569e0ffc575741232bd385dacdd6fbe123f1a729e7a225f54aa3957f", size = 10774448, upload-time = "2026-09-16T15:54:18.16Z" },
+    { url = "https://files.pythonhosted.org/packages/1a/41/d83af9879a7b6e8bf5fe16b1da0b134049d2f5d3afac12defb0897cb84bd/ruff-0.16.8-py3-none-manylinux_2_17_x86_64.manylinux2014_x86_64.whl", hash = "sha256:15e7d226246961db9235098333caa13063906d3851136b84c2900b82f5daa1df", size = 10323796, upload-time = "2026-09-16T15:54:20.743Z" },
+    { url = "https://files.pythonhosted.org/packages/f5/2c/cefd07bfe914b84943ea769ade8d607bd22750b965d3228eefd7cebd15d0/ruff-0.16.8-py3-none-manylinux_2_31_riscv64.whl", hash = "sha256:a2bf6bc3e9ebdd4449abc6f06cf64b98051a2c61cf94d2fe9596518c881f1a1e", size = 10514115, upload-time = "2026-09-16T15:54:23.497Z" },
+    { url = "https://files.pythonhosted.org/packages/f3/9d/76a2e26c79a23be6e6e3664c57bec9e9fc8de155cfb9e4b67ea91b64f9d7/ruff-0.16.8-py3-none-musllinux_1_2_aarch64.whl", hash = "sha256:6ca111ba0849539165e9e59d2b442542f3c1e8060ebbdea82494f1ffbccb1e1f", size = 10072582, upload-time = "2026-09-16T15:54:26.185Z" },
+    { url = "https://files.pythonhosted.org/packages/2e/d4/f42edddb39668af1a559ceafa3823aedd65633a48dc9768e775485faa2c1/ruff-0.16.8-py3-none-musllinux_1_2_armv7l.whl", hash = "sha256:359a1e5b495448ee1e91018064382ebc86f90e8aac2fed222c7d0e4e8df85fd2", size = 9879644, upload-time = "2026-09-16T15:54:29.278Z" },
+    { url = "https://files.pythonhosted.org/packages/f8/d4/913e3195d95e0378786c6656945c865f534a3560e29139da4882aff630d1/ruff-0.16.8-py3-none-musllinux_1_2_i686.whl", hash = "sha256:59e8f5681349474110b24d62e93cfda6593f5fa3473446ca3705200cac1a08b9", size = 10231569, upload-time = "2026-09-16T15:54:32.036Z" },
+    { url = "https://files.pythonhosted.org/packages/2b/c4/8aa6ea0bdcedbd1bf87397e2fc4ed8406448ea5842f8660bc6e5f163039d/ruff-0.16.8-py3-none-musllinux_1_2_x86_64.whl", hash = "sha256:efa3e7a16d1baaa79957888dfdf8be9ef2e44db81cb032af06d76632ab59e773", size = 10663666, upload-time = "2026-09-16T15:54:34.838Z" },
+    { url = "https://files.pythonhosted.org/packages/3d/02/7f10ef4700bc223c30a3fdd10631a29830c45524b810a3c7ed947af64591/ruff-0.16.8-py3-none-win32.whl", hash = "sha256:55793ba85c69921e89be061426d91a78652d6e50317c962240922747a4eb713f", size = 10093472, upload-time = "2026-09-16T15:54:37.47Z" },
+    { url = "https://files.pythonhosted.org/packages/1e/5d/a509c07d714b6da88f2c518b4637cf6f1d46b074be8f0f1e5fb9ff5126fe/ruff-0.16.8-py3-none-win_amd64.whl", hash = "sha256:a6b85621fd3c81e31fc5f5add09c9c078b430db3595ca632efafdec9e64ebfaa", size = 10586899, upload-time = "2026-09-16T15:54:40.488Z" },
+    { url = "https://files.pythonhosted.org/packages/fe/a0/50787329e4f20bf9dc9f6230015d46ec69c51a97ace5bc202dae4755365d/ruff-0.16.8-py3-none-win_arm64.whl", hash = "sha256:d075e820af612102ce217f07cc93e69f9490b10ec13ea85fa87bd03d996cef8a", size = 10386316, upload-time = "2026-09-16T15:54:43.332Z" },
 ]
 
 [[package]]
@@ -1389,27 +1389,27 @@ wheels = [
 
 [[package]]
 name = "ty"
-version = "0.0.69"
+version = "0.0.81"
 source = { registry = "https://pypi.org/simple" }
-sdist = { url = "https://files.pythonhosted.org/packages/8e/5b/7a618632dfe9373b7df572ecd7a08c8f799d772fbc317da82dd3aa363207/ty-0.0.69.tar.gz", hash = "sha256:b65106e9ff24fa76e25e1142fb09c85244e815c40450e3021d2bf652c231bb43", size = 6565094, upload-time = "2026-08-06T10:04:25.667Z" }
+sdist = { url = "https://files.pythonhosted.org/packages/61/b7/c9d736f48585f5a711ea47bb97a353d3771834f89481d747ea9687b74fa9/ty-0.0.81.tar.gz", hash = "sha256:ef721aa649bf41d665ba86e1ea726fd3feab6800e2c4887a062a704baf304ca8", size = 7225871, upload-time = "2026-09-15T02:05:29.536Z" }
 wheels = [
-    { url = "https://files.pythonhosted.org/packages/06/60/6534092f4d2c15e2491807edd609c2e50d527c1fed957acf40b9f110b64a/ty-0.0.69-py3-none-linux_armv6l.whl", hash = "sha256:98bfd383b273540829af673e7f98b9c1c4bcc8547d12a1a3806cd0bec7f0e087", size = 12364185, upload-time = "2026-08-06T10:03:47.137Z" },
-    { url = "https://files.pythonhosted.org/packages/34/2b/5c29689bd4f74c2e3394d983d85e4011b629f2ce3730c9442553b8554bf8/ty-0.0.69-py3-none-macosx_10_12_x86_64.whl", hash = "sha256:964621ddd05771660017c51b4e74078d861d9fc863c21ef2a500db1ab62c9ccf", size = 12042510, upload-time = "2026-08-06T10:03:49.481Z" },
-    { url = "https://files.pythonhosted.org/packages/09/46/fa085bde4d23516d7ef14b24736fc5dd7dc498f60f52b3d077e59ffdea20/ty-0.0.69-py3-none-macosx_11_0_arm64.whl", hash = "sha256:3ffea4048dd0da4c9c97393b4be0901098a9065b06fa81be2477cbde65d8a151", size = 11549397, upload-time = "2026-08-06T10:03:51.747Z" },
-    { url = "https://files.pythonhosted.org/packages/25/cc/97b9efb2061dcab6fef1e94a4ad99df0bb45bd2cc15d4f5794c787ee0552/ty-0.0.69-py3-none-manylinux_2_17_aarch64.manylinux2014_aarch64.whl", hash = "sha256:a8684d4a70aadd1eab0f41bdba835e3288ef49db8402a8e6ca81bab52ed5d610", size = 12115567, upload-time = "2026-08-06T10:03:53.79Z" },
-    { url = "https://files.pythonhosted.org/packages/e0/c1/a5e0404965093835f3e62544e661784ec0aa8ef0b006ed50af50b19c107e/ty-0.0.69-py3-none-manylinux_2_17_armv7l.manylinux2014_armv7l.whl", hash = "sha256:afaaba240ab4122e2069a796836d10be81b4ddb053ae268b3dff962a0b4ca5c7", size = 12149770, upload-time = "2026-08-06T10:03:55.993Z" },
-    { url = "https://files.pythonhosted.org/packages/e2/39/8cad6b205a4abe8a044ca0c84aea71e8ccda29b07a75a5f090e310605580/ty-0.0.69-py3-none-manylinux_2_17_i686.manylinux2014_i686.whl", hash = "sha256:11ea63ef07d4e33aeb1a775cf5f2c736b3ed22fa6f8b1b608591612c36795044", size = 12941278, upload-time = "2026-08-06T10:03:58.324Z" },
-    { url = "https://files.pythonhosted.org/packages/d6/8b/8766d96b732c2a060d70dc8ccafcc4d6a54109a2a95f1deb0705de88892b/ty-0.0.69-py3-none-manylinux_2_17_ppc64le.manylinux2014_ppc64le.whl", hash = "sha256:cb3730b1268e92a2907d7aea3afe8dd1b360ae65862f0557080cf479d481b424", size = 13426509, upload-time = "2026-08-06T10:04:00.621Z" },
-    { url = "https://files.pythonhosted.org/packages/02/1f/e991b2cde953ea5b94d6a9a4c45c87937bd916bc09235f764407bf471c0a/ty-0.0.69-py3-none-manylinux_2_17_s390x.manylinux2014_s390x.whl", hash = "sha256:a544ff57a752ef186ed40b5a2f44c17402af4cdefeb74a311ca02ebd57c4fca0", size = 13106582, upload-time = "2026-08-06T10:04:02.818Z" },
-    { url = "https://files.pythonhosted.org/packages/ea/bb/73538f1b99e3558fd9db87b98698426f0f60fc8666da0b1efd0e70e275eb/ty-0.0.69-py3-none-manylinux_2_17_x86_64.manylinux2014_x86_64.whl", hash = "sha256:87ed2cbca20caddfdf8e3e14d213ce91b67e75feed78900f4aaf3ef884954028", size = 12708931, upload-time = "2026-08-06T10:04:05.233Z" },
-    { url = "https://files.pythonhosted.org/packages/87/cd/484a5208d74c4ad1155933906295ccdce9aa81a257d8df2ab9e41bd60133/ty-0.0.69-py3-none-manylinux_2_31_riscv64.whl", hash = "sha256:2684efcbce5b6fe45045faf610b377b50781b6d2aa7e61ea23ecf5b3d2bce421", size = 12985322, upload-time = "2026-08-06T10:04:07.587Z" },
-    { url = "https://files.pythonhosted.org/packages/6e/81/b75003f0d4da9ab3bc8fd4f4802f836cb9921ff7e70f460604f7b769a0b5/ty-0.0.69-py3-none-musllinux_1_2_aarch64.whl", hash = "sha256:da9aeb26fdac1d2214937542b59e0d4d1ba94ec7a3f45444f33c846de1eb1d63", size = 12063910, upload-time = "2026-08-06T10:04:09.835Z" },
-    { url = "https://files.pythonhosted.org/packages/8a/76/088469f547ef63dceefc4a75826aedee5014f9371dc5171cde931896a82c/ty-0.0.69-py3-none-musllinux_1_2_armv7l.whl", hash = "sha256:00e7677cd14ede381f705f71104ea7b8ea0ce217a8634e19a89781953de0e9ad", size = 12166823, upload-time = "2026-08-06T10:04:12.114Z" },
-    { url = "https://files.pythonhosted.org/packages/0a/c9/ce88a0bec0d46d8ae180b99c6ec014866fecc4cba1727b5feec8877b2765/ty-0.0.69-py3-none-musllinux_1_2_i686.whl", hash = "sha256:d91965eb799649833d0d6042db09cd03d15289125245337cc46a2606effb7bda", size = 12483136, upload-time = "2026-08-06T10:04:14.33Z" },
-    { url = "https://files.pythonhosted.org/packages/63/9e/6fae0ff225a0012642cf72c077e20f8f448c0a80771bc3360e8178fe2f32/ty-0.0.69-py3-none-musllinux_1_2_x86_64.whl", hash = "sha256:1f03359cd8e5c412aa0c181118fa9b9061a4dddaedbb61bac0a424fb0814d402", size = 12799025, upload-time = "2026-08-06T10:04:16.445Z" },
-    { url = "https://files.pythonhosted.org/packages/e4/43/78a658d18b2a4ccf35b053392f2213bf12e3c63b2abea512d3b6751d1f4c/ty-0.0.69-py3-none-win32.whl", hash = "sha256:ec460e01586b1eb91894c4a8403bee3e045a47e7a4ada943cc27ce8e348e88cf", size = 11787774, upload-time = "2026-08-06T10:04:18.622Z" },
-    { url = "https://files.pythonhosted.org/packages/3a/5e/88db1f674403f2b81316a853a44a81ed220621fa96f8f7ae586fb6ca7513/ty-0.0.69-py3-none-win_amd64.whl", hash = "sha256:18976ca26a4e28fc3249477f79a695d5502e670803f2e080d89ac905baef3c6e", size = 12864038, upload-time = "2026-08-06T10:04:20.748Z" },
-    { url = "https://files.pythonhosted.org/packages/4d/7b/6fc6efd00c69103d70f2bdbe824343089cd70b17b3079170057d3e5a3ac0/ty-0.0.69-py3-none-win_arm64.whl", hash = "sha256:7d4ca3bb74d91cb9947ba3f3b4cb131ad6a2b3ecc76d34040c4ec6092d2e411d", size = 12196693, upload-time = "2026-08-06T10:04:22.902Z" },
+    { url = "https://files.pythonhosted.org/packages/6c/70/649a5ec8fd6cc9dfa731c905523b19e677ad36dd9dcc4fcadfed8235507f/ty-0.0.81-py3-none-linux_armv6l.whl", hash = "sha256:8e9e3dd6edb1462633ddba2bf337d1c05023a5a13c2f315e445565c7ad43d247", size = 13679646, upload-time = "2026-09-15T02:04:51.436Z" },
+    { url = "https://files.pythonhosted.org/packages/b5/d0/3769b760918c3dde1bbaeee87422cd442fc550baadb5c8621e479b363282/ty-0.0.81-py3-none-macosx_10_12_x86_64.whl", hash = "sha256:649c350873e4b3e937d856512ee57b8a345d80079cbead73a5308c2cdafe594c", size = 13211367, upload-time = "2026-09-15T02:04:54.18Z" },
+    { url = "https://files.pythonhosted.org/packages/f8/5f/b8fe3ab7eee87bbf1f5ff1b65c55526a3f31a9604630bc9e7d84199bbac5/ty-0.0.81-py3-none-macosx_11_0_arm64.whl", hash = "sha256:480c78706ba78239f901d68cf1ba53e98b84aa51e19b9241daa0fb62fdecd2e2", size = 13084312, upload-time = "2026-09-15T02:04:56.133Z" },
+    { url = "https://files.pythonhosted.org/packages/7f/d8/ce22278014f14ae8205d2f9622696d39c623a0c9e80056c258bb89bb8322/ty-0.0.81-py3-none-manylinux_2_17_aarch64.manylinux2014_aarch64.whl", hash = "sha256:7cdbfa4b634b1d21542eedc11e424dedcc4871c2128d0d46b55b0089d3220492", size = 13127965, upload-time = "2026-09-15T02:04:58.306Z" },
+    { url = "https://files.pythonhosted.org/packages/82/d0/4e75c61f6a241a0804f25117af4f91a5aaa4a48408b57f8d4c34d8a3d91e/ty-0.0.81-py3-none-manylinux_2_17_armv7l.manylinux2014_armv7l.whl", hash = "sha256:5f7a34743a21669d4f3d5fda98c36189cb4d9dceee1415a8a42d7426d55995db", size = 13432523, upload-time = "2026-09-15T02:05:00.471Z" },
+    { url = "https://files.pythonhosted.org/packages/0b/02/e0b6b783418515c8ba40c13d5e333da9e0576a7a69582fc2b5831bb7d913/ty-0.0.81-py3-none-manylinux_2_17_i686.manylinux2014_i686.whl", hash = "sha256:742eab849947bc10b4c09810d37bd743afe9502e114b7bcfd6389f0ae3f425aa", size = 14211082, upload-time = "2026-09-15T02:05:02.455Z" },
+    { url = "https://files.pythonhosted.org/packages/6b/af/85cb68d13ff617f2b213212d674e1266b933f2d051b63a1e5116e8ca0bfc/ty-0.0.81-py3-none-manylinux_2_17_ppc64le.manylinux2014_ppc64le.whl", hash = "sha256:2b4cef395eee7007449aa3fc3fc8dc6bc58fe7a8956d56db078569061741bf52", size = 14692204, upload-time = "2026-09-15T02:05:04.705Z" },
+    { url = "https://files.pythonhosted.org/packages/24/c6/791891f3fa8fec91e9ec3e8c9d6774ab903297defe847a3e5d7e047360ad/ty-0.0.81-py3-none-manylinux_2_17_s390x.manylinux2014_s390x.whl", hash = "sha256:80cf8c34973a1da2ec2a043efcba8f4c0a984d45210957a8ddd2c16f2b8f8e85", size = 14371010, upload-time = "2026-09-15T02:05:06.63Z" },
+    { url = "https://files.pythonhosted.org/packages/c7/b2/c9fba5b4ed7f63f26e83432fa2062ca04606b61dce7bbacc1238232af649/ty-0.0.81-py3-none-manylinux_2_17_x86_64.manylinux2014_x86_64.whl", hash = "sha256:f37a8f66c444eea29f17adfe0664f42062520773f18031fd4913f28eb56d2966", size = 13758537, upload-time = "2026-09-15T02:05:08.722Z" },
+    { url = "https://files.pythonhosted.org/packages/77/e6/09c41e96bbcbe53dd18c9a1a6dbd2e456b0d03b94440a4bd9bab55a4e19a/ty-0.0.81-py3-none-manylinux_2_31_riscv64.whl", hash = "sha256:e8134cc03e84a27f409877b9b62053fd4aaac9c3ce0ce0fdace8b5ed58d78e04", size = 14280789, upload-time = "2026-09-15T02:05:10.719Z" },
+    { url = "https://files.pythonhosted.org/packages/5b/d1/87eb8e01fb17602cde5911cbadb9b11141a04f728dbda0a2a00243f337ca/ty-0.0.81-py3-none-musllinux_1_2_aarch64.whl", hash = "sha256:fb6f269c5f14a07047e05cbf3d06dd9a64a048050f736afcf744a180a272f034", size = 13169638, upload-time = "2026-09-15T02:05:12.806Z" },
+    { url = "https://files.pythonhosted.org/packages/94/3c/137ceb792858f408c48f20a066d12ee76108e5f28a13242720879c024172/ty-0.0.81-py3-none-musllinux_1_2_armv7l.whl", hash = "sha256:38355a5e6294ebd3cee616ed581d051963d61b293a1b3351c248747f73a45b74", size = 13449856, upload-time = "2026-09-15T02:05:15.505Z" },
+    { url = "https://files.pythonhosted.org/packages/fe/0a/4a9b31fadfc80a2141f3862316eb31944843e01bc1f6533794291cce767e/ty-0.0.81-py3-none-musllinux_1_2_i686.whl", hash = "sha256:59a35e128a9831423aee19db804aa8a1358ee3ce615b3fc0dec20d40bfd0d733", size = 13675303, upload-time = "2026-09-15T02:05:17.537Z" },
+    { url = "https://files.pythonhosted.org/packages/e3/16/dbcd2c10ab80b015a227110a4ec75314468b6720d800261098521df4eee9/ty-0.0.81-py3-none-musllinux_1_2_x86_64.whl", hash = "sha256:f0f4219fbc068ea3414fa804c6bd57ef4229a11884ab9ca71cd8308072520aad", size = 14050298, upload-time = "2026-09-15T02:05:20.424Z" },
+    { url = "https://files.pythonhosted.org/packages/95/ba/a70ced0c0c078ff09a3a80224d045c4267d07811dbaf125c749af5f72606/ty-0.0.81-py3-none-win32.whl", hash = "sha256:82ff952e64ba4c4da1c0c89723e326c768ae4f9ff20624dee04a51c3f4e4b96c", size = 12866650, upload-time = "2026-09-15T02:05:22.824Z" },
+    { url = "https://files.pythonhosted.org/packages/3f/51/4b79453df93dfb9edecb1bd6cb04e772277d8c7260693165358a033b6ed1/ty-0.0.81-py3-none-win_amd64.whl", hash = "sha256:ef82788744da0b7f2a598e4e9776f9c5998df4eef7e2750ae3a5537e7c734b69", size = 13572976, upload-time = "2026-09-15T02:05:24.907Z" },
+    { url = "https://files.pythonhosted.org/packages/0a/56/09594d55a0c49543eeac149c0dbc80b9b04409cc26ca48f1c1a9595c0916/ty-0.0.81-py3-none-win_arm64.whl", hash = "sha256:bdb1563990c5d3abfe5a09e7512733f302773ede6a5d3e4e5c6ad46393d8df4d", size = 13364408, upload-time = "2026-09-15T02:05:27.247Z" },
 ]
 
 [[package]]

-- 
2.56.0.rc0.682.g1951b10616.frankengit

