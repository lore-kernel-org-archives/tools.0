Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194293F074C
	for <tools@linux.kernel.org>; Thu, 12 Mar 2026 17:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773336917; cv=none; b=bs90iFHryhuTtXxHblWjcTZ4+/V3zDmsN+zj2gmGgYqTpAHOK4wrIc2/dQcmaqG7nZtxntXx4CVrok7X34MTUB/z4YLCfJp6OC6i6rxHedAwgxKCJ/kkTY8F2z5SxIbRLuXXx5d14BaeWzeZBD/OVbuUpsrUok1ZXn6LUuWHFQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773336917; c=relaxed/simple;
	bh=e4mP+jnQUd6HADjsSHBlOr49wrxgGHg3bnQu/7xkM2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z2e0Chn009HOtpouCiEcZaGqmsfzizKs/JgpxTRGvubofvJAJGaxbZTbvJul8k0fjeRW4xG9mEMhNyAg0C9hrfEqAXQTJRf7JrWs6SoPaf08rNtyERNaeAvAhLt6WdsY0X4qi11A0HhKDZ/Tvy3Yju77TcxlGZy0qQz8gigKqTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hOebYLrC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hOebYLrC"
Received: by smtp.kernel.org (Postfix)
	id DF51FC2BC87; Thu, 12 Mar 2026 17:35:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C034C4CEF7;
	Thu, 12 Mar 2026 17:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773336916;
	bh=e4mP+jnQUd6HADjsSHBlOr49wrxgGHg3bnQu/7xkM2I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hOebYLrCj9K0JFsH9W9hMKRgoPjsYwiTjVrk0I20T/oGHOcvWU8A4IBQLoYUYNP8O
	 Q9YDrp/VtKM2fQHiOxpaS5mZKrpGP0a5DikNedjzw50bKjyxH8oSwCyWBUmbaKRzHr
	 6KFhQjrbVnhs6OwCNcL6YGMTIUKrVvhVFwzx0QwJzPgUEgd1AWffjiGWzJI0e+uwoU
	 Way5kgPuJ0bddyhU0/NufkDInNSFS6VLBmQ82z7uTVhX2emTuv34ma4U8RhNZn50oN
	 2oeOMLKwYFw4UIhz9LBbcRWjLimux5aZEcWN/K2x9q8ZOhztrH4gt96HAS3Fg8jJJ3
	 0kTmE7FilO2xg==
Date: Thu, 12 Mar 2026 17:35:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: b4 review available in master
Message-ID: <7bdd4c85-7202-4b80-aae5-67c99fabddf6@sirena.org.uk>
References: <20260227-imported-aromatic-guppy-ad3dca@lemur>
 <aaMPYVIgmsDpn7Rw@sirena.co.uk>
 <aaNaArEgAe0SgmSh@sirena.co.uk>
 <20260302-juicy-spoonbill-of-jest-6fc659@lemur>
 <e7d999c0-c27f-4d9d-8812-9ff3254ea7cf@sirena.org.uk>
 <20260303-true-glaring-raven-e78bf2@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7sqs0l//lZ93qOw7"
Content-Disposition: inline
In-Reply-To: <20260303-true-glaring-raven-e78bf2@lemur>
X-Cookie: I feel better about world problems now!


--7sqs0l//lZ93qOw7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 03, 2026 at 01:21:21PM -0500, Konstantin Ryabitsev wrote:
> On Tue, Mar 03, 2026 at 12:42:26PM +0000, Mark Brown wrote:

> > > I'll push back on this a little simply because there's a lot that is keyed off
> > > the number of patches in the series. If we cherry-pick before we even review,
> > > this makes a lot of other functionality fragile. However, there is code now to
> > > mark patches as "skip" (with x) -- this should let you completely ignore them.
> > > When we "take" a series with ignored patches we will automatically default to
> > > the cherry-pick strategy and pre-unselect the ignored patches. Would that come
> > > kinda close to what you want?

> > Possibly?  I'd need to try it.  Some of these serieses are quite large
> > so even finding the relevant mails can be annoying.

> Let me know if that's not sufficient. We can also give a way to hide skipped
> patches so they aren't even in the picture.

Having used this a bit I think for larger serieses hiding would be very
useful, and it would be useful to still be able to do a merge even with
skipped patches (common case is some DTS patches at the end of a series
which are basically unrelated to the main series).

--7sqs0l//lZ93qOw7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmy+VAACgkQJNaLcl1U
h9Cvvgf/Q33EfpDoaRuT8QKcpcQFVSHZq8umRKg7+ylau54sDZLE0O11N4kkhs2k
FNltl55hnZX16v6BIIrNylc23dARPnz75xuH3m23pJX6ZJdeqE04gstOj5VqzwaG
VbLXkJFcJ3dGbtBpaziMYLzZGM7/G9ygNVitn89IF4eGsBhNfVv2Ut9bujJlFdlv
n+qqQIn8odUsM8KD3qA8gt+FZaONnkul+zsKbeiBSsYkn6oky6FBdMTg+CS3cg/x
JQI9OMFfSCgsQSBJDOgtBxqiFdLYbqC3RFVeAAM+siH0iEVvETYWIdyisA4EgNhN
X+8rluWI033ViULkV73JaFX5dtUEgg==
=FFDt
-----END PGP SIGNATURE-----

--7sqs0l//lZ93qOw7--
