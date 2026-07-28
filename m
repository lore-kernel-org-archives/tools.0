Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F423D9699
	for <tools@linux.kernel.org>; Tue, 28 Jul 2026 18:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785262230; cv=none; b=LWnyBGIHBRUlygPuk6mzRuNQB7pvyN5RnxsYEywSmPqajvF9vNPm1O/kMNDR9THJHi1yfb9UD2QW0vWgeaQXtL5ERKKmflg0I18c/YCEgRrWZQH6qQ8AxLxIWmjD+HpGHBHXZ0NLVtiRIxQ1IPTHT0Jt2PlJ9uZamvYVBpBibms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785262230; c=relaxed/simple;
	bh=0P8pDMthmDLxs+ftydRcr/4rUO4d6WHrIiKRU6Oq3x0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kik/7ZY3V3VynR4IdHKAYKPdgl57r2B+3TpiN0kFOzVpyAX4IhQa3vKVUHbqjS4y5kXRgSC+mEP+RhKs0qZ7O+3FUsrudSIyPv/kka8cMjfw0EjFjnh2bYWqRn4Uny8wzYZIilS2arNikgPMv4cp+SNTzBmh8YWJbhp1rYSlh04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d3ZlkBnH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d3ZlkBnH"
Received: by smtp.kernel.org (Postfix)
	id E58A91F000E9; Tue, 28 Jul 2026 18:10:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3904F1F00A3A;
	Tue, 28 Jul 2026 18:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785262228;
	bh=fCP42HB0cn2cw8q40URe6oB5bE2t6rGbrNAhvkTkl6o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d3ZlkBnHL0fPlkITS2WkEO5fCoXBSUBLci1XAO/XNixo1/t5bBnn1qGpFxR+b4kOh
	 uyK9F7W4kgOJCpOe77ZMndxCieRoz1y8AnmlcJ7JGvzEhxXy24/7jNiuAGHITvCK+L
	 Kg8jiyQFA1GFhenwbni9Q9qvbNTLU8xp3JY8LPvf/ip6w9wCpl+HKJC/NaYhF2ea95
	 b/w4JXLlK8dbIaf1z0jNrG4XLVLOE63RojflXTkfvbIA4BYGjHEOT3Cv2nm9AhwZMV
	 vfEsV37Hvaw/Q5g76Aodam4w9160bjNEqW+sMuGSw7urs2VnB5k8qjCRDduS7S/Yuh
	 J7oQ9kWrYiScg==
Date: Tue, 28 Jul 2026 19:10:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: b4 review surfacing updated serieses
Message-ID: <2eccbfad-af34-4f0d-81b8-2f38735a9780@sirena.org.uk>
References: <b356bccf-8e14-41da-8369-53eb442d0f30@sirena.org.uk>
 <20260727-innocent-zippy-sambar-51cfe4@meerkat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/aDwkvehfQppg257"
Content-Disposition: inline
In-Reply-To: <20260727-innocent-zippy-sambar-51cfe4@meerkat>
X-Cookie: Stop me, before I kill again!


--/aDwkvehfQppg257
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 27, 2026 at 11:37:59AM -0400, Konstantin Ryabitsev wrote:

> I've reworked the upgrade flow on a branch (feature/has-newer-first-class)
> to cover both the waiting-upgrade awkwardness and the stuck-partial case.
> Please give it a whirl -- it should be safe to try/back out as it doesn't
> change the db schema. I don't have nearly as many series being reviewed as you
> do, so I can't fully test it beyond what's in the test framework.

I've merged it in and have been using it today, it's much easier to work
with and I didn't notice any issues.  The up arrow is particularly
useful.

--/aDwkvehfQppg257
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpo8JAACgkQJNaLcl1U
h9Bj4AgAhnzQ1Z68ox4cvqm7RJWrH09+8xYbLaIB9H4kfm72kL0qhoSflzANLTyj
FOor05AZydt03524ktljfADHOflyWzfxEqABwZCUNb6atz70ZDkAkvLRjxCkRDTG
VY+7EJxgsNow2MotufWvjx0fjUgSvmtkmI+wrgVMsKsX6PBp/wQQi38LWo0kthAK
RCozNHwqMPrRaFRqucmuspPHt1BEf6XRTUV9fdLEy/ZrcAj4fdo82heocO9cfMcC
IN/rlXIoqz2xuhzzXMGNvKzXOA/DyWjP1TRGDCEmfGVelSRS3a1tdKLvXJ34+jAj
/uoz21uEJcoL1OEHG3/Vha33WRjBig==
=tAv6
-----END PGP SIGNATURE-----

--/aDwkvehfQppg257--
