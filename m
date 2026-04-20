Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141A63815D4
	for <tools@linux.kernel.org>; Mon, 20 Apr 2026 04:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776659966; cv=none; b=iblb6TFyb4LBzPPDCUcW9AqJSUDAY6aX56gVpcy6LA0v6L5WzHPlo16C7ylItiDYghE/WCm8Zzp71ckHtNPts4GCM0otxW5aLMLYjrj01U3EMQu8F7RTlYB5vSxiWzc/jN8uTaBEKxU5oNDEzd6rfuke9Ny6AK9OjM5rUt8nMu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776659966; c=relaxed/simple;
	bh=42cHtJ5vGucdG+CLRqKQ6RowrCAAHs8y/5hpTnD/Qag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h02polG2csXHHU2jKT9zS8XiKKWbrD11uilN6ZT8dhxPWOt76KTndOIJbFkIyDN8EVO0PXOnZ7PPuMnjvguOAoDE2npl1EIhu4Sp+YgXCxFB2/xdLPUa3CHkUqak0LtkE9F3X6NYv3BHbYpq6Qno2KBWeIFhGOd9mppm1w/8CYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EFybFQwH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EFybFQwH"
Received: by smtp.kernel.org (Postfix)
	id 06F0CC19425; Mon, 20 Apr 2026 04:39:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D15E3C2BCB6;
	Mon, 20 Apr 2026 04:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776659965;
	bh=42cHtJ5vGucdG+CLRqKQ6RowrCAAHs8y/5hpTnD/Qag=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EFybFQwHRBS/UCKASkoDtY9rhxs1lmKZ+e8MVbJs/N3G/cthxDNryc6f3eaJm4EHs
	 ZBliyoclPfe+LHeXDpfFE7diaE7XxC55cgzufz3foXuiSMm6c2tuv//Hc9a27/36Ry
	 XwQasY+8+Ujswm07xpgEjdtRKusRD52J1rPmXrov5mcAUwADXI0isCcyzFB/RVZfVd
	 N2R7kJvtHHW3gU+5VlgRzfGwcw14vOc1VmSpyh5K2MvmtvhzqSZ1PoOwhRdSk4+fyB
	 v0aG01iEifgmPnBP0i9us0zEXkqpAOqcWkRnu8Czl7j+AQVAU0JjUwAwJ8IZF23dL1
	 dixzkCZQU/rHg==
From: Tamir Duberstein <tamird@kernel.org>
Date: Sun, 19 Apr 2026 21:39:26 -0700
Subject: [PATCH ezgb 5/6] Add ty checks
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260419-stronger-type-checking-v1-5-222775b987e5@kernel.org>
References: <20260419-stronger-type-checking-v1-0-222775b987e5@kernel.org>
In-Reply-To: <20260419-stronger-type-checking-v1-0-222775b987e5@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=866; i=tamird@kernel.org;
 h=from:subject:message-id; bh=42cHtJ5vGucdG+CLRqKQ6RowrCAAHs8y/5hpTnD/Qag=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlP1/6Z5rmu6b1CKdd9Y/k5+h3ZLUXOHvteR3y6PO2lu
 L6WaNjxjoksDGJcDJZiiiyJoof2pqfe3iOb+e44zBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjoGPMwMUpAFPtq8vwmz2pcva/2fXWCyJjensUdyaEa7Fn+dms1O+ZtP3gvxnl3xn+qefovBK
 +ZfqhpkzsY9KhF/uCD62WXRYg/vm4tQ13csJuVgA=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

Add ty to the local CI script with all rules set to errors.

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
 ci.sh          | 1 +
 pyproject.toml | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/ci.sh b/ci.sh
index fbc433d..e140eb6 100755
--- a/ci.sh
+++ b/ci.sh
@@ -4,6 +4,7 @@ set -eu
 
 uv run ruff check
 uv run ruff format --check
+uv run ty check
 uv run mypy .
 uv run pyright
 uv run pytest --durations=0
diff --git a/pyproject.toml b/pyproject.toml
index 452bd6a..33a21d8 100644
--- a/pyproject.toml
+++ b/pyproject.toml
@@ -29,6 +29,7 @@ dev = [
     "pyright",
     "pytest",
     "ruff",
+    "ty",
 ]
 
 [project.urls]
@@ -57,3 +58,6 @@ typeCheckingMode = "strict"
 executionEnvironments = [
     { root = "tests", reportPrivateUsage = false },
 ]
+
+[tool.ty.rules]
+all = "error"

-- 
2.53.0

