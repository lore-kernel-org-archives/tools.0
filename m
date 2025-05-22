Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D73F2356CB
	for <tools@linux.kernel.org>; Thu, 22 May 2025 13:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747920453; cv=none; b=FG0cB13PmeNSPz2zH76e0oU7lNOpG/bklsLqgaC4TJjCjrOSYEf5Q+olCjik7+0TKKLH5bSHSiV0I2iDPxts2yMm2wdbl7KBEcCVzbqo0NgP7d0ds22eCeZ4kL91kEwIC6wd9qID4nMfUJ2tX2DeALnSQi82Qe3JWWplUFF1o6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747920453; c=relaxed/simple;
	bh=smh4t7gStATiWwIq4rrQF8/3Zw5ZSEIad3S9u+yJcKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OmmUdg62tWlG6yfh22wP7NrdAq6a8zps/XxZgV5vFb7mFP7j5GX2mAr4XVl066/0Z9UwAaEt2SErN63uaKrf+PTE4EGVBDCO+A/rC2Nr3IWPvhaxTweB7oraH35ZStw+jwPsEG7qEk3aDOlA0A1zVDi8K3+2UeuxJRC4L3n1gtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hZArixmy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hZArixmy"
Received: by smtp.kernel.org (Postfix)
	id 9D50FC4CEED; Thu, 22 May 2025 13:27:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 671C6C4CEE4;
	Thu, 22 May 2025 13:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747920452;
	bh=smh4t7gStATiWwIq4rrQF8/3Zw5ZSEIad3S9u+yJcKo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hZArixmyGOSf15oK+wOhR5UFdrYuMcjVPXp0BS2n05eczhhKM4L7zbwjwjSfBJ+XW
	 //eOLWa/w2iGswU6wiAv3nTgvg8jFutIPit+l/sX2uceKvq+DRmz/xzIQP0MkqHsr7
	 sH10+W2QinHWG5ytrn7s0MCPHDs3SO+7JIpRRKXs=
Date: Thu, 22 May 2025 09:27:31 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: tools@kernel.org
Subject: Re: [PATCH wotmate v4 0/6] Cleanup, a fix and txt representation for
 trust path finding
Message-ID: <20250522-melodic-tunneling-crab-863ab6@lemur>
References: <20250519101429.1558947-8-u.kleine-koenig@baylibre.com>
 <20250520-resourceful-salamander-of-opposition-131c63@lemur>
 <fekxcrrrgoxu3ugecdyzc5nrlzfoa776dlyzjc6ger2mjmhry7@p3itqnu7tm34>
 <gnl4wd5opraaqx2iimdss22vwqqraex2jxo4rxxwblifooagjy@bdpwayn336en>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <gnl4wd5opraaqx2iimdss22vwqqraex2jxo4rxxwblifooagjy@bdpwayn336en>

On Wed, May 21, 2025 at 11:12:28AM +0200, Uwe Kleine-König wrote:
> > Looking at your change to the pgpkeys repo you still got rid of many
> > SHA-1 signatures due to commit b088af1f40a5 ("export-keyring: Default to
> > store \"clean\" public keys") as cleaning implies pruning weak
> > signatures. The effect is only limited because the linter check prevents
> > several keys from being updated. So because e.g. Greg's key
> > (38DBBDC86092693E) uses a SHA-1 protected User ID, it doesn't lose
> > Linus' signature.
> 
> One side effect of how SHA-1 signatures got thrown away is that the
> graphs (both svg and txt) were generated with these SHA-1 signatures but
> they didn't make it into the updated keys. For example
> 8972F4DFDC6DC026.txt currently looks as follows:

I just pushed a big update that adds a --use-weak-algos flag to two commands.
It also adds a bunch of typing data, so we can use linters a bit better.

> 	from  79BE3E4300411886  Linus Torvalds <torvalds@kernel.org>
> 	   1  8972F4DFDC6DC026  Kees Cook <kees@outflux.net>
> 
> But keys/8972F4DFDC6DC026.asc doesn't have a signature by
> 79BE3E4300411886 any more. So if you run
> 
> 	korg-update-pgpkeys empty
> 
> once more, this signature isn't available any more

I think I fixed things up now to avoid this problem. It looks noisy, but for
the end-users it won't make much difference, since their gnupg will be
ignoring those signatures anyway.

> I'll prepare a patch for that later (maybe tomorrow).

Please grab the latest master! I think this is already in there, but feel free
to build on top of that.

Thanks!

-K
