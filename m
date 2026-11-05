Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793899629;
	b=HvzSyC06qx8VWQEdbaPzHFShdJ/VaNH2Oe4Tne34a/mvDejckgDwreUmMihMfGNNIpTQ
	 IPpOeGpnlZUxdrKApq5I+1XNFpTiXpHv7Yvy3pzvmc1Z2R3NCGI5qkWYxV/Oen0B2IDkK
	 nGGo/q5FYSlwbpNZV++63j2pRaHKHfVMyO4eN11AllxfmF8NQ5tqsIFJ42d29qUhtz7dM
	 GVm14RmKfO8hYSgExorMUKGUtiGenY/jTdbi8h8QK7wa4yfnhb9H8nYLO/KLWxM4RWSZP
	 GcMD6bWcRoNddfXoVBdZ3nWSxujUSSJnm6wG3F7A04E3V8lxRhCSLUB8uWkVzjY22YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793899629;
	h=Received:Delivered-To:Received:DKIM-Signature:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 X-Cookie;
	bh=eg8RnxbyvnGRdIaX02njry5aLCJN6FENqBF7LsZZfBw=;
	b=iA2oRaE0SZw4c6EUwCUbYebZkvUn7ZRq/edMdH8NKE9UYW4tlYWRFb5I0cVgphwlFl5I
	 DpPZAcU96/ouMXB3qTTdfVe8Tqb+zh13z0ujtNEsZATaJfo+HFLmLM3akf9Jc2QPrW38X
	 WYN+MVLs3gonhl+IGk5RQqlxHjpJd6W7LqMOrBc/F76z69rRf12oIv6mT/fqAhpV1Q6Bd
	 qfK8kGn3y3SDTcqhjddO3rrbgpa/4dsePGf9NiQU5AY+wUUzqWvC4YujJNkdx3MiJBZGX
	 Kl/LFnw+TUrKOQu5tZUg15sDpH5qnfV07m5VMYKU7JLJPcNEux5W9j5deqsnclTO6gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I561KO9A;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D25606D803
	for <tools@linux.kernel.org>; Thu,  5 Nov 2026 17:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I561KO9A
Received: by smtp.kernel.org (Postfix)
	id 93F821F0093A; Thu,  5 Nov 2026 17:27:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0CB41F00919;
	Thu,  5 Nov 2026 17:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793899629;
	bh=eg8RnxbyvnGRdIaX02njry5aLCJN6FENqBF7LsZZfBw=;
	h=Date:From:To:Cc:Subject;
	b=I561KO9AgP7V8WIopbdPv3efGcfPTTHS/H5fJ5NYLLQVVhKaM9QTqBGz92qKuQ6B6
	 u4EfLVyUo+AAQpFpv83lin9/iKvb+s3MwljXdvq5iB43ViKVOy38wTxJgIZgkUSpFF
	 SNlVKZmE6j1NvBSiiKdIrdDEJ9RjUkId0L4wi1H3FvUq/RYvW8eJL+lDmhSIWzPxb/
	 zg6kRljzjx4kOU1itBIOcfS+TCLQtlTIC2DCTdU7GeLzXzUt7sbF1Vo8T0LrHVtvX4
	 LcNi3cMEpsZ5SBTA6hJv/Xj6ToDoqPLoxmOjVQ1SkgXNFdb0FQd0Px1AKurhkb6bxL
	 zccbq1QXiZsBg==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 301C327B4437; Thu, 05 Nov 2026 17:26:38 +0000 (GMT)
Date: Thu, 5 Nov 2026 17:26:38 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: b4 review hangs on failed patatt signatures
Message-ID: <1a5ecca2-9e58-41de-947c-5600604dcc89@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="xwLjQNpHHoJJhquy"
Content-Disposition: inline
X-Cookie: Whoever dies with the most toys wins.


--xwLjQNpHHoJJhquy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

When signing an email it looks like if signing fails (for example,
because you mistyped your smartcard PIN) the UI hangs - at least, if
it's timing out it takes an unreasonably long time to do so.

Thanks,
Mark

--xwLjQNpHHoJJhquy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCauy8TQAKCRAv73Ows9A4
iVMGAQC4KBlF0GNd+j1EZ02t8Jr1IxSzZoqatrZCqQPSXsqyGAD/QqAkKt0ejQjV
oRaGMvjf6weatm4+AtrzTmNMMJpZugI=
=dD8p
-----END PGP SIGNATURE-----

--xwLjQNpHHoJJhquy--
