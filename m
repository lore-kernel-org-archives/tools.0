Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web11.8713.1607436235471612063
 for <tools@linux.kernel.org>;
 Tue, 08 Dec 2020 06:03:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=HgJREQDu;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: broonie@kernel.org)
Date: Tue, 8 Dec 2020 14:03:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607436234;
	bh=DIPYUaZ8FjRWsVNDHh2MBurwOgczFEvoT1O2AEW587U=;
	h=From:To:Cc:Subject:References:In-Reply-To:From;
	b=HgJREQDuPLOFFfWTO569Cy8uHrVFnDp0Sqdg7g9e+mEc9L9cEcFkd085fsPdrJ8Mv
	 SFRCTxALAkACUEusCCAvZn+LBc71vvHiXeRxByzC9X8IQSRDBHumhGknSm9hSyd4JA
	 v4S0PVJABuHj1VlLIhLso65Ez3+SSwrYrjdxwz/BZ7kMnbGWbRPPnQQ99TiW/QaFrM
	 Ybwj305xTheBAM3zHnCui8wTDO8ItJTQ2SZSNvlnwtmWQZRgPf8v2dZUaNs/LqQCr/
	 HvViH7Gk27DcGGQwGiYzhAST2ZxCA5KiKSVsJMFB6g602DUqYwvkMD+Dl42JD+k5Id
	 HQuYLZOkAWXdw==
From: "Mark Brown" <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Rob Herring <robh@kernel.org>, tools@linux.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	users@linux.kernel.org
Subject: Re: [kernel.org users] [tools] b4 ty : wrong patch number when cherrypicking
Message-ID: <20201208140348.GE6686@sirena.org.uk>
References: <20201030173744.GA995986@piout.net>
 <1642D74B05A23708.27950@linux.kernel.org>
 <20201124182241.sojck3t76qjm5a2s@chatter.i7.local>
 <CAL_JsqJ8s6ry-nkSujEO1Pvxre=rW4p72U-_aadkQ-2Zc93sWA@mail.gmail.com>
 <20201208135926.fax4p7zqxpqgq3wo@chatter.i7.local>
MIME-Version: 1.0
In-Reply-To: <20201208135926.fax4p7zqxpqgq3wo@chatter.i7.local>
X-Cookie: Do not dry clean.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Groupsio-MsgNum: 291
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BQPnanjtCNWHyqYD"
Content-Disposition: inline

--BQPnanjtCNWHyqYD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 08, 2020 at 08:59:26AM -0500, Konstantin Ryabitsev wrote:
> On Thu, Dec 03, 2020 at 08:03:33AM -0700, Rob Herring wrote:

> > > - when we send a reply for a subset of the series, we will now insert=
 a
> > >   "(subset)" into the subject to more clearly indicate to the submitt=
er
> > >   that the series only got applied partially

> > Could we not modify subjects as that breaks gmail 'threading'. Yes,
> > gmail is broken, but there's more than a few users...

> Well, the goal is to make it extremely obvious for the submitter that=20
> only a subset of their patch series got applied -- so I would argue that
> Gmail thread-breaking only helps here.

> Overall, this would be an very rare situation, so I doubt anyone would=20
> care enough to get annoyed.

This is actually a pretty common situation - the two most frequent
situations are people doing cleanup work who decide to thread a bunch of
patches to different subsystems with no interdependencies together and
people adding new drivers that cross multiple subsystems (eg, a driver
plus DTS updates adding it to some platform or a MFD with several
subfunctions).

--BQPnanjtCNWHyqYD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/Ph8MACgkQJNaLcl1U
h9Di2Qf9GPVyybquHcx4eTQpImC3EExg5CRwoxBlBCgkxS9mcA8hxA2QDzOYx5vQ
ygnL6eMzywxPougc8zQEBMhYDa6+ZkbQGmytzyo4eE+R8T3xZmfh1VKKSMjAutTS
HsGt/W8D3ebf7N/oNwUjcihIZla0uR62b1oLcu7Tu5fxMpB2NiXgwqsiXkBZ4jV4
i4xwVpHJ5bU1EAY0SFcmCQ95NI2BWd/Soqqif/IfYxXgoyYbS5vbMgkTa0CGKeSc
oEFzItNyjK7U+3Bk6YT7RYgGxKfkgvJpSruO2EEB2Jsf4sXKRwja26dx34BtQwYf
OfyISVJgSd2NjnN0H7IcZctB15FO8g==
=55q6
-----END PGP SIGNATURE-----

--BQPnanjtCNWHyqYD--
