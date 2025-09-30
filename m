Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA5323A562
	for <tools@linux.kernel.org>; Tue, 30 Sep 2025 12:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759234734; cv=none; b=OFCCWJltWfuOwVcLHFUJtJ+gV6xCpnN2okMnAEWNwASl5ON7UQw2Uq6MaJfzU8XpowOeZU8Eh5HUO+xLjUkaDhUwWobOXF7TWEzwm4PwqaMYj6Eenq9BiI9AOtcXFDbgzNyf2fTOcdHgKed/0UIjkXRjWuTSxH5bA6cKy9JMVtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759234734; c=relaxed/simple;
	bh=Clj6Efkl1V41HK/lZ/0nyl3p0MpEf1pBFH8ger4t8Sw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UcwFGxtkkqZQS3rROEp2hDz90rwxPr3tnOwqMIvxssiFBm1lUc45O4FN+U5+q+snzIUwwOUSvadSKcJaHnG5oHtMyJq1gXDG+VH4XOgIbiTTjKM23cAZ2LyJi6hfYpLBGGH+5TcYqlDR6mqHMOmBtrjiICsBFbxpe4aLYtpn0tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1v3ZJi-0002Tf-Nf; Tue, 30 Sep 2025 14:18:50 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1v3ZJi-001FEv-1N;
	Tue, 30 Sep 2025 14:18:50 +0200
Received: from pengutronix.de (p54b152ce.dip0.t-ipconnect.de [84.177.82.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 1D01D47D25E;
	Tue, 30 Sep 2025 12:18:50 +0000 (UTC)
Date: Tue, 30 Sep 2025 14:18:48 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org, kernel@pengutronix.de
Subject: b4: shazam: UnboundLocalError
Message-ID: <20250930-groovy-soft-octopus-bd626a-mkl@pengutronix.de>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uskk75stlv3yaj35"
Content-Disposition: inline
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: tools@linux.kernel.org


--uskk75stlv3yaj35
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: b4: shazam: UnboundLocalError
MIME-Version: 1.0

Hello,

current b4 master crashes like this during shazam ("am" works though):

| $ b4 shazam 20250930-gs-usb-max-if-v5-1-863330bf6666@coelacanthus.name
| Grabbing thread from lore.kernel.org/all/20250930-gs-usb-max-if-v5-1-8633=
30bf6666@coelacanthus.name/t.mbox.gz
| Checking for newer revisions
| Grabbing search results from lore.kernel.org
| Analyzing 8 messages in the thread
| Analyzing 1 code-review messages
| Traceback (most recent call last):
|   File "/home/frogger/local/git/b4/src/b4/command.py", line 450, in <modu=
le>
|     cmd()
|     ~~~^^
|   File "/home/frogger/local/git/b4/src/b4/command.py", line 433, in cmd
|     cmdargs.func(cmdargs)
|     ~~~~~~~~~~~~^^^^^^^^^
|   File "/home/frogger/local/git/b4/src/b4/command.py", line 105, in cmd_s=
hazam
|     b4.mbox.main(cmdargs)
|     ~~~~~~~~~~~~^^^^^^^^^
|   File "/home/frogger/local/git/b4/src/b4/mbox.py", line 854, in main
|     make_am(msgs, cmdargs, msgid)
|     ~~~~~~~^^^^^^^^^^^^^^^^^^^^^^
|   File "/home/frogger/local/git/b4/src/b4/mbox.py", line 113, in make_am
|     lser =3D lmbx.get_series(revision=3Dwantver, sloppytrailers=3Dcmdargs=
=2Esloppytrailers, reroll=3Dreroll,
|                            codereview_trailers=3Dload_codereview)
|   File "/home/frogger/local/git/b4/src/b4/__init__.py", line 362, in get_=
series
|     if pmsg is None:
|        ^^^^
| UnboundLocalError: cannot access local variable 'pmsg' where it is not as=
sociated with a value

| $ b4 --version
| 0.15-dev-56183

I've bisected the problem to:

| 8633c7e830a5a75b6e34593cda98d0b6c0b1bb05 is the first bad commit
| commit 8633c7e830a5a75b6e34593cda98d0b6c0b1bb05
| Author: Tamir Duberstein <tamird@gmail.com>
| Date:   Fri Jun 6 15:51:19 2025 -0400
|
|     Check variables for None rather than exprs
|
|     This allows type checkers to better understand that these variables
|     can't be None.
|
|     Signed-off-by: Tamir Duberstein <tamird@gmail.com>
|     Link: https://patch.msgid.link/20250606-uv-compat-v1-8-c76c1c8d6eeb@g=
mail.com
|     Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
|
|  src/b4/__init__.py | 21 ++++++++++++---------
|  1 file changed, 12 insertions(+), 9 deletions(-)

| $ python3 --version
| Python 3.13.7

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--uskk75stlv3yaj35
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmjbyqUACgkQDHRl3/mQ
kZx9OAf+J+bwGHTz4Vj6fM12nnggirNADGrpI6VqlNwm6wp8b6EqSgdYg+/GC9rE
JKeKsY+nyST2prUOSqL6H4HuUr9arv4M/MY4l4gsmy/zvOagbs7Vz+NOXV2eILJ+
UtK+LI7acRcer/pv0RS0WF/lgC6tJyN0lKRsD0yTBqkxkJeYIuQ2kSHlTUYo5GRr
mGbYKeH42z6gxiSrTTaIyIEHutD0PcNjWVx7EQGh4KTG4rsuHDejd0XZ2DKbzvNx
nYsqWtZxkOamfNwP0U/dkvFGyyLyxMnsowVE80eg2EmW8mQOlj8Z4dEjV9n1lV7b
WsubZfrnZiPIRbZnRPRkpau+Z8vWYw==
=6vRn
-----END PGP SIGNATURE-----

--uskk75stlv3yaj35--
