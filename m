Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.999.1584565156714744215
 for <tools@linux.kernel.org>;
 Wed, 18 Mar 2020 13:59:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: mark.brown@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6514D1FB;
	Wed, 18 Mar 2020 13:59:16 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DDEC03F67D;
	Wed, 18 Mar 2020 13:59:15 -0700 (PDT)
Date: Wed, 18 Mar 2020 20:59:14 +0000
From: "Mark Brown" <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 not finding patches
Message-ID: <20200318205914.GG4553@sirena.org.uk>
References: <20200318202335.GF4553@sirena.org.uk>
 <20200318203838.jb2q4g4sxstob75e@chatter.i7.local>
MIME-Version: 1.0
In-Reply-To: <20200318203838.jb2q4g4sxstob75e@chatter.i7.local>
X-Cookie: Oh no, not again.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Groupsio-MsgNum: 5
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5L6AZ1aJH5mDrqCQ"
Content-Disposition: inline

--5L6AZ1aJH5mDrqCQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 18, 2020 at 04:38:38PM -0400, Konstantin Ryabitsev wrote:
> On Wed, Mar 18, 2020 at 08:23:35PM +0000, Mark Brown wrote:

> >    https://lore.kernel.org/alsa-devel/87wo7kolfa.wl-kuninori.morimoto.g=
x@renesas.com/

> This is because the cover letter is the only bit where we see "v3":

> > [PATCH v3 0/6]

> all other messages have

> > [PATCH N/6]

> I'm not sure if there is a reliably clean way of handling this=20
> situation, but I'll think about it. For this particular case, you can=20
> just pass -v1 to "b4 am" to grab the actual patches.

=2E..but not the tags added to the cover letter which is the main reason
I'm doing this :/ .  I do see the issue given people sending new
serieses in reply to existing ones though.  Perhaps some heuristic about
lack of ambiguity (eg, if we're looking for six patches and find exactly
six patches)?

--5L6AZ1aJH5mDrqCQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5yi6EACgkQJNaLcl1U
h9C+yQf/VWX18XG8P9BIv8hqGEp4JSvgJeFLHY+a+AMuZzaarbMv+VX9pJBRD/Ir
1jocnuQd7/VPL0+DuUhtNxUKNxkY2wHxRPETe41GYASezpY6aFI+NxyfUrIrZF4n
+LVze7Fp5pNexe+U7wvAY67aOPmbF4Cfg+nLPcFKfm0g40erBcE3k8DOf9Chv6rM
Y0LZJ6Q4IZP1XQF9MW1Nry6yKWXtzPN2Gz7l4zsMa7LLjjGzeQlaEe/hSHHNCDmG
Gl+tZcObaMs4zTqSj6HaJo/slQO1c78mNKI1GbU+Gk4X3nP8l2kcLIpXjRkkQ8cV
wnMOJsS55zhekD6zivme9ThbpEUbhw==
=tj0U
-----END PGP SIGNATURE-----

--5L6AZ1aJH5mDrqCQ--
