Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF6139A051
	for <tools@linux.kernel.org>; Mon, 13 Apr 2026 22:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776118107; cv=none; b=JRRKYXfYn+wzS76cuoi5j9AzQBe4iTxOdZgBxjHJol/2ipYTHLIHIu//hbtmovcNFqORwZ718u9GsgRRxCpr2jXl0LDZ4FitETeLmIy7D8nF6rHdkEKHpMwRxKYCkYlewzaEOrlWju1mhdqmkL2OpFTIBSOzPiUpJdCKNcBVnIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776118107; c=relaxed/simple;
	bh=GH8GYzuVgjb8QJhnR3ZqTQblwRXzgcA8r9rQn/MihFw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UA/2T7B7tY7jtj9yLNWXq2x6n40gDEKvbcaYPIIQe2Q0yh7hm055F2B8q2gXQTryEbmkGkA8kLI7xBzgg7zu6ugWoYoukjB4UijfxA4aM99iwxEge4NfbAecNojjXTKE+J2f4vUCmb5WpbygnnLyfbILvoyEudorfYO6BAMa3nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ggP5UP5g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ggP5UP5g"
Received: by smtp.kernel.org (Postfix)
	id 46003C2BCAF; Mon, 13 Apr 2026 22:08:27 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3D343C2BCB3
	for <tools@kernel.org>; Mon, 13 Apr 2026 22:08:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3D343C2BCB3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8cb4136d865so587489985a.1
        for <tools@kernel.org>; Mon, 13 Apr 2026 15:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776118105; x=1776722905; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xDna+NpwE7IAsOQkeTC0wmIw1MnBHMhaIRf4iuH1hw4=;
        b=ggP5UP5gqtFQPtmN10+L7TSSu+qwHWXN+9n00iY3UzljifXyPmvVGmVm6Qxgkj5N86
         xjCTdNr2T1Pr//gFWoozQyHReBCQuwkxuKvsPeBaC9yQjifDGu7TgC8eJ8USB+ECNMKr
         SahI4E8RdKYqlEb/seWD7LcaeU82oDycM4OziSuPs3VaIbrRyZFqsy27x4ThYQEIUrOi
         TiWO0MnN3d9SYLmaBfudK2L5S9qFoIuBMcGqpslwpatBa5iF4gWI3eHph8Tl6jd8y+nF
         Om4AUmvSuz+RRTWGNJyZguuqthaPMY0ui77R+9b/sDQsAJjTX80j+dxswOzUYaU/RDId
         ckQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776118105; x=1776722905;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xDna+NpwE7IAsOQkeTC0wmIw1MnBHMhaIRf4iuH1hw4=;
        b=QkITVDx4ppnakrA5QHYsThtNft59Mx0O9PrjQ7rzJGhCekGluB5T63f55eLffZiVFg
         1IFf4TKDEf9oR9ClQT+fE0DxpOuSSioxlLKhHebkUIhn+ym6DzDX5csIrJWYWLnzwKns
         0iSWkXBN6wT3VkQyrgTmwpoqjp9DvOBqRoYyIm3qyCqbAEygmG1yIBMSN7RDHYcSx4rM
         6wUhyIkj+VIYDBVZ2gEQlKwqB9uyvOI3+DjFix1KhdyOesODTZ+DIxw2IXdTrlnOAiCH
         8E+3OZdQQkSLGwf9/AzZIQaJsaEXhtqa3Jjln6jlIbQ1T+Ey+QojXayzUEL/j/7lo4J9
         chRg==
X-Gm-Message-State: AOJu0YyZoOA16u1zz4G4HljeMSbOGKTL+oZabPDdH48AmZpVCKsnaKBQ
	U5RAUO38+wyqyzacnLTuHQ8JYYNLfGG4C8ZrTJe2APeBorGJpbFwyA3ph0zVbhvG
X-Gm-Gg: AeBDiesGcWZzDCWzf1hq7hO7cHp0LFvIZ9hNLbpPJc/giWVzCZZENt0k1OQkCX+dVRC
	RSDxzZ4/rO5V3WXilvpKkTgm4tGET/LDe2BHR3JnKePINY0g69OKJVY7i0g1BuUUCcPVIe1OHfz
	kmrRG7+dl8FVGpiNYt5lGPxCUxlVrJEaq6QPMZ9/gI6LHACEl6L3ILWwbvRUS4sdq39FFGL/NOK
	VwEghMwnIy2T7ckaKin3FuOhzu34gHKQoobLdvOnOsM+JD6kPAWdfa5L5W6VYY4gIQi+xHpPZE6
	bJtlNhhC2twe9q1zjPJu2MpGoNy3HMRwBFTJNyho6otIFfR4OUEFul7ieATIQIfvEtlWLbjPsRn
	VP87ltNhq3n28VITNybDXzFyZm+uGKqhjKHQz3/wNHkqU3I1SJzOpGrUDFM9D2ubkkVCUxFndOe
	yatYFU0cifWKK5MoTcBT1h2Td04s67mbro2X8kFwjx3o+MkZWYNAD+/6XtwQZID0mWSPf9hX3aR
	i3y2TPd8jUbSR1CCIpGcAdG3yK8+kcNYJAxLc3nWcHxnrTuYXftK+N+4IVv+obuCB1w5JVwD607
	BLMWJQgYQPq21tb0QSLs1jAzJCGVSKybrEab/pMEpH7rlh1/neNmTMG7pmcrKjkC
X-Received: by 2002:a05:620a:31a0:b0:8cf:d9ce:378b with SMTP id af79cd13be357-8ddccb2fc76mr2232293385a.2.1776118104851;
        Mon, 13 Apr 2026 15:08:24 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2600:4808:6353:5c00:c007:ed8:60aa:a884])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ddb8d6e387sm907506185a.30.2026.04.13.15.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 15:08:23 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 13 Apr 2026 18:08:17 -0400
Subject: [PATCH v2 03/14] Add ruff import checks to b4 CI
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260413-harden-type-checking-v2-3-1ba6056288d9@gmail.com>
References: <20260413-harden-type-checking-v2-0-1ba6056288d9@gmail.com>
In-Reply-To: <20260413-harden-type-checking-v2-0-1ba6056288d9@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1776118097; l=5302;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=GH8GYzuVgjb8QJhnR3ZqTQblwRXzgcA8r9rQn/MihFw=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QETY6qhvoPVDD8YRYOAFaQTGlfT/ue2QBAqqTF3KZGTTT0rhQcXvcPvIG0J6RUwUExv2R7nshES
 Z4x+aFX/3FQg=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

Run ruff as part of the b4 CI check script and enable import sorting in
Ruff so import ordering regressions show up in the review UI.

Keep Ruff as a subprocess and document the related upstream API
limitation.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 ci.sh                      | 1 +
 pyproject.toml             | 4 ++--
 src/liblore/__init__.py    | 1 -
 src/liblore/node.py        | 3 +--
 src/liblore/utils.py       | 3 +--
 tests/conftest.py          | 3 +--
 tests/test_auth_headers.py | 1 -
 tests/test_email_utils.py  | 1 -
 tests/test_formatting.py   | 3 +--
 tests/test_mbox.py         | 4 +---
 tests/test_node.py         | 1 -
 11 files changed, 8 insertions(+), 17 deletions(-)

diff --git a/ci.sh b/ci.sh
index 1e8ccb3..3001db2 100755
--- a/ci.sh
+++ b/ci.sh
@@ -2,5 +2,6 @@
 
 set -eu
 
+uv run ruff check
 uv run mypy .
 uv run pytest --durations=0
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

-- 
2.53.0

