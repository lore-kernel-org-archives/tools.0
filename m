Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D062877DE
	for <tools@linux.kernel.org>; Mon, 27 Apr 2026 22:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777328737; cv=none; b=ZoVRAnTcfwq+bPHeos9cvOfTnNqiHlwadUkAnfYt6lFNe15rGkcsTLfknf+fYDN9QFt/D1LeMk+M2K2jDcD2xr4EsHodnF3Z72i9u2lt8in20iIyUUks4l3COcXXE8zX6+UiwUoqaVStehRQ8gyJvX7RvPpZ+kKdTDhOhaF304g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777328737; c=relaxed/simple;
	bh=dfCdaPBh2o0D1/8YPYUAUfPNdOaF+nq7/gHMXnxxHiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L6WWMFOVcJob/l4sxeVBrsuSaxKfibMrZQ6t+ZdjoCaO+jIxCggxrMHejwb0kw/Xaa0Aj2Gpff5vXRukw1JGxnpOWNptowl+q8r3zLKlVQjhgpQ89ADeRMDx6Fm88+Av0uTsPguhCdZ/tBXk7EVespGIOGkwtvv8Yfo6FNR8J34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dt4BXNkR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dt4BXNkR"
Received: by smtp.kernel.org (Postfix)
	id 90836C19425; Mon, 27 Apr 2026 22:25:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6416BC2BCB5;
	Mon, 27 Apr 2026 22:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777328737;
	bh=dfCdaPBh2o0D1/8YPYUAUfPNdOaF+nq7/gHMXnxxHiQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dt4BXNkRW7AEsUHAbI6Vq/OMn/Rgpoff0KbwnetYHGX4JCtV4SH/2YO+2DFtQUnKU
	 bgVRHwnSWHpkedReupoaoXa9cFITe6WJUIYkKORvg0YPvV8N8D4JNF6GNeg6jDxMBV
	 4hxJ4hXVYWEGHb4YvS4CFy1dBUPXK20VJRRcZdS7zbBE0adHG+/Iag/jLMSiY2PvXK
	 nNyfw6bagSiBAyyF/UJtj7HdgcAjZ4xOEdAEaW0i4VXkijzUG4roBRyCSKEDqcfoGS
	 yj6CjBXqM0nFkWM6u9pPYZgwVlFV3nO8W6DT6fo3F+Lv/hnT/cu+114MJUNiLJhlCv
	 rsEcjJibA2tXg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id D85641AC583E; Mon, 27 Apr 2026 23:25:34 +0100 (BST)
Date: Tue, 28 Apr 2026 07:25:34 +0900
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: b4 tui: Old serieses not removed
Message-ID: <ae_iXiB5FpXcbmqi@sirena.co.uk>
References: <ae5uBJGVI5plpGkb@sirena.co.uk>
 <20260427-adept-bonobo-of-prestige-e729eb@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XB6nri6rTlfb3hzf"
Content-Disposition: inline
In-Reply-To: <20260427-adept-bonobo-of-prestige-e729eb@lemur>
X-Cookie: Victory uber allies!


--XB6nri6rTlfb3hzf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 27, 2026 at 11:33:48AM -0400, Konstantin Ryabitsev wrote:
> On Mon, Apr 27, 2026 at 04:56:52AM +0900, Mark Brown wrote:

> > As part of an effort to sync review state between machines I have
> > arranged for the set of b4/review branches on the destination machine to
> > be the same as it was on the source.

> So, let's call these "machineA" and "machineB". You do most work on machineA,
> but machineB runs a periodic git fetch to get all the review branches from
> machineA, correct?

The use case is more that I have machines that I switch between - mostly
I'll just work on one machine, but sometimes I'll move that to a
different machine and use that for a period before switching in the
opposite direction.  The sync is done by mirroring the current state of
the active machine to a git server, then syncing the set of b4/review
branches with that on the machine that's picking things up.  It's more
than just fetches, I've also started clearing out old branches that were
archived.

> > When I open b4 tui and run 'U' to
> > update all branches it reports the existance of several hundred more
> > branches, looking at them going past and what's in the UI I think most
> > but not all of them are thanked branches which I later archived on the
> > source machine, the branches are gone but they remain in the UI.

> This is the part that's confusing to me, so I need clarification. I assume the
> following happened:

> - These series were reviewed on machineA (creating b4/review/* branches for
>   them).
> - MachineB runs periodic fetches from machineA, which creates these
>   b4/review/* branches on machineB.
> - The seriews are applied, thanked, and archived on machineA
> - When you open "b4 review tui" on machineB, these branches come back to life
>   as still being reviewed

IIRC they were actually listed as thanked, some of them would've been
synced prior to actually being archived (since that's a fiddly manual
process).

> Is this the correct description of your workflow? If so, are you running the
> sync script with --prune, so that archived branches are properly removed on
> machineB to match machineA?

Yes, the branches are being pruned (not with git prune).  I can't see
any local record of them and when I deleted the b4 review database they
were gone.

--XB6nri6rTlfb3hzf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnv4l4ACgkQJNaLcl1U
h9AM2Qf/TuBnIGS5PERIdMXZoT5TcpTSmKwIbafZPwH/DfOpC0wvJxCZSY0oNptU
uuKl+WlCRrJUTDihSRORUXuH+PEx6bexN8MnYPfz1L+0opHIs/pG4rZCyIYKFD0T
U42tYMOWAJ22u9mRLHm2GniTCEWb7rAHvpbKb6oTlLt3+eWnQoEe3fW40ckLn7Gz
sXJyOPWOM1OIu2spqXVfLiVq6BVGMpwPTvvhwg2lkaB+J2jqI/attAsQufiSHCH9
NkXoIKHmgxjJGerxtydiSln1RHq4la//CUMi0YMAgr6tY9vMjhyJ1uNOyr0ISVdU
PCQeuJe54YJWjzHG51JydwzRZalZlw==
=576m
-----END PGP SIGNATURE-----

--XB6nri6rTlfb3hzf--
