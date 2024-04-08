Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B91D143C57
	for <tools@linux.kernel.org>; Mon,  8 Apr 2024 18:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712602130; cv=none; b=SE2VEjALF6r2VnZhCDeI5gF4kMLdrGOgW9BCPwcTvBt7st059V+huk8VZO71nhDGW4lr5dbmIZ54wR+8rb5ziTguJdvVez9Tat0OpYLitTowlQGQANcvAL87kGnmPZS/mjeoD2GpfJNaVKiPz89/fTIf3ikaQLp3WXIpjypC1ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712602130; c=relaxed/simple;
	bh=/c1ZftEVaTkP0yWRFZ7Nwx3e7fhccU17lEr4T/XByc4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LDmyF8koKTBP1HKRumQKbJr9V9W0tRzB4IFGBRCczioHdXLE8jvTXVb2R7Zb6LQ0PHY+2ekIUCrvdUY+EN6wNTWbfyqij3Ax7C+lU9S8WSqib9f6EudMNu4vif+0/ZRdFeKxqY7Zf+EyMpDu8Tfbm8VbBqClpCeArUufE+JwQRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ing7vgOI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ing7vgOI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CF1BC433F1;
	Mon,  8 Apr 2024 18:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712602130;
	bh=/c1ZftEVaTkP0yWRFZ7Nwx3e7fhccU17lEr4T/XByc4=;
	h=Date:From:To:Cc:Subject:From;
	b=Ing7vgOILxfvM4MrBo20DLQlFgcHwC+AqXH/O3BYpdfxzN9vXEvDeumXsK23PYpCo
	 g+TZSUZ/1F+P9mcYZoqqQR62jlXScQ/31qKbjhDtlSvGfUC+eHzYITzGdx2hkXr3/U
	 +C3mgkgFIzm4gYdTZHB/M3rw7WuovdJt5TXG2T/7ToL3SsHBvkc4RElTyHTC6IEhs4
	 TOYFsV0SBFrnGhW8cOImMpuJmj0fGPpd/pr3kXG/tIODBi8dNKm3UhQIiF0KmNp1zK
	 f7yFwm73dk/+Mx4Vp5c418VSBd4SxiYt0T1Z7uyHAQvhz6BKgnwwndUzESLozDJfbJ
	 Auw93I3TT6QdA==
Date: Mon, 8 Apr 2024 19:48:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Checks for recipients
Message-ID: <ZhQ8DoS1GaT0603l@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="B/Vy1ODv77Ne6ZgB"
Content-Disposition: inline
X-Cookie: Drive defensively.  Buy a tank.


--B/Vy1ODv77Ne6ZgB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

It would be nice for scripting if b4 had a check similar to the
needs-editing flag in show-info which would allow scripts wrapping it to
determine if there are any recipients specified for the series.

Thanks,
Mark

--B/Vy1ODv77Ne6ZgB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmYUPA0ACgkQJNaLcl1U
h9Ay8Af/ZJdW3SsNCILpfZ6cyJgw1dGRdcjW62W6UXfIeLxsVjzu4ZYsjbkUxCPE
0nIb0+uVVelVQOHXp+LJRXc9nBa3jeCAC2zCw0iNjr0l1uRRMTGRiD2ps+FH1ywy
2MiMqVDEOg1XT/5EAf5LHV/ZRaAB0mDzRBTPe4TrhNHoE+JH3p1og49XnJwmvOmu
6Xu/p9R4xtzxQ2ftW7GnN5VKECqxwNw7all0M9zIV1oSDfFTgIgZC3q0uxCA5Ki4
Df0vNwIfnwTI/I8za2oIMc06IlGfqptJIVpBkTP5kRnQMbTun6N6M96pBAfwRry8
a2eLCJXDhr/rMjZrqI5CSGUs/dp7Ig==
=ubUM
-----END PGP SIGNATURE-----

--B/Vy1ODv77Ne6ZgB--
