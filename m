Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web12.12857.1594114733975222160
 for <tools@linux.kernel.org>;
 Tue, 07 Jul 2020 02:38:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=Q43Ry1dC;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: broonie@kernel.org)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 3437B2065F;
	Tue,  7 Jul 2020 09:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594114733;
	bh=Xklex26MImffiD4Fdha5Uv7QetiaTkPNN14O6ytdlWA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q43Ry1dCobNzL18hoQxEmbWD7yzmKpkrxU2Z9DvNxCtBRUFGcH6VcQFaskU+RqNSg
	 7bhXMGZVBMPNUphrkK/FbDmh2zMaH/RC6421Rlhj+pPIVpZ64Q4VV5M5uPiYk3fRZ5
	 asnHjw3/vb0IhRAjALS7ETL41cFXpFuZhSUK0jts=
Date: Tue, 7 Jul 2020 10:38:49 +0100
From: "Mark Brown" <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 picking the wrong message
Message-ID: <20200707093849.GB4870@sirena.org.uk>
References: <20200703185237.GA996@sirena.org.uk>
 <20200706221136.w7cduok4zjvpbbp2@chatter.i7.local>
MIME-Version: 1.0
In-Reply-To: <20200706221136.w7cduok4zjvpbbp2@chatter.i7.local>
X-Cookie: I hate dying.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Groupsio-MsgNum: 184
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LpQ9ahxlCli8rRTG"
Content-Disposition: inline

--LpQ9ahxlCli8rRTG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 06, 2020 at 06:11:36PM -0400, Konstantin Ryabitsev wrote:

> That's the culprit -- we look for a standalone word "PATCH" inside the=20
> brackets, so if it's mangled as [PATCHv4], then we don't consider that=20
> message. I added logic to master/stable-0.5.y to deal with that case.

That worked, thanks!

--LpQ9ahxlCli8rRTG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8EQqgACgkQJNaLcl1U
h9CkQQgAgW1ONhZcjLRnMXRCUz9MOvAogda4RKodpbx/+gg4ws96dCatg8OG5C31
QKIMZyzBnAq1noMaTgiSoW/XW6lFw2V1WlyqQHL1xBIkYQT/LSdZ962kgiIKt9pZ
4R5n25W9exD2qSRWp84xVQBhC+jcMc4MbOmHzWuElngOsJqhUY59F8mhhFoAOkSq
I4NA3z0NHlJbep0k32U0vncRSjUxw+94dKW0fGnUatzTwuzPgZjAfI2+C3nnzdST
94H4fiDiuPp4yEJHnLN5CWCz7B30tN9i9ALLE5uiJyiyNGEBMpXaN9JsScAtWTyi
Nf4pEzrsOvvS/nlQjuIxe4kCDoEhCQ==
=HiqU
-----END PGP SIGNATURE-----

--LpQ9ahxlCli8rRTG--
