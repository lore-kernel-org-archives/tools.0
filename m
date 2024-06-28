Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C781E878
	for <tools@linux.kernel.org>; Fri, 28 Jun 2024 15:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719586893; cv=none; b=ZZ+w5ouOVmh4/xI1Kl9soZJy5JvNxoxi6evQ38Jv0sWwR4Xe7V1535DC1ip7YwK4KpIs9727+d7TGT7q4h9MAGS3wLt5M/g9WGbO6yM7Y+aRfJTnIm4UnXPYP3nrOnNq14hnbuYvnfV2h3KFHoGRII7Zu3/jmBaJH8LGy2LOP5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719586893; c=relaxed/simple;
	bh=3GV7uBRpgbmmnBBVu6kjRLfG5HZsRL4h/kzdE0EOnpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i2SnrX14YiVmNpJnVS+uworCxT0VHyzhz+OOtWJ4yLTcXrBeIccVLIyGjoQys0Jlmpu1syJ00vy6MIXZ6+sKkPkWSJRKMqMvSQsRM2ZQYHhnIX5E19bs7ZqZ7GUSw5MAhsjuGTvTE6fBo4bFx4gNhQeKVogAu8rhjDJYdubyRzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=2glfnRXj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="2glfnRXj"
Received: by smtp.kernel.org (Postfix)
	id DEA66C32786; Fri, 28 Jun 2024 15:01:31 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 01EA1C116B1
	for <tools@kernel.org>; Fri, 28 Jun 2024 15:01:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 01EA1C116B1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a72604c8c5bso74536266b.2
        for <tools@kernel.org>; Fri, 28 Jun 2024 08:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719586888; x=1720191688; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pi1+F/4YOKHdO13Jd03d3hdRyou6wfscq72lsWyh8NY=;
        b=2glfnRXjyrTZTG1jQnuNaig+fcX7I0tBIAvl0g4Uuf/WtmWkqABC7ns15MuxLUXtsE
         v/PtRg+KzOEkefU09hHutz51hhXcNGzVFcC1voB7L82F4sUL9VteevG0HqSA3rL3R1uN
         hzIRZ07yDOnjVJnevTMJyaOjqPb73rTjx8MxAH2g8mjJ9oJIsGl+VXaIVQMOSdYAKlvr
         qOKWFy5KR77Xm2OU1XaBw7YdSBKT6JRhXNoQkDXaT6QGmDnGuyyj+6dZ/q2ZartrWq2o
         Wab0CbVRfuNSc3hVtRuMIlDuG+IsGqgydQrzY6ZwgCLPSVcKnOacOkBpNUHq5ljJ8kd5
         Lzcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719586888; x=1720191688;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pi1+F/4YOKHdO13Jd03d3hdRyou6wfscq72lsWyh8NY=;
        b=IJ6qF/ym3Toz+jPIrJtuZHhvTIBI7Ww6wU0HJof9WpASR+jibe+FxPNXoeNOuogAVL
         /Fok0nqXGZEBD9knHAqp+E6G7AYqKjdNcAS/8UVJvymUk4CVhDO6y8BJEMhFpfeOTZ7w
         dFOJpRpt028Ot1cq3SyDhLMJinhwzJm4l9d1OCyojcBJvcFqsSZtLY7QBqyKSaGjhZKZ
         PrXNXuWW16E6GLFlT6QwTyvMfyB3hRK6HsvKNqShuhU8RuV+4hS9tMtT/gD5Kr7iIp0t
         Cb39p69oCUOU70o2J/0t6V6acOuYyBKFSyYuih8WSyMsJoMxQ0zkYaCIwhHactzYneQD
         sVpA==
X-Gm-Message-State: AOJu0YzbOYwlUnahA6aaqK8/f0cykuBGlcasw6M7jFE9KZD9SfTHaFXq
	nz9QvW6MAVkUvGJ28+D9p3+MDpnoPb0kHZG0fQl1rnZr+Ufm11OdtGOwslTwpPs=
X-Google-Smtp-Source: AGHT+IFPcxeK2fufXlq2DXx/2ZJkmx8n1OJpMWxXdQE8nWmmd1Wju0arPq8RVdMyw+9GlEIGPiBuAw==
X-Received: by 2002:a17:906:4c59:b0:a72:42b8:257c with SMTP id a640c23a62f3a-a7245b72dcbmr995553666b.35.1719586888199;
        Fri, 28 Jun 2024 08:01:28 -0700 (PDT)
Received: from localhost (p50915e7b.dip0.t-ipconnect.de. [80.145.94.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72ab08d0ccsm87747766b.177.2024.06.28.08.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 08:01:27 -0700 (PDT)
Date: Fri, 28 Jun 2024 17:01:26 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: b4 wish: differentiate between signature problems
Message-ID: <n47q7td2cyb5tedm64wpua2ehzy7h3dzuwihi2aplzmetyc7yc@wchthchnfoly>
References: <wxyjcpushnvpdrv42dijurk76oh3qny3y4mihnopof6fnwhwik@jk4tnftk6cds>
 <20240627-miniature-hysterical-hoatzin-22461a@meerkat>
 <mw7wx2wpwefefml5g4lcfwwq3udfhok7o7iteb2vnmj56edw5w@exb6tviwiert>
 <20240628-portable-tentacled-bobcat-63dc7c@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hhwimyndxp7v7jq7"
Content-Disposition: inline
In-Reply-To: <20240628-portable-tentacled-bobcat-63dc7c@lemur>


--hhwimyndxp7v7jq7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Konstantin,

On Fri, Jun 28, 2024 at 10:37:13AM -0400, Konstantin Ryabitsev wrote:
> On Fri, Jun 28, 2024 at 12:50:17PM GMT, Uwe Kleine-K=F6nig wrote:
> > > > instead, which would IMHO greatly improve my user experience. But t=
hat
> > > > isn't easily determined using the dkim python module, so no patch h=
ere,
> > > > just a wishlist report.
> > >=20
> > > Correct, this is impossible without the following being implemented f=
irst:
> > > https://bugs.launchpad.net/dkimpy/+bug/2047054
> > >=20
> > > Unfortunately, the comment on that bug is not very encouraging.
> >=20
> > I'd not want to skip expiration check. Just want this represented in the
> > verification result. It's still an API change, but in the output, not
> > the function's input.
>=20
> With the way DKIM signatures work, there is no way to do it without the c=
hange
> I requested. The expiration is specified in the x=3D parameter of the sig=
ned
> content itself, so there is no way to check if the signature would verify=
 if
> the x=3D parameter wasn't there or was set to the current timestamp. And =
I don't
> think anyone would welcome b4 adjusting your system date to the time in t=
he
> past just to verify a DKIM signature. ;)

I thought you'd want to have the option to unconditionally ignore the x=3D
parameter, e.g.  using

	dkim.verify(message, ignore_expiry=3DTrue)

I'd say it would be better to change the return type from bool to some
enumeration such that you can distinguish between

	good
	key-not-found
	expired
	bad

But after rereading your request I see I understood it wrong and you're
indeed open about how to implement it. So full ack for your request.

Best regards
Uwe

--hhwimyndxp7v7jq7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmZ+0EQACgkQj4D7WH0S
/k4HgAf/U5xBIRlZe37h0Y3ahLs0f+8tT1nwSJ1hJB27+TpW3/oKwv9xCB+rGV89
iMhxb7pYp9nzazqU0EipfWOyiZS/1J4BGWKayWTGITrw7QG/lW+MQJ58LYJ4f928
sFsaEYMrj+6tl/1jJfy2JRIWfIFLQMme14kFRGCNmJI2O4AU98M8zwl2GIl6Uctr
sEmhNOZyw3zOVKXjNxrI/J5K6B2vSz2FxlPWbo4uD8uc0rn2I5Iw7dK95p3biv1P
EVyiaI+ojbDOVHvTS3TPiHuX8R2PpX3QZTZo4H8GbVN/aSdpyQaFu49kB+P92NXm
tmodf0gPoqO3+cZeE7kla3j94OpqSg==
=PiHr
-----END PGP SIGNATURE-----

--hhwimyndxp7v7jq7--
