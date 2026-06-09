Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85B8261B71
	for <tools@linux.kernel.org>; Tue,  9 Jun 2026 23:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781048181; cv=none; b=O4mKExNVkfsB1Ipy8cAS02RdCG7gEqEMhiJt3+6qn8fD9Z11cRdrDbuXazuSwpUMtsMZz4cRckywKkrZiLkQsypRA+K1C4RESoXvl2V3Uw0LyPJSERTrHfeanol5wg/RdUNx+UtVASPfMtWw96EYST884rrvKwviJLJc3IS/1po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781048181; c=relaxed/simple;
	bh=XpXR6owPgXRVmlwp/c8uo2g3fGrjY9ZzRXhfrdh5Z4w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QP2LMihH9bz9UQyJdhgA6DUu4Lg9rHZUQyc02887w9JdgPCKUq26I5JQ8VL+rR2CaDnkxck/K0lG/hV1xXVmQLNwEI+0w5RAr/rjiDVXb4YNpbwo+aqCHFlr5NKbMWp95nwOs/4Mb+5UVolWuxNlG26UmwvLjEKokTR+XlOwk0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BSspygKu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BSspygKu"
Received: by smtp.kernel.org (Postfix)
	id 811BF1F00898; Tue,  9 Jun 2026 23:36:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 414291F00893;
	Tue,  9 Jun 2026 23:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781048180;
	bh=XpXR6owPgXRVmlwp/c8uo2g3fGrjY9ZzRXhfrdh5Z4w=;
	h=Date:From:To:Cc:Subject;
	b=BSspygKukj9O2xaPk6fGaR87CzVDXx4MhFQ7hzpwvtrknHAnRtsDuJ2LkF+ZjljYf
	 R6r4dWYlW888n7I66BZ3PdKyF7H+pKfsfkwlgRo0aUs8cB9lMxaGvpWLQtUwYsMd8t
	 jTKXy5lzjbYbCZ3KUkrqTe5Cr++qMzngzSxkTqx9vBrbJmA0UA5vRZiy+sTC9/9vNI
	 4PcQDNAz0V6YTsA3mhIdR1vV96OnO7jyd+7aF+cvOhI1llYLLEWnPkOOIuGaUaNvCM
	 aW6M3KUklTzWY14xXt5gH1XZkEDPtGvZiDCaDNcNWP1kKaDH1jNEk735L5xrl7VGDC
	 +6BWbNdB4ZtSA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 767BF1AC56BF; Wed, 10 Jun 2026 00:36:17 +0100 (BST)
Date: Wed, 10 Jun 2026 00:36:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: b4 review can't use merge strategy when skipping patches
Message-ID: <aiijcYQInbjJ3kT4@sirena.co.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YMcfvxzQSUDjRKbR"
Content-Disposition: inline
X-Cookie: Leave no stone unturned.


--YMcfvxzQSUDjRKbR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

It's kind of annoying that b4 review can't use the merge strategy when
applying a series that has skipped patches in it, it means there's no
way to include a cover letter even if that cover letter is very good.
Skipping is very common with multi-subsystem serieses, especially when
DTS updates for some SoC or board are included along with a new driver.

Thanks,
Mark

--YMcfvxzQSUDjRKbR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmooo3AACgkQJNaLcl1U
h9DvmAf9E/Cx7N2oKLBkFY5LuBk98DppEUp9ndzaox8etXJSfwk1WHFoaj/yNOhT
nj9gjOYzI5Ne7X0otbEiGBe1V/K77eCVspV3+Lszl4X0b5tPCSD2bGmub100GAoO
AIPtkraueEak6W61jHykH7msed1vvXioHBHVQsmx9VGrNCaJc/WVhpotrojie0eX
REsYUEbLMLEK5WoImvFuB4uUTKdJH5HVMWTUPJfYgdllJst3H9KhkTRWuwya7x21
xc0H2HpixKQT4TG0WOTh2ungbWVlGxMnKsxbAK+hjsDAhmsL7wlJJQh8KMK9/thj
XqtAB2aDlmykUZBNg2Jxg/7CPTL3Tg==
=UbzK
-----END PGP SIGNATURE-----

--YMcfvxzQSUDjRKbR--
