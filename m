Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.10673.1584737569196683780
 for <tools@linux.kernel.org>;
 Fri, 20 Mar 2020 13:52:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: mark.brown@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 671D631B;
	Fri, 20 Mar 2020 13:52:48 -0700 (PDT)
Received: from localhost (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1AE963F792;
	Fri, 20 Mar 2020 13:52:47 -0700 (PDT)
Date: Fri, 20 Mar 2020 20:52:46 +0000
From: "Mark Brown" <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 not finding patches
Message-ID: <20200320205246.GE3961@sirena.org.uk>
References: <20200318202335.GF4553@sirena.org.uk>
 <20200318203838.jb2q4g4sxstob75e@chatter.i7.local>
 <20200318205914.GG4553@sirena.org.uk>
 <20200318221802.25sxldeocw7dchsi@chatter.i7.local>
MIME-Version: 1.0
In-Reply-To: <20200318221802.25sxldeocw7dchsi@chatter.i7.local>
X-Cookie: Laugh when you can
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Groupsio-MsgNum: 11
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EgVrEAR5UttbsTXg"
Content-Disposition: inline

--EgVrEAR5UttbsTXg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 18, 2020 at 06:18:02PM -0400, Konstantin Ryabitsev wrote:
> On Wed, Mar 18, 2020 at 08:59:14PM +0000, Mark Brown wrote:

> > ...but not the tags added to the cover letter which is the main reason
> > I'm doing this :/ .  I do see the issue given people sending new
> > serieses in reply to existing ones though.  Perhaps some heuristic about
> > lack of ambiguity (eg, if we're looking for six patches and find exactly
> > six patches)?

> I have code that properly handles this situation in master:

That works, thanks (and the shell script to run from git is super
helpful too!).

--EgVrEAR5UttbsTXg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl51LR0ACgkQJNaLcl1U
h9BDZwf9FVe7kO9MCT0KUBBFo+00WDmdUwtbh5hwHIw/RFFX3S8/pQ5Fuu/Eyeyi
QcAPrq/mnLXpZNTqtvUkAZ7T0oTVxOtLHFukuvqew+907l/TXy++WX5IMucgcD9m
aoe0YyaFtdvxV+jgnN3+R5UVk5BTHGAYeRP4YGsOGLUvH6pEMm2UZ+D7wzqIcjqa
yrx2QUcCDV1AoMNSA86Hef9AjpekYcfnhRTUIPNTYKfGvqxY2BcMAq1dEppPd8pY
E+uTX5whsovgFbphbbTxDN4rXR7N0B3+WHYwWx+LdRAoTewHqoYcbMQqXQEjaijY
HszrhgQ5I7kAjuRFjjDWL5CD8g1I+g==
=szdC
-----END PGP SIGNATURE-----

--EgVrEAR5UttbsTXg--
