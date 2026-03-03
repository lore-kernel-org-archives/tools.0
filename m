Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F80E34C9AF
	for <tools@linux.kernel.org>; Tue,  3 Mar 2026 12:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772541750; cv=none; b=Pu9lXdx/mMwXZnLBRF0GT8sYccmgsymdz3J/+juMvIwEh/LEiwzpBwFKSFodpXsH2iJyfhiknw2bD7RhQWavXhK15HytHmvYyg/wWZzVawdl0X84pOk452CznZ9S16uDzIc1K0TX/v365Lmh9ApXxjFO4HBwW+lgH6sRU9I//q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772541750; c=relaxed/simple;
	bh=q9jIAKHhzhxfmgyrrB7kZ8li0B0TO0dyJrP9z3Vd2U0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T9PMeSut4YogcviNyeZe+9B9im74VXrxwbzvmommwHpzvDMkaoicUoFfj9qX846qnYHvYiLskiDb16TlgIcPsAh1tUzYUJ2Nyok5BoE4KN5MiCyWIM2VIeZjv9+q7lPhfoX2iNjudWV9PuAO6ScFduaqYWRC4GT6bQL2E+Gf4VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tTEftPgf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tTEftPgf"
Received: by smtp.kernel.org (Postfix)
	id 196BEC2BCAF; Tue,  3 Mar 2026 12:42:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A9A0C116C6;
	Tue,  3 Mar 2026 12:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772541750;
	bh=q9jIAKHhzhxfmgyrrB7kZ8li0B0TO0dyJrP9z3Vd2U0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tTEftPgfpdQOcOYzoWtdTU9YjcNzoRM4pR7MgIdfLYNXWShijH/FfgBroJ2hkBg4Q
	 ssCdLhnwRlxqLSJvtq92EjCRrMptKAqjo5QJvYT8QGsmMk1w+BlRI6fjaaNwIwY8Y/
	 3hQsblImxwuBBww+r2si631cQDcT3hTK76xdeiCQiBatzgXVvoxtooTht7NaSZ8/eZ
	 ilgqP/t6a8YVhfRaoEhZMyE1CtQs9AxSaB7n6XTtPSCwBB7rCBohEmI+jv6U67eYAC
	 +h38IbmTFKUrO1BqpVID+3dadxHWPyaWFuRiPEbyj+qn/KxB9XFutLcKOK9fdxmLzQ
	 JuilTBgvNCccQ==
Date: Tue, 3 Mar 2026 12:42:26 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: b4 review available in master
Message-ID: <e7d999c0-c27f-4d9d-8812-9ff3254ea7cf@sirena.org.uk>
References: <20260227-imported-aromatic-guppy-ad3dca@lemur>
 <aaMPYVIgmsDpn7Rw@sirena.co.uk>
 <aaNaArEgAe0SgmSh@sirena.co.uk>
 <20260302-juicy-spoonbill-of-jest-6fc659@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EiWo5+L4NJB5w+v+"
Content-Disposition: inline
In-Reply-To: <20260302-juicy-spoonbill-of-jest-6fc659@lemur>
X-Cookie: Use the Force, Luke.


--EiWo5+L4NJB5w+v+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 03, 2026 at 12:14:08AM -0500, Konstantin Ryabitsev wrote:
> On Sat, Feb 28, 2026 at 09:11:30PM +0000, Mark Brown wrote:

> > >  - It'd be good to have a workflow for syncing the reviews between
> > >    machines (with privacy!), for example I move between my laptop and
> > >    desktop semi regularly.

> This was already kinda working, but it should work better now. "With priv=
acy"
> is the complicated part, because we really-really don't want to deal with
> encryption and keys and all the stuff that comes with that. I recommend j=
ust
> having a private remote where you can push your review branches. It's not=
 very
> well-documented, but you have a private space in
> git@gitolite.kernel.org:scratch/broonie/ -- don't let the name "scratch" =
spook
> you, it's just not replicated to git.kernel.org, that's all.

Yeah, pushing branches isn't a concern - it was more the database bit.

> > >  - An integration with non-patchwork CI would be useful, perhaps this
> > >    looks a bit like the agent stuff above?  It's "hand off to an
> > >    external tool and some time later see what the tool/a separate
> > >    results collection tool had to say about things"?

> > Expanding on this a bit what I have ATM is effectively two operations
> > both of which take commit ranges, one to start testing and another which
> > will either say everything is OK or provide a list of outstanding issues
> > (one of which might be that it's still waiting for results, that'd
> > probably be useful to distinguish in UI).

> I'll ponder how to best do it. It's possible this may be best accomplished
> with a wrapper, but I've not given this much thought yet.

I'd expect to have to write a script - I was thinking that the agent
stuff you've got already is basically "shell out to a tool and have it
output results in a given format which we pull in", that seemed like an
OK shape for something like this.

> >  - The initial import of the series and actions->rebase appear to not
> >    allow the target branch to be specified, but taking does.  It'd be
> >    good if this were selectable consistently, and I suspect if a base
> >    has been explicitly specified for a branch we'd want to default to
> >    rebasing against that.

> We can now define review-target-branch, but I don't think it's wired into=
 the
> "rebase" flow yet, just in the "take" flow. I'll make a note to check bot=
h.

I'd expect many people have at least fixes and -next branches in the
same git repo (I have that, times four for each subsystem I have) so
it'd need to be runtime selectable which branch to use.

> >  - Some ability to either configure a list of branches to apply to or=
=20
> >    just a recently used list of branches would be handy.
>=20
> The b4.review-target-branch is now settable. I think if you want to apply=
 to
> different branches, the sanest approach is to use worktrees and set diffe=
rent
> git configs for them -- we'll pick whatever git says is the most relevant
> b4.review-target-branch setting for that worktree.

> >  - It'd be good to have the ability to sort/filter by activity in the
> >    series view ("What serieses have active discussion and should have
> >    attention paid?", "Where's discussion died down and I should think
> >    about applying?").

> The latest review UI does sort by activity. The series most recently upda=
ted
> will be at the top. You can run a full update with "u" to pull in the lat=
est
> from lore.

Ah, OK - it wasn't clear if that was the date things were sent or the
date there was most reently activity.

> >  - Adding signoffs and Link: tags to applied serieses doesn't seem to
> >    work for me with the merge strategy.  I think this is because it's
> >    doing what I suggested above and reusing the commits that were being
> >    used for review?  Linear strategy does the right thing.

> This is "as designed" right now -- the Signed-off-by and Link trailers are
> applied to the merge commit and leave the individual commits untouched. I=
t's a
> controversial take, I know. :)

> Would you prefer that we always applied Signed-off-by: and Link: to each
> individual commit even if we're doing a merge?

*Especially* if we're doing a merge, I think the general expectation is
that there will be a signoff from the person who committed the patch -
in -next we check every commit for both author and committer signoffs.
If we cherry pick and they get applied then that'd work out OK, but if
we merge and the unsigned commits end up in -next that'd be an issue.
Missing signoffs will also mess up with flows like cherry picking
patches back into stable, the merge would be long gone by the time the
commit shows up in stable.

> >  - It feels like the reply and comment functionality isn't as joined up
> >    as it could be.  Adding a comment doesn't block replies, but if
> >    you've replied it's not possible to comment further.  I think I was
> >    expecting that replies would be stored as a series of comments
> >    injected at the point where the quoted text was interrupted and I'd
> >    be free to switch between the two so long as I didn't edit the quoted
> >    text.  As it is you can comment but once you've been in reply mode it
> >    is no longer possible to use the comment functionality.  I do realise
> >    that there is some fun with detecting that this is the case.

> There is more logic in the review UI now regarding comments and replies, =
but
> more work is needed to make it a more natural flow. In general, the idea =
is
> that you'll do inline comments first (c) and then tailor your reply with =
"r".
> However, both parts need polish.

FWIW I find I moderately often come up with a top level comment part way
through the reply and go back to the top of the reply to add it.

> >  - At the minute cherry picking of individual patches can happen only at
> >    merge time, it'd be useful to be able to do this during review.  For
> >    example, with multi-subsystem serieses (especially large cleanup
> >    serieses that really shouldn't have been a single series in the first
> >    place) it can be easier to discard irrelevant bits so you can
> >    actually find the bit you want to look at.

> I'll push back on this a little simply because there's a lot that is keye=
d off
> the number of patches in the series. If we cherry-pick before we even rev=
iew,
> this makes a lot of other functionality fragile. However, there is code n=
ow to
> mark patches as "skip" (with x) -- this should let you completely ignore =
them.
> When we "take" a series with ignored patches we will automatically defaul=
t to
> the cherry-pick strategy and pre-unselect the ignored patches. Would that=
 come
> kinda close to what you want?

Possibly?  I'd need to try it.  Some of these serieses are quite large
so even finding the relevant mails can be annoying.

> >  - I edited a dummy reply to be To: another of my email addresses but
> >    when I tried sending I got a mail To: broonie@kernel.org, Cc the new
> >    address.  Copying my main address is good for my mail archives, but
> >    I'd have expected the To: to be what was configured.  The metadata
> >    looks good in the UI if I hit 'T' to edit To/Cc but it's wrong in
> >    both the TUI and what actually gets sent.  Quite possibly user error,
> >    I didn't look too hard.

> I don't think I fixed this yet, but there's been churn in that code today=
=2E See
> if it's still doing that.

Yeah, still seems to be present.

--EiWo5+L4NJB5w+v+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmm1zEACgkQJNaLcl1U
h9ATqQf+JNqVt0/yjcFSrhIcHsEhM8kn27JYZxO9u93f22g/WOwQoSvUDEnl9IyF
zog4xZsMTl1PhWqM4lhgfbtQqDhXoKvNaYifj7oVn8QDi/2TEV5aBxJR65KZP1rM
OO/fpyjQtyRcxCI57TKPLkcwWGygsOLOq36eB6nUIva80M1UU1QFLVxoRr3ovmAL
CkPrsY0Hqdn+Qselw9HNy+37Ok/cnswb0RpUlX/tAJloCA7R1FgnYCSpT70rqUaD
/9wG1+DJkZya0yDi7aWUUheAsjZ9iA3w8uvSIRLvoKHFhhl5KQs35XarsJYIj9f5
C84inaVUHtrJ5pZ8byOU8iUZTCZWrQ==
=vxzc
-----END PGP SIGNATURE-----

--EiWo5+L4NJB5w+v+--
