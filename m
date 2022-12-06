Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85F28802
	for <tools@linux.kernel.org>; Tue,  6 Dec 2022 23:52:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9EBFC433D6;
	Tue,  6 Dec 2022 23:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670370748;
	bh=KCyBzoC65yeA8xlGiXvfBIGKUNhh2DKSjWV29gVI0ys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N5JvaWe4tmLd01QNLr4fiLzztwYSDYAet5NH9OA/qJsULUdMKKL85xe81GAPGUHSo
	 PWljBKQ+6h6Kp6Qmr7QuOMT2PTYkjzsQyKkmoSZZjtq/BMSr3h7uwgKMfNUE1AG9VH
	 XyIlHKo+XBYNVUF+eVy0uLS/MMLVrcYszBGdLxFcpzsIkRDi7yyOkjOizNz6EyBtJj
	 CJpRiU0tWTR32NB6MwT9aEYK2eCW6XpALq9yWGcXbZ28hltXTPBrgtvoFDHJOulIBC
	 M56jSb9a0YyGkVxGGwr0YtskkBunMA/GqulmNk7lKKHtMfAgyuwTLwstSqAwYW9eU7
	 GhwJsYAWy91aQ==
Date: Tue, 6 Dec 2022 23:52:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Feature requests
Message-ID: <Y4/VuYDJq9aUQiPv@sirena.org.uk>
References: <Y4+9Fz7lkzSnFV72@sirena.org.uk>
 <20221206221546.ezjxmz2w3tuxbzx5@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7HngK4e9X5u7X+Kh"
Content-Disposition: inline
In-Reply-To: <20221206221546.ezjxmz2w3tuxbzx5@meerkat.local>
X-Cookie: Ego sum ens omnipotens.


--7HngK4e9X5u7X+Kh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Konstantin,

I've had another look at potentially adopting b4 prep/send as a
replacement for the bits of my scripting that it covers.  I did
find a couple of gaps that are causing friction though:

 - Some command line options for extracting the metadata for the
   series would be helpful - the main one I'm looking for is
   series.revision, some of my scripts operate on all the
   branches I've got that have unsent changes which I could do by
   comparing the current version with the last sent version.  An
   equivalent of git config get/set for the series metadata would
   cover all this and more.

 - Being able to get the commit ID of the metadata commit would
   be useful so I can do testing on the actual commits in the
   branch (when using the commit cover strategy).  Alternatively,
   I'd use this to generate a list of commits in the branch so
   that list would also do the job, but getting the ID for the
   metadata commit seems more general.

 - It would be nice if there was an option to sign the tags used
   when tagging sent branches, especially when signing the actual
   sent patches.

Thanks for working on b4, it's really useful.

Thanks,
Mark

--7HngK4e9X5u7X+Kh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOP1bgACgkQJNaLcl1U
h9CFYwf9Fs8W0aEpebc25N1vHRKPtOxHZOrTseGJIKnuNG4BdlfyjA6vnf2LpktA
mp8ISUQKt0S0J5K/W6hfzB0jdhFq6+T9weiOq+bVALEeFVLGj0ZOLYnzBOSPtbMu
1YFQDFQhGwXc3DRTWyw3cN7coyupo68VVGASzJd2yJOPdbOh6qrMgh6cArWsoqKz
8gca1OrGqwJPr+xXaG5eGbj0M75BXJgHefMMMNw0Vjn4ICLogQACOQOOxC/DT6cZ
VEWB643bpQteI4UdhnvUE7wWKaM/c6qFRfswpkVJClM3m+npfUIG2Z0lgcLfMkzj
hspzWJPdQh0dGOGxlJupEWrfnokU8w==
=adZe
-----END PGP SIGNATURE-----

--7HngK4e9X5u7X+Kh--
