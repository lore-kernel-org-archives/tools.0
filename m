Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3138738C
	for <tools@linux.kernel.org>; Sun, 21 Apr 2024 00:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713660462; cv=none; b=Rh+axbmnfHaigsStAqmFi62h8Hv6xcBIBpjpNbAikHUtt9TQMHW4dBxlLA9ZwSeWrfJnWZIVT3ylCOtH+m5rjmzWFrBVP12naMsdzARWPHWIhTn9JSbLoSD3kLQ8p8TJOYjAZixF8FBQx7Hh20ZBnGQwFl+y50Di7p6LLvfYAm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713660462; c=relaxed/simple;
	bh=kPOIG4VgFdqGouI0wIenwIq5m1hIcPXBHideQ6azWIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xl38b5U0EGA2l+jJ46ViqQI9MX9C1gzohidFzsW8iT+01JAAYeDFC/6dKu/qAHRt2pJeuPjw7ZaWDBurv7g0hT8ZSE5cJypuv+TqD5fYKO3H2hYTCu5w0JC9cm3vjao4axhexImQjYXSg/Taqp/vXDhb56Q9TVzP1D9EK1b62Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sGDRXab+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sGDRXab+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32BAEC072AA;
	Sun, 21 Apr 2024 00:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713660461;
	bh=kPOIG4VgFdqGouI0wIenwIq5m1hIcPXBHideQ6azWIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sGDRXab+kSoWzYFS4uWGwY1a8mgEqq+x7rXA2slTP8Jyjzfm/dEwW64JqhTJQUhQz
	 QlLOC66p85YYjSHxVJ3kSGuroEbbpc0MrXD3wjq2E8jHV7mk43u+PO5po6bZPa4ebb
	 sBNETVxnACwTtsLvxJFjjYcafR7QaNY1I6jmMo+QtDt89cWBJhoeoZb51dgLqpH585
	 DXdPowuBqcuTg/72ICrbDb1uLwLDdoIqDAIXLtsu2EVoTN6/CnXd9NchCAmOKRQXry
	 QUiMMXrsflZnNDESyAoguPIMc8wk0Xlm//AfN7g7Tou4JJkUJEH9GQtPbgcrU0BNDf
	 g8kt4XSPKd6QA==
Date: Sun, 21 Apr 2024 09:47:39 +0900
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: Checks for recipients
Message-ID: <ZiRiK4sB6kKwdH7p@finisterre.sirena.org.uk>
References: <ZhQ8DoS1GaT0603l@sirena.org.uk>
 <CAMwyc-Q466R2za0sMTD9Chx77hL7xBBuNROokemLmp7dt=i10w@mail.gmail.com>
 <ZiPBx36go0AYBWO7@finisterre.sirena.org.uk>
 <20240420-arboreal-natural-sambar-ff61bc@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JnVzFI21HcMc0ep7"
Content-Disposition: inline
In-Reply-To: <20240420-arboreal-natural-sambar-ff61bc@lemur>
X-Cookie: TANSTAAFL


--JnVzFI21HcMc0ep7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 20, 2024 at 12:29:48PM -0400, Konstantin Ryabitsev wrote:

> Thanks for your feedback. I'll make these two changes next:

> - add a check/report for "needs-recipients" that will be separate from=20
>   "needs-auto-to-cc"
> - add a way to turn off pre-flight checks via b4.prep-pre-flight-checks=
=20
>   =3D off

Thanks - that sounds good.  Perhaps for the pre-flight checks list a
pass/block list mechanism might be good so that people can pick which
checks work well for them in their workflow?

--JnVzFI21HcMc0ep7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmYkYigACgkQJNaLcl1U
h9BZEQf/cfU5gif4CQTxPpM7XGIT0+VDB46DR68iHzns9Y+mnzsK1OLC6Pv7dotG
29yGj7oRQ9dxpebxXPSfs02c5uo59v3lBPbBzjI4YgnAlONruwB9MfmPq5XFq4cI
lb5OfFgJl+UZ5+gLlWE8Dt7GYOyDfOXzqarfZfvSsYeMPXE3nOqAqto2K8E7JYOm
zV5uXafxWhdbrZRa1fF1ixg+RZpxDbLp72OgPO3Cz6pd6UAzhtNWHWJgRH+ZJNqw
vRHI4mhQFzc26DFEqrkf6g8Dhy6SPt04ML+zSnnidYGXjqTj5fnE38CZ0QS6mm9k
RDulSQbnYMQI2wdlpYHae9hO831P5Q==
=11V3
-----END PGP SIGNATURE-----

--JnVzFI21HcMc0ep7--
