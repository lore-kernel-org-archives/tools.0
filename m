Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795655840;
	b=eR7bfiZUsp0qIPg1LSvPIV7WP0E8M88J2W6yVsMDcyJvBriFtkLz1UtA68m3hBoCss1J
	 SOdj4H6x8NexEc8S1/XMBYewrUQ58MF64SD6mRsPbSVEPiGFrRq1EHweVhLDNTOw2e5RG
	 JzUYs5XqQ/WeodsqApe3b81FjkNHL4CPQj2QdWJgM1pcFT4UnAdfRCkUlRpqYUfh84wkC
	 20SGwz1a1Yssedizj7AyLgb+QJho90Mqv3dVQc/ewNm4qZbljPTzlebHCnMHwAbcsSALS
	 uSCbld2tdZ5l//0MgFxhFpA2jc/9q/tnE5Ja9uoyKrAFkop9IVT/gZxG6z0uAYxF96A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795655840;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer;
	bh=nzu1xk5UnoKPsydWM7bD/3Talycfkexudl3er7dIwh8=;
	b=PHWxuZRKIYnvyrgRhQ3hehDvjHmzEjgmQe6g1AY7D4w7Y0DP400jFJsKfpGhgincxld2
	 MLHaiC+9gpz0QHWIv7eDWwvoj/ir/WzakOVH+Oj5uZW+qbh7V1LbFglAIDu1RTmWTwY+S
	 FVfSLU+UGqRgARqHkg2vFN5ZuY8whpR14y5mwIlJYNuJYn4whZc5wOoyhgv+Hje/injK/
	 DKlRv4mJ7ysNM/yQD7rcm75JM7FusvVpFwziqjALsrgRaz6JfcAynrmsRl3j6LmisuNvz
	 p3CcYErXxloBMTUKQXBtmfLqLZK5TquK2oHFX/tM9X0mrrcAO/o2cQsqa3WEUnWjBfg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HSo2XjEb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF26B606A327
	for <tools@linux.kernel.org>; Thu, 26 Nov 2026 01:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HSo2XjEb
Received: by smtp.kernel.org (Postfix)
	id 31FD01F000E6; Thu, 26 Nov 2026 01:17:20 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795655839;
	b=sPpigNtZAMhEmUES5QzJjDn63txhPbxFdFHZDi8ByYwtEEvXU9bVdzgU2yucW6jtp1He
	 GA58dEjN3S+qt09pFxyTuBJKLp1qaR/iQV7uEoLBBopNRefNxF9OqVHMfTinSOPYxhrX4
	 1vRDYZ5zXuR7WUyFl+jHO5Hvtjq/bZfX/wCb1d67EL2PM8ls4s1HqfFLsKdT+JBsFOC6h
	 yWHonol69Lfs5LAIwgI9Kn+lX2Thd9+q5GtkZutIBYMuwtPc69CjxHiK/yHDPLHh7F+e7
	 RYIVeWenCRfoakY0l8MuwOITeiRJowASpHzUX62DRy6HplPe6VJctineA6wn5oQNoIA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795655839;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=nzu1xk5UnoKPsydWM7bD/3Talycfkexudl3er7dIwh8=;
	b=CCTNX+K0bApXWVXPwTdivJ6t6QAnPDgdRwPTw4Xr+Ozo1CAcpT9/Qt8eKMuzJQ8diGHe
	 5KWe3gP0FZPNnfEqykuRNJfys8MwEUea9bkNZ4FcLTDL8TNUVGoAi84eiorBAfgA5EiqN
	 j5gI6AEqzlpWe0PNLNI/Pr0ZYQW37b5Yhw0K0b/iUHLVVs/CXLgxTCoL2/UV7tJUV9j3y
	 xuCTQwNAtXPhFsu3o2LT0b1Sb+V04W2PvettM76KQLcv6zR2/8U85Vh3WwoAypECqaCXA
	 fYNCALa2YLaRgP6EerronJi3ZlohbDLsKtoC6wKOME/anGA2N3R5r+b3ncPJw2FLKUA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HSo2XjEb;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3CED81F000C0
	for <tools@kernel.org>; Thu, 26 Nov 2026 01:17:09 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HSo2XjEb
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 3CED81F000C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-14394530ec6so8974036c88.1
        for <tools@kernel.org>; Wed, 25 Nov 2026 17:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795655828; x=1796260628; darn=kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nzu1xk5UnoKPsydWM7bD/3Talycfkexudl3er7dIwh8=;
        b=HSo2XjEbM9qeNJkAD3mQUcmYHdccLg0t9Ya/RiC3fAu8Lse9cl01jKt8jaHXQDPiiu
         VRQ68HEY081tpy9MyvZEmLuj7J4lI5Smm85dH8UaY7DPJdxHxt6DOJAGIafmbkXefmyJ
         nV9+LQ/rmCaaOWII962B0j+uxAdov8UxSMNrOToE14gWYOm+w1mTFxquOxP86SHs76Ia
         6jaB7e8m7OTpPMtqVsY6OktWX0OncSx/ezRUpYLNNz7pwJOQmcYF47wwWG9tAGAW1eDg
         1x1iybt6Fk/zoSuCKZr3LdU2YTQZrhIavo4+L0pUbWwDeBYcVr74eGbHRrrqQ1xReIN7
         PoeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795655828; x=1796260628;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=nzu1xk5UnoKPsydWM7bD/3Talycfkexudl3er7dIwh8=;
        b=riB4HAUlwqpWNWKIuOhoO2cEeHZ6pt8dTYjHWyiKzZmI3A7H7WCu+dwFuGkWZFikHI
         QkAVty3TISdTmLX9n30Xs6kc5CbwgkI7wjGrvgmqsx+OTyMzriy185rxWR2+uBUrK4aC
         kaWMQWZraEZB3S4LKSGCFSXZwsjQpRrC+lTF9tGXVnfolSSq3T/mJ6LtDAaQ/T18dNa9
         eimMvWjiMcM3wXcXawH+bQi1w4wEhfzyvUzEcvYrIU6gPoj6H8wLMylyrreOj9JqQtgw
         i6+v0BFD4tgsTgQ5c2V2zC5UVsky4YDU14dB85uWsLjAcaHusSg+4JvxwngbCm7C8pff
         Eg7A==
X-Gm-Message-State: APuU4Z9Ppmhfm8aCsuxtg8QBJMc7923tDjAWIg477GmigoYw5S5jrmx9
	TKHPxau6zvseJeQtwlKKpGINjFgvlpBmYrHI6nUcE1i0jOwe5V0tpHD3Lv76aA==
X-Gm-Gg: AZFdTZceVChNaorx4d0AO8aWdtl7k6tU8A971RkiedTj8ToIaWdiB+Y/R1R6locNAk9
	wrHAeg1R6bAySIDMiHFYm89Pxeyy20Z3zHspiCG59u+InkrwO+oJJ2JDvROYcvGq7Y1UEQketS6
	GDzk5rCjM6KTF9acnVnRAS3Kc7O2cprPEC0P2vbfKi6Ggvdr7IO7MCBZBLRvpluBEto/Tjoa5JF
	jclidFdfRkBIPkByKsVZ0yaxWdoF0SYovhb6CQ1+fjcCjzCok78di9mbdJG5Yeci4dzdoONu0Rr
	HYEEXKTELekwkQnowh6ZW9IerJNfLoqCCLoKh7BKxGg8n4qucZDm5hdDzV6a1Mc1/Mm8ewx6fKX
	ttjf2bR7j4eNFXpz5FGLGJp9Ja+updW9BOz5PBH9zs6oShXHngN80pvfxVcuhX+7qr0AenIRRd9
	dM8+GuQsgMTXlktfSIfTjdKekW5M6nSqnQhLTKqiTsViNhsNAXGkq7fYrSr1sRCnP5a8Eqz0ADO
	fjFuvKOKKlqO74Ox0P4WyHXYuV5CeLZ3YR5/lhaiwu1grAgnQIbloENm0hs4J21I8hL+Y8bV2p/
	L2pkC/F4S+JFUmoOpG+KRCjOMK7GHLbwuje1AL/+eFqxKTQcH9OZ5R+zpDxjFmUxRjEXkEDDm0p
	dNd/ILmVoygMG41ncJw==
X-Received: by 2002:a05:701a:cccb:10b0:179:a1d0:be39 with SMTP id a92af1059eb24-1b56b709cfbmr13326465c88.29.1795655827857;
        Wed, 25 Nov 2026 17:17:07 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:f528:8797:fe51:9f7e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm53346690c88.7.2026.11.25.17.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 17:17:07 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Wed, 25 Nov 2026 17:17:01 -0800
Subject: [PATCH kgl] Add never_mark_spam option for Gmail targets
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
Message-Id: <20261125-gmail-never-mark-spam-v1-1-479d47b1b3b1@gmail.com>
X-B4-Tracking: v=1; b=H4sIAIyIB2sC/yWM0Q6CMAwAf4X02SZuRkR/xfBQRp0VNkkrxITw7
 059vEvuVjBWYYNLtYLyIibPXMDtKgh3ypFR+sLg9752zh8xJpIRMy+smEgHtIkSNs2Jzr53dTg
 QlHZSvsn7973CEEdo/9Lm7sHh9T3Ctn0AJKhPe34AAAA=
X-Change-ID: 20261125-gmail-never-mark-spam-887a92d16c3a
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.17-dev

Gmail's messages.import API classifies imported mailing list traffic
through spam filtering by default, which can cause legitimate patch
series or list messages to land in the Spam folder instead of the
configured labels.

Add an optional boolean never_mark_spam setting (defaulting to false)
for Gmail targets. When enabled, korgalore passes neverMarkSpam=true
on Gmail message imports so imported messages bypass spam
classification, while leaving default API requests unchanged when
omitted or false.

Document the new option in the configuration guide, man page, and
example config, and cover option validation and API behavior with
unit tests.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Add an optional never_mark_spam boolean configuration option for Gmail
targets (defaulting to false). When enabled, korgalore passes
neverMarkSpam=true when importing messages via Gmail's messages.import
API so legitimate mailing list traffic is not placed in Spam.
---
 docs/configuration.rst        |   4 ++
 korgalore-example.toml        |   2 +
 man/korgalore.toml.5          |   5 ++
 src/korgalore/cli.py          |   5 +-
 src/korgalore/gmail_target.py |  19 ++++++-
 tests/test_gmail_target.py    | 115 +++++++++++++++++++++++++++++++++++++++++-
 6 files changed, 145 insertions(+), 5 deletions(-)

diff --git a/docs/configuration.rst b/docs/configuration.rst
index c0f803b..084f3c9 100644
--- a/docs/configuration.rst
+++ b/docs/configuration.rst
@@ -422,6 +422,10 @@ Gmail Target Parameters
   leading ``~`` are expanded, but no shell runs it. The bearer token returned by the command must carry the OAuth
   scopes required by korgalore (``https://www.googleapis.com/auth/gmail.labels``
   and ``https://www.googleapis.com/auth/gmail.insert``).
+* ``never_mark_spam``: (Optional) Boolean specifying whether Gmail should ignore
+  spam classification for imported messages (default: ``false``). When
+  ``true``, passes ``neverMarkSpam=true`` to the Gmail ``messages.import`` API
+  so imported messages are never placed in Spam.
 
 Maildir Target Parameters
 ~~~~~~~~~~~~~~~~~~~~~~~~~~
diff --git a/korgalore-example.toml b/korgalore-example.toml
index 0551bc4..a262c04 100644
--- a/korgalore-example.toml
+++ b/korgalore-example.toml
@@ -5,6 +5,8 @@ type = 'gmail'
 credentials = '/path/to/personal-credentials.json'
 # Alternatively, obtain tokens from an external command:
 # token_command = 'oama access personal'
+# Prevent Gmail from marking imported messages as spam (default: false):
+# never_mark_spam = true
 
 [targets.work]
 type = 'gmail'
diff --git a/man/korgalore.toml.5 b/man/korgalore.toml.5
index a2890c5..827c9f1 100644
--- a/man/korgalore.toml.5
+++ b/man/korgalore.toml.5
@@ -44,6 +44,11 @@ It is split like a shell command line, and \fI$VARS\fR and a leading
 \fI~\fR are expanded, but no shell runs it. The bearer token must carry the OAuth scopes required by
 korgalore (\fIhttps://www.googleapis.com/auth/gmail.labels\fR and
 \fIhttps://www.googleapis.com/auth/gmail.insert\fR).
+.TP
+.B never_mark_spam
+(Optional) Boolean specifying whether Gmail should never mark imported
+messages as spam (default: \fIfalse\fR). When \fItrue\fR, passes
+\fIneverMarkSpam=true\fR to the Gmail \fBmessages.import\fR API.
 .RE
 .PP
 .B Maildir Targets
diff --git a/src/korgalore/cli.py b/src/korgalore/cli.py
index e98d4be..4c0c9d5 100644
--- a/src/korgalore/cli.py
+++ b/src/korgalore/cli.py
@@ -54,7 +54,7 @@ from korgalore.digest import (
     strip_reply_prefixes,
 )
 from korgalore.dummy_target import DummyTarget
-from korgalore.gmail_target import GmailTarget, make_gmail_credentials
+from korgalore.gmail_target import GmailTarget, make_gmail_credentials, parse_gmail_never_mark_spam
 from korgalore.imap_target import ImapTarget
 from korgalore.jmap_target import JmapTarget
 from korgalore.lei_feed import LeiFeed
@@ -339,13 +339,14 @@ def get_gmail_target(
 ) -> GmailTarget:
     """Create a Gmail target service instance."""
     try:
+        never_mark_spam = parse_gmail_never_mark_spam(details.get('never_mark_spam'), identifier)
         creds = make_gmail_credentials(
             identifier=identifier,
             details=details,
             interactive=interactive,
             config_dir=get_xdg_config_dir(),
         )
-        gt = GmailTarget(identifier=identifier, creds=creds)
+        gt = GmailTarget(identifier=identifier, creds=creds, never_mark_spam=never_mark_spam)
     except ConfigurationError as fe:
         logger.critical('Error: %s', str(fe))
         raise click.Abort() from fe
diff --git a/src/korgalore/gmail_target.py b/src/korgalore/gmail_target.py
index 7b09756..263f6c2 100644
--- a/src/korgalore/gmail_target.py
+++ b/src/korgalore/gmail_target.py
@@ -24,20 +24,32 @@ SCOPES = [
 ]
 
 
+def parse_gmail_never_mark_spam(value: Any, identifier: str) -> bool:
+    """Validate and normalize the Gmail target ``never_mark_spam`` option."""
+    if value is None:
+        return False
+    if not isinstance(value, bool):
+        raise ConfigurationError(f"Gmail target '{identifier}': 'never_mark_spam' must be a boolean.")
+    return value
+
+
 class GmailTarget:
     """Target class for delivering email messages to Gmail via the API."""
 
     DEFAULT_LABELS: list[str] = ['INBOX', 'UNREAD']
 
-    def __init__(self, identifier: str, creds: BaseCredentials) -> None:
+    def __init__(self, identifier: str, creds: BaseCredentials, never_mark_spam: bool = False) -> None:
         """Initialize a GmailTarget instance.
 
         Args:
             identifier: Unique identifier for this Gmail target.
             creds: Google API credentials instance.
+            never_mark_spam: Whether to pass ``neverMarkSpam=True`` when
+                             importing messages into Gmail.
         """
         self.identifier = identifier
         self.creds = creds
+        self.never_mark_spam = parse_gmail_never_mark_spam(never_mark_spam, identifier)
         self.service: Resource | None = None
         self._label_map: dict[str, str] | None = None
 
@@ -156,7 +168,10 @@ class GmailTarget:
                 message_body['labelIds'] = label_ids
 
             # Upload the message
-            result = self._api().users().messages().import_(userId='me', body=message_body).execute()
+            import_kwargs: dict[str, Any] = {'userId': 'me', 'body': message_body}
+            if self.never_mark_spam:
+                import_kwargs['neverMarkSpam'] = True
+            result = self._api().users().messages().import_(**import_kwargs).execute()
 
             return result
 
diff --git a/tests/test_gmail_target.py b/tests/test_gmail_target.py
index 2c59b1b..ec9511a 100644
--- a/tests/test_gmail_target.py
+++ b/tests/test_gmail_target.py
@@ -2,14 +2,17 @@
 
 import base64
 from pathlib import Path
+from typing import Any
 from unittest.mock import MagicMock, patch
 
+import click
 import pytest
 from google.auth.credentials import Credentials as BaseCredentials
 from googleapiclient.errors import HttpError  # type: ignore[import-untyped]
 
 from korgalore import AuthenticationError, ConfigurationError, RemoteError
-from korgalore.gmail_target import SCOPES, GmailTarget, make_gmail_credentials
+from korgalore.cli import get_gmail_target
+from korgalore.gmail_target import SCOPES, GmailTarget, make_gmail_credentials, parse_gmail_never_mark_spam
 from korgalore.google_creds import CommandCredentials, OAuthFileCredentials
 
 
@@ -57,8 +60,19 @@ class TestGmailTargetInit:
 
         assert target.identifier == 'test'
         assert target.creds is mock_creds
+        assert target.never_mark_spam is False
         assert target.service is None
 
+    def test_init_with_never_mark_spam(self) -> None:
+        """Stores never_mark_spam when explicitly enabled and validates its type."""
+        mock_creds = MagicMock(spec=BaseCredentials)
+        target = GmailTarget('test', creds=mock_creds, never_mark_spam=True)
+        assert target.never_mark_spam is True
+
+        bad_value: Any = 'true'
+        with pytest.raises(ConfigurationError, match="'never_mark_spam' must be a boolean"):
+            GmailTarget('test', creds=mock_creds, never_mark_spam=bad_value)
+
     @pytest.mark.parametrize(
         ('creds', 'expected'),
         [
@@ -309,6 +323,27 @@ class TestGmailTargetImportMessage:
 
         assert [r['id'] for r in results] == ['msg0', 'msg1', 'msg2', 'msg3', 'msg4']
 
+    def test_import_omits_never_mark_spam_by_default(self, gmail_labels: tuple[GmailTarget, MagicMock]) -> None:
+        """Default import_ message calls omit neverMarkSpam."""
+        target, service = gmail_labels
+        service.users().messages().import_().execute.return_value = {'id': 'msg123'}
+
+        target.import_message(b'From: test@example.com\r\nSubject: Test\r\n\r\nBody', ['INBOX'])
+
+        kwargs = service.users().messages().import_.call_args[1]
+        assert 'neverMarkSpam' not in kwargs
+
+    def test_import_passes_never_mark_spam_when_enabled(self, gmail_labels: tuple[GmailTarget, MagicMock]) -> None:
+        """Passes neverMarkSpam=True to Gmail API when never_mark_spam is enabled."""
+        target, service = gmail_labels
+        target.never_mark_spam = True
+        service.users().messages().import_().execute.return_value = {'id': 'msg123'}
+
+        target.import_message(b'From: test@example.com\r\nSubject: Test\r\n\r\nBody', ['INBOX'])
+
+        kwargs = service.users().messages().import_.call_args[1]
+        assert kwargs['neverMarkSpam'] is True
+
 
 # Most config errors are found before a token path is needed, so these
 # tests never touch the config directory.
@@ -368,3 +403,81 @@ class TestMakeGmailCredentials:
         mock_credentials.from_authorized_user_file.assert_called_once_with(str(default_token))
         assert isinstance(creds, OAuthFileCredentials)
         assert creds._scopes == SCOPES
+
+
+class TestParseGmailNeverMarkSpam:
+    """Tests for parse_gmail_never_mark_spam configuration helper."""
+
+    @pytest.mark.parametrize(
+        ('value', 'expected'),
+        [
+            (None, False),
+            (False, False),
+            (True, True),
+        ],
+        ids=['none', 'false', 'true'],
+    )
+    def test_valid_values(self, value: bool | None, expected: bool) -> None:
+        """Accepts None (defaults to False) and boolean values."""
+        assert parse_gmail_never_mark_spam(value, 'test') is expected
+
+    @pytest.mark.parametrize(
+        'value',
+        ['true', 1, 0, []],
+        ids=['str', 'int-one', 'int-zero', 'list'],
+    )
+    def test_invalid_values_raise(self, value: object) -> None:
+        """Non-boolean values raise ConfigurationError."""
+        with pytest.raises(ConfigurationError, match="Gmail target 'test': 'never_mark_spam' must be a boolean"):
+            parse_gmail_never_mark_spam(value, 'test')
+
+
+class TestGetGmailTarget:
+    """Tests for get_gmail_target configuration wiring."""
+
+    @pytest.mark.parametrize(
+        ('extra', 'expected'),
+        [
+            ({}, False),
+            ({'never_mark_spam': False}, False),
+            ({'never_mark_spam': True}, True),
+        ],
+        ids=['default', 'false', 'true'],
+    )
+    def test_get_gmail_target_never_mark_spam(self, extra: dict[str, object], expected: bool) -> None:
+        """Wires never_mark_spam from target config onto GmailTarget."""
+        details: dict[str, object] = {'token_command': 'get-token', **extra}
+        with patch('korgalore.cli.get_xdg_config_dir', return_value=UNUSED_CONFIG_DIR):
+            target = get_gmail_target('test', details)
+        assert target.never_mark_spam is expected
+
+    @pytest.mark.parametrize(
+        'bad_value',
+        ['true', 1, 0, []],
+        ids=['str', 'int-one', 'int-zero', 'list'],
+    )
+    def test_get_gmail_target_invalid_never_mark_spam_aborts(
+        self, bad_value: object, caplog: pytest.LogCaptureFixture
+    ) -> None:
+        """Invalid never_mark_spam type logs an error and raises click.Abort."""
+        details: dict[str, object] = {'token_command': 'get-token', 'never_mark_spam': bad_value}
+        with (
+            patch('korgalore.cli.get_xdg_config_dir', return_value=UNUSED_CONFIG_DIR),
+            pytest.raises(click.Abort),
+        ):
+            get_gmail_target('test', details)
+        assert "'never_mark_spam' must be a boolean" in caplog.text
+
+    def test_get_gmail_target_validates_never_mark_spam_before_credentials(
+        self, caplog: pytest.LogCaptureFixture
+    ) -> None:
+        """Invalid never_mark_spam aborts before attempting credential setup or OAuth I/O."""
+        details: dict[str, object] = {'credentials': '/nonexistent/creds.json', 'never_mark_spam': 'true'}
+        with (
+            patch('korgalore.cli.get_xdg_config_dir', return_value=UNUSED_CONFIG_DIR),
+            patch('korgalore.cli.make_gmail_credentials') as mock_make_creds,
+            pytest.raises(click.Abort),
+        ):
+            get_gmail_target('test', details)
+        mock_make_creds.assert_not_called()
+        assert "'never_mark_spam' must be a boolean" in caplog.text

---
base-commit: e03bad1710f869192373ec22278f6f0ea3aef9e6
change-id: 20261125-gmail-never-mark-spam-887a92d16c3a

Thanks.

-- 
Dmitry

