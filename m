Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794380366;
	b=5dFDDceGNbdgSu8Px5J0UdArNdswciChsGfi0dR86GUF8x0d5ozE+mvqzXZxIqq9RoH1
	 x5TEE/M0ZkSvPZB9xNIMyvD2l8+FLuJkBpB389Hzdcve+jYvBLisEcU41HBYExoHD2cb3
	 EYfr9v6FLihdgN6H9YCm10Uwd1sKl8og1bt9bPXsTadpZpLBV9aoARBQTB5tIBPr9ony6
	 enkrwhK0xZcOaEDqWCZSIRK2ywmm19/zXmlR3QyEiSPgPOUXcHmzlUMCpPdHqDwx6nwsN
	 R5L53KjX6w0zUSh9DBd1z6ybcth+/cVLCZ42xfJRmuROKBT0k2d95sidMIrb6XZuayA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794380366;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=As45g+pHGA0z+HqPTFPsGYL5i4LhqskmM3XQKH1vPFw=;
	b=BDh7jE4UJFoU3OZhyG30jvdMh94OkHZFN8WwUOfwnNUcpwXbX8rWIUESZEmyyx3D0hly
	 tDik+OCihlZ4pPd1ZUj5ZKJMCTvwloFu8igMsBQhpfF6OkXq1IBt9rri7vEQvNw/sUCmM
	 vnygMkt2OAc0NDx0gCoxlApXy8uehyNp0B/fCk4v3r7hIq3enx3fQAXhX5qVFFc0VCN+c
	 fVhqGu/HcJoWxTgEluNXOhwr9KieLNKEko3icpOoupEXmXu7dGDh7rKaJ2ZQXdex+/pcX
	 eZ4B0Bh6dNxxhq+8sMrhofuDnlQdkyUYYfJp1QqyVM3LlxPGUmegNOMpjjaW3e38JLw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H7N+slIx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B8D606A9A2
	for <tools@linux.kernel.org>; Wed, 11 Nov 2026 06:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H7N+slIx
Received: by smtp.kernel.org (Postfix)
	id 64BEE1F00A09; Wed, 11 Nov 2026 06:59:26 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794380366;
	b=2v6Lz1kiR37TPJJc39M9eoyL6989DA0ccTe7dNww7sh1VsbqmBdA5V/W+43SE0epffyg
	 dKGeyDT7vL0ZEMVU8KuSr7eH0A7+HIdmFRzDJfXpFYPDeNX6Cl7hI/XNYPGt7PaeGr9By
	 wYKTpJrrtOk3zDTVXVpADysO0wzPF/6PhymkLzi6leO6RNKMq0OyTD8+4THBtcfvTKw9R
	 j/VZi3vIViDSw0J8HhP7gvVcIAf0bqJzhLLm+gZE9sYdWSF4GnB5Tsnvr56jLWHOF3UEC
	 I4kungne8upHqcg3ZU279+dC2vNTu3g/xpzSlGiAp7HkAsqsdEks942XWPjhdUj1USg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794380366;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=As45g+pHGA0z+HqPTFPsGYL5i4LhqskmM3XQKH1vPFw=;
	b=cZTun2HeAsUE76Xf4JuvktrfWqp25tOW7umha08XWDkmKrMDmTi8Cjoby6IbEaSDrSN3
	 xyWkmhQyiltiVJoT8YNBOItR6XbI9sbm0M9w9xM5sovv3DjNi4iDagUAJTQ5NI9ZMIkKy
	 hUdITT3YUZ/k0RwMYsv/Wse6oZyG/vSjHJJSKuG8Ku1VFavMitDbLgnqaHN1MnJIz558/
	 jUFZDKeLdMCEOkTa+HV99BFVKNHj1l2muHLDfiyFe2tM1Y69iWgrKmllmCI9uChjp1afk
	 br34rRHdHIw9vSD0pdoPuH9ABt+t5eNOheRPd+WZtJtktSSsW2H5zbJIhtimbrwUwww==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H7N+slIx;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0F1EE1F00AC8
	for <tools@kernel.org>; Wed, 11 Nov 2026 06:59:23 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H7N+slIx
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 0F1EE1F00AC8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1b3acec6677so4470816c88.1
        for <tools@kernel.org>; Tue, 10 Nov 2026 22:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794380363; x=1794985163; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=As45g+pHGA0z+HqPTFPsGYL5i4LhqskmM3XQKH1vPFw=;
        b=H7N+slIxdngCRIuDkxmDTroWFe+j3zNOWMd8DsynJWZQy/y5Z5W6a9naPg2Ip/0jea
         whIqODoGpR4607vnJ/1vWmCtOO7qz3Fam5N8C56+E8r6GdhYlB0jf9N3Htu3HCxzVEMQ
         NHi1Uhe8u/zDgb/l/TYo1IfVy3GgbfTJQ3YQT45iH9ZB6a1ofb+EfjFcxCVmfQuuLgv5
         PQHG0H536ElVuPfE32OfRqUbCkGcsmhgIgBX8N2f2ZFu2wC4tvo7cZWC6umMN5+gRkT+
         W8n+TeVKCqFwEwrdLY8v+eIOXVSZIy+Hq5W/ndBIXE/OhIE6ykQ/073DhKHPHSKiuFfp
         sclw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794380363; x=1794985163;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=As45g+pHGA0z+HqPTFPsGYL5i4LhqskmM3XQKH1vPFw=;
        b=hIW1KS3/rjRmDYPiSagI8dPM62lwjKZIqguUyF+fRtQJObGxuXTRDx2Rn6T9BKf6gR
         /WmFSvg7qY1mECLyXk1VQprAz6lMYeS8mlksIgQh0sPUMZRAHTMmGc0FbMJSn1KwoAkd
         ZHVAVY7B8iv/78F6VHFI9WgZrxaEGOmUVoEGOVBwqfucdsU0E4ln5To1UF7qvVm0HhC3
         1QkdGeB3no5KjtG0/NayIuvbxX2toUWjD4lqoRzoQWfxLNH8IuXBZvHR6O8WUlJMefa4
         p7t7Vj1h+/sbktFJKP+F3PwUj4KY5mNvFnvCRpMdfRcdf/ITWAZQ++2m/QVoRmHmfdvu
         3lAA==
X-Gm-Message-State: APuU4Z/Yw0BnHmc3g0F1o4WRfmxivMLnMmsCufJA22rzpjCflFIgcS0D
	HwsWx1Tla32cb+K9Bv1PxgDyzKPy1X+44a6JXx1C8f0H08LFMSzExWzG0J65Cw==
X-Gm-Gg: AYBFou3ask5N4BFs/Y/7BIC7ngj/k2mP2FSpEDtXy7NiEjrsPYu04exeaxaHvHfwRI3
	uAUAvSPpiHDIpy+OLdL7vGBZ/mblH/85TTMchWP04DYC12ZVPEG/hvRe4qkpbgrHtWQAvy5XzTa
	BPyNSgIBHW7ALbRzzdXBklAkMOEnxJTFWerOgP44bnyCZBG5lXKjBwgs3NbvXpXMjYvOYTAaOHe
	qcEiVrvnDRI1NTgQHniTlyKlov6CJdyxle9kMHKbedS7VyerUJM7Ix3s2ln/RawgEUvcRdnAZaP
	MKi/EP7GTdI8cWS69d6XPSrnNRnk6zfmlWQWPxVnYrx4XKdWsRpQP7vPvziz+YZCaC5DwxSEl1u
	jJ0ljBI/YnE29tQWBLSo2B7FuGBBi9V6TUjvCK8AJ7m1jDQxIB81JFTu6r5349AAWbLEia1JVcD
	4u1LcZ+evdZvZIN03HCobM9vlAJGYBPO0Wm7nj6BXIGIroP0qwCcRWjLCrBFpRkMqo4f5qHG5br
	hXlyXZhZiuoteMLZGVaU1P9b6ZUScwHxT/IOlCkOV4wd9FriTnt7tO+0XCYvKF1l70gxrFgfGMA
	5hSW5otcDe6gFQHP/pzJE7CJ/cCeLciNhnuPnjk9zUY1iJ3sUC7lhkBD5rlkBcPfpyjXXa1KSz7
	0XrWJGBF9xdj0srircw==
X-Received: by 2002:a05:701b:2302:b0:1b3:a26b:8b97 with SMTP id a92af1059eb24-1b3c0353171mr1574016c88.41.1794380362661;
        Tue, 10 Nov 2026 22:59:22 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:311a:ad7a:93f8:96c8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890e04sm12859018c88.2.2026.11.10.22.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:59:21 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 10 Nov 2026 22:59:18 -0800
Subject: [PATCH kgl 1/2] Decouple GmailTarget from OAuth file credential
 management
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
Message-Id: <20261110-token-command-v1-1-a089145494d3@gmail.com>
References: <20261110-token-command-v1-0-a089145494d3@gmail.com>
In-Reply-To: <20261110-token-command-v1-0-a089145494d3@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.17-dev-e56a4

Move OAuth client secrets and token file management out of GmailTarget
into OAuthFileCredentials in google_creds, subclassing
google.auth.credentials.Credentials, and pass credentials directly into
GmailTarget via make_gmail_credentials.

This keeps Google OAuth credential transport separate from Gmail API
delivery and configuration parsing, and prepares for supporting
alternative credential providers.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 src/korgalore/cli.py          |  23 ++---
 src/korgalore/gmail_target.py | 212 ++++++++++++++++++--------------------
 src/korgalore/google_creds.py | 229 ++++++++++++++++++++++++++++++++++++++++++
 tests/test_gmail_target.py    | 229 +++++++++++++++++++++---------------------
 tests/test_google_creds.py    | 154 ++++++++++++++++++++++++++++
 5 files changed, 610 insertions(+), 237 deletions(-)

diff --git a/src/korgalore/cli.py b/src/korgalore/cli.py
index 3e3e615..180906d 100644
--- a/src/korgalore/cli.py
+++ b/src/korgalore/cli.py
@@ -54,7 +54,7 @@ from korgalore.digest import (
     strip_reply_prefixes,
 )
 from korgalore.dummy_target import DummyTarget
-from korgalore.gmail_target import GmailTarget
+from korgalore.gmail_target import GmailTarget, make_gmail_credentials
 from korgalore.imap_target import ImapTarget
 from korgalore.jmap_target import JmapTarget
 from korgalore.lei_feed import LeiFeed
@@ -280,8 +280,7 @@ def get_target(ctx: click.Context, identifier: str) -> Any:
     if target_type == 'gmail':
         service = get_gmail_target(
             identifier=identifier,
-            credentials_file=details.get('credentials', ''),
-            token_file=details.get('token', None),
+            details=details,
             interactive=interactive,
         )
     elif target_type == 'maildir':
@@ -334,19 +333,19 @@ def get_target(ctx: click.Context, identifier: str) -> Any:
 
 
 def get_gmail_target(
-    identifier: str, credentials_file: str, token_file: str | None, interactive: bool = True
+    identifier: str,
+    details: Mapping[str, Any],
+    interactive: bool = True,
 ) -> GmailTarget:
     """Create a Gmail target service instance."""
-    if not credentials_file:
-        logger.critical('No credentials file specified for Gmail target: %s', identifier)
-        raise click.Abort()
-    if not token_file:
-        cfgdir = get_xdg_config_dir()
-        token_file = str(cfgdir / f'gmail-{identifier}-token.json')
     try:
-        gt = GmailTarget(
-            identifier=identifier, credentials_file=credentials_file, token_file=token_file, interactive=interactive
+        creds = make_gmail_credentials(
+            identifier=identifier,
+            details=details,
+            interactive=interactive,
+            config_dir=get_xdg_config_dir(),
         )
+        gt = GmailTarget(identifier=identifier, creds=creds)
     except ConfigurationError as fe:
         logger.critical('Error: %s', str(fe))
         raise click.Abort() from fe
diff --git a/src/korgalore/gmail_target.py b/src/korgalore/gmail_target.py
index c88c3d9..3fd9f8b 100644
--- a/src/korgalore/gmail_target.py
+++ b/src/korgalore/gmail_target.py
@@ -1,22 +1,21 @@
+import base64
 import logging
 import os
+from collections.abc import Mapping
 from pathlib import Path
 from typing import Any
 
-from google.auth.exceptions import RefreshError
-from google.auth.external_account_authorized_user import Credentials as ExternalAccountCredentials
+from google.auth.credentials import Credentials as BaseCredentials
 from google.auth.transport.requests import Request
-from google.oauth2.credentials import Credentials
-from google_auth_oauthlib.flow import InstalledAppFlow  # type: ignore
-from googleapiclient.discovery import build  # type: ignore
-from googleapiclient.errors import HttpError  # type: ignore
+from googleapiclient.discovery import Resource, build  # type: ignore[import-untyped]
+from googleapiclient.errors import HttpError  # type: ignore[import-untyped]
 
 from korgalore import AuthenticationError, ConfigurationError, RemoteError
+from korgalore.google_creds import OAuthFileCredentials
 from korgalore.message import RawMessage
 
 logger = logging.getLogger('korgalore')
 
-
 # If modifying these scopes, delete the file token.json.
 # We need scopes for reading and inserting new emails, but not
 # modifying existing ones.
@@ -25,105 +24,52 @@ SCOPES = [
     'https://www.googleapis.com/auth/gmail.insert',
 ]
 
-# InstalledAppFlow.run_local_server() returns either flavour depending on what
-# the client_secrets file describes. Both expose the valid/expired/refresh_token
-# attributes and the to_json() and refresh() methods used below, so the code
-# does not care which one it gets -- but the declared type has to allow both.
-GmailCredentials = Credentials | ExternalAccountCredentials
-
 
 class GmailTarget:
     """Target class for delivering email messages to Gmail via the API."""
 
     DEFAULT_LABELS: list[str] = ['INBOX', 'UNREAD']
 
-    def __init__(self, identifier: str, credentials_file: str, token_file: str, interactive: bool = True) -> None:
+    def __init__(self, identifier: str, creds: BaseCredentials) -> None:
         """Initialize a GmailTarget instance.
 
         Args:
             identifier: Unique identifier for this Gmail target.
-            credentials_file: Path to the Google OAuth credentials JSON file.
-            token_file: Path to store/load the OAuth token.
-            interactive: If True, run OAuth flow interactively when needed.
-                        If False, raise AuthenticationError instead (for GUI mode).
-
-        Raises:
-            ConfigurationError: If credentials file is not found.
-            AuthenticationError: If token is expired/revoked and re-auth is needed,
-                               or if interactive=False and no token exists.
+            creds: Google API credentials instance.
         """
         self.identifier = identifier
-        self.creds: GmailCredentials | None = None
-        self.service: Any | None = None
+        self.creds = creds
+        self.service: Resource | None = None
         self._label_map: dict[str, str] | None = None
-        # Store expanded paths for potential re-authentication
-        self._credentials_file = Path(os.path.expandvars(credentials_file)).expanduser()
-        self._token_file = Path(os.path.expandvars(token_file)).expanduser()
-        self._needs_auth = False
-        self._interactive = interactive
-        self._load_credentials()
-
-    def _load_credentials(self) -> None:
-        """Load or refresh OAuth credentials for Gmail API access.
 
-        Attempts to load existing credentials from token_file. If not present
-        or expired, initiates OAuth flow using credentials_file.
-
-        Raises:
-            ConfigurationError: If credentials file is not found.
-            AuthenticationError: If token is expired/revoked and re-auth is needed.
-        """
-        # The file token.json stores the user's access and refresh tokens
-        if self._token_file.exists():
-            self.creds = Credentials.from_authorized_user_file(str(self._token_file), SCOPES)  # type: ignore
-
-        # If there are no (valid) credentials available, let the user log in
-        if not self.creds or not self.creds.valid:
-            if self.creds and self.creds.expired and self.creds.refresh_token:
-                try:
-                    self.creds.refresh(Request())  # type: ignore
-                except RefreshError as e:
-                    logger.warning('Gmail token for %s has expired or been revoked.', self.identifier)
-                    invalid_token_file = self._token_file.with_name(f'{self._token_file.name}.invalid')
-                    invalid_token_file.unlink(missing_ok=True)
-                    self._token_file.rename(invalid_token_file)
-                    self._needs_auth = True
-                    if not self._interactive:
-                        # In non-interactive mode, just return - caller will check needs_auth
-                        return
-                    raise AuthenticationError(
-                        f"Gmail token for '{self.identifier}' is invalid. Please re-authenticate.",
-                        target_id=self.identifier,
-                        target_type='gmail',
-                    ) from e
-            elif self._credentials_file.exists():
-                if not self._interactive:
-                    # In non-interactive mode (GUI), don't run OAuth flow
-                    # Just mark as needing auth and return - caller will check needs_auth
-                    self._needs_auth = True
-                    return
-                logger.critical('Log in to Gmail account for %s', self.identifier)
-
-                flow = InstalledAppFlow.from_client_secrets_file(str(self._credentials_file), SCOPES)
-                self.creds = flow.run_local_server(port=0)
-            else:
-                raise ConfigurationError(
-                    f'{self._credentials_file} not found. Please download it from Google Cloud Console.'
-                )
-
-            # Save the credentials for the next run
-            self._token_file.write_text(self.creds.to_json())
-
-        self._needs_auth = False
+    @property
+    def needs_auth(self) -> bool:
+        """Check if this target needs re-authentication."""
+        return bool(getattr(self.creds, 'needs_auth', False))
 
     def connect(self) -> None:
         """Establish connection to the Gmail API service.
 
         Creates the Gmail API service object if not already connected.
+
+        Raises:
+            ConfigurationError: If credentials file is not found during refresh.
+            AuthenticationError: If OAuth token refresh or authentication fails.
         """
-        if self.service is None:
-            logger.debug('Connecting to Gmail service for %s', self.identifier)
-            self.service = build('gmail', 'v1', credentials=self.creds, cache_discovery=False)
+        if self.service is not None:
+            return
+
+        if not self.creds.valid:
+            self.creds.refresh(Request())  # type: ignore[no-untyped-call]
+
+        logger.debug('Connecting to Gmail service for %s', self.identifier)
+        self.service = build('gmail', 'v1', credentials=self.creds, cache_discovery=False)
+        try:
+            self._label_map = {label['name']: label['id'] for label in self.list_labels()}
+        except Exception:
+            self.service = None
+            self._label_map = None
+            raise
 
     def _api(self) -> Any:
         """Return the connected Gmail API service, connecting first if needed.
@@ -163,8 +109,8 @@ class GmailTarget:
         """
         # Translate label names to their corresponding IDs
         if self._label_map is None:
-            # Get all labels from Gmail
-            self._label_map = {label['name']: label['id'] for label in self.list_labels()}
+            self.connect()
+        assert self._label_map is not None
         translated: list[str] = []
         for label in labels:
             label_id = self._label_map.get(label, None)
@@ -197,8 +143,6 @@ class GmailTarget:
             RemoteError: If the Gmail API call fails.
         """
         try:
-            import base64
-
             msg = RawMessage(raw_message)
             encoded_message = base64.urlsafe_b64encode(msg.as_bytes(feed_name, delivery_name)).decode()
             message_body: dict[str, Any] = {'raw': encoded_message}
@@ -215,33 +159,77 @@ class GmailTarget:
         except HttpError as error:
             raise RemoteError(f'An error occurred: {error}') from error
 
-    @property
-    def needs_auth(self) -> bool:
-        """Check if this target needs re-authentication."""
-        return self._needs_auth
-
     def reauthenticate(self) -> None:
         """Perform OAuth re-authentication flow.
 
-        Opens a browser window for the user to log in and authorize the app.
-        Updates credentials upon successful authentication.
+        Delegates interactive re-authentication to the underlying credentials
+        provider and clears cached API state so the next operation reconnects
+        with the updated credentials.
 
         Raises:
             ConfigurationError: If credentials file is not found.
+            AuthenticationError: If interactive re-authentication is unsupported
+                                 or the OAuth flow fails.
         """
-        if not self._credentials_file.exists():
-            raise ConfigurationError(
-                f'{self._credentials_file} not found. Please download it from Google Cloud Console.'
+        reauth = getattr(self.creds, 'reauthenticate', None)
+        if not callable(reauth):
+            raise AuthenticationError(
+                f"Target '{self.identifier}' does not support interactive reauthentication.",
+                target_id=self.identifier,
+                target_type='gmail',
             )
-
-        logger.info('Starting re-authentication for Gmail account %s', self.identifier)
-
-        flow = InstalledAppFlow.from_client_secrets_file(str(self._credentials_file), SCOPES)
-        self.creds = flow.run_local_server(port=0)
-
-        # Save the credentials
-        self._token_file.write_text(self.creds.to_json())
-
-        self._needs_auth = False
-        self.service = None  # Reset service to force reconnect with new creds
-        logger.info('Re-authentication successful for %s', self.identifier)
+        reauth()
+        self.service = None
+        self._label_map = None
+
+
+def make_gmail_credentials(
+    identifier: str,
+    details: Mapping[str, Any],
+    interactive: bool = True,
+    config_dir: Path | str | None = None,
+) -> BaseCredentials:
+    """Create credentials for a Gmail target from configuration.
+
+    Args:
+        identifier: Unique identifier for the Gmail target.
+        details: Target configuration mapping from ``korgalore.toml``.
+        interactive: Whether interactive OAuth browser flows are permitted.
+        config_dir: Optional base configuration directory for default token paths.
+
+    Returns:
+        Configured credentials instance compatible with ``GmailTarget``.
+
+    Raises:
+        ConfigurationError: If required configuration keys are missing or have
+                            invalid types.
+    """
+    if 'credentials' not in details:
+        raise ConfigurationError(f"No credentials file specified for Gmail target '{identifier}'.")
+
+    creds_raw = details['credentials']
+    if not isinstance(creds_raw, str):
+        raise ConfigurationError(f"Gmail target '{identifier}': 'credentials' must be a string.")
+
+    token_raw = details.get('token')
+    if token_raw is not None and not isinstance(token_raw, str):
+        raise ConfigurationError(f"Gmail target '{identifier}': 'token' must be a string.")
+
+    if not token_raw:
+        base_dir = (
+            Path(config_dir)
+            if config_dir is not None
+            else Path(os.environ.get('XDG_CONFIG_HOME', Path.home() / '.config')) / 'korgalore'
+        )
+        token_file: str | Path = base_dir / f'gmail-{identifier}-token.json'
+    else:
+        token_file = token_raw
+
+    return OAuthFileCredentials(
+        identifier=identifier,
+        credentials_file=creds_raw,
+        token_file=token_file,
+        scopes=SCOPES,
+        interactive=interactive,
+        target_type='gmail',
+    )
diff --git a/src/korgalore/google_creds.py b/src/korgalore/google_creds.py
new file mode 100644
index 0000000..f1963bb
--- /dev/null
+++ b/src/korgalore/google_creds.py
@@ -0,0 +1,229 @@
+"""Google credential providers for korgalore."""
+
+import logging
+import os
+from collections.abc import Sequence
+from pathlib import Path
+from typing import Any
+
+from google.auth.credentials import Credentials as BaseCredentials
+from google.auth.exceptions import RefreshError
+from google.auth.external_account_authorized_user import Credentials as ExternalAccountCredentials
+from google.auth.transport.requests import Request
+from google.oauth2.credentials import Credentials
+from google_auth_oauthlib.flow import InstalledAppFlow  # type: ignore[import-untyped]
+
+from korgalore import AuthenticationError, ConfigurationError
+
+logger = logging.getLogger('korgalore')
+
+# InstalledAppFlow.run_local_server() returns either flavour depending on what
+# the client_secrets file describes. Both expose the valid/expired/refresh_token
+# attributes and the to_json() and refresh() methods used below, so the code
+# does not care which one it gets -- but the declared type has to allow both.
+OAuthCredentials = Credentials | ExternalAccountCredentials
+
+
+class OAuthFileCredentials(BaseCredentials):
+    """Credentials backed by Google OAuth client secrets and a token file."""
+
+    def __init__(
+        self,
+        identifier: str,
+        credentials_file: str,
+        token_file: str | Path,
+        scopes: Sequence[str],
+        interactive: bool = True,
+        target_type: str = 'gmail',
+    ) -> None:
+        """Initialize file-backed OAuth credentials for a Google target.
+
+        Args:
+            identifier: Unique identifier for this target.
+            credentials_file: Path to the Google OAuth credentials JSON file.
+            token_file: Path to store/load the OAuth token.
+            scopes: OAuth scopes to request when running interactive auth.
+            interactive: If True, run OAuth flow interactively when needed.
+                         If False, record ``needs_auth`` instead (for GUI mode).
+            target_type: Target type string reported in AuthenticationError.
+
+        Raises:
+            ConfigurationError: If credentials file path is empty or missing.
+            AuthenticationError: If token is expired/revoked and re-auth is needed,
+                                 or if an interactive OAuth flow fails.
+        """
+        self._creds: OAuthCredentials | None = None
+        super().__init__()  # type: ignore[no-untyped-call]
+        self.identifier = identifier
+        self._interactive = interactive
+        self._scopes = list(scopes)
+        self._target_type = target_type
+        self.needs_auth = False
+
+        if not credentials_file:
+            raise ConfigurationError(f"No credentials file specified for target '{identifier}'.")
+        # Store expanded paths for potential re-authentication
+        self._credentials_file = Path(os.path.expandvars(credentials_file)).expanduser()
+        self._token_file = Path(os.path.expandvars(os.fspath(token_file))).expanduser()
+
+        self._load_credentials()
+
+    def _load_credentials(self) -> None:
+        """Load or refresh OAuth credentials for API access.
+
+        Attempts to load existing credentials from ``self._token_file``. If
+        not present or expired, refreshes with the stored refresh token or
+        initiates the OAuth flow using ``self._credentials_file``.
+
+        Raises:
+            ConfigurationError: If credentials file is not found.
+            AuthenticationError: If token is expired/revoked and re-auth is needed.
+        """
+        # The file token.json stores the user's access and refresh tokens
+        if self._token_file.exists():
+            try:
+                self._creds = Credentials.from_authorized_user_file(str(self._token_file))  # type: ignore[no-untyped-call]
+            except Exception as e:
+                logger.warning('Failed to load OAuth token for %s from %s: %s', self.identifier, self._token_file, e)
+                self._creds = None
+
+        # If there are no (valid) credentials available, let the user log in
+        if not self._creds or not self._creds.valid:
+            if self._creds and self._creds.expired and self._creds.refresh_token:
+                try:
+                    self._creds.refresh(Request())  # type: ignore[no-untyped-call]
+                    self._save_token()
+                except RefreshError as e:
+                    logger.warning('OAuth token for target %s has expired or been revoked.', self.identifier)
+                    self._quarantine_token()
+                    self.needs_auth = True
+                    if not self._interactive:
+                        # In non-interactive mode, just return - caller will check needs_auth
+                        return
+                    raise AuthenticationError(
+                        f"OAuth token for '{self.identifier}' is invalid. Please re-authenticate.",
+                        target_id=self.identifier,
+                        target_type=self._target_type,
+                    ) from e
+            elif not self._credentials_file.exists():
+                raise ConfigurationError(
+                    f"Credentials file not found for target '{self.identifier}': {self._credentials_file}"
+                )
+            elif not self._interactive:
+                # In non-interactive mode (GUI), don't run OAuth flow
+                # Just mark as needing auth and return - caller will check needs_auth
+                self.needs_auth = True
+                return
+            else:
+                self.reauthenticate()
+                return
+
+        self.needs_auth = False
+
+    @property
+    def token(self) -> str | None:
+        """Current OAuth2 access token, or None if not loaded."""
+        if self._creds and self._creds.token is not None:
+            return str(self._creds.token)
+        return None
+
+    @token.setter
+    def token(self, value: str | None) -> None:
+        if self._creds:
+            self._creds.token = value
+
+    @property
+    def expiry(self) -> Any:
+        """Expiration timestamp of the current access token, or None."""
+        return self._creds.expiry if self._creds else None
+
+    @expiry.setter
+    def expiry(self, value: Any) -> None:
+        if self._creds:
+            self._creds.expiry = value
+
+    @property
+    def valid(self) -> bool:
+        """Whether loaded OAuth2 credentials are present and currently valid."""
+        return bool(self._creds and self._creds.valid)
+
+    def _save_token(self) -> None:
+        """Persist current OAuth credentials to the configured token file."""
+        if self._creds is None:
+            return
+        # Save the credentials for the next run
+        self._token_file.parent.mkdir(parents=True, exist_ok=True)
+        self._token_file.write_text(self._creds.to_json())  # type: ignore[no-untyped-call]
+        self._token_file.chmod(0o600)
+
+    def _quarantine_token(self) -> None:
+        """Rename a revoked or invalid token file aside to ``.invalid``."""
+        if self._token_file.exists():
+            invalid_token_file = self._token_file.with_name(f'{self._token_file.name}.invalid')
+            invalid_token_file.unlink(missing_ok=True)
+            self._token_file.rename(invalid_token_file)
+
+    def refresh(self, request: Any = None) -> None:
+        """Refresh the access token using the stored refresh token.
+
+        Args:
+            request: Optional Google auth transport request object.
+
+        Raises:
+            ConfigurationError: If credentials file is missing during
+                                interactive re-authentication.
+            AuthenticationError: If refresh fails or no token is loaded in
+                                 non-interactive mode.
+        """
+        if self._creds is None:
+            if self._interactive:
+                self.reauthenticate()
+                return
+            self.needs_auth = True
+            raise AuthenticationError(
+                f"Target '{self.identifier}' requires authentication.",
+                target_id=self.identifier,
+                target_type=self._target_type,
+            )
+        req = request or Request()
+        try:
+            self._creds.refresh(req)  # type: ignore[no-untyped-call]
+        except RefreshError as e:
+            logger.warning('OAuth token for target %s has expired or been revoked.', self.identifier)
+            self._quarantine_token()
+            self.needs_auth = True
+            raise AuthenticationError(
+                f"Failed to refresh credentials for target '{self.identifier}': {e}",
+                target_id=self.identifier,
+                target_type=self._target_type,
+            ) from e
+        self._save_token()
+        self.needs_auth = False
+
+    def reauthenticate(self) -> None:
+        """Perform OAuth re-authentication flow.
+
+        Opens a browser window for the user to log in and authorize the app.
+        Updates credentials upon successful authentication.
+
+        Raises:
+            ConfigurationError: If credentials file is not found.
+            AuthenticationError: If the local OAuth authorization flow fails.
+        """
+        if not self._credentials_file.exists():
+            raise ConfigurationError(
+                f"Credentials file not found for target '{self.identifier}': {self._credentials_file}"
+            )
+        logger.critical('Log in to account for %s', self.identifier)
+        try:
+            flow = InstalledAppFlow.from_client_secrets_file(str(self._credentials_file), self._scopes)
+            self._creds = flow.run_local_server(port=0)
+        except Exception as e:
+            self.needs_auth = True
+            raise AuthenticationError(
+                f"OAuth flow failed for target '{self.identifier}': {e}",
+                target_id=self.identifier,
+                target_type=self._target_type,
+            ) from e
+        self._save_token()
+        self.needs_auth = False
diff --git a/tests/test_gmail_target.py b/tests/test_gmail_target.py
index c3a3ed4..9e27f1c 100644
--- a/tests/test_gmail_target.py
+++ b/tests/test_gmail_target.py
@@ -5,28 +5,25 @@ from pathlib import Path
 from unittest.mock import MagicMock, patch
 
 import pytest
-from google.auth.exceptions import RefreshError
+from google.auth.credentials import Credentials as BaseCredentials
 from googleapiclient.errors import HttpError  # type: ignore[import-untyped]
 
-from korgalore import ConfigurationError, RemoteError
-from korgalore.gmail_target import SCOPES, GmailTarget
+from korgalore import AuthenticationError, ConfigurationError, RemoteError
+from korgalore.gmail_target import SCOPES, GmailTarget, make_gmail_credentials
+from korgalore.google_creds import OAuthFileCredentials
 
 
-def make_target(tmp_path: Path) -> tuple[GmailTarget, MagicMock]:
-    """A GmailTarget with valid stored credentials; returns it with those credentials."""
-    token = tmp_path / 'token.json'
-    token.write_text('{}')
-    with patch('korgalore.gmail_target.Credentials') as mock_creds_class:
-        mock_creds = MagicMock()
-        mock_creds.valid = True
-        mock_creds_class.from_authorized_user_file.return_value = mock_creds
-        return GmailTarget('test', str(tmp_path / 'creds.json'), str(token)), mock_creds
+def make_target() -> tuple[GmailTarget, MagicMock]:
+    """A GmailTarget with valid mock credentials."""
+    mock_creds = MagicMock(spec=BaseCredentials)
+    mock_creds.valid = True
+    return GmailTarget('test', creds=mock_creds), mock_creds
 
 
 @pytest.fixture
-def gmail(tmp_path: Path) -> tuple[GmailTarget, MagicMock]:
+def gmail() -> tuple[GmailTarget, MagicMock]:
     """A target with a mocked API service; the label map is not loaded yet."""
-    target, _ = make_target(tmp_path)
+    target, _ = make_target()
     service = MagicMock()
     target.service = service
     return target, service
@@ -52,123 +49,85 @@ def import_body(service: MagicMock) -> dict[str, object]:
 
 
 class TestGmailTargetInit:
-    """Tests for GmailTarget initialization."""
+    """Tests for GmailTarget initialization and credential delegation."""
 
-    @patch('korgalore.gmail_target.Credentials')
-    def test_loads_existing_valid_token(self, mock_credentials: MagicMock, tmp_path: Path) -> None:
-        """Loads credentials from the stored token; the service waits for connect()."""
-        token = tmp_path / 'token.json'
-        token.write_text('{}')
-        mock_creds = MagicMock()
-        mock_creds.valid = True
-        mock_credentials.from_authorized_user_file.return_value = mock_creds
-
-        target = GmailTarget('test', str(tmp_path / 'creds.json'), str(token))
+    def test_init_with_credentials(self) -> None:
+        """Stores identifier and credentials without building API service yet."""
+        target, mock_creds = make_target()
 
         assert target.identifier == 'test'
         assert target.creds is mock_creds
         assert target.service is None
-        mock_credentials.from_authorized_user_file.assert_called_once_with(str(token), SCOPES)
-
-    @patch('korgalore.gmail_target.Credentials')
-    @patch('korgalore.gmail_target.Request')
-    def test_refreshes_expired_token(
-        self, mock_request: MagicMock, mock_credentials: MagicMock, tmp_path: Path
-    ) -> None:
-        """Refreshes expired credentials with refresh token and saves the result."""
-        token = tmp_path / 'token.json'
-        token.write_text('{"token": "stale"}')
-        mock_creds = MagicMock()
-        mock_creds.valid = False
-        mock_creds.expired = True
-        mock_creds.refresh_token = 'refresh_token_value'
-        mock_creds.to_json.return_value = '{"token": "refreshed"}'
-        mock_credentials.from_authorized_user_file.return_value = mock_creds
-
-        GmailTarget('test', str(tmp_path / 'creds.json'), str(token))
-
-        mock_creds.refresh.assert_called_once()
-        assert token.read_text() == '{"token": "refreshed"}'
 
-    @patch('korgalore.gmail_target.Credentials')
-    @patch('korgalore.gmail_target.Request')
-    def test_revoked_token_is_set_aside(
-        self, mock_request: MagicMock, mock_credentials: MagicMock, tmp_path: Path
-    ) -> None:
-        """A token that fails to refresh is renamed out of the way and auth is flagged."""
-        token = tmp_path / 'token.json'
-        token.write_text('{"token": "revoked"}')
-        invalid = tmp_path / 'token.json.invalid'
-        invalid.write_text('{"token": "older"}')
-        mock_creds = MagicMock()
-        mock_creds.valid = False
-        mock_creds.expired = True
-        mock_creds.refresh_token = 'refresh_token_value'
-        mock_creds.refresh.side_effect = RefreshError
-        mock_credentials.from_authorized_user_file.return_value = mock_creds
-
-        target = GmailTarget('test', str(tmp_path / 'creds.json'), str(token), interactive=False)
-
-        assert target.needs_auth
-        assert not token.exists()
-        assert invalid.read_text() == '{"token": "revoked"}'
-
-    @patch('korgalore.gmail_target.InstalledAppFlow')
-    def test_runs_oauth_flow_and_saves_token_when_no_token(self, mock_flow_class: MagicMock, tmp_path: Path) -> None:
-        """Runs the OAuth flow when no token exists, then saves the new token."""
-        creds = tmp_path / 'creds.json'
-        creds.write_text('{}')
-        token = tmp_path / 'token.json'
-        mock_creds = MagicMock()
-        mock_creds.to_json.return_value = '{"access_token": "new_token"}'
-        mock_flow = MagicMock()
-        mock_flow.run_local_server.return_value = mock_creds
-        mock_flow_class.from_client_secrets_file.return_value = mock_flow
-
-        target = GmailTarget('test', str(creds), str(token))
-
-        mock_flow_class.from_client_secrets_file.assert_called_once_with(str(creds), SCOPES)
-        mock_flow.run_local_server.assert_called_once_with(port=0)
-        assert target.creds is mock_creds
-        assert token.read_text() == '{"access_token": "new_token"}'
+    def test_reauthenticate_delegates_and_resets_service(self, gmail_labels: tuple[GmailTarget, MagicMock]) -> None:
+        """Delegates reauthenticate() to creds and clears cached service state."""
+        target, _ = gmail_labels
+        reauth_mock = MagicMock()
+        setattr(target.creds, 'reauthenticate', reauth_mock)
 
-    def test_missing_credentials_file_raises(self, tmp_path: Path) -> None:
-        """Missing credentials file raises ConfigurationError."""
-        # Neither the token file nor the credentials file exists
-        with pytest.raises(ConfigurationError) as exc_info:
-            GmailTarget('test', str(tmp_path / 'creds.json'), str(tmp_path / 'token.json'))
-        assert 'not found' in str(exc_info.value)
-        assert 'creds.json' in str(exc_info.value)
+        target.reauthenticate()
 
-    @patch('korgalore.gmail_target.Credentials')
-    def test_expands_user_paths(self, mock_credentials: MagicMock, tmp_path: Path) -> None:
-        """Tilde and env vars in paths are expanded."""
-        token = tmp_path / 'token.json'
-        token.write_text('{}')
-        mock_credentials.from_authorized_user_file.return_value = MagicMock(valid=True)
+        reauth_mock.assert_called_once_with()
+        assert target.service is None
+        assert target._label_map is None
 
-        with patch.dict('os.environ', {'HOME': str(tmp_path)}):
-            GmailTarget('test', '~/creds.json', '$HOME/token.json')
+    def test_reauthenticate_unsupported_raises(self) -> None:
+        """Raises AuthenticationError when credentials do not support reauth."""
+        target, _ = make_target()
 
-        mock_credentials.from_authorized_user_file.assert_called_once_with(str(token), SCOPES)
+        with pytest.raises(AuthenticationError, match='does not support interactive reauthentication'):
+            target.reauthenticate()
 
 
 class TestGmailTargetConnect:
     """Tests for GmailTarget connect method."""
 
     @patch('korgalore.gmail_target.build')
-    def test_connect_builds_service_once(self, mock_build: MagicMock, tmp_path: Path) -> None:
+    def test_connect_builds_service_once(self, mock_build: MagicMock) -> None:
         """Connect builds the Gmail API service, and repeated calls don't rebuild it."""
-        target, mock_creds = make_target(tmp_path)
+        target, mock_creds = make_target()
         mock_service = MagicMock()
+        mock_service.users().labels().list().execute.return_value = {'labels': [{'id': 'INBOX', 'name': 'INBOX'}]}
         mock_build.return_value = mock_service
 
         target.connect()
+        mock_build.assert_called_once_with('gmail', 'v1', credentials=mock_creds, cache_discovery=False)
+        assert target.service is mock_service
+        assert target._label_map == {'INBOX': 'INBOX'}
+
         target.connect()
         target.connect()
+        mock_build.assert_called_once()
 
-        mock_build.assert_called_once_with('gmail', 'v1', credentials=mock_creds, cache_discovery=False)
-        assert target.service is mock_service
+    @patch('korgalore.gmail_target.build')
+    def test_connect_failure_resets_state(self, mock_build: MagicMock) -> None:
+        """Label probe failure resets service and label map to None."""
+        target, _ = make_target()
+        mock_service = MagicMock()
+        mock_service.users().labels().list().execute.side_effect = http_error(403, b'Forbidden')
+        mock_build.return_value = mock_service
+
+        with pytest.raises(RemoteError):
+            target.connect()
+
+        assert target.service is None
+        assert target._label_map is None
+
+    @patch('korgalore.gmail_target.build')
+    @patch('korgalore.gmail_target.Request')
+    def test_connect_refreshes_invalid_credentials(self, mock_request: MagicMock, mock_build: MagicMock) -> None:
+        """Refreshes invalid credentials before building the API service."""
+        target, mock_creds = make_target()
+        mock_creds.valid = False
+        mock_service = MagicMock()
+        mock_service.users().labels().list().execute.return_value = {'labels': []}
+        mock_build.return_value = mock_service
+
+        target.connect()
+
+        mock_creds.refresh.assert_called_once_with(mock_request.return_value)
+        mock_build.assert_called_once()
+        assert target._label_map == {}
 
 
 class TestGmailTargetListLabels:
@@ -215,9 +174,12 @@ class TestGmailTargetListLabels:
 class TestGmailTargetTranslateLabels:
     """Tests for GmailTarget translate_labels method."""
 
-    def test_translate_labels(self, gmail: tuple[GmailTarget, MagicMock]) -> None:
+    @patch('korgalore.gmail_target.build')
+    def test_translate_labels(self, mock_build: MagicMock) -> None:
         """Label names become IDs, in order; the label map is fetched only once."""
-        target, service = gmail
+        target, _ = make_target()
+        service = MagicMock()
+        mock_build.return_value = service
         service.users().labels().list().execute.return_value = {
             'labels': [
                 {'id': 'INBOX', 'name': 'INBOX'},
@@ -231,9 +193,13 @@ class TestGmailTargetTranslateLabels:
         assert target.translate_labels(['MyLabel']) == ['Label_123']
 
         assert service.users().labels().list().execute.call_count == 1
+        assert mock_build.call_count == 1
 
-    def test_translate_unknown_label_raises(self, gmail: tuple[GmailTarget, MagicMock]) -> None:
-        target, service = gmail
+    @patch('korgalore.gmail_target.build')
+    def test_translate_unknown_label_raises(self, mock_build: MagicMock) -> None:
+        target, _ = make_target()
+        service = MagicMock()
+        mock_build.return_value = service
         service.users().labels().list().execute.return_value = {'labels': [{'id': 'INBOX', 'name': 'INBOX'}]}
 
         with pytest.raises(ConfigurationError) as exc_info:
@@ -241,8 +207,8 @@ class TestGmailTargetTranslateLabels:
         assert 'not found' in str(exc_info.value)
         assert 'NonExistent' in str(exc_info.value)
 
-    def test_label_names_are_case_sensitive(self, gmail: tuple[GmailTarget, MagicMock]) -> None:
-        target, _ = gmail
+    def test_label_names_are_case_sensitive(self) -> None:
+        target, _ = make_target()
         target._label_map = {'INBOX': 'INBOX', 'inbox': 'inbox_lower'}
 
         assert target.translate_labels(['INBOX']) == ['INBOX']
@@ -329,3 +295,40 @@ class TestGmailTargetImportMessage:
         results = [target.import_message(f'Message {i}'.encode(), ['INBOX']) for i in range(5)]
 
         assert [r['id'] for r in results] == ['msg0', 'msg1', 'msg2', 'msg3', 'msg4']
+
+
+class TestMakeGmailCredentials:
+    """Tests for make_gmail_credentials configuration factory."""
+
+    def test_no_credentials_raises(self) -> None:
+        """Omitting credentials raises ConfigurationError."""
+        with pytest.raises(ConfigurationError, match='No credentials file specified'):
+            make_gmail_credentials('test', {})
+
+    @pytest.mark.parametrize(
+        ('details', 'expected_match'),
+        [
+            ({'credentials': 123}, "'credentials' must be a string"),
+            ({'credentials': '/tmp/creds.json', 'token': 456}, "'token' must be a string"),
+        ],
+        ids=['non-str-credentials', 'non-str-token'],
+    )
+    def test_invalid_option_types_raise(self, details: dict[str, object], expected_match: str) -> None:
+        """Non-string configuration values raise ConfigurationError."""
+        with pytest.raises(ConfigurationError, match=expected_match):
+            make_gmail_credentials('test', details)
+
+    @patch('korgalore.google_creds.Credentials')
+    def test_default_token_file_uses_xdg_config_dir(self, mock_credentials: MagicMock, tmp_path: Path) -> None:
+        """When token is omitted, defaults to gmail-{identifier}-token.json in XDG config dir."""
+        default_token = tmp_path / 'korgalore' / 'gmail-personal-token.json'
+        default_token.parent.mkdir(parents=True)
+        default_token.write_text('{}')
+        mock_credentials.from_authorized_user_file.return_value = MagicMock(valid=True)
+
+        with patch.dict('os.environ', {'XDG_CONFIG_HOME': str(tmp_path)}):
+            creds = make_gmail_credentials('personal', {'credentials': str(tmp_path / 'creds.json')})
+
+        mock_credentials.from_authorized_user_file.assert_called_once_with(str(default_token))
+        assert isinstance(creds, OAuthFileCredentials)
+        assert creds._scopes == SCOPES
diff --git a/tests/test_google_creds.py b/tests/test_google_creds.py
new file mode 100644
index 0000000..4ac0a3d
--- /dev/null
+++ b/tests/test_google_creds.py
@@ -0,0 +1,154 @@
+"""Tests for Google OAuth2 credential providers."""
+
+from pathlib import Path
+from unittest.mock import MagicMock, patch
+
+import pytest
+from google.auth.exceptions import RefreshError
+
+from korgalore import AuthenticationError, ConfigurationError
+from korgalore.google_creds import OAuthFileCredentials
+
+TEST_SCOPES = ['https://example.invalid/scope.a', 'https://example.invalid/scope.b']
+
+
+class TestOAuthFileCredentials:
+    """Tests for OAuthFileCredentials initialization, refresh, and reauth."""
+
+    @patch('korgalore.google_creds.Credentials')
+    def test_loads_existing_valid_token(self, mock_credentials: MagicMock, tmp_path: Path) -> None:
+        """Loads credentials from the stored token when already valid."""
+        token = tmp_path / 'token.json'
+        token.write_text('{}')
+        mock_creds = MagicMock()
+        mock_creds.valid = True
+        mock_creds.token = 'access-tok'
+        mock_credentials.from_authorized_user_file.return_value = mock_creds
+
+        provider = OAuthFileCredentials('test', str(tmp_path / 'creds.json'), token, scopes=TEST_SCOPES)
+
+        assert provider.valid
+        assert provider.token == 'access-tok'
+        assert not provider.needs_auth
+        mock_credentials.from_authorized_user_file.assert_called_once_with(str(token))
+
+    @patch('korgalore.google_creds.Credentials')
+    @patch('korgalore.google_creds.Request')
+    def test_refreshes_expired_token(
+        self, mock_request: MagicMock, mock_credentials: MagicMock, tmp_path: Path
+    ) -> None:
+        """Refreshes expired credentials with refresh token and saves the result."""
+        token = tmp_path / 'token.json'
+        token.write_text('{"token": "stale"}')
+        mock_creds = MagicMock()
+        mock_creds.valid = False
+        mock_creds.expired = True
+        mock_creds.refresh_token = 'refresh_token_value'
+        mock_creds.to_json.return_value = '{"token": "refreshed"}'
+        mock_credentials.from_authorized_user_file.return_value = mock_creds
+
+        OAuthFileCredentials('test', str(tmp_path / 'creds.json'), token, scopes=TEST_SCOPES)
+
+        mock_creds.refresh.assert_called_once()
+        assert token.read_text() == '{"token": "refreshed"}'
+        assert (token.stat().st_mode & 0o777) == 0o600
+
+    @patch('korgalore.google_creds.Credentials')
+    @patch('korgalore.google_creds.Request')
+    def test_revoked_token_is_set_aside(
+        self, mock_request: MagicMock, mock_credentials: MagicMock, tmp_path: Path
+    ) -> None:
+        """A token that fails to refresh is renamed aside and needs_auth is flagged."""
+        token = tmp_path / 'token.json'
+        token.write_text('{"token": "revoked"}')
+        invalid = tmp_path / 'token.json.invalid'
+        invalid.write_text('{"token": "older"}')
+        mock_creds = MagicMock()
+        mock_creds.valid = False
+        mock_creds.expired = True
+        mock_creds.refresh_token = 'refresh_token_value'
+        mock_creds.refresh.side_effect = RefreshError
+        mock_credentials.from_authorized_user_file.return_value = mock_creds
+
+        provider = OAuthFileCredentials(
+            'test', str(tmp_path / 'creds.json'), token, scopes=TEST_SCOPES, interactive=False
+        )
+
+        assert provider.needs_auth
+        assert not token.exists()
+        assert invalid.read_text() == '{"token": "revoked"}'
+
+    @patch('korgalore.google_creds.Credentials')
+    @patch('korgalore.google_creds.Request')
+    def test_revoked_token_interactive_raises_authentication_error(
+        self, mock_request: MagicMock, mock_credentials: MagicMock, tmp_path: Path
+    ) -> None:
+        """Interactive load raises AuthenticationError when token refresh is revoked."""
+        token = tmp_path / 'token.json'
+        token.write_text('{"token": "revoked"}')
+        mock_creds = MagicMock()
+        mock_creds.valid = False
+        mock_creds.expired = True
+        mock_creds.refresh_token = 'refresh_token_value'
+        mock_creds.refresh.side_effect = RefreshError
+        mock_credentials.from_authorized_user_file.return_value = mock_creds
+
+        with pytest.raises(AuthenticationError, match='invalid'):
+            OAuthFileCredentials('test', str(tmp_path / 'creds.json'), token, scopes=TEST_SCOPES, interactive=True)
+
+        assert not token.exists()
+        assert token.with_name('token.json.invalid').exists()
+
+    @patch('korgalore.google_creds.InstalledAppFlow')
+    def test_runs_oauth_flow_and_saves_token_when_no_token(self, mock_flow_class: MagicMock, tmp_path: Path) -> None:
+        """Runs the OAuth flow interactively, saves the returned credentials, and marks auth done."""
+        creds = tmp_path / 'creds.json'
+        creds.write_text('{}')
+        token = tmp_path / 'token.json'
+        mock_creds = MagicMock()
+        mock_creds.valid = True
+        mock_creds.to_json.return_value = '{"token": "fresh"}'
+        mock_flow = MagicMock()
+        mock_flow.run_local_server.return_value = mock_creds
+        mock_flow_class.from_client_secrets_file.return_value = mock_flow
+
+        provider = OAuthFileCredentials('test', str(creds), token, scopes=TEST_SCOPES)
+
+        mock_flow_class.from_client_secrets_file.assert_called_once_with(str(creds), TEST_SCOPES)
+        mock_flow.run_local_server.assert_called_once_with(port=0)
+        assert provider.valid
+        assert not provider.needs_auth
+        assert token.read_text() == '{"token": "fresh"}'
+        assert (token.stat().st_mode & 0o777) == 0o600
+
+    def test_missing_credentials_file_raises(self, tmp_path: Path) -> None:
+        """Missing credentials file raises ConfigurationError."""
+        with pytest.raises(ConfigurationError) as exc_info:
+            OAuthFileCredentials('test', str(tmp_path / 'creds.json'), tmp_path / 'token.json', scopes=TEST_SCOPES)
+        assert 'not found' in str(exc_info.value)
+        assert 'creds.json' in str(exc_info.value)
+
+    @patch('korgalore.google_creds.Credentials')
+    def test_expands_user_paths(self, mock_credentials: MagicMock, tmp_path: Path) -> None:
+        """Tilde and environment variables in paths are expanded."""
+        token = tmp_path / 'token.json'
+        token.write_text('{}')
+        creds = tmp_path / 'creds.json'
+        creds.write_text('{}')
+        mock_credentials.from_authorized_user_file.return_value = MagicMock(valid=True)
+
+        with patch.dict('os.environ', {'HOME': str(tmp_path)}):
+            OAuthFileCredentials('test', '~/creds.json', '$HOME/token.json', scopes=TEST_SCOPES)
+
+        mock_credentials.from_authorized_user_file.assert_called_once_with(str(token))
+
+    def test_corrupt_token_file_falls_back_gracefully(self, tmp_path: Path) -> None:
+        """Corrupt or truncated token.json logs warning and leaves creds unloaded instead of crashing."""
+        token = tmp_path / 'token.json'
+        token.write_text('not valid json{')
+        creds = tmp_path / 'creds.json'
+        creds.write_text('{}')
+
+        provider = OAuthFileCredentials('test', str(creds), token, scopes=TEST_SCOPES, interactive=False)
+        assert provider.needs_auth
+        assert not provider.valid

-- 
2.56.0.542.g3ef89b7020-goog

