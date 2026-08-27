Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE244299922
	for <tools@linux.kernel.org>; Thu, 27 Aug 2026 16:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787847129; cv=none; b=egf+7aucT11wNMmVJTf0soksxCr0Qpbm6CVpdO/cKU3SUNW/GQ7BY3nKyER7uJqmBqnCHHgnyf3hB69s3OSO9bjwBORTUq/nTUkG8FAst9w/3mLndnRFrWMXy2RK+SbaZ5iKdaEOf8APTE79Ohw+ZYVqp5fb7ndr0WyD+UGAdKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787847129; c=relaxed/simple;
	bh=KuloIQqQMrPy+kEUmH/1eHcENu5mmagmcUGtCVs/cPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ez8JTRVmGpLUqJZBXBB3miLsc3Gn53ffmMY7EuSoVvAUc1JNfPFXJV+kpep5thbDcsyVaDKh7uEDb/8hVp4ggJav8b6L5q2VFBnGnGyQU8d6WMlPos248phV9AAffU151nWTeQmmP0TvqMpVaMuDMVYOHred/b+uHYDLR80Coxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=zdUVmtTQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="zdUVmtTQ"
Received: by smtp.kernel.org (Postfix)
	id 5D47A1F00A3A; Thu, 27 Aug 2026 16:12:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F03FD1F000E9;
	Thu, 27 Aug 2026 16:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787847128;
	bh=vhK4h1Q2bgYCoOtVsF8ggVRgjwhg1Hm7wBJ1xYF3kIM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=zdUVmtTQyE36uUNHUd54FTvnVpUr0x7KlaLR2cAiegHTwY+bgeZBuWOCelo+E1+1h
	 LgIuonFGw+4YmZkpA/KUiD8Vl+06hAlwYguOmT4rYFKMk9EKwp7+YsDRRMKr3Tj0jV
	 SSDKzZfYBr3b7PAs7/CpNuieHDCpNvbkHrnFH0Cg=
Date: Thu, 27 Aug 2026 12:12:06 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: tools@kernel.org
Subject: Re: [PATCH b4 3/3] review: add >8< inline marker to snip quoted
 reply context
Message-ID: <20260827-smart-pegasus-of-masquerade-404d4f@meerkat>
References: <3-v1-5f6173f1d4bf+3e9-trimming_jgg@nvidia.com>
 <178769314159.3594992.17501322825534621353.b4-review@b4>
 <20260826231207.GO3325090@nvidia.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260826231207.GO3325090@nvidia.com>

On Wed, Aug 26, 2026 at 08:12:07PM -0300, Jason Gunthorpe wrote:
> Oh, it was supposed to be > to make it a quote followed by the 8<
> which kinda looks like sizzors.
> 
> In the end I bound it to an emacs macro and it turns out to be pretty
> tricky to type anyhow. So.. Any of these are fine for me, lets just do
> one?
> 
> >   >--cut--
> 
> How about this? It is self describing

Sounds good. Do you mind sending a v2? I would also consider including your
keybinding into the emacs .el if that makes sense.

-K
