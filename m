Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903AC3B42F2
	for <tools@linux.kernel.org>; Mon, 27 Jul 2026 15:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785166684; cv=none; b=XuYXn1k+yElMW9yeJO21oNqQw0dudPOBTga9pceNQ1gCQ22mnTO53+FJh6U5lNZ8wrNlB0jhjNlhANv8VvQ9EVZD83ZHY51DHZh8n3rUI1oBoQfPfHCr338X5He5LmKvW+1Lz+SBUn4be+OiFWKga7gdzR9slSwRIQ7KkbmG7nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785166684; c=relaxed/simple;
	bh=crHUYEWLlD4NIUVo9ne195plJ6jPElanPMTH28cbk8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WyQ1z8TdF3gTrh2xDoWJyt/4oHYP4JHdwQwDtVNf/pL9m7vlEJ0J7W2g7VlI5x27GpQvGUoYNuorWPq9miWWs1y1ISTXHcegYmSxReY9RzxDeTLlFzcPeGh0quyz4aAok1BIzyVGyuaSoGprm+xarBOMyrNFWlH1IkdKWg6nOb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Z2Yac5TN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Z2Yac5TN"
Received: by smtp.kernel.org (Postfix)
	id ED5981F00A3A; Mon, 27 Jul 2026 15:38:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CD0F1F000E9;
	Mon, 27 Jul 2026 15:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785166681;
	bh=goEwTfIWuRDgtfj+hMOWlSgdt5OTK3TpY7V7+tCxCbc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z2Yac5TN0GWJ9sg3m9boUq2H3sbdyu7VKnaDybxE62qw6Zz3/qwlpOmZ1YHLOnh/+
	 ywT+GSsKuVQaqQlrr6MOCtcGu1T+gN2sRjovwTQ9fAagHHrw7wvgFeNWQldKL4byHr
	 bI7fgYrGv8TPOI+ZpmRZLWlrW3l3LBRrcAJWex64=
Date: Mon, 27 Jul 2026 11:37:59 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@kernel.org
Subject: Re: b4 review surfacing updated serieses
Message-ID: <20260727-innocent-zippy-sambar-51cfe4@meerkat>
References: <b356bccf-8e14-41da-8369-53eb442d0f30@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b356bccf-8e14-41da-8369-53eb442d0f30@sirena.org.uk>

On Thu, Jul 23, 2026 at 01:38:38PM +0100, Mark Brown wrote:
> One issue I have frequently with the UI for b4 is that it's not great at
> surfacing serieses which have new versions.  There's nothing in the list
> of serieses that says that a series has a new version, they stay sorted
> in the list with whatever date they arrived and you can't see that a new
> version is there until you actually highlight the series.
> 
> It also doesn't seem to reliably move things out of "waiting for new
> version" when there is a new version.

I've reworked the upgrade flow on a branch (feature/has-newer-first-class)
to cover both the waiting-upgrade awkwardness and the stuck-partial case.
Please give it a whirl -- it should be safe to try/back out as it doesn't
change the db schema. I don't have nearly as many series being reviewed as you
do, so I can't fully test it beyond what's in the test framework.

Specific changes:

Upgrade is now gated purely on a newer version existing, not on the series
state, so you can upgrade straight from waiting -- it archives the old branch
and drops you back into reviewing. A series with a new version also gets a
dedicated "up-arrow" marker and pops back up into the active list instead of
sitting at the bottom. There's now also a special "up:" filter for 'l' to show
just the series for which an upgrade exists. I dropped the old implicit
auto-upgrade-on-update while I was at it -- upgrading is now always something
you trigger, so hopefully there are fewer surprises or stale states.

Same change unblocks the partial case: [u]pgrade should no longer refuse
partially-applied series. The partial label itself can still linger after a
revert -- I didn't auto-clear it, since a revert leaves the commit in history
and guessing is worse than a stale label. Easy to add an explicit "reset
coverage" action if it's actually annoying.

I was hoping to get 0.16 out, but these look like real quality of life issues,
so it's best to get them working better before we invite others to try the
review features.

Thanks!

-K
