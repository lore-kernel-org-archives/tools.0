Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616DC274670
	for <tools@linux.kernel.org>; Fri, 18 Sep 2026 22:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789769016; cv=none; b=UkIFjiOnNNi43s+BKfiAh85ed3AzVtkaZdWXrfKeSoEPx1IaXqPo0jAXk/N5TeGgH3vTExWyEUL1aQ8kDu272o6YPnzm3nx2YAS+etjNjVBrLs1WqibhqkTHwvLbFvIHKXC6lVbRGqmrOJaGF31NrQxSiugUnR2vtU6/09QLf9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789769016; c=relaxed/simple;
	bh=L1/pCr1aAYrzlUSD7ckaq02j11zwubn/nH6b5kkrIE8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qldHJTsUdBPu9hGisna6Qd47YWEZCfDEM4zb4tEX9OFzF9w87j+BGHIb0IttaLoOZ0m6xcjj8DE7HTwO/eHyrfj0Tnt+knj3g3h7JwAHSy0jPDRD+2oVMx1fv/NbrrT2D+zDp9et9jxYItNSN2bp7CwqQ4oyewP6m0bP9jbLBRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LX6prBQT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LX6prBQT"
Received: by smtp.kernel.org (Postfix)
	id 0CEBC1F00898; Fri, 18 Sep 2026 22:03:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 771801F000FF;
	Fri, 18 Sep 2026 22:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789769015;
	bh=MorDY28ObfcYQJPJeubf5CU9tef+BUnaaYphadugiPE=;
	h=From:Subject:Date:To:Cc;
	b=LX6prBQTigv88PwzULf8/XEbOFMTGZG/OSH12mme2p3mKgjyggWIa8aCTtehvypIC
	 YECR5XsOb5q0Hj6970yTVHRSAyJk1uSbDyNdV52dIk4x+bODrwSluBGfqV4NtKdc2+
	 1ILhB+XACqqT742J3QXaCC63Hl/3w4P5kZCGlVyR9MNSt/nUxCEGjAN+tNymp50JIx
	 vpgYdZ8wCAiIAE54Li36CxO42Q+klXkE91q9UwBkqYxwaz7VqM/QkoXdz1XezhOOr4
	 quO62wUzFuGe3ZfKWWXcn/QbI2tFz1w5kPFar8U/mbi9aU4Cmt9XdcPYoL7U1Uc06N
	 EA0uj/iNTmRqg==
From: Tamir Duberstein <tamird@kernel.org>
Subject: [PATCH ezgb v2 0/3] Tighten JSON and source type checks
Date: Fri, 18 Sep 2026 18:03:20 -0400
Message-Id: <20260918-stronger-type-checking-v2-0-3ddc31ba2616@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr0JmbQ1MgIIr72FYQB1KxbRkWolIu
 LsFD+Dy/7z//gqe2JCHS7IC02y8cTYGPCWghtZqEuYeM2CKZZpntfCBXaxZhGUioQZSo7FalHm
 LZS+RKllBHE9MvXkf4hvQR3fQ/Fr/6h6kwu7cucH44Hg5/ufsoP9dzZlIBSJKWXR1Jam4jsSWn
 mfHGppt2751pKLN1QAAAA==
X-Change-ID: 20260419-stronger-type-checking-64a26f72e878
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2193; i=tamird@kernel.org;
 h=from:subject:message-id; bh=L1/pCr1aAYrzlUSD7ckaq02j11zwubn/nH6b5kkrIE8=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDFlrt+qZnWIxboqPePyxX9VYlLu85VnH1tDGNzcj2j/If
 lE4/6W9YyILgxgXg6WYIkui6KG96am398hmvjsOM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6BgzcHEKwFS3yjH8U6/w25vwTbrDxd1YYnOip2BuGFtLZ1UNSxHHv/2rLz09yfBPV3dP9JJ
 Si6KXDFc3KdyZoBOz9Lwo4yMLB3v/p2vvsuxgAAA=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

Upstream a047342a231d superseded the CI, formatting and checker setup
from v1. These three remaining patches narrow JSON and git objects,
replace the dynamic writer test double with a typed subclass, and enable
strict Pyright checks for source code. They also align the contributor
documentation with the uv-based CI workflow.

The Python 3.10 minimum was already part of v1; this revision also updates
the interpreter matrix and installation documentation to match.

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
Assisted-by: LLM
---
Changes in v2:
- Rebase onto 0.2.0 and drop the CI, formatting and checker setup
  covered by a047342a231d.
- Centralize the mutually recursive JSON object/value aliases and
  preserve null label and attachment arrays; model null labels in tests.
- Align the interpreter matrix and installation documentation with
  the Python 3.10 minimum already introduced in v1.
- Declare typing-extensions for the test double's override decorator
  and update uv.lock without upgrading the retained dependencies.
- Update CONTRIBUTING alongside the README development instructions.
- Link to v1: https://patch.msgid.link/20260419-stronger-type-checking-v1-0-222775b987e5@kernel.org

---
Tamir Duberstein (3):
      Narrow JSON types and type test doubles
      Enable strict pyright source checks
      Document local CI checks

 CONTRIBUTING.md           |  17 +--
 README.md                 |  15 ++-
 ci-matrix.sh              |   4 +-
 docs/installation.rst     |   2 +-
 pyproject.toml            |  16 +--
 src/ezgb/__init__.py      |  17 ++-
 src/ezgb/_models.py       |   4 +-
 src/ezgb/_reader.py       | 190 +++++++++++++++++++--------
 src/ezgb/_types.py        |  17 +++
 tests/conftest.py         |  89 ++++++-------
 tests/test_ezgb.py        |  42 ++++--
 tests/test_integration.py |  21 +--
 uv.lock                   | 328 ++++------------------------------------------
 13 files changed, 300 insertions(+), 462 deletions(-)
---
base-commit: b6f280f1dc99d57550e92798167c6a16d53ebf57
change-id: 20260419-stronger-type-checking-64a26f72e878

Best regards,
--  
Tamir Duberstein <tamird@kernel.org>

