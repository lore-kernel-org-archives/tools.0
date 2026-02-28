Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E502E1747
	for <tools@linux.kernel.org>; Sat, 28 Feb 2026 21:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772313095; cv=none; b=H8uVK6ww22uUpiNLzlj9kxn0s5ZWo8qYPqZZcjN3GLUS2sTJKNBEmG5EUj97o6P+PVvyXk4UBTTknAC/u5Tiozmnm/ndrs9H0fL0YmLOXr+zhcNmg5P6LYbg2Tm+WX5JpCg5ucjBEpjtz8/MS8LJNDnOF3msIl52JzlNecP9d60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772313095; c=relaxed/simple;
	bh=Rcu7yDsIBh2EDvkW2mY9UjU8GvqcvcShR0S1QQ0vKyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lUNVP5rclgS7QiS5m8OnNBtwkv2f7K8CqCnmTWzGplg7S42ZMNf6iBcR+JgJ1G7xs+Bd69Ny98YNPjjFPhk5lWNBvHCDwRN+MlAXJzYg4YzA1pX6jeQmLtYKXXzx+lO7ckRKIaa76TdraPA179tgxbgFk62rwblPCK4Zhc2SDqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=up8Mck0G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="up8Mck0G"
Received: by smtp.kernel.org (Postfix)
	id A61C7C19425; Sat, 28 Feb 2026 21:11:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68FB5C116D0;
	Sat, 28 Feb 2026 21:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772313094;
	bh=Rcu7yDsIBh2EDvkW2mY9UjU8GvqcvcShR0S1QQ0vKyU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=up8Mck0G3DmZsUsbcwV/M1nNA3tbEHZ1KCww6GjJ2H1EyoiuxoHmt69ZPAf429Hxz
	 L0kpHVg78mY11ajm/x4OTQBxPm7PtGgpa4nyFaLCit1BTrEx7VlwJY+6dZV+XnB1iz
	 tHpasFVHugJ1ETFY+wMdMZcBopI2yhvM6yoAm7Hk/aRXgsJugQjjLkrOseZzytQoVR
	 E8TcFrbO9I+o5PbrCcMTNfRhTgBKRqSdPGdB0sqf0lmM0tIPh0/3k3GHmAIJJSYNtv
	 4tYIroeYOpw1EeKPhx4hI9K5FZpQmDxghhWmBXdG7YLV/NV+ITOrZZRMoaAMBG7gnt
	 s+fcfFmCQCXZw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 1D4DD1AC5A92; Sat, 28 Feb 2026 21:11:31 +0000 (GMT)
Date: Sat, 28 Feb 2026 21:11:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: b4 review available in master
Message-ID: <aaNaArEgAe0SgmSh@sirena.co.uk>
References: <20260227-imported-aromatic-guppy-ad3dca@lemur>
 <aaMPYVIgmsDpn7Rw@sirena.co.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HL/fcDurPOayaEiY"
Content-Disposition: inline
In-Reply-To: <aaMPYVIgmsDpn7Rw@sirena.co.uk>
X-Cookie: Think big.  Pollute the Mississippi.


--HL/fcDurPOayaEiY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 28, 2026 at 03:53:05PM +0000, Mark Brown wrote:
> On Fri, Feb 27, 2026 at 02:53:07PM -0500, Konstantin Ryabitsev wrote:

> >   - AI-assisted review using an external agent (Claude Code, Gemini CLI,
> >     OpenAI Codex CLI, GitHub Copilot CLI) =E2=80=94 agent findings are =
private to the
> >     maintainer and can then be selectively incorporated into the review
> >   - Patchwork integration: browse series, view CI check results, track =
series
> >     directly from Patchwork, and automatically synchronise Patchwork st=
ate as
> >     you work
>=20
> As requested since it looks like the textual thing I reported might be a
> bit annoying to resolve a couple of bits of feedback just from reading
> the announce:

I've now managed to actually play with this a bit.  It looks really
great thus far, thanks a lot for working on it.  I've brain dumped a
bunch of thoughts below which I appreciate is a bunch of
demanding/moaning but please don't let that take away from the overall
positive first impression.

>  - It'd be good to have a workflow for syncing the reviews between
>    machines (with privacy!), for example I move between my laptop and
>    desktop semi regularly.
>  - An integration with non-patchwork CI would be useful, perhaps this
>    looks a bit like the agent stuff above?  It's "hand off to an
>    external tool and some time later see what the tool/a separate
>    results collection tool had to say about things"?

Expanding on this a bit what I have ATM is effectively two operations
both of which take commit ranges, one to start testing and another which
will either say everything is OK or provide a list of outstanding issues
(one of which might be that it's still waiting for results, that'd
probably be useful to distinguish in UI).

>  - If this works for me I think I'm likely to want an "applied but not
>    taken" state, I CI the actual commits I end up merging and do end up
>    looking back at the results sometimes.

Having now actually used this I now see that the commits are actually
being applied as part of the storage for the review so a lot of this is
already happening (though without signoffs), it seems like this is quite
close to what I'm looking for with having the actual commits that could
be merged available with Link: and signoff.  I think I'm just suggesting
moving the bit that adds those two from the apply part of the flow to
the import part of the flow.

I can see it might worrying people to have those commits there, but I'd
definitely use this and I think the merge application strategy might
actually be relying on this?

>  - My existing tooling has an "I'll apply this at rcX" state which I use
>    moderately heavily when I'm happy but want to allow time for other
>    people to review.  Other units of time are available, I'm mostly
>    using the rcs as a proxy for that (and it's very useful for "apply
>    this after the merge window closes).

Other things that came up:

 - The initial import of the series and actions->rebase appear to not
   allow the target branch to be specified, but taking does.  It'd be
   good if this were selectable consistently, and I suspect if a base
   has been explicitly specified for a branch we'd want to default to
   rebasing against that.

 - Some ability to either configure a list of branches to apply to or=20
   just a recently used list of branches would be handy.

 - It'd be good to have the ability to sort/filter by activity in the
   series view ("What serieses have active discussion and should have
   attention paid?", "Where's discussion died down and I should think
   about applying?").

 - Adding signoffs and Link: tags to applied serieses doesn't seem to
   work for me with the merge strategy.  I think this is because it's
   doing what I suggested above and reusing the commits that were being
   used for review?  Linear strategy does the right thing.

 - It feels like the reply and comment functionality isn't as joined up
   as it could be.  Adding a comment doesn't block replies, but if
   you've replied it's not possible to comment further.  I think I was
   expecting that replies would be stored as a series of comments
   injected at the point where the quoted text was interrupted and I'd
   be free to switch between the two so long as I didn't edit the quoted
   text.  As it is you can comment but once you've been in reply mode it
   is no longer possible to use the comment functionality.  I do realise
   that there is some fun with detecting that this is the case.

 - At the minute cherry picking of individual patches can happen only at
   merge time, it'd be useful to be able to do this during review.  For
   example, with multi-subsystem serieses (especially large cleanup
   serieses that really shouldn't have been a single series in the first
   place) it can be easier to discard irrelevant bits so you can
   actually find the bit you want to look at.

 - I edited a dummy reply to be To: another of my email addresses but
   when I tried sending I got a mail To: broonie@kernel.org, Cc the new
   address.  Copying my main address is good for my mail archives, but
   I'd have expected the To: to be what was configured.  The metadata
   looks good in the UI if I hit 'T' to edit To/Cc but it's wrong in
   both the TUI and what actually gets sent.  Quite possibly user error,
   I didn't look too hard.

 - If you use the comment feature and don't go into reply mode then the
   entire diff chunk up to the line commented on will be quoted.  This
   can blow up badly if the hunk is very big, for example when adding a
   new file.  It's a sensible default but some mitigation might be in
   order, for example warning if the quoted percentage is exessively
   high and suggesting editing in reply mode.

 - I can't see a way to add notes to trailers, for example a comment
   about where/how something was tested.

 - Any review on a patch causes a tick to be shown against it in the UI,
   for larger or complicated patches it'd be good to have more control
   of this so you could see in the summary if you're all done with the
   patch.  The tick appears even if you added but did not send comments
   or a reply which feels like a landmine.

 - Especially given that there's not a key collision it feels a bit odd
   that at least the send part of the reply functionality requires
   switching to email mode.

 - The UI for followup comments feels like it needs fleshing out:

   - It feels like it should be more obvious from the initial series
     view that followups exist (especially if they were previously
     fetched) in either the list of serieses or the per-series view.

   - Some way of tracking status for followups would be good (eg, read,
     needs addressing, needs reply).

   - The UI for followups shows each person's comments as a single
     summary which doesn't really give a picture of how active the=20
     discussion is or anything (mutt's thread view is great here!).

   - It doesn't seem to be possible to reply to a followup?  The feels
     like it's getting into "switch to your mail client" territory
     though.

   - It'd be good to be able to see message IDs for followups to make it
     easier to find them in your mail client.

 - Does the thank you note stuff integrate with b4 ty or have an
   equivalent thereof?  I purposely generate the thank you notes by
   asking b4 to check what's in my public branches so people don't get
   confused by seeing the mail before I did a git push (that used to
   happen often enough to be noticable).  It doesn't seem to AFAICT.

 - pgp signing mails would be nice but very, very low priority.

Like I say thanks for working on this.

--HL/fcDurPOayaEiY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmjWgIACgkQJNaLcl1U
h9CSdQf/RhVMGO5FkLQ69lp6v86klhihsd5qRP4U3gVCr7QIlXnJjlts0ySIsq8X
wAZjyPu9Eyg7/TmQEfXkaXEsecCNjRn8kxiL4RZ4xfZ6IzCNg4eZOSgk3R27LPPg
pzK0xcbz1J4fhcvbIill1y1D5agkZNYE6Uw70565Oi14RYpBCZ1OrQcsiPwCJFtd
Lfz+9c/CDrGP0eQ54pcNJjiilId/WPeayIr6PhpHcx2vjNj04BlFzcQb6Y09DlkI
c614c9ALdY1t0BUZWr7IbzXkKveddj+rK17LalnA3wGUOv6VMyrRZdwGLUf3majP
YzUdz3LaK358i8RXejN1Cj/H7K4ibQ==
=IwPj
-----END PGP SIGNATURE-----

--HL/fcDurPOayaEiY--
