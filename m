Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968233009EE
	for <tools@linux.kernel.org>; Mon,  5 Jan 2026 18:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767637823; cv=none; b=GdsdOlbw6MEaX2u02xIwAg0oWIO5KyhVaJbzzBpVQq0BOKQaJyKHb4woeXTKYqHPJ9rarqPYVAmLJ0zOX0SmY5qUEwvV2MdkmsonkVOMsLpUcAvIIa5if0yFdeiYJmjRbc2sdXm+T/5Qsu0K8+/lec9IVU0HkUS9wj7LXq9ITm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767637823; c=relaxed/simple;
	bh=QcgfzMxthR4s59JRz2OjSescQ2JvS1tlTsIv4c30h4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=USY0lYQuZQht5XUx5nEkA7AlMKBFvqYlii31kVHjOKe4Qb6OucK4u6KDpU9oQAbcT3FH7YMeYvNNUKG5HiWCyj7f//iZ/K5xIoBTHte4RxC8iwIPI/Vx05jQLqTuEJUwdCQhXo7vKl+Mz2P56EXOadeo6F1ikkLRoI4vQnoI9AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dc9qyZJy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dc9qyZJy"
Received: by smtp.kernel.org (Postfix)
	id 40CA8C19422; Mon,  5 Jan 2026 18:30:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01335C116D0;
	Mon,  5 Jan 2026 18:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767637823;
	bh=QcgfzMxthR4s59JRz2OjSescQ2JvS1tlTsIv4c30h4M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dc9qyZJy4LJU+Z0I/ut7trX+NwUpPP7cHZXJV6B6JpDAkihGjLxAr/RPIcoJiFIhW
	 eaxf2lBJGkSf5KPj16daUJpso28HhEuL4DoGRVZfgdNo0A1bwfI9UUdO2OMseuCLQY
	 Zug5iqQIjB0YuPqZhRT3llMDqGU9d0qaLRR3dZRbAX8firRf0Rsdx2ZOQLLGc0dQwe
	 /laK8hXH/MG5s9ZLXxjlouECZVGRGeY0CM8LbM5lAiK9IzY/jP02KlQHJ5qKHYFMoI
	 LNwqkhyLfd4zldp2Q0kN7CR1ugWlmu91/jdWYoMlz4sEaFk/Pu55mUtjn/fl8e1YUZ
	 9Ui6XyB9wgo+w==
Date: Mon, 5 Jan 2026 18:30:19 +0000
From: Mark Brown <broonie@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: tools@kernel.org, linux-kernel@vger.kernel.org,
	torvalds@linux-foundation.org, sfr@canb.auug.org.au
Subject: Re: [RFC 0/5] LLMinus: LLM-Assisted Merge Conflict Resolution
Message-ID: <63de130e-6b92-4930-9b9d-093c2831c7b7@sirena.org.uk>
References: <20251219181629.1123823-1-sashal@kernel.org>
 <aUgb4wCNaSxpIhPp@laps>
 <565b28fc-6561-4992-88fa-35808ba1fa07@sirena.org.uk>
 <aUqMwuUoPuRN6Ry6@laps>
 <aUrVzuMz5D9QYF4O@sirena.co.uk>
 <aVv8NMl4aQwRcJ-E@laps>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="r/30xierDQKZF/xq"
Content-Disposition: inline
In-Reply-To: <aVv8NMl4aQwRcJ-E@laps>
X-Cookie: So many women


--r/30xierDQKZF/xq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 05, 2026 at 01:00:20PM -0500, Sasha Levin wrote:
> On Tue, Dec 23, 2025 at 05:47:58PM +0000, Mark Brown wrote:

> > To be clear unless things are super prone to conflicts the big cost with
> > adding stuff to -next isn't generally doing the merges, it's build
> > testing the results.  To that end the main potential advantage I can see
> > in doing submerges would be if we could parallelise the build testing
> > portion of things.  That would need some consideration of the complexity
> > of the scripting, the build machines and the cogantive load involved,
> > and if we were doing that the considerations for constructing submerges
> > would be a bit different.  It has crossed my mind, but it'd be non
> > trivial to do and not intending to produce intermediate merges that are
> > useful to anyone else.

> The way I have it working is that I will only recreate a sub-tree if any of the
> -next trees that are part of it were rebased, otherwise I will just merge new
> changes on top of the existing tree.

> I will also do a build test only after I merged everything into the sub-tree.
> If we hit a build error, I will bisect between the last known good point and
> HEAD.

Yeah, there's already optimisations along those lines in there which
help a lot.

> Between the above, as well as tracking "known-broken" trees, the volume of
> build tests is not that scary.

Most of the time it's fine like you say, otherwise it'd be completely
unsustainable.  Some of the time between the number of trees that decide
to simultaneously make changes that trigger full allmodconfig rebuilds,
generate messy conflicts or whatever else things blow up in your face.
There's an interlock in the scripts that stops releases going out after
3am or something which I am pretty confident is in there due to bitter
experience.

--r/30xierDQKZF/xq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlcAzoACgkQJNaLcl1U
h9DtXwf/XjzuCMjMR5RNFOki8+5BK8uV2uQ6QHai8+te+rnf+GBxAKks0TH6R8mQ
DI5SGbkoVq6mK6JRUmN7fOrjqdfYfmqabbu2NjZFxOkZ6iDvpPp2PLAseWp/1oLw
RH9S71nOHV6mRBUFY3MJ7DbwT6vo13I5VQ2p72PWXmEn1lVKACofFpLTeQnHeBjQ
DbWqfBnZWgwdFuckzQm+xMVx6budqkRSQS5SaxVxtcWChsY0MjC7h7sms5HxU56C
qo8Ga59F9mkFtzUHykUka1SLH1uNmjFRYrU/GRGt61b0xdH32bCCRuC5lNl/S7DS
PT34JpM+NI7lQE+0LhuAcsUPVDevGA==
=sx4a
-----END PGP SIGNATURE-----

--r/30xierDQKZF/xq--
