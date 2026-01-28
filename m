Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B025A374171
	for <tools@linux.kernel.org>; Wed, 28 Jan 2026 18:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769626347; cv=none; b=Gi5FxAXGp34/UqszqeNY8wcfwTtkHs3l0zxFjUYfniEuGDfuO2+ht0WNIZk/TBHqN6HxCI3nRRSwvBT0NdOesiRAxr0aBemfxHy5gkCZRGaooNmnQ1hT4NZEufag6lRfC6OWmBChB0L3jvcgSuLxJu/aSoxgYAeiB7ytW9UOecE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769626347; c=relaxed/simple;
	bh=jPd4XpzzK48y7BUN5q6l8apHQK9ZQNfGZGgcfnKRbpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QEL/69f85R0YvcD/eoP2JlG6v72YJ32rh4ACI45d0Z/SQz0qHLcbixjSB0Y7DuaZEeG747YLofakjYYnF8MZnCnBwVtYVXjk3D48hmYrWbTbgKBv4zt5BQ2s8ZIZGxziCXLClGnon7K1BD+09lhMX5VdmSGYqaA+88WPe9wjbLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=bRtGQZNH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="bRtGQZNH"
Received: by smtp.kernel.org (Postfix)
	id 8B1F2C4CEF7; Wed, 28 Jan 2026 18:52:27 +0000 (UTC)
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C6277C4CEF1
	for <tools@kernel.org>; Wed, 28 Jan 2026 18:52:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C6277C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=debian.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KIdTBd4WJqCkpvltp9bFksLYeWOd9AsYe/21AQtHiSc=; b=bRtGQZNHP+wlLylJughN6rKqQp
	tDbpf1p8t4+p8yzdkYe2/57FKbhNKq/0kPhKlk1Sk1y2H05OvgkMPXPkzxBw1P+UIxjCAEtOzdlwT
	TN9T0UFsJUXYP7PLEI6usf/f/O5WYeLfQQGkPc+Qz1+HnvPzx7duC45wYxnIfNl3iO5/55i+jlYTu
	p5NXrrr1X1OqvtJAzdWvg0Q+Lxhtbkw/BwVOydqpRUmGvsrxq9cxtHMdpLQVBciyrohPO6yMOW9wp
	/JDr9qQ1UdZJnWdW8WYHLCYPanaPZIQjchSk+nrO9nFslssJkmKn4+MrOBIT5Nizrgvf+sI4wBDKK
	Oe/NV6Ww==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <leitao@debian.org>)
	id 1vlAeN-000N74-VW; Wed, 28 Jan 2026 18:52:24 +0000
Date: Wed, 28 Jan 2026 10:52:20 -0800
From: Breno Leitao <leitao@debian.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: tools@kernel.org, 
	Alexis =?utf-8?Q?Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Subject: Re: b4: feature request: send cover as separate e-mail even for a
 single patch
Message-ID: <aXpZ_qOTNHvW5iMC@gmail.com>
References: <20250619113855.6a271fa6@booty>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619113855.6a271fa6@booty>
X-Debian-User: leitao

Hello Luca, 

On Thu, Jun 19, 2025 at 11:38:55AM +0200, Luca Ceresoli wrote:
> Hello,
> 
> first and foremost: b4 is awesome, thank you!

Agreed! B4 is awesome.

> A fixed behaviour of b4 is that when a series to be sent has only one
> patch the cover letter is sent in the [PATCH 1/1] mail itself, under
> the '---' separator, instead of a separate [PATCH 0/1] mail.
> 
> While I'm happy with this policy for simple self-standing patches that
> do not need a cover, I find it annoying for other cases, such as:

Agree. I also have a similar requirement, to be able to send some very
specific and rare emails where I think a separate cover letter makes
more sense, other than the mixed-in case.

I've hacked a patch that I am using locally, simply passing
`--force-cover-letter` to `b4 send`, which will avoid the mixed-in
cover letter.

https://lore.kernel.org/all/20260127-force-cover-letter-v1-1-1ba8d7f9a64f@debian.org/
