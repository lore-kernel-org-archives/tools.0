Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B044D30ACF6
	for <tools@linux.kernel.org>; Mon, 15 Jun 2026 18:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781548752; cv=none; b=lXkrGkqP1agy4fj2Lre8LFVP2YB4t0MDGz6U4IwtlUKpoRn06jdLE3kOYzQPS4giizeIZPWoDlL3L0iEgxLER+MBvL03d+d3vDxNJkajvvI19NXFzECQgH9uJ2DAATP0D1iMRqb1AMEAKGkafcYAIR/5zrGBb5BubNbiy6tGCkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781548752; c=relaxed/simple;
	bh=NXgHqudJlxktTPPRwg46s6fWCBEeB+hOAKkHJB7bJq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ahCrvAIcfNqEi0hrmPv7NvgKoL8Sa6RdCFDGwGYMCaIN2k+WwKxQ9nl6w9T901m6fBoDzcly+pERTmN8JQY22+qdHOqVRKYr7MJhrZL5yKG/XXweHGik6XNITxUmSj6AK3hDUhJsLiX6ZvSLdtGuyVfUH/y42jCmfFXqh7lIVjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IGAy3rh/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IGAy3rh/"
Received: by smtp.kernel.org (Postfix)
	id 810D61F00A3A; Mon, 15 Jun 2026 18:39:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E3181F000E9;
	Mon, 15 Jun 2026 18:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781548751;
	bh=knuL+zUiomVw5IqZZU4KZBDPccrcSXQWFTQJGlYqXj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IGAy3rh/itYoWBM5bVz7UdguV04rWF1dl4US9BK4xsc5AX76uz2ybN2V+OzqjJzoP
	 wns4MWuCvLl/ogqAS/7IJOQZQWZdKxaiBgaT+9B8qEXvzywOzYxjnX90jd8pm8t8r0
	 S98H6St2jU0WRgch+Oj80dOiM0aVf7VSoJ5zHpGC3RPlBbo6k1j2VCMeYJHk+bWjkA
	 pgO/N1mNKJKbNrlxgM2DR0gemlrvqufbj3sf2ncCEiEqAo0gR2M00fuNcmk/krwofg
	 KzjJ5o7PWY3PV1xeQJfPgj2rqvMXydUW2grXVODcVKvJrkLzoq0rMlKuKH0B4DCaAU
	 aZpRlvL++6ynA==
Date: Mon, 15 Jun 2026 14:39:09 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: users <users@kernel.org>, tools@kernel.org
Subject: Re: b4 fails filter-repo with FileNotFoundError
Message-ID: <20260615-tremendous-dandelion-kelpie-4aab9e@meerkat>
References: <3ed2080e-c8a2-44de-b68f-4b23338a572a@ideasonboard.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3ed2080e-c8a2-44de-b68f-4b23338a572a@ideasonboard.com>

On Mon, Jun 15, 2026 at 03:52:53PM +0300, Tomi Valkeinen wrote:
> Hi,
> 
> I'm seeing this with a few commands, I think at least "b4 trailers -u" and
> "b4 prep --edit-cover". Linux mint, b4 0.15.2.
> 
> $ b4 prep --edit-cover
> Invoking git-filter-repo to update the cover letter.

We got rid of git-filter-repo in the upcoming 0.16, so, since it's succeeding
anyway, I'm going to put this on the backburner.

Thanks for the report, though!

-K
