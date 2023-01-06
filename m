Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FEB7460
	for <tools@linux.kernel.org>; Fri,  6 Jan 2023 16:25:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ECF4C433D2;
	Fri,  6 Jan 2023 16:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673022302;
	bh=z3ZEEjQ62wxvkDTPjBXCNjHcvlWl/bFTw2vkv+bnMEY=;
	h=Date:From:To:Cc:Subject:From;
	b=dtTc3TYB5GtoZEhdyFX0z+wcmBUsiWzgDM6adg8NYwX8g51w1FbZxbqyY15+tEDoR
	 Mvhpc2he6lMIZjTEBqx6/tgCRgLqTtUfCzkSWK3BYT3QtzzpCt9AnSv4ZbJ3g9XkF2
	 v6eBM2iUFoFl/wFL45hLFhbt0Mx2j6eJJON/uK7NDlrqZUomnZfV2Jo6r9q+E7y+a4
	 TepaZLXx0zHDUHEglpGkkXcW2zgdErSNfA4KvAi24dMnPQphWuT/s10pxhu/DUQ7N9
	 WIR2JRkbg/b365vgo2FYBoE06G3V4b6GUGheJl3pl7Zj/zqRTC2pyu8kA0h2JLpD14
	 oTrC609ImxcAA==
Date: Fri, 6 Jan 2023 16:24:58 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools <tools@linux.kernel.org>
Subject: b4 am doesn't fetch all recipient headers
Message-ID: <Y7hLWvgqqJCK7+yM@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6q7M4yB9L7ltlWMS"
Content-Disposition: inline
X-Cookie: Do not fold, spindle or mutilate.


--6q7M4yB9L7ltlWMS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Konstantin,

At some point recently b4 am seems to have stopped including any To/Cc
headers in the mailboxes it fetches and I can't see an option to get
them back.  They're not needed for the am itself but I do find them
useful in my workflow, what I'm doing is grabbing the mailbox with am,
putting that into CI and then ideally if there's a problem I can just
reply to the mail in the saved mailbox to tell the submitter.  I can go
and get the mail with all the recipients separately but it's an extra
step.

Thanks,
Mark

--6q7M4yB9L7ltlWMS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmO4S1kACgkQJNaLcl1U
h9Bjswf8CxTMM9lvp1eT3uz8wLKdtbLz2QgJELIYGTi8iGtMu7A7fhDgds8gcSBP
u+mHtGvFiAVww3cz20LaHdaW++ct2y1fOQMUKVxzUwYQpwvmFeJoF98wnwfowTMA
5xijLGIrviszBYOZmxAh+XmPkkZU/++SqZUEH9PR1AoSKUzX1GRJC/nZNe54eCWK
JftmZJOJqnipOWWatMrylUIGWYdH5W6jydsm06QQs76tzpkziUChVzdykUY45jds
1IIPQQeAFCy2yOihYnVfRS/QywaMav9yKF5+XeGh6WMWYMof5YP02ZZFSnfrKosb
IPTHHoLbA8Ev42NTc0o7QJRFZk4caQ==
=YyDA
-----END PGP SIGNATURE-----

--6q7M4yB9L7ltlWMS--
