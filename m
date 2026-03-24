Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25D029BDB1
	for <tools@linux.kernel.org>; Tue, 24 Mar 2026 18:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774378548; cv=none; b=duBs7Or/gufXa/w8InHt9Es8fjx436wuvsjfqazMXVR9cmhr3IMbZOe+CDKZ3QZq8ltmQgMyWV2XnekIu919T6MvmhEQaIc6o4N3et3CubGUYcTt5Xn6HugKSO/70WOU7oFWUDekGDshCQuN4OrLYwLM64QINW9GH9SfECOO2Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774378548; c=relaxed/simple;
	bh=kgi1wOukUdmGMlhiNjbSxJgFPRfKUSSD8YxF0VwBgWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g3E2hpbOlgYV6xYuZBiop6iFhZ40bkmK3CNyXCsZX6Q1Vim5jYgEN+cRS4jD0DGGt7/TmVTse3sgYAi/aCS2LqHXASEcr/c7wJjRo31KHKCUGm9SOy+nJ8CCLUlK01OHqOReBehQ/nFa/JaA5Wzv0v4UjWjVvh8n+BozBDeGiWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jqtAAm8f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jqtAAm8f"
Received: by smtp.kernel.org (Postfix)
	id E2A51C2BC9E; Tue, 24 Mar 2026 18:55:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32DB7C19424;
	Tue, 24 Mar 2026 18:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774378547;
	bh=kgi1wOukUdmGMlhiNjbSxJgFPRfKUSSD8YxF0VwBgWk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jqtAAm8fP3QAfPO9MJhGcX9KbwXkAdB4wpx2FXXez6OP0ilNjTnVItIBojRQ0HZAk
	 Ch+qofmXzn42kz2YGRNmzRU5OIWU1Nm0gJU9vGBNFpKTAu7YJ4Qlh55Oi7RZSxR4Lk
	 oZguVBrTtpjIalIF1RDoukbcXaNoaal5wwhBCY/cxN3xybq9h2VI6Ze9FcIEs2gw1Y
	 m4bjM1o1NsmDFf8l4rKmHXbGzqoBEhBln7OLBDc8tx5+rLsamPmNsxQ4u8YcxWsnjg
	 FA+r+uj7A35/t22deuN3Rmj9nDXL909KWd9KddqRxkUB/NUmcebF0O1nkOqPtBFSH6
	 gR58AQQCXa9hQ==
Date: Tue, 24 Mar 2026 18:55:44 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: tools@kernel.org
Subject: Re: More non-interactive operations
Message-ID: <050b8d3c-9093-4a89-99f0-978e383c79fb@sirena.org.uk>
References: <c5b1ef7c-047f-469e-bf5b-bd385b21bc32@sirena.org.uk>
 <20260324-masked-imported-taipan-f665ed@meerkat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DwuB3/AccNClp/Wu"
Content-Disposition: inline
In-Reply-To: <20260324-masked-imported-taipan-f665ed@meerkat>
X-Cookie: Forest fires cause Smokey Bears.


--DwuB3/AccNClp/Wu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 24, 2026 at 02:39:21PM -0400, Konstantin Ryabitsev wrote:
> On Mon, Mar 23, 2026 at 06:35:21PM +0000, Mark Brown wrote:
> > There's a few things that feel like I should be able to script doing
> > them, rather than having to do them in the UI:

> >  - Update all
> >  - Sending queued thanks messages

> > Especially with the thanks it seems like I ought to be able to have
> > something that kicks the queue whenever I do a push rather than having
> > to manually remember to do it.

> Do you want this to happen even when the UI isn't running, or just an
> occasional auto-task from within the UI?

I was mainly thinking externally to the UI when it's not running, though
now you mention it background refresh in the UI might be nice.

--DwuB3/AccNClp/Wu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnC3i8ACgkQJNaLcl1U
h9DWCgf/TsWE0sWf5uSR+6t+wQwy8IMucxiSu0kpitsGKSgA3aqISTQE+JcUYhwL
2paM751psh9tliiO9dLIJOTD48VAtA9M5CQ35CrA3CQoxsNC1LuaKyU+QBsvq2UZ
AKLgVqqivZeNkD7SmBbXA/f18/ZzYLTdNDrqEnkT6BSaCJA1c7ruTCGrfGimWSoq
ig1JbqoxF9y4ZC1vDWBL7Iy123qeRs3fWeAxUvWpaqgu5NXhNvGmC3OuPv6dTms3
mwSzPYwYET8R/5jcf4mz/0Jzfi99DVLHx8tblCKRPrpthKC7/pdyCanUvLGaEnWG
pcLShNVzZNVmlf1U5RaAwW68L2+jOg==
=aNQb
-----END PGP SIGNATURE-----

--DwuB3/AccNClp/Wu--
