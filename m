Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B56139568
	for <tools@linux.kernel.org>; Mon, 17 Jun 2024 16:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718640039; cv=none; b=qclYOS0W1QhI1BdxSdo9HVvp4LSToHAqyrvAj7mwopNstkRe6dYtTcoEMB7FEhEkcNY92WiB2ipw2CrVLQCCUlF0vwMfQ+0Z4bE44PXlKqnRx4GThXi8IMndbKMtkHk+jiANSi9SA34rA8RrqJxn8EzaUwirnA9TYSPgTAlbaeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718640039; c=relaxed/simple;
	bh=V4WrURAiC/J+PbPDQTc7EHBme1gwl2ClqxhW24kjQwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UYZXl8RxNZpb2K8m9MHAOQA4PaJ5NTKcmI8GwUV6beFDj51D2XLDeDl/aX3bfxV3gH8ZkLoS6VcGTIgVLoKa5hnrP54FQRX1pe1VMRcLyb3FSqnsz8te0DJaRpY1+185zNYtaB9hTgIdju70yRLk1V8F4uGdJ3QgWrXsEIkcr24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XNfy5//S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XNfy5//S"
Received: by smtp.kernel.org (Postfix)
	id 560B8C3277B; Mon, 17 Jun 2024 16:00:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DEC7C2BD10;
	Mon, 17 Jun 2024 16:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718640039;
	bh=V4WrURAiC/J+PbPDQTc7EHBme1gwl2ClqxhW24kjQwo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XNfy5//S3KHIyyi6juCKkP0AmsyMt6r/LhOn2uua7L6oqOlLzfhdLx52gwlx4yOb1
	 /2oKremqGxfkrRIU9xETurrVP8DddZkndQr9iXh54VViPf2P/RrVWvZYEzLdgoiCD2
	 /69hMFAVmeN4uDMi4Ol74wghe4QJcXqVNS2u4lBZWrAkxDv1oV8IDilMwIEHVmjiHG
	 ovQ/i0WQ/2kD5JcnaCBYdoCcgaTZoYbJHMiag/pq7NVGgcFqNtsRjR535VIJeV0h3S
	 KYqRDw9MPmg+Tz9RDfC3YuXBxSKZUghoTIpPratNcosfAo8iIrZqI6YtAmVMVu0XlJ
	 weOfTYnXunkZQ==
Date: Mon, 17 Jun 2024 18:00:36 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: tools@kernel.org
Subject: Re: SIGN output impossibly large
Message-ID: <6jv5lshvmvoaejoqvv5lbevitgjzpoplkx6eaxuyxsa75wq6am@leuzkhjf4izl>
References: <5yz5chpzv4qhpfpitzvgjfw2o5ctgvedzbsxzohbvl5oxvzqzc@xwzpoipfj73h>
 <20240617-calm-bald-dinosaur-ce8efe@lemur>
 <atk5mrwjkl44ffqvwwg54gzjl7mgst3pkejercb22vjmpoqwre@irmwsq54uuar>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5vw4pfg3osuzls7s"
Content-Disposition: inline
In-Reply-To: <atk5mrwjkl44ffqvwwg54gzjl7mgst3pkejercb22vjmpoqwre@irmwsq54uuar>


--5vw4pfg3osuzls7s
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: tools@kernel.org
Subject: Re: SIGN output impossibly large
References: <5yz5chpzv4qhpfpitzvgjfw2o5ctgvedzbsxzohbvl5oxvzqzc@xwzpoipfj73h>
 <20240617-calm-bald-dinosaur-ce8efe@lemur>
 <atk5mrwjkl44ffqvwwg54gzjl7mgst3pkejercb22vjmpoqwre@irmwsq54uuar>
MIME-Version: 1.0
In-Reply-To: <atk5mrwjkl44ffqvwwg54gzjl7mgst3pkejercb22vjmpoqwre@irmwsq54uuar>

On Mon, Jun 17, 2024 at 05:24:20PM GMT, Alejandro Colomar wrote:
> On Mon, Jun 17, 2024 at 11:07:44AM GMT, Konstantin Ryabitsev wrote:
> > On Mon, Jun 17, 2024 at 04:33:27PM GMT, Alejandro Colomar wrote:
> > > Hi,
> > >=20
> > > I tried uploading the tarball for man-pages-6.9.1 to <kernel.org>,
> > > following the release instructions as always, specified in
> > > <https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/tree/REL=
EASE>
> > >=20
> > > However, I'm consistently getting a fatal error from kup-server(1).
> > > I originally reported that in
> > > <https://lore.kernel.org/linux-man/vqexqoi4imi6e4sm3ddz3vicqslxip24sh=
u42ut37ydanfqnlu@2hpc5rue2d6e/T/#m4f61f1814c26c576f21da88262577511cf891976>
> > >=20
> > > Here's the problem:
> > >=20
> > >=20
> > > 	$ kup put man-pages-6.9.1.tar{.asc,} /pub/linux/docs/man-pages/
> >=20
> > Try:
> >=20
> >     kup put man-pages-6.9.1.tar{.asc,} /pub/linux/docs/man-pages/man-pa=
ges-6.9.1.tar.gz
>=20
> Same result:
>=20
> 	$ kup put man-pages-6.9.1.tar{.asc,} /pub/linux/docs/man-pages/man-pages=
-6.9.1.tar.gz
> 	Enter passphrase for key '/home/alx/.ssh/korg-alx':=20
> 	perl: warning: Setting locale failed.
> 	perl: warning: Please check that your locale settings:
> 		LANGUAGE =3D (unset),
> 		LC_ALL =3D (unset),
> 		LANG =3D "C.utf8"
> 	    are supported and installed on your system.
> 	perl: warning: Falling back to the standard locale ("C").
> 	perl: warning: Setting locale failed.
> 	perl: warning: Please check that your locale settings:
> 		LANGUAGE =3D (unset),
> 		LC_ALL =3D (unset),
> 		LANG =3D "C.utf8"
> 	    are supported and installed on your system.
> 	perl: warning: Falling back to the standard locale ("C").
> 	perl: warning: Setting locale failed.
> 	perl: warning: Please check that your locale settings:
> 		LANGUAGE =3D (unset),
> 		LC_ALL =3D (unset),
> 		LANG =3D "C.utf8"
> 	    are supported and installed on your system.
> 	perl: warning: Falling back to the standard locale ("C").
> 	FATAL: SIGN output impossibly large

And while at this, can I solve those locale issues that I see every time
I SSH into <kernel.org>?  :)

>=20
> Cheers,
> Alex
>=20
> --=20
> <https://www.alejandro-colomar.es/>



--=20
<https://www.alejandro-colomar.es/>

--5vw4pfg3osuzls7s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6jqH8KTroDDkXfJAnowa+77/2zIFAmZwXaQACgkQnowa+77/
2zK53A//c63fQBo4UKxysLKCEi2Tq26Zq3PuD1Yresc9DaMk2JfiP4g3WR2PwLnZ
viPGKwhfhLDQ8+Z7oJm3te/csAmWE6L3a91MzTGdq2X1ZFnVjVnxLxsAlX0D8NGS
cPxTuVfBR/YuTr6EhSjRkJXsufg8tog6NtUGWVPSTdh+8ntjzTsf5AXECZHF+DHN
Ztm5zGTGF2qRnJ5Mtc3Wr6gGguTXkXQSGV9BcrldDryjLKD8N6KCQebSZUbvguwn
JBIMV9u6d6x41p0OQX0+DVwtvkuyQIOecnCddHCxeNuM9mZ7+8FxG2+Co6l5r/Vk
G9lN78fAsUuCSwtFEy8nErUB4sxq0GS5PUIrpIJm0r6vVCt4zB2eSPACp6rRL/2n
ggq7t/OyIoz8lmng0PXkfz/SPF/xA6DbyqTrcsJF0P8IQL1EyIvefCv4HerDg0IN
UN1WevV98kOzHynbyxG8TZ4ARh8Naz0cQsyrdMVOF6x0K5kdqF8KepX70JH4NVq9
XbY8AXiIxm0z5gv+dMg6MCVVqRl15LhriacMsp/9CzOCFMRILtvzqHamSwiargtp
SnXmBwObmQiqalANNSzRK9G5G6Ez6bkxXVERAExWDVTBqRX6Zkr9ehjQ8Um5MMbA
rLpXo6G2i2ENt3uhL/4DU4bqW8mCLI786HwHTax8agZgNNUimTU=
=mFSL
-----END PGP SIGNATURE-----

--5vw4pfg3osuzls7s--
