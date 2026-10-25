Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792953785;
	b=Fo3IVNkR3FcawdqcR1pjtjAj1BA9ZFX/gTyOqOvs3Ty1dUNWYzjPFh0ecaFDvZwIAhv8
	 BIEGnAqI7OzkyJiVCUIz8AGlIU5SFvEwIJGRAzvWdYCfH8tQNCmXinlT+mWsyi4cBCZEn
	 HjhEdZtNppgBvd68rHLe88X/dNukzHLlM8BtTOTdPyIb0CQSMGO0kpqsjUoIjqY36gPoN
	 60DlXFFahsUrYjeJsK12GSngJnwgdjkwd+BxB7naFQiPZvsOh5gMUKOwk7nD5aI9md7LB
	 oh+EjrrHI3NRNZAwhdcIV/9G3hx4bQ9+785mPlt83haJYBKgBVks18R62PNpXMDErFw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792953785;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer;
	bh=Gn+Yl+0RnRqOKnBOhbDi8NXQmjsnG393oVpvLnPerUE=;
	b=GzDHMUZbPWxFH7FI4iVskK6fiAixAEhAmpy6yviESy0Ar7nefDLbdR+aqWVNPi6aUaZ3
	 baUJDCtpRqGPJ64hGELk8kthnqqebqvhD7KAVXqUjFQ/arB8VV9XOeKzJ65lgYBBJwDs6
	 36xKoyQEC0lLAqA4mODmnuLPHGPJM5/3P/jkP5ds4y136MrFlMoXgWBgZ5K3QaeEphEFW
	 PyK0pGc8evu/u+gZ99MzGrt42PjSQD6bJDzJquBMsacuT0kv2bjyITyO+AHf+Rz4lAFTC
	 GnnkP+arf4TxvVptsiMqBE3yZCeMPzh6dWTe1JBtvMF6iIjofAdYJFIW91DLsi1Ma+g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SCPHtbMD;
	arc=fail smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C991606A31A
	for <tools@linux.kernel.org>; Sun, 25 Oct 2026 18:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SCPHtbMD
Received: by smtp.kernel.org (Postfix)
	id AD3B21F01825; Sun, 25 Oct 2026 18:43:04 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792953784;
	b=vq/eeJh9bHZa59pRpIi0TOziih4J1mpFa81w1t4PaashVLHkvRANydwSMWMzq6Zd1riR
	 bQpte2Zas+RiTa0IYO2+94/aNKSJRyT1p4QgAWYD/5WNwdiFPYhEjQ8072GGvTxTPcFAS
	 4amjets0LCZgXpgulkKLugX+pGi8tRymW8q2Pvz8VSY/3j+41mEw9xJ8LFdOTljuby8yk
	 3TAl5UCxSmDuhc92OG08xMmk5RImx/y/49ELuWoACx6FDYwAnNki9CXqdlOSTJ4bSWARp
	 KsP/Ruw6KrNo7Wfwkfa59Xggw1hM2D4SYKpMetvmsdgammgOz/ULq/Kiqwm7B+w5eAA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792953784;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=Gn+Yl+0RnRqOKnBOhbDi8NXQmjsnG393oVpvLnPerUE=;
	b=QdwC5ztwd0TZFV+UaYj8gyYJ5/mY4HE7RwfF5+i91QfKTxUefyjcF1XjfJeFCtIDwhuK
	 XE+WR5Pmmyy3utlJaYbBRkomYdhm+TxyvTuMOUEPWfpAbzRVdvIgoRmXI+hmigo0Acl/z
	 qLMJQu8JIraPupEZAWL7IuRs0CUTVO8lxczHDvRClbyxpmxzdTqY0GwuY43xuv//nDNYs
	 oSQoCEO1KyFxMsdTg7nizX2EMnI20k3QxgLwMDJYkdyA6p7oqHhlIivSjyH9g2egedphA
	 YPeSFBniuuVTBDSGPO8xb7f/Nw0s/RLMTBz7Ak7loL3Y4OUWgbitQc0Fs8z9CLGMLUA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SCPHtbMD;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 68E2D1F031E1
	for <tools@kernel.org>; Sun, 25 Oct 2026 18:43:03 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SCPHtbMD
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 68E2D1F031E1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7f84a55cc06so1437145a34.2
        for <tools@kernel.org>; Sun, 25 Oct 2026 11:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792953782; x=1793558582; darn=kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Gn+Yl+0RnRqOKnBOhbDi8NXQmjsnG393oVpvLnPerUE=;
        b=SCPHtbMDAqS+VRSQxCYOKFYmovW+kNNSYZ0rLCNCSYM6/oTcPZOZlo1qHosK7d7sQh
         rQoLwlpbhviF6lFAz7N6VKCPYwn7/FHt/6QBV61ly/3vF2Lmqw8pTNoYee2e73phOuZO
         TrW7qh3bYFXTXtEWUj33xZ61x/Q6tHk27euCB7LhK9U/VYK3Yxvkq0WPO1Th983DU9Fd
         2bijZzlpV5mZ3bm4P8NqE4wMLqc4EgZlmzphlE1nmdN7S5pyPeO+HwyRKTd3Q+4VhGnb
         7kXjMXv8bZzwMj6AxEkIcpvzkqn29+MiixFOSnXP1l1AdBU8RP0niCBFeioSC0999iQ2
         qHjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792953782; x=1793558582;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Gn+Yl+0RnRqOKnBOhbDi8NXQmjsnG393oVpvLnPerUE=;
        b=HvUJiQkxecPfnR4GH2Zc1qF9MwQxN8bAvF0pk8ysFAgV+xSJjx4zwJzOPjp+yKFsux
         skpJhT+u0wIahDb3KmM31IZ2rnrtnNhPWZGHXeM14aD5dG4q+A/CPOkPa3S5cMldJUIP
         WVE6F72PXDh6TzQMGuYGqtivcXNkrISI9UQ0d2QW9No0edMG+1bSaAgLvgU+J7qXbBis
         PqJxip+l/Fhz6DksxdOB/JBTjHgw1aAPylbhp+WUlF7abeg7p5UC3x+ljP4+PJScq1MC
         PBTJ0glP37ZSkZnYssbntlt8zjgNZB+iD6DR5k93aYESU0rHhvb8wXdV96XsTxEb2Pk8
         gvjQ==
X-Gm-Message-State: AFq9FYK9w6kJjvuEMJhKtUCp6LAA/DgFqNyb5yXTP1uc7BFg46Atit3g
	XNOLqyDxV7Nba0Hh3IxwxEJ0H4MPSoDPXkT0xYVc8fKc6cSLpfZ7LW2J
X-Gm-Gg: AYBFou1Hs7fzsJFeP5/HnTQ10OVFnR8xMJOntcpwsu7s5O9Q6QK0MUmF7toeu4EeH+w
	iAqY4V5FBEPm0fmaMIT1TiB1lxk97zMhC7I1eQYGSsHHSBLdFJhnDVkpiQxuaioMt1Xo8DLVkhT
	37IE9Ri7umQXex6j3ZD5eXQQfUxteukBB1P+uEgO5euLzlSEzCPhbgxSaeVUPb9OIRa4C4Cvlxe
	9nHVd1StDFJnt8nqbHawQjscvg0llic1tEkUIb2eq3Xo9orNNUXBpCKeKqVXY/skyLUZig+fYw9
	QGKLGSvGgJhKQVrAXd/fu5j86Cki4pABFnjuKjOzvfGMKm+szWoBPplVPRNqgrZYXZzPx4qrVI/
	zzRKRHF5as6226yQ0E/ghvBVpa1ApbVIuYnXlPkS9FW56Td/SrMwdGE0u16QpMz4bs5JnmUA6wA
	FrrJrK4AD+ce6eE++swJ1cnbrkicS284x23YVYpcazTcYps8oZM4E4ngVCjY8jO2sxOxCsqYdRG
	CeEiVoTpuhMypp2pcKtCHgl4IvHPqoNyQNWVyrmw4ZFxCidC5XSF6us/jSW9Jnt/PUNFJhTkolV
	eVgmTroehAPGUljs+Gdgxa/GWBHXo1pVGnm2jlR6tq+GoljQk7KwnCB7zIuQLszeVuubiX9InLz
	JZXhIWUpSorCCLJRrKSGrCrCM4FboFBO71rmHvOGjmrRE/Sa4uGmaz4f0wLOyQCzfCcpSt8C9y+
	mYmB8gxdjjXh4ZLMfmCLgsea3w
X-Received: by 2002:a05:6830:6ecc:b0:845:8d86:9f7f with SMTP id 46e09a7af769-850fda46f4cmr3053619a34.8.1792953782180;
        Sun, 25 Oct 2026 11:43:02 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fbb25f59sm5433787a34.20.2026.10.25.11.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 11:43:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 25 Oct 2026 12:42:50 -0600
Subject: [PATCH kgl] Preserve original dates when importing messages over
 IMAP
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
Message-Id: <20261025-submit-imap-preserve-date-v1-v1-1-91ac2f5b502e@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQrCMBAE0F8pc3ahWUxBf0U8xHZTV20tSQxC6
 b+76nGGmbciS1LJODYrklTN+pwtuF2D/hrmUUgHy+CWO9eyp/y6TFpIp7DQksTuVWgIRag6ip6
 D59h5PuxhhA2ivn/8CffxgfO/NOQmffnC2LYPrp25f4UAAAA=
X-Change-ID: 20261025-submit-imap-preserve-date-v1-f52a52f65294
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

IMAP APPEND currently omits its optional timestamp, so the server assigns
the import time even when the message has a valid Date header. Archived
messages consequently appear as newly received in clients that sort by
INTERNALDATE, including the Gmail web interface.

Supply the timestamp from Date, falling back to the first parseable
Received timestamp in header order and then Delivery-date. Interpret dates
without a known timezone as UTC, consistently with the digest parser.
Retain the server-time fallback when none of these headers is usable.
Leave mbox separator dates out because public-inbox exports may use a
synthetic epoch timestamp.

Add regression coverage for header precedence, timezone offsets, folded
headers, malformed dates, fallback selection and synthetic mbox separators.
Check that choosing an APPEND date leaves the delivered message unchanged.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 src/korgalore/imap_target.py |  35 +++++++++++++-
 tests/test_imap_target.py    | 112 ++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 144 insertions(+), 3 deletions(-)

diff --git a/src/korgalore/imap_target.py b/src/korgalore/imap_target.py
index ec645e8..9065512 100644
--- a/src/korgalore/imap_target.py
+++ b/src/korgalore/imap_target.py
@@ -2,6 +2,8 @@
 
 import imaplib
 import logging
+from datetime import UTC
+from email.utils import parsedate_to_datetime
 from pathlib import Path
 from typing import Any, cast
 
@@ -12,6 +14,32 @@ from korgalore.oauth2_imap import DEFAULT_CLIENT_ID, ImapOAuth2Authenticator
 logger = logging.getLogger('korgalore')
 
 
+def _get_internaldate(msg: RawMessage) -> str:
+    """Choose an APPEND date from message headers, or leave it to the server."""
+    headers = list(msg.parsed.raw_items())
+    for field in ('date', 'received', 'delivery-date'):
+        for name, value in headers:
+            if name.lower() != field:
+                continue
+            date_value = value
+            if field == 'received':
+                # Received headers are newest first; the date follows the last ';'.
+                _, separator, date_value = value.rpartition(';')
+                if not separator:
+                    continue
+            try:
+                date = parsedate_to_datetime(date_value)
+                # Treat dates without a known timezone as UTC, as in digests.
+                if date.tzinfo is None:
+                    date = date.replace(tzinfo=UTC)
+                return imaplib.Time2Internaldate(date)
+            except (OverflowError, TypeError, ValueError):
+                continue
+    # Public-inbox mbox separators can carry a dummy epoch date, not a receipt time.
+    logger.debug('No usable message date, using server time for IMAP APPEND')
+    return ''
+
+
 class ImapTarget:
     """Target for delivering messages to IMAP mail servers."""
 
@@ -283,10 +311,13 @@ class ImapTarget:
             logger.debug('Skipping import: message %s already in folder %s', msg.message_id, effective_folder)
             return {'skipped': True}
 
+        # Preserve the message date instead of sorting archived mail by import time.
+        date_time = _get_internaldate(msg)
+
         try:
             # Append message to folder
             # flags: empty string = no flags set (message will be unread)
-            # date_time: empty string = use current time (imaplib doesn't accept None)
+            # date_time: empty string falls back to server time
             try:
                 # imaplib type stubs are incomplete - append returns (str, list[Any])
                 typ, data = cast(
@@ -294,7 +325,7 @@ class ImapTarget:
                     imap.append(
                         effective_folder,
                         '',  # No flags (empty string)
-                        '',  # Use current time (empty string for default)
+                        date_time,
                         msg.as_bytes(feed_name, delivery_name),
                     ),
                 )
diff --git a/tests/test_imap_target.py b/tests/test_imap_target.py
index cd886f6..f32dcf7 100644
--- a/tests/test_imap_target.py
+++ b/tests/test_imap_target.py
@@ -229,7 +229,7 @@ class TestImapTargetImportMessage:
             mock_imap.append.assert_not_called()
 
     def test_import_success(self, connected: tuple[ImapTarget, MagicMock]) -> None:
-        """Message is appended with no flags, current time and normalized line endings."""
+        """A message without Date uses server time and normalized line endings."""
         target, mock_imap = connected
         mock_imap.append.return_value = ('OK', [b'[APPENDUID 1234 5678]'])
         raw_message = b'From: test@example.com\nSubject: Test\n\nBody'
@@ -247,6 +247,116 @@ class TestImapTargetImportMessage:
             RawMessage(raw_message).as_bytes(),
         )
 
+    @pytest.mark.parametrize(
+        ('date_header', 'internaldate'),
+        [
+            ('Sun, 25 Oct 2026 05:10:03 +0000 (GMT)', '"25-Oct-2026 05:10:03 +0000"'),
+            ('Sun, 25 Oct 2026 10:40:03 +0530', '"25-Oct-2026 10:40:03 +0530"'),
+            ('Sat, 24 Oct 2026 22:10:03 -0700', '"24-Oct-2026 22:10:03 -0700"'),
+            ('Sun, 25 Oct 2026\n 05:10:03 +0000', '"25-Oct-2026 05:10:03 +0000"'),
+            ('Sun, 25 Oct 2026 05:10:03 -0000', '"25-Oct-2026 05:10:03 +0000"'),
+            ('Sun, 25 Oct 2026 05:10:03', '"25-Oct-2026 05:10:03 +0000"'),
+        ],
+        ids=['utc-comment', 'positive-offset', 'negative-offset', 'folded', 'unknown-zone', 'no-zone'],
+    )
+    def test_import_preserves_message_date(
+        self, connected: tuple[ImapTarget, MagicMock], date_header: str, internaldate: str
+    ) -> None:
+        """Date takes precedence over receipt time without rewriting the message."""
+        target, mock_imap = connected
+        raw_message = (
+            'From: test@example.com\n'
+            'Received: by mx.example.com; Sun, 25 Oct 2026 05:10:06 +0000\n'
+            f'Date: {date_header}\n'
+            'Delivery-date: Sun, 25 Oct 2026 05:10:10 +0000\n\nBody'
+        ).encode()
+
+        target.import_message(raw_message, [])
+
+        mock_imap.append.assert_called_once_with('INBOX', '', internaldate, RawMessage(raw_message).as_bytes())
+
+    @pytest.mark.parametrize(
+        'date_header',
+        [
+            '',
+            'not a date',
+            'Sun, 32 Oct 2026 05:10:03 +0000',
+            'Sun, 25 Oct 2026 25:10:03 +0000',
+            'Sun, 25 Oct 2026 05:10:03 +2500',
+            'Sun, 25 Oct 2026 05:10:03 +99999999999999999999',
+        ],
+        ids=['empty', 'malformed', 'invalid-day', 'invalid-hour', 'invalid-offset', 'overflow'],
+    )
+    @pytest.mark.parametrize('has_received', [False, True], ids=['server-time', 'received-time'])
+    def test_import_invalid_date_falls_back(
+        self, connected: tuple[ImapTarget, MagicMock], date_header: str, has_received: bool
+    ) -> None:
+        """An unusable Date header must not prevent message delivery."""
+        target, mock_imap = connected
+        raw_message = f'From: test@example.com\nDate: {date_header}\n'.encode()
+        if has_received:
+            raw_message += b'Received: by mx.example.com; Sun, 25 Oct 2026 05:10:06 +0000\n'
+        raw_message += b'\nBody'
+
+        target.import_message(raw_message, [])
+
+        expected = '"25-Oct-2026 05:10:06 +0000"' if has_received else ''
+        mock_imap.append.assert_called_once_with('INBOX', '', expected, RawMessage(raw_message).as_bytes())
+
+    @pytest.mark.parametrize(
+        ('received_headers', 'internaldate'),
+        [
+            (
+                'Received: by last.example.com; Sun, 25 Oct 2026 05:10:06 +0000\n'
+                'Received: by first.example.com; Sun, 25 Oct 2026 05:10:04 +0000\n',
+                '"25-Oct-2026 05:10:06 +0000"',
+            ),
+            (
+                'Received: by last.example.com; invalid\n'
+                'Received: by first.example.com; Sun, 25 Oct 2026 05:10:04 +0000\n',
+                '"25-Oct-2026 05:10:04 +0000"',
+            ),
+            (
+                'Received: from sender.example.com\n by mx.example.com;\n Sun, 25 Oct 2026 10:40:06 +0530\n',
+                '"25-Oct-2026 10:40:06 +0530"',
+            ),
+            (
+                'Received: Sun, 25 Oct 2026 05:10:06 +0000\n',
+                '"25-Oct-2026 05:10:10 +0000"',
+            ),
+            ('Received: by mx.example.com; invalid\n', '"25-Oct-2026 05:10:10 +0000"'),
+            ('', '"25-Oct-2026 05:10:10 +0000"'),
+        ],
+        ids=['latest-received', 'skip-invalid-received', 'folded', 'no-semicolon', 'invalid', 'absent'],
+    )
+    def test_import_receipt_date_fallbacks(
+        self, connected: tuple[ImapTarget, MagicMock], received_headers: str, internaldate: str
+    ) -> None:
+        """Use the first valid Received timestamp before trying Delivery-date."""
+        target, mock_imap = connected
+        raw_message = (
+            f'From: test@example.com\nDelivery-date: Sun, 25 Oct 2026 05:10:10 +0000\n{received_headers}\nBody'
+        ).encode()
+
+        target.import_message(raw_message, [])
+
+        mock_imap.append.assert_called_once_with('INBOX', '', internaldate, RawMessage(raw_message).as_bytes())
+
+    def test_import_ignores_dummy_mbox_date(self, connected: tuple[ImapTarget, MagicMock]) -> None:
+        """The archive's synthetic mbox separator is not a fallback date."""
+        target, mock_imap = connected
+        raw_message = (
+            b'From mboxrd@z Thu Jan  1 00:00:00 1970\n'
+            b'From: test@example.com\n'
+            b'Date: invalid\n'
+            b'Received: by mx.example.com; invalid\n'
+            b'Delivery-date: invalid\n\nBody'
+        )
+
+        target.import_message(raw_message, [])
+
+        mock_imap.append.assert_called_once_with('INBOX', '', '', RawMessage(raw_message).as_bytes())
+
     @pytest.mark.parametrize(
         ('folder', 'subfolder', 'expected'),
         [

---
base-commit: ea22e7c8701e566328f197c748718cd689f9ea28
change-id: 20261025-submit-imap-preserve-date-v1-f52a52f65294

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

