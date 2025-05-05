Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1DA11B0F31
	for <tools@linux.kernel.org>; Mon,  5 May 2025 18:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746470596; cv=none; b=HPf4mpR3+bbSf1lu9dY3u6govbEJ+mjxfFIQugebBk2cCdh7NpA1fm3yRWyeulDYqoIdum56Nr77TMp+V58Zuo+EYt4YJJOdKlnTy0H6D3K8YXtRrZioBIPhpqW8xaEECdjO65kXR9JRcDWbEtL1CSbfh1DHqnATIvWw6opmdg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746470596; c=relaxed/simple;
	bh=TYKArUgcTlLxKhzcae1y//OE1b+xbCp1TkJuVwxbmWs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kt57jbu1rOvc8ZbK6/2cYF4F2nzd8A0u8kaK+V3tmh+ismX/Yz8MIJVCZYyngmpG4Ok4nJpviiOz4zOnQS3bJPZNy1SWU3sfeiVe10Xnr9RnYSBqnUdeeMM8izATgBMKbLu5wdoR6K6SH2GXTe/K/vxR9Ur03FePrXeFTwTUGqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zv8EFBkg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zv8EFBkg"
Received: by smtp.kernel.org (Postfix)
	id 6DFECC4CEEF; Mon,  5 May 2025 18:43:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 584F8C4CEE9
	for <tools@kernel.org>; Mon,  5 May 2025 18:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746470595;
	bh=TYKArUgcTlLxKhzcae1y//OE1b+xbCp1TkJuVwxbmWs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Zv8EFBkgF2U7ysuRYR3BPEqR72Oj3a79VoTCsVlJhvg6ItTlzXkWHjp0vLQAO+Dkx
	 HXeU4UHS3ssxVKwXbewHRpPKoaDOyfzvV4WBcjyYO5Y3diD56rCzRDkGdhZhvL4yWy
	 PTn1Gcjcu590EpLNarzGP4i3XQ5qAe5rignMTmVnW7lpD5N7Dw3FyeI109muV0a17e
	 ELKNcdtw9zte3GR3RNzeRvJmPTLeTIEl+xsW7AWoVDJXsbKPPZbAA10JHVJ8oQhVpd
	 r/H3FiFX79Tg34SWRZ8mtG0rDPDFCHoOY81z8gc90SSRAQ5BLX1kjSOYipNa528fdu
	 5TFcqucslZuxw==
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac7bd86f637so1068568466b.1
        for <tools@kernel.org>; Mon, 05 May 2025 11:43:15 -0700 (PDT)
X-Gm-Message-State: AOJu0Yw+qGWD9pwY9i2WcngqtirsgDvFMb8rLIxFlLgbSEzpb9iVj7Rp
	zURY+cuKsDOGhsKjkrUAIjGElEsShdkP/dt2Etzal4tZ+NuOmLLFd06yH6hGNoj7n5uOU+8+5PM
	0bnt2iwKidxtPj0uJ0V9lVmx4Ig==
X-Google-Smtp-Source: AGHT+IG7IDGBUWHRGLOsK2n6uksCznFI23SIlpUiq2et8cfTWxUZNf28aVdlWFvn9+8vm/huE1Cjj0Hawz1btWvCLGo=
X-Received: by 2002:a17:907:7f1a:b0:acb:37ae:619c with SMTP id
 a640c23a62f3a-ad1d2edac46mr53819766b.15.1746470593871; Mon, 05 May 2025
 11:43:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20250408204715.2787726-1-robh@kernel.org>
In-Reply-To: <20250408204715.2787726-1-robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Mon, 5 May 2025 13:43:02 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ=TBdvj3+SG7oqmMRM=ogYyEnwpN_5LaUpRO0ySFOG9Q@mail.gmail.com>
X-Gm-Features: ATxdqUHNUenYPhya41zcSUF__jooCd3CsTvco4icPifEZ_epxt6pFZG8AkHulgg
Message-ID: <CAL_JsqJ=TBdvj3+SG7oqmMRM=ogYyEnwpN_5LaUpRO0ySFOG9Q@mail.gmail.com>
Subject: Re: [PATCH] Avoid quoting email names in trailers
To: tools@kernel.org
Cc: Brandon Maier <brandon.maier@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 3:47=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org> =
wrote:
>
> A somewhat common pattern is adding an employer name to the person's name
> in trailers (e.g. John Doe (Acme) <john@kernel.org>). The b4 trailers
> command will re-write the trailers with quotes around the name.
> email.utils.formataddr() does that as it is necessary for email headers,
> but it is not necessary for trailers. As we already have the original
> value, just use it.
>
> This effectively reverts commit 832010c4d50b ("trailers: normalize
> address after parsing") and all the follow-up commits touching this
> code. Maintaining quoting or lack of seems more important and common
> than oddball 'mailto:' links.
>
> Cc: Brandon Maier <brandon.maier@gmail.com>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  src/b4/__init__.py | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

Ping!

>
> diff --git a/src/b4/__init__.py b/src/b4/__init__.py
> index 99ece6484d8e..de324d0f714b 100644
> --- a/src/b4/__init__.py
> +++ b/src/b4/__init__.py
> @@ -1062,10 +1062,7 @@ class LoreTrailer:
>              elif re.search(r'\S+@\S+\.\S+', value):
>                  self.type =3D 'person'
>                  self.addr =3D email.utils.parseaddr(value)
> -                # Normalize the value with parsed data
> -                if self.addr[0] or self.addr[1]:
> -                    self.value =3D email.utils.formataddr(self.addr)
> -                else:
> +                if not (self.addr[0] or self.addr[1]):
>                      self.type =3D 'unknown'
>              else:
>                  self.type =3D 'unknown'
> --
> 2.47.2
>
