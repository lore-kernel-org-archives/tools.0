Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web10.5288.1593802360296406229
 for <tools@linux.kernel.org>;
 Fri, 03 Jul 2020 11:52:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=UETidArw;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: broonie@kernel.org)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 4926F2073E;
	Fri,  3 Jul 2020 18:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1593802359;
	bh=h/CDUnbnbR77vxjsBbJJMxCQtRgE+dP5G2u1sNW8re4=;
	h=Date:From:To:Cc:Subject:From;
	b=UETidArwObSnTrzX1NZlhLGYoeEMUWjlq+l9ap3rVLUgwYPavVy5tlEJXCmAS0uWb
	 IuQijf2+9lD8j/a2XZU8KlCFO0dBmIfNrZpzlImq22AiE78WejU2azPgG7UMkh47km
	 XP95J5Jc40tAzbsAbxp+gWjH+tidGhgrFXMzC1vY=
Date: Fri, 3 Jul 2020 19:52:37 +0100
From: "Mark Brown" <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: b4 picking the wrong message
Message-ID: <20200703185237.GA996@sirena.org.uk>
MIME-Version: 1.0
X-Cookie: Does not include installation.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Groupsio-MsgNum: 180
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0OAP2g/MAC+5xKAE"
Content-Disposition: inline

--0OAP2g/MAC+5xKAE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Konstantin,

When I ask b4 am to fetch either of these message IDs:

   20200626164623.87894-1-sebastian.reichel@collabora.com
   DB6PR1001MB10965E5BDA9B3EF570B607A4806A0@DB6PR1001MB1096.EURPRD10.PROD.OUTLOOK.COM

both of which are for v4 of a single patch that was previously part of a
series b4 fetches v3 of that series rather than the v4 I thought I was
asking for. I see that the patch (the first message ID) was sent in
reply to discussion of v3 of the series which is probably confusing
things, there's also the use of PATCHv4 rather than PATCH v4.

Thanks,
Mark

--0OAP2g/MAC+5xKAE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7/fnQACgkQJNaLcl1U
h9AEDwf/TSIWsNgadeg6zIO5igVG1vq1lqt4k4MENqVf56FefLPhtSKrbTQMS3ap
ZcSE0PRAQ3JjwSFfBfCC2mnxoeCvzNKYm/c8YOhb4extiX5vStvRYUVkd4+XdXOB
byrm33Ost9yeknkOFVirxV8LuBoQTOhttT2ApQVTL+nfZKNArHXgfPWsDRTv/v7G
BfqHz/C/894iXmBdjxE2b6RFQ435qNwZsqkUu4wTjMGoVPqVbzhsKbt8Ni7kxDN7
FEMQGuVJdC5HAqCe1aLN+DBxBQRVDuiHKtcLEwauUTbeHBilEQUn89/a4Ax22PV/
DVfBSO07pkWBbDpz6Ls+kaUYJ0vHNQ==
=zLse
-----END PGP SIGNATURE-----

--0OAP2g/MAC+5xKAE--
