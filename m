Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web10.1621.1589218087102717686
 for <tools@linux.kernel.org>;
 Mon, 11 May 2020 10:28:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=bMlS6mXg;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: broonie@kernel.org)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 93409206D7;
	Mon, 11 May 2020 17:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589218086;
	bh=MrV9otoJTuUDA58SQ7JaQArPTHyETzRu/reOQspOzBg=;
	h=Date:From:To:Cc:Subject:From;
	b=bMlS6mXg4X14FHDYdDVsTtTMTdLA2nggutuJ/oIf54aqb1eo1q42zHRvRhdx2szTo
	 9jq7k+QSJpwtu2rpTgEzfC+Yy857UQsffN/6/0u1gWCPTXuwWSao927x90qgGevO/3
	 ttsiNqie7aw+0CFg4ZJTUsD+5S/dVbmjNbc6KbQ8=
Date: Mon, 11 May 2020 18:28:03 +0100
From: "Mark Brown" <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: b4 ty issues with no patches matching
Message-ID: <20200511172803.GI8216@sirena.org.uk>
MIME-Version: 1.0
X-Cookie: TANSTAAFL
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Groupsio-MsgNum: 148
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h3LYUU6HlUDSAOzy"
Content-Disposition: inline

--h3LYUU6HlUDSAOzy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Konstantin,

Since a recent update when using b4 ty -a to thank for everything that's
applied in a given branch it started generating thanks mails for patches
that aren't in the branch at all:

|  WARNING: None of the patches matched for: [PATCH v1] ASoC: rsnd: add interrupt support for SSI BUSIF buffer
|           Please review the resulting message
|  Writing: /tmp/tmp.f58uBPLZuA/giraffesnn123_gmail_com_patch_v1_asoc_rsnd_add_interrupt_support_for_ssi_busif_buffer.thanks

which then causes further problems as b4 expires the patches from its
database.

Thanks,
Mark

--h3LYUU6HlUDSAOzy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl65iyIACgkQJNaLcl1U
h9CJJggAhCgekciNCIg/EBK3d4NdgN6ZOqzc1zxq17JMIp9dZ63ezi2QUwl7lh5J
Zx0Zvvj0taNb6hJF8Px4nqsFMgPcnadDBECvl9lsztq2mX6IhmC5sNIKstLlsPM6
d/oJUN5IHRxRLpEarRaQDpYwx4HTyNebF+raHogNCvtNc2ccia3Q0VKAqBvrfYM8
8KYSpVrKa1fcrqKX2wi6/IibhRPXMSurp2nmwnoVjKCYVzeSKu1TjfSmPRCdeXKh
dUmNCCX6xKVRC6fRe9++jl8owE2TDwkxncAbI+046xh5Mt9HA98mEvkuD52GqOCz
EZlbsUK9R61fZ7oqNeW4IOePpNnsEw==
=ATNB
-----END PGP SIGNATURE-----

--h3LYUU6HlUDSAOzy--
