Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E925E23D28C
	for <tools@linux.kernel.org>; Tue, 22 Jul 2025 10:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753179465; cv=none; b=bYa7r7V/1Xo3f7lUe9GH0mVyovHehFylAbW6boUvIAwizbMvN7I4fjA8TtfCF+q8Qvhu5uZ8PNpyM9arzp+wKit4aI27JpX/PM7EfAPyH0LNdV1p2dbZloYG4Yg9FpFBfjakHY21WIMv24IgyAzSYU50NqjFstQNFijs9RZEEN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753179465; c=relaxed/simple;
	bh=Ru6jsbBz9SM3UrvVf+BvpGlXfjSU+lyeQUI5pIejKHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jl31CWRLMMNfy3PyzVtCksnCsomLMGf4MmtLf+f++yhCSi1buX3JYSSQL+SC4oWHTwnEPRL520zreehRSFt5Q/078PNVo2ACVpcMji7coGPONk1uuv/0qTnBbBg6SIBsy7vld+ECx2ebGPKC65xsKuHQp78mwL6Y6cP/k2YIvsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1ueA46-0003YX-3q; Tue, 22 Jul 2025 12:17:42 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1ueA45-009htZ-2o;
	Tue, 22 Jul 2025 12:17:41 +0200
Received: from pengutronix.de (p5b1645f7.dip0.t-ipconnect.de [91.22.69.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 85173446367;
	Tue, 22 Jul 2025 10:17:41 +0000 (UTC)
Date: Tue, 22 Jul 2025 12:17:41 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: users@linux.kernel.org, tools@linux.kernel.org
Cc: pisa@fel.cvut.cz, mailhol.vincent@wanadoo.fr
Subject: Re: b4: feature idea: plausibility check for trailers
Message-ID: <20250722-adventurous-analytic-coyote-72d151-mkl@pengutronix.de>
References: <20250722-utopian-thankful-warthog-104007-mkl@pengutronix.de>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yj3scrhfvetybaei"
Content-Disposition: inline
In-Reply-To: <20250722-utopian-thankful-warthog-104007-mkl@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: tools@linux.kernel.org


--yj3scrhfvetybaei
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: b4: feature idea: plausibility check for trailers
MIME-Version: 1.0

On 22.07.2025 12:11:32, Marc Kleine-Budde wrote:
> |     + e-mail: pisa@cmp.felk.cvut.cz (=E2=9C=93 DKIM/fel.cvut.cz)
>=20
> different issue: b4 picks this up from the signature of one
> reviewer....
>=20
> |     + Link: https://patch.msgid.link/20250722035352.21807-1-luis.hernan=
dez093@gmail.com
> |   ---
> |   =E2=9C=93 Signed: DKIM/gmail.com
> | ---
> | Total patches: 1
> | ---
> | NOTE: some trailers ignored due to from/email mismatches:
> |     ! Trailer: e-mail: pisa@cmp.felk.cvut.cz
> |      Msg From: Pavel Pisa <pisa@fel.cvut.cz>
>=20
> ... but ignores it, as it doesn't match the sender's mail.

Hmmm, b4 says the trailer is ignored, but it ends up in the commit
anyways. I'm using current b4 master [1].

[1] 8018a8666975 ("Merge patch "Fix broken fallback to user.email"")

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--yj3scrhfvetybaei
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmh/ZUIACgkQDHRl3/mQ
kZyLSwf+KH4g4yQHYlY5KnVWwS/BLm8zOdNm+gINi4DNWJOFIak97djVS4PgThBg
rRbyTIVkeL+ia3CkYMLVmgHdx9T1DJMJ6D/ABzXe9cfgTlfcd8Mfd5LXpFOGY0+5
nPdqs5knPqorGos05Z9CNPABzSWo37tEP8dSnm1289TZ0nZEQPN1BP4XVOhv9i2g
mNxYptxvYzhr3gsFjK1F0BZyaS15kIj0pUC1zd+5TUZ6JIkPdzWxlvmE/PNInNX8
A/F7cPERu4RAnL/XpAvh7bUfnbX/Ems5eu90JVb+IrD0jBsfEjkEbBMkbKeDWca4
/fajWHOwSVWqhxnc5/p6VYsKEq/b9g==
=YIP+
-----END PGP SIGNATURE-----

--yj3scrhfvetybaei--
