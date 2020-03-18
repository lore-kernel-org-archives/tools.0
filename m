Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.238.1584563017766153746
 for <tools@linux.kernel.org>;
 Wed, 18 Mar 2020 13:23:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: mark.brown@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 59F871FB;
	Wed, 18 Mar 2020 13:23:37 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D19323F67D;
	Wed, 18 Mar 2020 13:23:36 -0700 (PDT)
Date: Wed, 18 Mar 2020 20:23:35 +0000
From: "Mark Brown" <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: b4 not finding patches
Message-ID: <20200318202335.GF4553@sirena.org.uk>
MIME-Version: 1.0
X-Cookie: Oh no, not again.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Groupsio-MsgNum: 3
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5CUMAwwhRxlRszMD"
Content-Disposition: inline

--5CUMAwwhRxlRszMD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

When I run

   b4 am -t 87y2s0olg6.wl-kuninori.morimoto.gx@renesas.com

it says:

| Grabbing thread from lore.kernel.org
| Analyzing 13 messages in the thread
| Found new series v1
| Will use the latest revision: v3
| You can pick other revisions using the -vN flag
| ---
| Writing ./v3_20200316_kuninori_morimoto_gx_renesas_com.mbx
|   ERROR: missing [1/6]!
|   ERROR: missing [2/6]!
|   ERROR: missing [3/6]!
|   ERROR: missing [4/6]!
|   ERROR: missing [5/6]!
|   ERROR: missing [6/6]!
| ---
| Total patches: 0
| ---

even though lore appears to have the full thread:

   https://lore.kernel.org/alsa-devel/87wo7kolfa.wl-kuninori.morimoto.gx@renesas.com/

Thanks,
Mark

--5CUMAwwhRxlRszMD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5yg0YACgkQJNaLcl1U
h9ArYAf9FdFHWlBhRqUGgm2mdAP0UGhIE2CCroJobouJHkH8yxYxmhLXk6q9pBM+
9FR3VvdVf7pMOXV3BTsMbbmavzAQGWas/bmuHtDM8yYH9zgYbq5AyyRqtQNjjlze
/MBq/GEUxGbBUTwjFDlzQCY7TzK3Iawu8pjkznYugPTWPAtvn7AOjgUPTWv69aAs
ZX6PsxW0WSdWftR9S96XUtXV9/PRtEDN+Sh69D/dzuayLDqoelEG+JFNbwbjSC+Q
iMcU+B7ZKbFciSHNkwop37sUUb/uHtkQd7CojO72Vdz2ftjPipsbL3zLaxc3nqOg
oc6wCcdUfH01TtScKKK2CfySw+FTUg==
=FkHH
-----END PGP SIGNATURE-----

--5CUMAwwhRxlRszMD--
