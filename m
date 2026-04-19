Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E092882CD
	for <tools@linux.kernel.org>; Sun, 19 Apr 2026 16:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776614406; cv=none; b=HsDlkOPcctiRIju/Eau63bB//g6iM2d5BlMrHyhHbca9eXyMGCNXOxYwFWaPEku5s47yQ6jrC+kIhBIFWJ7+u9LsDiXaqIvVDikFyXdJxu7gb/fDf0Qy0yy+c6lNxtTYIyFAsfWcI5aYfqri+ByaKoTfg278CP08W8mWxb7GGLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776614406; c=relaxed/simple;
	bh=uczTLTbaOrsGlgWMhsrdNMCQDxUZ2iADbSbDzoPDxsg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RaQCvKC2JKnPlm/T4uDuTohbrDYaRpq4hOCFjjbbycP8rK5QIkSgeev8K9j2iOqAlw/Dc1zD2z+ir8GIL+vLhsYi/6Q+Mjzyj/R7u2OxvLgJCVSVetsrqMzNHKy2cn1EdhFAWSOJrdGlcmfiGw6R1dqOPAYcsQSZPbRQNjrz9uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ISiGFavH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ISiGFavH"
Received: by smtp.kernel.org (Postfix)
	id BDCF6C2BCB5; Sun, 19 Apr 2026 16:00:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6273EC2BCB7;
	Sun, 19 Apr 2026 16:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776614406;
	bh=uczTLTbaOrsGlgWMhsrdNMCQDxUZ2iADbSbDzoPDxsg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ISiGFavHkSSxnQ6zUf5esUA41jFOVjBlmAASM8xoGII3cLSIYRpwKknaBCowJWbqW
	 KLq9BLDSSn6Tkg8adNbjbUQETW/4ut9G3Yy16lNKO49U9SAU72x+36R98ImFb7REdb
	 Wqimc+E2Gku3cV1XP4erbHE7I7A9uw0RmypIVKXQibB0PtKwQm4hK801FdtaYlbtCK
	 HyJJCdE5NQQy7CzMFfNl3uc14Mt5E9LUKEXFLvhVvZrjOVnSm5e0se1FBNlJTknavB
	 EwqBL89e5V6zIBUTvDd5bqb8n3sQ6l77XIvz1OEt2jBIEg+WZVB4LstglrFuon+3/u
	 UwCwCIkilmUvg==
From: Tamir Duberstein <tamird@kernel.org>
Date: Sun, 19 Apr 2026 11:59:56 -0400
Subject: [PATCH b4 v2 01/11] Add CI script
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260419-ruff-check-v2-1-089dfb264501@kernel.org>
References: <20260419-ruff-check-v2-0-089dfb264501@kernel.org>
In-Reply-To: <20260419-ruff-check-v2-0-089dfb264501@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=756; i=tamird@kernel.org;
 h=from:subject:message-id; bh=uczTLTbaOrsGlgWMhsrdNMCQDxUZ2iADbSbDzoPDxsg=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlP/jCf2XVRZI/07bMFGvcmKLkWLRetPJl0vOy16Zb7c
 0O+TUha3jGRhUGMi8FSTJElUfTQ3vTU23tkM98dh5nDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DI10DHSMGbg4BWCqvTQYGaZsf7VR6vIpkex/L9rnOUcINOrEtLdfTnP4KKOzOaJz+2ZGhmmNHua
 WPxzWfI+xixB4Oafmx3bL4jnnOGXjQlIiS0o4+AA=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

Add a shell script that runs mypy. Skip submodule paths if they are
present and the misc directory which doesn't yet type check.

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
 ci.sh          | 5 +++++
 pyproject.toml | 1 +
 2 files changed, 6 insertions(+)

diff --git a/ci.sh b/ci.sh
new file mode 100755
index 0000000..89a5a80
--- /dev/null
+++ b/ci.sh
@@ -0,0 +1,5 @@
+#!/usr/bin/env sh
+
+set -eu
+
+uv run mypy .
diff --git a/pyproject.toml b/pyproject.toml
index c0c9935..867fcae 100644
--- a/pyproject.toml
+++ b/pyproject.toml
@@ -111,4 +111,5 @@ typeCheckingMode = "off"
 
 # Configure mypy in strict mode
 [tool.mypy]
+exclude = ["^ezgb/", "^liblore/", "^misc/", "^patatt/"]
 strict = true

-- 
2.53.0

