Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web11.21172.1589570798095506830
 for <tools@linux.kernel.org>;
 Fri, 15 May 2020 12:26:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=iUCYz2o3;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: broonie@kernel.org)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 055DC2070A;
	Fri, 15 May 2020 19:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589570797;
	bh=KSHbDf3esJu9fEco+YMpwc/Ok1DwEnF5kvY6EudpcXg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iUCYz2o3OSMbH9MrQEh8AmNfqYy9aC5ZgJNU0dypfjmdBIOlP2GEPo88ce0pRuDuF
	 bSITwrqQODw7WmA6dhmDFiCemfqcFo66yHFBgLVZmbK5W49DOpMAqJ6i8cUb+9VfZa
	 YFZZjgHbzIRFAMA9DL2tTTrTB7y98pITwf4vWqvs=
Date: Fri, 15 May 2020 20:26:34 +0100
From: "Mark Brown" <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 ty not remembering fetched patches
Message-ID: <20200515192634.GR5066@sirena.org.uk>
References: <20200515181918.GO5066@sirena.org.uk>
 <20200515183602.ivwwyxafxojmc7mp@chatter.i7.local>
MIME-Version: 1.0
In-Reply-To: <20200515183602.ivwwyxafxojmc7mp@chatter.i7.local>
X-Cookie: Avoid contact with eyes.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Groupsio-MsgNum: 163
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CPn8Wy5ME997YUMW"
Content-Disposition: inline

--CPn8Wy5ME997YUMW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2020 at 02:36:02PM -0400, Konstantin Ryabitsev wrote:
> On Fri, May 15, 2020 at 07:19:18PM +0100, Mark Brown wrote:

> > a mailbox is generated (incomplete due to issues with vger spam
> > filtering) but the fetched patches are not recorded in the b4 ty
> > database (as showing by b4 ty -l).  This happens even if only patches
> > that are present on the list are requested on the command line.

> Right, this was intentional due to trying to be over-cautious. If we=20
> don't have the complete thread, then we probably shouldn't be tracking=20
> if this incomplete thread was applied or not -- at least that was my=20
> thinking. What is your thoughts on that?

I think that's a sensible decision and wasn't particularly surprised by
that bit of it.  In fact what might be handy would be an option to not
output the partial mailbox if we can't find some of the patches - that'd
help spot problems early on in the process.

> Of course, if we're specifically selecting a subset of that thread, we=20
> shouldn't be applying that logic. I'll see if I can add that caveat in.

Right, I'd have expected it to only apply to whatever was explicitly
asked for.

--CPn8Wy5ME997YUMW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6+7OoACgkQJNaLcl1U
h9CV7Qf8CQxLsD//WEBFlq2DODssRUKGAdFGO/EqG2/6EoRa/ytP8GmLRc8lV3cT
Hx6hSDngf/Tl1OUsYgR0oretHtp7DapDUk5preZjGbW3sCDHds4Ewdr2BuD5fvnM
ff01J2bJGMItXNUDgSY10SkuGFoNA7WzNoXGRFIAe7buwRlmZzIA+n20HF4NoSON
MBm2LR1vUoW+qYiYo5mAw8ePJlZEuZox6K1mHlLEzg0W2pJhJ/ziIpCyqH3Sa500
uzy4kzaGB6iFbj0kKpgrUx6mwMTGx0mFrozgdOB8wQgFHYx5AfqU5I3a+bEI4EBI
yLM/pfCS3pd1sj0Nd5wqAhR8IkytQg==
=3iSf
-----END PGP SIGNATURE-----

--CPn8Wy5ME997YUMW--
