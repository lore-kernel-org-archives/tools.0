Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC32F2FD1D0
	for <tools@linux.kernel.org>; Mon, 20 Apr 2026 01:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776648235; cv=none; b=AlXVax/xUsL3iabJkcxFWwj4Qi3lwunYGieA4Tg8nsMk2Ldy2eLd5JUTbhQUUfbejqpaqI2R+kfif7SsPIfFjoPBSeOQrHyvqcWdDgVsQA1NxQqdMM4bNNEHGLvpWN3HUlSjNIp9TTR5/OMtSBk/yFVfZMCKABMdZN0zu55/OtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776648235; c=relaxed/simple;
	bh=8XxW2HYTvWmVsxfmrHGR4p5yJHFAmSbduCHlIt/72hU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OsLWHmKP4HZZSqYERPIHAljmUUsQOWd92MH1IfU86mkbN9LJQs0nEa9GXrkm0ZqhFYDUhjBWRcd4LC2z1zxjMh/dpjSNrS6V6Zca1LCoEZkls6OXoZBPF2pPB4So+Y7MLhpL9wATiKoMaqvx9U6yu2BCRf+JOyZN6n11oNSppTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LS7F9S8Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LS7F9S8Y"
Received: by smtp.kernel.org (Postfix)
	id 76294C2BCB5; Mon, 20 Apr 2026 01:23:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E369AC2BCAF;
	Mon, 20 Apr 2026 01:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776648235;
	bh=8XxW2HYTvWmVsxfmrHGR4p5yJHFAmSbduCHlIt/72hU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LS7F9S8Yo8DPfTwJ8Y1uxggL2WzM13MdCiECpjfpXTs3zpqEHeIQuUsdg1E0l0w5w
	 Bo4Avl9Sb+7kRq5mP2DOggjJK/Ha42RvfcA+c8mnfaS2Klpyv780mnB2pfeC1eiKD5
	 aJ0SZfNKvBFHU5/dv/N/r3kMc8R7vwsUis5smsg/sy+90gTqKSsYmu5fHgPmh30ghp
	 s4qEvi6mgsN66B7ubCOkcUSbjS+iXQI0bk/v2lz3dfZYETQPMkg7N8/YhTuAZKVmsi
	 Zdqcraffoo7WIV9GONBq5KRmJ7Kps/Wk4+0SoUmDn376YDMkE1piV0PfAq8ygCZgMR
	 adR/G8HWYWf0Q==
From: Tamir Duberstein <tamird@kernel.org>
Date: Sun, 19 Apr 2026 21:22:23 -0400
Subject: [PATCH patatt 3/7] Add Ruff format check
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260419-stronger-type-checking-v1-3-5c108048d2c7@kernel.org>
References: <20260419-stronger-type-checking-v1-0-5c108048d2c7@kernel.org>
In-Reply-To: <20260419-stronger-type-checking-v1-0-5c108048d2c7@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@kernel.org>, 'test@example.com'}
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=42313; i=tamird@kernel.org;
 h=from:subject:message-id; bh=8XxW2HYTvWmVsxfmrHGR4p5yJHFAmSbduCHlIt/72hU=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlP6594r1xWXKLMur2s8K2e/l1D46Qwz9NHOAs/9nvWM
 zY8lN7TMZGFQYyLwVJMkSVR9NDe9NTbe2Qz3x2HmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXQMdIwZuDgFYKq/aDEy3Ik0dzmh/85gYw5PYr1cHwcTU/fPmm28M/gyBD3tP6z2ZmQ4O8uTI+a
 Z7aeLHMp+S1qU38fO43J8d/XL/6bFZqmsJ0XYAQ==
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

Run Ruff's formatter as part of the local CI helper and configure it to
preserve the project's single-quote style.

Apply the one-time formatting pass so the new check starts from a green
baseline.

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
 ci.sh                               |   1 +
 conftest.py                         |   3 +-
 pyproject.toml                      |   3 +
 src/patatt/__init__.py              | 345 +++++++++++++++++++++++++++---------
 tests/conftest.py                   |  10 +-
 tests/test_validation.py            |  16 +-
 tests/unit/test_byhash.py           |   2 -
 tests/unit/test_devsig_header.py    |  17 +-
 tests/unit/test_get_algo_keydata.py |   9 +-
 tests/unit/test_patatt_message.py   |  20 ++-
 10 files changed, 307 insertions(+), 119 deletions(-)

diff --git a/ci.sh b/ci.sh
index 3001db2..ec0baf8 100755
--- a/ci.sh
+++ b/ci.sh
@@ -2,6 +2,7 @@
 
 set -eu
 
+uv run ruff format --check
 uv run ruff check
 uv run mypy .
 uv run pytest --durations=0
diff --git a/conftest.py b/conftest.py
index c106f53..33276ab 100644
--- a/conftest.py
+++ b/conftest.py
@@ -3,7 +3,6 @@ from pathlib import Path
 
 # Add the src directory to the Python path
 project_root = Path(__file__).parent
-src_path = str(project_root / "src")
+src_path = str(project_root / 'src')
 if src_path not in sys.path:
     sys.path.insert(0, src_path)
-
diff --git a/pyproject.toml b/pyproject.toml
index 7583cd4..d56d828 100644
--- a/pyproject.toml
+++ b/pyproject.toml
@@ -58,6 +58,9 @@ extend-select = [
 ]
 flake8-quotes.inline-quotes = "single"
 
+[tool.ruff.format]
+quote-style = "single"
+
 [tool.pyright]
 typeCheckingMode = "off"
 
diff --git a/src/patatt/__init__.py b/src/patatt/__init__.py
index 935da55..24ec933 100644
--- a/src/patatt/__init__.py
+++ b/src/patatt/__init__.py
@@ -55,6 +55,7 @@ CONFIGCACHE: Dict[str, GitConfigType] = dict()
 __VERSION__ = '0.7.1'
 MAX_SUPPORTED_FORMAT_VERSION = 1
 
+
 class Error(Exception):
     """Base exception for patatt errors.
 
@@ -171,8 +172,11 @@ class DevsigHeader:
         .. deprecated::
             Use :meth:`get_field_as_bytes` or :meth:`get_field_as_str` instead.
         """
-        warnings.warn('get_field() is deprecated, use get_field_as_bytes() or get_field_as_str() instead',
-                      DeprecationWarning, stacklevel=2)
+        warnings.warn(
+            'get_field() is deprecated, use get_field_as_bytes() or get_field_as_str() instead',
+            DeprecationWarning,
+            stacklevel=2,
+        )
         value = self.hdata.get(field)
         if isinstance(value, bytes) and decode:
             return value.decode()
@@ -247,8 +251,10 @@ class DevsigHeader:
         if mode == 'sign':
             # Make sure REQ_HDRS is a subset of allhdrs
             if not reqset.issubset(allhdrs):
-                raise SigningError('The following required headers not present: %s'
-                                   % (b', '.join(reqset.difference(allhdrs)).decode()))
+                raise SigningError(
+                    'The following required headers not present: %s'
+                    % (b', '.join(reqset.difference(allhdrs)).decode())
+                )
             # Add optional headers that are actually present
             optpresent = list(allhdrs.intersection(optset))
             signlist = REQ_HDRS + sorted(optpresent)
@@ -261,8 +267,10 @@ class DevsigHeader:
             signlist = [x.strip() for x in hfield.split(b':')]
             # Make sure REQ_HEADERS are in this set
             if not reqset.issubset(set(signlist)):
-                raise ValidationError('The following required headers not signed: %s'
-                                      % (b', '.join(reqset.difference(set(signlist))).decode()))
+                raise ValidationError(
+                    'The following required headers not signed: %s'
+                    % (b', '.join(reqset.difference(set(signlist))).decode())
+                )
         else:
             raise RuntimeError('Unknown set_header mode: %s' % mode)
 
@@ -276,7 +284,9 @@ class DevsigHeader:
             at = 0
             for hname, rawval in list(parsed):
                 if hname == shname:
-                    self._headervals.append(hname + b':' + DevsigHeader._dkim_canonicalize_header(rawval))
+                    self._headervals.append(
+                        hname + b':' + DevsigHeader._dkim_canonicalize_header(rawval)
+                    )
                     parsed.pop(at)
                     break
                 at += 1
@@ -335,7 +345,9 @@ class DevsigHeader:
                 pubkey = keyinfo.encode()
             else:
                 pubkey = keyinfo
-            sdigest, (_, _, _, signkey, signtime) = DevsigHeader._validate_openpgp(bdata, pubkey)
+            sdigest, (_, _, _, signkey, signtime) = DevsigHeader._validate_openpgp(
+                bdata, pubkey
+            )
             if sdigest != vdigest:
                 raise ValidationError('Header validation failed')
             return signkey, signtime
@@ -349,7 +361,9 @@ class DevsigHeader:
             bkeyinfo = keyinfo.encode()
         else:
             # This cannot be None for any of the algorithms we support other than openpgp, done above
-            raise RuntimeError('keyinfo must be a string or bytes, not %s' % type(keyinfo).__name__)
+            raise RuntimeError(
+                'keyinfo must be a string or bytes, not %s' % type(keyinfo).__name__
+            )
 
         if algo.startswith('ed25519'):
             sdigest = DevsigHeader._validate_ed25519(bdata, bkeyinfo)
@@ -372,7 +386,9 @@ class DevsigHeader:
 
         return signkey, signtime
 
-    def sign(self, keyinfo: Union[str, bytes], split: bool = True) -> Tuple[bytes, bytes]:
+    def sign(
+        self, keyinfo: Union[str, bytes], split: bool = True
+    ) -> Tuple[bytes, bytes]:
         """Sign the message and generate signature header value.
 
         Args:
@@ -399,7 +415,9 @@ class DevsigHeader:
             skeyinfo = keyinfo
             bkeyinfo = keyinfo.encode()
         else:
-            raise RuntimeError('keyinfo must be a string or bytes, not %s' % type(keyinfo).__name__)
+            raise RuntimeError(
+                'keyinfo must be a string or bytes, not %s' % type(keyinfo).__name__
+            )
 
         hparts = list()
         for fn in self._order:
@@ -474,7 +492,9 @@ class DevsigHeader:
         sshkargs = ['-Y', 'sign', '-n', 'patatt', '-f', keypath]
         ecode, out, err = sshk_run_command(sshkargs, payload)
         if ecode > 0:
-            raise SigningError('Running ssh-keygen failed', errors=err.decode().strip().split('\n'))
+            raise SigningError(
+                'Running ssh-keygen failed', errors=err.decode().strip().split('\n')
+            )
         # Remove the header/footer
         sigdata = b''
         for bline in out.split(b'\n'):
@@ -486,7 +506,9 @@ class DevsigHeader:
             sshkargs = ['-l', '-f', keypath]
             ecode, out, err = sshk_run_command(sshkargs, payload)
             if ecode > 0:
-                raise SigningError('Running ssh-keygen failed', errors=err.decode().split('\n'))
+                raise SigningError(
+                    'Running ssh-keygen failed', errors=err.decode().split('\n')
+                )
             chunks = out.split()
             keyfp = chunks[1]
             KEYCACHE[keypath] = keyfp
@@ -503,17 +525,41 @@ class DevsigHeader:
             spath = os.path.join(td, 'sigdata')
             with open(fpath, 'wb') as fh:
                 chunks = keydata.split()
-                bcont = b'patatter@local namespaces="patatt" ' + chunks[0] + b' ' + chunks[1] + b'\n'
+                bcont = (
+                    b'patatter@local namespaces="patatt" '
+                    + chunks[0]
+                    + b' '
+                    + chunks[1]
+                    + b'\n'
+                )
                 logger.debug('allowed-signers: %s', bcont)
                 fh.write(bcont)
             with open(spath, 'wb') as fh:
-                bcont = b'-----BEGIN SSH SIGNATURE-----\n' + sigdata + b'\n-----END SSH SIGNATURE-----\n'
+                bcont = (
+                    b'-----BEGIN SSH SIGNATURE-----\n'
+                    + sigdata
+                    + b'\n-----END SSH SIGNATURE-----\n'
+                )
                 logger.debug('sigdata: %s', bcont)
                 fh.write(bcont)
-            sshkargs = ['-Y', 'verify', '-n', 'patatt', '-I', 'patatter@local', '-f', fpath, '-s', spath]
+            sshkargs = [
+                '-Y',
+                'verify',
+                '-n',
+                'patatt',
+                '-I',
+                'patatter@local',
+                '-f',
+                fpath,
+                '-s',
+                spath,
+            ]
             ecode, out, err = sshk_run_command(sshkargs, payload)
             if ecode > 0:
-                raise ValidationError('Failed to validate openssh signature', errors=err.decode().split('\n'))
+                raise ValidationError(
+                    'Failed to validate openssh signature',
+                    errors=err.decode().split('\n'),
+                )
 
     @staticmethod
     def _sign_openpgp(payload: bytes, keyid: str) -> Tuple[bytes, bytes]:
@@ -528,7 +574,9 @@ class DevsigHeader:
             gpgargs = ['--with-colons', '--fingerprint', keyid]
             ecode, out, err = gpg_run_command(gpgargs)
             if ecode > 0:
-                raise SigningError('Running gpg failed', errors=err.decode().split('\n'))
+                raise SigningError(
+                    'Running gpg failed', errors=err.decode().split('\n')
+                )
             pkid = None
             keyfp = None
             for line in out.split(b'\n'):
@@ -550,13 +598,21 @@ class DevsigHeader:
         return bdata, keyfp
 
     @staticmethod
-    def _validate_openpgp(sigdata: bytes, pubkey: Optional[bytes]) -> Tuple[bytes, Tuple[bool, bool, bool, str, str]]:
+    def _validate_openpgp(
+        sigdata: bytes, pubkey: Optional[bytes]
+    ) -> Tuple[bytes, Tuple[bool, bool, bool, str, str]]:
         global KEYCACHE
         bsigdata = base64.b64decode(sigdata)
         vrfyargs = ['--verify', '--output', '-', '--status-fd=2']
         if pubkey:
             with tempfile.TemporaryDirectory(suffix='.patatt.gnupg') as td:
-                keyringargs = ['--homedir', td, '--no-default-keyring', '--keyring', 'pub']
+                keyringargs = [
+                    '--homedir',
+                    td,
+                    '--no-default-keyring',
+                    '--keyring',
+                    'pub',
+                ]
                 if pubkey in KEYCACHE:
                     logger.debug('Reusing cached keyring')
                     with open(os.path.join(td, 'pub'), 'wb') as kfh:
@@ -596,10 +652,16 @@ class DevsigHeader:
         signtime = ''
         signkey = ''
 
-        logger.debug('GNUPG status:\n\t%s', status.decode().strip().replace('\n', '\n\t'))
+        logger.debug(
+            'GNUPG status:\n\t%s', status.decode().strip().replace('\n', '\n\t')
+        )
         if re.search(rb'^\[GNUPG:] GOODSIG ([0-9A-F]+)\s+(.*)$', status, flags=re.M):
             good = True
-        if (vs_matches := re.search(rb'^\[GNUPG:] VALIDSIG ([0-9A-F]+) (\d{4}-\d{2}-\d{2}) (\d+)', status, flags=re.M)):
+        if vs_matches := re.search(
+            rb'^\[GNUPG:] VALIDSIG ([0-9A-F]+) (\d{4}-\d{2}-\d{2}) (\d+)',
+            status,
+            flags=re.M,
+        ):
             valid = True
             signkey = vs_matches.groups()[0].decode()
             signtime = vs_matches.groups()[2].decode()
@@ -698,7 +760,9 @@ class PatattMessage:
 
         # Generate a new payload using m and p and canonicalize with \r\n endings,
         # trimming any excess blank lines ("simple" DKIM canonicalization).
-        m, p, i = PatattMessage._get_git_mailinfo(b''.join(self.headers) + self.lf + self.body)
+        m, p, i = PatattMessage._get_git_mailinfo(
+            b''.join(self.headers) + self.lf + self.body
+        )
         self.canon_body = b''
         for line in re.sub(rb'[\r\n]*$', b'', m + p).split(b'\n'):
             self.canon_body += re.sub(rb'[\r\n]*$', b'', line) + b'\r\n'
@@ -718,14 +782,26 @@ class PatattMessage:
                 left, right = header.split(b':', 1)
                 lleft = left.lower()
                 if lleft == b'from':
-                    right = b' ' + idata.get(b'author', b'') + b' <' + idata.get(b'email', b'') + b'>'
+                    right = (
+                        b' '
+                        + idata.get(b'author', b'')
+                        + b' <'
+                        + idata.get(b'email', b'')
+                        + b'>'
+                    )
                 elif lleft == b'subject':
                     right = b' ' + idata.get(b'subject', b'')
                 self.canon_headers.append(left + b':' + right)
             except ValueError:
                 self.canon_headers.append(header)
 
-    def sign(self, algo: str, keyinfo: Union[str, bytes], identity: Optional[str], selector: Optional[str]) -> None:
+    def sign(
+        self,
+        algo: str,
+        keyinfo: Union[str, bytes],
+        identity: Optional[str],
+        selector: Optional[str],
+    ) -> None:
         """Sign the message and add signature headers.
 
         Args:
@@ -751,7 +827,9 @@ class PatattMessage:
         ds.set_field('l', str(len(self.canon_body)))
         if not identity:
             if not self.canon_identity:
-                raise SigningError('No identity provided and no canonical identity available')
+                raise SigningError(
+                    'No identity provided and no canonical identity available'
+                )
             identity = self.canon_identity
         ds.set_field('i', identity)
         if selector:
@@ -766,7 +844,9 @@ class PatattMessage:
             ds.set_field('t', str(int(time.time())))
         hv, pkinfo = ds.sign(keyinfo)
 
-        dshdr = email.header.make_header([(DEVSIG_HDR + b': ' + hv, 'us-ascii')], maxlinelen=78)
+        dshdr = email.header.make_header(
+            [(DEVSIG_HDR + b': ' + hv, 'us-ascii')], maxlinelen=78
+        )
         self.headers.append(dshdr.encode().encode() + self.lf)
 
         # Make informational header about the key used
@@ -781,10 +861,14 @@ class PatattMessage:
         else:
             idata.append(b'pk=%s' % pkinfo)
 
-        dkhdr = email.header.make_header([(DEVKEY_HDR + b': ' + b'; '.join(idata), 'us-ascii')], maxlinelen=78)
+        dkhdr = email.header.make_header(
+            [(DEVKEY_HDR + b': ' + b'; '.join(idata), 'us-ascii')], maxlinelen=78
+        )
         self.headers.append(dkhdr.encode().encode() + self.lf)
 
-    def validate(self, identity: str, pkey: Union[bytes, str, None], trim_body: bool = False) -> Tuple[str, str]:
+    def validate(
+        self, identity: str, pkey: Union[bytes, str, None], trim_body: bool = False
+    ) -> Tuple[str, str]:
         """Validate the signature for a specific identity.
 
         Args:
@@ -863,7 +947,7 @@ class PatattMessage:
                     break
 
                 # is it a wrapped header?
-                if line[0] in ("\x09", "\x20", 0x09, 0x20):
+                if line[0] in ('\x09', '\x20', 0x09, 0x20):
                     if not len(self.headers):
                         raise RuntimeError('Not a valid RFC2822 message')
                     # attach it to the previous header
@@ -950,19 +1034,23 @@ def get_data_dir() -> Path:
     return datadir
 
 
-def _run_command(cmdargs: List[str],
-                 stdin: Optional[bytes] = None,
-                 env: Optional[Dict[str, str]] = None) -> Tuple[int, bytes, bytes]:
+def _run_command(
+    cmdargs: List[str],
+    stdin: Optional[bytes] = None,
+    env: Optional[Dict[str, str]] = None,
+) -> Tuple[int, bytes, bytes]:
     logger.debug('Running %s', ' '.join(cmdargs))
     cp = subprocess.run(cmdargs, input=stdin, env=env, capture_output=True, text=False)
     logger.debug('Completed %s', repr(cp))
     return cp.returncode, cp.stdout, cp.stderr
 
 
-def git_run_command(gitdir: Optional[str],
-                    args: List[str],
-                    stdin: Optional[bytes] = None,
-                    env: Optional[Dict[str, str]] = None) -> Tuple[int, bytes, bytes]:
+def git_run_command(
+    gitdir: Optional[str],
+    args: List[str],
+    stdin: Optional[bytes] = None,
+    env: Optional[Dict[str, str]] = None,
+) -> Tuple[int, bytes, bytes]:
     if gitdir:
         args = ['git', '--git-dir', gitdir, '--no-pager'] + args
     else:
@@ -970,10 +1058,12 @@ def git_run_command(gitdir: Optional[str],
     return _run_command(args, stdin=stdin, env=env)
 
 
-def get_config_from_git(regexp: str,
-                        section: Optional[str] = None,
-                        defaults: Optional[Dict[str, Union[str, List[str]]]] = None,
-                        multivals: Optional[List[str]] = None) -> GitConfigType:
+def get_config_from_git(
+    regexp: str,
+    section: Optional[str] = None,
+    defaults: Optional[Dict[str, Union[str, List[str]]]] = None,
+    multivals: Optional[List[str]] = None,
+) -> GitConfigType:
     if multivals is None:
         multivals = list()
 
@@ -1027,13 +1117,22 @@ def get_config_from_git(regexp: str,
     return gitconfig
 
 
-def gpg_run_command(cmdargs: List[str], stdin: Optional[bytes] = None) -> Tuple[int, bytes, bytes]:
+def gpg_run_command(
+    cmdargs: List[str], stdin: Optional[bytes] = None
+) -> Tuple[int, bytes, bytes]:
     gpgbin, _ = set_bin_paths(None)
-    cmdargs = [gpgbin, '--batch', '--no-auto-key-retrieve', '--no-auto-check-trustdb'] + cmdargs
+    cmdargs = [
+        gpgbin,
+        '--batch',
+        '--no-auto-key-retrieve',
+        '--no-auto-check-trustdb',
+    ] + cmdargs
     return _run_command(cmdargs, stdin)
 
 
-def sshk_run_command(cmdargs: List[str], stdin: Optional[bytes] = None) -> Tuple[int, bytes, bytes]:
+def sshk_run_command(
+    cmdargs: List[str], stdin: Optional[bytes] = None
+) -> Tuple[int, bytes, bytes]:
     _, sshkbin = set_bin_paths(None)
     cmdargs = [sshkbin] + cmdargs
     return _run_command(cmdargs, stdin)
@@ -1079,8 +1178,12 @@ def make_pkey_path(keytype: str, identity: str, selector: str) -> Path:
     domain = chunks[1].lower()
     selector = selector.lower()
     # urlencode all potentially untrusted bits to make sure nobody tries path-based badness
-    return Path(urllib.parse.quote_plus(keytype), urllib.parse.quote_plus(domain),
-                urllib.parse.quote_plus(local), urllib.parse.quote_plus(selector))
+    return Path(
+        urllib.parse.quote_plus(keytype),
+        urllib.parse.quote_plus(domain),
+        urllib.parse.quote_plus(local),
+        urllib.parse.quote_plus(selector),
+    )
 
 
 def make_byhash_path(keytype: str, identity: str, selector: str) -> Path:
@@ -1105,7 +1208,9 @@ def make_byhash_path(keytype: str, identity: str, selector: str) -> Path:
     return Path('by-hash', prefix, remainder)
 
 
-def get_public_key(source: str, keytype: str, identity: str, selector: str) -> Tuple[bytes, str]:
+def get_public_key(
+    source: str, keytype: str, identity: str, selector: str
+) -> Tuple[bytes, str]:
     """Look up a public key from a keyring source.
 
     Searches for the key at the standard path first, then falls back to
@@ -1133,7 +1238,9 @@ def get_public_key(source: str, keytype: str, identity: str, selector: str) -> T
         # split by :
         parts = source.split(':', 4)
         if len(parts) < 4:
-            raise ConfigurationError('Invalid ref, must have at least 3 colons: %s' % source)
+            raise ConfigurationError(
+                'Invalid ref, must have at least 3 colons: %s' % source
+            )
         gitrepo = parts[1]
         gitref = parts[2]
         gitsub = parts[3]
@@ -1170,7 +1277,9 @@ def get_public_key(source: str, keytype: str, identity: str, selector: str) -> T
             # Handle one level of symlinks
             if out.find(b'\n') < 0 < out.find(b'/'):
                 # Check this path as well
-                linktgt = os.path.normpath(os.path.join(os.path.dirname(subpath), out.decode()))
+                linktgt = os.path.normpath(
+                    os.path.join(os.path.dirname(subpath), out.decode())
+                )
                 keysrc = f'{gitref}:{linktgt}'
                 cmdargs = ['show', keysrc]
                 ecode, out, err = git_run_command(gittop, cmdargs)
@@ -1230,6 +1339,7 @@ def get_public_key(source: str, keytype: str, identity: str, selector: str) -> T
 
 def _load_messages(cmdargs: argparse.Namespace) -> Dict[str, bytes]:
     import sys
+
     if len(cmdargs.msgfile):
         # Load all message from the files passed to make sure they all parse correctly
         messages = dict()
@@ -1239,17 +1349,21 @@ def _load_messages(cmdargs: argparse.Namespace) -> Dict[str, bytes]:
     elif not sys.stdin.isatty():
         messages = {'-': sys.stdin.buffer.read()}
     else:
-        logger.critical('E: Pipe a message to sign or pass filenames with individual messages')
+        logger.critical(
+            'E: Pipe a message to sign or pass filenames with individual messages'
+        )
         raise RuntimeError('Nothing to do')
 
     return messages
 
 
-def sign_message(msgdata: bytes,
-                 algo: str,
-                 keyinfo: Union[str, bytes],
-                 identity: Optional[str],
-                 selector: Optional[str]) -> bytes:
+def sign_message(
+    msgdata: bytes,
+    algo: str,
+    keyinfo: Union[str, bytes],
+    identity: Optional[str],
+    selector: Optional[str],
+) -> bytes:
     """Sign an RFC2822 message and return the signed message bytes.
 
     Args:
@@ -1284,7 +1398,9 @@ def set_bin_paths(config: Optional[GitConfigType]) -> Tuple[str, str]:
             _sshkbin = config.get('ssh-keygen-bin')
             assert isinstance(_sshkbin, str), 'ssh-keygen-bin must be a string'
             SSHKBIN = _sshkbin
-        elif (_sshkbin := get_config_from_git(r'gpg\..*', section='ssh').get('program')) is not None:
+        elif (
+            _sshkbin := get_config_from_git(r'gpg\..*', section='ssh').get('program')
+        ) is not None:
             assert isinstance(_sshkbin, str), 'program must be a string'
             SSHKBIN = _sshkbin
         else:
@@ -1302,7 +1418,9 @@ def get_algo_keydata(config: GitConfigType) -> Tuple[str, str]:
     # Do we have this already looked up?
     identity = config.get('identity')
     if not isinstance(identity, str):
-        raise ConfigurationError('Identity must be a string, got %s' % type(identity).__name__)
+        raise ConfigurationError(
+            'Identity must be a string, got %s' % type(identity).__name__
+        )
 
     if identity in KEYCACHE:
         algo, keydata = KEYCACHE[identity]
@@ -1313,7 +1431,11 @@ def get_algo_keydata(config: GitConfigType) -> Tuple[str, str]:
         if user_signingkey:
             gpg_format = get_config_from_git(r'gpg\..*').get('format', 'gpg')
             key_algo = 'openssh' if gpg_format == 'ssh' else 'openpgp'
-            logger.info('N: Using %s key %s defined by user.signingkey', key_algo, user_signingkey)
+            logger.info(
+                'N: Using %s key %s defined by user.signingkey',
+                key_algo,
+                user_signingkey,
+            )
             logger.info('N: Override by setting patatt.signingkey')
             config['signingkey'] = '%s:%s' % (key_algo, user_signingkey)
         else:
@@ -1323,7 +1445,9 @@ def get_algo_keydata(config: GitConfigType) -> Tuple[str, str]:
 
     sk = config.get('signingkey')
     if not isinstance(sk, str):
-        raise ConfigurationError('Signing key must be a string, got %s' % type(sk).__name__)
+        raise ConfigurationError(
+            'Signing key must be a string, got %s' % type(sk).__name__
+        )
     if sk.startswith('ed25519:'):
         algo = 'ed25519'
         identifier = sk[8:]
@@ -1338,7 +1462,7 @@ def get_algo_keydata(config: GitConfigType) -> Tuple[str, str]:
                 keysrc = str(skey)
             else:
                 # finally, try .git/%s.key
-                if (gtdir := get_git_toplevel()):
+                if gtdir := get_git_toplevel():
                     skey = Path(gtdir) / '.git' / f'{identifier}.key'
                     if skey.exists():
                         keysrc = str(skey)
@@ -1397,12 +1521,18 @@ def get_main_config(section: Optional[str] = None) -> GitConfigType:
         csection = 'default'
     if csection in CONFIGCACHE:
         return CONFIGCACHE[csection]
-    config = get_config_from_git(r'patatt\..*', section=section, multivals=['keyringsrc'])
+    config = get_config_from_git(
+        r'patatt\..*', section=section, multivals=['keyringsrc']
+    )
     # Append some extra keyring locations
     if 'keyringsrc' not in config or not isinstance(config['keyringsrc'], list):
         config['keyringsrc'] = list()
-    assert isinstance(config['keyringsrc'], list) # Just to make lint checkers shut up
-    config['keyringsrc'] += ['ref:::.keys', 'ref:::.local-keys', 'ref::refs/meta/keyring:']
+    assert isinstance(config['keyringsrc'], list)  # Just to make lint checkers shut up
+    config['keyringsrc'] += [
+        'ref:::.keys',
+        'ref:::.local-keys',
+        'ref::refs/meta/keyring:',
+    ]
     set_bin_paths(config)
     logger.debug('config: %s', config)
     CONFIGCACHE[csection] = config
@@ -1442,10 +1572,11 @@ def cmd_sign(cmdargs: argparse.Namespace, config: GitConfigType) -> None:
             sys.exit(1)
 
 
-def validate_message(msgdata: bytes,
-                     sources: List[str],
-                     trim_body: bool = False
-                     ) -> List[Tuple[int, Optional[str], Optional[str], Optional[str], Optional[str], List[str]]]:
+def validate_message(
+    msgdata: bytes, sources: List[str], trim_body: bool = False
+) -> List[
+    Tuple[int, Optional[str], Optional[str], Optional[str], Optional[str], List[str]]
+]:
     """Validate all signatures in an RFC2822 message.
 
     Args:
@@ -1459,11 +1590,17 @@ def validate_message(msgdata: bytes,
 
         Result codes: RES_VALID, RES_BADSIG, RES_NOKEY, RES_NOSIG, RES_ERROR
     """
-    attestations: List[Tuple[int, Optional[str], Optional[str], Optional[str], Optional[str], List[str]]] = list()
+    attestations: List[
+        Tuple[
+            int, Optional[str], Optional[str], Optional[str], Optional[str], List[str]
+        ]
+    ] = list()
     pm = PatattMessage(msgdata)
     if not pm.signed:
         logger.debug('message is not signed')
-        attestations.append((RES_NOSIG, None, None, None, None, ['no signatures found']))
+        attestations.append(
+            (RES_NOSIG, None, None, None, None, ['no signatures found'])
+        )
         return attestations
 
     # Find all identities for which we have public keys
@@ -1530,6 +1667,7 @@ def validate_message(msgdata: bytes,
 
 def cmd_validate(cmdargs: argparse.Namespace, config: GitConfigType) -> None:
     import mailbox
+
     if len(cmdargs.msgfile) == 1:
         # Try to open as an mbox file
         try:
@@ -1699,36 +1837,73 @@ def command() -> None:
     parser = argparse.ArgumentParser(
         prog='patatt',
         description='Cryptographically attest patches before sending out',
-        formatter_class=argparse.ArgumentDefaultsHelpFormatter
+        formatter_class=argparse.ArgumentDefaultsHelpFormatter,
+    )
+    parser.add_argument(
+        '-v',
+        '--verbose',
+        action='store_true',
+        default=False,
+        help='Be a bit more verbose',
+    )
+    parser.add_argument(
+        '-d',
+        '--debug',
+        action='store_true',
+        default=False,
+        help='Show debugging output',
+    )
+    parser.add_argument(
+        '-s',
+        '--section',
+        dest='section',
+        default=None,
+        help='Use config section [patatt "sectionname"]',
     )
-    parser.add_argument('-v', '--verbose', action='store_true', default=False,
-                        help='Be a bit more verbose')
-    parser.add_argument('-d', '--debug', action='store_true', default=False,
-                        help='Show debugging output')
-    parser.add_argument('-s', '--section', dest='section', default=None,
-                        help='Use config section [patatt "sectionname"]')
     parser.add_argument('--version', action='version', version=__VERSION__)
 
     subparsers = parser.add_subparsers(help='sub-command help', dest='subcmd')
 
-    sp_sign = subparsers.add_parser('sign', help='Cryptographically attest an RFC2822 message')
-    sp_sign.add_argument('--hook', dest='hookmode', action='store_true', default=False,
-                         help='Git hook mode')
+    sp_sign = subparsers.add_parser(
+        'sign', help='Cryptographically attest an RFC2822 message'
+    )
+    sp_sign.add_argument(
+        '--hook',
+        dest='hookmode',
+        action='store_true',
+        default=False,
+        help='Git hook mode',
+    )
     sp_sign.add_argument('msgfile', nargs='*', help='RFC2822 message files to sign')
     sp_sign.set_defaults(func=cmd_sign)
 
     sp_val = subparsers.add_parser('validate', help='Validate a devsig-signed message')
-    sp_val.add_argument('msgfile', nargs='*', help='Individual signed message files to validate or an mbox')
+    sp_val.add_argument(
+        'msgfile',
+        nargs='*',
+        help='Individual signed message files to validate or an mbox',
+    )
     sp_val.set_defaults(func=cmd_validate)
 
     sp_gen = subparsers.add_parser('genkey', help='Generate a new ed25519 keypair')
-    sp_gen.add_argument('-n', '--keyname', default=None,
-                        help='Name to use for the key, e.g. "workstation", or "default"')
-    sp_gen.add_argument('-f', '--force', action='store_true', default=False,
-                        help='Overwrite any existing keys, if found')
+    sp_gen.add_argument(
+        '-n',
+        '--keyname',
+        default=None,
+        help='Name to use for the key, e.g. "workstation", or "default"',
+    )
+    sp_gen.add_argument(
+        '-f',
+        '--force',
+        action='store_true',
+        default=False,
+        help='Overwrite any existing keys, if found',
+    )
     sp_gen.set_defaults(func=cmd_genkey)
 
-    sp_install = subparsers.add_parser('install-hook', help='Install sendmail-validate hook into the current repo')
+    sp_install = subparsers.add_parser(
+        'install-hook', help='Install sendmail-validate hook into the current repo'
+    )
     sp_install.set_defaults(func=cmd_install_hook)
 
     _args = parser.parse_args()
diff --git a/tests/conftest.py b/tests/conftest.py
index 8bb6064..a2d2124 100644
--- a/tests/conftest.py
+++ b/tests/conftest.py
@@ -18,6 +18,7 @@ Message-ID: <12345@example.com>
 This is a test email body.
 """
 
+
 @pytest.fixture
 def temp_data_dir() -> Generator[str, None, None]:
     """Create a temporary data directory structure for patatt."""
@@ -32,23 +33,26 @@ def temp_data_dir() -> Generator[str, None, None]:
         # Return path to the temp directory
         yield tmpdirname
 
+
 @pytest.fixture
 def devsig_header() -> DevsigHeader:
     """Create a basic DevsigHeader instance."""
     return DevsigHeader()
 
+
 @pytest.fixture
 def patatt_message(sample_email_bytes: bytes) -> PatattMessage:
     """Create a PatattMessage from a sample email."""
     return PatattMessage(sample_email_bytes)
 
+
 @pytest.fixture
 def sample_ed25519_key_pair() -> Dict[str, bytes]:
     """Generate a sample ed25519 key pair for testing."""
     try:
         from nacl.signing import SigningKey
     except ImportError:
-        pytest.skip("PyNaCl not installed, skipping ed25519 tests")
+        pytest.skip('PyNaCl not installed, skipping ed25519 tests')
 
     # Generate a key pair
     private_key = SigningKey.generate()
@@ -57,5 +61,5 @@ def sample_ed25519_key_pair() -> Dict[str, bytes]:
     # Return base64 encoded keys
     return {
         'private': base64.b64encode(bytes(private_key)),
-        'public': base64.b64encode(public_key.encode())
-    }
\ No newline at end of file
+        'public': base64.b64encode(public_key.encode()),
+    }
diff --git a/tests/test_validation.py b/tests/test_validation.py
index d51be81..1477fbe 100644
--- a/tests/test_validation.py
+++ b/tests/test_validation.py
@@ -6,11 +6,9 @@ import pytest
 from patatt import RES_VALID, validate_message
 
 
-@pytest.mark.parametrize("sample_file", [
-    "ed25519-signed.txt",
-    "pgp-signed.txt",
-    "openssh-signed.txt"
-])
+@pytest.mark.parametrize(
+    'sample_file', ['ed25519-signed.txt', 'pgp-signed.txt', 'openssh-signed.txt']
+)
 def test_validate(sample_file: str) -> None:
     """Test validation of an ed25519 signed message from samples directory."""
     # Path to the sample file
@@ -29,14 +27,14 @@ def test_validate(sample_file: str) -> None:
     results = validate_message(signed_data, [sources_path])
 
     # Check validation results
-    assert results, "Validation should return results"
+    assert results, 'Validation should return results'
 
     # At least one valid signature should be found
     valid_signatures = [r for r in results if r[0] == RES_VALID]
-    assert valid_signatures, "Should find at least one valid signature"
+    assert valid_signatures, 'Should find at least one valid signature'
 
     # Print validation details for debugging
-    print(f"Found {len(valid_signatures)} valid signatures:")
+    print(f'Found {len(valid_signatures)} valid signatures:')
     for result in valid_signatures:
         status, algo, keytype, identity, selector, errors = result
-        print(f"  - {keytype} signature by {identity} ({selector})")
+        print(f'  - {keytype} signature by {identity} ({selector})')
diff --git a/tests/unit/test_byhash.py b/tests/unit/test_byhash.py
index c3fe4d2..e90ee82 100644
--- a/tests/unit/test_byhash.py
+++ b/tests/unit/test_byhash.py
@@ -8,7 +8,6 @@ from patatt import get_public_key, make_byhash_path, make_pkey_path
 
 
 class TestMakeByhashPath:
-
     def test_basic_hash_computation(self) -> None:
         """Test that make_byhash_path computes the correct hash."""
         keytype = 'openssh'
@@ -42,7 +41,6 @@ class TestMakeByhashPath:
 
 
 class TestGetPublicKeyByHash:
-
     def test_filesystem_byhash_lookup(self) -> None:
         """Test that get_public_key finds a key via by-hash fallback."""
         with tempfile.TemporaryDirectory() as tmpdir:
diff --git a/tests/unit/test_devsig_header.py b/tests/unit/test_devsig_header.py
index 547593d..7b6e461 100644
--- a/tests/unit/test_devsig_header.py
+++ b/tests/unit/test_devsig_header.py
@@ -8,7 +8,6 @@ from patatt import DevsigHeader
 
 
 class TestDevsigHeader:
-
     def test_initialization(self) -> None:
         """Test that DevsigHeader initializes correctly."""
         header = DevsigHeader()
@@ -17,7 +16,9 @@ class TestDevsigHeader:
 
     def test_from_bytes(self) -> None:
         """Test parsing a header from bytes."""
-        header_bytes = b'v=1; a=ed25519-sha256; t=1623456789; i=test@example.com; bh=abcd1234'
+        header_bytes = (
+            b'v=1; a=ed25519-sha256; t=1623456789; i=test@example.com; bh=abcd1234'
+        )
         header = DevsigHeader(header_bytes)
 
         assert header.get_field_as_str('v') == '1'
@@ -41,7 +42,7 @@ class TestDevsigHeader:
     def test_set_body(self) -> None:
         """Test setting the body and calculating the body hash."""
         header = DevsigHeader()
-        body = b"This is a test body"
+        body = b'This is a test body'
 
         header.set_body(body)
 
@@ -55,7 +56,7 @@ class TestDevsigHeader:
     def test_set_body_with_maxlen(self) -> None:
         """Test setting the body with a maxlen parameter."""
         header = DevsigHeader()
-        body = b"This is a test body"
+        body = b'This is a test body'
         maxlen = 10
 
         header.set_body(body, maxlen=maxlen)
@@ -95,17 +96,17 @@ class TestDevsigHeader:
         """Test that sanity_check fails if required fields are not set."""
         header = DevsigHeader()
 
-        with pytest.raises(RuntimeError, match="Must set \"a\" field first"):
+        with pytest.raises(RuntimeError, match='Must set "a" field first'):
             header.sanity_check()
 
         header.set_field('a', 'ed25519-sha256')
 
-        with pytest.raises(RuntimeError, match="Must use set_body first"):
+        with pytest.raises(RuntimeError, match='Must use set_body first'):
             header.sanity_check()
 
-        header.set_body(b"Test body")
+        header.set_body(b'Test body')
 
-        with pytest.raises(RuntimeError, match="Must use set_headers first"):
+        with pytest.raises(RuntimeError, match='Must use set_headers first'):
             header.sanity_check()
 
     # @pytest.mark.skipif(True, reason="Requires actual ed25519 keys")
diff --git a/tests/unit/test_get_algo_keydata.py b/tests/unit/test_get_algo_keydata.py
index 545f051..c4ccc8d 100644
--- a/tests/unit/test_get_algo_keydata.py
+++ b/tests/unit/test_get_algo_keydata.py
@@ -41,7 +41,10 @@ class TestGetAlgoKeydataSSHSigningKey:
     def test_ssh_format_uses_openssh(self, mock_gcfg: MagicMock) -> None:
         """When gpg.format=ssh, user.signingkey should get the openssh: prefix."""
         mock_gcfg.side_effect = _make_mock_get_config(
-            usercfg={'email': 'test@example.com', 'signingkey': '/home/user/.ssh/id_ed25519.pub'},
+            usercfg={
+                'email': 'test@example.com',
+                'signingkey': '/home/user/.ssh/id_ed25519.pub',
+            },
             gpgcfg={'format': 'ssh'},
         )
         config: GitConfigType = {'identity': 'test@example.com'}
@@ -91,7 +94,9 @@ class TestGetAlgoKeydataSSHSigningKey:
             get_algo_keydata(config)
 
     @patch('patatt.get_config_from_git')
-    def test_patatt_signingkey_skips_user_signingkey(self, mock_gcfg: MagicMock) -> None:
+    def test_patatt_signingkey_skips_user_signingkey(
+        self, mock_gcfg: MagicMock
+    ) -> None:
         """When patatt.signingkey is already set, user.signingkey is not consulted."""
         mock_gcfg.side_effect = _make_mock_get_config(
             usercfg={'email': 'test@example.com', 'signingkey': 'SHOULD_NOT_BE_USED'},
diff --git a/tests/unit/test_patatt_message.py b/tests/unit/test_patatt_message.py
index 58338f4..17d4a30 100644
--- a/tests/unit/test_patatt_message.py
+++ b/tests/unit/test_patatt_message.py
@@ -6,7 +6,6 @@ from patatt import PatattMessage
 
 
 class TestPatattMessage:
-
     def test_initialization(self, sample_email_bytes: bytes) -> None:
         """Test initialization of PatattMessage with sample email."""
         message = PatattMessage(sample_email_bytes)
@@ -25,7 +24,7 @@ This is a test body.
         message = PatattMessage(email_bytes)
 
         assert len(message.headers) == 2
-        assert message.body == b"This is a test body.\n"
+        assert message.body == b'This is a test body.\n'
 
     def test_as_bytes(self, sample_email_bytes: bytes) -> None:
         """Test converting message back to bytes."""
@@ -44,17 +43,22 @@ This is a test body.
         assert isinstance(output, str)
         assert output == sample_email_bytes.decode()
 
-    def test_git_canonicalize(self, monkeypatch: pytest.MonkeyPatch, sample_email_bytes: bytes) -> None:
+    def test_git_canonicalize(
+        self, monkeypatch: pytest.MonkeyPatch, sample_email_bytes: bytes
+    ) -> None:
         """Test git canonicalization of message."""
+
         # Mock _get_git_mailinfo to avoid actual git command execution
         def mock_get_git_mailinfo(payload: bytes) -> Tuple[bytes, bytes, bytes]:
             # Return mock metadata, patch, and info
-            metadata = b"Author: Test User\nEmail: test@example.com\nSubject: Test email\n"
-            patch = b"This is a test body.\n"
-            info = b"email: test@example.com\nauthor: Test User\nsubject: Test email\n"
+            metadata = (
+                b'Author: Test User\nEmail: test@example.com\nSubject: Test email\n'
+            )
+            patch = b'This is a test body.\n'
+            info = b'email: test@example.com\nauthor: Test User\nsubject: Test email\n'
             return metadata, patch, info
 
-        monkeypatch.setattr(PatattMessage, "_get_git_mailinfo", mock_get_git_mailinfo)
+        monkeypatch.setattr(PatattMessage, '_get_git_mailinfo', mock_get_git_mailinfo)
 
         message = PatattMessage(sample_email_bytes)
         message.git_canonicalize()
@@ -62,7 +66,7 @@ This is a test body.
         # Check that the message was canonicalized
         assert message.canon_body is not None
         assert message.canon_headers is not None
-        assert message.canon_identity == "test@example.com"
+        assert message.canon_identity == 'test@example.com'
 
     # @pytest.mark.skipif(True, reason="Requires actual signing setup")
     # def test_sign(self) -> None:

-- 
2.53.0

