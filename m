Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A082A37F8A1
	for <tools@linux.kernel.org>; Mon, 20 Apr 2026 04:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776659965; cv=none; b=g5jxjc5Dzaa5IIfub6/+YmRyVolE8hGWmjvPQT0dKJGrqLTSHO6T/RJkDo0J+ySqzBqwMRmIzyKDrHsBNbuxlC5shNkQauqI5Gv9i0mcs+j5lV3UXFt7DleKJLSmiKw/RXfflt4MjG0hbqyIv28EUXglvzC9eKMRxblcjzTZ8fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776659965; c=relaxed/simple;
	bh=alhJ57zhewEsn+zeHWZvrWtwCL1ihCNYxCUqsmA5BRI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=clVSw535+nUAj/db2MjMDE1Z5SQRggdRp8nzm5mo209M6vgOwe5UtGex9XGl+I3zTxO7e7MsiX3c/tty1VvoDRFXsZrkxDUF5qcEli7CrFhRTduA+3w+BlL/OpXjfZmHgcjwl5WKUq84bYJn+5dYHK2f18jH7cdzhFmYFIfH3mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eS2oQDZR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eS2oQDZR"
Received: by smtp.kernel.org (Postfix)
	id 8D672C2BCB8; Mon, 20 Apr 2026 04:39:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B421C2BCB4;
	Mon, 20 Apr 2026 04:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776659965;
	bh=alhJ57zhewEsn+zeHWZvrWtwCL1ihCNYxCUqsmA5BRI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eS2oQDZRSNPJDDDAq9jrXhHlUs3LqiSsSGHu4PjZlUeESWDK4WgPjE20NMsZDeG2A
	 eHveFrJ3tiE2U4x2CURyi+BUVn3V08HhIYWdZnAxLtduFICHV374Cq119hwe7YYXlf
	 9mSh0eAv8EpKE8Wv/sixsJ+J9h8Np43i9EqtG0fEs+zlpFJpdIaFMkv94WurIcFO0C
	 gC980G9ZtUqSqYI+BOS88InuW4kohAhiPhUwXwokM99gas3rFYW9G6m4hwO17HuIaL
	 6XBskTf0MIkXmnIB5gKZjpldMk1UWOlp483OuXjyGIfjnSkwSJp7kjo0lDEjHG+z1m
	 oZBMAIBzCi6Ug==
From: Tamir Duberstein <tamird@kernel.org>
Date: Sun, 19 Apr 2026 21:39:24 -0700
Subject: [PATCH ezgb 3/6] Add Ruff format check
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260419-stronger-type-checking-v1-3-222775b987e5@kernel.org>
References: <20260419-stronger-type-checking-v1-0-222775b987e5@kernel.org>
In-Reply-To: <20260419-stronger-type-checking-v1-0-222775b987e5@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=42836; i=tamird@kernel.org;
 h=from:subject:message-id; bh=alhJ57zhewEsn+zeHWZvrWtwCL1ihCNYxCUqsmA5BRI=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlP1/7m3Cp3nVfkNsfyzxlH+mIOZfI2bZyfNy/Zc0fRL
 PFL4jo+HRNZGMS4GCzFFFkSRQ/tTU+9vUc2891xmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHQMeYgYtTAKZ6zUdGhsvFplH8LDEyHlemPti/r+L5v5DvSnKzfLbnGU9Td7k18wwjw5KcRrO
 EZI+cZbNKAmfxiscvc/yu/Iixk6Nq8re5l9MVGAE=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

Configure Ruff formatting to preserve the repository's single-quote
style and add the format check to local CI.

Apply the formatter once so the new check starts green.

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
 ci.sh                     |   1 +
 pyproject.toml            |   3 +
 src/ezgb/__init__.py      |  74 ++++++++++----------
 src/ezgb/_git.py          |   4 +-
 src/ezgb/_models.py       |   9 +++
 src/ezgb/_reader.py       |  55 ++++++++++-----
 src/ezgb/_types.py        |   1 +
 src/ezgb/_writer.py       |  27 +++++---
 tests/conftest.py         |  62 ++++++++++++-----
 tests/test_ezgb.py        | 169 ++++++++++++++++++++++++++++++----------------
 tests/test_integration.py |  32 +++++++--
 11 files changed, 290 insertions(+), 147 deletions(-)

diff --git a/ci.sh b/ci.sh
index 3001db2..db7914f 100755
--- a/ci.sh
+++ b/ci.sh
@@ -3,5 +3,6 @@
 set -eu
 
 uv run ruff check
+uv run ruff format --check
 uv run mypy .
 uv run pytest --durations=0
diff --git a/pyproject.toml b/pyproject.toml
index aeae989..c043817 100644
--- a/pyproject.toml
+++ b/pyproject.toml
@@ -47,3 +47,6 @@ strict = true
 
 [tool.ruff.lint]
 select = ["E", "F", "W", "I"]
+
+[tool.ruff.format]
+quote-style = "single"
diff --git a/src/ezgb/__init__.py b/src/ezgb/__init__.py
index f60d63e..5cb23ae 100644
--- a/src/ezgb/__init__.py
+++ b/src/ezgb/__init__.py
@@ -3,6 +3,7 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (C) 2024 by the Linux Foundation
 """ezgb: a standalone Python library for git-bug repositories."""
+
 from __future__ import annotations
 
 from collections.abc import Iterator
@@ -77,6 +78,7 @@ class GitBugRepo:
             return int(since.timestamp())
         # str -- delegate to the reader's parser
         from ezgb._reader import BugReader
+
         return BugReader._parse_since(since)
 
     def list_bugs(
@@ -94,9 +96,13 @@ class GitBugRepo:
         ``YYYYMMDDHHMMSS`` format.  Only bugs whose tip commit is
         newer than this value are returned.
         """
-        return list(self.iter_bugs(
-            status=status, label=label, since=since,
-        ))
+        return list(
+            self.iter_bugs(
+                status=status,
+                label=label,
+                since=since,
+            )
+        )
 
     def iter_bugs(
         self,
@@ -143,16 +149,18 @@ class GitBugRepo:
             if cached is not None:
                 results = cached
                 if status is not None:
-                    results = [s for s in results
-                               if s.status == status]
+                    results = [s for s in results if s.status == status]
                 if label is not None:
-                    results = [s for s in results
-                               if label in s.labels]
+                    results = [s for s in results if label in s.labels]
                 return results
         # Slow path: native git object reads
-        return list(self.iter_bug_summaries(
-            status=status, label=label, since=since,
-        ))
+        return list(
+            self.iter_bug_summaries(
+                status=status,
+                label=label,
+                since=since,
+            )
+        )
 
     def _list_summaries_from_cli(self) -> list[BugSummary] | None:
         """Try to list summaries via the git-bug CLI cache.
@@ -167,8 +175,8 @@ class GitBugRepo:
             return None
 
         from ezgb._git import git_bug_cli
-        ecode, out, _err = git_bug_cli(
-            self._repo, ['bug', '-f', 'json'])
+
+        ecode, out, _err = git_bug_cli(self._repo, ['bug', '-f', 'json'])
         if ecode != 0 or not out.strip():
             return None
         try:
@@ -183,24 +191,19 @@ class GitBugRepo:
             if not bid:
                 continue
             status_str = str(raw.get('status', 'open'))
-            bug_status = (Status.CLOSED if status_str == 'closed'
-                          else Status.OPEN)
+            bug_status = Status.CLOSED if status_str == 'closed' else Status.OPEN
             create_time = raw.get('create_time') or {}
             edit_time = raw.get('edit_time') or {}
-            ct = (create_time.get('timestamp', 0)
-                  if isinstance(create_time, dict) else 0)
-            et = (edit_time.get('timestamp', 0)
-                  if isinstance(edit_time, dict) else 0)
+            ct = create_time.get('timestamp', 0) if isinstance(create_time, dict) else 0
+            et = edit_time.get('timestamp', 0) if isinstance(edit_time, dict) else 0
             if not isinstance(ct, (bool, int, float, str)):
                 ct = 0
             if not isinstance(et, (bool, int, float, str)):
                 et = 0
             author = raw.get('author') or {}
-            author_name = (author.get('name', '')
-                           if isinstance(author, dict) else '')
+            author_name = author.get('name', '') if isinstance(author, dict) else ''
             assert isinstance(author_name, str)
-            author_id = (author.get('id', '')
-                         if isinstance(author, dict) else '')
+            author_id = author.get('id', '') if isinstance(author, dict) else ''
             raw_labels = raw.get('labels') or []
             if isinstance(raw_labels, list):
                 labels = frozenset(str(lb) for lb in raw_labels)
@@ -209,19 +212,19 @@ class GitBugRepo:
             comment_count = raw.get('comments', 0)
             if not isinstance(comment_count, int):
                 comment_count = 0
-            results.append(BugSummary(
-                id=bid,
-                title=str(raw.get('title', '')),
-                status=bug_status,
-                creator_id=str(author_id),
-                created_at=datetime.fromtimestamp(
-                    int(ct), tz=timezone.utc),
-                labels=labels,
-                comment_count=comment_count,
-                author_name=author_name,
-                edited_at=datetime.fromtimestamp(
-                    int(et), tz=timezone.utc),
-            ))
+            results.append(
+                BugSummary(
+                    id=bid,
+                    title=str(raw.get('title', '')),
+                    status=bug_status,
+                    creator_id=str(author_id),
+                    created_at=datetime.fromtimestamp(int(ct), tz=timezone.utc),
+                    labels=labels,
+                    comment_count=comment_count,
+                    author_name=author_name,
+                    edited_at=datetime.fromtimestamp(int(et), tz=timezone.utc),
+                )
+            )
         return results
 
     def iter_bug_summaries(
@@ -269,6 +272,7 @@ class GitBugRepo:
         import json
 
         from ezgb._git import git_bug_cli
+
         ecode, out, _err = git_bug_cli(self._repo, ['bug', '-f', 'json', query])
         if ecode != 0:
             return []
diff --git a/src/ezgb/_git.py b/src/ezgb/_git.py
index c09b066..4e29646 100644
--- a/src/ezgb/_git.py
+++ b/src/ezgb/_git.py
@@ -3,6 +3,7 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (C) 2024 by the Linux Foundation
 """Thin git subprocess helpers for ezgb."""
+
 from __future__ import annotations
 
 import os
@@ -51,7 +52,8 @@ def git_lines(repo_path: str, args: list[str]) -> list[str]:
 
 
 def git_bug_cli(
-    repo_path: str, args: list[str],
+    repo_path: str,
+    args: list[str],
     stdin: str | None = None,
 ) -> tuple[int, str, str]:
     """Run ``git -C REPO bug <args>`` for write operations.
diff --git a/src/ezgb/_models.py b/src/ezgb/_models.py
index 144a7ee..b8716f0 100644
--- a/src/ezgb/_models.py
+++ b/src/ezgb/_models.py
@@ -3,6 +3,7 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (C) 2024 by the Linux Foundation
 """Data models, enums, exceptions, and constants for ezgb."""
+
 from __future__ import annotations
 
 import enum
@@ -13,6 +14,7 @@ _EPOCH_UTC = datetime.min.replace(tzinfo=timezone.utc)
 
 # -- Exceptions --------------------------------------------------------------
 
+
 class EzgbError(Exception):
     """Base exception for all ezgb errors."""
 
@@ -43,8 +45,10 @@ class CliError(EzgbError):
 
 # -- Enums -------------------------------------------------------------------
 
+
 class Status(enum.Enum):
     """Bug status matching git-bug's common.Status values."""
+
     OPEN = 1
     CLOSED = 2
 
@@ -72,9 +76,11 @@ STATUS_CLOSED: int = 2
 
 # -- Dataclasses -------------------------------------------------------------
 
+
 @dataclass(frozen=True)
 class Identity:
     """A git-bug user identity."""
+
     id: str
     name: str
     email: str
@@ -84,6 +90,7 @@ class Identity:
 @dataclass
 class Comment:
     """A comment on a bug."""
+
     id: str
     author: Identity
     text: str
@@ -95,6 +102,7 @@ class Comment:
 @dataclass
 class Bug:
     """A git-bug bug snapshot reconstructed from operations."""
+
     id: str
     title: str
     status: Status
@@ -117,6 +125,7 @@ class BugSummary:
     *edited_at* are available. When built from native git objects,
     these may be empty/epoch if identity resolution was skipped.
     """
+
     id: str
     title: str
     status: Status
diff --git a/src/ezgb/_reader.py b/src/ezgb/_reader.py
index dac4a8c..735d41d 100644
--- a/src/ezgb/_reader.py
+++ b/src/ezgb/_reader.py
@@ -3,6 +3,7 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (C) 2024 by the Linux Foundation
 """Git object reading, operation pack replay, and caching for ezgb."""
+
 from __future__ import annotations
 
 import hashlib
@@ -47,12 +48,15 @@ _K = TypeVar('_K')
 _T = TypeVar('_T')
 _U = TypeVar('_U')
 
+
 def _is_list(value: list[_T], item_ty: type[_U]) -> TypeGuard[list[_U]]:
     return all(isinstance(item, item_ty) for item in value)
 
+
 def _is_dict_values(value: dict[_K, _T], value_ty: type[_U]) -> TypeGuard[dict[_K, _U]]:
     return all(isinstance(value, value_ty) for value in value.values())
 
+
 def _combine_ids(primary: str, secondary: str) -> str:
     """Interleave primary and secondary IDs into a CombinedId.
 
@@ -75,6 +79,7 @@ def _combine_ids(primary: str, secondary: str) -> str:
             pi += 1
     return ''.join(result)
 
+
 class BugReader:
     """Reads bug and identity data from git-bug's git object storage."""
 
@@ -113,7 +118,9 @@ class BugReader:
         return bytes(obj.data)
 
     def _walk_ref_tree_blobs(
-        self, refname: str, target_file: str = 'ops',
+        self,
+        refname: str,
+        target_file: str = 'ops',
     ) -> list[tuple[str, str]]:
         """Walk the commit chain for a ref and find named blobs.
 
@@ -142,7 +149,9 @@ class BugReader:
 
     @staticmethod
     def _check_format_version_tree(
-        tree: pygit2.Tree, prefix: str, supported: int,
+        tree: pygit2.Tree,
+        prefix: str,
+        supported: int,
     ) -> None:
         """Validate the git-bug format version from a commit tree.
 
@@ -153,7 +162,7 @@ class BugReader:
             name: str = entry.name or ''
             if name.startswith(prefix):
                 try:
-                    version = int(name[len(prefix):])
+                    version = int(name[len(prefix) :])
                 except ValueError:
                     continue
                 if version != supported:
@@ -166,7 +175,10 @@ class BugReader:
     # -- Ref enumeration -----------------------------------------------------
 
     def _list_refs(
-        self, prefix: str, *, since: int = 0,
+        self,
+        prefix: str,
+        *,
+        since: int = 0,
     ) -> list[tuple[str, str]]:
         """Return ``[(entity_id, commit_hex)]`` for refs under *prefix*.
 
@@ -188,7 +200,9 @@ class BugReader:
         return results
 
     def list_bug_refs(
-        self, *, since: int = 0,
+        self,
+        *,
+        since: int = 0,
     ) -> list[tuple[str, str]]:
         """Return ``[(bug_id, commit_hash)]`` for all bugs."""
         return self._list_refs('refs/bugs/', since=since)
@@ -227,7 +241,8 @@ class BugReader:
     # -- Operation pack parsing ----------------------------------------------
 
     def _get_op_packs(
-        self, bid: str,
+        self,
+        bid: str,
     ) -> tuple[list[_JsonObject], list[str]]:
         """Walk the commit chain for a bug and return operation packs
         (oldest first) together with the raw blob strings.
@@ -246,8 +261,7 @@ class BugReader:
         ref = self._pygit.references.get(refname)
         if ref is not None:
             tip = ref.peel(pygit2.Commit)
-            self._check_format_version_tree(
-                tip.tree, 'version-', SUPPORTED_BUG_FORMAT)
+            self._check_format_version_tree(tip.tree, 'version-', SUPPORTED_BUG_FORMAT)
         packs: list[_JsonObject] = []
         raw_blobs: list[str] = []
         for _commit, blob_hash in entries:
@@ -257,7 +271,8 @@ class BugReader:
             except json.JSONDecodeError:
                 logger.warning(
                     'failed to parse ops blob %s for bug %s',
-                    blob_hash, bid,
+                    blob_hash,
+                    bid,
                 )
                 continue
             assert isinstance(pack, dict)
@@ -277,7 +292,9 @@ class BugReader:
             return self._identity_cache[identity_id]
 
         fallback = Identity(
-            id=identity_id, name=identity_id, email=identity_id,
+            id=identity_id,
+            name=identity_id,
+            email=identity_id,
         )
         refname = 'refs/identities/' + identity_id
         try:
@@ -417,7 +434,8 @@ class BugReader:
         raise ValueError('cannot parse since=%s' % since)
 
     def build_bug(
-        self, bid: str,
+        self,
+        bid: str,
         packs: list[_JsonObject] | None = None,
         raw_blobs: list[str] | None = None,
     ) -> Bug:
@@ -457,8 +475,9 @@ class BugReader:
             assert isinstance(author_value, dict)
             author_id = author_value.get('id', '')
             assert isinstance(author_id, str)
-            raw_ops = (raw_ops_per_pack[pack_idx]
-                       if pack_idx < len(raw_ops_per_pack) else [])
+            raw_ops = (
+                raw_ops_per_pack[pack_idx] if pack_idx < len(raw_ops_per_pack) else []
+            )
             ops = pack.get('ops', [])
             assert isinstance(ops, list)
             for op_idx, op in enumerate(ops):
@@ -467,8 +486,7 @@ class BugReader:
                 assert isinstance(op_type, int)
                 timestamp = op.get('timestamp', 0)
                 assert isinstance(timestamp, int)
-                raw_json = (raw_ops[op_idx]
-                            if op_idx < len(raw_ops) else '')
+                raw_json = raw_ops[op_idx] if op_idx < len(raw_ops) else ''
                 op_id = self._op_hash(raw_json) if raw_json else ''
 
                 if op_type == OP_CREATE:
@@ -530,7 +548,7 @@ class BugReader:
                 elif op_type == OP_SET_STATUS:
                     status_val = op.get('status', STATUS_OPEN)
                     assert isinstance(status_val, int)
-                    is_open = (status_val == STATUS_OPEN)
+                    is_open = status_val == STATUS_OPEN
 
                 elif op_type == OP_LABEL_CHANGE:
                     added = op.get('added', [])
@@ -588,7 +606,8 @@ class BugReader:
         return bug
 
     def build_bug_summary(
-        self, bid: str,
+        self,
+        bid: str,
         packs: list[_JsonObject] | None = None,
     ) -> BugSummary:
         """Build a lightweight bug summary by replaying operation packs.
@@ -649,7 +668,7 @@ class BugReader:
                 elif op_type == OP_SET_STATUS:
                     status_val = op.get('status', STATUS_OPEN)
                     assert isinstance(status_val, int)
-                    is_open = (status_val == STATUS_OPEN)
+                    is_open = status_val == STATUS_OPEN
 
                 elif op_type == OP_LABEL_CHANGE:
                     added = op.get('added', [])
diff --git a/src/ezgb/_types.py b/src/ezgb/_types.py
index e3e46da..389b743 100644
--- a/src/ezgb/_types.py
+++ b/src/ezgb/_types.py
@@ -1,4 +1,5 @@
 """Internal type aliases."""
+
 from __future__ import annotations
 
 from typing import Dict, List, Union
diff --git a/src/ezgb/_writer.py b/src/ezgb/_writer.py
index 8888a04..ae1d45f 100644
--- a/src/ezgb/_writer.py
+++ b/src/ezgb/_writer.py
@@ -3,6 +3,7 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (C) 2024 by the Linux Foundation
 """CLI wrappers for git-bug write operations."""
+
 from __future__ import annotations
 
 import logging
@@ -35,8 +36,7 @@ class BugWriter:
         self._repo = repo_path
         self._reader = reader
 
-    def _cli(self, args: list[str],
-             stdin: str | None = None) -> tuple[int, str, str]:
+    def _cli(self, args: list[str], stdin: str | None = None) -> tuple[int, str, str]:
         """Run a git-bug CLI command."""
         return git_bug_cli(self._repo, args, stdin=stdin)
 
@@ -58,9 +58,7 @@ class BugWriter:
         # Parse human_id from output like "abc1234 created"
         match = _NEW_BUG_RE.match(out.strip())
         if not match:
-            raise CliError(
-                'could not parse bug ID from git bug new output: %s' % out
-            )
+            raise CliError('could not parse bug ID from git bug new output: %s' % out)
         human_id = match.group(1)
 
         self._reader.invalidate()
@@ -71,8 +69,13 @@ class BugWriter:
         """Add a comment to a bug and return the new Comment."""
         bid = self._reader.resolve_bug_id(bid)
         args = [
-            'bug', 'comment', 'new', bid,
-            '-F', '-', '--non-interactive',
+            'bug',
+            'comment',
+            'new',
+            bid,
+            '-F',
+            '-',
+            '--non-interactive',
         ]
         ecode, out, err = self._cli(args, stdin=text)
         if ecode != 0:
@@ -89,8 +92,13 @@ class BugWriter:
         """
         bid = self._reader.resolve_bug_id(bid)
         args = [
-            'bug', 'comment', 'edit', comment_id,
-            '-F', '-', '--non-interactive',
+            'bug',
+            'comment',
+            'edit',
+            comment_id,
+            '-F',
+            '-',
+            '--non-interactive',
         ]
         ecode, out, err = self._cli(args, stdin=text)
         if ecode != 0:
@@ -166,4 +174,3 @@ class BugWriter:
         invalidate caches after a successful pull.
         """
         return self._cli(['pull', remote])
-
diff --git a/tests/conftest.py b/tests/conftest.py
index ed03529..75e3b95 100644
--- a/tests/conftest.py
+++ b/tests/conftest.py
@@ -3,6 +3,7 @@
 Creates real git objects in temporary bare repos using pygit2 so
 the BugReader can read them without subprocess mocking.
 """
+
 from __future__ import annotations
 
 import json
@@ -31,23 +32,28 @@ CliResult = tuple[int, str, str]
 
 # -- Test data factories -----------------------------------------------------
 
+
 def make_identity_version(name: str, email: str) -> str:
     """Build a JSON identity version blob (format 2)."""
-    return json.dumps({
-        'version': 2,
-        'unix_time': 1700000000,
-        'name': name,
-        'email': email,
-        'login': email.split('@')[0],
-    })
+    return json.dumps(
+        {
+            'version': 2,
+            'unix_time': 1700000000,
+            'name': name,
+            'email': email,
+            'login': email.split('@')[0],
+        }
+    )
 
 
 def make_op_pack(author_id: str, ops: list[JsonObject]) -> str:
     """Build a JSON operation pack with author and ops array."""
-    return json.dumps({
-        'author': {'id': author_id},
-        'ops': ops,
-    })
+    return json.dumps(
+        {
+            'author': {'id': author_id},
+            'ops': ops,
+        }
+    )
 
 
 def make_create_op(
@@ -101,8 +107,10 @@ def make_edit_comment_op(
 ) -> JsonObject:
     """Build an OP_EDIT_COMMENT (type 6) operation."""
     return {
-        'type': 6, 'timestamp': timestamp,
-        'target': target, 'message': message,
+        'type': 6,
+        'timestamp': timestamp,
+        'target': target,
+        'message': message,
     }
 
 
@@ -117,10 +125,12 @@ def make_label_change_op(
     if removed is None:
         removed = []
     return {
-        'type': 5, 'timestamp': timestamp,
+        'type': 5,
+        'timestamp': timestamp,
         # Shallow copies are needed because list is invariant. We could use
         # Sequence instead, but that's fancy for little benefit.
-        'added': [a for a in added], 'removed': [r for r in removed],
+        'added': [a for a in added],
+        'removed': [r for r in removed],
     }
 
 
@@ -139,6 +149,7 @@ def make_noop_op(timestamp: int = 1700006000) -> JsonObject:
 
 # -- Real git object helpers -------------------------------------------------
 
+
 def _create_bug_commit(
     repo: pygit2.Repository,
     refname: str,
@@ -161,7 +172,12 @@ def _create_bug_commit(
 
     parents = [parent_oid] if parent_oid else []
     return repo.create_commit(
-        refname, _SIG, _SIG, 'op pack', tree_oid, parents,
+        refname,
+        _SIG,
+        _SIG,
+        'op pack',
+        tree_oid,
+        parents,
     )
 
 
@@ -181,12 +197,18 @@ def _create_identity_commit(
     tree_oid = tb.write()
 
     return repo.create_commit(
-        refname, _SIG, _SIG, 'identity', tree_oid, [],
+        refname,
+        _SIG,
+        _SIG,
+        'identity',
+        tree_oid,
+        [],
     )
 
 
 # -- Convenience setup -------------------------------------------------------
 
+
 def setup_identity(
     repo_path: str,
     identity_id: str,
@@ -236,7 +258,10 @@ def setup_single_bug(
     if extra_packs:
         for extra_json in extra_packs:
             parent = _create_bug_commit(
-                repo, refname, extra_json, parent_oid=parent,
+                repo,
+                refname,
+                extra_json,
+                parent_oid=parent,
             )
 
     # Pre-cache bug ID resolution so tests don't need separate
@@ -249,6 +274,7 @@ def setup_single_bug(
 
 # -- Fixtures ----------------------------------------------------------------
 
+
 class RecordingBugWriter(BugWriter):
     """BugWriter test double that records CLI calls and canned responses."""
 
diff --git a/tests/test_ezgb.py b/tests/test_ezgb.py
index 6d9f491..c36a454 100644
--- a/tests/test_ezgb.py
+++ b/tests/test_ezgb.py
@@ -6,6 +6,7 @@ writer (CLI-based mutations), and GitBugRepo facade.
 Uses real git objects in temporary bare repos (via pygit2) instead
 of subprocess mocking. See conftest.py for fixtures and helpers.
 """
+
 import json
 
 import pygit2
@@ -44,6 +45,7 @@ from ezgb._reader import BugReader, _combine_ids
 # Unit tests: _combine_ids
 # ------------------------------------------------------------------
 
+
 class TestCombineIds:
     """Unit tests for the CombinedId interleaving function."""
 
@@ -72,6 +74,7 @@ class TestCombineIds:
 # Bug ID resolution
 # ------------------------------------------------------------------
 
+
 class TestResolveBugId:
     def test_resolves_full_id(self, reader: BugReader, repo_path: str) -> None:
         repo = pygit2.Repository(repo_path)
@@ -117,6 +120,7 @@ class TestResolveBugId:
 # Identity resolution
 # ------------------------------------------------------------------
 
+
 class TestResolveIdentity:
     def test_resolves_by_id(self, reader: BugReader, repo_path: str) -> None:
         setup_identity(repo_path, IDENTITY_ID, 'Alice', 'alice@example.com')
@@ -139,11 +143,13 @@ class TestResolveIdentity:
 
     def test_unsupported_format_raises(self, reader: BugReader, repo_path: str) -> None:
         repo = pygit2.Repository(repo_path)
-        identity_json = json.dumps({
-            'version': 99,
-            'name': 'Alice',
-            'email': 'alice@example.com',
-        })
+        identity_json = json.dumps(
+            {
+                'version': 99,
+                'name': 'Alice',
+                'email': 'alice@example.com',
+            }
+        )
         refname = 'refs/identities/%s' % IDENTITY_ID
         _create_identity_commit(repo, refname, identity_json)
         with pytest.raises(UnsupportedFormatError, match='identity format'):
@@ -154,6 +160,7 @@ class TestResolveIdentity:
 # Bug snapshot reconstruction
 # ------------------------------------------------------------------
 
+
 class TestBuildBug:
     def test_snapshot_reconstruction(self, reader: BugReader, repo_path: str) -> None:
         setup_single_bug(repo_path, reader)
@@ -188,7 +195,8 @@ class TestBuildBug:
     def test_label_add_and_remove(self, reader: BugReader, repo_path: str) -> None:
         add_op = make_label_change_op(added=['bug', 'priority/high'])
         rm_op = make_label_change_op(
-            removed=['bug'], timestamp=1700005000,
+            removed=['bug'],
+            timestamp=1700005000,
         )
         setup_single_bug(repo_path, reader, extra_ops=[add_op, rm_op])
         bug = reader.build_bug(BUG_ID)
@@ -206,16 +214,20 @@ class TestBuildBug:
         assert bug.comments[1].text == 'A follow-up'
 
     def test_comment_with_attachment(self, reader: BugReader, repo_path: str) -> None:
-        ops: list[JsonObject] = [{
-            'type': 1,
-            'timestamp': 1700000000,
-            'title': 'Bug with file',
-            'message': 'See attached',
-            'files': ['blobhash123'],
-        }]
+        ops: list[JsonObject] = [
+            {
+                'type': 1,
+                'timestamp': 1700000000,
+                'title': 'Bug with file',
+                'message': 'See attached',
+                'files': ['blobhash123'],
+            }
+        ]
         setup_single_bug(
-            repo_path, reader,
-            title='Bug with file', message='See attached',
+            repo_path,
+            reader,
+            title='Bug with file',
+            message='See attached',
             extra_ops=None,
         )
         # Rebuild with custom ops containing files
@@ -242,7 +254,8 @@ class TestBuildBug:
         target_hash = BugReader._op_hash(raw_ops[0])
 
         edit_op = make_edit_comment_op(
-            target=target_hash, message='Edited text',
+            target=target_hash,
+            message='Edited text',
         )
         # Build the full pack with both ops
         ops = [create_op, edit_op]
@@ -250,7 +263,9 @@ class TestBuildBug:
 
         repo = pygit2.Repository(repo_path)
         _create_bug_commit(
-            repo, 'refs/bugs/%s' % BUG_ID, full_pack_json,
+            repo,
+            'refs/bugs/%s' % BUG_ID,
+            full_pack_json,
         )
         reader._resolve_cache[BUG_ID] = BUG_ID
         setup_identity(repo_path, IDENTITY_ID, 'Alice', 'alice@example.com')
@@ -259,18 +274,23 @@ class TestBuildBug:
         assert bug.comments[0].text == 'Edited text'
 
     def test_edit_comment_unmatched_target(
-        self, reader: BugReader, repo_path: str,
+        self,
+        reader: BugReader,
+        repo_path: str,
     ) -> None:
         """Unmatched OP_EDIT_COMMENT target leaves text unchanged."""
         edit_op = make_edit_comment_op(
-            target='nonexistent', message='Edited text',
+            target='nonexistent',
+            message='Edited text',
         )
         setup_single_bug(repo_path, reader, extra_ops=[edit_op])
         bug = reader.build_bug(BUG_ID)
         assert bug.comments[0].text == 'Bug description'
 
     def test_metadata_from_set_metadata(
-        self, reader: BugReader, repo_path: str,
+        self,
+        reader: BugReader,
+        repo_path: str,
     ) -> None:
         meta_op = make_set_metadata_op({'key': 'value'})
         setup_single_bug(repo_path, reader, extra_ops=[meta_op])
@@ -286,12 +306,17 @@ class TestBuildBug:
     def test_multiple_op_packs(self, reader: BugReader, repo_path: str) -> None:
         """Operations spread across multiple commits are replayed
         in order."""
-        pack2_json = make_op_pack(IDENTITY_ID, [
-            make_set_title_op('Updated'),
-        ])
+        pack2_json = make_op_pack(
+            IDENTITY_ID,
+            [
+                make_set_title_op('Updated'),
+            ],
+        )
         setup_single_bug(
-            repo_path, reader,
-            title='Original', message='Body',
+            repo_path,
+            reader,
+            title='Original',
+            message='Body',
             extra_packs=[pack2_json],
         )
         bug = reader.build_bug(BUG_ID)
@@ -310,11 +335,16 @@ class TestBuildBug:
 
     def test_unsupported_format_raises(self, reader: BugReader, repo_path: str) -> None:
         repo = pygit2.Repository(repo_path)
-        ops_json = make_op_pack(IDENTITY_ID, [
-            make_create_op('Test', 'body'),
-        ])
+        ops_json = make_op_pack(
+            IDENTITY_ID,
+            [
+                make_create_op('Test', 'body'),
+            ],
+        )
         _create_bug_commit(
-            repo, 'refs/bugs/%s' % BUG_ID, ops_json,
+            repo,
+            'refs/bugs/%s' % BUG_ID,
+            ops_json,
             version_tag='version-99',
         )
         reader._resolve_cache[BUG_ID] = BUG_ID
@@ -326,6 +356,7 @@ class TestBuildBug:
 # Bug summary (lightweight list-view snapshot)
 # ------------------------------------------------------------------
 
+
 class TestBuildBugSummary:
     def test_basic(self, reader: BugReader, repo_path: str) -> None:
         setup_single_bug(repo_path, reader)
@@ -352,7 +383,8 @@ class TestBuildBugSummary:
     def test_label_changes(self, reader: BugReader, repo_path: str) -> None:
         add_op = make_label_change_op(added=['bug', 'priority/high'])
         rm_op = make_label_change_op(
-            removed=['bug'], timestamp=1700005000,
+            removed=['bug'],
+            timestamp=1700005000,
         )
         setup_single_bug(repo_path, reader, extra_ops=[add_op, rm_op])
         s = reader.build_bug_summary(BUG_ID)
@@ -378,10 +410,13 @@ class TestBuildBugSummary:
         assert s.comment_count == 0
 
     def test_edit_comment_does_not_affect_count(
-        self, reader: BugReader, repo_path: str,
+        self,
+        reader: BugReader,
+        repo_path: str,
     ) -> None:
         edit_op = make_edit_comment_op(
-            target='whatever', message='Edited',
+            target='whatever',
+            message='Edited',
         )
         setup_single_bug(repo_path, reader, extra_ops=[edit_op])
         s = reader.build_bug_summary(BUG_ID)
@@ -434,6 +469,7 @@ class TestBuildBugSummary:
 # Prefetch
 # ------------------------------------------------------------------
 
+
 class TestPrefetchBugs:
     def test_warms_cache(self, reader: BugReader, repo_path: str) -> None:
         setup_single_bug(repo_path, reader)
@@ -458,6 +494,7 @@ class TestPrefetchBugs:
 # Ref enumeration
 # ------------------------------------------------------------------
 
+
 class TestListBugRefs:
     def test_returns_refs(self, reader: BugReader, repo_path: str) -> None:
         setup_single_bug(repo_path, reader)
@@ -482,6 +519,7 @@ class TestListIdentityRefs:
 # Cache management
 # ------------------------------------------------------------------
 
+
 class TestInvalidate:
     def test_invalidate_single_bug(self, reader: BugReader, repo_path: str) -> None:
         setup_single_bug(repo_path, reader)
@@ -505,6 +543,7 @@ class TestInvalidate:
 # Writer: create_bug
 # ------------------------------------------------------------------
 
+
 class TestCreateBug:
     def test_creates_and_returns_bug(
         self,
@@ -536,6 +575,7 @@ class TestCreateBug:
 # Writer: add_comment
 # ------------------------------------------------------------------
 
+
 class TestAddComment:
     def test_adds_and_returns_comment(
         self,
@@ -558,7 +598,9 @@ class TestAddComment:
         comment_op = make_comment_op('New comment', timestamp=1700005000)
         pack_json = make_op_pack(IDENTITY_ID, [comment_op])
         _create_bug_commit(
-            repo, 'refs/bugs/%s' % BUG_ID, pack_json,
+            repo,
+            'refs/bugs/%s' % BUG_ID,
+            pack_json,
             parent_oid=parent.id,
         )
 
@@ -571,6 +613,7 @@ class TestAddComment:
 # Writer: set_status
 # ------------------------------------------------------------------
 
+
 class TestSetStatus:
     def test_close(
         self,
@@ -580,9 +623,7 @@ class TestSetStatus:
     ) -> None:
         setup_single_bug(repo_path, reader)
         writer.set_status(BUG_ID, Status.CLOSED)
-        assert any(
-            'close' in ' '.join(c) for c in writer._cli_calls
-        )
+        assert any('close' in ' '.join(c) for c in writer._cli_calls)
 
     def test_open(
         self,
@@ -592,15 +633,14 @@ class TestSetStatus:
     ) -> None:
         setup_single_bug(repo_path, reader)
         writer.set_status(BUG_ID, Status.OPEN)
-        assert any(
-            'open' in ' '.join(c) for c in writer._cli_calls
-        )
+        assert any('open' in ' '.join(c) for c in writer._cli_calls)
 
 
 # ------------------------------------------------------------------
 # Writer: set_title
 # ------------------------------------------------------------------
 
+
 class TestSetTitle:
     def test_updates_title(
         self,
@@ -610,15 +650,14 @@ class TestSetTitle:
     ) -> None:
         setup_single_bug(repo_path, reader)
         writer.set_title(BUG_ID, 'New title')
-        assert any(
-            'New title' in ' '.join(c) for c in writer._cli_calls
-        )
+        assert any('New title' in ' '.join(c) for c in writer._cli_calls)
 
 
 # ------------------------------------------------------------------
 # Writer: labels
 # ------------------------------------------------------------------
 
+
 class TestLabels:
     def test_add_label(
         self,
@@ -628,9 +667,7 @@ class TestLabels:
     ) -> None:
         setup_single_bug(repo_path, reader)
         writer.add_label(BUG_ID, 'priority/high')
-        assert any(
-            'priority/high' in ' '.join(c) for c in writer._cli_calls
-        )
+        assert any('priority/high' in ' '.join(c) for c in writer._cli_calls)
 
     def test_remove_label(
         self,
@@ -640,9 +677,7 @@ class TestLabels:
     ) -> None:
         setup_single_bug(repo_path, reader)
         writer.remove_label(BUG_ID, 'old-label')
-        assert any(
-            'old-label' in ' '.join(c) for c in writer._cli_calls
-        )
+        assert any('old-label' in ' '.join(c) for c in writer._cli_calls)
 
 
 # ------------------------------------------------------------------
@@ -650,6 +685,7 @@ class TestLabels:
 # GitBugRepo facade
 # ------------------------------------------------------------------
 
+
 class TestGitBugRepo:
     def test_get_bug(self, repo_path: str) -> None:
         repo_obj = GitBugRepo(repo_path)
@@ -764,8 +800,7 @@ class TestGitBugRepo:
         repo_obj = GitBugRepo(repo_path)
         # Create bug with a specific commit timestamp
         repo = pygit2.Repository(repo_path)
-        sig = pygit2.Signature('Test', 'test@test.com',
-                               time=1700005000, offset=0)
+        sig = pygit2.Signature('Test', 'test@test.com', time=1700005000, offset=0)
         ops = [make_create_op('Test bug', 'Bug description')]
         pack_json = make_op_pack(IDENTITY_ID, ops)
         ops_blob = repo.create_blob(pack_json.encode())
@@ -775,7 +810,12 @@ class TestGitBugRepo:
         tb.insert('version-4', version_blob, pygit2.GIT_FILEMODE_BLOB)
         tree_oid = tb.write()
         repo.create_commit(
-            'refs/bugs/%s' % BUG_ID, sig, sig, 'op pack', tree_oid, [],
+            'refs/bugs/%s' % BUG_ID,
+            sig,
+            sig,
+            'op pack',
+            tree_oid,
+            [],
         )
         repo_obj._reader._resolve_cache[BUG_ID] = BUG_ID
         setup_identity(repo_path, IDENTITY_ID, 'Alice', 'alice@example.com')
@@ -795,8 +835,7 @@ class TestGitBugRepo:
         """list_bugs(since='2023-11-14 ...') parses the string."""
         repo_obj = GitBugRepo(repo_path)
         repo = pygit2.Repository(repo_path)
-        sig = pygit2.Signature('Test', 'test@test.com',
-                               time=1700005000, offset=0)
+        sig = pygit2.Signature('Test', 'test@test.com', time=1700005000, offset=0)
         ops = [make_create_op('Test bug', 'Bug description')]
         pack_json = make_op_pack(IDENTITY_ID, ops)
         ops_blob = repo.create_blob(pack_json.encode())
@@ -806,7 +845,12 @@ class TestGitBugRepo:
         tb.insert('version-4', version_blob, pygit2.GIT_FILEMODE_BLOB)
         tree_oid = tb.write()
         repo.create_commit(
-            'refs/bugs/%s' % BUG_ID, sig, sig, 'op pack', tree_oid, [],
+            'refs/bugs/%s' % BUG_ID,
+            sig,
+            sig,
+            'op pack',
+            tree_oid,
+            [],
         )
         repo_obj._reader._resolve_cache[BUG_ID] = BUG_ID
         setup_identity(repo_path, IDENTITY_ID, 'Alice', 'alice@example.com')
@@ -819,6 +863,7 @@ class TestGitBugRepo:
 # Attachment reading
 # ------------------------------------------------------------------
 
+
 class TestCatBlobBytes:
     def test_reads_bytes(self, reader: BugReader, repo_path: str) -> None:
         repo = pygit2.Repository(repo_path)
@@ -836,14 +881,17 @@ class TestCatBlobBytes:
 # Since filtering on list_bug_refs
 # ------------------------------------------------------------------
 
+
 class TestListBugRefsSince:
     def _create_bug_with_timestamp(
-        self, repo_path: str, reader: BugReader, ts: int,
+        self,
+        repo_path: str,
+        reader: BugReader,
+        ts: int,
     ) -> None:
         """Helper: create a bug ref with a specific commit timestamp."""
         repo = pygit2.Repository(repo_path)
-        sig = pygit2.Signature('Test', 'test@test.com',
-                               time=ts, offset=0)
+        sig = pygit2.Signature('Test', 'test@test.com', time=ts, offset=0)
         ops = [make_create_op('Test bug', 'description')]
         pack_json = make_op_pack(IDENTITY_ID, ops)
         ops_blob = repo.create_blob(pack_json.encode())
@@ -853,7 +901,12 @@ class TestListBugRefsSince:
         tb.insert('version-4', version_blob, pygit2.GIT_FILEMODE_BLOB)
         tree_oid = tb.write()
         repo.create_commit(
-            'refs/bugs/%s' % BUG_ID, sig, sig, 'op pack', tree_oid, [],
+            'refs/bugs/%s' % BUG_ID,
+            sig,
+            sig,
+            'op pack',
+            tree_oid,
+            [],
         )
 
     def test_no_filter(self, reader: BugReader, repo_path: str) -> None:
diff --git a/tests/test_integration.py b/tests/test_integration.py
index dcbbc6c..963f635 100644
--- a/tests/test_integration.py
+++ b/tests/test_integration.py
@@ -4,6 +4,7 @@ These tests create ephemeral git repositories, initialize git-bug
 with a test identity, and exercise the full ezgb stack end-to-end.
 Skip automatically when ``git-bug`` is not installed.
 """
+
 import json
 import shutil
 import subprocess
@@ -29,20 +30,34 @@ def gb_repo(tmp_path: Path) -> GitBugRepo:
 
     def _run(args: list[str]) -> subprocess.CompletedProcess[str]:
         return subprocess.run(
-            args, capture_output=True, text=True, check=True,
+            args,
+            capture_output=True,
+            text=True,
+            check=True,
         )
 
     # Initialise the git repo
     _run(['git', 'init', repo_path])
     _run(['git', '-C', repo_path, 'config', 'user.name', 'Test User'])
-    _run(['git', '-C', repo_path, 'config', 'user.email',
-          'test@example.com'])
+    _run(['git', '-C', repo_path, 'config', 'user.email', 'test@example.com'])
     _run(['git', '-C', repo_path, 'commit', '--allow-empty', '-m', 'init'])
 
     # Create and adopt a git-bug identity
-    _run(['git', '-C', repo_path, 'bug', 'user', 'new',
-          '-n', 'Test User', '-e', 'test@example.com',
-          '--non-interactive'])
+    _run(
+        [
+            'git',
+            '-C',
+            repo_path,
+            'bug',
+            'user',
+            'new',
+            '-n',
+            'Test User',
+            '-e',
+            'test@example.com',
+            '--non-interactive',
+        ]
+    )
     result = _run(['git', '-C', repo_path, 'bug', 'user', '-f', 'json'])
     users: JsonValue = json.loads(result.stdout)
     assert isinstance(users, list)
@@ -59,6 +74,7 @@ def gb_repo(tmp_path: Path) -> GitBugRepo:
 # Tests
 # ------------------------------------------------------------------
 
+
 class TestCreateAndRead:
     def test_round_trip(self, gb_repo: GitBugRepo) -> None:
         bug = gb_repo.create_bug('Test bug', 'Description text')
@@ -283,11 +299,13 @@ class TestAttachments:
         # blob. Use the ops blob itself as a stand-in.
         # Instead, test against an actual blob by writing one via git.
         import subprocess
+
         repo_path = gb_repo._repo
         result = subprocess.run(
             ['git', '-C', repo_path, 'hash-object', '-w', '--stdin'],
             input=b'test file content',
-            capture_output=True, check=True,
+            capture_output=True,
+            check=True,
         )
         blob_hash = result.stdout.decode().strip()
 

-- 
2.53.0

