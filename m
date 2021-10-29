Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21D22C82
	for <tools@linux.kernel.org>; Fri, 29 Oct 2021 21:03:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E406560FC1;
	Fri, 29 Oct 2021 21:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635541399;
	bh=gEMOMSowdWnK3tQ247Rm4Nfni6jLj3vXpDvQ5+pJIp0=;
	h=Date:From:To:Cc:Subject:From;
	b=bVtOR61GCPxNl00pwE1mHKF+WMlCk+dsQMLcR5/5tfZolSw44VW3eJR24qfHnMC0E
	 1t3QKYcx4vc09qO/55R9ACLfs/3zu4w9i7mR2AQsErw1M3ECQcu2D840UqGnd4VdH7
	 MQOa5GBgMaHeYduGAJkquozsRNum3VL+XHV+GLen+HzgCJaiBAtbAFCTAMeC2NbAsK
	 6qyhRhGwZTZYr1Hub1efEdobGYu1y+axxHHaM7GGWXihJXoaETDaccRgWBvFaIFSaq
	 I4cYBLoknuTrCBfe0c5+foh9fWN5Mj+qJ17ZB3ImxaCP0fgOeDurjDSDduSpzs0Lsh
	 CI0wI7mFnULTw==
Date: Fri, 29 Oct 2021 22:03:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Crash generating a thanks
Message-ID: <YXxhlEuodVLx8KjI@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fPWVTCJTY3+0A+P4"
Content-Disposition: inline
X-Cookie: Dr. Jekyll had something to Hyde.


--fPWVTCJTY3+0A+P4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Attempting to generate a thanks with current tip:

750286a7aba7dc091b4407c9f31157129aade588 ty: fix bugs introduced when switching -s to -t

I get a traceback on one particular patch:

Sending: Re: [PATCH] sound: soc: tlv320aic3x: Make aic3x_remove() return void
Traceback (most recent call last):
  File "/home/broonie/git/b4/b4/command.py", line 287, in <module>
    cmd()
  File "/home/broonie/git/b4/b4/command.py", line 270, in cmd
    cmdargs.func(cmdargs)
  File "/home/broonie/git/b4/b4/command.py", line 96, in cmd_ty
    b4.ty.main(cmdargs)
  File "/home/broonie/git/b4/b4/ty.py", line 661, in main
    auto_thankanator(cmdargs)
  File "/home/broonie/git/b4/b4/ty.py", line 377, in auto_thankanator
    send_messages(applied, wantbranch, cmdargs)
  File "/home/broonie/git/b4/b4/ty.py", line 443, in send_messages
    smtp.sendmail(fromaddr, sendto, msg.as_string(policy=mypolicy))  # noqa
  File "/usr/lib/python3.9/smtplib.py", line 859, in sendmail
    msg = _fix_eols(msg).encode('ascii')
UnicodeEncodeError: 'ascii' codec can't encode character '\xf6' in position 55: ordinal not in range(128)

which is:

	https://lore.kernel.org/r/20211019074125.3812513-1-u.kleine-koenig@pengutronix.de

AFAICT.

--fPWVTCJTY3+0A+P4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmF8YZMACgkQJNaLcl1U
h9CA0Af/ZHEYrimQQwJ0yinXPdasbUXOC23X6LuDq0hkBQHTS6a3TV0XeFAwAtQj
RG+uwTKZnQeHi7/WIDN7wo5WsOFDc4xxgiksxgLnkzYNknv8JybxPVK1bZyDPjmN
kp31aJZi8hoUSR0YPId3HiZrsUHPpsw6enK/8xEiF98jAo4D2j2vEZLXgzKNstNe
6cFdkuGv5spL7KHg76/IAWMY74Z71FutvE5oLuJWmzSgKjfMn1a3NlEbAHoRB48B
DMqCEToK/ejoNGhAQHxbvvzVa6jPpNVSoIUAszJmgz4/+gC93Y/f0TZGWNWcGfH5
PoVfpAm3t6Gp71G/bXzEaGeGlakQkw==
=2wrK
-----END PGP SIGNATURE-----

--fPWVTCJTY3+0A+P4--
