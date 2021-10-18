Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17422C80
	for <tools@linux.kernel.org>; Mon, 18 Oct 2021 12:23:49 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1mcRgB-0000Xm-8i; Mon, 18 Oct 2021 14:23:47 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1mcRgA-0000Rp-Jl; Mon, 18 Oct 2021 14:23:46 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1mcRgA-0007bq-J1; Mon, 18 Oct 2021 14:23:46 +0200
Date: Mon, 18 Oct 2021 14:23:46 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: tools@linux.kernel.org
Cc: kernel@pengutronix.de
Subject: Re: [PATCH v2 0/2 net-next] Let spi drivers return 0 in .remove()
Message-ID: <20211018122346.ur4lyv345fbijh2o@pengutronix.de>
References: <20211015065615.2795190-1-u.kleine-koenig@pengutronix.de>
 <163455901125.7340.7337638653547301526.git-patchwork-notify@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ma5ixg3yoed55svk"
Content-Disposition: inline
In-Reply-To: <163455901125.7340.7337638653547301526.git-patchwork-notify@kernel.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: tools@linux.kernel.org


--ma5ixg3yoed55svk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

the patchwork bot did something strange, see

	https://lore.kernel.org/r/163455901125.7340.7337638653547301526.git-patchw=
ork-notify@kernel.org

=2E My email address (see To:) was somehow mangled. The resulting mail
didn't get into my inbox. (Just noticed because I also get mails sent to
kernel@pengutronix.de in a different folder.)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ma5ixg3yoed55svk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFtZ08ACgkQwfwUeK3K
7Any9Af/ZSGxiDNsHqNT8tFJ7YMi/qefgG+V1kzoSOTDwXBOJtVl4GsWX/Vg9u92
QbNr26I6ZY+/ccjDrCwS9qW3NoXIeU+7ROZn5gz1cYQeCX7yiODFXyFMU823oNWk
MpHTvkVWycjOiEcO3vG0Kh1X1Nv+jydPCyQDblw2U2mZAL6oirENw+8WiYOmG5FS
AD6J6/9PgKzxuLsN48R+oV7D2fggyAzsEvCRFIO8210XDQULK1X0LJ+zBp0DE186
UUSS0DrDfnWgxdJHCqBN1XeHwPy1x87pT5ZU5+wmXeLG/iTLqUFCng8dFGLZQoVc
KDifMc50LIOv8G9barDkI3dALjLycQ==
=P5b8
-----END PGP SIGNATURE-----

--ma5ixg3yoed55svk--
