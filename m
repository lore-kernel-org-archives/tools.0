Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E4824F594
	for <tools@linux.kernel.org>; Wed,  5 Mar 2025 15:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741186916; cv=none; b=QmfltP4XeJFJEwXVKal4xnXwpMhBcWBZOwGRn8oGAuGv0mRbrpOhAcd3UJ8pIBUHNGaxvfAKgWv5K7e+e7FhKglu7OiF/ZZudH+U6WEGmONp151hnH1jRsbhT0m606/efVtewGJBqV/PDuBOW+YThrvO/q8DmTDwS6qruXCbG5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741186916; c=relaxed/simple;
	bh=nEYbuB9KW4EDujCSgj03rb/SlzgaaaL50VtFRm2QO8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fZBiQYpagej6gn9BsIwqxka7m/NRxG0XvFY4PB/Ls/er1jM5KS2gUvjGDuQVhilj1/DBjXxVtnrQBor3qgPJRV7g9KK9ol38UDnqt1QjsGUZ52h5Ol/RMs7/MXZinagfZVAGgLxDgSTXDoDSBZj4Wos7fVcutVqIOX0xKf2N2NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UJBvsgXJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UJBvsgXJ"
Received: by smtp.kernel.org (Postfix)
	id E6BB3C4CEE2; Wed,  5 Mar 2025 15:01:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B309EC4CEE0;
	Wed,  5 Mar 2025 15:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1741186914;
	bh=nEYbuB9KW4EDujCSgj03rb/SlzgaaaL50VtFRm2QO8k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UJBvsgXJunXykK91MKvlq3EmiJlJU97kSRWnL0/ov7DyN4TlpZQEXVoA08oyigi8f
	 4txIdkUBlAFPsD4kBANtHYWgKLAhaF2WrSudwcSkvnsxxry9rQ4gQaUkz1ASnVlsQ7
	 yg6CkyYjM4cZLL6FRZSyVenNmVdF3QoYONBai16s=
Date: Wed, 5 Mar 2025 10:01:51 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Tom Rini <trini@konsulko.com>
Cc: tools@kernel.org
Subject: Re: b4 feature request
Message-ID: <20250305-amiable-banana-scallop-167f8a@lemur>
References: <20250305145121.GM2640854@bill-the-cat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250305145121.GM2640854@bill-the-cat>

On Wed, Mar 05, 2025 at 08:51:21AM -0600, Tom Rini wrote:
> Hey,
> 
> So I used "b4 shazam -P 1-2" to apply part of a series, and then "b4 ty"
> to thank for it, and then the contributor asked if there was some way to
> note what parts were applied. Could something like that be added?
> Thanks!

Hmm... That's the default behaviour. E.g. see:
https://lore.kernel.org/all/174109571262.102031.5467613849616675528.b4-ty@linaro.org/

Have you modified your template to remove the enumeration?

-K
