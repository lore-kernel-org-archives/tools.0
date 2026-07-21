Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2BF39021C
	for <tools@linux.kernel.org>; Tue, 21 Jul 2026 14:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784643608; cv=none; b=KCI+OVbmM3s0HSAOQL7cp2kFMyyXpY8WUvteeqLCOFWT8SHHprbG9cW5vQscEdRNhHWuLuQ/5e9FoaoGV45kBDrDBImlhPOtc3x5tlH4tEd/EfGw+vNsikVpzUcI3F7qxmaribasnysxhBC6A85NCxxh8jG+y/Z4QaIo4os22iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784643608; c=relaxed/simple;
	bh=eR4loKjNrBvcsj5a93iG/PRB1lR4qbrIWwiDxqyb2e4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Go6ikwA4N+LLLQX63HhncIJehpTY1R6IlFyruVHwSPrGlJ1mUKlPcIvEN+5458oI50rOI+Es3RY+tUkMQtQl8PzVXPCkPS8QQtnD4TjTcX5owOr48M9YvrmEK6Zjt4NkGOMHMfX/Hk3d6LHDqw79ueS9FP8T0IrPnJi7YXhOf+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YmAmkMOK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YmAmkMOK"
Received: by smtp.kernel.org (Postfix)
	id B35771F00A3A; Tue, 21 Jul 2026 14:20:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDC2C1F000E9;
	Tue, 21 Jul 2026 14:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784643607;
	bh=ra5nx6+7ZYbdSXnEJK77X9B1ueIa8lmwsbYrFz/yGKg=;
	h=Date:From:To:Cc:Subject;
	b=YmAmkMOKfxhZ/vPWj2S9okNiw0JSlUVFaODRktH0FDJNzCwOgYObmvR5MqRxM2bYK
	 TiYOamZwpYktxIw2+c+p9dmwIacogPh7kVJaqOr9+66Y+CdUmE4c4i7TpaFH67PGJc
	 bKpsjIt9hP0mIuSHuTNpb7raKeBdHTM8QI/0t2+yRpR/TvPIv5SCBdqS2R0G9twmE8
	 4FQykVJpY6myxXaWqZ9rOJGmmSss+YMDH5l5CckgVcu0+0fFJMmFkPcyyzjUcaTa3A
	 mf19tSZQbtq4CcDKkjxZXTKaha2hNMUNBR+CHpppxbicy6XywObkEx0SlW7+udRyDf
	 mQVRqAFrOCTYA==
Date: Tue, 21 Jul 2026 15:20:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: b4 review uses the title of the first patch of the series
Message-ID: <7b03c035-202e-4eee-8029-a257d7f83705@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="x7fTeo2jZNnzVRxA"
Content-Disposition: inline
X-Cookie: Love America -- or give it back.


--x7fTeo2jZNnzVRxA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Konstantin,

Recently it seems that b4 review tui has taken to using the title of the
first patch of a series in the list UI rather than the title of the
cover letter, for example this is happening with:

   https://patch.msgid.link/87pl0hjg4g.wl-kuninori.morimoto.gx@renesas.com

This is confusing and makes looking up a series harder than it should
be.

Thanks,
Mark

--x7fTeo2jZNnzVRxA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpfgBMACgkQJNaLcl1U
h9Dvegf+LPK644n8T5VtB1Kvs8D++kIOlQmsQIQH8yNC2ZJx+mOlW6JRZcv3DHl1
SVJXKBQKJTL0P5A4FWr6bN7v5HfLua4AomlchL/v+ZqjG9mzg3s72iBNGVc3R0Eq
/fgRsiOUESwUnQJpkEVVqjkMFUKv2fGxT80zB0gj9Sv/6dqCapLnbCiHf3DKuNQb
9Zea1/RgbEJRKA+Wy+KPjIdCtiGT7a6+haXqKwA5t2McWOkw/fBUs/jfP1o9sHDo
17EUxiCZ9FWnWEP1PiKE8U8ngh0+onLTGfbHBjRaQ+f4oKn9sJbWsOzBVVLcR4Lb
uGHgIhMcA5C6p24THKZDacs4SzZk3Q==
=bT3D
-----END PGP SIGNATURE-----

--x7fTeo2jZNnzVRxA--
