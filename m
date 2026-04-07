Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A347035B645
	for <tools@linux.kernel.org>; Tue,  7 Apr 2026 16:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775580524; cv=none; b=UXAUmWkWBdjFFrZ2buJ0oE243KxyH7szXj7Wa4ZsXlIH20m1AzeidBZGiobknB4HiUHHPs4Pd21CtVt+uBCfltjtrgmjM/y6BZ3kDeJbSnIZK4u0R4ha5uQjj7y+sSHV3qIu80kuOzpriGC31Ch3nw1pV2mz4DMzDjpNMdROlww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775580524; c=relaxed/simple;
	bh=+c0mJFjpnhEcdgwWRtzZ9QNMu00EbYTMaSRSb3ltkhE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rjkegbWtHcrXSD12UkhPrVZFPOKRWvaxPtA6y79N/gE+hcqjPfeKfwWpCSzq5yORuztHmHHmjLVkVRBJQwYyS2LauX6AbNvm1gGF8y52iYZyFtOpfA+GAWmZXOOEilZ/n02Bl/J7N/K1mlB3b9uuLqF+xiBhbzRCPXIgUCPCrBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q97t4Eys; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q97t4Eys"
Received: by smtp.kernel.org (Postfix)
	id 8FA6CC19424; Tue,  7 Apr 2026 16:48:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31200C2BCB6;
	Tue,  7 Apr 2026 16:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775580524;
	bh=+c0mJFjpnhEcdgwWRtzZ9QNMu00EbYTMaSRSb3ltkhE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Q97t4EysUxnn6utqr4RaL4FUdAntDkCmoG9TJlamf9+iDzfrNbN3RDP+knvzHNv/J
	 JCXWc520EjO6pLKt8PbAEvLG/DoAAO0O8AINlQ7KGpDVTVdvMKnty1Ggi/XciQ39xI
	 wng3ziBMeCFR/Ryd8yPJg5i1Lw0QRnA99uQj4Yc6NjK5gGY4+5mw6xxdcgrElDw9g8
	 irOq5WtiPknSDoKjNVxkW4KFcHI2HVEzjLquPXno2VRozQB+sEiKpyGSF6Rx0fJ69/
	 lI0RPin0T5nNY8a+YaFDNf3JKv7JgNvrp9PwHkrvOLFfgYPkURyBit4A9V7eTDUwO9
	 zKlq/s3LdVE7A==
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 07 Apr 2026 12:48:34 -0400
Subject: [PATCH b4 05/12] Fix tests under uv with complex git config
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-ruff-check-v1-5-c9568541ff67@kernel.org>
References: <20260407-ruff-check-v1-0-c9568541ff67@kernel.org>
In-Reply-To: <20260407-ruff-check-v1-0-c9568541ff67@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3568; i=tamird@kernel.org;
 h=from:subject:message-id; bh=+c0mJFjpnhEcdgwWRtzZ9QNMu00EbYTMaSRSb3ltkhE=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlXTTPSZ//2D+QMPaixQMpVKLj4+9MVh2N57m6YIGA7s
 e3ntR7hjoksDGJcDJZiiiyJoof2pqfe3iOb+e44zBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjoGPMwMUpAFM9S5Hhf8gGwauzTmb5JcnnLZhsdadD1sZ3+hm9/evme3gEv3z+bxYjQ9OzC2u
 seRa2O75JPJj29pqc1sRjrUkZ790+mhXX/2Dh4gYA
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

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
 pyproject.toml        |  4 +++-
 src/tests/conftest.py | 39 +++++++++++++++++++++++++++++----------
 2 files changed, 32 insertions(+), 11 deletions(-)

diff --git a/pyproject.toml b/pyproject.toml
index 4fad7da..8428c5b 100644
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
diff --git a/src/tests/conftest.py b/src/tests/conftest.py
index 3ff3891..83b467d 100644
--- a/src/tests/conftest.py
+++ b/src/tests/conftest.py
@@ -1,3 +1,4 @@
+import copy
 import os
 import pathlib
 import sys
@@ -9,20 +10,38 @@ import b4
 
 
 @pytest.fixture(scope="function", autouse=True)
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
 
 
 @pytest.fixture(scope="function")

-- 
2.53.0

