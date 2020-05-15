Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web12.19667.1589566761900813020
 for <tools@linux.kernel.org>;
 Fri, 15 May 2020 11:19:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=heLv1PcC;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: broonie@kernel.org)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id C926B206D8;
	Fri, 15 May 2020 18:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589566761;
	bh=zqq9Led4nyUcCg3mmUyW+RoNc1TUEubr4eyKPM8AxlQ=;
	h=Date:From:To:Cc:Subject:From;
	b=heLv1PcCb/bKwYygWKSLTktg7H538GHaYvIOaVHD/XW0FOocvc21tNj98xm9Xbuqq
	 mInyKqJIAw3wPbYcdnI6uWgOKaMwtef0I2Zy33c4/iy6FdIuHY4k2+XXtA0uduog10
	 rDWddSiuBW9MaXIUVaDdxOySsF46im+B1Gc/yIZA=
Date: Fri, 15 May 2020 19:19:18 +0100
From: "Mark Brown" <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: b4 ty not remembering fetched patches
Message-ID: <20200515181918.GO5066@sirena.org.uk>
MIME-Version: 1.0
X-Cookie: Avoid contact with eyes.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Groupsio-MsgNum: 160
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KM+e2hnYAO+MCJ5e"
Content-Disposition: inline

--KM+e2hnYAO+MCJ5e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Konstantin,

When I run=20

	b4 am -t 20200515104758.6934-1-Sergey.Semin@baikalelectronics.ru

a mailbox is generated (incomplete due to issues with vger spam
filtering) but the fetched patches are not recorded in the b4 ty
database (as showing by b4 ty -l).  This happens even if only patches
that are present on the list are requested on the command line.

Thanks,
Mark

--KM+e2hnYAO+MCJ5e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6+3SUACgkQJNaLcl1U
h9BTRAf+MUJawbp9JrDIu6emdPcd9a3N3gRImU1DQMD6/rWA2cUA3qsfsPTuPw1R
4wkgGBAEXovdWfpeQLPHQ9WOH+w2Df1zMtcpbD3pbKp1/Ssua1g2C3fpR35Tg/+q
OtevaC8Clx5yScm3oc/MPM+mvimnUa9zA83H7DjhBx310PanRhhl/CBIkVDVDKjl
qkIqjLyd7CmLgFmDMPkwlge1jnSEfIosz4AWPaHtQvSvvCAQF66rjZzVHkDj6Q/y
wFmt3zcEa3KaJNkS0qQNk1FPOldDtE7z8XCwmg2AbkMMFivh60lLXZf+4oY0SkN3
TvUc1JWnPxhjXDtJedvbjpQHDVQXyA==
=4fPi
-----END PGP SIGNATURE-----

--KM+e2hnYAO+MCJ5e--
