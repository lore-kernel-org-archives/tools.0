Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795684043;
	b=2qoIVlYMmEWeFTbwuhieUHTOO5JxGaJCwHNnnw+QglEhsDXuixtEGbq7yv+SXP6gAGCD
	 LgATfuzohLFcrGUHyDHR8w869syUJ39k4bbtXzSLLWFSb4MmiJeeniSoGhbsY99MpicbD
	 P5xRxluSDJ6Xnb1JE6PCCoTpdEB/94bgqzt9/P1wA1b8FG8CvHwp703S8PTjbijWm02nX
	 8QUY5e0k2M+W/RqiuAjtg60gHdsHirupEIE5W50H8XYlA6XpQZwdNj1fQa4aQx1C6NMQ1
	 ueiXi8MnRNkbmIavyq5XGm9C1rRqndiqN9iKhy/CjlHsVGwrg6CYsVxKv9c8GhvXzbg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684043;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=G1vjm7HVQrttmUdim8y51xYgTVOQ1dZAt/Q190JB1U4=;
	b=vQOFZSS7ojMZvg+BFLREjPXUATg93LmlYwxjCcaoKfQcaelWYmpFzwgO2+7TX2rODxlB
	 gW68Oy3alRIVxnNFiZXDC2JJWabsd9awqyHakKDV54g/3mDISCDxGw8usvbj7XOPdH4SO
	 zLxLKJ9tPoa13Cw4dUT+Y/KYbzF5HXqk92ockH/iqpRnC6NXgQLmOnK6oLbeq04KhNs+7
	 2kGFx1XWau11i3W7mRLm2Raw3WUYD02TZ/ky9DIQ4VmT1pQN6x13EjS2ZJ+y4Z/hlWxWc
	 CvRw1xkrFOX+2ESycs2pSEpu1EetukQOJ8WCK/Zni1A07/iYVj/JAYl4OsA0Cxph26A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Faag511H;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86924606A32A
	for <tools@linux.kernel.org>; Thu, 26 Nov 2026 09:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Faag511H
Received: by smtp.kernel.org (Postfix)
	id 1D9C21F000D8; Thu, 26 Nov 2026 09:07:23 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795684042;
	b=Q22P7sDaVoFBUpPryeS3lMB1Wc3Rj1DG5SpT7Xv6nyXZ+vDtmQlXEQF/F9At7y9NteqZ
	 2mqhCgyV0m3+OFYYnD/biYoCI2F3cfKjbsyeGNjCLyvM0YqDPBhOFoChQQSJrN07xgLjE
	 CkRxuQD4pVk2ujlvNYDgb5xwv3yNsCSM/kdaCctOXU5T7b92m9n4c0KxQzYDZCVaqCZ9M
	 soAEcv1ZBlMg43/9uRYkLb3cwZf3Ibj9UdbE1r/7y5MNjeD63HJMPyxDEq21ow7nCwQFt
	 DO7Dw/HafZF5JXYY0Q4d0TBtF/hnUDmj+TurUq1b7HED3OmD044TuAcuDn+wpHUgVCQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795684042;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=G1vjm7HVQrttmUdim8y51xYgTVOQ1dZAt/Q190JB1U4=;
	b=eG0SGtszF0hJTSNfGCCLA67vm0Ux/IaqLwo6F/HxMvZE0KtEnJXE/UFaO2UAdC7rFC96
	 WLx8EtOaqJqh6HY08ly6abWcYeADGOGChauLZ/rZwOaNGx2YtQe0Z9uKVFLSq4BZqE8Vn
	 GwZXdoj9Xr9ukAMHZ8eRq9bOlPvLiCQRfPPFDCN0joaE2sExQ5BgwpPp1CPx+mRLRWgdp
	 v/cvmEVNsfFQt9tLdKB0l2O5HvMGU4nUNcrvNXHhaytqvzohg6gBgHa9uo46emZpaXvVI
	 PkSsFw5cnDWfRq1y1Mo2UunPuQo+ZLVuZz87NvUzZi2dXon48K9mhCcZdSpUAU4J/Xw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Faag511H;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 886B21F000D1
	for <tools@kernel.org>; Thu, 26 Nov 2026 09:07:11 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Faag511H
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 886B21F000D1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-862df509ccbso3420538a34.2
        for <tools@kernel.org>; Thu, 26 Nov 2026 01:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795684030; x=1796288830; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G1vjm7HVQrttmUdim8y51xYgTVOQ1dZAt/Q190JB1U4=;
        b=Faag511HC/9X1pP9SCrTnfmwTQrGQyoDSvT+onLeyFu+mIo7e+kdEGR3ltsJSopbty
         DIJREZ7RdwtYCX0CBfJ9rIQRFOUWUnQBGW14JMVqfDQoaqsmWVY+/fnymaPFSAH0Zg8N
         0q/qsG2NBMD6FQfwjXATyaiV8dEpnMRzKXhGKSAml6FrCmRm6ZwxPHnAVb3qT4naHDZ8
         MuUHcJsSM6fAyy40h5x5g58DEfOFNorzj/TrCpzt9IN7b4eVtcetUj2hQer3bwmzzijl
         PJuSOa/cMTe5ZSatG2njGpZdUCZM2iSg5gNOA+KcDul9JJgVs7knq03dBllCQ+xSzXQ1
         wW9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684030; x=1796288830;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G1vjm7HVQrttmUdim8y51xYgTVOQ1dZAt/Q190JB1U4=;
        b=MIx9UKlOaqJe5YXW5X7XoMohgf9iZsg09v690BalJQgpwK6Louaca2OE0AfT3NAW4O
         xDfqLQ2H4p9IYu/LmGGw7SrI8pYOVleuWXx9Ow6vAzjQi+O2tXZL6pMfAxHBAYk98t9R
         r25YREWL86HqIJmn93nE2dJSMkQisBfsLJ/J4gjqYe0jwTWpJ3pRid5GJOSy7EZrBbEw
         n/3jeT6JCCyCpobEVRXydo+FANNS2n3a/IE1PGDl0zUmPqxamhrduKABzeR66fXP8+QE
         ivZv89l6w12MJZvFJJ37eInMW5FZhujqsZ58hNPT+PLb4AXKa6ktxh3MER3MQDZrEq+t
         9P8A==
X-Gm-Message-State: APuU4Z9j5GGCAOQfhHfahgDrw2Ba2O33AyqzgL2pERj+cbpfsUnxjUuM
	GsN9pyqT8WAVyklN+3F+DbY3r2KRkjNO6YhRYAqRZfAhX2JtubMsd61RdB9kVP6t
X-Gm-Gg: AZFdTZcPvxUrw9YQH8+r84FLryDxYeffvhY/SrJ+RnYoFHmNbfP/4BJdt+oS2PNNkf3
	Zo82MmgtEhwm1o7u4PQdGfbceQ9kyIcA0YMKYg/fbnefhfvzHjoLqlRUKqwmv1I+RdtdYKwYsAF
	Isfv+owbwQads5Ae2DGopI6n2UHiQm6vQks/19b7MGStuQiOf6qlFDH43egfXDQntbY8qcSjvCt
	LN+S6Z8tajMppj7lb12/4BNjX5bnsax9TfTzems0AJOAzkcdZI143hjlko9SrvVJC6nmQJzr5AC
	BfuwiW/2FiDYH9yX4tZuLYC25YZQK8fqhAddJ6QuXpAfIUJGVW0JzNc5DUmdo6zf6ezUrfq0Ls8
	oNQGjspfQAQKDWc+UvuP9g/df0lVXGfSJI40xdK7bdGQ8LwGlyTlr/N5ZlwBjAvFBO6e3Oh2/F3
	KBfOmo9BcMTs5Pl3gIydgBZQX1gTRmqJ/uW9uy6s8SJi8TVw6eRR7/mhvKgd6qdV5ldbhkNMR9M
	7mBOauctzlbIiNyqi3ozrm3AJPs4Ezf8aHfB6DsdYhI822sMQblOVAcw3LP49BaMGwgRxgfTdBZ
	BorOJWKpAI2OzCe9QabzaKtYLPFM5Nf2k8UxYR3qG3okzeWSRB8fFo7516+1tXdvHDst0XXuoqh
	E8GJ+l5ZtrPuFpsmAJf0+bYqpFgQYoJrggxEOpLUeTra9pucBIWIazLLYXFPc07iuzOfyM9Ahx5
	CQukia7iy8yG8HF+dNYAZ6dt9LX+ZttWkQjlw5ZwDVegGRo9/OSUKzGw==
X-Received: by 2002:a05:6830:4c18:b0:80c:d30f:97d with SMTP id 46e09a7af769-86315a29b8emr23796415a34.30.1795684030355;
        Thu, 26 Nov 2026 01:07:10 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8631682200esm14448597a34.2.2026.11.26.01.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:07:09 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 26 Nov 2026 02:07:00 -0700
Subject: [PATCH b4 2/3] send: continue past temporary recipient refusals on
 resume
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
Message-Id: <20261126-submit-b4-send-resume-fixes-v1-v1-2-cf5e018d8d7a@gmail.com>
References: <20261126-submit-b4-send-resume-fixes-v1-v1-0-cf5e018d8d7a@gmail.com>
In-Reply-To: <20261126-submit-b4-send-resume-fixes-v1-v1-0-cf5e018d8d7a@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

A patch may still be waiting for one recipient while another patch is
waiting for someone else. If the first address is temporarily refused
again, b4 stops before trying the second. The same thing happens on an
initial send when all recipients of a message are temporarily refused.

smtplib returns partial recipient refusals but raises an exception when
every RCPT is refused. Process a complete set of temporary refusals in
either form, keeping those recipients pending while trying later
messages. Stop on a 421, which closes the connection and may interrupt
the envelope, and continue to treat a permanent refusal as retryable if
nobody has accepted the message yet.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 src/b4/_send.py               | 15 ++++++++++-----
 src/tests/test_send_resume.py | 41 ++++++++++++++++++++++++++++++++++++++---
 2 files changed, 48 insertions(+), 8 deletions(-)

diff --git a/src/b4/_send.py b/src/b4/_send.py
index 8ee5edb..2db31d5 100644
--- a/src/b4/_send.py
+++ b/src/b4/_send.py
@@ -305,17 +305,22 @@ class SendSession:
                 try:
                     refused = conn.sendmail(self.state.fromaddr, remaining, data)
                 except smtplib.SMTPRecipientsRefused as exc:
-                    # When nobody at all took the message, a 5xx is more
-                    # likely our own setup (relay denied) than a dead address.
-                    if not message.accepted or not all(
-                        _is_permanent(reply) for reply in exc.recipients.values()
+                    refused = exc.recipients
+                    # A 421 closes the connection, possibly mid-envelope.
+                    # No DATA was sent, even for RCPTs already accepted.
+                    # Keep a 5xx retryable until someone takes the message:
+                    # the relay may simply be misconfigured.
+                    if set(refused) != set(remaining) or any(
+                        code == 421
+                        or not 400 <= code < 600
+                        or (code >= 500 and not message.accepted)
+                        for code, _ in refused.values()
                     ):
                         self.state.in_flight = None
                         self.save()
                         raise RetryableSendError(
                             f'SMTP rejected the message: {exc}'
                         ) from exc
-                    refused = exc.recipients
                 except (
                     smtplib.SMTPSenderRefused,
                     # Both are raised before the sender is even named.
diff --git a/src/tests/test_send_resume.py b/src/tests/test_send_resume.py
index e1a74bb..ca31497 100644
--- a/src/tests/test_send_resume.py
+++ b/src/tests/test_send_resume.py
@@ -133,6 +133,31 @@ def test_partial_recipient_acceptance(session: SendSession) -> None:
     assert second.calls[0][2] == first.calls[0][2]
 
 
+@pytest.mark.parametrize('retry', [False, True], ids=['initial', 'resume'])
+def test_temporary_refusal_of_all_pending_recipients(
+    session: SendSession, retry: bool
+) -> None:
+    later = (450, b'try later')
+    if retry:
+        # Leave different recipients outstanding on the first two messages.
+        smtp = FakeSMTP({'bob@example.org': later}, {'list@example.org': later})
+        with pytest.raises(RetryableSendError):
+            session.send(smtp.connector())
+        session = SendSession.load(session.directory)
+
+    pending = [msg.pending() for msg in session.state.messages if msg.pending()]
+    smtp = FakeSMTP(smtplib.SMTPRecipientsRefused(dict.fromkeys(pending[0], later)))
+    with pytest.raises(RetryableSendError):
+        session.send(smtp.connector())
+    assert [recipients for _, recipients, _ in smtp.calls] == pending
+
+    saved = SendSession.load(session.directory)
+    assert [msg.pending() for msg in saved.state.messages] == [pending[0], [], []]
+    smtp = FakeSMTP()
+    saved.send(smtp.connector())
+    assert smtp.calls == [(saved.state.fromaddr, pending[0], saved.message_bytes(0))]
+
+
 @pytest.mark.parametrize('when', ['first-attempt', 'on-retry'])
 def test_permanent_refusal_does_not_stall_the_series(
     session: SendSession, when: str
@@ -166,7 +191,15 @@ def test_permanent_refusal_does_not_stall_the_series(
 @pytest.mark.parametrize(
     'error',
     [
-        smtplib.SMTPRecipientsRefused({'bob@example.org': (550, b'no')}),
+        smtplib.SMTPRecipientsRefused(
+            dict.fromkeys(['bob@example.org', 'list@example.org'], (550, b'no'))
+        ),
+        smtplib.SMTPRecipientsRefused({'bob@example.org': (450, b'incomplete')}),
+        # RCPT 421 closes the connection and may leave recipients untried.
+        smtplib.SMTPRecipientsRefused({'bob@example.org': (421, b'closing')}),
+        smtplib.SMTPRecipientsRefused(
+            {'bob@example.org': (450, b'later'), 'list@example.org': (421, b'closing')}
+        ),
         smtplib.SMTPSenderRefused(550, b'no', 'alice@example.org'),
         # Raised before MAIL FROM, so no recipient was even named
         smtplib.SMTPHeloError(500, b'no'),
@@ -175,8 +208,10 @@ def test_permanent_refusal_does_not_stall_the_series(
 def test_envelope_rejection_is_safe_to_retry(
     session: SendSession, error: Exception
 ) -> None:
+    smtp = FakeSMTP(error)
     with pytest.raises(RetryableSendError, match='rejected'):
-        session.send(FakeSMTP(error).connector())
+        session.send(smtp.connector())
+    assert len(smtp.calls) == 1
     saved = SendSession.load(session.directory)
     assert saved.state.in_flight is None
     assert not any(message.accepted for message in saved.state.messages)
@@ -445,7 +480,7 @@ def retry_prompt(monkeypatch: pytest.MonkeyPatch, *answers: Any) -> Mock:
         smtplib.SMTPDataError(421, b'temporary'),
         smtplib.SMTPDataError(550, b'quota'),
         smtplib.SMTPSenderRefused(550, b'no', 'test-override@example.com'),
-        smtplib.SMTPRecipientsRefused({'list@example.org': (450, b'later')}),
+        smtplib.SMTPRecipientsRefused({'list@example.org': (421, b'closing')}),
     ],
 )
 def test_interactive_retry_reconnects_without_regenerating_mail(

-- 
2.53.0

