Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web10.20896.1586975572241199727
 for <tools@linux.kernel.org>;
 Wed, 15 Apr 2020 11:32:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=J/nh7S4Z;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: broonie@kernel.org)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 2565B2084D;
	Wed, 15 Apr 2020 18:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586975571;
	bh=8rfiojX74o4ICki7iRPifHoZCT7lcXG3oR53d+f8kVc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J/nh7S4Z1wB6JFEiBxqSeBCScOLg3I8eo2tnA5mvYR6of1J0ZzZlvaDnjViX+1HJd
	 D+KCFErk0ahm0z0LheCkdrzrNN8vT8yBCyBwwTjNj5KSDRHGFHiPFvGeA6XI4f4t3o
	 YTE9Wdpt/lV0kjzz9QJLOYMdxiYH6JtiNPW11pI4=
Date: Wed, 15 Apr 2020 19:32:48 +0100
From: "Mark Brown" <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: [kernel.org users] b4 auto-thankanator landed in master
Message-ID: <20200415183248.GK5265@sirena.org.uk>
References: <20200410210056.wefp3ujj22esoy2r@chatter.i7.local>
 <20200415150000.GE5265@sirena.org.uk>
 <20200415165712.swekibu2xg453sqa@chatter.i7.local>
 <20200415172324.GH5265@sirena.org.uk>
 <20200415175548.h4tyddairbltmri3@chatter.i7.local>
MIME-Version: 1.0
In-Reply-To: <20200415175548.h4tyddairbltmri3@chatter.i7.local>
X-Cookie: Hire the morally handicapped.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Groupsio-MsgNum: 80
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2feizKym29CxAecD"
Content-Disposition: inline

--2feizKym29CxAecD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2020 at 01:55:48PM -0400, Konstantin Ryabitsev wrote:
> On Wed, Apr 15, 2020 at 06:23:24PM +0100, Mark Brown wrote:

> > I think there's still some issue, not sure what triggers it but it seems
> > to happen with explicitly specified messages too.  Do I need to clear
> > out some local database?

> No, this means we're getting an output that I'm not expecting. Could you=
=20
> please rerun that as "b4 -d" to enable debug output? Right before it=20
> crashes, it should print out a line like this:

> Running git --no-pager diff ...

> I'd be very interested to see the diff that is produced by running that=
=20
> command (specifically, the @@ @@ lines). That code currently expects to=
=20
> always have lines added and lines removed, but that appears to be the=20
> wrong expectation and I need to fix that.

Running git --no-pager diff d2a66a4f85813d53fa5618f95e365a4f3beb2aa3~..d2a6=
6a4f85813d53fa5618f95e365a4f3beb2aa3

is the one immediately before it explodes.  That's a local commit in my
tree which I'm reluctant to share but playing about a bit I'm pretty
sure that the issue is that the only thing it does is add a file - the
one @@ line is:

@@ -0,0 +1 @@

and I can reproduce similar behaviour with other random one line
additions.  Does that help you see the issue?

--2feizKym29CxAecD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6XU08ACgkQJNaLcl1U
h9ACfgf/SCvPBJMe9OhG/lcD0zId+3ABzd+Dt3lCh3H7rTjEnAx1+yiaTjQzcdJH
zB+JqRMy5k1vFw8bDGfpCdFNDH8Zwx69cy5AUJQqm4/04YYM7PbRt9pZZHVDZD87
dzHRPWOv5Qxu7TIyvvP6jOZxqdDrTGcwGuxnSPEsq10ueo5tEZt+Z2qK0bdyURG0
foiwjz5Y7Dr6gs+Cn7uTaIx94sS9qGqlETRsOzVSGeN51R0L2IIID5XhtaI2eX+Y
Ak3LWVyKdKGKMmHfD03fTDYROusKwrvpKf+mbL3Pj6Pmcmoe7UA6Fjg3l8SxYWRs
kGk8UhuzkF2+8MWAO1E2uqfXvJ5i7w==
=w9KP
-----END PGP SIGNATURE-----

--2feizKym29CxAecD--
