Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09F03CEB83
	for <tools@linux.kernel.org>; Thu,  1 Oct 2026 11:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790854265; cv=none; b=FQzZ7VSV9W4zS/G5conqvX/hvW3qV1R7vSEAenka+x6+6orSjO+nxlTq51BNQ+rIMtU2IzFkOzzapk+3Y9G/HdPRRUo4+iaiF6nDs/2whspQ+Moq7C/kwE3cScCCHWvbWgPhTLNN09ljpHheMIaOnPQLOU3Al/ZS8JGzT7SZzv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790854265; c=relaxed/simple;
	bh=Vh7tLa7OM/xyAoep8/KpiBP6f1uUXPaOCRTRGvpJcGk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E3JL5XU9wf4bsU8poBvHeCLcB5HJOlb8cwnEQgHQZGZuMK0dlqUv41g0Z9dssA+Vui9oC4MBFQNKlWIlNqiIlM/A6w7IemhHw4dFKDegl35GkI8GZ7jxHuLobkRPFmEX8iTgAulB0DoGqkDrlNTBoMMsGOj2UthxW1gkSv/zTHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VuMtUoJn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VuMtUoJn"
Received: by smtp.kernel.org (Postfix)
	id 3DDC61F00898; Thu,  1 Oct 2026 11:30:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 758791F00899;
	Thu,  1 Oct 2026 11:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790854257;
	bh=ZaazqkWCcoE/4W0TVXf+JDYKObtcVApGoH+T588QpZc=;
	h=Date:From:To:Cc:Subject;
	b=VuMtUoJnpDfL5sNNwnirYb2n2QkbJDZgd6vw3gPWHE70XxgcBNn6MjXO3gdLzMdT8
	 i9Zm2tZQw+1ayQa04gmnpNZhO3FLmqfr+ET7Xis8i/1WAnGeCD2EEhE6reSFXEeIfV
	 cTW8VD9b0krMqcL4HaFEsPmdFOvGg+CL/ctd42+gbJOFZgJhv1C5aE5h/77hUZUE4M
	 GARqUVPTUqmWkJVMyjlPrr85JYviE1YksdAv9kdqKClcyMm4jAsTl8BLT4osmX69iu
	 SISALIcXxaKRYPmGgsvplw3dp8ptpY0pwYzrxCCHQrxh3B4PjMcw1hhdbpDXpefEfq
	 RWxvlnjRwSBxQ==
Date: Thu, 1 Oct 2026 12:30:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: b4 series tracking - one thread two serieses
Message-ID: <92ffae6e-2c12-4622-9482-35b76f3fa0bd@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6mDwVBFcjcoPks2e"
Content-Disposition: inline
X-Cookie: Double!


--6mDwVBFcjcoPks2e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Fun case for b4's series identification and tracking:

   https://lore.kernel.org/r/20261001024049.93-1-shenghao-ding@ti.com
   https://lore.kernel.org/r/20261001024049.93-2-shenghao-ding@ti.com

are threaded together but not a series.  b4 seems to think they are
different revisions of one series, and with b4 review I can't see a way
to break them apart other than to deal with one, forget it and then deal
with the other.

Thanks,
Mark

--6mDwVBFcjcoPks2e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq+RG0ACgkQJNaLcl1U
h9CmDQf/WW97Hhd0UCEfCji2nT2yT98QT+1Q7f1UqRYXE/c1Xhki6xYV+qnhzlyZ
FVkOX/HBOFGmIZPreGIGS3fKAc/pFniK7bhpW8ZK8P2rxlybng23zWd7llJEB14i
RCZaywEvl5u5Gw6ZPwue6ooa3++yxvDkZ3MPs3i6eRbD5lgFGHtbmQD9Dp87ysn9
DvxbWWJwvvJA0sSvtgApcq3I0ZjzoN7THmaupwUaeHGDI/nPQkhdVkY1Cmk89Eh8
hVaHtoxBFXO1dPcRuIjSAwr2CyceAB6nOCzlP7Pok6pFbb33FSKuJq2ALMcOprbJ
nxjvLy2F1JEEIOl5eqES5hyDwmv88A==
=Q2mr
-----END PGP SIGNATURE-----

--6mDwVBFcjcoPks2e--
