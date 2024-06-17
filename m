Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68D615F318
	for <tools@linux.kernel.org>; Mon, 17 Jun 2024 16:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718642258; cv=none; b=VWSYfWFs8Sp2Grk1j6hKymJn/5o8pbIC7iJTcyPOwTEC8EEwDeDDuO5tDIGmW2JNImu3lAckU8QP7zW9xdo2MIlTDOPyqSJT3MDwcqIgPsV3Ea2rRomXVMxDofVA8r4rG4e6KlP3dCwFhaj32IqFlga/n7aDFct+BGXYYHu+Z18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718642258; c=relaxed/simple;
	bh=Z76DtNxTGLkWMW8twaucPXPFY/2Ws1WOvQvbdko3JSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rk7fEIrqbBXfRmjP6FIADFn1YyxFvLMGYNqob4OfQDIak2a6NMts7p46trEsZYHZdQG7dueZOEV0Fl0T0+wFwyfrpSoWATmBJYJw3xGjpJ4hbJpqik7e2Ef7AnboOPECDq9F8pKh02ehHyQT8QCrOTBd0GSv6kHOu4S5nAk2JZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CRZ39LcP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CRZ39LcP"
Received: by smtp.kernel.org (Postfix)
	id 73F3CC4AF1C; Mon, 17 Jun 2024 16:37:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B93EBC2BD10;
	Mon, 17 Jun 2024 16:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718642258;
	bh=Z76DtNxTGLkWMW8twaucPXPFY/2Ws1WOvQvbdko3JSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CRZ39LcPykWun673KYfwS37sxp842N+K7saPDxxtIrYxc9djCU0TbKUdN4Cvo9h4D
	 HQ9PmehtBxKgn3HHIHUJIK6JoGCoL7kk4Of71fLJvsQqvPFicvuMwilWEI/60qlFKM
	 g75dy+Ob5SbaeTJyKVfwv7vrPvpQ18T+Y2vobtWjPZsfboCy9xqQI3klAAwJSxVoUK
	 D701Kg+BMzCPSKBZNybWfyS8eo9RxANYzmiey1ghGvW05B5EY+8pB0sbdGdG8IdXO8
	 utTe5rsRk5Wwx2M2DuJuJFw0ocDSvoXX6fwQ9G+HLKQEa/hSip36oP9dUbK/aFj7ly
	 b2d/WhPVsXSfQ==
Date: Mon, 17 Jun 2024 18:37:35 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: tools@kernel.org
Subject: Re: SIGN output impossibly large
Message-ID: <6fers6bgoiyc44h23wcvk4ebkf5vpwxdkxvgaiifvilnb6tcbo@wnzi6tdxn5b5>
References: <5yz5chpzv4qhpfpitzvgjfw2o5ctgvedzbsxzohbvl5oxvzqzc@xwzpoipfj73h>
 <20240617-calm-bald-dinosaur-ce8efe@lemur>
 <atk5mrwjkl44ffqvwwg54gzjl7mgst3pkejercb22vjmpoqwre@irmwsq54uuar>
 <6jv5lshvmvoaejoqvv5lbevitgjzpoplkx6eaxuyxsa75wq6am@leuzkhjf4izl>
 <20240617-secret-charcoal-cougar-dcd01a@meerkat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3dha7rb6cb53sne2"
Content-Disposition: inline
In-Reply-To: <20240617-secret-charcoal-cougar-dcd01a@meerkat>


--3dha7rb6cb53sne2
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
 <6jv5lshvmvoaejoqvv5lbevitgjzpoplkx6eaxuyxsa75wq6am@leuzkhjf4izl>
 <20240617-secret-charcoal-cougar-dcd01a@meerkat>
MIME-Version: 1.0
In-Reply-To: <20240617-secret-charcoal-cougar-dcd01a@meerkat>

Hi Konstantin,

On Mon, Jun 17, 2024 at 12:17:11PM GMT, Konstantin Ryabitsev wrote:
> On Mon, Jun 17, 2024 at 06:00:36PM GMT, Alejandro Colomar wrote:
> > > >     kup put man-pages-6.9.1.tar{.asc,} /pub/linux/docs/man-pages/ma=
n-pages-6.9.1.tar.gz
>=20
> I think your shell is resolving your shorthand in the wrong order, or your
> local files are swapped, because what we're receiving on our end is the
> reverse order:
>=20
> kup-server(alx)[15972]: Cmd: DATA 833 %
> kup-server(alx)[15972]: Cmd: SIGN 12390400 %

I tried without shorthand, but still same result.  Maybe kup-server(1)
is mixing them?  Or maybe the kup(1) client?

	$ kup put \
		man-pages-6.9.1.tar.asc \
		man-pages-6.9.1.tar \
		/pub/linux/docs/man-pages/man-pages-6.9.1.tar.gz
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

	$ date
	Mon Jun 17 18:28:51 CEST 2024
	$ echo $BASH_VERSION
	5.2.21(1)-release
	$ ls -l man-pages-6.9.1.tar{.asc,}
	-rw-rw-r-- 1 alx alx 12390400 Jun 17 13:29 man-pages-6.9.1.tar
	-rw-rw-r-- 1 alx alx      833 Jun 17 13:29 man-pages-6.9.1.tar.asc
	$ file man-pages-6.9.1.tar
	man-pages-6.9.1.tar: POSIX tar archive (GNU)
	$ file man-pages-6.9.1.tar.asc
	man-pages-6.9.1.tar.asc: PGP signature Signature (old)
	$ gpg --verify man-pages-6.9.1.tar.asc man-pages-6.9.1.tar
	gpg: Signature made Mon Jun 17 13:29:36 2024 CEST
	gpg:                using RSA key EA3A87F0A4EBA030E45DF2409E8C1AFBBEFFDB32
	gpg: Good signature from "Alejandro Colomar <alx@alejandro-colomar.es>" [u=
ltimate]
	gpg:                 aka "Alejandro Colomar <alx@kernel.org>" [ultimate]
	gpg:                 aka "Alejandro Colomar Andres <alx.manpages@gmail.com=
>" [ultimate]
	$ bash --version
	GNU bash, version 5.2.21(1)-release (x86_64-pc-linux-gnu)
	Copyright (C) 2022 Free Software Foundation, Inc.
	License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.ht=
ml>

	This is free software; you are free to change and redistribute it.
	There is NO WARRANTY, to the extent permitted by law.
	$ uname -a
	Linux debian 6.8.12-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.8.12-1 (2024-05-=
31) x86_64 GNU/Linux
	$ dpkg -l | grep kup-client | sed 's/   */  /g'
	ii  kup-client  0.3.6-4  all  kernel.org upload tool
	$ cat /etc/os-release=20
	PRETTY_NAME=3D"Debian GNU/Linux trixie/sid"
	NAME=3D"Debian GNU/Linux"
	VERSION_CODENAME=3Dtrixie
	ID=3Ddebian
	HOME_URL=3D"https://www.debian.org/"
	SUPPORT_URL=3D"https://www.debian.org/support"
	BUG_REPORT_URL=3D"https://bugs.debian.org/"


Cheers,
Alex

--=20
<https://www.alejandro-colomar.es/>

--3dha7rb6cb53sne2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6jqH8KTroDDkXfJAnowa+77/2zIFAmZwZkkACgkQnowa+77/
2zJ4mhAAn0klTBPVaNsIubhGK63/hKN1cvwU10WfjXmaYK4nEOZ4zUKiEgO75HY6
TlrZfuwIc60JC8f0YoeGGYtc/HQt52+jUeVW4kjfP7icXf/LaVn+s852luTCSST5
urUDtNrX5/pCk/D5jFJn4Y2NDKy8df1kmG9bqR6NHqtDwnMRvPUocETBLfewmixg
xyKjfn3h3A1qYt4VVDYTRvsHhIMXMqd+EcpJCrljtajDYodS8l96qWpJqnbPOp5R
sxbVD/XHSwzkA5aWB2vOVuFQkfv4o5a1wJIleEaHYGO4dWO3JMCmY9VPYZBIJc+Z
UReGYqKspyqn8c4sjiFQuDz1uoU1zQx1+NZ4LmfIO4t9EU2MHBZsoKVWBOgqd7EI
+2Gzx+jGMjmZwyXJKmfx0+WewqK+Lg+SU9Uli/c5S/blG2M2opWPSlsvjHRRdbnH
GcKMXkguaSkAjuVu128fBSHJu36G1nDZtl9U/iMyoI5R9BpGEjZuIAQtkz5iITbF
xJmCiF2m59cGs/CCZPrvpmvx2k3DLCYcY2BvFTv3xr8BQgLg2ZCTcYGQG0hvLu2U
zJ5aeEsNt4IfUuJLppoTyjnDQvwGYh5iapTvjtC9LNGR1qBnKPL3+0cVoIzb3JIS
oqJXvAlCsMnnD5fV1iWUNxFATY4x8v8pcNBZpA3Zc1LA5vJjprE=
=eZBY
-----END PGP SIGNATURE-----

--3dha7rb6cb53sne2--
