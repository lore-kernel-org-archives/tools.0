Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74CF33B945
	for <tools@linux.kernel.org>; Mon, 20 Apr 2026 01:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776648256; cv=none; b=Ughgj0nN//X8J0vPOo/LG8tpsNng+cEqZgh1YBLBA8bTvgd5zUcrzZwUGQZn6KOts9vcTyJw6t7RHlFtvkPOhEB8kPWf+HbkPjbH8AeuXd2VmKYP0pIlh2+xpm6m49puuBBLio20NS0lTycq4M+8iKIHZz+lcNW6aWXkd/YdcQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776648256; c=relaxed/simple;
	bh=4U+sx/UmnXpcjJ+ZFZQt+DEw4eqJfGFEB9uwnPzuodk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HUyvVHUKbpRn1b6kXUL9EaZVsfFLzhzlo17SPF05fU4bbgU6iqo5HfOsUJ5KfIOci/NbTsvnEkXLuC7Qa3pBF8Dd53RouhG7DjWTfb09G693a+BjPG8Rsksi/vOAWEqgfpCDM5yK8NXShGlL+hUQHcZiI3LYUZmDveZ6/iO2HxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LuwwOGVH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LuwwOGVH"
Received: by smtp.kernel.org (Postfix)
	id 456B1C2BCB6; Mon, 20 Apr 2026 01:24:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D7CEC2BCAF;
	Mon, 20 Apr 2026 01:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776648255;
	bh=4U+sx/UmnXpcjJ+ZFZQt+DEw4eqJfGFEB9uwnPzuodk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LuwwOGVH0012+mZ20mMJe2p0u3od1/8k+IWTp/7hDN56upkd/FUcQA0EPcdHOzJHh
	 0fwjoVEuYkWHTeOomxH+SXiZtrEnTJecEVni33WCm8kcCu6Ko1tceGsSgKrtn5ZdB0
	 XAaW8llGbaAKz0iTmX4Mb6HrLsft0ojadBSbp2vMxmpRxTxMk5Yw3978ket3QRuPQo
	 AmUjHrMEdC45j97A5kvIDAG4w9iuLlrMFVwRoBK0SGUfi0MUcoNFIfC/v4rKhaWLu5
	 cLEL8tC9PpXndlcnU96CddcrfwS0J8uM1oMdgkt5k5D82x03fLXKS9uuw9Pg50Z3kV
	 K5bMMKeo7jf2Q==
From: Tamir Duberstein <tamird@kernel.org>
Date: Sun, 19 Apr 2026 21:22:25 -0400
Subject: [PATCH patatt 5/7] Add ty checks
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260419-stronger-type-checking-v1-5-5c108048d2c7@kernel.org>
References: <20260419-stronger-type-checking-v1-0-5c108048d2c7@kernel.org>
In-Reply-To: <20260419-stronger-type-checking-v1-0-5c108048d2c7@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=924; i=tamird@kernel.org;
 h=from:subject:message-id; bh=4U+sx/UmnXpcjJ+ZFZQt+DEw4eqJfGFEB9uwnPzuodk=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlP65+yb+rRZj4g+jJR9EVXLtfOKAueT8xP54hJuGt2C
 zHeFj/SMZGFQYyLwVJMkSVR9NDe9NTbe2Qz3x2HmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXQMdIwZuDgFYKqfvGdk2Fvgxb3qbtUZNc6w78F3llxb/OBy07uHscaRko9qH7FM8WRk+PBG/dV
 zl1XvLz8+vvpKx1nXzJuSUhuXeyZ+m7gyNNm9iR8A
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

Add ty to the development dependencies and enable all ty rules.

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
 ci.sh          | 1 +
 pyproject.toml | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/ci.sh b/ci.sh
index 4b07fa2..c97c853 100755
--- a/ci.sh
+++ b/ci.sh
@@ -4,6 +4,7 @@ set -eu
 
 uv run ruff format --check
 uv run ruff check
+uv run ty check
 uv run mypy .
 uv run pyright
 uv run pytest --durations=0
diff --git a/pyproject.toml b/pyproject.toml
index 9615a41..34ff5ab 100644
--- a/pyproject.toml
+++ b/pyproject.toml
@@ -31,6 +31,7 @@ dev = [
     "pyright",
     "pytest",
     "ruff",
+    "ty",
 ]
 
 [tool.setuptools.packages.find]
@@ -69,6 +70,9 @@ executionEnvironments = [
     { root = "tests", reportPrivateUsage = false },
 ]
 
+[tool.ty.rules]
+all = "error"
+
 # Configure mypy in strict mode
 [tool.mypy]
 strict = true

-- 
2.53.0

