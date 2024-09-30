Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32ED623D2
	for <tools@linux.kernel.org>; Mon, 30 Sep 2024 14:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727706797; cv=none; b=FxDoh/ebBsHVGXq4WHsnubrb/ICbN3FODw/km3VitHUI3axpmQ9SdanP5t759H7BSQ2IPUVQYuQfUAwzKDqWCsHPmhUSJdGbfEfTee2g0zOgDR9VXfF4WH1ZuFYggQk3CO4TO57vF9rulbDqJ8+M5ZP2Uwx+Ontr/s8zzjq1Ur0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727706797; c=relaxed/simple;
	bh=AHJRfGCzEOJihNHA972ttEidt7pQzkEK7b8DfMnMf+g=;
	h=Date:From:To:CC:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:References; b=I3KKUHtUq3PZSGrk6Cc9RxoPSvmzAqn9Y9pwIz48kAOrB//pH2rtSiiDDJHctDQb5u+MOhMEsltrv+cTYsaKH3vVpl8SjRDYIUC5Ej2aToc8UQNrj9jGmxA4/WCAms5u9tgU1O994wgP13KN10ePP9jl7vdrhDqNnzJHdn5E0T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=skBZhbY2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="skBZhbY2"
Received: by smtp.kernel.org (Postfix)
	id C0EF1C4CECE; Mon, 30 Sep 2024 14:33:16 +0000 (UTC)
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B72E7C4CEC7
	for <tools@kernel.org>; Mon, 30 Sep 2024 14:33:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B72E7C4CEC7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20240930143312euoutp01d2ec6cd7a4fddc71a34953291416f0c2~6DCyZIjkC1407014070euoutp017
	for <tools@kernel.org>; Mon, 30 Sep 2024 14:33:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20240930143312euoutp01d2ec6cd7a4fddc71a34953291416f0c2~6DCyZIjkC1407014070euoutp017
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1727706792;
	bh=b68Yzn5xYI+K25lFs+1oNgdEF26q/XXmNb2+aQsuXjQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=skBZhbY2EbmauiNfiTxuR+BbjrAS++TYpf5Rtr6Uzl5XpXkzITwbw01oN5wklYuXl
	 kqzpCLkK8KWoAA2xXtsD+tvvGUH+bIQUFkG6QImygd9aotip5Z+ugSv/2HDK63GFfp
	 0+9ByZhNp/c4Q5SGzRCu07mG/MQ6mNApFC0RoV5Y=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20240930143312eucas1p1c155662ced94ec15e07ef785fcb3af4d~6DCyRiNrm1703917039eucas1p13;
	Mon, 30 Sep 2024 14:33:12 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges2new.samsung.com (EUCPMTA) with SMTP id FC.8B.09875.8A6BAF66; Mon, 30
	Sep 2024 15:33:12 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20240930143312eucas1p23aac553e778c1b552af57ed25cdae0fe~6DCxutfxp1970819708eucas1p2h;
	Mon, 30 Sep 2024 14:33:12 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240930143312eusmtrp1ded1c79f659d001c98c8a2b53f484a19~6DCxt-RdX0040900409eusmtrp1S;
	Mon, 30 Sep 2024 14:33:12 +0000 (GMT)
X-AuditID: cbfec7f4-11bff70000002693-72-66fab6a86cbc
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id 1D.DD.14621.7A6BAF66; Mon, 30
	Sep 2024 15:33:11 +0100 (BST)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240930143311eusmtip2e17a29b0d4e3055fb5dccb32be24395a~6DCxWkgc81238512385eusmtip2L;
	Mon, 30 Sep 2024 14:33:11 +0000 (GMT)
Received: from localhost (106.110.32.87) by CAMSVWEXC02.scsc.local
	(2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
	Mon, 30 Sep 2024 15:33:10 +0100
Date: Mon, 30 Sep 2024 16:33:09 +0200
From: Daniel Gomez <da.gomez@samsung.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
CC: <I915-ci-infra@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
	<patchwork@emeril.freedesktop.org>, <tools@kernel.org>,
	<d+samsung@kruces.com>
Subject: Re: Incorrect response address when using B4
Message-ID: <20240930143309.pwl7dzv537b2q3wk@AALNPWDAGOMEZ1.aal.scsc.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240930-rustling-auburn-jaguar-23d200@lemur>
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
	CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA01SfUyMcRzf73m5e2o7nq4b3zlvHWWh0JhrmZTYrYwaZjOmU7+ul+vFnVRe
	jxGVmlJLJy4L5VTmLq23HZ2X6IXZvJxSIib0IhouFE9PXv77fD8v2+fz248hxRn0FCYqbifW
	xCnVMoEjVXXH/sCjtGo4YuFw4Qx53WgHKX/VnEXKv5l7CHnN5yEkf/ezjJTfv/qSXCFQtOQa
	CYXJmCZQjGZ20YrrZ8qEihcZjUQwvdlxWThWR+3CmgXLQx0j62znqIR3TLLuMatDh4XpiGGA
	XQwtDf7pyJERs6UITt1qp/hjCMHXBzUEf3z+rZgKUDpyGEt0FFlJXihB0FveTP91pVq6xxUz
	goHHtTQXoVhXONLUT3BYwLqD5Z5JyGEJ6w2W2o9jAZI1IGjKzyU5wZldAp2pxRTXUMQGwfOG
	AxwtYp3gXsFrisMkOx+K6j4JOAvJSqFkhOFoB9YHerJv0HxTFziVfYni8T5oqmwbmwNsFwOj
	rd/HTQFw/VE9wWNneN9YKeTxVGg+eXw8rILzFfpxnAD17XqafzwfyGpR87QfnH7VRvH0BLD1
	OfEtJ0BOVT7J0yI4lirm3W5wubOXOoFm6f/bpf9vl/7friJEGtFknKiNVWGtVxxO8tQqY7WJ
	cSrPsPhYE/r9X5pHGoeqUcn7QU8rIhhkRcCQMomo02qPEIvClSm7sSZ+myZRjbVWJGUo2WSR
	a/gMLGZVyp04BuMErPmjEozDFB0hbzibotMln22CSPylvHBEvX7N7K1bPDOFg8O+EU+Hks79
	qArcvs/fsGGp2xyypyK6aP1+yw7skvstemBd2+2gcl/R4ZisZNs0rxDVSkm9ft70Z2euulti
	frzZdHDifZejW9j+mTgnY69p9RO6oMt9Q9uTqcHddDwls/cJjVFiXbtUojJ8MDADa/O8wxoM
	3yXbKlxOD3r57ukbGLmhjvXI7+2+sKqxRLC2cOO8NaFZdmNeR7Hw6SNpa7LtYrRzqdQcDd79
	hxQeV2zXkjSJzyYprKKH01Fxa1l1+sHB+lz7R/PbkG7sV5v24Wagx+jrnAIc4JpQ433XnNE7
	83KwkLojo7SRykVzSY1W+Qt81W91ngMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNIsWRmVeSWpSXmKPExsVy+t/xe7rLt/1KM7iy2sxi9/+7zBaPTvcx
	W/zY/ILJYufnL4wWL/+uYbY4t/EhswObx5kpq5g8Nq3qZPP43/uA1WP/3DXsHve7jzMFsEbp
	2RTll5akKmTkF5fYKkUbWhjpGVpa6BmZWOoZGpvHWhmZKunb2aSk5mSWpRbp2yXoZey+sZCl
	4CVHRcNVgQbGFvYuRk4OCQETibsLDjF3MXJxCAksZZRY+3gaC0RCRmLjl6usELawxJ9rXWwQ
	RR+BimaeZIdwNjNKNK46DtbBIqAq0XrqHROIzSagKbHv5CawFSIClhL7dn0AW8EsMJ9R4tT0
	KcwgCWEBU4l7bYuBmjk4eAW8Je4crIcYeoJJ4t7ylWA1vAKCEidnPgFbwCygI7Fg9yc2kHpm
	AWmJ5f84QMKcAtYSLyYegLpUUWLGxJVQH9RKfP77jHECo/AsJJNmIZk0C2HSAkbmVYwiqaXF
	uem5xYZ6xYm5xaV56XrJ+bmbGIGxtu3Yz807GOe9+qh3iJGJg/EQowQHs5II771DP9OEeFMS
	K6tSi/Lji0pzUosPMZoCg2Iis5Rocj4w2vNK4g3NDEwNTcwsDUwtzYyVxHndLp9PExJITyxJ
	zU5NLUgtgulj4uCUamAS6Zxu5Od4bpPg4t5C8UvMP1omFJX1qLh86b33L7r01nGf79fZBPUN
	gwwrDe6zrd6Ztft6qk9O88I61osae9S/fXMzPdBgvtJbw2Orzt2j7gt+qj8yffUljTWlI2Rb
	e9jyRoVNWjIrhAUOub7Tvzjpxo5olglR1SYzN3mufHsiapPTjc08bB5TRVafn6TELXOZ88km
	WzPb1Tm5KosOHlq8bPaBjde1SmR2rL6QrM6RqWqU7PA+7fe2yz/nahmdPNq77aJ9ZqnY4t8C
	H1e1+F5b9YT7o2VZ7mlVhklV51zXli2R57WfLZio9HLHAt7+VZbTraZ9mXL3p8k9ReHfJo77
	T3evO3/+o0Aro3LGvf5JSizFGYmGWsxFxYkAJTpLUj4DAAA=
X-CMS-MailID: 20240930143312eucas1p23aac553e778c1b552af57ed25cdae0fe
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

On Mon, Sep 30, 2024 at 10:20:57AM -0400, Konstantin Ryabitsev wrote:
> On Mon, Sep 30, 2024 at 04:18:39PM GMT, Daniel Gomez wrote:
> > > Was it an automated tool that sent you that message? Normally, email clients
> > > would honour the "Reply-To" field and not use the From: address put in by the
> > > relay.
> > 
> > It was a CI Patchwork tool. Response [1] to my patch was sent from "From:
> > Patchwork <patchwork@emeril.freedesktop.org>".
> > 
> > [1] https://lore.kernel.org/all/172735727458.1107233.1757281470637305143@2413ebb6fbb6/
> > 
> > I think that tool is ignoring the "Reply-To" field [2] from the B4 message and
> > using the From field.
> > 
> > 	From: Daniel Gomez via B4 Relay <devnull+da.gomez.samsung.com@kernel.org>
> > 	Reply-To: da.gomez@samsung.com
> 
> It's no big deal as long as you got the email response in the end. We expect
> this to happen with a lot of automation, which is why any replies to the relay
> address are auto-discarded.

To clarify, the email response didn't land into my inbox. I realized a response
was sent after checking at lore.kernel.org.

> 
> -K
