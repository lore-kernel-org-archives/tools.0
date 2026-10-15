Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D539257ACF
	for <tools@linux.kernel.org>; Thu, 15 Oct 2026 14:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792073336; cv=none; b=d20lCPPG+LjeZwKmy0huS1pzggIK0dKXG8p8D56xiganYahatEaqhUmB/eq7FsGNI06rhoNhqqhNBsGSqne4BZGnJ6GQGH/VA73tm1VaXYxfWwILwxHSo7r0hD2SI83+yCmzQ+vBxZr+eqn1knmULxxarMcww73c1eicKShgLVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792073336; c=relaxed/simple;
	bh=E1Fr2YlQ6XejzuBMdR/uczS3eJqLXoRnGCIJJi5yIQU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ElsY3JJ9rvs9DuKNjM3GhBQVlYKedIQWmjtbUzGWS0/izUFNYe8tniSPyL9k2y8LD348raPo5Q4jPB6q4Df226IoeA9Xy8bPQIq8jCyMuHQFa5l7HGhjoPKvVF/x5MF0sveu1DjdlV5OD83EE+xwW9WF+OvHBsEGS3FtxLOT+Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ag2D6Dha; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ag2D6Dha"
Received: by smtp.kernel.org (Postfix)
	id 0A2F71F000C4; Thu, 15 Oct 2026 14:08:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C70B81F000C7;
	Thu, 15 Oct 2026 14:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792073334;
	bh=n1dFrT0vE70fg1uWWVQvdhSEwkRcgkjY9fcwBceWVrA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ag2D6Dhalv4MBTwZbxPgJIQJLJZNh8c+ssAYygOOjvuyiO71UDgVQmxxantqfI2He
	 f4n0BQjHSRBryT9cYHYpaoNMDICedeQCmQCeZ3HrvN6HOAqePIU36vtGzXRuAklu7D
	 zwzJSLChmCKN4/YKjrnE643l+lUfcv0VtQuYg5Z/U2bFtv3YmmJ6rXpV4t5Sn0mvN3
	 waIz5Sg1GdKTGwmqx1vyu9loHUGfHI2aYWTD/uy8d+Y6JZ7JQRa8CTiWLT3GkTV57c
	 9w2bS0rDSbluB1ajMokIolmvmcRmujvBNkm2DlTWjO+J0vU8PuYpcxw2rY1zdQndYy
	 C0NOt+KO+HcLA==
From: Brian Masney <masneyb@kernel.org>
Date: Thu, 15 Oct 2026 10:08:42 -0400
Subject: [PATCH b4 2/3] review: introduce support for b4.pw-key-command
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-pw-key-command-v1-2-6daa9b8cee2a@kernel.org>
References: <20261015-pw-key-command-v1-0-6daa9b8cee2a@kernel.org>
In-Reply-To: <20261015-pw-key-command-v1-0-6daa9b8cee2a@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Brian Masney <masneyb@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4989; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=E1Fr2YlQ6XejzuBMdR/uczS3eJqLXoRnGCIJJi5yIQU=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLIu3Cv6Imho5n5W0rTqnl1Z+CnNuh1HfZySLncfzdSW5
 JTu2yjZUcrCIMbFICumyLIk16ggInWV7b07miwwc1iZQIYwcHEKwERW3GNk+KR/bfLbdXq1RV9P
 LdsWF3o4l0Uq37NHctXfaK64nyXLZBkZrhcuSwgo2PaxtLkjRWDGibh7DDUrCxdbvK6YMHHXckF
 bHgA=
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Add support for b4.pw-key-command which is a command to run to obtain
the patchwork API key, so it can be kept in a password manager instead
of being stored in plain text in your git config. The first line of the
command's output is used as the key. The command is not run through a
shell, and it runs at most once per b4 invocation. When set, it takes
precedence over b4.pw-key.

Assisted-by: LLM
Signed-off-by: Brian Masney <masneyb@kernel.org>
---
 docs/config.rst    | 16 ++++++++++++++++
 src/b4/__init__.py | 45 ++++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 58 insertions(+), 3 deletions(-)

diff --git a/docs/config.rst b/docs/config.rst
index 593129e8ae70..29f82a76f014 100644
--- a/docs/config.rst
+++ b/docs/config.rst
@@ -990,6 +990,22 @@ integrate your b4 workflow with patchwork.
 
      Default: ``None``
 
+   :term:`b4.pw-key-command`
+     A command to run to obtain the patchwork API key, so it can be kept
+     in a password manager instead of being stored in plain text in your
+     git config. The first line of the command's output is used as the
+     key. The command is not run through a shell, and it runs at most
+     once per b4 invocation. When set, it takes precedence over
+     :term:`b4.pw-key`. For example::
+
+         pw-key-command = pass show patchwork/api-key
+
+     This setting is ignored in the in-tree ``.b4-config`` file.
+
+     Default: ``None``
+
+     .. versionadded:: v0.17
+
    :term:`b4.pw-project`
      The name of the patchwork project, exactly as seen in the URL
      sub-path. For example::
diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 16b7208f0b09..1014815d4d33 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -392,6 +392,8 @@ LORENODE: Optional[liblore.LoreNode] = None
 URL_SERVERS: Dict[str, Tuple[str, bool]] = dict()
 # Indicates that we've cleaned cache already
 _CACHE_CLEANED = False
+# Patchwork API keys returned by pw-key-command, keyed by the command
+_PW_KEY_CACHE: Dict[str, str] = dict()
 # DNS answers for the life of the process (see _setup_dns_resolver)
 _DNS_CACHE = dns.resolver.LRUCache()
 # Used to track send-email alias replacements
@@ -5000,6 +5002,11 @@ def _setup_main_config(
         'trailer*',
         'pw-*',
     ]
+    # Never take these from an in-tree .b4-config: they run commands
+    # outside of any check flow, so a cloned tree could run anything.
+    wtdeny = [
+        'pw-key-command',
+    ]
     multivals = [
         'keyringsrc',
         'am-perpatch-check-cmd',
@@ -5015,6 +5022,9 @@ def _setup_main_config(
             wtconfig = get_config_from_git(r'b4\..*', multivals=multivals, source=wtcfg)
             logger.debug('wtcfg=%s', wtconfig)
             for key, val in wtconfig.items():
+                if key in wtdeny:
+                    logger.debug('wtcfg: ignoring %s', key)
+                    continue
                 if key in multivals:
                     val = [_val_to_path(topdir, x) for x in val]
                 else:
@@ -6403,13 +6413,42 @@ def get_smtp(
 
 
 def get_pw_key(config: Optional[ConfigDictT] = None) -> str:
-    """Return the Patchwork API key from b4.pw-key.
+    """Return the Patchwork API key.
 
-    Returns an empty string when no key is configured.
+    If b4.pw-key-command is set, run it and use the first line of its
+    output, so the key can live in a password manager instead of the git
+    config.  The result is cached for the life of the process, so the
+    command runs at most once.  Otherwise, fall back to b4.pw-key.
+    Returns an empty string when no key is configured or the command fails.
     """
     if config is None:
         config = get_main_config()
-    return str(config.get('pw-key', '') or '')
+    cmdstr = config.get('pw-key-command')
+    if not cmdstr:
+        return str(config.get('pw-key', '') or '')
+
+    cmdstr = str(cmdstr)
+    if cmdstr in _PW_KEY_CACHE:
+        return _PW_KEY_CACHE[cmdstr]
+
+    pwkey = ''
+    try:
+        cmdargs = shlex.split(cmdstr)
+        logger.debug('Running pw-key-command: %s', cmdargs[0] if cmdargs else '')
+        # Leave stdin and stderr alone so password managers can prompt
+        sp = subprocess.run(cmdargs, stdout=subprocess.PIPE, check=False)
+        if sp.returncode != 0:
+            logger.critical('pw-key-command exited with status %s', sp.returncode)
+        else:
+            lines = sp.stdout.decode(errors='replace').splitlines()
+            pwkey = lines[0].strip() if lines else ''
+            if not pwkey:
+                logger.critical('pw-key-command returned no output')
+    except (OSError, ValueError) as ex:
+        logger.critical('Could not run pw-key-command: %s', ex)
+
+    _PW_KEY_CACHE[cmdstr] = pwkey
+    return pwkey
 
 
 def get_patchwork_session(pwkey: str, pwurl: str) -> Tuple[requests.Session, str]:

-- 
2.55.0

