Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864C7224AF0
	for <tools@linux.kernel.org>; Tue, 30 Sep 2025 13:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759238674; cv=none; b=M0tCMigHhYm0Egq2hI79wfc20FsfzJLR1ZsBUSG3RLsLSE+jW01NnxY9B7tTsRpev9Jk5NEoHOLJGpAu4adABVMvJ+ZfDNwzcQmatUMryR2XsOPEZEW3+TEnSMuysm9DMGTL5scjkg9IWKCYH/9ieJVngoYLNXbrlSFntD6qOK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759238674; c=relaxed/simple;
	bh=M/0DphZB8Whv6k7L1Dd5Cz/WTUV+/3C1540nHTE9R3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L3YP7lpROlpzGppwKplw9B3X8PuNBw+uzBkMiw9ZtAO4yBeX1ELWiLCT7HPKW2dkDdHledYkcHTY7YFy3x0aGg0UWSzwU+n5CZbMudDH+J3nTMvQah1t/iC7GLSPDBUWumRXW5b8G9S7fxEQ1NZpZw40r3ib8RNzt67dZ8SH3lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 16E59C113D0; Tue, 30 Sep 2025 13:24:34 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0A31FC113CF
	for <tools@kernel.org>; Tue, 30 Sep 2025 13:24:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0A31FC113CF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1v3aLE-0002hF-Sd; Tue, 30 Sep 2025 15:24:28 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1v3aLE-001FtV-1s;
	Tue, 30 Sep 2025 15:24:28 +0200
Received: from pengutronix.de (p54b152ce.dip0.t-ipconnect.de [84.177.82.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 489E647D35D;
	Tue, 30 Sep 2025 13:24:28 +0000 (UTC)
Date: Tue, 30 Sep 2025 15:24:28 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Bugspray Bot <bugbot@kernel.org>
Cc: tools@linux.kernel.org, konstantin@linuxfoundation.org, 
	tools@kernel.org, users@linux.kernel.org, kernel@pengutronix.de
Subject: Re: b4: shazam: UnboundLocalError
Message-ID: <20250930-terrestrial-fast-chimpanzee-871459-mkl@pengutronix.de>
References: <20250930-groovy-soft-octopus-bd626a-mkl@pengutronix.de>
 <20250930-b220612c2-ecfedf4c305c@bugzilla.kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4ubtrqm6f7yuqrf6"
Content-Disposition: inline
In-Reply-To: <20250930-b220612c2-ecfedf4c305c@bugzilla.kernel.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: tools@kernel.org


--4ubtrqm6f7yuqrf6
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: b4: shazam: UnboundLocalError
MIME-Version: 1.0

On 30.09.2025 13:10:24, Bugspray Bot wrote:
> Konstantin Ryabitsev writes in commit 2354af10a8e8db91806377f8ef6ea3770e4=
3b0dc:
>=20
> fix: ensure pmsg is defined before the check
>=20
> Ensure that pmsg is set as None before we check for it to avoid a crash.
>=20
> Reported-by: Marc Kleine-Budde <mkl@pengutronix.de>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D220612
> Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
>=20
> (via https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=3D2354af10=
a8e8)

Work for me!

Tested-by: Marc Kleine-Budde <mkl@pengutronix.de>

regards,
Marc
--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--4ubtrqm6f7yuqrf6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmjb2gkACgkQDHRl3/mQ
kZzhkggAqPTwSon6EzLIzTmmeqM4nAx0W4Zn0YjCDzdmz0I+oq6H8DbOthqwLLB8
ov55PYLUkRTukXFF3tl4hdkzLdvvquIUfAWujjidA8R7jydtkVHvaHlZoXuoIxu9
No7uWJGg3FgLFWv1Ywq7MofPnZ2KrjUgwmoibhHXPoH8nmBW8mJ8q6g+jkKMx+O8
dXrOtI+lA0Mlqofwge2gssNZ7WdsfwJ7uPb3khypKS5Ltpr3I/llJnbe87rwk/1m
ud53adrYMg3DKEh6poqH21dePH+LTAPHW+F1uBhJv6H6uDSPFyzV+FGDQ5pXJZkQ
A270G0pjdByJFyhEdiL1XFKgS7SmIg==
=/9WJ
-----END PGP SIGNATURE-----

--4ubtrqm6f7yuqrf6--
