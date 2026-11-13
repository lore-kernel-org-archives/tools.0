Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530458;
	b=BauQM43mGHfbdMj/k0VGlnQuW+bxLZmz+tl/p3XEPDS16nwEcGnc5I6soORm6V2nkjCu
	 MqpQ+yuKiGcrD13KAPT/Oeq3/dn8ia4YjSx4roQzqf9kmQq94bvNFZo49UtcLZ3f203s+
	 wFN07av8ePbkuR10ilMAbEwg59imR1Dw+T9MVCjlj89PYAmP3szN1XPKzeatg8I5aBUUQ
	 mC0B7+Lxp7diJOODjjWvK8MGn7BDf/rivZbwSKzovZSZZpXvJxqhHeXvHuKzP9hXEazkh
	 KrUCBN0Nlou6J5LjLOC1t2JMZmGqzmAEtALpaiCtAKq63jEXhTTPgUjQ3IqPNehz6nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530458;
	h=Received:Delivered-To:Received:DKIM-Signature:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Cookie;
	bh=OdQmL9GG1pZdyLgOh+Ovm2lOt90L02I06Ma5itPW7ss=;
	b=zEkuPoFmqU3hs4frT6z/qH9pX3RvrHBHNVyGIasstHSzt0Aw1eQcrhuCFsziPFucdpax
	 PGMJV5mD86MSoYHTX103+UVt+8ozbaU15fX75zhwS55ormCIFwEFY7K66jBlxCH3kpB2M
	 LVdw4JjsxQ3QLxcdaRbunLMBzeX0cqHJwgN0ImvAdbk0khFZqYSuLfPE6cx1OvcPoIkwL
	 nL4WUzqAqdvTA0eSgDdaciWvCY3+80q5ic+gzEoXfN/u0pN3gNisT2FlwU7AplGe1nJ4/
	 3EcR6W6EXt7BXyd63xmQRLeZ1hfGfOspQvvf+A249ErFfd75tlZDJ41TUvyXB/ODqow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fVzJ3fgL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA41606A8A4
	for <tools@linux.kernel.org>; Fri, 13 Nov 2026 00:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fVzJ3fgL
Received: by smtp.kernel.org (Postfix)
	id 601711F000C6; Fri, 13 Nov 2026 00:40:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22F2B1F000C4;
	Fri, 13 Nov 2026 00:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794530458;
	bh=OdQmL9GG1pZdyLgOh+Ovm2lOt90L02I06Ma5itPW7ss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fVzJ3fgLqrLN3izEkDBxPzaDsHIbnPglUogXWN1n5cDKpynOL5wKLh8SpvfuWlCCE
	 RgBs3goWLb7H+fPMPalLc+W5TUC98ZxNDClfgF3AoqDMkK7rcDb+Xj00d4HbLcN7sJ
	 zPayeSBuAFJFNytmJfq2gou4FHyySVoFjaR/L1vlR21z4e9x/wum7Y2kbAkGubpZmE
	 h1wrkqgQHfowektqcv+dQltKX4gaIqUQiPsGpJ8qDRZgS7Lb2xvPmadVPIbTbSD4xs
	 9DJbgIlM4NNoauxb/QvaKlJqead35yyPvveSxfZrtCiodaw/CVHBrvTb37Z8al7l0A
	 f4rS7hLrBjsVQ==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 478D73187937; Fri, 13 Nov 2026 00:40:53 +0000 (GMT)
Date: Fri, 13 Nov 2026 00:40:53 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: b4 review hangs on failed patatt signatures
Message-ID: <4935ff1a-0a6b-48e2-9bbb-5d5c521d1a76@sirena.org.uk>
References: <1a5ecca2-9e58-41de-947c-5600604dcc89@sirena.org.uk>
 <20261112-vivacious-oyster-of-stamina-254a6c@toolbx>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="otjqVC5aPPcEP20e"
Content-Disposition: inline
In-Reply-To: <20261112-vivacious-oyster-of-stamina-254a6c@toolbx>
X-Cookie: Whoever dies with the most toys wins.


--otjqVC5aPPcEP20e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 12, 2026 at 03:52:05PM -0500, Konstantin Ryabitsev wrote:

> This sounds like a bug we fixed in patatt 0.8.0. Can you check which patatt
> version your b4 is actually using?

>   python3 -c 'import patatt; print(patatt.__version__)'

__VERSION__

> (run it with the same python that runs b4). We currently accept 0.7.x as well,
> since there are no incompatibilities between the two, but that's the version
> that has the hang.

> If you have 0.7.x, update your venv to pull in the latest released version.

> If you're already on 0.8.0 or later, then it's something else.

Assuming I found the right venv (I'm using uv rather than doing it
myself) it's 0.8.0.

--otjqVC5aPPcEP20e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCavZcjQAKCRAv73Ows9A4
iQ6tAPwPJRoCDyiUurrnzzyV49LXl4rjDN4BcoFEf8H9WEMrCQD/ekSKCFXyFyG0
0I4noKP5V2huYPfBV5bp/oJoZZvwUQc=
=qCp9
-----END PGP SIGNATURE-----

--otjqVC5aPPcEP20e--
