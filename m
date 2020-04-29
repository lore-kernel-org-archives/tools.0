Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [66.63.167.143])
 by mx.groups.io with SMTP id smtpd.web11.3929.1588175082469235790
 for <tools@linux.kernel.org>;
 Wed, 29 Apr 2020 08:44:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@hansenpartnership.com header.s=20151216 header.b=oZ8CaRNm;
 spf=pass (domain: hansenpartnership.com, ip: 66.63.167.143, mailfrom: james.bottomley@hansenpartnership.com)
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 1AEB78EE105;
	Wed, 29 Apr 2020 08:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
	s=20151216; t=1588175081;
	bh=n5FJlxkw9Acfm7XbizUL6rmap/3L16xEAobyCVy6zg4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=oZ8CaRNm9gQGE2UAxDmEW/+wk+oY+sxYHNVmhxrkAGNzO8Xkkb3i+yDYaos+zGEYX
	 fiaJ1WDO+WKR9D+/IBaPES7FhXAXLo7Cq3Wsp+fy5RFrGP04vd8s7BUYriSWz9oi5X
	 27ySMFL9LG8gzRxcEVULAFVMciSN/PPbP1INLix8=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aRZTUHBsEqIS; Wed, 29 Apr 2020 08:44:39 -0700 (PDT)
Received: from [153.66.254.194] (unknown [50.35.76.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 056B48EE0C9;
	Wed, 29 Apr 2020 08:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
	s=20151216; t=1588175079;
	bh=n5FJlxkw9Acfm7XbizUL6rmap/3L16xEAobyCVy6zg4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=N1NQoifnPeu6LyqGu8rHE8aUS7ZASx9L+D0ChBfoRQyGC57EvJE8EWOasFSNQXGyQ
	 ELpIUc1xXWKx4nWdrR+xWJ2ylS7tP9MNt3p9TFLeSc0H26PLJdzu6iB5WlM/qMBrO1
	 V6O1w3ApbmnAJSA+D0JkT3lPj8/WJS0U6FB/qZ4g=
Message-ID: <1588175070.11333.35.camel@HansenPartnership.com>
Subject: Re: [kernel.org users] What is a useful way to show changes between series?
From: "James Bottomley" <James.Bottomley@HansenPartnership.com>
To: Mark Brown <broonie@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Jason Gunthorpe
	 <jgg@ziepe.ca>, users@linux.kernel.org, tools@linux.kernel.org
Date: Wed, 29 Apr 2020 08:44:30 -0700
In-Reply-To: <20200429151938.GM4201@sirena.org.uk>
References: <20200428192938.aue3v6kxsm47day5@chatter.i7.local>
	 <20200428193550.GX26002@ziepe.ca>
	 <20200428194419.i2gamyjgbilp2x73@chatter.i7.local>
	 <20200429101309.GE4201@sirena.org.uk>
	 <1588172426.11333.10.camel@HansenPartnership.com>
	 <20200429151938.GM4201@sirena.org.uk>
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
X-Groupsio-MsgNum: 120
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-CvHJr9OhhMopKY9iAOC0"

--=-CvHJr9OhhMopKY9iAOC0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-04-29 at 16:19 +0100, Mark Brown wrote:
> On Wed, Apr 29, 2020 at 08:00:26AM -0700, James Bottomley wrote:
> > On Wed, 2020-04-29 at 11:13 +0100, Mark Brown wrote:
> > > On Tue, Apr 28, 2020 at 03:44:19PM -0400, Konstantin Ryabitsev
> > > wrote:
> > > > Right, but that only works from a tree, correct? Unfortunately,
> > > > very few people are providing base-commit information still, so
> > > > I'm not sure how=20
> > > It would be helpful if git could be configured to do this by
> > > default in format-patch rather than requiring it to be done
> > > manually on the command line separately to specifying the set of
> > > patches to format.
> > It might also end up causing a lot of confusion:  remember, a lot
> > of people use a quilt like workflow for their patches ... I know I
> > do because when I've got several patch series to upport, having a
> > single branch with all of them is much easier to work with than
> > multiple branches and a combination.  Even in the simplest cases
> > where I'm working on the current tree and have only a single
> > series, I often have a bugfix for some current issue as the base
> > patch so I can boot my
>=20
> I did say "default" rather than "force" - it's a lot easier if you
> have a workflow where it might be useful if you can just turn it on
> instead of having to manually go and specify the base commit twice
> when formatting serieses which is both a pain and easy to forget,
> then disable it where it doesn't make sense.  Right now it's more
> effort than it's worth to use even when it does make sense.
>=20
> > series easily.  In either case forcing the cover letter to show my
> > base patch would give you useless information because it wouldn't
> > be in any tree you have.
>=20
> TBH it's fairly harmless if the commit that's being referenced
> doesn't exist.

I think we need to be careful here.  Today if you specify a base
everyone assumes it should exist and they know something is seriously
wrong if it doesn't (0day will complain, for instance).  If you force
everyone to specify a base, then suddenly you lose the information that
they really meant it and you have no idea if a bogus base is an
indicator of problems with the series.  Forcing a default base would
make the base commit useless as an indicator of correctness since now
you have to process bogus bases as well.

Of course, this is simply an argument for still having the option, just
not making it default, so if you know what you're doing and don't use a
quilt like workflow, you turn it on.

James

--=-CvHJr9OhhMopKY9iAOC0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABMIAB0WIQTnYEDbdso9F2cI+arnQslM7pishQUCXqmg3gAKCRDnQslM7pis
hSfvAQDa2npS4GKf4S7AqsCMoZAdt3p1lGAybseNmY2QUmYQnAEAoqRVmI9STezR
x1z3AACkzXvWnzmKtU36IvbCaUwGShE=
=l1ql
-----END PGP SIGNATURE-----

--=-CvHJr9OhhMopKY9iAOC0--
