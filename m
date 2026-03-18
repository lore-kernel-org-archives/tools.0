Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9323CD8C8
	for <tools@linux.kernel.org>; Wed, 18 Mar 2026 16:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773852432; cv=none; b=HXqjofSvJL8fcsZfoZtnyN/mP8lwMe53VeTViVzirt7ZqKeDZVwfCGoYhzBU36ot/+yPfI3idTcCsXUbnLkBd4IgpRC3AleBP4mlY4f59RfleDTIzF0cc3hzh6/lVJj1QeUmqu9oYvGRczryBT2t1TyGpVdoiCpPlzk0M3vsfyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773852432; c=relaxed/simple;
	bh=uw/hkCaJc7RjqK9L7QlX6tKqg26UKi/oOmHlQhIYTg0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=miIcAQ04mqD4GANtYc27LNcQQEvmFV+kE8Blxq0VIe/QQe/R557eOd2I7PjNbnK1wLZ5u56i9bc+v2sZjG+B8o8UtlinTc/rppEFOhd4kJ4TCi52CdckBX1opPgizyWTKAvGZAY66R615l2Kp6AgaIGP6ml91/4qXDW3Ke5oWoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Ds1qkUYR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Ds1qkUYR"
Received: by smtp.kernel.org (Postfix)
	id C8B4BC19421; Wed, 18 Mar 2026 16:47:11 +0000 (UTC)
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6BADEC2BCAF;
	Wed, 18 Mar 2026 16:47:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6BADEC2BCAF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 82A9540423
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1773852428; bh=7wRxzMTiFj3nDARBpZlwcAJsGCZpSA5pWOOhdsJkzIw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Ds1qkUYRGLk5+iGohAlnP3DWYTRg0nUEIXGsl9zRfH2BOUmjfAyleWEvLGNgInAOX
	 v0RXTHkMYgSR9XBT5iA8YgV4XQFyj5L5nmXed+jQCwRT75+rJb8pLJaMztst8sdwkf
	 0lbhzgZJ3CGBjDkIs7ZKxN8gE5NGoNfM8GHWokMJVJ7gUdDRV5EfqPEhcSRlU7b3cC
	 7X/6nX6VuPBMXMQ3k5WIP1I1CtIgKnt8sFG7W0yDjPgFt0AeDRu6LavVhv7YasCkmw
	 YWT6FXixWspa8VUkaoRV76nDFLdiy2X4DxbNBrDaC9ugoKF85fmeVEETjVqkz9tz8v
	 bLsJAgiqtRzRQ==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 82A9540423;
	Wed, 18 Mar 2026 16:47:08 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: b4 review available in master
In-Reply-To: <20260317-majestic-efficient-raptor-59f17a@lemur>
References: <20260227-imported-aromatic-guppy-ad3dca@lemur>
 <87tsuffj7h.fsf@trenco.lwn.net> <87h5qffikk.fsf@trenco.lwn.net>
 <20260316-quizzical-raccoon-of-refinement-d88fdb@lemur>
 <87qzpieeb5.fsf@trenco.lwn.net>
 <20260317-starling-of-delightful-exercise-3472ce@lemur>
 <20260317-optimistic-impartial-kudu-deefac@lemur>
 <87o6km86zm.fsf@trenco.lwn.net>
 <20260317-crazy-belligerent-llama-a14ba6@lemur>
 <20260317-majestic-efficient-raptor-59f17a@lemur>
Date: Wed, 18 Mar 2026 10:47:07 -0600
Message-ID: <87se9x5blg.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Konstantin Ryabitsev <mricon@kernel.org> writes:

> On Tue, Mar 17, 2026 at 06:39:54PM -0400, Konstantin Ryabitsev wrote:
>> > So it's still behaving a bit strangely, at least that's how it seems to
>> > me.  I tried adding comments to a patch, doing my usual trick of
>> > trimming out stuff that is being skipped over.
>> 
>> You don't need to do that. Just find the stuff you want commenting on. We'll
>> take care of the rest! :)
>> 
>> But, I'm able to reproduce what you're seeing -- trimming content doesn't do
>> the right thing. Let me see if I can make this a lot more relaxed.
>
> The current master should be a lot more forgiving when parsing your comments.
>
> However, I am now curious to hear your feedback. The idea with the review app
> is that you are not really sending an email, you're adding comments to code
> and adding review trailers. The app will render and send that out for you,
> trimming and formatting things nicely so you don't have to do it on your own
> (I've noticed that many maintainers don't bother anyway -- there are emails
> with a terse comment at the top and then a huge quoted bottom that is only
> followed by their sig.

This is just me, of course ... and I was very much experimenting with it
as an alternative to my usual "do it in email" approach.  So one can
definitely argue that I was simply holding it wrong.

If, though, the intent is that one inserts comments and leaves the patch
text alone, I think that the interface *really* needs to not let you
mess with the stuff you're not supposed to change.  If one were to
implement this as <obnoxious>an Emacs mode</obnoxious>, that sort of
constraint could be implemented fairly easily.  If you're throwing
somebody into an arbitrary editor, it's going to be rather harder.

I tend to be pretty careful about which text I trim when composing
replies.  It's pretty helpful to, for example, be able to do something
like:

  > something from the patch

  Here you're doing X...

  [...]
  > something rather further down

  Here instead it's expecting Y, WTF?

...so I would be less than fully pleased with an interface that prevents
that.

But perhaps I'm a dinosaur who just isn't using the tool correctly.

> Is this rife for creating confusion? Will maintainers be fighting with this
> and growing grumpy because it's not exactly like their email client?

Some surely will, see above.  But that doesn't necessarily mean you're
not creating a better workflow in the long run.  I think we need to play
with a lot of ideas, and I'm really glad you're doing that.

Thanks,

jon
