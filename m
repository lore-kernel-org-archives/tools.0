Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6522217C22F
	for <tools@linux.kernel.org>; Mon, 30 Sep 2024 14:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727705929; cv=none; b=Hys7CqFNGGWCY27gRJiSusapE2Y/ZLZ/lELbEuggCexalU28/dP1ynpkUFd6IeUjjbcGXejD14ccRi+OjrfIhwRCQnAeGwifP30wQswYbDsQKwDvxvXC4AWOi7FtQEHA/6KO00IWqvyUVQTQZI0C1dBAVDUqkQ5CSuUS++aZtug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727705929; c=relaxed/simple;
	bh=0z0/8mBqwN9Z6JhGIy5zZEpgsLb+zNB4OszYogYQZt4=;
	h=Date:From:To:CC:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:References; b=T1G6TYLy+GULcd620dImm0l1YQ43k9TvslSS2/dLFQmzZ49qFq4jyVwHUxlhEZaL1z7dlW7BjffyIUnmwjTs7tTtTMzdTDRqCdOS5RG/xTL/7k8AKsrl4vcw6fwukOci88b8n7WqI4T5qpT6JmidyTlYKq7mBDnwREHVvHGjNag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=gGXaZwOt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="gGXaZwOt"
Received: by smtp.kernel.org (Postfix)
	id 10521C4CEC7; Mon, 30 Sep 2024 14:18:49 +0000 (UTC)
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 196E2C4CECE
	for <tools@kernel.org>; Mon, 30 Sep 2024 14:18:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 196E2C4CECE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20240930141841euoutp01c250bb968cb459ca2392f7f776e7098b~6C2GzJ1-Z3031130311euoutp01m
	for <tools@kernel.org>; Mon, 30 Sep 2024 14:18:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20240930141841euoutp01c250bb968cb459ca2392f7f776e7098b~6C2GzJ1-Z3031130311euoutp01m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1727705921;
	bh=0zW1T73UN7m8ZhvSAcxVG2wVNFe39+kk6JCHg00v4mo=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=gGXaZwOtV063oITm0CYpuDGgvem/YArrluXIHsDIb2bjOc711cFsa3euCe+wX+C8n
	 6EYjsrNPVPS056O14flzXJv9bVAvOvNPcn6Yu49sl/W0lSU8759Vn3KFQoScNH6ThO
	 6hyj0cGlmbqbmx5KHCIODYOl7a5CThdwcQBs4wu4=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20240930141841eucas1p154674071049432d9b07bab9df9f77123~6C2GrLMvR3258932589eucas1p1C;
	Mon, 30 Sep 2024 14:18:41 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges2new.samsung.com (EUCPMTA) with SMTP id D7.F7.09875.143BAF66; Mon, 30
	Sep 2024 15:18:41 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20240930141840eucas1p18fe670f36c278080c1d549855fd9c372~6C2GPa7F-0316603166eucas1p1B;
	Mon, 30 Sep 2024 14:18:40 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240930141840eusmtrp12987f2f5dbae11cf4eb5f3713ee37281~6C2GOwLAP2387523875eusmtrp1K;
	Mon, 30 Sep 2024 14:18:40 +0000 (GMT)
X-AuditID: cbfec7f4-11bff70000002693-2b-66fab3415f05
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id 8F.FA.14621.043BAF66; Mon, 30
	Sep 2024 15:18:40 +0100 (BST)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240930141840eusmtip137ec5691723f6e934c491bcf0f6fa4d5~6C2GCJnEK0495904959eusmtip1R;
	Mon, 30 Sep 2024 14:18:40 +0000 (GMT)
Received: from localhost (106.110.32.87) by CAMSVWEXC02.scsc.local
	(2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
	Mon, 30 Sep 2024 15:18:39 +0100
Date: Mon, 30 Sep 2024 16:18:39 +0200
From: Daniel Gomez <da.gomez@samsung.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
CC: <I915-ci-infra@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
	<patchwork@emeril.freedesktop.org>, <tools@kernel.org>,
	<d+samsung@kruces.com>
Subject: Re: Incorrect response address when using B4
Message-ID: <20240930141839.3rjfom4c2tca655n@AALNPWDAGOMEZ1.aal.scsc.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240930-sapphire-swift-of-reverence-168e2b@lemur>
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
	CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplleLIzCtJLcpLzFFi42LZduznOV3Hzb/SDGY8ZLbY/f8us8Wj033M
	Fj82v2Cy2Pn5C6PFy79rmC3ObXzI7MDmcWbKKiaPTas62Tz+9z5g9dg/dw27x/3u40wBrFFc
	NimpOZllqUX6dglcGTNWbmUquMNR8efqPvYGxtnsXYycHBICJhK/H/WwdTFycQgJrGCUuPP2
	EwtIQkjgC6PEj13FEInPjBIPDzxkhOnYNO08O0RiOaPEy5erWOCqjr99ywjhbGaUuHr9KRtI
	C4uAqkTHvEmsIDabgKbEvpObwJaLCFhK7Nv1gRmkgVlgPqPEqelTmEESwgKmEvfaFoMdwivg
	LfF54iE2CFtQ4uTMJ2BxZgEdiQW7PwHFOYBsaYnl/zhAwpwCDhIH7/+Hek5RYsbElSwQdq3E
	qS23mEB2SQg84JBomPcWqshF4uNfkASILSzx6vgWqLiMxOnJPVDN6RJL1s2Csgsk9tyexQqy
	V0LAWqLvTA5E2FFi9qNbLBBhPokbbwUhruSTmLRtOjNEmFeio00IolpNYvW9NywTGJVnIflr
	FpK/ZiH8tYCReRWjeGppcW56arFRXmq5XnFibnFpXrpecn7uJkZgijn97/iXHYzLX33UO8TI
	xMF4iFGCg1lJhPfeoZ9pQrwpiZVVqUX58UWlOanFhxilOViUxHlVU+RThQTSE0tSs1NTC1KL
	YLJMHJxSDUzi+66yzYqfoWTyguexQdTTk4cnRzb7t7cn9oktfLhF6IQcd2RECs+vFTKJ3LOY
	ZpczzPNcf4/f0npp5NTwufZyfh//3V3n4zPhh4Dyj7ofZ5Xc53Kvz1pUVLBppvSXhXWPZTjD
	V5w6+70t+bXl63XN665OYv8pdWtfewGDDreU+e6rR2pvb5syS/XBRL+9K7h2nd7Wc75Uhm2v
	6QILRibDO0+O/lJY3n3m+rwdxvt97ZQ+T6tsPOFtmbAuLi6VI7+Q/0l41Z5/SwL3bMxcq2Xs
	U5a8QjJh4cdD54sne3BtuzSbb2rD8ZbI6xNywlqy9I2zGz7X84pPZ2GMdHhU+qj75FGR7Zta
	Y9rcv3mv+l6sxFKckWioxVxUnAgA7V1VhaADAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDIsWRmVeSWpSXmKPExsVy+t/xu7oOm3+lGaybpGKx+/9dZotHp/uY
	LX5sfsFksfPzF0aLl3/XMFuc2/iQ2YHN48yUVUwem1Z1snn8733A6rF/7hp2j/vdx5kCWKP0
	bIryS0tSFTLyi0tslaINLYz0DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLLUov07RL0Mmas3MpU
	cIej4s/VfewNjLPZuxg5OSQETCQ2TTsPZHNxCAksZZTYfOU1K0RCRmLjl6tQtrDEn2tdbBBF
	Hxkl3i44wwiSEBLYzCix/CkfiM0ioCrRMW8SWAObgKbEvpObwDaICFhK7Nv1gRmkmVlgPqPE
	qelTmEESwgKmEvfaFrOA2LwC3hKfJx6C2nCVUWLyzEZWiISgxMmZT8CKmAV0JBbs/gRUxAFk
	S0ss/8cBEuYUcJA4eP8/1DuKEjMmrmSBsGslPv99xjiBUXgWkkmzkEyahTBpASPzKkaR1NLi
	3PTcYkO94sTc4tK8dL3k/NxNjMBo23bs5+YdjPNefdQ7xMjEwXiIUYKDWUmE996hn2lCvCmJ
	lVWpRfnxRaU5qcWHGE2BYTGRWUo0OR8Y73kl8YZmBqaGJmaWBqaWZsZK4rxul8+nCQmkJ5ak
	ZqemFqQWwfQxcXBKNTCJ+vQuO/59Rai81g3/zV5TVjA9nPhq21cjzvkH/nvNtpU3WmYp/y72
	wLH86gv2LE+0pPvy+bpjFnCYZFY9PcHCZ2/Y9XjXFq5TPHuqVPsEDhxf9Lzj9zwG7znTlObb
	Cm9WePhSfuY8RtWkgN0feNOsPbulU71n7eptlvkg+3G5r/rKiEt80bbmEwN3T1j+NGzP2vKd
	Nhlb2X14f/XVz/3O46L1QEhqRyHD7bO+RYJX4t+vPc5onp+8Uu7ey2fRtd3zWqYZVey7dkRi
	vZnN+2nrbfN1Np93OLQ8dcvOK/NehK/kCj0o2rrMj7loW7Rzr9Cbj8lhwXKaKuvfpn/n2Xjy
	3IuTs+NNP0p4i/ma6qorsRRnJBpqMRcVJwIAV9A4QD8DAAA=
X-CMS-MailID: 20240930141840eucas1p18fe670f36c278080c1d549855fd9c372
X-Msg-Generator: CA
X-RootMTR: 20240930133009eucas1p14b11ee712ae3ab1ca3aafc2833103bcb
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240930133009eucas1p14b11ee712ae3ab1ca3aafc2833103bcb
References: <CGME20240930133009eucas1p14b11ee712ae3ab1ca3aafc2833103bcb@eucas1p1.samsung.com>
	<20240930133007.u4vm5qj5urikpmvc@AALNPWDAGOMEZ1.aal.scsc.local>
	<20240930-sapphire-swift-of-reverence-168e2b@lemur>

On Mon, Sep 30, 2024 at 10:07:30AM -0400, Konstantin Ryabitsev wrote:
> On Mon, Sep 30, 2024 at 03:30:07PM GMT, Daniel Gomez wrote:
> > Hi,
> > 
> > I sent this patch [1] using B4 web endpoint and then I received a
> > response email to the wrong address: To: "Daniel Gomez via B4 Relay"
> > <devnull+da.gomez.samsung.com@kernel.org> instead of To: "Daniel Gomez"
> > <da.gomez@samsung.com>.
> 
> Was it an automated tool that sent you that message? Normally, email clients
> would honour the "Reply-To" field and not use the From: address put in by the
> relay.

It was a CI Patchwork tool. Response [1] to my patch was sent from "From:
Patchwork <patchwork@emeril.freedesktop.org>".

[1] https://lore.kernel.org/all/172735727458.1107233.1757281470637305143@2413ebb6fbb6/

I think that tool is ignoring the "Reply-To" field [2] from the B4 message and
using the From field.

	From: Daniel Gomez via B4 Relay <devnull+da.gomez.samsung.com@kernel.org>
	Reply-To: da.gomez@samsung.com

[2] https://lore.kernel.org/all/20240925-macos-build-support-v3-1-233dda880e60@samsung.com/raw

> 
> -K
