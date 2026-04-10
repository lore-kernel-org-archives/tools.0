Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948C63D332E
	for <tools@linux.kernel.org>; Fri, 10 Apr 2026 22:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775860679; cv=none; b=jIWcRjfJe52B0vpGYQLrHEyiZnuw8UfWU2VlMKBA7HgA2U43PKB1YUZwUJ2sZ4ABDuaiHABPsUhuDtWmzsJ1iL25NmggcE0x+C1+ppNwJNHOxnwi1Cm7F+NjTZbXFj8GRYy4gRb7bbwcKKmibbRNfOTUUjzXYbZVNJlj6Eaq/CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775860679; c=relaxed/simple;
	bh=8wYt9cMQ6fXeaGpp8WYEb+dvYUkrkLHjP14onn6Zwro=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qyVV2Lj8ULOYytKUOD8ytUFJqqGl9m303bVLPdA/Oj2YZ2RJdE457alcvhTnV5KI5KU8+Q4F6SBz6nXmzA+GbMZGu1R8u3XVrSlVH0Z//nrj9axovk94bcM0cEl1zUG7la+4dbb3wAELJ1qNNUhV+tiSgNjmRwvXJqfUDDNfC/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IfQWXo1D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IfQWXo1D"
Received: by smtp.kernel.org (Postfix)
	id 7E300C2BCB1; Fri, 10 Apr 2026 22:37:59 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9E7B2C19424
	for <tools@kernel.org>; Fri, 10 Apr 2026 22:37:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9E7B2C19424
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8a05c18d3e2so25437956d6.1
        for <tools@kernel.org>; Fri, 10 Apr 2026 15:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775860677; x=1776465477; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qi6zFRsNUZzedNbBiKYVAPhAEXISZXjIWYO62uNZPxw=;
        b=IfQWXo1Dy455aK2zBJuvqDiW5NLchzgaYiTKwYGIT2oCmoDGE0K1ff6FhSorrtbXcu
         G4+jJceDTlXVe0NOCWNDmAbeE/IQYBf3/KwPceDhibAxBAiAitnfLgga2PWeF8+BvTCi
         JTQGG+ASkJJV77GjYjatyaj5pfH28NC6tJ75SBqHIvyvl8WZBwCjbMBJEcgjsVi3TgM9
         badV6/FpukKOPGonMEJhz9kFGrkJG5sNmX1Sxzficp2kWhxNYV8tQh+B9vMXzhi8LSB6
         PucnYTgoUf6DNT/tnrX/kyaAr3QDQ/y+jWOEA+XtsDxzxnNfhL4Ifgoa00OXbvVaQc3H
         pYYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775860677; x=1776465477;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qi6zFRsNUZzedNbBiKYVAPhAEXISZXjIWYO62uNZPxw=;
        b=LbJfxjzt/1Tc+eSlso58vKugXSlTZePx6Gk+fX8PXCgBxLjqpEsnYJTwP9TGiOma4n
         F6e64ii+HLYXmIe91FfxK9Rcjrejpo9lAqlunHP3c+It9eXyJw/aNPDQfK4JURBffJ2O
         c6m+RnTfZJ44+ybGcXZILmC3GbI17q+SDMEmpUt5+/d3sWFeSwa5NHtUh4blMUkEcw2Z
         GXKnYLApPF4o0V8Dwe2Xx8J+O1/ol6rbgnF3I34cIEFQrPKk5koB167O/pXfvVPmdZZz
         t9KaHevMhsfzjDB8gC7Abz5cQ/pu1qxeCFPTABncoIpqHP4nZm22RVcw6VSyVaqHM4aU
         Ww4g==
X-Gm-Message-State: AOJu0Yx5cTGiejmt5X0g5qvWMKsFiKju35JDLXLrW3N2YxQfNjqR5YmW
	CuBPfjm2O0u8x1A6G95h8fSGJSNPPGj15lulgR5+wSMCdIA4K8FsqDtK
X-Gm-Gg: AeBDies9zUzZM3j1gz1ZHNg5bU0pIpOWU6JklG5S/VE8OLGoHlKvTFoSAlcYBHxCRWG
	dJ9G/NvftIUkfZjNkkZ1LkzOxc7LZ0pWx9zBU4C3E/rcUkdVdvgDgRaDgG2UNVsBWg5A5Ix8Ium
	eATnMtSZazG/YQC1Qa6Bd290GIhUMszHjWk142BOwQL9Oka9Lzl8c0tWQ7FLA2ZAKTMh3SdI894
	fqJd2uXUqi39ltdZfpFRGL86WXOzBXHbEQxy8cv/+9T5FnFfA31t2jUJ0UC0/AKAq63gZFzeMd7
	divz1/45LStpU/0OQC6kZAQyv+WDiGqCLUbAASOJuOswUo9kEeycjx7bjQYcb5571GcwZjsMbln
	ovwXjXT54DPFDJj76N1/wjBOAltIC63Uqq0kCYcOmrGObfP0J0aocIOY1Y0pExhP6SPVe5/FcQ8
	wmDPLqd/Qxy0zZDD+S71rSVqerhU9sv3YFKdnUaA7ss774nXo58CZb6atIJViaV9z4K7ZvQxOLC
	AZ/L/S/zcxPcflDh0cDtOU98IC5op1o8ZtxNWhwNVOr5J0jeb2wNeK0itXQuxdH2+Dw3O16X58u
	ZGBH2n5Xa6qIck8J1wNg02hYXNIDp2WXOFmigZ3T1a5XYp7WYcfS
X-Received: by 2002:a05:6214:460b:b0:89c:eb17:9f96 with SMTP id 6a1803df08f44-8ac74573681mr151202796d6.11.1775860677454;
        Fri, 10 Apr 2026 15:37:57 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([208.80.35.36])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ac849db735sm41370096d6.2.2026.04.10.15.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 15:37:56 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 10 Apr 2026 18:37:52 -0400
Subject: [PATCH 01/14] Add b4 CI checks and mypy suppressions
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-harden-type-checking-v1-1-fcf314d9d748@gmail.com>
References: <20260410-harden-type-checking-v1-0-fcf314d9d748@gmail.com>
In-Reply-To: <20260410-harden-type-checking-v1-0-fcf314d9d748@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1775860674; l=3894;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=8wYt9cMQ6fXeaGpp8WYEb+dvYUkrkLHjP14onn6Zwro=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QJD2vbWLVHInR30MOgXp62N0ffwrOtpCCuawpoGsKCYnEnC1MeNvU8ThYLlcUzf8fOMA8tdFwPw
 wgNQvMKxIAgk=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

Add a repo-local b4 CI check command and helper script that runs mypy
and pytest so review status surfaces local checks in the b4 UI.

Introduce targeted mypy suppressions for current test-only issues so the
baseline is green before tightening types further.

Also add pytest-asyncio so pytest recognizes
asyncio_default_fixture_loop_scope and stops warning about it.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 .b4-config           |  2 ++
 pyproject.toml       | 14 ++++++++++
 tools/b4-ci-check.py | 79 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 95 insertions(+)

diff --git a/.b4-config b/.b4-config
new file mode 100644
index 0000000..ad41b6b
--- /dev/null
+++ b/.b4-config
@@ -0,0 +1,2 @@
+[b4]
+  review-series-check-cmd = uv run ./tools/b4-ci-check.py
diff --git a/pyproject.toml b/pyproject.toml
index 2353a18..e31a05c 100644
--- a/pyproject.toml
+++ b/pyproject.toml
@@ -40,6 +40,7 @@ dev = [
     "build",
     "mypy",
     "pytest",
+    "pytest-asyncio",
     "ruff",
     "types-requests",
 ]
@@ -56,5 +57,18 @@ strict = true
 module = "authheaders"
 ignore_missing_imports = true
 
+[[tool.mypy.overrides]]
+module = [
+    "test_email_utils",
+    "test_formatting",
+    "test_message",
+    "test_thread",
+]
+disable_error_code = ["attr-defined"]
+
+[[tool.mypy.overrides]]
+module = "test_auth_headers"
+disable_error_code = ["unused-ignore"]
+
 [tool.ruff]
 target-version = "py39"
diff --git a/tools/b4-ci-check.py b/tools/b4-ci-check.py
new file mode 100644
index 0000000..a51e19e
--- /dev/null
+++ b/tools/b4-ci-check.py
@@ -0,0 +1,79 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+from __future__ import annotations
+
+import json
+import os
+import sys
+from contextlib import redirect_stderr, redirect_stdout
+from dataclasses import dataclass
+from io import StringIO
+from pathlib import Path
+from typing import Callable
+
+import mypy.api
+import pytest
+
+
+@dataclass(frozen=True)
+class Check:
+    tool: str
+    args: list[str]
+    pass_summary: str
+    run: Callable[[list[str]], tuple[str, str, int]]
+
+
+def run_pytest(args: list[str]) -> tuple[str, str, int]:
+    stdout_buffer = StringIO()
+    stderr_buffer = StringIO()
+    with redirect_stdout(stdout_buffer), redirect_stderr(stderr_buffer):
+        status = pytest.main(args)
+    return stdout_buffer.getvalue(), stderr_buffer.getvalue(), status
+
+
+def main() -> None:
+    sys.stdin.buffer.read()
+
+    repo_root = Path(__file__).resolve().parent.parent
+    os.chdir(repo_root)
+    checks = [
+        # Mypy can emit JSON via "--output json", but b4 only renders details
+        # as plain text, so preserving the normal formatter is more readable.
+        Check(
+            tool='mypy',
+            args=['.'],
+            pass_summary='mypy passed',
+            run=mypy.api.run,
+        ),
+        Check(
+            tool='pytest',
+            args=['--durations=0'],
+            pass_summary='pytest passed',
+            run=run_pytest,
+        ),
+    ]
+
+    results: list[dict[str, str | int]] = []
+    for check in checks:
+        stdout, stderr, status = check.run(check.args)
+        details = (stdout + stderr).strip()
+        results.append(
+            {
+                'tool': check.tool,
+                'status': 'pass' if status == 0 else 'fail',
+                'summary': (
+                    check.pass_summary
+                    if status == 0
+                    else f'{check.tool} failed (exit {status})'
+                ),
+                'details': details,
+            }
+        )
+
+    json.dump(results, sys.stdout, indent=2)
+    sys.stdout.write('\n')
+
+
+if __name__ == '__main__':
+    main()

-- 
2.53.0

