Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8E415667C
	for <tools@linux.kernel.org>; Fri, 28 Jun 2024 10:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719571823; cv=none; b=TsvlNWMySrpnELJUvgY9X3SNjkJGUh0dxuJJ2nqZA0O3vNdnp9AksitCqVMfljlOdx2jxDURyj8Zrpts8d3U1Qz++VSlRWOmvqn1vok75Ngas9q2W0k0fgNtcv/H9YGDz+40wmLxM7ma9s60d/b55sO5VKnsdvdtQQxo377V3XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719571823; c=relaxed/simple;
	bh=6pkStyJjcwvcyED/2T3mq4sf4YJFO82vkKbIvonP2Ks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fio1cxJwS3+jDhcFvaSmX1kDcFaPjo/drbbRXX186e0TIhC03EH+JxFM35+MUuk9gomhV9JltFIORjW6AdNkjMqsnMMn9UBuZvBOH+Mef9YhOHC9Q+asJzoI0E/Uxh//LV2aCue+0j/698a3RHADNF6VZSc6v/YIb+q3Lz9Hyiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Kp4W+g6+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Kp4W+g6+"
Received: by smtp.kernel.org (Postfix)
	id D2AB4C4AF0C; Fri, 28 Jun 2024 10:50:22 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F249AC2BBFC
	for <tools@kernel.org>; Fri, 28 Jun 2024 10:50:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F249AC2BBFC
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-36740e64749so307660f8f.0
        for <tools@kernel.org>; Fri, 28 Jun 2024 03:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719571819; x=1720176619; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vguSZ1SC6Atn2P4ILYBZGXozzMBeFvQFef9Jy+wxesQ=;
        b=Kp4W+g6+rMP8YXaG7eMFfscVmegxU5YGniXqedR1mw59c8FjPtVSPn3vOLmijZAJjT
         IGtwxQ4NHEV0F22wvE+c6ro3vCc/h+6t3Lxc0ZLh55dfmDUiUDW4UkLqlXJBc6ms2APX
         rdN86B0Xr/Kdi4FfCdiCCgLtpFvrL+NWh25ZumFqGldWql71lEEr7XM1a7ZvGhm9e0WY
         MhLYQk368tMokQygbhm+CFj9FM02lvn4+MhPC131bY9aWikQfjxRX5xL3g6CRgfTDiZ6
         AWFfAvntiAjIGQA9U4CUtCt12ChVDaw4ThZzB1Xw8YRX5zz1dWhjcNVpEmINNwwwupYg
         QyEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719571819; x=1720176619;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vguSZ1SC6Atn2P4ILYBZGXozzMBeFvQFef9Jy+wxesQ=;
        b=MaM8WG5Pv3kuPjhx+tU9e9C1D0pabn+qiJxJsWYMBUAtNp9x2MJ9N2K9w7OqFbBwC4
         tddBltyeQVt0G9ZIT4VaUCFAwiospInB4Wi2zSMK60PekfFK8i4vpIty100qV4qfePkD
         9kEmtky6wdncEx4v07zyCmS9YANvf8XpbEXkA2X/Tuj2/YoY9KYdzyH33rqjZRJFx78d
         5gsxoyL5sJqTGX2zN5s4gLUATVyWrknEzVffRY2qaqYaEEe3sCv5X4iAptuncXwQydty
         wAdzv/CEWHJmVRWLvl0SkY/fIvt71hJftjKyWbLHvjd5rfqfcBsm3PdP2vO3MNds3ue7
         bEiA==
X-Gm-Message-State: AOJu0Ywd+mHOo652AgXbDDfLSVSQKvaLD32Wbxz2yZIduow5Jc+e/Wq5
	zzWbWjahxX2rFbph3eBxTnHk/xzyTaJAtNPe9u8CIHmiUCzuQywBQcHu8OeuXyEgUU29gtqDqoD
	T
X-Google-Smtp-Source: AGHT+IEIvwjcCrFRmuV7CxeEYgYf/DjGWxx7QXcpNTvISTfONdaamQjtZWEXmzbLLAN3n0EFrOlRGA==
X-Received: by 2002:a5d:5f53:0:b0:35f:d57:6e3f with SMTP id ffacd0b85a97d-366e956c1cbmr14742650f8f.31.1719571819058;
        Fri, 28 Jun 2024 03:50:19 -0700 (PDT)
Received: from localhost (p50915e7b.dip0.t-ipconnect.de. [80.145.94.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0d8cb4sm1912074f8f.25.2024.06.28.03.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 03:50:18 -0700 (PDT)
Date: Fri, 28 Jun 2024 12:50:17 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: b4 wish: differentiate between signature problems
Message-ID: <mw7wx2wpwefefml5g4lcfwwq3udfhok7o7iteb2vnmj56edw5w@exb6tviwiert>
References: <wxyjcpushnvpdrv42dijurk76oh3qny3y4mihnopof6fnwhwik@jk4tnftk6cds>
 <20240627-miniature-hysterical-hoatzin-22461a@meerkat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="embky6exlwlttfo4"
Content-Disposition: inline
In-Reply-To: <20240627-miniature-hysterical-hoatzin-22461a@meerkat>


--embky6exlwlttfo4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Konstantin,

On Thu, Jun 27, 2024 at 10:22:59AM -0400, Konstantin Ryabitsev wrote:
> On Thu, Jun 27, 2024 at 08:27:23AM GMT, Uwe Kleine-K=C3=B6nig wrote:
> > After some debugging about "=E2=9C=97 BADSIG: DKIM/linaro.org" this is =
only
> > because the signature is expired. (It's only valid for one week. And yes
> > I know, I could fix that by picking up patches quicker :-)
> >=20
> > I tried to improve that to emit
> >=20
> > 	=E2=8F=B0 EXPIREDSIG: DKIM/linaro.org
> >=20
> > instead, which would IMHO greatly improve my user experience. But that
> > isn't easily determined using the dkim python module, so no patch here,
> > just a wishlist report.
>=20
> Correct, this is impossible without the following being implemented first:
> https://bugs.launchpad.net/dkimpy/+bug/2047054
>=20
> Unfortunately, the comment on that bug is not very encouraging.

I'd not want to skip expiration check. Just want this represented in the
verification result. It's still an API change, but in the output, not
the function's input.

Best regards
Uwe

--embky6exlwlttfo4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmZ+lWcACgkQj4D7WH0S
/k5zDAf9EjnTFaXKZzFWKfcWVAhjweVrxjDNDe3KCMXRZ6jCCObmh47Cpp/b3JpM
iERmSg8QljoGQ5MRCqVkFXLZiiUBZxHgJm8orKP6iFRFLTNydRTqFYUQmnJzR76V
uwMItE3IMw6JpfrwOZPHwXnqp3PoetjhU8B/vQqhc2D8g7BRryR8m0LbXeL9ow0e
G7DPl8fqA2ltDnXZotkb6FQtRPdyn1HaiFQVi9i7mQ6wVj14yRlgPPnPTJHxMVLn
YQTKdzFgjAxTC6P8gPWyQO7Cx7fTVeIRljIrfIyuqXLcmDxL4y/7SGiGdOaDOSJr
aldoXuPHCGbJkgONAE29sE5hQnWl2A==
=5vEk
-----END PGP SIGNATURE-----

--embky6exlwlttfo4--
