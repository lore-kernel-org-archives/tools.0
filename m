Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC9A42A796
	for <tools@linux.kernel.org>; Mon, 13 Jul 2026 13:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783949978; cv=none; b=gLJ1hHsSFePnU2DusDeSZtaWe5mn9uGfTlZUuJnViFv4Snbb13rKpJQcY59H3ouTHJ2rXpUtdBxGEFgmkqiOvg6T1C+xc7t7el6L+nf74EgPM2tsIXQeFyqXiZXVtmwU6OHMX0Xv7AKhobn93p2Mk9Kk3OfLFM4CqwyfUEVUsA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783949978; c=relaxed/simple;
	bh=xGZIGXg2Uj+QTxrftBHoGeoqliQycM/FBDQA37OZ9aU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ThXMkWbdX79BnOXY6cT5Ssqfe8dXLqp5GhELypL/CuXBLMhGskJOfAeDVLCk9eZnPLWlYXb08g9NjMx8I+w0gShVql7Lo/tPx1qJ12rNoYF/J8K1H9LQD8wY4dxn9mQDfJIGvVJWKcDVK9BRJnpzZZvIyegActBLYkLcVNKDkkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AmI/JA4B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AmI/JA4B"
Received: by smtp.kernel.org (Postfix)
	id A700F1F00A3A; Mon, 13 Jul 2026 13:39:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E30A51F000E9;
	Mon, 13 Jul 2026 13:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783949977;
	bh=fFh1y+W0GK7Eqr9oAxz3E25zy0zsx+MpdBQoSPBZIFo=;
	h=Date:From:To:Cc:Subject;
	b=AmI/JA4B6Ou5XdAIOu5+7BhgLgLiGDNNaimVRa+jPnkRnnX7ahM/zqyCV6DiDMums
	 OV+e5o1pOJu4xc/tBVMmjp7XIOjfMICYvlleCqw5WXh4wAFzKC4Q73R7RF9GvZgmLh
	 Bf0JfVKOALTaawLuGYQTjO4m7cY7AhybhAfMXrnD6/TiYyLmv8b6soG/iE6zDVb8gu
	 YEHQT3SLzOBqAF8RHpwnvl82Bxx4k1m+uevbr6sI6B0nVgWxblzMpJo/51GsAQwUCX
	 BX5wcx0NdZCmubGU+qPU+7/c2afBOj1xdZ7nUY2Z3WLmUe9EFDOUMqDNzNfes0lyrc
	 tN6pS8NH8Kqpg==
Date: Mon, 13 Jul 2026 14:39:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: b4 review animates scrolling slowly
Message-ID: <985fb687-8990-4112-9e65-3701d35c71b9@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dTmHnS2KxglWMP4d"
Content-Disposition: inline
X-Cookie: Courage is grace under pressure.


--dTmHnS2KxglWMP4d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Konstantin,

When moving to the next review comment with , and . b4 animates the
scroll at a fairly slow rate.  When the patch is large and the review
comments spaced widely apart this can become rather tedious to watch,
taking at least tens of seconds at times.

Thanks,
Mark

--dTmHnS2KxglWMP4d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpU6pUACgkQJNaLcl1U
h9A8dQf+NUWYaV1hl8cbsYVEj0dXXl3gvtnawMXNaSizSUAZkI5cNIm+8Fb/cutb
TLfTdhCViCG7g28dmL5ZctmgNyWu8vFezVJOd/E+8UCxM0FypS9gKYVApW2j/Gjs
7Cp4BHkY//Abg7mP95I7hUeSJ1lAaivouKCtkwJbDs95QwU6831sTBAni8IrfRQM
bNtUIeB+3Xmpmm/shgofkJUQdk2xajFPqEVrfGp2A1wrb2pq5OOW3xaUMzKXVYU7
xij2lQcKuZFaQ1h1i14zkryvhfpmTmnMVfbJGCZbcQzeHhBiSSFrs69iDvVktF7M
eUXwTL4EZvzT0rw+70fgME21Zu95Og==
=METz
-----END PGP SIGNATURE-----

--dTmHnS2KxglWMP4d--
