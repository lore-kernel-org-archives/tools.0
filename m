Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE81156236
	for <tools@linux.kernel.org>; Thu, 29 Jan 2026 08:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769676524; cv=none; b=h5TCrJJ1FvmeW9BCLadCLPFc8REYdexf08Lzfkk/Yu0p+UU1jK0UYxBUSfwrInC8eRK9cdgq0QXfiwvWhr2l4EEGWj6WePcZUKaSCem3RgnwNWBKSLr4OdUKk0BwBcG+Pk5xwgbvH4ud7gbVhxtqva9fx505ZZcTdztFUNmf2oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769676524; c=relaxed/simple;
	bh=NRsZjmqvlVLR3v+6zlHqoSNiF4sJH06p4+abFk/zQNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lCsym7b8OgyQasS50wkFaI288j81/Gccf0yX1OxVnxIRiuF6j9UxPUnqfuShMDS+5akj9tee6rfv6ARi4vKbzmsUHEsgmp+zcb9+TCrqP//KXMjFXNaCG1INFTmbpHD9z4wmMpz7MJncD/b3dGSBw2oWi2hkIik/KRN32PDCdts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id D2E02C4CEF7; Thu, 29 Jan 2026 08:48:43 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 02AA8C16AAE
	for <tools@kernel.org>; Thu, 29 Jan 2026 08:48:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 02AA8C16AAE
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1vlNhf-00036W-Tl; Thu, 29 Jan 2026 09:48:39 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1vlNhg-0033Wp-0s;
	Thu, 29 Jan 2026 09:48:39 +0100
Received: from pengutronix.de (p54b15bf8.dip0.t-ipconnect.de [84.177.91.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 567294DAEF6;
	Thu, 29 Jan 2026 08:48:39 +0000 (UTC)
Date: Thu, 29 Jan 2026 09:48:39 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Oliver Hartkopp <socketcan@hartkopp.net>
Cc: linux-can@vger.kernel.org, tools@kernel.org, users@kernel.org, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: b4 prep --auto-to-cc fails with 'NoneType' object is not
 subscriptable
Message-ID: <20260129-fortunate-pompous-chinchilla-dcb99f-mkl@pengutronix.de>
X-AI: stop_reason: "refusal"
References: <20260125201601.5018-1-socketcan@hartkopp.net>
 <20260127174937.4c5fc226@kernel.org>
 <67cb17f4-2f72-4847-aa04-3633f3d8df33@hartkopp.net>
 <20260128-booby-of-phenomenal-proficiency-4db5ab-mkl@pengutronix.de>
 <20260129-versatile-tuscan-mongrel-f9b173-mkl@pengutronix.de>
 <f47126ee-8256-4077-a09c-47a1ed461f65@hartkopp.net>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3iqyk4zdrryuggun"
Content-Disposition: inline
In-Reply-To: <f47126ee-8256-4077-a09c-47a1ed461f65@hartkopp.net>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: tools@kernel.org


--3iqyk4zdrryuggun
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: b4 prep --auto-to-cc fails with 'NoneType' object is not
 subscriptable
MIME-Version: 1.0

Cc +=3D tools@k.o, users@k.o, konstantin@l.o

On 29.01.2026 08:49:24, Oliver Hartkopp wrote:
> > Hooray for switching to b4!
>
> Yes! Unfortunately one of the most relevant features does not work:
>
> $ b4 prep --auto-to-cc
> Will collect To: addresses using get_maintainer.pl
> Will collect Cc: addresses using get_maintainer.pl
> Traceback (most recent call last):
>   File "/usr/bin/b4", line 8, in <module>
>     sys.exit(cmd())
>              ~~~^^
>   File "/usr/lib/python3/dist-packages/b4/command.py", line 417, in cmd
>     cmdargs.func(cmdargs)
>     ~~~~~~~~~~~~^^^^^^^^^
>   File "/usr/lib/python3/dist-packages/b4/command.py", line 83, in cmd_pr=
ep
>     b4.ez.cmd_prep(cmdargs)
>     ~~~~~~~~~~~~~~^^^^^^^^^
>   File "/usr/lib/python3/dist-packages/b4/ez.py", line 2835, in cmd_prep
>     auto_to_cc()
>     ~~~~~~~~~~^^
>   File "/usr/lib/python3/dist-packages/b4/ez.py", line 2655, in auto_to_cc
>     logger.debug('added %s to seen', ltr.addr[1])
>                                      ~~~~~~~~^^^
> TypeError: 'NoneType' object is not subscriptable
>
>
> $ b4 --version
> 0.14.2

Latest version is v0.14.3, please re-check.

> While get_maintainer.pl itself works ...
>
> $ scripts/get_maintainer.pl net/can/bcm.c
> Oliver Hartkopp <socketcan@hartkopp.net> (maintainer:CAN NETWORK LAYER)
> Marc Kleine-Budde <mkl@pengutronix.de> (maintainer:CAN NETWORK LAYER)
> linux-can@vger.kernel.org (open list:CAN NETWORK LAYER)
> linux-kernel@vger.kernel.org (open list)
>
> At least posting via b4 relay works fine and downloading of the v2 patchs=
et
> you sent was comparably easy too.

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--3iqyk4zdrryuggun
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAml7HuQACgkQDHRl3/mQ
kZy6wQf/SOXJskvOmHGRDVoMEXCbx/s5FYPCDK/oyF+hJb/xwzGZSJssn+dvZT4E
aWTW9RM4mxwrHLWgwvY/ZPwzBALQItqC4C4ndoWBSXitfQeLclnBR9IlTPBXXmbi
EVT5sWXnP24cfAMXPQCQXK3Ln3prQDc1QS/eOTvVR9TL0wBhTNxCwifH3wWIfdTt
N3nYg7amv6S5y206BB+aA2Xz1MNH2Xy7jNTb9PhB7mD+I9tLLsnyrN5CrGpWdJ6p
Wbr4LwpKoA9SLgUNcmOpYQF6OcbQhrYXkeCR2jFGNZZGWYDnZgdYg88CWOI66pfM
dhPKWAK36CoD4HdzmkBCB7b6gT+Z2w==
=SbsS
-----END PGP SIGNATURE-----

--3iqyk4zdrryuggun--
