Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7583F2118
	for <tools@linux.kernel.org>; Tue, 30 Jun 2026 13:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782824738; cv=none; b=Q2CFOvNIPV7IYrKmwKa3LzKyvMlenafvCLoCWvmasjv00NW7rmaMJH1d+/egmktqFUI1QKsDIkbxD+B/is05ZI+1KJz7fMt+4LEbI9uNm6yPqeVz7Pkq5X0xcBmWVhjPVOLpINXmYsWw625OSRYOgKH+l7M5eRst1vTuQnUbDeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782824738; c=relaxed/simple;
	bh=8V93lw0ZV1hWdhpU84LdsJBqtsjPznBqVDhutaPDPss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VPP8o9N4So/Z3bT3sLCW0Lr22wPM8Umr82pEdQTB8kNcOT89RBOb3zGYQ9rW5zTcbOtAuTurNUpDSGnCunOnVUZxRV2ndyEMEuu/G2dG7ZkZCigx5FUA2H5RMoEcJi4cwVJ3g1inlszyVRPO4nOGTARoX2pbEZne4Jm7NJghrzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PEd8RLku; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PEd8RLku"
Received: by smtp.kernel.org (Postfix)
	id 76A121F00AC4; Tue, 30 Jun 2026 13:05:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B680F1F000E9;
	Tue, 30 Jun 2026 13:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782824737;
	bh=5tCr1cUxUMGRXDzbaCYQ8MhcfqEvbxx1+Tsc2QVbofo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PEd8RLku97L7iePbmWKlk6qv8pHZgPHTaEWq4XRinKqwOam+UXVwTSefhTJyRp4d2
	 x1v8/dytsKXCQkL5A35XTzExuJ98qT6KIO2jRaCWWv1Ow6UJEU8l9TRYl5Ti7k2EKO
	 ajq27BquEnGEe+jUzl8WAhjq3qR6PqU8DSoa9i4kVgGzWmYiDlwVc/U3XYj5k+iiSb
	 C+ZuGgmF70mo+tSsiaz1z/hKpQeCVksbzEl33tBIW9QFeLVH8cL6pvksKgU465+YRO
	 JZ1B42XJhP0b4e/YeUgG//hCubcO3Gv5wCiFwqz3jYJWlHezBrjrKnPzbzAyGYdqRP
	 HAJcM9z98mwJg==
Date: Tue, 30 Jun 2026 14:05:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: b4 review batching operations
Message-ID: <a3fae830-9867-42d9-b6c8-3f7409e7e51f@sirena.org.uk>
References: <55e2fdf0-f825-4c10-ac82-90d73790cb3a@sirena.org.uk>
 <20260629-pristine-hospitable-spoonbill-c79a3a@meerkat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y7WmKVJ2ticqlIE1"
Content-Disposition: inline
In-Reply-To: <20260629-pristine-hospitable-spoonbill-c79a3a@meerkat>
X-Cookie: Air is water with holes in it.


--y7WmKVJ2ticqlIE1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 29, 2026 at 03:01:20PM -0400, Konstantin Ryabitsev wrote:

> Yes, I should definitely think about features that would aim at high-rate
> reviewers like yourself. The current TUI model works well for a R: reviewer,
> but for an M: maintainer of a busy subsystem (or several), a lot of design
> choices would be actively slowing them down.

FWIW for me it's usually more just the general lag in the UI than the
batching thing, for my flow more usually I'm reviewing and applying as I
go.  It's if I get a large number of patches that I've already reviewed
but not applied for some reason like the merge window that it builds up.

> What I'm thinking:

> - tag multiple series at once
> - create a playbook for the order in which to apply them
> - run the playbook as a single take+thank+archive routine

That sounds reasonable, yes - TBH it'd be kind of nice to be able to tag
things permanently as a note about their state and then be able to say
"For all things with tag X do Y", the tags could also be useful for
sorting in process stuff as well as more structured notes.  My custom
scripting lets me say "This is good for applying to branch X" and then
actually do that later which was working well.

> There will be caveats and corner-cases to deal with, such as backing out if
> a series in the middle of the playbook causes too much grief, but nothing
> seems insurmountable.

I think I'd be happy with just skipping anything that causes any kind of
issue then going back and dealing with it separately (that's how my
custom stuff works).

--y7WmKVJ2ticqlIE1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpDvx0ACgkQJNaLcl1U
h9AoYQf9FW/KB6nEQZ3L/9cPPp+/Vqja0pXLdJfVTZ2auY+Z1JP0VF1Uc0DHvC23
HTDuaZyZwo6TIesPKZhWsRNb05jTvhE/+hdGgZzzQoiGJU40x+SSV54cRrFjAMyW
IBVkbUl/W3sOXqzD3ZhyCUsJY5I+pHDkZsCR6uxcQO+4tBoq5LbXdmuYvYZhftkz
SqzgkXr2tlMlBMn6q2lx2Acl04WhIFq+t6ouIQ0rdbqk9gGbVvqeAlb3DgNQMbh3
I9ILJ4+LwS/DOd/DKhlDqKM0GKmcFymG21QyzTRlJ2u7XKVFUyWj+HCpmiSjBUck
zJmVqcK8o/4ZaEoNa0K8oY8FBsEqyw==
=6FNv
-----END PGP SIGNATURE-----

--y7WmKVJ2ticqlIE1--
