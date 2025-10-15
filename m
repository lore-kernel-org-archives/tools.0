Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8281B251793
	for <tools@linux.kernel.org>; Wed, 15 Oct 2025 16:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760544396; cv=none; b=cocl5bPEQC7Po1v3GpLujDmCIXlFYBueQc8a+dGUF0ds0QoYzq9sqs5xonggO4L7CEjFlEiw0y41bIszSQSXWmBZjlAQ63WChslsVTBg9NSX4zRZpP0f87H9FjNi3wOiOjsAReIOBylc3haJq+qoMeeMlbF7xuskzQZH3kyVjJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760544396; c=relaxed/simple;
	bh=bpIOLitth5rfQbqEzUMJdeW8MmdKM0usULk8Pvy4NRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EUPPj+fl12wGuf9z4qbTjqJML6wJ2bWcj/nBAHtI9wj5amyqIgcesYFQV8KyLHcKlEGMg0L3iVja7nMJ5inZhDY/4cOeERuPlQs4KapA0OZjBT1PT31x4tx0GD6n7EpgIVQfDdc8NPyOBY18VSCTDA2xr7c5VkmovL1XGggGzmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=qhk0ncmX; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="qhk0ncmX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=y7kObXlt8tlowJMfrLUo+1DofxKXLacdfUSdkjRwFfo=; b=qhk0ncmXW37JKfrppqNC3BWZYx
	1VCab6wEshLp8QgtMEM09+rYIPWO7t2GMJqjdsTYaPKBW1C/0h2hl1JTr0s1Sf6DFkWgxdTbneaQX
	PzzS7vnwiwjwQ7n+P4TA+kz0j3JT+ZXdVB0RJpm7RUPxV8W44fa0c3jv2RAIwlqXQXdcdOMDR4vch
	1CP5DGV1Rb3d+qlj7iWmOYTrlDpIoA5I35y73jvd7qpEx3YU2aMiTmfKBqpb/nTTkiQfObDK0uLK/
	aRAgk/y5Yr69bhj+hgNI55EEbQ+CcpsPHWQQwWMjVNscLKZiHjepQOr18Eqkh4xtsf3xXdht+ESmB
	rv9EFH8w==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v941A-000000062Z1-0UOu;
	Wed, 15 Oct 2025 16:06:25 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 31193300413; Wed, 15 Oct 2025 18:06:23 +0200 (CEST)
Date: Wed, 15 Oct 2025 18:06:22 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
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
Message-ID: <20251015160622.GB3287345@noisy.programming.kicks-ass.net>
References: <20251013081536-mutt-send-email-mst@kernel.org>
 <CAHk-=whSShtPG1_+02Cc4yDuEJxVqX=G8tAx0gW7UjA7cuBp-w@mail.gmail.com>
 <CAMuHMdWxMhM1J3zHC8OkN_fd8XsJPFA6jM_3JFU=ySKhnX6ESw@mail.gmail.com>
 <CANiq72ka1y0YXysRQtuqnzc0i5FSbrGjKwprrXQpozwDOV3khA@mail.gmail.com>
 <aadb0515-4024-40c0-8024-fcdd029a3029@sirena.org.uk>
 <2991ae006906913c10715a9673ac53a4ea557728.camel@HansenPartnership.com>
 <20251015151447.GD3168635@noisy.programming.kicks-ass.net>
 <20251015111816.728bfda7@gandalf.local.home>
 <20251015155346.GA3287345@noisy.programming.kicks-ass.net>
 <20251015115917.5e031880@gandalf.local.home>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015115917.5e031880@gandalf.local.home>

On Wed, Oct 15, 2025 at 11:59:17AM -0400, Steven Rostedt wrote:
> On Wed, 15 Oct 2025 17:53:46 +0200
> Peter Zijlstra <peterz@infradead.org> wrote:
> 
> > I have sufficient pending email such that any extra effort just means I
> > won't bother.
> 
> I'm curious. Why do you need to see the entire series? Would a cover letter
> and the patches that affect your code be enough?
> 
> Because seriously, I've skipped several series because I look at one or two
> patches and say to myself "why am I Cc'd on this?" and skip it. Only later
> to find out that patch 18 affected by code.
> 
> It's much easier to find the entire series from a single patch than it is
> to find "what touches my code" from a large series.

Because when I see a single patch, I end up wondering WTF does it do
this, and then I have to go find the others, which I don't have, I get
grumpy and either NAK or just yell. And no, the cover letter rarely
answers the questions I have.

Finding where or which patch is directly affecting 'your' code is mostly
trivially done by scanning the diffstats.
