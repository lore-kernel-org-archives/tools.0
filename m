Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E84C547042
	for <tools@linux.kernel.org>; Fri, 18 Sep 2026 22:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789769018; cv=none; b=ppFyxtfFp1Q9eJMWWKkI/RDxjUk2UXAbEUwh3DdIi3NngLfFvAxIHTRzjuYUpGYbRpkNco4HPDb0085aUXSc8eVcMicgjpNI70bABG7FIFiIg9Oco3Z/6tTt2Gf6iSSjFAB+fAUp5OmwQT55a6C5/FUzygl0Nj7gFvFZplKyjMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789769018; c=relaxed/simple;
	bh=L8RBm9YQQKAAgZH4g9Te3KoOHlN9BFsGXGszAr5moqc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XYvZIG7PPf5//gUkOf6XHTSmFvO72+x6ck0fXqleU+BnGeWh1bIJ5D5GDVJpmJmmYpukvKGh1gwxrG7jzKe8cD/86X5kLOfaG95UGpacXfSS0zC8qy59b8t126DQPm67NNnp63OnhqOe144cQCM17mI7IbGvRMnrbniXpxsJE0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RkQpesCT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RkQpesCT"
Received: by smtp.kernel.org (Postfix)
	id F2CEB1F00898; Fri, 18 Sep 2026 22:03:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 361CA1F0089A;
	Fri, 18 Sep 2026 22:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789769016;
	bh=2+nAUWzoPmJosiBAByNjISnaRsUq1i+cYtu6U6wLwuE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=RkQpesCTD8DxOeaxzzpzcOnBoWaZ/g5mY1YxxPn4n0URnZeL3YO6iXPFavNgZM70R
	 ZCm2tave6oFN4bWX+POlresdRkBYjRN/GusRDM5UiCCAAtN4g1EX0ZOOsC4CTGEv8w
	 4QwtadZXS3fmKqJf8ALHOwEDT5Eodp0xeWzMpSaSKxsQ4c6IJ5xYcJpjQUiN1xVsV3
	 RYDDarAi3ZEgv5Lb1q5OCDhR1Zyn+0O8y4I7FdaBneFRiIU/GAW27lQ2EMnlZd5uH7
	 KrD7hR7iGmu2WRaE+FfBiu4tj0QOBaESTiHw8YGRkSjgOFZLxIB0rAf9jqrVKJCtNg
	 +KnJf65u75SRQ==
From: Tamir Duberstein <tamird@kernel.org>
Date: Fri, 18 Sep 2026 18:03:22 -0400
Subject: [PATCH ezgb v2 2/3] Enable strict pyright source checks
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-stronger-type-checking-v2-2-3ddc31ba2616@kernel.org>
References: <20260918-stronger-type-checking-v2-0-3ddc31ba2616@kernel.org>
In-Reply-To: <20260918-stronger-type-checking-v2-0-3ddc31ba2616@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5429; i=tamird@kernel.org;
 h=from:subject:message-id; bh=L8RBm9YQQKAAgZH4g9Te3KoOHlN9BFsGXGszAr5moqc=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDFlrtxpWVVp4CTjL9Vf2NOSHGfvMbl7WMvl0S8odJ9drs
 /Yb/93UMZGFQYyLwVJMkSVR9NDe9NTbe2Qz3x2HmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXQMdIwZuDgFYKo5/jAyfJhTEvhiQb/Y/o16PqJ/1lpllLY/zfvDf/1ti0Yud9WVRkaGdz6+j7e
 fao0J77okVaoq9yR+w73jhxudii745Jy9d2MPGwA=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

Remove the blanket unknown-type and private-usage exemptions now that
JSON and git objects are narrowed before use. Limit the private-usage
exception to tests, which intentionally exercise internal helpers.

Move the shared date parser to module scope so GitBugRepo no longer
calls a private BugReader method, and give dataclass factories explicit
element types.

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
Assisted-by: LLM
---
 pyproject.toml       | 13 +++----------
 src/ezgb/__init__.py |  8 +++-----
 src/ezgb/_models.py  |  4 ++--
 src/ezgb/_reader.py  | 40 ++++++++++++++++++++--------------------
 4 files changed, 28 insertions(+), 37 deletions(-)

diff --git a/pyproject.toml b/pyproject.toml
index 3f2ddb9..28289fe 100644
--- a/pyproject.toml
+++ b/pyproject.toml
@@ -61,16 +61,9 @@ quote-style = "single"
 # pyright tries to type-check every package in each one).
 exclude = [".venv", ".venv-*"]
 typeCheckingMode = "strict"
-
-# pygit2 ships no type information, so member/variable/argument types coming
-# out of it resolve to Unknown. Relax the strict "unknown type" reports
-# rather than sprinkling casts across every git-object access site.
-reportUnknownArgumentType = false
-reportUnknownMemberType = false
-reportUnknownVariableType = false
-
-# False positives caused by underscore-prefixed helpers used across modules.
-reportPrivateUsage = false
+executionEnvironments = [
+    { root = "tests", reportPrivateUsage = false },
+]
 
 [tool.ty.rules]
 all = "error"
diff --git a/src/ezgb/__init__.py b/src/ezgb/__init__.py
index eb65cfc..1f7d0ab 100644
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
@@ -207,7 +205,7 @@ class GitBugRepo:
             author_id = author.get('id', '') if isinstance(author, dict) else ''
             raw_labels = raw.get('labels') or []
             if isinstance(raw_labels, list):
-                labels = frozenset(str(lb) for lb in raw_labels)
+                labels: frozenset[str] = frozenset(str(lb) for lb in raw_labels)
             else:
                 labels = frozenset()
             comment_count = raw.get('comments', 0)
diff --git a/src/ezgb/_models.py b/src/ezgb/_models.py
index 72eb759..426895a 100644
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
index fe918ec..769604d 100644
--- a/src/ezgb/_reader.py
+++ b/src/ezgb/_reader.py
@@ -56,6 +56,26 @@ def _is_dict_values(value: dict[_K, _T], value_ty: type[_U]) -> TypeGuard[dict[_
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
 
@@ -412,26 +432,6 @@ class BugReader:
         """Convert a unix timestamp to a timezone-aware datetime."""
         return datetime.fromtimestamp(unix_ts, tz=timezone.utc)
 
-    @staticmethod
-    def _parse_since(since: str) -> int:
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
-
     def build_bug(
         self,
         bid: str,

-- 
2.56.0.rc0.692.g34fd115c35.frankengit

