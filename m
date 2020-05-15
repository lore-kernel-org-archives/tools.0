Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web10.21206.1589570911115629938
 for <tools@linux.kernel.org>;
 Fri, 15 May 2020 12:28:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=zHO/6ClQ;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: broonie@kernel.org)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 44A352070A;
	Fri, 15 May 2020 19:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589570910;
	bh=KEQf9G6bDuBszYfXYHhHFAAj0vSGhbIp4Vod1gbVsS4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zHO/6ClQondL3q+lcXTcSCFVOkP9hug8XaObSmFshKsRyfztABo5hNKbrKgK6Bo9/
	 3SWSGTB1ieSFhMClCpcqsf1tn+kWc1eTzUkhjhkN0AZpJ2njnhctXtrI9BvabZ2/70
	 Vc96EPm/roXsI8EhDQp+7DKA4mk6HHVPdJa5hHBg=
Date: Fri, 15 May 2020 20:28:28 +0100
From: "Mark Brown" <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 ty issues matching remote branches
Message-ID: <20200515192828.GS5066@sirena.org.uk>
References: <20200515180542.GM5066@sirena.org.uk>
 <20200515183123.ya7z53275szbn5xz@chatter.i7.local>
MIME-Version: 1.0
In-Reply-To: <20200515183123.ya7z53275szbn5xz@chatter.i7.local>
X-Cookie: Avoid contact with eyes.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Groupsio-MsgNum: 164
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qjXtncIm5b3tWrFJ"
Content-Disposition: inline

--qjXtncIm5b3tWrFJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2020 at 02:31:23PM -0400, Konstantin Ryabitsev wrote:

> I think I was trying too hard. I've committed a small fix to current=20
> master -- that should relax our sanity-checking logic.

That works, thanks!

--qjXtncIm5b3tWrFJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6+7VsACgkQJNaLcl1U
h9D2GQf+J4XBmvN54P8wfyrtkCnycz0flEYbZBHnHZO/tFyu8XIL7IqvdFenvLZW
K8Dl50TShe5G2wKCxqIsQRC+mVNPJT+EmXOCBXj0DOhDBiAH1OHPeFC6wPkBlVZS
WrEgeflP2KYO7bLIjTlZCoGX1vZINrd7Hbgv8Jgx8kaEgNovAzHo3R7VuA+3OuBj
e4ZeHL4I4qM27S2XVjzY6N9pSQSEd4QgB94Yz2NCnmDmXz7EWDwCIFoISZ5AACEn
2V4AcQ+RfJpK+O6AaIr5guPDUnbiKOp33PdJmqomBJXiOhxX1IreHrpVTQuMcg/t
N4jn147BvtXBxAW07r7Jigp6DQjclQ==
=7086
-----END PGP SIGNATURE-----

--qjXtncIm5b3tWrFJ--
