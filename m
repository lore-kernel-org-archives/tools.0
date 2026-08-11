Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E227541DDE1
	for <tools@linux.kernel.org>; Tue, 11 Aug 2026 21:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786482071; cv=pass; b=lQaauds9bxC48iGgsT1TI1FivPPaoO5QkIo0aNzcRHlEHpjA5qLArdN/Ln8UbKlXhwZ5FwarKJj/Puqa1GETjJGhEMKmX2ygctVnQ2JJqLuTE/idytr+Fe4O2CBj4LMU1kXV7AxtmUATuL/m09b1Oq47FN1oPJfbOVQpT4xMJYE=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786482071; c=relaxed/simple;
	bh=xHSrXLJhSdTyK4h/bnRaFJZbZafnqYoCBbPsiMsKwg0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tXnT25zx0dcQGbb77nn+fMS/IQcKFMfalQ76hqyAH7xoH6a2ZLZIhc6xvFvV40IhlHs8u+8eyiXGQimWYHwF+zIftG3Xl2fxXUmgWDE2LxzasbZm7rsAnCzNk+aGCmq9XFy2rYD5RGl2EwSQK5oxzwABIYbI0zp923TQe5CGdXo=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FKEyNuUp; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FKEyNuUp"
Received: by smtp.kernel.org (Postfix)
	id 986AF1F00A3A; Tue, 11 Aug 2026 21:01:09 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.169
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1786482069;
	b=fHo23LPjq6e+HbHz7Ol2D/ytafH7AL+BC4ukbh1p0+z9kkU7hKQC8xloR+/2wulyCJiU
	 CA2ZOFqz1bbU5afuk+WNmOAoFxqqH4aMpgjdSU3neU9khbu7XjrrlSHAbPRXKMzx5pR04
	 lPFuwkKsyk8LtnCnTYGLV/K0VBnOYnn+IwPKmcmGlHZUTzwAuj2gath92aPAUubqQT9TY
	 EqewV0tP+tyHZdztRwdiOgU8s+XnOHW8aO4lbn7zFVeDlQMGMEQu/cjh+PAOhPFK8ysYV
	 pSJjrsvH6qOxjKVpQExLR2IbJ6NGl0vmQW1vdAedZaO+9YshaEZPEnhqHllQMQ8WXLQ==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1786482069;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xHSrXLJhSdTyK4h/bnRaFJZbZafnqYoCBbPsiMsKwg0=;
	b=Uq920W9+QrLgGY8Glx2ihlJDfOJKK+qX0jQKBwixgI9RUj9DKpyhEt8Hr3Mivso4I5e0
	 /B7jTTUHsOwpsNSQqIRxgLLFs5BtqPpNA/K141A71TnSpMdZbYEdsKLeO8arUOIc4yqO0
	 9j+TDryTSXc6+nbyayEGNqdyh1HIqvIOgYXdLboIiTvYLQf3aN55v3BxVid80ILGKec19
	 UzGaGtigskPJyddBUR2H/t5M3+lCgi6UUtAFkqh9caieU5MZ2dfOK0AyIR66ZyvQ0QyQa
	 awXkZZDIX8nnZjhVil/wJITpDtKvrwaXvuQHTgR3N0tpC3fYN8rnTo7UL2DgWr05Eiw==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FKEyNuUp;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F2D6E1F00A3E
	for <tools@kernel.org>; Tue, 11 Aug 2026 21:01:07 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FKEyNuUp
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org F2D6E1F00A3E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d03fcd26a6so579195ad.2
        for <tools@kernel.org>; Tue, 11 Aug 2026 14:01:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786482067; cv=none;
        d=google.com; s=arc-20260327;
        b=SUukIoje6FQJ/sxP0FufPvMwSBDdnvEqDAnjk62ehVw+mjIWjipsGFYD+rspBEMotu
         HEwxzsz4gwgaOm4xZ+eC/dZUmidSt5BIWnrgmU1LCfg2hf0goXuN07KYLGkr7d/DOJfO
         khT1jPkG8JW8XvDAtn/N/NbZdpxTXcjIj5wPGQTYXa3jiS4xPrRgDK2dnf4nGrg4cSh1
         XielF4W1jA090rpjhZxgGuhwnLPLYWUiTtz4n7ZVXe7ZWX4hYLEUA/UbXtnGCn93gZgS
         +umF+mBRwJccG+GdssVXrTm3Ew4qNuEonP3Uz0K7LwhP4/U4B/GUS77S8Eb0pjAxo4UW
         XIhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xHSrXLJhSdTyK4h/bnRaFJZbZafnqYoCBbPsiMsKwg0=;
        fh=ESs57AjfEpF8f34X5TneUbcYmdRN1+YeedIVDQ2IPGI=;
        b=Mju782Nna0NBdrr88fd3HP4sBcES040olR0+OMl8fAxEjHPJucyuPwOZTnyZ21hFZl
         /aKRjDN/T86Mynx4pcafwgRj2nRQ65H7aUxtTHyco/7T8nC+6jlRpChC9IULzA6I4U4V
         ZG8Dtv+Y830e0ASgsAaAW3nkBFuXry83IgHUVU6Wo6NKv/EjV5CDHMr6J8Yo9UMwooMl
         xzc+ZlWklyUjp4OGTjdtRxhMMYPPligwsv8HspSWfiAQzu/wTBPlkgDIcBR/tlOqmiCF
         yNiPFnzNt4YuPhOUX7bjzfMQ+HwB4JM3PZmN06RRGmPK7OcgwHFKN2vBLNQY/1sR3WrH
         BqFg==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786482067; x=1787086867; darn=kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xHSrXLJhSdTyK4h/bnRaFJZbZafnqYoCBbPsiMsKwg0=;
        b=FKEyNuUpNtVKKYL1fhH4hR1my+QQc8epcTeqiKZlnmjTpKW/znO+FMQighgk6dtddJ
         u4g6s7eMkszk0RfG3emv1a3Bm7hWVCwB+NXcWpy+CSakO3mw5mOMKX2K4Y27BrzQfzqE
         +1vD2rSZL91bzQlzmDs9Sk06NyO8pm25t8kOHiqLoi0Dn5MS1f54yiX/p7xPnoNlR9Lf
         r8+PM5cx7cT4EPZY2mGXUdyueZNXDEkPtYbcf4ZBqKbH1y2Mg9Js7ogrI6/HObcVgOoc
         SEezieTDdF+wffOHGN5SYchnc1G/lTPapt/w2IcIv15+Z7On7uXMCdJF3kWfYtyZn302
         B7BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786482067; x=1787086867;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xHSrXLJhSdTyK4h/bnRaFJZbZafnqYoCBbPsiMsKwg0=;
        b=og8EZXIBj2MuA+eEIsnt2jrg0YOc/CAVzfX9cVpIp8ARPveDSSR38AZjS8PuoAI64S
         IhaKTr1Mx6dDWy0mnJU99ydXfuuCB1ogr/crYsPsHcpsSZzWAjdF77c8hgU1S5TEiNY7
         nyRbqtSQr1wWLEp6vHwFUaTGh3CZc6dFh3ORwj6uMuxStsp+2dBeV4NRQn2BZcqZcOJ3
         EkNoom24GiDUYa3rgnA5HQuOpZ4jqEtbPyk1KcRLUfDsU4kn/zNtyAHeFy8Ec4DcmO24
         WMjD9gy7ON7JcWg5pNCkG28cXv1xI7UPrJNvIi6bmF8PMVJxqjNGwHJ4VpSrUtSO7Z3V
         2mmA==
X-Forwarded-Encrypted: i=1; AHgh+Rq+FUxxB4azDgtH/ItpwMDgSapxPOH17UV2EWrjlPyhiT986uZYI2UfuKW7PtZyjuM7C05d7w==@kernel.org
X-Gm-Message-State: AOJu0YwtY4xTlHAV7SOTFRGCvulz0PoalczgbGQX1COqS1K2TWgR+A5g
	k3No0/vsranpvGxafHl/sqH9ijgOCH9vpIMbwmB7UC8X7eEovRf4mlaXeYJ9KJMqtSuuZ7NciR9
	TAZEfNfOsU/rYQ4ssuHUCgV9td7ccEKy7P+4w
X-Gm-Gg: AR+sD100scOa/DgKj+btNP7a0nLYhHK/OBprUlEFUzgvmMnzfostxCVaKa2M1GgmA7s
	q8h5Ki1M20YDlJNDe7EbtY4lyIf05ksS1KRss4wFY4zCSUpc9ghZMdpKdJK5NyJRvlF8OmMskhc
	2vQJdwo42D39SXMhb/4KIYJ+4iZ4c5QpFmC2EwZtfN1o+3GbyxjKVJaS0G0bjv9lKi/DA+AuZvM
	Az9TAQpAcdGWZJ0bK6rJHCaGgh5vs+IWsr4gbMh0OSrUvR2ihWI+Vw5b0CLYSjMjsp6DKWC2g2A
	uk95CtAvsfiaQzF71gY7tbczoJo11nxhNVJaBoszJJcd1K71OxX4gT/DQmk/HIyTcZ2yspO3R1g
	19ET9YACwzdV4woYUOHgwgfhPm307aOkPrOgY1sS9Y9unrBx64RyPj3HoS8fc
X-Received: by 2002:a17:902:d552:b0:2cf:9e90:8be with SMTP id
 d9443c01a7336-2d3456e7622mr1975195ad.4.1786482067126; Tue, 11 Aug 2026
 14:01:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20260603160910.159307-1-laniel_francis@privacyrequired.com>
 <anqsTVj5QGYGiEQ9@monoceros> <20260811-garrulous-serpent-of-agreement-cf9b19@meerkat>
In-Reply-To: <20260811-garrulous-serpent-of-agreement-cf9b19@meerkat>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 11 Aug 2026 23:00:54 +0200
X-Gm-Features: AUfX_mx5xTNPSjPRZOiSX7b2JNTHPN7r0POqFAALJCuvChpsFwzRnqIauZY0U20
Message-ID: <CANiq72mb0RK=2Oaipzas9UZQiEy7FW331dosH0+cFKuVQNE6Hw@mail.gmail.com>
Subject: Re: [PATCH v3] rust: pwm: replace `core::mem::zeroed` with `pin_init::zeroed`
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Francis Laniel <laniel_francis@privacyrequired.com>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Alexandre Courbot <acourbot@nvidia.com>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-pwm@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tools@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 10:54=E2=80=AFPM Konstantin Ryabitsev <mricon@kerne=
l.org> wrote:
>
> It was just Miguel responding with a suggestion how to better reorder
> trailers. Since we can't tell this case from the case when someone actual=
ly
> replies with a follow-up trailer, hence the error.
>
> I added a special case where we ignore trailers we find in the follow-up =
if
> these trailers already exist in the patch anyway, so, at least for this
> particular case, the problem shouldn't resurface.

Hmm... I usually indent with 2 or 4 spaces my "non-tags" to
distinguish them from actual tags; perhaps I should mark them
differently? Is there a "standard" prefix to ignore them instead of
several spaces?

Thanks!

Cheers,
Miguel
