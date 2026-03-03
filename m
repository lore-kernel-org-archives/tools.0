Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390C22ED87F
	for <tools@linux.kernel.org>; Tue,  3 Mar 2026 05:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772514850; cv=none; b=m8fzbAuUD6Vf/y581eYLIDrqRiygL3KMaAUB4bR/v+cFRycPcA2Kl3XxDY8ZJmEV3ZsBVYlxoanKLU2Vpr9Ccgb3TQq9VdRY/z4u+29o5ymUqBNc/LLJaFKKUzqr9Zv40aPf8gl/MEeBnGGl/GZDP7oSqRD6oLlkeytUY9gDAPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772514850; c=relaxed/simple;
	bh=H6Pn7yZjBZlxU9WMZ79MdLfBDb4iOTSdBhMp3HgquUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oGuXEGI2LMPxdN1r/p+lTWDEcL5acEjwGBH8Gb46+aQrvbhU5fXeNXLIKB7UcRWAXOXizICVvM2epEDQTL82qOnbwZ/DRPIb/NZw+ux+yOWrfBNupnYuBUDG+AQPXo0/ylSWlp6CLb2WSGrWfCzyXnerHf4+WwkygWaYq5H5tQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rFn16/al; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rFn16/al"
Received: by smtp.kernel.org (Postfix)
	id DCB58C2BC87; Tue,  3 Mar 2026 05:14:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E984C116C6;
	Tue,  3 Mar 2026 05:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772514849;
	bh=H6Pn7yZjBZlxU9WMZ79MdLfBDb4iOTSdBhMp3HgquUo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rFn16/alBJRul3kEWMGEnY0U0njb0Jdn9PrxP0aHo4lrxATJE8LDYKHBCa686BZNC
	 qgV0gIDIFEGcoJIMMo1JTGU80W3LdggWT2NGzagvTZSLQA3SD7sECcMOLH0R39B+/g
	 pPZgSPcAGPHLtkezcHiT5Ij49vJ/xdie+T0us/3ejTrPE1wDaaUc0l6C8R9kJ9pDaD
	 /6o7XFqF4whDDCyP3ofCP9gX4Lzcl1Zm/u5h5j5kYb/Lzbkyl/wWgW2N0xsivz+Kfq
	 Y8lagvcalgVYj4hfVqNpYxrw2Y07F4JZddG5XQswbjkzTRiiBnUaOm9mqURO5yMWXW
	 04Y6EvzI32HUQ==
Date: Tue, 3 Mar 2026 00:14:08 -0500
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: b4 review available in master
Message-ID: <20260302-juicy-spoonbill-of-jest-6fc659@lemur>
References: <20260227-imported-aromatic-guppy-ad3dca@lemur>
 <aaMPYVIgmsDpn7Rw@sirena.co.uk>
 <aaNaArEgAe0SgmSh@sirena.co.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aaNaArEgAe0SgmSh@sirena.co.uk>

On Sat, Feb 28, 2026 at 09:11:30PM +0000, Mark Brown wrote:
> I've now managed to actually play with this a bit.  It looks really
> great thus far, thanks a lot for working on it.  I've brain dumped a
> bunch of thoughts below which I appreciate is a bunch of
> demanding/moaning but please don't let that take away from the overall
> positive first impression.

Thanks for trying it out!

> >  - It'd be good to have a workflow for syncing the reviews between
> >    machines (with privacy!), for example I move between my laptop and
> >    desktop semi regularly.

This was already kinda working, but it should work better now. "With privacy"
is the complicated part, because we really-really don't want to deal with
encryption and keys and all the stuff that comes with that. I recommend just
having a private remote where you can push your review branches. It's not very
well-documented, but you have a private space in
git@gitolite.kernel.org:scratch/broonie/ -- don't let the name "scratch" spook
you, it's just not replicated to git.kernel.org, that's all.

> >  - An integration with non-patchwork CI would be useful, perhaps this
> >    looks a bit like the agent stuff above?  It's "hand off to an
> >    external tool and some time later see what the tool/a separate
> >    results collection tool had to say about things"?
> 
> Expanding on this a bit what I have ATM is effectively two operations
> both of which take commit ranges, one to start testing and another which
> will either say everything is OK or provide a list of outstanding issues
> (one of which might be that it's still waiting for results, that'd
> probably be useful to distinguish in UI).

I'll ponder how to best do it. It's possible this may be best accomplished
with a wrapper, but I've not given this much thought yet.

> >  - If this works for me I think I'm likely to want an "applied but not
> >    taken" state, I CI the actual commits I end up merging and do end up
> >    looking back at the results sometimes.

Yes, I'm thinking a "triaging" stage if you have a review-triaging-branch
defined. This will be the "applied but not taken" state. I'll ponder this
next.

> Other things that came up:
> 
>  - The initial import of the series and actions->rebase appear to not
>    allow the target branch to be specified, but taking does.  It'd be
>    good if this were selectable consistently, and I suspect if a base
>    has been explicitly specified for a branch we'd want to default to
>    rebasing against that.

We can now define review-target-branch, but I don't think it's wired into the
"rebase" flow yet, just in the "take" flow. I'll make a note to check both.

>  - Some ability to either configure a list of branches to apply to or 
>    just a recently used list of branches would be handy.

The b4.review-target-branch is now settable. I think if you want to apply to
different branches, the sanest approach is to use worktrees and set different
git configs for them -- we'll pick whatever git says is the most relevant
b4.review-target-branch setting for that worktree.

>  - It'd be good to have the ability to sort/filter by activity in the
>    series view ("What serieses have active discussion and should have
>    attention paid?", "Where's discussion died down and I should think
>    about applying?").

The latest review UI does sort by activity. The series most recently updated
will be at the top. You can run a full update with "u" to pull in the latest
from lore.

>  - Adding signoffs and Link: tags to applied serieses doesn't seem to
>    work for me with the merge strategy.  I think this is because it's
>    doing what I suggested above and reusing the commits that were being
>    used for review?  Linear strategy does the right thing.

This is "as designed" right now -- the Signed-off-by and Link trailers are
applied to the merge commit and leave the individual commits untouched. It's a
controversial take, I know. :)

Would you prefer that we always applied Signed-off-by: and Link: to each
individual commit even if we're doing a merge?

>  - It feels like the reply and comment functionality isn't as joined up
>    as it could be.  Adding a comment doesn't block replies, but if
>    you've replied it's not possible to comment further.  I think I was
>    expecting that replies would be stored as a series of comments
>    injected at the point where the quoted text was interrupted and I'd
>    be free to switch between the two so long as I didn't edit the quoted
>    text.  As it is you can comment but once you've been in reply mode it
>    is no longer possible to use the comment functionality.  I do realise
>    that there is some fun with detecting that this is the case.

There is more logic in the review UI now regarding comments and replies, but
more work is needed to make it a more natural flow. In general, the idea is
that you'll do inline comments first (c) and then tailor your reply with "r".
However, both parts need polish.

>  - At the minute cherry picking of individual patches can happen only at
>    merge time, it'd be useful to be able to do this during review.  For
>    example, with multi-subsystem serieses (especially large cleanup
>    serieses that really shouldn't have been a single series in the first
>    place) it can be easier to discard irrelevant bits so you can
>    actually find the bit you want to look at.

I'll push back on this a little simply because there's a lot that is keyed off
the number of patches in the series. If we cherry-pick before we even review,
this makes a lot of other functionality fragile. However, there is code now to
mark patches as "skip" (with x) -- this should let you completely ignore them.
When we "take" a series with ignored patches we will automatically default to
the cherry-pick strategy and pre-unselect the ignored patches. Would that come
kinda close to what you want?

>  - I edited a dummy reply to be To: another of my email addresses but
>    when I tried sending I got a mail To: broonie@kernel.org, Cc the new
>    address.  Copying my main address is good for my mail archives, but
>    I'd have expected the To: to be what was configured.  The metadata
>    looks good in the UI if I hit 'T' to edit To/Cc but it's wrong in
>    both the TUI and what actually gets sent.  Quite possibly user error,
>    I didn't look too hard.

I don't think I fixed this yet, but there's been churn in that code today. See
if it's still doing that.

>  - If you use the comment feature and don't go into reply mode then the
>    entire diff chunk up to the line commented on will be quoted.  This
>    can blow up badly if the hunk is very big, for example when adding a
>    new file.  It's a sensible default but some mitigation might be in
>    order, for example warning if the quoted percentage is exessively
>    high and suggesting editing in reply mode.

This is now handled with better defaults, but more testing is needed!

>  - I can't see a way to add notes to trailers, for example a comment
>    about where/how something was tested.

You can't sorry. The "t" screen is really a fire-and-done kinda approach with
no nuance. If you want to add a note to a trailer, the best way is to do "t"
and then "r" to tweak the reply, but I just realized that we don't populate
that with the trailers. I'll see what is the best course of action there.

>  - Any review on a patch causes a tick to be shown against it in the UI,
>    for larger or complicated patches it'd be good to have more control
>    of this so you could see in the summary if you're all done with the
>    patch.  The tick appears even if you added but did not send comments
>    or a reply which feels like a landmine.

There is now a special "done" mode that lets you indicate that you're done
reviewing a patch as opposed to just added comments. We won't send anything if
you have any draft patches.

>  - Especially given that there's not a key collision it feels a bit odd
>    that at least the send part of the reply functionality requires
>    switching to email mode.

Because I'm proud of that mode! :) But, seriously, I mostly wanted to give
maintainers an overview "hey, this is what will be sent, check it before you
send it." I may have been burned by "b4 ty" being too happy to be totally
wrong by default.

>  - The UI for followup comments feels like it needs fleshing out:
> 
>    - It feels like it should be more obvious from the initial series
>      view that followups exist (especially if they were previously
>      fetched) in either the list of serieses or the per-series view.

We now show this on the tracking ui and store that in the repo. The "f" is now
more of a toggle, really.

>    - Some way of tracking status for followups would be good (eg, read,
>      needs addressing, needs reply).

Still TBD.

>    - The UI for followups shows each person's comments as a single
>      summary which doesn't really give a picture of how active the 
>      discussion is or anything (mutt's thread view is great here!).

It does now nest them a bit, plus will show total vs. new follow-ups in the
tracking ui, but testing is required.

>    - It doesn't seem to be possible to reply to a followup?  The feels
>      like it's getting into "switch to your mail client" territory
>      though.

I didn't want to do it initially, but I do realize that it's a huge pain to
switch to an email client if you just want to send a quick follow-up. There is
now code that will let you send a follow-up, but it's a bit rough around the
edges. You have to click on the little backarrow at the top of the follow-up
frame. I'm still poking around and that and should make it more obvious, but
the core functionality is now there.

>    - It'd be good to be able to see message IDs for followups to make it
>      easier to find them in your mail client.

It does show them now.

>  - Does the thank you note stuff integrate with b4 ty or have an
>    equivalent thereof? 

It's an equivalent of it and will only do "b4 review" taken series. On the
upside, it completely eliminates guesswork and will actually record sha's when
you run "take".

>    I purposely generate the thank you notes by
>    asking b4 to check what's in my public branches so people don't get
>    confused by seeing the mail before I did a git push (that used to
>    happen often enough to be noticable).  It doesn't seem to AFAICT.

Right, I'll see if we can make this check semi-automatic.

>  - pgp signing mails would be nice but very, very low priority.

I don't think we'll get there, but we can patatt-sign everything (yes, even
the follow-ups). This will at least get you nice checkmarks in "b4 shazam" for
your trailers.

> Like I say thanks for working on this.

Thanks for being the willing guinea pig! :)

-- 
KR
