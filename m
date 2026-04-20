Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162F92ECE93
	for <tools@linux.kernel.org>; Mon, 20 Apr 2026 04:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776659965; cv=none; b=sOsmkV39V9y12WB11qXgAqllqUmSUOkaCFu4XGdhub+rMR+GYw+KNcs7Rif7I7b1c/qhRPRtzrhxN8SJJTXsW6CR298h4q6p5QpXlowfKZS6ffS2LYr4jTMR9LaCdxWdtp1liOy5lwb4vRcE5Z1KNCnfLZ1w+qzrLL4dAW/uCHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776659965; c=relaxed/simple;
	bh=vSYbc+c5D+YjZuaLgPYIr6uNfB5o587v17YT/uXS134=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SeCRUuCqd2VzvAyGG7CitZmZFF5eYqqwSLZzQPlmT3Bxwz74nf6pEBYr+hKSjWYoPN8lOS7xnZwnxrF/bnj05pp61ccMCjSSrX1Vuf0rY+mgeWEni4L3kfo32TXbyY/CzRwElbiyXDsUw0sTjXJCdhqVIl3ug5QHtUUdUkoDpUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tApn0u5u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tApn0u5u"
Received: by smtp.kernel.org (Postfix)
	id B6F96C2BCB6; Mon, 20 Apr 2026 04:39:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86C2DC19425;
	Mon, 20 Apr 2026 04:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776659964;
	bh=vSYbc+c5D+YjZuaLgPYIr6uNfB5o587v17YT/uXS134=;
	h=From:Subject:Date:To:Cc:From;
	b=tApn0u5ukxw/sZGjjELFKeuWrA+RXUe76T0inEwzEj5ngqGqc66JeagIXV3JtARsg
	 4ftOe64KjCo670AVERVlFc9jdrIwkSsRcVkEdSWBjTcahUi1ic51YocjdWOcmZFnMe
	 BwsYPFDkqHS/j83pGpr7J27rqzcJ5zPOHOXLDeH5PlG0neRm15Sh9xK6W+mto5pEJk
	 qCaz7WHv4aGuu2K82In1d+hDkx3ym0Ta9yr7f50/2Vv2YiZwNQLUepvDfV5M85gbN6
	 DXNvFR05jUsO67tZPbqq5IKW2pOiKzZU2etbe4ETnCHeO+B6P9G0JUrLfSwo4CPXDF
	 1rnhsMZxkFCKQ==
From: Tamir Duberstein <tamird@kernel.org>
Subject: [PATCH ezgb 0/6] Harden local CI checks
Date: Sun, 19 Apr 2026 21:39:21 -0700
Message-Id: <20260419-stronger-type-checking-v1-0-222775b987e5@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMwQ6CMBAFf4Xs2SbQkIL+ivEA9VFWk0J2i1EJ/
 27B40wys5JCGEqXYiXBi5WnmKE6FeTHLgYYvmcmW1pX1tXZaJIpazHpM8P4Ef7JMRhXd9YNjUX
 btJTjWTDw+xhfCd/Q0+1vdekf8Gl/0rb9AKS4K5mAAAAA
X-Change-ID: 20260419-stronger-type-checking-64a26f72e878
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1329; i=tamird@kernel.org;
 h=from:subject:message-id; bh=vSYbc+c5D+YjZuaLgPYIr6uNfB5o587v17YT/uXS134=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlP1/5eUelyRFBQr4/nnGFFUkbBmSKGOy9Tn9R2bYpRd
 ds8ca9hx0QWBjEuBksxRZZE0UN701Nv75HNfHccZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx0DFm4OIUgKnmOMfIsP9iKa9x4H3hQCVtu8c5VSvddvjF3j9yckdi/67pfzc/j2dkWFOu7ei
 opdNb8uUzp/CyVz9Uvq/i1YmWtJbUKwt907CdEQA=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

Add a local CI script for ezgb and grow it from the checks that
already pass to stricter formatting and type checking.

The series removes stale pytest async configuration, adds Ruff
formatting, mypy, pyright, and ty to local CI, and documents the
uv-based development workflow.

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
Tamir Duberstein (6):
      Add local CI script
      Add mypy checks
      Add Ruff format check
      Add pyright checks
      Add ty checks
      Document local CI checks

 README.md                 |  13 +-
 ci.sh                     |  10 ++
 pyproject.toml            |  18 ++-
 src/ezgb/__init__.py      |  94 ++++++------
 src/ezgb/_git.py          |   6 +-
 src/ezgb/_models.py       |  13 +-
 src/ezgb/_reader.py       | 253 ++++++++++++++++++++++----------
 src/ezgb/_types.py        |  15 ++
 src/ezgb/_writer.py       |  41 +++---
 tests/conftest.py         | 207 ++++++++++++++++++--------
 tests/test_ezgb.py        | 363 +++++++++++++++++++++++++++++-----------------
 tests/test_integration.py |  89 ++++++++----
 12 files changed, 749 insertions(+), 373 deletions(-)
---
base-commit: a52cb871360374d3cc13fc941869bc1f0bd2c7c9
change-id: 20260419-stronger-type-checking-64a26f72e878

Best regards,
--  
Tamir Duberstein <tamird@kernel.org>

