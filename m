Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web12.4733.1587397572663478379
 for <tools@linux.kernel.org>;
 Mon, 20 Apr 2020 08:46:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=blatgfdr;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: broonie@kernel.org)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 7A8382078E;
	Mon, 20 Apr 2020 15:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1587397572;
	bh=oXUnQjRXv4uh4KhrXH8wKK86aONhsgbCoWHB4gCDciI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=blatgfdr8fZ7TZHr4OCvO4YdfucQ8aTawdApa5nE8RthAS8p3gO5D1CvvJmhMBQ8p
	 ZxXPMLd9Rwyp9R90MIcTjWB0w/aB6YFP5LwmBz3onIe6HkXWBFf0SRERz7DRrkNtaL
	 IDETOR09hgvYyDDKtmC3Lzw1y/SnZdqHpMK93niw=
Date: Mon, 20 Apr 2020 16:46:09 +0100
From: "Mark Brown" <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 ty feature requests
Message-ID: <20200420154609.GF10045@sirena.org.uk>
References: <20200417154430.GG5315@sirena.org.uk>
 <20200417161424.y6nlcm6pbavikwch@chatter.i7.local>
 <20200417163939.GH5315@sirena.org.uk>
 <20200417165537.4xgdj537vw26fai6@chatter.i7.local>
 <20200417170904.GI5315@sirena.org.uk>
 <20200417190652.yur6z53naj7dlqwr@chatter.i7.local>
MIME-Version: 1.0
In-Reply-To: <20200417190652.yur6z53naj7dlqwr@chatter.i7.local>
X-Cookie: Hope is a waking dream.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Groupsio-MsgNum: 94
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dWYAkE0V1FpFQHQ3"
Content-Disposition: inline

--dWYAkE0V1FpFQHQ3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 17, 2020 at 03:06:52PM -0400, Konstantin Ryabitsev wrote:
> On Fri, Apr 17, 2020 at 06:09:04PM +0100, Mark Brown wrote:

> > One thing to watch out for is that you can name branches foo/bar without
> > them being remotes so just because there's a / that doesn't mean the
> > branch is a remote branch.

> I committed a change that should do the above (with proper precautions). =
=20
> Please try it out (see .example files for ${branch} and ${treename}=20
> usage examples).

This all seems to be working great, thanks!

--dWYAkE0V1FpFQHQ3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6dw8AACgkQJNaLcl1U
h9B+bAf+MBIsHMIPq93CwPZ7aQDnozuvS8Y7Hfu8jfb5sgdKfZ0tpFM2r6V9eado
WXWjB9Z0QvmVC3jjoBf0P9l8zsQUcm+JfcR8V7kz/+/hNo9l2Qnwa4u8ykdJFz0X
IBIuGXZFO4jdwVrnZN7HP11kRGf6Er8FETyZzblRqTP62g88Lh/eX9d81sZyHA72
TxKw+bNVg+WvurAYrbs4f347686QTtZAFXf6EjhlkVqCFpe2cZFvXpU47mZcjn/o
ReYIvkez9WIbf686xb+WwOHAeqV/sZD3SpbdiiGjhy+h7+Ek4D/h0O3WE0fFPMDJ
x/1RamSaAcAKKSOBs0tVE+cX4YwcjQ==
=VAaR
-----END PGP SIGNATURE-----

--dWYAkE0V1FpFQHQ3--
