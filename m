Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BABD3D8E
	for <tools@linux.kernel.org>; Fri, 28 Apr 2023 18:32:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7798EC433D2;
	Fri, 28 Apr 2023 18:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682706730;
	bh=eJF+PUoQDMycj25ry3uMsB3PwOacEP7IK+wHUtK/eAE=;
	h=Date:From:To:Cc:Subject:From;
	b=psK893u96z1oi+5SYq2eZRSvP+NKiZM6p2JNyeLNjqbv42K4IelKTwt1cIY/cXyPc
	 X/o4l2Ghh/LABoyhWm3BSWuDqLaS3+nyFcJ5/aAAvHVLVSYtRpJrUps3hZ0lWWIYaT
	 grdAI11ZA2Rh4gnWFgpunzvG8czgaLHTOZ1UOUQyy6Jl/Lm5NyZlFavTsopwTeqaBs
	 hWXZNUO1iPegMj/f/grkEIvuxM5UTAzXhVVp5EzSUI7Fv9s29i5DPJ7ZCSdEyhwUv5
	 TaQmlXuYnpV9ZIVxTNvuvK22rfJiXMOnEBxQQRjBrV19EF1SdB+DSlcZ36Ts90VIam
	 kuBy//AJT9xLA==
Date: Fri, 28 Apr 2023 19:32:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools <tools@linux.kernel.org>
Subject: Unhelpful cover letter default for single patch serieses
Message-ID: <ZEwRJqjvbZGqpZpg@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i1kbabqZoEn419wj"
Content-Disposition: inline
X-Cookie: Love means nothing to a tennis player.


--i1kbabqZoEn419wj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

When creating single patch serieses I repeately get tripped up by the
default cover letter behaviour with EDITME.  I run

	b4 prep <make a new branch>
	<make kernel do thing>
	b4 prep --auto-to-cc

see that --auto-to-cc did what I wanted then run my CI only to have b4
send fail afterwards due to the EDITMEs left in the cover letter which I
never saw since I don't want a cover for a single patch series and
--auto-to-cc did the right thing.

Perhaps this could be addressed by both changing the default cover
letter to not include the EDITMEs and switching the sense of the check
so that b4 send requires some magic string in the cover letter to send a
blank cover letter for a multi-patch series (NOCOVER or something)?
That'd mean that people would get no cover letter for single patch
serieses without any friction but still refuse to send a multi-patch
series without a cover letter unless the user actively intervenes.

Thanks,
Mark

--i1kbabqZoEn419wj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRMESUACgkQJNaLcl1U
h9CgSQf+OLMBp7tGLpkr7A8DHQvNWFRQn46fN7NIWKRNUbe06Y8O8q8rRLSDZYVz
r66+G4Yk1rrN7SMFsYT7MvPy3U5w5HfvycyE8HE/AtMf3pDOnfiixakOBM2ZH/LO
hSjevJWnvcFPNJDJzRC16ITykRxmWsgXkCax5ZjkWvnsRyiG40TVfJqaIXu0dWMa
i2MhQGj+nsUJ2jA6BkRA95+YL532Dfir6i8FdNVYwaHgunYvYmyuvA7+CUg98DtY
J2UBU3RFMBh7oe29rPDsbtc1gGnJzE+hPKAtjFD6mtaR3rzPBd8Xp+/chXgcZTf5
M0xfhZqKeojeJyhsBh7fF2QOHh7m8Q==
=0uiG
-----END PGP SIGNATURE-----

--i1kbabqZoEn419wj--
