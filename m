Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A30F4BCAD7
	for <tools@linux.kernel.org>; Wed, 10 Jun 2026 15:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781106354; cv=none; b=odQLfisdMKSP3SLXHx0ePS4IegcTdw2sSuPIKgFnRPzggTr8y78NTmWe1TzY1GC9SY9Rr+16R4uxOBb1BwwPZFH9Y3jonZHha/VmUDBkM2Ton6e6q4Qx0heqf35U8Lhawh3rUa1uLV5vMJt1RoZL95gX2p1XnTiUvTLl0cL6XIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781106354; c=relaxed/simple;
	bh=Fy6GM3QZCbG/BPfo45uoKDaGInGbSefJZ+aJBsnV+us=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FiodlJoDxfoBfMHDYrVHuENdAJUx7nxQShSnC7lnCXNPeRmGzAUIFOdY2qg8DcVDU9hL7rcyXfNCgsuwtbRu2ScFVTBEPiGe2Oek94c0/qXzGq5qatw2U3GtN8amBzJxlAKre6tna0pk5RQt4/FvYSCH+1Z4wOX1zaj+kpgcANU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N3/y9vKt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N3/y9vKt"
Received: by smtp.kernel.org (Postfix)
	id 15ADD1F00898; Wed, 10 Jun 2026 15:45:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD2061F00893;
	Wed, 10 Jun 2026 15:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781106353;
	bh=TmYK/oTHjliZzEetF4Le7DqtttNPg8T2lxusfb0Uwnc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=N3/y9vKt+xCMlIJafb6xoQ0OYJoRjfLOObtLaEnFcFzM2m+WVR3o9s2zrHC8n5wva
	 SkUQ82+OYlwYYiBL/kIVyx9WgvHfFVm7eP1MNPGn54ympTqsK+SbGtL0KFTv8YRvJ9
	 VgYcRfXYVtx2ZlhchFldEuW4Fy6ckVnhHfblrVO+85BpCVHbil9fGIhR2FQ0jHK91T
	 LLatw00NAaZyyenZWsSIKfg1d5geCtXtjXHbK8AVT9nvJzTcHQxebnDbNk0axDiuPi
	 q89+ihP5VuFOgeJ5cGyq9qeGkPEvMvMCTmENXDXSIMY8qt6d9xyVwV7qrKz19EuC4Y
	 5PWInZ5ey9grg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id AD0731AC56C5; Wed, 10 Jun 2026 16:45:50 +0100 (BST)
Date: Wed, 10 Jun 2026 16:45:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: b4 review workflow issue with partially accepted serieses
Message-ID: <aimGrsvLkQEHXmgV@sirena.co.uk>
References: <afk5QvNAQDxFCbvT@sirena.co.uk>
 <178104250404.112711.2880594121343252200.b4-reply@b4>
 <ailGd8akixhx_GHg@sirena.co.uk>
 <20260610-influential-wolverine-of-improvement-f01d0d@meerkat>
 <aimB2DACiXv6MIQk@sirena.co.uk>
 <20260610-premium-congenial-beaver-2af169@meerkat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g8vLFBMIW4L+pzue"
Content-Disposition: inline
In-Reply-To: <20260610-premium-congenial-beaver-2af169@meerkat>
X-Cookie: Leave no stone unturned.


--g8vLFBMIW4L+pzue
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 10, 2026 at 11:35:11AM -0400, Konstantin Ryabitsev wrote:

> Ok, thanks for confirming. So, a partially accepted series falls in these two
> workflows:

> - waiting for next revision; a v+1 should wake it up and put the series back
>   into review mode; additional patches may be accepted from follow-up
>   revisions (partial+more)

> - done and dealt with, thanks sent, series archived; a v+1 should be
>   completely ignored (partial+done)

> I'll see if I can disambiguate these two workflows.

Yes, both those flows exist.

--g8vLFBMIW4L+pzue
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmophq0ACgkQJNaLcl1U
h9DCNwf/cSA5bSARI6kjL/fYXuR09VjE9XC8SdqgUkzixYv90G6rYnzmGbZ7YmH0
w4nQ0w4zvgs1lOMAVjx9EzcrjugnK2LRFl0VhJkHg662benXzLhL7LQqQ3RQdzV2
mbBunxdRt5fpF1JO3oRnrIu85a86Ev0uZFnrnix6P1GVJuU95HVTaxBk+7yJ6i79
5UzuQcAnEB+I7QtmPcvUiKq4GgLW9xk3XH22RDJrghpQUlB1aFwfQ2cYu7EtFHmK
Qfi21jf0/euoB7kWM7Gm2hKUltyeLNk5c3RifC87H6x2izZbMR8o0hgYjzdU0O2y
OktJKG5A+QD0eE4+kpiggBPhBSBoKw==
=K7CW
-----END PGP SIGNATURE-----

--g8vLFBMIW4L+pzue--
