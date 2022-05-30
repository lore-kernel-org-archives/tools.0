Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794CB2F38
	for <tools@linux.kernel.org>; Mon, 30 May 2022 13:39:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7F8DC385B8;
	Mon, 30 May 2022 13:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653917945;
	bh=pNdU71r90g9NL9tBI1CTP/LAcQX1E3XOo6nUZVubvMs=;
	h=Date:From:To:Cc:Subject:From;
	b=S5DSgCixFCHLKtamg3c+2jfbdr0IWYKrlOJE8gyHQifI3FfXGVTrD3E1mPAbJQE45
	 Moo7NSrTW66oEK7mjh9ZgvTPSnYnitRfYL6/bIEpB9dAHjmumFHPUdrJdpFU5Akv9E
	 gIMma8lZTTAAPITgu5TL3UPE7+ifnBriEDTmK8QpHw6EnYnlb6Na7KOG8xwpMQJEN9
	 YxeGWoQBxzHLKYxM9xu4hghPJ5OXnaVGbSHBqlwHHLG37mSYUjx2auu4k2CWBLy2fm
	 kUS5PaH6Ojdim7PZYIkz17qwAnDJnhMjUzZUvIT6AkSur9Dfflf/+XCmaFKXBUee89
	 Od/xJLccgzYUA==
Date: Mon, 30 May 2022 15:39:02 +0200
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Fetching mails for b4 am
Message-ID: <YpTI9lhCfA7shi6j@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="R3bzAQ1A/GdyHAnp"
Content-Disposition: inline
X-Cookie: Oh, so there you are!


--R3bzAQ1A/GdyHAnp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Konstantin,

I'm using b4 am to fetch patches and generate notifications that
things have been applied.  I can't figure out how to make it
fetch the patch:

    20220529141250.1979827-1-u.kleine-koenig@pengutronix.de

It's been sent in reply to an earlier thread and b4 keeps on
picking the series the original thread rather than the single
patch that is this reply.  It's not an insurmountable obstacle
but since there was a subject change it feels like I should be
able to pass an option that tells the tool to ignore the rest of
the thread when working out which patches to download.

Thanks,
Mark

--R3bzAQ1A/GdyHAnp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKUyPIACgkQJNaLcl1U
h9As/Qf/SwfnwrwFZEjcAlZHUHmR3kqtSMympFAHC4T9CK4lfx3uEHsIIKSsfYDw
PyTt9OsPr1YpQsVrNg613d0OiAGuWolj8c0oGMfoR4MnAf3R+C1Bf3elBdOuxePn
PVu9gJn6WvBUQ1uiOb6pmiXbFUN1vf686ZVoq+OYCXa9C+RTt4kFcnkxNEyyk0q+
VIopHGZrNMUh5BhQbgIvR8h9UvXsDCCBqhsF9NzG5ZSvH1//n3QnBEQ0a2Bv4EIp
kD/Dgn8lxCZcraF3KFCQlldwYjsh7pRlCu5SFrsW2qGnrKFMogCxxj0duJQkKUl9
E7u7Knq4YFV5vK7whlZxW+PMq6DcGw==
=TCHA
-----END PGP SIGNATURE-----

--R3bzAQ1A/GdyHAnp--
