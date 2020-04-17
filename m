Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web12.3888.1587138274239168103
 for <tools@linux.kernel.org>;
 Fri, 17 Apr 2020 08:44:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=NGTJ/AKV;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: broonie@kernel.org)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 2832220857;
	Fri, 17 Apr 2020 15:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1587138273;
	bh=wtC93vDUt4a1triqa/Xp/tZ8romfHLt0CEv97/S8XG8=;
	h=Date:From:To:Cc:Subject:From;
	b=NGTJ/AKVMIFsZ97qUh2Soi0Oivo6gkqzjCS+7ZrzjH10WmYpImBsd41rUe93iLqRv
	 Yg8p80aGmFvoJlFEKKJIVExqd1Z00UOg2sfCvGECi7lpt4sP/xcf0nJDPVmMNKrrGN
	 ULlKUjZETTeptgbKPyji3NdeepNVHv9jIME3RMEA=
Date: Fri, 17 Apr 2020 16:44:30 +0100
From: "Mark Brown" <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: b4 ty feature requests
Message-ID: <20200417154430.GG5315@sirena.org.uk>
MIME-Version: 1.0
X-Cookie: MOUNT TAPE U1439 ON B3, NO RING
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Groupsio-MsgNum: 86
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QWpDgw58+k1mSFBj"
Content-Disposition: inline

--QWpDgw58+k1mSFBj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I've started using b4 ty to generate thanks mails in production and it
seems to be working very well for me so far, thanks!

One thing that would be nice would be mechanism to supply some
additional values to be filled in the templates - I want to be able to
tell people what tree and branch I applied things to.  A command line
option to set the templates might also work but would be clunkier for
me.

Thanks,
Mark

--QWpDgw58+k1mSFBj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6Zzt4ACgkQJNaLcl1U
h9BMawf+MV6ssqLgUqSpIpS3vLg8XyFvWUmoakHxfuWKLG++LYeYmrW+0USfOtx3
w9REAX5BeIdpDn4wkqNRQgdSGUoBeHQTL7CRBECAdmst5Ep/fp0wp5KNQP6qd7P+
9nnKvmv3pYnGh4ZUIPYE2RO6K0yIu4C6aerpmAs41YvRvXNOsvWl+IfpanJrcNRi
ALgnqDiV2B125Mo7xpXi9Sn3M8lp6rQv3Otpio7ZkJlXFc0RlX1xXeW0ppB+/JcL
bapdp5wfjt/qyrxTu4ER2KM5EVwhCdbjzqT31E0zzGHcST5shPTdz+z4kStMt2ui
ysLE4d0YOzezcfWOqnNosR/s8vKW9Q==
=jMmI
-----END PGP SIGNATURE-----

--QWpDgw58+k1mSFBj--
