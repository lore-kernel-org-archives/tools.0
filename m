Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web10.39217.1606155229346167468
 for <tools@linux.kernel.org>;
 Mon, 23 Nov 2020 10:13:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=qgWSCOyZ;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: broonie@kernel.org)
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net [92.233.91.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 51E0F204FD;
	Mon, 23 Nov 2020 18:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606155228;
	bh=IptAOXSpj1OvffiC5dgT5you5kx6ZP1wG1tvQ6wa+xw=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=qgWSCOyZD1xMH3C7fZb1xuSNfoq/rGpXV5ijXFRzV3IDaRwDUXTGT8nHfBXo/8Tib
	 c49QT3Qqbx7tnIirswGMsPxfrKk9gXIMXWFecI58mMussGKkgfiFXnNQt7kHDqwrSb
	 ijrPab5m24huT7jSFxM7V/J4jsn3zwzlqO+RZ/Ao=
Date: Mon, 23 Nov 2020 18:13:24 +0000
From: "Mark Brown" <broonie@kernel.org>
To: tools@linux.kernel.org, konstantin@linuxfoundation.org
Subject: Re: [tools] Exception with b4 am
Message-ID: <20201123181324.GO6322@sirena.org.uk>
References: <20201123124139.GB6322@sirena.org.uk>
 <20201123144920.qijmi23rxdibswtb@chatter.i7.local>
 <20201123165052.GH6322@sirena.org.uk>
 <20201123180101.wdlniyuswy75b4fe@chatter.i7.local>
MIME-Version: 1.0
In-Reply-To: <20201123180101.wdlniyuswy75b4fe@chatter.i7.local>
X-Cookie: Dry clean only.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Groupsio-MsgNum: 263
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6zipuvUKAEymKn2g"
Content-Disposition: inline

--6zipuvUKAEymKn2g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2020 at 01:01:01PM -0500, Konstantin Ryabitsev wrote:
> On Mon, Nov 23, 2020 at 04:50:52PM +0000, Mark Brown wrote:

> > That fixes the immediate issue but there's more issues with old Python
> > stuff:

> Thanks for testing it out again. I believe I have a better fix in place=
=20
> now, if you're willing to try it out one more time.

That seems to work, thanks!

--6zipuvUKAEymKn2g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+7+8MACgkQJNaLcl1U
h9CMUAf9Gfu02e45HkxER58FgRmDnPzCUDNoAvwuDXJMTtxJ3YMD7EsTW5BgxB7v
f7N/HkaytFpZMjIzUOZvErqaBQ5v04cwlDPwLG4/60IuqlQVPoqOHg8dqHeg7qUU
63tOTCM0vEJLdWor61z6lo/eH5dbiB6pMRBSRuxCNVQwljil+NvQjrPZJx2MF0tU
+mFTSkQ8GPDSMQHXygNyTojuIXk3Tj115QfiPEzbLD3zH5yYXzidv2iZbgpO2ZUA
GZDs9s/9nIhyLhcK6Ikx5XQ8wutjvMIQLKDARL3eATP97IckenIMn5KOQOHARmdd
qOtMWRrRVH0cTsZaOtpAIM1y5mQGGg==
=xq0e
-----END PGP SIGNATURE-----

--6zipuvUKAEymKn2g--
