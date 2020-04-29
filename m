Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web12.950.1588155192988704182
 for <tools@linux.kernel.org>;
 Wed, 29 Apr 2020 03:13:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=kpiCk/Jp;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: broonie@kernel.org)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id D226C2074A;
	Wed, 29 Apr 2020 10:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1588155192;
	bh=VA/8GTyUFGexkpM9x/UzTgO/5G4uNt2aP1Pv9J6GoD0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kpiCk/JpiCkU6/AYYlFvOG/xjRVJoEpW60Mj0+Ek2W/9/rvLe5L0/ZwWxszk4JFk/
	 9Os1p+MCkS3vJlxviE9EQh23yiyzsmKAnG3DyRVPXKRbyf9vXaAz2vLsXDMwc1j+hx
	 +3s9Nc/fOMpBKBSjFoRspG2GcxeKymqIhRnyLPzo=
Date: Wed, 29 Apr 2020 11:13:09 +0100
From: "Mark Brown" <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, users@linux.kernel.org,
	tools@linux.kernel.org
Subject: Re: [kernel.org users] What is a useful way to show changes between series?
Message-ID: <20200429101309.GE4201@sirena.org.uk>
References: <20200428192938.aue3v6kxsm47day5@chatter.i7.local>
 <20200428193550.GX26002@ziepe.ca>
 <20200428194419.i2gamyjgbilp2x73@chatter.i7.local>
MIME-Version: 1.0
In-Reply-To: <20200428194419.i2gamyjgbilp2x73@chatter.i7.local>
X-Cookie: I know how to do SPECIAL EFFECTS!!
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Groupsio-MsgNum: 115
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ns7jmDPpOpCD+GE/"
Content-Disposition: inline

--Ns7jmDPpOpCD+GE/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2020 at 03:44:19PM -0400, Konstantin Ryabitsev wrote:

> Right, but that only works from a tree, correct? Unfortunately, very few=
=20
> people are providing base-commit information still, so I'm not sure how=
=20

It would be helpful if git could be configured to do this by default
in format-patch rather than requiring it to be done manually on the
command line separately to specifying the set of patches to format.

--Ns7jmDPpOpCD+GE/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6pUzUACgkQJNaLcl1U
h9CW7gf7BGfE6+yyHDhZeXOpV9m5Dp4Ckygg6MLRFJNYKfpoVcwvaxqULgE/BQ9v
NxOcai3mxkrBRun4Nml3RZ0KEvi5mLucHo4AML6Cxe2rT0hT48e9g4qAvW4B8POm
Lc9akUdmx1ybu74ENA28q5s5Y3ZvffraXekrwRW/HSTpgN0yWxirD4caNiwxX9qt
U+SumK7slcN9pUKWHEapksA0Jls0qs8WMYyZ2IrjmXlug+xGFo0yYrszZqTiUrpv
VoVU9I34C7+oVx2E2vn1lu5I9Y72oUWN5bdeNWrKoWcvYO1ADUi0e62tayOCke5r
Au56BRgsBMiDdMTpACnrZpelED6Hzw==
=V2kD
-----END PGP SIGNATURE-----

--Ns7jmDPpOpCD+GE/--
