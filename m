Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71ECB225403
	for <tools@linux.kernel.org>; Sun, 26 Apr 2026 11:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777203526; cv=none; b=QRpE6Bcvgo0c7s43L+xnS7WrkeFEc1s1Eg1oE8/o7UjLnKGsl/VGB/qdFAospFI0aUgaML46AUGXnwHEFc6v+Qp/ju0XWKCW2hSVsrtRt+eAS16yGSoS8oh3qMf7q+7QgCcn90dicfU2zyokDxkuebnWSUA09vxtTQ4rhE3yYr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777203526; c=relaxed/simple;
	bh=t34AMTUQaPl6gQn/Pj91c4BVULN9dKriX2Fr031OCNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L3ujwedxZ9XtIJyR2IIN1LRVbql/KrZ777Z7J7MMw1rXorUNeHijFCevSlQIqQpesSLhQkQ9CCupeYDzxcbWWEWSC19P6HxG5aW7+We5oxHe3mAaUDGrjp8+zsWL1IiUh7SwegNb/OAA/FTdPTdL8EV/JKhAydeWY1e9L53g108=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (4096-bit key) header.d=beyermatthias.de header.i=@beyermatthias.de header.b=Lr8OrtdX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=beyermatthias.de header.i=@beyermatthias.de header.b="Lr8OrtdX"
Received: by smtp.kernel.org (Postfix)
	id 2FE2EC2BCAF; Sun, 26 Apr 2026 11:38:46 +0000 (UTC)
Received: from mailgate02.uberspace.is (mailgate02.uberspace.is [185.26.156.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 88ACFC2BCB6
	for <tools@kernel.org>; Sun, 26 Apr 2026 11:38:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 88ACFC2BCB6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=beyermatthias.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=beyermatthias.de
Received: from cressida.uberspace.de (cressida.uberspace.de [185.26.156.202])
	by mailgate02.uberspace.is (Postfix) with ESMTPS id BDAE41833DF
	for <tools@kernel.org>; Sun, 26 Apr 2026 13:38:41 +0200 (CEST)
Received: (qmail 25087 invoked by uid 989); 26 Apr 2026 11:38:41 -0000
Authentication-Results: cressida.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
	by cressida.uberspace.de (Haraka/3.1.1) with ESMTPSA; Sun, 26 Apr 2026 13:38:41 +0200
Date: Sun, 26 Apr 2026 13:38:39 +0200
From: Matthias Beyer <mail@beyermatthias.de>
To: tools@kernel.org
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: b4 adds Link trailer although not asked to?
Message-ID: <cltup2qefzi25wupghnwxhls43ecxd7sp4j7rkzffr633pdlgg@g4ukbqcoor7f>
References: <e3mhkyielk4berng7qdypcyty5e7yru3u4hsyx2fgzta56ryzf@xufrwmpc3g4b>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nogmpkza5ifwzghy"
Content-Disposition: inline
In-Reply-To: <e3mhkyielk4berng7qdypcyty5e7yru3u4hsyx2fgzta56ryzf@xufrwmpc3g4b>
X-Rspamd-Bar: -
X-Rspamd-Report: BAYES_HAM(-0.814925) MID_RHS_NOT_FQDN(0.5) SIGNED_PGP(-2) SUBJECT_ENDS_QUESTION(1) MIME_GOOD(-0.2)
X-Rspamd-Score: -1.514925
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=beyermatthias.de; s=uberspace;
	h=from:to:cc:subject:date;
	bh=t34AMTUQaPl6gQn/Pj91c4BVULN9dKriX2Fr031OCNQ=;
	b=Lr8OrtdXzVcJEyG+TaxTWRODe9m+xNOrfCLUHTpO/iEQLgiR6IZAnozSSLawEU9f8twHafE8yM
	JBIAoyDZPcxNMn3mRMm7AfQ6MuqfBl4f7YolCLcuAOh3BlNpy6DgJ4JsEklmx24ZWojpQs1/lSfz
	cWdTxzb8ZvuzjYowTUK9Gzo54tYm7xKLGjDXD0v5p1BOjAmYZU7p5RJ0V5vUFp/lqNfFRBNho9m1
	T9e/iRjL1wFVhWacXnMolv2uKqaYoTY1IToRE8TpWZk0PkO5y00CXEGo2W+6J/yiefmo73D/da+e
	l/mtC54mFbByxXWAjZ3fvuI8RJ7bd7V7VmyQ+E8oe/V8Hklgu0ajpA4wNPDOeZVCPM1+IYTu2IRj
	AL6coTLRE6a7HdQ9GaEZBXzCEv1Qi3iCNB1MNACXMZYdYaM1BxOIHbkhNCw8NfyPJMf6xwbaIBvN
	TbXw6BsJIChLN8EaGFhvZSasXiNlM4TybKFoWLGF6vYUPCwhZxvMX2fAiGfN3eEGOSic1xAaLBBE
	oAE4atrGfpLpnIqogJlKcy7xcpuKG3dZor5VuNEVYwL9uvNZ70UKCg04Z6X4oTeyYL8CbxgGiD3X
	YsWXOWj6m/QcimKvAuvVO8yG13pAvFPTnaNPJL0dyJX8NlTQ2hBX6aZdsb11LnjoQc2vUpVtYtFt
	4=


--nogmpkza5ifwzghy
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: b4 adds Link trailer although not asked to?
MIME-Version: 1.0

Hi again,

after playing some more, the issue did not appear with `b4 shazam` if I
did not specify `--add-link`.

Am Sun, Apr 26, 2026 at 12:21:34PM +0200, schrieb Matthias Beyer:
> [...]
> I am currently playing with b4 and am wondering why b4 adds a `Link:`
> trailer even though I did not specify `--add-link`.
>=20
> There's no configuration file around
>=20
>     git config list | grep b4 # no output
>=20
> or something, here's what I did:
>=20
>     notmuch show --format=3Dmbox $SOME_NOTMUCH_QUERY | b4 am -m - -o -
>=20
> and it prints the resulting patches with a `Link: ...`.
>=20
> FWIW, I am not in the kernel context, so a lore.kernel.org link is wrong
> for my usecase (I know I can set an alternative mask, but I don't want
> any link in the resulting commits here).
>=20
> The above was tested with b4 0.14.3 and 0.15.2.
>=20
> The only source line in b4 that sets addlink=3DTrue is in
>=20
>     src/b4/mbox.py:135
>=20
> but I don't see how that line is hit in my case, because `addmsgid`
> should be False here (False by default).
>=20
> Hope you can help me here,
> Best,
> Matthias



--nogmpkza5ifwzghy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEUJGUus1GMTrRclzcEKWX9Kitz80FAmnt+T8ACgkQEKWX9Kit
z80SQhAAvnctJZSwr3Dx/SVtm1J0JrIGxTQ9SxL6NDUpRJRPPrCA+j8MopSALlwm
PZeoTIlPC4r00ZMkiGvuQH01gXR76ckTCQuZdE4VMDRgfpQFLf40ZFtc2T7K8iLX
gkD85NfcgTrkdYOiouBC/1M5AMJK2TEgBRGpG5azGhsf/WHPdxUSX0FmXCl0X5OT
6Bk7wJbLUDD+FGwTo7XFfFVjn3QBBjrV2X8EhZ6jCpr/L9ehiHpjRpIHlrcUGHgC
5LthCBCJjxo6g3/TB9k6x9E3oj+HXutS/RKZcodTcYzQKbRamEKxh6ZKIxjqKI4F
9zsMM8vaii/hFXxwmKSDZq84b1DLLbknNgeFpNFU2lzG7AmqAAau8f5ZCMCDwMWo
2GxyS/3MTkXnkpHHE3AU3gNWwvIRJyFPkri8Rv8BcBWWYBtzeYIpziPT4HbXz6uw
deo+4QlATeRXqQwBj1RW75HmLD1FSnmXKUZDa2T/jkp1DQxCvlfAzMKBjbP+laVo
z2G9P5+QKGvH4i+h+ealG82V6+IHZOQhidZgcanvHWCSHn4US7Bu2v7O/DB9rrHB
8ySO6pDQ0AF1QQswZr37V95CTL1I+0AA38GRQjVGdBgi4LgWQavt9ZDHieDrjhi+
YMbwiNDA3dSe8VIY1ed2uAm9QdSXc+jS4kc3lwqgFEJCwSpNNKs=
=xsqv
-----END PGP SIGNATURE-----

--nogmpkza5ifwzghy--
