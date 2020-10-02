Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web12.5565.1601673231124600439
 for <tools@linux.kernel.org>;
 Fri, 02 Oct 2020 14:13:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=e4iYrxsB;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: broonie@kernel.org)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id D0291206DD;
	Fri,  2 Oct 2020 21:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601673229;
	bh=Sa829197iRSPuqvT/fsIGe/W9j2QyZvjiAeMSNmbjrw=;
	h=Date:From:To:Subject:From;
	b=e4iYrxsBbcbeX7KzTILbGl0IcuN62Kn6fwvjeu/14F/Guyt+wJkOvXwmFo2Etncqw
	 NHEhMnDKbIgHWhzYhiUFGG922gH8Jt3kAHMfS+qPTKPK9qoDkRl7/TbpZjOF0L7SSG
	 yf+AvjyQs+IvicyP9qqe3MONaSqsT+7NlwXQo2IE=
Date: Fri, 2 Oct 2020 22:12:48 +0100
From: "Mark Brown" <broonie@kernel.org>
To: tools@linux.kernel.org, konstantin@linuxfoundation.org
Subject: Exception from b4 ty
Message-ID: <20201002211248.GI5527@sirena.org.uk>
MIME-Version: 1.0
X-Cookie: Words must be weighed, not counted.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Groupsio-MsgNum: 218
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KrHCbChajFcK0yQE"
Content-Disposition: inline

--KrHCbChajFcK0yQE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Attempting to generate thanks with b4 ty -a using current git master I
get a traceback:

Found 41 of your commits since 1.week
Calculating patch hashes, may take a moment...
  Located: [PATCH v3 0/9] Some fixes for spi-s3c64xx
---
Generating 1 thank-you letters
  Writing: /tmp/tmp.CwdU649vJ4/l_stelmach_samsung_com_patch_v3_0_9_some_fixes_for_spi_s3c64xx.thanks
Traceback (most recent call last):
  File "/home/broonie/git/b4/b4/command.py", line 239, in <module>
    cmd()
  File "/home/broonie/git/b4/b4/command.py", line 222, in cmd
    cmdargs.func(cmdargs)
  File "/home/broonie/git/b4/b4/command.py", line 60, in cmd_ty
    b4.ty.main(cmdargs)
  File "/home/broonie/git/b4/b4/ty.py", line 629, in main
    auto_thankanator(cmdargs)
  File "/home/broonie/git/b4/b4/ty.py", line 384, in auto_thankanator
    send_messages(applied, cmdargs.gitdir, cmdargs.outdir, wantbranch, since=cmdargs.since)
  File "/home/broonie/git/b4/b4/ty.py", line 431, in send_messages
    fh.write(msg.as_bytes())
  File "/usr/lib/python3.7/email/message.py", line 178, in as_bytes
    g.flatten(self, unixfrom=unixfrom)
  File "/usr/lib/python3.7/email/generator.py", line 116, in flatten
    self._write(msg)
  File "/usr/lib/python3.7/email/generator.py", line 181, in _write
    self._dispatch(msg)
  File "/usr/lib/python3.7/email/generator.py", line 214, in _dispatch
    meth(msg)
  File "/usr/lib/python3.7/email/generator.py", line 432, in _handle_text
    super(BytesGenerator,self)._handle_text(msg)
  File "/usr/lib/python3.7/email/generator.py", line 249, in _handle_text
    self._write_lines(payload)
  File "/usr/lib/python3.7/email/generator.py", line 155, in _write_lines
    self.write(line)
  File "/usr/lib/python3.7/email/generator.py", line 406, in write
    self._fp.write(s.encode('ascii', 'surrogateescape'))
UnicodeEncodeError: 'ascii' codec can't encode character '\u0141' in position 35: ordinal not in range(128)

This is with commit ca6d35e7728c17b505e6 (Fix some cherry-picking corner
cases) on

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks,
Mark

--KrHCbChajFcK0yQE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl93l9AACgkQJNaLcl1U
h9DsPAf+KElZQbYjAzAdgSsLFxE37HuUYvMr8NuN3Ci2djt7Y+acF0cCCfPFKUr9
T1+O5yXhQEhHRFwCiQoRWsJ0UcOEJvfebAafhewXqSkvB0NQ+/OnXfzlbO7+KbyN
+taMFKzCFhBCs7vaPG5h4o14IXfayOUOZajLd7mbdm2KxS88feLPxhdXDqggD/Jy
9LuadtPjhjLNJ8W2X2nFkarywAE11r/2ii8nfqESCk54cugdUa5CI2zOZAqaqbH/
+WTAgvuM++GEEGzpU6xeawG5v+UqRb64yVBZt5g8/j+ymlPJJ5U3yPNe7Wp620Yg
ePjTj8CTmjslgZ7u7Fw/ROIFa9qE6g==
=cgA8
-----END PGP SIGNATURE-----

--KrHCbChajFcK0yQE--
