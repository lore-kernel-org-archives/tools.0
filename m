Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=3; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794692031;
	b=J7QMLjIvoyemgRoLE7DVcL2EZIQqy/F9hWNNQju5dkDxjfwtdyuFrJXhYhCamZAWPbt6
	 tRpwrjVBgLq1vBRbnM8TifJH2gKXKKFAzWK45L9y9L6iM9ja/Jq4GnDZ0+DAUeuyPYQ6Z
	 XVT1z50r7FrV2YzLRLklk9ZOFQkfnqe/ZknMKnYntxoBCQL55FGCVG3yS2MdIbYPD/IC8
	 +h8OmziyJgzHYAJ3Kw0UydEnC1W9zd0F8r9xX5L5XpkyymadYT49KtfF3Z1gOYzTRiGXK
	 z/NdAI59DHOdoCYRErUDy266eC6e3k3JTqoqUpW9lpQW4BJE5t6ohja6gf0F2S4wGag==
ARC-Message-Signature: i=3; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794692031;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:DKIM-Signature:
	 Received:Received:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
	 Content-Type:Content-Disposition;
	bh=GK0iipRd6v1mj8e0nB9Jyu8LoAfqE5IQglpcl+2bDDU=;
	b=u0G9m+rh8xtyWF/uP3mx+Gm0W4+GNBkaiS6BdomU2N2b6PZvG+3FT1oiyySb9o8PFudu
	 e6e/c2fyQL6FkbDE+EineA1YkV9vm/xZo15c6nK3YKTxKgQwQa1zKtyjqELlgME6/JPXO
	 rhueQ7D9dYsbSkEX9FVkldkIXPkXOGcLgtCbFSbahoE7j/gNEfFUYDcYqzgvzD5SJtwsp
	 Q1pVoDj3wbhx7QibiT8rFNP833hVVDuDbPhX7oAK6lvnu5nTN8Y24947lSYNRjEwr85jH
	 Y25tKyxQlxDjCkiR9zlA5c+rIKwAfgtu6ePXar4EhbosijceDfYQnyF6p197SU0147A==
ARC-Authentication-Results: i=3; smtp.subspace.kernel.org; 
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Ekyc6hHa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A45606A323
	for <tools@linux.kernel.org>; Sat, 14 Nov 2026 21:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Ekyc6hHa
Received: by smtp.kernel.org (Postfix)
	id 947501F000C5; Sat, 14 Nov 2026 21:33:51 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1794692031;
	b=f2vhyl0p7HNfGX4gBOQQqDBfKvOjDNHFfeh0sz49X+P+X1/YvdKh69gc2B4iugxNr5EH
	 /iiBx+rOXm6uj3yTRmrvaTmixdFMjtvdOqwfk4fSgOJdluoLPkzWsK1TpfEP2Uxksn6Fk
	 hydQBqY50S1Mr0aJJ/47z9TNGbr/dAnVN3a9P8qeGBMK04uFGXZp/tlU3VBbzWOFWz7U1
	 bSVRvU8ekM6ykbSHcwuydzNsJVmJOdyu46csBdldKWUGxJLbYY9bkQ8CbUByAZnPfzoj+
	 SJeP0svBNk59VkjVkHGPwNdCIt+02YVjg3HyXyu7goavcGdivFmpMcph4SPKHaCp2fA==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794692031;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=GK0iipRd6v1mj8e0nB9Jyu8LoAfqE5IQglpcl+2bDDU=;
	b=MrVcBm1fVoSwhgYy3Cj/bKfeHMOzOrR+RpIpSV9aJAxmxRIZEH0N9dlYeZpY2RKzzsGr
	 xqPpEw+nbfF8baasmqK0QbMzAz83+KYflUwftD7nZxtAVJpg2xo5TxiH9Ul680bD6nDo8
	 c8qSRkH9dGNIXuFvmTS0dHoWCwohnGN4jAA4zM5ktaMXmGUYx2eJQF2AKvX1fGfrLSQnc
	 aU55MFGeArpdDY606tXs5xL+aHC6nJaoob79Pblhy+IYeCt8rXnl340y6W5tm790rMgzn
	 oxej+D6IUnX+8cw07PyUOGG6Uccxzcf44OrAZFJ0SLFWnlKa5BgeZPbuD3PuqvpahaQ==
ARC-Authentication-Results: i=2; smtp.kernel.org; 
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Ekyc6hHa;
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0E8801F000C4;
	Sat, 14 Nov 2026 21:33:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Ekyc6hHa
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 0E8801F000C4
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 286E6201E6B;
	Sat, 14 Nov 2026 22:33:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794692028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=GK0iipRd6v1mj8e0nB9Jyu8LoAfqE5IQglpcl+2bDDU=;
	b=Ekyc6hHau0rFyEVJJXaAnW2Vtyj++gOZqlSAb2OiM68forKK/uxlPi3Ff60KngnRUZdTGZ
	EhYc0hAzHHQbUdQgKpivrSwJoUuNSo9G2u9dK+TRFadLEpstgvLR7qbLRhn2is6OSKkfjv
	eKwT+A1221+yrtBp+cOjeoisOsHzawwTZ3wv3lHYx3VvPXZ5O4jdBL0ZPNNfA+2tuWfkks
	Fe02hBwWO7OqCIxeJkZ6snOPPEmOnQsuxTsOLYWCGHbWziP0nzPYuOJra8r94zlCVO0tCR
	dPHNbdVIGd2iEnAc6jZ69n7PSoEcgIxM8+dYGzApb8Xw+xrxeyd3x4Tta23s9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794692028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=GK0iipRd6v1mj8e0nB9Jyu8LoAfqE5IQglpcl+2bDDU=;
	b=d+cV2HD4SYyChXPFnoHfysVRpkyoS8YPZl3rQahJKIfksCIb/0iqzZpywjp44wVpW1Ctbi
	CQZuTJZcj3dNlOg9XtqoXszisE/Q2KmkYGiQpBmZUODEj1mz+nWePN+x7NXvBqpeulN6xo
	oqH5Y6D5MVEoG6LLgNRIiSDHVYiMcOOMT/cuf3Lz5KiMzualgRbhC5Fmtxth+NLRvX/bx6
	eBm2TxVwzfm31Gvbm57AyUmNeBThgl0vYNh2v6gWjlc+h/gyKNK4nqzvdhWlLsnjR0byMS
	cO+lIhTIpldY26H2K/UuYS4nJumE+c2SM0YexgL34ekO7A2F7vDaqfFX/52zzw==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794692028; a=rsa-sha256;
	cv=none;
	b=g7oGRWFcK+BoGg6Mx40btYe++a8xpypyrb9SWzUG4bJyXGNMj7JAad3NasLYYK8nhokD63
	ncNiEynIRsrkhHvb9DRiKF4ler222nFAaaAVSGv2r71GwKBAT4bPLnv2ar4jdG0FA0UFwp
	jDp6fQZIiptkov3kNyxUBBUh85vQF0wMEoRYa1QSaBnak9W5tku4LY28MlC2ZPnazsR33e
	p6S24hkyap2IcViEuqYgpLieCZ8o1XAmhREpnGbXI87Yk971TqJLZorwxROPCvbwn0M0t3
	saX0SbmAMRWNlUev7MzlLQpLp1ACQWlP42XOgRIAb+4d/ntlPDw3oBQHoeXjRQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=mkl@pengutronix.de
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1xSLNc-004Bwk-08;
	Sat, 14 Nov 2026 22:33:48 +0100
Received: from pengutronix.de (p4ffb23c7.dip0.t-ipconnect.de [79.251.35.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 633365EBDC6;
	Sat, 14 Nov 2026 21:33:47 +0000 (UTC)
Date: Sat, 14 Nov 2026 22:33:47 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: mricon@kernel.org
Cc: tools@kernel.org, users@kernel.org
Subject: b4: include git notes [feature request]
Message-ID: <20261114-rapid-diamond-skylark-6d6cc6-mkl@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="gp6ha6rqzdtdcm6r"
Content-Disposition: inline


--gp6ha6rqzdtdcm6r
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: b4: include git notes [feature request]
MIME-Version: 1.0

Hello Konstantin,

I'm using git notes to track additional information for some patches.
Sometimes a FAQ section for our AI overlords^w review bots, sometimes a
note why checkpatch currently creates a false positive and a link to the
discussion, etc....

When sending patches I want to have that information after my S-o-b, the
'---' and before the diffstat. After adding

| [format]
| 	notes =3D refs/notes/commits

to my .gitconfig, plain "git-format patch", does what it should.
But "b4 send" doesn't. Is there a config option I missed?

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--gp6ha6rqzdtdcm6r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCavjTuAAKCRDMOmT6rpmt
0vHwAP9TTEOeKYFQJTIDPi7du1pRrZFcdXbBOK4wufOndW/nrQEA0P11cmE4m8FY
u168R5ubi0w8gWxA1OBzirj8gB5V0wE=
=6eJY
-----END PGP SIGNATURE-----

--gp6ha6rqzdtdcm6r--
