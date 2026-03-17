Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E3824293C
	for <tools@linux.kernel.org>; Tue, 17 Mar 2026 23:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773790630; cv=none; b=G6aS3K5IaRqZvmkVVBNj06+UiUV8JkmxSmi7n47MmZL6FTCFjRAx/GPJ+dl1AuP8rHyUf/Lo5GoPKmBTXq9tcHymUd09PQgyYvdAbYSdwdqRsJB09i3oC2/0vJbzFH7zcJZErX98lxIHhNZF68ju6tiaqgAfNxv+qnQh6axl000=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773790630; c=relaxed/simple;
	bh=LGfAbd5zAKjPUHiDZJAh5qszHhHD9/N3rOIK2m23UV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pep/hWj4a5hLNAyxDKmPfKV9LxtEzhJi8TKvAOpwxHVmHGt1W6Q+0YeL4Tp3QkJfuvONpa5aU8tPvyxfMWgpUWMt0yP8gYUCCqFuK5AZYzxS3DOfW7LI/fdpw3Toh/f4ojEaKh6W/4qT9nJkcOiD/ZaTAqQu1d7EeAZBzOkU43E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q9563aZ3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q9563aZ3"
Received: by smtp.kernel.org (Postfix)
	id E9CFEC2BCAF; Tue, 17 Mar 2026 23:37:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DF7EC4CEF7;
	Tue, 17 Mar 2026 23:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773790629;
	bh=LGfAbd5zAKjPUHiDZJAh5qszHhHD9/N3rOIK2m23UV0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q9563aZ3lsuTd5YB77XLuon3KAYOYPPtL+Cesu0ogLImNMECssk2v+pbE2dzroJYn
	 TLqmw5cA27m6LFVOHEIsgLccQE5rCGbgTNsFuESFAg3FetiGxM2+873yKw8yK4s0B1
	 fQTca2tGkLSur00vs6PGFUTjxXJ7sbJhUoY1tM5ezn6Ll0/pSKmaiSG6Of6xqHsGr4
	 MKYzs0UMhgMGh3rO0LfLrJz/eqWmwpVcfk+kePeXbW8uh5xjPu0UWRkE0ow3pdWzjY
	 Ul6bzqprykKBgyiPZZoDR4TaA5AwPdFOV/vfi62hidOuEDB4KA4URwd4BseaWZpUBz
	 bXeCvjHMWPezw==
Date: Tue, 17 Mar 2026 19:37:08 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: b4 review available in master
Message-ID: <20260317-majestic-efficient-raptor-59f17a@lemur>
References: <20260227-imported-aromatic-guppy-ad3dca@lemur>
 <87tsuffj7h.fsf@trenco.lwn.net>
 <87h5qffikk.fsf@trenco.lwn.net>
 <20260316-quizzical-raccoon-of-refinement-d88fdb@lemur>
 <87qzpieeb5.fsf@trenco.lwn.net>
 <20260317-starling-of-delightful-exercise-3472ce@lemur>
 <20260317-optimistic-impartial-kudu-deefac@lemur>
 <87o6km86zm.fsf@trenco.lwn.net>
 <20260317-crazy-belligerent-llama-a14ba6@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260317-crazy-belligerent-llama-a14ba6@lemur>

On Tue, Mar 17, 2026 at 06:39:54PM -0400, Konstantin Ryabitsev wrote:
> > So it's still behaving a bit strangely, at least that's how it seems to
> > me.  I tried adding comments to a patch, doing my usual trick of
> > trimming out stuff that is being skipped over.
> 
> You don't need to do that. Just find the stuff you want commenting on. We'll
> take care of the rest! :)
> 
> But, I'm able to reproduce what you're seeing -- trimming content doesn't do
> the right thing. Let me see if I can make this a lot more relaxed.

The current master should be a lot more forgiving when parsing your comments.

However, I am now curious to hear your feedback. The idea with the review app
is that you are not really sending an email, you're adding comments to code
and adding review trailers. The app will render and send that out for you,
trimming and formatting things nicely so you don't have to do it on your own
(I've noticed that many maintainers don't bother anyway -- there are emails
with a terse comment at the top and then a huge quoted bottom that is only
followed by their sig.

Is this rife for creating confusion? Will maintainers be fighting with this
and growing grumpy because it's not exactly like their email client?

Thanks for trying it out!

Regards,
-- 
KR
