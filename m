Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD151946BA
	for <tools@linux.kernel.org>; Thu, 27 Jun 2024 14:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719498185; cv=none; b=Hi5DGMXmgYa8mAS1grvGjQjLYZTFKTaz3yrF1jHOC3XIW80Um3EEwQX9tFGSR99nrLHteYWnQSIhNEC9/zfwLSmZjRW/HpzNzibUxB0XLCbPqfi0KSvGeSzTf/YxrETqAJKaslPD1rPH+Yib+axmU91QHeNF748OaFlnUZe5P/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719498185; c=relaxed/simple;
	bh=fL2N2yLy3Khu3L6aCrWdxg7ORicuVG0/AFJvTuxedyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WdHlI5U9Pz6AMTQN1d0Ma/rFZfrqitGq5HV/pMZTFn87xb1c59+H5eSO8QExGxA03+jicd+oFAoyIRR7esdxHXTADc+V6PrrU/es3rfDLE7owNaUamIhZDWOYLpF9LQQl8tolkVseDSWaarr35ZuAD7qrpVOxo3h4MhD0QlYWEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1iXBkawr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1iXBkawr"
Received: by smtp.kernel.org (Postfix)
	id 0279DC4AF0D; Thu, 27 Jun 2024 14:23:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD38DC4AF09;
	Thu, 27 Jun 2024 14:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1719498184;
	bh=fL2N2yLy3Khu3L6aCrWdxg7ORicuVG0/AFJvTuxedyA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1iXBkawrX5rYIaXm4mhy4P6gxw1aRzfxtbusyq8oWLWlJXDzH5C3Xr0RoV9MvQBvc
	 h+UyW5Ei4WR5goYFL4LLfeFblNniioyj+1AcQdskxjk0v0P8IUfVWCORW6gXusGsbF
	 Gj6yLrgFT3xRIL9EvqnCNgCxV9sgvnLLkPnS0sbU=
Date: Thu, 27 Jun 2024 10:22:59 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: tools@kernel.org
Subject: Re: b4 wish: differentiate between signature problems
Message-ID: <20240627-miniature-hysterical-hoatzin-22461a@meerkat>
References: <wxyjcpushnvpdrv42dijurk76oh3qny3y4mihnopof6fnwhwik@jk4tnftk6cds>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <wxyjcpushnvpdrv42dijurk76oh3qny3y4mihnopof6fnwhwik@jk4tnftk6cds>

On Thu, Jun 27, 2024 at 08:27:23AM GMT, Uwe Kleine-König wrote:
> After some debugging about "✗ BADSIG: DKIM/linaro.org" this is only
> because the signature is expired. (It's only valid for one week. And yes
> I know, I could fix that by picking up patches quicker :-)
> 
> I tried to improve that to emit
> 
> 	⏰ EXPIREDSIG: DKIM/linaro.org
> 
> instead, which would IMHO greatly improve my user experience. But that
> isn't easily determined using the dkim python module, so no patch here,
> just a wishlist report.

Correct, this is impossible without the following being implemented first:
https://bugs.launchpad.net/dkimpy/+bug/2047054

Unfortunately, the comment on that bug is not very encouraging.

-K
