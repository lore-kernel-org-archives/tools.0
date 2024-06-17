Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A492468E
	for <tools@linux.kernel.org>; Mon, 17 Jun 2024 15:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718637861; cv=none; b=iX7yYl2R5PN0QrcBNZeFQuGADU1fecBMmgCNCD38tLtnfRNl0ry2qQsoiyOwwoFdcm2ILXYYHjTthrDk3+dKEKvYQTiSWJ03Q3Ojh1FG88D56YRuQ5teocpygnsgHtaNwgKLugJtzpz3ydhkhgWXQc99vACb4pd8/tCwkz9NXFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718637861; c=relaxed/simple;
	bh=qNx7nrBJDpsKPKpQ5xR7kQk5L2anDJXZJOGPNnT1zx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lt9vfCZUX3/tx3S/TJyT9QQNTYI8FOiBdAxev4OK4UFcv6hGAkhBk7jacekbuMmvDasw/GALsppbW1aKBctVbru/CWG5sTemwjYcHpKXlZyHYnyDqQtatoL4swYCIda90W4lbXjLoc7WKvVe2iPck5j4ZLpW/25BMrt/P/DNRt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sHc1NknB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sHc1NknB"
Received: by smtp.kernel.org (Postfix)
	id E10D1C4AF1D; Mon, 17 Jun 2024 15:24:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2567CC2BD10;
	Mon, 17 Jun 2024 15:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718637860;
	bh=qNx7nrBJDpsKPKpQ5xR7kQk5L2anDJXZJOGPNnT1zx8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sHc1NknBFKbvn3APydq9X9HbK7uVv7w/TvmmCRJBowcWRD1wlCHtEMAxY8vkrGy/C
	 wAd5Gah/NHs6XAJ++wi1eaEe4Y8tXtm+VWW58NYN01Dh/SovwNdhUNv+uhScdUba61
	 m2RN3OSh8kFdsgIt2IGF7vmHnHKofmTYRISlBLAuYqQo/NDu91chYzKUORmgQcztPL
	 o9qnkzGy5SGQrrxamz8mzqYGFUIUWUQfUsSswmnz/512X8oQ1RwMo6BWXuHYUFT/l0
	 AaWsydPQVoiOiz+ZW9rNzeaBOR7qtXVSclttXerZ6LZI4VHsp+1GVpnRT4q+QAsCuN
	 EB1DMBJrX72TA==
Date: Mon, 17 Jun 2024 17:24:17 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: tools@kernel.org
Subject: Re: SIGN output impossibly large
Message-ID: <atk5mrwjkl44ffqvwwg54gzjl7mgst3pkejercb22vjmpoqwre@irmwsq54uuar>
References: <5yz5chpzv4qhpfpitzvgjfw2o5ctgvedzbsxzohbvl5oxvzqzc@xwzpoipfj73h>
 <20240617-calm-bald-dinosaur-ce8efe@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6kbdrcwdgblxwxsp"
Content-Disposition: inline
In-Reply-To: <20240617-calm-bald-dinosaur-ce8efe@lemur>


--6kbdrcwdgblxwxsp
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: tools@kernel.org
Subject: Re: SIGN output impossibly large
References: <5yz5chpzv4qhpfpitzvgjfw2o5ctgvedzbsxzohbvl5oxvzqzc@xwzpoipfj73h>
 <20240617-calm-bald-dinosaur-ce8efe@lemur>
MIME-Version: 1.0
In-Reply-To: <20240617-calm-bald-dinosaur-ce8efe@lemur>

On Mon, Jun 17, 2024 at 11:07:44AM GMT, Konstantin Ryabitsev wrote:
> On Mon, Jun 17, 2024 at 04:33:27PM GMT, Alejandro Colomar wrote:
> > Hi,
> >=20
> > I tried uploading the tarball for man-pages-6.9.1 to <kernel.org>,
> > following the release instructions as always, specified in
> > <https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/tree/RELEA=
SE>
> >=20
> > However, I'm consistently getting a fatal error from kup-server(1).
> > I originally reported that in
> > <https://lore.kernel.org/linux-man/vqexqoi4imi6e4sm3ddz3vicqslxip24shu4=
2ut37ydanfqnlu@2hpc5rue2d6e/T/#m4f61f1814c26c576f21da88262577511cf891976>
> >=20
> > Here's the problem:
> >=20
> >=20
> > 	$ kup put man-pages-6.9.1.tar{.asc,} /pub/linux/docs/man-pages/
>=20
> Try:
>=20
>     kup put man-pages-6.9.1.tar{.asc,} /pub/linux/docs/man-pages/man-page=
s-6.9.1.tar.gz

Same result:

	$ kup put man-pages-6.9.1.tar{.asc,} /pub/linux/docs/man-pages/man-pages-6=
=2E9.1.tar.gz
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

Cheers,
Alex

--=20
<https://www.alejandro-colomar.es/>

--6kbdrcwdgblxwxsp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6jqH8KTroDDkXfJAnowa+77/2zIFAmZwVSEACgkQnowa+77/
2zJRKQ//Umyumou2GMsSbnczTybPI7IJleyB8aDtwk0EmkmLjTpREQtTkI8TBpPZ
VKM+twBHVDXK3aAbY9vsxH++6iRwwNjRpMv+v9AtsxI3uP+k1RIZ7F604/BGNeS9
IzaN47ar6KPfT55wDB3g15odDv1wIHe62CWn5Dk8BXYaKTJh3dB4GO2XXKHDYjjv
WPaVdDfqv1Ul4zm7NzR16lyGDSySyK/R96xgtnLeWWRUCoSzxuvSxcXTS3Rf3GoF
sAsJoklIx0qFLGAgYFtmzpO9//T3tTgaCxxv2qmXU19N2lr8Gj/tLfwPYeM6SdO8
OXHd0wh1hVEUHKWOyYmakcsrBBAwJob0BKYMQups16b1/fqIPubfd/ORubhSA8az
RU8bUZViLamwEB5IagjMmEC5NJPKR6qWCj0xThxEu7Zw1P7dyh2q++ZAdypPsrTI
fEGyYOJsrtHbo9dx//KB7O3c4NF0XQCGBhoZZOVdlTq57OB0NotDyq36mTZEHtvN
J7yZ6DMlV15HLpnKMlb6ZxwYYmrhfCT7mXg/jKOz+OWKwwdXzolSrs32suqzE4T1
Ua64XjBHKHLytQT44FPXGDTctZcgOgypXNp6HtmytNN9YoO357MHza5CBX8r5pQx
f+NcluFgbvubBpsRCdRvA5HwNLk1eUULvG6yUHnlmwiPJtKrRxY=
=0sZl
-----END PGP SIGNATURE-----

--6kbdrcwdgblxwxsp--
