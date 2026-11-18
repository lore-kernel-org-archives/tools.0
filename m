Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795022943;
	b=F7e/+1FRh62zRbQSbP51sq/876JsS+s2VxnbyMZqNHOrtKYpXoGqksLQaeGj3xwLBLMr
	 OpEYJ6K7Z48lW3/670GDRNf3fQP5ZjOhnGZ9w2TYd7xNy2NIcrm5gUtwcoh36/G70XFUV
	 yoYIaC3i3Z/L062tVxhukAaZyRZ2TDOghIcU3jKZ08CNLtco4Aq8Za2eJtp6A4CB71BAD
	 fKczuiB31M/yQJZlaHUTufJkaRzFTi2oHFqIij0Z3+zOQuxQuCa4b+Pcpj77Sa+r7ra+q
	 BMc4vNWwJmo+YmF2s/rN86RnqOLp56Eq+QI/g0OqsLppGc5yWAa+y3B4CegMlggzHfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795022943;
	h=Received:Delivered-To:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 X-Cookie;
	bh=e4arseR0dhm3l/jirV7gNrKQfPS9iEJil0YxUrxhy5I=;
	b=auoGZ8s8thIU9Ykz/vLgGXtQs9rjtvFYWRcWJfWqlS8uOzUhLuE0/DgGGcGMD3k7Y6R/
	 MLUs9tizyPsKoTSr6zTMhCikOMqEAasOEjhfIz3eVXIUqeW3bc9oUCUOju9w5+60zPz7s
	 Kp8lCpTa1ptnqov438Kp/WA6eMVgc1Eufn0r2i1T7u4G4lALQnd3UXnCTK9mXwRN8AwQq
	 9Iz1Hly93WHjBM4sQL4M7odbn3oO20QFzSKH67SjQBHA/EZPZwGF68KBF/6FeRuEus7kL
	 WKJtAvRz8v9SZHxy2ybl60eWgFiwDmBDUyCIyjn/LpMbixDrDYmnsVf8LmAc9sVC/uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Nd/stInq";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1CA606B3D2
	for <tools@linux.kernel.org>; Wed, 18 Nov 2026 17:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nd/stInq
Received: by smtp.kernel.org (Postfix)
	id B84691F000C9; Wed, 18 Nov 2026 17:29:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 618BC1F000C5;
	Wed, 18 Nov 2026 17:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795022943;
	bh=e4arseR0dhm3l/jirV7gNrKQfPS9iEJil0YxUrxhy5I=;
	h=Date:From:To:Cc:Subject;
	b=Nd/stInqF5wi/kgMCuoEKczYChAnjO8tNvdNCJEKND3TRMyGmzQyj1rDGrEuYtClB
	 DZPkgIsQdwwdTdl1yxCX3fEnjn2ufqIuUBsVsdrzwLt7DcLeUQTjpAcbSeNGCK4jN/
	 2PCSuRHl7FCAKTLwmMkQRHvTwogvTjiN5gQSj13wHLtt4spML6B4yha7o8x+fKREPH
	 AKAhaZAx1KJe1RNjXahxbOcZQLbF6/FgkttnDD65w/eIqWIZykIJC0KLRh0sQSVQhk
	 hGWI9L5v7/obzc0ImSDgSF5if61S6EGvq2gYTaIux0qSF47G+VehhOFU9z4djp7qob
	 EFMsHBYs9988w==
Date: Wed, 18 Nov 2026 17:28:59 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: b4 review - limit listing by date
Message-ID: <dcdc65b2-58ec-4a69-baf3-02837d6d9229@sirena.org.uk>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1ZuLmoHjsg6njCge"
Content-Disposition: inline
X-Cookie: When in doubt, follow your heart.


--1ZuLmoHjsg6njCge
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

It would be useful to have the limit command in the series list in the
TUI able to restrict by date.  For example, if you snooze a bunch of
serieses to give other people time to look at them then when they wake
up there's currently no easy way to list the serieses.  Especially if
you've got a couple of hundred serieses tracked then a lot of actions
will move your cursor quite some way away from the newly woken serieses
you're trying to handle makng it hard to keep track of your place.

Thanks,
Mark

--1ZuLmoHjsg6njCge
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr94FoACgkQJNaLcl1U
h9BoGwf46ycXuNSlRmdN+779zm6B1649sWhZdEOAVYjCiHBXFXE5qmDM6KOE8pCD
WdUHZbpXMudkD4xhGdT+2FR6j9jGoU30k/lpm9kmwHkVRAixjuMJ4pVWx71zaPlj
SOXjsFlMeJXx3PZAcF/DdeUt9ysTpjSzuyaq0fbVdE++DcCPygzMi/41kZEe8m+z
DdW/1aMrgN3/1knsKkvlKLkWDjxO8YQG7Z4/H0v/GKqvU/srcJ5rhyyE9Tw7FD2p
Z5TQ/cr4W69/4iMRy8a1lYksawSSWFdcwpGN4W4pR7vWG0ROqjlkxezyJE9hdpa/
wwCemui1qiPJ5HFbYj2h0EquHkpG
=yXjV
-----END PGP SIGNATURE-----

--1ZuLmoHjsg6njCge--
