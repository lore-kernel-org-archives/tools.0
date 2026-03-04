Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622592D8DA8
	for <tools@linux.kernel.org>; Wed,  4 Mar 2026 21:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772660293; cv=none; b=fmJwQU4FSLr9J2oR58UvnbTkGJsUHxHUwmKfgWrWeHPEptBfa8tuW6zs10Iz85d4FAOvs9Hpb7HSVQ5Z3EaWkH1mpz8ldzrzZAhlQHSzMXoNHNfKQpb2nAcur6GgBzdesOh3gq92gxEYiOYt7VfbyXiKQd0nkugnQTEIj7Hz9lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772660293; c=relaxed/simple;
	bh=i7C0HrdyN0qsuJTgF0Oc8vjjLNRf66p1VI2x6nuyj2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z4eGwbhXK/YUQ1OfM5TzIoSbFhwBC+jl61BM682kyCS3xq3EfFSRl8sNTttjR+SHwuDaHHNWDoCH7CYOayfkCQVlt9MmOoejHidE3r4meYdkhdmV9Tn3zu0i9jGDD3U9K/rnYwysyg1phhdeeBxl/kY+kdAqRAi2tiQDiAl71OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e2KZfNJc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e2KZfNJc"
Received: by smtp.kernel.org (Postfix)
	id 3DE64C19425; Wed,  4 Mar 2026 21:38:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B190C4CEF7;
	Wed,  4 Mar 2026 21:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772660293;
	bh=i7C0HrdyN0qsuJTgF0Oc8vjjLNRf66p1VI2x6nuyj2o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e2KZfNJcxv20zBk+dhUBLWJrO8SHiojVFcF1DE+hTxHgCPLcVq9iQ2x3ceuX39a+k
	 xQcD/SYwXWdpvYvmw1MO0uUBx7o0YCW64b1kwKH3AYUVvhab567LAK+L8LyRxk7f2H
	 RmOy8G1EvtyH5xvNo+pyvdPvqhpHaLzAPpl1iPMneA42qVqLT+/y6nciyxukCKy3Tu
	 rH+QOkPZa1sCcwy6sD0XiZaUezCm6ODOJM1AIx9oRgzKdufcwd0t6cHUHSlU7MM8uv
	 fX6zrKr1+TFrMtZOtg1QmuLs4z5h+ZZMWGZJYD+wOj+7w3VO0lXoZxL0FpAn5WrSr6
	 4GXrNyi06R0AQ==
Date: Wed, 4 Mar 2026 21:38:09 +0000
From: Conor Dooley <conor@kernel.org>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: b4 review available in master
Message-ID: <20260304-deviancy-overlaid-e7947f09089c@spud>
References: <20260228-crested-swimwear-a57a3060b860@spud>
 <20260228-unbiased-mature-beaver-680aba@lemur>
 <20260228-pasty-clerical-b87a92aead3c@spud>
 <20260228-ruby-hawk-of-valor-41f0b0@lemur>
 <20260228-aqueduct-nuzzle-c03be63e03af@spud>
 <20260228-arcane-mamba-of-refinement-6dba82@lemur>
 <20260228-poodle-of-wonderful-justice-acfab2@lemur>
 <20260228-gulf-mountain-5f935fdefaea@spud>
 <20260228-charter-keenness-1256807e458d@spud>
 <20260303-tactful-zippy-oxpecker-fbcadd@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4EksU3nexQU3zMdh"
Content-Disposition: inline
In-Reply-To: <20260303-tactful-zippy-oxpecker-fbcadd@lemur>


--4EksU3nexQU3zMdh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 03, 2026 at 12:16:18AM -0500, Konstantin Ryabitsev wrote:
> On Sat, Feb 28, 2026 at 10:32:04PM +0000, Conor Dooley wrote:

> > I feel like I am spamming you with responses here, sorry about that!
>=20
> Please continue! There's also a hopefully-noticeable notification when yo=
u're
> running the review tui from a review branch that will tell you how to get=
 back
> to the series tracking view. :)

I tried again today to use it but ran into some things flow wise, that
prevented me from actually doing any reviewing.

Firstly, with the patchwork pane, how do I determine which states
appear? Most things get set by a bot to "needs ack" in the dt patchwork,
but I only see things as "under review" or "new" in the pane. We use
"under review" to mean the bot is looking at it mainly and "needs ack"
for stuff that humans need to look at, so I need to figure out how to
display things with that status. Pretty much this is "your default view
doesn't match the default patchwork view (State =3D Action Required)".

Secondly, if I'm working from a patchwork, it'd be really great if I
could reply to patches directly from the patchwork pane. 90% of patches
I review (or more) I do not need to apply, so working in mutt is
significantly faster than having to track, then open in a different
pane. Related to that, being able to display the patchwork pane
per-patch as an option would be a wishlist item to make this replace
mutt for me.

That's from a dt-bindings review perspective though, how these things
work is fine (bugs aside) where I am the person applying patches. It's
probably far from the end of the world if dt-binding stuff stays in
mutt, since it's probably atypical.

Oh, and I managed to trigger a formatting bug again, on 0.15-dev-54639

	MissingStyle: Failed to get style 'v2,1/2'; unable to parse 'v2,1/2' as co=
lor; 'v2,1/2' is not a valid color

after grabbing a series from patchwork

	/stuff/b4/b4.sh review tui -i linux-dt
	Retrieving series: <20260212082105.1878720-2-sh86.bae@samsung.com>

It creates a massive spam of text, but it contains:
	text =3D <text 'Started tracking:  dt-bindings: soc: samsung: exynos-sysre=
g: Add hsi0 for ExynosAutov920' [Span(18, 88, 'v2,1/2')] ''>

LMK if you require the full log for this.

Pretty sure I replicated it on 0.15-dev-18f8f too, but I'm not entirely
sure as I cannot untrack series to retest.

I also hit some weird interaction, where after hitting track on a load
of stuff in the patchwork pane, nothing shows up in my review pane, but
it looks like it should have appeared:
	/stuff/b4/b4.sh review tui -i linux-dt
	Retrieving series: <20260220-ayn-vendor-v1-1-292cbbb682b3@gmail.com>
	Looking up https://lore.kernel.org/all/20260220-ayn-vendor-v1-1-292cbbb682=
b3@gmail.com/
	Grabbing thread from lore.kernel.org/all/20260220-ayn-vendor-v1-1-292cbbb6=
82b3@gmail.com/t.mbox.gz

--4EksU3nexQU3zMdh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaimQQAKCRB4tDGHoIJi
0s0+AQDINJrkY5Bae51KKRkeUsIaE1OwCZH+fmulHOOyeS4IDgEAmCrDRybkkB8u
w4yyP5yQP71qc2Gwus2vTkryBcLovgY=
=ts+5
-----END PGP SIGNATURE-----

--4EksU3nexQU3zMdh--
