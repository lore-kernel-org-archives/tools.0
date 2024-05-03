Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AA81514E4
	for <tools@linux.kernel.org>; Fri,  3 May 2024 12:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714737917; cv=none; b=Vf9RpURPg/w/6WpA6C102RHo8xn/ktlazekWMYSj5F+5vKruEGZIXB9vx3gisk+fmOgYnkDuIYnTosioye5p/L6quO5yocVombtZjRVOO6Gf1y9oK0BPYzEmA1KjVFVsODaa9onRt8yqlTm90QrvBZ4fJoPWa5QJISTG02E9YdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714737917; c=relaxed/simple;
	bh=ums3fALSc9fsktWxk2iPCdYF9u9MxrszcOrhX7rNViM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:References; b=tQDSXLDNlOD24jzxSj5SiwbryQB0+roRdASTZGc8pZs1LaseFp9tS0yWVBgEHQdX7WLXIrARoG952XwIa8w+Vub2EhdEUGOnnl+gNL+Z0UIZ2b9lMBfrKzQcsrP4NRXvZ+vPaTcGdmtNRRVZIaXrYTl7RebI3Lxqt4NDzHq0/7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=RXmLa06Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="RXmLa06Q"
Received: by smtp.kernel.org (Postfix)
	id D5A85C2BBFC; Fri,  3 May 2024 12:05:16 +0000 (UTC)
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 07E2EC116B1
	for <tools@kernel.org>; Fri,  3 May 2024 12:05:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 07E2EC116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20240503120512euoutp01e024cf6ff64b4b809329a55f38a1b4b8~L_QvDfV5Z0779207792euoutp01B
	for <tools@kernel.org>; Fri,  3 May 2024 12:05:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20240503120512euoutp01e024cf6ff64b4b809329a55f38a1b4b8~L_QvDfV5Z0779207792euoutp01B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1714737912;
	bh=/DKERWLTC/vCggFApij0GBjFr5aGdYVhPDMcFlYYkmc=;
	h=Date:From:To:Subject:References:From;
	b=RXmLa06QRLDzJLdBWOBGsZFxvR6+22RMHfgpVrGOntDudHms1HIftsl8/aWB+ZzMm
	 /hU0b9ZWFYxBBJhAdjh0cQPTfoWRIcJ6pB48gRxw1xP9VohsXFmGRi1X/+ET6fDt97
	 nJvPgo57MjslNtaiCfoFswehfPb87BYL14fL4H3Y=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20240503120511eucas1p1bb5370e9b90284cc835e7f3e21ec5b7c~L_Qu9nX462554125541eucas1p1S
	for <tools@kernel.org>; Fri,  3 May 2024 12:05:11 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges1new.samsung.com (EUCPMTA) with SMTP id F7.87.09624.7F2D4366; Fri,  3
	May 2024 13:05:11 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20240503120511eucas1p2a3362abf193471c9b56bd7c2cdcbb79d~L_Qut5-Bl2576225762eucas1p23
	for <tools@kernel.org>; Fri,  3 May 2024 12:05:11 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240503120511eusmtrp156a2964378b3416ddb5009088c38a1c6~L_QutdaUk0528305283eusmtrp1L
	for <tools@kernel.org>; Fri,  3 May 2024 12:05:11 +0000 (GMT)
X-AuditID: cbfec7f2-bfbff70000002598-1e-6634d2f796e7
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id CF.4F.09010.7F2D4366; Fri,  3
	May 2024 13:05:11 +0100 (BST)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240503120511eusmtip22e90f6c8effb6ad12f74cc1c40fa9408~L_Quhkx4z2633726337eusmtip2Z
	for <tools@kernel.org>; Fri,  3 May 2024 12:05:11 +0000 (GMT)
Received: from localhost (106.210.248.112) by CAMSVWEXC02.scsc.local
	(2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
	Fri, 3 May 2024 13:05:10 +0100
Date: Fri, 3 May 2024 14:05:06 +0200
From: Joel Granados <j.granados@samsung.com>
To: <tools@kernel.org>
Subject: b4 is bringing a bit too many trailers
Message-ID: <20240503120506.p7g5nn6jocrrdlck@joelS2.panther.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="yfbtixb42xjdhodu"
Content-Disposition: inline
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
	CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFKsWRmVeSWpSXmKPExsWy7djPc7rfL5mkGaz7bmZxbuNDZgdGj02r
	OtkCGKO4bFJSczLLUov07RK4Mq50vGAu2C5VsWP+b7YGxpViXYwcHBICJhKL3nN3MXJxCAms
	YJRY2PqNEcLpZpL4MXMqlNPFJDHz3TX2LkZOsI6/V+9AJZYzSly//pIFrqp9xV+ozBZGiXkH
	1jCCtLAIqEg8+H2TCcRmE9CROP/mDjPIchEBMYknH/RAwsIC+hJ3zm0FK+cVcJC4fPkRC4Qt
	KHFy5hMwm1mgQmLihi1grcwC0hLL/3FAHKQscWT7XKjjaiVObbnFBGEv5ZD4e5cPwnaRmL7p
	IguELSzx6vgWqHoZidOTe8DulxCYzCix/98HdghnNaPEssavUJOsJVquPIHqcJTY9vIYGyTw
	+CRuvBWEuI1PYtK26cwQYV6JjjYhiGo1idX33rBAhGUkzn2COsdD4tneDUwTGBVnIXlyFpIn
	ZyE8CRHWkViw+xMbhrC2xLKFr5khbFuJdevesyxgZF/FKJ5aWpybnlpsmJdarlecmFtcmpeu
	l5yfu4kRmGRO/zv+aQfj3Fcf9Q4xMnEwHmJUAWp+tGH1BUYplrz8vFQlEV7tycZpQrwpiZVV
	qUX58UWlOanFhxilOViUxHlVU+RThQTSE0tSs1NTC1KLYLJMHJxSDUwxUzOdf6pJTDv87+iH
	tur0CE4X9cgaOUW23XzX/vQr/rb4V1JpaFo5eeecD1dXH/58quGKzpydlv5zCh++0JS1frDA
	Ln/CLt1Mbym59+I6/KLv8wQ6ys4tusi44Hnw+cn9Zi8tLMM3X1NiPLwiRur+cRvpstUF6/nS
	1t+PvyS6Nq/3LOOSfZIMGWaH2hed+9b+Zcfzo5vKjdV7SgXFV8l9ZuPLvHrv+nGZbW+vx0fp
	bpz6z+/u25ut+13n3XqmMFt+u9+NredXSerx5EffKvbSEX+6U/L5BK8HN5PiM1S83v+9rG3x
	41Glh+TmrQ1rCzMfblv/NiBuQpHgHk+5kjsKD1R1T+ftzzqkr3rWMuypEktxRqKhFnNRcSIA
	RCA08a0DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCIsWRmVeSWpSXmKPExsVy+t/xe7rfL5mkGfRvULE4t/EhswOjx6ZV
	nWwBjFF6NkX5pSWpChn5xSW2StGGFkZ6hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6
	Gau27GMv2CpV8fpXA0sD43KxLkZODgkBE4m/V+8wdjFycQgJLGWUeDKxnR0iISOx8ctVVghb
	WOLPtS42iKIOJomDK/ewQDhbGCVe/GljAqliEVCRePD7JpjNJqAjcf7NHeYuRg4OEQExiScf
	9EDCwgL6EnfObWUEsXkFHCQuX37EAmELSpyc+QTMZhYok7jxFuQiDiBbWmL5Pw6IG5Qljmyf
	C3VbrcTnv88YJzAKzELSPQtJ9yyEboiwlsSNfy+ZMIS1JZYtfM0MYdtKrFv3nmUBI/sqRpHU
	0uLc9NxiI73ixNzi0rx0veT83E2MwCjZduznlh2MK1991DvEyMTBeIhRBajz0YbVFxilWPLy
	81KVRHi1JxunCfGmJFZWpRblxxeV5qQWH2I0BYbPRGYp0eR8YPzmlcQbmhmYGpqYWRqYWpoZ
	K4nzehZ0JAoJpCeWpGanphakFsH0MXFwSjUwLfFdPfXc5/JL7K93FB+/6nfnxO7/shciT03T
	dnHt/q99ljvAdvKnv5Xd37m6c5Xzf74JZZRaxczSo56d6vhVeb7+o46qfXFSc+XdOXf4NMer
	R1dVFnDMPzDRq+ZCbMH1NQHpHUbrVDV3he9KXW/42T1VJVStnv1As9LnOZHhF+Wn7p7yfgKT
	2+WXq9edu6K/Jcnvt0Imy0/JmnVlrEIsi+PZvkpoi8te6Np3cmWJ1Mqv+fMvXYjp3X3zbrlh
	Q+uJ7iqeK9n1HRMX7nCKzP8pOo+jMT3y+pIbfW8qdX5MMTHi3TvFt2LKY17/b6yXrZW1fec5
	dMgy82oxfg7rWxPtap/3UDZl5qcZ+74737+oxFKckWioxVxUnAgA+wcW3icDAAA=
X-CMS-MailID: 20240503120511eucas1p2a3362abf193471c9b56bd7c2cdcbb79d
X-Msg-Generator: CA
X-RootMTR: 20240503120511eucas1p2a3362abf193471c9b56bd7c2cdcbb79d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240503120511eucas1p2a3362abf193471c9b56bd7c2cdcbb79d
References: <CGME20240503120511eucas1p2a3362abf193471c9b56bd7c2cdcbb79d@eucas1p2.samsung.com>

--yfbtixb42xjdhodu
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey=20

I'm hitting unexpected behavior when I use the "trailer" command. Here
is what I see.

1. Locally I'm standing on the most resent version of "sysctl: Remove
   sentinel elements from networking"
   https://lore.kernel.org/arll/20240501-jag-sysctl_remset_net-v6-0-370b702=
b6b4a@samsung.com

2. I do a `b4 trailers -u -F "20240501-jag-sysctl_remset_net-v6-0-370b702b6=
b4a@samsung.com"`
   to bring in all the trailers from v6.

3. It adds the following trailers:
      Reviewed-by: Sabrina Dubroca <sd@queasysnail.net>
      Acked-by: Chuck Lever <chuck.lever@oracle.com>
      Reviewed-by: Jeffrey Layton <jlayton@kernel.org>
      Acked-by: Allison Henderson <allison.henderson@oracle.com>
      Tested-by: Valentin Schneider <vschneid@redhat.com>
      Reviewed-by: Valentin Schneider <vschneid@redhat.com>
      Reviewed-by: Muchun Song <muchun.song@linux.dev>
      Reviewed-by: Miaohe Lin <linmiaohe@huawei.com>
      Acked-by: Kees Cook <keescook@chromium.org>

4. The first 4 are valid trailers for "20240501-jag-sysctl_remset_net-v6-0-=
370b702b6b4a@samsung.com"
   But the last 5 are not.

5. Here is where I think the others came from:
  5.1 "Acked-by: Kees Cook <keescook@chromium.org>":
      can be found here https://lore.kernel.org/all/202404150906.C37D8D9DA1=
@keescook/ but
      it is part of "[PATCH 0/7] sysctl: Remove sentinel elements from misc=
 directories"

  5.2 "Reviewed-by: Muchun Song <muchun.song@linux.dev>"
      "Reviewed-by: Miaohe Lin <linmiaohe@huawei.com>"
      can be found here https://lore.kernel.org/all/0e35e88d-3ea1-4f62-77e4=
-eb12e9f51583@huawei.com/
      and here  https://lore.kernel.org/all/8E19B519-9035-42E0-92DC-7C21471=
543D8@linux.dev/
      but it is part of "[PATCH 0/7] sysctl: Remove sentinel elements from =
misc directories"

  5.3 "Tested-by: Valentin Schneider <vschneid@redhat.com>"
      "Reviewed-by: Valentin Schneider <vschneid@redhat.com>"
      can be found here https://lore.kernel.org/all/xhsmhil0qaoz7.mognet@vs=
chneid-thinkpadt14sgen2i.remote.csb/
      but is part of "[PATCH v3 00/10] sysctl: Remove sentinel elements fro=
m kernel dir"

6. b4 --version -> 0.13.0

My expectation is that only the first 4 trailers be brought in. Not sure
why the others are leaking into my command. Please get back to me if you
need me to do further testing.

BTW: I'm loving the b4 workflow!.

Best

--=20

Joel Granados

--yfbtixb42xjdhodu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmY00vIACgkQupfNUreW
QU8rVwv+KiyZgJ4bCLYnhOm2KrKHSn5Jv4+5u0xa7+liUslZLZaWskgTO4Mt8tme
qkBZBY5uHgWYgTUDoDArbqPRb/KFXv7JgjSIumKQxaZS7jJCaOC9aprd5OLDaxur
+koFwcYky5ObKewDkmQJGKepanMIX2DwBKsnQOnlP4EpnS2nNEdRIOX/CGQRqJg2
bAA/LdE/jK0qaeExM8HNKIFST11FSz24hty9YQWmHB94WTFtcGzoBWWAnr6E+4Ex
lTz8SpvQs7/NMczarqMLzcyxgpZLBjQjE69Sm2P2FrV4Jeocyzir4EyCbduZrSsI
0WTCw/7gIkPs4sBS3ZF4qJ7b+e7Irgdw8r4SScg8PYIh2UzKIH7/eEkDujf0u3WE
42NLWS5CuIY7aQxQHinTVb2sjxr6zHTS4+L6ofxigqv2yEmF3ZKRSIUnrUyaDu2r
BHx/x8NWTO5GRqeJbJR9K+Ea7ChyxKlTf12AEpIXZ4sB7vr+XCXud3xiNOCAgPNa
G+GoL+2m
=R5Iw
-----END PGP SIGNATURE-----

--yfbtixb42xjdhodu--
