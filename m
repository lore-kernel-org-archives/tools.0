Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794601339;
	b=q8R1kaI/uEppT4/21ca3Rj4j5YTwLJIIK26+4lPRjZJ4oIDCjhyIX3Ixpi0uZT4YvTHO
	 C0PI4uV/R+lb4M1kzdhk+o75S6GWoGWapeLdKcwdugF+w447e6/jt/u2F7gN6dhgUstuj
	 ifIjQ+F/zwfUWZpwXVKWOOEcn4FpRbYBNf5+nsqzTpGPnWWdPIEiRa3KTLuIXeeDvfP0L
	 MkuZNa3Mh8ZzxP11LYDNhqsMxIG++CYfCRSl4iWla+773A8zP2KF2OZgraBA8sn0IRpJj
	 MnFjg2RWSpmXZbG7QFo0HsvpW8Qr1R0QyhiiN5xQDg+lXM9YcuIQ8j5Pm2rZtGlmQ1w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794601339;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=F5xPlUC+035AH9ZB2VgV1YDTcc+CRSESOJH/XFXlNiQ=;
	b=yn1MZsq/0/k89w8PoZEBnuxJYjPc7AAUv99beJs6qAnuUUhGxtSnESj6aJaymEMGnFip
	 MhftkHuubnrxw89wDY1QA/mpt4nbJ+FnhhvRvcmRQyQq/MUXJBQQgyTofWrEAcB3tTBNd
	 MOs57UIMjJ9kJ13KDXYoTCocKWDKvjPmeD1BNnhpBsAh6G2dBbZ1KvIUebny4fa5J7e/y
	 te7ez9yyyVOVMuR1vO7npfVaMqdVJcJC51e3hySRb3bPeQQ74W5H28joFK5bjQQwDveeV
	 huenB6qTerS96x9WN4JfWT/ZV8dfGDEVLXFDY/vbTYenkIVgo9g6m2hhz4zqgrsRDSw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Rw/1fXNT";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319C8606A331
	for <tools@linux.kernel.org>; Fri, 13 Nov 2026 20:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rw/1fXNT
Received: by smtp.kernel.org (Postfix)
	id 12D311F000C4; Fri, 13 Nov 2026 20:22:19 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794601339;
	b=LK7neye2+1LcgPgi1U9L7HGUbmoBGxRtEqzF1S4Jn7svqQ2OwKrn67Fgdlfueuy+FeIU
	 VW4KY9yTFhGBAqw9ME0m5Z9dAYbAcd+NY9PxyvfWW3OLZEhvk5X/95Ul0T/pNu86J+mcZ
	 z5iVWDm384lgWb1V+htl4Zz1HmDgihdd+JTKkfzwZct42zfq1N0ojWCPjMoHHTZNWTjhg
	 CzO3AVThhLMFooUd1rAWz6TCdwGRsGbGb7SWSriV8quU33L4ThH8KhyRg/oF+9Epq6m+q
	 7CqdTlk/dKQKSgXcvbQas2R/thqSQ4/MS8Bc4Gy9M+i89UPoxEj8hMVg4uPDraxGo1g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794601339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=F5xPlUC+035AH9ZB2VgV1YDTcc+CRSESOJH/XFXlNiQ=;
	b=dF24T4VPYlYiMHsKCnx2IP2PEq4droGwdkyAdX6rUaPqZGSs3/qJ6Q3+sX2AoYVvO9RG
	 4h2tY4+qMvKFqnZsvusNbCVN3aQuqwOFH6o4DEJ1HAwPk75j3TseYM1V9zo0K+wqWx1lu
	 kfFF8wcs76wKOLLK8KBI61euTBSfMpxBj26cwcHIDHaTbo6Y9SPNZyJdPKbx7DjljdczE
	 U7Ke1J3lxjjnYsWfZ7HM6CJ8QMwAvSFpMn5q4HoPbkKGwmvYqgDsk5FJVE7Yk/qhKzKGu
	 wlHkR+cGN9vbaxOcZf9rydATGmfy26i/Va80e2GLK+GC9//c1h6EoDOEZO+9rfmqmEg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Rw/1fXNT";
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 989971F000CC
	for <tools@kernel.org>; Fri, 13 Nov 2026 20:22:16 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rw/1fXNT
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 989971F000CC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-84a248254f4so1487964a34.0
        for <tools@kernel.org>; Fri, 13 Nov 2026 12:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794601335; x=1795206135; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F5xPlUC+035AH9ZB2VgV1YDTcc+CRSESOJH/XFXlNiQ=;
        b=Rw/1fXNTsmuPgQmHwjOY77xZ6phc23KFp9Mz7oVsotG8Mj2mA6zsbwuetX/ZEy6Pol
         bQ9RPlMIfrupEV/9VJgWu1qwer4fkFcm0Q+yzIBBVKfWUXjhXKtMwJq/AhO3mJO7pUGS
         pX2MD1lKLuhCb09ltPjdE2zxclCbKJnw8y+oL5jvEtuHk/M8EidxDY7XraZATwNmPahw
         7MRKUzrLG9BxRp5mnq9tyDehKm0p4nJkzlB3WlVi79mM4Bl0Wi8S3Z5/qNuU7vYekopJ
         8qwbovVm/PhYoN9NT6rrSz+K3Xq+X+ekKH8kdeHVaF9WkLnVHwM7u7cjXcLDxaaSfSn8
         UN/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794601335; x=1795206135;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F5xPlUC+035AH9ZB2VgV1YDTcc+CRSESOJH/XFXlNiQ=;
        b=UR6U+jsxK9eh6m/YMoabj4nVuxpsG773tr4ouBY2lcIH2ztyUGSojvyQVS39NJ136P
         ufXfC+6Eln7Mjgpi92pFer+/CXbhT9MJtkneutbF76DAijFOw+T0m3faCdwxeYe+Ehx0
         NCwzim4GSnbV3bnVvJkbQ7VUGg2rsljujLIzaV/k6aPDIHTPpjMD9lpK5ZSGbAHfTNFi
         hRO8gaSyh7yB7Tz/mrnEneEiaziOpGM535u+CpWUkTMlKa5ogI6kDvWdqr8XACuahS3B
         20FG3NBQ2x/q938jZ9lax/gRGRu81rl+92LdKh/TcPBoWyZqKzZdFP9cg9jQxROWgoMg
         sM7A==
X-Gm-Message-State: APuU4Z8DJPbMrQrUBNYZshNLPA/x7ZgraGkdqGmC6pcgVzgZHtjuvtyh
	cBKrpWMnahOWDPYhUD0WZTuwOfdSw8cqmT7KUMrjREZEJRHPLjJcytp9
X-Gm-Gg: AYBFou3WNCznGaspyc1fNvEzqbSbL7nnkb5OdD/qGUdCYHfsbRDw9L2rJgDAScXIrG9
	imDlMWX2nHvkUo+P2wOKKNJweqTpCIntdLKF19iOQ4vpTsw6rIyyD3I1LizgqA6rRV1HJTKaucE
	nUCqLRodo3J9wNRFQazJ8uswzOgfYYigiK+mScv/nMueToCBu/tWREvK1b8WpyO2BkBtqMCKGPm
	Qsx5YsHW1ddCfWCFcc9MqTARTknEFeBBU6cLGPtGVLuIMoWumXHcFBG4K/fsnxwsWQf6v/TVEd7
	DFTm8sztjoOy32y5rKGMct07NrTGmlsGm38IwWKJzLsXCtB4E2R1NuaP/ritCd45hQ3LUzhAiaJ
	z123Dpdu5V9WrMQu1HoR6hfVgCTiV/ztcQwmOU21KaQk7tnRyn/OF/B1Wj0tkGonwkzVB16kNz+
	BG5NvhHuhm9KR7GxBCT4mATw/kB0KFV2Lit4w7JNyQlMWDryt5T3yzKKDoKQWMsNynnAFEjUfQs
	km8h9RmzDI1u4q4LzCHszJbg2Y7W/w9hq1eGWZj7/U0fUVcwI4M9/VVpt5Zi+jTCFrFkG2WxTSy
	8boiSOJo0HtTnsAXOIgd2ehxSQ3xAqUprj4WrO6Uho1ktiAjnfvhkDboILAxiY69/wRfFvHefBW
	o347P8DLsHefJrqH1Z1ShS8KqDYTm9uX1fPTamIv68Acn0tZnZcg2uN8LfkEtpzaGfios1QxSMo
	GWjrqTwWHGVy2+UieV5p6jhy7kk9YIB4FRJshMgS278naRj9GoxLo=
X-Received: by 2002:a05:6830:81d4:b0:81b:ac9a:5681 with SMTP id 46e09a7af769-8628990e23dmr2657067a34.29.1794601335478;
        Fri, 13 Nov 2026 12:22:15 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862880e98ebsm3585809a34.12.2026.11.13.12.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 12:22:15 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 13:02:18 -0700
Subject: [PATCH b4 5/5] send: offer interactive retry after known SMTP
 failures
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
Message-Id: <20261113-submit-b4-send-resume-v1-v1-5-af325aad1179@gmail.com>
References: <20261113-submit-b4-send-resume-v1-v1-0-af325aad1179@gmail.com>
In-Reply-To: <20261113-submit-b4-send-resume-v1-v1-0-af325aad1179@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Gabriel Goller <g.goller@proxmox.com>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

A temporary SMTP rejection often needs only a fresh connection, rather
than another command invocation. Offer an immediate retry during regular
submissions and --resume when the recorded result makes another attempt
safe.

Reconnect only after an affirmative answer and continue from the saved
recipient progress. Default to stopping, preserving the journal for later.
Do not prompt with --no-interactive or non-terminal input, or when delivery
is uncertain or a local journal operation failed.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 docs/contributor/send.rst     |   8 ++
 src/b4/ez.py                  |  25 +++-
 src/b4/man/b4.1               |   4 +
 src/b4/man/b4.1.rst           |   4 +
 src/tests/test_send_resume.py | 315 +++++++++++++++++++++++++++++++++++++++++-
 5 files changed, 347 insertions(+), 9 deletions(-)

diff --git a/docs/contributor/send.rst b/docs/contributor/send.rst
index df34741..3ea091f 100644
--- a/docs/contributor/send.rst
+++ b/docs/contributor/send.rst
@@ -293,6 +293,14 @@ Resuming an interrupted SMTP submission
 
 .. versionadded:: v0.17
 
+When SMTP connection setup fails, or the server explicitly rejects a
+message or some recipients, interactive submissions
+offer ``Retry sending to the remaining recipients now? [y/N]``. Answering
+``y`` reconnects and continues using the saved messages and recipient
+progress. Enter, ``n``, EOF or Ctrl-C stops and preserves that progress.
+No retry prompt is shown with ``--no-interactive`` or non-terminal input,
+or when the delivery outcome is uncertain.
+
 To continue a stopped SMTP submission later (for example, after a sending
 quota resets), run from the same branch::
 
diff --git a/src/b4/ez.py b/src/b4/ez.py
index d1c779d..ff922df 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -36,6 +36,7 @@ import b4
 import patatt
 from b4._rewrite import ThirdpartyCommitterError, rewrite_commits
 from b4._send import (
+    RetryableSendError,
     SendSession,
     State,
     pending_session,
@@ -3413,6 +3414,26 @@ def _get_resume_smtp(
     return smtp
 
 
+def _send_with_retry(
+    session: SendSession, smtp: b4.SMTPConnector, *, no_interactive: bool
+) -> None:
+    while True:
+        try:
+            session.send(smtp)
+            return
+        except RetryableSendError as exc:
+            if no_interactive or not sys.stdin.isatty():
+                raise
+            logger.error('%s', exc)
+            try:
+                answer = input('Retry sending to the remaining recipients now? [y/N] ')
+            except EOFError:
+                answer = ''
+            if answer.strip().lower() not in {'y', 'yes'}:
+                raise
+            smtp = _get_resume_smtp(session)
+
+
 def _resume_send(cmdargs: argparse.Namespace, session: SendSession) -> None:
     state = session.state
     logger.info('Saved submission: <%s>', state.cover_message_id)
@@ -3461,7 +3482,7 @@ def _resume_send(cmdargs: argparse.Namespace, session: SendSession) -> None:
     input('Press Enter to resume or Ctrl-C to abort')
     if cmdargs.resolve_uncertain:
         session.resolve(cmdargs.resolve_uncertain)
-    session.send(smtp)
+    _send_with_retry(session, smtp, no_interactive=cmdargs.no_interactive)
     _finish_send(session)
 
 
@@ -3961,7 +3982,7 @@ def _cmd_send(cmdargs: argparse.Namespace, directory: pathlib.Path) -> None:
             )
             _check_send_source(session)
             logger.info('Saved SMTP submission in %s', session.directory)
-            session.send(smtp)
+            _send_with_retry(session, smtp, no_interactive=cmdargs.no_interactive)
             _finish_send(session)
             return
 
diff --git a/src/b4/man/b4.1 b/src/b4/man/b4.1
index b6d6b65..b9ea52c 100644
--- a/src/b4/man/b4.1
+++ b/src/b4/man/b4.1
@@ -421,6 +421,10 @@ and sending only to recipients not yet accepted by the server. Use
 \fB\-\-resume \-o DIR\fP to inspect pending messages without sending. If a
 transaction\(aqs outcome is uncertain, b4 stops until it is verified and
 explicitly recorded with \fB\-\-resolve\-uncertain=sent\fP or \fB=unsent\fP\&.
+Interactive SMTP submissions offer an immediate retry after connection
+failures or explicit rejections. The default is no; declining preserves
+progress for later. No retry prompt is shown with \fB\-\-no\-interactive\fP
+or non\-terminal input.
 .TP
 .B \fBb4 trailers \-u\fP
 Retrieve any code\-review trailers provided for your series and apply
diff --git a/src/b4/man/b4.1.rst b/src/b4/man/b4.1.rst
index 5f5ee39..7f249bb 100644
--- a/src/b4/man/b4.1.rst
+++ b/src/b4/man/b4.1.rst
@@ -385,6 +385,10 @@ For options, see the output of ``b4 prep --help``, ``b4 trailers
   ``--resume -o DIR`` to inspect pending messages without sending. If a
   transaction's outcome is uncertain, b4 stops until it is verified and
   explicitly recorded with ``--resolve-uncertain=sent`` or ``=unsent``.
+  Interactive SMTP submissions offer an immediate retry after connection
+  failures or explicit rejections. The default is no; declining preserves
+  progress for later. No retry prompt is shown with ``--no-interactive``
+  or non-terminal input.
 
 ``b4 trailers -u``
   Retrieve any code-review trailers provided for your series and apply
diff --git a/src/tests/test_send_resume.py b/src/tests/test_send_resume.py
index dea603b..53bed77 100644
--- a/src/tests/test_send_resume.py
+++ b/src/tests/test_send_resume.py
@@ -10,6 +10,7 @@ import email.policy
 import json
 import smtplib
 import socketserver
+import sys
 import threading
 from email.message import EmailMessage
 from email.parser import BytesParser
@@ -303,8 +304,11 @@ def test_large_series_recovers_original_suffix(tmp_path: Path) -> None:
     ]
 
 
-def run_send(*args: str) -> None:
-    parsed = b4.command.setup_parser().parse_args(['--no-stdin', 'send', *args])
+def run_send(*args: str, no_interactive: bool = False) -> None:
+    options = ['--no-interactive'] if no_interactive else []
+    parsed = b4.command.setup_parser().parse_args(
+        ['--no-stdin', *options, 'send', *args]
+    )
     b4.ez.cmd_send(parsed)
 
 
@@ -385,6 +389,290 @@ def test_cli_resume_and_reroll(
     assert len(second.calls) == 2
 
 
+def retry_prompt(monkeypatch: pytest.MonkeyPatch, *answers: Any) -> Mock:
+    retry = Mock(side_effect=answers)
+
+    def respond(prompt: str) -> str:
+        if prompt.startswith('Retry sending'):
+            return cast(str, retry(prompt))
+        return ''
+
+    monkeypatch.setattr(sys.stdin, 'isatty', lambda: True)
+    monkeypatch.setattr('builtins.input', respond)
+    return retry
+
+
+@pytest.mark.parametrize(
+    'error',
+    [
+        smtplib.SMTPDataError(421, b'temporary'),
+        smtplib.SMTPDataError(550, b'quota'),
+        smtplib.SMTPSenderRefused(550, b'no', 'test-override@example.com'),
+        smtplib.SMTPRecipientsRefused({'list@example.org': (450, b'later')}),
+    ],
+)
+def test_interactive_retry_reconnects_without_regenerating_mail(
+    send_repo: Path, monkeypatch: pytest.MonkeyPatch, error: Exception
+) -> None:
+    first = FakeSMTP({}, error)
+    second = FakeSMTP()
+    get_smtp = Mock(
+        side_effect=[
+            (first.connector(), b4.USER_CONFIG['email']),
+            (second.connector(), b4.USER_CONFIG['email']),
+        ]
+    )
+    monkeypatch.setattr(b4, 'get_smtp', get_smtp)
+    signer = Mock(side_effect=lambda data: b'X-Developer-Signature: frozen\n' + data)
+    monkeypatch.setattr(patatt, 'rfc2822_sign', signer)
+    retry = retry_prompt(monkeypatch, 'y')
+    run_send()
+    retry.assert_called_once_with(
+        'Retry sending to the remaining recipients now? [y/N] '
+    )
+    assert get_smtp.call_count == 2
+    assert signer.call_count == 3
+    assert first.closed and second.closed
+    assert len(first.calls) == len(second.calls) == 2
+    assert first.calls[1] == second.calls[0]
+    saved = SendSession.load(send_repo / 'v1')
+    assert [call[2] for call in first.calls[:1] + second.calls] == [
+        saved.message_bytes(n) for n in range(3)
+    ]
+    assert saved.state.finished
+    assert b4.ez.load_cover()[1]['series']['revision'] == 2
+
+
+def test_interactive_retry_after_connection_failure(
+    send_repo: Path, monkeypatch: pytest.MonkeyPatch
+) -> None:
+    connect = Mock(side_effect=OSError('offline'))
+    smtp = FakeSMTP()
+    monkeypatch.setattr(
+        b4,
+        'get_smtp',
+        Mock(
+            side_effect=[
+                (b4.SMTPConnector(connect), b4.USER_CONFIG['email']),
+                (smtp.connector(), b4.USER_CONFIG['email']),
+            ]
+        ),
+    )
+    retry = retry_prompt(monkeypatch, 'YES')
+    run_send('--no-sign')
+    retry.assert_called_once()
+    connect.assert_called_once()
+    assert len(smtp.calls) == 3
+    assert pending_session(send_repo) is None
+
+
+def test_interactive_retry_only_resends_refused_recipients(
+    send_repo: Path, monkeypatch: pytest.MonkeyPatch
+) -> None:
+    first = FakeSMTP({}, {'test-override@example.com': (450, b'later')})
+    second = FakeSMTP()
+    monkeypatch.setattr(
+        b4,
+        'get_smtp',
+        Mock(
+            side_effect=[
+                (first.connector(), b4.USER_CONFIG['email']),
+                (second.connector(), b4.USER_CONFIG['email']),
+            ]
+        ),
+    )
+    retry_prompt(monkeypatch, 'yes')
+    run_send('--no-sign', '--cc', 'test-override@example.com')
+    assert second.calls[0][1] == ['test-override@example.com']
+    assert second.calls[0][2] == first.calls[1][2]
+    assert pending_session(send_repo) is None
+
+
+def test_resume_also_offers_immediate_retry(
+    send_repo: Path, monkeypatch: pytest.MonkeyPatch
+) -> None:
+    saved, _first = interrupt_send(send_repo, monkeypatch)
+    failed = FakeSMTP(smtplib.SMTPDataError(421, b'later'))
+    final = FakeSMTP()
+    monkeypatch.setattr(
+        b4,
+        'get_smtp',
+        Mock(
+            side_effect=[
+                (failed.connector(), b4.USER_CONFIG['email']),
+                (final.connector(), b4.USER_CONFIG['email']),
+            ]
+        ),
+    )
+    retry = retry_prompt(monkeypatch, 'y')
+    run_send('--resume')
+    retry.assert_called_once()
+    assert len(failed.calls) == 1 and len(final.calls) == 2
+    assert failed.calls[0] == final.calls[0]
+    assert final.calls[0][2] == saved.message_bytes(1)
+    assert pending_session(send_repo) is None
+
+
+@pytest.mark.parametrize(
+    'answer', ['', 'n', 'No', 'later', EOFError(), KeyboardInterrupt()]
+)
+def test_declining_retry_preserves_progress(
+    send_repo: Path, monkeypatch: pytest.MonkeyPatch, answer: Any
+) -> None:
+    first = FakeSMTP({}, smtplib.SMTPDataError(421, b'later'))
+    configure_smtp(monkeypatch, first)
+    retry = retry_prompt(monkeypatch, answer)
+    with pytest.raises(SystemExit) as exc:
+        run_send('--no-sign')
+    assert exc.value.code == (130 if isinstance(answer, KeyboardInterrupt) else 1)
+    retry.assert_called_once()
+    assert len(first.calls) == 2
+    saved = pending_session(send_repo)
+    assert saved is not None and saved.state.in_flight is None
+    assert not saved.state.messages[0].pending()
+    assert saved.state.messages[1].pending()
+    assert b4.ez.load_cover()[1]['series']['revision'] == 1
+    second = FakeSMTP()
+    configure_smtp(monkeypatch, second)
+    run_send('--resume')
+    assert second.calls[0] == first.calls[1]
+    assert pending_session(send_repo) is None
+
+
+def test_each_retry_requires_confirmation(
+    send_repo: Path, monkeypatch: pytest.MonkeyPatch
+) -> None:
+    first = FakeSMTP({}, smtplib.SMTPDataError(421, b'later'))
+    second = FakeSMTP(smtplib.SMTPDataError(421, b'still unavailable'))
+    get_smtp = Mock(
+        side_effect=[
+            (first.connector(), b4.USER_CONFIG['email']),
+            (second.connector(), b4.USER_CONFIG['email']),
+        ]
+    )
+    monkeypatch.setattr(b4, 'get_smtp', get_smtp)
+    retry = retry_prompt(monkeypatch, 'y', 'n')
+    with pytest.raises(SystemExit):
+        run_send('--no-sign')
+    assert retry.call_count == 2
+    assert get_smtp.call_count == 2
+    assert first.calls[1] == second.calls[0]
+    assert len(second.calls) == 1
+    assert pending_session(send_repo) is not None
+
+
+@pytest.mark.parametrize('no_interactive', [False, True])
+def test_noninteractive_failure_does_not_prompt_for_retry(
+    send_repo: Path, monkeypatch: pytest.MonkeyPatch, no_interactive: bool
+) -> None:
+    first = FakeSMTP({}, smtplib.SMTPDataError(421, b'later'))
+    configure_smtp(monkeypatch, first)
+    retry = retry_prompt(monkeypatch)
+    monkeypatch.setattr(sys.stdin, 'isatty', lambda: no_interactive)
+    with pytest.raises(SystemExit):
+        run_send('--no-sign', no_interactive=no_interactive)
+    retry.assert_not_called()
+    assert len(first.calls) == 2
+    assert pending_session(send_repo) is not None
+
+
+@pytest.mark.parametrize(
+    'error',
+    [
+        TimeoutError('late'),
+        smtplib.SMTPServerDisconnected('lost'),
+        smtplib.SMTPDataError(-1, b'bad reply'),
+    ],
+)
+def test_uncertain_delivery_never_offers_immediate_retry(
+    send_repo: Path, monkeypatch: pytest.MonkeyPatch, error: Exception
+) -> None:
+    first = FakeSMTP({}, error)
+    configure_smtp(monkeypatch, first)
+    retry = retry_prompt(monkeypatch)
+    with pytest.raises(SystemExit):
+        run_send('--no-sign')
+    retry.assert_not_called()
+    saved = pending_session(send_repo)
+    assert saved is not None and saved.state.in_flight == 1
+    assert len(first.calls) == 2
+
+
+@pytest.mark.parametrize('outcome', [{}, smtplib.SMTPDataError(421, b'later')])
+def test_journal_failure_never_offers_immediate_retry(
+    send_repo: Path, monkeypatch: pytest.MonkeyPatch, outcome: Any
+) -> None:
+    first = FakeSMTP({}, outcome)
+    configure_smtp(monkeypatch, first)
+    retry = retry_prompt(monkeypatch)
+    original = SendSession.save
+
+    def fail_recording_result(self: SendSession) -> None:
+        if len(first.calls) == 2 and self.state.in_flight is None:
+            raise OSError('disk full')
+        original(self)
+
+    monkeypatch.setattr(SendSession, 'save', fail_recording_result)
+    with pytest.raises(SystemExit):
+        run_send('--no-sign')
+    retry.assert_not_called()
+    saved = pending_session(send_repo)
+    assert saved is not None and saved.state.in_flight == 1
+
+
+@pytest.mark.parametrize(
+    'what', ['dirty', 'cover', 'branch', 'sender', 'excluded', 'transport', 'message']
+)
+def test_retry_uses_saved_submission_after_prompt(
+    send_repo: Path, monkeypatch: pytest.MonkeyPatch, what: str
+) -> None:
+    first = FakeSMTP({}, smtplib.SMTPDataError(421, b'later'))
+    second = FakeSMTP()
+    configure_smtp(monkeypatch, first)
+    retry = retry_prompt(monkeypatch)
+
+    def change_submission(_prompt: str) -> str:
+        configure_smtp(monkeypatch, second)
+        if what == 'dirty':
+            Path('send-0.txt').write_text('uncommitted')
+        elif what == 'cover':
+            cover, tracking = b4.ez.load_cover()
+            b4.ez.store_cover(cover + '\nChanged during prompt.\n', tracking)
+        elif what == 'branch':
+            assert b4.git_run_command(None, ['checkout', '-b', 'elsewhere'])[0] == 0
+        elif what == 'sender':
+            monkeypatch.setattr(
+                b4, 'get_smtp', lambda: (second.connector(), 'other@example.org')
+            )
+        elif what == 'excluded':
+            b4.MAIN_CONFIG['email-exclude'] = 'list@example.org'
+        elif what == 'transport':
+            monkeypatch.setattr(
+                b4, 'get_smtp', lambda: (['sendmail'], b4.USER_CONFIG['email'])
+            )
+        else:
+            (send_repo / 'v1' / '0001.eml').write_bytes(b'changed')
+        return 'y'
+
+    retry.side_effect = change_submission
+    if what == 'sender':
+        run_send('--no-sign')
+        assert all(call[0] == first.calls[0][0] for call in second.calls)
+        assert pending_session(send_repo) is None
+    else:
+        with pytest.raises(SystemExit):
+            run_send('--no-sign')
+    retry.assert_called_once()
+    if what in {'dirty', 'cover', 'branch', 'sender'}:
+        assert len(second.calls) == 2
+        assert second.calls[0] == first.calls[1]
+        if what != 'sender':
+            saved = pending_session(send_repo)
+            assert saved is not None and saved.delivered()
+    else:
+        assert not second.calls
+
+
 def test_fresh_send_is_blocked_while_pending(
     send_repo: Path, monkeypatch: pytest.MonkeyPatch
 ) -> None:
@@ -508,6 +796,7 @@ def test_bookkeeping_recovery_sends_no_mail(
 ) -> None:
     smtp = FakeSMTP()
     configure_smtp(monkeypatch, smtp)
+    retry = retry_prompt(monkeypatch)
     original = b4.ez.reroll
 
     def interrupted(*args: Any, **kwargs: Any) -> None:
@@ -518,6 +807,7 @@ def test_bookkeeping_recovery_sends_no_mail(
     monkeypatch.setattr(b4.ez, 'reroll', interrupted)
     with pytest.raises(SystemExit):
         run_send('--no-sign')
+    retry.assert_not_called()
     assert len(smtp.calls) == 3
     saved = pending_session(send_repo)
     assert saved is not None and saved.delivered()
@@ -749,7 +1039,10 @@ def test_source_change_at_resume_confirmation_only_defers_bookkeeping(
 
 
 @pytest.mark.parametrize('failure', ['data', 'recipient'])
-def test_real_smtplib_against_local_server(session: SendSession, failure: str) -> None:
+@pytest.mark.parametrize('recovery', ['resume', 'retry'])
+def test_real_smtplib_against_local_server(
+    session: SendSession, monkeypatch: pytest.MonkeyPatch, failure: str, recovery: str
+) -> None:
     """Exercise actual SMTP responses without delivering or relaying any mail."""
     transactions: List[Tuple[List[str], bytes, bool]] = []
     errors: List[BaseException] = []
@@ -819,10 +1112,18 @@ def test_real_smtplib_against_local_server(session: SendSession, failure: str) -
             return b4.SMTPConnector(lambda: smtplib.SMTP('127.0.0.1', port, timeout=5))
 
         try:
-            with pytest.raises(RuntimeError, match='SMTP'):
-                session.send(connector())
-            saved = SendSession.load(session.directory)
-            saved.send(connector())
+            if recovery == 'retry':
+                monkeypatch.setattr(
+                    b4.ez, '_get_resume_smtp', lambda _session: connector()
+                )
+                retry = retry_prompt(monkeypatch, 'y')
+                b4.ez._send_with_retry(session, connector(), no_interactive=False)
+                retry.assert_called_once()
+            else:
+                with pytest.raises(RuntimeError, match='SMTP'):
+                    session.send(connector())
+                saved = SendSession.load(session.directory)
+                saved.send(connector())
         finally:
             server.shutdown()
             worker.join(timeout=5)

-- 
2.53.0

