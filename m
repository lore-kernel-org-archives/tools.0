Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B087C6AD4
	for <tools@linux.kernel.org>; Fri, 22 Jul 2022 20:29:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3467C341C6;
	Fri, 22 Jul 2022 20:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658521757;
	bh=B4KrKrJL/4ucYbE09p+Zl/WyOodsIMtnr7aK+uyWx4g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=McKIQhghQO7JVeqMJgqqYrx/7Wa6RzGLGNsnxRWrk3pK3sAwrTubPaelBzn8hZaZe
	 qbiEr9m7c83AzmI2XkgjwgNvfbyCC8XrH8k8AnLETBpe1iSSEh0x7SG+fXZJO77pWx
	 3ZJvJ4i5GcMofENi7QMGnm7qvEnc9a2Y6VUgafZUHGmVLESsuZO4Nfe5cpnUW43+/6
	 iEM8UUgtnLk1hcQ8Ufa8Y+7tW+/LzNxJAZC8zJZQ/9GWTdeW7u818khJbc2ii7jNCy
	 cWnG38QwoMLZ1kntTVzTzT+YL1xo/skS0cZECcH30zHjuyuEtYe/2zUKiWMbbiTbZA
	 hFQQEFOAdfKFQ==
Date: Fri, 22 Jul 2022 21:29:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: backtrace fetching message with b4
Message-ID: <YtsImZxWbBZDAH86@sirena.org.uk>
References: <Ytr2B+54jaPQJdWN@sirena.org.uk>
 <20220722192624.apg3jnbawllqk6q4@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gTNSvXuaPNuxpPrz"
Content-Disposition: inline
In-Reply-To: <20220722192624.apg3jnbawllqk6q4@meerkat.local>
X-Cookie: Yow!  I want my nose in lights!


--gTNSvXuaPNuxpPrz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 22, 2022 at 03:26:24PM -0400, Konstantin Ryabitsev wrote:
> On Fri, Jul 22, 2022 at 08:09:59PM +0100, Mark Brown wrote:
> > Hi Konstantin,
> >=20
> > When fetching 20220722134603.316668-1-Syed.SabaKareem@amd.com with b4 am
> > using tip of tree (d952f4b20bc1e80) I get:
>=20
> Thanks for the report -- I just pushed a commit to fix it. I need to refa=
ctor
> how we do trailers, since with the latest ez-trailers work the current
> implementation is becoming a source of bugs.

That worked, thanks!

--gTNSvXuaPNuxpPrz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLbCJgACgkQJNaLcl1U
h9BaBQf/bfffgo42p64cd8/xNQNhpa7nttPbFw3aFAQpsPaXMGyuf7kZcR+mDuLX
G4NnBEiznaQL/jvje7ZiO6/q2W1KLKIucOn1LOZq+bSPjVk7bUHi4k51X/3hQjYB
a5T2gWj+ag5LE2IvVtA0wvzOqRCma7ejp4a8BAuXOz8VZQ3lBzXaP5mav2ilg0xP
Lew10Be8bI5yOebs44XofMU/rMxeTEeNeR47P/M7SA2vGfFr4GltToO+zTLaCNrT
VRsnw3jZQcCG/WumAsyghyHmPzoN+MYx2EWfOZNGszktPycTZhJWDQXQgKPH3NfL
fQAl96PSTZNnZ5XbYdH8nkEBvdFvXQ==
=QbEy
-----END PGP SIGNATURE-----

--gTNSvXuaPNuxpPrz--
