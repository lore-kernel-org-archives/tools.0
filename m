Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F20840DFCF
	for <tools@linux.kernel.org>; Tue, 10 Mar 2026 12:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773146985; cv=none; b=PpxZ9+rKG/YSw7NPo51ryD9Rbgw2S+6zeUpbPKlODrV2m7I5uJkOsSclhPI/rTRJaHJIS/0UkhD3X3UDZdnVLE+Ll4SOnq13Bx7fIgGsDleHaA102SrVZSifISG7+HcUsP8NAGSYxWmNXi1s3fqA+//rTfLrFf4rEzhUXsTdy50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773146985; c=relaxed/simple;
	bh=R9hzKiBa0oco7p533tyHNz6UeBH8AJmy85zr5B2O0b0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vAnC+SCWuGRdVutm0pIyEwk87NgkA7bo/MMKs9hT4I/Ml9x8nuaxl7o5esa/mfBvBmSDpHKSEjExLaBbvpFgt0RLDJANuDOAlTfVyODc3U0mXIEQP4+Qi0Bybsklh14ivt3hDBEr7CQjH9EGBc94eKgh1xzpJJDb4I7CtSfx3A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JcSs/wqV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JcSs/wqV"
Received: by smtp.kernel.org (Postfix)
	id C7DD1C2BCAF; Tue, 10 Mar 2026 12:49:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE8A4C2BC9E;
	Tue, 10 Mar 2026 12:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773146984;
	bh=R9hzKiBa0oco7p533tyHNz6UeBH8AJmy85zr5B2O0b0=;
	h=Date:From:To:Cc:Subject:From;
	b=JcSs/wqVdYduRKuocCHGk4vWpx9pc3qInuVUGDiZv/yD1dND3L6qPToGCW9rvOKcZ
	 kqL6ciQqeml6NOtF9GxEokqCCaar1Vh/mJABxJaO2uOQuFbnH2QrfL+7r9aj1h5vfO
	 5KCeme89bbpVqSKefvb8aLMk6dYutxLqm8bXjPv5dkK+a176OyVuoR7xFhtCTxIkUP
	 bUmPKrlNhnmyCe6ILitI08pTM5thspbbdFuLelqpiifiEbKFE5/JShusxG0PRYJBRa
	 48Sccsd4l3IswpQh1J5De+1nXjIjlxlz5zBP5TxM+9+/w7vIYpcx72xmLCRDVofhST
	 3m5tGTUspsUsg==
Date: Tue, 10 Mar 2026 12:49:41 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: b4 review handling when base can't be guessed
Message-ID: <092a612b-4fa1-4fa7-a872-b3564fcb3749@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p7vHVp7tAxPbvQLi"
Content-Disposition: inline
X-Cookie: A fool and his honey are soon parted.


--p7vHVp7tAxPbvQLi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

In b4 review tui if the base of a series can't be guessed then when
trying to review you get stopped on a screen saying "Attestation check"
and in the dialog "Base: not specified (a/b blobs match HEAD)".  It
would be really helpful to have a flow for specifying what HEAD to try
here other than quitting and doing a git checkout (which I hope works?).

Thanks,
Mark

--p7vHVp7tAxPbvQLi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmwE2QACgkQJNaLcl1U
h9CZ2wf9FjJrPropw1KUS/D5VNnQ9p42PXNiW1hQJo+EjNVMdzKhfHDiB+YXdCGh
gquqITUWdrbopWNMjSyTCvnlrC/FQmdp4SE7SWncDakiFkyNwR0rHp4QHgSwrRnM
/qwOliZSFU8660QFYsLnhvK7E3qzY8jXKqtg/I4aGwVL+FrG1iAtJ5+0HwgbC3Ee
50qSxuzHGHdG6Gm8kJ1iXbMM47mgY1vGP71/6ZEaDU6V3O3I6U4quPw/l+oWnLza
0ylLvQud9+OUB9uYquQzdpmExL1U6/pIjj66wxp+cKX5uV0nN0BDLa+0fv14R77f
YaFBMUl8ZcAkJxy5HvPSQbGAnCWeyQ==
=5ihK
-----END PGP SIGNATURE-----

--p7vHVp7tAxPbvQLi--
