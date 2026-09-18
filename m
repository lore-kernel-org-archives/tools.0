Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E0A274670
	for <tools@linux.kernel.org>; Fri, 18 Sep 2026 22:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789769019; cv=none; b=a1Lu7vAmW6/LchnqeRslxh6IjUYjcqoVOzrA33CZKrU/phFv77QPKAOBlnZVPjk7+PqZs/aAfqRT1oP2dxBupC3ZnMyINbwbM/r6c4MGvRjXq2EHs62CkuZgAguJgtGnzLqAESZ9gCFxCBq8KkzYwBpvQr2ijOzrIV4klfeqs3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789769019; c=relaxed/simple;
	bh=qAoUFvRRngO7bGpLFBjqXKLo28TTe9TDtyzPfF3DDCw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iOSGDeKVb0kHhokqhRhVJYT+2fCSdrCMuZi9rxD+k0hOBQ9ZQNx2vj5Wcz5nucaM0qq1rUWPwE7To+jrItEP4+od/hyxkTWnrJ44uspPKIPu6HwUId30jRUR8VmNjIZCqG9wEot3DjYKrz/8VXWgetH4wtw30vX45ta5ufos65g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eOdVSrbM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eOdVSrbM"
Received: by smtp.kernel.org (Postfix)
	id A4A1C1F00899; Fri, 18 Sep 2026 22:03:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33E0F1F0089B;
	Fri, 18 Sep 2026 22:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789769017;
	bh=BlgHIw4XMlTN2W5fEVgdp4RXqA45rPeXMFLZ3W4zWXQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=eOdVSrbM2yEM5SgTZt8zCiqOJXgqpI/8VvhXhEVH61KO4lh28gm8+rd9ekbbRRGsv
	 dYKmosvGPOwPGqCThGoNZJEzFaw3jMrSFtebupM1uKmyqha9TnMzC7OhJxv/Hv7tUq
	 lvt3LnyVeBw/0s2tiwLWPnEsXe9VGLm4Wj2FjD/uWqdT2Cf4fpwcSkfL8Mj/KcFwiv
	 Pe627il5OEa99USs3lBrIX7povc8vKGsJ1shqXYKqsYjXLKk538xINCJSsKHv3vur6
	 jXJJjZuVTXHwN8xMTDgemdTKHzwowSxdEtxKCWsND2iTI4Pc8DPcL+ZkNP+/sb+BlD
	 K72Ik17iFxXGw==
From: Tamir Duberstein <tamird@kernel.org>
Date: Fri, 18 Sep 2026 18:03:23 -0400
Subject: [PATCH ezgb v2 3/3] Document local CI checks
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-stronger-type-checking-v2-3-3ddc31ba2616@kernel.org>
References: <20260918-stronger-type-checking-v2-0-3ddc31ba2616@kernel.org>
In-Reply-To: <20260918-stronger-type-checking-v2-0-3ddc31ba2616@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2281; i=tamird@kernel.org;
 h=from:subject:message-id; bh=qAoUFvRRngO7bGpLFBjqXKLo28TTe9TDtyzPfF3DDCw=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDFlrtxpt9HtyTjjg3hnzQy9y7h2ZYOyqFMrAtyO8I9boe
 XShJ6tmx0QWBjEuBksxRZZE0UN701Nv75HNfHccZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx0DFm4OIUgKnmXsLwP8K7eL8Gb+2MCcrGGycnq124UlPDmu76QS/L9cP8FZN3zWD4X/dlgSF
 zX9XOjd7KUSf8bjn6es1Q37PoReip2/tec3C5cAEA
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

Development dependencies are now a dependency group, so the documented
.[dev] extra no longer installs them. Document uv sync and ci.sh in the
README and contributor guide so local checks include all linters, type
checkers and tests.

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
Assisted-by: LLM
---
 CONTRIBUTING.md | 15 ++++++++-------
 README.md       | 13 +++++++------
 2 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
index ac70676..0a6a0b7 100644
--- a/CONTRIBUTING.md
+++ b/CONTRIBUTING.md
@@ -28,16 +28,17 @@ contributor guide has a good overview:
 
 - Python 3.10+, `from __future__ import annotations` in every module.
 - `%`-style string formatting to match the existing code.
-- Run `ruff check` and `mypy --strict` before submitting.
+- Run `./ci.sh` before submitting.
 
-## Running tests
+## Development checks
 
-    pip install -e '.[dev]'
-    python -m pytest
+    uv sync --all-groups
+    ./ci.sh
 
-The test suite includes unit tests (using real git objects in temporary
-repos via pygit2) and integration tests that exercise the full stack
-including the `git-bug` binary.
+The CI script runs Ruff, ty, mypy, pyright, and pytest. The test suite
+includes unit tests (using real git objects in temporary repos via
+pygit2) and integration tests that exercise the full stack including the
+`git-bug` binary.
 
 ## Licensing
 
diff --git a/README.md b/README.md
index 3ee811e..4d9042d 100644
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
2.56.0.rc0.692.g34fd115c35.frankengit

