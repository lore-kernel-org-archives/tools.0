Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332623446C7
	for <tools@linux.kernel.org>; Mon, 20 Apr 2026 01:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776648214; cv=none; b=nAM6ufZ2QmQcsqTWPh3FoEtTBnJ1PVjeGXgefbdvhJ7HuUUux5/PFt7G4hnqvkJt6TOWxrRaK2aQo0BE2TXP4uacMIt6kpsQWs4AJptWhgd1zhDlS1e5RCNKTuKG6QoHRED818iqIhRWYmBKsKx78qqXFwzt1cwhxHM2YtbGPvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776648214; c=relaxed/simple;
	bh=Cl+M82QB2B3OY1kjIjayUW9rvhhlbhh/uSL7JI//s4M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sGqQ27BwN0uKRPSK+C9dlCCC9DPsWQBFxvacDce7gdLT/e80DTqdleb2DHDDq5K0RpqVQstYIYDqmK1GXo6XLWfhcRcgHv2+oD449QsqT4Zksyziz9uz+MRrvEwTQlvQKFiLHg410BnjfTyqLiL+67iE3DBZwCuYyxqrSZUwatI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bfLGT7ww; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bfLGT7ww"
Received: by smtp.kernel.org (Postfix)
	id DB1F1C2BCB6; Mon, 20 Apr 2026 01:23:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E17CCC2BCAF;
	Mon, 20 Apr 2026 01:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776648213;
	bh=Cl+M82QB2B3OY1kjIjayUW9rvhhlbhh/uSL7JI//s4M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bfLGT7wwsPRWdM6P9G9Pmie7kkNEnt76xI45veW/LARDEIo+HUZXqgXjft2ocOKLK
	 68QT2rzZNK1cCj+a3HhXOFVPEPA0xlQmw1mn4HNoLbdSvvhsAYCM1OD3OT23Pp72v6
	 J0vQOP5k+nxbNlU8Gu8R9vpxIi0uPkOABp+f9ptAMoer2rOciQdDUqjeUWjUPYTyzq
	 AkJLIR5j/qHXsJUwhzgFc8Xi+TbXkRivyuy3dcyzF4pjjVPY9O79hfRtYrsMvgc01n
	 3P4JidQW3oDsvYkMwXfx2gLLLjUq+rOqiFr8UOXJje3UOB4Q6CmB51JXcFYs6/os6b
	 Zp/W55o5KF6EQ==
From: Tamir Duberstein <tamird@kernel.org>
Date: Sun, 19 Apr 2026 21:22:22 -0400
Subject: [PATCH patatt 2/7] Add Ruff import checks
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260419-stronger-type-checking-v1-2-5c108048d2c7@kernel.org>
References: <20260419-stronger-type-checking-v1-0-5c108048d2c7@kernel.org>
In-Reply-To: <20260419-stronger-type-checking-v1-0-5c108048d2c7@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6511; i=tamird@kernel.org;
 h=from:subject:message-id; bh=Cl+M82QB2B3OY1kjIjayUW9rvhhlbhh/uSL7JI//s4M=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlP65/0fGYtSenZxyPtJqd49J/90wvXlKxip2fs5Ui1t
 X7sdPlLx0QWBjEuBksxRZZE0UN701Nv75HNfHccZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx0DFm4OIUgKnm+crwzyzozak77VzJW7o7tx7ySnm1fvau+OBmWZUXDeFXG5YZnWRk+H+c3SN
 5wUeHpT/uTHxuFfnGSI4jrEFRJv9YSejf9/VZ/AA=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

Run Ruff's default lint rules together with import sorting and the
existing blanket-noqa check.

Sort imports and remove unused test imports so the expanded lint
configuration is green under the local CI script.

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
 docs/conf.py                        |  5 +++--
 pyproject.toml                      |  3 ++-
 src/patatt/__init__.py              | 29 +++++++++++++----------------
 tests/conftest.py                   |  7 +++----
 tests/test_validation.py            |  7 ++++---
 tests/unit/test_byhash.py           |  2 +-
 tests/unit/test_devsig_header.py    |  6 +++---
 tests/unit/test_get_algo_keydata.py | 11 +++++------
 tests/unit/test_patatt_message.py   |  7 +++----
 9 files changed, 37 insertions(+), 40 deletions(-)

diff --git a/docs/conf.py b/docs/conf.py
index 042c753..cb0ca38 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -9,13 +9,14 @@ import sys
 # Add the source directory to the path for autodoc
 sys.path.insert(0, os.path.abspath('../src'))
 
+# The version info
+from patatt import __VERSION__
+
 # -- Project information -----------------------------------------------------
 project = 'patatt'
 copyright = '2021-2026, Konstantin Ryabitsev'
 author = 'Konstantin Ryabitsev'
 
-# The version info
-from patatt import __VERSION__
 version = __VERSION__
 release = __VERSION__
 
diff --git a/pyproject.toml b/pyproject.toml
index a541b01..7583cd4 100644
--- a/pyproject.toml
+++ b/pyproject.toml
@@ -52,7 +52,8 @@ version = {attr = "patatt.__VERSION__"}
 "share/man/man5" = ["man/patatt.5"]
 
 [tool.ruff.lint]
-select = [
+extend-select = [
+    "I",
     "PGH004", # https://docs.astral.sh/ruff/rules/blanket-noqa/
 ]
 flake8-quotes.inline-quotes = "single"
diff --git a/src/patatt/__init__.py b/src/patatt/__init__.py
index 499d820..935da55 100644
--- a/src/patatt/__init__.py
+++ b/src/patatt/__init__.py
@@ -5,27 +5,24 @@
 #
 __author__ = 'Konstantin Ryabitsev <konstantin@linuxfoundation.org>'
 
-import sys
-import os
-import re
-
 import argparse
-import hashlib
 import base64
-import subprocess
+import datetime
+import email.header
+import email.utils
+import hashlib
 import logging
+import os
+import re
+import subprocess
+import sys
 import tempfile
 import time
-import datetime
-import warnings
-
 import urllib.parse
-import email.utils
-import email.header
-
-from pathlib import Path
-from typing import Optional, List, Tuple, Dict, Union, Any
+import warnings
 from io import BytesIO
+from pathlib import Path
+from typing import Any, Dict, List, Optional, Tuple, Union
 
 GitConfigType = Dict[str, Union[str, List[str]]]
 
@@ -437,8 +434,8 @@ class DevsigHeader:
     def _sign_ed25519(payload: bytes, privkey: bytes) -> Tuple[bytes, bytes]:
         global KEYCACHE
         try:
-            from nacl.signing import SigningKey
             from nacl.encoding import Base64Encoder
+            from nacl.signing import SigningKey
         except ModuleNotFoundError:
             raise RuntimeError('This operation requires PyNaCl libraries')
 
@@ -456,9 +453,9 @@ class DevsigHeader:
     @staticmethod
     def _validate_ed25519(sigdata: bytes, pubkey: bytes) -> bytes:
         try:
-            from nacl.signing import VerifyKey
             from nacl.encoding import Base64Encoder
             from nacl.exceptions import BadSignatureError
+            from nacl.signing import VerifyKey
         except ModuleNotFoundError:
             raise RuntimeError('This operation requires PyNaCl libraries')
 
diff --git a/tests/conftest.py b/tests/conftest.py
index a9c9157..8bb6064 100644
--- a/tests/conftest.py
+++ b/tests/conftest.py
@@ -1,13 +1,12 @@
+import base64
+import tempfile
 from pathlib import Path
+from typing import Dict, Generator
 
-import os
-import tempfile
 import pytest
-import base64
 
 from patatt import DevsigHeader, PatattMessage
 
-from typing import Generator, Dict
 
 @pytest.fixture
 def sample_email_bytes() -> bytes:
diff --git a/tests/test_validation.py b/tests/test_validation.py
index 61c4ab6..d51be81 100644
--- a/tests/test_validation.py
+++ b/tests/test_validation.py
@@ -1,9 +1,10 @@
-import pytest
 import os
-import tempfile
 from pathlib import Path
 
-from patatt import PatattMessage, sign_message, validate_message, RES_VALID
+import pytest
+
+from patatt import RES_VALID, validate_message
+
 
 @pytest.mark.parametrize("sample_file", [
     "ed25519-signed.txt",
diff --git a/tests/unit/test_byhash.py b/tests/unit/test_byhash.py
index a24d338..c3fe4d2 100644
--- a/tests/unit/test_byhash.py
+++ b/tests/unit/test_byhash.py
@@ -4,7 +4,7 @@ from pathlib import Path
 
 import pytest
 
-from patatt import make_byhash_path, make_pkey_path, get_public_key
+from patatt import get_public_key, make_byhash_path, make_pkey_path
 
 
 class TestMakeByhashPath:
diff --git a/tests/unit/test_devsig_header.py b/tests/unit/test_devsig_header.py
index 5c5bb06..547593d 100644
--- a/tests/unit/test_devsig_header.py
+++ b/tests/unit/test_devsig_header.py
@@ -1,11 +1,11 @@
-import pytest
 import base64
 import hashlib
 from io import BytesIO
 
-from typing import Dict
+import pytest
+
+from patatt import DevsigHeader
 
-from patatt import DevsigHeader, ValidationError, SigningError
 
 class TestDevsigHeader:
 
diff --git a/tests/unit/test_get_algo_keydata.py b/tests/unit/test_get_algo_keydata.py
index 6f268eb..545f051 100644
--- a/tests/unit/test_get_algo_keydata.py
+++ b/tests/unit/test_get_algo_keydata.py
@@ -1,14 +1,13 @@
-import pytest
+from typing import Callable
+from unittest.mock import MagicMock, patch
 
-from typing import Any, Callable
-from unittest.mock import patch, MagicMock
+import pytest
 
 from patatt import (
-    get_algo_keydata,
-    NoKeyError,
-    ConfigurationError,
     KEYCACHE,
     GitConfigType,
+    NoKeyError,
+    get_algo_keydata,
 )
 
 
diff --git a/tests/unit/test_patatt_message.py b/tests/unit/test_patatt_message.py
index 1422ee7..58338f4 100644
--- a/tests/unit/test_patatt_message.py
+++ b/tests/unit/test_patatt_message.py
@@ -1,10 +1,9 @@
+from typing import Tuple
+
 import pytest
-import re
-from io import BytesIO
 
-from patatt import PatattMessage, ValidationError
+from patatt import PatattMessage
 
-from typing import Tuple
 
 class TestPatattMessage:
 

-- 
2.53.0

