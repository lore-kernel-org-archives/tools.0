Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3374C3EDAC2
	for <tools@linux.kernel.org>; Wed, 18 Mar 2026 19:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773861733; cv=none; b=ENRPyhyIGxS5uMWt8TjF1hujbMoDw6t7GzoZn/0L36AT4rUXlsJiIHOz5BlhBXA5OXVtjRnZQcpgIJBd/ZnH1MyVhKTQZNn8fDnbXbWEDH1lkk1RvZtmhccmzjOco73I3p212gWUiD9NPfjAlGzMLq2gsq/XCe/Z1ihwi634kfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773861733; c=relaxed/simple;
	bh=lLTdgNESlW+5kJgPntLgLtyYxmmkW9pc4ZuCfr5zQ+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fl21InTpuUz51YULrDUCRIYqvnXJ6/+diK65YH6QJb3IAgS+6wC3tNZwSxh/otuuLaCqKVpTzDBlyvspxfWzHY+DBtuBwebuCRrhTtYJEEnX6QN0f0s1zsaFJU+BI/ti/18MZO1pl13ejx1yhg3kRpaDZar63StsPbUWvT4ouy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sdgU0fJN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sdgU0fJN"
Received: by smtp.kernel.org (Postfix)
	id F34D8C2BCAF; Wed, 18 Mar 2026 19:22:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB36BC19421;
	Wed, 18 Mar 2026 19:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773861732;
	bh=lLTdgNESlW+5kJgPntLgLtyYxmmkW9pc4ZuCfr5zQ+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sdgU0fJNXvR9hqv3zxqlKzmRigIUSLLrIAAuGwOgEj8jtOkKkcuZS2Uv5jP0IupJj
	 y2kIs2JG/7TyHL19Gy+65qZy8pKN43AoFMswhpCprv62ZHXysGI41JXeejiVRUjmNy
	 muUUO+lRIojHfknpPGUxKRlnbnk531Hi86z3zwyLuxkbpNQGa+d7t5VTcfTyKHmZI6
	 KZrRfOMWijokQ7KL5QLbDuykEgxbAxwBMFSbMGIegcc4V65uhRIDVi+hP/voq4oSeo
	 AQngMF+eVYRWt445DvxrGz4y0kboTeeqC+w2x+ZrlzVV0PVuk9S1pvTflM7E7LX1sO
	 fWMgS/zPVDCOw==
Date: Wed, 18 Mar 2026 15:22:11 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: b4 review available in master
Message-ID: <20260318-groovy-daring-echidna-e109fc@lemur>
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
> > However, I am now curious to hear your feedback. The idea with the review app
> > is that you are not really sending an email, you're adding comments to code
> > and adding review trailers. The app will render and send that out for you,
> > trimming and formatting things nicely so you don't have to do it on your own
> > (I've noticed that many maintainers don't bother anyway -- there are emails
> > with a terse comment at the top and then a huge quoted bottom that is only
> > followed by their sig.
> 
> This is just me, of course ... and I was very much experimenting with it
> as an alternative to my usual "do it in email" approach.  So one can
> definitely argue that I was simply holding it wrong.

I think it will help to look at not as an alternative to "do it in email" but
"do it alongside email." Email works great for person-to-person communication,
in-depth philosophical discussions, etc. But these are all fun and exciting
things about participating in Linux development already. What b4 review aims
to address is the "dull and boring" parts of participating in Linux
development:

- look through all diffs
- look at CI results
- drop to shell, poke around, run a local test

- send a quick Acked-by/Reviewed-by
- park it until you get a new revision

or

- take it in
- send a thanks
- archive it

> If, though, the intent is that one inserts comments and leaves the patch
> text alone, I think that the interface *really* needs to not let you
> mess with the stuff you're not supposed to change.

I went down that path. You could at some point insert comments via textual
pop-ups, but I hated it, because it's Not Like My Editor (also, see below).

> If one were to
> implement this as <obnoxious>an Emacs mode</obnoxious>, that sort of
> constraint could be implemented fairly easily.  If you're throwing
> somebody into an arbitrary editor, it's going to be rather harder.

I've debated this with myself for so long! The reason the arbitrary editor won
is because it's so much easier to do powerful operations in it, including
things like: copy this original block of code, paste it and reformat it / edit
it to show how it should be done, add another buffer, edit the code there,
make sure it compiles, return to the original message, paste working code,
etc. All of this was dramatically more awkward when NOT done in your usual
favourite editor.

It only requires not looking at it as "sending an email" -- you're commenting
on code, don't treat this as the final email.

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

Noted! Again, this is supposed to work alongside your email client, so if you
find yourself constrained by the code review framework, you can always yank
that thread into your inbox (or reply from the lite email viewer that b4
review also provides).

> But perhaps I'm a dinosaur who just isn't using the tool correctly.

It *is* a bit of a challenge with the "users" crowd because everyone here is
very much already comfortable with their workflow. ;) Once 0.15 is out, I'm
hoping I get feedback from people who are not already well-established in
their ways (who, on the other hand, may find it awkward because it's "not like
Github").

> > Is this rife for creating confusion? Will maintainers be fighting with this
> > and growing grumpy because it's not exactly like their email client?
> 
> Some surely will, see above.  But that doesn't necessarily mean you're
> not creating a better workflow in the long run.  I think we need to play
> with a lot of ideas, and I'm really glad you're doing that.

Great, thanks for the feedback!

-- 
KR
