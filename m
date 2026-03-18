Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FB33DB625
	for <tools@linux.kernel.org>; Wed, 18 Mar 2026 14:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773843434; cv=none; b=ZmMr74WDcku0HMmIklylYaKjzpSCVZ4QHoRGswx+fLC08t9B/FXkyNx8HyHQU0RMRPnRWqWu/2p7T3hybCB00PtPYwzfCSYXbbiA1keJ7plout6y/RkK0Lx1ZK1+HI4ij9W/kJfqHkdJDESU3EqHH0DWjzTpQsrNoKATTLzQrKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773843434; c=relaxed/simple;
	bh=kNx7ven82UCRT3gl+qm544zDnL7gJkQ1u/dyCt/YX3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=by7DMMeAxX1Ubn+pOr2cTZnhFzAmaruPH3bweKa5TJfpLuq0KG2poPDrUNGUkQhJSlmjoBuadLHjNlrID8YRJdyNRlwLJb1IIWBQEUukgHS57ucDFsjIH+zr9JacIcbnm3dx9XZavyI+aosFBTyQwrXbBoCdlK8ORY0mDdmlkGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eYWo6UD3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eYWo6UD3"
Received: by smtp.kernel.org (Postfix)
	id A2789C2BC87; Wed, 18 Mar 2026 14:17:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ECB4C19421;
	Wed, 18 Mar 2026 14:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773843433;
	bh=kNx7ven82UCRT3gl+qm544zDnL7gJkQ1u/dyCt/YX3E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eYWo6UD3nYnWOW5pvDnccEOMdZpdYknzKV+BpZOLCB3oTjL8R1OTJ/WciKUACFisD
	 Di3a/15KMEQB+QUrks7d1NkRjyJo3yMAR90ioHFIC3yIgNSN0+YE9pvB9nq60PTvnu
	 WqJYxyX3IBjbzDWjaE8zuPiI06EBepjbTnCa/Wim1JZppi/LXn/KqkGKUQGJzWX+6b
	 e2HtXSSK6kII8RdohTA37zoylV3oXTOmlklNu980T0CqyBTfRSf/Zx+NdqQlSFzcy9
	 QX5KUePBZGw6Rn9ci8hualD65I6mK8kfuDY3wQ8Il4JzpyqBWp9GLl0WOhs7QDvnOL
	 OwMMLJgbHFntw==
Date: Wed, 18 Mar 2026 10:17:12 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: Sorting for applied and thanked reviews
Message-ID: <20260318-micro-potoo-of-luxury-55ff41@lemur>
References: <4547f513-9e28-4f5c-93d1-823e70b110fc@sirena.org.uk>
 <20260317-steady-narwhal-of-courtesy-edccbb@lemur>
 <f1fed64e-bee8-469f-8a83-da8e76f9e958@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f1fed64e-bee8-469f-8a83-da8e76f9e958@sirena.org.uk>

On Tue, Mar 17, 2026 at 10:21:38PM +0000, Mark Brown wrote:
> Is "last added" last update to the series?  I did notice the order
> seemed to move at times.

It's when the series was first added to your tracking, which shouldn't change.
However, the sort is stable within each tier, so if a series changes tiers
(e.g. goes from "reviewing" to "waiting" and back), it may end up in a
different position relative to its neighbours. I'll keep an eye on whether
that's confusing in practice.

> Given that I'm using the queued thanks feature things sit in applied for
> a bit before they actually get pushed out and thanked, the sorting of
> thanked mostly followed from expecting applied to get moved out of the
> active list while I go through other things that might get applied.

I've now landed the 3-tier sort, plus a "queued" pseudo-state for exactly this
case. When you accept a series and queue the thank-you letter, it will show
with a different symbol and sort into the inactive tier alongside snoozed and
waiting series. Once the thank-you is actually delivered, it becomes "thanked"
and stays in the inactive tier. So neither queued nor thanked series will crowd
your active list.

The tiers are:

    active:        new, reviewing
    action needed: replied, accepted
    inactive:      snoozed, waiting, queued, thanked

> As a side note b4 is picking up replies I send with other mail clients
> but doesn't track them as changing series state AFAICT.  I'm not sure if
> this shouldn't sort into inactive (as waiting for reply) but it's going
> to be more a case by case thing I think ("Thanks for doing this, let me
> test!" vs "Could you clarify these things?").

Yes, I'm not sure we can reasonably make the right call here. I would
recommend judicious use of the "snooze" action here. :)

Regards,
-- 
KR
