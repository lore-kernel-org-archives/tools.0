Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9483BEA6;
	Mon, 18 Jul 2022 08:49:31 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 9BF7D3200919;
	Mon, 18 Jul 2022 04:49:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 18 Jul 2022 04:49:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1658134170; x=1658220570; bh=VJZO0dfLxN
	GUlmHwE/HBAKr+O61U6cst83GGTXDUdQY=; b=k5XDJnea/H4A25bkS30g6DyMCw
	rEACKb2reKvjIDeOAElqg4sCbaGwKdEk89Mow3KWEawD1nURUOtFlT8YxxSMM41X
	p2A+oDZ341XBqYaCLGjuUWgqRouLBAnZV4G6q8UWnMO0yubkhF2WJeriscTDgqH/
	hU3lcdpl0s1E2vpDrWSCIEolvMoIqrk4QYvbapT8AX1VMTyNN5/THHhsMUNYzLa2
	LegB7s+C2Dt/Z+zjtXJRE94X8CFdbcOy4ha5QFZ8nb99aUc7kuHUTzNlvYNu5jva
	r3kuH/L59a7rT+F7HqZ6AOlSxgtha/mX2ujvUqJDRLVQjpnmoQIpvAzI2j1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1658134170; x=1658220570; bh=VJZO0dfLxNGUlmHwE/HBAKr+O61U
	6cst83GGTXDUdQY=; b=Bi1/Zs0lv6Z2w6emWBQG2d1zmNsN8VoQxXpNEHruQGx8
	TWkWtfAwRelcSxRiQkRE4Znr02RBDXpHO4U1Y0YQAAaztaIfIBJoDjDG6d9ne3i3
	fOaIbZGlLFDWSFB0vPpbAt8pwCN3xdgjxVjNrFsSVRAR6nPedyZd19EjP8ZQqFjN
	UabZOX1p6bG0x0xxJJFgIvDeSq0OCnS9twU2Q9Bb/qsuY8UFB5aFJxwFB8oSS7z/
	r1OyDmrJBg/3g0tTYqO5oIZEF4nu9A2Ww4LjZbgJ87C/O1s7PluDGqhu8Z4/rnJn
	t8THJtH1yQXAdHtZMd/zgTFKKpibl5Gvpn3y9URjAA==
X-ME-Sender: <xms:mR7VYrM3BBgSrswGQVa3-bZdIKT9vU0dmjTp1EL-4aNvy54rcCbmBA>
    <xme:mR7VYl-l0N6p4bstHyqd-i_eQTLsuE38azQ7MvViKT7m3_PozOU-epai30GTHqsJM
    8MRPpXFomNTQ7zKqqQ>
X-ME-Received: <xmr:mR7VYqQbXiCin8fo7xKCbEG_3cPc18aksAovQ7PRNIH2jvVsv4eMAklmYvnnPnm5TbVB7m-BbHVoB5c_F4AUuBusCFiT5SKw8zzMKLc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekkedgtdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeeuvdejfefhueeukeegffekieejtdefkeejuedtueegleeijefgjeeigfej
    hedtteenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhkvghrnhgvlhdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhm
    vgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:mR7VYvuI-kxQp5SF3_VhtJEmn-9f2ZJbz-p-SUz7idhuAlfoZFMaiQ>
    <xmx:mR7VYjeZZQsC2lQ440780Y9pO7iQHPkr_1T-IbY8MlVIz_ZN0Qqm1Q>
    <xmx:mR7VYr1ChJMhKAH0HdMStQmi-Dql-oeqJgYsuyW60EWLHQn74sox8Q>
    <xmx:mh7VYrGY_VMRmmPLr0hBKcMsjMWCihchJnYP2BTI5CuI3IlSZOlF_w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 18 Jul 2022 04:49:29 -0400 (EDT)
Date: Mon, 18 Jul 2022 10:49:27 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 submit ready for beta testing
Message-ID: <20220718084927.nlomzhq3ipni5alf@houat>
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gmcvkdx3qvbz6i76"
Content-Disposition: inline
In-Reply-To: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>


--gmcvkdx3qvbz6i76
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Konstantin,

Thanks a lot for working on this!

On Sat, Jul 16, 2022 at 10:29:54AM -0400, Konstantin Ryabitsev wrote:
> Hello, all:
>=20
> I've committed the initial b4-submit features to the master branch, and I
> need some volunteers to test it. If you routinely send patches to the Lin=
ux
> kernel mailing lists, then I hope that volunteer is you. :)
>=20
> ## What it does
>=20
> The goal behind "b4 submit" is simplifying the submitter's workflow by
> automating away a lot of menial tasks, such as creating cover letters,
> collecting trailers, rerolling new revisions, remembering all the flags to
> git-format-patch and git-send-email, etc. The main workflow can be descri=
bed
> like this:
>=20
> 1. b4 submit --new my-new-feature [-f v5.19-rc6]
>=20
> This will create a new branch called "b4/my-new-feature". If -f is not
> specified, the branch will be created from the current HEAD (but this is
> rarely what you want, so you'll want to pick a tag to work from).
>=20
> After the branch is created, b4 will create an empty commit that will ser=
ve to
> store the cover letter contents and some tracking information. You can vi=
ew
> the raw commit with "git log" just like any other commit, and you can even
> edit it with "git rebase" but it's not recommended. It's much better to u=
se
> "b4 submit --edit-cover".

So, I've been using a lot git-publish since a couple of years
(https://github.com/stefanha/git-publish), and this creates arbitrary
constraints that aren't great from a usability point of view compared to
git-publish:

  - The fact that you need to create a branch beforehand prevents to
    easily use it for one-off series. I'm sure it's doable, but it's not
    clear to me why you would want a special branch in the first
    place...

  - ... Apart from that special commit. I'm not sure it's great either
    and am almost certain I'm going to screw up rebases all the time,
    dropping that special commit.

git-publish solves kind of both by storing the cover letter content and
it's metadata into a tag, one for each version sent (with the pattern
$branchname-$version), and a -staging one for the next version that is
going to be send.

This also allows to easily rollback to a previous series version and
it's transparent to others whether you're using it or not, the history
is clean. You can even send the PR directly from the branch if you want
to.

> 2. b4 submit --edit-cover
>=20
> This allows you to work on the cover letter using $EDITOR or core.editor
> as defined in git-config. Once the editing is complete, the empty commit =
will
> be updated and the entire branch rebased using git-filter-repo.
>=20
> 3. use regular git operations for the rest of your work
>=20
> You can apply, rebase, edit, squash, etc -- just avoid touching the cover
> letter commit. You can also push the b4/my-new-feature branch to any remo=
te
> and pull it from anywhere else if you want to switch computers.
>=20
> 4. b4 submit --send
>=20
> When you are ready to send off your series, you can review the resulting
> patches by running:
>=20
>   b4 submit --send --dry-run
>=20
> or
>=20
>   b4 submit --send -o /tmp/somedir
>=20
> The first will print out the patches to send on stdout, exactly as they w=
ould
> be fed to the SMTP server, and the second will output the patches into the
> specified directory a-la git-format-patch -- useful for running "checkpat=
ch"
> or any other checks, as necessary.
>=20
> When you are satisfied that the patches are looking sane, you can fire of=
f the
> actual --send command.
>=20
> NOTE: when we find a scripts/get_maintainer.pl in the repo toplevel, we w=
ill
> automatically run the most-recommended (that I could find) combination of
> flags to automatically populate the To: and Cc: list in addition to whate=
ver
> we get out of the cover letter and commit trailers. You can turn this off=
 with
> --no-auto-to-cc.
>=20
> NOTE: at this time, a working SMTP server and a valid [sendemail] section=
 are
> required for sending patches. The web submission endpoint work is not yet
> completed.
>=20
> 5. b4 submit --reroll
>=20
> After you send your series and when you're ready to start working on a new
> revision, you'll want to --reroll to increment your tracked version. This=
 will
> automatically update the cover letter commit to add a "Changes in v[N]"
> section that will also contain a link to the v[N-1] series, creating a
> historical breadcrumb of revisions.

Similarly, I'm pretty sure I'm going to mess this up all the time :)

If you start tracking which version has been sent last, b4 submit can
just reuse it and add 1 by default, or something else if one needs to.

> 6. b4 submit --update-trailers [--signoff]
>=20
> As you receive feedback on your patches, you can retrieve any received
> trailers from lore.kernel.org and apply them directly to your branch. Thi=
s is
> accomplished by retrieving any threads matching the unique "change-id"
> submitted as part of the cover letter.
>=20
> One thing to keep in mind here is that actual trailer matching is done by
> comparing the patch-id (see git-patch-id for details). This has the follo=
wing
> important bonuses and caveats:
>=20
>   - You can rearrange patches or modify summaries without it affecting the
>     match.
>   - If you modify actual code (even as much as fixing a typo in a string)=
, any
>     received trailers will no longer match. This is as designed, because =
if
>     you change the code, it's no longer reviewed (but we won't remove any
>     existing trailers that were already applied).
>   - when you use --signoff, this will move your own "Signed-off-by" trail=
er
>     below any other trailers in all series commits, which is commonly
>     recommended for the chain-of-custody purposes.

Ok, that part is really awesome :)

Maxime

--gmcvkdx3qvbz6i76
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYtUelwAKCRDj7w1vZxhR
xREMAP9PD24FhIsu+WRL654meatzYSt0UP6WXP9qG5yunEqaQwD/cYOjGpkAjxJx
S8/TkQDAgCZ4a4b7IL9XB4+438Hsggo=
=METG
-----END PGP SIGNATURE-----

--gmcvkdx3qvbz6i76--
