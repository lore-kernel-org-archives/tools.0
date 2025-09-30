Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFD91F428F
	for <tools@linux.kernel.org>; Tue, 30 Sep 2025 13:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759238800; cv=none; b=m3rSEdnqdriSJvwx8JoIdJJ7wh04wBMajLmOxd/dwucz139KAMHPQ6ZwgaoiuloY0gEfz2Dltc7zT3BdLBskC6Gp8jXIrJKs9cFYunfLYOfU7L3jF0N+5IX+FNJ3nBZt+KKEntR9xhxtOlRcqPmzLGste11xFrB2Ms0UyUcaEII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759238800; c=relaxed/simple;
	bh=TifNcpUcUgeCa71erYKkCQWwmqlblKi7mytsBdbEPJc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PmNhz3GiozXUFvUNPpWOx11/9+bAVAMvWI/xdcp0RcAu3t7FjavpQoOkb3V8G1UIA02VJ2qM12lc/lYSD2GxJj9pAw2x3maqpq+O8qwV6Gc/JF3Wz5RdlSTKoj0qPmxV1SxyrxnAkV/+d9i6chvyWv3eXBc79dl+BcjyJ2ADOyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pCWSKOgx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pCWSKOgx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63122C116D0
	for <tools@linux.kernel.org>; Tue, 30 Sep 2025 13:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759238800;
	bh=TifNcpUcUgeCa71erYKkCQWwmqlblKi7mytsBdbEPJc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pCWSKOgxTgWvx8zFBLMk77iENkvb4KfaRdfZg7zZAjUquqGw8sVbA8M9GWuc2JxkR
	 ATokvBtvbuhHhvROf7Wevc5eNgOthUVjASAvzq6u+Dk5gkCsWNik1ScKR8FpKquTLs
	 miz+tBMRvYAOHAkYYQMdzXo6jazBlKh18tNlXWndRByZzmgcjK0ELCmbAiphrbwWaE
	 fcip2WUYxRQBV5k3MufBtq8qqKrjax8tobrn6K4epYRGmtwxX+YRNoQoGnq2GhD0Bx
	 SmFIOhjjBIWYldYqhTSBzDUtgv5uczFQev9QOb7CFqpXUykjLjamTBe2qrO93kIwyk
	 4uhVH66lSPKSA==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-634cef434beso6205807a12.1
        for <tools@linux.kernel.org>; Tue, 30 Sep 2025 06:26:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUrdJBYaRK294q8ZXQ4Kk4V7G4ApH0lnC6+9W5zWKfkXCv8S04EBhnETgkzWt+oHkwojlUv4Q==@linux.kernel.org
X-Gm-Message-State: AOJu0YxseVNIfWt17Lp2bl2FYTKaZR1XGgQMRCVnQgrLm1+Td5vbYcqx
	1M0uewRobbFM0N3YoS4fsXxPdKYAncGkuFIkGt3SX5qtgic3EJwtVYttYaIeB1/mGDmpyi7OWmX
	IbsQT1Fz2Y2iIFpVSL9vEdG4Y+Up0Pg==
X-Google-Smtp-Source: AGHT+IH0OxJCGzhUKR+l/E++L2AGnfsL8g9h/g0TYKs6DjTwZwmYZ/5WjfYJ4yITxrkJCU8bpuWc7AiJ1F8BBcD6P/U=
X-Received: by 2002:a17:906:7304:b0:b2e:7614:d92d with SMTP id
 a640c23a62f3a-b412f35c3bdmr543512066b.0.1759238798996; Tue, 30 Sep 2025
 06:26:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20250930-groovy-soft-octopus-bd626a-mkl@pengutronix.de>
In-Reply-To: <20250930-groovy-soft-octopus-bd626a-mkl@pengutronix.de>
From: Rob Herring <robh@kernel.org>
Date: Tue, 30 Sep 2025 08:26:25 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJW5r+5eXqcbdHgwt5dsv9eRYOXO9azOzkMco_LxoMH5g@mail.gmail.com>
X-Gm-Features: AS18NWDmZuy3DWVhqdfdnCvYLP3WMLS_l41BNKRBBBOtxbz6NY8t0FTBfN4IHcE
Message-ID: <CAL_JsqJW5r+5eXqcbdHgwt5dsv9eRYOXO9azOzkMco_LxoMH5g@mail.gmail.com>
Subject: Re: b4: shazam: UnboundLocalError
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@linux.kernel.org, 
	tools@linux.kernel.org, kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 30, 2025 at 7:18=E2=80=AFAM Marc Kleine-Budde <mkl@pengutronix.=
de> wrote:
>
> Hello,
>
> current b4 master crashes like this during shazam ("am" works though):
>
> | $ b4 shazam 20250930-gs-usb-max-if-v5-1-863330bf6666@coelacanthus.name
> | Grabbing thread from lore.kernel.org/all/20250930-gs-usb-max-if-v5-1-86=
3330bf6666@coelacanthus.name/t.mbox.gz
> | Checking for newer revisions
> | Grabbing search results from lore.kernel.org
> | Analyzing 8 messages in the thread
> | Analyzing 1 code-review messages
> | Traceback (most recent call last):
> |   File "/home/frogger/local/git/b4/src/b4/command.py", line 450, in <mo=
dule>
> |     cmd()
> |     ~~~^^
> |   File "/home/frogger/local/git/b4/src/b4/command.py", line 433, in cmd
> |     cmdargs.func(cmdargs)
> |     ~~~~~~~~~~~~^^^^^^^^^
> |   File "/home/frogger/local/git/b4/src/b4/command.py", line 105, in cmd=
_shazam
> |     b4.mbox.main(cmdargs)
> |     ~~~~~~~~~~~~^^^^^^^^^
> |   File "/home/frogger/local/git/b4/src/b4/mbox.py", line 854, in main
> |     make_am(msgs, cmdargs, msgid)
> |     ~~~~~~~^^^^^^^^^^^^^^^^^^^^^^
> |   File "/home/frogger/local/git/b4/src/b4/mbox.py", line 113, in make_a=
m
> |     lser =3D lmbx.get_series(revision=3Dwantver, sloppytrailers=3Dcmdar=
gs.sloppytrailers, reroll=3Dreroll,
> |                            codereview_trailers=3Dload_codereview)
> |   File "/home/frogger/local/git/b4/src/b4/__init__.py", line 362, in ge=
t_series
> |     if pmsg is None:
> |        ^^^^
> | UnboundLocalError: cannot access local variable 'pmsg' where it is not =
associated with a value

I sent a fix for this 2.5 months ago:  "mbox: Fix splat in get_series()"

Is sending to tools@kernel.org not sufficient?

Rob
