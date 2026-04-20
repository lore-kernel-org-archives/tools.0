Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309B2376BEA
	for <tools@linux.kernel.org>; Mon, 20 Apr 2026 04:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776659965; cv=none; b=EuQjvPO+xcyMI4oyEJxsh2dDNWekQCeOCsQpzkZNAhyFIwdK/AnE11TkmTop9+102JRUB26c9MnM8uVBQ6pocOXTyYulop2WM0WxWPMH0KBGwA2rOdljIPPL79fe0r9qh4YCDUb5XGDD+cfCmE7PYltC1psPFwYWAzgHZTnYxbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776659965; c=relaxed/simple;
	bh=naTHdQBvhDIj0LPKQmJY3vvC6Z3KlX3CcqYGTQ319Vo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SskcJ8iRDmbtPAN/D9m9C7W/FRo3O6pqdry/yAhtY0EyPjLK/di5qYb7vlLkiwLDAjT1Kz9ftEETTryGGTYAqGWCUqHK2+3iBXqGov6Qxme2oNNlA5Kt+pmuVKvYm87xDLK99eTycLqhf3pbpIbCaXC1xufMLVBhfa61IdnxTZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VhE9upoQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VhE9upoQ"
Received: by smtp.kernel.org (Postfix)
	id F1371C2BCB9; Mon, 20 Apr 2026 04:39:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1D7FC2BCB8;
	Mon, 20 Apr 2026 04:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776659964;
	bh=naTHdQBvhDIj0LPKQmJY3vvC6Z3KlX3CcqYGTQ319Vo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VhE9upoQW0pHhozAYzRqWeqV06rDj3OgzpOKy/2z15ic4Rahp9fxqY8mtviA3YBZW
	 31nrnAopHJtVX6DxkzBAwLtcoNKtd9IUuwbmxp2J60bCnwnDGJ7iNsZ7IybGEF5Er4
	 vmV2lfpHfdluMx11SIfURyg7E7RMrRLIhCShCBzdLHpxRkFD6e0Olnnba2ZzMJJp5w
	 DW0QVsM89JQ7hP6T71qRxatkOMh7YxEWT4q+loMrz98h91AzQY94N1luTvPuN+tHr7
	 /dIWCy6Pwuy+7/hQzWgMKTqDwbvzEI991lTNVXeb+3lRi9QROf3XgikfDCretkJJL1
	 1pUQ6TKogbxhg==
From: Tamir Duberstein <tamird@kernel.org>
Date: Sun, 19 Apr 2026 21:39:22 -0700
Subject: [PATCH ezgb 1/6] Add local CI script
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260419-stronger-type-checking-v1-1-222775b987e5@kernel.org>
References: <20260419-stronger-type-checking-v1-0-222775b987e5@kernel.org>
In-Reply-To: <20260419-stronger-type-checking-v1-0-222775b987e5@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=940; i=tamird@kernel.org;
 h=from:subject:message-id; bh=naTHdQBvhDIj0LPKQmJY3vvC6Z3KlX3CcqYGTQ319Vo=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlP1/5+d6Gjep27F1uOyKY7cVtFZsavdcsXsV+V8eT07
 67NhVfedkxkYRDjYrAUU2RJFD20Nz319h7ZzHfHYeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdAx1jBi5OAZjqnBeMDCfWV6u8vyvLwsMY0frS7e1VnuNL/UL4dylEGzzdcWWH5QNGhgvbys4
 EnvifmHGjMWk2j4F3o2CHzPenwe7P3OOMd/1dzQ4A
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

Add a local CI helper with the checks that already pass: Ruff linting
and pytest.

Drop stale pytest async options at the same time. This project has no
async tests, so those settings only produced warnings.

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
 ci.sh          | 6 ++++++
 pyproject.toml | 2 --
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/ci.sh b/ci.sh
new file mode 100755
index 0000000..e589443
--- /dev/null
+++ b/ci.sh
@@ -0,0 +1,6 @@
+#!/usr/bin/env sh
+
+set -eu
+
+uv run ruff check
+uv run pytest --durations=0
diff --git a/pyproject.toml b/pyproject.toml
index cfcf087..8ff6e08 100644
--- a/pyproject.toml
+++ b/pyproject.toml
@@ -41,8 +41,6 @@ where = ["src"]
 [tool.pytest.ini_options]
 testpaths = ["tests"]
 addopts = "--tb=short"
-asyncio_mode = "strict"
-asyncio_default_fixture_loop_scope = "function"
 
 [tool.mypy]
 strict = true

-- 
2.53.0

