Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5852030BF67
	for <tools@linux.kernel.org>; Wed, 15 Oct 2025 15:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760543633; cv=none; b=FdHVcr/1LnbF/rQeM96/Io53oTS3QO4aqQyBn5BBttezp0bPB9NBzuo1f1V5YXl4aBFnWixQhO0OZQNUbIiZDKxRlELYoHI/9lwGIgoFIaDeo5CmtHs9nkPgsIFGZLuyKRSX4H6+Fomj3GFy+EX11Jv8vbyQxA06VG486O6Z+YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760543633; c=relaxed/simple;
	bh=qUM7OEikhTxtF+jhidu41eomXdXFdT30FMmNop6/WzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TcS0TOnaoEbJCw2KybBGM4h3F3awSFVo2mrpZfA01n6An/lWdDz8tZ9VUT5aSAxVgA/USnQzFtzOyZL1pEpM451OlpURUvbRlysIFnju/iqyNziUo6ZdsF7O3aI/98C86NcQmIIB+sBkkx+C8VRdYYGSRWQxqlxuYicFQxyc1ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=W5L7fL9j; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="W5L7fL9j"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=On6f3bVm7LycrVSfjXGsBRXSlb4R4ebSLe8HWImrbW0=; b=W5L7fL9jXP1Npd5Dezg1rQnl5O
	zVnJ4Am4TEdwmpKs5e1YXbfxWM7yGTm/ciGDvPcOdc/PuXjlGDbqJg9E3gy6OSNSUB8Ic5Ueerrg2
	EkvYjuJ4C7PBjUG92HkCSvOT47dMCOjN+1X/qfmY6ynlstEdPtXpzgqurZjF7JV7amD7ZhpXXCbzH
	SfEGxNUBmih44WDcEwgRghCU9Vw+dLChr0Vh1T5rx8FZurVcQu56NWC6/OAqreD6YwAnQ+gHt+lOy
	GzgsL/dGa9FFY3Torh2+NAxhQHBJ9qOHnAzxceATSl0/y/l9wwET0J13ndMF3p2yTrY02sR8mDMHI
	ZCFm4ReA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v93ov-00000001F3b-3wz3;
	Wed, 15 Oct 2025 15:53:47 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 8B23730023C; Wed, 15 Oct 2025 17:53:46 +0200 (CEST)
Date: Wed, 15 Oct 2025 17:53:46 +0200
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
Message-ID: <20251015155346.GA3287345@noisy.programming.kicks-ass.net>
References: <CABgObfY5agTRsB-bCqCYbA0erFn5cVbujtTNBiCti8g_68nCWg@mail.gmail.com>
 <20251013081536-mutt-send-email-mst@kernel.org>
 <CAHk-=whSShtPG1_+02Cc4yDuEJxVqX=G8tAx0gW7UjA7cuBp-w@mail.gmail.com>
 <CAMuHMdWxMhM1J3zHC8OkN_fd8XsJPFA6jM_3JFU=ySKhnX6ESw@mail.gmail.com>
 <CANiq72ka1y0YXysRQtuqnzc0i5FSbrGjKwprrXQpozwDOV3khA@mail.gmail.com>
 <aadb0515-4024-40c0-8024-fcdd029a3029@sirena.org.uk>
 <2991ae006906913c10715a9673ac53a4ea557728.camel@HansenPartnership.com>
 <20251015151447.GD3168635@noisy.programming.kicks-ass.net>
 <20251015111816.728bfda7@gandalf.local.home>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015111816.728bfda7@gandalf.local.home>

On Wed, Oct 15, 2025 at 11:18:16AM -0400, Steven Rostedt wrote:
> On Wed, 15 Oct 2025 17:14:47 +0200
> Peter Zijlstra <peterz@infradead.org> wrote:
> 
> > On Wed, Oct 15, 2025 at 09:50:48AM -0400, James Bottomley wrote:
> > 
> > > Absolutely.  But part of the problem is people who Cc different parts
> > > of their patch set to different people don't want to use the --cc
> > > global of git-send-email,  
> > 
> > I so wish people would stop doing that. There is nothing more annoying
> > than getting a partial series.
> 
> I disagree. I much rather get a partial series where I'm only Cc'd on the
> patches that I need to look at. If I get Cc'd on 20 patches where there's
> one or two patches that affects my code, I will most likely ignore the entire
> thing.
> 
> We have lore and b4 today. If you want to see the entire series, simply use
> that.

I have sufficient pending email such that any extra effort just means I
won't bother.
