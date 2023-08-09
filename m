Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D971D2E9
	for <tools@linux.kernel.org>; Wed,  9 Aug 2023 17:21:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14367C433C8;
	Wed,  9 Aug 2023 17:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691601715;
	bh=97KbzLi9Si0wiuAVs4dKvbELDUj4qzzEdAk6c/YCBr4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BQYy9yJcNS6eSDh1GYBGi4bu3L7TH4mFnuYNDJiF2uPlTp2YhLYGEAI7K9Q9MDqFV
	 Joypdb8zs9XlYky+VIGMYfv+Vaw/RUxqC+h5/+0e30kx/Pt7VB42lECwqgv/ik1YFy
	 E0o7wTpesm6lAoKxRew5WMehr5F77D7dh2GmmOBBSbqVff5Wf6T4xsO4V96z7+cmC6
	 MOgGKnphWsyQaHGei0NF0RYd+sVWsqLPrRzvjRONZzR+KSX1R5Ol3dn6sPyaijF4t8
	 5l9pmckYrLRGmS9RXEXO4CoBllbmipZj1ZwyHT2hFxl8vSkjwtPVx6QVgu+RXf7I+C
	 vnBWukHcK3Acw==
Date: Wed, 9 Aug 2023 18:21:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Joe Perches <joe@perches.com>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	"Kernel.org Tools" <tools@linux.kernel.org>,
	"# 3.4.x" <stable@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: get_maintainer, b4, and CC: stable
Message-ID: <6dabeab8-d013-40fc-a705-d2d202510549@sirena.org.uk>
References: <CAKwvOdmOVnhKws_6DdakK9SDxiCCCR1d6VJwvz94Ng_y3V8QCg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LWqUKYVMG3UGwyMl"
Content-Disposition: inline
In-Reply-To: <CAKwvOdmOVnhKws_6DdakK9SDxiCCCR1d6VJwvz94Ng_y3V8QCg@mail.gmail.com>
X-Cookie: Necessity is a mother.


--LWqUKYVMG3UGwyMl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 09, 2023 at 09:50:00AM -0700, Nick Desaulniers wrote:

> I suspect that either b4 or get_maintainer could see the Fixes tag and
> then suggest to Cc stable for me.

> Should get_maintainer.pl make such recommendations?

People use the Fixes tag all the time for bugs that never made it into a
release...

--LWqUKYVMG3UGwyMl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTTyy4ACgkQJNaLcl1U
h9A/Qgf9HGkw8mUChyCpqj1Gd7XYPoLdfYsL4xPF8/eVvrohiJHpz5TaO4jE+UAN
SFPnbZhSINInsqL+/q+MEX3VmwTySCNknhlKflE51q6Zo6CpgSt0TfYCM0BsvrfT
VrXCnsXlkjONOGnTRmV1FoayrSOGF+wXy7TUxFhaT7UpgR9Ar6a6uiiJmsJC7jO7
DFd3jt2Uy2bUWOJeUqhdHV0zvBZhcMitut761Wd5QHwtaOq2xhEOzTPOgW6P/0Cb
HvPQK1mRMePYnEfpbKWxZ5M/2jNtn5hSD1HyopV8byELbf5HS7BtCQmOckp6JyIu
CahImhLPoqIQWzpys/PykESoFgs3+Q==
=5jRH
-----END PGP SIGNATURE-----

--LWqUKYVMG3UGwyMl--
