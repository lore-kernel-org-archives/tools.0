Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627C538D41C
	for <tools@linux.kernel.org>; Fri, 12 Jun 2026 00:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781222406; cv=none; b=Ze4xxg4qTIEeCBNzrnlYFnhCBIiB+vrv9IPq4wHuPV04MlzmzOMmobFxBxA28/eUT4c+HDp/1naFaJq8TQX5JrgMCStYH8PQ4SZ+2joI1omgOovFiIvrB4B20tB3R+5Fpnd0Oq+VxahNV+NFTavfsGtYkJHXTDeJbRrsIIq67uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781222406; c=relaxed/simple;
	bh=xVbV/MlzCCVtIZTTkYAtxoEs6IAzPu6LpNK+aM299Ik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e836LnoDo0gkKVkRtPJHCuU/GYzbCsh5u/saKADngPLUVZDC7Wp8C4XNcg6Ri4p2xY+cMY8mKORUo+TZ6kanoscEZGlS7k4PMfpO4rf4aF7HSbvs6nfde8AFnmdFYUrRm4rK1bOegk0CO2Hf9y8d1Y5movZSHDeBumFUv1B4hNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oeok8GkH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oeok8GkH"
Received: by smtp.kernel.org (Postfix)
	id 2BC071F00A3A; Fri, 12 Jun 2026 00:00:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD36A1F000E9;
	Fri, 12 Jun 2026 00:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781222403;
	bh=uH8vBdEvdeJWvl0h9QhRcNDBr5njJmmKFRR6Oz7EqQY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oeok8GkHQS2PLS3M/kL7cIXM7WdiGwVdSzWEVTsARvd/I3JesmKiwSUUDf4yuzK5E
	 uLzF3uxwv6tGn2xXDcDDStgsFlKFb7W66BFtuUigI20rC2nMJfmqrYNF3jClCTsTB0
	 U+8Ay77EsTwpA9dcnBO5wfv/1vdUJkI+TGkcEuSVL+viF083OpCh3SMtnrHWQDo3GQ
	 oYPSq9MP+2WL1ALM7hX4SCZNuW4O3yDNaqV6TUa+0C5Mba56S0t4DVl6Yu1IrkJa6H
	 CveOj6avcNA0Ntv94L4HQ3ddk+Tc2PMBTTEL2KgM97vv2x0fr7tk3BTOFPbw7MiXUf
	 miquB4+wkcE+g==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 6C5C01AC58C5; Fri, 12 Jun 2026 00:59:59 +0100 (BST)
Date: Fri, 12 Jun 2026 00:59:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: b4 review update issue with bad connectivity
Message-ID: <aitL_0RoILKYXYkn@sirena.co.uk>
References: <air1edZVrBclly3H@sirena.co.uk>
 <20260611-fanatic-grumpy-rook-84a68b@meerkat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1vTQ54T7SHyQp6OJ"
Content-Disposition: inline
In-Reply-To: <20260611-fanatic-grumpy-rook-84a68b@meerkat>
X-Cookie: Leave no stone unturned.


--1vTQ54T7SHyQp6OJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 11, 2026 at 05:43:23PM -0400, Konstantin Ryabitsev wrote:
> On Thu, Jun 11, 2026 at 06:50:49PM +0100, Mark Brown wrote:
> > When operating with poor connectivity I'm finding that b4 review's
> > update functionality can just go off into space non-interruptably for
> > very extended periods of time.  It should be possible to cancel network
> > operations to get back to doing local only operations, at the minute I
> > find myself killing b4.

> Yes, that's something that was long overdue. I've pushed updates to both
> liblore and b4 in master -- note that you'll need to update liblore to 0.8.0+
> for it to do the right thing, but the latest master should let you do Esc to
> interrupt network lookups.

> Try it out and let me know if it's working or not.

The top commit I'm seeing on b4 ATM is 09a97c02bc0b ("review: editors:
optionally mark skipped lines on plain deletes") - did you forget to
push?

--1vTQ54T7SHyQp6OJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmorS/kACgkQJNaLcl1U
h9Bccgf/VMkNgFD6KtcSc3hW7eA3FScw/jAAnFupt66f7CsHfkZrwh0iTTcMSIiS
4/LvNJqcbQwTRyGI9CsZrmYeovYG9SEJUPljL619mcxPefVor2dOycOAkKev/suV
ItsDvYpnkYGygA3Ich4f7jc/fMitHF7NcrtLMlkiK+N+saP0FhR9/0mNIm/zTLkg
hX++TtcoOw6GB17kPp+RsdXZbJu0iDm5FjhXMqxevN5VZH5vk3Er4Fa1DNMZB6dp
90L3uP7sq0IvQXbbMjf914qcPu8acDhG6Ov1uqsEEc57eZsgLCDJstbpqRapG8Dt
w08K0iAoj+tduY1jA0XGHcpFSQOlsg==
=rwgu
-----END PGP SIGNATURE-----

--1vTQ54T7SHyQp6OJ--
