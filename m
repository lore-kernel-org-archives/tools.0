Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C1533AD8A
	for <tools@linux.kernel.org>; Mon, 20 Apr 2026 01:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776648246; cv=none; b=qbSWmyTYYpbvE8Jlm90Fh2N0EoOTG3ourB9+D13J7ddCW1NT6LXW0LnPiQfat15xDUZZL3mY82V/K/BZPYyUlxUEATrQxfwHV4m+Bxp0nof8BFYc6+DG1vzajgVQmhvVRDy15UDd/PX7BDjz7sfPxhkWw/4ToqiTgrwV6ie87QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776648246; c=relaxed/simple;
	bh=i2jhiGdGGuk3+Z5hCtpa2IMamKgPp3qnbQA4afh3gd8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bRsoMjAx7ptqXRZ6mww+E6ZpMZKCP+U6AoVodhh7dKNVADIiHrNQsqAHHmMGNZMiIIpiSs9f4TPQ3rZpmYu+5GX/XSAEv8OT5AtOciUFDpIIi2hiwBQQ3k1/fiU/+vEF5R95dWexqeEeHGjvl9ptnMgJF6D5bG08uL0V39OrSxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NaJGPLIk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NaJGPLIk"
Received: by smtp.kernel.org (Postfix)
	id 09FC6C2BCB5; Mon, 20 Apr 2026 01:24:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48A9EC2BCAF;
	Mon, 20 Apr 2026 01:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776648245;
	bh=i2jhiGdGGuk3+Z5hCtpa2IMamKgPp3qnbQA4afh3gd8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NaJGPLIkXM4HuCLVJLuxLbaVtvafkIfsoh5H/0NG9egy6JTAYosuW28sm3KZTQj4s
	 9/OXYlcOt3iSpLc6oUiXm7lcWJYX1KdddAwrBmyC2a85eFTmyGnYBL8Tt4pSDso9rE
	 t9ZBSzsrXsADEANTTGIypXsmO+0ZixVhYZh1xohiOZG257QDKYrCKsBcDs+tEdNKLf
	 AYkvlgrbK94Gc6d5lZKg9PjzjzaT01sUzGCQHMYjCi284WQVlNBnuRczK6hGb/A85X
	 EoimzmjcwzE3SxhYg/ZDtzHKesz6QY/wsc9LCMwM5AJiBL796weDebcjax+HP82OWW
	 X2VpJ8eX+lKQg==
From: Tamir Duberstein <tamird@kernel.org>
Date: Sun, 19 Apr 2026 21:22:24 -0400
Subject: [PATCH patatt 4/7] Add pyright strict checks
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260419-stronger-type-checking-v1-4-5c108048d2c7@kernel.org>
References: <20260419-stronger-type-checking-v1-0-5c108048d2c7@kernel.org>
In-Reply-To: <20260419-stronger-type-checking-v1-0-5c108048d2c7@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=14909; i=tamird@kernel.org;
 h=from:subject:message-id; bh=i2jhiGdGGuk3+Z5hCtpa2IMamKgPp3qnbQA4afh3gd8=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlP658U+Qv55iybvMz34zy2BSs4Ctl/ZZa7/SpUVRHdv
 kiNzba3YyILgxgXg6WYIkui6KG96am398hmvjsOM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6BgzcHEKwFTb3WH4w8lY++C4xrbnoX9X/SyXexR3ga272G33iekyM8/9WRPFpsbwT6u6x6W
 MJapcxfHvnHSZEiadP+b2m+2etxX3NR56XX6ZGwA=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

Configure pyright in strict mode and run it from the local CI helper.

Tighten ambiguous containers, cached binary paths, and result tuples so
strict analysis has concrete types. Keep private-usage checks disabled
only for tests because the existing tests assert internal state
directly.

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
 ci.sh                               |   1 +
 pyproject.toml                      |   7 ++-
 src/patatt/__init__.py              | 105 ++++++++++++++++++------------------
 tests/test_validation.py            |   2 +-
 tests/unit/test_devsig_header.py    |   3 +-
 tests/unit/test_get_algo_keydata.py |   2 +-
 6 files changed, 62 insertions(+), 58 deletions(-)

diff --git a/ci.sh b/ci.sh
index ec0baf8..4b07fa2 100755
--- a/ci.sh
+++ b/ci.sh
@@ -5,4 +5,5 @@ set -eu
 uv run ruff format --check
 uv run ruff check
 uv run mypy .
+uv run pyright
 uv run pytest --durations=0
diff --git a/pyproject.toml b/pyproject.toml
index d56d828..9615a41 100644
--- a/pyproject.toml
+++ b/pyproject.toml
@@ -28,6 +28,7 @@ dependencies = [
 dev = [
     "mypy",
     "pip-tools",
+    "pyright",
     "pytest",
     "ruff",
 ]
@@ -62,7 +63,11 @@ flake8-quotes.inline-quotes = "single"
 quote-style = "single"
 
 [tool.pyright]
-typeCheckingMode = "off"
+typeCheckingMode = "strict"
+
+executionEnvironments = [
+    { root = "tests", reportPrivateUsage = false },
+]
 
 # Configure mypy in strict mode
 [tool.mypy]
diff --git a/src/patatt/__init__.py b/src/patatt/__init__.py
index 24ec933..7087479 100644
--- a/src/patatt/__init__.py
+++ b/src/patatt/__init__.py
@@ -22,15 +22,18 @@ import urllib.parse
 import warnings
 from io import BytesIO
 from pathlib import Path
-from typing import Any, Dict, List, Optional, Tuple, Union
+from typing import Any, Dict, List, Optional, Set, Tuple, Union
 
 GitConfigType = Dict[str, Union[str, List[str]]]
+AttestationResult = Tuple[
+    int, Optional[str], Optional[str], Optional[str], Optional[str], List[str]
+]
 
 logger: logging.Logger = logging.getLogger(__name__)
 
 # Overridable via [patatt] parameters
-GPGBIN: Optional[str] = None
-SSHKBIN: Optional[str] = None
+_gpgbin_path: Optional[str] = None
+_sshkbin_path: Optional[str] = None
 
 # Hardcoded defaults
 DEVSIG_HDR = b'X-Developer-Signature'
@@ -233,8 +236,8 @@ class DevsigHeader:
             SigningError: If required headers are missing (sign mode).
             ValidationError: If required headers are not signed (validate mode).
         """
-        parsed = list()
-        allhdrs = set()
+        parsed: List[Tuple[bytes, bytes]] = list()
+        allhdrs: Set[bytes] = set()
         # DKIM operates on headers in reverse order
         for header in reversed(headers):
             try:
@@ -256,7 +259,7 @@ class DevsigHeader:
                     % (b', '.join(reqset.difference(allhdrs)).decode())
                 )
             # Add optional headers that are actually present
-            optpresent = list(allhdrs.intersection(optset))
+            optpresent: List[bytes] = list(allhdrs.intersection(optset))
             signlist = REQ_HDRS + sorted(optpresent)
             self.hdata['h'] = b':'.join(signlist)
 
@@ -411,15 +414,11 @@ class DevsigHeader:
         if isinstance(keyinfo, bytes):
             bkeyinfo = keyinfo
             skeyinfo = keyinfo.decode()
-        elif isinstance(keyinfo, str):
+        else:
             skeyinfo = keyinfo
             bkeyinfo = keyinfo.encode()
-        else:
-            raise RuntimeError(
-                'keyinfo must be a string or bytes, not %s' % type(keyinfo).__name__
-            )
 
-        hparts = list()
+        hparts: List[bytes] = list()
         for fn in self._order:
             fv = self.get_field_as_bytes(fn)
             if fv is not None:
@@ -554,7 +553,7 @@ class DevsigHeader:
                 '-s',
                 spath,
             ]
-            ecode, out, err = sshk_run_command(sshkargs, payload)
+            ecode, _out, err = sshk_run_command(sshkargs, payload)
             if ecode > 0:
                 raise ValidationError(
                     'Failed to validate openssh signature',
@@ -672,7 +671,7 @@ class DevsigHeader:
 
     @staticmethod
     def splitter(longstr: bytes, limit: int = 75) -> bytes:
-        splitstr = list()
+        splitstr: List[bytes] = list()
         first = True
         while len(longstr) > limit:
             at = limit
@@ -767,7 +766,7 @@ class PatattMessage:
         for line in re.sub(rb'[\r\n]*$', b'', m + p).split(b'\n'):
             self.canon_body += re.sub(rb'[\r\n]*$', b'', line) + b'\r\n'
 
-        idata = dict()
+        idata: Dict[bytes, bytes] = dict()
         for line in re.sub(rb'[\r\n]*$', b'', i).split(b'\n'):
             left, right = line.split(b':', 1)
             idata[left.lower()] = right.strip()
@@ -1102,13 +1101,15 @@ def get_config_from_git(
 
             if cfgkey in multivals:
                 if cfgkey not in gitconfig:
-                    gitconfig[cfgkey] = list()
-                elif isinstance(gitconfig[cfgkey], str):
-                    gitconfig[cfgkey] = [gitconfig[cfgkey]]  # type: ignore[list-item]
+                    values: List[str] = list()
                 else:
-                    gitconfig[cfgkey] = list()
-                # We've made sure this is a list
-                gitconfig[cfgkey].append(value)  # type: ignore[union-attr]
+                    cfgvalue = gitconfig[cfgkey]
+                    if isinstance(cfgvalue, str):
+                        values = [cfgvalue]
+                    else:
+                        values = cfgvalue
+                values.append(value)
+                gitconfig[cfgkey] = values
             else:
                 gitconfig[cfgkey] = value
         except ValueError:
@@ -1143,7 +1144,7 @@ def get_git_toplevel(gitdir: Optional[str] = None) -> str:
     if gitdir:
         cmdargs += ['--git-dir', gitdir]
     cmdargs += ['rev-parse', '--show-toplevel']
-    ecode, out, err = _run_command(cmdargs)
+    ecode, out, _err = _run_command(cmdargs)
     if ecode == 0:
         return out.decode().strip()
     return ''
@@ -1151,7 +1152,7 @@ def get_git_toplevel(gitdir: Optional[str] = None) -> str:
 
 def get_git_dir() -> str:
     cmdargs = ['git', 'rev-parse', '--git-dir']
-    ecode, out, err = _run_command(cmdargs)
+    ecode, out, _err = _run_command(cmdargs)
     if ecode == 0:
         return out.decode().strip()
     return ''
@@ -1264,7 +1265,7 @@ def get_public_key(
         if not gitref:
             # What is our current ref?
             cmdargs = ['symbolic-ref', 'HEAD']
-            ecode, out, err = git_run_command(gittop, cmdargs)
+            ecode, out, _err = git_run_command(gittop, cmdargs)
             if ecode == 0:
                 gitref = out.decode().strip()
         if not gitref:
@@ -1272,7 +1273,7 @@ def get_public_key(
 
         keysrc = f'{gitref}:{subpath}'
         cmdargs = ['show', keysrc]
-        ecode, out, err = git_run_command(gittop, cmdargs)
+        ecode, out, _err = git_run_command(gittop, cmdargs)
         if ecode == 0:
             # Handle one level of symlinks
             if out.find(b'\n') < 0 < out.find(b'/'):
@@ -1282,7 +1283,7 @@ def get_public_key(
                 )
                 keysrc = f'{gitref}:{linktgt}'
                 cmdargs = ['show', keysrc]
-                ecode, out, err = git_run_command(gittop, cmdargs)
+                ecode, out, _err = git_run_command(gittop, cmdargs)
                 if ecode == 0:
                     logger.debug('KEYSRC  : %s (symlinked)', keysrc)
                     return out, 'ref:%s:%s' % (gittop, keysrc)
@@ -1301,7 +1302,7 @@ def get_public_key(
         byhash_subpath = Path(gitsub) / byhash_keypath
         keysrc = f'{gitref}:{byhash_subpath}'
         cmdargs = ['show', keysrc]
-        ecode, out, err = git_run_command(gittop, cmdargs)
+        ecode, out, _err = git_run_command(gittop, cmdargs)
         if ecode == 0:
             logger.debug('KEYSRC  : %s (by-hash)', keysrc)
             return out, 'ref:%s:%s' % (gittop, keysrc)
@@ -1342,7 +1343,7 @@ def _load_messages(cmdargs: argparse.Namespace) -> Dict[str, bytes]:
 
     if len(cmdargs.msgfile):
         # Load all message from the files passed to make sure they all parse correctly
-        messages = dict()
+        messages: Dict[str, bytes] = dict()
         for msgfile in cmdargs.msgfile:
             with open(msgfile, 'rb') as fh:
                 messages[msgfile] = fh.read()
@@ -1382,30 +1383,30 @@ def sign_message(
 
 
 def set_bin_paths(config: Optional[GitConfigType]) -> Tuple[str, str]:
-    global GPGBIN, SSHKBIN
-    if GPGBIN is None:
+    global _gpgbin_path, _sshkbin_path
+    if _gpgbin_path is None:
         if config and config.get('gpg-bin'):
             _gpgbin = config.get('gpg-bin')
-            assert isinstance(GPGBIN, str), 'gpg-bin must be a string'
-            GPGBIN = _gpgbin
+            assert isinstance(_gpgbin, str), 'gpg-bin must be a string'
+            _gpgbin_path = _gpgbin
         elif (_gpgbin := get_config_from_git(r'gpg\..*').get('program')) is not None:
             assert isinstance(_gpgbin, str), 'gpg program must be a string'
-            GPGBIN = _gpgbin
+            _gpgbin_path = _gpgbin
         else:
-            GPGBIN = 'gpg'
-    if SSHKBIN is None:
+            _gpgbin_path = 'gpg'
+    if _sshkbin_path is None:
         if config and config.get('ssh-keygen-bin'):
             _sshkbin = config.get('ssh-keygen-bin')
             assert isinstance(_sshkbin, str), 'ssh-keygen-bin must be a string'
-            SSHKBIN = _sshkbin
+            _sshkbin_path = _sshkbin
         elif (
             _sshkbin := get_config_from_git(r'gpg\..*', section='ssh').get('program')
         ) is not None:
             assert isinstance(_sshkbin, str), 'program must be a string'
-            SSHKBIN = _sshkbin
+            _sshkbin_path = _sshkbin
         else:
-            SSHKBIN = 'ssh-keygen'
-    return GPGBIN, SSHKBIN
+            _sshkbin_path = 'ssh-keygen'
+    return _gpgbin_path, _sshkbin_path
 
 
 def get_algo_keydata(config: GitConfigType) -> Tuple[str, str]:
@@ -1574,9 +1575,7 @@ def cmd_sign(cmdargs: argparse.Namespace, config: GitConfigType) -> None:
 
 def validate_message(
     msgdata: bytes, sources: List[str], trim_body: bool = False
-) -> List[
-    Tuple[int, Optional[str], Optional[str], Optional[str], Optional[str], List[str]]
-]:
+) -> List[AttestationResult]:
     """Validate all signatures in an RFC2822 message.
 
     Args:
@@ -1590,11 +1589,7 @@ def validate_message(
 
         Result codes: RES_VALID, RES_BADSIG, RES_NOKEY, RES_NOSIG, RES_ERROR
     """
-    attestations: List[
-        Tuple[
-            int, Optional[str], Optional[str], Optional[str], Optional[str], List[str]
-        ]
-    ] = list()
+    attestations: List[AttestationResult] = list()
     pm = PatattMessage(msgdata)
     if not pm.signed:
         logger.debug('message is not signed')
@@ -1605,7 +1600,7 @@ def validate_message(
 
     # Find all identities for which we have public keys
     for ds in pm.get_sigs():
-        errors = list()
+        errors: List[str] = list()
         a = ds.get_field_as_str('a')
         i = ds.get_field_as_str('i')
         s = ds.get_field_as_str('s')
@@ -1676,9 +1671,9 @@ def cmd_validate(cmdargs: argparse.Namespace, config: GitConfigType) -> None:
             logger.critical('E: %s', ex)
             sys.exit(1)
 
-        messages = dict()
+        messages: Dict[str, bytes] = dict()
         for msg in mbox:
-            subject = msg.get('Subject', 'No subject')
+            subject = str(msg.get('Subject', 'No subject'))
             messages[subject] = msg.as_bytes()
     else:
         try:
@@ -1689,9 +1684,11 @@ def cmd_validate(cmdargs: argparse.Namespace, config: GitConfigType) -> None:
 
     ddir = get_data_dir()
     pdir = ddir / 'public'
-    sources = config.get('keyringsrc', list())
-    if not isinstance(sources, list):
-        sources = [sources]
+    raw_sources = config.get('keyringsrc', list())
+    if isinstance(raw_sources, list):
+        sources = raw_sources
+    else:
+        sources = [raw_sources]
 
     if str(pdir) not in sources:
         sources.append(str(pdir))
@@ -1705,7 +1702,7 @@ def cmd_validate(cmdargs: argparse.Namespace, config: GitConfigType) -> None:
     for fn, msgdata in messages.items():
         try:
             attestations = validate_message(msgdata, sources, trim_body=trim_body)
-            for result, identity, signtime, keysrc, algo, errors in attestations:
+            for result, identity, _signtime, keysrc, _algo, errors in attestations:
                 if result > highest_err:
                     highest_err = result
 
diff --git a/tests/test_validation.py b/tests/test_validation.py
index 1477fbe..c399f14 100644
--- a/tests/test_validation.py
+++ b/tests/test_validation.py
@@ -36,5 +36,5 @@ def test_validate(sample_file: str) -> None:
     # Print validation details for debugging
     print(f'Found {len(valid_signatures)} valid signatures:')
     for result in valid_signatures:
-        status, algo, keytype, identity, selector, errors = result
+        _status, _algo, keytype, identity, selector, _errors = result
         print(f'  - {keytype} signature by {identity} ({selector})')
diff --git a/tests/unit/test_devsig_header.py b/tests/unit/test_devsig_header.py
index 7b6e461..d94bdc9 100644
--- a/tests/unit/test_devsig_header.py
+++ b/tests/unit/test_devsig_header.py
@@ -1,6 +1,7 @@
 import base64
 import hashlib
 from io import BytesIO
+from typing import List
 
 import pytest
 
@@ -76,7 +77,7 @@ class TestDevsigHeader:
         header = DevsigHeader()
 
         # Parse the sample email to get headers
-        headers = []
+        headers: List[bytes] = []
         with BytesIO(sample_email_bytes) as fh:
             while True:
                 line = fh.readline()
diff --git a/tests/unit/test_get_algo_keydata.py b/tests/unit/test_get_algo_keydata.py
index c4ccc8d..4d9b7e6 100644
--- a/tests/unit/test_get_algo_keydata.py
+++ b/tests/unit/test_get_algo_keydata.py
@@ -119,7 +119,7 @@ class TestGetAlgoKeydataSSHSigningKey:
             gpgcfg={'format': 'ssh'},
         )
         config: GitConfigType = {}
-        algo, keydata = get_algo_keydata(config)
+        algo, _keydata = get_algo_keydata(config)
 
         assert config['identity'] == 'auto@example.com'
         assert algo == 'openssh'

-- 
2.53.0

