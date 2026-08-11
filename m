Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2066335201C
	for <tools@linux.kernel.org>; Tue, 11 Aug 2026 21:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786484300; cv=none; b=G/90h4aUEq17SFo1LlODLsvzTlKzZE06JTi8JqmucJbOoaDmXvU43SB0v+KAVUldBw3hSGPpeqSSQQUM2dsjtRlPSni+hwMR2X6gyma07E2TRCf2S7xl6ZIvi4/Y8hngW/TCMtG6eE2xiDrkAfQwQFQU3o+JAuOKCcfqCM9U0gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786484300; c=relaxed/simple;
	bh=RmjAur7O58o1xzf/ufm/TqdudoHpzxb562nahvPk2Y8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FVNi2oCs431pWu4KykbEpL8UIKPhxlsCqdd0R1cIlnj9YvI22MkWK050z/TnmPnQiQ5iWVUCOkZcJAjdOa+ndm1MXsZl/Fec541dlN0UM3Ahjjr4pOY6n89TwnWpewVYSJ+58VE6Ao/10T1tzRUpcyvzfEyq22szMIhqO6NFJK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KnC6MnPa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KnC6MnPa"
Received: by smtp.kernel.org (Postfix)
	id BBD9C1F00A3A; Tue, 11 Aug 2026 21:38:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C3D31F000E9;
	Tue, 11 Aug 2026 21:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786484298;
	bh=v6dBvluHpGfEwYYQAhZXMfWC76OilD0KMmxlAxoedNo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KnC6MnPa7J8whA6mlfHTKyqW+CuVJ0LuxIoHn9hKQXMICymGSrAqqbtm0FzwrfIMl
	 IjGaEzxsT1b7h+AJFcevmQLBDzlHXQci/z+EZJjKrGMLzSmnfIC5AhvMi/PMeTEM0I
	 B/SN94Ie4WbXb9ciLUbd2z9uKyjt4d98PC3WCitH0cbtEoF1I7P4g/f/lsyXvbTWF6
	 t/l5ZvcoHN40RRW+4YTUDUaGFszpT81Re/uNLDnmgUBjfLs6WpPXrmcEyXrJnUCSVW
	 fMJrx/6tgarH9tS/oXTYL8+0rC6/tei+SdqHVHBecaOfPTbwkrXAQJcavXdSNYhcc5
	 d+rBqYu6gPoHA==
Date: Tue, 11 Aug 2026 22:38:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: b4 review misses a patch
Message-ID: <7b541824-f3f1-46cb-a50d-32bd88068c57@sirena.org.uk>
References: <8d7fc80b-e303-4f2c-9890-8408bd5d27ac@sirena.org.uk>
 <20260811-spicy-woodlouse-of-joy-7fa3fc@meerkat>
 <20260811-beluga-of-theoretical-engineering-5ca1a8@meerkat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HmZiswH1gfLGhsR+"
Content-Disposition: inline
In-Reply-To: <20260811-beluga-of-theoretical-engineering-5ca1a8@meerkat>
X-Cookie: Anything is possible, unless it's not.


--HmZiswH1gfLGhsR+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 04:13:12PM -0400, Konstantin Ryabitsev wrote:

> This landed in liblore, so you will need to run both git pull and git
> submodule update to see a fix for this.

Hrm, that doesn't seem to have worked.  I wasn't actually using
submodules, I had to run 'git submodule init' to even fetch them, I'm
invoking b4 with:

   uv --project ~/git/b4 run --extra tui b4=20

but even upgrading all the deps with uv doesn't persuade it to upgrade,
I think it needs a liblore release and a pyproject.toml update?

--HmZiswH1gfLGhsR+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp7lkYACgkQJNaLcl1U
h9AF1Af+PLizaZYtvH9Ip1rue0prnL5kpuNe5i+ChXy9WTRiGXDOVg/bAQyPIpSJ
bdyjIUse9BubjWAp0yIacIWsZaVmiDItzQgJP5DvKzdvfD96q+Gkm0lafrdJufIM
zErWqBV9xbJA8amteLCCQUbWderTXwjbQVtd9SBsUXgiSeWr/DfGr9GatLvQL/WP
Ds8hG1V9S6QwWQJDc/fNGmfQeWRE3+avNC7XlLnMB/ZE9avEKiTH3DjBmKGsjOpz
nfqBo891050r2tFkD79G1t6YIXXst6GK+02Vx4RYrFcvgLn2Tf+6rWZdTKi/ppzd
31x4sHmKPK9PIMIuUY9UQP8qCNGpJw==
=Wauu
-----END PGP SIGNATURE-----

--HmZiswH1gfLGhsR+--
