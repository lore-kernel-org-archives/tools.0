Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E8732B10F
	for <tools@linux.kernel.org>; Fri, 18 Sep 2026 22:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789769021; cv=none; b=D3iQPbp/i52RO1w1PsWhB7tLhbt5oj2vZV20j/hoizNikTQXc9wBRR3jrcxPx73BuAX/irjMCJPBGzcgM9SYgEOmAZ9gU3IDYOO2wXnPxVAjetBZkBBzRDwegdW3RoiKbrRogYixblC9gDOFQioWnQQDwElmGXkMOH8HYAHCf58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789769021; c=relaxed/simple;
	bh=xEt5VewFhKgPXwPws7nvscozOFg9gO17VDrOTVSxafs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hYRr1/oopmix59ZFUEBtVJyQDOgl24TZWHYtUjSu2b0q9kY1cqc3KZAZTEWTxKc7CODugqAEmlxGTaKVfgWpaf6UgtdLp9K6xVle8VJNecaDVMIkhJBR28v2pFpiCUmglAlxqxD4w9YXJER5kt8ocpMoQ+pgZ9343UOD7oudacw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gUUTfGac; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gUUTfGac"
Received: by smtp.kernel.org (Postfix)
	id 0A06D1F000FF; Fri, 18 Sep 2026 22:03:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 435951F00899;
	Fri, 18 Sep 2026 22:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789769015;
	bh=A2qJCcIWcjYirIRpOFGCUM6IulUmxuEhnqqco/05WFs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=gUUTfGac1hmX9YT7SC52vNqz5n+4pf5WImBYNEGBuneyubkA4/XGiNqJNvZokJJhS
	 OSRH6ndGJ330Xp0BoUOJYKmPWVgOnlejioTgbhL4gZHrzwqkJaJc/oa7eDQ96OqnhN
	 IsxzsHbQzJxslqLrRJeXVrKSZnFXXJaOJ7i77apH4ghNZ8uL8PisJU3Z8OgsBBpRHG
	 G8JounqigoOLL0ocgcKTP3aamTZ8xEOpjbdhq28elyY202AxFNijBNjZYls+Q4p6X2
	 aPWBg+iimHbsVCDjjjaQnx/VvI62tjDXTzvUBH31aZHoyDe44KaoebvGfd0Wttq9mN
	 aRStUQkHV5kJA==
From: Tamir Duberstein <tamird@kernel.org>
Date: Fri, 18 Sep 2026 18:03:21 -0400
Subject: [PATCH ezgb v2 1/3] Narrow JSON types and type test doubles
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-stronger-type-checking-v2-1-3ddc31ba2616@kernel.org>
References: <20260918-stronger-type-checking-v2-0-3ddc31ba2616@kernel.org>
In-Reply-To: <20260918-stronger-type-checking-v2-0-3ddc31ba2616@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=102360; i=tamird@kernel.org;
 h=from:subject:message-id; bh=xEt5VewFhKgPXwPws7nvscozOFg9gO17VDrOTVSxafs=;
 b=kA0DAAoW0EwOJRfXEpcByyZiAGqttTGhOnTp4kCkpLWKMA1e7aYpbS88PV6V6yORk9oVmBW6C
 IiRBAAWCgA5FiEEYRXCvWdl27wdae7H0EwOJRfXEpcFAmqttTEbFIAAAAAABAAObWFudTIsMi41
 KzEuMTIsMCwzAAoJENBMDiUX1xKXHncBANMLg25SkoBN281t+9dvKD0WXYDWHBs0+2WScJKVa2d
 DAP955TXKl5KfU4DrZ6QP+GQc6wP2iC5ijsudNYcQnFtGCQ==
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

Describe decoded JSON with mutually recursive object and value aliases,
and narrow operation values before using them. Replace the untyped reader
handle with Repository and narrow git objects to their expected classes.
This supplies the types needed to remove the blanket Pyright exemptions.

Use a typed BugWriter test double instead of attaching private state and
replacing methods at runtime. Preserve nullable git-bug arrays and model
null label arrays in the existing test fixtures.

Raise the Python minimum to 3.10 for TypeGuard and align the interpreter
matrix and installation documentation. Declare typing-extensions for the
test double's override decorator on Python 3.10 and 3.11, and update the
lockfile for the supported interpreters.

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
Assisted-by: LLM
---
 CONTRIBUTING.md           |   2 +-
 README.md                 |   2 +-
 ci-matrix.sh              |   4 +-
 docs/installation.rst     |   2 +-
 pyproject.toml            |   3 +-
 src/ezgb/__init__.py      |   9 +-
 src/ezgb/_reader.py       | 150 ++++++++++++++++-----
 src/ezgb/_types.py        |  17 +++
 tests/conftest.py         |  89 ++++++-------
 tests/test_ezgb.py        |  42 ++++--
 tests/test_integration.py |  21 +--
 uv.lock                   | 328 ++++------------------------------------------
 12 files changed, 257 insertions(+), 412 deletions(-)

diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
index fb21248..ac70676 100644
--- a/CONTRIBUTING.md
+++ b/CONTRIBUTING.md
@@ -26,7 +26,7 @@ contributor guide has a good overview:
 
 ## Coding style
 
-- Python 3.9+, `from __future__ import annotations` in every module.
+- Python 3.10+, `from __future__ import annotations` in every module.
 - `%`-style string formatting to match the existing code.
 - Run `ruff check` and `mypy --strict` before submitting.
 
diff --git a/README.md b/README.md
index ce65d34..3ee811e 100644
--- a/README.md
+++ b/README.md
@@ -35,7 +35,7 @@ repo.add_comment(bug.id, 'I can reproduce this on Firefox 130.')
 
 ## Requirements
 
-- Python 3.9 or later
+- Python 3.10 or later
 - pygit2 (libgit2 Python bindings)
 - `git-bug` v0.10+ on your `$PATH` (needed for write operations and
   fast cached listing)
diff --git a/ci-matrix.sh b/ci-matrix.sh
index f698b63..e004dc2 100755
--- a/ci-matrix.sh
+++ b/ci-matrix.sh
@@ -11,9 +11,9 @@ set -eu
 # Missing interpreters are pulled automatically from uv's managed Python
 # cache (python-build-standalone), so no system packages or sudo are needed.
 #
-# Override the version list: PYTHONS="3.9 3.14" ./ci-matrix.sh
+# Override the version list: PYTHONS="3.10 3.14" ./ci-matrix.sh
 
-PYTHONS="${PYTHONS:-3.9 3.10 3.11 3.12 3.13 3.14}"
+PYTHONS="${PYTHONS:-3.10 3.11 3.12 3.13 3.14}"
 
 # Install any requested interpreters that are missing. This is an explicit
 # step because a dev may have set UV_PYTHON_DOWNLOADS=manual globally to
diff --git a/docs/installation.rst b/docs/installation.rst
index e62bf40..55fa7b3 100644
--- a/docs/installation.rst
+++ b/docs/installation.rst
@@ -11,7 +11,7 @@ Python library
 Requirements
 ^^^^^^^^^^^^
 
-- **Python 3.9** or later.
+- **Python 3.10** or later.
 - **pygit2** -- Python bindings for libgit2 (``pip install pygit2``).
 - **git-bug** (v0.10 or later) must be on your ``$PATH`` if you want to
   create or modify bugs, or to use the fast CLI-cache listing path.
diff --git a/pyproject.toml b/pyproject.toml
index 063e67a..3f2ddb9 100644
--- a/pyproject.toml
+++ b/pyproject.toml
@@ -7,7 +7,7 @@ name = 'ezgb'
 version = '0.2.0'
 description = 'A standalone Python library for working with git-bug repositories'
 readme = 'README.md'
-requires-python = '>=3.9'
+requires-python = '>=3.10'
 dependencies = ['pygit2']
 license = 'GPL-2.0-or-later'
 license-files = ['COPYING']
@@ -30,6 +30,7 @@ dev = [
     "pytest",
     "ruff",
     "ty",
+    "typing-extensions>=4.4",
 ]
 
 [project.urls]
diff --git a/src/ezgb/__init__.py b/src/ezgb/__init__.py
index 31867fd..eb65cfc 100644
--- a/src/ezgb/__init__.py
+++ b/src/ezgb/__init__.py
@@ -24,6 +24,7 @@ from ezgb._models import (
     UnsupportedFormatError,
 )
 from ezgb._reader import BugReader
+from ezgb._types import JsonValue
 from ezgb._writer import BugWriter
 
 __all__ = [
@@ -179,11 +180,13 @@ class GitBugRepo:
         if ecode != 0 or not out.strip():
             return None
         try:
-            raw_bugs: list[dict[str, object]] = json.loads(out)
+            raw_bugs: JsonValue = json.loads(out)
         except json.JSONDecodeError:
             return None
+        assert isinstance(raw_bugs, list)
         results: list[BugSummary] = []
         for raw in raw_bugs:
+            assert isinstance(raw, dict)
             bid = str(raw.get('id', ''))
             if not bid:
                 continue
@@ -275,11 +278,13 @@ class GitBugRepo:
         if ecode != 0:
             return []
         try:
-            raw_bugs: list[dict[str, object]] = json.loads(out)
+            raw_bugs: JsonValue = json.loads(out)
         except json.JSONDecodeError:
             return []
+        assert isinstance(raw_bugs, list)
         results: list[Bug] = []
         for raw in raw_bugs:
+            assert isinstance(raw, dict)
             bid = str(raw.get('id', ''))
             if not bid:
                 continue
diff --git a/src/ezgb/_reader.py b/src/ezgb/_reader.py
index cfd7528..fe918ec 100644
--- a/src/ezgb/_reader.py
+++ b/src/ezgb/_reader.py
@@ -11,7 +11,7 @@ import json
 import logging
 import os
 from datetime import datetime, timezone
-from typing import Any
+from typing import TypeGuard, TypeVar
 
 import pygit2
 
@@ -36,12 +36,25 @@ from ezgb._models import (
     Status,
     UnsupportedFormatError,
 )
+from ezgb._types import JsonObject, JsonValue
 
 logger = logging.getLogger('ezgb')
 
 # Length of a full git-bug entity ID (SHA-256 hex)
 _ID_LENGTH = 64
 
+_K = TypeVar('_K')
+_T = TypeVar('_T')
+_U = TypeVar('_U')
+
+
+def _is_list(value: list[_T], item_ty: type[_U]) -> TypeGuard[list[_U]]:
+    return all(isinstance(item, item_ty) for item in value)
+
+
+def _is_dict_values(value: dict[_K, _T], value_ty: type[_U]) -> TypeGuard[dict[_K, _U]]:
+    return all(isinstance(value, value_ty) for value in value.values())
+
 
 def _combine_ids(primary: str, secondary: str) -> str:
     """Interleave primary and secondary IDs into a CombinedId.
@@ -74,7 +87,7 @@ class BugReader:
         gitdir = repo_path
         if os.path.isdir(os.path.join(repo_path, '.git')):
             gitdir = os.path.join(repo_path, '.git')
-        self._pygit: Any = pygit2.Repository(gitdir)
+        self._pygit: pygit2.Repository = pygit2.Repository(gitdir)
         self._bug_cache: dict[str, Bug] = {}
         self._summary_cache: dict[str, BugSummary] = {}
         self._identity_cache: dict[str, Identity] = {}
@@ -88,7 +101,7 @@ class BugReader:
             obj = self._pygit.get(blob_hash)
         except (ValueError, KeyError):
             obj = None
-        if obj is None or obj.type != pygit2.GIT_OBJECT_BLOB:
+        if obj is None or not isinstance(obj, pygit2.Blob):
             raise BugNotFoundError('failed to read blob %s' % blob_hash)
         result: str = obj.data.decode(errors='replace')
         return result
@@ -99,7 +112,7 @@ class BugReader:
             obj = self._pygit.get(blob_hash)
         except (ValueError, KeyError):
             obj = None
-        if obj is None or obj.type != pygit2.GIT_OBJECT_BLOB:
+        if obj is None or not isinstance(obj, pygit2.Blob):
             raise BugNotFoundError('failed to read blob %s' % blob_hash)
         return bytes(obj.data)
 
@@ -229,7 +242,7 @@ class BugReader:
     def _get_op_packs(
         self,
         bid: str,
-    ) -> tuple[list[dict[str, Any]], list[str]]:
+    ) -> tuple[list[JsonObject], list[str]]:
         """Walk the commit chain for a bug and return operation packs
         (oldest first) together with the raw blob strings.
 
@@ -248,12 +261,12 @@ class BugReader:
         if ref is not None:
             tip = ref.peel(pygit2.Commit)
             self._check_format_version_tree(tip.tree, 'version-', SUPPORTED_BUG_FORMAT)
-        packs: list[dict[str, Any]] = []
+        packs: list[JsonObject] = []
         raw_blobs: list[str] = []
         for _commit, blob_hash in entries:
             raw = self._cat_blob(blob_hash)
             try:
-                pack: dict[str, Any] = json.loads(raw)
+                pack: JsonValue = json.loads(raw)
             except json.JSONDecodeError:
                 logger.warning(
                     'failed to parse ops blob %s for bug %s',
@@ -261,6 +274,7 @@ class BugReader:
                     bid,
                 )
                 continue
+            assert isinstance(pack, dict)
             packs.append(pack)
             raw_blobs.append(raw)
         return packs, raw_blobs
@@ -298,25 +312,36 @@ class BugReader:
 
         version_blob = tip.tree['version']
         try:
-            raw = self._pygit[version_blob.id].data.decode(errors='replace')
-            data: dict[str, Any] = json.loads(raw)
+            blob = self._pygit[version_blob.id]
+            assert isinstance(blob, pygit2.Blob)
+            raw = blob.data.decode(errors='replace')
+            data: JsonValue = json.loads(raw)
         except (json.JSONDecodeError, KeyError):
             self._identity_cache[identity_id] = fallback
             return fallback
+        assert isinstance(data, dict)
 
         # Validate format version
         fmt_version = data.get('version')
+        if fmt_version is not None:
+            assert isinstance(fmt_version, int)
         if fmt_version is not None and fmt_version != SUPPORTED_IDENTITY_FORMAT:
             raise UnsupportedFormatError(
                 'unsupported identity format: %d (expected %d)'
                 % (fmt_version, SUPPORTED_IDENTITY_FORMAT)
             )
 
+        name = data.get('name', identity_id)
+        email = data.get('email', identity_id)
+        login = data.get('login', '')
+        assert isinstance(name, str)
+        assert isinstance(email, str)
+        assert isinstance(login, str)
         identity = Identity(
             id=identity_id,
-            name=data.get('name', identity_id),
-            email=data.get('email', identity_id),
-            login=data.get('login', ''),
+            name=name,
+            email=email,
+            login=login,
         )
         self._identity_cache[identity_id] = identity
         return identity
@@ -357,12 +382,15 @@ class BugReader:
         """
         decoder = json.JSONDecoder()
         try:
+            pack: JsonValue
             pack, _ = decoder.raw_decode(blob_json)
         except json.JSONDecodeError:
             return []
+        assert isinstance(pack, dict)
         raw_ops = pack.get('ops')
         if not raw_ops:
             return []
+        assert isinstance(raw_ops, list)
         # Walk forward through the string to slice each op.
         # Find the start of the ops array value.
         idx = blob_json.find('"ops"')
@@ -373,7 +401,8 @@ class BugReader:
             # we need to step past commas between elements.
             while blob_json[pos] in ' \t\n\r,':
                 pos += 1
-            _, end_pos = decoder.raw_decode(blob_json, pos)
+            _decoded_op: JsonValue
+            _decoded_op, end_pos = decoder.raw_decode(blob_json, pos)
             ops.append(blob_json[pos:end_pos])
             pos = end_pos
         return ops
@@ -406,7 +435,7 @@ class BugReader:
     def build_bug(
         self,
         bid: str,
-        packs: list[dict[str, Any]] | None = None,
+        packs: list[JsonObject] | None = None,
         raw_blobs: list[str] | None = None,
     ) -> Bug:
         """Reconstruct a bug snapshot by replaying operation packs.
@@ -441,24 +470,36 @@ class BugReader:
         op_hash_map: dict[str, Comment] = {}
 
         for pack_idx, pack in enumerate(packs):
-            author_id = pack.get('author', {}).get('id', '')
+            author_value = pack.get('author', {})
+            assert isinstance(author_value, dict)
+            author_id = author_value.get('id', '')
+            assert isinstance(author_id, str)
             raw_ops = (
                 raw_ops_per_pack[pack_idx] if pack_idx < len(raw_ops_per_pack) else []
             )
-            for op_idx, op in enumerate(pack.get('ops', [])):
+            ops = pack.get('ops', [])
+            assert isinstance(ops, list)
+            for op_idx, op in enumerate(ops):
+                assert isinstance(op, dict)
                 op_type = op.get('type', 0)
+                assert isinstance(op_type, int)
                 timestamp = op.get('timestamp', 0)
+                assert isinstance(timestamp, int)
                 raw_json = raw_ops[op_idx] if op_idx < len(raw_ops) else ''
                 op_id = self._op_hash(raw_json) if raw_json else ''
 
                 if op_type == OP_CREATE:
-                    title = op.get('title', '')
+                    if (op_title := op.get('title')) is not None:
+                        assert isinstance(op_title, str)
+                        title = op_title
                     author = self.resolve_identity(author_id)
                     creator = author
                     created_at = self._format_timestamp(timestamp)
-                    message = op.get('message', '')
-                    if message:
+                    if message := op.get('message'):
+                        assert isinstance(message, str)
                         files = op.get('files') or []
+                        assert isinstance(files, list)
+                        assert _is_list(files, str)
                         combined_id = _combine_ids(bid, op_id)
                         cmt = Comment(
                             id=combined_id,
@@ -473,15 +514,22 @@ class BugReader:
                         comment_count += 1
                     # Collect operation-level metadata
                     op_meta = op.get('metadata')
-                    if op_meta:
+                    if op_meta is not None:
+                        assert isinstance(op_meta, dict)
+                        assert _is_dict_values(op_meta, str)
                         metadata.update(op_meta)
 
                 elif op_type == OP_SET_TITLE:
-                    title = op.get('title', title)
+                    if (op_title := op.get('title')) is not None:
+                        assert isinstance(op_title, str)
+                        title = op_title
 
                 elif op_type == OP_ADD_COMMENT:
                     message = op.get('message', '')
+                    assert isinstance(message, str)
                     files = op.get('files') or []
+                    assert isinstance(files, list)
+                    assert _is_list(files, str)
                     op_author = self.resolve_identity(author_id)
                     combined_id = _combine_ids(bid, op_id)
                     cmt = Comment(
@@ -498,27 +546,40 @@ class BugReader:
 
                 elif op_type == OP_SET_STATUS:
                     status_val = op.get('status', STATUS_OPEN)
+                    assert isinstance(status_val, int)
                     is_open = status_val == STATUS_OPEN
 
                 elif op_type == OP_LABEL_CHANGE:
-                    for lbl in op.get('added') or []:
+                    added = op.get('added') or []
+                    assert isinstance(added, list)
+                    for lbl in added:
+                        assert isinstance(lbl, str)
                         labels.add(lbl)
-                    for lbl in op.get('removed') or []:
+                    removed = op.get('removed') or []
+                    assert isinstance(removed, list)
+                    for lbl in removed:
+                        assert isinstance(lbl, str)
                         labels.discard(lbl)
 
                 elif op_type == OP_EDIT_COMMENT:
                     target = op.get('target', '')
+                    assert isinstance(target, str)
                     new_message = op.get('message', '')
+                    assert isinstance(new_message, str)
                     matched = op_hash_map.get(target)
                     if matched is not None:
                         matched.text = new_message
                         new_files = op.get('files') or []
+                        assert isinstance(new_files, list)
+                        assert _is_list(new_files, str)
                         if new_files:
                             matched.attachment_ids = list(new_files)
 
                 elif op_type == OP_SET_METADATA:
                     new_meta = op.get('new_metadata')
-                    if new_meta:
+                    if new_meta is not None:
+                        assert isinstance(new_meta, dict)
+                        assert _is_dict_values(new_meta, str)
                         metadata.update(new_meta)
 
                 elif op_type == OP_NOOP:
@@ -546,7 +607,7 @@ class BugReader:
     def build_bug_summary(
         self,
         bid: str,
-        packs: list[dict[str, Any]] | None = None,
+        packs: list[JsonObject] | None = None,
     ) -> BugSummary:
         """Build a lightweight bug summary by replaying operation packs.
 
@@ -573,36 +634,55 @@ class BugReader:
         latest_ts = 0
 
         for pack in packs:
-            author_id = pack.get('author', {}).get('id', '')
-            for op in pack.get('ops', []):
+            author_value = pack.get('author', {})
+            assert isinstance(author_value, dict)
+            author_id = author_value.get('id', '')
+            assert isinstance(author_id, str)
+            ops = pack.get('ops', [])
+            assert isinstance(ops, list)
+            for op in ops:
+                assert isinstance(op, dict)
                 op_type = op.get('type', 0)
+                assert isinstance(op_type, int)
                 ts = op.get('timestamp', 0)
                 if isinstance(ts, int) and ts > latest_ts:
                     latest_ts = ts
 
                 if op_type == OP_CREATE:
-                    title = op.get('title', '')
+                    if (op_title := op.get('title')) is not None:
+                        assert isinstance(op_title, str)
+                        title = op_title
                     creator_id = author_id
-                    created_at = self._format_timestamp(
-                        op.get('timestamp', 0),
-                    )
-                    if op.get('message', ''):
+                    timestamp = op.get('timestamp', 0)
+                    assert isinstance(timestamp, int)
+                    created_at = self._format_timestamp(timestamp)
+                    if message := op.get('message'):
+                        assert isinstance(message, str)
                         comment_count += 1
 
                 elif op_type == OP_SET_TITLE:
-                    title = op.get('title', title)
+                    if (op_title := op.get('title')) is not None:
+                        assert isinstance(op_title, str)
+                        title = op_title
 
                 elif op_type == OP_ADD_COMMENT:
                     comment_count += 1
 
                 elif op_type == OP_SET_STATUS:
                     status_val = op.get('status', STATUS_OPEN)
+                    assert isinstance(status_val, int)
                     is_open = status_val == STATUS_OPEN
 
                 elif op_type == OP_LABEL_CHANGE:
-                    for lbl in op.get('added') or []:
+                    added = op.get('added') or []
+                    assert isinstance(added, list)
+                    for lbl in added:
+                        assert isinstance(lbl, str)
                         labels.add(lbl)
-                    for lbl in op.get('removed') or []:
+                    removed = op.get('removed') or []
+                    assert isinstance(removed, list)
+                    for lbl in removed:
+                        assert isinstance(lbl, str)
                         labels.discard(lbl)
 
         if created_at is None:
diff --git a/src/ezgb/_types.py b/src/ezgb/_types.py
new file mode 100644
index 0000000..d36bfca
--- /dev/null
+++ b/src/ezgb/_types.py
@@ -0,0 +1,17 @@
+"""Internal type aliases."""
+
+from __future__ import annotations
+
+from typing import Union
+
+JsonObject = dict[str, 'JsonValue']
+
+JsonValue = Union[
+    None,
+    bool,
+    int,
+    float,
+    str,
+    list['JsonValue'],
+    JsonObject,
+]
diff --git a/tests/conftest.py b/tests/conftest.py
index 932274b..32f7c06 100644
--- a/tests/conftest.py
+++ b/tests/conftest.py
@@ -7,15 +7,14 @@ the BugReader can read them without subprocess mocking.
 from __future__ import annotations
 
 import json
-from collections.abc import Iterator
 from pathlib import Path
-from typing import Any
-from unittest.mock import patch
 
 import pygit2
 import pytest
+from typing_extensions import override
 
 from ezgb._reader import BugReader
+from ezgb._types import JsonObject
 from ezgb._writer import BugWriter
 
 # -- Constants ---------------------------------------------------------------
@@ -27,8 +26,7 @@ BUG_ID = 'c' * 64
 # Signature used for all test commits
 _SIG = pygit2.Signature('Test', 'test@test.com')
 
-# Type alias for operation dictionaries
-Op = dict[str, Any]
+CliResult = tuple[int, str, str]
 
 
 # -- Test data factories -----------------------------------------------------
@@ -47,7 +45,7 @@ def make_identity_version(name: str, email: str) -> str:
     )
 
 
-def make_op_pack(author_id: str, ops: list[Op]) -> str:
+def make_op_pack(author_id: str, ops: list[JsonObject]) -> str:
     """Build a JSON operation pack with author and ops array."""
     return json.dumps(
         {
@@ -57,7 +55,7 @@ def make_op_pack(author_id: str, ops: list[Op]) -> str:
     )
 
 
-def make_create_op(title: str, message: str, timestamp: int = 1700000000) -> Op:
+def make_create_op(title: str, message: str, timestamp: int = 1700000000) -> JsonObject:
     """Build an OP_CREATE (type 1) operation."""
     return {
         'type': 1,
@@ -68,7 +66,7 @@ def make_create_op(title: str, message: str, timestamp: int = 1700000000) -> Op:
     }
 
 
-def make_comment_op(message: str, timestamp: int = 1700001000) -> Op:
+def make_comment_op(message: str, timestamp: int = 1700001000) -> JsonObject:
     """Build an OP_ADD_COMMENT (type 3) operation."""
     return {
         'type': 3,
@@ -78,17 +76,19 @@ def make_comment_op(message: str, timestamp: int = 1700001000) -> Op:
     }
 
 
-def make_set_title_op(title: str, timestamp: int = 1700002000) -> Op:
+def make_set_title_op(title: str, timestamp: int = 1700002000) -> JsonObject:
     """Build an OP_SET_TITLE (type 2) operation."""
     return {'type': 2, 'timestamp': timestamp, 'title': title}
 
 
-def make_set_status_op(status: int, timestamp: int = 1700003000) -> Op:
+def make_set_status_op(status: int, timestamp: int = 1700003000) -> JsonObject:
     """Build an OP_SET_STATUS (type 4) operation."""
     return {'type': 4, 'timestamp': timestamp, 'status': status}
 
 
-def make_edit_comment_op(target: str, message: str, timestamp: int = 1700002500) -> Op:
+def make_edit_comment_op(
+    target: str, message: str, timestamp: int = 1700002500
+) -> JsonObject:
     """Build an OP_EDIT_COMMENT (type 6) operation."""
     return {
         'type': 6,
@@ -102,22 +102,25 @@ def make_label_change_op(
     added: list[str] | None = None,
     removed: list[str] | None = None,
     timestamp: int = 1700004000,
-) -> Op:
+) -> JsonObject:
     """Build an OP_LABEL_CHANGE (type 5) operation."""
     return {
         'type': 5,
         'timestamp': timestamp,
-        'added': added or [],
-        'removed': removed or [],
+        # git-bug serializes the unused side of a label change as null.
+        'added': list(added) if added is not None else None,
+        'removed': list(removed) if removed is not None else None,
     }
 
 
-def make_set_metadata_op(metadata: dict[str, str], timestamp: int = 1700005000) -> Op:
+def make_set_metadata_op(
+    metadata: JsonObject, timestamp: int = 1700005000
+) -> JsonObject:
     """Build an OP_SET_METADATA (type 8) operation."""
     return {'type': 8, 'timestamp': timestamp, 'new_metadata': metadata}
 
 
-def make_noop_op(timestamp: int = 1700006000) -> Op:
+def make_noop_op(timestamp: int = 1700006000) -> JsonObject:
     """Build an OP_NOOP (type 7) operation."""
     return {'type': 7, 'timestamp': timestamp}
 
@@ -201,7 +204,7 @@ def setup_single_bug(
     title: str = 'Test bug',
     message: str = 'Bug description',
     timestamp: int = 1700000000,
-    extra_ops: list[Op] | None = None,
+    extra_ops: list[JsonObject] | None = None,
     author_id: str = IDENTITY_ID,
     extra_packs: list[str] | None = None,
 ) -> None:
@@ -240,17 +243,29 @@ def setup_single_bug(
     setup_identity(repo_path, author_id, 'Alice', 'alice@example.com')
 
 
-# -- Mock writer for testing -------------------------------------------------
-
+# -- Fixtures ----------------------------------------------------------------
 
-class _MockWriter(BugWriter):
-    """BugWriter subclass exposing captured CLI calls/routes in tests."""
 
-    _cli_calls: list[list[str]]
-    _cli_routes: dict[str, Any]
+class RecordingBugWriter(BugWriter):
+    """BugWriter test double that records CLI calls and canned responses."""
 
+    def __init__(self, repo_path: str, reader: BugReader) -> None:
+        super().__init__(repo_path, reader)
+        self._cli_calls: list[list[str]] = []
+        self._cli_routes: dict[str, CliResult] = {}
 
-# -- Fixtures ----------------------------------------------------------------
+    @override
+    def _cli(
+        self,
+        args: list[str],
+        stdin: str | None = None,
+    ) -> CliResult:
+        self._cli_calls.append(args)
+        joined = ' '.join(args)
+        for key, value in self._cli_routes.items():
+            if key in joined:
+                return value
+        return (0, '', '')
 
 
 @pytest.fixture()
@@ -268,33 +283,11 @@ def reader(repo_path: str) -> BugReader:
 
 
 @pytest.fixture()
-def writer(reader: BugReader, repo_path: str) -> Iterator[_MockWriter]:
+def writer(reader: BugReader, repo_path: str) -> RecordingBugWriter:
     """Create a BugWriter with git_bug_cli mocked.
 
     Write operations shell out to the ``git bug`` CLI, which isn't
     available in tests, so we mock it. The mock captures calls in
     ``writer._cli_calls`` for assertion.
     """
-    cli_routes: dict[str, Any] = {}
-    cli_calls: list[list[str]] = []
-
-    def _cli_side_effect(
-        rp: str, args: list[str], stdin: str | None = None
-    ) -> tuple[int, str, str]:
-        cli_calls.append(args)
-        joined = ' '.join(args)
-        for key, value in cli_routes.items():
-            if key in joined:
-                if callable(value):
-                    return value(rp, args)  # type: ignore[no-any-return]
-                return value  # type: ignore[no-any-return]
-        return (0, '', '')
-
-    with (
-        patch('ezgb._writer.git_bug_cli', side_effect=_cli_side_effect),
-        patch('ezgb._git.git_bug_cli', side_effect=_cli_side_effect),
-    ):
-        w = _MockWriter(repo_path, reader)
-        w._cli_calls = cli_calls
-        w._cli_routes = cli_routes
-        yield w
+    return RecordingBugWriter(repo_path, reader)
diff --git a/tests/test_ezgb.py b/tests/test_ezgb.py
index 8202078..0b9f403 100644
--- a/tests/test_ezgb.py
+++ b/tests/test_ezgb.py
@@ -17,9 +17,9 @@ import pytest
 from conftest import (
     BUG_ID,
     IDENTITY_ID,
+    RecordingBugWriter,
     _create_bug_commit,
     _create_identity_commit,
-    _MockWriter,
     make_comment_op,
     make_create_op,
     make_edit_comment_op,
@@ -42,6 +42,7 @@ from ezgb import (
     UnsupportedFormatError,
 )
 from ezgb._reader import BugReader, _combine_ids
+from ezgb._types import JsonObject
 
 # ------------------------------------------------------------------
 # Unit tests: _combine_ids
@@ -216,7 +217,7 @@ class TestBuildBug:
         assert bug.comments[1].text == 'A follow-up'
 
     def test_comment_with_attachment(self, reader: BugReader, repo_path: str) -> None:
-        ops = [
+        ops: list[JsonObject] = [
             {
                 'type': 1,
                 'timestamp': 1700000000,
@@ -565,7 +566,10 @@ class TestInvalidate:
 
 class TestCreateBug:
     def test_creates_and_returns_bug(
-        self, reader: BugReader, writer: _MockWriter, repo_path: str
+        self,
+        reader: BugReader,
+        writer: RecordingBugWriter,
+        repo_path: str,
     ) -> None:
         new_id = 'd' * 64
         prefix = new_id[:7]
@@ -594,7 +598,10 @@ class TestCreateBug:
 
 class TestAddComment:
     def test_adds_and_returns_comment(
-        self, reader: BugReader, writer: _MockWriter, repo_path: str
+        self,
+        reader: BugReader,
+        writer: RecordingBugWriter,
+        repo_path: str,
     ) -> None:
         setup_single_bug(repo_path, reader)
 
@@ -629,13 +636,21 @@ class TestAddComment:
 
 class TestSetStatus:
     def test_close(
-        self, reader: BugReader, writer: _MockWriter, repo_path: str
+        self,
+        reader: BugReader,
+        writer: RecordingBugWriter,
+        repo_path: str,
     ) -> None:
         setup_single_bug(repo_path, reader)
         writer.set_status(BUG_ID, Status.CLOSED)
         assert any('close' in ' '.join(c) for c in writer._cli_calls)
 
-    def test_open(self, reader: BugReader, writer: _MockWriter, repo_path: str) -> None:
+    def test_open(
+        self,
+        reader: BugReader,
+        writer: RecordingBugWriter,
+        repo_path: str,
+    ) -> None:
         setup_single_bug(repo_path, reader)
         writer.set_status(BUG_ID, Status.OPEN)
         assert any('open' in ' '.join(c) for c in writer._cli_calls)
@@ -648,7 +663,10 @@ class TestSetStatus:
 
 class TestSetTitle:
     def test_updates_title(
-        self, reader: BugReader, writer: _MockWriter, repo_path: str
+        self,
+        reader: BugReader,
+        writer: RecordingBugWriter,
+        repo_path: str,
     ) -> None:
         setup_single_bug(repo_path, reader)
         writer.set_title(BUG_ID, 'New title')
@@ -662,14 +680,20 @@ class TestSetTitle:
 
 class TestLabels:
     def test_add_label(
-        self, reader: BugReader, writer: _MockWriter, repo_path: str
+        self,
+        reader: BugReader,
+        writer: RecordingBugWriter,
+        repo_path: str,
     ) -> None:
         setup_single_bug(repo_path, reader)
         writer.add_label(BUG_ID, 'priority/high')
         assert any('priority/high' in ' '.join(c) for c in writer._cli_calls)
 
     def test_remove_label(
-        self, reader: BugReader, writer: _MockWriter, repo_path: str
+        self,
+        reader: BugReader,
+        writer: RecordingBugWriter,
+        repo_path: str,
     ) -> None:
         setup_single_bug(repo_path, reader)
         writer.remove_label(BUG_ID, 'old-label')
diff --git a/tests/test_integration.py b/tests/test_integration.py
index d037423..77315ab 100644
--- a/tests/test_integration.py
+++ b/tests/test_integration.py
@@ -10,13 +10,12 @@ from __future__ import annotations
 import json
 import shutil
 import subprocess
-from collections.abc import Iterator
 from pathlib import Path
-from typing import Any
 
 import pytest
 
 from ezgb import GitBugRepo, Status
+from ezgb._types import JsonValue
 
 pytestmark = pytest.mark.skipif(
     shutil.which('git-bug') is None,
@@ -25,19 +24,18 @@ pytestmark = pytest.mark.skipif(
 
 
 @pytest.fixture()
-def gb_repo(tmp_path: Path) -> Iterator[GitBugRepo]:
+def gb_repo(tmp_path: Path) -> GitBugRepo:
     """Spin up a temporary git repo with git-bug and a test identity."""
     repo_dir = tmp_path / 'repo'
     repo_dir.mkdir()
     repo_path = str(repo_dir)
 
-    def _run(args: list[str], **kwargs: Any) -> subprocess.CompletedProcess[str]:
+    def _run(args: list[str]) -> subprocess.CompletedProcess[str]:
         return subprocess.run(
             args,
             capture_output=True,
             text=True,
             check=True,
-            **kwargs,
         )
 
     # Initialise the git repo
@@ -63,10 +61,15 @@ def gb_repo(tmp_path: Path) -> Iterator[GitBugRepo]:
         ]
     )
     result = _run(['git', '-C', repo_path, 'bug', 'user', '-f', 'json'])
-    users = json.loads(result.stdout)
-    _run(['git', '-C', repo_path, 'bug', 'user', 'adopt', users[0]['id']])
-
-    yield GitBugRepo(repo_path)
+    users: JsonValue = json.loads(result.stdout)
+    assert isinstance(users, list)
+    user = users[0]
+    assert isinstance(user, dict)
+    user_id = user['id']
+    assert isinstance(user_id, str)
+    _run(['git', '-C', repo_path, 'bug', 'user', 'adopt', user_id])
+
+    return GitBugRepo(repo_path)
 
 
 # ------------------------------------------------------------------
diff --git a/uv.lock b/uv.lock
index a079f59..092e9c8 100644
--- a/uv.lock
+++ b/uv.lock
@@ -1,11 +1,10 @@
 version = 1
 revision = 3
-requires-python = ">=3.9"
+requires-python = ">=3.10"
 resolution-markers = [
     "python_full_version >= '3.15'",
     "python_full_version >= '3.11' and python_full_version < '3.15'",
-    "python_full_version == '3.10.*'",
-    "python_full_version < '3.10'",
+    "python_full_version < '3.11'",
 ]
 
 [[package]]
@@ -49,114 +48,12 @@ wheels = [
     { url = "https://files.pythonhosted.org/packages/66/40/c53deb2cd0c9b0fb636d24d9f40924cf2e65028e6b20b10cd5c1eeb2c730/ast_serialize-0.6.0-cp39-abi3-win_arm64.whl", hash = "sha256:ccd132fe8db56f61fe743b1f644d01b8d65b83248a8da506f3132bda86d6ed5e", size = 1072965, upload-time = "2026-06-30T20:02:54.097Z" },
 ]
 
-[[package]]
-name = "cffi"
-version = "2.0.0"
-source = { registry = "https://pypi.org/simple" }
-resolution-markers = [
-    "python_full_version < '3.10'",
-]
-dependencies = [
-    { name = "pycparser", version = "2.23", source = { registry = "https://pypi.org/simple" }, marker = "python_full_version < '3.10' and implementation_name != 'PyPy'" },
-]
-sdist = { url = "https://files.pythonhosted.org/packages/eb/56/b1ba7935a17738ae8453301356628e8147c79dbb825bcbc73dc7401f9846/cffi-2.0.0.tar.gz", hash = "sha256:44d1b5909021139fe36001ae048dbdde8214afa20200eda0f64c068cac5d5529", size = 523588, upload-time = "2025-09-08T23:24:04.541Z" }
-wheels = [
-    { url = "https://files.pythonhosted.org/packages/93/d7/516d984057745a6cd96575eea814fe1edd6646ee6efd552fb7b0921dec83/cffi-2.0.0-cp310-cp310-macosx_10_13_x86_64.whl", hash = "sha256:0cf2d91ecc3fcc0625c2c530fe004f82c110405f101548512cce44322fa8ac44", size = 184283, upload-time = "2025-09-08T23:22:08.01Z" },
-    { url = "https://files.pythonhosted.org/packages/9e/84/ad6a0b408daa859246f57c03efd28e5dd1b33c21737c2db84cae8c237aa5/cffi-2.0.0-cp310-cp310-macosx_11_0_arm64.whl", hash = "sha256:f73b96c41e3b2adedc34a7356e64c8eb96e03a3782b535e043a986276ce12a49", size = 180504, upload-time = "2025-09-08T23:22:10.637Z" },
-    { url = "https://files.pythonhosted.org/packages/50/bd/b1a6362b80628111e6653c961f987faa55262b4002fcec42308cad1db680/cffi-2.0.0-cp310-cp310-manylinux1_i686.manylinux2014_i686.manylinux_2_17_i686.manylinux_2_5_i686.whl", hash = "sha256:53f77cbe57044e88bbd5ed26ac1d0514d2acf0591dd6bb02a3ae37f76811b80c", size = 208811, upload-time = "2025-09-08T23:22:12.267Z" },
-    { url = "https://files.pythonhosted.org/packages/4f/27/6933a8b2562d7bd1fb595074cf99cc81fc3789f6a6c05cdabb46284a3188/cffi-2.0.0-cp310-cp310-manylinux2014_aarch64.manylinux_2_17_aarch64.whl", hash = "sha256:3e837e369566884707ddaf85fc1744b47575005c0a229de3327f8f9a20f4efeb", size = 216402, upload-time = "2025-09-08T23:22:13.455Z" },
-    { url = "https://files.pythonhosted.org/packages/05/eb/b86f2a2645b62adcfff53b0dd97e8dfafb5c8aa864bd0d9a2c2049a0d551/cffi-2.0.0-cp310-cp310-manylinux2014_ppc64le.manylinux_2_17_ppc64le.whl", hash = "sha256:5eda85d6d1879e692d546a078b44251cdd08dd1cfb98dfb77b670c97cee49ea0", size = 203217, upload-time = "2025-09-08T23:22:14.596Z" },
-    { url = "https://files.pythonhosted.org/packages/9f/e0/6cbe77a53acf5acc7c08cc186c9928864bd7c005f9efd0d126884858a5fe/cffi-2.0.0-cp310-cp310-manylinux2014_s390x.manylinux_2_17_s390x.whl", hash = "sha256:9332088d75dc3241c702d852d4671613136d90fa6881da7d770a483fd05248b4", size = 203079, upload-time = "2025-09-08T23:22:15.769Z" },
-    { url = "https://files.pythonhosted.org/packages/98/29/9b366e70e243eb3d14a5cb488dfd3a0b6b2f1fb001a203f653b93ccfac88/cffi-2.0.0-cp310-cp310-manylinux2014_x86_64.manylinux_2_17_x86_64.whl", hash = "sha256:fc7de24befaeae77ba923797c7c87834c73648a05a4bde34b3b7e5588973a453", size = 216475, upload-time = "2025-09-08T23:22:17.427Z" },
-    { url = "https://files.pythonhosted.org/packages/21/7a/13b24e70d2f90a322f2900c5d8e1f14fa7e2a6b3332b7309ba7b2ba51a5a/cffi-2.0.0-cp310-cp310-musllinux_1_2_aarch64.whl", hash = "sha256:cf364028c016c03078a23b503f02058f1814320a56ad535686f90565636a9495", size = 218829, upload-time = "2025-09-08T23:22:19.069Z" },
-    { url = "https://files.pythonhosted.org/packages/60/99/c9dc110974c59cc981b1f5b66e1d8af8af764e00f0293266824d9c4254bc/cffi-2.0.0-cp310-cp310-musllinux_1_2_i686.whl", hash = "sha256:e11e82b744887154b182fd3e7e8512418446501191994dbf9c9fc1f32cc8efd5", size = 211211, upload-time = "2025-09-08T23:22:20.588Z" },
-    { url = "https://files.pythonhosted.org/packages/49/72/ff2d12dbf21aca1b32a40ed792ee6b40f6dc3a9cf1644bd7ef6e95e0ac5e/cffi-2.0.0-cp310-cp310-musllinux_1_2_x86_64.whl", hash = "sha256:8ea985900c5c95ce9db1745f7933eeef5d314f0565b27625d9a10ec9881e1bfb", size = 218036, upload-time = "2025-09-08T23:22:22.143Z" },
-    { url = "https://files.pythonhosted.org/packages/e2/cc/027d7fb82e58c48ea717149b03bcadcbdc293553edb283af792bd4bcbb3f/cffi-2.0.0-cp310-cp310-win32.whl", hash = "sha256:1f72fb8906754ac8a2cc3f9f5aaa298070652a0ffae577e0ea9bd480dc3c931a", size = 172184, upload-time = "2025-09-08T23:22:23.328Z" },
-    { url = "https://files.pythonhosted.org/packages/33/fa/072dd15ae27fbb4e06b437eb6e944e75b068deb09e2a2826039e49ee2045/cffi-2.0.0-cp310-cp310-win_amd64.whl", hash = "sha256:b18a3ed7d5b3bd8d9ef7a8cb226502c6bf8308df1525e1cc676c3680e7176739", size = 182790, upload-time = "2025-09-08T23:22:24.752Z" },
-    { url = "https://files.pythonhosted.org/packages/12/4a/3dfd5f7850cbf0d06dc84ba9aa00db766b52ca38d8b86e3a38314d52498c/cffi-2.0.0-cp311-cp311-macosx_10_13_x86_64.whl", hash = "sha256:b4c854ef3adc177950a8dfc81a86f5115d2abd545751a304c5bcf2c2c7283cfe", size = 184344, upload-time = "2025-09-08T23:22:26.456Z" },
-    { url = "https://files.pythonhosted.org/packages/4f/8b/f0e4c441227ba756aafbe78f117485b25bb26b1c059d01f137fa6d14896b/cffi-2.0.0-cp311-cp311-macosx_11_0_arm64.whl", hash = "sha256:2de9a304e27f7596cd03d16f1b7c72219bd944e99cc52b84d0145aefb07cbd3c", size = 180560, upload-time = "2025-09-08T23:22:28.197Z" },
-    { url = "https://files.pythonhosted.org/packages/b1/b7/1200d354378ef52ec227395d95c2576330fd22a869f7a70e88e1447eb234/cffi-2.0.0-cp311-cp311-manylinux1_i686.manylinux2014_i686.manylinux_2_17_i686.manylinux_2_5_i686.whl", hash = "sha256:baf5215e0ab74c16e2dd324e8ec067ef59e41125d3eade2b863d294fd5035c92", size = 209613, upload-time = "2025-09-08T23:22:29.475Z" },
-    { url = "https://files.pythonhosted.org/packages/b8/56/6033f5e86e8cc9bb629f0077ba71679508bdf54a9a5e112a3c0b91870332/cffi-2.0.0-cp311-cp311-manylinux2014_aarch64.manylinux_2_17_aarch64.whl", hash = "sha256:730cacb21e1bdff3ce90babf007d0a0917cc3e6492f336c2f0134101e0944f93", size = 216476, upload-time = "2025-09-08T23:22:31.063Z" },
-    { url = "https://files.pythonhosted.org/packages/dc/7f/55fecd70f7ece178db2f26128ec41430d8720f2d12ca97bf8f0a628207d5/cffi-2.0.0-cp311-cp311-manylinux2014_ppc64le.manylinux_2_17_ppc64le.whl", hash = "sha256:6824f87845e3396029f3820c206e459ccc91760e8fa24422f8b0c3d1731cbec5", size = 203374, upload-time = "2025-09-08T23:22:32.507Z" },
-    { url = "https://files.pythonhosted.org/packages/84/ef/a7b77c8bdc0f77adc3b46888f1ad54be8f3b7821697a7b89126e829e676a/cffi-2.0.0-cp311-cp311-manylinux2014_s390x.manylinux_2_17_s390x.whl", hash = "sha256:9de40a7b0323d889cf8d23d1ef214f565ab154443c42737dfe52ff82cf857664", size = 202597, upload-time = "2025-09-08T23:22:34.132Z" },
-    { url = "https://files.pythonhosted.org/packages/d7/91/500d892b2bf36529a75b77958edfcd5ad8e2ce4064ce2ecfeab2125d72d1/cffi-2.0.0-cp311-cp311-manylinux2014_x86_64.manylinux_2_17_x86_64.whl", hash = "sha256:8941aaadaf67246224cee8c3803777eed332a19d909b47e29c9842ef1e79ac26", size = 215574, upload-time = "2025-09-08T23:22:35.443Z" },
-    { url = "https://files.pythonhosted.org/packages/44/64/58f6255b62b101093d5df22dcb752596066c7e89dd725e0afaed242a61be/cffi-2.0.0-cp311-cp311-musllinux_1_2_aarch64.whl", hash = "sha256:a05d0c237b3349096d3981b727493e22147f934b20f6f125a3eba8f994bec4a9", size = 218971, upload-time = "2025-09-08T23:22:36.805Z" },
-    { url = "https://files.pythonhosted.org/packages/ab/49/fa72cebe2fd8a55fbe14956f9970fe8eb1ac59e5df042f603ef7c8ba0adc/cffi-2.0.0-cp311-cp311-musllinux_1_2_i686.whl", hash = "sha256:94698a9c5f91f9d138526b48fe26a199609544591f859c870d477351dc7b2414", size = 211972, upload-time = "2025-09-08T23:22:38.436Z" },
-    { url = "https://files.pythonhosted.org/packages/0b/28/dd0967a76aab36731b6ebfe64dec4e981aff7e0608f60c2d46b46982607d/cffi-2.0.0-cp311-cp311-musllinux_1_2_x86_64.whl", hash = "sha256:5fed36fccc0612a53f1d4d9a816b50a36702c28a2aa880cb8a122b3466638743", size = 217078, upload-time = "2025-09-08T23:22:39.776Z" },
-    { url = "https://files.pythonhosted.org/packages/2b/c0/015b25184413d7ab0a410775fdb4a50fca20f5589b5dab1dbbfa3baad8ce/cffi-2.0.0-cp311-cp311-win32.whl", hash = "sha256:c649e3a33450ec82378822b3dad03cc228b8f5963c0c12fc3b1e0ab940f768a5", size = 172076, upload-time = "2025-09-08T23:22:40.95Z" },
-    { url = "https://files.pythonhosted.org/packages/ae/8f/dc5531155e7070361eb1b7e4c1a9d896d0cb21c49f807a6c03fd63fc877e/cffi-2.0.0-cp311-cp311-win_amd64.whl", hash = "sha256:66f011380d0e49ed280c789fbd08ff0d40968ee7b665575489afa95c98196ab5", size = 182820, upload-time = "2025-09-08T23:22:42.463Z" },
-    { url = "https://files.pythonhosted.org/packages/95/5c/1b493356429f9aecfd56bc171285a4c4ac8697f76e9bbbbb105e537853a1/cffi-2.0.0-cp311-cp311-win_arm64.whl", hash = "sha256:c6638687455baf640e37344fe26d37c404db8b80d037c3d29f58fe8d1c3b194d", size = 177635, upload-time = "2025-09-08T23:22:43.623Z" },
-    { url = "https://files.pythonhosted.org/packages/ea/47/4f61023ea636104d4f16ab488e268b93008c3d0bb76893b1b31db1f96802/cffi-2.0.0-cp312-cp312-macosx_10_13_x86_64.whl", hash = "sha256:6d02d6655b0e54f54c4ef0b94eb6be0607b70853c45ce98bd278dc7de718be5d", size = 185271, upload-time = "2025-09-08T23:22:44.795Z" },
-    { url = "https://files.pythonhosted.org/packages/df/a2/781b623f57358e360d62cdd7a8c681f074a71d445418a776eef0aadb4ab4/cffi-2.0.0-cp312-cp312-macosx_11_0_arm64.whl", hash = "sha256:8eca2a813c1cb7ad4fb74d368c2ffbbb4789d377ee5bb8df98373c2cc0dee76c", size = 181048, upload-time = "2025-09-08T23:22:45.938Z" },
-    { url = "https://files.pythonhosted.org/packages/ff/df/a4f0fbd47331ceeba3d37c2e51e9dfc9722498becbeec2bd8bc856c9538a/cffi-2.0.0-cp312-cp312-manylinux1_i686.manylinux2014_i686.manylinux_2_17_i686.manylinux_2_5_i686.whl", hash = "sha256:21d1152871b019407d8ac3985f6775c079416c282e431a4da6afe7aefd2bccbe", size = 212529, upload-time = "2025-09-08T23:22:47.349Z" },
-    { url = "https://files.pythonhosted.org/packages/d5/72/12b5f8d3865bf0f87cf1404d8c374e7487dcf097a1c91c436e72e6badd83/cffi-2.0.0-cp312-cp312-manylinux2014_aarch64.manylinux_2_17_aarch64.whl", hash = "sha256:b21e08af67b8a103c71a250401c78d5e0893beff75e28c53c98f4de42f774062", size = 220097, upload-time = "2025-09-08T23:22:48.677Z" },
-    { url = "https://files.pythonhosted.org/packages/c2/95/7a135d52a50dfa7c882ab0ac17e8dc11cec9d55d2c18dda414c051c5e69e/cffi-2.0.0-cp312-cp312-manylinux2014_ppc64le.manylinux_2_17_ppc64le.whl", hash = "sha256:1e3a615586f05fc4065a8b22b8152f0c1b00cdbc60596d187c2a74f9e3036e4e", size = 207983, upload-time = "2025-09-08T23:22:50.06Z" },
-    { url = "https://files.pythonhosted.org/packages/3a/c8/15cb9ada8895957ea171c62dc78ff3e99159ee7adb13c0123c001a2546c1/cffi-2.0.0-cp312-cp312-manylinux2014_s390x.manylinux_2_17_s390x.whl", hash = "sha256:81afed14892743bbe14dacb9e36d9e0e504cd204e0b165062c488942b9718037", size = 206519, upload-time = "2025-09-08T23:22:51.364Z" },
-    { url = "https://files.pythonhosted.org/packages/78/2d/7fa73dfa841b5ac06c7b8855cfc18622132e365f5b81d02230333ff26e9e/cffi-2.0.0-cp312-cp312-manylinux2014_x86_64.manylinux_2_17_x86_64.whl", hash = "sha256:3e17ed538242334bf70832644a32a7aae3d83b57567f9fd60a26257e992b79ba", size = 219572, upload-time = "2025-09-08T23:22:52.902Z" },
-    { url = "https://files.pythonhosted.org/packages/07/e0/267e57e387b4ca276b90f0434ff88b2c2241ad72b16d31836adddfd6031b/cffi-2.0.0-cp312-cp312-musllinux_1_2_aarch64.whl", hash = "sha256:3925dd22fa2b7699ed2617149842d2e6adde22b262fcbfada50e3d195e4b3a94", size = 222963, upload-time = "2025-09-08T23:22:54.518Z" },
-    { url = "https://files.pythonhosted.org/packages/b6/75/1f2747525e06f53efbd878f4d03bac5b859cbc11c633d0fb81432d98a795/cffi-2.0.0-cp312-cp312-musllinux_1_2_x86_64.whl", hash = "sha256:2c8f814d84194c9ea681642fd164267891702542f028a15fc97d4674b6206187", size = 221361, upload-time = "2025-09-08T23:22:55.867Z" },
-    { url = "https://files.pythonhosted.org/packages/7b/2b/2b6435f76bfeb6bbf055596976da087377ede68df465419d192acf00c437/cffi-2.0.0-cp312-cp312-win32.whl", hash = "sha256:da902562c3e9c550df360bfa53c035b2f241fed6d9aef119048073680ace4a18", size = 172932, upload-time = "2025-09-08T23:22:57.188Z" },
-    { url = "https://files.pythonhosted.org/packages/f8/ed/13bd4418627013bec4ed6e54283b1959cf6db888048c7cf4b4c3b5b36002/cffi-2.0.0-cp312-cp312-win_amd64.whl", hash = "sha256:da68248800ad6320861f129cd9c1bf96ca849a2771a59e0344e88681905916f5", size = 183557, upload-time = "2025-09-08T23:22:58.351Z" },
-    { url = "https://files.pythonhosted.org/packages/95/31/9f7f93ad2f8eff1dbc1c3656d7ca5bfd8fb52c9d786b4dcf19b2d02217fa/cffi-2.0.0-cp312-cp312-win_arm64.whl", hash = "sha256:4671d9dd5ec934cb9a73e7ee9676f9362aba54f7f34910956b84d727b0d73fb6", size = 177762, upload-time = "2025-09-08T23:22:59.668Z" },
-    { url = "https://files.pythonhosted.org/packages/4b/8d/a0a47a0c9e413a658623d014e91e74a50cdd2c423f7ccfd44086ef767f90/cffi-2.0.0-cp313-cp313-macosx_10_13_x86_64.whl", hash = "sha256:00bdf7acc5f795150faa6957054fbbca2439db2f775ce831222b66f192f03beb", size = 185230, upload-time = "2025-09-08T23:23:00.879Z" },
-    { url = "https://files.pythonhosted.org/packages/4a/d2/a6c0296814556c68ee32009d9c2ad4f85f2707cdecfd7727951ec228005d/cffi-2.0.0-cp313-cp313-macosx_11_0_arm64.whl", hash = "sha256:45d5e886156860dc35862657e1494b9bae8dfa63bf56796f2fb56e1679fc0bca", size = 181043, upload-time = "2025-09-08T23:23:02.231Z" },
-    { url = "https://files.pythonhosted.org/packages/b0/1e/d22cc63332bd59b06481ceaac49d6c507598642e2230f201649058a7e704/cffi-2.0.0-cp313-cp313-manylinux1_i686.manylinux2014_i686.manylinux_2_17_i686.manylinux_2_5_i686.whl", hash = "sha256:07b271772c100085dd28b74fa0cd81c8fb1a3ba18b21e03d7c27f3436a10606b", size = 212446, upload-time = "2025-09-08T23:23:03.472Z" },
-    { url = "https://files.pythonhosted.org/packages/a9/f5/a2c23eb03b61a0b8747f211eb716446c826ad66818ddc7810cc2cc19b3f2/cffi-2.0.0-cp313-cp313-manylinux2014_aarch64.manylinux_2_17_aarch64.whl", hash = "sha256:d48a880098c96020b02d5a1f7d9251308510ce8858940e6fa99ece33f610838b", size = 220101, upload-time = "2025-09-08T23:23:04.792Z" },
-    { url = "https://files.pythonhosted.org/packages/f2/7f/e6647792fc5850d634695bc0e6ab4111ae88e89981d35ac269956605feba/cffi-2.0.0-cp313-cp313-manylinux2014_ppc64le.manylinux_2_17_ppc64le.whl", hash = "sha256:f93fd8e5c8c0a4aa1f424d6173f14a892044054871c771f8566e4008eaa359d2", size = 207948, upload-time = "2025-09-08T23:23:06.127Z" },
-    { url = "https://files.pythonhosted.org/packages/cb/1e/a5a1bd6f1fb30f22573f76533de12a00bf274abcdc55c8edab639078abb6/cffi-2.0.0-cp313-cp313-manylinux2014_s390x.manylinux_2_17_s390x.whl", hash = "sha256:dd4f05f54a52fb558f1ba9f528228066954fee3ebe629fc1660d874d040ae5a3", size = 206422, upload-time = "2025-09-08T23:23:07.753Z" },
-    { url = "https://files.pythonhosted.org/packages/98/df/0a1755e750013a2081e863e7cd37e0cdd02664372c754e5560099eb7aa44/cffi-2.0.0-cp313-cp313-manylinux2014_x86_64.manylinux_2_17_x86_64.whl", hash = "sha256:c8d3b5532fc71b7a77c09192b4a5a200ea992702734a2e9279a37f2478236f26", size = 219499, upload-time = "2025-09-08T23:23:09.648Z" },
-    { url = "https://files.pythonhosted.org/packages/50/e1/a969e687fcf9ea58e6e2a928ad5e2dd88cc12f6f0ab477e9971f2309b57c/cffi-2.0.0-cp313-cp313-musllinux_1_2_aarch64.whl", hash = "sha256:d9b29c1f0ae438d5ee9acb31cadee00a58c46cc9c0b2f9038c6b0b3470877a8c", size = 222928, upload-time = "2025-09-08T23:23:10.928Z" },
-    { url = "https://files.pythonhosted.org/packages/36/54/0362578dd2c9e557a28ac77698ed67323ed5b9775ca9d3fe73fe191bb5d8/cffi-2.0.0-cp313-cp313-musllinux_1_2_x86_64.whl", hash = "sha256:6d50360be4546678fc1b79ffe7a66265e28667840010348dd69a314145807a1b", size = 221302, upload-time = "2025-09-08T23:23:12.42Z" },
-    { url = "https://files.pythonhosted.org/packages/eb/6d/bf9bda840d5f1dfdbf0feca87fbdb64a918a69bca42cfa0ba7b137c48cb8/cffi-2.0.0-cp313-cp313-win32.whl", hash = "sha256:74a03b9698e198d47562765773b4a8309919089150a0bb17d829ad7b44b60d27", size = 172909, upload-time = "2025-09-08T23:23:14.32Z" },
-    { url = "https://files.pythonhosted.org/packages/37/18/6519e1ee6f5a1e579e04b9ddb6f1676c17368a7aba48299c3759bbc3c8b3/cffi-2.0.0-cp313-cp313-win_amd64.whl", hash = "sha256:19f705ada2530c1167abacb171925dd886168931e0a7b78f5bffcae5c6b5be75", size = 183402, upload-time = "2025-09-08T23:23:15.535Z" },
-    { url = "https://files.pythonhosted.org/packages/cb/0e/02ceeec9a7d6ee63bb596121c2c8e9b3a9e150936f4fbef6ca1943e6137c/cffi-2.0.0-cp313-cp313-win_arm64.whl", hash = "sha256:256f80b80ca3853f90c21b23ee78cd008713787b1b1e93eae9f3d6a7134abd91", size = 177780, upload-time = "2025-09-08T23:23:16.761Z" },
-    { url = "https://files.pythonhosted.org/packages/92/c4/3ce07396253a83250ee98564f8d7e9789fab8e58858f35d07a9a2c78de9f/cffi-2.0.0-cp314-cp314-macosx_10_13_x86_64.whl", hash = "sha256:fc33c5141b55ed366cfaad382df24fe7dcbc686de5be719b207bb248e3053dc5", size = 185320, upload-time = "2025-09-08T23:23:18.087Z" },
-    { url = "https://files.pythonhosted.org/packages/59/dd/27e9fa567a23931c838c6b02d0764611c62290062a6d4e8ff7863daf9730/cffi-2.0.0-cp314-cp314-macosx_11_0_arm64.whl", hash = "sha256:c654de545946e0db659b3400168c9ad31b5d29593291482c43e3564effbcee13", size = 181487, upload-time = "2025-09-08T23:23:19.622Z" },
-    { url = "https://files.pythonhosted.org/packages/d6/43/0e822876f87ea8a4ef95442c3d766a06a51fc5298823f884ef87aaad168c/cffi-2.0.0-cp314-cp314-manylinux2014_aarch64.manylinux_2_17_aarch64.whl", hash = "sha256:24b6f81f1983e6df8db3adc38562c83f7d4a0c36162885ec7f7b77c7dcbec97b", size = 220049, upload-time = "2025-09-08T23:23:20.853Z" },
-    { url = "https://files.pythonhosted.org/packages/b4/89/76799151d9c2d2d1ead63c2429da9ea9d7aac304603de0c6e8764e6e8e70/cffi-2.0.0-cp314-cp314-manylinux2014_ppc64le.manylinux_2_17_ppc64le.whl", hash = "sha256:12873ca6cb9b0f0d3a0da705d6086fe911591737a59f28b7936bdfed27c0d47c", size = 207793, upload-time = "2025-09-08T23:23:22.08Z" },
-    { url = "https://files.pythonhosted.org/packages/bb/dd/3465b14bb9e24ee24cb88c9e3730f6de63111fffe513492bf8c808a3547e/cffi-2.0.0-cp314-cp314-manylinux2014_s390x.manylinux_2_17_s390x.whl", hash = "sha256:d9b97165e8aed9272a6bb17c01e3cc5871a594a446ebedc996e2397a1c1ea8ef", size = 206300, upload-time = "2025-09-08T23:23:23.314Z" },
-    { url = "https://files.pythonhosted.org/packages/47/d9/d83e293854571c877a92da46fdec39158f8d7e68da75bf73581225d28e90/cffi-2.0.0-cp314-cp314-manylinux2014_x86_64.manylinux_2_17_x86_64.whl", hash = "sha256:afb8db5439b81cf9c9d0c80404b60c3cc9c3add93e114dcae767f1477cb53775", size = 219244, upload-time = "2025-09-08T23:23:24.541Z" },
-    { url = "https://files.pythonhosted.org/packages/2b/0f/1f177e3683aead2bb00f7679a16451d302c436b5cbf2505f0ea8146ef59e/cffi-2.0.0-cp314-cp314-musllinux_1_2_aarch64.whl", hash = "sha256:737fe7d37e1a1bffe70bd5754ea763a62a066dc5913ca57e957824b72a85e205", size = 222828, upload-time = "2025-09-08T23:23:26.143Z" },
-    { url = "https://files.pythonhosted.org/packages/c6/0f/cafacebd4b040e3119dcb32fed8bdef8dfe94da653155f9d0b9dc660166e/cffi-2.0.0-cp314-cp314-musllinux_1_2_x86_64.whl", hash = "sha256:38100abb9d1b1435bc4cc340bb4489635dc2f0da7456590877030c9b3d40b0c1", size = 220926, upload-time = "2025-09-08T23:23:27.873Z" },
-    { url = "https://files.pythonhosted.org/packages/3e/aa/df335faa45b395396fcbc03de2dfcab242cd61a9900e914fe682a59170b1/cffi-2.0.0-cp314-cp314-win32.whl", hash = "sha256:087067fa8953339c723661eda6b54bc98c5625757ea62e95eb4898ad5e776e9f", size = 175328, upload-time = "2025-09-08T23:23:44.61Z" },
-    { url = "https://files.pythonhosted.org/packages/bb/92/882c2d30831744296ce713f0feb4c1cd30f346ef747b530b5318715cc367/cffi-2.0.0-cp314-cp314-win_amd64.whl", hash = "sha256:203a48d1fb583fc7d78a4c6655692963b860a417c0528492a6bc21f1aaefab25", size = 185650, upload-time = "2025-09-08T23:23:45.848Z" },
-    { url = "https://files.pythonhosted.org/packages/9f/2c/98ece204b9d35a7366b5b2c6539c350313ca13932143e79dc133ba757104/cffi-2.0.0-cp314-cp314-win_arm64.whl", hash = "sha256:dbd5c7a25a7cb98f5ca55d258b103a2054f859a46ae11aaf23134f9cc0d356ad", size = 180687, upload-time = "2025-09-08T23:23:47.105Z" },
-    { url = "https://files.pythonhosted.org/packages/3e/61/c768e4d548bfa607abcda77423448df8c471f25dbe64fb2ef6d555eae006/cffi-2.0.0-cp314-cp314t-macosx_10_13_x86_64.whl", hash = "sha256:9a67fc9e8eb39039280526379fb3a70023d77caec1852002b4da7e8b270c4dd9", size = 188773, upload-time = "2025-09-08T23:23:29.347Z" },
-    { url = "https://files.pythonhosted.org/packages/2c/ea/5f76bce7cf6fcd0ab1a1058b5af899bfbef198bea4d5686da88471ea0336/cffi-2.0.0-cp314-cp314t-macosx_11_0_arm64.whl", hash = "sha256:7a66c7204d8869299919db4d5069a82f1561581af12b11b3c9f48c584eb8743d", size = 185013, upload-time = "2025-09-08T23:23:30.63Z" },
-    { url = "https://files.pythonhosted.org/packages/be/b4/c56878d0d1755cf9caa54ba71e5d049479c52f9e4afc230f06822162ab2f/cffi-2.0.0-cp314-cp314t-manylinux2014_aarch64.manylinux_2_17_aarch64.whl", hash = "sha256:7cc09976e8b56f8cebd752f7113ad07752461f48a58cbba644139015ac24954c", size = 221593, upload-time = "2025-09-08T23:23:31.91Z" },
-    { url = "https://files.pythonhosted.org/packages/e0/0d/eb704606dfe8033e7128df5e90fee946bbcb64a04fcdaa97321309004000/cffi-2.0.0-cp314-cp314t-manylinux2014_ppc64le.manylinux_2_17_ppc64le.whl", hash = "sha256:92b68146a71df78564e4ef48af17551a5ddd142e5190cdf2c5624d0c3ff5b2e8", size = 209354, upload-time = "2025-09-08T23:23:33.214Z" },
-    { url = "https://files.pythonhosted.org/packages/d8/19/3c435d727b368ca475fb8742ab97c9cb13a0de600ce86f62eab7fa3eea60/cffi-2.0.0-cp314-cp314t-manylinux2014_s390x.manylinux_2_17_s390x.whl", hash = "sha256:b1e74d11748e7e98e2f426ab176d4ed720a64412b6a15054378afdb71e0f37dc", size = 208480, upload-time = "2025-09-08T23:23:34.495Z" },
-    { url = "https://files.pythonhosted.org/packages/d0/44/681604464ed9541673e486521497406fadcc15b5217c3e326b061696899a/cffi-2.0.0-cp314-cp314t-manylinux2014_x86_64.manylinux_2_17_x86_64.whl", hash = "sha256:28a3a209b96630bca57cce802da70c266eb08c6e97e5afd61a75611ee6c64592", size = 221584, upload-time = "2025-09-08T23:23:36.096Z" },
-    { url = "https://files.pythonhosted.org/packages/25/8e/342a504ff018a2825d395d44d63a767dd8ebc927ebda557fecdaca3ac33a/cffi-2.0.0-cp314-cp314t-musllinux_1_2_aarch64.whl", hash = "sha256:7553fb2090d71822f02c629afe6042c299edf91ba1bf94951165613553984512", size = 224443, upload-time = "2025-09-08T23:23:37.328Z" },
-    { url = "https://files.pythonhosted.org/packages/e1/5e/b666bacbbc60fbf415ba9988324a132c9a7a0448a9a8f125074671c0f2c3/cffi-2.0.0-cp314-cp314t-musllinux_1_2_x86_64.whl", hash = "sha256:6c6c373cfc5c83a975506110d17457138c8c63016b563cc9ed6e056a82f13ce4", size = 223437, upload-time = "2025-09-08T23:23:38.945Z" },
-    { url = "https://files.pythonhosted.org/packages/a0/1d/ec1a60bd1a10daa292d3cd6bb0b359a81607154fb8165f3ec95fe003b85c/cffi-2.0.0-cp314-cp314t-win32.whl", hash = "sha256:1fc9ea04857caf665289b7a75923f2c6ed559b8298a1b8c49e59f7dd95c8481e", size = 180487, upload-time = "2025-09-08T23:23:40.423Z" },
-    { url = "https://files.pythonhosted.org/packages/bf/41/4c1168c74fac325c0c8156f04b6749c8b6a8f405bbf91413ba088359f60d/cffi-2.0.0-cp314-cp314t-win_amd64.whl", hash = "sha256:d68b6cef7827e8641e8ef16f4494edda8b36104d79773a334beaa1e3521430f6", size = 191726, upload-time = "2025-09-08T23:23:41.742Z" },
-    { url = "https://files.pythonhosted.org/packages/ae/3a/dbeec9d1ee0844c679f6bb5d6ad4e9f198b1224f4e7a32825f47f6192b0c/cffi-2.0.0-cp314-cp314t-win_arm64.whl", hash = "sha256:0a1527a803f0a659de1af2e1fd700213caba79377e27e4693648c2923da066f9", size = 184195, upload-time = "2025-09-08T23:23:43.004Z" },
-    { url = "https://files.pythonhosted.org/packages/c0/cc/08ed5a43f2996a16b462f64a7055c6e962803534924b9b2f1371d8c00b7b/cffi-2.0.0-cp39-cp39-macosx_10_13_x86_64.whl", hash = "sha256:fe562eb1a64e67dd297ccc4f5addea2501664954f2692b69a76449ec7913ecbf", size = 184288, upload-time = "2025-09-08T23:23:48.404Z" },
-    { url = "https://files.pythonhosted.org/packages/3d/de/38d9726324e127f727b4ecc376bc85e505bfe61ef130eaf3f290c6847dd4/cffi-2.0.0-cp39-cp39-macosx_11_0_arm64.whl", hash = "sha256:de8dad4425a6ca6e4e5e297b27b5c824ecc7581910bf9aee86cb6835e6812aa7", size = 180509, upload-time = "2025-09-08T23:23:49.73Z" },
-    { url = "https://files.pythonhosted.org/packages/9b/13/c92e36358fbcc39cf0962e83223c9522154ee8630e1df7c0b3a39a8124e2/cffi-2.0.0-cp39-cp39-manylinux1_i686.manylinux2014_i686.manylinux_2_17_i686.manylinux_2_5_i686.whl", hash = "sha256:4647afc2f90d1ddd33441e5b0e85b16b12ddec4fca55f0d9671fef036ecca27c", size = 208813, upload-time = "2025-09-08T23:23:51.263Z" },
-    { url = "https://files.pythonhosted.org/packages/15/12/a7a79bd0df4c3bff744b2d7e52cc1b68d5e7e427b384252c42366dc1ecbc/cffi-2.0.0-cp39-cp39-manylinux2014_aarch64.manylinux_2_17_aarch64.whl", hash = "sha256:3f4d46d8b35698056ec29bca21546e1551a205058ae1a181d871e278b0b28165", size = 216498, upload-time = "2025-09-08T23:23:52.494Z" },
-    { url = "https://files.pythonhosted.org/packages/a3/ad/5c51c1c7600bdd7ed9a24a203ec255dccdd0ebf4527f7b922a0bde2fb6ed/cffi-2.0.0-cp39-cp39-manylinux2014_ppc64le.manylinux_2_17_ppc64le.whl", hash = "sha256:e6e73b9e02893c764e7e8d5bb5ce277f1a009cd5243f8228f75f842bf937c534", size = 203243, upload-time = "2025-09-08T23:23:53.836Z" },
-    { url = "https://files.pythonhosted.org/packages/32/f2/81b63e288295928739d715d00952c8c6034cb6c6a516b17d37e0c8be5600/cffi-2.0.0-cp39-cp39-manylinux2014_s390x.manylinux_2_17_s390x.whl", hash = "sha256:cb527a79772e5ef98fb1d700678fe031e353e765d1ca2d409c92263c6d43e09f", size = 203158, upload-time = "2025-09-08T23:23:55.169Z" },
-    { url = "https://files.pythonhosted.org/packages/1f/74/cc4096ce66f5939042ae094e2e96f53426a979864aa1f96a621ad128be27/cffi-2.0.0-cp39-cp39-manylinux2014_x86_64.manylinux_2_17_x86_64.whl", hash = "sha256:61d028e90346df14fedc3d1e5441df818d095f3b87d286825dfcbd6459b7ef63", size = 216548, upload-time = "2025-09-08T23:23:56.506Z" },
-    { url = "https://files.pythonhosted.org/packages/e8/be/f6424d1dc46b1091ffcc8964fa7c0ab0cd36839dd2761b49c90481a6ba1b/cffi-2.0.0-cp39-cp39-musllinux_1_2_aarch64.whl", hash = "sha256:0f6084a0ea23d05d20c3edcda20c3d006f9b6f3fefeac38f59262e10cef47ee2", size = 218897, upload-time = "2025-09-08T23:23:57.825Z" },
-    { url = "https://files.pythonhosted.org/packages/f7/e0/dda537c2309817edf60109e39265f24f24aa7f050767e22c98c53fe7f48b/cffi-2.0.0-cp39-cp39-musllinux_1_2_i686.whl", hash = "sha256:1cd13c99ce269b3ed80b417dcd591415d3372bcac067009b6e0f59c7d4015e65", size = 211249, upload-time = "2025-09-08T23:23:59.139Z" },
-    { url = "https://files.pythonhosted.org/packages/2b/e7/7c769804eb75e4c4b35e658dba01de1640a351a9653c3d49ca89d16ccc91/cffi-2.0.0-cp39-cp39-musllinux_1_2_x86_64.whl", hash = "sha256:89472c9762729b5ae1ad974b777416bfda4ac5642423fa93bd57a09204712322", size = 218041, upload-time = "2025-09-08T23:24:00.496Z" },
-    { url = "https://files.pythonhosted.org/packages/aa/d9/6218d78f920dcd7507fc16a766b5ef8f3b913cc7aa938e7fc80b9978d089/cffi-2.0.0-cp39-cp39-win32.whl", hash = "sha256:2081580ebb843f759b9f617314a24ed5738c51d2aee65d31e02f6f7a2b97707a", size = 172138, upload-time = "2025-09-08T23:24:01.7Z" },
-    { url = "https://files.pythonhosted.org/packages/54/8f/a1e836f82d8e32a97e6b29cc8f641779181ac7363734f12df27db803ebda/cffi-2.0.0-cp39-cp39-win_amd64.whl", hash = "sha256:b882b3df248017dba09d6b16defe9b5c407fe32fc7c65a9c69798e6175601be9", size = 182794, upload-time = "2025-09-08T23:24:02.943Z" },
-]
-
 [[package]]
 name = "cffi"
 version = "2.1.0"
 source = { registry = "https://pypi.org/simple" }
-resolution-markers = [
-    "python_full_version >= '3.15'",
-    "python_full_version >= '3.11' and python_full_version < '3.15'",
-    "python_full_version == '3.10.*'",
-]
 dependencies = [
-    { name = "pycparser", version = "3.0", source = { registry = "https://pypi.org/simple" }, marker = "python_full_version >= '3.10' and implementation_name != 'PyPy'" },
+    { name = "pycparser", marker = "implementation_name != 'PyPy'" },
 ]
 sdist = { url = "https://files.pythonhosted.org/packages/57/5f/ff100cae70ebe9d8df1c01a00e510e45d9adb5c1fdda84791b199141de97/cffi-2.1.0.tar.gz", hash = "sha256:efc1cdd798b1aaf39b4610bba7aad28c9bea9b910f25c784ccf9ec1fa719d1f9", size = 531036, upload-time = "2026-07-06T21:34:30.382Z" }
 wheels = [
@@ -275,7 +172,7 @@ name = "exceptiongroup"
 version = "1.3.1"
 source = { registry = "https://pypi.org/simple" }
 dependencies = [
-    { name = "typing-extensions", marker = "python_full_version < '3.11'" },
+    { name = "typing-extensions" },
 ]
 sdist = { url = "https://files.pythonhosted.org/packages/50/79/66800aadf48771f6b62f7eb014e352e5d06856655206165d775e675a02c9/exceptiongroup-1.3.1.tar.gz", hash = "sha256:8b412432c6055b0b7d14c310000ae93352ed6754f70fa8f7c34141f91c4e3219", size = 30371, upload-time = "2025-11-21T23:01:54.787Z" }
 wheels = [
@@ -287,20 +184,18 @@ name = "ezgb"
 version = "0.2.0"
 source = { editable = "." }
 dependencies = [
-    { name = "pygit2", version = "1.15.1", source = { registry = "https://pypi.org/simple" }, marker = "python_full_version < '3.10'" },
-    { name = "pygit2", version = "1.18.2", source = { registry = "https://pypi.org/simple" }, marker = "python_full_version == '3.10.*'" },
+    { name = "pygit2", version = "1.18.2", source = { registry = "https://pypi.org/simple" }, marker = "python_full_version < '3.11'" },
     { name = "pygit2", version = "1.19.3", source = { registry = "https://pypi.org/simple" }, marker = "python_full_version >= '3.11'" },
 ]
 
 [package.dev-dependencies]
 dev = [
-    { name = "mypy", version = "1.19.1", source = { registry = "https://pypi.org/simple" }, marker = "python_full_version < '3.10'" },
-    { name = "mypy", version = "2.3.0", source = { registry = "https://pypi.org/simple" }, marker = "python_full_version >= '3.10'" },
+    { name = "mypy" },
     { name = "pyright" },
-    { name = "pytest", version = "8.4.2", source = { registry = "https://pypi.org/simple" }, marker = "python_full_version < '3.10'" },
-    { name = "pytest", version = "9.1.1", source = { registry = "https://pypi.org/simple" }, marker = "python_full_version >= '3.10'" },
+    { name = "pytest" },
     { name = "ruff" },
     { name = "ty" },
+    { name = "typing-extensions" },
 ]
 
 [package.metadata]
@@ -313,29 +208,13 @@ dev = [
     { name = "pytest" },
     { name = "ruff" },
     { name = "ty" },
-]
-
-[[package]]
-name = "iniconfig"
-version = "2.1.0"
-source = { registry = "https://pypi.org/simple" }
-resolution-markers = [
-    "python_full_version < '3.10'",
-]
-sdist = { url = "https://files.pythonhosted.org/packages/f2/97/ebf4da567aa6827c909642694d71c9fcf53e5b504f2d96afea02718862f3/iniconfig-2.1.0.tar.gz", hash = "sha256:3abbd2e30b36733fee78f9c7f7308f2d0050e88f0087fd25c2645f63c773e1c7", size = 4793, upload-time = "2025-03-19T20:09:59.721Z" }
-wheels = [
-    { url = "https://files.pythonhosted.org/packages/2c/e1/e6716421ea10d38022b952c159d5161ca1193197fb744506875fbb87ea7b/iniconfig-2.1.0-py3-none-any.whl", hash = "sha256:9deba5723312380e77435581c6bf4935c94cbfab9b1ed33ef8d238ea168eb760", size = 6050, upload-time = "2025-03-19T20:10:01.071Z" },
+    { name = "typing-extensions", specifier = ">=4.4" },
 ]
 
 [[package]]
 name = "iniconfig"
 version = "2.3.0"
 source = { registry = "https://pypi.org/simple" }
-resolution-markers = [
-    "python_full_version >= '3.15'",
-    "python_full_version >= '3.11' and python_full_version < '3.15'",
-    "python_full_version == '3.10.*'",
-]
 sdist = { url = "https://files.pythonhosted.org/packages/72/34/14ca021ce8e5dfedc35312d08ba8bf51fdd999c576889fc2c24cb97f4f10/iniconfig-2.3.0.tar.gz", hash = "sha256:c76315c77db068650d49c5b56314774a7804df16fee4402c1f19d6d15d8c4730", size = 20503, upload-time = "2025-10-18T21:55:43.219Z" }
 wheels = [
     { url = "https://files.pythonhosted.org/packages/cb/b1/3846dd7f199d53cb17f49cba7e651e9ce294d8497c8c150530ed11865bb8/iniconfig-2.3.0-py3-none-any.whl", hash = "sha256:f631c04d2c48c52b84d0d0549c99ff3859c98df65b3101406327ecc7d53fbf12", size = 7484, upload-time = "2025-10-18T21:55:41.639Z" },
@@ -426,91 +305,19 @@ wheels = [
     { url = "https://files.pythonhosted.org/packages/0c/99/6203ce619dee940d6bfbe099ec3fe4be00a68e9d60f70abf906cf124fe66/librt-0.13.0-cp314-cp314t-win32.whl", hash = "sha256:5fdcf34f86de8fb66d7dc7589f96ba91c4aa46671200d400e6fd6f109a483f18", size = 104357, upload-time = "2026-07-08T12:26:09.828Z" },
     { url = "https://files.pythonhosted.org/packages/52/dd/843b6314087c41657c7036d7914d8f294bdf9b580aa8513ea0588c8e9a3d/librt-0.13.0-cp314-cp314t-win_amd64.whl", hash = "sha256:260c33e92263fa629b4f6d3c51967a1c2158fe6c33237aaa3ebeac586b085259", size = 126998, upload-time = "2026-07-08T12:26:10.975Z" },
     { url = "https://files.pythonhosted.org/packages/5f/5d/3dcec2884ba1b0806d1408612555c38dd5d68e90156b59f75f6e36435c3a/librt-0.13.0-cp314-cp314t-win_arm64.whl", hash = "sha256:2f281549a4c52ac7bb97997f14353f8bd0e53a34ca0dad1c905cfd0b4a58ae99", size = 110771, upload-time = "2026-07-08T12:26:12.303Z" },
-    { url = "https://files.pythonhosted.org/packages/07/7f/70d7bb462049d5393bdd9c34cca84d3e69c8e42d8aefe317909081e956a6/librt-0.13.0-cp39-cp39-macosx_10_9_x86_64.whl", hash = "sha256:f442e3954b1addc759faae22a7c9a3f1e16d7d1db3f484279dc27d62e06968fa", size = 148802, upload-time = "2026-07-08T12:26:13.421Z" },
-    { url = "https://files.pythonhosted.org/packages/bc/dd/81ebb227575da36f1321d83ebd8248882a8b580518f5aeb64ecc3ad5b0f0/librt-0.13.0-cp39-cp39-macosx_11_0_arm64.whl", hash = "sha256:9e786428f291dd2d2f1cbfc0e0caa45a2e395fab0ad3e2c9314daa8873414390", size = 154436, upload-time = "2026-07-08T12:26:14.608Z" },
-    { url = "https://files.pythonhosted.org/packages/3f/8e/e048589ce83caa796dd1e801f66b1a69e4b27f8779326f84c5456176a28b/librt-0.13.0-cp39-cp39-manylinux2014_aarch64.manylinux_2_17_aarch64.manylinux_2_28_aarch64.whl", hash = "sha256:21b7ac084f701a9cdff6139745a6620579d65a9379ac2d9d50a86368b109e63c", size = 493651, upload-time = "2026-07-08T12:26:15.794Z" },
-    { url = "https://files.pythonhosted.org/packages/ba/a7/917e7ec7556fb13c78702f933bf47709303f5b741aed99c107b5051c1c0e/librt-0.13.0-cp39-cp39-manylinux2014_i686.manylinux_2_17_i686.manylinux_2_28_i686.whl", hash = "sha256:a6e556d6aba31c93dd97ce661d66614d2429c0a3923f9dc8f0af7e8df10223a4", size = 484354, upload-time = "2026-07-08T12:26:17.275Z" },
-    { url = "https://files.pythonhosted.org/packages/ee/6a/4505cadde67b794ac60c328012f2517df6babc115ea388953b0c2a4996ca/librt-0.13.0-cp39-cp39-manylinux2014_x86_64.manylinux_2_17_x86_64.manylinux_2_28_x86_64.whl", hash = "sha256:3657346f867469e962549435aa05fd15330b1d6a92829f8e27988e194382d005", size = 515032, upload-time = "2026-07-08T12:26:18.639Z" },
-    { url = "https://files.pythonhosted.org/packages/e6/d0/fc39a7df0e6cbf6f48cd446a2a7ffc033601f7ee96d6d334abda1a0359f4/librt-0.13.0-cp39-cp39-manylinux_2_34_riscv64.manylinux_2_39_riscv64.whl", hash = "sha256:791aa18a373b90da8ac3c44fc77544f33fdf53ae403acdce9b39f1c26b4a3b94", size = 508998, upload-time = "2026-07-08T12:26:19.978Z" },
-    { url = "https://files.pythonhosted.org/packages/fd/35/203a7c6c6bb8911fac67bc6ba2e239d71f9cf8a0ad37a554a3c1294d7a08/librt-0.13.0-cp39-cp39-musllinux_1_2_aarch64.whl", hash = "sha256:d6fb0eaa108814581c4d3bfbd068c3fb6757812a81415008d1bae08267cca360", size = 531801, upload-time = "2026-07-08T12:26:21.486Z" },
-    { url = "https://files.pythonhosted.org/packages/aa/12/c153ebcab09d9cb020ea12b59c9e36cc50aa39920f1f91f6a1b4a3361be4/librt-0.13.0-cp39-cp39-musllinux_1_2_i686.whl", hash = "sha256:a001519c315d5db40710f2665d32c4791f1d4779fc96a9423fd18d92c8b9ac7b", size = 536830, upload-time = "2026-07-08T12:26:23.069Z" },
-    { url = "https://files.pythonhosted.org/packages/b1/93/df8b520d01f2889c9a0c9584b39409d7fbb818f0e36017d18bd6835fb8c4/librt-0.13.0-cp39-cp39-musllinux_1_2_riscv64.whl", hash = "sha256:d9188caac26e47671b52836a5e2a49873a7fc11c673b0c122d22515f98bc14e1", size = 516579, upload-time = "2026-07-08T12:26:24.393Z" },
-    { url = "https://files.pythonhosted.org/packages/46/09/090ad042150a944a015bc1cfde088e26ed69612f866f43d3876351b6cb87/librt-0.13.0-cp39-cp39-musllinux_1_2_x86_64.whl", hash = "sha256:05d96b80b95d3a2721b619f8982b8558848b04875bb4772fd54842b59f61dd97", size = 558495, upload-time = "2026-07-08T12:26:25.73Z" },
-    { url = "https://files.pythonhosted.org/packages/2d/9e/c63f5e8021e3b3d7367ee91c1eafa7cabb455e937cdf7eb6cf4c453db92d/librt-0.13.0-cp39-cp39-win32.whl", hash = "sha256:c3cd253cf32fe4f4662960d6bf7d55cb8be0c31a5d644a4d48aeafebaff3409a", size = 104913, upload-time = "2026-07-08T12:26:27.004Z" },
-    { url = "https://files.pythonhosted.org/packages/c7/43/193e0190a0752c8d621ef3eb6482455e410d2d3dfc63c1da000b39608e5d/librt-0.13.0-cp39-cp39-win_amd64.whl", hash = "sha256:b15e26cc0fe622d0c67e98bee6ef6bc8f792e20ee3006aa12627a00463d9399f", size = 125583, upload-time = "2026-07-08T12:26:28.593Z" },
-]
-
-[[package]]
-name = "mypy"
-version = "1.19.1"
-source = { registry = "https://pypi.org/simple" }
-resolution-markers = [
-    "python_full_version < '3.10'",
-]
-dependencies = [
-    { name = "librt", marker = "python_full_version < '3.10' and platform_python_implementation != 'PyPy'" },
-    { name = "mypy-extensions", marker = "python_full_version < '3.10'" },
-    { name = "pathspec", marker = "python_full_version < '3.10'" },
-    { name = "tomli", marker = "python_full_version < '3.10'" },
-    { name = "typing-extensions", marker = "python_full_version < '3.10'" },
-]
-sdist = { url = "https://files.pythonhosted.org/packages/f5/db/4efed9504bc01309ab9c2da7e352cc223569f05478012b5d9ece38fd44d2/mypy-1.19.1.tar.gz", hash = "sha256:19d88bb05303fe63f71dd2c6270daca27cb9401c4ca8255fe50d1d920e0eb9ba", size = 3582404, upload-time = "2025-12-15T05:03:48.42Z" }
-wheels = [
-    { url = "https://files.pythonhosted.org/packages/2f/63/e499890d8e39b1ff2df4c0c6ce5d371b6844ee22b8250687a99fd2f657a8/mypy-1.19.1-cp310-cp310-macosx_10_9_x86_64.whl", hash = "sha256:5f05aa3d375b385734388e844bc01733bd33c644ab48e9684faa54e5389775ec", size = 13101333, upload-time = "2025-12-15T05:03:03.28Z" },
-    { url = "https://files.pythonhosted.org/packages/72/4b/095626fc136fba96effc4fd4a82b41d688ab92124f8c4f7564bffe5cf1b0/mypy-1.19.1-cp310-cp310-macosx_11_0_arm64.whl", hash = "sha256:022ea7279374af1a5d78dfcab853fe6a536eebfda4b59deab53cd21f6cd9f00b", size = 12164102, upload-time = "2025-12-15T05:02:33.611Z" },
-    { url = "https://files.pythonhosted.org/packages/0c/5b/952928dd081bf88a83a5ccd49aaecfcd18fd0d2710c7ff07b8fb6f7032b9/mypy-1.19.1-cp310-cp310-manylinux2014_aarch64.manylinux_2_17_aarch64.manylinux_2_28_aarch64.whl", hash = "sha256:ee4c11e460685c3e0c64a4c5de82ae143622410950d6be863303a1c4ba0e36d6", size = 12765799, upload-time = "2025-12-15T05:03:28.44Z" },
-    { url = "https://files.pythonhosted.org/packages/2a/0d/93c2e4a287f74ef11a66fb6d49c7a9f05e47b0a4399040e6719b57f500d2/mypy-1.19.1-cp310-cp310-manylinux2014_x86_64.manylinux_2_17_x86_64.manylinux_2_28_x86_64.whl", hash = "sha256:de759aafbae8763283b2ee5869c7255391fbc4de3ff171f8f030b5ec48381b74", size = 13522149, upload-time = "2025-12-15T05:02:36.011Z" },
-    { url = "https://files.pythonhosted.org/packages/7b/0e/33a294b56aaad2b338d203e3a1d8b453637ac36cb278b45005e0901cf148/mypy-1.19.1-cp310-cp310-musllinux_1_2_x86_64.whl", hash = "sha256:ab43590f9cd5108f41aacf9fca31841142c786827a74ab7cc8a2eacb634e09a1", size = 13810105, upload-time = "2025-12-15T05:02:40.327Z" },
-    { url = "https://files.pythonhosted.org/packages/0e/fd/3e82603a0cb66b67c5e7abababce6bf1a929ddf67bf445e652684af5c5a0/mypy-1.19.1-cp310-cp310-win_amd64.whl", hash = "sha256:2899753e2f61e571b3971747e302d5f420c3fd09650e1951e99f823bc3089dac", size = 10057200, upload-time = "2025-12-15T05:02:51.012Z" },
-    { url = "https://files.pythonhosted.org/packages/ef/47/6b3ebabd5474d9cdc170d1342fbf9dddc1b0ec13ec90bf9004ee6f391c31/mypy-1.19.1-cp311-cp311-macosx_10_9_x86_64.whl", hash = "sha256:d8dfc6ab58ca7dda47d9237349157500468e404b17213d44fc1cb77bce532288", size = 13028539, upload-time = "2025-12-15T05:03:44.129Z" },
-    { url = "https://files.pythonhosted.org/packages/5c/a6/ac7c7a88a3c9c54334f53a941b765e6ec6c4ebd65d3fe8cdcfbe0d0fd7db/mypy-1.19.1-cp311-cp311-macosx_11_0_arm64.whl", hash = "sha256:e3f276d8493c3c97930e354b2595a44a21348b320d859fb4a2b9f66da9ed27ab", size = 12083163, upload-time = "2025-12-15T05:03:37.679Z" },
-    { url = "https://files.pythonhosted.org/packages/67/af/3afa9cf880aa4a2c803798ac24f1d11ef72a0c8079689fac5cfd815e2830/mypy-1.19.1-cp311-cp311-manylinux2014_aarch64.manylinux_2_17_aarch64.manylinux_2_28_aarch64.whl", hash = "sha256:2abb24cf3f17864770d18d673c85235ba52456b36a06b6afc1e07c1fdcd3d0e6", size = 12687629, upload-time = "2025-12-15T05:02:31.526Z" },
-    { url = "https://files.pythonhosted.org/packages/2d/46/20f8a7114a56484ab268b0ab372461cb3a8f7deed31ea96b83a4e4cfcfca/mypy-1.19.1-cp311-cp311-manylinux2014_x86_64.manylinux_2_17_x86_64.manylinux_2_28_x86_64.whl", hash = "sha256:a009ffa5a621762d0c926a078c2d639104becab69e79538a494bcccb62cc0331", size = 13436933, upload-time = "2025-12-15T05:03:15.606Z" },
-    { url = "https://files.pythonhosted.org/packages/5b/f8/33b291ea85050a21f15da910002460f1f445f8007adb29230f0adea279cb/mypy-1.19.1-cp311-cp311-musllinux_1_2_x86_64.whl", hash = "sha256:f7cee03c9a2e2ee26ec07479f38ea9c884e301d42c6d43a19d20fb014e3ba925", size = 13661754, upload-time = "2025-12-15T05:02:26.731Z" },
-    { url = "https://files.pythonhosted.org/packages/fd/a3/47cbd4e85bec4335a9cd80cf67dbc02be21b5d4c9c23ad6b95d6c5196bac/mypy-1.19.1-cp311-cp311-win_amd64.whl", hash = "sha256:4b84a7a18f41e167f7995200a1d07a4a6810e89d29859df936f1c3923d263042", size = 10055772, upload-time = "2025-12-15T05:03:26.179Z" },
-    { url = "https://files.pythonhosted.org/packages/06/8a/19bfae96f6615aa8a0604915512e0289b1fad33d5909bf7244f02935d33a/mypy-1.19.1-cp312-cp312-macosx_10_13_x86_64.whl", hash = "sha256:a8174a03289288c1f6c46d55cef02379b478bfbc8e358e02047487cad44c6ca1", size = 13206053, upload-time = "2025-12-15T05:03:46.622Z" },
-    { url = "https://files.pythonhosted.org/packages/a5/34/3e63879ab041602154ba2a9f99817bb0c85c4df19a23a1443c8986e4d565/mypy-1.19.1-cp312-cp312-macosx_11_0_arm64.whl", hash = "sha256:ffcebe56eb09ff0c0885e750036a095e23793ba6c2e894e7e63f6d89ad51f22e", size = 12219134, upload-time = "2025-12-15T05:03:24.367Z" },
-    { url = "https://files.pythonhosted.org/packages/89/cc/2db6f0e95366b630364e09845672dbee0cbf0bbe753a204b29a944967cd9/mypy-1.19.1-cp312-cp312-manylinux2014_aarch64.manylinux_2_17_aarch64.manylinux_2_28_aarch64.whl", hash = "sha256:b64d987153888790bcdb03a6473d321820597ab8dd9243b27a92153c4fa50fd2", size = 12731616, upload-time = "2025-12-15T05:02:44.725Z" },
-    { url = "https://files.pythonhosted.org/packages/00/be/dd56c1fd4807bc1eba1cf18b2a850d0de7bacb55e158755eb79f77c41f8e/mypy-1.19.1-cp312-cp312-manylinux2014_x86_64.manylinux_2_17_x86_64.manylinux_2_28_x86_64.whl", hash = "sha256:c35d298c2c4bba75feb2195655dfea8124d855dfd7343bf8b8c055421eaf0cf8", size = 13620847, upload-time = "2025-12-15T05:03:39.633Z" },
-    { url = "https://files.pythonhosted.org/packages/6d/42/332951aae42b79329f743bf1da088cd75d8d4d9acc18fbcbd84f26c1af4e/mypy-1.19.1-cp312-cp312-musllinux_1_2_x86_64.whl", hash = "sha256:34c81968774648ab5ac09c29a375fdede03ba253f8f8287847bd480782f73a6a", size = 13834976, upload-time = "2025-12-15T05:03:08.786Z" },
-    { url = "https://files.pythonhosted.org/packages/6f/63/e7493e5f90e1e085c562bb06e2eb32cae27c5057b9653348d38b47daaecc/mypy-1.19.1-cp312-cp312-win_amd64.whl", hash = "sha256:b10e7c2cd7870ba4ad9b2d8a6102eb5ffc1f16ca35e3de6bfa390c1113029d13", size = 10118104, upload-time = "2025-12-15T05:03:10.834Z" },
-    { url = "https://files.pythonhosted.org/packages/de/9f/a6abae693f7a0c697dbb435aac52e958dc8da44e92e08ba88d2e42326176/mypy-1.19.1-cp313-cp313-macosx_10_13_x86_64.whl", hash = "sha256:e3157c7594ff2ef1634ee058aafc56a82db665c9438fd41b390f3bde1ab12250", size = 13201927, upload-time = "2025-12-15T05:02:29.138Z" },
-    { url = "https://files.pythonhosted.org/packages/9a/a4/45c35ccf6e1c65afc23a069f50e2c66f46bd3798cbe0d680c12d12935caa/mypy-1.19.1-cp313-cp313-macosx_11_0_arm64.whl", hash = "sha256:bdb12f69bcc02700c2b47e070238f42cb87f18c0bc1fc4cdb4fb2bc5fd7a3b8b", size = 12206730, upload-time = "2025-12-15T05:03:01.325Z" },
-    { url = "https://files.pythonhosted.org/packages/05/bb/cdcf89678e26b187650512620eec8368fded4cfd99cfcb431e4cdfd19dec/mypy-1.19.1-cp313-cp313-manylinux2014_aarch64.manylinux_2_17_aarch64.manylinux_2_28_aarch64.whl", hash = "sha256:f859fb09d9583a985be9a493d5cfc5515b56b08f7447759a0c5deaf68d80506e", size = 12724581, upload-time = "2025-12-15T05:03:20.087Z" },
-    { url = "https://files.pythonhosted.org/packages/d1/32/dd260d52babf67bad8e6770f8e1102021877ce0edea106e72df5626bb0ec/mypy-1.19.1-cp313-cp313-manylinux2014_x86_64.manylinux_2_17_x86_64.manylinux_2_28_x86_64.whl", hash = "sha256:c9a6538e0415310aad77cb94004ca6482330fece18036b5f360b62c45814c4ef", size = 13616252, upload-time = "2025-12-15T05:02:49.036Z" },
-    { url = "https://files.pythonhosted.org/packages/71/d0/5e60a9d2e3bd48432ae2b454b7ef2b62a960ab51292b1eda2a95edd78198/mypy-1.19.1-cp313-cp313-musllinux_1_2_x86_64.whl", hash = "sha256:da4869fc5e7f62a88f3fe0b5c919d1d9f7ea3cef92d3689de2823fd27e40aa75", size = 13840848, upload-time = "2025-12-15T05:02:55.95Z" },
-    { url = "https://files.pythonhosted.org/packages/98/76/d32051fa65ecf6cc8c6610956473abdc9b4c43301107476ac03559507843/mypy-1.19.1-cp313-cp313-win_amd64.whl", hash = "sha256:016f2246209095e8eda7538944daa1d60e1e8134d98983b9fc1e92c1fc0cb8dd", size = 10135510, upload-time = "2025-12-15T05:02:58.438Z" },
-    { url = "https://files.pythonhosted.org/packages/de/eb/b83e75f4c820c4247a58580ef86fcd35165028f191e7e1ba57128c52782d/mypy-1.19.1-cp314-cp314-macosx_10_15_x86_64.whl", hash = "sha256:06e6170bd5836770e8104c8fdd58e5e725cfeb309f0a6c681a811f557e97eac1", size = 13199744, upload-time = "2025-12-15T05:03:30.823Z" },
-    { url = "https://files.pythonhosted.org/packages/94/28/52785ab7bfa165f87fcbb61547a93f98bb20e7f82f90f165a1f69bce7b3d/mypy-1.19.1-cp314-cp314-macosx_11_0_arm64.whl", hash = "sha256:804bd67b8054a85447c8954215a906d6eff9cabeabe493fb6334b24f4bfff718", size = 12215815, upload-time = "2025-12-15T05:02:42.323Z" },
-    { url = "https://files.pythonhosted.org/packages/0a/c6/bdd60774a0dbfb05122e3e925f2e9e846c009e479dcec4821dad881f5b52/mypy-1.19.1-cp314-cp314-manylinux2014_aarch64.manylinux_2_17_aarch64.manylinux_2_28_aarch64.whl", hash = "sha256:21761006a7f497cb0d4de3d8ef4ca70532256688b0523eee02baf9eec895e27b", size = 12740047, upload-time = "2025-12-15T05:03:33.168Z" },
-    { url = "https://files.pythonhosted.org/packages/32/2a/66ba933fe6c76bd40d1fe916a83f04fed253152f451a877520b3c4a5e41e/mypy-1.19.1-cp314-cp314-manylinux2014_x86_64.manylinux_2_17_x86_64.manylinux_2_28_x86_64.whl", hash = "sha256:28902ee51f12e0f19e1e16fbe2f8f06b6637f482c459dd393efddd0ec7f82045", size = 13601998, upload-time = "2025-12-15T05:03:13.056Z" },
-    { url = "https://files.pythonhosted.org/packages/e3/da/5055c63e377c5c2418760411fd6a63ee2b96cf95397259038756c042574f/mypy-1.19.1-cp314-cp314-musllinux_1_2_x86_64.whl", hash = "sha256:481daf36a4c443332e2ae9c137dfee878fcea781a2e3f895d54bd3002a900957", size = 13807476, upload-time = "2025-12-15T05:03:17.977Z" },
-    { url = "https://files.pythonhosted.org/packages/cd/09/4ebd873390a063176f06b0dbf1f7783dd87bd120eae7727fa4ae4179b685/mypy-1.19.1-cp314-cp314-win_amd64.whl", hash = "sha256:8bb5c6f6d043655e055be9b542aa5f3bdd30e4f3589163e85f93f3640060509f", size = 10281872, upload-time = "2025-12-15T05:03:05.549Z" },
-    { url = "https://files.pythonhosted.org/packages/b5/f7/88436084550ca9af5e610fa45286be04c3b63374df3e021c762fe8c4369f/mypy-1.19.1-cp39-cp39-macosx_10_9_x86_64.whl", hash = "sha256:7bcfc336a03a1aaa26dfce9fff3e287a3ba99872a157561cbfcebe67c13308e3", size = 13102606, upload-time = "2025-12-15T05:02:46.833Z" },
-    { url = "https://files.pythonhosted.org/packages/ca/a5/43dfad311a734b48a752790571fd9e12d61893849a01bff346a54011957f/mypy-1.19.1-cp39-cp39-macosx_11_0_arm64.whl", hash = "sha256:b7951a701c07ea584c4fe327834b92a30825514c868b1f69c30445093fdd9d5a", size = 12164496, upload-time = "2025-12-15T05:03:41.947Z" },
-    { url = "https://files.pythonhosted.org/packages/88/f0/efbfa391395cce2f2771f937e0620cfd185ec88f2b9cd88711028a768e96/mypy-1.19.1-cp39-cp39-manylinux2014_aarch64.manylinux_2_17_aarch64.manylinux_2_28_aarch64.whl", hash = "sha256:b13cfdd6c87fc3efb69ea4ec18ef79c74c3f98b4e5498ca9b85ab3b2c2329a67", size = 12772068, upload-time = "2025-12-15T05:02:53.689Z" },
-    { url = "https://files.pythonhosted.org/packages/25/05/58b3ba28f5aed10479e899a12d2120d582ba9fa6288851b20bf1c32cbb4f/mypy-1.19.1-cp39-cp39-manylinux2014_x86_64.manylinux_2_17_x86_64.manylinux_2_28_x86_64.whl", hash = "sha256:4f28f99c824ecebcdaa2e55d82953e38ff60ee5ec938476796636b86afa3956e", size = 13520385, upload-time = "2025-12-15T05:02:38.328Z" },
-    { url = "https://files.pythonhosted.org/packages/c5/a0/c006ccaff50b31e542ae69b92fe7e2f55d99fba3a55e01067dd564325f85/mypy-1.19.1-cp39-cp39-musllinux_1_2_x86_64.whl", hash = "sha256:c608937067d2fc5a4dd1a5ce92fd9e1398691b8c5d012d66e1ddd430e9244376", size = 13796221, upload-time = "2025-12-15T05:03:22.147Z" },
-    { url = "https://files.pythonhosted.org/packages/b2/ff/8bdb051cd710f01b880472241bd36b3f817a8e1c5d5540d0b761675b6de2/mypy-1.19.1-cp39-cp39-win_amd64.whl", hash = "sha256:409088884802d511ee52ca067707b90c883426bd95514e8cfda8281dc2effe24", size = 10055456, upload-time = "2025-12-15T05:03:35.169Z" },
-    { url = "https://files.pythonhosted.org/packages/8d/f4/4ce9a05ce5ded1de3ec1c1d96cf9f9504a04e54ce0ed55cfa38619a32b8d/mypy-1.19.1-py3-none-any.whl", hash = "sha256:f1235f5ea01b7db5468d53ece6aaddf1ad0b88d9e7462b86ef96fe04995d7247", size = 2471239, upload-time = "2025-12-15T05:03:07.248Z" },
 ]
 
 [[package]]
 name = "mypy"
 version = "2.3.0"
 source = { registry = "https://pypi.org/simple" }
-resolution-markers = [
-    "python_full_version >= '3.15'",
-    "python_full_version >= '3.11' and python_full_version < '3.15'",
-    "python_full_version == '3.10.*'",
-]
 dependencies = [
-    { name = "ast-serialize", marker = "python_full_version >= '3.10'" },
-    { name = "librt", marker = "python_full_version >= '3.10' and platform_python_implementation != 'PyPy'" },
-    { name = "mypy-extensions", marker = "python_full_version >= '3.10'" },
-    { name = "pathspec", marker = "python_full_version >= '3.10'" },
-    { name = "tomli", marker = "python_full_version == '3.10.*'" },
-    { name = "typing-extensions", marker = "python_full_version >= '3.10'" },
+    { name = "ast-serialize" },
+    { name = "librt", marker = "platform_python_implementation != 'PyPy'" },
+    { name = "mypy-extensions" },
+    { name = "pathspec" },
+    { name = "tomli", marker = "python_full_version < '3.11'" },
+    { name = "typing-extensions" },
 ]
 sdist = { url = "https://files.pythonhosted.org/packages/12/af/4e516a05d3ca2eb9283e9ec45b2c02225c1514dd6da49fd3c9eaa6639370/mypy-2.3.0.tar.gz", hash = "sha256:465965d41cd9a2726694e983e8ce7113259327bec798115d1e1dfa2a52fb666e", size = 3988104, upload-time = "2026-07-13T11:34:53.387Z" }
 wheels = [
@@ -605,83 +412,24 @@ wheels = [
     { url = "https://files.pythonhosted.org/packages/54/20/4d324d65cc6d9205fabedc306948156824eb9f0ee1633355a8f7ec5c66bf/pluggy-1.6.0-py3-none-any.whl", hash = "sha256:e920276dd6813095e9377c0bc5566d94c932c33b27a3e3945d8389c374dd4746", size = 20538, upload-time = "2025-05-15T12:30:06.134Z" },
 ]
 
-[[package]]
-name = "pycparser"
-version = "2.23"
-source = { registry = "https://pypi.org/simple" }
-resolution-markers = [
-    "python_full_version < '3.10'",
-]
-sdist = { url = "https://files.pythonhosted.org/packages/fe/cf/d2d3b9f5699fb1e4615c8e32ff220203e43b248e1dfcc6736ad9057731ca/pycparser-2.23.tar.gz", hash = "sha256:78816d4f24add8f10a06d6f05b4d424ad9e96cfebf68a4ddc99c65c0720d00c2", size = 173734, upload-time = "2025-09-09T13:23:47.91Z" }
-wheels = [
-    { url = "https://files.pythonhosted.org/packages/a0/e3/59cd50310fc9b59512193629e1984c1f95e5c8ae6e5d8c69532ccc65a7fe/pycparser-2.23-py3-none-any.whl", hash = "sha256:e5c6e8d3fbad53479cab09ac03729e0a9faf2bee3db8208a550daf5af81a5934", size = 118140, upload-time = "2025-09-09T13:23:46.651Z" },
-]
-
 [[package]]
 name = "pycparser"
 version = "3.0"
 source = { registry = "https://pypi.org/simple" }
-resolution-markers = [
-    "python_full_version >= '3.15'",
-    "python_full_version >= '3.11' and python_full_version < '3.15'",
-    "python_full_version == '3.10.*'",
-]
 sdist = { url = "https://files.pythonhosted.org/packages/1b/7d/92392ff7815c21062bea51aa7b87d45576f649f16458d78b7cf94b9ab2e6/pycparser-3.0.tar.gz", hash = "sha256:600f49d217304a5902ac3c37e1281c9fe94e4d0489de643a9504c5cdfdfc6b29", size = 103492, upload-time = "2026-01-21T14:26:51.89Z" }
 wheels = [
     { url = "https://files.pythonhosted.org/packages/0c/c3/44f3fbbfa403ea2a7c779186dc20772604442dde72947e7d01069cbe98e3/pycparser-3.0-py3-none-any.whl", hash = "sha256:b727414169a36b7d524c1c3e31839a521725078d7b2ff038656844266160a992", size = 48172, upload-time = "2026-01-21T14:26:50.693Z" },
 ]
 
-[[package]]
-name = "pygit2"
-version = "1.15.1"
-source = { registry = "https://pypi.org/simple" }
-resolution-markers = [
-    "python_full_version < '3.10'",
-]
-dependencies = [
-    { name = "cffi", version = "2.0.0", source = { registry = "https://pypi.org/simple" }, marker = "python_full_version < '3.10'" },
-]
-sdist = { url = "https://files.pythonhosted.org/packages/53/77/d33e2c619478d0daea4a50f9ffdd588db2ca55817c7e9a6c796fca3b80ef/pygit2-1.15.1.tar.gz", hash = "sha256:e1fe8b85053d9713043c81eccc74132f9e5b603f209e80733d7955eafd22eb9d", size = 768818, upload-time = "2024-07-07T11:34:07.673Z" }
-wheels = [
-    { url = "https://files.pythonhosted.org/packages/bb/f4/a2b3adf7e7c76dae9441fc26fc34a6fceb053527661733279fd66a048e7e/pygit2-1.15.1-cp310-cp310-macosx_10_9_universal2.whl", hash = "sha256:bb60dbb93135e36b86dd8012ee707ea3b68c02869b6d10f23cfb86e10798bf6f", size = 5873785, upload-time = "2024-07-07T10:54:55.226Z" },
-    { url = "https://files.pythonhosted.org/packages/6c/79/1a461f52f2c57e5b5169136533bd15dec59ec5f4ddcb3aee5b6ee3862937/pygit2-1.15.1-cp310-cp310-manylinux_2_17_aarch64.manylinux2014_aarch64.whl", hash = "sha256:06d42733a767bfe9245df15f4585823243f0845fab8c81a2c680a0e49a9cb012", size = 4843813, upload-time = "2024-07-07T10:54:59.191Z" },
-    { url = "https://files.pythonhosted.org/packages/5b/dd/6863c0d467f4bda1d59bb2304df96a88fc7779df8c07f0a1bb821e7a8749/pygit2-1.15.1-cp310-cp310-manylinux_2_17_ppc64le.manylinux2014_ppc64le.whl", hash = "sha256:e9c417d90915e59fd1a5a6532d47c8f2da5f97fd769e5ae9f5b9edec3a7bc669", size = 5285656, upload-time = "2024-07-07T10:55:01.202Z" },
-    { url = "https://files.pythonhosted.org/packages/63/61/5d9a6a87a7ac74d0e82900ce1ea4a2a500af3427cf27587512a9f37fad3f/pygit2-1.15.1-cp310-cp310-manylinux_2_17_x86_64.manylinux2014_x86_64.whl", hash = "sha256:fb6abaef13b304a009584a0561acec21d1df4e57899fc85e8af4533352123c5e", size = 5135305, upload-time = "2024-07-07T10:55:03.67Z" },
-    { url = "https://files.pythonhosted.org/packages/e6/9f/8056c5152cb4e53ffad6d25e73997e4cce48a6152e12aaa07f0a3122c627/pygit2-1.15.1-cp310-cp310-musllinux_1_2_x86_64.whl", hash = "sha256:511b082c6d6c7b01cb8d49e108d066a1b5211c7364a0d8e7178809b8a304ac4b", size = 5074126, upload-time = "2024-07-07T10:55:05.919Z" },
-    { url = "https://files.pythonhosted.org/packages/84/7f/cfeae79903f57923f315bcc3ebda673de2657d49009176ede0ad0b1b985a/pygit2-1.15.1-cp310-cp310-win32.whl", hash = "sha256:86ad7c8ec6fd545a65952066a693cb2ee4f26a0f6a8577e866f6742fc7eddb11", size = 1187753, upload-time = "2024-07-07T06:54:10.091Z" },
-    { url = "https://files.pythonhosted.org/packages/16/27/0310ab41371bb64e149e50d954aa089b140f269159d4d6ed34c83e4be7f2/pygit2-1.15.1-cp310-cp310-win_amd64.whl", hash = "sha256:b08d62ad424ba04ed7572d0a927f43cdccbf20c7c88250232a477fcb0a901701", size = 1269849, upload-time = "2024-07-07T06:58:56.73Z" },
-    { url = "https://files.pythonhosted.org/packages/bf/b9/8d1d481ef2aa7c8acb9dc77e6eab1f2848ef4599be2e574ad941fd411bda/pygit2-1.15.1-cp311-cp311-macosx_10_9_universal2.whl", hash = "sha256:23afb0a683285c02ff84f7ac574c39fec52b66032f92e8ca038cc81cfc68037a", size = 5873816, upload-time = "2024-07-07T10:55:07.962Z" },
-    { url = "https://files.pythonhosted.org/packages/9f/64/4cbb586576ca49eac3b45a4cf26a0795903a3034f7f3fb97c4d5dcd62fff/pygit2-1.15.1-cp311-cp311-manylinux_2_17_aarch64.manylinux2014_aarch64.whl", hash = "sha256:f2418b29da5bad17e13674041790f2eda399c92d2e61c1be08f58df18dc99b56", size = 4851699, upload-time = "2024-07-07T10:55:10.09Z" },
-    { url = "https://files.pythonhosted.org/packages/50/ae/4363a2b06024b789225672545e17f449b8fec983bc0cbbb864c5c65424bc/pygit2-1.15.1-cp311-cp311-manylinux_2_17_ppc64le.manylinux2014_ppc64le.whl", hash = "sha256:f7d5329fd0658644de38bdb0ad8fad7877803f92a108acfc813525cbb5bd75a1", size = 5293607, upload-time = "2024-07-07T10:55:11.974Z" },
-    { url = "https://files.pythonhosted.org/packages/7c/ac/5aa0a1a0db69da99b6c455f05b203646106101865cff12293b1311f9a699/pygit2-1.15.1-cp311-cp311-manylinux_2_17_x86_64.manylinux2014_x86_64.whl", hash = "sha256:435b90bfddae32c6a00b48ff7da26564027dccd84e49866f48e659c9f3de6772", size = 5143121, upload-time = "2024-07-07T10:55:14.249Z" },
-    { url = "https://files.pythonhosted.org/packages/65/60/42146afe07736fd169541ecc7b9689fd7869760ff4d7f5a9f523f4c3a304/pygit2-1.15.1-cp311-cp311-musllinux_1_2_x86_64.whl", hash = "sha256:e0a32a3c7742db8d925712344eaeb205c0a6076779035fea24574ea2507ba34c", size = 5080440, upload-time = "2024-07-07T10:55:16.161Z" },
-    { url = "https://files.pythonhosted.org/packages/98/2c/9d7859fba63ff97922db97618b75efe5aeff9723bb9ca0e47c22ea55ba66/pygit2-1.15.1-cp311-cp311-win32.whl", hash = "sha256:0367f94cb4413bc668bcf1fd7f941bb1c1f214545d47b964442857de234799cf", size = 1187763, upload-time = "2024-07-07T07:03:46.884Z" },
-    { url = "https://files.pythonhosted.org/packages/84/d3/5985cd4a3d8e6e2a1db0f076a760e419c0792355cedbd76d42ed090cfc88/pygit2-1.15.1-cp311-cp311-win_amd64.whl", hash = "sha256:167c23272b225ddd3be1e794bd8085b3c4e394cbdb70a1be278ab32e228ccedc", size = 1269965, upload-time = "2024-07-07T07:09:02.536Z" },
-    { url = "https://files.pythonhosted.org/packages/08/85/3549b5c8af62df724e51c621125c48b9d6cf2017e066c4be6c42e9d4d074/pygit2-1.15.1-cp312-cp312-macosx_10_9_universal2.whl", hash = "sha256:2996180cbe7653e98839eb3afa5c040081f6e1cc835824769efe84c76ea2caf8", size = 5875575, upload-time = "2024-07-07T10:55:19.133Z" },
-    { url = "https://files.pythonhosted.org/packages/fb/1e/0210d1f77f3b2567ab28d6c8d9762bb1fc869bc50c54b28a70eae77fa32f/pygit2-1.15.1-cp312-cp312-manylinux_2_17_aarch64.manylinux2014_aarch64.whl", hash = "sha256:1b269b504d47b50e4ed7fe21326c0d046a0ab8b8897db059bdc208e2210e3070", size = 4848328, upload-time = "2024-07-07T10:55:21.434Z" },
-    { url = "https://files.pythonhosted.org/packages/11/49/91fbcdd2b646902cd74c125a514183f9b97bca319b4619c1b938596930ca/pygit2-1.15.1-cp312-cp312-manylinux_2_17_ppc64le.manylinux2014_ppc64le.whl", hash = "sha256:4072b80018b8c0e1743e9803b717e026d3017df291e2d81f7b869ebe18b01286", size = 5288628, upload-time = "2024-07-07T10:55:23.209Z" },
-    { url = "https://files.pythonhosted.org/packages/87/f6/ed80ec729fe5152a8918f98a5bffa4134235fda1d9318a5480519d1dd118/pygit2-1.15.1-cp312-cp312-manylinux_2_17_x86_64.manylinux2014_x86_64.whl", hash = "sha256:4d5839566491378b84dec1c35ffdb28b70fb6cd4ea2604a59052c4e4cf1c9da1", size = 5143601, upload-time = "2024-07-07T10:55:25.353Z" },
-    { url = "https://files.pythonhosted.org/packages/5f/8f/3b7427cefbbfbcf10edd88bbc43d15f3ee0d851d97eaf02feec7ae163ab1/pygit2-1.15.1-cp312-cp312-musllinux_1_2_x86_64.whl", hash = "sha256:5214ac7844e10cc279d746b588b5e6c6d73520d36d1361fe18e6e9d9c86ad357", size = 5084978, upload-time = "2024-07-07T10:55:27.253Z" },
-    { url = "https://files.pythonhosted.org/packages/e9/ad/097879873d5bf5f66e2293c8af94b5d11e1b80ef744330197455f5971833/pygit2-1.15.1-cp312-cp312-win32.whl", hash = "sha256:4cb1c22351c43c3cc96e842f31bd9b331a0ea7cb62aa8cf32433d45eebde0b1c", size = 1188620, upload-time = "2024-07-07T07:13:20.943Z" },
-    { url = "https://files.pythonhosted.org/packages/0f/be/448932147a71986d0d758ecf118d54daa44847a7c9f9f8ff515d9467a449/pygit2-1.15.1-cp312-cp312-win_amd64.whl", hash = "sha256:a5a4d288a7b0006f78e02e2c539e6218b254a8228e754051fd5532595fbf9a4c", size = 1270395, upload-time = "2024-07-07T07:17:42.944Z" },
-    { url = "https://files.pythonhosted.org/packages/0f/b7/0e6927563d8f4221d588cc256eba82579c33fbcb75a7939a4c9ef3b9e5f0/pygit2-1.15.1-cp39-cp39-macosx_10_9_universal2.whl", hash = "sha256:5e1d338c88e1425e3dc09a3147b42683205b2dbb00b14c0ce80123f059e51de8", size = 5873946, upload-time = "2024-07-07T10:55:29.302Z" },
-    { url = "https://files.pythonhosted.org/packages/2a/45/8abc41848d4c8fa970daf8e95fd974ac662265ae1f024637a0121429f4e3/pygit2-1.15.1-cp39-cp39-manylinux_2_17_aarch64.manylinux2014_aarch64.whl", hash = "sha256:a0c6d5df5029f4cb25b0d7d8f04cb39691c107eedee1f157ee25be3b0b9df7c6", size = 4838988, upload-time = "2024-07-07T10:55:31.028Z" },
-    { url = "https://files.pythonhosted.org/packages/58/12/eabd9326952fb61bc1dac0e8f3c7eb1ecba07c2cdfbe7071216c833d08c0/pygit2-1.15.1-cp39-cp39-manylinux_2_17_ppc64le.manylinux2014_ppc64le.whl", hash = "sha256:0bcce4cfdabc05a2a35d709513863bcce8c929492ae7c0d56f045838bd57ea8f", size = 5281706, upload-time = "2024-07-07T10:55:33.286Z" },
-    { url = "https://files.pythonhosted.org/packages/e3/5a/1623939f406c525e7a1dcfec2e7ee929515513a0e062c3f7f918c0d9dec9/pygit2-1.15.1-cp39-cp39-manylinux_2_17_x86_64.manylinux2014_x86_64.whl", hash = "sha256:709f5d9592764ec5d6652e73882997f38cc8e6c7b495792698ecaca3e6a26088", size = 5130539, upload-time = "2024-07-07T10:55:35.027Z" },
-    { url = "https://files.pythonhosted.org/packages/c0/08/3d34c252b135340e8fd57346453414560888d896087e9148d93affe84f77/pygit2-1.15.1-cp39-cp39-musllinux_1_2_x86_64.whl", hash = "sha256:738be5d3a3e7775571b14d3d110cfab10260f846078c402c041486f3582dbfbe", size = 5068620, upload-time = "2024-07-07T10:55:36.992Z" },
-    { url = "https://files.pythonhosted.org/packages/0f/17/22e60e6fd3d4f8d3540f136127ca1a723bbf9650e680ce7199e8d14e9888/pygit2-1.15.1-cp39-cp39-win32.whl", hash = "sha256:cd2861963bb904bd41162e9148676990f147da7dbc535ceea070ab371012bfed", size = 1188070, upload-time = "2024-07-07T06:44:34.652Z" },
-    { url = "https://files.pythonhosted.org/packages/2b/6a/6527e6e0e2130e0a5f2bb7ab14a138f0f1f99348123c128bf642f335c03e/pygit2-1.15.1-cp39-cp39-win_amd64.whl", hash = "sha256:1d622d0f97a34982973f9885d145b1176e912ea9f191e1c95233a6175a47fa28", size = 1270325, upload-time = "2024-07-07T06:49:15.037Z" },
-]
-
 [[package]]
 name = "pygit2"
 version = "1.18.2"
 source = { registry = "https://pypi.org/simple" }
 resolution-markers = [
-    "python_full_version == '3.10.*'",
+    "python_full_version < '3.11'",
 ]
 dependencies = [
-    { name = "cffi", version = "2.1.0", source = { registry = "https://pypi.org/simple" }, marker = "python_full_version == '3.10.*'" },
+    { name = "cffi" },
 ]
 sdist = { url = "https://files.pythonhosted.org/packages/2e/ea/762d00f6f518423cd889e39b12028844cc95f91a6413cf7136e184864821/pygit2-1.18.2.tar.gz", hash = "sha256:eca87e0662c965715b7f13491d5e858df2c0908341dee9bde2bc03268e460f55", size = 797200, upload-time = "2025-08-16T13:52:36.853Z" }
 wheels = [
@@ -732,7 +480,7 @@ resolution-markers = [
     "python_full_version >= '3.11' and python_full_version < '3.15'",
 ]
 dependencies = [
-    { name = "cffi", version = "2.1.0", source = { registry = "https://pypi.org/simple" }, marker = "python_full_version >= '3.11'" },
+    { name = "cffi" },
 ]
 sdist = { url = "https://files.pythonhosted.org/packages/a6/44/415aa93422b4bfc21a6448acb7e16280d5f33a9a3fae38a384e37b046ae4/pygit2-1.19.3.tar.gz", hash = "sha256:a543e6d4ebb43825564935758dc234e770016fed673b84370d46ae9580558831", size = 810489, upload-time = "2026-06-13T08:06:04.982Z" }
 wheels = [
@@ -815,44 +563,18 @@ wheels = [
     { url = "https://files.pythonhosted.org/packages/0a/49/385be530a6a5b78d1cbcd5c2e38debc8959a2fc6bdb716f4e581002979fc/pyright-1.1.411-py3-none-any.whl", hash = "sha256:dc7c72a8e2700c55baa127554040e067041ea53ccfd50bf96308cc4291c7d5d9", size = 6181526, upload-time = "2026-06-25T02:14:04.691Z" },
 ]
 
-[[package]]
-name = "pytest"
-version = "8.4.2"
-source = { registry = "https://pypi.org/simple" }
-resolution-markers = [
-    "python_full_version < '3.10'",
-]
-dependencies = [
-    { name = "colorama", marker = "python_full_version < '3.10' and sys_platform == 'win32'" },
-    { name = "exceptiongroup", marker = "python_full_version < '3.10'" },
-    { name = "iniconfig", version = "2.1.0", source = { registry = "https://pypi.org/simple" }, marker = "python_full_version < '3.10'" },
-    { name = "packaging", marker = "python_full_version < '3.10'" },
-    { name = "pluggy", marker = "python_full_version < '3.10'" },
-    { name = "pygments", marker = "python_full_version < '3.10'" },
-    { name = "tomli", marker = "python_full_version < '3.10'" },
-]
-sdist = { url = "https://files.pythonhosted.org/packages/a3/5c/00a0e072241553e1a7496d638deababa67c5058571567b92a7eaa258397c/pytest-8.4.2.tar.gz", hash = "sha256:86c0d0b93306b961d58d62a4db4879f27fe25513d4b969df351abdddb3c30e01", size = 1519618, upload-time = "2025-09-04T14:34:22.711Z" }
-wheels = [
-    { url = "https://files.pythonhosted.org/packages/a8/a4/20da314d277121d6534b3a980b29035dcd51e6744bd79075a6ce8fa4eb8d/pytest-8.4.2-py3-none-any.whl", hash = "sha256:872f880de3fc3a5bdc88a11b39c9710c3497a547cfa9320bc3c5e62fbf272e79", size = 365750, upload-time = "2025-09-04T14:34:20.226Z" },
-]
-
 [[package]]
 name = "pytest"
 version = "9.1.1"
 source = { registry = "https://pypi.org/simple" }
-resolution-markers = [
-    "python_full_version >= '3.15'",
-    "python_full_version >= '3.11' and python_full_version < '3.15'",
-    "python_full_version == '3.10.*'",
-]
 dependencies = [
-    { name = "colorama", marker = "python_full_version >= '3.10' and sys_platform == 'win32'" },
-    { name = "exceptiongroup", marker = "python_full_version == '3.10.*'" },
-    { name = "iniconfig", version = "2.3.0", source = { registry = "https://pypi.org/simple" }, marker = "python_full_version >= '3.10'" },
-    { name = "packaging", marker = "python_full_version >= '3.10'" },
-    { name = "pluggy", marker = "python_full_version >= '3.10'" },
-    { name = "pygments", marker = "python_full_version >= '3.10'" },
-    { name = "tomli", marker = "python_full_version == '3.10.*'" },
+    { name = "colorama", marker = "sys_platform == 'win32'" },
+    { name = "exceptiongroup", marker = "python_full_version < '3.11'" },
+    { name = "iniconfig" },
+    { name = "packaging" },
+    { name = "pluggy" },
+    { name = "pygments" },
+    { name = "tomli", marker = "python_full_version < '3.11'" },
 ]
 sdist = { url = "https://files.pythonhosted.org/packages/e4/47/b9efed96c114afcfa3c9d3fe98a76a1d14c74a9e266d397cf6eb64be5e01/pytest-9.1.1.tar.gz", hash = "sha256:1088fbde8f2b49d95a549a195707afa7a76a3ce9bcadc26b6d71f0ffda5fe313", size = 1636369, upload-time = "2026-06-19T10:58:32.857Z" }
 wheels = [

-- 
2.56.0.rc0.692.g34fd115c35.frankengit

