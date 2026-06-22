Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BD03546DF
	for <tools@linux.kernel.org>; Mon, 22 Jun 2026 11:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782126196; cv=none; b=rFrAP7nk8HiKBqZIGd/ChjvAGqbs6fp3DmdAXBrcelREA6SP3dym2rqmwgxeoz+6kv6APxjVvUtuX+CQvaMItLoS1OxUea027XQZdYvsRwfnMx6ILSB82Ml0u39NhWhSoONnsva9SvEolstU3dPr6RtyO93uBtSq5Nee22E1xYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782126196; c=relaxed/simple;
	bh=MLMuFX8w0rrOAaDP+6BJcPN/vmt0p+qgR4aaBM6LRVk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CF2LSLNvQZsW9omSeDOdFHagbEJUIlVXrnwY0AQrisuMi4TOFWxvnQ8VeVvXzWX2iqL24c2SMmmr/T4hrYmn8uOBS4e9lFaLvKHNyH3xsX54oSS4Uzqyia6ih9x/RLLDo9HHX58qh5F8vvuR4Uvo/7+30OntGAg2KQmm1lWd/wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CBnjF7Rw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CBnjF7Rw"
Received: by smtp.kernel.org (Postfix)
	id 00A4E1F00A3A; Mon, 22 Jun 2026 11:03:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 431331F000E9;
	Mon, 22 Jun 2026 11:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782126194;
	bh=Iev1oAIEv7FkBfABkw27Skrsl1IZhQdtvgD15i2VszA=;
	h=Date:From:To:Cc:Subject;
	b=CBnjF7RwuKvPQucOvDKglk2oyVWcKQvrD5QcmTTPTRbzPeAisySLUecFB0mfNThNw
	 aPjvLNswZA4ocCaVsrr4N/ywwHFPBT4uyLQB24gzqeQoG+CGHdoWJ+uhEu+0hWFT9l
	 8/2dyH5JhyF+ydtdEDp4wPPQc4S56mfvxwLaO3gbaktEvCLWMwnlrHXaiXyqGIqYQ1
	 MhcOJhAzTstfFIVbdLkKqHu1pr3WsntKAcFbMYcELI5c26KG0XVFaMu3sFPVQbGzEN
	 CcXA3Phb3D4GTXQLv14ZJFf6rXQj5ESxmh4CLIin+ansXl0dSuU5Mr63QVAFfhSzkv
	 SBeR67GPoilIw==
Date: Mon, 22 Jun 2026 12:03:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: b4 review fails to notice already tracked series
Message-ID: <01bb36c4-9ef1-45f8-9b05-f3ae33e84229@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Vz19oMNh4XAdlo2Y"
Content-Disposition: inline
X-Cookie: Vanilla wafer.


--Vz19oMNh4XAdlo2Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

If I have v2 of:

   https://lore.kernel.org/r/20260621140001.63829-1-bjuraszewski@gmail.com

tracked already but try to track the above v3 then b4 will happily
record this as a new series, it won't identify it as a new version of
the existing series.  However, if I go to the already tracked v2 in the
UI the new version will be detected and offered as an upgrade option.  I
would expect the already tracked series logic to kick in and stop the
tracking of the new version.

Thanks,
Mark

--Vz19oMNh4XAdlo2Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmo5Fm4ACgkQJNaLcl1U
h9AgKwf/Qw6hXo/hQUwDLxxRtxIGpbCUtz5XIxf3ExDp+GVLCF3YQd1hX4Z2Ioln
ElmflIj5cTe8uZfau5D/ktYgkFPPd7lulAwi8Ce+5OFpD4JqX9wyvNw1IwMe94AX
Da9vINxBSzRvILBxIpbAO7OdH/1U48Xqnu7wreLsNfFe6T4fihhyNOzwPtWeJaxo
b1+bpmPfYWaKA7DLIiAZPzRlRyIyG08hpDZknLe91/Qo+K0bxPlDOU1nlGDHXyFC
1+reMffyyCbpOhBXOfvlZ8OFi5XQNKHcNybibfjrEUa7o9IsbnY7z0md/PIuUqm0
voLs5+LKKbgpdbeJGdYlcg3XDqwIOg==
=i4ej
-----END PGP SIGNATURE-----

--Vz19oMNh4XAdlo2Y--
