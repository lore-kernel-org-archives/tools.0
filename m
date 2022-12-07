Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15305376
	for <tools@linux.kernel.org>; Wed,  7 Dec 2022 00:41:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43333C433D6;
	Wed,  7 Dec 2022 00:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670373669;
	bh=Qfu4XHwEKfrjDeCPhuoyQVUmc2aLCeb9zSRzvbcPFKA=;
	h=Date:From:To:Cc:Subject:From;
	b=scExuXNw6F5QMIDub1hNmMvkxr9Ch+zyERrEozNXaSBDLPypCqKhdfehlXQmLH00F
	 puBYF8QQewq4M3GmJFa+0NZthZW7YfPYG2/AxoRPNwIBWByS0OpfgjYeRIubajqc/o
	 qq90i2NCqGO1gNmExhcFLRX6tqXU8Vek1FUq7TbgTt8iy2gduCuZJnyBlmJtcVjYgY
	 vBkfw5xH2dBvOW5m9CJRz6/v4peLi7FZaKoLccsi+BXYkhN7SYWmwPbM4ZrCNi0wW9
	 iZTKqb0JpREKh+YF+hqsHgvs8yFHcFhGUUVjvl3UK7Bb/C7nOC6t3gMY5Vtykq9aRe
	 DTX8azTbloO5Q==
Date: Wed, 7 Dec 2022 00:41:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: b4 trailers doesn't work with imported series
Message-ID: <Y4/hIf+o/e3AtBCD@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q3e3ebPMTQ7yj4t2"
Content-Disposition: inline
X-Cookie: Ego sum ens omnipotens.


--q3e3ebPMTQ7yj4t2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Not a common use case but if I do for example:

| $ b4 prep -F 20221117104636.639889-1-broonie@kernel.org -n tap-spec-relax -f v6.1-rc1
...
| NOTE: any follow-up trailers were ignored; apply them with b4 trailers -u

I run the suggested command but get:

| $ b4 trailers -u
| Calculating patch-ids from commits, this may take a moment...
| Checking change-id "20221207-tap-spec-relax-9138e5760340"
| Grabbing search results from lore.kernel.org
| Nothing matching that query.
| No trailer updates found.

since the change wasn't sent with b4 initially.  I see that the
documentaton does say to use -F but using that produces the same
output, it looks like it's checking the change-id no matter what
and gives up if it can't find it.

BTW I also notice that no template inter-version chnagelog is
generated for the b4 prep command above, the same thing seems to
happen even if the sent series has a cover letter.

--q3e3ebPMTQ7yj4t2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOP4SAACgkQJNaLcl1U
h9BjjQf9E2chdtH9PbozAtcW/zOz67RqxyFc6WQ4ldSxkt2QlzttlguqSmPKjM3E
xZlEg4h+D1jL00p6FDGhHloTgP4j8IDua7qZTK1IjtAWtAf9ssE1c3J8kr5phRoL
d5ox5v6SjOMNmSqgyg6oRs3/f9O+CcrcYVnhIPrUL/KjmEdRNHZqV0+zMCgJsUuK
HmP4W/rbH+VhsNFv0tBOIL2dI+gdjRXTP2i6wwKr6b5n7BjQEFeBaMuVrcZargOF
rQ6oyjguhYK9IYudj5652Cn01fYlIpJ0Kp/W9VDRCDda2+yKYSex31DRGRhSDC7H
L8B2sJmG3qrbaEeeQ+0M9ytEytMwaA==
=okq9
-----END PGP SIGNATURE-----

--q3e3ebPMTQ7yj4t2--
