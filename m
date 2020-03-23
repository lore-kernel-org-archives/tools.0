Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.51050.1584965209608451833
 for <tools@linux.kernel.org>;
 Mon, 23 Mar 2020 05:06:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: mark.brown@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F09B1FB;
	Mon, 23 Mar 2020 05:06:49 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A74753F52E;
	Mon, 23 Mar 2020 05:06:48 -0700 (PDT)
Date: Mon, 23 Mar 2020 12:06:47 +0000
From: "Mark Brown" <broonie@kernel.org>
To: tools@linux.kernel.org
Cc: users@linux.kernel.org
Subject: Re: [tools] B4 and gmail integration features
Message-ID: <20200323120647.GA4948@sirena.org.uk>
References: <20200320214532.wvmym643l3dw24qh@chatter.i7.local>
MIME-Version: 1.0
In-Reply-To: <20200320214532.wvmym643l3dw24qh@chatter.i7.local>
X-Cookie: Stay on the trail.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Groupsio-MsgNum: 20
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="azLHFNyN32YCQGCU"
Content-Disposition: inline

--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 20, 2020 at 05:45:32PM -0400, Konstantin Ryabitsev wrote:

> 3. Optionally, also send a "thanks, applied" templated reply after you=20
>    do "b4 am"

> (#3 will also be available if we find a sendemail.smtpserver.)

As well as the deferral for testing/applying it'd be helpful if this
supported /usr/lib/sendmail as well as a SMTP server - it's useful to
centralize credentials and otherwise actually applying things is an
offline operation.

--azLHFNyN32YCQGCU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl54plMACgkQJNaLcl1U
h9ALfQf/V/CAORSzOvvmPAOIteTzBoO4s4AFxOUJloCuhw5cWe0IdBJ9qhc9XFzt
4rJnjVnVRziSu1ElPTmBIIqbFQDeDx2zsjt9EfrFH4KEJy9A5a7JBK36Dfi3QLnk
N/y+06uFXqNwwhLkuP6Fp90dBlMRu5z/g5Yrz10LpRXeWTT5YK8pnrN4rfqrVci2
kZCu6iGY+itnay43rtfjF9up3F77hHwjt/XIDhJHc0wvjk+x3rbQdBhBuYNYgJuf
VEv0Qxymgp2p+ryqM9RD4hulSjp0SAzgpTgpaLCth08vAVOTaJ15ucF/y45Hi+kR
t996kST3JGCJ/g1AmHRD1H691Sb7zg==
=yihy
-----END PGP SIGNATURE-----

--azLHFNyN32YCQGCU--
