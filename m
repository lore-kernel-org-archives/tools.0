Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA5595C1
	for <tools@linux.kernel.org>; Fri,  6 Jan 2023 19:42:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81C76C433EF;
	Fri,  6 Jan 2023 19:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673034149;
	bh=2pGF8vyuv58Vhx9fJkC38aTnp31F8OqVH3TJQlIMciE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pqNwTWPpMCrQul2E6Ovn5daDcBjjxBjwPsZVmg6Wn8Bdd9kscbuqaqnIUmpHgFYUn
	 oiypjYAL/xyje9HqnJbFiz5yf3i2RGSRlXTsIfjIiGT8ZchGWJ2dssgfcUBj3vUJ61
	 ArrXahAhqGtfcXb0f8FaIjojjUQ7y5L3wUSVwh72ld8LyNL7+EwfNOeavUIlZQOflH
	 Wlq/yfhp3qSY01eWJ6sCG/bCUb7wHCBl0zKOEMhCsl8fySAGgTuuuh1yjig2UstA4X
	 X0X9BXvBOJSDQMktxkEyXY/KdY8e/dcS8J9KmAmDn1XJBzSZ/Js9Q+kdtC1TaOFWIE
	 RVO8zh6U5jZWg==
Date: Fri, 6 Jan 2023 19:42:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools <tools@linux.kernel.org>
Subject: Re: b4 am doesn't fetch all recipient headers
Message-ID: <Y7h5ofWLAB7dxiBx@sirena.org.uk>
References: <Y7hLWvgqqJCK7+yM@sirena.org.uk>
 <20230106170038.tbdihuu667upvqnr@meerkat.local>
 <Y7hWOEoqPsF+Wrtx@sirena.org.uk>
 <20230106173237.tpsdbdnzjfbgulcg@meerkat.local>
 <Y7hb17cciwrXm4E1@sirena.org.uk>
 <20230106185334.jyefhjur6yjn4w3e@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jnUm79r7Fb8tYsk2"
Content-Disposition: inline
In-Reply-To: <20230106185334.jyefhjur6yjn4w3e@meerkat.local>
X-Cookie: Do not fold, spindle or mutilate.


--jnUm79r7Fb8tYsk2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 06, 2023 at 01:53:34PM -0500, Konstantin Ryabitsev wrote:
> On Fri, Jan 06, 2023 at 05:35:19PM +0000, Mark Brown wrote:
> > > What if I give you:

> > >     b4 mbox --refetch mbox

> > > This will refetch all the messages in the mbox with their original headers?

> > Yes, that'd also work well I think.

> It's in master if you want to try it out.

Works great, thanks!

--jnUm79r7Fb8tYsk2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmO4eaAACgkQJNaLcl1U
h9DrlQf/f8vhEtF4BoK+p501TIiBA1p6KqLfEOO4OpxyaoyzA/ca26/HK81DYsXb
0dI+cse1uph6BWLUK+p5KVNPkjTG9RzVRaGdp2WyXTSWt9mOojT4Ljc5BnSmNBak
ElTc8I3y7b8o4yYOvHRs5kwsJREuqWBwiq71SMnFMxxU7YV/OFFp/uxPrfZ1baGi
/trZWeYJPnMRLmn/uBffKU2TPgFU0XZ9dnWVUT2AtxM3zj5O7LulceIaQxHATmsx
b08Zb9KR8wWibuROdbxgyXNLs5wPh267at45dRZ2aj0nvzXgp1wr+ixnBaMGMnta
tz4LY3toJJ+IjETvKPwJrnqzEJgYkA==
=1NWn
-----END PGP SIGNATURE-----

--jnUm79r7Fb8tYsk2--
