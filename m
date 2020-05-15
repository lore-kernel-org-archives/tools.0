Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web12.19331.1589565945346933595
 for <tools@linux.kernel.org>;
 Fri, 15 May 2020 11:05:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=BnErDjw2;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: broonie@kernel.org)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 4857F20657;
	Fri, 15 May 2020 18:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589565944;
	bh=HXVXB3QTcPyDgj4z+FS5e05OrBdMJW985Xf7HBbZ1WE=;
	h=Date:From:To:Cc:Subject:From;
	b=BnErDjw2J7HmKDaIr2JE03pNI2sSyG2ZE+lKShWeRoONxbCMXmm3rK63l/8RKyKh6
	 U5D8Y4dFQwglKkF44PE/CCPdugdbip+rJAjbu61aBxmzAjOiLOSb2SnGjA4AkNJg0f
	 DsXa5NokfkdLNSLMylPLIxoSibUQe8W/+a0gg6Tk=
Date: Fri, 15 May 2020 19:05:42 +0100
From: "Mark Brown" <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: b4 ty issues matching remote branches
Message-ID: <20200515180542.GM5066@sirena.org.uk>
MIME-Version: 1.0
X-Cookie: Avoid contact with eyes.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Groupsio-MsgNum: 159
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q8dntDJTu318bll0"
Content-Disposition: inline

--q8dntDJTu318bll0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Konstantin,

Having updated to the latest master a command like

	b4 ty -b remote/foo -a

has started to report errors like

	Requested branch asoc/for-5.7 not found in git branch --list --all

This is true since "git branch --list --all" lists remotes as
remotes/name/branch while most git commands accept name/branch (and git
branch -r lists them as such).  For some reason tweaking to add a
remotes/ on the front doesn't seem to work either, even though grepping
the output appears to confirm that the branch is there under that name.

Thanks,
Mark

--q8dntDJTu318bll0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6+2fUACgkQJNaLcl1U
h9Cm3Qf/SiDmei32WBM6ixDkrXvmd3TJnYjFez49ExZs/yOoyII4jBpaPpjJE7lB
b+msJ2N73zYL/+5/Y+2YU+GSM1Lrt9D1z1KdWpJbAsEHOT54S/0t8bLEkMGzOUvQ
fO+ngSP+J0N+4ExKiM/Cntm15yT5uJPf7K2u8/A1wgw5AmG972esIGo66gO/zmCc
F3obRQwhDI9LU5ltnJVzcuDmEmv0xHdKzDcn8tGYxJyBQe2nORF/D7JQ0MLLWFQK
D/Fz6wXGBV1HPS7jsdTVgGjhQOPzsuju2s0IUqQAlyaOf/BYPYz0Z05hjSqanOcl
zJ/JlN2gcKq8jD3SiJIu5wfpYFJ5jQ==
=arR9
-----END PGP SIGNATURE-----

--q8dntDJTu318bll0--
