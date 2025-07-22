Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9AD82E03E6
	for <tools@linux.kernel.org>; Tue, 22 Jul 2025 10:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753179099; cv=none; b=nsVROJhUzM/UZknmBzdKFcaO4NsdFusZ0NcNu/MRR2yIOyS0NE2GbTywwNi6AuQZitUCXcNpT+rTK1kuPwpGD464Cdw14hiHGSc3EuYlIfU3Z9ZEn52qtuESw0OjHYo6aJvdu1nCiJrfqHWHUdnJPE85QdvgvGg8RwLX8BJvWH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753179099; c=relaxed/simple;
	bh=ijR4oheRXhcbHH8psaotqGgiBWFLeO3EJVBpN6FhRKA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a8pAuyKSpqdtMhdDCug2trfDtBA45tN3nP7FVuIvUmT85CszaJ8oz5Ui2W9dyNPv74flyIZaEqZjWP0lRWZ1nIgDFKLfVCLwCg4d6H0YnFyXr+AY8uocEAnoDUp4X7hT7pk71zyq9tJVQuHnMWTwenFUJCiHePBvQ2FkFgPzed4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1ue9y9-0001UZ-VU; Tue, 22 Jul 2025 12:11:33 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1ue9y9-009hse-1Y;
	Tue, 22 Jul 2025 12:11:33 +0200
Received: from pengutronix.de (p5b1645f7.dip0.t-ipconnect.de [91.22.69.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 257A144635D;
	Tue, 22 Jul 2025 10:11:33 +0000 (UTC)
Date: Tue, 22 Jul 2025 12:11:32 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: users@linux.kernel.org, tools@linux.kernel.org
Cc: pisa@fel.cvut.cz, mailhol.vincent@wanadoo.fr
Subject: b4: feature idea: plausibility check for trailers
Message-ID: <20250722-utopian-thankful-warthog-104007-mkl@pengutronix.de>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dqmgvzlnpbknpsho"
Content-Disposition: inline
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: tools@linux.kernel.org


--dqmgvzlnpbknpsho
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: b4: feature idea: plausibility check for trailers
MIME-Version: 1.0

Hello,

without malicious intent, but due to human error, lack of coffee and/or
haste, it happened that a reviewer copied/pasted/edited an incorrect
Reviewed-by trailer into an email [1]. They changed the username and
domain, but not the display name.

[1] https://lore.kernel.org/all/202507220837.23333.pisa@fel.cvut.cz

This error was noticed by another reviewer, but b4 did not notice it. Is
it possible to check whether the display name of a trailer matches the
display name of the sender?

| b4 shazam -l -H 20250722035352.21807-1-luis.hernandez093@gmail.com
| Grabbing thread from lore.kernel.org/all/20250722035352.21807-1-luis.hern=
andez093@gmail.com/t.mbox.gz
| Checking for newer revisions
| Grabbing search results from lore.kernel.org
| Analyzing 6 messages in the thread
| Analyzing 0 code-review messages
| Checking attestation on all messages, may take a moment...
| ---
|   =E2=9C=93 [PATCH v3] docs: Fix kernel-doc error in CAN driver
|     + Reviewed-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr> (=E2=9C=
=93 DKIM/wanadoo.fr)

correct trailer

|     + Reviewed-by: Vincent Mailhol <pisa@fel.cvut.cz> (=E2=9C=93 DKIM/fel=
=2Ecvut.cz)

This is the incorrect trailer from [1] that b4 picks up.

|     + Reviewed-by: Pavel Pisa <pisa@fel.cvut.cz> (=E2=9C=93 DKIM/fel.cvut=
=2Ecz)

fixed trailer from a follow up mail

|     + e-mail: pisa@cmp.felk.cvut.cz (=E2=9C=93 DKIM/fel.cvut.cz)

different issue: b4 picks this up from the signature of one
reviewer....

|     + Link: https://patch.msgid.link/20250722035352.21807-1-luis.hernande=
z093@gmail.com
|   ---
|   =E2=9C=93 Signed: DKIM/gmail.com
| ---
| Total patches: 1
| ---
| NOTE: some trailers ignored due to from/email mismatches:
|     ! Trailer: e-mail: pisa@cmp.felk.cvut.cz
|      Msg From: Pavel Pisa <pisa@fel.cvut.cz>

=2E.. but ignores it, as it doesn't match the sender's mail.

| NOTE: Rerun with -S to apply them anyway
| ---

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--dqmgvzlnpbknpsho
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmh/Y9EACgkQDHRl3/mQ
kZyS6AgAjL5/1B66bqkcT+sh9YfCqOGAwIRv8So/mFEobPTrRaV8Z2OVbp7Glon+
f6xpxgDn9aFPWRYe4/+CVsk65yk747aQgAnll1hauEQUSGo+1++zepx1umznPSJQ
IJPu91SR1mI+NdzAgqJTuMFF6+oenYeLgwYUebjJm6MYGBMdGkK9iNSjfhlTffXQ
2qFaXlplTB+CxgO3ni9F/5AJ9xkThBF+7SBle7YlW/OF18PSO9iMKMxDFJHGFmI3
37vpcZtypcASLOj1wS+icfwQ5WuFOR8l8mMuXKJWSXdUvM+YXbpxdTOO0C24yped
0YlSGlhP9G/3UiT87npgc6t97XMwaQ==
=+YsI
-----END PGP SIGNATURE-----

--dqmgvzlnpbknpsho--
