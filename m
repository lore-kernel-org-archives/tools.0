Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C644638D6AB
	for <tools@linux.kernel.org>; Tue, 10 Mar 2026 13:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773147910; cv=none; b=dZqLmOxf27sSVv5lSgZIvcZ6vw09l90ppPZS7HzimU94Tarw8qlGnKC/5XAq4h6JvaIBOzv9C/TapCjk4tCCNwxfYeUZ2EitZvrNpFcN6Fah64FtZ1V0pNWQSanHiycCGYmz8nnmA7536sJ8OCWrZsv6V4yQxqoitEVSf22gDQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773147910; c=relaxed/simple;
	bh=9sXfdH6CuBYeHwC+dAym7fq/reAFBMbpnQo4wPrKcCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MOegrZuHcdS1b2O39bbNUtq5iMF/1S73+MdtxvAoCTss2yTBYz3rO7BPymg/ioqEnpn+FEJfhhRoc2MEPIggmNFqnKtbMSC5wSk0hp6Af7CwRrXipGyvd52VUuUVIMtr0BklqasbxQ+IkV4PSlNetpzM/Y4HT6BVGSBGCQ2Ufx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=alcGKVWo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="alcGKVWo"
Received: by smtp.kernel.org (Postfix)
	id 822F8C19423; Tue, 10 Mar 2026 13:05:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9AAAC19425;
	Tue, 10 Mar 2026 13:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773147910;
	bh=9sXfdH6CuBYeHwC+dAym7fq/reAFBMbpnQo4wPrKcCc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=alcGKVWogUFr/xfKFsej1XhqSE7kYE4rBhFxXS20WfwhwrSbqdDrrtBVKvI9x1oct
	 36R8iQGoveYotH57aK/7YmXkH7LhEEzHKNO15Lp06JOH+XOZGv4eeVYDwA3DHHDFhb
	 OBb1xAUomjxc1eIwb8VOEViC8xNKFXkfJc46qCOVqjsfNs/fgGU3QElcONTAaM1nat
	 Ud7H9NyKbr62gffxMczEOAwLS1MxYv+Z7ajg5oXa/O7YFnchgK0wXy5cYtVj1cctjm
	 6X2rcWlqg50h34iyZo4IzleNCqAw6NCugxSbOOcxv5GZ4VA2Nb2Fq6sDR2TIrWT+Tf
	 pQbBK2axml6Rw==
Date: Tue, 10 Mar 2026 13:05:07 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: b4 review handling when base can't be guessed
Message-ID: <d7e5a326-d067-4585-98f2-0065692de60a@sirena.org.uk>
References: <092a612b-4fa1-4fa7-a872-b3564fcb3749@sirena.org.uk>
 <20260310-strong-copper-stoat-5de7ee@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9VSLditt4dpgxYqe"
Content-Disposition: inline
In-Reply-To: <20260310-strong-copper-stoat-5de7ee@lemur>
X-Cookie: A fool and his honey are soon parted.


--9VSLditt4dpgxYqe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 10, 2026 at 08:59:37AM -0400, Konstantin Ryabitsev wrote:
> On Tue, Mar 10, 2026 at 12:49:41PM +0000, Mark Brown wrote:
> > In b4 review tui if the base of a series can't be guessed then when
> > trying to review you get stopped on a screen saying "Attestation check"
> > and in the dialog "Base: not specified (a/b blobs match HEAD)".  It
> > would be really helpful to have a flow for specifying what HEAD to try
> > here other than quitting and doing a git checkout (which I hope works?).

> It shouldn't stop you there -- you can still "y" confirm and try to apply it
> to a best-guessed tree.

That didn't appear to work since it looks like it uses the same logic to
try to apply the patch:

| Guessing base commit...
| Base: failed to guess (None of the 1 blob(s) matched)
| Could not determine base commit

--9VSLditt4dpgxYqe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmwFwIACgkQJNaLcl1U
h9A3mAf8CnzdZjO8WCQdG6i8pcwyQg++FL9zREZKRYV0SiWgoMoXlYCsL+jU18by
0zII4Z5Y2gOJXtktWkrY7fEPvLQssuSDn2KRBi7wbITlaTcokd47R7+cxhvtWe0i
nuToPEKB3DN93AtJCTZ5UhEvG/dPNkuum/nTlNY5ja02bUv8CFy66bIkyEp/ATbB
hbg9f4G3+NCXwD2Asm6+ThLkvOKdFmmK8/aFUpxucju6e98MGzUE+FFiZG3Otyod
cP1LTGoNFs3exX/O7vKY4raxk9RopPrlKKjlu7BCLP3MeCiSRWEQV8Hfss8/jDuN
Nx/820qAyh6d6Dg20gULlMuMgpaujQ==
=TFEq
-----END PGP SIGNATURE-----

--9VSLditt4dpgxYqe--
