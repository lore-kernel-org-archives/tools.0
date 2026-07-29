Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6982621ABAA
	for <tools@linux.kernel.org>; Wed, 29 Jul 2026 04:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785299899; cv=none; b=JUNuTzBJja/rvJ0+0vfRz2ZJK2PAwXDiMgfcffOkcuvb/NzgJnHAq8YpOZIZ/dYsjoIXd70SFhrIQp7emMNSXcBgJMsZwmA70oEhKGfnqJBvuHSF3o2JQdkgxB6MziXeRE8ucoaln9uQob7YRE1Rt5UAi+9NdKgoji9H46/pFLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785299899; c=relaxed/simple;
	bh=uI0OZThkwuVtDs4O3xUJBPyfYlkmzfOMmGUy2FLPs6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dkLfazUSj61xiekhiBhkmIZqphDB0/HZU9VT04FW9I89LAYY2m8PlysM8kH7Xsxatx6DyH1FUSE3684a7x2gY8DCY+TBA23VS9zyk8lTcm3swdoVJ5RMB4G8AFbtsJZkSMEWefbPkSgc1hc/PySpP8z3bpAkPoyKE0HFecWKvZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=cL6GaYCy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cL6GaYCy"
Received: by smtp.kernel.org (Postfix)
	id E36221F00A3D; Wed, 29 Jul 2026 04:38:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95D4F1F000E9;
	Wed, 29 Jul 2026 04:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785299897;
	bh=L/xlPMU6LobLj2sIG7E4k6Wdvo3MMTW5jGPmoLqhl7A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cL6GaYCyX4ndSmy5QVLCJPOVFRMle+jOGjU4/pfMOG+D+B24rDBmjGF+nz7b4jJ/Y
	 1NkqDb89whH8HlnbG0XMUYj4DPjI1hs6f6D80hC217832rXoXQ8aEHZ97Sn+/7vbVd
	 FAvMLxpsPumHa3qhKgDfFtjsuNQW6sWpG0hyPZmc=
Date: Wed, 29 Jul 2026 00:38:16 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Matthieu Baerts <matttbe@kernel.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: b4 review tui: too smart reply features?
Message-ID: <20260729-pig-of-lucky-economy-3a5ace@meerkat>
References: <c281cf50-7935-488c-8429-03eac9b8902e@kernel.org>
 <20260610-psychedelic-encouraging-quoll-c7b949@lemur>
 <b2c44799-85a9-4576-9aae-b43eb1092315@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b2c44799-85a9-4576-9aae-b43eb1092315@kernel.org>

On Tue, Jun 30, 2026 at 12:55:25PM +0200, Matthieu Baerts wrote:
> I just retried, and it is indeed much better now! Yet, I still have an
> issue with trailers, e.g.
> 
>   Please add a Fixes tag. Here I guess it should be:
> 
>   Fixes: (...)
> 
> The Review view then correctly showed my comment with the Fixes tag, but
> *I think* the Fixes tag was not visible in green at the bottom left (not
> sure, because I also added a Reviewed-by tag after the reply). When
> looking at the 'email mode' view, the Fixes tag got dropped, leaving 2
> empty lines around.

This turned out to be two separate bugs, thanks for the detailed description!

There's an attempted fix in the current master: the trailer menu now only ever
touches its own trailer types (Acked-by, Reviewed-by, Tested-by, NACKed-by).
Anything else you type into the reply -- Fixes:, Cc:, Suggested-by:, whatever
-- is treated as your content and is never moved or removed.

Removing a trailer via the menu should also no longer leave a doubled blank
line behind.

> Back to the 'reply' view, vim showed all lines ending with ^M, and the line
> starting with 'Fixes:' was no longer there. Adding it back re-added it to
> the other views, and the Fixes tag was also listed at the bottom left in the
> 'review' view, but I could see extra new lines due to all these \r.
> Stripping them from the 'reply' view fixes all the issues, and I was able to
> send the reply with both my Fixes and Reviewed-by tags.
> 
> Any idea was caused that? :)

That was bug number two, also with a fix on mater: b4 now normalizes
line endings on every editor round-trip, whatever your editor decides to
write, and previously stored buffers get cleaned up the next time they're
touched.

Try them out!

> BTW, after having sent a reply, it appears a few seconds later as unread in
> my inbox. I guess only a filter on the inbox side can help to mark them as
> read, right?

This annoys me, too, so I'll think of a way to handle this.

Thanks again,
-K
