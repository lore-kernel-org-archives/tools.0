Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.2409.1584989415881161601
 for <tools@linux.kernel.org>;
 Mon, 23 Mar 2020 11:50:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: mark.brown@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6BBFE1FB;
	Mon, 23 Mar 2020 11:50:15 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E0ECB3F52E;
	Mon, 23 Mar 2020 11:50:14 -0700 (PDT)
Date: Mon, 23 Mar 2020 18:50:13 +0000
From: "Mark Brown" <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 message ID shortening
Message-ID: <20200323185013.GG4948@sirena.org.uk>
References: <20200323125456.GC4948@sirena.org.uk>
 <20200323163859.xyntfstr5o2uv55q@chatter.i7.local>
 <20200323170512.GF4948@sirena.org.uk>
 <20200323180451.ny2x2ujqqh6h6yqu@chatter.i7.local>
MIME-Version: 1.0
In-Reply-To: <20200323180451.ny2x2ujqqh6h6yqu@chatter.i7.local>
X-Cookie: Stay on the trail.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Groupsio-MsgNum: 34
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6BvahUXLYAruDZOj"
Content-Disposition: inline

--6BvahUXLYAruDZOj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2020 at 02:04:51PM -0400, Konstantin Ryabitsev wrote:
> On Mon, Mar 23, 2020 at 05:05:12PM +0000, Mark Brown wrote:

> > > This used to be the scheme in early revisions, except filenames ended=
 up=20
> > > being freakishly long. An option is to truncate them if they go over =
a=20
> > > certain length.

> > That looks good for my usage, long filenames aren't a concern for me but
> > I can see some people might not like them (perhaps a configurable
> > length, or perhaps that's overthinking it?).

> Yeah, let's try to be more disambiguatey without piling on too many=20
> config options. I pushed the above change.

Thanks!

--6BvahUXLYAruDZOj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl55BOQACgkQJNaLcl1U
h9Bk8Qf+KXMjqcb7qXIjyA42FmmOnBEGLIf83DSEbwg0faixCI+9nmVfAPKFo1FK
x1G6LlgeFsNWbMIOtJ72tO2NZLU8wwdoaMkbP+2cfPKP3vcfScMZcxRBeS5Ic7jH
86iPl4b/qdFgZTL0tn8XRhJbxh/35e7kd0UnjmzTVyObPs3xw78lq4StgH0CkdOQ
HuUEUjbyYh4UgHXIPcNEBCP64Sl+WntOnBp2zW/baQgaRCXu6M+U4MEZPPFbGim7
tcYXyj+dz+drh51QOmQLsfqnl9LHDYPAlPT6mo509rfUNGdwsoEXNMQ/VUpvwC8z
V3r8PMsSoLvZdBhLmbIqG4ARp+80ag==
=9z7W
-----END PGP SIGNATURE-----

--6BvahUXLYAruDZOj--
