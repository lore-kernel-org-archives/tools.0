Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718632DEA98
	for <tools@linux.kernel.org>; Mon, 23 Mar 2026 18:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774290925; cv=none; b=RskUJ3HUsbSHGPn19/q5Dw6mLIGzaRui1Xi/CQW0Vl4wxwwIjuCc0lnQgxO8e2J/eKQRWofQNmSLTny5cjbEPNcBLP6I3u8ojFmR7qJ08TumASRQnYgTT54mGgbyf65zaNui+ptjPTHfJHeGcYuW1L9ueXymw6JtHU+JY3O8FFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774290925; c=relaxed/simple;
	bh=0yVnR3y6c+4/Qv9CWtF5xJUGnwSUq8RZ+cTHDfzmz9s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NNBAXgis4NgrjT/TF68zGgvOFFKdSdzUPcgVY2g/f5cbLKGCZWj22UoBjnKom5KRMiRENyw3rvheojtfMFU5zIZHsThz7CwMah7IQXuP9EGT8dcqdEzd8UaHK3xdBHRm5gxRqoEFUyXg0EajE4YhlKmjQdSi8NsrXQRSAJJUCLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h7CiHriz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h7CiHriz"
Received: by smtp.kernel.org (Postfix)
	id 25898C2BCB0; Mon, 23 Mar 2026 18:35:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 666CBC2BC9E;
	Mon, 23 Mar 2026 18:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774290925;
	bh=0yVnR3y6c+4/Qv9CWtF5xJUGnwSUq8RZ+cTHDfzmz9s=;
	h=Date:From:To:Cc:Subject:From;
	b=h7CiHrizqnAHwj+DaBPraCetsCJATpkrZaBtNsUvgZd7hfA8R+wY7zBSkF7tAnUQn
	 yR875iARkGYDYfg5zfwGANbUTjtXhKM8Zo7TBadNVBAZ4jGp/lgCBLHrutGRXmB6yY
	 lJX24be49XT2niwYIhfjGgJlpK+2eTKVCO/yJ+Mo72vbiIc/jMa6oR0WJzTUP5bQXl
	 xZataset+tryMZ66J/Qm+g7oPEmtIAjO2djPeJS9DXuCdxkdTmeSU36W1GVs81VlZp
	 7Yk00qq8FemnPlu59fR4170AF92eiPkwu1t+HnraBT5VRt9lsXw1bvLRRILZJjzAnC
	 UFUg9FOmClw4g==
Date: Mon, 23 Mar 2026 18:35:21 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: tools@kernel.org
Subject: More non-interactive operations
Message-ID: <c5b1ef7c-047f-469e-bf5b-bd385b21bc32@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1wamZJZ1+PoJDwA0"
Content-Disposition: inline
X-Cookie: This is a good time to punt work.


--1wamZJZ1+PoJDwA0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

There's a few things that feel like I should be able to script doing
them, rather than having to do them in the UI:

 - Update all
 - Sending queued thanks messages

Especially with the thanks it seems like I ought to be able to have
something that kicks the queue whenever I do a push rather than having
to manually remember to do it.

Thanks,
Mark

--1wamZJZ1+PoJDwA0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnBh+gACgkQJNaLcl1U
h9CNVAf8DT3nuiSQjt7zW/QBBVljPrQluj0nw7eAypSJSbp5Jn4SwGImK7JSwtzn
gKR/KT9DZ83pJna3dCqEzgvb8Kd41v67yHNe/5ukZdl5NK7DpgO4ZwDR77DO4yZU
feiyfS0duTHePn2hVD48A29QVN8iJE5eBpBU/rksdaWP4vfzEfCK0eQkGKKnQZHc
gLXDpkiEDYDl5hXPz+kofdffJv+oDQ2CVL6ykARifr27+QeAHbsO67Rxc16lluSf
n8CRqZtoKNFMaShV+Atfbz2EmMKsrHwiA0WWSnfJbP04w5NPNPb76H5qKmmvrkGS
CKP1N9aylmtpkYjqu4U8C/Ngll8LaQ==
=wmkA
-----END PGP SIGNATURE-----

--1wamZJZ1+PoJDwA0--
