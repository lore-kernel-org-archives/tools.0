Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD0737F8A1
	for <tools@linux.kernel.org>; Mon, 20 Apr 2026 04:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776659966; cv=none; b=Y/2shQ0LkVKSVF8vs9fH6LDToSRT4dljvTwYu6GOulVOBlG4st7srC9c08BnJ6XnJ/9SszUcNHYoQR1M/RGucq2J/Ao93dUn76fVyFIKLkrVvTOgyEU/fuzLHjV19FEovgrj93umHCxXZTOysPN+PqtTljA8UhUkFE7Y4GnTTk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776659966; c=relaxed/simple;
	bh=fefpQV3yahiY4dU2OCpDyqGjkR47eM2X04jt29pav3Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=koZOPQSISKUlOJhiEA8xVxFrM1p3nokfBDxLCDUTVeiC4yWjtQsKVmRXE8YtmP7xRa7TjtP7U0Z9XXMXaKNb0BJii1EyhCtu22Qg84MUoTqUcagpofnApaVPjlGNGwfSKv7KgWgGp090/vyzIwyYOt+z5dnieCNK1SL3baDNw6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WFYSqauk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WFYSqauk"
Received: by smtp.kernel.org (Postfix)
	id 3F865C19425; Mon, 20 Apr 2026 04:39:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15CC4C2BCB7;
	Mon, 20 Apr 2026 04:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776659966;
	bh=fefpQV3yahiY4dU2OCpDyqGjkR47eM2X04jt29pav3Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WFYSqauk5rBUKbITc6BOwUsVGhaJLJIvq5JW5DVAo0hYlBU98XtLSa2vM54jcYpW/
	 rv0uRRnGeAaZ7tGhQy3l0Ne/NTWJ4FPL2kYLt3oDrigfVVZzIOuT+1efVr94ktT9W5
	 yh7GtSgLZIamCuJuGMesT5TM+abNG0mLJKAI3tBkbgPRPLGxKXaaA9gMQrS8QbbJCJ
	 r2xxluBHKJ+eezy8cqor50uoxghYrtHkUorQQ2Sovh27KbVtUeG3i+XyU5aqX1rIuS
	 W4+TJ9C0b4ui+RNX/c+yqWwVLS7G1heJtM7loNXUvHqCGb0mAF/QygOAZEjqBh7I8O
	 M0kxynC7CWDRg==
From: Tamir Duberstein <tamird@kernel.org>
Date: Sun, 19 Apr 2026 21:39:27 -0700
Subject: [PATCH ezgb 6/6] Document local CI checks
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260419-stronger-type-checking-v1-6-222775b987e5@kernel.org>
References: <20260419-stronger-type-checking-v1-0-222775b987e5@kernel.org>
In-Reply-To: <20260419-stronger-type-checking-v1-0-222775b987e5@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1132; i=tamird@kernel.org;
 h=from:subject:message-id; bh=fefpQV3yahiY4dU2OCpDyqGjkR47eM2X04jt29pav3Y=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlP1/4JvylzeaHxyYNffk40k8iat8z3SV5w4dlF7r9NP
 +qYnw2275jIwiDGxWAppsiSKHpob3rq7T2yme+Ow8xhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkY6BjrGDFycAjDV+1QZGfbdlHNR2jqLxTPHbGVUJHdc5JlX66R5nbQ+b483qBPklmT4n5JuWK3
 y5NvkCUm8v4Q2WU9VWaJT8rmRPSkvUE2mODGDFwA=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

Replace the old pytest-only development instructions with the uv
workflow and the local CI script.

This keeps contributor documentation aligned with the checks used by
the branch.

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
 README.md | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/README.md b/README.md
index ce65d34..e4cbdf8 100644
--- a/README.md
+++ b/README.md
@@ -59,16 +59,17 @@ make -C docs html
 
 Then open `docs/_build/html/index.html` in your browser.
 
-## Running tests
+## Development checks
 
 ```bash
-pip install -e '.[dev]'
-python -m pytest
+uv sync --all-groups
+./ci.sh
 ```
 
-The test suite includes unit tests (using real git objects in temporary
-repos via pygit2) and integration tests that exercise the full stack
-including the `git-bug` binary.
+The CI script runs Ruff, ty, mypy, pyright, and pytest. The test suite
+includes unit tests (using real git objects in temporary repos via
+pygit2) and integration tests that exercise the full stack including the
+`git-bug` binary.
 
 ## Contributing
 

-- 
2.53.0

