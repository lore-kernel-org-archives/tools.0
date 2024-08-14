Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C069D2E3E5
	for <tools@linux.kernel.org>; Wed, 14 Aug 2024 17:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723655215; cv=none; b=Ko/5gHe+f+xQEhc6Tx/dRqSbKCkbGv0qJij9jVsbH7ZuRzg3n4Hx2r/kWCXUkY80oZZb3FeW4cefQ08hoo3PBgrso6+oL6jYAVSvla0FqHkBmm9MKt3EQqkfC0twXyAa2s1/8DhhNmQR/OMx8o95/xntVXOR6OZaCRECHrvjIj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723655215; c=relaxed/simple;
	bh=PuN4GAfplsp12OxKwRg8WXCnOln03Xh8ZkZO4E+ab1A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=msktMgk23PcaegBx4rMHCW887GnpKhbih15RRKpHTSIqatHcfmVFaOWnyAEcCXnVtPiJh95m6uRoDKM3thSrWc9xjt2hVXl+8mTX9PVxH9jngX1aWn69s9gnjiPLSuijUtBH8eXbJEt1Iqw7t0/1MBSYm+RnSifZceCaPQIUT4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iIOx+d6o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iIOx+d6o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAAD4C116B1;
	Wed, 14 Aug 2024 17:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723655215;
	bh=PuN4GAfplsp12OxKwRg8WXCnOln03Xh8ZkZO4E+ab1A=;
	h=Date:From:To:Cc:Subject:From;
	b=iIOx+d6ocWmzzvfZWHYOabF5t7tV9gYshQg43YJVAIJQlsX5ESKuJSi3Nc4YDeK+5
	 tFT3P3d1fBtU9R0i5n7zdryg0qWx4Wmh03V7uTJQH7hSaB+pp5CO5TqEy5mX7J1eVM
	 wS+JB/SM6fe0INvvAOQG/Wpq86JGp5Q82j5/AsHtC+wq7Pw/Q0+AIm+u5fi2Ybmud1
	 gdy1yI5+udQoUZvNr0/AzTLtfO/KV/5xjGH8RE5aUrZ/CQLE1Cb4iGoYRTv3tJFjEx
	 ECKUsiJ60phrsuGEttE82eWa4cynyJJbUzRuXM0ijdz71iZblRtu/EiGljySBg5rXr
	 fiBWdB5zYKiHg==
Date: Wed, 14 Aug 2024 18:06:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools <tools@linux.kernel.org>
Subject: b4 failing to pick up cover letter
Message-ID: <0c57ec83-313f-45a5-b0a4-eeb7c9081241@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ialoofhpY4FRxPyq"
Content-Disposition: inline
X-Cookie: The second best policy is dishonesty.


--ialoofhpY4FRxPyq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

When I do:

	b4 am -S -t -g -3 871q3bll5c.wl-kuninori.morimoto.gx@renesas.com

with current git b4 fetches the relevant patch series but does not seem
to fetch the cover letter even though it does find three messages in the
series and the message ID passed was for the cover letter.

Thanks,
Mark

--ialoofhpY4FRxPyq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAma85CsACgkQJNaLcl1U
h9BwwAf+IPLeC7MC447FZfCaVGNf3DM/oaTsjcTrD22DqymIPWiwPZIZYj5kephG
vvCvlyOja4Ec4O1GwbKQEtN4CVrDQlyg68xCDnIBw9YtQwi23NdVchFPjjLSC9AC
hj/hvoOPKVuS+koRnNDaKuf3gF2t3l7Jb8E+OwZDFq3laiu1DACUgRdoSNf+QlXJ
AK9U3geNGQP5sl6FeQN54WTQZ5On4Yraq5Okn+lfBzT5oe6X8jhx8MgAMpgt0fN6
aAD9rJneH6Zx/phhEqerUdZg2zE5WKgu6N6QPYTLtamSv2Up/x0d2tgTIELal/pc
l3NFPRlUTWz7eh5Fx2ye3hzO7pLjhg==
=kF10
-----END PGP SIGNATURE-----

--ialoofhpY4FRxPyq--
