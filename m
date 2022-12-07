Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D69366
	for <tools@linux.kernel.org>; Wed,  7 Dec 2022 12:42:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1004C433C1;
	Wed,  7 Dec 2022 12:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670416940;
	bh=JOeLIcosuljbQDWAKP5jXYi6tcs1FwC4TXYE0Uudsjw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ccN1MO2vifgIoBgYDJpSbZltMoTe8ovu3IPl07eTDtWieCME7if+GHVYHejggHjv5
	 aXRDvZWYztrgbFXtTmMqUBGXRaxk343Y8ZhfNhvRHYUPNpjhCZnl8x5qd2PbJd6jLQ
	 YbzRFkoRvs4XBd+ohKSd133KEYZPMitqFrwN8g9ggFnuQb8Mhbvfx7WIHFZnA2lx9Y
	 Z2FQNuW0cbNjH6LRaNbjnfHPJ9t3NCu/NgxtvfM9u3OFhWaxF19k0rktiJoAyhyPgw
	 HLHEPeqYB4tvP8x6853EeAYLAr2SD61YPzt/qf/6vblz0NDJ3Xu0qz2FBvxuGQDQBJ
	 NCYjJBRozjsBw==
Date: Wed, 7 Dec 2022 12:42:15 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 prep HEAD fails when specifying branch point
Message-ID: <Y5CKJ2qs5aIVfWoE@sirena.org.uk>
References: <Y4+9Fz7lkzSnFV72@sirena.org.uk>
 <20221206221546.ezjxmz2w3tuxbzx5@meerkat.local>
 <Y4/I/dzuV+s00L8k@sirena.org.uk>
 <20221207011100.v6dyvrma53hv4oor@nitro.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zzaBSOTQsKKT0xYg"
Content-Disposition: inline
In-Reply-To: <20221207011100.v6dyvrma53hv4oor@nitro.local>
X-Cookie: What!?  Me worry?


--zzaBSOTQsKKT0xYg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 06, 2022 at 08:11:00PM -0500, Konstantin Ryabitsev wrote:
> On Tue, Dec 06, 2022 at 10:58:05PM +0000, Mark Brown wrote:

> - if you specify a fork-point that's past the start of the series, we will run
>   into trouble because we will end up with multiple cover letter commits in
>   the history
> - if you specify a fork-point that exists on multiple branches, we'll need
>   some logic to make sure that we don't use another prep branch as our
>   tracking branch -- but only when we use non-default cover letter storage
>   strategies

> Since my primary goal with this work is to simplify the process for newbies
> and occasional committers, b4 tries to enforce the workflow of 1) switch to
> the branch from which you want to fork, b) specify the tag in this branch that
> you want to use as the fork-point.

Right, so a common use case here is that you want to fork from a remote
branch (generally something in the maintainer's tree).  For me that'd
probably mean that I'd end up with a lot of branches tracking a branch
called tmp.  I'm not sure if that *matters* though.

> I may either add the logic above, or just give a less obtuse error message,
> such as:

>     CRITICAL: This appears to already be a b4-prep managed branch.
>               To avoid possible ambiguity, please switch to the branch
>               on which you want to base your work and then try again.

> Or a bit of both.

That'd make it clear that it's an intentional decision which would be
good.

--zzaBSOTQsKKT0xYg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOQiicACgkQJNaLcl1U
h9AkeQf9ExUWhw1pUY5TLn4l0HQLuIn5tRzdexdLlhlgi1C3+4wFzWCwA8j07f+6
jRvbM8VzkKl4Rxm7CWmOHd3YblANkKErSHK4dsA8dKaGFT2hjPUA7g/6uF5aZRfm
rwRmtd3/XretS46SWBNMuorV1LQYphQBiO12gjgQtdz6LT3Cb/BFJHINqBxlP3C7
snJ5Kz2sEcEqpOIAPO8Vpet4hqd8xfQpZWPfckvbLx293/0mO1i3Sl0Myo8JuQ4C
lbkG4MDKw2bIIl4nZcmlwwDTOS5CjviB5fHZrDy/JWgWRRu2+Gg8rwiNOeElp0IL
uw6/AYxNLzjiwYkNh+KZ4MClyI1apA==
=bC65
-----END PGP SIGNATURE-----

--zzaBSOTQsKKT0xYg--
