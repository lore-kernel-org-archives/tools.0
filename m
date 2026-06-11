Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8234D2EC5
	for <tools@linux.kernel.org>; Thu, 11 Jun 2026 17:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781200262; cv=none; b=k8Qpm2vX3KV4KEGvv/nZV4PUvVKMnqWbwGLV48drL7acjUc5rhtop5hYbKA20aD1EYCnDMCRjgRGCngtPFTeQfOIVRMWYizKCNphKlcoz03jXoLLVHePrV2LQNsAOCTD+IYCpzb6zpfWDm6gz5gjQpjU45B27uELwBoxf7w53ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781200262; c=relaxed/simple;
	bh=l1RbLG+Mz/C1DgVrE6RTOXyC8LLp2zRmgl+28kIHlpA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JKUDc2QJbP6gqgJ6Cb5mOe/qOBs4u/rCU11w9d3hJm2t7Zzx0yhZDeamolPqJZqYPGQnlcbeaN8V3DZs1JWXzUDcAbTOEjTnSzDGnE4weurADtcrLwS9DzyAD1QKy3C2TgnPGr4viHkt0f7fsaJfmI1IJcHL/8+xr3UW9vmbGwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=etEc8gLq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="etEc8gLq"
Received: by smtp.kernel.org (Postfix)
	id A19511F0089C; Thu, 11 Jun 2026 17:50:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 447571F00898;
	Thu, 11 Jun 2026 17:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781200259;
	bh=nqc+xfyUaEo2hYbst4a0N0x7ADUHyJ4qWpAiqARpK9c=;
	h=Date:From:To:Cc:Subject;
	b=etEc8gLqDuNAe2IfzuA3X4Itvj4GFk/PIc3Z3KZm4nyM40eo3+hz/BpUAMm9+B2JZ
	 2UgKMLsWi1GgBIHFqswGwOI5XjnHF2qmwsY6T0G9eCoDJBMos/MU2iHhK8UMOg/nxs
	 5BQLMrojjsXKSnDBvyZdzHfegH+Dr0L8hutHlz5g5WA24RPyIYUKiTyulq7mIjtOR1
	 UwVFFGU4FyAwfNLcmP4rzvAe7qVQjjLU3OxlTkeIhM/eXV17iHpU8ysiU4Kvw39riM
	 wWNZylM2fSKfN+JA8u1X2xu7u/9BydEn6wsap6tKESmLfc/O9FrvCpcAZ8EAODK0M7
	 rGy9VDii45K8A==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 660C71AC56C9; Thu, 11 Jun 2026 18:50:49 +0100 (BST)
Date: Thu, 11 Jun 2026 18:50:49 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: b4 review update issue with bad connectivity
Message-ID: <air1edZVrBclly3H@sirena.co.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7VP0KVeSvoS2bCN/"
Content-Disposition: inline
X-Cookie: Leave no stone unturned.


--7VP0KVeSvoS2bCN/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Konstantin,

When operating with poor connectivity I'm finding that b4 review's
update functionality can just go off into space non-interruptably for
very extended periods of time.  It should be possible to cancel network
operations to get back to doing local only operations, at the minute I
find myself killing b4.

Thanks,
Mark

--7VP0KVeSvoS2bCN/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoq9XYACgkQJNaLcl1U
h9Dz8Qf/XL7dvkSQIUEBH76tZgjT4QvP9CX+yHgh/qdq3nEoe3mbOHarSKL7HBCu
YclylenciKAnyMGTRT/zBO2iyRmUex4anXcEio0RqJ+uq73Q5g7InI9592TVjoxB
sJBb0UlpOgvHhGcNKPL0BXjmMlqeRWT67yIORTEi7cfE/9wtDoM2v40OLnDT393+
PM/vEESYS+0NcXNqfn1HFsXMfo2JojXME4+/ekXfSGA1zpzAFPbHXuvl2qRkXZay
tAX3W6gbv50jEWyhv4FLCnYYaayrNU+TJthJNPRSiCCzj5U9qVESDOK3jx8CjM+L
yS5liysHTQDGmSIO4F7NoFOgXLtqxg==
=9rh1
-----END PGP SIGNATURE-----

--7VP0KVeSvoS2bCN/--
