Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web11.431.1601575848404074981
 for <tools@linux.kernel.org>;
 Thu, 01 Oct 2020 11:10:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=d0QrTsIy;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: broonie@kernel.org)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 5715020575;
	Thu,  1 Oct 2020 18:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601575847;
	bh=d+/JDypmEpL2WUZXD6yEwfZJZv+MxNuTmSvCARMxOAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d0QrTsIyZSlFw6fbSb/G+tL3niIM98DF1rPI+R63GpHe0v+J4WzadBcX3nQUV6rAU
	 doQiBNYH3CRnU5dpRArqZgO71vPlkMoE504fXu0QtSre2aN46XlF9GsXNs8Ip2+8UB
	 +IZtNlzU4VvuNqiwrfbmBwzjT7qN2scd0tUfhQuE=
Date: Thu, 1 Oct 2020 19:09:48 +0100
From: "Mark Brown" <broonie@kernel.org>
To: tools@linux.kernel.org, konstantin@linuxfoundation.org
Cc: =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Subject: Re: [tools] b4: UTF-8 in replies
Message-ID: <20201001180948.GU6715@sirena.org.uk>
References: <20201001171405.GA17873@qmqm.qmqm.pl>
 <20201001180541.poupp36rtajzkihs@chatter.i7.local>
MIME-Version: 1.0
In-Reply-To: <20201001180541.poupp36rtajzkihs@chatter.i7.local>
X-Cookie: Stay away from flying saucers today.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Groupsio-MsgNum: 210
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MOeiELSuYwpLEKvX"
Content-Disposition: inline

--MOeiELSuYwpLEKvX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 01, 2020 at 02:05:41PM -0400, Konstantin Ryabitsev wrote:
> On Thu, Oct 01, 2020 at 07:14:05PM +0200, Micha=C5=82 Miros=C5=82aw wrote:

> > The bug is that when generating the reply, script doesn't include MIME
> > headers but is using UTF-8 in the body (eg. when replying to an author
> > with non-US name, like me).

> Hm... is that causing you any problems? We make sure to set=20
> "Content-Transfer-Encoding: 8bit" in the headers, so unless you're using=
=20
> some extremely old SMTP software, UTF-8 in the body or headers shouldn't=
=20
> matter.

vger doesn't like 8 bit content in the headers.

--MOeiELSuYwpLEKvX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl92G2sACgkQJNaLcl1U
h9BAIgf9FogBXlxcgLKJNe1S864W9k5sLRbdW5IIwptiWXg9rH49GtJm1kuuolBs
olM/W6MTyNksGoTc6uA6Xf7H3Fe5uJK5jKd3MT4GRkNfKdXj10Wz8mVGn94TRqUK
liggcjNcP/1wvbAzlbOPNMU0FnA6mp62+/KkzJ1JctEQ7OUQAI7p77uskJYfB3Zg
QK9BVLIi/0k3X8CrPQoA+U77X9cjv0K5CirvyGe+RpQ585Km2wDqR5k6pcH3gM0Z
apHFbSVCFQ7/7jAFLXCX6xWaPbywuzya9URm6s5UBo3kx+HFlZwhjTrK5uwWgcBL
2WFtXe9aEmwBC//YxNGL4Y7TB6bb3Q==
=VfF9
-----END PGP SIGNATURE-----

--MOeiELSuYwpLEKvX--
