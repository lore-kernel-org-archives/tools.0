Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B4B320E;
	Mon, 18 Jul 2022 15:16:00 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id C421A5C00CE;
	Mon, 18 Jul 2022 11:15:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 18 Jul 2022 11:15:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1658157359; x=1658243759; bh=xLQH5EylzQ
	cZV6St7zVCoINrK+7CGhdZwQ0L+u4xLh0=; b=Du7LDWRQ+EEQHe1joCoQlnBNqT
	zZB5KBThePMoNT/KkvX+QeraX37Hav/cTd+RNI3S3pzPE+5oE2SWzIdXbCGXSixQ
	RQnEce4CDVku9f3y9k94xjr2PZm4OA02Jj6cdqaQhGeWk3wiurWRZdzgWD+mwfTl
	YYTGWkSBYTvC0OjkhRdyCDIHCL+YnC3lRf5ASB2hdpucHa3bz9wSxm8eem23R1r8
	4irgmE5kx/OriBHMAqsU+jF3amg3YtgUK2PCPoYXq6ivwSzsMu5v8PcsxJ8OL16/
	2w/S0E1d0rN+rnPz14fHdsctDFhhe26AD4v5KrRB/YSd51BKm+7ZLcVy5GhA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1658157359; x=1658243759; bh=xLQH5EylzQcZV6St7zVCoINrK+7C
	GhdZwQ0L+u4xLh0=; b=fJmUpiLoWlgc7YXj0gvKKkUD/cqPFYdDv4rTrnq2iIzX
	lIQvJYeZllt+lIOEwYnsOMrM5eErdO3dnPCNBEn02koimu2UGnai13HxbYzb46QT
	Tl9zDKMyurrZcvaO9t6dcXHTeiuJe9878tm1Ow8xjXIgtYEqx4uMkcFt+m61elzL
	97NCuU1C6fTdofzZ+AO1Y5RHmbpZPUfwMBbTeLQv9zXl0zGSbw2DhzwiNgmJnPCi
	+LmCaL9MaqVKwnT2KN5GVyFARI7cq+O5bNXwvaI81bpTDmlmJ6cJHpR2pvkPxrJ5
	ZPtxFnvBZbdBxh4Fc4jE9d4/UtN4syFdn28MqulHog==
X-ME-Sender: <xms:L3nVYs6bGSwrnjn5TVZ55FkcV-MmKT-kyEz7Xp-4iUcgyLqhMPTOUQ>
    <xme:L3nVYt6GwFb0eaMk7YF4McP4xCpLq2O45UvWGu7jEgcUWrhPlZ5EDNUnLxqOK05-t
    Hmb--G9WLAnWlXbxV8>
X-ME-Received: <xmr:L3nVYrc4Lbl2n5YMe9wZp0tamvLuK9qiNQSPDIllOAUYR9WJZaz00NBaBSK7wMPFOX2yLWKC-Vql89kx18tPzo5VzCZkBr7zhc67p-I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekkedgkeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpefhkeehfedthfejfeejtdfhvddvueeigeejjeeuteegveffhfffgeffieeu
    ueduvdenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
    hh
X-ME-Proxy: <xmx:L3nVYhL8zLgV0y3s1IX9Fsb2cWK1TdFoYClD0KcpSubifkdHImT6BA>
    <xmx:L3nVYgJEmxIf390AowOoPRrD3UftRt-5eEqtRJ7NXMfhC5lgPXdTqA>
    <xmx:L3nVYixd9FkZ7XLvqBUG9sxLVevUCMxRMI0P5wI-BvPWFUiF33-sbw>
    <xmx:L3nVYqi37No94mNl4jhavuFl09DHFBnwzeFwy7AOxEFNgcCDmlmAiw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 18 Jul 2022 11:15:59 -0400 (EDT)
Date: Mon, 18 Jul 2022 17:15:56 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 submit ready for beta testing
Message-ID: <20220718151556.qulqg23yzbpr562e@houat>
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>
 <20220718084927.nlomzhq3ipni5alf@houat>
 <20220718143347.qo3ton7ocmcksgsy@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uaarucg7srveo5os"
Content-Disposition: inline
In-Reply-To: <20220718143347.qo3ton7ocmcksgsy@meerkat.local>


--uaarucg7srveo5os
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 18, 2022 at 10:33:47AM -0400, Konstantin Ryabitsev wrote:
> On Mon, Jul 18, 2022 at 10:49:27AM +0200, Maxime Ripard wrote:
> > > After the branch is created, b4 will create an empty commit that will=
 serve to
> > > store the cover letter contents and some tracking information. You ca=
n view
> > > the raw commit with "git log" just like any other commit, and you can=
 even
> > > edit it with "git rebase" but it's not recommended. It's much better =
to use
> > > "b4 submit --edit-cover".
> >=20
> > So, I've been using a lot git-publish since a couple of years
> > (https://github.com/stefanha/git-publish), and this creates arbitrary
> > constraints that aren't great from a usability point of view compared to
> > git-publish:
> >=20
> >   - The fact that you need to create a branch beforehand prevents to
> >     easily use it for one-off series. I'm sure it's doable, but it's not
> >     clear to me why you would want a special branch in the first
> >     place...
>=20
> When approaching this work, I was trying to see it from the point of view=
 of
> someone who is an occasional contributor. This is easy for me, because I =
do,
> very occasionally, contribute to the documentation tree. So, my choices w=
ere
> dictated mainly by the following considerations:
>=20
> 1. it should be obvious where everything is stored and how to view it
> 2. we should use as little git magic as possible
> 3. it should be easy to blow away and start over

Yeah, full agree on this :)

However, I think trying to stick as close as we can to the regular git
workflow is part of those goals too, otherwise you will effectively ask
for the occasional user to learn some more b4 magic, that won't be
obvious at first.

> I was not aware of git-publish before you mentioned it, but I did consider
> using annotated tags to store cover commit information, just like git-pub=
lish
> does.

For the record, prior to git-publish I was using git-series:
https://github.com/git-series/git-series

That was also imposing a bunch of commands to maintain a series of
patches (to start a new branch, like b4, but also to rebase for
example). git-publish is, to me, much more convenient to use since I can
use any tool, frontend I want, and I don't have to remember all the time
whether I'm on a git-series branch, and if I need to use git series
rebase or git rebase.

> My main worries about using this approach were:
>=20
> 1. Pushing tags is a separate step from pushing commits, which is not obv=
ious
>    to a lot of occasional contributors. Someone could do "git push origin=
" and
>    assume their cover letters are preserved, but they won't be.

That's true, but when I'm pushing a branch for a PR or someone to test,
I don't really care about pushing the cover letter itself. That might be
just me though. It might be useful for archival when a PR is merged, but
for any other purpose it's not useful at all to me.

> 2. This requires us to assume (or track) the base branch in order to know
>    where the series starts. For example, git-publish assumes it's "master=
" and
>    allows you to override that with -b, but a lot of subtrees require that
>    all series are based off of "next" or some other branch. Using a speci=
al
>    empty commit allows me to completely ignore any other branches in the =
repo
>    that can go away or get force-pulled into some weird state, resulting =
in a
>    completely unpredictable patch series.

Yeah, but that info is one of the metadata stored in the tag, so if it's
set as long as you don't change it, you don't have to provide it.

> 3. This creates a lot of tags that are detached from any heads, and they =
are
>    probably never going to get cleaned up. This is mostly a nitpick, but I
>    find this messy. :)
>=20
> >   - ... Apart from that special commit. I'm not sure it's great either
> >     and am almost certain I'm going to screw up rebases all the time,
> >     dropping that special commit.
>=20
> I know everyone worries about that, but I really think this is no longer =
the
> case ever since git-rebase switched to the merge backend. It's really
> difficult these days to unintentionally drop empty commits from your hist=
ory.

It's not just about the merge strategy (which I probably forced somehow,
since it definitely complains about empty commits here), but it's also
very easy to drop it if it's something you can handle. If you do a git
rebase $base --onto $newbase for example, you can definitely mess up the
base commit and drop the "metadata" commit in the process.

A tag is a separate item, and still more convenient than a note when it
comes to rebasing or pushing.

> > This also allows to easily rollback to a previous series version and
> > it's transparent to others whether you're using it or not, the history
> > is clean. You can even send the PR directly from the branch if you want
> > to.
>=20
> Yes, this is my main worry -- that these empty commits will somehow make =
their
> way into a pull request and annoy Linus or other maintainers. This is
> basically the only reason why I would consider abandoning them in favour =
of
> something else.

We should definitely expect it to happen. I know it will happen to me at
some point ;)

> > > After you send your series and when you're ready to start working on =
a new
> > > revision, you'll want to --reroll to increment your tracked version. =
This will
> > > automatically update the cover letter commit to add a "Changes in v[N=
]"
> > > section that will also contain a link to the v[N-1] series, creating a
> > > historical breadcrumb of revisions.
> >=20
> > Similarly, I'm pretty sure I'm going to mess this up all the time :)
> >=20
> > If you start tracking which version has been sent last, b4 submit can
> > just reuse it and add 1 by default, or something else if one needs to.
>=20
> I wanted to avoid situations like "it got sent, but the list bounced it, =
so I
> should resend it now with the same revision", which is why I didn't want =
to
> auto-increment after each time we send. I will add a check for "are we se=
nding
> again with the same revision number as last time", to help avoid confusing
> collisions.

Sending an incremented version when we didn't mean too doesn't have any
consequence though. The worst that could happen is that maintainers will
complain about a new series that wasn't really necessary, but it will be
obvious to everyone which one should be picked, maintainers, lore/b4, etc.

Sending a new series with the same number though is very bad and will
confuse/piss off everyone.

If we can detect it reliably, we shouldn't rely on user action, we
should just do it.

Maxime

--uaarucg7srveo5os
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYtV5LAAKCRDj7w1vZxhR
xbFpAP0RyOkbzWtpI1xS9gykfaRL157zYLivy123Za+2LaaJ2QEAo8/95xDXgZsG
sBBiY5z0LFRJ3lMnAy0JAQYr2qgUUAc=
=7rvA
-----END PGP SIGNATURE-----

--uaarucg7srveo5os--
