Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5EC40DFB0
	for <tools@linux.kernel.org>; Sat, 21 Mar 2026 10:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774087296; cv=none; b=NtEbW9CrYLgs4/UmKXjIM+b+pamui0/R7bMlm/E54tN060nHR3rW+Ri7OEjV45kEWWhSySWT+bfaTNrvMR4mCc29WdwP5VqL6n0q5ZDrYcRy0YmPc4+Fh8a8AH4YwG25sEx9XMd/AwZMRwhDO9IkIO3vSTl9F4rDRJ4wqnHwZAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774087296; c=relaxed/simple;
	bh=b6JZECqWQRhMNpDyypY6Npn0JHJxmGI3CycI8rvfBW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ARNwwytL0LiLoNe+kItlC+YTRJhuurYpOsxk1KiH74s8omtiezx+zwDNHEueeY6jcCn41BAosDneYJeOtcdRl2ioLASoBnHtuwbkInDX3iIEV/o6Fg6x7DvkjJLFK722yYTg4YRAXsX7ijkEVDaj9XYVhcXHACMILzd5QYdgATQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JgBFlOtH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JgBFlOtH"
Received: by smtp.kernel.org (Postfix)
	id C1871C2BCB1; Sat, 21 Mar 2026 10:01:35 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 848BFC19421;
	Sat, 21 Mar 2026 10:01:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 848BFC19421
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6DFC5C566A3;
	Sat, 21 Mar 2026 10:01:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 74C706011D;
	Sat, 21 Mar 2026 10:01:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 67BEE10450D4D;
	Sat, 21 Mar 2026 11:01:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774087288; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=bnR5VXUiYuPzyQmg33Y940nsQAWB90Sh0nXARbtHm5I=;
	b=JgBFlOtHKv+Z1C4VkDEC4WMfi1psMZHyHdu0JnndKGmxY80OxGgx4lJRyhZwg1HXT7Kqgh
	EfAY17j+gtdUQavCuFlCvmTQHi2uRV5Uhz4PRovpzkFw1sY6i2GZMiJ444asuyG+th6Gn9
	e2FXGbM0WcZUFLAoFfYmeomL96c7GXUUHSAy6Qm/SgLNynUQOeXEAgX2k4w07qvRz0Rcw9
	KM80M0Pqw3ETEC+clRch+r3Kkv6IP7Gla3blDaxUrwszXudezibv+eu5xfCr4ciR3HlJK6
	TASf9+4YRNA4myjSfAQJu39VOfQshiRuZMcieNpU+KGJ2RDZgSasI9Xi4GyU6w==
Date: Sat, 21 Mar 2026 11:01:27 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, users@kernel.org, tools@kernel.org
Subject: Re: b4 review available in master
Message-ID: <20260321100127e5611fd8@mail.local>
References: <20260227-imported-aromatic-guppy-ad3dca@lemur>
 <aaMPYVIgmsDpn7Rw@sirena.co.uk>
 <aaNaArEgAe0SgmSh@sirena.co.uk>
 <20260302-juicy-spoonbill-of-jest-6fc659@lemur>
 <e7d999c0-c27f-4d9d-8812-9ff3254ea7cf@sirena.org.uk>
 <20260303-true-glaring-raven-e78bf2@lemur>
 <20260312172156f5cb4041@mail.local>
 <20260313-poetic-mosquito-of-sufficiency-2b8a86@lemur>
 <2026031315550105db2cc0@mail.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026031315550105db2cc0@mail.local>
X-Last-TLS-Session-Version: TLSv1.3

On 13/03/2026 16:55:01+0100, Alexandre Belloni wrote:
> On 13/03/2026 11:42:12-0400, Konstantin Ryabitsev wrote:
> > On Thu, Mar 12, 2026 at 06:21:56PM +0100, Alexandre Belloni wrote:
> > > > Let me know if that's not sufficient. We can also give a way to hide skipped
> > > > patches so they aren't even in the picture.
> > > 
> > > This worked for me but thank-you still tried to thank for all the
> > > commits of the series.
> > 
> > This is fixed in the latest master.
> > 
> > > Also: I used cherry-pick, would Linear work?
> > 
> > It always uses linear for cherry-picked commits.
> > 
> 
> Thanks!
> 
> Maybe I should start a separate thread but since some time ago, b4 is
> not able to change patch state on patchwork.ozlabs.org. I attributed
> that to how they implemented anubis but b4 review is able to get the
> patch list. It is simply not able to update the patch status. Are there
> any logs that would help you?

I've tracked this down to the v1.2 api returning a 500 error on
patchwork.ozlab.org e.g.:

https://patchwork.ozlabs.org/api/1.1/patches/2212397/ works but
https://patchwork.ozlabs.org/api/1.2/patches/2212397/ doesn't.

I see the API version is hardcoded, is it enough to change it back to
1.1 or is the API too different for b4 to handle it?

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
