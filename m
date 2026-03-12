Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E003D8120
	for <tools@linux.kernel.org>; Thu, 12 Mar 2026 17:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773336123; cv=none; b=Aqrd5Yck9l3BBxE8KVKe4mC2oOMVB5tUAFcaCDSjep1nQ0xzjVtqS04Y/8CzGj1PFr9p8TNUJPYCisafS/HaBojVPe7d0/uofYtkfgeh7cJeBOf0tJjp8vDZaEgCbhc4Eyhv7iHtIzZpl0XvIHA+E8dgWHJbeZh9SSAFH/LDRhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773336123; c=relaxed/simple;
	bh=42u2ONt3dYDPxvB5goYgbrWIsaVeiTbmOAk1xkr7CRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kWypN3w9L8RRS7GczBtwIZUxwt3RtZkx25PAabcBjeXRcbPCh0Hb2uX7T7SwpUEfn2EJEwt2RadH2e4i7I3QMEvp+gmrZGayJghQZPUDmEi9eAfh8AOcJ0a6r0h3teC1NimzQaSq3FmzYaNgHHFiVumIlNIZOHPZSMUeF9aKknk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UFLLRpRn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UFLLRpRn"
Received: by smtp.kernel.org (Postfix)
	id E239EC2BCAF; Thu, 12 Mar 2026 17:22:02 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2E5B9C2BC87;
	Thu, 12 Mar 2026 17:21:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2E5B9C2BC87
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0E30EC415A9;
	Thu, 12 Mar 2026 17:22:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 245CD6001B;
	Thu, 12 Mar 2026 17:21:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DAC19103686BD;
	Thu, 12 Mar 2026 18:21:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773336117; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=rV1YfdDnbJwg54zJOSLCccRXET5qy7ybdmzrYnAx+XU=;
	b=UFLLRpRnGroszrE5I2U1acKn/sXkJnA3X6DWJ0dXZ4ZHooNKE+DQR2QJdeDqcSH/HhavQW
	C6YnXcOdUT0+KLbeXHdbiwrSw+S7Z99wBMhiKckcGtSiFDXodDouahYzbsKglr0U23bdNl
	E+o7C2Mnt4UfVnv5N5yBBkPEofHD6iRZfaTMlyoZU714mpTxkfQvQ+fftmOKnrMQcu1R2g
	l9LhkjF8Mqc0tSHLo+4Sgwa7vpYQwJiGChnIaPbmiiEom8C3jYDcnCg7aAqcDvq+xS97uF
	XXmPesHan3c++ZI/wI9yuImFik+g/4aRDn03hCf2h6uPOvQ2eycCTeW1IB0DQg==
Date: Thu, 12 Mar 2026 18:21:56 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, users@kernel.org, tools@kernel.org
Subject: Re: b4 review available in master
Message-ID: <20260312172156f5cb4041@mail.local>
References: <20260227-imported-aromatic-guppy-ad3dca@lemur>
 <aaMPYVIgmsDpn7Rw@sirena.co.uk>
 <aaNaArEgAe0SgmSh@sirena.co.uk>
 <20260302-juicy-spoonbill-of-jest-6fc659@lemur>
 <e7d999c0-c27f-4d9d-8812-9ff3254ea7cf@sirena.org.uk>
 <20260303-true-glaring-raven-e78bf2@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303-true-glaring-raven-e78bf2@lemur>
X-Last-TLS-Session-Version: TLSv1.3

On 03/03/2026 13:21:21-0500, Konstantin Ryabitsev wrote:
> > > I'll push back on this a little simply because there's a lot that is keyed off
> > > the number of patches in the series. If we cherry-pick before we even review,
> > > this makes a lot of other functionality fragile. However, there is code now to
> > > mark patches as "skip" (with x) -- this should let you completely ignore them.
> > > When we "take" a series with ignored patches we will automatically default to
> > > the cherry-pick strategy and pre-unselect the ignored patches. Would that come
> > > kinda close to what you want?
> > 
> > Possibly?  I'd need to try it.  Some of these serieses are quite large
> > so even finding the relevant mails can be annoying.
> 
> Let me know if that's not sufficient. We can also give a way to hide skipped
> patches so they aren't even in the picture.

This worked for me but thank-you still tried to thank for all the
commits of the series.
Also: I used cherry-pick, would Linear work?


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
