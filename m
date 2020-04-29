Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web11.3274.1588173581819679492
 for <tools@linux.kernel.org>;
 Wed, 29 Apr 2020 08:19:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=lhfrQ94x;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: broonie@kernel.org)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id C41AA20575;
	Wed, 29 Apr 2020 15:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1588173581;
	bh=An5FKQI5T7B9K2bck7zXTWbKO1hjhGKZtgFDGOHFlDI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lhfrQ94xNzoDnDdjMGcVNgAUL6G9LkH7OgEE4R019CCn0ggM0lKcnNJr8+NlZAyPI
	 Vmm4+heoUXRwyTy37tZN1O4+iPRDL7rkML3GxFJWgtBIAS7XHQyMvwOv0Jf5NFTKBU
	 GCHmhEp2exVxmxolHecDsTJBdJ9/pQM0/VT0mQ6g=
Date: Wed, 29 Apr 2020 16:19:38 +0100
From: "Mark Brown" <broonie@kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, users@linux.kernel.org,
	tools@linux.kernel.org
Subject: Re: [kernel.org users] What is a useful way to show changes between series?
Message-ID: <20200429151938.GM4201@sirena.org.uk>
References: <20200428192938.aue3v6kxsm47day5@chatter.i7.local>
 <20200428193550.GX26002@ziepe.ca>
 <20200428194419.i2gamyjgbilp2x73@chatter.i7.local>
 <20200429101309.GE4201@sirena.org.uk>
 <1588172426.11333.10.camel@HansenPartnership.com>
MIME-Version: 1.0
In-Reply-To: <1588172426.11333.10.camel@HansenPartnership.com>
X-Cookie: I know how to do SPECIAL EFFECTS!!
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Groupsio-MsgNum: 119
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jB+02Y6wHc2pEa2x"
Content-Disposition: inline

--jB+02Y6wHc2pEa2x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2020 at 08:00:26AM -0700, James Bottomley wrote:
> On Wed, 2020-04-29 at 11:13 +0100, Mark Brown wrote:
> > On Tue, Apr 28, 2020 at 03:44:19PM -0400, Konstantin Ryabitsev wrote:

> > > Right, but that only works from a tree, correct? Unfortunately,
> > > very few people are providing base-commit information still, so I'm
> > > not sure how=20

> > It would be helpful if git could be configured to do this by default
> > in format-patch rather than requiring it to be done manually on the
> > command line separately to specifying the set of patches to format.

> It might also end up causing a lot of confusion:  remember, a lot of
> people use a quilt like workflow for their patches ... I know I do
> because when I've got several patch series to upport, having a single
> branch with all of them is much easier to work with than multiple
> branches and a combination.  Even in the simplest cases where I'm
> working on the current tree and have only a single series, I often have
> a bugfix for some current issue as the base patch so I can boot my

I did say "default" rather than "force" - it's a lot easier if you have
a workflow where it might be useful if you can just turn it on instead
of having to manually go and specify the base commit twice when
formatting serieses which is both a pain and easy to forget, then
disable it where it doesn't make sense.  Right now it's more effort than
it's worth to use even when it does make sense.

> series easily.  In either case forcing the cover letter to show my base
> patch would give you useless information because it wouldn't be in any
> tree you have.

TBH it's fairly harmless if the commit that's being referenced doesn't
exist.

--jB+02Y6wHc2pEa2x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6pmwkACgkQJNaLcl1U
h9BAzgf9HGzKSF39RjCKnO9QpQvuCuTfBM0nqRleTlOf7jbtjSFiqan99+2DX0Wj
BepnnwJa+yx+kJR9aag7lSeU7TU0oZodVXYYJbvxGYQGstQpUKvUAxxQYvGYU295
gxBpgQcvys6nFa+ARFNBiZ9gIkXDOwIERUmH6p6YPdiJj7rtixA9vId5Ww33+GwH
xV1dojGIQorbu1nw4z2J7/aRuB2kStYaIM4BseBXwAXefUabrzUKRyam1jYov3tj
8TfK3a67x4ojlUZ0n+zL6Jb6PH6vl0/Do48FnSaCKNawuyJRd3KkaUTdcP2OIhl6
3Td+BowNxWi6a2Rou22VPGjBxHG9NA==
=hXfQ
-----END PGP SIGNATURE-----

--jB+02Y6wHc2pEa2x--
