Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC2341360C
	for <tools@linux.kernel.org>; Wed, 10 Jun 2026 15:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781106841; cv=none; b=DbjsyQTKxtGdtFxr41LEf6cz49RSAG5iw1W07ll4qAilSTShJ/AB47+GUmdXLzHsxGS7rnFgDVi3/dRWSzpUwOF994ihtOGRFwcF+mNk/P9TbqEAfIsBGKvedG5xKfxEu6Q0aYOCBaroINowBUUrg1vL2pRsPkcovi3ApDeKIRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781106841; c=relaxed/simple;
	bh=Ba27PYfSOmG+Eu7Lrd3NyH7YACpY7tS6tEMc2a7RjSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I8U5mj/+nTYOaWHtmquWsr1/z87+JDYWVOpUdeE3YpzS1gwQ3UYtai8VrIcPjiFd1p9n2On35GTjdByMggevAFP9t1KlPQ8k4pFOMzQ3DPFcemaDWfOTiDdeCcD8zKTx6LPc/dGCEZM7wSGHHjjCgM4yu7WgddVbZU+V2njHT3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=lgMVCXJ8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="lgMVCXJ8"
Received: by smtp.kernel.org (Postfix)
	id 3F5541F00898; Wed, 10 Jun 2026 15:54:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF4E41F00893;
	Wed, 10 Jun 2026 15:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781106840;
	bh=/eqESjBhq9GwaE5SAJknHm5hf5TarZMwPLUeSQpk5R0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lgMVCXJ8vtbZhl+R/XmxepcAunWAI0RX4cPygAfhev4J0DQi1tRVXg7JLfZ8LG0p7
	 ibXKLcpO4ppXE/wjnPk+G0ZcbPQG9jwL+dhHmPQ51Nm/PHO1XHbSbRZxBeJDO2uk/S
	 8PFkVlPNa4rLQppY6BrVqu/Lw5AjyniS9+zrTkyA=
Date: Wed, 10 Jun 2026 11:53:58 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@kernel.org
Subject: Re: b4 review workflow issue with partially accepted serieses
Message-ID: <20260610-cocky-unstoppable-myna-603f17@meerkat>
References: <afk5QvNAQDxFCbvT@sirena.co.uk>
 <178104250404.112711.2880594121343252200.b4-reply@b4>
 <ailGd8akixhx_GHg@sirena.co.uk>
 <20260610-influential-wolverine-of-improvement-f01d0d@meerkat>
 <aimB2DACiXv6MIQk@sirena.co.uk>
 <20260610-premium-congenial-beaver-2af169@meerkat>
 <aimGrsvLkQEHXmgV@sirena.co.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aimGrsvLkQEHXmgV@sirena.co.uk>

On Wed, Jun 10, 2026 at 04:45:50PM +0100, Mark Brown wrote:
> > Ok, thanks for confirming. So, a partially accepted series falls in these two
> > workflows:
> 
> > - waiting for next revision; a v+1 should wake it up and put the series back
> >   into review mode; additional patches may be accepted from follow-up
> >   revisions (partial+more)
> 
> > - done and dealt with, thanks sent, series archived; a v+1 should be
> >   completely ignored (partial+done)
> 
> > I'll see if I can disambiguate these two workflows.
> 
> Yes, both those flows exist.

OK, looks like this was already mostly working correctly, just needed a logic
bug fixed. You should be able to send thanks from a partially accepted series
and then archive it.

Let me know if that's fixed for you.

-K
