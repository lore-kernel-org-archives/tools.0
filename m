Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=3; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794883984;
	b=qZ0tsNMfczWv0hlW07iacHjLInF3vk7MyFL9PzPH6fmNqFBuDMnZD+Ww9qf2TTz6VKBv
	 Uam5Fnz+E9Y8fwngjBO6OFga82k8k3IO5CmEHgunZXI7D/LG+o6SwQAHtXGJxesIiMB+0
	 icT0g+XeLr140ikyRnYjm3MRBmbqCc31aVY4WOw8L0mVueOstyYqg9AtNo1J/7Nv/iFFg
	 tzTQyUMb6LDwoU0Rq5HeiDTxfSfhoAon2RGvW3R06ENlkKe36OpVQzHQkzIdm2aJ+btpQ
	 eQQwUVlknbUSEw4WzNkbEtUu3uzGIRFzXVmDGg0PfdDKNg+mjeTyi+zfF4qoXPErT4A==
ARC-Message-Signature: i=3; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794883984;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Xe3op2F0dnpSZtyOCihid5mFS6+336nP6F48w9/QZqc=;
	b=Sm0so+7rhZVe1sq5fPgRgOSF2Usb3b6UCdTrCQ8J0RFYY7MD3+PjVYeB8W9bddwwbJu7
	 Dlpg6AXBAWNpF/VoGatncsJDDQJeEDyqqr+vZVSSc87OHBYj3jeRkkNWSoCmxnUw1Y43Q
	 Rrf0JATGmDCgCI3q3MfIvyahmG9cEM0+IbyiXTY2GrjKog8IiZAI6MYoLN5ZHeMIZCWJp
	 5VzV7EU0E6Qhjx2pRoSf+2jR8LCRbXqkknLme5E4TuTbjNwecGfI6tvDq09ZejT05SaCa
	 Q+sW35X63rYXjTvT2EJZCtGGv/XdOlpK8C+nRbEHnerEWgujilFAchn9tZSTuHl/fzg==
ARC-Authentication-Results: i=3; smtp.subspace.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=opVxULMZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89056606A323
	for <tools@linux.kernel.org>; Tue, 17 Nov 2026 02:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=opVxULMZ
Received: by smtp.kernel.org (Postfix)
	id 4C6B01F000C4; Tue, 17 Nov 2026 02:53:04 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.180
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1794883984;
	b=1D4jNSx/mQTEAyp73NVjAlO6HxI+Tpk6jA97tSsW5M/T6XMu/d2hjvUn7UHZhmNMXl0/
	 hRAmy+indE+NXXOxRuWji1Is7ukBGbC5MCg3ucmGHX3IwZ0C23cQw6DhTH/wZBueWRqEH
	 UIcDMk05R96PU9Xmm20QDE1gosGQ+0DJMdlvhpIrp8iUh7c1D8a3w4350irscIItP8Ax5
	 E9udDyylrtEvJ31lxLTtXg3V8jtWniDgVLZajOyLQzeCBjDSeLw91ixni1CRYmfXurMKb
	 lHO5+CrMA+p6158iv0qcFZjkzNwxijXr4/cs71Nfg6RDjjpSmaptK2FjD5BLFLFntdw==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794883984;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=Xe3op2F0dnpSZtyOCihid5mFS6+336nP6F48w9/QZqc=;
	b=IZCC/LOk/COfcXn1DZ1XwEOUPEPqCNL/IezamLZ5eRfGfWIIGIihctDbKLw2O8ApPQOU
	 9foBoJXVnj4241PNwoRVWfWeZDIDKh8mz9rVuiwkBeb4o6H+95mE8jzBhyAbJ7q0b5SQC
	 hYaS3SX9HmPzoSLMEajbq5ZawHhTbyaKZ7cJowSH4uwIQJCtwP8mxcoyTeTrtOVCQqCuK
	 vxH+ir0qwe4CF03LD1qeoNKlMHVlDfdvJBYjg0hRkmj2Gwcxm2cywpwBfyf7tvLLmjoh+
	 5i4tuKmKiWHCvhs5+loTYvfuPqi7JO/iTYq8Jezv9phlLMqKA7Kd2oI73VuN4Hmb9xg==
ARC-Authentication-Results: i=2; smtp.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=opVxULMZ;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.180
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B85BF1F000C5
	for <tools@kernel.org>; Tue, 17 Nov 2026 02:53:03 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=opVxULMZ
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org B85BF1F000C5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5eac6c5f927so1478803e0c.0
        for <tools@kernel.org>; Mon, 16 Nov 2026 18:53:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794883983; cv=none;
        d=google.com; s=arc-20260327;
        b=SXutUHFlTyNqWa+qlKmYSPFgUob97NB9XxNZbJYIrDojImAD7JTuNX3GGeTsc0Vnm3
         QAHSsKftPeet9dGcRIXJmrhQ/H47hqxNc2GmOvl013EFsdsgS5OwUHP04/fSqkZt8Wnw
         dape7GuNSSvO7r0asBOhkBZXK1ziihDQ/fi4g8po9G4UmGvUjFbAQZ3411u31TISXMHP
         hVFywWoq5GY2tXbo5u74GLEwDzHBxR50SkqYGs87qvF8wGlWCfH59EeoYFsnBgVpozzm
         rlU0pH9dErSa9O0HzTf9H34ADuJhOJvm3gsJRy2Lhbd+gv2e1jv7o7aq/QkJPeU9NJWb
         qIMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xe3op2F0dnpSZtyOCihid5mFS6+336nP6F48w9/QZqc=;
        fh=IJqJYq/8aA5bZ5zN54OMKN21XKKG5OJ3sR8aAJnlCLI=;
        b=bJivRTY7wCzRIEWX/xBLaoJlbuvQEfTDYHXJtUuxuiIsbK1yse7+AY6Z257PDMmuOS
         OebLpZBY3SHE//WFqzeSv1YbmCeAkGHzoIDXxEvKlPeyGBJ8ilHEzwXkkrCmcsEO/5gu
         02lEEg3MYvPoSnCE51dUzHMU0na0vjYk8l78R/mr6YBcTEng6SjAHmqemyECaYOQjESD
         NdMMM2WLkK8hP8qbLgpC6DGZN3/llOKEHLHSqJ2V4SQNyMbE/MBty4T5i2ON//WeGJMM
         /3SwOhuAIcRO+lD3vHL6FZvPf6njsByAFdNIhEG4qUGGRf7CaF/b+I2z8EswoYHFzSou
         n0Lw==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794883983; x=1795488783; darn=kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xe3op2F0dnpSZtyOCihid5mFS6+336nP6F48w9/QZqc=;
        b=opVxULMZkHtUfMDsUGVbRWW5O/QdJ/JdOMR3KEXazwO4ZcV5eCioQVEENC4zsjOrAI
         exhCuyrHS+Or9IkZwI0/evwZibswZJDOIRE5TZQc11iYr+j913aCrRJ9G3b3VtBnKIkz
         hgGQDowdrwiDUgMjiGyCxmAMnDx4F5fS762CyG5rBw5rSHNtEZukfQb9YiTh60TA02mv
         MjCf2G983WA/Y2hPutrHJrhdNsrBGuQori2J3El1tERcbWbv1IYRmgTebsvHxloiTtNa
         85maPgPw2CcKJYCwqSky4mk5NHqsO7duGDFtaT4ETAgmql4/ePKjiBfLRghBxILLTrsR
         DUxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794883983; x=1795488783;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xe3op2F0dnpSZtyOCihid5mFS6+336nP6F48w9/QZqc=;
        b=bFXyIiYbUuI0uHE5nZeavM7vY+BWrry369JgYpBCuFbItKfwxViFbHXyMT37yQw9hR
         Dd5UI/idpVe8FKEZjMyppchbtNC5t9c19GyOh7vOI1PUu/8dFn49NI7hDn5by1oFR2dI
         VFJVuqQtYHMcRULP1WjZkOvHo8N9Qoy1dbn38LUK4WrTzhl5xiuBd3IPTjkRmWiTnPmB
         Cyvums+fel81p+cLy02HqvrD4EIdRIGyOKKNlF10UReaFtk5Y4eKm0rVm1St2oVSm0Id
         nyczxp9UBKr1isjUBN/JssMEtVOzJP37rdV4DQf5sfn6ygp72iYeCOC3pn3kxvqRbFzK
         Sn8Q==
X-Gm-Message-State: APuU4Z+m8qYyKy+r58E42ZTS+TrUdbDEWA7xJgQY4U4BRdDpRcWZMbsZ
	jnKxAOWm6hire1+bqGSay0qTwtGvIn+tfhlJyBdXgB6/LY2tXgtvkjvLG4UHJAz2O4nxZhWy2GR
	1bVXFN7HYVDpcKRRjNzCZHSpf4t5387ZpGzY6q+w=
X-Gm-Gg: AYBFou2MZsjKJJQb3Mm/SCShA3/IOTjWQhPszbNAFLGvpjx5OWbr6Zimd9bOyzxVebt
	+uF1RXDAlL5euafE75nbEAU7mYAsxNIJb1RU8DcCVK5wV+CGrHHzHUJV1hejDJlK0Nv9QyuLvUN
	5cy2rRReAxYAuLYV0MQTVMXu1u2kXbbSDyyrogyxiT4d99FF0tDwK8f61MdmcQlVIGCfk1EqAU6
	QTvhL0HKb+KWXJUkyQ4e+ICocFatXib98dLU5shNFg24m8SwSl7uLy9zhinvhWnRZrQOHuZuDbi
	rG8jUDoNnkGVOO6O8QvibPtpCHpzYx1pxF7pvSK5ULoMjYscH+kzNtv8/7YAcHSFnwBiM1pyLL4
	woZlnd7m8VhHliO6QbE+x3GmtNoFzw4HdwSRmwHqIbYREPXjKRnJ37qdT26peOXjh3jnXu4sbgY
	4+z3qALm346mQrVk7+TGG9L2WMHmo9lGoViqqkYIMQa8gfWGcAaVYVUfegE4uiV0Qks02iehRTy
	YFYF51ClPUzTP++rp+JX61hNH4C2w==
X-Received: by 2002:a05:6122:468a:b0:5c9:a60d:327a with SMTP id
 71dfb90a1353d-5ee34a79222mr4505830e0c.14.1794883982676; Mon, 16 Nov 2026
 18:53:02 -0800 (PST)
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025-submit-imap-preserve-date-v1-v1-1-91ac2f5b502e@gmail.com>
 <179451279186.1693101.3646569244001837281.b4-review@b4> <CADvTj4oqJCvC1CoX4Dw=nXtCR4GYS5JiTNL5--iRKjCqG2FWzw@mail.gmail.com>
 <20261116-authentic-attentive-cricket-b046cf@toolbx>
In-Reply-To: <20261116-authentic-attentive-cricket-b046cf@toolbx>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 16 Nov 2026 19:52:49 -0700
X-Gm-Features: Aa3M54pdnciqkCsq9GMP6sbe4ueM9EMdBYWsGGXdrdykh-F2JtNEqOFw3NDNIzk
Message-ID: <CADvTj4qr0A0c8DpsNhWK3aV=Lh1bJL4knMjkG8rDaM=Qa01fsg@mail.gmail.com>
Subject: Re: [PATCH kgl] Preserve original dates when importing messages over IMAP
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 8:06=E2=80=AFAM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Thu, Nov 12, 2026 at 04:07:04PM -0700, James Hilliard wrote:
> > On Thu, Nov 12, 2026 at 12:46=E2=80=AFPM Konstantin Ryabitsev
> > <konstantin@linuxfoundation.org> wrote:
> > >
> > > > IMAP APPEND currently omits its optional timestamp, so the server a=
ssigns
> > > > the import time even when the message has a valid Date header. Arch=
ived
> > > > messages consequently appear as newly received in clients that sort=
 by
> > > > INTERNALDATE, including the Gmail web interface.
> > >
> > > In general, I would consider this a feature, even if this was not rea=
lly
> > > intended. I would specifically lean on this in a scenario where we
> > > perform a "yank" command -- someone would routinely be yanking an old
> > > thread and they wouldn't really want to go hunting for it in the midd=
le
> > > of last month's mail.
> >
> > I checked the other targets, and there isn't currently a consistent
> > date policy across them:
> >
> > - Gmail API imports already use a valid Date: header. The target omits
> >   internalDateSource, whose API default is dateHeader [0].
> > - JMAP imports omit receivedAt, which defaults to the most recent
> >   Received: timestamp, or import time if none exists [1].
> > - IMAP without an APPEND timestamp uses import time.
> > - Maildir preserves Date: but creates the file with an import-time mtim=
e.
> >
> > Consequently, importing the same archived message through Gmail's API
> > or through IMAP can give it different dates in the same Gmail mailbox.
> > Preserving Date: for IMAP would align the normal case with what the
> > Gmail target already does.
>
> Okay, after more thought, I think your reasoning is good. I didn't take y=
our
> patch series directly, because there is already code in liblore that hand=
les
> date header parsing and I wanted to use that instead of reimplementing it=
.

The liblore helper prefers the latest Received: timestamp over Date:.
For patch imports, that can lose ordering deliberately encoded by the
sender.

b4 assigns successive patches Date: timestamps one second apart, and
git send-email also increments the timestamp for each message. Sorting
by Date: therefore preserves their series order. Delivery delays and
retries can change arrival order even when all server clocks are
correctly synchronized.

So a difference between Date: and Received: does not necessarily mean
the sender's clock was wrong. They describe different events, and for
reviewing an imported series the sender-defined order is useful.

> The latest master should have the functionality you were looking for and =
I
> credited your submission with a Link: and Co-Developed-By.

This avoids dating old messages by their import time, but IMAP and the
Gmail API target still differ: IMAP now prefers Received:, while the
Gmail API target uses a valid Date:. The same message can consequently
still get different stored dates depending on the import method.

Should header mode prefer a plausible Date:, with Received: as a
fallback? Alternatively, if Received: should remain the default, should
we provide an explicit Date:-first option for this use case?

>
> Thanks!
>
> -K
