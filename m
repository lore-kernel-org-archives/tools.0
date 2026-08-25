Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5092882DE
	for <tools@linux.kernel.org>; Tue, 25 Aug 2026 20:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787689910; cv=none; b=RKBq6tvi2Jr7w9fepXwY7/U8A3z1pIRI/suSPxl0txfEXTQ88uHa2+WmmZggVw/7K2VBlHAACDPcqRiYWHtRB92amHhZ5zjdNFAIstpHnScegvOubkvLtZn+cHRIp5nIsXDlx1k1dW9slNfvLKEW9MQGIgbn9uQhJiPOPJu+/Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787689910; c=relaxed/simple;
	bh=PH4SjMqHN7N0bQea/ZDmEyikoWlDsl7UWAQVTlRO09Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oE59z/Eb/JY6VjSnsntUYs0hf1obK4Z/B8o3WiTqJZ6ORzn1titE73f2ZuJPI+lbYVZOLczrQFOooh0ODcr4bQiALgN9DpreOZGy2WIGvJtR0G/J/ko0Vo8bBNv+02LKbuf2yVTJ1QXYYrBICJb7z2aJssHl68COGuchg3ZRS3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hghFlb5m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hghFlb5m"
Received: by smtp.kernel.org (Postfix)
	id ECD461F00A3A; Tue, 25 Aug 2026 20:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86E9B1F000E9;
	Tue, 25 Aug 2026 20:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787689908;
	bh=DEtSChgZbECAv6bf9glKXIszK8GpbBvJldSUpW7todI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hghFlb5mNjWSP61J9CrSHiBK6J7deLMhRQMO57wyn+NMyISCqosFYWIXRdRuUna5x
	 ZvNZzenEiw85pIrxUzMJaTvVMxTf27XhSBDotFRmXsX9oDNWfgJHaYsYbfFkh+sBEx
	 35GHfIOmulTG5MNeQheohpBuKYZ73dd6LeCJ7exO3j4EjTojuJMQV0sJwsnR2Pzose
	 /9ZziFiTxhgec362kuQ1k/dhh9rMWy90rSOo1F99ZCk9snV8K2XcIZ0zTzYNaZptOu
	 xUZa3HH0IvURw9X+AtWYwmMnPZLP/fzplG0ajrwNY2Vpq1w3y9viln36JowbMfd1bT
	 poKSmn4rbhVrw==
Date: Tue, 25 Aug 2026 16:31:46 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: tools@kernel.org
Subject: Re: b4 defered branch checkout
Message-ID: <20260825-uncovered-cerise-rabbit-0064df@meerkat>
References: <20260824164031.GQ244917@nvidia.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260824164031.GQ244917@nvidia.com>

On Mon, Aug 24, 2026 at 01:40:31PM -0300, Jason Gunthorpe wrote:
> I am looking at commit ad80ce422da0 ("review: defer branch checkout to
> shell/agent use") and think the way b4 treats the checkout is
> inconsistent.
> 
> If you <enter> on a fresh series you get the series review
> screen and the worktre is (usually?) left checked out.

It's not really intentional -- it's because we've literally just created this
branch, so the tree is on it when we load up the series.

> If you go back with Q then <enter> again, now it isn't checked out.

On "Q" we go back to the branch you were on before, and now when we enter
the review again, the branch is already there and we don't need to create it,
so we don't make any git operations that touch your tree.

> The above commit make it seem like no checkout is the preferd design
> and the residual checkout on the initial open is a bug?

Kinda, yes -- the main goal was to remove latency on entering review mode,
because on large trees switching branches can be an intensive process.

> However, I actually want to have the checkout. I want it *always*
> checked out for review. I want to use a parallel editor window to
> inspect the applied series in more detail that just reading the diffs,
> while continuing to use the tui, I don't want to stop the review
> workflow and drop to a shell.

Noted. The question is, how to make this the preferred operation for you while
keeping churn minimal for someone who doesn't actually want their branches
switched every time they enter a series. My immediate thought is to bind this
to two different keys -- a regular "enter" would preserve the current light
no-switch behaviour, while Ctrl-Enter would check out the branch for you.
Would that be an option?

> From that angle I view the above as a regression.
> 
> Further, if it doesn't get checked out what even was the point in
> getting it applied to a branch and fixing the conflicts just to get
> into the review screen?

Well, there are many reasons, but the primary consideration for me was to
speed up the operation and perform the switch when we actually want to work on
the branch (drop to shell, run an agent, etc).

Let me know if the enter vs ctrl-enter logic would be sufficient, or if this
needs to be settable via configuration.

-K
