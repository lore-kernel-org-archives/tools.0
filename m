Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C42D33E7
	for <tools@linux.kernel.org>; Wed,  4 Mar 2026 22:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772664019; cv=none; b=dACUtphLrfqQG4OK8xFAEu42HGGHu3I7oe8ZyFhdM3APJZOVzDUr0mIVvDBLoR44Kdu5a3rQOv2mgo/dshxlJ4lwo88YqMmKIGqCw/6d5mpPj0H/0BfhYaADKz/cXSyOSOkUje3Z/AfPijjAIXK2efyQkrT4prOJ0hWVRIWSZOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772664019; c=relaxed/simple;
	bh=BlCSp51sQA7NRKmEniL+IfwSNvPr5Joek0SLY7ianuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LOf8oq7ADZVUaoG6ajq+SztOnyDJdfhaaI2/7VfFagHVR4D7GfhnlfgPfg9V1vcol3/5hZviiX7MdsqLOLfLrTh6nLgI8LPWcCTFCSiGGaRTO/pRsT4ciO/2uEBOsmA4tlwa8Z/fB0tbfCP0SjEM8zrGWWQxAgX9fHWjVyqxl2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u0kTJdWw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u0kTJdWw"
Received: by smtp.kernel.org (Postfix)
	id 2FC0FC2BC86; Wed,  4 Mar 2026 22:40:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9E56C4CEF7;
	Wed,  4 Mar 2026 22:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772664019;
	bh=BlCSp51sQA7NRKmEniL+IfwSNvPr5Joek0SLY7ianuY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u0kTJdWwx40A7HUpknjDKnTD0sB5VkNRimeIK/rjeZ1uqIjHueJoHCKDVJQulGVs5
	 ZdT0BkfLYUcBF9TPtHjK3hVsDUZYhjbMgWPpN9KUl7BDr5R5LK5SdVP4vM/+vxwE15
	 zbaYi2/7sRu+3imYDqQUQIoi/5GWL4guq18IxjWhXbasT6r3s5CJqpaRrX0a/sn+ZS
	 ymu6IQTLAxOKcrh9/G8Z8lOVYiScRgFVg+210VqPiuDJ0DpjvgJ5u9y/s/uoeYAlsi
	 NXIfXCbB2aFNdQnoxpwXJGKuOx0EjZBDqLRSyjD/EDeLReMmnDDvyU+Cfo/6oO62Xv
	 74NmEUhlVXKsA==
Date: Wed, 4 Mar 2026 17:40:17 -0500
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: b4 review available in master
Message-ID: <20260304-keen-clever-cockatoo-a8dab6@lemur>
References: <20260228-unbiased-mature-beaver-680aba@lemur>
 <20260228-pasty-clerical-b87a92aead3c@spud>
 <20260228-ruby-hawk-of-valor-41f0b0@lemur>
 <20260228-aqueduct-nuzzle-c03be63e03af@spud>
 <20260228-arcane-mamba-of-refinement-6dba82@lemur>
 <20260228-poodle-of-wonderful-justice-acfab2@lemur>
 <20260228-gulf-mountain-5f935fdefaea@spud>
 <20260228-charter-keenness-1256807e458d@spud>
 <20260303-tactful-zippy-oxpecker-fbcadd@lemur>
 <20260304-deviancy-overlaid-e7947f09089c@spud>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260304-deviancy-overlaid-e7947f09089c@spud>

On Wed, Mar 04, 2026 at 09:38:09PM +0000, Conor Dooley wrote:
> I tried again today to use it but ran into some things flow wise, that
> prevented me from actually doing any reviewing.

Thank you for being patient!

> Firstly, with the patchwork pane, how do I determine which states
> appear?

Whatever patchwork says is "action required". Would it help to be able to
filter/sort by state?

> Most things get set by a bot to "needs ack" in the dt patchwork,
> but I only see things as "under review" or "new" in the pane. We use
> "under review" to mean the bot is looking at it mainly and "needs ack"
> for stuff that humans need to look at, so I need to figure out how to
> display things with that status. Pretty much this is "your default view
> doesn't match the default patchwork view (State = Action Required)".

Ah, the difficulty is that patchwork doesn't export custom states or if they
are "action required" or not, so we have to go by defaults. Would it help to
have a configurable way to define which states we should show you and which we
shouldn't? E.g.:

    [b4]
        pw-hide-states = needs-ack,some-other-state

I'm hoping we can get patchwork to have an API call to show custom states,
since they can be configured per-instance.

> Secondly, if I'm working from a patchwork, it'd be really great if I
> could reply to patches directly from the patchwork pane. 90% of patches
> I review (or more) I do not need to apply, so working in mutt is
> significantly faster than having to track, then open in a different
> pane. Related to that, being able to display the patchwork pane
> per-patch as an option would be a wishlist item to make this replace
> mutt for me.

OK, noted, I'll think about how we can make this easier -- like a pre-review
state in both tracking app and patchwork app that lets you view the patches
and follow-ups and reply, but not do a more in-depth review where you have to
apply the series locally.

> Oh, and I managed to trigger a formatting bug again, on 0.15-dev-54639

/o\

> 	MissingStyle: Failed to get style 'v2,1/2'; unable to parse 'v2,1/2' as color; 'v2,1/2' is not a valid color
> 
> after grabbing a series from patchwork
> 
> 	/stuff/b4/b4.sh review tui -i linux-dt
> 	Retrieving series: <20260212082105.1878720-2-sh86.bae@samsung.com>
> 
> It creates a massive spam of text, but it contains:
> 	text = <text 'Started tracking:  dt-bindings: soc: samsung: exynos-sysreg: Add hsi0 for ExynosAutov920' [Span(18, 88, 'v2,1/2')] ''>
> 
> LMK if you require the full log for this.

I know it's a pain to get textual's backtraces because they are not easy to
copy-paste, so if you just want to screenshot the bottom of that dump and post
a link to it, I'll be able to untangle it from there, usually.

I'm not able to replicate this if I do "b4 review track", so this is something
specific to the patchwork app, I think -- but seeing the trace will help.

> Pretty sure I replicated it on 0.15-dev-18f8f too, but I'm not entirely
> sure as I cannot untrack series to retest.

You can, just abandon it from the tracking app and it should be available to
track again from the patchwork app.

> I also hit some weird interaction, where after hitting track on a load
> of stuff in the patchwork pane, nothing shows up in my review pane, but
> it looks like it should have appeared:

Yeah, I'll need a bit more to go on here, but if you pulled in the latest
master in-between, there *are* database schema changes in recent commits. In
theory, rerunning "b4 review tui" should upgrade your db behind the scenes,
but this could have bugs in itself.

For the moment, if things enter a weird state, you can just delete
~/.local/share/b4/review/[identifier].sqlite3 and .git/b4-review/metadata.json
and then run "b4 review enroll" again. Hopefully, we'll stop upgrading db
schema all the time soon.

Thanks again!

-- 
KR
