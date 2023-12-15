Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09A947761
	for <tools@linux.kernel.org>; Fri, 15 Dec 2023 20:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T13QMKtH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 741BDC433C7;
	Fri, 15 Dec 2023 20:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702673810;
	bh=KU31Y/iGcQg+LHizShnMotwtCrCXFEBOwTHLmvmRO3w=;
	h=Date:From:To:Cc:Subject:From;
	b=T13QMKtHAicraSs+6aIDbfexeUWAEf0mkfmPpdSF+Pkew9TMNG55ckSkhTnxYPVSe
	 ZxdFMEnWWGM+GWmVQRnLCW+AfO1MOQ8mhCAjWrzP00WjYmGSat/2HZKtXlk9L1dQh2
	 t6bV09jMv+GvSy0sTzJQIqvDyiojVRsBLCFa6cIrJRz5gnQdmNf2uqqy/o8iQV3lQi
	 dSzPX/nJUPHmfR5W8OE6As9wZGXQbGXwHd0akTNCnrBuw2x1y8Fw4tkeeDbK+q0l+1
	 45seH918cUWuriyTP3m4/vHE9fPJIsKUmc1IdGiO4Lb2vJmkMxzub/8r0p+Za1o0u1
	 Y1l6TPD92fQ+A==
Date: Fri, 15 Dec 2023 20:56:46 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Restricting trailers to update for b4 trailers --update
Message-ID: <39a94633-fde4-4060-9c9e-de7d5a92a6bb@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Aid4s/79A6G+/djx"
Content-Disposition: inline
X-Cookie: PARDON me, am I speaking ENGLISH?


--Aid4s/79A6G+/djx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

If I attempt to update the trailers for a branch using

	b4 trailers --update --trailers-from ${msgid} --since ${base}

I would expect that only patches on the current branch after ${base}
would get rewritten, ${base} would not be touched.  However what I
appear to be seeing is that at least ${base} gets updated (the base is a
commit I did, I'm trying to use this to refresh trailers for commits I'm
applying).

I'm specifically trying 20231215130300.1247475-1-Syed.SabaKareem@amd.com
on c27032b402a10d9f258224685322f121de0808e5.

Thanks,
Mark

--Aid4s/79A6G+/djx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmV8vY0ACgkQJNaLcl1U
h9DWRwf/cmAbDdDNOheKLadG0r4l5HfoItUodKDvYHNOjfUTAkNscD1KRhDH7gGh
xl4Wq5q98eB1AF32PufY3/rg983CiswpGVgyNqPPPRzARykSfRU4tNCPOPL+oIX7
EgszRSRxdOuwkk7Pkkf+FxuZGef1lmqtzGxMfjweqwwViHk2q6yBGl9HwqplRwQB
JTD46gQx3vKrKgbTEGMUhHiXGzqAWIM5l7QUVOZDFrKVkRsMlM+UvxvuxR4OrsFW
mUClplfABl6+hC4h/9D6gH1Ss0XQNqD5qZ6y/zf7L6SOHP2zKsSrY8Yge18lWs0z
79v6NNqChqsHbuzm6cjaGJKpeAYMvg==
=UFWW
-----END PGP SIGNATURE-----

--Aid4s/79A6G+/djx--
