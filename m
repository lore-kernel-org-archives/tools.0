Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4D82F80;
	Fri,  1 Oct 2021 16:20:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 534476138F;
	Fri,  1 Oct 2021 16:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633105251;
	bh=6DN6o8y7yfy3AzbTofg+rEnYFyZSnJhKFb0B7N5nGkc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nA7bogklKomKoGBJBYCfFbf2zErH/cABXtYW5EHf6hQE4Rdy4U6J/TEnQWBIX6PT1
	 cFIeqIkXnoodtvtgHL85j5W8c7yOnTJMq7dV7zrphTbR4OF+9RenNqJxJR5+EQIRh3
	 uwC9GxnjU2Qqktjz69fkommFSlHD2wJVOl1y37HyC21xBPFblrWu1gVD1tWiyUG13C
	 6jkxLbjG6de3ShzeLaX7aPUYeR6G4LtIDe2zF+GWI1agc2TPdggkUDBLAg0wngPF8g
	 9jC3PT8CFutKz28L9eME51dtOuezIliQXaOMD0mcimDNKJnz7IcehhZUZsTiVd3Lyf
	 OGWWvVgDgmh7A==
Date: Fri, 1 Oct 2021 17:20:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, tools@linux.kernel.org,
	users@linux.kernel.org
Subject: Re: b4: introducing b4 shazam (like b4 am -o- | git am)
Message-ID: <20211001162001.GB33031@sirena.org.uk>
References: <20210921202526.mk2meetobbtl3tvi@meerkat.local>
 <20210922173803.GV3544071@ziepe.ca>
 <20210922182154.zqtuvmcsjd4ivfgp@meerkat.local>
 <20210928174653.GH3544071@ziepe.ca>
 <20210929211827.5yvedlfq3bia2pk7@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dTy3Mrz/UPE2dbVg"
Content-Disposition: inline
In-Reply-To: <20210929211827.5yvedlfq3bia2pk7@meerkat.local>
X-Cookie: Where do you think you're going today?
User-Agent: Mutt/1.10.1 (2018-07-13)


--dTy3Mrz/UPE2dbVg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 29, 2021 at 05:18:27PM -0400, Konstantin Ryabitsev wrote:
> On Tue, Sep 28, 2021 at 02:46:53PM -0300, Jason Gunthorpe wrote:

> > Linus has been repeatedly against working on random git history
> > points, so I think the unreliable auto-base is not something people
> > should be using.

> I see. But if they do send a base-commit: line from some place random, is that
> okay to accept it?

What my scripts do with base-commit is look for the commit in a set of
places I consider valid for where the patch is going to be applied, and
just ignore whatever was provided if it's not found there (broadly,
looking at the history of the tree I'm applying to plus Linus' tree).
Given that it'd be useful to be able to supply a list of commit ranges
that'd be considered valid.

--dTy3Mrz/UPE2dbVg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFXNTAACgkQJNaLcl1U
h9DBcgf/eBxD+kIp7/sIYsQmTx7UbgC4Wk0cK6LzN27as8D9M9MOR5hu5IkVxik5
PK0kJjlQ39gOHqyo9j8e99EMExEQraWWlUvDFKSPUT13S7zBPUH/7MtrcF0Z/v+i
TLrP1u4XGDOFpqhauf4dHLWr+tTTLTP6iJX37ePP45yPhY0vNizfsa/KJoeAw2Y2
AzYVb2/fck4/tGUfLUVfLKiGcKHcw6pJsQgPdzPzqJqWBP9otU/Z+O7o1iopWWTG
pCOvO7UWuLOltKkfo9R/fUa2gVq5yXyGB7xa/isH52zGapagZwewlo31eZODmF0G
beelSOZerkelpsxe+DKVi4BqujQyCA==
=cPLb
-----END PGP SIGNATURE-----

--dTy3Mrz/UPE2dbVg--
