Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web12.4068.1588175492139825839
 for <tools@linux.kernel.org>;
 Wed, 29 Apr 2020 08:51:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=X4JT/9zG;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: broonie@kernel.org)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 05EE420B80;
	Wed, 29 Apr 2020 15:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1588175491;
	bh=k8xHM8l5nAStAbbMZdN27Tt6GXD2u6PmFaO3YuiDtqs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X4JT/9zG0LGcOVzSWTx+NKj8R8hU1R5oDeqAJpJ0JM4xcZp48ZH8BWcCvRJiNlRIE
	 ioNlMe93mKTdaGtx9EskyPChLEEo8b8btMunGbDoB55A028w9256C4IK6Ibuv065dv
	 0JQCvNbZ9fvIkF+fkLVtr85K1WHRszEeK+7Rxazc=
Date: Wed, 29 Apr 2020 16:51:28 +0100
From: "Mark Brown" <broonie@kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, users@linux.kernel.org,
	tools@linux.kernel.org
Subject: Re: [kernel.org users] What is a useful way to show changes between series?
Message-ID: <20200429155128.GN4201@sirena.org.uk>
References: <20200428192938.aue3v6kxsm47day5@chatter.i7.local>
 <20200428193550.GX26002@ziepe.ca>
 <20200428194419.i2gamyjgbilp2x73@chatter.i7.local>
 <20200429101309.GE4201@sirena.org.uk>
 <1588172426.11333.10.camel@HansenPartnership.com>
 <20200429151938.GM4201@sirena.org.uk>
 <1588175070.11333.35.camel@HansenPartnership.com>
MIME-Version: 1.0
In-Reply-To: <1588175070.11333.35.camel@HansenPartnership.com>
X-Cookie: I know how to do SPECIAL EFFECTS!!
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Groupsio-MsgNum: 121
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b/Q3JWIUAuLE0ZFy"
Content-Disposition: inline

--b/Q3JWIUAuLE0ZFy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 29, 2020 at 08:44:30AM -0700, James Bottomley wrote:
> On Wed, 2020-04-29 at 16:19 +0100, Mark Brown wrote:

> > I did say "default" rather than "force" - it's a lot easier if you
> > have a workflow where it might be useful if you can just turn it on

> I think we need to be careful here.  Today if you specify a base
> everyone assumes it should exist and they know something is seriously
> wrong if it doesn't (0day will complain, for instance).  If you force
> everyone to specify a base, then suddenly you lose the information that
> they really meant it and you have no idea if a bogus base is an
> indicator of problems with the series.  Forcing a default base would
> make the base commit useless as an indicator of correctness since now
> you have to process bogus bases as well.

> Of course, this is simply an argument for still having the option, just
> not making it default, so if you know what you're doing and don't use a
> quilt like workflow, you turn it on.

This is why I suggested adding the ability to configure git to do this
by default rather than suggesting just doing this by default.

--b/Q3JWIUAuLE0ZFy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6pooAACgkQJNaLcl1U
h9BG2Qf8CjgI8NSvn0bTIt1DE0cC7q0QGl5FrcaiUswv/8OwNdqxD+gaXk5c8e5+
/fEvHY/rfrR5e4du7jmtkHujAdrAv6UkiFzDMD82UZPlL7bsuJanNGj6ATi1i9wi
Nj493nVBJTMortod21WId8gTP/FooxnPmMiUEiefTBn+DBpvlMjNDIIIaOdCenMO
CKQLudmkAGpfn9wkGCgC4FZ2zn1HfhkgNPJjOwzmDHp7XPol4BLZd4Stqq1WGej7
oPxtyQzKYlIQ5kaxvN/UOQLyN5BbXAaDD4pqLBRKxOSCSYeSXHPPtxGnf5oJfXQc
Kif0IJzAoomAkhVFtHv6N3WKDniz+A==
=MqeU
-----END PGP SIGNATURE-----

--b/Q3JWIUAuLE0ZFy--
