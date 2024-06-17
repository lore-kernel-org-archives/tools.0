Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38AB71586FE
	for <tools@linux.kernel.org>; Mon, 17 Jun 2024 14:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718634811; cv=none; b=gvXl68tft1l68znHE7LugWROqppwtWhxOG92YAglt81H2zAHAgn+fV169PUv7K3Rjtzwj2CGnhMeR1WsLPQ8Ew6Z49qwcoCKTMo4MjgFjuL17AZ0DMkcLe8+vhVYRAuzuVChcGZckyiQqn/GGjQW2x7s2glvYM1MClmGxOQ/CrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718634811; c=relaxed/simple;
	bh=cwua57DV6p2trkoPtqJPIzCK+xQsttLPIjLTSEGaIOw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O74kb2t4BdnPwnNVYjZG55OWPEHOHQKO8yvYXktu3FhHxYLRe7wMtw6af7EXg4mMyKIEzDJOjsFkyMArHWYtLu5KwMKhjdmdF7X5uySvtO3OP9EN2mC4xPfUkgSXRZ9SWlUoGWp+6xwRHK4a+m53Xdm/1LW2ROmscYxW89FQ3RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=twSTxvXV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="twSTxvXV"
Received: by smtp.kernel.org (Postfix)
	id D9313C4AF66; Mon, 17 Jun 2024 14:33:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18509C4AF50;
	Mon, 17 Jun 2024 14:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718634810;
	bh=cwua57DV6p2trkoPtqJPIzCK+xQsttLPIjLTSEGaIOw=;
	h=Date:From:To:Subject:From;
	b=twSTxvXVksP7ZkviW4yETUzy1P7GNSGHHqPgTMNVXd5U1CEYyRi+UD6nhPzLiDH/C
	 Mqu1zffDRUw7L6kB22/zOtDxYscvEstbyoqC8cngvG4ufBBPonLApClqDuZCqkAEiI
	 J2kDAENHEtZGIAlyWTln8LZeiWKCjoKuZjm17JV6Y80fQppks9q2pevfPBW2D5Uowk
	 Gs6mAT41khTz5UBk+uaDU3YYW7e7d1d4BDZuwWgqVY8cQ0qiLaV8xGXtfPesyDCzS0
	 cnLgGOgnYCxKVSrqQvFqI3PtYcHoly7FpqXl7yAFbFUMamn/JgwpRjdcBvJfKh8EGk
	 KWlhSni11HBNg==
Date: Mon, 17 Jun 2024 16:33:27 +0200
From: Alejandro Colomar <alx@kernel.org>
To: tools@kernel.org, Konstantin Ryabitsev <mricon@kernel.org>
Subject: SIGN output impossibly large
Message-ID: <5yz5chpzv4qhpfpitzvgjfw2o5ctgvedzbsxzohbvl5oxvzqzc@xwzpoipfj73h>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kn4ynqyasxed5prm"
Content-Disposition: inline


--kn4ynqyasxed5prm
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: tools@kernel.org, Konstantin Ryabitsev <mricon@kernel.org>
Subject: SIGN output impossibly large
MIME-Version: 1.0

Hi,

I tried uploading the tarball for man-pages-6.9.1 to <kernel.org>,
following the release instructions as always, specified in
<https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/tree/RELEASE>

However, I'm consistently getting a fatal error from kup-server(1).
I originally reported that in
<https://lore.kernel.org/linux-man/vqexqoi4imi6e4sm3ddz3vicqslxip24shu42ut3=
7ydanfqnlu@2hpc5rue2d6e/T/#m4f61f1814c26c576f21da88262577511cf891976>

Here's the problem:


	$ kup put man-pages-6.9.1.tar{.asc,} /pub/linux/docs/man-pages/
	Enter passphrase for key '/home/alx/.ssh/korg-alx':=20
	perl: warning: Setting locale failed.
	perl: warning: Please check that your locale settings:
		LANGUAGE =3D (unset),
		LC_ALL =3D (unset),
		LANG =3D "C.utf8"
	    are supported and installed on your system.
	perl: warning: Falling back to the standard locale ("C").
	perl: warning: Setting locale failed.
	perl: warning: Please check that your locale settings:
		LANGUAGE =3D (unset),
		LC_ALL =3D (unset),
		LANG =3D "C.utf8"
	    are supported and installed on your system.
	perl: warning: Falling back to the standard locale ("C").
	perl: warning: Setting locale failed.
	perl: warning: Please check that your locale settings:
		LANGUAGE =3D (unset),
		LC_ALL =3D (unset),
		LANG =3D "C.utf8"
	    are supported and installed on your system.
	perl: warning: Falling back to the standard locale ("C").
	FATAL: SIGN output impossibly large

	$ ls -lh man-pages-6.9.1.tar*
	-rw-rw-r-- 1 alx alx  12M Jun 17 13:29 man-pages-6.9.1.tar
	-rw-rw-r-- 1 alx alx  833 Jun 17 13:29 man-pages-6.9.1.tar.asc
	-rw-rw-r-- 1 alx alx 2.0M Jun 17 13:29 man-pages-6.9.1.tar.bz2
	-rw-rw-r-- 1 alx alx 2.7M Jun 17 13:29 man-pages-6.9.1.tar.gz
	-rw-rw-r-- 1 alx alx 1.9M Jun 17 13:29 man-pages-6.9.1.tar.lz
	-rw-rw-r-- 1 alx alx 1.8M Jun 17 13:29 man-pages-6.9.1.tar.xz
	$ gpg --verify man-pages-6.9.1.tar{.asc,}
	gpg: Signature made Mon Jun 17 13:29:36 2024 CEST
	gpg:                using RSA key EA3A87F0A4EBA030E45DF2409E8C1AFBBEFFDB32
	gpg: Good signature from "Alejandro Colomar <alx@alejandro-colomar.es>" [u=
ltimate]
	gpg:                 aka "Alejandro Colomar <alx@kernel.org>" [ultimate]
	gpg:                 aka "Alejandro Colomar Andres <alx.manpages@gmail.com=
>" [ultimate]

The build system is fully reproducible, so you should be able to
create those same tarball with a local copy of the repository.

I also uploaded the tarball to my own server, so you can find both the
tarball (both compressed and uncompressed) and the detached signature
there:
<https://www.alejandro-colomar.es/share/dist/man-pages/6/6.9/6.9.1/>

The problem seems to trigger here:

	$ grep -rn 'SIGN output impossibly large'
	kup-server:617:		fatal("SIGN output impossibly large");

But I don't know why.

Have a lovely day!
Alex

--=20
<https://www.alejandro-colomar.es/>

--kn4ynqyasxed5prm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6jqH8KTroDDkXfJAnowa+77/2zIFAmZwSTcACgkQnowa+77/
2zJ4hw/5AfZ1/WAQ5X0oNAsWN6MA8Auww3uolqdEOHFxhrxdSqokxkartUSEWRkG
Ce2DxMSWyM4OqnmscE6pTaJkYUH493FPjanI3eUv6UYSSzOOfu5uXIa60M+uvbwX
YAXToTn798s07vyqvsFG3s7F7ZwfTiw9bJnxf1MZRP0wFuplVXVACMYe7e4SCruf
lB1Xsj5P93xZylutDgj9WLIunTZaovJM4FGvLUoFwM80yrH1Iz9ySCHqXw853KYb
46SQrYHImd/DXpSEGgMRW//9rVpsW8pz5BMKCk1/O68sYDzwDimIO29jgNekyCxx
iiKnEoEgDc9ORgn/DsTayK+zpm6DXaEl14usYqne5mPFJNkO8T5fk1RBTIHOi9CK
2FpowOI69AjeehlEDhjiYb9msA4GKf5FClrtCvvKgl4q6wqNaRB0gciKmQ8xnDEm
IGdDtG+2wMjuaUtiGBOH943G5x4vGpczj15l8Hn5vMUwksr0/AavvNggDq7Re5+Y
2GzGL+5XE/plq83HFkyGUVRVRdE4LIWEZtdIdiroeLv9z8Taqcf7eL0N8od6xgoR
nptXxBhsKoBiTs0AkAqBKIt4KExrojTzjXiSNaXkPYj6XDT2pvTv0Po8IZX0tjBu
OyFHu7Jy8/rubDDnfso46yN3+ba31PdHxiKnRcXtq9hjvGZ1Fco=
=0xeD
-----END PGP SIGNATURE-----

--kn4ynqyasxed5prm--
