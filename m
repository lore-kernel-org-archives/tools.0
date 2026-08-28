Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B130332604
	for <tools@linux.kernel.org>; Fri, 28 Aug 2026 14:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787926755; cv=none; b=RkQonqGxZNI/6j0RPyhtZEuIkFL/rHdsZtyt8aKLZf5I1oI+5m8JoKWTQKDm++pxFkrzzoW6XMjkHOX7+MRLxeACi3pWEiXm2M+iVFB/1dwrkA3n+ZzFnro/kdykXIJk6HMIHwq7ZP3y/65ZQhcgzI+1N80M3feQT8JgAQMBE5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787926755; c=relaxed/simple;
	bh=rst6MOBEzb9PwRE9R9b2vOXcE05YdqWjuqHRu6aSfck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pzXBNkiYMzYesl4NXCtL6SdTL29X1+to29FV1EWJ16m86EvtV3Ld5D3xPuHgtdcC0USPLCT4e7uYXR1azxwG3dPogSUf+Nj4LqXBpRo5/qJWT45IsdDfIZlqdVs9YmovpnOup4xiCsVdyKbf7zg6/3bij1gTx8fOK9lK07iDZ5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1QTruvqQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1QTruvqQ"
Received: by smtp.kernel.org (Postfix)
	id 2DCC11F00A3A; Fri, 28 Aug 2026 14:19:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDBBC1F000E9;
	Fri, 28 Aug 2026 14:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787926752;
	bh=U014YUk0LgPyapStXWL7xolSrJvlD6k2isdt8o9m8gs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=1QTruvqQEaH9iS0jGIH1mjwjSFOEo72Sch7oS8VhzefQNb6ccyOi9Bvj3ZKgZrscZ
	 Ix2k1RcWMeMvrr3XUYvgRNUAYca6r52lFMvnjqDlcI7yRo2mIh2CPkyzoPihFKZzD8
	 hrx+RP+mT5kMqhFzHPcSS/8bMNInd2mjLNmYNbpM=
Date: Fri, 28 Aug 2026 10:19:09 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Vasileios Almpanis <vasileios.almpanis@virtuozzo.com>
Cc: tools@kernel.org
Subject: Re: [RFC] b4 review: an "inbox" view for series addressed to me
Message-ID: <20260828-enlightened-devious-chameleon-22f84a@meerkat>
References: <f8ed2026-2b7b-4001-a591-0a0914b94796@virtuozzo.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f8ed2026-2b7b-4001-a591-0a0914b94796@virtuozzo.com>

On Fri, Aug 28, 2026 at 02:42:35PM +0200, Vasileios Almpanis wrote:
> Hi all,
> 
> I would like to propose (and implement) a discovery feature for b4 review
> and would appreciate feedback on scope and design before I write any code.

Hi! Happy to discuss this -- but this is already a planned feature. Check
plan.otl, there is a large section titled "auto-consume a public-inbox
archive".

> Problem
> ---
> 
> b4 review tui only shows series that were explicitly added using b4 review
> track. Finding what I'm expected to look at is still done manually. Open my
> client, check my messages, find the message-id, run b4 review track
> message-id.
> For someone CC'd as a reviewer/maintainer on a handful of areas, an inbox of
> series that were addressed to me and that I haven't dealt with yet would
> remove
> the above tedious work.

Correct, though notably it's less tedious when patchwork is present. However,
this needs to work without patchwork as well.

> 
> Proposal
> ---
> 
> A new b4 review command (b4 review inbox) and a keybinding in b4 review tui
> that:

I had a different solution in mind -- instead of extending b4 review, we have
an entirely different tui that I was calling "b4 maintain" in my head. There
are three main categories of things that a maintainer needs to keep an eye on
-- incoming series, bug reports, and general correspondence. The maintainer
tui would give an at-a-glance overview and additionally allow for agent
integration as a background task:

- analyze bug reports, check for duplicates, assign priority
- automatically feed new and updated series into "b4 review"
- summarize discussions and bubble up threads that clearly need a decision

Basically, avoid the firehose and help maintainers not dread opening up their
inbox in the morning.

> 1. Queries public inbox for recent series roots addressed to me:
>    tc:<my-addr> AND NOT s:Re: AND dt:<lookback>.. filtered client-side to
> cover
>    letters / patch 1. The set of "my" addresses would be configurable
>    (b4.review-inbox-days, b4.review-inbox-addrs, falling back to
> user.email).

This is already implemented in korgalore, so the plan is to reuse that either
directly or by shipping a lot of this functionality into the existing "ezpi"
library.

> 2. Annotates each series with best-effort state:
>    - "replied": a Reviewed-by/Acked-by/Tested-by or any reply from me
>      exists in the thread;
>    - "in tree": patch-ids found in a configured upstream ref.
>    - patchwork state, when the project has a PW instance configured.

Okay, these are all easy heuristics.

> 3. Offers actions: track, open thread, refresh.
> 
> Open questions
> ---
> 
> - Is tc: the right signal for "I'm a reviewer", or should it also
>   consult MAINTAINERS / get_maintainer.pl?

korgalore attempts to approach this with "kgl track-subsystem".

> - Is there prior work on something like this or similar that I should
>   align with?

Yes, both prior work and a planned feature. :)

Thanks,
-K
