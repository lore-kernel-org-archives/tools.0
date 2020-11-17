Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web11.7001.1605615308620825131
 for <tools@linux.kernel.org>;
 Tue, 17 Nov 2020 04:15:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=S4CJzjcV;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: broonie@kernel.org)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 3282E2223C;
	Tue, 17 Nov 2020 12:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1605615307;
	bh=lx3ZeR35Pur78GrskKtRdpKI5TNWKudMuHQxo5UV6nk=;
	h=Date:From:To:Subject:From;
	b=S4CJzjcVTMCGlmIt6zUawaEqDpHLPGjZfOovNujfqxN713qmeFMFotcNUqJ3vKX8R
	 uFFxxpojVgF6fzFt7TxeSMhhlpNniTQ8oX5sCNBQuzvTvvCfKxO+mSnmzvBWZJ/TgN
	 gqrRaOovTVNRT73ScmqK31kw3dmcWvrvKoNEJzts=
Date: Tue, 17 Nov 2020 12:14:47 +0000
From: "Mark Brown" <broonie@kernel.org>
To: tools@linux.kernel.org, konstantin@linuxfoundation.org
Subject: Exception with b4 am -3
Message-ID: <20201117121447.GA5142@sirena.org.uk>
MIME-Version: 1.0
X-Cookie: Pause for storage relocation.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Groupsio-MsgNum: 253
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6c2NcOVqGQ03X4Wi"
Content-Disposition: inline

--6c2NcOVqGQ03X4Wi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

When running

   b4 am -t -g -3 20201116040721.8001-1-rdunlap@infradead.org

I get:

Looking up https://lore.kernel.org/r/20201116040721.8001-1-rdunlap%40infradead.org
Grabbing thread from lore.kernel.org/linux-spi
Analyzing 2 messages in the thread
---
Writing /home/broonie/queue/spi/next/20201115_rdunlap_spi_dw_fix_build_error_by_selecting_multiplexer.mbx
  [PATCH] spi: dw: fix build error by selecting MULTIPLEXER
    + Acked-by: Serge Semin <fancer.lancer@gmail.com>
---
Total patches: 1
Preparing fake-am for v1: spi: dw: fix build error by selecting MULTIPLEXER
Traceback (most recent call last):
  File "/home/broonie/git/b4/b4/command.py", line 238, in <module>
    cmd()
  File "/home/broonie/git/b4/b4/command.py", line 221, in cmd
    cmdargs.func(cmdargs)
  File "/home/broonie/git/b4/b4/command.py", line 40, in cmd_am
    b4.mbox.main(cmdargs)
  File "/home/broonie/git/b4/b4/mbox.py", line 511, in main
    mbox_to_am(threadmbox, cmdargs)
  File "/home/broonie/git/b4/b4/mbox.py", line 155, in mbox_to_am
    rstart, rend = lser.make_fake_am_range(gitdir=None)
  File "/home/broonie/git/b4/b4/__init__.py", line 681, in make_fake_am_range
    if not len(lmsg.blob_indexes):
TypeError: object of type 'NoneType' has no len()

Omitting the -3 causes things to run successfully.

--6c2NcOVqGQ03X4Wi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+zvrYACgkQJNaLcl1U
h9ALmQf/ZvnDgPgLPL38o4fAvI2cdw2Hnz1DXaBLgg6L8lgZPSt55A3pHjy12kJL
WcmHHmn2PkzgRWdbsj5pSW9bVG8lkow+jR0OzH9tb1MX0m0Zb3nl7gOfu/4kmBnX
pf7ABubdkvz2kfF3XYOiyJAMmYpC6ezg8L8J/iDLMXX2zQfS4wF3qcJT0fIcUDH8
sgfkljIa+PUrOvnU9NdInI+ULobGqYh/DugqQEZIYEyJKg9ZmfraObv3cI1XOtqG
U0Sod6dvlCFG3aKcWAKEcPqJ2s2xNbsEF0tR3gKT1LMmQjkIqsHi0b+xoxqn1JvW
pcGbF3g+DL7wzOttyFJ11nfZosXF6Q==
=murC
-----END PGP SIGNATURE-----

--6c2NcOVqGQ03X4Wi--
