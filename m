Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA593CCA1F
	for <tools@linux.kernel.org>; Wed, 25 Mar 2026 11:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774438874; cv=none; b=PC1J1Vn45MqprVrai8LyXlVoYO3CnheQ5AWa+yjLeE9jetPHtcsJZVBuQHmQyiWmwHlEmls5FBiI/QQOLQvw6Cr8rSalCO1RRCnG+5TyDuz5k0BMxurxrIMA4klIB0BL1Bwq8tfV3+q1Wmpjh8Pi4iZPO7crBM/e0KMzNWCEjg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774438874; c=relaxed/simple;
	bh=RZY6OnYnVON/Yvi5f95uYHD8MNuLYuYsnSiFLSeFANs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z0ysEACHNA7wFAZPXMOnFgud2NUVelPOknJoOWOiQV12HVVR3267fHFmOrhbNjT6SAiigqJSj8/AjQ5J3ToNGC8O75OUOh6uwspmXEQ0auaDtm87xIode7IMn+/ptO+1dWQBBPo5E/2ZrVTfBmv6GODb9CtQLYsYIjatJQJ3cN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SJjKmK1z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SJjKmK1z"
Received: by smtp.kernel.org (Postfix)
	id 0884EC2BC9E; Wed, 25 Mar 2026 11:41:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45375C4CEF7;
	Wed, 25 Mar 2026 11:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774438873;
	bh=RZY6OnYnVON/Yvi5f95uYHD8MNuLYuYsnSiFLSeFANs=;
	h=Date:From:To:Cc:Subject:From;
	b=SJjKmK1zOWvQhanA9ZtCCNrHGsZoj1GS7Cjz0gN5yOr23FJysIUVLhbjW9//BUgzV
	 QAJC6Ufdv3IcBp1grHX0/8HN5quXatIWJLSR20MuYxDtMe2hqcZzpThl0SO6IdscIS
	 QcYLgANmTFRSgmL1E9vlOJDWpmoBo87tKGB7yEMMVg21+t22DDlsIRBt+KTgNyZdnY
	 4MUsPXjym0rb4O0boVQzLEiFn3JQSOVgjduU+4MVF/KTvKqa2zw+MCMVX3zwrypW1B
	 a3nVq8IP8zCi4DY8bAS3zNrg1BMQTx4gNsnxtLNZsAeYGBHhnJKyBGPAKiaroRw1eM
	 7qWE2IICWYAlA==
Date: Wed, 25 Mar 2026 11:41:10 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Finding older versions when adding tracking
Message-ID: <43fde53a-4e7c-487a-9a09-e9d8549bd888@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="P559uLUp/Tp8g0I+"
Content-Disposition: inline
X-Cookie: -- I have seen the FUN --


--P559uLUp/Tp8g0I+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I just did a b4 review track on 20260325101437.3059693-1-sheetal@nvidia.com
and it added a new series, discovering the prior v1 and v2 which had
been single patches.  However, I was already tracking v2 - I would have
expected the logic that determines that a series is already tracked
would have kicked in but it didn't and I got a duplicate.

Thanks,
Mark

--P559uLUp/Tp8g0I+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnDydUACgkQJNaLcl1U
h9CiIgf+LFPQUncRKC4a5SptWzA0Wd2GjhFW55opYxGYjcfDPW7ypDuT6umk+eNd
Pu3X4REPQKzeJw2T/twuTw2namGxB92UDPGPdZrWkv3dIFCNInqVgBWOg76Os2R3
C7vkjGLpKRvDhsJWV4BfrUuVdSdpMnX5PDWMT1kJOuT9NKD7f67RFlCkkYBR/yYw
vlmfdGa/7M4dl6YU6LB8BOJQcXIzQH2UeEBkOECBSCneBunspuNeXVJkOqJnSNUY
uS5VnWjM9HB5Yn6+22GivVc2cNp/TkGQn+4tZSRRoiv4z/kZ6wsiNyrexmc+axFr
p3wWv0fMPBx/C6nCcMYN0siC067QEQ==
=wYAF
-----END PGP SIGNATURE-----

--P559uLUp/Tp8g0I+--
