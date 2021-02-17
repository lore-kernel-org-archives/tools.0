Received: from mail.archlinux.org (mail.archlinux.org [95.216.189.61])
 by mx.groups.io with SMTP id smtpd.web08.8611.1613573987154784497
 for <tools@linux.kernel.org>;
 Wed, 17 Feb 2021 06:59:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@archlinux.org header.s=dkim-rsa header.b=Hhy94N43;
 spf=pass (domain: archlinux.org, ip: 95.216.189.61, mailfrom: foxboron@archlinux.org)
Date: Wed, 17 Feb 2021 15:59:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=archlinux.org;
	s=dkim-rsa; t=1613573985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Mep3rD0SLMHwSopu/Cy21EPxfqky10jl+viotas0NRc=;
	b=Hhy94N43ulQV7Tqb+Qhsgs7DB9+85HHUiGOqNT10PIF4fkwzi5OMqf+M0SoQgOqC/MlW3a
	90B/+ivk4xu8Y6Nl5j1yw4lFejyG31wSFU++bwndStttaM1hlbJ/GhhEIvEAi/cWY8f1Ro
	lxYiFYmUyY29Nh+Gg51Jj70Sx1KZqqxtB70r4qgfFZjG3tFUpZ+Vh0qbh6B6s0Dm9r4BTo
	PlPXJYtR7l8djdrGVpjg02Wkh3NrmUqfiYOxLerg82gdIoDZkIrJnPJDfLxekqi28NPYhq
	elBhfqOF7L3izv+kf1LqDH7M62dCXfX6AsPU81n6CGYwg24z8DxNxA4+KON5+bsmlxtbtH
	zb+lxdCidkpiAAfTD/lbQ2vUUXhiN+yv/NaX9hk9xEgffCKmBRFlGhIawykJvqeDU79I1J
	ExTtTEtdCJymeRqa+sJsrIinEd1sDaux+hgX3g8QhJOEvGsLytXfEvJUlfiktT5OCDsy6t
	ExycmjqR7u+nfEA3A8SlCotJCmIwV8HGm6N8esahvXNdPIm8VSguAb3epj3oDRT+fi9qae
	dw5S0kTjrhM8wh8FkQQTrTeU2F2oWv93tHzWGTCIzXJZSF0rcmi80c+7Klpx7srb0m94V/
	7mKeCPwa27+2t4BEC95hBJj9z42UzVZyTWNRiYFyaZjwXBpQpof7U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=archlinux.org;
	s=dkim-ed25519; t=1613573985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Mep3rD0SLMHwSopu/Cy21EPxfqky10jl+viotas0NRc=;
	b=rp/OnYW8U+OnIZqKgXVgtzGRZS2JIqBk3Jhd+3y4cINfMPNBwzKHvaA3QH0cYt+6T4iFX4
	T9N53xIt0TlI6+CA==
From: "Morten Linderud" <foxboron@archlinux.org>
To: tools@linux.kernel.org, konstantin@linuxfoundation.org
Subject: Re: [tools] [b4] Sign gzipped tarball instead of .tar
Message-ID: <20210217145943.vrdm2gfb2h7yvlqt@anathema>
References: <20210217134333.vqhg6xoz2bhmzpks@anathema>
 <20210217140814.yoifhqws2mdth5ec@chatter.i7.local>
MIME-Version: 1.0
In-Reply-To: <20210217140814.yoifhqws2mdth5ec@chatter.i7.local>
Authentication-Results: mail.archlinux.org;
	auth=pass smtp.auth=foxboron smtp.mailfrom=foxboron@archlinux.org
X-Groupsio-MsgNum: 343
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3zo7tumkcwibav7f"
Content-Disposition: inline

--3zo7tumkcwibav7f
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 17, 2021 at 09:08:14AM -0500, Konstantin Ryabitsev wrote:
> On Wed, Feb 17, 2021 at 02:43:33PM +0100, Morten Linderud wrote:
> > Yo!
> >=20
> > Currently packaging up b4 for Arch Linux and encountered a slight issue=
 with the
> > release tarballs for the project.
> >=20
> > The siganture says it needs to be compared against the tarball of the p=
roject,
> > however the kernel.org and googlesource.com only allows one to download=
 the
> > gzipped tarball. To recreat the release artifact one would need to clon=
e and
> > create the archive to have anything to compare against.
>=20
> Or run:
> xz -cd b4-0.6.2.tar.xz | gpg2 --verify b4-0.6.2.tar.sign -
>=20
> You can get .xz archives here:
> https://www.kernel.org/pub/software/devel/b4/
>=20
> > This doesn't work that well since we preferably include the sources
> > declaratively and not work out a tarball from the source checkout during
> > packaging. This also has the effect of most distros packaging the relea=
se
> > straight from pypi or from git with no release authentication.
> >=20
> > Could the gzipped release tarballs be signed instead? Another alternati=
ve would
> > be to sign the release tags of b4.
>=20
> FYI, all software released on kernel.org provides a signature against the
> uncompressed .tar archive. This is done to allow providing a single signa=
ture
> file for multiple compressed versions (.gz, .xz) and allow for recompress=
ing
> things in the future with better algorithms or higher compression ratios.

Ah well, I did a mistake! It turns out this is handled by pacman implicitly=
=2E I
didn't need to do anything and the issue is because I messed up the downloa=
ded
files :) I had no clue this was even a thing.

I also found a bug as it doesn't handle zstd archives :)

> Regards,
> -K

Thanks for the fast reply and apologizes for the noise!

--=20
Morten Linderud
PGP: 9C02FF419FECBE16

--3zo7tumkcwibav7f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEktnGzemaICTWkKdu50JoO6CMsv8FAmAtL18ACgkQ50JoO6CM
sv9Sqw/+LmD1ItzKe98QO79TiZelS6VeA9uqPPJTarDezM7VQQaoDEVkJrjA3tHF
Lov1PRf3aFWrruEHHYZRA5EyHC8e/tQN446wM2nZhIz4lC4kXbF6kO3Q5ra05pZV
i1gm5FG7saJGKVD+smq11fLlPti0y2H8OJHBK9+IMURILA+FR/CQzEFiuUxKyADi
fEk/IxTbvtJESMgy9RDgVNYEsPeDdKz28Cp59hNMhuTieXnIeSH1Mbab/q48tOQ8
HJ95OYnKA8f2llrR3K7Ub/QOmQKAN/y+rie/qh0RnfXHczuzaClzJvnpyPZtvccV
yApAju0ergu1bqRLRa518V2NpU9YJaqzuUWKQ4W9cRwcHm+oEKM6M6cBpMR87W0+
ygq0rklxvrjeh6fJpCbche7FlswTJaBxLsZvEtw5ZmaqRO6Hk3I58ibCHcpbwubs
npbNmozfLeOB7uP3fyAqVcnx7DMPLjwCoqqcLvXFIjEkigdoDVI5UJPcUdJkwRhK
dWmgGXkM+qeKVqDicsvOG1bm1gj5rDig8YLsMET1ikJ/HbUrhWoAtX8LrJkL2Zbk
uIGcVvPe/wIoihU8NJGL9/q6vAfvUvmSji5ilQb3rfBUW+hkfvZ2m08UOe9D8s+8
Ul+4WHu5EiturEJ18vfOKzKxe+bon546pcgqsVGSu11xDa2gw4Q=
=noVU
-----END PGP SIGNATURE-----

--3zo7tumkcwibav7f--
