Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A6CEB03
	for <tools@linux.kernel.org>; Thu,  5 Jan 2023 16:55:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A424BC433EF;
	Thu,  5 Jan 2023 16:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672937718;
	bh=sSL3UJFx5dNNpWs8t1nTcEzcodthllWqMrCBTtNN5PE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VOg4oFeLeS+0jWsxw2nejVxLqSW3DFnwL/oogeTtu0QdjtM7fsuRA7pTfzb77vK+V
	 Q08EqeRwWrYO7WTzDOCCJ36JE1R9n1/HFDSNNNT3hOx6uhP9cLqkVEr7lvh6E0okRP
	 8tthHLVpzvLriLDQZJPkh9T+vZQl3MOPVTTIdiodFMPabi1BoaLWejUswVIY5BZ0R4
	 vmljHsgn1MG9bTRTI94gitGGqlfjxAe8C4naMqgMpRLCTIob5HRKzWVlgAEaC/2VbM
	 3aKyxsqvgwwBuvzNVzhOfDoT3kGNP/YgB5SW1BXH78KAvMZNlsOSRvNahEPhh+M8Gx
	 8JnL4FKXmk8vQ==
Date: Thu, 5 Jan 2023 16:55:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools <tools@linux.kernel.org>
Subject: Re: b4 prep --show-info for non-current branch
Message-ID: <Y7cA8vKJc+TvBKKp@sirena.org.uk>
References: <Y6sm7iI/mOA8/p4H@sirena.org.uk>
 <20230104195002.xe5fm6nvq5ors3rq@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0jUpI1U+L+Y/3kvw"
Content-Disposition: inline
In-Reply-To: <20230104195002.xe5fm6nvq5ors3rq@meerkat.local>
X-Cookie: Surprise due today.  Also the rent.


--0jUpI1U+L+Y/3kvw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 04, 2023 at 02:50:02PM -0500, Konstantin Ryabitsev wrote:
> On Tue, Dec 27, 2022 at 05:10:06PM +0000, Mark Brown wrote:

> > I'm now using b4 prep --show-info in my scripting.  Something that would
> > be really useful would be being able to pass in a branch name to query
> > information from, so I can do things like push serieses through my CI
> > without actually having to be on the branch.

> I poked at it a bit, but doing it properly will require a bit of refactor=
ing,
> because a lot of internal commands will need to be modified. In general, =
I'm
> probably going to make this a larger effort -- some commands already acce=
pt
> --gitdir and --branch parameters (e.g. b4 ty), so it makes sense to make =
these
> flags understood globally instead of per-command.=20

> Once that work is done, you should be able to run something like:

>     b4 [-g path/to/somerepo] [-b b4/some-branch] prep --show-info

Thanks - that makes sense and would more than meet my needs.

--0jUpI1U+L+Y/3kvw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmO3APEACgkQJNaLcl1U
h9BANwf/b3wolGM7Hj0jhbml8U4AZZnb4RSnbX0Su9kxKZnQkOEFTmxs6+nnQ5Yp
8n1yf6/ccqbhZheLUOgeCNhxY0mF4IJyePZLvgZ0PLgbv2FaivX+gTvNAkDp+9fd
OHcQke07uWaWj0eG4oFnROHysSCHTb25b0yYtvgvSwI/TOlqhsX9aEJihlY3flF9
7V7rZ2i6aLtF0SZD2sZxxAISPEyLC2Xpi9sUCkbeaP4dc19QaPAU6pIVN9WQRHGO
W0KqT+GX5Al3S+XEgIeKKbN35bvdhgD6hdgR8zC/o1ZnMA4g+D9BqquBHERHDK7F
8yGPqkRAH4K7HjEM1Q0TLSY7XgOTPQ==
=BD2N
-----END PGP SIGNATURE-----

--0jUpI1U+L+Y/3kvw--
