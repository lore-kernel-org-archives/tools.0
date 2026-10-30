Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793368069;
	b=BldCjRp0gfCeoyn3w6MrlQLQ0njhh3UTeECID9zTzduM9pFUMfIe84zfMz9PkDictIR/
	 ToRnD4htKNWy4fwN8y6bjDVN2zfBBG2EMWXHaLyeCYHa1qhJJ3/WnlJczTpx6TLT9jzMQ
	 BAS7jKDIHGF/LPsR2yczX6gIkhuLCOBEr+bcDu0w3qNZ//7d5j2rkSmbPSfEl3ofAP+nc
	 nFN3HbMgKHU8O6EQD41uSf5zCRi1Gm+b9ikT3unz4O/GCPLBEIUh9GXCfoQUI2G6LNK6u
	 LDwFAZPPATsQ4xU0zxB5+clWSkTQy2TEDg+UjdLz92TIOTbP3ltOh6k3C2ruqRATmcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793368069;
	h=Received:Delivered-To:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=VhyVIvhP+I57EiJsaIO67oKgqnEOLFVZ2zuSKSjzhkk=;
	b=nxgFqSyPqkOInZKHZNIqMaInPaJVEQkU4qLR/xJr6J6WHJWqba19ESOCZ1M5KDr8CH2Z
	 mtn+X4lPiHINPvlS4fXRi/3R9M3uwy7YJ8V2KZ0wz8u9yaUmH+9h8WcI6SvZTHIZ/5awj
	 d1r4xHNOaOhSpJ9e0WgwwFNMP3TUScsgWfwNXhUr/4cUJcuKpzCWPbuFRPJnyIEHFHqcB
	 CwDELQsIKJF8jA1auwIAIOpJduwoBVp5V+C6CfJm/pa8/EWjZtCaIAu+jaShPFKeJtUI+
	 5We3ZyNAd+O94JuyMrOjSjO9W9iFyrnJhVkxJxFkAqbED9QkUeeatMz9zjWSU7rAcFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KJPdL27e;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E7D606A31C
	for <tools@linux.kernel.org>; Fri, 30 Oct 2026 13:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KJPdL27e
Received: by smtp.kernel.org (Postfix)
	id D91FB1F00A27; Fri, 30 Oct 2026 13:47:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E0191F00A21;
	Fri, 30 Oct 2026 13:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793368068;
	bh=VhyVIvhP+I57EiJsaIO67oKgqnEOLFVZ2zuSKSjzhkk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KJPdL27eXFLZ1fa2fXWZqHiELaJXhSKQeaI65WZ+7iB1RvhzyHEN6IgURbwqDcNP4
	 t9Fvd8bGQmZ8b4s83UHzIQ3ai6d0Hslg2YMQiDRNxTkyjwT2OMUxOISX2Arsobt9HX
	 ITiDvSxQP3PCRrvwnjNGSPm+BRmFytJyouxEQ6+Wi80llzFn6Vka2naJmSlJ+SeBPH
	 /QUu1/NZhj4gPh16I5kxDPFeNvCcZeKAwG5LW1c0J6Jz4nMkflG4OytCqiIbNdub9R
	 elLY02G6Nvp+zqVmtcoxVfXyExQRwhIELLMJNRP6dCj1j1iipNxqs31JZfJanRMNVH
	 cabuZ/EVJWN9w==
From: Brian Masney <masneyb@kernel.org>
Date: Fri, 30 Oct 2026 09:47:30 -0400
Subject: [PATCH b4 v2 3/3] review: tests: add tests for the patchwork key
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-pw-key-command-v2-3-95fb0f822834@kernel.org>
References: <20261030-pw-key-command-v2-0-95fb0f822834@kernel.org>
In-Reply-To: <20261030-pw-key-command-v2-0-95fb0f822834@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Brian Masney <masneyb@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5587; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=OWaX9zsTdcyHU3dyJ9s2Er3vS3/JXVUxuLN2IA5VdVY=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLKeLGCcfdg4YRXbzXT+2+fCvito795cLPX09N6dzzhTo
 yzr1FQ9OkpZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZgIvw0jw+0OEZPfnS3hc39t
 49RnYvoS/mJ5P5P1qzRuQb0rk05fq2FkOCgUkiSVYDNlwq+IGdqe9648OZad8WLyoZI6DaYZL64
 WsgEA
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Add tests for the various ways that the patchwork key can be provided.

Assisted-by: LLM
Signed-off-by: Brian Masney <masneyb@kernel.org>
---
 src/tests/test___init__.py | 114 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/src/tests/test___init__.py b/src/tests/test___init__.py
index 764829d7e756..5d5c9dd3836b 100644
--- a/src/tests/test___init__.py
+++ b/src/tests/test___init__.py
@@ -2924,3 +2924,117 @@ class TestGetAmMessageFromLines:
         lines = payload.decode().splitlines()
         assert 'From the manual, bar() must be called here.' in lines
         assert '>From an old thread.' in lines
+
+
+class TestGetPwKey:
+    """b4.pw-user fetches the Patchwork key from git credential helpers."""
+
+    @pytest.fixture(autouse=True)
+    def _clear_cache(self, monkeypatch: pytest.MonkeyPatch) -> None:
+        monkeypatch.setattr(b4, '_PW_KEY_CACHE', {})
+        # Never fall back to prompting on the terminal
+        monkeypatch.setenv('GIT_TERMINAL_PROMPT', '0')
+        monkeypatch.delenv('GIT_ASKPASS', raising=False)
+        monkeypatch.delenv('SSH_ASKPASS', raising=False)
+
+    @staticmethod
+    def _set_helper(
+        monkeypatch: pytest.MonkeyPatch, tmp_path: pathlib.Path, body: str
+    ) -> pathlib.Path:
+        """Replace all credential helpers with a script that runs body."""
+        helper = tmp_path / 'helper.sh'
+        helper.write_text(f'#!/bin/sh\necho "$@" >> {tmp_path}/calls\n{body}\n')
+        helper.chmod(0o755)
+        count = int(os.environ.get('GIT_CONFIG_COUNT', '0'))
+        # An empty value resets any helpers from the user's own config
+        for i, val in enumerate(('', f'!{helper}')):
+            monkeypatch.setenv(f'GIT_CONFIG_KEY_{count + i}', 'credential.helper')
+            monkeypatch.setenv(f'GIT_CONFIG_VALUE_{count + i}', val)
+        monkeypatch.setenv('GIT_CONFIG_COUNT', str(count + 2))
+        return tmp_path / 'calls'
+
+    def test_plain_key(self) -> None:
+        assert b4.get_pw_key({'pw-key': 'secret'}) == 'secret'
+
+    def test_unset(self) -> None:
+        assert b4.get_pw_key({}) == ''
+
+    def test_no_user(
+        self, monkeypatch: pytest.MonkeyPatch, tmp_path: pathlib.Path
+    ) -> None:
+        """Without pw-user, credential helpers are never asked."""
+        calls = self._set_helper(monkeypatch, tmp_path, 'echo password=nope')
+        assert b4.get_pw_key({'pw-url': 'https://pw.example.org/'}) == ''
+        assert not calls.exists()
+
+    def test_key_wins(
+        self, monkeypatch: pytest.MonkeyPatch, tmp_path: pathlib.Path
+    ) -> None:
+        calls = self._set_helper(monkeypatch, tmp_path, 'echo password=nope')
+        config: b4.ConfigDictT = {
+            'pw-key': 'secret',
+            'pw-user': 'me',
+            'pw-url': 'https://pw.example.org/',
+        }
+        assert b4.get_pw_key(config) == 'secret'
+        assert not calls.exists()
+
+    def test_credential_helper(
+        self, monkeypatch: pytest.MonkeyPatch, tmp_path: pathlib.Path
+    ) -> None:
+        req = tmp_path / 'request'
+        self._set_helper(
+            monkeypatch, tmp_path, f'cat > {req}\necho password=fromhelper'
+        )
+        config: b4.ConfigDictT = {
+            'pw-user': 'me',
+            'pw-url': 'https://pw.example.org:8443/',
+        }
+        assert b4.get_pw_key(config) == 'fromhelper'
+        request = req.read_text().splitlines()
+        assert 'protocol=https' in request
+        assert 'host=pw.example.org:8443' in request
+        assert 'username=me' in request
+
+    def test_credential_helper_runs_once(
+        self, monkeypatch: pytest.MonkeyPatch, tmp_path: pathlib.Path
+    ) -> None:
+        calls = self._set_helper(monkeypatch, tmp_path, 'echo password=key')
+        config: b4.ConfigDictT = {
+            'pw-user': 'me',
+            'pw-url': 'https://pw.example.org/',
+        }
+        assert b4.get_pw_key(config) == 'key'
+        assert b4.get_pw_key(config) == 'key'
+        assert calls.read_text().count('get') == 1
+
+    def test_credential_helper_empty(
+        self,
+        monkeypatch: pytest.MonkeyPatch,
+        tmp_path: pathlib.Path,
+        caplog: pytest.LogCaptureFixture,
+    ) -> None:
+        self._set_helper(monkeypatch, tmp_path, 'true')
+        config: b4.ConfigDictT = {
+            'pw-user': 'me',
+            'pw-url': 'https://pw.example.org/',
+        }
+        with caplog.at_level(logging.CRITICAL, logger='b4'):
+            assert b4.get_pw_key(config) == ''
+        assert 'No patchwork key for me@pw.example.org' in caplog.text
+
+    def test_bad_url(self, caplog: pytest.LogCaptureFixture) -> None:
+        config: b4.ConfigDictT = {'pw-user': 'me', 'pw-url': 'pw.example.org'}
+        with caplog.at_level(logging.CRITICAL, logger='b4'):
+            assert b4.get_pw_key(config) == ''
+        assert 'Could not parse pw-url' in caplog.text
+
+    def test_ignored_in_worktree_config(self, gitdir: str) -> None:
+        """A cloned tree's .b4-config must not get to ask for credentials."""
+        wtcfg = pathlib.Path(gitdir) / '.b4-config'
+        wtcfg.write_text(
+            '[b4]\n\tpw-user = stolen\n\tpw-url = https://pw.example.org\n'
+        )
+        b4._setup_main_config(topdir=gitdir)
+        assert b4.MAIN_CONFIG.get('pw-url') == 'https://pw.example.org'
+        assert b4.MAIN_CONFIG.get('pw-user') is None

-- 
2.56.0

