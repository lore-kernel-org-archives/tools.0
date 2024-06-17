Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881D511CAB
	for <tools@linux.kernel.org>; Mon, 17 Jun 2024 19:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718653363; cv=none; b=TWsFNgZ+1fg6i4uqG9xFtokNJnmi6R14DALZkI8onfZaosA/85RWV3rfaLLDJU9xrzZzC/yA2eA9qBomNmBDQYtwkGVFAitNKcQWQmObUOyOfmGNSKLRwK9Iaku9msi/MguPEGCGO/6i4Ps7zfBM+TDM8duTkcAYCa5jrgfpFY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718653363; c=relaxed/simple;
	bh=oFo/q0t4PZYdctIqe27nbkV7IHAwKfA//bDPl6LNt08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NX3DgxwtnUmS7WwAvGYDYpk8ZNCKxEaFt34kgXR+Zwgflm5WtHE6UCTDoQhkMNpMucEnbJkIYTfS/Mr6tMicUIA64R/b5ITDXNT9qo+KuHHFWECtioP05q5bXVXTw2ZQm+8RUpkdl/BjBVyWTmD2ztxR7djbPMDK5bP5/0Nt30M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Wf/sSKp3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Wf/sSKp3"
Received: by smtp.kernel.org (Postfix)
	id 1AE92C4AF1C; Mon, 17 Jun 2024 19:42:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6702C2BD10;
	Mon, 17 Jun 2024 19:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1718653363;
	bh=oFo/q0t4PZYdctIqe27nbkV7IHAwKfA//bDPl6LNt08=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wf/sSKp3iTtgn0LZsTrUpBJuvc5SNSLQnSku+X1spJ0H6GaQRcBi3uzhPrxWRMg5m
	 WOlTtc1JXJKwG1YsgsN568dOC+kRpxlbZqicGeYCq834vF9MyQIJw7+6aZR4M/mZkl
	 bIhWRfDZDWSY9F63zfHBpfSdoMcV6Q3dBbSGup94=
Date: Mon, 17 Jun 2024 15:42:41 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: [b4] COVER not excluded from prefixes
Message-ID: <20240617-imaginary-deer-of-excellence-1e5e26@lemur>
References: <577465b9-afa7-4663-8382-606c3aa64159@cherry.de>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <577465b9-afa7-4663-8382-606c3aa64159@cherry.de>

On Mon, Jun 17, 2024 at 03:35:58PM GMT, Quentin Schulz wrote:
> Hi,
> 
> 6bf474ec07084f684d8dc96d301875ee7fd73137 introduced the ability to exclude
> [COVER] from the cover letter from the prefixes to apply to patches in the
> patch series.
> 
> However, 6472779acf09656a692a2cd13df12299cb78d489 removed this option.
> Considering the unit tests were updated as well, I'm wondering if this was
> done on purpose or if it was a mishap?

Sorry, it was done on purpose. I wasn't really happy with [COVER], so I bumped
it out of the current tree until some time in the future. From the discussion
we had in the past, I've implemented --add-prefixes, which should do most of
what you're looking for, I think. I may revisit this again in the future,
though.

-K
