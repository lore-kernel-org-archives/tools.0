Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585F5342530
	for <tools@linux.kernel.org>; Mon, 20 Apr 2026 01:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776648177; cv=none; b=KeOIk18C+bTnVysDWpB6Vu79fDITvJIPPQK3r7vvQpywpTbDl0RMRaCGHVs3VaU3Lwi4h2JsKxYjXeW611r2doWYbOo2TUaf+SluN4Sp7Jg2dtbaEfMUwZ1q3hDy49CwlL8BaTFCiDyvrBTFq7ekWkF6na6M/75l8vA67i2oET4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776648177; c=relaxed/simple;
	bh=H2B7l/1QSVfi30AunMmeIkZzI6NFLsLhwhOIpySk81Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eQKnht7xynjtEK2uSDF/Zx8quoLXP4fOLXR6kZGXPKk1GYBWv9Wm2b4Y8vdxYdxz42eMdGz6wyC1kvwVe9O1lJXfEpkX16WvoYNxtp8eUn2g8/NLaQqZziXSJCd8EJDk5djnqcpKZT2Dk/VcWtRM4quUZ6nBOWqhUlD5pFcM/I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fmvBwF56; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fmvBwF56"
Received: by smtp.kernel.org (Postfix)
	id D0095C2BCB5; Mon, 20 Apr 2026 01:22:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15141C2BCAF;
	Mon, 20 Apr 2026 01:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776648176;
	bh=H2B7l/1QSVfi30AunMmeIkZzI6NFLsLhwhOIpySk81Q=;
	h=From:Subject:Date:To:Cc:From;
	b=fmvBwF564qC/74PQMLShwH4up0U4lxAAcfv2/wKEhuybPotBfQA3AJAu3RBVmDL2h
	 U5v7vq9dO8q5GRyY5tXbxIvXEfV8cxl5fQAm0hEPTHkABwNOcFpBQtfdkaB1vbZ4KK
	 BZovohkAYWW9F1kmtpbMZflhlktTq6qZuaD+yhV6PJDVDpxUGUbkInv4+ML927Pdxm
	 skPZPJ0vPZ3trirJEtmyRFTZykFp8jhFVQAEcIFTLA0TZNbBSaxGUU/u8NrNhRnfdl
	 Dot57IdiYyiig/bq6SEqZ7lglgkI/y5HpEXAjekBdEO5x4SK8OFlYLKQ/aKjvtR8ay
	 jztvb1XvBDaPg==
From: Tamir Duberstein <tamird@kernel.org>
Subject: [PATCH patatt 0/7] Harden local checks
Date: Sun, 19 Apr 2026 21:22:20 -0400
Message-Id: <20260419-stronger-type-checking-v1-0-5c108048d2c7@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWM0QrCMAwAf2Xk2UJXnVJ/RXzoYtyi0JUkysbYv
 1v18Q7uVlASJoVzs4LQm5WnXKHdNYBjygM5vlWG4MPRH9ro1GSqWpwthRyOhE/Og9uffOi6mLB
 PEWpchO48/8YXKMmSGVz/Xl/9g9C+V9i2Dzfob9WCAAAA
X-Change-ID: 20260419-stronger-type-checking-3702559acba9
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@kernel.org>, 'test@example.com'}
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1492; i=tamird@kernel.org;
 h=from:subject:message-id; bh=H2B7l/1QSVfi30AunMmeIkZzI6NFLsLhwhOIpySk81Q=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlP65+wO/1tfaXPZpc38eiMcwUvFCczbv9irvWdre31j
 6ZFAludOiayMIhxMViKKbIkih7am556e49s5rvjMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOgY4xAxenAEz1u9uMDFNm95gwiBe7zpm557JF236jO4dmTDgc8ePNhmnSJ70vC5sz/LNVFTb
 au/npgZRvDAcYGcO8Fl12SCt2WyNhGXz6f0etIh8A
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

This series adds a local CI helper and raises patatt's local quality
baseline incrementally while keeping the tree green after each step.

It starts with the checks that already pass, then adds Ruff import and
format enforcement, strict pyright, and ty. The later patches make the
small typing and cleanup changes needed for the stricter checkers, and
remove stale optional-dependency handling for PyNaCl.

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
Tamir Duberstein (7):
      Add local CI script
      Add Ruff import checks
      Add Ruff format check
      Add pyright strict checks
      Add ty checks
      Reduce dictionary lookups
      Import PyNaCl unconditionally

 ci.sh                               |  10 +
 conftest.py                         |   3 +-
 docs/conf.py                        |   5 +-
 pyproject.toml                      |  18 +-
 src/patatt/__init__.py              | 480 ++++++++++++++++++++++++------------
 tests/conftest.py                   |  21 +-
 tests/test_validation.py            |  25 +-
 tests/unit/test_byhash.py           |   4 +-
 tests/unit/test_devsig_header.py    |  26 +-
 tests/unit/test_get_algo_keydata.py |  22 +-
 tests/unit/test_patatt_message.py   |  27 +-
 11 files changed, 410 insertions(+), 231 deletions(-)
---
base-commit: f09b5a5681c2b7af33aa5b0fcea659f4534eed9b
change-id: 20260419-stronger-type-checking-3702559acba9

Best regards,
--  
Tamir Duberstein <tamird@kernel.org>

