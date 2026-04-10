Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FD63DBD56
	for <tools@linux.kernel.org>; Fri, 10 Apr 2026 22:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775860681; cv=none; b=D29fNy0R8uKHS538cjBLhy4jqSFf46atFTrD4FbSyVURVHc8uyfeQ50meXlpXTNHXfJy2nuDhgJvIu5jj+zpnkZJFaH52bJOlz39q4l52gLgjFh7g8ZAWYxkabYf35jkqbTxOi2s1n3ZQM6zTRujllAZZZ9uFjfchLgatUot9c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775860681; c=relaxed/simple;
	bh=v5yEKCIBUUYOP2PjZCg6ogyHIt0l0SLOnRr/QeDiLXQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rM+xAdttwtOiDgX9FWJ93Ln96Sz6sBcqX+zwJm8k0Fm9V/NjyRj2d0mMeqSk6Ip99T5a78aWRJb8Hy3q5fIKodQ9Ew1Aw5UCQ4IlD0VJc+DIeggtwN7PNCWJgFkqElRlNrD0qZ6UynlA2cdjIFBJVBJfIlRUoa8bpnP7ZLH5xQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c1wDa81V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c1wDa81V"
Received: by smtp.kernel.org (Postfix)
	id 47696C19421; Fri, 10 Apr 2026 22:38:01 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 411A0C2BC9E
	for <tools@kernel.org>; Fri, 10 Apr 2026 22:38:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 411A0C2BC9E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8a3b0242631so29675876d6.3
        for <tools@kernel.org>; Fri, 10 Apr 2026 15:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775860679; x=1776465479; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kqlzvKXgFXbotqJ1Lhel0Zsg0c716XQuoDYoRTsCxNs=;
        b=c1wDa81VewE/xCqcxs39ClvvZz7bPkFrHFye1k40jnrAI+M66NzwBnQfacC6ztu9NR
         w19ItIaSwlRzZWxZxJFeV8X9uZeSWHYxNqEwDbFg19G44i/G6Pd9+4gxfXugcIzV9rpO
         vsp/6KfSx6bbzjEiOul8snrqKMyGKUtg6QkWD8iBHWx0I8wQAsSp5Lk52yCOBSrjH+pC
         aif6caaCre+nfvLen6GoG5ZOiyoQSb5c7F+Ps4ssQfJGdAFTdQ0Iy38chT29DaO21ui+
         eLFmYiTsdKzhQd8Pban7zmCN5jsRB1FjqHkl27qgmKnIYQgGTsaQ2YbXlH3zanPXe0SG
         AZdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775860679; x=1776465479;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kqlzvKXgFXbotqJ1Lhel0Zsg0c716XQuoDYoRTsCxNs=;
        b=jl+jab61iZXQFy4aDrHD9Z+N13dcA4AvUv2Mku1/5ezN7ALWNZe7DhexzSeWxVjoCh
         3lg1QFzow/BpaBoQxnqZci6sMWGU3HnfVMt3+Sx5sPef5nYti3xEVqUTNScFRSIFaU/Q
         9/v4xqctmbW1xlMkaaGzWpY38qZZ0GQPy+ttSFFxJ+XUwawM7JwZW4ZQD0SyJfIeLefX
         KnYLAjJbHitu8U9zU/h/wVIpX/QpzwrO/KzZuBFIJfOdTb4SRgYsTLJnM40+7gPbWad1
         zUnkiahWZ838QDk1dpmb1cUl3IJds8ntleAljg/sY3aj9e3lN/hPfjQW6VN6YZQldUA2
         YKKw==
X-Gm-Message-State: AOJu0Yx3A/vTAbM6TCrG6gxIy+oJFKUEDvVtDpO8HrtcmUzUpPql1NiP
	b8LS3p+3yqmTmXuJdBL+9xpLFa/ju4vZE3cuXy7K/5Jo56LJKimBl/TH
X-Gm-Gg: AeBDietOFE+lyqjYqDtdqJS6YzM8nOk21SLnJ4+91a3OhJIf8ywxGcty21OdgeE+c1S
	LKsVA7456b0wsMVJiPbX2rfEM3rSSFgSsX6Bv5fccjGimwItisJ0UYNa+rgv4xiCSHxVRnd743P
	RpvNHy8s3NxFb/Z7SYZKng0kDB+486iE/9/OXbuh8gIIfwz38r5tbh9K2TPaM7PmWtimyDjHUMW
	71Fl42lbZQF4se4doVoyWjLaWDOpuw2/7lkER0+sRedsS7/WdD5OXgYc1hIjVGY3lrV/T2pllM7
	B/9JN1u4Wgh/g64WnApSH4aRryo1Enh8rvJrronLlNvO3IjLrGnP0l4F8xDatNIVKTcZriW47Gr
	p7RRjSGi2xFHjPXJz5o4DQfLhwu9uxvQJs9XE1G2vo/i9G/jWI+PyVmZ8Ox9A7BvzF/kBS9Svt1
	KzNFfgfQGSeUnbZnbpxOZ5jxiF/I9wHmOu0I/i371t1FBYmnLBWIzo2GDBy3+PU54xV/Lai7hTr
	c/HrBk0r32JgH9WHjNYj1wQeFGMj7R+IGmOIrXq58jA8QAYt5aIGccxHWFAtV6bUSf2HVskC6UW
	Xm09wdnCqC1P8ePeUYidvVN9JqZrjph9xDhTky+bqJAyOeWoe0Bx
X-Received: by 2002:a0c:e00d:0:b0:89a:149:bef6 with SMTP id 6a1803df08f44-8ac862ab602mr61281776d6.40.1775860679236;
        Fri, 10 Apr 2026 15:37:59 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([208.80.35.36])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ac849db735sm41370096d6.2.2026.04.10.15.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 15:37:58 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 10 Apr 2026 18:37:54 -0400
Subject: [PATCH 03/14] Add ruff import checks to b4 CI
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260410-harden-type-checking-v1-3-fcf314d9d748@gmail.com>
References: <20260410-harden-type-checking-v1-0-fcf314d9d748@gmail.com>
In-Reply-To: <20260410-harden-type-checking-v1-0-fcf314d9d748@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1775860674; l=6660;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=v5yEKCIBUUYOP2PjZCg6ogyHIt0l0SLOnRr/QeDiLXQ=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QEtqnrGLvyVtvmV8fX9dtxeHEraq+rT3BUhMYGxp3uVY44OdWyoew/k+iPUm9QxD1OOqnZ3mTMm
 HwNxfj1Yr9QQ=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

Run ruff as part of the b4 CI check script and enable import sorting in
Ruff so import ordering regressions show up in the review UI.

Keep Ruff as a subprocess and document the related upstream API
limitation.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 pyproject.toml             |  4 ++--
 src/liblore/__init__.py    |  1 -
 src/liblore/node.py        |  3 +--
 src/liblore/utils.py       |  3 +--
 tests/conftest.py          |  3 +--
 tests/test_auth_headers.py |  1 -
 tests/test_email_utils.py  |  1 -
 tests/test_formatting.py   |  3 +--
 tests/test_mbox.py         |  4 +---
 tests/test_node.py         |  1 -
 tools/b4-ci-check.py       | 21 +++++++++++++++++++++
 11 files changed, 28 insertions(+), 17 deletions(-)

diff --git a/pyproject.toml b/pyproject.toml
index 7c9e1da..38be519 100644
--- a/pyproject.toml
+++ b/pyproject.toml
@@ -57,5 +57,5 @@ strict = true
 module = "authheaders"
 ignore_missing_imports = true
 
-[tool.ruff]
-target-version = "py39"
+[tool.ruff.lint]
+extend-select = ["I"]
diff --git a/src/liblore/__init__.py b/src/liblore/__init__.py
index ff4314a..1ffaaeb 100644
--- a/src/liblore/__init__.py
+++ b/src/liblore/__init__.py
@@ -3,7 +3,6 @@
 """liblore — shared library for public-inbox / lore.kernel.org access."""
 import email.charset
 import email.policy
-
 from email.message import EmailMessage
 
 __version__ = '0.7.1'
diff --git a/src/liblore/node.py b/src/liblore/node.py
index 5fb6343..66da1d7 100644
--- a/src/liblore/node.py
+++ b/src/liblore/node.py
@@ -15,11 +15,10 @@ import time
 import types
 import urllib.parse
 from datetime import datetime, timezone
+from email.message import EmailMessage
 
 import requests
 
-from email.message import EmailMessage
-
 from liblore import LibloreError, RemoteError
 from liblore.utils import (
     get_strict_thread,
diff --git a/src/liblore/utils.py b/src/liblore/utils.py
index 8d485da..e8926c6 100644
--- a/src/liblore/utils.py
+++ b/src/liblore/utils.py
@@ -3,7 +3,6 @@
 """Message parsing, email utilities, threading, and mbox splitting."""
 from __future__ import annotations
 
-from collections.abc import Sequence
 import datetime
 import email.header
 import email.parser
@@ -14,7 +13,7 @@ import logging
 import re
 import textwrap
 import urllib.parse
-
+from collections.abc import Sequence
 from email.message import EmailMessage
 
 from liblore import emlpolicy
diff --git a/tests/conftest.py b/tests/conftest.py
index b84fc35..ec8ec80 100644
--- a/tests/conftest.py
+++ b/tests/conftest.py
@@ -4,12 +4,11 @@ from __future__ import annotations
 
 import email.utils
 import textwrap
+from email.message import EmailMessage
 from typing import Protocol
 
 import pytest
 
-from email.message import EmailMessage
-
 from liblore import emlpolicy
 
 
diff --git a/tests/test_auth_headers.py b/tests/test_auth_headers.py
index 9edf4cd..9097048 100644
--- a/tests/test_auth_headers.py
+++ b/tests/test_auth_headers.py
@@ -13,7 +13,6 @@ import pytest
 from liblore import LibloreError
 from liblore.node import LoreNode
 
-
 # =====================================================================
 # Import-time validation
 # =====================================================================
diff --git a/tests/test_email_utils.py b/tests/test_email_utils.py
index ad8775f..74216d4 100644
--- a/tests/test_email_utils.py
+++ b/tests/test_email_utils.py
@@ -16,7 +16,6 @@ from liblore.utils import (
 )
 
 
-
 class TestMsgGetSubject:
     def test_plain_subject(self, make_msg: MsgFactory) -> None:
         msg = make_msg(subject='Just a plain subject')
diff --git a/tests/test_formatting.py b/tests/test_formatting.py
index a13593e..cb3cf80 100644
--- a/tests/test_formatting.py
+++ b/tests/test_formatting.py
@@ -2,10 +2,9 @@
 """Tests for email formatting and thread minimization."""
 from __future__ import annotations
 
-import pytest
-
 from email.message import EmailMessage
 
+import pytest
 from conftest import MsgFactory
 
 from liblore.utils import (
diff --git a/tests/test_mbox.py b/tests/test_mbox.py
index 3815e3f..9bc2271 100644
--- a/tests/test_mbox.py
+++ b/tests/test_mbox.py
@@ -3,9 +3,9 @@
 from __future__ import annotations
 
 import textwrap
-
 from email.message import EmailMessage
 
+from liblore import emlpolicy
 from liblore.utils import (
     get_clean_msgid,
     get_preferred_duplicate,
@@ -15,8 +15,6 @@ from liblore.utils import (
     split_mbox_as_bytes,
 )
 
-from liblore import emlpolicy
-
 
 class TestSplitMbox:
     def test_splits_two_messages(self, sample_mbox: bytes) -> None:
diff --git a/tests/test_node.py b/tests/test_node.py
index c2e7bf3..54d76d8 100644
--- a/tests/test_node.py
+++ b/tests/test_node.py
@@ -14,7 +14,6 @@ import requests
 from liblore import RemoteError
 from liblore.node import LoreNode
 
-
 # =====================================================================
 # Session management
 # =====================================================================
diff --git a/tools/b4-ci-check.py b/tools/b4-ci-check.py
index a51e19e..1bc5de1 100644
--- a/tools/b4-ci-check.py
+++ b/tools/b4-ci-check.py
@@ -5,6 +5,7 @@ from __future__ import annotations
 
 import json
 import os
+import subprocess
 import sys
 from contextlib import redirect_stderr, redirect_stdout
 from dataclasses import dataclass
@@ -32,12 +33,32 @@ def run_pytest(args: list[str]) -> tuple[str, str, int]:
     return stdout_buffer.getvalue(), stderr_buffer.getvalue(), status
 
 
+def run_subprocess(tool: str) -> Callable[[list[str]], tuple[str, str, int]]:
+    def run(args: list[str]) -> tuple[str, str, int]:
+        proc = subprocess.run(
+            [tool, *args],
+            capture_output=True,
+            text=True,
+        )
+        return proc.stdout, proc.stderr, proc.returncode
+
+    return run
+
+
 def main() -> None:
     sys.stdin.buffer.read()
 
     repo_root = Path(__file__).resolve().parent.parent
     os.chdir(repo_root)
     checks = [
+        Check(
+            tool='ruff lint',
+            args=['check'],
+            pass_summary='ruff lint passed',
+            # Ruff is invoked as a subprocess due to API limitations:
+            # https://github.com/astral-sh/ruff/issues/659
+            run=run_subprocess('ruff'),
+        ),
         # Mypy can emit JSON via "--output json", but b4 only renders details
         # as plain text, so preserving the normal formatter is more readable.
         Check(

-- 
2.53.0

