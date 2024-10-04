Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78B513F43B
	for <tools@linux.kernel.org>; Fri,  4 Oct 2024 09:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728033812; cv=none; b=FMJcX5pFTiudShGOVYPMbQG4n2sFv3Q90xxRsJ4Ziaw5YM5TUIS9CUH0ufhE1PWGU4iaAPgi+xLv15ju9erAZLlez165MjKKUjnJ59G4I7w+gcfKQGjBX+n71hiMGY8kXAa9YzK0kdzCNY2qRg97ig/qMSEdy7OknE3p7tZzLCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728033812; c=relaxed/simple;
	bh=zxkWh7MHtV54Yk+exOzGo2Qv07fNr/OtlUlmV9teFzg=;
	h=MIME-Version:Content-Type:Date:Message-ID:Subject:From:To:CC:
	 In-Reply-To:References; b=X1ei67xCucQ31Zv9xWRyPQMGFKb9sJCediJ8e4DmDh4NkVEMiGkdiEzvAPK1rPv8ohNW9hLFU2vMpgBdwFcwgKZ+4KGQiXaLBRkAzxkM0dyLBuD6L71HAcQw3kID17BpajQ2dPUBIvOi526VITxfhWRrUp2HXEFM3LXS7dQg5MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=LBiRrU1J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="LBiRrU1J"
Received: by smtp.kernel.org (Postfix)
	id 5EBFAC4CECC; Fri,  4 Oct 2024 09:23:32 +0000 (UTC)
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C7F7DC4CEC6
	for <tools@kernel.org>; Fri,  4 Oct 2024 09:23:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C7F7DC4CEC6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20241004092327euoutp0193c0cb05adae26d892952ad7081fcb27~7NZetUHiK2622026220euoutp016
	for <tools@kernel.org>; Fri,  4 Oct 2024 09:23:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20241004092327euoutp0193c0cb05adae26d892952ad7081fcb27~7NZetUHiK2622026220euoutp016
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1728033807;
	bh=IFqXj96nOmqUna9gSHBjhcotk7SkZQhh/W/L0P240DU=;
	h=Date:Subject:From:To:CC:In-Reply-To:References:From;
	b=LBiRrU1JzW7ZZPw5xj/NyGp+H5JDP6u/I15ueLrxu8PK+SwyzXMbaXVOo83cBT5+g
	 xO9W96UCL4HyoT8gJYXWCroXcEU05folE98uKeU75kwScM+7JQnNS+Gq12GvcyI7qQ
	 5uQ0+TcXJ8fI0JSLYNNn7g6Eft2/Fmjoe9Fpt+U8=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20241004092327eucas1p158bb27b6047d434c58951c0b4b67bc88~7NZehBAgE0189101891eucas1p1j;
	Fri,  4 Oct 2024 09:23:27 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id DA.18.09620.F04BFF66; Fri,  4
	Oct 2024 10:23:27 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20241004092326eucas1p1193ca01b206fbdf5ad3ff41e9452dc81~7NZeDZ8Qa1020210202eucas1p13;
	Fri,  4 Oct 2024 09:23:26 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20241004092326eusmtrp2dd2fb92db70b3abf82d1e6017a19a538~7NZeCpUiH2302923029eusmtrp2h;
	Fri,  4 Oct 2024 09:23:26 +0000 (GMT)
X-AuditID: cbfec7f5-d31ff70000002594-2f-66ffb40f2878
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id 5D.6C.14621.E04BFF66; Fri,  4
	Oct 2024 10:23:26 +0100 (BST)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20241004092326eusmtip1e4f2338274fd05c3cf792a6337093a70~7NZd1DiWZ2471524715eusmtip16;
	Fri,  4 Oct 2024 09:23:26 +0000 (GMT)
Received: from localhost (106.110.32.87) by CAMSVWEXC02.scsc.local
	(2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
	Fri, 4 Oct 2024 10:23:26 +0100
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 4 Oct 2024 11:23:25 +0200
Message-ID: <D4MWUZ2F8B75.2LOQZKGUBIBWK@samsung.com>
Subject: Re: Incorrect response address when using B4
From: Daniel Gomez <da.gomez@samsung.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
CC: <I915-ci-infra@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
	<patchwork@emeril.freedesktop.org>, <tools@kernel.org>,
	<d+samsung@kruces.com>
X-Mailer: aerc 0.18.2-67-g7f69618ac1fd
In-Reply-To: <20240930-rustling-auburn-jaguar-23d200@lemur>
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
	CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnleLIzCtJLcpLzFFi42LZduznOV3+Lf/TDJ5vELTY/f8us8Wj033M
	Fj82v2Cy2Pn5C6PFy79rmC3ObXzI7MDmcWbKKiaPTas62Tz+9z5g9dg/dw27x/3u40wBrFFc
	NimpOZllqUX6dglcGce6/7AVvBGo2L9xIVsD4w7eLkZODgkBE4kdt1awdTFycQgJrGCUWHR0
	AhOE84VRovX5dqjMZ0aJq43/WWFa/myaywRiCwksZ5Q41R4NV3St8zJU+yZGiUvfNrCAVPEK
	CEqcnPkEzGYW0JZYtvA1M4StKdG6/Tc7iM0ioCJxa/ECVoh6E4kVZ7aDxYUFTCXutS0G62UD
	qt93chNYXETAUmLfrg/MIMuYBeYDXTF9CjPEeWoS//sngjVwClhLvJh4AOpsRYkZE1eyQNi1
	Eqe23AK7VELgBYfEjKdtjBAJF4nXd9uhGoQlXh3fwg5hy0j83zmfCcJOl1iybhbUoAKJPbdn
	AdVzANnWEn1nciDCjhKzH91igQjzSdx4KwjxL5/EpG3TmSHCvBIdbUITGFVmIYXQLKQQmoUU
	QgsYmVcxiqeWFuempxYb56WW6xUn5haX5qXrJefnbmIEppnT/45/3cG44tVHvUOMTByMhxgl
	OJiVRHjnbf+bJsSbklhZlVqUH19UmpNafIhRmoNFSZxXNUU+VUggPbEkNTs1tSC1CCbLxMEp
	1cAktmfZqlUnmHh9om33HLtj3vpr972m4BDrHrHn+9bsiv1VVzzjXOCJ7cW+Uh9vnm0OWvai
	tN1oUu49Q66c80LGsTMPXNgnnfXR94ZvDPfkW7u8DW788rwzs1126sPonf7635Yvu/Gev9Hx
	ksGft7e2s7ve1xHMWy+res2p3alOT4zP++gfA9tfR9WvVAnnLa9ZMifqb8T69Tdt5+i8v/xT
	nNHy1L2TV/xPToy6lNdjf1uEc2WJAPsGFplGr1mNSuYyml1G2T+Tbm8XvtZYmvS9eRuvRuL0
	attc1S0i+y+dbuCx+JCU9PLYHZO6E1ktcd+9DJY9X8qUUn8y2ej2lBrnC9dPZd3wdCvTunPC
	e2q+EktxRqKhFnNRcSIAwnXZuqIDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRmVeSWpSXmKPExsVy+t/xu7p8W/6nGZw4o2ex+/9dZotHp/uY
	LX5sfsFksfPzF0aLl3/XMFuc2/iQ2YHN48yUVUwem1Z1snn8733A6rF/7hp2j/vdx5kCWKP0
	bIryS0tSFTLyi0tslaINLYz0DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLLUov07RL0Mo51/2Er
	eCNQsX/jQrYGxh28XYycHBICJhJ/Ns1l6mLk4hASWMoocfP2SlaIhIzExi9XoWxhiT/XuthA
	bCGBj4wSGxdFQzRsYpTYfPwhC0iCV0BQ4uTMJ2A2s4C2xLKFr5khbE2J1u2/2UFsFgEViVuL
	F7BC1JtIrDizHSwuLGAqca9tMVgvG1D9vpObwOIiApYS+3Z9YAZZxiwwn1Hi1PQpzBAXqUn8
	75/IAnHFASaJVYe+gU3lFLCWeDHxANTZihIzJq5kgbBrJT7/fcY4gVFkFpJjZyE5dhaSYxcw
	Mq9iFEktLc5Nzy021CtOzC0uzUvXS87P3cQIjMRtx35u3sE479VHvUOMTByMhxglOJiVRHjn
	bf+bJsSbklhZlVqUH19UmpNafIjRFOjricxSosn5wFSQVxJvaGZgamhiZmlgamlmrCTO63b5
	fJqQQHpiSWp2ampBahFMHxMHp1QDU2/6w/byPXZ52WvNBQIWbKjb9OqpZXVizZ0Hs5oNdx3e
	vbLrX80DtU0y//2cDB5OW7LTXj97Kn/y5wu39IJjqu1/XBfvPtpRnlCqt5m9auZEP4P6JjmF
	O7pWjkv4As/+ulJ633h2Yu2DX66lCauE529qtro2UVNMg/W1iObrTJ4FlYvPxzzaHXn8Dqtt
	c88r1QfmjeGXDYRPG3RmSuhbqq2b/b/b+73sz48tMRMnVffYnV358fvsOaI53zUCG1QVpO4+
	m/eJMdy9xC1gUe7n+jnLdFcWbld/Gv32bqj7thRhk20lxgv4hLV1d7U7a7N9brc/4rSnxLhO
	rv1iw4WfDuo3zrm4Nk7JVv7B99xaiaU4I9FQi7moOBEAkU133k0DAAA=
X-CMS-MailID: 20241004092326eucas1p1193ca01b206fbdf5ad3ff41e9452dc81
X-Msg-Generator: CA
X-RootMTR: 20240930133009eucas1p14b11ee712ae3ab1ca3aafc2833103bcb
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240930133009eucas1p14b11ee712ae3ab1ca3aafc2833103bcb
References: <CGME20240930133009eucas1p14b11ee712ae3ab1ca3aafc2833103bcb@eucas1p1.samsung.com>
	<20240930133007.u4vm5qj5urikpmvc@AALNPWDAGOMEZ1.aal.scsc.local>
	<20240930-sapphire-swift-of-reverence-168e2b@lemur>
	<20240930141839.3rjfom4c2tca655n@AALNPWDAGOMEZ1.aal.scsc.local>
	<20240930-rustling-auburn-jaguar-23d200@lemur>

On Mon Sep 30, 2024 at 4:20 PM CEST, Konstantin Ryabitsev wrote:
> On Mon, Sep 30, 2024 at 04:18:39PM GMT, Daniel Gomez wrote:
>> > Was it an automated tool that sent you that message? Normally, email c=
lients
>> > would honour the "Reply-To" field and not use the From: address put in=
 by the
>> > relay.
>>=20
>> It was a CI Patchwork tool. Response [1] to my patch was sent from "From=
:
>> Patchwork <patchwork@emeril.freedesktop.org>".
>>=20
>> [1] https://lore.kernel.org/all/172735727458.1107233.1757281470637305143=
@2413ebb6fbb6/
>>=20
>> I think that tool is ignoring the "Reply-To" field [2] from the B4 messa=
ge and
>> using the From field.
>>=20
>> 	From: Daniel Gomez via B4 Relay <devnull+da.gomez.samsung.com@kernel.or=
g>
>> 	Reply-To: da.gomez@samsung.com
>
> It's no big deal as long as you got the email response in the end. We exp=
ect
> this to happen with a lot of automation, which is why any replies to the =
relay
> address are auto-discarded.

Konstantin,

B4 web endpoint works very well for me because of the freedom it gives me f=
or
sending patches. However, as a user of this feature I'm expecting all repli=
es
to go into my inbox (regardless of whether it is an automated respose or
not). Unfortunately, they don't. So, what I'm asking here is if it would be
possible for these automated responses from Intel 0-day, Intel GFX CI (Patc=
hwork
Freedesktop) and lore (public inbox), to change their responses to use the
"Reply-To" field instead of "From". Note that the first 2, completely remov=
e all
the Cc addresses. IIUC and according to the Jani's answer, this seems to be=
 not
doable on their end. I'm not sure about lore's side.

Is it posible to change the "Reply instructions" section in lore, to use th=
e
"Reply-To" field? It won't solve the problem completely but at least users =
of
that would use the right git-send-email command.

Also, what's the use case of using B4 web endpoint if replies may or may no=
t
land in the sender's inbox? I think the use of this feature requires proact=
ively
monitoring the patch and/or mailing list.

>
> -K

