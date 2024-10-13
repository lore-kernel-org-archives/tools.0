Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDA51DA32
	for <tools@linux.kernel.org>; Sun, 13 Oct 2024 10:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728815724; cv=none; b=AopT0Gc0ywWQgh0RMRX6+hO84GkSg9J/XnxthVAHeW+dJxf8LwexAVNTi3jVmrToWMalI0EDLtnPp1qbkw2ubYXWQG822NT+DZD0954nJJLqJ3HUyejCdwORGZkuoq5jbzDa2g0ypnh/1oVKFvWWzwkaHaHnC7IPhaOkE2x1vd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728815724; c=relaxed/simple;
	bh=tWczGqLkExiOVHt7YhItn4yj9/Cjr5zvvKOfoTZKCGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W55AUPqovbvGyLTE32r2i3nksV0tHio/RkijGhBLTv3xwRlvIM1Qpt1O2Zhsd72M17G6XrZgcgUU1MGXlVEXH15WE9qcUuk3l1WwGTSLN0VPYY4NnY1OOgaB6qvKt2ArKAjkZVhFpxnbtFkgLz3trQT3yKUyTD5Poo2YlsKrp4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cDe80Grs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cDe80Grs"
Received: by smtp.kernel.org (Postfix)
	id 2F514C4CECE; Sun, 13 Oct 2024 10:35:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B509EC4CEC5;
	Sun, 13 Oct 2024 10:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728815724;
	bh=tWczGqLkExiOVHt7YhItn4yj9/Cjr5zvvKOfoTZKCGQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cDe80GrsXuX6O0neBqH1+i39DyB60KnqqrmC/Ge5braKYU9geszMOKCLRaBpp4ooU
	 ExpfCYfwPHixdy9h1ikKicFLK3QO6BQFCoogp1MQyTPCsW+IpzlB3R8KvNaEUki7+C
	 7yaAoHlwBp/zWN1mBMqQXZyfpangx/kdMUxOSyBQ/Zf5yWYcAZtSLSeiIy9DHwRIiF
	 s4fSLEGk3Qp3HTaYWgCrJYKL/rXXYTRy5y+H6lzZzDSUSSMbRDJYAZC8/KFbpcX7rN
	 2NSh/aCBJLmelu+WyOSACocKCDMdhmO+m8q/ZBgecp1LA55EGTwffGpstebhav5pqG
	 dIkR4pYV459ow==
Date: Sun, 13 Oct 2024 11:35:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Jonas Gorski <jonas.gorski@gmail.com>
Cc: tools@kernel.org
Subject: Re: b4: adding/updating individual patch changelogs?
Message-ID: <ZwuiaKj1pgjZ3-sR@finisterre.sirena.org.uk>
References: <CAOiHx=nHXJLVM2ZfDGEi+VDYPhVuoZdpYhLTQwAGLgUiVmZvpw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8+zyONQWydJtyhFX"
Content-Disposition: inline
In-Reply-To: <CAOiHx=nHXJLVM2ZfDGEi+VDYPhVuoZdpYhLTQwAGLgUiVmZvpw@mail.gmail.com>
X-Cookie: Editing is a rewording activity.


--8+zyONQWydJtyhFX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Oct 13, 2024 at 11:28:56AM +0200, Jonas Gorski wrote:

> is there a way to add/update changelogs to each patch of a series?
> prep does it automatically for the cover letter, but I find no option
> for the individual commits themselves, or it even mentioned in the
> docs. Ideally something where b4 automatically updates the changelog
> (templates), but I'll take anything that does not require manually
> editing the generated patches themselves every time.

If you add a --- and text at the bottom of your changelog in git then b4
will (or did last time I needed this) just reproduce that in mail that
it sends.

--8+zyONQWydJtyhFX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcLol4ACgkQJNaLcl1U
h9AJOAf/dC9yUrZm6nTHvgawQyoiXCPJaLn2M+k9CA+QByZhWgXgPgvyb8OHGGs/
lwYTda2UrTtTVwVRLarDtEHhdYnQyzFOV+n1tZ+Sz1aLOe7AQRnGAFXhIW0psIHo
5edxFRitkjP0qpPaTHd5WLsYW0gcOJQ18Taxmi4mV1kH+qwq31s48mzfr4hWttEB
D/eYd8YWFyWEM1ezZwX9NwSy6WL4o2oqKfWax7bKoo2uoGlhfmBV4IrWcdozL0/5
ePmRECuI4ea5Chrf9tE1ko4zm9qBr0leExc8WyIyZCFMyi8J+DI+KtWhVMuq90/S
e832Hmhneq3hnGOUr7hf2bkEj7+hEQ==
=PfNq
-----END PGP SIGNATURE-----

--8+zyONQWydJtyhFX--
