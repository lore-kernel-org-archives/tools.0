Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D878A86342
	for <tools@linux.kernel.org>; Wed, 15 Oct 2025 16:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760547511; cv=none; b=OXCHW+mt9E/Ld+aXFfXuu42AbGoXbzREcdYJ/ZLPViNY8bkX4+uSkEPbOVn1AF+IX6jWBrzU+TI/9PbjvIHJbfD6szU96XISBa4tzhR8CFry39nckhoVO05a6+EDkqlg0/x9FjRr4NhPneQZxHDuBkz/px8kVLlWIMHhWOdR4X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760547511; c=relaxed/simple;
	bh=IuMLSIuKdb1RLGrn+vnMPImZWPnYR1Zy6iICDuzd8B8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bw2UaMlJQaU03j4faoP9viTVzSXVGjfNASZY6O0V7aqdHCEWfePG0FjHssEmehGh24EKTk49QQOkY+XW5Q0UyTo3SKCqES7KTrhFKFAalUwnJqwECDKV5oMKy/tmCS2gn2dU7bvg5U4TK6nCM5s+neqIA07gswx7IzfdKxU5qOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=lVNXA1AX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="lVNXA1AX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 598D3C4CEF8;
	Wed, 15 Oct 2025 16:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1760547511;
	bh=IuMLSIuKdb1RLGrn+vnMPImZWPnYR1Zy6iICDuzd8B8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lVNXA1AXduh8IJOGZ/njrwOrzBFS7hiThZ9b8PUFLxuvRPne5Un7nKK6BiJiHCWOk
	 GrX0nc+AajKJFgb+alP/gnq/uxSjDHZjkjhPLr0xxFjQE/6Y2U7i4RhuYpJ10+rBDN
	 OQdrVxt6ZLgfowaJ7BKSCvVv1quvyc9Mk/uKjAJM=
Date: Wed, 15 Oct 2025 12:58:30 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Mark Brown <broonie@kernel.org>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Linus Torvalds <torvalds@linuxfoundation.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, users@kernel.org, 
	tools@linux.kernel.org
Subject: Re: [workflows]Re: In defense of Link (was Re: [b4] initial "b4 dig"
 to supplant Link: trailers)
Message-ID: <20251015-rebel-turkey-of-piety-a5f8be@lemur>
References: <CANiq72ka1y0YXysRQtuqnzc0i5FSbrGjKwprrXQpozwDOV3khA@mail.gmail.com>
 <aadb0515-4024-40c0-8024-fcdd029a3029@sirena.org.uk>
 <2991ae006906913c10715a9673ac53a4ea557728.camel@HansenPartnership.com>
 <20251015151447.GD3168635@noisy.programming.kicks-ass.net>
 <20251015111816.728bfda7@gandalf.local.home>
 <20251015155346.GA3287345@noisy.programming.kicks-ass.net>
 <20251015115917.5e031880@gandalf.local.home>
 <20251015160622.GB3287345@noisy.programming.kicks-ass.net>
 <9a07d307-ede5-404f-aff0-9f28f591e0aa@kernel.org>
 <20251015124408.1cc44dcc@gandalf.local.home>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251015124408.1cc44dcc@gandalf.local.home>

On Wed, Oct 15, 2025 at 12:44:08PM -0400, Steven Rostedt wrote:
> On Wed, 15 Oct 2025 18:15:37 +0200
> "Vlastimil Babka (SUSE)" <vbabka@kernel.org> wrote:
> 
> > Such personal preferences could be encoded in MAINTAINERS with tooling doing
> > the right thing, perhaps.
> 
> I was just about to reply saying the same thing!
> 
> Yes, could we have a way to denote in MAINTAINERS if a maintainer wants the
> entire series or not?

I can't see it working reliably:

- if there are multiple maintainers for a subsystem, how do we indicate which
  one wants which preference? MAINTAINERS is a rigid non-nested flat list.

- tooling will take years to catch up to this, especially considering that
  this affects *sending* tools, not retrieval tools. B4 has been able to send
  series for a while, but it is only used by a fraction of contributors -- the
  vast majority of patches are submitted using plain old git-send-email.

- changes to MAINTAINERS take a long time to apply globally and many people
  will routinely use MAINTAINERS from an older checkout.

From my perspective, the right way to do this is to send the cover letter to
all, and then patches individually (this is how b4 does it). Fetching the rest
of the thread is trivial for me in mutt, I just have to press "4" on the
message:

    macro index 4 "<pipe-message>b4 mbox -fo ~/Mail<return>"

I'm not suggesting that everyone should switch to mutt and have their messages
in local ~/Mail maildir, but I think it's an approach more likely to work than
trying to shift this to the contributor side of things.

-K
