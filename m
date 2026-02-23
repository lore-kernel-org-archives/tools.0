Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54365346A1F
	for <tools@linux.kernel.org>; Mon, 23 Feb 2026 09:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771837524; cv=none; b=UHfVyDKie0EepExue26RzmkIT9im7ej8G5STH0eAxarwz7CBYEEWd4C1xkcGfxe4dwKkFFlfZknoiBQUNAIbofclvE/NjusJ+xt7JDILMTqHqAxNVlEZq2px04ddJtcgNGUw5aVk7QGLek+ZhgTM1DzNQvvbLrmOXOP5erNKNEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771837524; c=relaxed/simple;
	bh=lsnbBSxEJWByp0HuNU8Eca/+Le1DE9Q+kWl4y/NbLaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xct8eG8G0gGJSODM4F0U9uSMsPLjzt71n9Zqqb0A/8QPisXm83rk7UGbLMVwchzW8CUvjN7y+y3XbxmHVMGTV8QiTRa0VsxvSG3irpB6dkUATEMExwg79hCEBxyZjGNvBGSgJfV1QwN6q+AIsLDkEr2LxnbzqfBWSguYH9xzUh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ztBZxDFZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ztBZxDFZ"
Received: by smtp.kernel.org (Postfix)
	id 4897AC2BCAF; Mon, 23 Feb 2026 09:05:24 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8C702C116C6
	for <tools@kernel.org>; Mon, 23 Feb 2026 09:05:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8C702C116C6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4359249bbacso2972197f8f.0
        for <tools@kernel.org>; Mon, 23 Feb 2026 01:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771837520; x=1772442320; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qzwCD3vKrcpea/9+JwxhncX4adwgtSojI6QTgnJhl7Q=;
        b=ztBZxDFZ90tkrBzTZnnz3kJR2jI9s2tDV5BDAXfmbq48zdnjbt+VVvYFBMRlV7rXDw
         H46MyPBWrJYJz5hd+fUAP1AFa4eAPw/NAPK0LOSJDAey8MgouFaeidWaVsSwnISou/VG
         1zFNdVpZK1srdv0L6oWrYWpV58c0OZTM1aJ0lQv9cozv4YEM2jnV0B5jHhqkjf0C7c2Y
         yG9ftNxKEHciZ5kT0yM/FvaID+1Mda62Rl1JoXmUqfXpj3KpRS5oeHml2v0cbVqc2Xiz
         aKmtCVqbks9RzCzo27DgZwMeNJInCPIoIyEarUEggr5YXRcbnjAcRapv8HSLCGSBmKCp
         Pygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837520; x=1772442320;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qzwCD3vKrcpea/9+JwxhncX4adwgtSojI6QTgnJhl7Q=;
        b=q7YgtkpW3Hw0s1LINyLTzLDpTTBBUPC51cej3fwIQ1YqthHBNyykmt72BH4AhfXi9u
         pcUuS8wihZNI/p5l5iZe3AxjEQsw3npqecHQQdgEogk0G8cSpxKhrh/9a7uGy7F2Npoo
         3ja3imxPu6XhTW3OLjhdp7qHM9KCwzE2arCWQDpL2PSjJ8dS0c0qTCIZMmKOhWplWp8X
         2V9X5vv79NijrH25DMTv4NDDU/5qGcNXklanzlv6EXOW+nHW7JS5tiBfwJibFLBZWBD4
         fbk+DUiCvCGY3U9TEEKZbLMqoiFw36VJhQc1LY5j5Vuxn4UPzFb9PwURYqXiJLhcau2L
         87cg==
X-Gm-Message-State: AOJu0Ywo/nWNATTsbpJnlLkpYC15k710TvrTbYESqCPtuc6HhO5kdKXU
	Qqr7wJ6OgX1pwFre1H6stwfB5LKQDvkzmJ8yo0VnEqOs/lF7BDOEVUvfuPXvN8urHWRmnSmx8Eu
	6+3ao
X-Gm-Gg: ATEYQzxX24+HECnkwuDQqDU1aT4r7+ONkLCZL0m+cnk1soZ9iFImiStVEn0L+7GEDsA
	hJdg1ZNL4ujFghi8+ysQHU8DsZcyTTFMURvTQn2c4PvBvJxVHCyzGmdSaMrYv2wdWvECPc9eju6
	S73sZz2XHCyRMzrY3SlozuEVIXiE61So2GJroKxqREiVrUcs2u2566yzkj/ih+PK/m5IFrQNqFx
	g5/Qfcb54GYu2NtzYPG459R1wN3BlXzhB/0tDpHlBIuMQSIWtmdOIL2wTUIQUziA06G4UeLCnM1
	rI/PHaIU8teyU54oP0jlGVmZp1poH1PvQeEr73t/HdtQmI43/d5cs8jAh6MX/+GjPT9OCVgkbar
	p8phubMI4BjnuTIW9Cr13Ym022PuBjhAX9QwhcF3P0PF+rhgrgy8S2YdOb3pJqHJIQI3BRP3hnj
	u9K5YiOM+ZhCUnULVE3TEWW+N7FMepq/962WLHwVco5YZ/1j07ot39j2IbzbMdzgp9yX84VnzRt
	0riWUqBusqtOgZ4oBCoQcbgyw==
X-Received: by 2002:a05:6000:2085:b0:437:7300:eb1c with SMTP id ffacd0b85a97d-439627378b8mr23640797f8f.26.1771837519660;
        Mon, 23 Feb 2026 01:05:19 -0800 (PST)
Received: from localhost (p200300f65f20eb04755e38c5f598f37f.dip0.t-ipconnect.de. [2003:f6:5f20:eb04:755e:38c5:f598:f37f])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-43970d4c626sm19625585f8f.28.2026.02.23.01.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:05:19 -0800 (PST)
Date: Mon, 23 Feb 2026 10:05:17 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: [PATCH wotmate] gpg_run_command: Set output charset to utf-8
Message-ID: <aZwXsdZhZsEoXjq1@monoceros>
References: <20260129100727.950475-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ltnhadrw3ym5b4qw"
Content-Disposition: inline
In-Reply-To: <20260129100727.950475-2-u.kleine-koenig@baylibre.com>


--ltnhadrw3ym5b4qw
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH wotmate] gpg_run_command: Set output charset to utf-8
MIME-Version: 1.0

Hello Konstantin,

On Thu, Jan 29, 2026 at 11:07:22AM +0100, Uwe Kleine-K=F6nig wrote:
> It's 2026 and still the certificate info in the kernel pgpkeys repo is
> encoded in latin1. This happens as the call to gpg happens with an
> (nearly) empty environment that doesn't contain locale information and
> GnuPG defaults to latin1 (aka iso8859-1) in this case.
>=20
> This creates difficulties to send patches to these files by mail as
> these are usually transported in UTF-8 and patatt only supports UTF-8
> files.
>=20
> So instruct gpg to output the data in UTF-8.
>=20
> Note that the graph files (both txt and svg) already use UTF-8.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

gentle ping.

> ---
> if this patch is accepted, I suggest to regenerate all the headers in
> the pgpkeys repo in a single commit to not have different encodings for
> different files in the keys/ directory.
>=20
> Tell me if you want a PR for that as regenerating just the headers
> requires some changes wotmate.

I created a commit fixing the charset on

	https://git.kernel.org/pub/scm/docs/kernel/pgpkeys.git master

for you to compare.

Best regards
Uwe


--ltnhadrw3ym5b4qw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmmcGEoACgkQj4D7WH0S
/k5sLAf+OgKNb8Zw+3OvbvquTEMHbxfH6uHALU9+k8kL4CMYtvMMMg+i3s5PcRYa
voJRzgfaQ7dkAtxxeFgIWNM5A7zhd/grJ+4Rj/4IE8TjZTgw2fhFGgDJMvTdijub
cAv9F2DQ5EfcXO3NCAH9ycFDsJZSTOEvFNDh4L0U+qNnZDBHX75wEW0T/BwLTM6R
5/JhRkOXsIv1HDaig5bJJJO+eJbzsoo1EgrOlqCHqqwJ4QMjzXTD4bI+hPx6v3gB
8a9HBR2FOBa7r4qsgknPb+8rXJRGJnmPkh1/V2E5LcMIKUEDsYXwo+UrECtc3ypl
Ati1ermq0MpO8Ryz98JS5j+IzxIk4w==
=rOYY
-----END PGP SIGNATURE-----

--ltnhadrw3ym5b4qw--
