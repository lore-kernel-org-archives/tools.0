Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4453A348889
	for <tools@linux.kernel.org>; Tue, 23 Dec 2025 17:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766512082; cv=none; b=PtTO+JwxVZyuNq9p2hggDisLlwbZx2Uq5ZFJZyYeSCvIE0eU9BX3n9gzZLoDrilfF4QOmBiAJxOtI8DMzC9ldgMFmNQ4817tIEUuRX7wlux4IBfalby8sTssO36K79Y2UzvK1AIMHvp8zz7PfSXp93CU7ruZpnlu8FMkUF2OlT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766512082; c=relaxed/simple;
	bh=gpINpFzhUOyL4KS86dlUntI4rw715vKeLr+o7LDAHUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u8w19xtFau3cm/4fIyDWmA7qExtK/URti28r+KSPqG7tN+hImzo91NVpWABonlFG88Mn5dhPKWKXKwWri9x+b3lB550K2eRnLrIT+z/q1oAyPpCpFUPFUAX4UQPmUWQCbGQhCE9oLjha9KWAHg5my1p1lP2LEu0hllad+3jC0i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eHCDLawU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eHCDLawU"
Received: by smtp.kernel.org (Postfix)
	id 08DEAC19422; Tue, 23 Dec 2025 17:48:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41F68C116B1;
	Tue, 23 Dec 2025 17:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766512081;
	bh=gpINpFzhUOyL4KS86dlUntI4rw715vKeLr+o7LDAHUE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eHCDLawUAsgsDNTJi96OEOfY5yz+1yrtmmJuTncHxjrYDMxWOvzeBj612lcIsaB5g
	 kICOtEBtbgzJeUEHRKx8q7tGgeDsedDScqG92tORChpK3mdFEKPtj76YuHWewyMyR6
	 JBVGQDOtuIxMfvJswkH0EZTRtucHqKII3y225AlPf5J/6I/+3Acu2fxe39vE+L1m9F
	 A3JzgTCVRIvdiQJ9bi1naMChWvzMomkFcKwTisEMmPL596e0lZhbkS3BsUYaxS8CHf
	 hHLkdod+Em0qg8vOGDTL10kZ7W6EScDdY/qhEzmE2yYj+xSbD2cKVSyPlwDgTzMv4T
	 Fgmd/4p4vrgmg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 7F0F71AC56B2; Wed, 24 Dec 2025 02:47:58 +0900 (JST)
Date: Tue, 23 Dec 2025 17:47:58 +0000
From: Mark Brown <broonie@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: tools@kernel.org, linux-kernel@vger.kernel.org,
	torvalds@linux-foundation.org, sfr@canb.auug.org.au
Subject: Re: [RFC 0/5] LLMinus: LLM-Assisted Merge Conflict Resolution
Message-ID: <aUrVzuMz5D9QYF4O@sirena.co.uk>
References: <20251219181629.1123823-1-sashal@kernel.org>
 <aUgb4wCNaSxpIhPp@laps>
 <565b28fc-6561-4992-88fa-35808ba1fa07@sirena.org.uk>
 <aUqMwuUoPuRN6Ry6@laps>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mCnqM4VrXr9DgPOs"
Content-Disposition: inline
In-Reply-To: <aUqMwuUoPuRN6Ry6@laps>
X-Cookie: Think big.  Pollute the Mississippi.


--mCnqM4VrXr9DgPOs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 23, 2025 at 07:36:18AM -0500, Sasha Levin wrote:
> On Mon, Dec 22, 2025 at 02:50:55PM +0000, Mark Brown wrote:
> > On Sun, Dec 21, 2025 at 11:10:11AM -0500, Sasha Levin wrote:

> > clear who would want the various intermediate merges either, I suppose
> > that having some of the trees pulled into multiple places might help
> > shake out some of the issues due to things getting sent to Linus in a
> > different order but OTOH it will increase the total number of merges
> > done and tested which is itself a cost.  We could also shake out
> > ordering issues by doing something like randomise the ordering.  I think
> > I'd want some demand or use case for doing more intermediate merges
> > rather than just doing a bunch of them for the sake of it.

> My thinking around it was to enable faster per-subsystem tests than what we
> currently do. For example, we can quickly build mm-next and run mm focused
> tests on it.

If we start putting everything into intermediate merges then inevitably
some of those merges are going to be later in the process and will get
generated later in the process, meaning they're nearer to the production
of the full -next.  I'm also not clear that we have enough trees that
would update multiple times a day.

> Since creating these per-subsystem trees is fairly cheap and can happen even
> few times a day, we can help identify issues way earlier during the process.

To be clear unless things are super prone to conflicts the big cost with
adding stuff to -next isn't generally doing the merges, it's build
testing the results.  To that end the main potential advantage I can see
in doing submerges would be if we could parallelise the build testing
portion of things.  That would need some consideration of the complexity
of the scripting, the build machines and the cogantive load involved,
and if we were doing that the considerations for constructing submerges
would be a bit different.  It has crossed my mind, but it'd be non
trivial to do and not intending to produce intermediate merges that are
useful to anyone else.

> > This seems like a very separate experiment to your LLM merge thing.

> Right, just going off on a tangent based on the Maintainer's summit feedback of
> how useful fs-next is.

A key part of this is that the filesystem people had the need, capacity
and desire to test a specific merge.  It's not that the merge started
happening then the filesystem people saw it and realised that it'd be
really useful, they wanted and asked for the merge because it filled a
specific need they had identified.  If there's other situations like
that that's a very different, much more clearly valuable, prospect than
producing intermediate merges and hoping they're useful.

With my testing hat on there's costs to adding extra trees to test, and
with producing those trees more often.  You need capacity to both run
the tests and triage the results, and an audience that is going to care
about the results.  If you're adding a merged tree you generally either
want to be able to drop individual testing of the component trees or to
have some reason to believe that that specific merge is likely to be
where relevant issues are introduced.  For example the reason I
generally recomment that people doing CI cover -next as well as their
specific trees is that you can catch issues from other trees that are
going to impact your testing (eg, breaking the platforms you test)
before they end up coming into your tree via Linus' tree, keeping your
baseline stable.  With that goal you're actively looking to see as many
trees as possible integrated.

My guess would be that many areas of the kernel already have workflows
that meet whatever needs they have for integration trees and have no
need to do something centrally, if there are areas where there's a need
then by all means but I think they should be something that people
actively want.

--mCnqM4VrXr9DgPOs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlK1csACgkQJNaLcl1U
h9B70Qf/X7x2muhugc/4NNAwJjkfxVTayq1PmalyhCMMjzQZRLK8eglOQaK6LHdt
vmrrJ9F2UTpQdH86M4lFvL+Z78ajFd/CgC3Z2rDZTbk6IW7VJrRhKrJ4kweamV0q
AZDq8XZqxMHXAPm58D77vTEICdVIW4xCqODj6HrRuTRSV8Xpwu6dcIUCtIZSthlS
ikwuLrMFbAT9qhpVgETYo7kfr9WwKLFqlnSmcQ+wum7IYRfLBxq0mY1hlQNDSmO/
T98VxK/iDFXu9I8e0URBl2J4kvVPX763GQw8LkdXaNPDAxrwfdLfYRcHfl2wjIJm
4W3oVow4OckNtGFHole79v4vQ8bg6w==
=UkMU
-----END PGP SIGNATURE-----

--mCnqM4VrXr9DgPOs--
