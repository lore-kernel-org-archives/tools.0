Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2343F226D02
	for <tools@linux.kernel.org>; Wed, 18 Mar 2026 19:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773863142; cv=none; b=jBBXa8U1oPzofLxYQ5MM7VLJSuuof9ENM19HTuTOpbqaeA4S6bDF3vSduQuy5QkYQX43zweea8+xIg5fWlCMZs1v3FB9oZOzlKkeC4FCLJf0WWNGSGOK4z0GbFuoesVhTpzpczjVILILhOeytkrmyoJ0QxZB95hvDfuHcBVClm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773863142; c=relaxed/simple;
	bh=eH7FGMzHWfYAIxOA3BtgvHvxUGFJypihyuyKe6tYEy0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iejeEy/s71stH0AOi/1PJKpIEznY8AcaGvtzKR0RZUepcHSbIZAcNQMgZ0gY8i4ygQJaoMunOFs4636jv0suJLeEVPq/11rvyOBrun2fre5eELRXV0FXG1C5eNDlzGuov4NhCrknARmZP73cB7/R9QoxmHFzC4wDVR9fSyiKL84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mqWfOqlm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mqWfOqlm"
Received: by smtp.kernel.org (Postfix)
	id E532FC2BC9E; Wed, 18 Mar 2026 19:45:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B687C19421;
	Wed, 18 Mar 2026 19:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773863141;
	bh=eH7FGMzHWfYAIxOA3BtgvHvxUGFJypihyuyKe6tYEy0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mqWfOqlmV1KBiVLXxz2V4FTNkpalgcPN8xQ4xqtupX8m8HBxYqbKrkmKwv4Qvh31Y
	 nsWnYv1/g3v5UHrPE1iR7hU6l6MvsQMpq1ETgRORvwuYHSkkLmsQgJuXrOh7AtoKUZ
	 Kq/y9TYSNwPJpTf8IkeAA12WuqE+QNLn2zjfDWn8+bmhvIhrooW01UOOl7no7ys0Tb
	 Lu/yVJOKoCsEKq7yI6esytMc8KUV6NNQBj1gGpCiGATuduU5PDnaCO6E0iVs5LNXBC
	 z97nUmth3x9vw4lg7tnLGBOyob+y4ro/4KhQMRM4kFhSVD9DEofDbCT5s+J0fzfWmw
	 oaVpPZeincYrg==
Date: Wed, 18 Mar 2026 19:45:38 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: Sorting for applied and thanked reviews
Message-ID: <eeaff7b6-1ac6-4cca-8c0b-74a6e8fadbd0@sirena.org.uk>
References: <4547f513-9e28-4f5c-93d1-823e70b110fc@sirena.org.uk>
 <20260317-steady-narwhal-of-courtesy-edccbb@lemur>
 <f1fed64e-bee8-469f-8a83-da8e76f9e958@sirena.org.uk>
 <20260318-micro-potoo-of-luxury-55ff41@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="P7595/RDlyQ5+EQG"
Content-Disposition: inline
In-Reply-To: <20260318-micro-potoo-of-luxury-55ff41@lemur>
X-Cookie: The coast was clear.


--P7595/RDlyQ5+EQG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 18, 2026 at 10:17:12AM -0400, Konstantin Ryabitsev wrote:
> On Tue, Mar 17, 2026 at 10:21:38PM +0000, Mark Brown wrote:

> > Given that I'm using the queued thanks feature things sit in applied for
> > a bit before they actually get pushed out and thanked, the sorting of
> > thanked mostly followed from expecting applied to get moved out of the
> > active list while I go through other things that might get applied.

> I've now landed the 3-tier sort, plus a "queued" pseudo-state for exactly this
> case. When you accept a series and queue the thank-you letter, it will show
> with a different symbol and sort into the inactive tier alongside snoozed and
> waiting series. Once the thank-you is actually delivered, it becomes "thanked"
> and stays in the inactive tier. So neither queued nor thanked series will crowd
> your active list.

Thanks, this seems to be working great.

--P7595/RDlyQ5+EQG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm7AOEACgkQJNaLcl1U
h9DE4wgAhM7YFcYLJUs+o1jefzdaj6lRP75q8YWAQYJWAAvkffqcYSRQRr99Ghg5
M5B3Rj0ng6rcPpx5Q02qHIR7cnITXSAUB6N52I9KVudKYdtM2Ji3ItxAOFIoO2mW
uQrUHjnAR6E1Dejaqfh+pXqLgezv/ctYj8FeUAgjsXaU1YKe8Z6CRcvTc7Wa7ar6
ChVGC1xF/WOo9YrGWJlkjtMF1N6PlirD9i774PMKmhTn2d7ngzapFpKPs5RZf06V
VB0qR292IGAt+ZwCJVgV7jLAOxm8uJE4f0ohdKSMNJMzIi9yraZYkWr05THQXR/V
Jbtywy0HEfcnUtuSaJa0I9Skz8Cv4g==
=OoQV
-----END PGP SIGNATURE-----

--P7595/RDlyQ5+EQG--
