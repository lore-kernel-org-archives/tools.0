Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF262DCC07
	for <tools@linux.kernel.org>; Fri, 23 May 2025 13:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748008341; cv=none; b=a1BjSFEWd9JmcamrKIsZlrsRc9rYNwHMqNZkk4nWspdfZVAMP+wKptWB7mD3ffhxHEEsetoYe6KypdPBZ8b91tvmbugi2gjSfeelcyWNqWK/TCaupbV9Jg8oeKt03e0pE8+gSXgQtR2e/YUTPfeU4AffzjhjrY4+cZOP4qPyy5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748008341; c=relaxed/simple;
	bh=nxR0Y1VAvZM1P0jhga/j4tgURJx323JTR367qMQQJJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V4oSyijpItwmAG+zzEu+vVRRidFm0UdRGbflA9EeJdMS2GGBMa35dEvpd7SD80Dgct9rlmr4nQi5PB6OMXDXVmtG1OgbiwCsH3yQ2dwe04FIHW1iVmEY4nF1EGpe2WkiMkJ1v4wTZ3fSWT1fKWdEu3g8JSeriDEOsnSjSjr6foU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=s84Ydnwt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="s84Ydnwt"
Received: by smtp.kernel.org (Postfix)
	id 8B4A2C4CEEF; Fri, 23 May 2025 13:52:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 462E1C4CEE9;
	Fri, 23 May 2025 13:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1748008340;
	bh=nxR0Y1VAvZM1P0jhga/j4tgURJx323JTR367qMQQJJ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s84YdnwtYikPeIbWePj8b7VBHDLtiEa039lTlDH6jpuJi/oZX1TFqpYXw+tPUb662
	 o99xVyZhf/FercY+ImvFTUN1Lx1DKeYghOA5/62yWPb09kvTyLDMZeGFUtNVbFDPKH
	 2RajA8Vs7kNGGflghTtEkURHrvWD1UycGsjeSiN8=
Date: Fri, 23 May 2025 09:52:19 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: tools@kernel.org
Subject: Re: [PATCH wotmate v4 0/6] Cleanup, a fix and txt representation for
 trust path finding
Message-ID: <20250523-armored-doberman-of-sufficiency-ffe7a8@meerkat>
References: <20250519101429.1558947-8-u.kleine-koenig@baylibre.com>
 <20250520-resourceful-salamander-of-opposition-131c63@lemur>
 <fekxcrrrgoxu3ugecdyzc5nrlzfoa776dlyzjc6ger2mjmhry7@p3itqnu7tm34>
 <gnl4wd5opraaqx2iimdss22vwqqraex2jxo4rxxwblifooagjy@bdpwayn336en>
 <20250522-melodic-tunneling-crab-863ab6@lemur>
 <5l6vn4jjqf5pli7rmxn3s6lei2xxdw6yodos5qm7zhxv6acc32@bzrmqj4iwnuh>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5l6vn4jjqf5pli7rmxn3s6lei2xxdw6yodos5qm7zhxv6acc32@bzrmqj4iwnuh>

On Fri, May 23, 2025 at 03:30:31PM +0200, Uwe Kleine-König wrote:
> > I just pushed a big update that adds a --use-weak-algos flag to two commands.
> > It also adds a bunch of typing data, so we can use linters a bit better.
> 
> Would have been nice to split it into (at least) three commits, but
> *shrug*

Yes, I know I could have done it cleaner, but I had limited time and didn't
have a chance to work on properly staging the commits. Mea culpa.

> Then the split into make-sqlitedb.py and export-keyring.py doesn't make
> much sense and maybe we can also strip out the sqlite stuff completely?!

I think the main reason it's there is because we issue a bunch of queries when
looking for key relationships. The other reason is because I was planning to
set up a web service that allowed generating graphs on the fly using the
pre-generated sqlite db (i.e. "find a path between these two arbitrary keys in
the keyring). However, that never ended up happening and definitely won't
happen at this point.

> (I wonder if sqlite is a sensible option already now, I wouldn't have
> considered that at all but just pickled the signature info into a file.)

I don't think replacing sqlite is worth the effort, but if you find a better
option, I don't see why we have to keep it.

-K
