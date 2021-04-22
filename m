Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A562F81
	for <tools@linux.kernel.org>; Thu, 22 Apr 2021 18:52:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0FFD861424
	for <tools@linux.kernel.org>; Thu, 22 Apr 2021 18:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619117523;
	bh=RuTA/k16YDFu6ZKojQzVVG7jVY60UDUHT09FZdubllU=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=k2I/H1c7MWAk5uj+LvM5OnvHEYJ+mX1SD0TH2lVrUvJa1NC2fxBvp9MCqOHQlprYx
	 DiGqem9gPqAGxV9zsepRsVmN571+ldcKbm1XhCFDOpUB4kPl46N3STjGg9Fub4xKH5
	 Kramx4R96pNG1H5e9450JevqNfP4xyC5GRhUliiHjwUYDlI/Hk+b89eDr82eXoKSpW
	 E6GYj9UhAIwRh7fWSTUaVc70mM+5J15xuCgJDJlHgHc5Vhy1RRqV8cQM06+C8wEJKE
	 QDJXJby08GGfK9M0ZLK8UkoU6I21JqkK7H5kNhXCjVNCs9JhwwVzkbNXS/j2A5Z1by
	 nFbypiiGledcQ==
Date: Thu, 22 Apr 2021 21:51:59 +0300
From: Leon Romanovsky <leon@kernel.org>
To: tools@linux.kernel.org
Subject: Re: backfilling threads with b4 (was: Re: [MAINTAINER SUMMIT]
 Rethinking the acceptance policy for "trivial" patches)
Message-ID: <YIHFzwXCDjWTLdA9@unreal>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <YID5xhy2vv45fnOv@unreal>
 <20210422112001.22c64fe9@coco.lan>
 <20210422125357.uuxprp6rqxewcdsr@nitro.local>
 <YIG43TuqmxU24evq@unreal>
 <20210422180540.hj6xs75sqlmnegs6@nitro.local>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210422180540.hj6xs75sqlmnegs6@nitro.local>

On Thu, Apr 22, 2021 at 02:05:40PM -0400, Konstantin Ryabitsev wrote:
> On Thu, Apr 22, 2021 at 08:56:45PM +0300, Leon Romanovsky wrote:
> > >     macro index 4 "<pipe-message>~/work/git/korg/b4/b4.sh mbox -f -o ~/Mail<return>"
> > > 
> > > You'll need to adjust it to point at where your maildir lives, of course, but
> > > that's the general idea. With it in place, you can hit "4" in the index view
> > > to get the rest of the thread (without duplicating the messages you already
> > > have).
> > 
> > Konstantin,
> > 
> > I tried the above and here the obstacles which I encounter.
> 
> This is probably better suited for tools@linux.kernel.org (cc'ing
> accordingly).
> 
> > 1. My emails are stored in Maildir. The mb2md script half-worked but ok
> > for the test.
> > 2. b4 didn't work if I tried to use lore link from the middle of discussion,
> > which is very common pattern to me.
> > 3. b4 didn't grab the discussions, so I got the patches, but didn't get and
> > won't get any interesting to me responses.
> 
> Are you sure you copied the command correctly? 
> 
> 1. It should automatically recognize when it's pointed at a maildir, so no
>    mb2md should be necessary. Are you sure you changed "-o ~/Mail" to be
>    pointing at your maildir?

I didn't want experiment on my main maildir folder so pointed to /tmp,
and didn't know that b4 recognizes format.

> 2. It's supposed to grab the message-id from the piped message, so you
>    shouldn't need to pass any lore links.

I didn't pass any links, just used as a "feed" one of the replies to the
series which I don't have.

> 3. Are you sure you're using "b4 mbox" not "b4 am"? The mbox command just
>    returns the entire thread.

Yes, I used mbox, but will retest it tomorrow, maybe I did something wrong.

> 
> Please feel free to drop ksummit and others on your reply.
> 
> -K
