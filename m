Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793368068;
	b=pL/OPx1ywDstBAC0W4FXxwQEyWk10vxK542ZzYWkcmjXI0+YH+6AUl3BTKwJbg6Sd3Y2
	 /Zdz7zykRTix8UHEefVtd9yd6yji7bRlGsrLv2jTrE46q7dwBvH5CNwj2dHVPuTQcXtkg
	 krv1gQY1aU39K2W0eRMR4yFCJwUPDkgOygoaLOJDOIyhVihtOQ9JrR3JwAGJy+0AZ+GaL
	 EfyfM7vi82AwXtj9LN1QfBxHuiZbK6rfhNMpXieUHCjCMBOKnVK2YEzHXZspiIBkSBs1C
	 jzd/pFn7Q1MAVPFcNzcCW+O2otSFTxVIUrJRz7FmvuwTBySMoybI+IKH6LZ3WnEqA/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793368068;
	h=Received:Delivered-To:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=gSyoQRVRWq3nJPZlOOvIXW35/8rRdHczQvRCI5n++Rc=;
	b=vv3TdMIe0Zlwjcwk722oh+Sc2h0X0ZjEQffLMbPSwu2SQp7U0X04yhLYdcIAn87D/8fx
	 L+q4nJdAmaYCxuT3EE5d1YbzEJpdGJu6zjyufABlLiohtTbq7yqiFtmObdtRaY2tdDlaX
	 s4z4ZSy++S5DPtGzxeQlKS+x3KZn2GlRKP3sbyT84mbooJsnAUZGj1FwLTLKLJeHvoSkb
	 +tCXjI3HrVit9m7cEMvYOLrz2o9V7SMknTx9J/weIrFb8ChbS8yruRhFW/oq+KD+SX4u0
	 1zvcXiXKyQ2/IXsa4RMMqY4hxy284bk8EitGAm+xhepY8R/yXa0z6z4CXs86XahlOXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=osyLmZ2l;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343F3606A31C
	for <tools@linux.kernel.org>; Fri, 30 Oct 2026 13:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=osyLmZ2l
Received: by smtp.kernel.org (Postfix)
	id 26E8F1F00A02; Fri, 30 Oct 2026 13:47:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 944BE1F0093A;
	Fri, 30 Oct 2026 13:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793368068;
	bh=gSyoQRVRWq3nJPZlOOvIXW35/8rRdHczQvRCI5n++Rc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=osyLmZ2lNzJr5EZac15591BcPcSh5WxvhaAOI5Stph99B5ZDKkXR7A4Kt33u7z3HF
	 yEzq422N9E1QmDMAlTugro7M5NVzTnkj+RcauG+qpyzrTOWPhNHXveNNDwklaLAPWl
	 ahGMeOACIByn8ts8ZxHrAD62N5G0vLeAO2QSyEuJcg6ZqLV900e9eYs4T/OYX6YvRt
	 RSm9Du0Q+VqnLH/RfMeYVXhCZUSXh5Q8LOQ8ZzE/D2hCC4NXo1vXPEawysx3UPCT9J
	 HRfXYne2V/9loJAH3mFtJfz8TNU93X9VeFPCB+o/9+9xN17LXyqZ+QeqzTZ4i+6cYB
	 DzRSWLCtuf8QQ==
From: Brian Masney <masneyb@kernel.org>
Date: Fri, 30 Oct 2026 09:47:29 -0400
Subject: [PATCH b4 v2 2/3] review: add support for fetching patchwork key
 via git credentials
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
Message-Id: <20261030-pw-key-command-v2-2-95fb0f822834@kernel.org>
References: <20261030-pw-key-command-v2-0-95fb0f822834@kernel.org>
In-Reply-To: <20261030-pw-key-command-v2-0-95fb0f822834@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Brian Masney <masneyb@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5230; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=0WBFYAdOXspLUme8tnOpu0hSWAK0Yt8I5TobPGP7sJk=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLKeLGCY+7V177Lthgfv7Ts6kzXYufTeS87YdaVTmubkL
 +QV+6Bi0lHKwiDGxSArpsiyJNeoICJ1le29O5osMHNYmUCGMHBxCsBErh5k+F+cer5iQeOvd4ox
 uoX/jOO13V3dsrxNe6R3fCieduJAsBvD/1gZ42uLW/OE0gOmzdgzQTLSatLe2dOm+E3fcjho7wM
 XDyYA
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Introduce a b4.pw-user and support for fetching the patchwork key via
git credentials.

Assisted-by: LLM
Signed-off-by: Brian Masney <masneyb@kernel.org>
---
 docs/config.rst    | 29 +++++++++++++++++++++++++++++
 src/b4/__init__.py | 48 +++++++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 74 insertions(+), 3 deletions(-)

diff --git a/docs/config.rst b/docs/config.rst
index 593129e8ae70..7087883c0a22 100644
--- a/docs/config.rst
+++ b/docs/config.rst
@@ -1022,6 +1022,35 @@ integrate your b4 workflow with patchwork.
 
      Default: ``None``
 
+   :term:`b4.pw-user`
+     Your username on the patchwork server. When this is set and
+     :term:`b4.pw-key` is not, b4 asks your git credential helpers for the
+     password of this user on the :term:`b4.pw-url` host, and uses it as
+     the API key. This lets you keep the key in a password manager instead
+     of storing it in plain text in your git config. b4 asks at most once
+     per invocation. For example::
+
+         pw-url = https://patchwork.kernel.org/
+         pw-user = jdoe
+
+     To store the key with a credential helper that supports it::
+
+         printf 'protocol=https\nhost=patchwork.kernel.org\nusername=jdoe\npassword=%s\n' \
+             "$PW_API_KEY" | git credential approve
+
+     You can also inject the key via a password manager by placing the following
+     in your .gitconfig:
+
+        [credential "https://user@patchwork.kernel.org"]
+        helper = "!f() { echo password=$(pass korg-patchwork-token); }; f"
+
+     If no helper returns a password, git may prompt for one on the
+     terminal. This setting is ignored in the in-tree ``.b4-config`` file.
+
+     Default: ``None``
+
+     .. versionadded:: v0.17
+
 .. _contributor_settings:
 
 Contributor-oriented settings
diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 16b7208f0b09..045e5f6e7b08 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -392,6 +392,8 @@ LORENODE: Optional[liblore.LoreNode] = None
 URL_SERVERS: Dict[str, Tuple[str, bool]] = dict()
 # Indicates that we've cleaned cache already
 _CACHE_CLEANED = False
+# Patchwork API keys returned by git credential helpers, keyed by (url, user)
+_PW_KEY_CACHE: Dict[Tuple[str, str], str] = dict()
 # DNS answers for the life of the process (see _setup_dns_resolver)
 _DNS_CACHE = dns.resolver.LRUCache()
 # Used to track send-email alias replacements
@@ -5000,6 +5002,11 @@ def _setup_main_config(
         'trailer*',
         'pw-*',
     ]
+    # Never take these from an in-tree .b4-config: they are personal and
+    # they make b4 ask git credential helpers for a secret.
+    wtdeny = [
+        'pw-user',
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
@@ -6403,13 +6413,45 @@ def get_smtp(
 
 
 def get_pw_key(config: Optional[ConfigDictT] = None) -> str:
-    """Return the Patchwork API key from b4.pw-key.
+    """Return the Patchwork API key.
 
-    Returns an empty string when no key is configured.
+    Use b4.pw-key when it is set.  Otherwise, if b4.pw-user is set, ask the
+    git credential helpers for the password of that user on the b4.pw-url
+    host, so the key can live in a password manager instead of the git
+    config.  The result is cached for the life of the process, so the
+    helpers are asked at most once.  Returns an empty string when no key is
+    configured or the lookup fails.
     """
     if config is None:
         config = get_main_config()
-    return str(config.get('pw-key', '') or '')
+    pwkey = str(config.get('pw-key', '') or '')
+    pwuser = str(config.get('pw-user', '') or '')
+    pwurl = str(config.get('pw-url', '') or '')
+    if pwkey or not (pwuser and pwurl):
+        return pwkey
+
+    cachekey = (pwurl, pwuser)
+    if cachekey in _PW_KEY_CACHE:
+        return _PW_KEY_CACHE[cachekey]
+
+    parsed = urllib.parse.urlparse(pwurl)
+    if parsed.scheme and parsed.netloc:
+        logger.debug('Asking git credential helpers for the patchwork key')
+        gc_pass = git_credential_fill(
+            None, protocol=parsed.scheme, host=parsed.netloc, username=pwuser
+        )
+        pwkey = gc_pass or ''
+        if not pwkey:
+            logger.critical(
+                'No patchwork key for %s@%s from git credential helpers',
+                pwuser,
+                parsed.netloc,
+            )
+    else:
+        logger.critical('Could not parse pw-url: %s', pwurl)
+
+    _PW_KEY_CACHE[cachekey] = pwkey
+    return pwkey
 
 
 def get_patchwork_session(pwkey: str, pwurl: str) -> Tuple[requests.Session, str]:

-- 
2.56.0

