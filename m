Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A2672
	for <tools@linux.kernel.org>; Mon, 19 Jul 2021 21:35:46 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1m5avL-0004Sv-KO; Mon, 19 Jul 2021 23:35:39 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1m5avL-0002Ax-02; Mon, 19 Jul 2021 23:35:39 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1m5avK-0000f4-SP; Mon, 19 Jul 2021 23:35:38 +0200
Date: Mon, 19 Jul 2021 23:35:35 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: tools@linux.kernel.org
Cc: Marek Vasut <marex@denx.de>, Stefan Roese <sr@denx.de>,
	Mark Brown <broonie@kernel.org>
Subject: b4 picks up Phone: "header" from after the "-- " separator
Message-ID: <20210719213535.vw3u4yg5mgxqysaf@pengutronix.de>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6vlh5r7vyawhocdn"
Content-Disposition: inline
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: tools@linux.kernel.org


--6vlh5r7vyawhocdn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

I just noticed that=20

	b4 am 20210718211143.143557-1-marex@denx.de
	git am ./20210718_marex_spi_imx_mx51_ecspi_fix_low_speed_configreg_delay_c=
alculation.mbx

adds the following line in the s-o-b area:

	Phone: (+49)-8142-66989-56 Email: marex@denx.de

=2E This originates from Marek's reply that can be found at
https://lore.kernel.org/linux-spi/17bf62a4-af57-1706-f20a-35f9d6cbf9d0@denx=
=2Ede/
=2E

The same already happend here:
https://git.kernel.org/linus/ce91c6220947e4efa0db564cc50baa0151d8872b

I think it would be sensible to not pick up anything from after the "-- "
separator.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--6vlh5r7vyawhocdn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmD18CQACgkQwfwUeK3K
7AmIsQf+PY0DxAlAy2ftxF77Rk1gqCif6hcNz80h+ojuboEJrmQQitR7f//Mz1uL
HAmnEW1U5Y9io6RhYjVedJECnQnDZQn55XAgiEMpA96iWt9xikKP9AzNCFfi66me
+jwp+biyUDO9C6CKFEVt8bmEXUbdQV5KM6iNqZXXG1yneMzj0l/RmObJ4fIWW7kP
OmKp5sawBpDm+vVtC1b+xk7XpsI7nuQ7k4+knhudRPWH22yzLLjQT62zBSK7LDdv
X3GU53uAd/7xL6/jxmuPPg4RZXqI3CaUC8OQ89k3toi5rmaX8OPhsS+8WuHxRruS
Mz8SdaqZ0FXl8UAdsvqwLuzf9DtOiQ==
=b1Vg
-----END PGP SIGNATURE-----

--6vlh5r7vyawhocdn--
