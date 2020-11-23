Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web10.34234.1606135323712249130
 for <tools@linux.kernel.org>;
 Mon, 23 Nov 2020 04:42:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=AGvJZLPZ;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: broonie@kernel.org)
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net [92.233.91.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 81C95208DB;
	Mon, 23 Nov 2020 12:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606135323;
	bh=uDKZghVP4FI9ZQAng8j1WbgwRiWlTD2krROaGESJROM=;
	h=Date:From:To:Subject:From;
	b=AGvJZLPZk1Ru/WdZ1cV8wblC0c3wE33NAt7+qmrpqjqv1j0oi5yLhKdOlgtueeQsc
	 9pk3eYFunZXiLSCelqDC8JdHBfqSGvnDDsANf4ShM6y885VMjAmnXLATvWOq6Z7I8f
	 PxzNI11jCnA62lZcDSI8Q13F1oYxQx/mpUpiqkAM=
Date: Mon, 23 Nov 2020 12:41:39 +0000
From: "Mark Brown" <broonie@kernel.org>
To: tools@linux.kernel.org, konstantin@linuxfoundation.org
Subject: Exception with b4 am
Message-ID: <20201123124139.GB6322@sirena.org.uk>
MIME-Version: 1.0
X-Cookie: Dry clean only.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Groupsio-MsgNum: 259
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+g7M9IMkV8truYOl"
Content-Disposition: inline

--+g7M9IMkV8truYOl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

When running current master on Debian stable if I invoke:

   b4 am -P 59 c0efb81064f71837f19408f65b52d155103ee514.1605896059.git.gust=
avoars@kernel.org=20

I get the traceback below unless I remove python3-dkim:

Looking up https://lore.kernel.org/r/c0efb81064f71837f19408f65b52d155103ee5=
14.1605896059.git.gustavoars%40kernel.org
Grabbing thread from lore.kernel.org/linux-hardening
Analyzing 212 messages in the thread
---
Writing ./20201120_gustavoars_fix_fall_through_warnings_for_clang.mbx
Traceback (most recent call last):
  File "/home/broonie/git/b4/b4/command.py", line 220, in <module>
    cmd()
  File "/home/broonie/git/b4/b4/command.py", line 203, in cmd
    cmdargs.func(cmdargs)
  File "/home/broonie/git/b4/b4/command.py", line 40, in cmd_am
    b4.mbox.main(cmdargs)
  File "/home/broonie/git/b4/b4/mbox.py", line 511, in main
    mbox_to_am(threadmbox, cmdargs)
  File "/home/broonie/git/b4/b4/mbox.py", line 117, in mbox_to_am
    linkmask=3Dconfig['linkmask'], cherrypick=3Dcherrypick)
  File "/home/broonie/git/b4/b4/__init__.py", line 532, in save_am_mbox
    if latt and latt.validate(lmsg.msg):
  File "/home/broonie/git/b4/b4/__init__.py", line 1812, in validate
    self.lsig =3D LoreAttestationSignatureDKIM(msg)
  File "/home/broonie/git/b4/b4/__init__.py", line 1639, in __init__
    if not dkim.verify(self.msg.as_bytes(), dnsfunc=3Ddkim_get_txt):
  File "/usr/lib/python3/dist-packages/dkim/__init__.py", line 1291, in ver=
ify
    return d.verify(dnsfunc=3Ddnsfunc)
  File "/usr/lib/python3/dist-packages/dkim/__init__.py", line 888, in veri=
fy
    return self.verify_sig(sig, include_headers, sigheaders[idx], dnsfunc)
  File "/usr/lib/python3/dist-packages/dkim/__init__.py", line 677, in veri=
fy_sig
    pk, self.keysize, ktag =3D load_pk_from_dns(name, dnsfunc)
  File "/usr/lib/python3/dist-packages/dkim/__init__.py", line 423, in load=
_pk_from_dns
    s =3D dnsfunc(name)
  File "/home/broonie/git/b4/b4/__init__.py", line 2347, in dkim_get_txt
    a =3D _resolver.resolve(lookup, dns.rdatatype.TXT, raise_on_no_answer=
=3DFalse, lifetime=3Dtimeout, search=3DTrue)
AttributeError: 'Resolver' object has no attribute 'resolve'

--+g7M9IMkV8truYOl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+7rgIACgkQJNaLcl1U
h9CCLwf9Fx2opcQ9gM64D3vzeiFWM87GWqFk4FETlE2PEoS70MZU6NdTNVV32wlO
Yav83lNudmHAfX1LAV9jRlSolfu6UOUI8KDGftC49U4c3QCvxkDwqWo3pSlNpW+T
6H8vD8RK2HeEoXJjKxKIC7fmh6ZKmU4xRJJj3WHkJAgSTpi/uphUWVQ11M/F9P5J
UlGM1J1fMRY0ZJyOH6nfp2Oz++m9a+rk68Cwg/xmydzGVGqb/vAcC7FD7DHknmd3
lNuZSQm+R/6W/8iO2kpF1RO0YCxgP7iZ1zrYzpJwReQJKza+Ve9DLCaTab5bp7Lw
GKMvMikUIlm8dMJnvUmeqfb59bFfrA==
=gAp8
-----END PGP SIGNATURE-----

--+g7M9IMkV8truYOl--
