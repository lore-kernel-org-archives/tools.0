Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5C215990E
	for <tools@linux.kernel.org>; Mon, 17 Jun 2024 14:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718635136; cv=none; b=EAjcVTClQ/HBui/jZwDtmG+0l1ycQlP8XY/ghz9wM3K7PDNlG9idhdQBeyC181quPzmoBWJUt7KBgvmqSHS1XSE7pjvRXzJCgC2itnCPE03hI8Vc2kCtQnuItfk3W7MtK0lsCqYG1n+xPjp9EdVN8FaeRUp1bZ8Gzue2+MWvZSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718635136; c=relaxed/simple;
	bh=kzxi3hXfqMvOd+s9XOQcEILmJGvJepPL146Kp2ojn6o=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dXzD1ydpVL4tokAt1ILwTLdu32YI42CQbi5jXzHORxPNuMdBR63tYg+dF0jnBF7qCoL3LE9yt2zSqZ2iLvzzwPB06ehk5CKXMaWKopbKINX0/Pl62KERPjxR+NJqrx7fUwJyxI2H7RxihitCF1HISFzciH9YaPRdNb623h0Ad0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mxTijrHD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mxTijrHD"
Received: by smtp.kernel.org (Postfix)
	id C9CDFC4AF1C; Mon, 17 Jun 2024 14:38:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 196E5C2BD10;
	Mon, 17 Jun 2024 14:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718635135;
	bh=kzxi3hXfqMvOd+s9XOQcEILmJGvJepPL146Kp2ojn6o=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=mxTijrHD9XcmfjI+JY7GnjCYbPcWWMtoOU0y9BupdCpxg5JTh/vcF8Ni7x5l+KteU
	 utmocvOapd3Jq9nBP96BVpjYSRyNux90fe7OdB6L1smWNppYcA5/nFkUw/TG2PdFqG
	 udzeqtmUu93kAtSREf7bLQiN3nW10Ttn8pWWfs5wwoWT78beYY/3yHGw1T90VlrHmF
	 ZgTdy5oyllDYRnfEasdhCi52mhwm+f6yA23nLHa4uAddu+ET1BcfFR3rxyA327mpyy
	 D6oauGZ1I6CYSFNlfONpOt1+IMUYGWK7juk1F6Ays0E++iaH0xhFchrMgyOePkv8ov
	 DlA7qltAdRg4A==
Date: Mon, 17 Jun 2024 16:38:52 +0200
From: Alejandro Colomar <alx@kernel.org>
To: tools@kernel.org, Konstantin Ryabitsev <mricon@kernel.org>
Subject: Re: SIGN output impossibly large
Message-ID: <aaupe74zijtis7zjuqtvoghbql2tzloabormkos5lzb62doicq@mhr6bfikq22z>
References: <5yz5chpzv4qhpfpitzvgjfw2o5ctgvedzbsxzohbvl5oxvzqzc@xwzpoipfj73h>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zk2gv2jp3db3oy72"
Content-Disposition: inline
In-Reply-To: <5yz5chpzv4qhpfpitzvgjfw2o5ctgvedzbsxzohbvl5oxvzqzc@xwzpoipfj73h>


--zk2gv2jp3db3oy72
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: tools@kernel.org, Konstantin Ryabitsev <mricon@kernel.org>
Subject: Re: SIGN output impossibly large
References: <5yz5chpzv4qhpfpitzvgjfw2o5ctgvedzbsxzohbvl5oxvzqzc@xwzpoipfj73h>
MIME-Version: 1.0
In-Reply-To: <5yz5chpzv4qhpfpitzvgjfw2o5ctgvedzbsxzohbvl5oxvzqzc@xwzpoipfj73h>

On Mon, Jun 17, 2024 at 04:33:30PM GMT, Alejandro Colomar wrote:
> Hi,
>=20
> I tried uploading the tarball for man-pages-6.9.1 to <kernel.org>,
> following the release instructions as always, specified in
> <https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/tree/RELEASE>
>=20
> However, I'm consistently getting a fatal error from kup-server(1).
> I originally reported that in
> <https://lore.kernel.org/linux-man/vqexqoi4imi6e4sm3ddz3vicqslxip24shu42u=
t37ydanfqnlu@2hpc5rue2d6e/T/#m4f61f1814c26c576f21da88262577511cf891976>
>=20
> Here's the problem:
>=20
>=20
> 	$ kup put man-pages-6.9.1.tar{.asc,} /pub/linux/docs/man-pages/
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
>=20
> 	$ ls -lh man-pages-6.9.1.tar*
> 	-rw-rw-r-- 1 alx alx  12M Jun 17 13:29 man-pages-6.9.1.tar
> 	-rw-rw-r-- 1 alx alx  833 Jun 17 13:29 man-pages-6.9.1.tar.asc
> 	-rw-rw-r-- 1 alx alx 2.0M Jun 17 13:29 man-pages-6.9.1.tar.bz2
> 	-rw-rw-r-- 1 alx alx 2.7M Jun 17 13:29 man-pages-6.9.1.tar.gz
> 	-rw-rw-r-- 1 alx alx 1.9M Jun 17 13:29 man-pages-6.9.1.tar.lz
> 	-rw-rw-r-- 1 alx alx 1.8M Jun 17 13:29 man-pages-6.9.1.tar.xz
> 	$ gpg --verify man-pages-6.9.1.tar{.asc,}
> 	gpg: Signature made Mon Jun 17 13:29:36 2024 CEST
> 	gpg:                using RSA key EA3A87F0A4EBA030E45DF2409E8C1AFBBEFFDB=
32
> 	gpg: Good signature from "Alejandro Colomar <alx@alejandro-colomar.es>" =
[ultimate]
> 	gpg:                 aka "Alejandro Colomar <alx@kernel.org>" [ultimate]
> 	gpg:                 aka "Alejandro Colomar Andres <alx.manpages@gmail.c=
om>" [ultimate]
>=20
> The build system is fully reproducible, so you should be able to
> create those same tarball with a local copy of the repository.
>=20
> I also uploaded the tarball to my own server, so you can find both the
> tarball (both compressed and uncompressed) and the detached signature
> there:
> <https://www.alejandro-colomar.es/share/dist/man-pages/6/6.9/6.9.1/>
>=20
> The problem seems to trigger here:
>=20
> 	$ grep -rn 'SIGN output impossibly large'
> 	kup-server:617:		fatal("SIGN output impossibly large");
>=20
> But I don't know why.

Hmmm, since <kernel.org> keeps a single signature file for all tarballs
in a directory, maybe it's that there are too many tarballs in the same
directory, and I should use a subdir for every release?

>=20
> Have a lovely day!
> Alex
>=20
> --=20
> <https://www.alejandro-colomar.es/>



--=20
<https://www.alejandro-colomar.es/>

--zk2gv2jp3db3oy72
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6jqH8KTroDDkXfJAnowa+77/2zIFAmZwSnwACgkQnowa+77/
2zK7Mg/7B/r5ofMDftd/1oAiFfSuSLyg3i/+6lZNpDuUi/CLLkB1AEC5dzVecQBE
CSRE+KRm+mYFbqJzDdv+iU7cho8HulMsNmyAUwjvME2HUTenDZQwdA8zFlo03Q+s
UMrYp5sSblUyVgiLNwijvTLi0nc7g4QeygaCOikArSAAwRbytxzfhrZBWqaLjBCN
jwDfjm6fvo3oXI0uia14Tu9rgHqj4v2l+zveJ6UpgXAzu8iEM31BlQQ1kI0Zo/zq
FhMaLGKjlpk64OpcKnPj/OQb9zLAZXzsaAh/drbPR9DjRPY5jbZ7HTa4kns11Jff
uHXM+G7L5O267S69g9+Te4pNl24n06D+S0o9Rp3qbqxQnHWCkb+Y4FMIH3kkXUQc
g+D8JmC7kixN7/zJTp+hgsqeLi5MxCNvrlpjYZmbeEY5b/GLQ04HOCocHkpIrn3G
/lmEZvAtsO7OXKZXo5oHS3HHb8P0F56gP8I7tg+j0knwARer+5UK0xCEk7FoAOG8
22lYafhxyYS7wopgG46Hk24e8MqlAz+hjNu+rrxZXu/NToTj6SJsTn/34K291i1D
KMe0maWPQ1DtwkNpsPPlXYC9JTi2hgD4LOeI2SCmo5CMTo+dlTIdFmLXtlUrTzRY
tpSUU6TplphokxcSgO1fIWyMxRkoKNltiDUWDB07yOtvcUoJJ/o=
=JPKe
-----END PGP SIGNATURE-----

--zk2gv2jp3db3oy72--
