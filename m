Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE262264AB
	for <tools@linux.kernel.org>; Wed, 18 Mar 2026 18:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773858675; cv=none; b=L2xZrEKrX+dzrQJnbRjcnd3qLfjtKOc07mI/g9NCgtXw7lbUBGEt63AaxSfBCxN7aQKc+/l5QKXhAC5onTd4TysB9glq/lSWSlDzMnqi/uamTAvKJAwjavaeVq294EyeiKje9Snv6uiBnOe7rNBtxEJ4tzju8XdEu3c/b9wSdgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773858675; c=relaxed/simple;
	bh=MHfIwDvTviu1mKnxoPOBERMUTcyFmvbOqUqjr1RYuA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=at11owr/IyP0B1EsOKgGqt0UEoKEqaxYOolnkOzJE+aUYjn7/eGLHOLLAC6gI3c2aIxd38Rw06Nfr1wKTQZxGzIclYBap7cgiAyuHr0vf0awEcYSZDK3pCd2WcbsLyprT6Y/EGAJY1H0D1i9kYbUM6TlCjCuWnmSsJSmjcpSXzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OL1gA33S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OL1gA33S"
Received: by smtp.kernel.org (Postfix)
	id 91016C2BCAF; Wed, 18 Mar 2026 18:31:15 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F0560C2BC9E;
	Wed, 18 Mar 2026 18:31:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F0560C2BC9E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 01F5A379;
	Wed, 18 Mar 2026 19:29:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773858596;
	bh=MHfIwDvTviu1mKnxoPOBERMUTcyFmvbOqUqjr1RYuA0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OL1gA33SigdHUCJ3nFi1Nyi4UWz6xahCofHpxn/IcfAWTMbl0jFYKKOI4upyE/Yhc
	 pRgjRelJfElZzPIHeI5NrKfg4Bue9f9sP/GoIwBwSvIQogp+Bjt2YqPQV8XigKgDDw
	 ZzD3P4JXpMjU9+gpv/VuhjQONoUcgJmt4eitOc8M=
Date: Wed, 18 Mar 2026 20:31:07 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Konstantin Ryabitsev <mricon@kernel.org>, users@kernel.org,
	tools@kernel.org
Subject: Re: b4 review available in master
Message-ID: <20260318183107.GL633439@killaraus.ideasonboard.com>
References: <87tsuffj7h.fsf@trenco.lwn.net>
 <87h5qffikk.fsf@trenco.lwn.net>
 <20260316-quizzical-raccoon-of-refinement-d88fdb@lemur>
 <87qzpieeb5.fsf@trenco.lwn.net>
 <20260317-starling-of-delightful-exercise-3472ce@lemur>
 <20260317-optimistic-impartial-kudu-deefac@lemur>
 <87o6km86zm.fsf@trenco.lwn.net>
 <20260317-crazy-belligerent-llama-a14ba6@lemur>
 <20260317-majestic-efficient-raptor-59f17a@lemur>
 <87se9x5blg.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87se9x5blg.fsf@trenco.lwn.net>

On Wed, Mar 18, 2026 at 10:47:07AM -0600, Jonathan Corbet wrote:
> Konstantin Ryabitsev <mricon@kernel.org> writes:
> 
> > On Tue, Mar 17, 2026 at 06:39:54PM -0400, Konstantin Ryabitsev wrote:
> >> > So it's still behaving a bit strangely, at least that's how it seems to
> >> > me.  I tried adding comments to a patch, doing my usual trick of
> >> > trimming out stuff that is being skipped over.
> >> 
> >> You don't need to do that. Just find the stuff you want commenting on. We'll
> >> take care of the rest! :)
> >> 
> >> But, I'm able to reproduce what you're seeing -- trimming content doesn't do
> >> the right thing. Let me see if I can make this a lot more relaxed.
> >
> > The current master should be a lot more forgiving when parsing your comments.
> >
> > However, I am now curious to hear your feedback. The idea with the review app
> > is that you are not really sending an email, you're adding comments to code
> > and adding review trailers. The app will render and send that out for you,
> > trimming and formatting things nicely so you don't have to do it on your own
> > (I've noticed that many maintainers don't bother anyway -- there are emails
> > with a terse comment at the top and then a huge quoted bottom that is only
> > followed by their sig.

What to trim and what not to trim is a question that will likely never
receive a single answer. I find it (slightly) annoying when people start
a conversation about a patch design in the text of the cover letter and
leave 1000 lines of diffstat below, but I find it more frustrating when
someone trims a patch agressively in their review and I end up not being
able to comment in my reply to both their comments and related parts of
the patch that they trimmed out.

The obvious answer is "trim exactly the way I would". I have had very
little success preaching that so far.

> This is just me, of course ... and I was very much experimenting with it
> as an alternative to my usual "do it in email" approach.  So one can
> definitely argue that I was simply holding it wrong.
> 
> If, though, the intent is that one inserts comments and leaves the patch
> text alone, I think that the interface *really* needs to not let you
> mess with the stuff you're not supposed to change.  If one were to
> implement this as <obnoxious>an Emacs mode</obnoxious>, that sort of
> constraint could be implemented fairly easily.  If you're throwing
> somebody into an arbitrary editor, it's going to be rather harder.
> 
> I tend to be pretty careful about which text I trim when composing
> replies.  It's pretty helpful to, for example, be able to do something
> like:
> 
>   > something from the patch
> 
>   Here you're doing X...
> 
>   [...]
>   > something rather further down
> 
>   Here instead it's expecting Y, WTF?
> 
> ...so I would be less than fully pleased with an interface that prevents
> that.

That's a style I sometimes use, usually not in the first e-mail reply,
but quite often when the mail thread is 10 replies deep and it becomes
clear large areas of the original patch are just not relevant to the
discussion any more.

> But perhaps I'm a dinosaur who just isn't using the tool correctly.
> 
> > Is this rife for creating confusion? Will maintainers be fighting with this
> > and growing grumpy because it's not exactly like their email client?
> 
> Some surely will, see above.  But that doesn't necessarily mean you're
> not creating a better workflow in the long run.  I think we need to play
> with a lot of ideas, and I'm really glad you're doing that.

-- 
Regards,

Laurent Pinchart
