Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web11.25190.1586986804468050527
 for <tools@linux.kernel.org>;
 Wed, 15 Apr 2020 14:40:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=KH+ngCbA;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: broonie@kernel.org)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 5B5A0206E9;
	Wed, 15 Apr 2020 21:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586986804;
	bh=8xBYxqwknmyp7/21MndeQIB57XeYqCdAMOBdehlFFD8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KH+ngCbAUNZf4Tggnut5Ch2PPjoaBtA/k2jnjYZV1Unc4ujVPDA/uhgjJ6K4pjLh3
	 /5ZHSrjORZ0MnEP0+sSAMakUA5vlFRfnM9W7V3x2iBE/kDRxclc8qWIIM2kU+7jps8
	 r3kIMdr5mVS5DmR9048h78UNnDLB+suD674+ZFfM=
Date: Wed, 15 Apr 2020 22:40:01 +0100
From: "Mark Brown" <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: [kernel.org users] b4 auto-thankanator landed in master
Message-ID: <20200415214001.GO5265@sirena.org.uk>
References: <20200410210056.wefp3ujj22esoy2r@chatter.i7.local>
 <20200415150000.GE5265@sirena.org.uk>
 <20200415165712.swekibu2xg453sqa@chatter.i7.local>
 <20200415172324.GH5265@sirena.org.uk>
 <20200415175548.h4tyddairbltmri3@chatter.i7.local>
 <20200415183248.GK5265@sirena.org.uk>
 <20200415192819.l4osqt6sxdlydbso@chatter.i7.local>
 <20200415201222.GM5265@sirena.org.uk>
 <20200415212102.22zfvequfcvprgbj@chatter.i7.local>
MIME-Version: 1.0
In-Reply-To: <20200415212102.22zfvequfcvprgbj@chatter.i7.local>
X-Cookie: Hire the morally handicapped.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Groupsio-MsgNum: 84
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xexMVKTdXPhpRiVT"
Content-Disposition: inline

--xexMVKTdXPhpRiVT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2020 at 05:21:02PM -0400, Konstantin Ryabitsev wrote:
> On Wed, Apr 15, 2020 at 09:12:22PM +0100, Mark Brown wrote:

> > Did you forget to push...

> Haha, classic. Yes, it should be there now.

It is and works, thanks!

> > The other is that if I don't apply all of a series then b4 ty will
> > refuse to generate anything with no way I can see to override.=20

> I think the master has a change for that as well -- try that out.

> > This
> > happens a fair amount when people do things like send a new driver along
> > with a DT update.  Perhaps an option to allow partial lists (though I
> > think that might need more complex templating), or one to generate
> > per-patch thanks messages?

> I think we can do --partial. Let me ponder how that can be done best.

That should work for me, and be able to replace my own thanks generating
scripts which will make some of the people who get those mails happy!

One more issue - if I set b4.thanks-XX-template with a path based off ~
then b4 won't expand the ~, it needs a fully qualified (or I guess
relative, didn't check) path.

--xexMVKTdXPhpRiVT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6XfzAACgkQJNaLcl1U
h9AzFwf+PaCSMP0o6ow+AcM06gbODTR6OEAkL+OZMT/A8rK06clAfvnRJg5OtpGs
jTY3cqtyuXP2Kv55E02YdrD5M6PeZSy5yOkzx8XZSlqoqzlAwGZYYtiWILEZtT+j
o9Ra+Xeo4VqLR/H5DRJsW3UBtRHIHzWx0n1/WP2SqbrMCNyCYbCFj+GFhFgACocP
jhVbSDMD57m2P+uaZxtKckQ34XvSX/Au6Ox5xZNuCR18c92jru7goqSi0Q/0PcaH
kLFG40GIFK7fDQ/20GUMMyUAcHThsg0iEzpwRufKRowbvBJsaru8C6VhGxGxDP32
45S/AenUWUkZPiD2Q7C0oyJ6yNGucQ==
=WkTa
-----END PGP SIGNATURE-----

--xexMVKTdXPhpRiVT--
