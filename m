Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794380367;
	b=3DcvdXNAB/o+raspXK5axDbpNrZGFko7+u8TvMcgV4ClADMRDrSAsTKfoy80ZkLIuvFE
	 75FM5j3kZmavTtQhz6KQJmzDhEWX+NF0nuEcJ7+P90dlcW4Fk11csb4jMYqqPycYScPB4
	 IRVNxtiuqD5vsLw9XV6E+qaf8t467kr+SQn3iKqJEO/4+fRQp3xXeG2ygxJ7kh7aiH/C+
	 HwHOwLgCxMZSAIscL6SVpA8czp3C6uFaCBbvFZqiUXrIp2Uwx823mYzZMmIIF77Kb7q6x
	 KrjKzEPTkaRvBBReHx80nrf/lcWr5XuxIsa19iCuYF3aa9lX1macw/DKpbR+ke3Tc+A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794380367;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=EdAc8l/B4kIgtpADafqEbOpAG542loTRNWtrF6zUASs=;
	b=C9nEGEZR+xpnHi/TnoD2FY2zL319k97WiMe8dMjeMkz8KyRZaGgWzO8IZXurOc64cu7y
	 62sbamG3Zhh8Z/lacu7aJiqgjgJxPneCoGxDXQLME3RnYI+TZfyL6EZra20lZta2W9abd
	 AGnDycp6DuDW7BPkpCndv7gUpaa5GZxR6u4Al1WmFuPK12Kispg/5McUpPtTBw/+y/bPH
	 +CqqY77fH7go1vGxqP2KBctZi33zPyYz9qD1NQu+TcTHk3W7O/cZpzthiTurrFMZn42xE
	 CHxxKvOgEj4fJabrP/fVaSQye+JdLRHkBK1zNNIQ8mUjajnQZ6wip1gTo5T2+cPM46w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZHQzUXEJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D0B606A321
	for <tools@linux.kernel.org>; Wed, 11 Nov 2026 06:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZHQzUXEJ
Received: by smtp.kernel.org (Postfix)
	id 1D57E1F00A09; Wed, 11 Nov 2026 06:59:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794380367;
	b=VDuR96KqvC1cZ0ehuj6E/1pSYrkCSBeCRxBbk3Z+a1uSXYqqFReHajBuZxoPI6BAJKIy
	 WMdI6BI74bzVFbb73PtuQ67h9+/UWKKdg9nXj9f1eVhJCEOCCQ1hozhXGaMVWmUGLcy8o
	 8lxwH6KjOAY+9ekE4stDXBeRl5ltxsZ/gdmUZFnjIfycO3xgoz9PHxH0lxDJ9Ae0dbdQV
	 WQdZDm8mVfGv4aGzMh8njCmhTsbtxKgpplkwz1OVNEogWqJoZYwNtX3MPeBK0sskZBzwZ
	 qi/OcoEsjg85u0RaZP/K/9kCEqVosZavsNE+lte/ZL3nMwXwkNUz0mXqwC6Yqd6UgPQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794380367;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=EdAc8l/B4kIgtpADafqEbOpAG542loTRNWtrF6zUASs=;
	b=Tg0xaaQzeVuXmh84OmCMNf6LmVpBjP309NjZmUCcsaD2PTr7uLh+oTPPvaAzPR2ttsws
	 PagROpHC2Rb6noqd+v7l7DleDvrfTUPyTHTGcG0QwjryW4rIjgtRF/Z28SnwxYfByI/CC
	 +nWrjg2hm0rHdBcFi2uLegcPDoaAAUdv8aEZRdMfoSEfXk3KlLkZ0w5znWClV00i5Yj/W
	 otIuBsbQo2zPlyuqRzhW/45Rvq3W7+b1Re4hUV/MMdOgCCzKKEQpohqYaY1I324EV2F/H
	 A+mzIU/LZ+oioW/KUdyAXvu4PxsjeRQBWUmIHsgcRmORmhNuIQxkitcgWq+kywylJfw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZHQzUXEJ;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 091C71F00A07
	for <tools@kernel.org>; Wed, 11 Nov 2026 06:59:24 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZHQzUXEJ
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 091C71F00A07
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b244fb7fffso3534845c88.1
        for <tools@kernel.org>; Tue, 10 Nov 2026 22:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794380364; x=1794985164; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EdAc8l/B4kIgtpADafqEbOpAG542loTRNWtrF6zUASs=;
        b=ZHQzUXEJSZkXd0v+hHc5nEfCBf0mLiCzUHpEk5Gq5gPuFJ12S1GNFRinszVw27E9Hl
         7n92Gk2T9Yh8nvHIJY3MQtOVaaN0RZRGUduaf1a3MJAu579Jyvjw0UyZNs/ctKpHm1ut
         t2HTf8kVwWxTyhKtdFNmbh7Yn/D044INeDHwUFrFlWpa9maxZaRnUZT3dDdFvjpAdihr
         kd8S53QmuVUYvJxm+URXpqYi4nkMiRs9PyX57tbFN+hbsBEPIvxyfu1r2ehCDCFnSU0+
         541jeqEmMpZbMRes9isXDZg9/vIT5v3YLHiPh2vQuBYqu+4N+Mj5OolxZRdxGk35Oo0J
         U+7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794380364; x=1794985164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EdAc8l/B4kIgtpADafqEbOpAG542loTRNWtrF6zUASs=;
        b=eMbZUZiCvJB+WpPNMvJ+uUPmgMlx6eVuWJDd+xelOf9PISGw89sD938y90RTZvLI+M
         hjxaPmyzgKnsnTcEKW5zHkY8I+Pioi0TIFY2nLIvMheQUpUXIP5YQnI1uxMiXKE2o+vB
         7S3trZwdnfWhbLPO097dfNV2VsDNaJlXFy60mkaAGq1RUT0Py8f9PrmHveZoyxY8Ki7x
         s/gvCsHo2dd6GEw0dzxcxa+lzMA1n3KaR0sEQenEk6fixBMk9JWYv66s3TXAMx8664zH
         vSNki9nqRyqkd+rbBbTEgE1RYV8bpAl6sZblQhQLzoN/AkOUcMrkg/Y1sSowCtqwu1l2
         +vLQ==
X-Gm-Message-State: APuU4Z+i6cwerOzYPRW0dsf+I62S3UHTD6Pg62FtjzNfaBOQqcIai9Xn
	ljMeaQG1G4ROmlLfRyFUcHGzd5qRjfOeADx1txUKfO4kRCdwogTcwlOmTHi95w==
X-Gm-Gg: AYBFou359l82nR2fur/dMa/sigYk8edSRq+NqrOJPAvtjp114HiHDhldbaxxhOX+82s
	wZY+/8YyvzM6GBmQFir/ODzsXtFQPe3rnnLFjuxoh9v2NKBCWqieSlqaTYxCY/j4vqg5ZhysbqP
	I3hHoscSrtSWtKPv1D+DyW6uZzHAfTmmuUqqBNN3HL8OTubOComfs6JPI7Vh5oUgFsX83MKSTe8
	6WJtE2xsMJ4cbyhiuSfA2vCa4sOeWMwbbWBQsOgnW6wsQMZ5h7FpDlTqHA4lBXX0hDoYyRQGZNM
	J/gBtLac28CFl8xcaGM9AWfdC9h01TS02v6UdOMGudXxmf7YvNgJFrGC1j1T8S+/5MwZiMemb9a
	0ounymMyxw4jBqq0GEcyLpqm/9S+D5qSR1O/on5OLGmXua/1SX0XWjju0GWIdlFjaXvca+brYlG
	ohyNCfoXy3dKIb0ZLv9IQM4mkIaqDptLvA+7lp2/xQRkOHq2PmUwKRahwzF/ns7kxSiSYnR8cRx
	aPYiarYUSDADC4ziFiGE/qM5cAtvjLxWAY2SkRaQvz/1nFsnC+OZ2rCao8Ak3ultgJ1R6FZYgoG
	IMo9/snMWZNhlrnQZMluhMSaPorzYq13OyzDw3ZC7nIyaIi2SEk0sgjto8Xx+R7oMGSqU5ESXP4
	YbYzpBH6QCsHsgIclGg==
X-Received: by 2002:a05:7022:7e01:b0:1b2:588e:f89b with SMTP id a92af1059eb24-1b3c036396emr1902118c88.47.1794380363890;
        Tue, 10 Nov 2026 22:59:23 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:311a:ad7a:93f8:96c8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890e04sm12859018c88.2.2026.11.10.22.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:59:23 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 10 Nov 2026 22:59:19 -0800
Subject: [PATCH kgl 2/2] Add token_command support for Gmail targets
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
Message-Id: <20261110-token-command-v1-2-a089145494d3@gmail.com>
References: <20261110-token-command-v1-0-a089145494d3@gmail.com>
In-Reply-To: <20261110-token-command-v1-0-a089145494d3@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.17-dev-e56a4

Add support for obtaining Gmail OAuth access tokens from an external
command via the token_command configuration setting on Gmail targets.

This enables integrating with system token managers, secret stores, or
command-line helpers without needing Google OAuth client secrets or
running interactive OAuth login flows in a browser.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 docs/configuration.rst        |  10 +++-
 korgalore-example.toml        |   2 +
 man/korgalore.toml.5          |  12 ++++-
 src/korgalore/cli.py          |  12 ++++-
 src/korgalore/gmail_target.py |  27 +++++++---
 src/korgalore/google_creds.py | 111 +++++++++++++++++++++++++++++++++++++++-
 tests/test_cli_misc.py        | 103 +++++++++++++++++++++++++++++++++++++-
 tests/test_gmail_target.py    |  35 +++++++++++--
 tests/test_google_creds.py    | 114 ++++++++++++++++++++++++++++++++++++++++--
 9 files changed, 404 insertions(+), 22 deletions(-)

diff --git a/docs/configuration.rst b/docs/configuration.rst
index fbba776..734ab26 100644
--- a/docs/configuration.rst
+++ b/docs/configuration.rst
@@ -410,9 +410,17 @@ Gmail Target Parameters
 ~~~~~~~~~~~~~~~~~~~~~~~~
 
 * ``type``: Must be ``'gmail'``
-* ``credentials``: Path to the OAuth credentials JSON file
+* ``credentials``: Path to the OAuth credentials JSON file (required unless
+  ``token_command`` is specified)
 * ``token``: (Optional) Path to store the OAuth token. Defaults to
   ``~/.config/korgalore/gmail-{identifier}-token.json``
+* ``token_command``: (Optional) External command that prints a valid OAuth2
+  bearer token to stdout. Mutually exclusive with both ``credentials`` and
+  ``token``. The command string is split using standard command-line syntax
+  and executed directly without a shell, with tilde and environment variable
+  expansion. The bearer token returned by the command must carry the OAuth
+  scopes required by korgalore (``https://www.googleapis.com/auth/gmail.labels``
+  and ``https://www.googleapis.com/auth/gmail.insert``).
 
 Maildir Target Parameters
 ~~~~~~~~~~~~~~~~~~~~~~~~~~
diff --git a/korgalore-example.toml b/korgalore-example.toml
index b7d8164..0551bc4 100644
--- a/korgalore-example.toml
+++ b/korgalore-example.toml
@@ -3,6 +3,8 @@
 [targets.personal]
 type = 'gmail'
 credentials = '/path/to/personal-credentials.json'
+# Alternatively, obtain tokens from an external command:
+# token_command = 'oama access personal'
 
 [targets.work]
 type = 'gmail'
diff --git a/man/korgalore.toml.5 b/man/korgalore.toml.5
index f72d242..3d23a74 100644
--- a/man/korgalore.toml.5
+++ b/man/korgalore.toml.5
@@ -30,11 +30,21 @@ name and a type that determines which parameters are required.
 Must be \fI'gmail'\fR.
 .TP
 .B credentials
-Path to the OAuth credentials JSON file from Google Cloud Console.
+Path to the OAuth credentials JSON file from Google Cloud Console (required
+unless \fBtoken_command\fR is specified).
 .TP
 .B token
 (Optional) Path to store the OAuth token. Defaults to
 \fI~/.config/korgalore/gmail-<name>-token.json\fR.
+.TP
+.B token_command
+(Optional) External command to execute that prints an OAuth2 bearer token to
+stdout. Mutually exclusive with both \fBcredentials\fR and \fBtoken\fR.
+The command is split into arguments using standard command-line syntax and
+executed directly without a shell, with tilde and environment variable
+expansion. The bearer token must carry the OAuth scopes required by
+korgalore (\fIhttps://www.googleapis.com/auth/gmail.labels\fR and
+\fIhttps://www.googleapis.com/auth/gmail.insert\fR).
 .RE
 .PP
 .B Maildir Targets
diff --git a/src/korgalore/cli.py b/src/korgalore/cli.py
index 180906d..e98d4be 100644
--- a/src/korgalore/cli.py
+++ b/src/korgalore/cli.py
@@ -1948,6 +1948,9 @@ def auth(ctx: click.Context, target: str | None) -> None:
             ts = get_target(ctx, identifier)
             ts.connect()
             logger.info('Authenticated target: %s (type: %s)', identifier, target_type)
+        except (ConfigurationError, AuthenticationError, RemoteError) as e:
+            logger.error('Failed to authenticate target %s: %s', identifier, e)
+            raise click.Abort() from e
         except click.Abort:
             logger.error('Failed to authenticate target: %s', identifier)
             raise
@@ -2483,7 +2486,12 @@ def yank(ctx: click.Context, target: str | None, labels: tuple[str, ...], thread
         uploaded = 0
         failed = 0
 
-        ts.connect()
+        try:
+            ts.connect()
+        except (ConfigurationError, AuthenticationError, liblore.RemoteError) as e:
+            logger.critical('Failed to connect to target "%s": %s', target, e)
+            raise click.Abort() from e
+
         with click.progressbar(
             messages, label='Uploading thread', show_pos=True, file=progress_file(ctx.obj['hide_bar'])
         ) as bar:
@@ -2524,7 +2532,7 @@ def yank(ctx: click.Context, target: str | None, labels: tuple[str, ...], thread
             ts.connect()
             ts.import_message(raw_message, labels=labels_list)
             logger.info('Successfully uploaded message.')
-        except liblore.RemoteError as e:
+        except (ConfigurationError, AuthenticationError, liblore.RemoteError) as e:
             logger.critical('Failed to upload message: %s', str(e))
             raise click.Abort() from e
 
diff --git a/src/korgalore/gmail_target.py b/src/korgalore/gmail_target.py
index 3fd9f8b..868e148 100644
--- a/src/korgalore/gmail_target.py
+++ b/src/korgalore/gmail_target.py
@@ -11,7 +11,7 @@ from googleapiclient.discovery import Resource, build  # type: ignore[import-unt
 from googleapiclient.errors import HttpError  # type: ignore[import-untyped]
 
 from korgalore import AuthenticationError, ConfigurationError, RemoteError
-from korgalore.google_creds import OAuthFileCredentials
+from korgalore.google_creds import CommandCredentials, OAuthFileCredentials, parse_token_command
 from korgalore.message import RawMessage
 
 logger = logging.getLogger('korgalore')
@@ -53,8 +53,11 @@ class GmailTarget:
         Creates the Gmail API service object if not already connected.
 
         Raises:
-            ConfigurationError: If credentials file is not found during refresh.
+            ConfigurationError: If credentials file is missing or token_command
+                                cannot be executed.
             AuthenticationError: If OAuth token refresh or authentication fails.
+            RemoteError: If token_command fails, times out, or returns an
+                         invalid token.
         """
         if self.service is not None:
             return
@@ -201,11 +204,23 @@ def make_gmail_credentials(
         Configured credentials instance compatible with ``GmailTarget``.
 
     Raises:
-        ConfigurationError: If required configuration keys are missing or have
-                            invalid types.
+        ConfigurationError: If required configuration keys are missing,
+                            mutually exclusive, or invalid.
     """
-    if 'credentials' not in details:
-        raise ConfigurationError(f"No credentials file specified for Gmail target '{identifier}'.")
+    has_creds = 'credentials' in details
+    has_token = 'token' in details
+    has_cmd = 'token_command' in details
+
+    if has_cmd:
+        if has_creds or has_token:
+            raise ConfigurationError(
+                f"Gmail target '{identifier}' cannot specify both 'token_command' and 'credentials'/'token'."
+            )
+        command = parse_token_command(details['token_command'], f"Gmail target '{identifier}'")
+        return CommandCredentials(identifier=identifier, command=command)
+
+    if not has_creds:
+        raise ConfigurationError(f"Gmail target '{identifier}' must specify either 'credentials' or 'token_command'.")
 
     creds_raw = details['credentials']
     if not isinstance(creds_raw, str):
diff --git a/src/korgalore/google_creds.py b/src/korgalore/google_creds.py
index f1963bb..0818244 100644
--- a/src/korgalore/google_creds.py
+++ b/src/korgalore/google_creds.py
@@ -1,7 +1,9 @@
-"""Google credential providers for korgalore."""
+"""Google OAuth2 and command credential providers for korgalore."""
 
 import logging
 import os
+import shlex
+import subprocess
 from collections.abc import Sequence
 from pathlib import Path
 from typing import Any
@@ -13,7 +15,7 @@ from google.auth.transport.requests import Request
 from google.oauth2.credentials import Credentials
 from google_auth_oauthlib.flow import InstalledAppFlow  # type: ignore[import-untyped]
 
-from korgalore import AuthenticationError, ConfigurationError
+from korgalore import AuthenticationError, ConfigurationError, RemoteError
 
 logger = logging.getLogger('korgalore')
 
@@ -227,3 +229,108 @@ class OAuthFileCredentials(BaseCredentials):
             ) from e
         self._save_token()
         self.needs_auth = False
+
+
+def parse_token_command(command: Any, context: str) -> list[str]:
+    """Validate and parse a ``token_command`` value into an argument vector.
+
+    Args:
+        command: Raw configuration value expected to be a non-empty command string.
+        context: Human-readable caller label for error messages.
+
+    Returns:
+        Argument vector with tilde and environment variables expanded.
+
+    Raises:
+        ConfigurationError: If ``command`` is not a string, has invalid shell
+                            quoting, or splits into an empty argument list.
+    """
+    if not isinstance(command, str):
+        raise ConfigurationError(f"{context}: 'token_command' must be a string.")
+    try:
+        raw_args = shlex.split(command)
+    except ValueError as e:
+        raise ConfigurationError(f"Invalid 'token_command' syntax for {context}: {e}") from e
+    if not raw_args:
+        raise ConfigurationError(f"{context}: 'token_command' cannot be empty.")
+    return [os.path.expanduser(os.path.expandvars(arg)) for arg in raw_args]  # noqa: PTH111
+
+
+def run_token_command(command: Sequence[str], context: str, timeout: int = 30) -> str:
+    """Execute an external token helper and return its bearer token output.
+
+    Runs ``command`` directly without a shell and verifies that standard output
+    contains a single non-empty, whitespace-free token.
+
+    Args:
+        command: Argument vector passed directly to ``subprocess.run``.
+        context: Human-readable caller label for debug logs and errors.
+        timeout: Maximum execution time in seconds before failing.
+
+    Returns:
+        Stripped bearer token read from standard output.
+
+    Raises:
+        ConfigurationError: If the executable cannot be launched.
+        RemoteError: If the command times out, exits non-zero, or returns an
+                     empty or whitespace-containing token.
+    """
+    try:
+        res = subprocess.run(
+            command,
+            stdin=subprocess.DEVNULL,
+            capture_output=True,
+            text=True,
+            encoding='utf-8',
+            errors='replace',
+            timeout=timeout,
+            check=False,
+        )
+    except subprocess.TimeoutExpired as e:
+        raise RemoteError(f'token_command timed out after {timeout}s for {context}') from e
+    except OSError as e:
+        raise ConfigurationError(f'Failed to execute token_command for {context}: {e}') from e
+
+    err_msg = ''
+    if res.stderr:
+        logger.debug('token_command stderr for %s:\n%s', context, res.stderr)
+        lines = [line.strip() for line in res.stderr.splitlines() if line.strip()]
+        if lines:
+            err_msg = f': {lines[-1]}'
+
+    if res.returncode != 0:
+        raise RemoteError(f'token_command for {context} failed with exit code {res.returncode}{err_msg}')
+
+    token = res.stdout.strip()
+    if not token or any(c.isspace() for c in token):
+        raise RemoteError(f'token_command for {context} returned empty or invalid token{err_msg}')
+
+    return token
+
+
+class CommandCredentials(BaseCredentials):
+    """Credentials obtained by executing an external token command."""
+
+    def __init__(self, identifier: str, command: Sequence[str]) -> None:
+        """Initialize command-backed bearer credentials.
+
+        Args:
+            identifier: Unique identifier for the target.
+            command: Parsed command argument vector to run on refresh.
+        """
+        super().__init__()  # type: ignore[no-untyped-call]
+        self.identifier = identifier
+        self.command = list(command)
+
+    def refresh(self, request: Any = None) -> None:
+        """Run the configured token command and capture the bearer token.
+
+        Args:
+            request: Ignored; present to satisfy the ``google.auth`` interface.
+
+        Raises:
+            ConfigurationError: If the token command cannot be executed.
+            RemoteError: If the token command fails, times out, or emits invalid
+                         output.
+        """
+        self.token = run_token_command(self.command, f"target '{self.identifier}'")
diff --git a/tests/test_cli_misc.py b/tests/test_cli_misc.py
index e351b0b..6951521 100644
--- a/tests/test_cli_misc.py
+++ b/tests/test_cli_misc.py
@@ -10,12 +10,16 @@ noise into somebody's debug log.
 """
 
 import io
+import subprocess
+from unittest.mock import patch
 
 import click
 import pytest
+from click.testing import CliRunner
 
-from korgalore import format_key_for_display
-from korgalore.cli import progress_file
+from korgalore import RemoteError, format_key_for_display
+from korgalore.cli import auth, perform_yank, progress_file, yank
+from tests.digest_helpers import make_ctx
 
 
 @pytest.mark.parametrize(
@@ -75,3 +79,98 @@ def test_hidden_bar_writes_nothing_to_stdout(capsys: pytest.CaptureFixture[str])
     # stream is what keeps it off the user's terminal, so check it landed here.
     assert isinstance(stream, io.StringIO)
     assert 'Hiding' in stream.getvalue()
+
+
+def test_auth_token_command_failure_aborts_cleanly() -> None:
+    runner = CliRunner()
+    ctx_obj = {
+        'config': {'targets': {'test': {'type': 'gmail', 'token_command': 'get-token'}}},
+        'targets': {},
+    }
+    with patch('korgalore.google_creds.subprocess.run') as mock_run:
+        mock_run.return_value = subprocess.CompletedProcess(
+            args=['get-token'], returncode=1, stdout='', stderr='command failed'
+        )
+        res = runner.invoke(auth, ['test'], obj=ctx_obj)
+        assert res.exit_code == 1
+        assert res.exception is not None
+        assert isinstance(res.exception, SystemExit)
+        mock_run.assert_called_once()
+
+
+def test_auth_token_command_verifies_labels() -> None:
+    runner = CliRunner()
+    ctx_obj = {
+        'config': {'targets': {'test': {'type': 'gmail', 'token_command': 'get-token'}}},
+        'targets': {},
+    }
+    with (
+        patch('korgalore.google_creds.subprocess.run') as mock_run,
+        patch('korgalore.gmail_target.GmailTarget.list_labels') as mock_list_labels,
+        patch('korgalore.gmail_target.build'),
+    ):
+        mock_run.return_value = subprocess.CompletedProcess(
+            args=['get-token'], returncode=0, stdout='valid-token\n', stderr=''
+        )
+        res = runner.invoke(auth, ['test'], obj=ctx_obj)
+        assert res.exit_code == 0
+        mock_run.assert_called_once()
+        mock_list_labels.assert_called_once()
+
+
+def test_yank_token_command_failure_aborts_cleanly() -> None:
+    runner = CliRunner()
+    ctx_obj = {
+        'config': {'targets': {'test': {'type': 'gmail', 'token_command': 'get-token'}}},
+        'targets': {},
+        'hide_bar': True,
+    }
+    with (
+        patch('korgalore.google_creds.subprocess.run') as mock_run,
+        patch('korgalore.cli.get_lore_node') as mock_node,
+    ):
+        mock_run.return_value = subprocess.CompletedProcess(
+            args=['get-token'], returncode=1, stdout='', stderr='command failed'
+        )
+        mock_node.return_value.get_mbox_by_msgid.return_value = b'From mboxrd@z Thu Jan 1 00:00:00 1970\n\n'
+        res = runner.invoke(yank, ['--target', 'test', '--thread', 'some-id'], obj=ctx_obj)
+        assert res.exit_code == 1
+        assert res.exception is not None
+        assert isinstance(res.exception, SystemExit)
+        mock_run.assert_called_once()
+
+
+def test_yank_single_message_command_oserror_aborts_cleanly() -> None:
+    runner = CliRunner()
+    ctx_obj = {
+        'config': {'targets': {'test': {'type': 'gmail', 'token_command': '/nonexistent/get-token'}}},
+        'targets': {},
+        'hide_bar': True,
+    }
+    with (
+        patch('korgalore.google_creds.subprocess.run') as mock_run,
+        patch('korgalore.cli.get_lore_node') as mock_node,
+    ):
+        mock_run.side_effect = FileNotFoundError('No such file')
+        mock_node.return_value.get_message_by_msgid.return_value = b'From: a@b\nSubject: x\n\nBody\n'
+        res = runner.invoke(yank, ['--target', 'test', 'some-msgid'], obj=ctx_obj)
+        assert res.exit_code == 1
+        assert res.exception is not None
+        assert isinstance(res.exception, SystemExit)
+        mock_run.assert_called_once()
+
+
+def test_perform_yank_connection_failure_raises_remote_error() -> None:
+    ctx = make_ctx(
+        {
+            'config': {'targets': {'test': {'type': 'gmail', 'token_command': 'get-token'}}},
+            'targets': {},
+            'hide_bar': True,
+        }
+    )
+    with patch('korgalore.google_creds.subprocess.run') as mock_run:
+        mock_run.return_value = subprocess.CompletedProcess(
+            args=['get-token'], returncode=1, stdout='', stderr='command failed'
+        )
+        with pytest.raises(RemoteError):
+            perform_yank(ctx, 'test', 'some-msgid')
diff --git a/tests/test_gmail_target.py b/tests/test_gmail_target.py
index 9e27f1c..3c5dfb2 100644
--- a/tests/test_gmail_target.py
+++ b/tests/test_gmail_target.py
@@ -10,7 +10,7 @@ from googleapiclient.errors import HttpError  # type: ignore[import-untyped]
 
 from korgalore import AuthenticationError, ConfigurationError, RemoteError
 from korgalore.gmail_target import SCOPES, GmailTarget, make_gmail_credentials
-from korgalore.google_creds import OAuthFileCredentials
+from korgalore.google_creds import CommandCredentials, OAuthFileCredentials
 
 
 def make_target() -> tuple[GmailTarget, MagicMock]:
@@ -300,18 +300,43 @@ class TestGmailTargetImportMessage:
 class TestMakeGmailCredentials:
     """Tests for make_gmail_credentials configuration factory."""
 
-    def test_no_credentials_raises(self) -> None:
-        """Omitting credentials raises ConfigurationError."""
-        with pytest.raises(ConfigurationError, match='No credentials file specified'):
+    def test_no_credentials_or_token_command_raises(self) -> None:
+        """Must specify either credentials or token_command."""
+        with pytest.raises(ConfigurationError, match='must specify either'):
             make_gmail_credentials('test', {})
 
+    @pytest.mark.parametrize(
+        'details',
+        [
+            {'credentials': '/tmp/creds.json', 'token_command': 'echo token'},
+            {'token': '/tmp/token.json', 'token_command': 'echo token'},
+        ],
+        ids=['credentials-and-command', 'token-and-command'],
+    )
+    def test_mutually_exclusive_token_command_options_raise(self, details: dict[str, object]) -> None:
+        """Specifying token_command alongside credentials or token raises ConfigurationError."""
+        with pytest.raises(ConfigurationError, match='cannot specify both'):
+            make_gmail_credentials('test', details)
+
+    def test_token_command_invalid_syntax_raises(self) -> None:
+        """Unclosed quotes in token_command raise ConfigurationError."""
+        with pytest.raises(ConfigurationError, match='syntax'):
+            make_gmail_credentials('test', {'token_command': 'unclosed "quote'})
+
+    def test_token_command_returns_command_credentials(self) -> None:
+        """Valid token_command builds CommandCredentials without running interactive OAuth."""
+        creds = make_gmail_credentials('test', {'token_command': 'get-token --profile work'})
+        assert isinstance(creds, CommandCredentials)
+        assert creds.command == ['get-token', '--profile', 'work']
+
     @pytest.mark.parametrize(
         ('details', 'expected_match'),
         [
             ({'credentials': 123}, "'credentials' must be a string"),
             ({'credentials': '/tmp/creds.json', 'token': 456}, "'token' must be a string"),
+            ({'token_command': 789}, "'token_command' must be a string"),
         ],
-        ids=['non-str-credentials', 'non-str-token'],
+        ids=['non-str-credentials', 'non-str-token', 'non-str-token-command'],
     )
     def test_invalid_option_types_raise(self, details: dict[str, object], expected_match: str) -> None:
         """Non-string configuration values raise ConfigurationError."""
diff --git a/tests/test_google_creds.py b/tests/test_google_creds.py
index 4ac0a3d..f392a36 100644
--- a/tests/test_google_creds.py
+++ b/tests/test_google_creds.py
@@ -1,13 +1,19 @@
-"""Tests for Google OAuth2 credential providers."""
+"""Tests for Google OAuth2 and token_command credential providers."""
 
+import subprocess
 from pathlib import Path
 from unittest.mock import MagicMock, patch
 
 import pytest
 from google.auth.exceptions import RefreshError
 
-from korgalore import AuthenticationError, ConfigurationError
-from korgalore.google_creds import OAuthFileCredentials
+from korgalore import AuthenticationError, ConfigurationError, RemoteError
+from korgalore.google_creds import (
+    CommandCredentials,
+    OAuthFileCredentials,
+    parse_token_command,
+    run_token_command,
+)
 
 TEST_SCOPES = ['https://example.invalid/scope.a', 'https://example.invalid/scope.b']
 
@@ -152,3 +158,105 @@ class TestOAuthFileCredentials:
         provider = OAuthFileCredentials('test', str(creds), token, scopes=TEST_SCOPES, interactive=False)
         assert provider.needs_auth
         assert not provider.valid
+
+
+class TestTokenCommandHelpers:
+    """Tests for target-agnostic parse_token_command and run_token_command helpers."""
+
+    def test_parse_expands_env_and_home(self, tmp_path: Path) -> None:
+        """Splits quoted args and expands environment variables and tildes."""
+        with patch.dict('os.environ', {'HOME': str(tmp_path), 'HELPER_ARG': 'work account'}):
+            args = parse_token_command('~/bin/get-token --profile "$HELPER_ARG"', "target 'test'")
+
+        assert args == [f'{tmp_path}/bin/get-token', '--profile', 'work account']
+
+    @pytest.mark.parametrize(
+        ('value', 'expected_match'),
+        [
+            (123, 'must be a string'),
+            ('   ', 'cannot be empty'),
+            ('unclosed "quote', 'syntax'),
+        ],
+        ids=['non-string', 'whitespace-only', 'bad-quoting'],
+    )
+    def test_parse_invalid_values_raise(self, value: object, expected_match: str) -> None:
+        """Invalid command strings raise ConfigurationError."""
+        with pytest.raises(ConfigurationError, match=expected_match):
+            parse_token_command(value, "target 'test'")
+
+    @patch('korgalore.google_creds.subprocess.run')
+    def test_run_returns_stripped_token(self, mock_run: MagicMock) -> None:
+        """Executes command without a shell and returns the stripped bearer token."""
+        mock_run.return_value = subprocess.CompletedProcess(
+            args=['get-token'], returncode=0, stdout='  valid-bearer-token\n', stderr=''
+        )
+
+        assert run_token_command(['get-token'], "target 'test'") == 'valid-bearer-token'
+        mock_run.assert_called_once_with(
+            ['get-token'],
+            stdin=subprocess.DEVNULL,
+            capture_output=True,
+            text=True,
+            encoding='utf-8',
+            errors='replace',
+            timeout=30,
+            check=False,
+        )
+
+    @patch('korgalore.google_creds.subprocess.run')
+    def test_run_nonzero_exit_raises_remote_error(self, mock_run: MagicMock) -> None:
+        """Non-zero exit raises RemoteError including the last non-empty stderr line."""
+        mock_run.return_value = subprocess.CompletedProcess(
+            args=['get-token'], returncode=1, stdout='', stderr='ignored line\nauth failed\n'
+        )
+
+        with pytest.raises(RemoteError, match='auth failed'):
+            run_token_command(['get-token'], "target 'test'")
+
+    @pytest.mark.parametrize(
+        'stdout',
+        ['   \n', 'multi word token\n'],
+        ids=['empty', 'embedded-whitespace'],
+    )
+    @patch('korgalore.google_creds.subprocess.run')
+    def test_run_invalid_output_raises_remote_error(self, mock_run: MagicMock, stdout: str) -> None:
+        """Empty or whitespace-containing stdout raises RemoteError."""
+        mock_run.return_value = subprocess.CompletedProcess(args=['get-token'], returncode=0, stdout=stdout, stderr='')
+
+        with pytest.raises(RemoteError, match='empty or invalid'):
+            run_token_command(['get-token'], "target 'test'")
+
+    @patch('korgalore.google_creds.subprocess.run')
+    def test_run_timeout_raises_remote_error(self, mock_run: MagicMock) -> None:
+        """Subprocess timeout raises RemoteError."""
+        mock_run.side_effect = subprocess.TimeoutExpired(cmd='get-token', timeout=30)
+
+        with pytest.raises(RemoteError, match='timed out after 30s'):
+            run_token_command(['get-token'], "target 'test'")
+
+    @patch('korgalore.google_creds.subprocess.run')
+    def test_run_oserror_raises_configuration_error(self, mock_run: MagicMock) -> None:
+        """Missing executable raises ConfigurationError."""
+        mock_run.side_effect = FileNotFoundError('No such file or directory')
+
+        with pytest.raises(ConfigurationError, match='Failed to execute'):
+            run_token_command(['nonexistent-cmd'], "target 'test'")
+
+
+class TestCommandCredentials:
+    """Tests for CommandCredentials."""
+
+    @patch('korgalore.google_creds.subprocess.run')
+    def test_refresh_sets_token_and_marks_valid(self, mock_run: MagicMock) -> None:
+        """CommandCredentials.refresh() invokes run_token_command and populates token."""
+        mock_run.return_value = subprocess.CompletedProcess(
+            args=['get-token'], returncode=0, stdout='valid-bearer-token\n', stderr=''
+        )
+
+        creds = CommandCredentials('test', ['get-token'])
+        assert not creds.valid
+
+        creds.refresh(None)
+
+        assert creds.valid
+        assert creds.token == 'valid-bearer-token'

-- 
2.56.0.542.g3ef89b7020-goog

