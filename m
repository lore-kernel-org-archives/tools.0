Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795684036;
	b=ohLaDSdd/goU0h2W5g8UaLr423AHugaU4JnuIvkpFOhCUe8wC+dwqIWOAlIbC807qWhX
	 vH0g2/RH97ypr1XnrklLipgF4SyIRvZogXenNmdWzHCVW2BR/U28OwCczjL/2pv5PeMun
	 Sktu7TWmnYFKWp/f0UueTfwnlsIrdit0Czyx+hlyDJ1u5X8FKq1Ls+gZFlY+i6ArU3PnC
	 lG3Tx3QFgA/CEL2xFmJaRpECZe2tEbc1+IBgah1eMzr1KtXw3puQgfVn4p9U+kstwQ/tn
	 x6AKQIyjCEdQQGQ/i/3V8Z8i2wvwkECucvOXR7qyp4AuH8N8KhIm3rKmQF4d5exMR3w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684036;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=+uNcBPguysmQ8/FB/WzpSmoRMFHNDBQhht3tWQyiekQ=;
	b=xBFaV8tmoE85uXo+6pGG1qpw4/GnpQRXsADydd4+wb5fz+B0w1prWfG0pDKYTusy5wvQ
	 3K/BcLtgiVneAz7wRRwFQnihQ94omHbUa7ym2mwrsZOlAcI1lDMHdaYAySnyAGs4t1IWM
	 eRf5u4csO5TTmLU60VN//UEIhQ9thteuwC/U8X1jjT01rqD9Q6SWJuJo5Y36G2LMEmLJe
	 97KlIBqGYERtp4jXwuPyoP4GsCfmT3MXKxehzyxYfyysKWkkWasvatVtqTh8UYg90YYT/
	 PET/NRTUAxCPHvAlvDzFDkR8FhGSqHF3iAn0vF3izNKNyu8psL/+LZiDCfOGY7s/fKQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NPxbkEVm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249B4606A31C
	for <tools@linux.kernel.org>; Thu, 26 Nov 2026 09:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NPxbkEVm
Received: by smtp.kernel.org (Postfix)
	id 978D41F000CA; Thu, 26 Nov 2026 09:07:15 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795684035;
	b=S5lA66HioJoGbsytE1Pu2IftCVMUQFTY8mxmBq9qOp6z43Z8nxMV2H/yoh3Jo2qUBKAf
	 QdSI8DoeqgO/a5hsxe76Jj8S4ygPOL7hFuRpoJ25Dm8RMLlnRucUHH7j9QpYY3j/Ily77
	 05rmOATawK5uzx7pVh5GLxMf8WbutB2mkoYVc1q3AgulqjX6sORztu1IbJ/XwsCaAvqSb
	 03V/48mnsi9Lo68UqJOkjgYzzsk1azDMTTcWzST/Yt4HcpkjxZOacren3qmMs5STgJ9g0
	 RXikOKGlQiUADS6f9NVC5SD4MM2vnM5vhiqOASlxNYdzqwTklJVw5XMIlMrUXd5iDow==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795684035;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=+uNcBPguysmQ8/FB/WzpSmoRMFHNDBQhht3tWQyiekQ=;
	b=Dy1vz01fPl9sR3N6tWypWWQGrM72wN1GDqAQRtQGrZ18BaUFpJdDsYPJszTb3ZSfX3gg
	 VXHMqm5jCG0ame9fYYf4ML3Z4CdJi8qGqCMbIS7q/q2bTVZqfObCoFbcivFclOACkp9vX
	 wd4q9TdnX3fd7zH92W6bfPcm529UzDvVU5N/CIWR7Lx7Iblt+aUWJ9sw1HDtYBe3XtS/p
	 l252EONRStpmeLSj9+PnY4F2UkIeYh6E/bZ4m3C2l3oeKWoTNQx8mXp30KQOIm7zwz6bD
	 73HGvCGVDAltB8o4wY8UAfrS9Z8yWm5pHZWJdOWfLm1MW29mrit8zaXsaH/BM3bpHkw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NPxbkEVm;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 52EFF1F000D0
	for <tools@kernel.org>; Thu, 26 Nov 2026 09:07:09 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NPxbkEVm
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 52EFF1F000D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-862b3a39d0dso3291824a34.3
        for <tools@kernel.org>; Thu, 26 Nov 2026 01:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795684028; x=1796288828; darn=kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+uNcBPguysmQ8/FB/WzpSmoRMFHNDBQhht3tWQyiekQ=;
        b=NPxbkEVm4R/m6YjsoCgdDEmuGSDcHNgkmYhGZY3vnEO0pWlwcQe+xABmdhQdUXwao1
         Rz5SCl+7O/Zu95e3JRn0plO+2uajiFZtrBQKvfrSfJgdhTLncFiE/zJlrhOD2yOM4h3V
         cRa1hl5DoAWEMVtQwFAtmHivmGDRWp89oS52CfjWpw6GPK6HjANC1GcS6hajEqNIjAVf
         BjXyUtDiPzm7Kf4quB1ieRkAYz1zQxWj8eta9PoM7CEw+kKL0CGWgpnFkotMUxTknwdj
         hXNm+dzZ99CM5KXMmBW2pcGG4sK4Drz1lgCaC/BHyTyA96NjaiUnhxQMK8J+bv0WdMU1
         thlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684028; x=1796288828;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+uNcBPguysmQ8/FB/WzpSmoRMFHNDBQhht3tWQyiekQ=;
        b=kB6UOsO9jgmKjjmTdXiViia6jctsn/txxc692NeArjpYX9Pt4KBTwCb5h0X5g9NHBn
         BbPReoP6dF0oMsb+R0F9frxX4adCDnJHONP+eMPfzSq6KodFuqYj+2xnRJ2icrv/uZBB
         ptQcfxcoAV2uUUh+37OL8xMdHWtbG/r7MNPu3SjLKc+dCRJVSOmRsD4tk6iV8+eMbyKo
         jk44hMBUi2q2c686WsvBC+fV0KTkiKR88F61IV/YIYUg9w1iUs1aSi4GzzzMS3xQtATf
         OSKmeXCtwxdAZBAM8Smya7G6aVwmk9OD9U7BMfTwZtVwCMTrLSnH/cxh21/2fNgMUboN
         z9Zg==
X-Gm-Message-State: APuU4Z9IheuBjLRPSUxFIER/3yljRoG9gTiUQPSzoZHbI5X9EQcNgB3X
	DgcaU1cofoe9JQeyt0xGOY27BJlF0fgqDXmsqJ3o6n60HwTYiIF2a/e4
X-Gm-Gg: AZFdTZfeBhcJLTfdcR5ev41CL3cNNle8xytOaOwdYw6hvCQBgqngXIZ7Ex1AmHTmNfP
	9koY5mr8RAWAzWS9iwnwky1A5MjwN9U5VPhZYA291Sblsim2uZsqF7vT2X8ouj+tPysV3fH2uWe
	PUCXM1DmichzbQRtCLQ8cyO8xC4u4g9dqcLRNB5vlDqczNvoTVrzTB+DaXF4Rp0i7qZCEnLydZq
	s2JpQXxtihCEJtR8nA+CaqBWUc8f/gz/QQ+2YOiZ9eQpb6S9brJMA+g4ZFEq6C6NJ68MT6PH9FY
	upY91QQCHZsnh58Ivy8M9xCCBz9skhqZxU6fiijVqC8LFK7jEqrJIr9EKpr87bxcFA/d2JLgoUk
	xOGrZDkvOe4qqRmmY/CqFMtaOOWwAtRvA+Dvh7e+TfuiykvaE0nmrACcVoFp2yIOA/ZOU6bjK/Y
	zZ4rEnCzzDkULUICfhjEWIBAnREw3i+g0noHa4BQN2Q3574HVE6NahJGg6zu/6kdg0ncE9CvLIK
	EvYrekBhiTAPbf8b+TAzcCFAeFb7sp95wnasSm7tODEFsQ9JPYLXbNWOBRBU4lCx04aTZvvReRw
	lRPERTcE4rUtbcKSOy7M6Yop+e4SGqqvwJrlAq6ioKZgxDC2OuZU14QcvkWf9tPE/jJucRnbKZr
	3uinWkSgl+nTLxzkaQvvP3Kmi+0hU9kYvHCq9k9lv2bvmFd8GOsrplunXUZt/QjrEmC0rgpjpwZ
	nd05qjrmj3sBARi9QC3/FXtvAmQkC/5pGkhIQ2eXePAMd193paopzG
X-Received: by 2002:a05:6830:681c:b0:81f:6e05:c1aa with SMTP id 46e09a7af769-863159c5575mr22114058a34.18.1795684028286;
        Thu, 26 Nov 2026 01:07:08 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8631682200esm14448597a34.2.2026.11.26.01.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:07:07 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH b4 0/3] send: fix SMTP resume across transports and
 recipient refusals
Date: Thu, 26 Nov 2026 02:06:58 -0700
Message-Id: <20261126-submit-b4-send-resume-fixes-v1-v1-0-cf5e018d8d7a@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQ6CMBBFr0Jm7URbmmq8inHRwhTGhGJmCjEh3
 N2iy/f+z9tASZgU7s0GQisrz7mCOTXQjSEPhNxXBnux3hjrUZc4ccHoUCn3KKTLRJj4Q4qrweT
 bW+tsMsZdoUbeQr+tNh4QHTz/rlZe1JWjfLxiUMIoIXfjoWbhgfN5ClpIYN+/mU0/+6YAAAA=
X-Change-ID: 20261126-submit-b4-send-resume-fixes-v1-f638342f1147
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

If an SMTP submission reached nobody, a fresh send may replace it.
Make that true for local sendmail and the web endpoint as well: once
the replacement goes out, the old messages must not be sent by a
later --resume.

The other two patches address interrupted delivery to some recipients.
Let later messages proceed when all remaining recipients of an earlier
message are temporarily refused. When an explicit Bcc overrode an
exclusion on the original send, honor the same override on resume
without bypassing a newly matching exclusion.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---
James Hilliard (3):
      send: retire an untouched SMTP submission when changing transports
      send: continue past temporary recipient refusals on resume
      send: honor saved Bcc exclusion overrides on resume

 docs/contributor/send.rst     |   3 +-
 src/b4/_send.py               |  22 ++++--
 src/b4/ez.py                  | 173 +++++++++++++++++++-----------------------
 src/tests/test_send_resume.py | 126 +++++++++++++++++++++++++++++-
 4 files changed, 221 insertions(+), 103 deletions(-)
---
base-commit: dc3a6050dab1b5ce3b6d1d4d15d463a6bdedde2a
change-id: 20261126-submit-b4-send-resume-fixes-v1-f638342f1147

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

