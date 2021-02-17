Received: from mail.archlinux.org (mail.archlinux.org [95.216.189.61])
 by mx.groups.io with SMTP id smtpd.web08.7590.1613569418012269186
 for <tools@linux.kernel.org>;
 Wed, 17 Feb 2021 05:43:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@archlinux.org header.s=dkim-rsa header.b=OKeIJ8Ku;
 spf=pass (domain: archlinux.org, ip: 95.216.189.61, mailfrom: foxboron@archlinux.org)
Date: Wed, 17 Feb 2021 14:43:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=archlinux.org;
	s=dkim-rsa; t=1613569414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=CAOBnEevYqj24zIIlBcnK9QK9SeSyjTJB0elJtdjSwA=;
	b=OKeIJ8Ku8YXwDAesr19G1cYGV1vp2enNsBUQJgrCflF37+MIdm72oAWUgxwOSZY4nuMYUY
	FMWvI9mDJKyDN64Xbok3OzK3Ssd6lzQURRTNJyWuzux7FrTh0LcCkDKUcO25JUchxM3mKo
	W7I3dIxLvuCyyAYCFbA1kw9QqT5lWspdHu8e/vM2AcAVhD1FUSWuYV/gSdTiKuUjC8NT90
	39vi2CAY6kx4OCKvUkRxAXMzEWeQHcUaM1zx0eHrmHBNuqRQ6+rsUNq/grhSlL34LYSElq
	Rn7F9ki/ldWm2V/7EleyLji4n92Gwst08NWR0oycpMMORRCtwYALIktgB8aMpJoX1lpm6Q
	xFt2FBe57MqU1QEe8Od/rGZ3nm8XwQNtbzDgdU9E/dcNmdFxQzsG6Y9MVyiGxjrvD2/3qX
	IpxrU1PqVmTq1YpKGkWfhv7nRP5OLb/9cBK1s2HQ0wT6SH7qWnmRksU1UZXOp91nUSetcH
	YQxJ1u57qd873qW1wqcOZJJBncGMZtBMdpN4Engl4qHeH1gQS5Q5qMyQG2iAoF3yn1FMmO
	MaG/30wes9pGxxU2V+f0SJUmrW8HZO0zT9fV+b1Jb+LswVQ1vVb8+iQgOPPV36n2NafOuV
	S5uVFtjvTT83ZGo3UkrLKz16grUC6hVOUg8nqFa/HPQEB8PhW6N2E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=archlinux.org;
	s=dkim-ed25519; t=1613569414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=CAOBnEevYqj24zIIlBcnK9QK9SeSyjTJB0elJtdjSwA=;
	b=y1OnaW1SpSEcMDg0IsjMI8Q3NNb0F6c0V9eJYmbAGnmI9mWRT+n94Q/78JIHZ8lg8eL0V9
	eFluoo17BO3VVKAA==
From: foxboron@archlinux.org
To: tools@linux.kernel.org
Subject: [b4] Sign gzipped tarball instead of .tar
Message-ID: <20210217134333.vqhg6xoz2bhmzpks@anathema>
MIME-Version: 1.0
Authentication-Results: mail.archlinux.org;
	auth=pass smtp.auth=foxboron smtp.mailfrom=foxboron@archlinux.org
X-Groupsio-MsgNum: 341
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tactgjklyomw66my"
Content-Disposition: inline

--tactgjklyomw66my
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Yo!

Currently packaging up b4 for Arch Linux and encountered a slight issue wit=
h the
release tarballs for the project.

The siganture says it needs to be compared against the tarball of the proje=
ct,
however the kernel.org and googlesource.com only allows one to download the
gzipped tarball. To recreat the release artifact one would need to clone and
create the archive to have anything to compare against.

This doesn't work that well since we preferably include the sources
declaratively and not work out a tarball from the source checkout during
packaging. This also has the effect of most distros packaging the release
straight from pypi or from git with no release authentication.

Could the gzipped release tarballs be signed instead? Another alternative w=
ould
be to sign the release tags of b4.

--=20
Morten Linderud
PGP: 9C02FF419FECBE16

--tactgjklyomw66my
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEktnGzemaICTWkKdu50JoO6CMsv8FAmAtHYUACgkQ50JoO6CM
sv/spw/+NGezzKAL1Q4E+MKo3Lv8jCLwPi4pUajdBSkBDxKg5/oZUVIPKYFEtRSP
2aYJo/F1UNrWGg5IvO9Pp4CVETY9DpthTX58l3BVK81M06Q3pvFKse+y5/pecTKw
5BkJ8ymnZgA/HT9BLh6sicVt3BXAa3UFcF0Scc6J3W8HVvASgFZPE9lC1QQvYOB7
4omuhFYO1/0XkpqOwI0Nv/9WDRWydEMW4dxs9FScHeOqRUqxIP8MZJF4eqyG5w0s
lYEHNvaMoXU0vxpmRm8RAzm6BJCpfFeEnCeZOefKiEPz/KFmVHP98JgE8m3khE9V
9MZHMtxVDF1GxepwWo0TCxeHACopdp3vqPOZ5r9VpYhzoS2NA0AFx+wQdHz+P6HS
x1ywRQtO5JfJIs3HsOCJLrfRwTwILgP9sb5115uHe2d3FPaJ2gzSLKY9KD7BnkEQ
/BJimg/8NtBifjGFvjJVshdzAhxI3yFzEdEfzfAbYiprIlDBpNcUxRaEew+olyoP
SoEdTHFSIhE7VUrRVc9uXSXLNgS76N3z0n0/sXoi7e6SovPFAFwmyFIF5Q1YPyq9
lbG9/MKEMwARqoj0XawECyMmjP/WzRKUcfae7VyXlF5I9Vn+iLIG66tK9+QQ0/04
2kpGBiJNeHmT4hEwpVu6orNjISNdmp/GGXpQwZd+Pp6laVHDsNM=
=97RM
-----END PGP SIGNATURE-----

--tactgjklyomw66my--
