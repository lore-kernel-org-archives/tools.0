Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B53152193
	for <tools@linux.kernel.org>; Fri,  3 May 2024 14:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714745856; cv=none; b=Mo3NT40lKMrurYA7hA86M55XZvkzKHZTW0N2ATXm8BOX6OnNu/pRcl2y+Y8kefVOt2hjWCKXV+mFiq33W9dVk7sNysq7uf6ccNnr8neGYJdv+lEQgSnBBwYv/Fl/UneGxDBPozQTqkIrah8ODvFfACRIGZ2+X+0zWaCqIqiiY+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714745856; c=relaxed/simple;
	bh=rHhXJ1URbwyO7TM9kKZ1UxIlCuHE3+tw8De31/zDsT4=;
	h=Date:From:To:CC:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:References; b=sgIvKw1YSTIlBo67TdTR4Z8gJsMWi/RVQoUUrnjGM6/j9fivyxhRkRjPKf+FAgBob9sePIBS0rM9wLEr4LPlaQQTdX1VfVjYR5hpXdHZK8aPG/Rp9a40ox8+7GVTZExiVdbB/1ebtlRjLHnw+4DIDeAqFFGUr5sX4PAVtjlfeM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Z6OJEnfE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Z6OJEnfE"
Received: by smtp.kernel.org (Postfix)
	id 0BEE0C116B1; Fri,  3 May 2024 14:17:36 +0000 (UTC)
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DFB98C2BBFC
	for <tools@kernel.org>; Fri,  3 May 2024 14:17:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DFB98C2BBFC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20240503141730euoutp02c5ce747a6e5442c2d33f33eec19500a7~MAEQeUYVR2216222162euoutp02Y;
	Fri,  3 May 2024 14:17:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20240503141730euoutp02c5ce747a6e5442c2d33f33eec19500a7~MAEQeUYVR2216222162euoutp02Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1714745850;
	bh=K4D7Wvd55VT7qBMAFhB5hsTuZlh4rnPmDik3UIFl6TI=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=Z6OJEnfEd4/km1m+xPAke9tn28ZJILyed6yQuFu2r5WNx/e7Gi6Kmrg5aa3/BkD08
	 C9yA8iOe+mlfnfHddTi5KmWPFuxe0zsfH3FNbgfM2ee4ygQtKuj4w5SaJs29gSCR+8
	 WSlcO8wFUbOcqgoe5of435idJDi+b6kEqsRWJiuQ=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20240503141730eucas1p293ab4733f85257d59dfcd76e6d938a55~MAEQYqfLs1313113131eucas1p2H;
	Fri,  3 May 2024 14:17:30 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges2new.samsung.com (EUCPMTA) with SMTP id AF.39.09875.AF1F4366; Fri,  3
	May 2024 15:17:30 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20240503141730eucas1p2352944dea637c28d5222e4324d094591~MAEQJMLxD1366813668eucas1p2S;
	Fri,  3 May 2024 14:17:30 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240503141730eusmtrp1ed2f97330e808c6422759ed698c89989~MAEQIu6_J1829218292eusmtrp11;
	Fri,  3 May 2024 14:17:30 +0000 (GMT)
X-AuditID: cbfec7f4-131ff70000002693-51-6634f1fa1ec0
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id D8.A1.09010.AF1F4366; Fri,  3
	May 2024 15:17:30 +0100 (BST)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240503141730eusmtip23a9ef4c9607ca4f171ed553e9b197706~MAEP-iaH00313103131eusmtip2w;
	Fri,  3 May 2024 14:17:30 +0000 (GMT)
Received: from localhost (106.210.248.112) by CAMSVWEXC02.scsc.local
	(2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
	Fri, 3 May 2024 15:17:29 +0100
Date: Fri, 3 May 2024 16:17:24 +0200
From: Joel Granados <j.granados@samsung.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
CC: <tools@kernel.org>
Subject: Re: b4 is bringing a bit too many trailers
Message-ID: <20240503141724.equev43hfcndz22p@joelS2.panther.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="aovzxox2rugcroyb"
Content-Disposition: inline
In-Reply-To: <20240503-tourmaline-jellyfish-of-luxury-9da3cd@meerkat>
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
	CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOKsWRmVeSWpSXmKPExsWy7djP87q/PpqkGTy4qWCx8/MXRotzGx8y
	OzB5bFrVyeaxf+4a9gCmKC6blNSczLLUIn27BK6Mlud7WQuahSpeH7nN2sC4gL+LkZNDQsBE
	4uiDj8xdjFwcQgIrGCVuXW5iAUkICXxhlPi90xAi8ZlRYsqrDmaYjlWLl7FDJJYzShy4tpYV
	rqr3aBvUrC2MEqeX9rGBtLAIqEhs+7USzGYT0JE4/+YO2CgRAUuJfbs+gNnMAmISL9tms4LY
	wgLGEs3bVjGC2LwCDhJnty5hh7AFJU7OfMICUV8h8WTLdCCbA8iWllj+jwMkzCngKtF0eCEr
	xKXKEke2z2WHsGslTm25xQRym4TADQ6J1ZcvsUEkXCTmr5nBCGELS7w6vgWqQUbi9OQeFoiG
	yYwS+/99YIdwVjNKLGv8ygRRZS3RcuUJVIejxLaXx9hALpIQ4JO48VYQ4lA+iUnbpjNDhHkl
	OtqEIKrVJFbfe8MygVF5FpLXZiF5bRbCaxBhHYkFuz+xYQhrSyxb+JoZwraVWLfuPcsCRvZV
	jOKppcW56anFRnmp5XrFibnFpXnpesn5uZsYgenn9L/jX3YwLn/1Ue8QIxMH4yFGFaDmRxtW
	X2CUYsnLz0tVEuHVnmycJsSbklhZlVqUH19UmpNafIhRmoNFSZxXNUU+VUggPbEkNTs1tSC1
	CCbLxMEp1cDUYfxgJ9+LEhvVomLO6zvmxXpMvCH+2nltqHGruFaOg+beq3NdLdltDkf1ZjNZ
	S/W8Vbh2Qum699Q76R++ftl0qOhL+Hzh575mv2Y6t3gIhDadOTk31dg94krM+m45+7Ucl20t
	Plh+/XDGN032mCbPmmbO37FZBsVKsv2/baTeP4/a+efIgxKusvZovW339nD6FZ1v5nLpvrBx
	WetU6fDQS9McOSt1n9vtdPdaq+Q3e/kMnT0853zNNu6VeX2o+c2ULfvmznOb22qflb+RscuC
	b9YJkbMny28l/d0vlOE+ma+Ni53reeiDII3co+Uvb/xbLpQ55QlPMlPSvrlJv9XqD+7YkNql
	8jEgLbxIrlGJpTgj0VCLuag4EQBDwtAaugMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMIsWRmVeSWpSXmKPExsVy+t/xe7q/PpqkGTz5KmCx8/MXRotzGx8y
	OzB5bFrVyeaxf+4a9gCmKD2bovzSklSFjPziElulaEMLIz1DSws9IxNLPUNj81grI1MlfTub
	lNSczLLUIn27BL2MGb0mBY1CFf2P5jM2MM7j72Lk5JAQMJFYtXgZexcjF4eQwFJGiR8Lmpkh
	EjISG79cZYWwhSX+XOtigyj6yCjxeP5tZghnC6PEhzX32UCqWARUJLb9WglmswnoSJx/cwds
	koiApcS+XR/AbGYBMYmXbbPBpgoLGEs0b1vFCGLzCjhInN26BOqM84wSG89BrOYVEJQ4OfMJ
	C0RzmcTFayeB4hxAtrTE8n8cIGFOAVeJpsMLoS5VljiyfS47hF0r8fnvM8YJjMKzkEyahWTS
	LIRJEGEtiRv/XjJhCGtLLFv4mhnCtpVYt+49ywJG9lWMIqmlxbnpucVGesWJucWleel6yfm5
	mxiBMbjt2M8tOxhXvvqod4iRiYPxEKMKUOejDasvMEqx5OXnpSqJ8GpPNk4T4k1JrKxKLcqP
	LyrNSS0+xGgKDMWJzFKiyfnA5JBXEm9oZmBqaGJmaWBqaWasJM7rWdCRKCSQnliSmp2aWpBa
	BNPHxMEp1cBkVGN3Ikh7p/rCG2Vn3Jh47k96+VbRZb+v6GMT30N3v63e1aglGSPJ739u0dq5
	yuzmwm9lHdbz8EzT5FwfV6sws2/XxY/X2lPDzNq4eZVFHiQ+kk5rPvfv6qqwly9jD5aEsRyx
	yzdtnnfF6d/p3UJJN+6Z1PCIv/sfKrplSlCEd4MsP6vcpBWXrfcr6Z/fvlPaS1FrVfsiVufy
	n/HbZ+pvjX1R9OThWdl9v0p2Rd9OFD6qH3/nxVPJ/1s5d62ZsWS6s5brM70vJVOn7+ZKr/lx
	Obq74WzUlBUlDe8jmu0WLPjJOb1hbp9t9eNzNUapB8I3WGjJ9axz3fvtQfbb4j7NeUWXGO6x
	yy4V4Vbs3OOlxFKckWioxVxUnAgArST4rFYDAAA=
X-CMS-MailID: 20240503141730eucas1p2352944dea637c28d5222e4324d094591
X-Msg-Generator: CA
X-RootMTR: 20240503120511eucas1p2a3362abf193471c9b56bd7c2cdcbb79d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240503120511eucas1p2a3362abf193471c9b56bd7c2cdcbb79d
References: <CGME20240503120511eucas1p2a3362abf193471c9b56bd7c2cdcbb79d@eucas1p2.samsung.com>
	<20240503120506.p7g5nn6jocrrdlck@joelS2.panther.com>
	<20240503-tourmaline-jellyfish-of-luxury-9da3cd@meerkat>

--aovzxox2rugcroyb
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 03, 2024 at 09:22:17AM -0400, Konstantin Ryabitsev wrote:
> On Fri, May 03, 2024 at 02:05:06PM GMT, Joel Granados wrote:
> > 2. I do a `b4 trailers -u -F "20240501-jag-sysctl_remset_net-v6-0-370b7=
02b6b4a@samsung.com"`
> >    to bring in all the trailers from v6.
=2E..
> >       can be found here https://lore.kernel.org/all/0e35e88d-3ea1-4f62-=
77e4-eb12e9f51583@huawei.com/
> >       and here  https://lore.kernel.org/all/8E19B519-9035-42E0-92DC-7C2=
1471543D8@linux.dev/
> >       but it is part of "[PATCH 0/7] sysctl: Remove sentinel elements f=
rom misc directories"
>=20
> No matter how I try, I'm not able to bring these into your series. Even i=
f I
> pass that thread as -F to the trailers command, I'm still not able to have
> them applied. So, I'm not sure what is going on, unfortunately.
>=20
> Can you remove these trailers from your local series with `git rebase -i`=
 and run:
>=20
>     b4 -d trailers -u 2>/tmp/trailers-u-debug.out
>=20
> If you still get those trailers pulled in, I'd love to see the debug outp=
ut
> for it.

And of course, now that I want to get the debugging output. I don't get
the extra trailers. Sigh :).

In any case, I now have your preferred way of getting the report (with
the "-d" arg). If I see this again, I'll send the debug.

Thx and sorry for the noise.

--=20

Joel Granados

--aovzxox2rugcroyb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmY08fQACgkQupfNUreW
QU9BaQv/WSx4tdj8OU80+TvSRNlpmN34Mrke9vlllEY0KClwIOOEMd6t+mibSYYU
qlPNUiq6D6BKk9Afztybr1xdpl7zVvsUIMMbP5KDk/lvg2a4XGJxTETFhCzmPOgN
zmL4LBihhlMzKZO2ovtmL23mq+ikl7grFQwThKAiwyV7L7H6aGWMwh0n3xQcyUO9
r64EZNMgTwloDYXrpIQEscEfoMGY4Yj0Q0SG9JjC8wE6MjhXZYG9bBZj/yMyh6fr
xjtOuBnyr2ynQZND8tQ0T7CPLg/Aju+vi3lV+WyJ0OtsClQiLIGMpIFv7eLG1Jyd
pKyyeXbWavOxh0BVH10KpemWnMDVNiOa5w2XqPXEqO0RmTDuF8S4yqZ20mOfkUMT
/q4VFaX75iMHhrxYb3mj6imYGzuhahjJODXUwCyclgw2Nkl2XYhHcjHGE/paO93/
XudwJQnJkiBIcTPkV3asCbn5TpeWEysF1bqxMrOJHusl/lE+uQLwdLPeTPqSlpN1
AutHAyHH
=g2iZ
-----END PGP SIGNATURE-----

--aovzxox2rugcroyb--
