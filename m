Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338F32C9A
	for <tools@linux.kernel.org>; Fri, 18 Aug 2023 21:14:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A46FFC433C8;
	Fri, 18 Aug 2023 21:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692393244;
	bh=5P8y+g/ffPq1b5fajM8YoV43izeSNCyOFDyQCdwEXCw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HtKgslkZtuGBZshAAhFfrLIy9eou8wMMhbIiFBLr4KkMtl4PiVMVJe2hG2BlwrVlu
	 OrX0c5uhbvoa+Et2xtvTtVFF+DlFGJX0G3/3BR6bYRwPT09/T1Y9x6P9ETImJi+rMb
	 f2Qr+D8IfJWYlGLWQnWFztlIaJjxFaSDdXEayRquWJoc6tMYGi5ODPm5ykfDLJYS+h
	 0NAP3m2jpr7mMMpRZWbeLnei6wWSRj6aSALG1TDpTCm97Pk1MV6Ib5SmgQDdpNf+BQ
	 irmKCKk3MUZbqJIFHBTUb5k7HctCgKWh+eKEbEU9D8HEaF43JLTpwgsePazkAGQ/aS
	 zIUBrvgosBHGg==
Date: Fri, 18 Aug 2023 22:14:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Song Liu <song@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	tools@linux.kernel.org
Subject: Re: feature request: b4 am verifies SHA1 from the Fixes tag exists
 in current branch
Message-ID: <1a184dc2-8c8b-40e6-8fe8-f0309615f886@sirena.org.uk>
References: <CAPhsuW5Fqv7g=AVCGgQtFotG1oaUO+j5qBEyoTWJy0=n0mJS8w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dVKLGGiHdOHML417"
Content-Disposition: inline
In-Reply-To: <CAPhsuW5Fqv7g=AVCGgQtFotG1oaUO+j5qBEyoTWJy0=n0mJS8w@mail.gmail.com>
X-Cookie: Your aim is high and to the right.


--dVKLGGiHdOHML417
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 18, 2023 at 02:10:30PM -0700, Song Liu wrote:

> I recently made a mistake with a patch that contains wrong Fixes tag:

> https://lore.kernel.org/lkml/20230815091931.4dd2b277@canb.auug.org.au/

> Some lore search shows this is kinda a common mistake:

Note that one of the most common sources of this error is Fixes: tags
that apply to non-upstream commits which amkees it hard for automation
to catch a commit that's unknown upstream (or at least requires fiddly
configuration).

--dVKLGGiHdOHML417
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTf3xcACgkQJNaLcl1U
h9DoXQf+NaRWqawgq9s1rCI0vxkXYUMc84RGpJX8yP53QPoaj8VwfJEC0Pg1ufhX
aq4o3eItlpC3OnUgJNjG1yigC5sat4P0fndvYssQNBdA5JyXkYiitoGwAzhasTS3
A+jQ4G11sPPZIQr508mWpHFdzTd9ZKw0IVgYXnR6rqpUc/K6+u1x+/S9UnRUtyKH
6Kl+MjdQt0Di1lhXIP1O7IDe1sjvMod7OeUxHxGssnF5dBeMMP/DCSP1nZdCtPXx
bcDYPTg+z9VyO2D3NjDhR6SV6mN8teAEYQE/DP1SyaK/60Pu1NaGSo5V7bnVkUqe
WhT+dKK3C1Yt5ra795XCF7P6nQB6dw==
=MaF4
-----END PGP SIGNATURE-----

--dVKLGGiHdOHML417--
