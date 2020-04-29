Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [66.63.167.143])
 by mx.groups.io with SMTP id smtpd.web12.2820.1588172435605782472
 for <tools@linux.kernel.org>;
 Wed, 29 Apr 2020 08:00:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@hansenpartnership.com header.s=20151216 header.b=kWtrJFHy;
 spf=pass (domain: hansenpartnership.com, ip: 66.63.167.143, mailfrom: james.bottomley@hansenpartnership.com)
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id A26438EE105;
	Wed, 29 Apr 2020 08:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
	s=20151216; t=1588172434;
	bh=4X/fovNTIkZYfa1rTpoEIAuid1I7h496GoDUgNKq9cE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=kWtrJFHygKRYMsRrc/fg0qjjlIlx8hpTnt2yP6e2YbdOHfEpNbdbXCdmww0T/fyvU
	 NMjdS8UQ8oA96+ngShvtuxw29bm8pAFZFofngCIAQXm11beDZJuZvoauSsVTn6CerC
	 9MH4Z39ecjyUtR5twcMFeHauomxfi0cz3Oi8NsM0=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WIunDACS1gf8; Wed, 29 Apr 2020 08:00:34 -0700 (PDT)
Received: from [153.66.254.194] (unknown [50.35.76.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id B39AB8EE0C9;
	Wed, 29 Apr 2020 08:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
	s=20151216; t=1588172434;
	bh=4X/fovNTIkZYfa1rTpoEIAuid1I7h496GoDUgNKq9cE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=kWtrJFHygKRYMsRrc/fg0qjjlIlx8hpTnt2yP6e2YbdOHfEpNbdbXCdmww0T/fyvU
	 NMjdS8UQ8oA96+ngShvtuxw29bm8pAFZFofngCIAQXm11beDZJuZvoauSsVTn6CerC
	 9MH4Z39ecjyUtR5twcMFeHauomxfi0cz3Oi8NsM0=
Message-ID: <1588172426.11333.10.camel@HansenPartnership.com>
Subject: Re: [kernel.org users] What is a useful way to show changes between series?
From: "James Bottomley" <James.Bottomley@HansenPartnership.com>
To: Mark Brown <broonie@kernel.org>, Konstantin Ryabitsev
	 <konstantin@linuxfoundation.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, users@linux.kernel.org, 
	tools@linux.kernel.org
Date: Wed, 29 Apr 2020 08:00:26 -0700
In-Reply-To: <20200429101309.GE4201@sirena.org.uk>
References: <20200428192938.aue3v6kxsm47day5@chatter.i7.local>
	 <20200428193550.GX26002@ziepe.ca>
	 <20200428194419.i2gamyjgbilp2x73@chatter.i7.local>
	 <20200429101309.GE4201@sirena.org.uk>
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
X-Groupsio-MsgNum: 118
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-xEuS5xtNPoEhNxI4jaKo"

--=-xEuS5xtNPoEhNxI4jaKo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-04-29 at 11:13 +0100, Mark Brown wrote:
> On Tue, Apr 28, 2020 at 03:44:19PM -0400, Konstantin Ryabitsev wrote:
>=20
> > Right, but that only works from a tree, correct? Unfortunately,
> > very few people are providing base-commit information still, so I'm
> > not sure how=20
>=20
> It would be helpful if git could be configured to do this by default
> in format-patch rather than requiring it to be done manually on the
> command line separately to specifying the set of patches to format.

It might also end up causing a lot of confusion:  remember, a lot of
people use a quilt like workflow for their patches ... I know I do
because when I've got several patch series to upport, having a single
branch with all of them is much easier to work with than multiple
branches and a combination.  Even in the simplest cases where I'm
working on the current tree and have only a single series, I often have
a bugfix for some current issue as the base patch so I can boot my
series easily.  In either case forcing the cover letter to show my base
patch would give you useless information because it wouldn't be in any
tree you have.

I really think a base commit is sometimes useful but definitely not
essential information.  Quilt is the poster child for tools that don't
use a base commit.  I like to think that base commit based tools like
git perform better under conflict merges, but I have to confess given
some of the merge messes I've seen, there's no substantive difference
between what git does and what quilt spits into .rej files.

James

--=-xEuS5xtNPoEhNxI4jaKo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABMIAB0WIQTnYEDbdso9F2cI+arnQslM7pishQUCXqmWigAKCRDnQslM7pis
hQxEAQD41fECkNJ6jhZmmP+KyBbd1+ORXq9JBDwdH7LWwHXmawD+P2/joY6Jfi9X
Fyc1RcWFpMflvfdvPgxs0uDANdqBeTc=
=ZinY
-----END PGP SIGNATURE-----

--=-xEuS5xtNPoEhNxI4jaKo--
