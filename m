Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.51810.1584968098779788015
 for <tools@linux.kernel.org>;
 Mon, 23 Mar 2020 05:54:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: mark.brown@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7F4AF1FB;
	Mon, 23 Mar 2020 05:54:58 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 038EC3F52E;
	Mon, 23 Mar 2020 05:54:57 -0700 (PDT)
Date: Mon, 23 Mar 2020 12:54:56 +0000
From: "Mark Brown" <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: b4 message ID shortening
Message-ID: <20200323125456.GC4948@sirena.org.uk>
MIME-Version: 1.0
X-Cookie: Stay on the trail.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Groupsio-MsgNum: 21
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oTHb8nViIGeoXxdp"
Content-Disposition: inline

--oTHb8nViIGeoXxdp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

When generating filenames to save messages b4 am looks like it truncates
the message ID to generate the default filename (or possibly uses a
portion of the date now I think about it, I didn't read the code).  For
example

   https://lore.kernel.org/r/20200320232515.GA24800@embeddedor.com

results in a mailbox

   20200320_gustavo_embeddedor_com.mbx

which is all well and good except if you also try to save:

   https://lore.kernel.org/r/20200320232556.GA24989@embeddedor.com

it generates the same filename and silently overwrites the first
mailbox.  Using b4 mbox avoids this as it generates files using the full
message ID such as

   20200320232515.GA24800@embeddedor.com.t.mbx-thread

which avoids collisions.

FWIW my workflow is currently to save a bunch of mailboxes into a
directory then throw them at a script to do some testing & apply them if
that works.

--oTHb8nViIGeoXxdp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl54sZ8ACgkQJNaLcl1U
h9DIrwf+JHWswBN3+yS/iLzJ4kT8WxF3hncB+bg/R4MsoKrgyR94nPp+Zh1+QfWC
exBNUQT7doZREPnfEyyEihN8696RvZJkYy3F5Ngt6tNgFkbmiGtyXu60nYN/UwkF
xfuf0VEzaUTuECukRTBBbNHO5vURUhfEq7F2K66AWz1cu8NE4sieBi6cnlvTARHa
H/INpcWHIPGTlS5OWp/cxAvsJZPTVypZ8o6qEiyvLvqA+730XnUTIelJMQWCbTgI
vbVn5Lw+Rn59UmBbMF1dkMFzeGDjbeojV4QFQIAGHDXgOJq2hIjhxRhBaQ+IQFe7
5A+ea4vwMwia8vb7O6EQvvh9ImHz/w==
=9K0m
-----END PGP SIGNATURE-----

--oTHb8nViIGeoXxdp--
