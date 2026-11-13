Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794600151;
	b=Mg6pbRJCkqa9nso8ALomD8tCEAgLCKaftm8cHJxZP6wn3U4VkEHFd/TkTg4WuHJ7Ma/E
	 fS3zmvV7uxNlmGFLcOWylKMtis+NByvKjVL2529cAqE3Zy8xYGAHTf4MZ4jJ4mrp0wr8N
	 q9zS2FUAlAonNsJfzBuncBKtfF/9N1XY8uahZ5GjhoSEMFTAeXzfub5uFC5pAfF9Vdng0
	 e7hxi/yS6KFpNQPCEIMRVAneMU68hDdtj9YskdJbelR3hkppIouD3D8a62Flim9YXGfRV
	 KNyHD60d7uGbYdmtgMhgUSyWvVcx9z25jvXl/xRWfnuWDxbFYmDGo/61uSDRiEz3bIg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794600151;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=HAUsneGa0273pIqLa5Lu1xY5MvE7rrMRCm8aphQL03A=;
	b=tI8/hEicoNWRcha2paO3OUhiqRmN/H8M3A+lBLMqeuwW7X//EChmIHlUJFkJHuB+236m
	 ++2WrU82zfyF9SxCRB5t/wytUUOHqonwy9ieTb9YX5fUJMpFtlwP/U1SeH+5HLMnl0eEc
	 UdF/2rMpfYIb8YAOF1X6Zk2NUtKCRlYnrhqpijP5EZL3Ro64Am36h3OGQ9C1067vy1biz
	 S+KcCY9epJQ2Zcq4OReljlw9n/Xj3eSYgUgpmnJ2ppNT3TMFc2st4jSFdxZ/3IvvyYxJX
	 X3Pgca9DZsTiIdwyo06jxeg1oH2mZCxOBSSzTWBAwColwNfFZ0JsbnY07ioFqWNQnrw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d2ywlmv7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4BD606A333
	for <tools@linux.kernel.org>; Fri, 13 Nov 2026 20:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d2ywlmv7
Received: by smtp.kernel.org (Postfix)
	id 0A2301F000C6; Fri, 13 Nov 2026 20:02:31 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.161.44
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794600150;
	b=lncwPGzRi3+XB6v3Kg/w9ZIgcByMWDmu7iO82EWjZop9FRzIZe4NUSFjZ+0zqDiYUYm5
	 bycxUisz2rLB8sf9GDvYGpjnlKdDWwkuIwz6jMJwn5UD4U0iXu0HIpwEheWPNgryg9oVG
	 cBxbErWbnawQ0uubBlxhL5IEdI6zbc0+xzXHEfOOj/yahOdrNJm8sf4NQDpGGajza94aO
	 6Ot+KEQJSXMr9KRGJkqZJE2l+5bJ96Ez/4n8kG9yH8qp4JCgO0V65grlFhAv7YVBfq2t6
	 vpABDLtkLo8umQeTNpNYvn0ejnWhP2eP7c02sBmDWRZdZ8RFYt4lJqPV6w4TUHS5LZA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794600150;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=HAUsneGa0273pIqLa5Lu1xY5MvE7rrMRCm8aphQL03A=;
	b=lhmCRsy2RXvSREX6oQKThO4/7pl1YP861Qed7RzPHAtLPcU8ZLyRNRgkoaz0gw2OsKer
	 GJ/Uhr/yynQPOnSaEAwRPe6uBL8gZDkaA+KgiNINVxCayUThuxYGGbIoZ0gh52zm1c8IQ
	 s2Fq6CIO/H96sI0hge6mGbwiK3k/1YYikhqiXubTL5OYuJR1yPc0IsXFHUW/zkNSyG3y4
	 RuKB+C8uz5BvWsw1qfxX/FfoLSkNR+M5C3te88T18UjFLRali/9YrBs4v+bQgVHaMigPF
	 rFAHizmoNfm2uHq5ABIbiVf2XAJzAT1pVYeClzOU7epyfDZpmgkHAaibhXW3NLhDk8A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d2ywlmv7;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7C9481F000C5
	for <tools@kernel.org>; Fri, 13 Nov 2026 20:02:30 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d2ywlmv7
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 7C9481F000C5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6df5e315bd1so1920339eaf.2
        for <tools@kernel.org>; Fri, 13 Nov 2026 12:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794600149; x=1795204949; darn=kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HAUsneGa0273pIqLa5Lu1xY5MvE7rrMRCm8aphQL03A=;
        b=d2ywlmv7aMz4TdJpIDpWoUkw0+QSUS3zvYWEwnfxLqe+p76Rr5gj7wcXik1NqhmSvA
         C6EmdpKgOFY5lZML3fOlGqfdmaQhlMm3qiQPI3woeD0oM7p7Lhj7dw/rhSJ3fzhs0Bzc
         4Spvls98M7Fob7M3/rUNvRqafi058jfcQWgt8qLykI8wst2XzbRD6rT7+eMcsPEQlk3W
         IVztvUyk0K/WmXbB1cTYF0wh45cvRdhqA8TqyXsLGbr97iE2X+VBZujqV8ip8jAtIN4g
         dPs0v/ff16mxu87HnEBt6vPR8D5LeHAxkpcj6qQ5FlRsKq/yvOWTCtPI7CORcz7uGWPe
         7HtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794600149; x=1795204949;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HAUsneGa0273pIqLa5Lu1xY5MvE7rrMRCm8aphQL03A=;
        b=PBLsX4tOLr07PfHLw0VqaBCVUOHaS+HyfzAHFjv5QmSB1DVn0eFm55GYiv+2T9h2QI
         wLHn7t9+aY/Kyojh+nhjPiQmMeECphl4vX78a2GB9LzhOWJdrHygxL/ZoK/J9bKZHZC3
         YQkPww6ygKSTj5dzxfYo0o+HfncALC3JTU3TdimMlCl9p0rZ1O5xUoLam+JU68v5sZVB
         v9dOogsWS9fd3K9aediw3V5Tcdz9BEL9O0Bmkr9+lFxZLp+VKDKu7VO8VCZmYhBZ5MAs
         sVa5D9VjsbdvjRSqIKytmhIVpsdpyktYXDsUg7dUWCHzM+nB6YbNcNfssZnOo6g7scqu
         Eepw==
X-Gm-Message-State: APuU4Z+/e/qJAzOMeFFUv+aJNUjYK0IYGNhbqACQAEse+GwGCJZjaenb
	xPvO12uYLGttiO5oCEnfCK6XOHPFAXffoaATHwzI1hq9ESYTayg+0FYg
X-Gm-Gg: AYBFou2ql2JniMdrsW0Ca+BLAu/Er4EPpkwunzuvDYtPu8cFXykGcCbpy5ROT5ZJhkj
	531txafm9gFMp4EHJ6cRifzLz9KpcVIEB2xsooldIfBgzO6J3guMlBj8Z2ewhVRsofYHnwZec/d
	5PnWf9Fs4+DpF51w+w4BXcfJswc/robOd1SNh8uOI6nU5+9Q7ihkCGDJmSWwXr7x3wzAE6NF8l8
	dmGi+dx/1C0w4TL9/Uneuxni+VMkH0Dnz0V9gMJk/BK+g07zzje6k1yNfZS0ZDVf8njnijMssGH
	xTjPl2VvMkL8TDCJF8Y1a4fRY5W4tAopt/v57jMBjpNsK8J+qpvapo4dkEP9hRWsagbkUwXWWwV
	FOkNj/JIvC1lmIxetE+5s083QwbBn9wwt/rdr6oST5pNTtgo8n66qVxDAIIiym+dpnh+TWgEoB8
	KJv19IsL1Ei4PZD0ttPOUUJQcx6KaWB8iU7w/Blmsg5zqZaEO3HFAZXX/Sue2QULOyref7n5B8V
	Fy/hauAMO5Hk6AMMqPJl10N2zRYpw936L4VSvU7Qm9YXzplw0ji4P5uKIgvNg7ahNRaDYFGNHMQ
	ri5PSmZRsA77IGIkx07t6xswkA1vkq61AMgtX99Uc5WoAfNozPA+P8DcRdmv+oKUKOQWoKPWk81
	ae/AoAK/icDzTRKh2iNihNhnkjuCS34T4pR/QsQ3pBRCqH5GU94JiBsNK5wk3c8jg2gmZpcMHnC
	BdXOZAN1cTm/lYoeJzcfMHLmyp+JxQxJHMptYqIlelvRk77OawFAbSYg==
X-Received: by 2002:a05:6820:1ca4:b0:706:5b0b:4e8e with SMTP id 006d021491bc7-71ab51087d6mr2426936eaf.55.1794600149324;
        Fri, 13 Nov 2026 12:02:29 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab43347b9sm2426192eaf.12.2026.11.13.12.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 12:02:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH b4 0/5] send: resume interrupted SMTP submissions
Date: Fri, 13 Nov 2026 13:02:13 -0700
Message-Id: <20261113-submit-b4-send-resume-v1-v1-0-af325aad1179@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQ6CMBBFr0Jm7cQW0IVXMS46MMKYtJiZQkwId
 7fV5Xv57+9grMIGt2YH5U1MllTAnxoY5pAmRhkLQ+vaq/e+Q1spSkbq0TiNqGxrZNw89hScu3Q
 jk3NQ8rfyUz6/6ztQD4+/K/2Lh1w/64qCMZKGNMxVLSqTpHMMllnhOL5zPR+XoAAAAA==
X-Change-ID: 20261113-submit-b4-send-resume-v1-4ba0053deb00
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Gabriel Goller <g.goller@proxmox.com>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

SMTP failures partway through a series leave some messages delivered and
others pending. Retrying the submission needs to preserve the original
thread and avoid repeating messages or recipients that were already
accepted.

Save the signed messages and envelope before delivery, record acceptance
per recipient, and add b4 send --resume to continue the saved submission.
Explicit rejections can be retried immediately from an interactive prompt.
Uncertain outcomes require reconciliation before another attempt.

Delivery uses the saved submission independently of current branch or
sender defaults. Sent-tag and revision bookkeeping happens afterward and
can be recovered separately without repeating delivery. A changed branch
is left untouched until its original state is restored for bookkeeping.

The message-preparation and bookkeeping changes overlap the pending BCC
series [0] and detached-HEAD RFC [1], respectively.

[0] https://lore.kernel.org/r/20261011-send-series-bcc-v2-0-cd17584c40fb@gmail.com/
[1] https://lore.kernel.org/r/20261110-editor_refuse_the-v1-0-4b6e52f326a9@proxmox.com/

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---
James Hilliard (5):
      send: report partially refused SMTP deliveries
      send: separate message preparation from delivery
      send: persist SMTP submission progress
      send: resume interrupted SMTP submissions
      send: offer interactive retry after known SMTP failures

 docs/contributor/send.rst     |   86 ++-
 src/b4/__init__.py            |   38 +-
 src/b4/_send.py               |  322 +++++++++++
 src/b4/command.py             |   10 +
 src/b4/ez.py                  |  326 ++++++++++-
 src/b4/man/b4.1               |   11 +
 src/b4/man/b4.1.rst           |   11 +
 src/tests/test___init__.py    |   27 +
 src/tests/test_send_resume.py | 1212 +++++++++++++++++++++++++++++++++++++++++
 9 files changed, 2028 insertions(+), 15 deletions(-)
---
base-commit: ce4c1158edb292caca0ce4a6087e5edecc1b0371
change-id: 20261113-submit-b4-send-resume-v1-4ba0053deb00

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

