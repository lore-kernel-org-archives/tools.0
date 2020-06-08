Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web10.28049.1591616793671089942
 for <tools@linux.kernel.org>;
 Mon, 08 Jun 2020 04:46:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=pIsh8I2B;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: broonie@kernel.org)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 5A7E32074B;
	Mon,  8 Jun 2020 11:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1591616792;
	bh=ouBe/eRfl48LFucL25+GjLORAEKaC2SC31SieTVbTUM=;
	h=Date:From:To:Cc:Subject:From;
	b=pIsh8I2Bp/VvpdQVfXtE74eYKk+2dfoF/7WogOIelYZZauA1YWVAr+g6sulosRwD3
	 scT06j98zgxSfh/Cea4lO7QkMYIJFqCOEo94AEx4CpT41p/XwR2VewZmQC0CksgDPA
	 pc62gXbVmCJObMKdVTJWsLMO8RrCJ8in0yE1xB4o=
Date: Mon, 8 Jun 2020 12:46:30 +0100
From: "Mark Brown" <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Tags placed incorrectly in malformed messages
Message-ID: <20200608114630.GE4593@sirena.org.uk>
MIME-Version: 1.0
X-Cookie: I'm rated PG-34!!
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Groupsio-MsgNum: 170
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vmttodhTwj0NAgWp"
Content-Disposition: inline

--vmttodhTwj0NAgWp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

When fetching the message 20200606153103.GA17905@amd b4 picks up the
fact that there's a Reviewed-by but places it at the end of the message
after the body of the patch.  This seems to be triggered by the fact
that the patch submission is not in a standard format, lacking the ---
separator after the commit log.

Thanks,
Mark

--vmttodhTwj0NAgWp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7eJRUACgkQJNaLcl1U
h9DJuwf/X2fgfrIY5TqaqWaylOIaTxBo6YuDu+xdehG4w6bLzsk4HF7xEwl4OeZj
Ne+MCCRKhfKS4RjnEZIqreTuTzpyVC+23ElNuwOeXe76RzlnzWirwJCyCdBOYdCH
BVRJuRMuYVwciCYmauerblFnYsg70gEmL4QFwEHtpipYUguWfAhSPMlh0ph/5bzF
tFyLffBWiJc0TYzlJu5hbmB7yAXHpNMDJSh2YNV6C3W2tHYKM3HfKhNHeSGYjjeS
gw8xi8ujhkvKdrVh0okUldavlwpuPkcU8gdZxb1veFJrl+bnQjS8HDr+mfL4oT/g
A5fJnmisHcPymBKn6ZRInczvXLn8CA==
=9Od4
-----END PGP SIGNATURE-----

--vmttodhTwj0NAgWp--
