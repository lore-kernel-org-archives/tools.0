Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC03D3803E5
	for <tools@linux.kernel.org>; Mon, 20 Apr 2026 04:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776659965; cv=none; b=erGxMtISKBmSC8kCIju8K5qsIdZ8Sd74bRPI3VR7OGVRNCnNO2R5oJ1oxtyO+nbwscw/HiFS8uWXzckh0JJeo3aVAJqJ4OsE/ndIjoVUzjHcZ+RwjOgEi/7i/Cvzg45Ec6Sv4CvfK/VlDnWWrv5hozYqoiRvJ8tSB82lDMIUb4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776659965; c=relaxed/simple;
	bh=hDhr3DrSAxEdXaVq2X7e5QB1RgO0mPF+kkl3ZgR5HUE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tv2mPjTC6tPnsKohi+2+lrHTyK/7ZbWGTUKDmFuNqfD0AFVg5szGcDanm2y9C6InlkxjsilupR+ckyov1HQpdE5kj/20sLps2BxgUVIUqD2HZP0dZiR2qdr+ReO5+sUElASAW8AtWn48gKYMAaHhDeYhvgrT0UOm6MnRsFhB7xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZxKQUkqS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZxKQUkqS"
Received: by smtp.kernel.org (Postfix)
	id C4CC4C19425; Mon, 20 Apr 2026 04:39:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 940F4C2BCF5;
	Mon, 20 Apr 2026 04:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776659965;
	bh=hDhr3DrSAxEdXaVq2X7e5QB1RgO0mPF+kkl3ZgR5HUE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZxKQUkqShiXGwH4pJY6RhlVCTMN3YhBTNgh0BRUFNNc67hrC4Vl1lJPKUacH4QPYe
	 3nA5KNF+s/vwUwWVRU51Eh6B+jdRamlzJtB1dt5KZDtopJ9b8WFLeJGkSTUkFsO1wd
	 cHiwUw2BSCC8ihhLl5fNRhzxQeQJ+LAsiEwlEaNHT6epFURKQo2QP9Iy9CBkIBe0YY
	 lAp9GHk5g3V+yuwowC4WVWsFsG5/EIIfuXD13dE3InD6ewTUJzmT7b0NUieUpX1s9w
	 8nESS7vTTfKtSzmghXHYbm72j6q0387A5yoc1GWuojnMQPBCmpGCOmP8CXxZZFsluV
	 +ClOg7pU3Yvww==
From: Tamir Duberstein <tamird@kernel.org>
Date: Sun, 19 Apr 2026 21:39:25 -0700
Subject: [PATCH ezgb 4/6] Add pyright checks
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260419-stronger-type-checking-v1-4-222775b987e5@kernel.org>
References: <20260419-stronger-type-checking-v1-0-222775b987e5@kernel.org>
In-Reply-To: <20260419-stronger-type-checking-v1-0-222775b987e5@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=8172; i=tamird@kernel.org;
 h=from:subject:message-id; bh=hDhr3DrSAxEdXaVq2X7e5QB1RgO0mPF+kkl3ZgR5HUE=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlP1/5x2RXZdeD53/8VU8vm3bAv49ta02Qb96BMe+r+s
 qgIn92KHRNZGMS4GCzFFFkSRQ/tTU+9vUc2891xmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHQMeYgYtTAKZaiovhn1L4NkU56xuTZse18p4QSOQIUZz4Yrbj7PXbwvb9nn439wHD//B9Vkr
 zJu7pkvu1S8Z2mVPCCXuJ0JSfLPWWD5ImnvedwwkA
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

Add pyright to local CI with strict source checking.

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
 ci.sh                |  1 +
 pyproject.toml       |  7 +++++++
 src/ezgb/__init__.py |  8 +++-----
 src/ezgb/_git.py     |  2 +-
 src/ezgb/_models.py  |  4 ++--
 src/ezgb/_reader.py  | 38 +++++++++++++++++++++-----------------
 src/ezgb/_writer.py  | 14 +++++++-------
 7 files changed, 42 insertions(+), 32 deletions(-)

diff --git a/ci.sh b/ci.sh
index db7914f..fbc433d 100755
--- a/ci.sh
+++ b/ci.sh
@@ -5,4 +5,5 @@ set -eu
 uv run ruff check
 uv run ruff format --check
 uv run mypy .
+uv run pyright
 uv run pytest --durations=0
diff --git a/pyproject.toml b/pyproject.toml
index c043817..452bd6a 100644
--- a/pyproject.toml
+++ b/pyproject.toml
@@ -26,6 +26,7 @@ classifiers = [
 [dependency-groups]
 dev = [
     "mypy",
+    "pyright",
     "pytest",
     "ruff",
 ]
@@ -50,3 +51,9 @@ select = ["E", "F", "W", "I"]
 
 [tool.ruff.format]
 quote-style = "single"
+
+[tool.pyright]
+typeCheckingMode = "strict"
+executionEnvironments = [
+    { root = "tests", reportPrivateUsage = false },
+]
diff --git a/src/ezgb/__init__.py b/src/ezgb/__init__.py
index 5cb23ae..f2f5d3d 100644
--- a/src/ezgb/__init__.py
+++ b/src/ezgb/__init__.py
@@ -23,7 +23,7 @@ from ezgb._models import (
     Status,
     UnsupportedFormatError,
 )
-from ezgb._reader import BugReader
+from ezgb._reader import BugReader, parse_since
 from ezgb._types import JsonValue
 from ezgb._writer import BugWriter
 
@@ -77,9 +77,7 @@ class GitBugRepo:
                 since = since.replace(tzinfo=timezone.utc)
             return int(since.timestamp())
         # str -- delegate to the reader's parser
-        from ezgb._reader import BugReader
-
-        return BugReader._parse_since(since)
+        return parse_since(since)
 
     def list_bugs(
         self,
@@ -206,7 +204,7 @@ class GitBugRepo:
             author_id = author.get('id', '') if isinstance(author, dict) else ''
             raw_labels = raw.get('labels') or []
             if isinstance(raw_labels, list):
-                labels = frozenset(str(lb) for lb in raw_labels)
+                labels: frozenset[str] = frozenset(str(lb) for lb in raw_labels)
             else:
                 labels = frozenset()
             comment_count = raw.get('comments', 0)
diff --git a/src/ezgb/_git.py b/src/ezgb/_git.py
index 4e29646..c1c326b 100644
--- a/src/ezgb/_git.py
+++ b/src/ezgb/_git.py
@@ -45,7 +45,7 @@ def git_run(
 
 def git_lines(repo_path: str, args: list[str]) -> list[str]:
     """Run a git command and return non-empty output lines."""
-    ecode, out = git_run(repo_path, args)
+    _ecode, out = git_run(repo_path, args)
     if not isinstance(out, str):
         out = out.decode(errors='replace')
     return [line for line in out.split('\n') if line]
diff --git a/src/ezgb/_models.py b/src/ezgb/_models.py
index b8716f0..22e45a7 100644
--- a/src/ezgb/_models.py
+++ b/src/ezgb/_models.py
@@ -96,7 +96,7 @@ class Comment:
     text: str
     created_at: datetime
     count: int
-    attachment_ids: list[str] = field(default_factory=list)
+    attachment_ids: list[str] = field(default_factory=list[str])
 
 
 @dataclass
@@ -110,7 +110,7 @@ class Bug:
     created_at: datetime
     labels: set[str]
     comments: list[Comment]
-    metadata: dict[str, str] = field(default_factory=dict)
+    metadata: dict[str, str] = field(default_factory=dict[str, str])
 
 
 @dataclass(frozen=True)
diff --git a/src/ezgb/_reader.py b/src/ezgb/_reader.py
index 735d41d..2d44478 100644
--- a/src/ezgb/_reader.py
+++ b/src/ezgb/_reader.py
@@ -57,6 +57,26 @@ def _is_dict_values(value: dict[_K, _T], value_ty: type[_U]) -> TypeGuard[dict[_
     return all(isinstance(value, value_ty) for value in value.values())
 
 
+def parse_since(since: str) -> int:
+    """Parse a datetime string to a unix timestamp.
+
+    Accepts ISO-8601 variants and ``YYYYMMDDHHMMSS``.
+    """
+    since = since.strip()
+    for fmt in (
+        '%Y-%m-%d %H:%M:%S',
+        '%Y%m%d%H%M%S',
+        '%Y-%m-%dT%H:%M:%SZ',
+        '%Y-%m-%dT%H:%M:%S',
+    ):
+        try:
+            dt = datetime.strptime(since, fmt).replace(tzinfo=timezone.utc)
+            return int(dt.timestamp())
+        except ValueError:
+            continue
+    raise ValueError('cannot parse since=%s' % since)
+
+
 def _combine_ids(primary: str, secondary: str) -> str:
     """Interleave primary and secondary IDs into a CombinedId.
 
@@ -415,23 +435,7 @@ class BugReader:
 
     @staticmethod
     def _parse_since(since: str) -> int:
-        """Parse a datetime string to a unix timestamp.
-
-        Accepts ISO-8601 variants and ``YYYYMMDDHHMMSS``.
-        """
-        since = since.strip()
-        for fmt in (
-            '%Y-%m-%d %H:%M:%S',
-            '%Y%m%d%H%M%S',
-            '%Y-%m-%dT%H:%M:%SZ',
-            '%Y-%m-%dT%H:%M:%S',
-        ):
-            try:
-                dt = datetime.strptime(since, fmt).replace(tzinfo=timezone.utc)
-                return int(dt.timestamp())
-            except ValueError:
-                continue
-        raise ValueError('cannot parse since=%s' % since)
+        return parse_since(since)
 
     def build_bug(
         self,
diff --git a/src/ezgb/_writer.py b/src/ezgb/_writer.py
index ae1d45f..adacfa1 100644
--- a/src/ezgb/_writer.py
+++ b/src/ezgb/_writer.py
@@ -77,7 +77,7 @@ class BugWriter:
             '-',
             '--non-interactive',
         ]
-        ecode, out, err = self._cli(args, stdin=text)
+        ecode, _out, err = self._cli(args, stdin=text)
         if ecode != 0:
             raise CliError('git bug comment new failed: %s' % err)
         self._reader.invalidate(bid)
@@ -100,7 +100,7 @@ class BugWriter:
             '-',
             '--non-interactive',
         ]
-        ecode, out, err = self._cli(args, stdin=text)
+        ecode, _out, err = self._cli(args, stdin=text)
         if ecode != 0:
             raise CliError('git bug comment edit failed: %s' % err)
         self._reader.invalidate(bid)
@@ -112,7 +112,7 @@ class BugWriter:
             subcmd = 'close'
         else:
             subcmd = 'open'
-        ecode, out, err = self._cli(['bug', 'status', subcmd, bid])
+        ecode, _out, err = self._cli(['bug', 'status', subcmd, bid])
         if ecode != 0:
             raise CliError('git bug status %s failed: %s' % (subcmd, err))
         self._reader.invalidate(bid)
@@ -121,7 +121,7 @@ class BugWriter:
         """Edit a bug's title."""
         bid = self._reader.resolve_bug_id(bid)
         args = ['bug', 'title', 'edit', bid, '-t', title]
-        ecode, out, err = self._cli(args)
+        ecode, _out, err = self._cli(args)
         if ecode != 0:
             raise CliError('git bug title edit failed: %s' % err)
         self._reader.invalidate(bid)
@@ -129,7 +129,7 @@ class BugWriter:
     def add_label(self, bid: str, label: str) -> None:
         """Add a label to a bug."""
         bid = self._reader.resolve_bug_id(bid)
-        ecode, out, err = self._cli(
+        ecode, _out, err = self._cli(
             ['bug', 'label', 'new', bid, label],
         )
         if ecode != 0:
@@ -139,7 +139,7 @@ class BugWriter:
     def remove_label(self, bid: str, label: str) -> None:
         """Remove a label from a bug."""
         bid = self._reader.resolve_bug_id(bid)
-        ecode, out, err = self._cli(
+        ecode, _out, err = self._cli(
             ['bug', 'label', 'rm', bid, label],
         )
         if ecode != 0:
@@ -153,7 +153,7 @@ class BugWriter:
         remote copies. This is irreversible.
         """
         bid = self._reader.resolve_bug_id(bid)
-        ecode, out, err = self._cli(['bug', 'rm', bid])
+        ecode, _out, err = self._cli(['bug', 'rm', bid])
         if ecode != 0:
             raise CliError('git bug rm failed: %s' % err)
         # Invalidate everything — the refs list has changed

-- 
2.53.0

