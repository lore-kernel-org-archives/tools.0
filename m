Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54F2155C87
	for <tools@linux.kernel.org>; Wed, 18 Dec 2024 20:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734552305; cv=none; b=C2UNsN1JJ+vftlcr1NgHpykqpKptnB20BiUK0lU5z4R8uCcuMbKnl+uG/gufJ/1Piq1SqL0EkMjTxlP/jTDLA0dhRTPTDJ3kDyjSNIUYyPFAH1TEsXO40Vh/j6uB7dBIWeh0NSMWf2KAsfQS+PyTew92gKamVedOOEqNQylGTvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734552305; c=relaxed/simple;
	bh=EnYcPCifYxztxtldizlCPEELiJ7QU+gcBUdR3M5yyJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GvpObRF+x677/88/pclOKbw3FR+hinabO+308v99u7oXHpttJZ2OUbM08eXrCmxbjBg36998Uu1/rq1STl95eW7/nOgo857F7s9lmsU3qpwYHKpVH6cU1IYGFI2igQufAL8qSCuHtXt34xbGfp57tHDjon/CS1a5egYEjbEimgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b=02+XxSsY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b="02+XxSsY"
Received: by smtp.kernel.org (Postfix)
	id 704ADC4CED0; Wed, 18 Dec 2024 20:05:04 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 75AA4C4CECD;
	Wed, 18 Dec 2024 20:05:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 75AA4C4CECD
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=heusel.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1734552294; x=1735157094; i=christian@heusel.eu;
	bh=3jvIoa2slGSeShnzZK8JzhUTbhqnMZ/UJxhSFOAo4Ac=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=02+XxSsYyApvMZlSzUosE9xKsgY+0RDNdbSlAvEJND1eZrRV1qNBo6/uCKQarFJK
	 4BPqRF9sN2ZntxezMhvJB3wyx2yTbO5MbiMdU/YEmIvnUI2Bh4TEiiFXzD3JDh+SM
	 EaH5/CLF8VBzy34z17TR1Q22dvJPs63XSGCAiGhVgEXOQXI6N6oqntRpuWDiUsUAD
	 Hwg598tA1xx7Sxic8ukZ+VC+r9Y7ahWOFN32Xzv7vYmSSjbUA/Tg0wu019NRpAaZf
	 JVfH9p81SwkZDBbtA/TX6HhTNsUop3QIy0j+ZdCmtFLhtD9feaLCkaSNbnN9H6x9w
	 v7onyPbTFOVzHsyNug==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([141.70.80.5]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MhULz-1u0vg647Ep-00jzq4; Wed, 18
 Dec 2024 21:04:54 +0100
Date: Wed, 18 Dec 2024 21:04:53 +0100
From: Christian Heusel <christian@heusel.eu>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: tools@kernel.org
Subject: Re: [PATCH] Ensure patches show moves rather than add/delete
Message-ID: <0e03ec86-b46f-4d6f-91a6-a9cce483c300@heusel.eu>
References: <20241217161146.1943425-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hakylrd7knpbij4e"
Content-Disposition: inline
In-Reply-To: <20241217161146.1943425-1-robh@kernel.org>
X-Provags-ID: V03:K1:X8dHkdj0sCA8dvUtZoxvuqolg8ETgzTsJeNSxagsaEoRsEBRaEf
 6FUuO7GBbqNPuYzBWMPNOZ3u5MuigsjadkJVfNQpEucXZRC6jAcG5eHD1mD6tmjgMxQSo2w
 dLBq0xnka2Ta9drH86qSnSvQqx6Ia2Rp1jEsYcHCtf8Fs1qBMcMDxyuljceRQqqBVp8L9e7
 lG3y52j2TkhDftBYjpSjg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:PNowUX2reWc=;rzl+us1UBiEutmNsMhKWskJSyD5
 qLvvfEL1IA3FrQcCRBy4nxRkJiEbIShTaKcqDtPW3niO/Nvfceyy88NpTjI9Ih372fdo4nWcL
 65UxvvHOofJw27JhRvAFHh0S2LbxbcPm/ubU50uHqa1fMHKoaxYav2thyZs9XnLc5OqYX1ogU
 O9YFariXeN2/8ozQdnx59VuiEyUwG8M7ZGF6eJFFDt1voZ0o0ou735KxDmAyjZMYh106UUUHu
 WYlEVfP+0uHpsZMq6kfbXXzC+45GwnITknrbBybV+AlBo5DbQTZQwrAKwoSWeCZxKqOhQi52l
 ozeJ2sgbgBqmLHPWj1+igRG3sNrh9m2E6zftKdxK/5qr/XddWr+tUY4//PmYF9ZWtAy4gQ+NW
 kNOkRgnGIcENLWqPtgfocEgowVivTzekqmaHeW/XI+wyax3LYvnk2q2JST0C0kaW7f3xDCuMA
 O6+SbWNPa2NbmlH+UrB8Am/J76oLVsnXIlzDNqZ8l3D88QE7xIreDRmidft3WaXfmbPEOYGxO
 yuje7LtQ19G881x9npkKapThDEl0tHNkv0k0aD+g3Y78TMU5sAInJxmdq/NAnuccx2hyfdhbH
 C8uR3HanrK5V4VQaxkRsPRwe4TVZftM65nesqzV+kletJDqeGJggOdV3X3wwd8XSFCQ8K1No+
 7u6F+Hqe2SEKQjWXq3za8Tzc90zGwnZ3n4z4fj1guR40+LaxP+Bz81lzFghRs2Jr9v5Sbh8nE
 SA45Xh76UH/nNWXh8T83grkAYh6cVCLNqoCe3GSAlb7KYJ67Z6W1YsTFMu9+1mk627od4H3uS
 xE7AdEYFBZnTKdhLnt1ti7Ykxccejp+BfvyYsPMkCjSLbPAHjdw8G9Om8VsFYiVooBSrLsU3f
 r2/0+8ph1xqADawr/ZJ346o21hLv83O3TayWXqPxY2aOyoA2Gpr2ZT6S1TIceu+9i/APFwok0
 DnC01xRAudCvC3umrn0yWgbujtaKkT/CWc3uzqf2jOcPZHj5NPCr5rgqeFjg89D+TELNnqVWc
 01Bo10KCE7ibLGog5G8rAAzZ6vPNfXE7M9vlED2


--hakylrd7knpbij4e
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] Ensure patches show moves rather than add/delete
MIME-Version: 1.0

On 24/12/17 10:11AM, Rob Herring (Arm) wrote:
> Don't rely of users' gitconfig when generating patches with a move. The
> default now for gitconfig is this is enabled, but I'm pretty sure it used
> to be disabled by default. In any case, users mess with long time defaults
> like threading for no good reason.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> Maybe we want -C and -B too? Those don't happen too often compared to mov=
es.
> ---
>  src/b4/__init__.py | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/src/b4/__init__.py b/src/b4/__init__.py
> index bb93656d8ad7..a63520792df5 100644
> --- a/src/b4/__init__.py
> +++ b/src/b4/__init__.py
> @@ -3464,6 +3464,7 @@ def git_range_to_patches(gitdir: Optional[str], sta=
rt: str, end: str,
>              gitdir,
>              [
>                  'show',
> +                '-M',

I think for consistency with the other options it would be better to use
the long form "--find-renames" here.

>                  '--format=3Demail',
>                  '--full-index',
>                  '--binary',
> --=20
> 2.45.2

--hakylrd7knpbij4e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmdjKuUACgkQwEfU8yi1
JYVewBAAoYqYlje1ZRtPSJtpX8z9RUxxLHo0G9SO82WOkp4p8Fhl8MwN0U9BELXe
FAOUVh4eDUDjqtgNd783INRih6YyXn+iaHW0tb+Brkzsrx7+GjEw+ypNwlLyWAHW
GRon/zXj3nRJhryOpbPfukCKNt2A00sFrtBorZHDnXbbs634FaIrTtCG6neSc80s
WyW1ZkDkhIzoH04d9z8ZgZ/iRDxlgVEW/BnQT/LXmokokUv6rU0L5c6SBEwRLxek
JpVV85afm5C+4zzJlDPVx9XQpdB/Myh+M4IylkRbIDkAC4qjAGA1y5mPXKrh6sdn
whSgwauxzyvCE7TbEdwnxYdLZxVKGeUHkWEOFLzxQodqMD5rZmKQPvaGrUNvdgV1
QyTTELiO/FmpZNyutOGj9vtiQLoxFPgDetuXRVqNcwv3GPdEuGm5j+Ec+Vxdfsso
Dur6TXmFLKiUX4TaXdh34hAKvR4TVjECSuZK7oShNlPdvuYfyfrXcpzoMDAYmLhu
WZH75CAerk8CyOo7qyG0QeXQKRxLBorgDtZ74yuuCWmTLBGx5KCVJwEO+M66qjxl
FbVRYmnc6CpESp0w2FlUAzdH/JaOI/XFZSoySn2i0R+VkYH096Uj7UZg7xW6ff2D
aazFOK8MKUdyU+dXJ0LzVtz00mbuS86DyibMRvJNCo9JoiUxpVI=
=Ucr3
-----END PGP SIGNATURE-----

--hakylrd7knpbij4e--
