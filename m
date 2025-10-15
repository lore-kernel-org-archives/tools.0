Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B3D1DE3DF
	for <tools@linux.kernel.org>; Wed, 15 Oct 2025 13:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760536051; cv=none; b=bzqfOlcNK0kGw5rVbmnI2KSW2SGXmixmnPmPxLG2NYrxPvUA3SDO9sue/ESQz0h97rJwzvLp6SyJF3ybvhd42jTo0OR4dDo/00hrL1eCTQ/9JALOVvxhFbNR/efpPJWzm07Wds1MX0jJ/FQriG0PyDslBHU6XlC8s1fO5X+tHdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760536051; c=relaxed/simple;
	bh=UpCrgd/+wXiouosm2g2xeOWJObWZvUrw3UJNGyy8SHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=byUo9T1CdDarPljA08iufhI71UTyXxHW2/7RN3hciymx5fL2ntJ1LaVZB8yIfR6cu+A3vK21RWv5poyfb0fhK+pV7PbiJxLOGonBxNbmXNsduNWzM5f3/sTpnYh42CIFgdTad+HsHVHKB9z57ZErHxnzzoZSh61LwPsL0+BSKyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=qIxRXt9L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="qIxRXt9L"
Received: by smtp.kernel.org (Postfix)
	id 2653AC113D0; Wed, 15 Oct 2025 13:47:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E98E4C4CEF8;
	Wed, 15 Oct 2025 13:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1760536051;
	bh=UpCrgd/+wXiouosm2g2xeOWJObWZvUrw3UJNGyy8SHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qIxRXt9L4P1PkFF4Se5t3QzMUPwzjdxzwsRKpTfG7x5eWgUA6QDkHvUwItXnALoUW
	 HKEqJfSmhkENdIiLSd2XU4uRaXGKGTMxMR7w7UR2m4Qf68Glb/YZ5YIZEc/4b9jjLL
	 cg4gdimdRDKE3cHfh6ociKTTm9S0n+x6vuGHjB6A=
Date: Wed, 15 Oct 2025 09:47:29 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Sasha Levin <sashal@kernel.org>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: [b4] initial "b4 dig" to supplant Link: trailers
Message-ID: <20251015-lively-sassy-lizard-e34b98@lemur>
References: <20251010-muscular-camel-of-acumen-00eeaf@lemur>
 <20251014-gorgeous-cougar-of-endeavor-0c5baa@lemur>
 <aO7FayHzTEKVsWAt@laps>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aO7FayHzTEKVsWAt@laps>

On Tue, Oct 14, 2025 at 05:49:31PM -0400, Sasha Levin wrote:
> 1. If the provided commit actually has a Link: trailer, we should just use
> that(?).

We do, but we now do it better in the latest master.

> 2. Some maintainers re-send patches they've accepted. An example:
> 
> $ ~/b4/b4.sh dig -c 54b91e54b113d4f15ab023a44f508251db6e22e7 Digging into
> commit 54b91e54b113d4f15ab023a44f508251db6e22e7
> Attempting to match by exact patch-id...
> Trying to find matching series by patch-id 340e7baae92a71dd5e62a4e8a52245348ff3a0a1 (myers)
> Found matching series by patch-id
> Will consider promising messages: 2
> ---
> [for-linus][PATCH v2 2/2] tracing: Stop fortify-string from warning in tracing_mark_raw_write()
> https://lore.kernel.org/r/20251011194257.341582199@kernel.org
> 
> Which doesn't end up pointing to the actual submission. I'm not really sure
> whats the "correct" way of addressing this...

There isn't a good way to deal with this. In this particular case there's a
Link: trailer in the commit, so we can filter by that to find the right patch,
but failing that it's a pattern that will always "win" because it's newer and
from the same author.

> 3. Date filtering seems to be broken:

Rather, I found that using rt: is not always effective for some reason, so I
switched to using d:, which seems to be more reliable.

-K
