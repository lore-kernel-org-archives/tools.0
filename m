Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7EF3375D5
	for <tools@linux.kernel.org>; Fri, 17 Jul 2026 15:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784301467; cv=none; b=BuAPuWg28fFlDaF0vAv4rSUKxUYx8q/LN3IlHf8KMKVXC6wXw+mexyqNWaDk3G080xCrMSVIwxtuSQt2oav22xFvKA/C9sv0kUAd+v2LQF9TS+6p4Dehmt8eE6JeZn/qzXiqGh6f5Ekwb+6ZtM0NCUuKUzs6JpILU6ACUEhEXpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784301467; c=relaxed/simple;
	bh=21bq+FyKN6B5IXrVQbKvuMEgUzMy0CfKKojjqLz4sws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tyZapOjtjOdUWTP3WiDtQ6FD7tJNiuDGoLC2xTobbmwXlFZ+2NTtN809Q+r0Rf0rvI95cj03elQ9p2k2frWraXO4RdcpVauH/nM+BdKD63DPD/p9GIIYeJ7avdtPvAmb+uCT1mMEoV/wSHOVHxuZdJ+v9gQF0Bl6JDY7X6gFTdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XWXBLTox; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XWXBLTox"
Received: by smtp.kernel.org (Postfix)
	id 8DBB81F000E9; Fri, 17 Jul 2026 15:17:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 409021F00A3A;
	Fri, 17 Jul 2026 15:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784301466;
	bh=1+Q/CAD882PJ8xQBDB4sknTueni7b3zFq33HQHBIwlY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XWXBLToxbO+bB33zJ2Ga3Ccs0/hOO65SI64gyKvChhLM1aLQCEPv8z5DGeyeoFiTL
	 nWzpLp/2Yis+0xCQ3j8fIwPZlzbAzYcyJJIwQ0aPC/1D5xZGZbpVnMN23FBZxYxGeR
	 4Jd921ccBL0/KEPuwnGwDF8xePDXcIVkERNZPiq8=
Date: Fri, 17 Jul 2026 11:17:45 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@kernel.org
Subject: Re: b4 review animates scrolling slowly
Message-ID: <20260717-fervent-barnacle-of-painting-9a5f74@lemur>
References: <985fb687-8990-4112-9e65-3701d35c71b9@sirena.org.uk>
 <20260717-smooth-petrel-of-champagne-2039cd@lemur>
 <40154af2-c28c-4903-a9fd-bd7f4f986096@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <40154af2-c28c-4903-a9fd-bd7f4f986096@sirena.org.uk>

On Fri, Jul 17, 2026 at 03:59:02PM +0100, Mark Brown wrote:
> > This is managed with TEXTUAL_ env vars:
> > https://b4.docs.kernel.org/en/latest/maintainer/review.html#disabling-scroll-animations
> 
> > I suggest you set this in your .bash_profile:
> 
> >     TEXTUAL_SMOOTH_SCROLL=0
> 
> I'd push back on that and say that I can't imagine that anyone wants to
> spend a literal minute watching code scroll past.  I think the scrolling
> is fine when it's for smaller moves but it should have some sort of time
> bound on it that adjusts the rate of scroll or turns it off entirely
> when the move gets too big.

Can you let me know if setting the following helps at all:

    TEXTUAL_ANIMATIONS=basic

We can switch to this being the default mode if that's an acceptable
middle-ground. If not, I can look at turning off all animations in the absence
of a defined TEXTUAL_ env var, but this would be fighting with the framework a
bit.

-K
