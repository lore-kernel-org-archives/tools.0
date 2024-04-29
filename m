Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3786A7D3F4
	for <tools@linux.kernel.org>; Mon, 29 Apr 2024 14:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714401387; cv=none; b=rBzWH4DNYpQVPoV3bpNz9ts7V1PMlEbvqitQL4/5A5gFIgFIe9nFjFc/9kQcnfQBRvXNB3GtJ9GbpDEDryPS4Hpv9yKDLlzxnkAS00cVDP1b5PMClum7YV8JvMpiDOx2IyqcYIckB1npAburib8Wd8zbziMZRFv+O3G8+e3aTVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714401387; c=relaxed/simple;
	bh=qvs7Ek06zNIkYKnPCimoQF06p3bxR1OYTBj5Lix0boo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CHQA32JCSvTeQ1hvtQPk9tsozC3s3QUJHbrGruPsulqFNkPqJqImjpPm4O1psCymPrtW0ZOMXXd6dBBAJ+ptamq4qNads8/CgkL1ivpSTJUy63KAIW0zMsMTPZhfk2j68nl1H1V0oDhtxaFfy1ibnP6IQot7ZkL/ob68YAJJVCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cpu8O7iN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cpu8O7iN"
Received: by smtp.kernel.org (Postfix)
	id DC49CC4AF14; Mon, 29 Apr 2024 14:36:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74890C113CD;
	Mon, 29 Apr 2024 14:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714401385;
	bh=qvs7Ek06zNIkYKnPCimoQF06p3bxR1OYTBj5Lix0boo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cpu8O7iNPMzc4SvbcOmmneFagy3h1zvSBo2KXEnmXN/QcBkx0xHyDbH0+HFoYChr2
	 kVbAokAk0igAXmM+UJcOq2di7Y/sZKsoabIyK9R9D8m1RFOd9RP6VCxn3qT9tRbXWR
	 iV+0YvYdc8SyMCxXpzj1FcD8o8A8HRj8HF7p/b4TT3T4EUOPB3OFZvDaRXNa0q0TEK
	 eWClOvCwU6esdwav6X+ZXkz414QF3VxZ2P1+wBIcj8PtqEpFxi10md6lJKYeezo6FM
	 RT2XKhP2Cn+pTdMEUShwpk2IklE3qwwKSBNJ5sK5c3sTqOzc8KVL8a+3/B0SL7oJ/a
	 sZI18kBy1UQtw==
Date: Mon, 29 Apr 2024 23:36:23 +0900
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, tools@kernel.org
Subject: Re: b4: use new trailers in 'b4 send --resend'
Message-ID: <Zi-wZ558StcTqWlR@finisterre.sirena.org.uk>
References: <20240426140157.349783d6@booty>
 <20240426-jasper-sloth-from-neptune-82a6f7@lemur>
 <20240426184425.23b606bf@booty>
 <20240426-tremendous-rhino-of-assurance-ad5e99@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8s92x2ib37m6dTxf"
Content-Disposition: inline
In-Reply-To: <20240426-tremendous-rhino-of-assurance-ad5e99@lemur>
X-Cookie: TANSTAAFL


--8s92x2ib37m6dTxf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 26, 2024 at 02:04:49PM -0400, Konstantin Ryabitsev wrote:
> On Fri, Apr 26, 2024 at 06:44:25PM GMT, Luca Ceresoli wrote:

> > > It's not really necessary to resend a series just for trailer=20
> > > changes anyway. The maintainer will most likely use b4 to retrieve=20
> > > it anyway, and that will pull in any new trailers.

> > I cannot recall exactly when it did happen and provide a link right now,
> > but I clearly remember having been asked by some maintainer to do
> > exactly this, instead of pinging.

> Yes, to be clear -- I wasn't suggesting that you send a new revision=20
> just to add trailers either. We're both aligned here.

This sounds like something I routinely say, though not in order to
collect trailers but rather because if something went AWOL the basic
answer to a ping is going to be a "I have no idea what you're talking
about" so it's just easier to send the thing again combined with a
general desire to discourage people from sending content free pings.

> I may have to run a poll among maintainers to see which is the behaviour=
=20
> they want to see:

> - resend should be identical to what was sent the first time
> - resend should include any additional trailers received since the=20
>   initial send-out

One possible issue with not having the trailers in a new thread would be
that you might not get as far as fetching the patches with b4 if it
looked like they'd not got enough review.  There are also people who get
really annoyed when they see something that looks like a submitter is
dropping their acks or reviews needlessly, among other things it does
mean people can end up repeating review they've already done.

--8s92x2ib37m6dTxf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmYvsGYACgkQJNaLcl1U
h9Cn3gf/YW3u2dOfwBiv2gtzXmr1h/tAE8kVxlZTd9zRJUz8TmBl3TQdnRAcgXnx
uIhKfe0M18yoszLg0rWCjjgdRXLXe2fYKesZy0N6vhy9oxgna1F7XNOPr24zMUZb
SotKVrU+c/pzTS1rLYG0m41WFy1GoxRMmiWeVu4bkFW2KVlkfoGg7HsdOPqHPR94
CPmxmVQMuX9uZDnIgVYEvFTlExo3IhgzoiDOwh1P8zQtOPU4FsO8wfOizX3yrzyj
MrKkqfucIJzUMQX/aeSeljSZoPM4sYoj2Ulmq4VvXfeu5XHJhUL28+I1nP3kuuQe
VU8wY6gpGMXyLiObtZITmY9YlLYWyw==
=2+sw
-----END PGP SIGNATURE-----

--8s92x2ib37m6dTxf--
