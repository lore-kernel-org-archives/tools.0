Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498992FFFBB
	for <tools@linux.kernel.org>; Wed, 15 Oct 2025 18:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760553656; cv=none; b=VPmSI5SMplmW50BomO8kknmZlORYWhApHWjGTTJmiViJzGY2QezxLJK4BPzeT4wM1TkGZMBX/tIzXISWUpCXAH1bjYpajYO6pcsgn5rw8tV9piq6plb7zwnHw6fhpoVho/X/SCI7XKYW6bL7HgmVKcfQmGkNCKvdm2i8hTRUmSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760553656; c=relaxed/simple;
	bh=Bvrdz9envEP/F5rXltdu+InX+EZ01NYTcUCxwSbRpQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DucXEZJ+/soUhgC8D18y2ZTJGCxFVw1/ddQdqO12cOxZApCN+P0ldvSp77w+gThSYPLdk7lTKwQDxlM+2TkF6IAS5WW+PN1UVvZUrLwA5Xq6idrHr3yIxYVuhVqUvpC4OXAxgClFY1GJ+BuPGnox4P8e9TY/cNNOwuIZUzAFYps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JLnlaCpD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JLnlaCpD"
Received: from pendragon.ideasonboard.com (87-94-110-32.bb.dnainternet.fi [87.94.110.32])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 6B455E92;
	Wed, 15 Oct 2025 20:39:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760553552;
	bh=Bvrdz9envEP/F5rXltdu+InX+EZ01NYTcUCxwSbRpQM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JLnlaCpD4Qx5z9awfh2wLwLAS8FQqK2AjjEk0CgXfJc2m2tl9d8iseWPtEXtmgGRI
	 tGClRqgqrOaxMx9k9HlEb/KuC5leMR+Rxg4H+zvoloH6JKfbDf6jCDtWf0YFVito2F
	 O4+7jr9IJYW4WhDjyHlYFbbYJ65XVFhTwmMjNpss=
Date: Wed, 15 Oct 2025 21:40:43 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Mark Brown <broonie@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Linus Torvalds <torvalds@linuxfoundation.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users@kernel.org, tools@linux.kernel.org
Subject: Re: [workflows]Re: In defense of Link (was Re: [b4] initial "b4 dig"
 to supplant Link: trailers)
Message-ID: <20251015184043.GB30747@pendragon.ideasonboard.com>
References: <CAHk-=whSShtPG1_+02Cc4yDuEJxVqX=G8tAx0gW7UjA7cuBp-w@mail.gmail.com>
 <CAMuHMdWxMhM1J3zHC8OkN_fd8XsJPFA6jM_3JFU=ySKhnX6ESw@mail.gmail.com>
 <CANiq72ka1y0YXysRQtuqnzc0i5FSbrGjKwprrXQpozwDOV3khA@mail.gmail.com>
 <aadb0515-4024-40c0-8024-fcdd029a3029@sirena.org.uk>
 <2991ae006906913c10715a9673ac53a4ea557728.camel@HansenPartnership.com>
 <20251015151447.GD3168635@noisy.programming.kicks-ass.net>
 <20251015111816.728bfda7@gandalf.local.home>
 <20251015155346.GA3287345@noisy.programming.kicks-ass.net>
 <20251015115917.5e031880@gandalf.local.home>
 <20251015160622.GB3287345@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251015160622.GB3287345@noisy.programming.kicks-ass.net>

On Wed, Oct 15, 2025 at 06:06:22PM +0200, Peter Zijlstra wrote:
> On Wed, Oct 15, 2025 at 11:59:17AM -0400, Steven Rostedt wrote:
> > On Wed, 15 Oct 2025 17:53:46 +0200 Peter Zijlstra wrote:
> > 
> > > I have sufficient pending email such that any extra effort just means I
> > > won't bother.
> > 
> > I'm curious. Why do you need to see the entire series? Would a cover letter
> > and the patches that affect your code be enough?
> > 
> > Because seriously, I've skipped several series because I look at one or two
> > patches and say to myself "why am I Cc'd on this?" and skip it. Only later
> > to find out that patch 18 affected by code.
> > 
> > It's much easier to find the entire series from a single patch than it is
> > to find "what touches my code" from a large series.
> 
> Because when I see a single patch, I end up wondering WTF does it do
> this, and then I have to go find the others, which I don't have, I get
> grumpy and either NAK or just yell. And no, the cover letter rarely
> answers the questions I have.
> 
> Finding where or which patch is directly affecting 'your' code is mostly
> trivially done by scanning the diffstats.

I've been similarly annoyed at partial series in the past, but that was
because I wasn't CC'ed on some important patches, not because I didn't
receive the whole series.

When doing tree-wide or subsystem-wide refactoring, it's typical for the
first patches to rework/improve/extend some APIs, and then for the
remaining of the series to address drivers one at a time. The cover
letter should explain the rationale. I've been CC'ed multiple times just
on a patch that touches a driver I maintain, without being CC'ed on the
first patches in the series that show what's going on. That's annoying,
even if I'm CC'ed on the cover letter. On the other hand, being CC'ed on
50 patches touching lots of drivers in very similar way causes lots of
noise.

In such cases I try to adopt a middle ground, CC'ing everybody on the
cover letter and the core patches, and CC'ing only relevant people to
the driver patches. Is this something you would find annoying, would you
prefer always being CC'ed on a full 50+ patch series ?

-- 
Regards,

Laurent Pinchart
