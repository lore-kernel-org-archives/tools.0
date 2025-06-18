Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BD620551C
	for <tools@linux.kernel.org>; Wed, 18 Jun 2025 20:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750280107; cv=none; b=F8S0HIAqvZemDbhgVbn/SK1Ax5RuDVP5mt4M3BbHlExfn94oOpVWq0ESxuO42gL+oFzFOLp5XbydaWkSVW5qhl/I7zoaxH2sBjtJP2cfjMUgY+fOjFyviCsIqsp0A5iRtOeQALYiUPHNajsYNQtFMkkR0YhTdi6AOTZXYNZq+Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750280107; c=relaxed/simple;
	bh=/3H93lSRwI8UR3C3ZO3lUS/pejLzbfq3fCIX8WQkBJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ijQ3cKQuUlSD06sFCejnYmo8BI5ii3be5C8ASEUZEY+NIivTwH3XAXyQSANGDx65v9NVH9jMlWHxePf7eZHdogGiLsSPZEfkF871VQZ4e3yaPnuDKm4BJfnCP9GGQW9cok9qJ6z0VVtvXNVTPlbXcYQkQS+wZedmWSsg1WGXWyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ktRssM38; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ktRssM38"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB757C4CEE7;
	Wed, 18 Jun 2025 20:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750280107;
	bh=/3H93lSRwI8UR3C3ZO3lUS/pejLzbfq3fCIX8WQkBJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ktRssM38099gnsgc5Ey+ddgC2H81XfZ9kvy5lQIF/8WQJweYgJfmHcL/sV7UpqM73
	 cyUnRhBl6KhCpUqLPhUyxmE10ILMklxBp8W8PZ/zdwpEOVz3b8rTvR5ih+59uFd/mr
	 lsekLV7eBkHwuqtmfPZTCBB33j5OvhnxasWQIITg=
Date: Wed, 18 Jun 2025 16:55:05 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Rob Herring <robherring2@gmail.com>
Cc: "Kernel.org Tools" <tools@linux.kernel.org>
Subject: Re: b4 cherry-pick behavior
Message-ID: <20250618-archetypal-spotted-hippo-43c4d0@lemur>
References: <CAL_JsqJJBZL1w-HLwr9nL4Zh50KnwOFHCE_m_hcvwnkVPH-S=w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAL_JsqJJBZL1w-HLwr9nL4Zh50KnwOFHCE_m_hcvwnkVPH-S=w@mail.gmail.com>

On Mon, May 05, 2025 at 04:42:16PM -0500, Rob Herring wrote:
> I've found that using -P_ and -P<n> have different behavior. The
> former will not pick up any trailers from the cover letter while the
> latter will. If that's desired behavior, can we make '-t' override
> that or something? In my workflow when reading a thread, I have the
> message-id readily available, but not the patch number unless I add
> some parsing of the subject.

Sorry for the delay -- I'm finally looking at this and I can confirm that this
is unintended behaviour. I'll fix it so -P_ and -P3 in this and similar cases
return identical results.

bugspray tag me

-K
