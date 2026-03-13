Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2CA35DA61
	for <tools@linux.kernel.org>; Fri, 13 Mar 2026 15:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773417309; cv=none; b=f8eABYgRJtU+WFa+OBKVPNVfc5fhZugt4MZKPQxPjCRKnhw+IKDhzysDsy6Lt7sDtdNk4ajbmKuZiB1ajzadJqPW5hWjT3ayWp3VWLUcP0aIANAb2TzgfBSPSn424gKHmwHChkcyyoM4UEBcpR6VFz8FdAAzp+CeBN4E1AVb0jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773417309; c=relaxed/simple;
	bh=Kl4ZLrWUFSiKowtRDY6dbd5qMhdVG+b4ltEEjnfdhXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dLML7fcoMXof9fFOs0iG3P4IRINoOzvNCQLlTYp7NjC9a5eAq37n1znmDwlzEgTFmCkICwtXQ0x8nb7TuyhnrC4ROvZoUc3OHoJgHMTdyaXesb+rpoqQmfFnfPF518isRsd0m9H6L270eL0NlPrJPqUPMlmVjXDgKgM7t0VXRME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Ceb5NfuL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Ceb5NfuL"
Received: by smtp.kernel.org (Postfix)
	id A65CFC2BCFB; Fri, 13 Mar 2026 15:55:08 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2CBB6C19425;
	Fri, 13 Mar 2026 15:55:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2CBB6C19425
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5B2A51A2E04;
	Fri, 13 Mar 2026 15:55:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2870860027;
	Fri, 13 Mar 2026 15:55:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4831C10369BC8;
	Fri, 13 Mar 2026 16:55:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773417302; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=3hGGJp4RXGa4H4dnUV+AsCY4JG2u9AAuhHPHwLgXQJc=;
	b=Ceb5NfuL/tTQrveK6hLZ4Zm+PDSrD6H0FdDBKvs6NjI1xAZdiD4LMBopI9jMvyy+wDSWfQ
	W42P1MQtL7zp9fLwth+IJo0KZc7u+uEpe43rsKq+a1BOSGjzsdEgLAOoFBcVOC/nBT1r3H
	KfupDNH44XddVB15JL3sn5zF62GzFGIdXJmA6zj3NbZydZWjwnbbLsgA8J8GakhGxmo4gF
	Q/6FD6Zjf02h8suHRP35ccFd9fYMfDqRDhjHIbtXTzJlxUQPbvtGMpCM9c0X/jmDVOy6JS
	8FsXgkVJdp8n7ONNzdA2fSFljkSYucVIkx443Zwwtm9LKHXnJy6DP8TcGf7oYw==
Date: Fri, 13 Mar 2026 16:55:01 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, users@kernel.org, tools@kernel.org
Subject: Re: b4 review available in master
Message-ID: <2026031315550105db2cc0@mail.local>
References: <20260227-imported-aromatic-guppy-ad3dca@lemur>
 <aaMPYVIgmsDpn7Rw@sirena.co.uk>
 <aaNaArEgAe0SgmSh@sirena.co.uk>
 <20260302-juicy-spoonbill-of-jest-6fc659@lemur>
 <e7d999c0-c27f-4d9d-8812-9ff3254ea7cf@sirena.org.uk>
 <20260303-true-glaring-raven-e78bf2@lemur>
 <20260312172156f5cb4041@mail.local>
 <20260313-poetic-mosquito-of-sufficiency-2b8a86@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313-poetic-mosquito-of-sufficiency-2b8a86@lemur>
X-Last-TLS-Session-Version: TLSv1.3

On 13/03/2026 11:42:12-0400, Konstantin Ryabitsev wrote:
> On Thu, Mar 12, 2026 at 06:21:56PM +0100, Alexandre Belloni wrote:
> > > Let me know if that's not sufficient. We can also give a way to hide skipped
> > > patches so they aren't even in the picture.
> > 
> > This worked for me but thank-you still tried to thank for all the
> > commits of the series.
> 
> This is fixed in the latest master.
> 
> > Also: I used cherry-pick, would Linear work?
> 
> It always uses linear for cherry-picked commits.
> 

Thanks!

Maybe I should start a separate thread but since some time ago, b4 is
not able to change patch state on patchwork.ozlabs.org. I attributed
that to how they implemented anubis but b4 review is able to get the
patch list. It is simply not able to update the patch status. Are there
any logs that would help you?

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
