Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B07837B417
	for <tools@linux.kernel.org>; Mon, 20 Apr 2026 04:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776659965; cv=none; b=c1FpXcHEsX2DF2d4BA8cyoIc/3BjianL69UxV/AgXTQ+OnsTC3FLQAL8ZyVO3jeWmNBeZq9uq20bvbdLYQLG8WmfNDCe/lgbAziPL8aiwH7q/UHbIRcULEcs4cFA8OKxkrLsGIai261r/prrd11c9yzgXlodqHulK98uuwv522w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776659965; c=relaxed/simple;
	bh=XbM9QRlXRFxCIFVKDf+M5R/aTLczGK59mJxCNVaHJ5s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mq+Kad2UGfrRqy/IubapLgaq5x7v4zEjzqwQecGyQPrReKr6v3CKxMw/sW6VQI3Z3OvqLZpCqXOK+l/rqAAL1fhtpHebCAvgNcQGWNbss4Y81Ko2dgqAp14I52cd2K4m5dtotaiVW/mezW1b9zL67eZPysjSoUTeKBRVVcY7bac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ieVDo3On; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ieVDo3On"
Received: by smtp.kernel.org (Postfix)
	id 3EB32C2BCB6; Mon, 20 Apr 2026 04:39:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04D10C19425;
	Mon, 20 Apr 2026 04:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776659965;
	bh=XbM9QRlXRFxCIFVKDf+M5R/aTLczGK59mJxCNVaHJ5s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ieVDo3OnZzEyZ54268W7GVNjowKNf35BqvPyc6FxgdWMTAsJ4eAI1tDYSw5sqO76u
	 mI8FwU5pOWvcG6AzUu+OHMHFwqfHSHhVgiKGR2H82rRL34NzR2x5MIJaoJclmTYu8O
	 EjM/+pP8jSuq2bJZ712Cd4P5GPj5GmaKg8xQ4GOt/DFpqfCkvtEqzeNfvkmxurQejF
	 J/qgtBacQTxEyQ/kEAia+cqn1OCDs1fk/Sf/bmzGnI2hPOtPE0D9HsKvAc2cRm8wHp
	 2NLwTUK96kKcruPUB7jAh1uHARvYUPYXL2wV8hh5oqBd5tO/96U9AnMgcwaRLK9BOI
	 MR3lfmY93zY9Q==
From: Tamir Duberstein <tamird@kernel.org>
Date: Sun, 19 Apr 2026 21:39:23 -0700
Subject: [PATCH ezgb 2/6] Add mypy checks
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260419-stronger-type-checking-v1-2-222775b987e5@kernel.org>
References: <20260419-stronger-type-checking-v1-0-222775b987e5@kernel.org>
In-Reply-To: <20260419-stronger-type-checking-v1-0-222775b987e5@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=69820; i=tamird@kernel.org;
 h=from:subject:message-id; bh=XbM9QRlXRFxCIFVKDf+M5R/aTLczGK59mJxCNVaHJ5s=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlP1/5u+7czIPLEvd9L+e4eenqfQU7mzqk5In4/GF3F9
 nkueMyU1zGRhUGMi8FSTJElUfTQ3vTU23tkM98dh5nDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DI10DHSMGbg4BWCqP09nZLjwccnP5phkYT3zRd3qM/4UhItNd9Yv9+sxfDgrxO7E0S2MDO/vxx5
 6ujDb/NibyTcnWvO5rBY8obPnD8+CU96nFNI2tfEAAA==
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

Add mypy to the local CI script after typing the shared test helpers and
fixtures.

Use a typed BugWriter test double instead of attaching ad-hoc private
attributes to BugWriter instances.

Bump requires-python to 3.10 because the typed implementation uses
TypeGuard.

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
 ci.sh                     |   1 +
 pyproject.toml            |   2 +-
 src/ezgb/__init__.py      |  14 +++-
 src/ezgb/_reader.py       | 162 +++++++++++++++++++++++++++----------
 src/ezgb/_types.py        |  14 ++++
 tests/conftest.py         | 147 ++++++++++++++++++++++++----------
 tests/test_ezgb.py        | 200 ++++++++++++++++++++++++++++------------------
 tests/test_integration.py |  59 ++++++++------
 8 files changed, 406 insertions(+), 193 deletions(-)

diff --git a/ci.sh b/ci.sh
index e589443..3001db2 100755
--- a/ci.sh
+++ b/ci.sh
@@ -3,4 +3,5 @@
 set -eu
 
 uv run ruff check
+uv run mypy .
 uv run pytest --durations=0
diff --git a/pyproject.toml b/pyproject.toml
index 8ff6e08..aeae989 100644
--- a/pyproject.toml
+++ b/pyproject.toml
@@ -7,7 +7,7 @@ name = 'ezgb'
 version = '0.1.1'
 description = 'A standalone Python library for working with git-bug repositories'
 readme = 'README.md'
-requires-python = '>=3.9'
+requires-python = '>=3.10'
 dependencies = ['pygit2']
 license = 'GPL-2.0-or-later'
 license-files = ['COPYING']
diff --git a/src/ezgb/__init__.py b/src/ezgb/__init__.py
index 38f5582..f60d63e 100644
--- a/src/ezgb/__init__.py
+++ b/src/ezgb/__init__.py
@@ -23,6 +23,7 @@ from ezgb._models import (
     UnsupportedFormatError,
 )
 from ezgb._reader import BugReader
+from ezgb._types import JsonValue
 from ezgb._writer import BugWriter
 
 __all__ = [
@@ -171,11 +172,13 @@ class GitBugRepo:
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
@@ -188,9 +191,14 @@ class GitBugRepo:
                   if isinstance(create_time, dict) else 0)
             et = (edit_time.get('timestamp', 0)
                   if isinstance(edit_time, dict) else 0)
+            if not isinstance(ct, (bool, int, float, str)):
+                ct = 0
+            if not isinstance(et, (bool, int, float, str)):
+                et = 0
             author = raw.get('author') or {}
             author_name = (author.get('name', '')
                            if isinstance(author, dict) else '')
+            assert isinstance(author_name, str)
             author_id = (author.get('id', '')
                          if isinstance(author, dict) else '')
             raw_labels = raw.get('labels') or []
@@ -265,11 +273,13 @@ class GitBugRepo:
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
index ce3b6f1..dac4a8c 100644
--- a/src/ezgb/_reader.py
+++ b/src/ezgb/_reader.py
@@ -10,7 +10,7 @@ import json
 import logging
 import os
 from datetime import datetime, timezone
-from typing import Any
+from typing import TypeGuard, TypeVar
 
 import pygit2
 
@@ -35,12 +35,23 @@ from ezgb._models import (
     Status,
     UnsupportedFormatError,
 )
+from ezgb._types import JsonValue
 
 logger = logging.getLogger('ezgb')
 
 # Length of a full git-bug entity ID (SHA-256 hex)
 _ID_LENGTH = 64
+_JsonObject = dict[str, JsonValue]
 
+_K = TypeVar('_K')
+_T = TypeVar('_T')
+_U = TypeVar('_U')
+
+def _is_list(value: list[_T], item_ty: type[_U]) -> TypeGuard[list[_U]]:
+    return all(isinstance(item, item_ty) for item in value)
+
+def _is_dict_values(value: dict[_K, _T], value_ty: type[_U]) -> TypeGuard[dict[_K, _U]]:
+    return all(isinstance(value, value_ty) for value in value.values())
 
 def _combine_ids(primary: str, secondary: str) -> str:
     """Interleave primary and secondary IDs into a CombinedId.
@@ -64,7 +75,6 @@ def _combine_ids(primary: str, secondary: str) -> str:
             pi += 1
     return ''.join(result)
 
-
 class BugReader:
     """Reads bug and identity data from git-bug's git object storage."""
 
@@ -73,7 +83,7 @@ class BugReader:
         gitdir = repo_path
         if os.path.isdir(os.path.join(repo_path, '.git')):
             gitdir = os.path.join(repo_path, '.git')
-        self._pygit: Any = pygit2.Repository(gitdir)
+        self._pygit: pygit2.Repository = pygit2.Repository(gitdir)
         self._bug_cache: dict[str, Bug] = {}
         self._summary_cache: dict[str, BugSummary] = {}
         self._identity_cache: dict[str, Identity] = {}
@@ -87,7 +97,7 @@ class BugReader:
             obj = self._pygit.get(blob_hash)
         except (ValueError, KeyError):
             obj = None
-        if obj is None or obj.type != pygit2.GIT_OBJECT_BLOB:
+        if obj is None or not isinstance(obj, pygit2.Blob):
             raise BugNotFoundError('failed to read blob %s' % blob_hash)
         result: str = obj.data.decode(errors='replace')
         return result
@@ -98,7 +108,7 @@ class BugReader:
             obj = self._pygit.get(blob_hash)
         except (ValueError, KeyError):
             obj = None
-        if obj is None or obj.type != pygit2.GIT_OBJECT_BLOB:
+        if obj is None or not isinstance(obj, pygit2.Blob):
             raise BugNotFoundError('failed to read blob %s' % blob_hash)
         return bytes(obj.data)
 
@@ -218,7 +228,7 @@ class BugReader:
 
     def _get_op_packs(
         self, bid: str,
-    ) -> tuple[list[dict[str, Any]], list[str]]:
+    ) -> tuple[list[_JsonObject], list[str]]:
         """Walk the commit chain for a bug and return operation packs
         (oldest first) together with the raw blob strings.
 
@@ -238,18 +248,19 @@ class BugReader:
             tip = ref.peel(pygit2.Commit)
             self._check_format_version_tree(
                 tip.tree, 'version-', SUPPORTED_BUG_FORMAT)
-        packs: list[dict[str, Any]] = []
+        packs: list[_JsonObject] = []
         raw_blobs: list[str] = []
         for _commit, blob_hash in entries:
             raw = self._cat_blob(blob_hash)
             try:
-                pack: dict[str, Any] = json.loads(raw)
+                pack: JsonValue = json.loads(raw)
             except json.JSONDecodeError:
                 logger.warning(
                     'failed to parse ops blob %s for bug %s',
                     blob_hash, bid,
                 )
                 continue
+            assert isinstance(pack, dict)
             packs.append(pack)
             raw_blobs.append(raw)
         return packs, raw_blobs
@@ -285,26 +296,36 @@ class BugReader:
 
         version_blob = tip.tree['version']
         try:
-            raw = self._pygit[version_blob.id].data.decode(
-                errors='replace')
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
@@ -345,10 +366,13 @@ class BugReader:
         """
         decoder = json.JSONDecoder()
         try:
+            pack: JsonValue
             pack, _ = decoder.raw_decode(blob_json)
         except json.JSONDecodeError:
             return []
+        assert isinstance(pack, dict)
         raw_ops = pack.get('ops')
+        assert isinstance(raw_ops, list)
         if not raw_ops:
             return []
         # Walk forward through the string to slice each op.
@@ -361,7 +385,8 @@ class BugReader:
             # we need to step past commas between elements.
             while blob_json[pos] in ' \t\n\r,':
                 pos += 1
-            _, end_pos = decoder.raw_decode(blob_json, pos)
+            _decoded_op: JsonValue
+            _decoded_op, end_pos = decoder.raw_decode(blob_json, pos)
             ops.append(blob_json[pos:end_pos])
             pos = end_pos
         return ops
@@ -393,7 +418,7 @@ class BugReader:
 
     def build_bug(
         self, bid: str,
-        packs: list[dict[str, Any]] | None = None,
+        packs: list[_JsonObject] | None = None,
         raw_blobs: list[str] | None = None,
     ) -> Bug:
         """Reconstruct a bug snapshot by replaying operation packs.
@@ -428,24 +453,36 @@ class BugReader:
         op_hash_map: dict[str, Comment] = {}
 
         for pack_idx, pack in enumerate(packs):
-            author_id = pack.get('author', {}).get('id', '')
+            author_value = pack.get('author', {})
+            assert isinstance(author_value, dict)
+            author_id = author_value.get('id', '')
+            assert isinstance(author_id, str)
             raw_ops = (raw_ops_per_pack[pack_idx]
                        if pack_idx < len(raw_ops_per_pack) else [])
-            for op_idx, op in enumerate(pack.get('ops', [])):
+            ops = pack.get('ops', [])
+            assert isinstance(ops, list)
+            for op_idx, op in enumerate(ops):
+                assert isinstance(op, dict)
                 op_type = op.get('type', 0)
+                assert isinstance(op_type, int)
                 timestamp = op.get('timestamp', 0)
+                assert isinstance(timestamp, int)
                 raw_json = (raw_ops[op_idx]
                             if op_idx < len(raw_ops) else '')
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
-                        files = op.get('files') or []
+                    if message := op.get('message'):
+                        assert isinstance(message, str)
+                        files = op.get('files', [])
+                        assert isinstance(files, list)
+                        assert _is_list(files, str)
                         combined_id = _combine_ids(bid, op_id)
                         cmt = Comment(
                             id=combined_id,
@@ -453,22 +490,29 @@ class BugReader:
                             text=message,
                             created_at=self._format_timestamp(timestamp),
                             count=comment_count,
-                            attachment_ids=list(files),
+                            attachment_ids=files,
                         )
                         comments.append(cmt)
                         op_hash_map[op_id] = cmt
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
-                    files = op.get('files') or []
+                    assert isinstance(message, str)
+                    files = op.get('files', [])
+                    assert isinstance(files, list)
+                    assert _is_list(files, str)
                     op_author = self.resolve_identity(author_id)
                     combined_id = _combine_ids(bid, op_id)
                     cmt = Comment(
@@ -477,7 +521,7 @@ class BugReader:
                         text=message,
                         created_at=self._format_timestamp(timestamp),
                         count=comment_count,
-                        attachment_ids=list(files),
+                        attachment_ids=files,
                     )
                     comments.append(cmt)
                     op_hash_map[op_id] = cmt
@@ -485,27 +529,40 @@ class BugReader:
 
                 elif op_type == OP_SET_STATUS:
                     status_val = op.get('status', STATUS_OPEN)
+                    assert isinstance(status_val, int)
                     is_open = (status_val == STATUS_OPEN)
 
                 elif op_type == OP_LABEL_CHANGE:
-                    for lbl in op.get('added') or []:
+                    added = op.get('added', [])
+                    assert isinstance(added, list)
+                    for lbl in added:
+                        assert isinstance(lbl, str)
                         labels.add(lbl)
-                    for lbl in op.get('removed') or []:
+                    removed = op.get('removed', [])
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
-                        new_files = op.get('files') or []
+                        new_files = op.get('files', [])
+                        assert isinstance(new_files, list)
+                        assert _is_list(new_files, str)
                         if new_files:
-                            matched.attachment_ids = list(new_files)
+                            matched.attachment_ids = new_files
 
                 elif op_type == OP_SET_METADATA:
                     new_meta = op.get('new_metadata')
-                    if new_meta:
+                    if new_meta is not None:
+                        assert isinstance(new_meta, dict)
+                        assert _is_dict_values(new_meta, str)
                         metadata.update(new_meta)
 
                 elif op_type == OP_NOOP:
@@ -532,7 +589,7 @@ class BugReader:
 
     def build_bug_summary(
         self, bid: str,
-        packs: list[dict[str, Any]] | None = None,
+        packs: list[_JsonObject] | None = None,
     ) -> BugSummary:
         """Build a lightweight bug summary by replaying operation packs.
 
@@ -558,33 +615,52 @@ class BugReader:
         comment_count = 0
 
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
                     is_open = (status_val == STATUS_OPEN)
 
                 elif op_type == OP_LABEL_CHANGE:
-                    for lbl in op.get('added') or []:
+                    added = op.get('added', [])
+                    assert isinstance(added, list)
+                    for lbl in added:
+                        assert isinstance(lbl, str)
                         labels.add(lbl)
-                    for lbl in op.get('removed') or []:
+                    removed = op.get('removed', [])
+                    assert isinstance(removed, list)
+                    for lbl in removed:
+                        assert isinstance(lbl, str)
                         labels.discard(lbl)
 
         if created_at is None:
diff --git a/src/ezgb/_types.py b/src/ezgb/_types.py
new file mode 100644
index 0000000..e3e46da
--- /dev/null
+++ b/src/ezgb/_types.py
@@ -0,0 +1,14 @@
+"""Internal type aliases."""
+from __future__ import annotations
+
+from typing import Dict, List, Union
+
+JsonValue = Union[
+    None,
+    bool,
+    int,
+    float,
+    str,
+    List['JsonValue'],
+    Dict[str, 'JsonValue'],
+]
diff --git a/tests/conftest.py b/tests/conftest.py
index 7fb167e..ed03529 100644
--- a/tests/conftest.py
+++ b/tests/conftest.py
@@ -3,13 +3,17 @@
 Creates real git objects in temporary bare repos using pygit2 so
 the BugReader can read them without subprocess mocking.
 """
+from __future__ import annotations
+
 import json
-from unittest.mock import patch
+from pathlib import Path
+from typing import Iterator
 
 import pygit2
 import pytest
 
 from ezgb._reader import BugReader
+from ezgb._types import JsonValue
 from ezgb._writer import BugWriter
 
 # -- Constants ---------------------------------------------------------------
@@ -21,10 +25,13 @@ BUG_ID = 'c' * 64
 # Signature used for all test commits
 _SIG = pygit2.Signature('Test', 'test@test.com')
 
+JsonObject = dict[str, JsonValue]
+CliResult = tuple[int, str, str]
+
 
 # -- Test data factories -----------------------------------------------------
 
-def make_identity_version(name, email):
+def make_identity_version(name: str, email: str) -> str:
     """Build a JSON identity version blob (format 2)."""
     return json.dumps({
         'version': 2,
@@ -35,7 +42,7 @@ def make_identity_version(name, email):
     })
 
 
-def make_op_pack(author_id, ops):
+def make_op_pack(author_id: str, ops: list[JsonObject]) -> str:
     """Build a JSON operation pack with author and ops array."""
     return json.dumps({
         'author': {'id': author_id},
@@ -43,7 +50,11 @@ def make_op_pack(author_id, ops):
     })
 
 
-def make_create_op(title, message, timestamp=1700000000):
+def make_create_op(
+    title: str,
+    message: str,
+    timestamp: int = 1700000000,
+) -> JsonObject:
     """Build an OP_CREATE (type 1) operation."""
     return {
         'type': 1,
@@ -54,7 +65,10 @@ def make_create_op(title, message, timestamp=1700000000):
     }
 
 
-def make_comment_op(message, timestamp=1700001000):
+def make_comment_op(
+    message: str,
+    timestamp: int = 1700001000,
+) -> JsonObject:
     """Build an OP_ADD_COMMENT (type 3) operation."""
     return {
         'type': 3,
@@ -64,17 +78,27 @@ def make_comment_op(message, timestamp=1700001000):
     }
 
 
-def make_set_title_op(title, timestamp=1700002000):
+def make_set_title_op(
+    title: str,
+    timestamp: int = 1700002000,
+) -> JsonObject:
     """Build an OP_SET_TITLE (type 2) operation."""
     return {'type': 2, 'timestamp': timestamp, 'title': title}
 
 
-def make_set_status_op(status, timestamp=1700003000):
+def make_set_status_op(
+    status: int,
+    timestamp: int = 1700003000,
+) -> JsonObject:
     """Build an OP_SET_STATUS (type 4) operation."""
     return {'type': 4, 'timestamp': timestamp, 'status': status}
 
 
-def make_edit_comment_op(target, message, timestamp=1700002500):
+def make_edit_comment_op(
+    target: str,
+    message: str,
+    timestamp: int = 1700002500,
+) -> JsonObject:
     """Build an OP_EDIT_COMMENT (type 6) operation."""
     return {
         'type': 6, 'timestamp': timestamp,
@@ -82,28 +106,46 @@ def make_edit_comment_op(target, message, timestamp=1700002500):
     }
 
 
-def make_label_change_op(added=None, removed=None, timestamp=1700004000):
+def make_label_change_op(
+    added: list[str] | None = None,
+    removed: list[str] | None = None,
+    timestamp: int = 1700004000,
+) -> JsonObject:
     """Build an OP_LABEL_CHANGE (type 5) operation."""
+    if added is None:
+        added = []
+    if removed is None:
+        removed = []
     return {
         'type': 5, 'timestamp': timestamp,
-        'added': added or [], 'removed': removed or [],
+        # Shallow copies are needed because list is invariant. We could use
+        # Sequence instead, but that's fancy for little benefit.
+        'added': [a for a in added], 'removed': [r for r in removed],
     }
 
 
-def make_set_metadata_op(metadata, timestamp=1700005000):
+def make_set_metadata_op(
+    metadata: JsonObject,
+    timestamp: int = 1700005000,
+) -> JsonObject:
     """Build an OP_SET_METADATA (type 8) operation."""
     return {'type': 8, 'timestamp': timestamp, 'new_metadata': metadata}
 
 
-def make_noop_op(timestamp=1700006000):
+def make_noop_op(timestamp: int = 1700006000) -> JsonObject:
     """Build an OP_NOOP (type 7) operation."""
     return {'type': 7, 'timestamp': timestamp}
 
 
 # -- Real git object helpers -------------------------------------------------
 
-def _create_bug_commit(repo, refname, ops_json, parent_oid=None,
-                       version_tag='version-4'):
+def _create_bug_commit(
+    repo: pygit2.Repository,
+    refname: str,
+    ops_json: str,
+    parent_oid: pygit2.Oid | None = None,
+    version_tag: str = 'version-4',
+) -> pygit2.Oid:
     """Create a single bug commit with an ops blob and version marker.
 
     If *parent_oid* is given the new commit is chained after it.
@@ -123,7 +165,11 @@ def _create_bug_commit(repo, refname, ops_json, parent_oid=None,
     )
 
 
-def _create_identity_commit(repo, refname, version_json):
+def _create_identity_commit(
+    repo: pygit2.Repository,
+    refname: str,
+    version_json: str,
+) -> pygit2.Oid:
     """Create an identity commit with a ``version`` blob.
 
     Returns the commit OID.
@@ -141,7 +187,12 @@ def _create_identity_commit(repo, refname, version_json):
 
 # -- Convenience setup -------------------------------------------------------
 
-def setup_identity(repo_path, identity_id, name, email):
+def setup_identity(
+    repo_path: str,
+    identity_id: str,
+    name: str,
+    email: str,
+) -> None:
     """Create real identity git objects in the repo at *repo_path*.
 
     Writes a ``refs/identities/<id>`` ref pointing at a commit whose
@@ -153,10 +204,17 @@ def setup_identity(repo_path, identity_id, name, email):
     _create_identity_commit(repo, refname, version_json)
 
 
-def setup_single_bug(repo_path, reader, bid=BUG_ID, title='Test bug',
-                     message='Bug description', timestamp=1700000000,
-                     extra_ops=None, author_id=IDENTITY_ID,
-                     extra_packs=None):
+def setup_single_bug(
+    repo_path: str,
+    reader: BugReader,
+    bid: str = BUG_ID,
+    title: str = 'Test bug',
+    message: str = 'Bug description',
+    timestamp: int = 1700000000,
+    extra_ops: list[JsonObject] | None = None,
+    author_id: str = IDENTITY_ID,
+    extra_packs: list[str] | None = None,
+) -> None:
     """Create real git objects for a single bug with one create op.
 
     The bug ref ``refs/bugs/<bid>`` is created in the repo at
@@ -191,8 +249,29 @@ def setup_single_bug(repo_path, reader, bid=BUG_ID, title='Test bug',
 
 # -- Fixtures ----------------------------------------------------------------
 
+class RecordingBugWriter(BugWriter):
+    """BugWriter test double that records CLI calls and canned responses."""
+
+    def __init__(self, repo_path: str, reader: BugReader) -> None:
+        super().__init__(repo_path, reader)
+        self._cli_calls: list[list[str]] = []
+        self._cli_routes: dict[str, CliResult] = {}
+
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
+
+
 @pytest.fixture()
-def repo_path(tmp_path):
+def repo_path(tmp_path: Path) -> str:
     """Create a bare git repo and return its path as a string."""
     repo_dir = tmp_path / 'repo'
     pygit2.init_repository(str(repo_dir), bare=True)
@@ -200,37 +279,17 @@ def repo_path(tmp_path):
 
 
 @pytest.fixture()
-def reader(repo_path):
+def reader(repo_path: str) -> BugReader:
     """Create a BugReader pointing at the test repo."""
     return BugReader(repo_path)
 
 
 @pytest.fixture()
-def writer(reader, repo_path):
+def writer(reader: BugReader, repo_path: str) -> Iterator[RecordingBugWriter]:
     """Create a BugWriter with git_bug_cli mocked.
 
     Write operations shell out to the ``git bug`` CLI, which isn't
     available in tests, so we mock it. The mock captures calls in
     ``writer._cli_calls`` for assertion.
     """
-    cli_routes = {}
-    cli_calls = []
-
-    def _cli_side_effect(rp, args, stdin=None):
-        cli_calls.append(args)
-        joined = ' '.join(args)
-        for key, value in cli_routes.items():
-            if key in joined:
-                if callable(value):
-                    return value(rp, args)
-                return value
-        return (0, '', '')
-
-    with patch('ezgb._writer.git_bug_cli',
-               side_effect=_cli_side_effect), \
-         patch('ezgb._git.git_bug_cli',
-               side_effect=_cli_side_effect):
-        w = BugWriter(repo_path, reader)
-        w._cli_calls = cli_calls
-        w._cli_routes = cli_routes
-        yield w
+    yield RecordingBugWriter(repo_path, reader)
diff --git a/tests/test_ezgb.py b/tests/test_ezgb.py
index 054f77f..6d9f491 100644
--- a/tests/test_ezgb.py
+++ b/tests/test_ezgb.py
@@ -13,6 +13,8 @@ import pytest
 from conftest import (
     BUG_ID,
     IDENTITY_ID,
+    JsonObject,
+    RecordingBugWriter,
     _create_bug_commit,
     _create_identity_commit,
     make_comment_op,
@@ -45,7 +47,7 @@ from ezgb._reader import BugReader, _combine_ids
 class TestCombineIds:
     """Unit tests for the CombinedId interleaving function."""
 
-    def test_interleave_pattern(self):
+    def test_interleave_pattern(self) -> None:
         primary = '0' * 64
         secondary = '1' * 64
         result = _combine_ids(primary, secondary)
@@ -57,7 +59,7 @@ class TestCombineIds:
             else:
                 assert ch == '0', 'position %d should be primary' % i
 
-    def test_distinct_inputs(self):
+    def test_distinct_inputs(self) -> None:
         primary = 'abcdef' * 10 + 'abcd'
         secondary = '123456' * 10 + '1234'
         result = _combine_ids(primary, secondary)
@@ -71,14 +73,14 @@ class TestCombineIds:
 # ------------------------------------------------------------------
 
 class TestResolveBugId:
-    def test_resolves_full_id(self, reader, repo_path):
+    def test_resolves_full_id(self, reader: BugReader, repo_path: str) -> None:
         repo = pygit2.Repository(repo_path)
         ops_json = make_op_pack(IDENTITY_ID, [make_create_op('t', 'm')])
         _create_bug_commit(repo, 'refs/bugs/%s' % BUG_ID, ops_json)
         result = reader.resolve_bug_id(BUG_ID)
         assert result == BUG_ID
 
-    def test_resolves_prefix(self, reader, repo_path):
+    def test_resolves_prefix(self, reader: BugReader, repo_path: str) -> None:
         repo = pygit2.Repository(repo_path)
         ops_json = make_op_pack(IDENTITY_ID, [make_create_op('t', 'm')])
         _create_bug_commit(repo, 'refs/bugs/%s' % BUG_ID, ops_json)
@@ -86,7 +88,7 @@ class TestResolveBugId:
         result = reader.resolve_bug_id(prefix)
         assert result == BUG_ID
 
-    def test_caches_result(self, reader, repo_path):
+    def test_caches_result(self, reader: BugReader, repo_path: str) -> None:
         repo = pygit2.Repository(repo_path)
         ops_json = make_op_pack(IDENTITY_ID, [make_create_op('t', 'm')])
         _create_bug_commit(repo, 'refs/bugs/%s' % BUG_ID, ops_json)
@@ -95,7 +97,7 @@ class TestResolveBugId:
         result = reader.resolve_bug_id(BUG_ID)
         assert result == BUG_ID
 
-    def test_ambiguous_raises(self, reader, repo_path):
+    def test_ambiguous_raises(self, reader: BugReader, repo_path: str) -> None:
         repo = pygit2.Repository(repo_path)
         prefix = 'abc'
         bid2 = 'abc' + 'd' * 61
@@ -106,7 +108,7 @@ class TestResolveBugId:
         with pytest.raises(AmbiguousBugIdError, match='matches 2 bugs'):
             reader.resolve_bug_id(prefix)
 
-    def test_not_found_raises(self, reader, repo_path):
+    def test_not_found_raises(self, reader: BugReader, repo_path: str) -> None:
         with pytest.raises(BugNotFoundError, match='no bug matching'):
             reader.resolve_bug_id('nonexistent')
 
@@ -116,7 +118,7 @@ class TestResolveBugId:
 # ------------------------------------------------------------------
 
 class TestResolveIdentity:
-    def test_resolves_by_id(self, reader, repo_path):
+    def test_resolves_by_id(self, reader: BugReader, repo_path: str) -> None:
         setup_identity(repo_path, IDENTITY_ID, 'Alice', 'alice@example.com')
         identity = reader.resolve_identity(IDENTITY_ID)
         assert identity.name == 'Alice'
@@ -124,18 +126,18 @@ class TestResolveIdentity:
         assert identity.login == 'alice'
         assert identity.id == IDENTITY_ID
 
-    def test_caches_result(self, reader, repo_path):
+    def test_caches_result(self, reader: BugReader, repo_path: str) -> None:
         setup_identity(repo_path, IDENTITY_ID, 'Alice', 'alice@example.com')
         id1 = reader.resolve_identity(IDENTITY_ID)
         id2 = reader.resolve_identity(IDENTITY_ID)
         assert id1 is id2
 
-    def test_fallback_on_missing(self, reader, repo_path):
+    def test_fallback_on_missing(self, reader: BugReader, repo_path: str) -> None:
         identity = reader.resolve_identity(IDENTITY_ID)
         assert identity.name == IDENTITY_ID
         assert identity.email == IDENTITY_ID
 
-    def test_unsupported_format_raises(self, reader, repo_path):
+    def test_unsupported_format_raises(self, reader: BugReader, repo_path: str) -> None:
         repo = pygit2.Repository(repo_path)
         identity_json = json.dumps({
             'version': 99,
@@ -153,7 +155,7 @@ class TestResolveIdentity:
 # ------------------------------------------------------------------
 
 class TestBuildBug:
-    def test_snapshot_reconstruction(self, reader, repo_path):
+    def test_snapshot_reconstruction(self, reader: BugReader, repo_path: str) -> None:
         setup_single_bug(repo_path, reader)
         bug = reader.build_bug(BUG_ID)
         assert bug.id == BUG_ID
@@ -165,25 +167,25 @@ class TestBuildBug:
         assert bug.comments[0].text == 'Bug description'
         assert bug.comments[0].count == 0
 
-    def test_set_title_updates(self, reader, repo_path):
+    def test_set_title_updates(self, reader: BugReader, repo_path: str) -> None:
         title_op = make_set_title_op('Updated title')
         setup_single_bug(repo_path, reader, extra_ops=[title_op])
         bug = reader.build_bug(BUG_ID)
         assert bug.title == 'Updated title'
 
-    def test_set_status_closed(self, reader, repo_path):
+    def test_set_status_closed(self, reader: BugReader, repo_path: str) -> None:
         status_op = make_set_status_op(2)  # STATUS_CLOSED
         setup_single_bug(repo_path, reader, extra_ops=[status_op])
         bug = reader.build_bug(BUG_ID)
         assert bug.status == Status.CLOSED
 
-    def test_assigned_label(self, reader, repo_path):
+    def test_assigned_label(self, reader: BugReader, repo_path: str) -> None:
         assign_op = make_label_change_op(added=['assigned:bob@example.com'])
         setup_single_bug(repo_path, reader, extra_ops=[assign_op])
         bug = reader.build_bug(BUG_ID)
         assert 'assigned:bob@example.com' in bug.labels
 
-    def test_label_add_and_remove(self, reader, repo_path):
+    def test_label_add_and_remove(self, reader: BugReader, repo_path: str) -> None:
         add_op = make_label_change_op(added=['bug', 'priority/high'])
         rm_op = make_label_change_op(
             removed=['bug'], timestamp=1700005000,
@@ -193,7 +195,7 @@ class TestBuildBug:
         assert 'priority/high' in bug.labels
         assert 'bug' not in bug.labels
 
-    def test_add_comment_op(self, reader, repo_path):
+    def test_add_comment_op(self, reader: BugReader, repo_path: str) -> None:
         comment_op = make_comment_op('A follow-up', timestamp=1700001000)
         setup_single_bug(repo_path, reader, extra_ops=[comment_op])
         bug = reader.build_bug(BUG_ID)
@@ -203,8 +205,8 @@ class TestBuildBug:
         assert bug.comments[1].count == 1
         assert bug.comments[1].text == 'A follow-up'
 
-    def test_comment_with_attachment(self, reader, repo_path):
-        ops = [{
+    def test_comment_with_attachment(self, reader: BugReader, repo_path: str) -> None:
+        ops: list[JsonObject] = [{
             'type': 1,
             'timestamp': 1700000000,
             'title': 'Bug with file',
@@ -228,7 +230,7 @@ class TestBuildBug:
         bug = reader.build_bug(BUG_ID)
         assert bug.comments[0].attachment_ids == ['blobhash123']
 
-    def test_edit_comment(self, reader, repo_path):
+    def test_edit_comment(self, reader: BugReader, repo_path: str) -> None:
         """OP_EDIT_COMMENT whose target matches the create op hash
         should update the comment text."""
         # First, build the pack JSON for the create op so we can
@@ -256,7 +258,9 @@ class TestBuildBug:
         bug = reader.build_bug(BUG_ID)
         assert bug.comments[0].text == 'Edited text'
 
-    def test_edit_comment_unmatched_target(self, reader, repo_path):
+    def test_edit_comment_unmatched_target(
+        self, reader: BugReader, repo_path: str,
+    ) -> None:
         """Unmatched OP_EDIT_COMMENT target leaves text unchanged."""
         edit_op = make_edit_comment_op(
             target='nonexistent', message='Edited text',
@@ -265,19 +269,21 @@ class TestBuildBug:
         bug = reader.build_bug(BUG_ID)
         assert bug.comments[0].text == 'Bug description'
 
-    def test_metadata_from_set_metadata(self, reader, repo_path):
+    def test_metadata_from_set_metadata(
+        self, reader: BugReader, repo_path: str,
+    ) -> None:
         meta_op = make_set_metadata_op({'key': 'value'})
         setup_single_bug(repo_path, reader, extra_ops=[meta_op])
         bug = reader.build_bug(BUG_ID)
         assert bug.metadata == {'key': 'value'}
 
-    def test_noop_ignored(self, reader, repo_path):
+    def test_noop_ignored(self, reader: BugReader, repo_path: str) -> None:
         noop = make_noop_op()
         setup_single_bug(repo_path, reader, extra_ops=[noop])
         bug = reader.build_bug(BUG_ID)
         assert bug.title == 'Test bug'
 
-    def test_multiple_op_packs(self, reader, repo_path):
+    def test_multiple_op_packs(self, reader: BugReader, repo_path: str) -> None:
         """Operations spread across multiple commits are replayed
         in order."""
         pack2_json = make_op_pack(IDENTITY_ID, [
@@ -291,18 +297,18 @@ class TestBuildBug:
         bug = reader.build_bug(BUG_ID)
         assert bug.title == 'Updated'
 
-    def test_missing_bug_raises(self, reader, repo_path):
+    def test_missing_bug_raises(self, reader: BugReader, repo_path: str) -> None:
         reader._resolve_cache['nonexistent'] = 'nonexistent'
         with pytest.raises(BugNotFoundError, match='no operation packs'):
             reader.build_bug('nonexistent')
 
-    def test_caching(self, reader, repo_path):
+    def test_caching(self, reader: BugReader, repo_path: str) -> None:
         setup_single_bug(repo_path, reader)
         bug1 = reader.build_bug(BUG_ID)
         bug2 = reader.build_bug(BUG_ID)
         assert bug1 is bug2
 
-    def test_unsupported_format_raises(self, reader, repo_path):
+    def test_unsupported_format_raises(self, reader: BugReader, repo_path: str) -> None:
         repo = pygit2.Repository(repo_path)
         ops_json = make_op_pack(IDENTITY_ID, [
             make_create_op('Test', 'body'),
@@ -321,7 +327,7 @@ class TestBuildBug:
 # ------------------------------------------------------------------
 
 class TestBuildBugSummary:
-    def test_basic(self, reader, repo_path):
+    def test_basic(self, reader: BugReader, repo_path: str) -> None:
         setup_single_bug(repo_path, reader)
         s = reader.build_bug_summary(BUG_ID)
         assert isinstance(s, BugSummary)
@@ -331,19 +337,19 @@ class TestBuildBugSummary:
         assert s.creator_id == IDENTITY_ID
         assert s.comment_count == 1  # create op has a message
 
-    def test_set_title(self, reader, repo_path):
+    def test_set_title(self, reader: BugReader, repo_path: str) -> None:
         title_op = make_set_title_op('Updated title')
         setup_single_bug(repo_path, reader, extra_ops=[title_op])
         s = reader.build_bug_summary(BUG_ID)
         assert s.title == 'Updated title'
 
-    def test_set_status(self, reader, repo_path):
+    def test_set_status(self, reader: BugReader, repo_path: str) -> None:
         status_op = make_set_status_op(2)  # CLOSED
         setup_single_bug(repo_path, reader, extra_ops=[status_op])
         s = reader.build_bug_summary(BUG_ID)
         assert s.status == Status.CLOSED
 
-    def test_label_changes(self, reader, repo_path):
+    def test_label_changes(self, reader: BugReader, repo_path: str) -> None:
         add_op = make_label_change_op(added=['bug', 'priority/high'])
         rm_op = make_label_change_op(
             removed=['bug'], timestamp=1700005000,
@@ -354,13 +360,13 @@ class TestBuildBugSummary:
         assert 'bug' not in s.labels
         assert isinstance(s.labels, frozenset)
 
-    def test_comment_count(self, reader, repo_path):
+    def test_comment_count(self, reader: BugReader, repo_path: str) -> None:
         comment_op = make_comment_op('A follow-up')
         setup_single_bug(repo_path, reader, extra_ops=[comment_op])
         s = reader.build_bug_summary(BUG_ID)
         assert s.comment_count == 2  # create message + add_comment
 
-    def test_create_without_message(self, reader, repo_path):
+    def test_create_without_message(self, reader: BugReader, repo_path: str) -> None:
         repo = pygit2.Repository(repo_path)
         ops = [make_create_op('No body', '')]
         pack_json = make_op_pack(IDENTITY_ID, ops)
@@ -371,7 +377,9 @@ class TestBuildBugSummary:
         s = reader.build_bug_summary(BUG_ID)
         assert s.comment_count == 0
 
-    def test_edit_comment_does_not_affect_count(self, reader, repo_path):
+    def test_edit_comment_does_not_affect_count(
+        self, reader: BugReader, repo_path: str,
+    ) -> None:
         edit_op = make_edit_comment_op(
             target='whatever', message='Edited',
         )
@@ -379,43 +387,43 @@ class TestBuildBugSummary:
         s = reader.build_bug_summary(BUG_ID)
         assert s.comment_count == 1  # only the create message
 
-    def test_metadata_skipped(self, reader, repo_path):
+    def test_metadata_skipped(self, reader: BugReader, repo_path: str) -> None:
         meta_op = make_set_metadata_op({'key': 'value'})
         setup_single_bug(repo_path, reader, extra_ops=[meta_op])
         s = reader.build_bug_summary(BUG_ID)
         assert not hasattr(s, 'metadata')
 
-    def test_noop_ignored(self, reader, repo_path):
+    def test_noop_ignored(self, reader: BugReader, repo_path: str) -> None:
         noop = make_noop_op()
         setup_single_bug(repo_path, reader, extra_ops=[noop])
         s = reader.build_bug_summary(BUG_ID)
         assert s.title == 'Test bug'
 
-    def test_caching(self, reader, repo_path):
+    def test_caching(self, reader: BugReader, repo_path: str) -> None:
         setup_single_bug(repo_path, reader)
         s1 = reader.build_bug_summary(BUG_ID)
         s2 = reader.build_bug_summary(BUG_ID)
         assert s1 is s2
 
-    def test_separate_cache(self, reader, repo_path):
+    def test_separate_cache(self, reader: BugReader, repo_path: str) -> None:
         setup_single_bug(repo_path, reader)
         reader.build_bug_summary(BUG_ID)
         assert BUG_ID in reader._summary_cache
         assert BUG_ID not in reader._bug_cache
 
-    def test_missing_raises(self, reader, repo_path):
+    def test_missing_raises(self, reader: BugReader, repo_path: str) -> None:
         reader._resolve_cache['nonexistent'] = 'nonexistent'
         with pytest.raises(BugNotFoundError, match='no operation packs'):
             reader.build_bug_summary('nonexistent')
 
-    def test_invalidate_single(self, reader, repo_path):
+    def test_invalidate_single(self, reader: BugReader, repo_path: str) -> None:
         setup_single_bug(repo_path, reader)
         reader.build_bug_summary(BUG_ID)
         assert BUG_ID in reader._summary_cache
         reader.invalidate(BUG_ID)
         assert BUG_ID not in reader._summary_cache
 
-    def test_invalidate_all(self, reader, repo_path):
+    def test_invalidate_all(self, reader: BugReader, repo_path: str) -> None:
         setup_single_bug(repo_path, reader)
         reader.build_bug_summary(BUG_ID)
         reader.invalidate()
@@ -427,7 +435,7 @@ class TestBuildBugSummary:
 # ------------------------------------------------------------------
 
 class TestPrefetchBugs:
-    def test_warms_cache(self, reader, repo_path):
+    def test_warms_cache(self, reader: BugReader, repo_path: str) -> None:
         setup_single_bug(repo_path, reader)
         reader._bug_cache.clear()
         assert BUG_ID not in reader._bug_cache
@@ -435,13 +443,13 @@ class TestPrefetchBugs:
         assert BUG_ID in reader._bug_cache
         assert reader._bug_cache[BUG_ID].title == 'Test bug'
 
-    def test_skips_cached(self, reader, repo_path):
+    def test_skips_cached(self, reader: BugReader, repo_path: str) -> None:
         setup_single_bug(repo_path, reader)
         bug = reader.build_bug(BUG_ID)
         reader.prefetch_bugs([BUG_ID])
         assert reader._bug_cache[BUG_ID] is bug
 
-    def test_empty_list(self, reader, repo_path):
+    def test_empty_list(self, reader: BugReader, repo_path: str) -> None:
         reader.prefetch_bugs([])
         assert reader._bug_cache == {}
 
@@ -451,19 +459,19 @@ class TestPrefetchBugs:
 # ------------------------------------------------------------------
 
 class TestListBugRefs:
-    def test_returns_refs(self, reader, repo_path):
+    def test_returns_refs(self, reader: BugReader, repo_path: str) -> None:
         setup_single_bug(repo_path, reader)
         refs = reader.list_bug_refs()
         assert len(refs) == 1
         assert refs[0][0] == BUG_ID
 
-    def test_empty(self, reader, repo_path):
+    def test_empty(self, reader: BugReader, repo_path: str) -> None:
         refs = reader.list_bug_refs()
         assert refs == []
 
 
 class TestListIdentityRefs:
-    def test_returns_refs(self, reader, repo_path):
+    def test_returns_refs(self, reader: BugReader, repo_path: str) -> None:
         setup_identity(repo_path, IDENTITY_ID, 'Alice', 'alice@example.com')
         refs = reader.list_identity_refs()
         assert len(refs) == 1
@@ -475,7 +483,7 @@ class TestListIdentityRefs:
 # ------------------------------------------------------------------
 
 class TestInvalidate:
-    def test_invalidate_single_bug(self, reader, repo_path):
+    def test_invalidate_single_bug(self, reader: BugReader, repo_path: str) -> None:
         setup_single_bug(repo_path, reader)
         reader.build_bug(BUG_ID)
         assert BUG_ID in reader._bug_cache
@@ -484,7 +492,7 @@ class TestInvalidate:
         # Resolve cache preserved for single-bug invalidation
         assert BUG_ID in reader._resolve_cache
 
-    def test_invalidate_all(self, reader, repo_path):
+    def test_invalidate_all(self, reader: BugReader, repo_path: str) -> None:
         setup_single_bug(repo_path, reader)
         reader.build_bug(BUG_ID)
         reader.invalidate()
@@ -498,7 +506,12 @@ class TestInvalidate:
 # ------------------------------------------------------------------
 
 class TestCreateBug:
-    def test_creates_and_returns_bug(self, reader, writer, repo_path):
+    def test_creates_and_returns_bug(
+        self,
+        reader: BugReader,
+        writer: RecordingBugWriter,
+        repo_path: str,
+    ) -> None:
         new_id = 'd' * 64
         prefix = new_id[:7]
 
@@ -524,7 +537,12 @@ class TestCreateBug:
 # ------------------------------------------------------------------
 
 class TestAddComment:
-    def test_adds_and_returns_comment(self, reader, writer, repo_path):
+    def test_adds_and_returns_comment(
+        self,
+        reader: BugReader,
+        writer: RecordingBugWriter,
+        repo_path: str,
+    ) -> None:
         setup_single_bug(repo_path, reader)
 
         # CLI returns success
@@ -535,6 +553,7 @@ class TestAddComment:
         # bug ref (the first commit already has the create op).
         repo = pygit2.Repository(repo_path)
         ref = repo.references.get('refs/bugs/%s' % BUG_ID)
+        assert ref is not None
         parent = ref.peel(pygit2.Commit)
         comment_op = make_comment_op('New comment', timestamp=1700005000)
         pack_json = make_op_pack(IDENTITY_ID, [comment_op])
@@ -553,14 +572,24 @@ class TestAddComment:
 # ------------------------------------------------------------------
 
 class TestSetStatus:
-    def test_close(self, reader, writer, repo_path):
+    def test_close(
+        self,
+        reader: BugReader,
+        writer: RecordingBugWriter,
+        repo_path: str,
+    ) -> None:
         setup_single_bug(repo_path, reader)
         writer.set_status(BUG_ID, Status.CLOSED)
         assert any(
             'close' in ' '.join(c) for c in writer._cli_calls
         )
 
-    def test_open(self, reader, writer, repo_path):
+    def test_open(
+        self,
+        reader: BugReader,
+        writer: RecordingBugWriter,
+        repo_path: str,
+    ) -> None:
         setup_single_bug(repo_path, reader)
         writer.set_status(BUG_ID, Status.OPEN)
         assert any(
@@ -573,7 +602,12 @@ class TestSetStatus:
 # ------------------------------------------------------------------
 
 class TestSetTitle:
-    def test_updates_title(self, reader, writer, repo_path):
+    def test_updates_title(
+        self,
+        reader: BugReader,
+        writer: RecordingBugWriter,
+        repo_path: str,
+    ) -> None:
         setup_single_bug(repo_path, reader)
         writer.set_title(BUG_ID, 'New title')
         assert any(
@@ -586,14 +620,24 @@ class TestSetTitle:
 # ------------------------------------------------------------------
 
 class TestLabels:
-    def test_add_label(self, reader, writer, repo_path):
+    def test_add_label(
+        self,
+        reader: BugReader,
+        writer: RecordingBugWriter,
+        repo_path: str,
+    ) -> None:
         setup_single_bug(repo_path, reader)
         writer.add_label(BUG_ID, 'priority/high')
         assert any(
             'priority/high' in ' '.join(c) for c in writer._cli_calls
         )
 
-    def test_remove_label(self, reader, writer, repo_path):
+    def test_remove_label(
+        self,
+        reader: BugReader,
+        writer: RecordingBugWriter,
+        repo_path: str,
+    ) -> None:
         setup_single_bug(repo_path, reader)
         writer.remove_label(BUG_ID, 'old-label')
         assert any(
@@ -607,20 +651,20 @@ class TestLabels:
 # ------------------------------------------------------------------
 
 class TestGitBugRepo:
-    def test_get_bug(self, repo_path):
+    def test_get_bug(self, repo_path: str) -> None:
         repo_obj = GitBugRepo(repo_path)
         setup_single_bug(repo_path, repo_obj._reader)
         bug = repo_obj.get_bug(BUG_ID)
         assert bug.title == 'Test bug'
 
-    def test_list_bugs(self, repo_path):
+    def test_list_bugs(self, repo_path: str) -> None:
         repo_obj = GitBugRepo(repo_path)
         setup_single_bug(repo_path, repo_obj._reader)
         bugs = repo_obj.list_bugs()
         assert len(bugs) == 1
         assert bugs[0].title == 'Test bug'
 
-    def test_list_bugs_filter_status(self, repo_path):
+    def test_list_bugs_filter_status(self, repo_path: str) -> None:
         repo_obj = GitBugRepo(repo_path)
         status_op = make_set_status_op(2)  # CLOSED
         setup_single_bug(repo_path, repo_obj._reader, extra_ops=[status_op])
@@ -631,7 +675,7 @@ class TestGitBugRepo:
         bugs = repo_obj.list_bugs(status=Status.CLOSED)
         assert len(bugs) == 1
 
-    def test_list_bugs_filter_label(self, repo_path):
+    def test_list_bugs_filter_label(self, repo_path: str) -> None:
         repo_obj = GitBugRepo(repo_path)
         label_op = make_label_change_op(added=['area/network'])
         setup_single_bug(repo_path, repo_obj._reader, extra_ops=[label_op])
@@ -642,7 +686,7 @@ class TestGitBugRepo:
         bugs = repo_obj.list_bugs(label='nonexistent')
         assert len(bugs) == 0
 
-    def test_resolve_bug_id(self, repo_path):
+    def test_resolve_bug_id(self, repo_path: str) -> None:
         repo_obj = GitBugRepo(repo_path)
         repo = pygit2.Repository(repo_path)
         ops_json = make_op_pack(IDENTITY_ID, [make_create_op('t', 'm')])
@@ -650,21 +694,21 @@ class TestGitBugRepo:
         result = repo_obj.resolve_bug_id(BUG_ID)
         assert result == BUG_ID
 
-    def test_list_identities(self, repo_path):
+    def test_list_identities(self, repo_path: str) -> None:
         repo_obj = GitBugRepo(repo_path)
         setup_identity(repo_path, IDENTITY_ID, 'Alice', 'alice@example.com')
         identities = repo_obj.list_identities()
         assert len(identities) == 1
         assert identities[0].name == 'Alice'
 
-    def test_iter_bugs(self, repo_path):
+    def test_iter_bugs(self, repo_path: str) -> None:
         repo_obj = GitBugRepo(repo_path)
         setup_single_bug(repo_path, repo_obj._reader)
         bugs = list(repo_obj.iter_bugs())
         assert len(bugs) == 1
         assert bugs[0].title == 'Test bug'
 
-    def test_iter_bugs_is_lazy(self, repo_path):
+    def test_iter_bugs_is_lazy(self, repo_path: str) -> None:
         """iter_bugs yields one at a time without prefetching all."""
         repo_obj = GitBugRepo(repo_path)
         setup_single_bug(repo_path, repo_obj._reader)
@@ -674,7 +718,7 @@ class TestGitBugRepo:
         bug = next(it)
         assert bug.title == 'Test bug'
 
-    def test_list_bug_summaries(self, repo_path):
+    def test_list_bug_summaries(self, repo_path: str) -> None:
         repo_obj = GitBugRepo(repo_path)
         setup_single_bug(repo_path, repo_obj._reader)
         summaries = repo_obj.list_bug_summaries()
@@ -683,7 +727,7 @@ class TestGitBugRepo:
         assert summaries[0].title == 'Test bug'
         assert summaries[0].creator_id == IDENTITY_ID
 
-    def test_list_bug_summaries_filter_status(self, repo_path):
+    def test_list_bug_summaries_filter_status(self, repo_path: str) -> None:
         repo_obj = GitBugRepo(repo_path)
         status_op = make_set_status_op(2)  # CLOSED
         setup_single_bug(repo_path, repo_obj._reader, extra_ops=[status_op])
@@ -692,7 +736,7 @@ class TestGitBugRepo:
         repo_obj.invalidate()
         assert len(repo_obj.list_bug_summaries(status=Status.CLOSED)) == 1
 
-    def test_list_bug_summaries_filter_label(self, repo_path):
+    def test_list_bug_summaries_filter_label(self, repo_path: str) -> None:
         repo_obj = GitBugRepo(repo_path)
         label_op = make_label_change_op(added=['area/network'])
         setup_single_bug(repo_path, repo_obj._reader, extra_ops=[label_op])
@@ -701,21 +745,21 @@ class TestGitBugRepo:
         repo_obj.invalidate()
         assert len(repo_obj.list_bug_summaries(label='nonexistent')) == 0
 
-    def test_iter_bug_summaries(self, repo_path):
+    def test_iter_bug_summaries(self, repo_path: str) -> None:
         repo_obj = GitBugRepo(repo_path)
         setup_single_bug(repo_path, repo_obj._reader)
         summaries = list(repo_obj.iter_bug_summaries())
         assert len(summaries) == 1
         assert summaries[0].title == 'Test bug'
 
-    def test_get_attachment(self, repo_path):
+    def test_get_attachment(self, repo_path: str) -> None:
         repo_obj = GitBugRepo(repo_path)
         repo = pygit2.Repository(repo_path)
         blob_oid = repo.create_blob(b'file contents here')
         data = repo_obj.get_attachment(str(blob_oid))
         assert data == b'file contents here'
 
-    def test_list_bugs_since(self, repo_path):
+    def test_list_bugs_since(self, repo_path: str) -> None:
         """list_bugs(since=...) filters by committer timestamp."""
         repo_obj = GitBugRepo(repo_path)
         # Create bug with a specific commit timestamp
@@ -747,7 +791,7 @@ class TestGitBugRepo:
         bugs = repo_obj.list_bugs(since=1700010000)
         assert len(bugs) == 0
 
-    def test_list_bugs_since_string(self, repo_path):
+    def test_list_bugs_since_string(self, repo_path: str) -> None:
         """list_bugs(since='2023-11-14 ...') parses the string."""
         repo_obj = GitBugRepo(repo_path)
         repo = pygit2.Repository(repo_path)
@@ -776,14 +820,14 @@ class TestGitBugRepo:
 # ------------------------------------------------------------------
 
 class TestCatBlobBytes:
-    def test_reads_bytes(self, reader, repo_path):
+    def test_reads_bytes(self, reader: BugReader, repo_path: str) -> None:
         repo = pygit2.Repository(repo_path)
         blob_oid = repo.create_blob(b'binary content')
         data = reader.cat_blob_bytes(str(blob_oid))
         assert data == b'binary content'
         assert isinstance(data, bytes)
 
-    def test_missing_blob_raises(self, reader, repo_path):
+    def test_missing_blob_raises(self, reader: BugReader, repo_path: str) -> None:
         with pytest.raises(BugNotFoundError):
             reader.cat_blob_bytes('ff' * 20)
 
@@ -793,7 +837,9 @@ class TestCatBlobBytes:
 # ------------------------------------------------------------------
 
 class TestListBugRefsSince:
-    def _create_bug_with_timestamp(self, repo_path, reader, ts):
+    def _create_bug_with_timestamp(
+        self, repo_path: str, reader: BugReader, ts: int,
+    ) -> None:
         """Helper: create a bug ref with a specific commit timestamp."""
         repo = pygit2.Repository(repo_path)
         sig = pygit2.Signature('Test', 'test@test.com',
@@ -810,17 +856,17 @@ class TestListBugRefsSince:
             'refs/bugs/%s' % BUG_ID, sig, sig, 'op pack', tree_oid, [],
         )
 
-    def test_no_filter(self, reader, repo_path):
+    def test_no_filter(self, reader: BugReader, repo_path: str) -> None:
         self._create_bug_with_timestamp(repo_path, reader, 1700005000)
         refs = reader.list_bug_refs()
         assert len(refs) == 1
 
-    def test_since_includes_newer(self, reader, repo_path):
+    def test_since_includes_newer(self, reader: BugReader, repo_path: str) -> None:
         self._create_bug_with_timestamp(repo_path, reader, 1700005000)
         refs = reader.list_bug_refs(since=1700000000)
         assert len(refs) == 1
 
-    def test_since_excludes_older(self, reader, repo_path):
+    def test_since_excludes_older(self, reader: BugReader, repo_path: str) -> None:
         self._create_bug_with_timestamp(repo_path, reader, 1700005000)
         refs = reader.list_bug_refs(since=1700010000)
         assert len(refs) == 0
diff --git a/tests/test_integration.py b/tests/test_integration.py
index 8a71bb8..dcbbc6c 100644
--- a/tests/test_integration.py
+++ b/tests/test_integration.py
@@ -7,10 +7,12 @@ Skip automatically when ``git-bug`` is not installed.
 import json
 import shutil
 import subprocess
+from pathlib import Path
 
 import pytest
 
 from ezgb import GitBugRepo, Status
+from ezgb._types import JsonValue
 
 pytestmark = pytest.mark.skipif(
     shutil.which('git-bug') is None,
@@ -19,15 +21,15 @@ pytestmark = pytest.mark.skipif(
 
 
 @pytest.fixture()
-def gb_repo(tmp_path):
+def gb_repo(tmp_path: Path) -> GitBugRepo:
     """Spin up a temporary git repo with git-bug and a test identity."""
     repo_dir = tmp_path / 'repo'
     repo_dir.mkdir()
     repo_path = str(repo_dir)
 
-    def _run(args, **kwargs):
+    def _run(args: list[str]) -> subprocess.CompletedProcess[str]:
         return subprocess.run(
-            args, capture_output=True, text=True, check=True, **kwargs,
+            args, capture_output=True, text=True, check=True,
         )
 
     # Initialise the git repo
@@ -42,8 +44,13 @@ def gb_repo(tmp_path):
           '-n', 'Test User', '-e', 'test@example.com',
           '--non-interactive'])
     result = _run(['git', '-C', repo_path, 'bug', 'user', '-f', 'json'])
-    users = json.loads(result.stdout)
-    _run(['git', '-C', repo_path, 'bug', 'user', 'adopt', users[0]['id']])
+    users: JsonValue = json.loads(result.stdout)
+    assert isinstance(users, list)
+    user = users[0]
+    assert isinstance(user, dict)
+    user_id = user['id']
+    assert isinstance(user_id, str)
+    _run(['git', '-C', repo_path, 'bug', 'user', 'adopt', user_id])
 
     return GitBugRepo(repo_path)
 
@@ -53,7 +60,7 @@ def gb_repo(tmp_path):
 # ------------------------------------------------------------------
 
 class TestCreateAndRead:
-    def test_round_trip(self, gb_repo):
+    def test_round_trip(self, gb_repo: GitBugRepo) -> None:
         bug = gb_repo.create_bug('Test bug', 'Description text')
         assert bug.title == 'Test bug'
         assert bug.status == Status.OPEN
@@ -69,7 +76,7 @@ class TestCreateAndRead:
         assert bug2.id == bug.id
         assert bug2.title == 'Test bug'
 
-    def test_resolve_by_prefix(self, gb_repo):
+    def test_resolve_by_prefix(self, gb_repo: GitBugRepo) -> None:
         bug = gb_repo.create_bug('Prefix test', 'Body')
         prefix = bug.id[:8]
         full_id = gb_repo.resolve_bug_id(prefix)
@@ -77,7 +84,7 @@ class TestCreateAndRead:
 
 
 class TestComments:
-    def test_add_comment(self, gb_repo):
+    def test_add_comment(self, gb_repo: GitBugRepo) -> None:
         bug = gb_repo.create_bug('Comment test', 'Original body')
         comment = gb_repo.add_comment(bug.id, 'Follow-up')
         assert comment.text == 'Follow-up'
@@ -88,7 +95,7 @@ class TestComments:
         assert bug.comments[0].text == 'Original body'
         assert bug.comments[1].text == 'Follow-up'
 
-    def test_multiple_comments_ordering(self, gb_repo):
+    def test_multiple_comments_ordering(self, gb_repo: GitBugRepo) -> None:
         bug = gb_repo.create_bug('Ordering test', 'c0')
         gb_repo.add_comment(bug.id, 'c1')
         gb_repo.add_comment(bug.id, 'c2')
@@ -102,7 +109,7 @@ class TestComments:
 
 
 class TestEditComment:
-    def test_edit_comment_text(self, gb_repo):
+    def test_edit_comment_text(self, gb_repo: GitBugRepo) -> None:
         bug = gb_repo.create_bug('Edit comment test', 'Original body')
         comment = gb_repo.add_comment(bug.id, 'Original follow-up')
 
@@ -111,7 +118,7 @@ class TestEditComment:
         assert len(bug.comments) == 2
         assert bug.comments[1].text == 'Edited follow-up'
 
-    def test_edit_preserves_other_comments(self, gb_repo):
+    def test_edit_preserves_other_comments(self, gb_repo: GitBugRepo) -> None:
         bug = gb_repo.create_bug('Preserve test', 'c0')
         c1 = gb_repo.add_comment(bug.id, 'c1')
         gb_repo.add_comment(bug.id, 'c2')
@@ -121,7 +128,7 @@ class TestEditComment:
         texts = [c.text for c in bug.comments]
         assert texts == ['c0', 'c1-edited', 'c2']
 
-    def test_edit_to_tombstone(self, gb_repo):
+    def test_edit_to_tombstone(self, gb_repo: GitBugRepo) -> None:
         """Simulate the b4 bugs comment removal flow."""
         bug = gb_repo.create_bug('Tombstone test', 'Body')
         comment = gb_repo.add_comment(bug.id, 'Sensitive content')
@@ -137,7 +144,7 @@ class TestEditComment:
 
 
 class TestStatus:
-    def test_close_and_reopen(self, gb_repo):
+    def test_close_and_reopen(self, gb_repo: GitBugRepo) -> None:
         bug = gb_repo.create_bug('Status test', 'Body')
         assert gb_repo.get_bug(bug.id).status == Status.OPEN
 
@@ -151,7 +158,7 @@ class TestStatus:
 
 
 class TestTitle:
-    def test_edit_title(self, gb_repo):
+    def test_edit_title(self, gb_repo: GitBugRepo) -> None:
         bug = gb_repo.create_bug('Original title', 'Body')
         gb_repo.set_title(bug.id, 'Updated title')
 
@@ -160,7 +167,7 @@ class TestTitle:
 
 
 class TestLabels:
-    def test_add_and_remove(self, gb_repo):
+    def test_add_and_remove(self, gb_repo: GitBugRepo) -> None:
         bug = gb_repo.create_bug('Label test', 'Body')
         gb_repo.add_label(bug.id, 'priority/high')
         gb_repo.add_label(bug.id, 'area/network')
@@ -176,7 +183,7 @@ class TestLabels:
 
 
 class TestListBugs:
-    def test_list_all(self, gb_repo):
+    def test_list_all(self, gb_repo: GitBugRepo) -> None:
         gb_repo.create_bug('Bug one', 'First')
         gb_repo.create_bug('Bug two', 'Second')
 
@@ -185,7 +192,7 @@ class TestListBugs:
         titles = {b.title for b in bugs}
         assert titles == {'Bug one', 'Bug two'}
 
-    def test_filter_by_status(self, gb_repo):
+    def test_filter_by_status(self, gb_repo: GitBugRepo) -> None:
         gb_repo.create_bug('Open bug', 'Body')
         closed = gb_repo.create_bug('Closed bug', 'Body')
         gb_repo.set_status(closed.id, Status.CLOSED)
@@ -199,7 +206,7 @@ class TestListBugs:
         assert len(closed_bugs) == 1
         assert closed_bugs[0].title == 'Closed bug'
 
-    def test_filter_by_label(self, gb_repo):
+    def test_filter_by_label(self, gb_repo: GitBugRepo) -> None:
         labeled = gb_repo.create_bug('Labeled', 'Body')
         gb_repo.create_bug('Unlabeled', 'Body')
         gb_repo.add_label(labeled.id, 'important')
@@ -211,7 +218,7 @@ class TestListBugs:
 
 
 class TestIdentities:
-    def test_list_identities(self, gb_repo):
+    def test_list_identities(self, gb_repo: GitBugRepo) -> None:
         identities = gb_repo.list_identities()
         assert len(identities) >= 1
         names = [i.name for i in identities]
@@ -221,7 +228,7 @@ class TestIdentities:
 
 
 class TestIterBugs:
-    def test_yields_same_as_list(self, gb_repo):
+    def test_yields_same_as_list(self, gb_repo: GitBugRepo) -> None:
         gb_repo.create_bug('Bug A', 'Body A')
         gb_repo.create_bug('Bug B', 'Body B')
 
@@ -233,7 +240,7 @@ class TestIterBugs:
         assert len(listed) == len(iterated) == 2
         assert {b.title for b in listed} == {b.title for b in iterated}
 
-    def test_iter_with_filter(self, gb_repo):
+    def test_iter_with_filter(self, gb_repo: GitBugRepo) -> None:
         gb_repo.create_bug('Open one', 'Body')
         closed = gb_repo.create_bug('Closed one', 'Body')
         gb_repo.set_status(closed.id, Status.CLOSED)
@@ -245,7 +252,7 @@ class TestIterBugs:
 
 
 class TestSinceFilter:
-    def test_list_bugs_since(self, gb_repo):
+    def test_list_bugs_since(self, gb_repo: GitBugRepo) -> None:
         """Bugs created before 'since' are excluded."""
         bug = gb_repo.create_bug('Recent bug', 'Body')
         # Use a timestamp far in the past -- should include the bug
@@ -257,7 +264,7 @@ class TestSinceFilter:
         bugs = gb_repo.list_bugs(since=9999999999)
         assert len(bugs) == 0
 
-    def test_since_with_iso_string(self, gb_repo):
+    def test_since_with_iso_string(self, gb_repo: GitBugRepo) -> None:
         gb_repo.create_bug('String since', 'Body')
         gb_repo.invalidate()
         bugs = gb_repo.list_bugs(since='2020-01-01 00:00:00')
@@ -265,7 +272,7 @@ class TestSinceFilter:
 
 
 class TestAttachments:
-    def test_get_attachment_round_trip(self, gb_repo):
+    def test_get_attachment_round_trip(self, gb_repo: GitBugRepo) -> None:
         """Create a bug with an attachment, then read it back."""
         # Create a bug -- its description becomes comment 0
         bug = gb_repo.create_bug('Attachment test', 'See attached')
@@ -289,7 +296,7 @@ class TestAttachments:
 
 
 class TestCache:
-    def test_invalidate_and_reread(self, gb_repo):
+    def test_invalidate_and_reread(self, gb_repo: GitBugRepo) -> None:
         bug = gb_repo.create_bug('Cache test', 'Body')
         bug1 = gb_repo.get_bug(bug.id)
         gb_repo.invalidate(bug.id)
@@ -298,7 +305,7 @@ class TestCache:
         assert bug1.title == bug2.title
         assert bug1.id == bug2.id
 
-    def test_full_invalidate(self, gb_repo):
+    def test_full_invalidate(self, gb_repo: GitBugRepo) -> None:
         bug = gb_repo.create_bug('Full invalidate', 'Body')
         gb_repo.get_bug(bug.id)
         gb_repo.invalidate()

-- 
2.53.0

