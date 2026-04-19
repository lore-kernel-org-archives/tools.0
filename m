Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D192BE7DB
	for <tools@linux.kernel.org>; Sun, 19 Apr 2026 16:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776614410; cv=none; b=LRSk4zr4V/Vn8xKcB8wRTGJWFJZxAZS1D9m99OgOfHF+/PYg5Mv/IY19+ZIxS9Pr7HKfFQnOFC3RXsBUH6D2C/oPEosHCRhMVVoFrmhm9Q4Q+Zwl4S5/JE39NyifJqvxeg7U9aq9vjpQS7is1epJ12U4JIQ4s+L0Gf39DgM9gJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776614410; c=relaxed/simple;
	bh=iuBPoZddhskVINErZ7VgIcB6O03JtSMvTuStQOpHWQE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SthtQsMEA2phGRhFdOCUpbm1J5yXL7OqWTPsVB2KWSvlelTn5SnIAptZv4Nc2Tqv3PAUOda5l5u6LgpS29L7Hd4A5xJ4dvcskSeAsUnfz4ITDrRovlH0aZkEvfKpDWst3VzWzUtwT5kzdZGzfMvyp1OueRv96xb5mwqZ6F+XNCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y/R7osF8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y/R7osF8"
Received: by smtp.kernel.org (Postfix)
	id 103C1C2BCB5; Sun, 19 Apr 2026 16:00:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94351C2BCB7;
	Sun, 19 Apr 2026 16:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776614410;
	bh=iuBPoZddhskVINErZ7VgIcB6O03JtSMvTuStQOpHWQE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Y/R7osF8cygvKPesHePtfwIfu8n7iJUSNv82+XxHylQiF+rL12UUda4OzBxcYQTHR
	 oGD5VAMjZKNjsEBi43qKQW9qBu9UYUTRpwGiYfQV91d5UdEIfX2rCWPCgpPgE03QD6
	 5WWZdrm5x24Zv23t1bLui4SZ+339Hjge3huLjZgAWY+f67yylhoKuS+eYgTiXAgquv
	 zVjMRaLTSYvTwHuUKDOdAyvw95E8PzVu47KmlYiwPO5HZ/8xalsrs7xh2jVM1tZskq
	 NOXBCRXV488lCm+70O5E8E6nQ5W0eCsjtRvJ0qkzDaglztfvN/vNZ4oIvxI9vOCZfO
	 nZaZe85vMxxtg==
From: Tamir Duberstein <tamird@kernel.org>
Date: Sun, 19 Apr 2026 12:00:00 -0400
Subject: [PATCH b4 v2 05/11] Fix tests under uv with complex git config
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260419-ruff-check-v2-5-089dfb264501@kernel.org>
References: <20260419-ruff-check-v2-0-089dfb264501@kernel.org>
In-Reply-To: <20260419-ruff-check-v2-0-089dfb264501@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4294; i=tamird@kernel.org;
 h=from:subject:message-id; bh=iuBPoZddhskVINErZ7VgIcB6O03JtSMvTuStQOpHWQE=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlP/rA4zL+7OtD59Pna+nrduMPP3zn8rdK+WX7EdX+0r
 7XNi8PTOiayMIhxMViKKbIkih7am556e49s5rvjMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOgY4xAxenAEz1GkeGfzq1xx+Upvo0PHldoTLnyclXNfc93rXk/jz6h9lpa06tfjzDLybrk3l
 lxRb6v7/Iz2sx/6LisE3pnb/r+a4nsyraW0UmMgEA
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

Add pytest-asyncio to the dev group so pytest can run async TUI
tests.

Pin git-filter-repo to unreleased commit 4697eeb for the multiline
git config parser fix requested in
https://github.com/newren/git-filter-repo/issues/638.

That parser fix is the only functional change since v2.47.0:
https://github.com/newren/git-filter-repo/compare/v2.47.0...4697eeb37b7c3c30b0492e344f6b89f7139cef26

Inject commit.gpgsign=false through the test fixture so synthetic git
commits do not hang on local GPG/pinentry configuration. Also disable
attestation through MAIN_CONFIG so tests keep the old can_patatt=false
behavior after patatt becomes an unconditional dependency.

As a drive-by, route the test b4 globals, pytest sentinel, and XDG
env overrides through monkeypatch so each test gets automatic
cleanup.

Add pytest to the CI script.

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
 ci.sh                 |  1 +
 pyproject.toml        |  6 ++++--
 src/tests/conftest.py | 39 +++++++++++++++++++++++++++++----------
 3 files changed, 34 insertions(+), 12 deletions(-)

diff --git a/ci.sh b/ci.sh
index ddd4cff..7632e85 100755
--- a/ci.sh
+++ b/ci.sh
@@ -5,3 +5,4 @@ set -eu
 uv run ruff format --check
 uv run ruff check
 uv run mypy .
+uv run pytest --durations=20
diff --git a/pyproject.toml b/pyproject.toml
index 0c4f024..959d168 100644
--- a/pyproject.toml
+++ b/pyproject.toml
@@ -24,7 +24,9 @@ classifiers = [
 ]
 dependencies = [
     "requests>=2.24,<3.0",
-    "git-filter-repo>=2.30,<3.0",
+    # Use unreleased fix for multiline git config values.
+    # https://github.com/newren/git-filter-repo/issues/638
+    "git-filter-repo @ git+https://github.com/newren/git-filter-repo.git@4697eeb37b7c3c30b0492e344f6b89f7139cef26",
     "dkimpy>=1.0,<2.0",
     "patatt>=0.6,<2.0",
     "ezgb>=0.1",
@@ -68,7 +70,7 @@ b4 = "b4.command:cmd"
 asyncio_mode = "auto"
 asyncio_default_fixture_loop_scope = "function"
 filterwarnings = "ignore:.*(pyopenssl|invalid escape sequence).*:DeprecationWarning"
-norecursedirs = ["tests/helpers", "patatt"]
+norecursedirs = ["tests/helpers", "ezgb", "liblore", "patatt"]
 log_file = "pytest.log"
 log_file_level = "DEBUG"
 log_file_format = "%(asctime)s [%(levelname)8s] %(message)s (%(filename)s:%(lineno)s)"
diff --git a/src/tests/conftest.py b/src/tests/conftest.py
index 0825373..48b2573 100644
--- a/src/tests/conftest.py
+++ b/src/tests/conftest.py
@@ -1,3 +1,4 @@
+import copy
 import os
 import pathlib
 import sys
@@ -9,20 +10,38 @@ import b4
 
 
 @pytest.fixture(scope='function', autouse=True)
-def settestdefaults(tmp_path: pathlib.Path) -> None:
+def settestdefaults(
+    monkeypatch: pytest.MonkeyPatch,
+    tmp_path: pathlib.Path,
+) -> None:
     topdir = b4.git_get_toplevel()
     if topdir and topdir != os.getcwd():
         os.chdir(topdir)
-    b4.can_network = False
-    b4.MAIN_CONFIG = dict(b4.DEFAULT_CONFIG)
-    b4.USER_CONFIG = {
-        'name': 'Test Override',
-        'email': 'test-override@example.com',
-    }
-    os.environ['XDG_DATA_HOME'] = str(tmp_path)
-    os.environ['XDG_CACHE_HOME'] = str(tmp_path)
+    monkeypatch.setattr(b4, 'can_network', False)
+    monkeypatch.setattr(
+        b4,
+        'MAIN_CONFIG',
+        {
+            **copy.deepcopy(b4.DEFAULT_CONFIG),
+            'attestation-policy': 'off',
+        },
+    )
+    monkeypatch.setattr(
+        b4,
+        'USER_CONFIG',
+        {
+            'name': 'Test Override',
+            'email': 'test-override@example.com',
+        },
+    )
+    monkeypatch.setenv('XDG_DATA_HOME', str(tmp_path))
+    monkeypatch.setenv('XDG_CACHE_HOME', str(tmp_path))
+    git_config_count = int(os.environ.get('GIT_CONFIG_COUNT', '0'))
+    monkeypatch.setenv('GIT_CONFIG_COUNT', str(git_config_count + 1))
+    monkeypatch.setenv(f'GIT_CONFIG_KEY_{git_config_count}', 'commit.gpgsign')
+    monkeypatch.setenv(f'GIT_CONFIG_VALUE_{git_config_count}', 'false')
     # This lets us avoid execvp-ing from inside b4 when testing
-    sys._running_in_pytest = True  # type: ignore[attr-defined]
+    monkeypatch.setattr(sys, '_running_in_pytest', True, raising=False)
 
 
 @pytest.fixture(scope='function')

-- 
2.53.0

