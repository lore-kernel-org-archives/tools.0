Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C44C941
	for <tools@linux.kernel.org>; Wed, 19 Apr 2023 17:43:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71422C433EF;
	Wed, 19 Apr 2023 17:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681926233;
	bh=0oauySHT61aPPG8s/ELDfvJlE+eBogsnxXsjeovnOj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YJvHRLTY9G9hPl6Cb4rjVSxzJE6mGMPq5wFUIIjtH4Pi3pepHi5VKLw6Ecz5whhR2
	 5aqzGElx1/O5jMOfcAFq6faWqmR4YIMcGUjCD1ekcyoRHkWqZmy+c2siRenIFreCzD
	 /X462qAY5VqhPKOx0w0dWZUinz4fs90AO4teWbFHPWJP2H5KypzJvbjGrYCYajFwbU
	 K/ECm7Tr3rKazABnI0nL0kbZ6HyQ/qfYQVOewLd4iPuk6mEfiJFVaMQ9pQbCZD5drd
	 VEGYsoReGuXv6RUgTK3coskrSW/ns7Bt2Mm4/s1c77v+n5YBbG/7uXBdda+TmAVrYr
	 TZUrfQ8/Xh86w==
Date: Wed, 19 Apr 2023 18:43:48 +0100
From: Mark Brown <broonie@kernel.org>
To: "Kernel.org Bugbot" <bugbot@kernel.org>
Cc: konstantin@linuxfoundation.org, tools@linux.kernel.org
Subject: Re: b4 trailers --update splats on new branch
Message-ID: <9f25bf50-bcee-4bd2-aec3-df8d3b59b880@sirena.org.uk>
References: <ZDbo/qTKFgBQdWh4@sirena.org.uk>
 <20230419-b217331c2-b18774441e89@bugzilla.kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9LWSvNXMLdlvU5ai"
Content-Disposition: inline
In-Reply-To: <20230419-b217331c2-b18774441e89@bugzilla.kernel.org>
X-Cookie: This is your fortune.


--9LWSvNXMLdlvU5ai
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 19, 2023 at 05:38:09PM +0000, Kernel.org Bugbot wrote:
> Konstantin Ryabitsev writes in commit 00e423af1a0968f2f90a4c3384c202ffee9=
8bc08:
>=20
> ez-trailers: don't crash when there are no follow-ups received
>=20
> If there are no follow-up trailers to process, bail early as opposed to
> crashing.

Thanks!

--9LWSvNXMLdlvU5ai
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRAKFMACgkQJNaLcl1U
h9ChXgf/S3WPRMG7KKAUiLmEqa3khwuhDnjm+TgBaK5YrvzaNQCn8rVSxF1MLHOT
iOfDlgW9X675/nahAXCgmIWc9krzvRdn9U+9t1M7/Wqiea/Unw7PQbuKgqfl0Qnw
oVXmr1fiwuWGd42GpYkVmlvY/MCH0Af1Br4+lXVYSfgnluwSmKiCLTJSxPWDqxfZ
feulBeDre38eP4BbHhh80Bc4WjebUPtauug95j/fpA1RwCbiSBJ0FShoCV8pJ5Ef
rdFVYaeHQCv9khQywsSIYMjEj/KdIl6I1/Rxrw9UH4DGpiyd8Nt4STvAivieEwwL
80GGDwiH3Jm9jj4Z6bzWwnvWGGO58g==
=I14B
-----END PGP SIGNATURE-----

--9LWSvNXMLdlvU5ai--
