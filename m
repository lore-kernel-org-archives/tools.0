Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E349239FFB
	for <tools@linux.kernel.org>; Fri,  7 Jun 2024 19:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717790233; cv=none; b=FjM8qT/MWA4icWA1yJ/a8vyAGw/zKKiyeENzSJKuZlzL7OlvxZWxSCaNIZWZjMXCC0FEyJVOQITMZLJ9SS7KancyzvpWs7nCoddvpX/TkXwaqAwlpUvB5pnbmVlQewdmjBtBHSi3zzQ2dZEeJT3Oftdl9V/BhiiJ1Z278pQTA5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717790233; c=relaxed/simple;
	bh=ui419ZLsbgyNH/ohRP+36umStLNHJLdpcxMXK6qu/Os=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DFCENXWgkO/9Ye3dGeXef9qIzROiMQNEnTR0pMBZUo0h8AOjgBVck0J9/1BS9WmduVho8DHdHH2Ox96a37rtr8SpVOT1Qgq6zdKFvvJym3jvRL2SVKw2GWWonLHriRFzObcajkcYlueSkNULc/C37fM5OQ9y4LI0Etb9Udfd7CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dBXPiBkC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dBXPiBkC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E329AC2BBFC;
	Fri,  7 Jun 2024 19:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717790232;
	bh=ui419ZLsbgyNH/ohRP+36umStLNHJLdpcxMXK6qu/Os=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dBXPiBkCu+ZfwMoyjsULbDubIqnn1DHKRsgDXhTyadBU+PVaHxdwz9hVXdH3pceOB
	 kCO+21dDhkQnx2GWKsReNCCYCEuLWl6SUyqJmy4ZEv3V1vjkV1dYVeN56F8Miigilw
	 KEaUtJg9VNRCwjzP9SGiA8Q6zzNH/uZ1OdnQmgyVR537CUu7IXIHfqKjspFRxsdSlG
	 mTOOFYlqK57atP5G7k2qipslwMyx3X5wSFFsSRYBIN8gKM65BAJGdvcQN/9tOBE4Ug
	 lPREvu13R24ahbtoDZ2SQCJQN27S2g/ky8iECIGnOanSE/dec9j0ZzxHBjMmEgUvV4
	 Jxr2ArfpC6GWw==
Date: Fri, 7 Jun 2024 20:57:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools <tools@linux.kernel.org>
Subject: Re: Trailer updates to git commits not working
Message-ID: <ZmNmFeCL73-EBBS1@finisterre.sirena.org.uk>
References: <15b55c55-8060-4c46-b545-3a3e774a9875@sirena.org.uk>
 <20240603-opal-wolverine-of-tempest-7a8939@lemur>
 <da75a55b-a698-4723-958c-6ee5e3b55104@sirena.org.uk>
 <20240603-frigatebird-of-unearthly-satiation-62b1ff@meerkat>
 <020408d3-4918-47bd-b8de-5ca89de72935@sirena.org.uk>
 <20240607-practical-aboriginal-lionfish-b8b4ca@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s7b896oQ0L7DOPGP"
Content-Disposition: inline
In-Reply-To: <20240607-practical-aboriginal-lionfish-b8b4ca@lemur>
X-Cookie: Your love life will be... interesting.


--s7b896oQ0L7DOPGP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 07, 2024 at 03:30:28PM -0400, Konstantin Ryabitsev wrote:
> On Mon, Jun 03, 2024 at 06:51:36PM GMT, Mark Brown wrote:

> > Yes, exactly.

> Okay, so with the latest master you should be able to just do something like
> this:

>     b4 trailers -u --since-commit [commit-ish]

> You don't have to specify anything else -- we'll query lore for any matching
> patch-id's and bring them in for any commits where you're the committer.

Great, thanks - I've updated my scripts so it should get some use on
Monday.

> This should simplify the workflow where you're queuing up a bunch of patches
> for sending upstream and just want to make sure that you apply the latest
> trailers that were posted.

> I'll be happy if you trial it out. It shouldn't do terrible things to your
> tree, but it may bring in surprising results -- e.g. a patch may also end up
> included into a stable AUTOSEL series, receive a Tested-By there, and that
> Tested-By will end up in your commit. The UI will now show where we're getting
> trailers, but there isn't yet a way to exclude things you don't want.

FWIW my use case here is on applying patches from the list so there's
relatively little chance of false positives - my workflow involves
queuing mboxes to be applied and then sometime later actually applying
the patch (sometimes considerably later, eg during the merge window or
if I'm leaving a while for others to review), I'm using b4 trailers to
pull in any tags that people sent in the meantime.

--s7b896oQ0L7DOPGP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZjZhQACgkQJNaLcl1U
h9ClTgf+PVBhBaO53xk9Ft/G1+QztXx9Urtm4rWiWe1vjs+XNC1USe1epDUh8RPS
k4SBVOBx8/qqfhhQ3LRLMO8ql6PJbGu/AHExV6mHU8/PNwIskYUbkosXXO7PWGIB
vXkFN3lmiW6TlQ26O8n6zQRHY0Y/3OWXGdgw/YZefd/cHQrY8jK8yGWdCCQHN1Ob
pDJQwqMNTvEHy62GYfk+ClCpN1ZWmnSbBDXWZ6djdk/EFNZZiXRaqxx82nw/sERX
3QC1V9+XTwGG4zMDRYh6X/6SQIQ8XHSn3zSTNk1zzmcl9X2+cx9Nd32yefY/ZRQy
kPuLlIqjX3Y0rdTV9tx4fY2dzY4yLQ==
=gwSc
-----END PGP SIGNATURE-----

--s7b896oQ0L7DOPGP--
