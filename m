Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795684039;
	b=lkVswYopCJIRQ+dwpRTLQmiilzJjjMeioLiLy2DZaQikVbfIA88U0RuhyRMIh2ADoP4O
	 i3+ZZHm+2Cm9bjLdVOQpBgbE2IB+Q2D0o+X/dBVq1AlSbkEEVovY7Ial6fzbcKqJ5HF+G
	 M0Y54JsLsUHdSHLuZO5afTsVeD7a3GIyzYScHXC89yizSifqEqpJFHqF103v/MAM8Rme3
	 6BscfMQbWDQJOZ44L6WofHTIc52uLnPZgySl6K3cynLPIGsQlonOXcRlPUOIbndR/j2xQ
	 4BJLtkX9WDn4Btu3A1W8P74D9YeC+08c/pDWSS7riAWK5AdXN9W0bpIsV/a2yDW4v2A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684039;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=mbfC77ro3wp86eE9xIDtxC+XJ4v2kHTXYj6tsIzykBc=;
	b=OnriqPbbX0yXh3wHAWuwMOgdSJXk8CQ8WGSnyHDHwHQtHAzo03djLSSzBDNazrMfqkW1
	 4utcaulRnRLoQB4jmVHOs9wblSu0cxw0hEqUUrjgyLcbYX8sgA/iPs1q5z7UgSouI8woB
	 63s2jqsktYooVa7pMIlZtowPmc6dSsqieowPclVvRo09koP24iFC0sNfWmt1JgHkx6ucW
	 UDSKnizIS2WesayiUT3qmxx3zjRSY7NfzPd2vhEusrtUF8F8ttUsBytcf6R7jycEXG6XS
	 ucCLTeFvwxm/8spDa2Q9lTWO5gk2vS3cNlFCGMgMIu3RZEKAAENWcQJMv7RwFLu8C0g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oTbhMKCg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3225F606A31C
	for <tools@linux.kernel.org>; Thu, 26 Nov 2026 09:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oTbhMKCg
Received: by smtp.kernel.org (Postfix)
	id 1F8BA1F000C4; Thu, 26 Nov 2026 09:07:19 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.161.50
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795684039;
	b=Ton5mUDoTc9/GQjn3KfS/1yXmbBgbELAM7qg2Pbb1tBPqtdy2iel5z98Tjy9iwUxHyrS
	 aLX6gNP+TQMMJ8ZxNgdZMXtChM4Csu8YKG0EQSSTnGBVwMMeZkyxWCMXTwmu+HdDvwtVw
	 DZ9bhQxW1DdIp5eroB1b+/4Wvn4ZGho4bKez2QgxrR8Hf2FmkTH+Wq1qujSffMaygRQwa
	 /I0I8aEUSgkSgh6bFwNYC/uLC5tYt1Eqaywmzgtc8LdYLQ92WbRjFbJLs89DMap/TcXS0
	 3+90kfubYcT6kgY4IvJniXUm5/OlHzhO+LRjdaXTXjm5bPpAG4eAjLm/hPb8kY6HT9Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795684039;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=mbfC77ro3wp86eE9xIDtxC+XJ4v2kHTXYj6tsIzykBc=;
	b=WhJghNiIJAXwlZb+1gPBfSxUwWTRzrYf5DTiYMK7EHzpe3T8Gr5z4q47v9AbTHyYUh7U
	 XPF55bG7342c91y7zyVs4MdCqcvJpTReW+HTDNUvAHOxvOUmdmHF7/OjrPLtWUeZaGTAM
	 8VwAvtX6hCw3jBGcbRUF+d9Ah4ZXoUgZPqP8ey4epLJ1IjrlSNl+57ZBoAYAV5C3i4YEo
	 FlWdmqQ7aV9Kv1V6qP3npqXo657Cw3dt+ZEA9WbZN4KXPNCVF6Ijo7SD5WfXy+lvzwKIe
	 veM9g5UPfZ3yieRmG0Bu6euhryP7iNqaYB9gJa50DzGW6UWaFnfHbWim9Um8IJUbB+Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oTbhMKCg;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.161.50
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 952D81F000C0
	for <tools@kernel.org>; Thu, 26 Nov 2026 09:07:10 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oTbhMKCg
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 952D81F000C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6de2f213b7aso2880362eaf.0
        for <tools@kernel.org>; Thu, 26 Nov 2026 01:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795684029; x=1796288829; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mbfC77ro3wp86eE9xIDtxC+XJ4v2kHTXYj6tsIzykBc=;
        b=oTbhMKCgw4pqnpKPiYcd36J1mak5lDQR6ou4zJrxfKIV5i12aKbFxoyVQz3Zq5SZVU
         aXILIcszqRcWWdPkNRpYo2AbpxBMJHWTh2UPDHGfQFqUFrEVLqjTDe0XPrEbD0wEnXLK
         cU3SP+3t8RleC53qEFuW0dC2Nj2DwnQMOuLctQAF6v0MjOYRJleiZmeDv2WBOEwDZMcz
         4bwE62C0cdbfkR8ZD0JFSmeyQ6krJcLosQtIFQonwttZic75h9gnIS8SFzCYX+vyCnDU
         NLnl7x7FWcobBzP95+3SQTviGdFV7G/Pqn6lnhPuMIxmuKZ58QO9S3EadUwZbxN/lsv0
         pSYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684029; x=1796288829;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mbfC77ro3wp86eE9xIDtxC+XJ4v2kHTXYj6tsIzykBc=;
        b=KcLgSptTaJPDTEyF9CgwaMYhOjmmnC0nnlECM3GQ7jYFoaw1v37zmFg2WcckHjDSCB
         8DRAi/VSgSX+n39k9Z0hHp/puzVeizJY8nQDmV8IZBVtDS4GZqYc2aVmMu55qXt5DZ51
         Qp/x0My1nb/GMNFTU2ByqTW4lWvrJFpDrtqQ2c5aDtOfDEZPrPQq4Gxz0pwNW412Dq/b
         6AA7WDxkdy9DtmvjlP1Myp1rTsHyODVmu1NClZAtfYOF85ImxkBjYc0JKPhdsIx3zvNO
         U2LnsTig2i5GL+DcD6B7G4VeCjTLLtys3pna8HwiMvyvYz+6cvfVXV+eG1+HgRIWjqZQ
         OSoQ==
X-Gm-Message-State: APuU4Z+oul0HaaVwh9EqmUaCnqLe72N8gdUMUurOmuIo7Y7yhjZgE6Vg
	8+hiPYM+3qjOgI4bgspSXWD7/+gWbqDvJp6pwFOQxOw8p4coczcTLsD/TMajXIZ2
X-Gm-Gg: AZFdTZerb1mVJHm74qY6bZ974ErncUM506WQOrwWzuvkJ07RC+HWUYtRRGQ4c/H2yrC
	oHlRATZZOkfv62ys3oLHZG/4GmrYs5A24dngUfPe0hOjyzsN2E/7ChuLSTyL5VzMB6obQ4cohDa
	Q2qYT+Yv7uM0vh88aBU8r/0dMVvgT5TBoVqU6kkyiPWt+R3CCzLE+hbXoF1faf7JsMleHkDYOhc
	NssU9gRtMzFMZUr+Mwwzf+LuG1l0YYMMYoV0LxWzY13XTJxKbLKkXKYlfzaKI/mpHmA4LIsCSai
	EceKPjmwAqHYcHMpxw0zUmK5dAEqfIb30T463OxeISwrg9RS3IVqJEgFx3hAa3H4YOwpJ8HMyND
	NlsR9C4DeYI0Iy2WGDocjo2UHVtR8nXjSUb4YNfTvidcR/AHIRDY7tOt1Oj+xEJ9SsIXLLUmojq
	DZOxIL1DMxFF0/FGT2bgpZZvj0glqE2v/paciddEUXaZeLGgL6f1yj0gaH0+yCKLZSNk+t/gIvz
	NepReWwylZW6cT9YrZHsfuSPINq772ZKHobv10pfTGAzRrhxJlV0/Q+/qWu6FNd/QmENWpyfhCX
	byceVQuj5XdsuezoAHh6q7sXhZx4AfAem+30YtA4iZJKNGN/yY8VgBlyCz9UVGyx86fCPb0uRA9
	BZmmSW5ml6JWZ7AQf4VEBGwt2mL6cPB3fUI9ptofZVGV6WZBMIXzcr1R5KNPo8s/OeDOGlg00gF
	9a17WdwaPGNAa/+Qy5z4mO7V4W6MKUDhePGo9CHSJrKz+csQ+6VS5prtfLyWDKsVfDHQjUERnIW
	A==
X-Received: by 2002:a05:6820:8599:20b0:71a:d6ae:500a with SMTP id 006d021491bc7-71b394b822amr11874341eaf.46.1795684029271;
        Thu, 26 Nov 2026 01:07:09 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8631682200esm14448597a34.2.2026.11.26.01.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:07:08 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 26 Nov 2026 02:06:59 -0700
Subject: [PATCH b4 1/3] send: retire an untouched SMTP submission when
 changing transports
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
Message-Id: <20261126-submit-b4-send-resume-fixes-v1-v1-1-cf5e018d8d7a@gmail.com>
References: <20261126-submit-b4-send-resume-fixes-v1-v1-0-cf5e018d8d7a@gmail.com>
In-Reply-To: <20261126-submit-b4-send-resume-fixes-v1-v1-0-cf5e018d8d7a@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

If SMTP fails before delivering anything, an ordinary send can replace
the saved submission. Sending the replacement through local sendmail
or the web endpoint advances the revision but leaves the old SMTP
record behind. A later --resume sends that revision again before it
detects the bookkeeping mismatch.

Hold the series lock for ordinary sends regardless of transport, and
discard a record that reached nobody after confirmation but before the
replacement can deliver mail. Refuse replacement if any delivery is
partial or uncertain. Previews, dry runs and explicit resends do not
replace the submission.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 src/b4/ez.py                  | 151 +++++++++++++++++-------------------------
 src/tests/test_send_resume.py |  51 ++++++++++++++
 2 files changed, 112 insertions(+), 90 deletions(-)

diff --git a/src/b4/ez.py b/src/b4/ez.py
index 0eadbff..8db2cb7 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -3291,10 +3291,18 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
             or cmdargs.preview_to
             or cmdargs.resend
         )
-        # Checked again under the lock; this only spares the user the prompts.
-        if not unrecorded and _blocking_session(directory):
-            raise RuntimeError('An unfinished submission exists; use b4 send --resume')
-        _cmd_send(cmdargs, directory)
+        if unrecorded:
+            _cmd_send(cmdargs)
+            return
+        directory.parent.mkdir(mode=0o700, exist_ok=True)
+        directory.mkdir(mode=0o700, exist_ok=True)
+        with b4.lockfile_nb(str(directory / 'send.lock')):
+            previous = pending_session(directory)
+            if previous and not previous.untouched():
+                raise RuntimeError(
+                    'An unfinished submission exists; use b4 send --resume'
+                )
+            _cmd_send(cmdargs, directory, previous)
     except (RuntimeError, OSError, ValueError) as exc:
         logger.critical('CRITICAL: %s', exc)
         if _has_pending_send(directory):
@@ -3310,18 +3318,6 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
         sys.exit(130)
 
 
-def _blocking_session(directory: pathlib.Path) -> Optional[SendSession]:
-    """Return the saved submission that a fresh send would duplicate.
-
-    A submission that reached nobody protects nothing, and holding the
-    user to its messages would keep them from fixing the series first.
-    """
-    session = pending_session(directory)
-    if session is None or session.untouched():
-        return None
-    return session
-
-
 def _has_pending_send(directory: pathlib.Path) -> bool:
     try:
         return pending_session(directory) is not None
@@ -3530,7 +3526,11 @@ def _resume_send(cmdargs: argparse.Namespace, session: SendSession) -> None:
     _finish_send(session)
 
 
-def _cmd_send(cmdargs: argparse.Namespace, directory: pathlib.Path) -> None:
+def _cmd_send(
+    cmdargs: argparse.Namespace,
+    directory: Optional[pathlib.Path] = None,
+    previous: Optional[SendSession] = None,
+) -> None:
     mybranch = b4.git_get_current_branch()
     if mybranch is None:
         logger.critical('CRITICAL: Not currently on a branch, unable to send')
@@ -4011,88 +4011,59 @@ def _cmd_send(cmdargs: argparse.Namespace, directory: pathlib.Path) -> None:
             logger.critical('          Please re-enable signing or use SMTP')
             sys.exit(1)
 
-        try:
-            sent = b4.send_mail(
-                None,
-                send_msgs,
-                fromaddr=None,
-                bccaddrs=send_bcc,
-                patatt_sign=True,
-                dryrun=cmdargs.dryrun,
-                output_dir=cmdargs.output_dir,
-                web_endpoint=endpoint,
-                reflect=cmdargs.reflect,
-            )
-        except RuntimeError as ex:
-            logger.critical('CRITICAL: %s', ex)
-            sys.exit(1)
+        smtp, sender = None, None
     else:
         try:
-            smtp, fromaddr = b4.get_smtp(dryrun=cmdargs.dryrun)
+            smtp, sender = b4.get_smtp(dryrun=cmdargs.dryrun)
         except Exception as ex:
             logger.critical('Failed to configure the smtp connection:')
             logger.critical(ex)
             sys.exit(1)
 
-        if isinstance(smtp, b4.SMTPConnector) and not (
-            cmdargs.dryrun or cmdargs.reflect or cmdargs.resend or cmdargs.preview_to
-        ):
-            if tag_msg is None:
-                raise RuntimeError(
-                    'Cannot save submission bookkeeping without a cover/tag message'
-                )
-            branch, head, tree, cover_hash = source
-            series = tracking['series']
-            state = State(
-                change_id=series['change-id'],
-                revision=series['revision'],
-                branch=branch,
-                head=head,
-                tree=tree,
-                cover_hash=cover_hash,
-                tag_message=tag_msg,
-                cover_message_id=cl_msgid,
-                fromaddr=fromaddr,
-                messages=[],
+    # Once the replacement can send, the old messages must not be resumable.
+    if previous is not None:
+        logger.info('Replacing a saved submission that reached nobody')
+        previous.discard()
+    if directory is not None and isinstance(smtp, b4.SMTPConnector):
+        if tag_msg is None:
+            raise RuntimeError(
+                'Cannot save submission bookkeeping without a cover/tag message'
             )
-            directory.parent.mkdir(mode=0o700, exist_ok=True)
-            directory.mkdir(mode=0o700, exist_ok=True)
-            with b4.lockfile_nb(str(directory / 'send.lock')):
-                if _blocking_session(directory):
-                    raise RuntimeError(
-                        'An unfinished submission exists; use b4 send --resume'
-                    )
-                stale = pending_session(directory)
-                if stale is not None:
-                    logger.info('Replacing a saved submission that reached nobody')
-                    stale.discard()
-                # Before saving: --resume sends what was saved without this check.
-                _check_send_source(state)
-                prepared = b4.prepare_mail(
-                    send_msgs, bccaddrs=send_bcc, patatt_sign=sign
-                )
-                session = SendSession.prepare(
-                    directory / f'v{state.revision}', state, prepared
-                )
-                logger.info('Saved SMTP submission in %s', session.directory)
-                _send_with_retry(session, smtp, no_interactive=cmdargs.no_interactive)
-                _finish_send(session)
-            return
+        assert sender is not None
+        branch, head, tree, cover_hash = source
+        series = tracking['series']
+        state = State(
+            change_id=series['change-id'],
+            revision=series['revision'],
+            branch=branch,
+            head=head,
+            tree=tree,
+            cover_hash=cover_hash,
+            tag_message=tag_msg,
+            cover_message_id=cl_msgid,
+            fromaddr=sender,
+            messages=[],
+        )
+        # Before saving: --resume sends what was saved without this check.
+        _check_send_source(state)
+        prepared = b4.prepare_mail(send_msgs, bccaddrs=send_bcc, patatt_sign=sign)
+        session = SendSession.prepare(directory / f'v{state.revision}', state, prepared)
+        logger.info('Saved SMTP submission in %s', session.directory)
+        _send_with_retry(session, smtp, no_interactive=cmdargs.no_interactive)
+        _finish_send(session)
+        return
 
-        try:
-            sent = b4.send_mail(
-                smtp,
-                send_msgs,
-                fromaddr=fromaddr,
-                bccaddrs=send_bcc,
-                patatt_sign=sign,
-                dryrun=cmdargs.dryrun,
-                output_dir=cmdargs.output_dir,
-                reflect=cmdargs.reflect,
-            )
-        except RuntimeError as ex:
-            logger.critical('CRITICAL: %s', ex)
-            sys.exit(1)
+    sent = b4.send_mail(
+        smtp,
+        send_msgs,
+        fromaddr=sender,
+        bccaddrs=send_bcc,
+        patatt_sign=sign,
+        dryrun=cmdargs.dryrun,
+        output_dir=cmdargs.output_dir,
+        web_endpoint=endpoint,
+        reflect=cmdargs.reflect,
+    )
 
     logger.info('---')
     if cmdargs.dryrun:
diff --git a/src/tests/test_send_resume.py b/src/tests/test_send_resume.py
index f540166..e1a74bb 100644
--- a/src/tests/test_send_resume.py
+++ b/src/tests/test_send_resume.py
@@ -1334,6 +1334,57 @@ def test_submission_that_reached_nobody_does_not_block_a_fresh_send(
     assert b4.ez.load_cover()[1]['series']['revision'] == 2
 
 
+@pytest.mark.parametrize('transport', ['local', 'web'])
+def test_replace_untouched_submission_using_another_transport(
+    send_repo: Path, monkeypatch: pytest.MonkeyPatch, transport: str
+) -> None:
+    first = FakeSMTP(
+        smtplib.SMTPSenderRefused(550, b'relay denied', 'alice@example.org')
+    )
+    configure_smtp(monkeypatch, first)
+    with pytest.raises(SystemExit):
+        run_send('--no-sign')
+    saved = pending_session(send_repo)
+    assert saved is not None and saved.untouched()
+
+    if transport == 'web':
+        b4.MAIN_CONFIG['send-endpoint-web'] = 'https://example.org/send'
+        args = ['--use-web-endpoint']
+    else:
+        monkeypatch.setattr(
+            b4, 'get_smtp', lambda dryrun=False: (['sendmail'], 'alice@example.org')
+        )
+        args = ['--no-sign']
+    # Stopping at the prompt must leave the original available for resume.
+    with monkeypatch.context() as mp:
+        mp.setattr('builtins.input', Mock(side_effect=KeyboardInterrupt))
+        with pytest.raises(SystemExit) as exc:
+            run_send(*args)
+        assert exc.value.code == 130
+    assert pending_session(send_repo) is not None
+
+    def deliver(smtp: Any, msgs: List[EmailMessage], **kwargs: Any) -> int:
+        if transport == 'web':
+            assert kwargs['web_endpoint'] == 'https://example.org/send'
+        else:
+            assert smtp == ['sendmail']
+        assert pending_session(send_repo) is None
+        with (
+            pytest.raises(b4.LockHeldError),
+            b4.lockfile_nb(str(send_repo / 'send.lock')),
+        ):
+            pass
+        return len(msgs)
+
+    monkeypatch.setattr(b4, 'send_mail', deliver)
+    run_send(*args)
+    assert b4.ez.load_cover()[1]['series']['revision'] == 2
+    smtp = FakeSMTP()
+    configure_smtp(monkeypatch, smtp)
+    run_send('--resume')
+    assert not smtp.calls
+
+
 @pytest.mark.parametrize('failure', ['cannot-tag', 'tag-exists'])
 def test_sent_tag_trouble_does_not_block_the_reroll(
     send_repo: Path,

-- 
2.53.0

