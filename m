Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F42C3321B1
	for <tools@linux.kernel.org>; Mon, 22 Dec 2025 14:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766415060; cv=none; b=TJxL2TtOh1MthMkgBL7iwSjKUcWsncQdpaPu/pXZUwlA0pE+y1j8dpu4eOFkgrRXsNVSvpvIgZJ70GK8GNZ9UgqLQ8rfFTGafbLAbvXW9OE+7WyvRoVINHEYX/IeHGoAytxoA+cNNv836CCQ2H1EavFMv2KzWdokLcPnqZ3i6DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766415060; c=relaxed/simple;
	bh=M60F57Z5KSbJIn+7wkr+6wlCUO3n7KZksqsvlG44z1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xtd4KvAGvZRAoKHHsCIDhUdDMkWQZ/BbYXTr/OQJzMxiOz2XN57aJ7ynUSP6ySgTFXnSIzvXcSH1Ig3+cSmJGJsJQxqxtBryT8ANYoKqCxIhS6CBazJyndh4JNt6PbjFntuzdbvfICot3uzdOokashaSy3qFEXM7I4mfvjM7Op4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TTPhjhGk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TTPhjhGk"
Received: by smtp.kernel.org (Postfix)
	id 1F610C116D0; Mon, 22 Dec 2025 14:50:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA486C4CEF1;
	Mon, 22 Dec 2025 14:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766415059;
	bh=M60F57Z5KSbJIn+7wkr+6wlCUO3n7KZksqsvlG44z1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TTPhjhGkhkw5T2ohC4WVvkQ6kyU1JpLAqWRfnPBEY7MRD/ILMa0HRAOTvSuKSHLIe
	 McxFyr4zZQux1gru0EFQFMw9/uA3aiGH5xcsxJYoQj3xqxtQjvMgPoySF6bAFYZ3pC
	 uhYnOSFN1GBMuRlQRZ0RrIDLH26rSjC5qWs6S7TczHMeJ4ObPg3QyF7+uYqxxTvsZo
	 +fdkpzibBA+NfAzifMIX38GzN20/1tdrYMxHRaZaWgH16FPF/APZWdBE9xqfzBv5V0
	 jvN5bV2TdQ9iN082YjpQCEWt4xOA/4ULQCbbXtrIMHVOiW5IjeXx2wZnHhDqhuphCq
	 9DCIapEOP6ygA==
Date: Mon, 22 Dec 2025 14:50:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: tools@kernel.org, linux-kernel@vger.kernel.org,
	torvalds@linux-foundation.org, sfr@canb.auug.org.au
Subject: Re: [RFC 0/5] LLMinus: LLM-Assisted Merge Conflict Resolution
Message-ID: <565b28fc-6561-4992-88fa-35808ba1fa07@sirena.org.uk>
References: <20251219181629.1123823-1-sashal@kernel.org>
 <aUgb4wCNaSxpIhPp@laps>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="doq7ibFjCFHWBYQ8"
Content-Disposition: inline
In-Reply-To: <aUgb4wCNaSxpIhPp@laps>
X-Cookie: Be different: conform.


--doq7ibFjCFHWBYQ8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Dec 21, 2025 at 11:10:11AM -0500, Sasha Levin wrote:

> I assigned categories to the various trees used by -next (see
> https://gist.github.com/sashalevin/163df4ae1163e0e22a97edc40e14b7f5) and built
> a simple wrapper script to generate per-category integration branches, letting
> LLMinus resolve conflicts whenever we hit one.

Those categories appear to be a bit randomly assigned FWIW.  I'm not
clear who would want the various intermediate merges either, I suppose
that having some of the trees pulled into multiple places might help
shake out some of the issues due to things getting sent to Linus in a
different order but OTOH it will increase the total number of merges
done and tested which is itself a cost.  We could also shake out
ordering issues by doing something like randomise the ordering.  I think
I'd want some demand or use case for doing more intermediate merges
rather than just doing a bunch of them for the sake of it.

This seems like a very separate experiment to your LLM merge thing.

> The resulting branches were pushed to
> https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-next.git/refs/ .
> Each category has a %s-next branch, and a larger all-next branch which merges
> all of them together and is the equivalent of linux-next.

> Please let me know what you think!

It might be easier to tell what it's done if you ran this with the same
inputs as the last -next (it's on Christmas break at the minute),
there's quite large differences in the end result but most if not all of
that is that the input trees you're using are fresher than the last
-next.  Though I think even with the same base there'd be a bit of a
needle in a haystack thing finding interesting cases, probably it'd be
more useful to find and highlight specific cases where it does something
interesting.

--doq7ibFjCFHWBYQ8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlJWs4ACgkQJNaLcl1U
h9CevAf+P6NI5DX7yiXA2tIgjW6xk7EXe/QP+KATgws3W7BYbD2QpiNqVG0znQIq
EjYw/jN6K+yCP6inJ1jfzHRvaUdlvPLGNPIkQm/dGXg6iJ8MOCJytzef0qLlf0VT
pyaiUcO7C1/SOsXwo7H6cilj548Qa0Z6cmuVYGnaYiyg1iNfICVK8LrHjbdLbBDC
kaT60+W63nMYwPDgOpZEJQ7hHVrl6+eI5TLO6wCg/P05HPIxPgh2d0AeLlq25mFq
CBVOL2dKqFNXyu3hHHxkw2dnz/qdr782UkX4S/V6qlNBzqC3rODyx6ehP9cQbAjO
vgTsXTiulDvhC3eLaEcZGURJFBoi7w==
=xduP
-----END PGP SIGNATURE-----

--doq7ibFjCFHWBYQ8--
