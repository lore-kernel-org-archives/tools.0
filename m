Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5DE1869
	for <tools@linux.kernel.org>; Wed,  2 Aug 2023 07:30:40 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20230802073032euoutp018b5dd667bc2ccdcd6d502b64eff03a6a~3gHa2ojJX0079600796euoutp01K;
	Wed,  2 Aug 2023 07:30:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20230802073032euoutp018b5dd667bc2ccdcd6d502b64eff03a6a~3gHa2ojJX0079600796euoutp01K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1690961432;
	bh=PaOPA6QYSOfO0GgrE4RtdQdz814QyMegFnAr1DlIOY0=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=NNzzLsGUqyrLgv5UxMgUfTDw4mfGO2SFcN8dVojypM6H6q1ISYDKOM/ZPYcEC0chz
	 NxeKkZ9mn+VHBr5TOxIxBc2vfbE7djOV9nLNCAqQCLREp71PacJxdZP4xOpEqpFQkO
	 L4zH3w5Ip5BjUGfYYYkquia2j1/oAqjJjjJR22+w=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20230802073032eucas1p150f4524e126061d3f4c2f029c1e9da40~3gHappy9w0388703887eucas1p1j;
	Wed,  2 Aug 2023 07:30:32 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges1new.samsung.com (EUCPMTA) with SMTP id CA.8D.42423.8160AC46; Wed,  2
	Aug 2023 08:30:32 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20230802073031eucas1p2145adb5756c27a08938b70394640fbf0~3gHaXWpib1151711517eucas1p2S;
	Wed,  2 Aug 2023 07:30:31 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20230802073031eusmtrp11aecaa5e95b2d1ae209fe1d4bebf0518~3gHaW11ux1192511925eusmtrp1M;
	Wed,  2 Aug 2023 07:30:31 +0000 (GMT)
X-AuditID: cbfec7f2-a3bff7000002a5b7-60-64ca061815f0
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id 4B.FC.10549.7160AC46; Wed,  2
	Aug 2023 08:30:31 +0100 (BST)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20230802073031eusmtip2773b7be765c703e32dbd79cd52f83ff7~3gHaGT6pF0355303553eusmtip2D;
	Wed,  2 Aug 2023 07:30:31 +0000 (GMT)
Received: from localhost (106.110.32.133) by CAMSVWEXC02.scsc.local
	(2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
	Wed, 2 Aug 2023 08:30:30 +0100
Date: Wed, 2 Aug 2023 09:30:29 +0200
From: Joel Granados <j.granados@samsung.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
CC: Kernel.org Tools <tools@linux.kernel.org>
Subject: Re: [PATCH b4] ez: Add a --web arg to force web endpoint
Message-ID: <20230802073029.gkles6alt4g6gy5c@localhost>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="bv4xmzdgpyv7nha7"
Content-Disposition: inline
In-Reply-To: <20230801-giggly-postnasal-707142@meerkat>
X-Originating-IP: [106.110.32.133]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
	CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBKsWRmVeSWpSXmKPExsWy7djPc7oSbKdSDHYf5rLY+fkLo8X0c49Z
	HZg8jl3pYPPYP3cNewBTFJdNSmpOZllqkb5dAlfGku9NzAWbRCs+7drB3sB4UrCLkZNDQsBE
	YvvfJ8xdjFwcQgIrGCWe/53OCOF8YZTourOAHcL5zChxe/sSNpiWey/7oFqWM0o8ufqRDa7q
	+PZWFghnM6PEuQO3WEBaWARUJBo6VzOD2GwCOhLn39wBs0UELCX27foAZjML6Eos+HoIrF5Y
	wFFi2vFjYDavgLnEqw1djBC2oMTJmU9YIOorJDZs+A9kcwDZ0hLL/3GAhDmByj/tv8gKcamS
	xNc3vVB2rcSpLbeYQG6TELjCITH/yEeod1wk5u9uZoKwhSVeHd/CDmHLSJye3MMC0TCZUWL/
	vw/sEM5qRolljV+hOqwlWq48gepwlDhwu4Ed5CIJAT6JG28FIQ7lk5i0bTozRJhXoqNNCKJa
	TWL1vTcsExiVZyF5bRaS12YhvAYR1pFYsPsTG4awtsSyha+ZIWxbiXXr3rMsYGRfxSieWlqc
	m55abJiXWq5XnJhbXJqXrpecn7uJEZiATv87/mkH49xXH/UOMTJxMB5iVAFqfrRh9QVGKZa8
	/LxUJRFe6d/HU4R4UxIrq1KL8uOLSnNSiw8xSnOwKInzatueTBYSSE8sSc1OTS1ILYLJMnFw
	SjUwucrsFGM+cPTMvVrZ8prJa9sdD175xX23W2typZDeKvtXZl+FszrKrSul9IR3/D90qoNr
	saTSnT7fRR9VkuOtZ31szlzF0jVl3nmdORfM/7qrPD7FtEJ81ZrZpvx9FbkmjdphG87O//N1
	3x3ZeA3Jr8EOT0wj+mVs13ys2XVVLef55jupbeWm11kmCTyW/Ld79sr759nOvW8TetbeJzmb
	3eZn9ZsbFjyHvj27uiBtmubh9v5r56dueezMrcqWtvp2++sYVabnZWabnm3S3NgpfG1zu7RP
	qbuhSsy/e8+vedb3VszYeWHu23AblvU6ahNyxFY5N9kwcUqvEOTv336ys223CPeyd9/Fyuuk
	Fmx4qMRSnJFoqMVcVJwIAAZZu+K7AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEIsWRmVeSWpSXmKPExsVy+t/xe7ribKdSDN681bfY+fkLo8X0c49Z
	HZg8jl3pYPPYP3cNewBTlJ5NUX5pSapCRn5xia1StKGFkZ6hpYWekYmlnqGxeayVkamSvp1N
	SmpOZllqkb5dgl7GhrPzGAs2iFZsfn2NuYHxuGAXIyeHhICJxL2XfcxdjFwcQgJLGSU2Tb3E
	ApGQkdj45SorhC0s8edaFxuILSTwkVHi6gZriIbNjBLL3+0BS7AIqEg0dK5mBrHZBHQkzr+5
	A2aLCFhK7Nv1AcxmFtCVWPD1ENgCYQFHiWnHj4HZvALmEq82dDFCLDjBKNF1IQAiLihxcuYT
	FojeMomT904C7eIAsqUllv/jAAlzArV+2n8R6k4lia9veqHsWonPf58xTmAUnoVk0iwkk2Yh
	TIIIa0nc+PeSCUNYW2LZwtfMELatxLp171kWMLKvYhRJLS3OTc8tNtQrTswtLs1L10vOz93E
	CIzAbcd+bt7BOO/VR71DjEwcjIcYVYA6H21YfYFRiiUvPy9VSYRX+vfxFCHelMTKqtSi/Pii
	0pzU4kOMpsBAnMgsJZqcD0wNeSXxhmYGpoYmZpYGppZmxkrivJ4FHYlCAumJJanZqakFqUUw
	fUwcnFINTBUNj9aECbOLTnuVmrmDVWfm0pfFdldYK+KCNJ+zv6rk//P13aIIRvdHZ7dWf7hj
	Irn5k37mnCcVIU/kl+rOnSPf5lYus7cnJyXWeZ1P9MUztiXpBoyXj2kck9lS6LCEXcOckffq
	Ua70Vz+PbJ9+pJVtz+UMxVfp6lYHZC37FXu2H1fwffx4du/vxCxvMaGCkxdvVc/x/3widFWu
	2pb29dIO2Q9DWoKafm94/Eqx6kvS4cw3JjfNtlxoyzTd9/dEmBRfTeSjvJ5ZnIwBdXfCDyze
	eqFXoFFUdOND7pCDRQLce/ZvLNpdV2qgc+Ard8aFjSvq/axedNv/OLzx+iHuQMbn16vV1x/t
	2Hf2h6LYBSWW4oxEQy3mouJEAJNIjD1VAwAA
X-CMS-MailID: 20230802073031eucas1p2145adb5756c27a08938b70394640fbf0
X-Msg-Generator: CA
X-RootMTR: 20230801161435eucas1p23db9e3be3353c914dc6129eaecafd8b3
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230801161435eucas1p23db9e3be3353c914dc6129eaecafd8b3
References: <20230801-jag-add_web_switch-v1-1-a0021c1ee8c2@samsung.com>
	<CGME20230801161435eucas1p23db9e3be3353c914dc6129eaecafd8b3@eucas1p2.samsung.com>
	<20230801-giggly-postnasal-707142@meerkat>

--bv4xmzdgpyv7nha7
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 01, 2023 at 12:14:22PM -0400, Konstantin Ryabitsev wrote:
> On Tue, Aug 01, 2023 at 05:03:36PM +0200, Joel Granados via B4 Relay wrot=
e:
> > From: Joel Granados <j.granados@samsung.com>
> >=20
> > Make it easier to prefer going through the web endpoint by adding an
> > argument that will force this path. This is for users that want to use
> > B4 for preparing and sharing patchsets over mail and need an argument to
> > activate the web endpoint whenever needed, but want to default to smtp
> > server for the rest.
>=20
> Okay, that looks good to me, but can you please make two changes:
>=20
> > @@ -330,6 +330,8 @@ def setup_parser() -> argparse.ArgumentParser:
> >                            help=3D'Initiate a new web authentication re=
quest')
> >      ag_sendh.add_argument('--web-auth-verify', dest=3D'auth_verify', m=
etavar=3D'VERIFY_TOKEN',
> >                            help=3D'Submit the token received via verifi=
cation email')
> > +    ag_sendh.add_argument('--web', dest=3D'send_web', action=3D'store_=
true', default=3DFalse,
> > +                          help=3D"Force the send command to go through=
 the web endpoint")
>=20
> 1. It doesn't really belong in this argument group (it's just for
>    setting up authentication and says so in the title). You can just put =
this
totally missed that :), thx for the feedback
>    switch with the main arguments, perhaps as the last entry.
I have added it to the main args under --no-stdin.

Now that it is in the main args, I'll change the argument documentation
=66rom "Force the send command to go through the web endpoint" to "Force
going through the web endpoint".

> 2. Call it --use-web-endpoint instead of just --web
sure thing

>=20
> Thanks!
>=20
> -K

--=20

Joel Granados

--bv4xmzdgpyv7nha7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmTKBgsACgkQupfNUreW
QU9npQv/eQbIC6mrEnriHgt6jOIWfYcoN1LnxlkZ7zAY0BQVE0i2KrQNCIVSxJeq
GC9WXLjbYtY9vBphEK50+3B59IFKACsRaegIbr3M3GICm9M5HBZvqumaQLKgnBO+
8SOURVc8SGmeJpxzoX2dAgiQvcvwzVaBrzR0gY0fMdeqDaDYFRin3/58cKd88B7r
UDAjo/j8TzGgjFPSA6po7krseTzMKpEcNffD5vKRgjZPpZrGSaM3+pFMKI3fukIt
TNJP0tUnu+TRjWZSP46p5ei96IRcfDZnR03CDcopMN28+BuWbNYAX0XD7GzrylKE
26HqR28QGV5Cz3ZfAsaR1aoByvgEY+GYKoRuHjiH1pf7GiMIYF2DKol5RumN48JX
F7cyXHclLsVdyTcJIQpqailOxTZnqhJ78aHPTkdFkdaL0ho5JA+w9d9W8EnUBFzo
hDaOVv3g16Q9OFc0FkJSKQ5XdrxHKs0+wTzqZG38fV5iAFH3lhsSWYryo/SnWzHN
H+/OHtSP
=esS4
-----END PGP SIGNATURE-----

--bv4xmzdgpyv7nha7--
