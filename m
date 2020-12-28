Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web09.47506.1609172049018276982
 for <tools@linux.kernel.org>;
 Mon, 28 Dec 2020 08:14:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=b+qZAE8p;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: broonie@kernel.org)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F089D207FB;
	Mon, 28 Dec 2020 16:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1609172048;
	bh=13U9t+oidKoAiI3+DrGbOk8mnjV2FdPdzzlNlQl+PI4=;
	h=Date:From:To:Subject:From;
	b=b+qZAE8pRIEYE2jEOUZxoyTND0T++1F23QptuM1zrHzlBLVuFDDe39tmvbLrFV0ct
	 kzIngntgxFyEVABSy/0zrIYvuT7WhFPO5r5j5tpa0Z3y7nI/XqFDMGxIxwD5Q/3srC
	 U3hkVy5AD7N2LGnotkEKGtzSlav/Sta23lAJm7eDakhfAe9giZUu7ubVGS1fleSUGw
	 tp+FY+mhs8Ah9EYW0jONq8nuYcczKB0Fm3yV4fVJJymCLHuwOPCsqrX7PQDPun+8Q+
	 63GNW/pF0WSEFI0fwYoAnHMOCG39Fpj0cZFHbo3ri/pr+os3ZVA1GZduFQE+3l3unF
	 EDXijvp7YbmPQ==
Date: Mon, 28 Dec 2020 16:13:47 +0000
From: "Mark Brown" <broonie@kernel.org>
To: tools@linux.kernel.org, konstantin@linuxfoundation.org
Subject: b4 ty unicode crash
Message-ID: <20201228161347.GD5352@sirena.org.uk>
MIME-Version: 1.0
X-Cookie: To see you is to sympathize.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Groupsio-MsgNum: 331
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OaZoDhBhXzo6bW1J"
Content-Disposition: inline

--OaZoDhBhXzo6bW1J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

When I run b4 ty and it finds what looks like:

   https://lore.kernel.org/r/ec66399502514edbb1de3cf9bff08b1d@realtek.com

I get a traceback:

Generating 4 thank-you letters
Traceback (most recent call last):
  File "/home/broonie/git/b4/b4/command.py", line 236, in <module>
    cmd()
  File "/home/broonie/git/b4/b4/command.py", line 219, in cmd
    cmdargs.func(cmdargs)
  File "/home/broonie/git/b4/b4/command.py", line 61, in cmd_ty
    b4.ty.main(cmdargs)
  File "/home/broonie/git/b4/b4/ty.py", line 638, in main
    auto_thankanator(cmdargs)
  File "/home/broonie/git/b4/b4/ty.py", line 392, in auto_thankanator
    send_messages(applied, cmdargs.gitdir, cmdargs.outdir, wantbranch, since=cmdargs.since)
  File "/home/broonie/git/b4/b4/ty.py", line 429, in send_messages
    msg = generate_am_thanks(gitdir, jsondata, branch, since)
  File "/home/broonie/git/b4/b4/ty.py", line 351, in generate_am_thanks
    msg = make_reply(thanks_template, jsondata)
  File "/home/broonie/git/b4/b4/ty.py", line 96, in make_reply
    msg['Cc'] = b4.format_addrs(allcc)
  File "/home/broonie/git/b4/b4/__init__.py", line 2382, in format_addrs
    addrs.add(email.utils.formataddr((LoreMessage.clean_header(pair[0]), LoreMessage.clean_header(pair[1]))))
  File "/usr/lib/python3.7/email/utils.py", line 91, in formataddr
    address.encode('ascii')
UnicodeEncodeError: 'ascii' codec can't encode characters in position 22-24: ordinal not in range(128)

--OaZoDhBhXzo6bW1J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/qBDoACgkQJNaLcl1U
h9DvzAf+JlIQkw/Sy75v5uWsFCkJ2Ygwc+N3oaaPUzY/EUWXbioa+heN6hQ3gsSW
piEGvA5xiWiFZCaopL3oC9z7ZYriXng0h1nK9oReBJ0oXGZ/5tME8vF0oHPdW4GF
Ia87OkKjMUuweJhhJEZ4QdtyiC4rLJLgQLR8WTVj1qdGjaxqLiohlHokfc6sHk4i
AnxHPAF4TW8/ROoERvZo4mQM3s7nzXiAi8g5Sl3cKMXj4i6cwHLENrzzkHjNq3fa
XZsFdrPb+lwhj8AQqq9+2dhWvy3dLf7WYDuDwV1OJJ/i0YTdRm9OAfSkQe80ws9i
4cTu2ZnJzio7vePw184O8NMBCdR1xA==
=wCl/
-----END PGP SIGNATURE-----

--OaZoDhBhXzo6bW1J--
