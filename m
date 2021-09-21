Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8387F3FC0
	for <tools@linux.kernel.org>; Tue, 21 Sep 2021 11:56:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AFC6C60EDF;
	Tue, 21 Sep 2021 11:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632225388;
	bh=/4/UCK3gkJBndhDf47U/sfAEC8iG8Ts4KHzFu5LfkN0=;
	h=Date:From:To:Cc:Subject:From;
	b=Ro1BzfmJgqW5w7T4FHT7Yx49ZZwREtopOl0Qvm+VaJ+EI2s/P11EF6nfZZWpxYCRx
	 6d7KIRCdaVqK2jDnnouSbSDyW/RyBEkHrN1XxdZa484OHeabjFnkhQ+nGi90R8GG4H
	 I9zzKHx6SQn73Rfwu6LF5FmJzCnDE3kEfzBkBomDMgOUL9Fl/TvRVOiy/UFsqR7Qze
	 vANyrBnHhQovJh9/lQOV5mvE9KDUqBO6yU7xV/frcPEsQJKzN2o+5yh9mLsC4hVRXi
	 9t/sHKjvc2HRwQ+HANNev+fjwVZ3ddSwShukg2BE5ekDruH5y+hEJavKbve8MliSux
	 YbnPoomJNJ0rA==
Date: Tue, 21 Sep 2021 12:55:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Issues escaping Froms
Message-ID: <20210921115544.GB4203@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mojUlQ0s9EVzWg2t"
Content-Disposition: inline
X-Cookie: Quack!
User-Agent: Mutt/1.10.1 (2018-07-13)


--mojUlQ0s9EVzWg2t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Attempting to fetch 2d221984-7a2e-7006-0f8a-ffb5f64ee885@axentia.se with
b4 am I get a mailbox which is for example interpreted by mutt as:

->    1 N   09/16 Peter Rosin     (1.7K)
      2 N C 09/20 Peter Rosin     (  0K) [PATCH] ASoC: pcm512x: Mend access=
es to

Due to the fact that the message has a From line in it as well as a
=46rom: but that doesn't get escaped by b4 so mail software interprets it
as the start of a new message in the mailbox.

--mojUlQ0s9EVzWg2t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFJyD8ACgkQJNaLcl1U
h9DzSQf/ZchYfgiaaNhkBhBko/PHEE17MuwPdCffUHRznjLyYvlZynhFscO9SG49
N7rkNen0+bPLHF02J8CIFVMFdIqzE84O4q3aI+E6gHP92v3H5EU/57NYn+DnBxXZ
5SMcvKEbIOP7pH7Ehx+ClTjiRau2fgDITgYNMg4nOfVzUT8cbGkiXMASg5d9Owbw
6RX6KKQ/m7zziiumjtfBM3owJsa6SQuK3c/pYDvSoQ1mwDLYI9khiUipv7dYsVVV
uMpuYcEe3ZVUNrF/cUw/0UFWH7DpxZQ+v/NDXqZ/RicVkaFJleRH/2ckBuOTPz91
v5Zeds5oVp6P5DOzFRbVLQwd2gOH7A==
=r2MA
-----END PGP SIGNATURE-----

--mojUlQ0s9EVzWg2t--
