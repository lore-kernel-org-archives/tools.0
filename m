Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1E529CA;
	Tue,  5 Oct 2021 12:49:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5029E615E6;
	Tue,  5 Oct 2021 12:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633438171;
	bh=8SwwTI6pZGkQ2orvwRQgBEJewE3z0sLybqlpdOu1dTw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VW0sZEwL9+83Lw0R4fzyLf9v+Zy53P7cioNyXi0B1STSi2bQUsVNQsKK+BckfCq6i
	 5vKFpqr4xFPeYBTes2RzOcRvW/q2+2ZRwEJzKKk2hDyg/RYkRSLJRkz1JsWD6KG0XS
	 v+5naL9EPXG/ZZLNZRh/IiUJpY9x0SacJRZhawPro7deCUJDARei6bKb9tmhA+zo5F
	 oPyL2Cu9GrTBv/5ABr35SVpPiTuzCpSyIcMDH9edM5x/OvuA6yP0cdZokYfDSDXHvo
	 FQWCGuCpx/rl8Kg/xWPHuPh3ntRP/KyX5uHdGrEfd53fR2x2vopssuy77mZYSRQe1F
	 doFur738EjwZw==
Date: Tue, 5 Oct 2021 13:49:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Rob Herring <robh@kernel.org>, Lee Jones <lee.jones@linaro.org>,
	users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: Acked-by missed when applying
Message-ID: <YVxJ2Q21vstxIDsX@sirena.org.uk>
References: <CAF2Aj3icJtU+wacosM-LO2aqMChWL69T6bf7dK3xqPMSk6Ux3w@mail.gmail.com>
 <CAL_JsqKdfMBfrFgu6bmj1HLhwwNFAErj-_dMSizX+dZ0h_B47g@mail.gmail.com>
 <20211005124536.ynz4ps5etrppfqxi@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="D93Obqn95DqIHV5D"
Content-Disposition: inline
In-Reply-To: <20211005124536.ynz4ps5etrppfqxi@meerkat.local>
X-Cookie: A is for Apple.


--D93Obqn95DqIHV5D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 05, 2021 at 08:45:36AM -0400, Konstantin Ryabitsev wrote:
> On Tue, Oct 05, 2021 at 07:22:00AM -0500, Rob Herring wrote:

> > Because you applied the first v2 patch, not the second v2 threaded to
> > the 1st one that Greg acked.

> Should we issue a warning in such cases? E.g:

> WARNING: Identically numbered patches found, will use the latest by date.
>          Download and edit the mailbox manually for any other outcome.

Please!  In general the messages b4 prints when it resolves any
ambiguity are really helpful.

--D93Obqn95DqIHV5D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFcSdgACgkQJNaLcl1U
h9BucQf/TWJqvRTP1JZlJQv+fd4u3xK8cAfn3xZVsRlXsQXtgKC7Tasqa7Cz+fj7
41vIG8tzmFigyPPGIq1jkysr5WXjbZ7SPFtCx8i0iw3MhugvH91Oc7BIXJzp59+q
KH6xKC8fQ8GJp1VBmRH7DUClHXUCdLHR8pEmaAlRNEG0lgB6PaHusKwHKfIW9lLR
/LWRabjjcMy6pqnJha3EL/66ANGPpgk2k1i/F0TAmw55yj0BeX79RKUyRxrn1FYA
zUiQQG74jNNTJO2dZFZBCW55YKiZGmH6KBKIGYLoJY6AOMzNR3+S1aBdD6H7Gjzx
YjcICDFMBAbYbYcl9DF7LrHg+PLydA==
=g2wk
-----END PGP SIGNATURE-----

--D93Obqn95DqIHV5D--
