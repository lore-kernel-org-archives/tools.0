Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1E2257ACF
	for <tools@linux.kernel.org>; Thu, 15 Oct 2026 14:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792073337; cv=none; b=Yh2skHK9dE7PD9UEsE/XfUyNkI4BtrJuJaJnyGjZkzwbuKYxwE3euMZ6FFoQYN1LgMomI/bca11HJYhhozuwAWpXie+eReWopNNxHJfaVO+uGvSWfc4dbUyQ/cC55/ZbcZrMbVtfA2XNz94/R+POAp8q1jxzRWD8LjELlPzg7uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792073337; c=relaxed/simple;
	bh=wtmupFMp0rA3juV+NK0J2JiABfjK4UNsMhETAJYjL00=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WzejPgaHGJxKabi6uylUI1UL+D01SVZteeCEDGvgj+ePXdNA4cjhW5RlPjBctlW+8JfSLWq0J1AnrdjPxqJ4VMh8vx73qiRSE3by0/zWHXVustVpDgS4dE/CIpNftOZNUprHwLsg0qs/BMnJDuhx7aR02cs1EyVp2Vzq3EP1pk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NuU6fy2n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NuU6fy2n"
Received: by smtp.kernel.org (Postfix)
	id B6D231F000C4; Thu, 15 Oct 2026 14:08:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BDFF1F000C6;
	Thu, 15 Oct 2026 14:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792073336;
	bh=YO83fZU+ShKr0QVlZTfeq65WAb8iaHNrpkTQoVypNic=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=NuU6fy2naoUTsattAr+GWUzZ2QHFElNaFTCLFY/s+IG0ZGaGRbmJJ10jZladEQPjs
	 /0Bc2kOz04ZidyzJYY3NTqfRX4nO/Xfay7GAzepg9/yQXXI3ytHWDYeV9OL5bad0/k
	 yEuo7KAin+KKTOUTCEPWOwRAHT7pRhA9jUja+7c3XOhSQyKfOtvly+djpx79dwiDlg
	 ms3mkxntw1DGdiKmj90415UCibqZHl/L9AZMjmNiRUN6STEz8EHUm9a2PWIVFtpE+T
	 F66h71+IvX92guED4bz5jofuyV26pCR78+vxVTT7DhLPpSCq/9ZJfTVgMxbLwNh0g6
	 REA/ZvyS+OFvA==
From: Brian Masney <masneyb@kernel.org>
Date: Thu, 15 Oct 2026 10:08:43 -0400
Subject: [PATCH b4 3/3] review: tests: add tests for get_pw_key() and
 b4.pw-key-command
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-pw-key-command-v1-3-6daa9b8cee2a@kernel.org>
References: <20261015-pw-key-command-v1-0-6daa9b8cee2a@kernel.org>
In-Reply-To: <20261015-pw-key-command-v1-0-6daa9b8cee2a@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Brian Masney <masneyb@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2941; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=wtmupFMp0rA3juV+NK0J2JiABfjK4UNsMhETAJYjL00=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLIu3CvanOdvrThtytyXu05PWvvq1EuGEI7Fr9o+3vH7r
 Pp199tPgh2lLAxiXAyyYoosS3KNCiJSV9neu6PJAjOHlQlkCAMXpwBMxHMpw3+fo655WhmNKzX+
 KHg4OgmwTDWb0LFCbY8344cHG8R1A48xMsy4vPKfsfDVtxVrUjdqGihHuh05WHtkQsNdLpYze5N
 yTJgA
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Introduce tests for pw-key and pw-key-command.

Assisted-by: LLM
Signed-off-by: Brian Masney <masneyb@kernel.org>
---
 src/tests/test___init__.py | 53 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/src/tests/test___init__.py b/src/tests/test___init__.py
index 764829d7e756..0eb6e6193b1c 100644
--- a/src/tests/test___init__.py
+++ b/src/tests/test___init__.py
@@ -2924,3 +2924,56 @@ class TestGetAmMessageFromLines:
         lines = payload.decode().splitlines()
         assert 'From the manual, bar() must be called here.' in lines
         assert '>From an old thread.' in lines
+
+
+class TestGetPwKey:
+    """b4.pw-key-command fetches the Patchwork key from a password manager."""
+
+    @pytest.fixture(autouse=True)
+    def _clear_cache(self) -> None:
+        b4._PW_KEY_CACHE.clear()
+
+    def test_plain_key(self) -> None:
+        assert b4.get_pw_key({'pw-key': 'secret'}) == 'secret'
+
+    def test_unset(self) -> None:
+        assert b4.get_pw_key({}) == ''
+
+    def test_command_first_line(self) -> None:
+        """Only the first line counts, as with `pass show`."""
+        config: b4.ConfigDictT = {
+            'pw-key': 'ignored',
+            'pw-key-command': "printf 'fromcmd\\nuser: me\\n'",
+        }
+        assert b4.get_pw_key(config) == 'fromcmd'
+
+    def test_command_runs_once(self, tmp_path: pathlib.Path) -> None:
+        counter = tmp_path / 'count'
+        config: b4.ConfigDictT = {
+            'pw-key-command': f"sh -c 'echo x >> {counter}; echo key'",
+        }
+        assert b4.get_pw_key(config) == 'key'
+        assert b4.get_pw_key(config) == 'key'
+        assert counter.read_text().count('x') == 1
+
+    def test_command_fails(self, caplog: pytest.LogCaptureFixture) -> None:
+        config: b4.ConfigDictT = {'pw-key-command': 'false'}
+        with caplog.at_level(logging.CRITICAL, logger='b4'):
+            assert b4.get_pw_key(config) == ''
+        assert 'exited with status 1' in caplog.text
+
+    def test_command_missing(self, caplog: pytest.LogCaptureFixture) -> None:
+        config: b4.ConfigDictT = {'pw-key-command': '/nonexistent/b4-pw-helper'}
+        with caplog.at_level(logging.CRITICAL, logger='b4'):
+            assert b4.get_pw_key(config) == ''
+        assert 'Could not run pw-key-command' in caplog.text
+
+    def test_ignored_in_worktree_config(self, gitdir: str) -> None:
+        """A cloned tree's .b4-config must not get to run a command."""
+        wtcfg = pathlib.Path(gitdir) / '.b4-config'
+        wtcfg.write_text(
+            '[b4]\n\tpw-key-command = echo stolen\n\tpw-url = https://pw.example.org\n'
+        )
+        b4._setup_main_config(topdir=gitdir)
+        assert b4.MAIN_CONFIG.get('pw-url') == 'https://pw.example.org'
+        assert b4.MAIN_CONFIG.get('pw-key-command') is None

-- 
2.55.0

