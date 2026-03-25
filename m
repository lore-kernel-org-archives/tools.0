Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CDA19DFAB
	for <tools@linux.kernel.org>; Wed, 25 Mar 2026 13:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774443728; cv=none; b=prPaYSMMfFYLrdvpm2IeTTdfScucQVUUgUZnNgto1zE9pD1VvcvGog8+Ji7ENPXQwdEy2p5qwjqvC8XWa+iR5/OfAJyFCt+He+VZK9tECacmB6v0VW/s61SA/TvSCwZWBhq4kUr+H0gw+UHZKXUqljbR2i+RrvGzD9knjX/uoqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774443728; c=relaxed/simple;
	bh=S2c3glkIPmhEvOC8SspS/Eudwj9ll5tPcrwnJbxUH1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lHrvNnCv4A7U6SJ3poG4Sb+Z4wH9uYAI9qJ3wSXFGvXmrdUm8/U0qG0G0zkb79KPpspk+/+xAlZc3J4XwoUCHYB7OOs6VICxFv4lcWbRLiYprse8uimDjTJxX1e7pqyHnfNjWdo2L8NaGjPa2RqHyZK4Q6vrD4+ZFcs74RukqfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I+cetVwJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I+cetVwJ"
Received: by smtp.kernel.org (Postfix)
	id E4523C2BCB4; Wed, 25 Mar 2026 13:02:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81ED8C4CEF7;
	Wed, 25 Mar 2026 13:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774443727;
	bh=S2c3glkIPmhEvOC8SspS/Eudwj9ll5tPcrwnJbxUH1I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I+cetVwJrtfpzDoGV4xI2kvgPa2+QE0xNostWwc9P0OqfSQepQETiwY2cqaKhkY/m
	 46InNQxhXNXXfW+UWdCqK0lTxybs81iwis5t1c6YW16z7kRtPSntHptEACo0mXbhUX
	 WZXTO5nSX3W14dgzCBsTKdf6WFN76/moudWLnmKKcvyNTkbtYJMwXYhT/4uKarfMWV
	 8owLwRa1WF+jEI9lamexWe3fdM7miYlyK1QzoRlKGDEwQFD1TgrHwTyOlKNeJpFZEG
	 b5Jp7LORgtfOQ7KlGfSSPouXXYkuzcHeSisZX7V8JpvInivasbHk6Ot0Zo3wU1yPHh
	 z9dd/J5f9HEsw==
Date: Wed, 25 Mar 2026 13:02:03 +0000
From: Mark Brown <broonie@kernel.org>
To: Theodore Tso <tytso@mit.edu>
Cc: Borislav Petkov <bp@alien8.de>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>, users@kernel.org,
	tools@kernel.org
Subject: Re: b4 v0.15.0 released
Message-ID: <d7f95956-ac5a-4553-989d-ff26c20d0bb1@sirena.org.uk>
References: <20260320-portable-jaybird-of-focus-41fd66@lemur>
 <CA+JHD93MSC=GZMscAu8-uMroXYrHzn-w8NgHVSLyjNLJ9Wa=OA@mail.gmail.com>
 <20260324-shapeless-poised-turkey-f7b7ec@meerkat>
 <E6DFA188-6979-49A3-82E4-F673A6E66994@alien8.de>
 <20260325125029.GA2107@macsyma.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PQltMVppqNkQSOO1"
Content-Disposition: inline
In-Reply-To: <20260325125029.GA2107@macsyma.local>
X-Cookie: -- I have seen the FUN --


--PQltMVppqNkQSOO1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 25, 2026 at 07:50:29AM -0500, Theodore Tso wrote:
> On Wed, Mar 25, 2026 at 10:19:19AM +0000, Borislav Petkov wrote:

> > I hope you guys are planning on sending the sashiko reviews as
> > replies to the patches... eventually, ofc. Would be useful.

> There's a thread about this, but channelling the Sashiko team (it's a
> separatae effort from Konstantin's b4 project, nb4 is just using
> Sashiko), they want to get the false positive vs useful detections
> rate to the point where the reviews won't be considered annoying, and
> then it will probably be on a per-subsystem opt-in basis.  There's
> been talk of having an option about whether the reviews should go to
> the maintainers and the patch submitter, or whether the subsystem list
> should be cc'ed as well.  But all of this is still TBD.

Right now even where it's accurate the reports it's generating are
pretty annoying TBH due to it flagging preexisting issues it happens to
notice through the same channel as it's reporting problems with the
patch itself.  If they were reported separately it'd be useful but right
now they just make these reviews not a useful indication if there's a
problem with the patches.

--PQltMVppqNkQSOO1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnD3MoACgkQJNaLcl1U
h9D4mwf/WItcJSwq1ICj0qKRgK7+4q9fRw5onu6IfJpcvEHSe8eDwBNP6uSygcyp
+W8ux78a/Wa8YrfAy06XtbV0Qey8MVdoYtG1lvy+ULrC7joTT0Topl1RWfEUTWi4
P3d9ML/k9iD1zGiX0yIaiYdy4TR8YooXTL71NY9JzFEN3YknjMAmwvpCyq9qCFL8
KhqAPm4FPTdBaxI8OYbzRziEfhEZPfE4SBURNLBDtohEzu8E5It+hoe2b3+PtQK1
naBx8GJ7ZcXKt+a+Np4sIP4ZcLkIWHfZFYENXkdSJ3S1jLAcEo4giq6YREsHcgEZ
efUotckj/1Bv7gltncOQ43nfj7f77g==
=HkhK
-----END PGP SIGNATURE-----

--PQltMVppqNkQSOO1--
