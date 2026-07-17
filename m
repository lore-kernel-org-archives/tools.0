Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C553B52E7
	for <tools@linux.kernel.org>; Fri, 17 Jul 2026 14:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784297693; cv=none; b=RJ/NS2FItZCf42soYCxYl8RI7ev06HvTUK3wx6UZZbKaIfS70gQH+7oseRZaCW+PkLwVl5iyrccOrJOwNflVxnKXojvtvpC/khZ5vugfvGPUwBCl0p3ZBh6j1RUpLFWH20Olzdk8cuTHZB/84ZictBcbbVMfPkG8+8JqQ4IU9dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784297693; c=relaxed/simple;
	bh=/z8NJwxGtk3/Uj/b6E+nTk3RfPS1lHwp5a/AllrmuvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ml1/wynBPJFW6174NB/USR7Cl6Cgi6D1DHmEZiDY2uiSl9VrT/voZyEziFS7aGhbl9cERkXp/ScNH8zYCXDytlOVIq92sI28IosQiwpGN1RHheOFL3YmIoCi3WFh0VFPzowuflelf/TP8IxC6eqvE+WTNwI9TzebRvnYRYvgUa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1SNolKAD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1SNolKAD"
Received: by smtp.kernel.org (Postfix)
	id 40C3E1F000E9; Fri, 17 Jul 2026 14:14:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E94BD1F00A3A;
	Fri, 17 Jul 2026 14:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784297692;
	bh=vNiL9UcHZVKFOnqepA4tMKmRNgLX59BjbHda9vxm3Sg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=1SNolKADjoJkH7fTuPKcRaR+7y8qk4sQ37CbrBN1e30gLnV1wl7lNMTjWu7SAPyKl
	 aYp2WQNstiQLxoDZQO2qx3XazWc3NGHQ3OCtE7KNOhRADuvJVxKV+cyjzI5+QY7OOD
	 wTrsipp5FZoszV3PjUe1iJ45V6nX5ggH7/Bj1h78=
Date: Fri, 17 Jul 2026 10:14:51 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@kernel.org
Subject: Re: b4 review animates scrolling slowly
Message-ID: <20260717-smooth-petrel-of-champagne-2039cd@lemur>
References: <985fb687-8990-4112-9e65-3701d35c71b9@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <985fb687-8990-4112-9e65-3701d35c71b9@sirena.org.uk>

On Mon, Jul 13, 2026 at 02:39:34PM +0100, Mark Brown wrote:
> When moving to the next review comment with , and . b4 animates the
> scroll at a fairly slow rate.  When the patch is large and the review
> comments spaced widely apart this can become rather tedious to watch,
> taking at least tens of seconds at times.

This is managed with TEXTUAL_ env vars:
https://b4.docs.kernel.org/en/latest/maintainer/review.html#disabling-scroll-animations

I suggest you set this in your .bash_profile:

    TEXTUAL_SMOOTH_SCROLL=0

-K
