Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C2B342173
	for <tools@linux.kernel.org>; Mon, 20 Apr 2026 01:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776648190; cv=none; b=GVMU4jojt87t9N/jXH8pk3aUIOa/pIA2VIDZSurPIdNW8fxSzXMV59qDZjSvjwFRme+qh94ZAZg8anU4PNrpSV8SbD2AsvAYP4HMRtQM8FkDZh5GcLvhZn3lLgsteMGBL8yMP/7Qz5sMmPEsf6CaS5lLDTsfLJeCVmbatdp0g/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776648190; c=relaxed/simple;
	bh=PJPpyPMtwWso9vpIwf3mkzornZV5MO5jDfriF/yG/LU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lBfRDnke4zSStpj8b4R0OjHu25bG/9zAsCfk9lmDUcIDHdjOF587qLUD08wgWgPwdSh/Nfsgotz6Y1IlwAuuEo6GE/+8mMfK00tQI5YPIfOCxpcpkV83Tjzncfi/4CRWmGtlwaPbf1AUMpdwZKYAkN1JQoEuuU3vjGO9FWs0wjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ng+poZ0c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ng+poZ0c"
Received: by smtp.kernel.org (Postfix)
	id CABF3C2BCB5; Mon, 20 Apr 2026 01:23:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C9F8C2BCAF;
	Mon, 20 Apr 2026 01:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776648189;
	bh=PJPpyPMtwWso9vpIwf3mkzornZV5MO5jDfriF/yG/LU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ng+poZ0cynBs6fzvNqsaU6ta/2Y6FoI2tupo2micLgdKMfPS2NKKil1j3dQAR7yMR
	 HVdOWXJCsb2UtVa8TTUwQOAA1F5F2gGL/SVGRva86clx6ZHp7rGKO2oqHgbVO+uF3y
	 M+1emtsgh/fmUG9jbsDPFaBU/e+7YhjFPQEGmEXPyyWA3f+/8N6WCQzdO65WGEryVj
	 ZzM/vC/ZOQVKkSGSFoqGDszvoY7bPlM85IPoZJ8+njrZXc0H+yBDWhS+K+yDrlZq+r
	 OOvddoVS1RtylixnCr4yPKLTgHNSb6RRSfk0/+0cVwZxExeHVxwroOuJkAPeOBOIh1
	 abJpW0s23feyQ==
From: Tamir Duberstein <tamird@kernel.org>
Date: Sun, 19 Apr 2026 21:22:21 -0400
Subject: [PATCH patatt 1/7] Add local CI script
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260419-stronger-type-checking-v1-1-5c108048d2c7@kernel.org>
References: <20260419-stronger-type-checking-v1-0-5c108048d2c7@kernel.org>
In-Reply-To: <20260419-stronger-type-checking-v1-0-5c108048d2c7@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=962; i=tamird@kernel.org;
 h=from:subject:message-id; bh=PJPpyPMtwWso9vpIwf3mkzornZV5MO5jDfriF/yG/LU=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlP6590HPqzXfz57TsTDfZu1L5RcmyKkOUTxYagPz+c9
 hQKxJyd3DGRhUGMi8FSTJElUfTQ3vTU23tkM98dh5nDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DI10DHSMGbg4BWCq23MZGd41bKy8JDhvrzfv3RM2i+YbSB3bUzUhaVLAvldNlwzlejIZGebHGn8
 +f3Z1+Zl1ExwNJcIsl3+N/SEjPefDzoca54uThFkA
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

Add a small CI helper that runs the checks already passing in this tree:
Ruff linting, mypy, and pytest.

Remove `asyncio_default_fixture_loop_scope` which isn't used here since
this project does not use async tests.

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
 ci.sh          | 7 +++++++
 pyproject.toml | 1 -
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/ci.sh b/ci.sh
new file mode 100755
index 0000000..3001db2
--- /dev/null
+++ b/ci.sh
@@ -0,0 +1,7 @@
+#!/usr/bin/env sh
+
+set -eu
+
+uv run ruff check
+uv run mypy .
+uv run pytest --durations=0
diff --git a/pyproject.toml b/pyproject.toml
index 47f86a3..a541b01 100644
--- a/pyproject.toml
+++ b/pyproject.toml
@@ -65,7 +65,6 @@ typeCheckingMode = "off"
 strict = true
 
 [tool.pytest.ini_options]
-asyncio_default_fixture_loop_scope = "function"
 testpaths = "tests"
 python_files = "test_*.py"
 python_classes = "Test*"

-- 
2.53.0

