Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web11.16351.1586962804368855363
 for <tools@linux.kernel.org>;
 Wed, 15 Apr 2020 08:00:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=HxYCgNSE;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: broonie@kernel.org)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 500142076A;
	Wed, 15 Apr 2020 15:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586962803;
	bh=S7grPwxEt7a4zAZWbDgNuEIJDD2xCxE3BIHvNCtNsOo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HxYCgNSEqEnmGMeKR/k8VDLQYYe05ueyTctbvJq/VgonsROpM7zl9DVz3uQoNOc3W
	 JoKbncBehFq5DaRHgoft29sgIUgGhh7YhHXQc/o+PxRfivM4NgZfCKbyc2PjwS12Fb
	 y/FhGX1NjWQipOW1hpJeHVHEab1yx7Gvf1D9tD1g=
Date: Wed, 15 Apr 2020 16:00:00 +0100
From: "Mark Brown" <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: [kernel.org users] b4 auto-thankanator landed in master
Message-ID: <20200415150000.GE5265@sirena.org.uk>
References: <20200410210056.wefp3ujj22esoy2r@chatter.i7.local>
MIME-Version: 1.0
In-Reply-To: <20200410210056.wefp3ujj22esoy2r@chatter.i7.local>
X-Cookie: Hire the morally handicapped.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Groupsio-MsgNum: 76
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="84ND8YJRMFlzkrP4"
Content-Disposition: inline

--84ND8YJRMFlzkrP4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2020 at 05:00:56PM -0400, Konstantin Ryabitsev wrote:

> Based on your feedback, I added an "auto-thankanator" mode to b4, which=
=20
> will track your use of "b4 am" and "b4 pr" and create convenient=20
> templated thank-you replies when you run "b4 ty".

Nice, this solves some problems I've been having with my scripts since
converting to b4!

It seems like this relies on git branch --show-current which isn't
supported by the git in Debian stable, 2.20.1.  The documentation also
says that

   b4 ty -s all

will send everything but it looks like that just lists all the tracked
patches instead (possibly because of the above, I didn't check).  I'm
not sure what it's looking at the current branch for but if it's doing
that it'd be good to be able to tell it to look at a specific branch
instead -=20

> Since it's an experimental feature, we just save a .thanks file instead
> of sending it outright -- at least until there's a lot more testing.

It would be good if there was an explicit command for this, it'd be
useful when scripting stuff I think and also when testing things out.

--84ND8YJRMFlzkrP4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6XIW8ACgkQJNaLcl1U
h9DWAQf/TNAwGiZYeeYApj5kJVFa4cLevpLdqXUI7HbHQqgiZfMDDSqmUvcnaSgA
CPeZdiwGga3HkTRHRsHNokwi3vk++gKoqUnm28rRY9+q5vaUySqymJvKfOKSDO88
fh20bcY78RE+9YgupbkNgS0leSXYPA7137fBr+fZdJPuanVEa5qFCIwEWQv4zcAX
GUcvfKf4CW4RLpt//Ml+/mvtg7vSaKPYPtL9+zTnSsB5D6yOPqX2mP00q/UiugTC
zCZ9fsl/6Oj6oInD/r3GqvjJ2CDKQD+u4ejdeDQJxs1inRKjwC0FSOFcIBLNP1gh
W895FzcPJgJTkMIicXPE44E0bYsYmg==
=X4Ck
-----END PGP SIGNATURE-----

--84ND8YJRMFlzkrP4--
