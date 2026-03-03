Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4CD381B00
	for <tools@linux.kernel.org>; Tue,  3 Mar 2026 18:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772562088; cv=none; b=My1bqc4RhUQKOerImNJDrHeMirA1IlOYqYl1/ZVkJEZf0fTOEKqbvVWuV6uDt+IvTi/8WXWDGNfE2+nyC5PvpkFwxDHYmXK598UM9vzgWoqyVV4HCkV2Ub7FMXoQPtevvzgzByuNJfhOYYORKsd8lefo6ZrU+2KDmc5yR3uICys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772562088; c=relaxed/simple;
	bh=zLoshS2c8cDWopcL2LVqDOrDLyYLT5W33delsLPE4kU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f0h13v32v1c/Qnk81DEyDxKlJjA/D5E/IsCDsQfx64ocVF2xjuU8fLiBJvXBXjvwO8qgcHNVOkZHgyMIH+vY6F+b9nTMHSUAA9jetokYGfHvRIUYENrMbXFPBRenYbUM/Rb2Mn9q5+mu0g6IDmQzbDV++MLSGGkiGpsj9ZrRef4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jlNf3iEW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jlNf3iEW"
Received: by smtp.kernel.org (Postfix)
	id A96CDC19425; Tue,  3 Mar 2026 18:21:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D1A3C2BC87;
	Tue,  3 Mar 2026 18:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772562087;
	bh=zLoshS2c8cDWopcL2LVqDOrDLyYLT5W33delsLPE4kU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jlNf3iEWbCGwVl1fZzoFDAXUlZrCAaqAYmhmDnuAotoARdPRE+VlJqm+bdGbCiJM8
	 4KJRUsg6y5TyrN/MsClJ1Ahb+eOdaWjy4QnsZJSVfFhbFp5o1YeLvNq4Dj8bwaoFLI
	 3MjN6lM1s5rn0FRYoAoMnc9MonydHni1/AGnu7opiRUWj6KedtEDaFQ6GCW9ifHf/z
	 wu/ykRMulWr6gPZSpCYsitQsFv+8kGsOaQHPM96NZJLTqqN2V8Z8dbN3AdH9IMuobu
	 C5xq1Nefxq8dieduwOHqT1M1fkdQG38y88GCxcRztSvxDNan+39mAyiQpmLv1By1pk
	 klFs3anOuK9pA==
Date: Tue, 3 Mar 2026 13:21:21 -0500
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: b4 review available in master
Message-ID: <20260303-true-glaring-raven-e78bf2@lemur>
References: <20260227-imported-aromatic-guppy-ad3dca@lemur>
 <aaMPYVIgmsDpn7Rw@sirena.co.uk>
 <aaNaArEgAe0SgmSh@sirena.co.uk>
 <20260302-juicy-spoonbill-of-jest-6fc659@lemur>
 <e7d999c0-c27f-4d9d-8812-9ff3254ea7cf@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e7d999c0-c27f-4d9d-8812-9ff3254ea7cf@sirena.org.uk>

On Tue, Mar 03, 2026 at 12:42:26PM +0000, Mark Brown wrote:
> > This was already kinda working, but it should work better now. "With privacy"
> > is the complicated part, because we really-really don't want to deal with
> > encryption and keys and all the stuff that comes with that. I recommend just
> > having a private remote where you can push your review branches. It's not very
> > well-documented, but you have a private space in
> > git@gitolite.kernel.org:scratch/broonie/ -- don't let the name "scratch" spook
> > you, it's just not replicated to git.kernel.org, that's all.
> 
> Yeah, pushing branches isn't a concern - it was more the database bit.

The database is mostly there as a caching layer. We do a "rescan" on each
application start and will update the database with whatever we find in actual
review branches. So, you should be able to push and pull between systems and
have it reasonably synchronized (bugs excepted). It's documented here:
https://b4.docs.kernel.org/en/latest/maintainer/review.html#setting-up-a-sync-remote

> > We can now define review-target-branch, but I don't think it's wired into the
> > "rebase" flow yet, just in the "take" flow. I'll make a note to check both.
> 
> I'd expect many people have at least fixes and -next branches in the
> same git repo (I have that, times four for each subsystem I have) so
> it'd need to be runtime selectable which branch to use.

Okay, I can't implement this as a combo box in textual, but it will now
remember the branches you use for merging and will offer the last branch you
used as the default entry, and if you start typing the name of another branch,
it will show up as an option to auto-complete (with right-arrow key).

> > This is "as designed" right now -- the Signed-off-by and Link trailers are
> > applied to the merge commit and leave the individual commits untouched. It's a
> > controversial take, I know. :)
> 
> > Would you prefer that we always applied Signed-off-by: and Link: to each
> > individual commit even if we're doing a merge?
> 
> *Especially* if we're doing a merge, I think the general expectation is
> that there will be a signoff from the person who committed the patch -
> in -next we check every commit for both author and committer signoffs.
> If we cherry pick and they get applied then that'd work out OK, but if
> we merge and the unsigned commits end up in -next that'd be an issue.
> Missing signoffs will also mess up with flows like cherry picking
> patches back into stable, the merge would be long gone by the time the
> commit shows up in stable.

OK, this is now working exactly as with "b4 shazam" and has the functionality
you're looking for.

> > I'll push back on this a little simply because there's a lot that is keyed off
> > the number of patches in the series. If we cherry-pick before we even review,
> > this makes a lot of other functionality fragile. However, there is code now to
> > mark patches as "skip" (with x) -- this should let you completely ignore them.
> > When we "take" a series with ignored patches we will automatically default to
> > the cherry-pick strategy and pre-unselect the ignored patches. Would that come
> > kinda close to what you want?
> 
> Possibly?  I'd need to try it.  Some of these serieses are quite large
> so even finding the relevant mails can be annoying.

Let me know if that's not sufficient. We can also give a way to hide skipped
patches so they aren't even in the picture.

> > I don't think I fixed this yet, but there's been churn in that code today. See
> > if it's still doing that.
> 
> Yeah, still seems to be present.

This should be now fixed.

There's also new functionality in the current master:

- "take" is now decoupled from "accept" -- you can take into any branch and
  the series won't be marked as "accepted" if you leave that checkbox
  unchecked
- you can snooze a series, including until we find a specific tag in the local
  tree; so, in theory, you could snooze a series until v7.0-rc3 or something
  like that

Thanks for the feedback, and I'll work on improving the comment/review/email
UI next once I collect a bit more feedback from others.

Cheers,
-- 
KR
