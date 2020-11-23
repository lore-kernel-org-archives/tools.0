Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web11.38366.1606150276477199148
 for <tools@linux.kernel.org>;
 Mon, 23 Nov 2020 08:51:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=vTxEobps;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: broonie@kernel.org)
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net [92.233.91.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 46B072100A;
	Mon, 23 Nov 2020 16:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606150275;
	bh=GEn11Ltq+Tmhe2sd01eC6lvpqAT5bmH1ddFfoASqDk0=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=vTxEobpsrgOi1VDaO9ZcO1tI8FZ6iiO3gh8KpbqzzR6fwjSsJniOVk3L2P6Qz4a/U
	 NQ5fzJpYtXzOvCbhhAp7/QmOK3EeTWvrjTwRuBrElPDRiBhK0MJxvFuYFScZhg1gXy
	 NUPwB3bZR7LjZy3L77BsYH5r8J/AdHG+hcKG7v7s=
Date: Mon, 23 Nov 2020 16:50:52 +0000
From: "Mark Brown" <broonie@kernel.org>
To: tools@linux.kernel.org, konstantin@linuxfoundation.org
Subject: Re: [tools] Exception with b4 am
Message-ID: <20201123165052.GH6322@sirena.org.uk>
References: <20201123124139.GB6322@sirena.org.uk>
 <20201123144920.qijmi23rxdibswtb@chatter.i7.local>
MIME-Version: 1.0
In-Reply-To: <20201123144920.qijmi23rxdibswtb@chatter.i7.local>
X-Cookie: Dry clean only.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Groupsio-MsgNum: 261
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KscVNZbUup0vZz0f"
Content-Disposition: inline

--KscVNZbUup0vZz0f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2020 at 09:49:20AM -0500, Konstantin Ryabitsev wrote:
> On Mon, Nov 23, 2020 at 12:41:39PM +0000, Mark Brown wrote:

> > I get the traceback below unless I remove python3-dkim:

> Right, looks like Debian pulls in an older dnspython version. The latest=
=20
> commit I just pushed should work with either.

That fixes the immediate issue but there's more issues with old Python
stuff:

Looking up https://lore.kernel.org/r/1606148273-17325-1-git-send-email-sriv=
asam%40codeaurora.org
Grabbing thread from lore.kernel.org/alsa-devel
Analyzing 1 messages in the thread
---
Writing /tmp/fileDuDx9o.mbx
Traceback (most recent call last):
  File "/home/broonie/git/b4/b4/__init__.py", line 2347, in dkim_get_txt
    a =3D _resolver.resolve(lookup, dns.rdatatype.TXT, raise_on_no_answer=
=3DFalse, lifetime=3Dtimeout, search=3DTrue)
AttributeError: 'Resolver' object has no attribute 'resolve'

During handling of the above exception, another exception occurred:

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
  File "/home/broonie/git/b4/b4/__init__.py", line 2358, in dkim_get_txt
    _DKIM_DNS_CACHE[name] =3D dkim.dnsplug.get_txt(name, timeout)
TypeError: get_txt() takes 1 positional argument but 2 were given

--KscVNZbUup0vZz0f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+76GsACgkQJNaLcl1U
h9A8XAf/cDJVkMGpvD/6ChCW+ZZ8EragB8ELgYC6dw8nejni6w7TtOUarI+sL1nN
0hWUc5362hT6P9mH60BxPjqYy1UH1ILycT8pU2XdRK8PJ4sAe6Xz0biI9UIhs9E1
fO2r7Toz0CVjtEv/5DCQIcqisS4YvV5jM3xXp+bc90kU1aLSOauZgtY9ZMfkN8Pv
g+me5IZzsW3/hZ+haVPK7yRZQaehoY3LtZxzSXmZ5jvey3EpoaTwuz+2sifLkNd0
7/1n2qRWl5kEL7GWPMCWgNjDs0hU9JvUkKE8IevJM9TLPuPqY1LKxSu+vCI7oFct
rnrOD7jGE0IJdeYTbWuIMFano1nAWA==
=n68f
-----END PGP SIGNATURE-----

--KscVNZbUup0vZz0f--
