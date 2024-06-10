Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409335588B
	for <tools@linux.kernel.org>; Mon, 10 Jun 2024 21:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718055690; cv=none; b=ME813OU8RSZH1gt5Kc28dpDQKwL6Nvm+E+Uux2GA9XS3SuB/0BGxbwoSPfLcts0eVDfAzycak4149L/Z75wom+939Tmpbg7g1jbsI5yIXCYPqfY0R2QGtbFfUp77UOr6zqL3bRBHcXp99cPzaNs2nhMu8N6LhSIeE04ygqnPxho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718055690; c=relaxed/simple;
	bh=qgqdW8T32BKEcoHlS6TfQwW73tXq/w6mBmLy+OF80Ps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L0HDNjxRpdeJJAx/PEHZEMf75BKIrAd0qnxtBFpZZtaIyx3bvm1Xvy6UlfWRAQqIr3mI+o4L0VOwMcllpQqGDT0XMbknnwQfJuK5z0xBhvSgMSvzUtqVNJVGy3PrHpLjIkELvGMByzhOEayceLH6XWkLxA8kRAvg5uEqA+pLo3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mp1/S2eW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mp1/S2eW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BD92C2BBFC;
	Mon, 10 Jun 2024 21:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718055689;
	bh=qgqdW8T32BKEcoHlS6TfQwW73tXq/w6mBmLy+OF80Ps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mp1/S2eW072q6u0bCDEfIlPm4gLK7inao0+Z/PhrT3470AszXUQ4z8+zKiupg4kbO
	 2CZcRQBrDWEl9lQnSY5i5oT6XrSd2n5APDKQzF7QleT4wYEFU6AHr4ilGh9rmDBhe9
	 nRBVTz7GhKRQ8X98C65tuJIhzCDSbDBB4iE5b1oyY3TQWXUhMWCprcRl37BI8lHTOi
	 29Buogsh0n4bbnU5ir1j8aiCAEyFVl9qAqqqhwH4iJN7GMNgaowsENcMjWAc51Px1r
	 t7vKVrL+7UL47rp0U8IoRlccdroU9O1OdbsQX9JySc0AS9jtCINr+cuFSz/cXvGxpi
	 NCzWl8ytcHLxw==
Date: Mon, 10 Jun 2024 22:41:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools <tools@linux.kernel.org>
Subject: Re: Trailer updates to git commits not working
Message-ID: <Zmdy_ypUGvbveRhW@finisterre.sirena.org.uk>
References: <15b55c55-8060-4c46-b545-3a3e774a9875@sirena.org.uk>
 <20240603-opal-wolverine-of-tempest-7a8939@lemur>
 <da75a55b-a698-4723-958c-6ee5e3b55104@sirena.org.uk>
 <20240603-frigatebird-of-unearthly-satiation-62b1ff@meerkat>
 <020408d3-4918-47bd-b8de-5ca89de72935@sirena.org.uk>
 <20240607-practical-aboriginal-lionfish-b8b4ca@lemur>
 <ZmNmFeCL73-EBBS1@finisterre.sirena.org.uk>
 <20240607-charcoal-bobcat-of-valor-ef78ce@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o9tOkOzHmp84b4ey"
Content-Disposition: inline
In-Reply-To: <20240607-charcoal-bobcat-of-valor-ef78ce@lemur>
X-Cookie: Your love life will be... interesting.


--o9tOkOzHmp84b4ey
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 07, 2024 at 04:01:14PM -0400, Konstantin Ryabitsev wrote:
> On Fri, Jun 07, 2024 at 08:57:09PM GMT, Mark Brown wrote:

> > Great, thanks - I've updated my scripts so it should get some use on
> > Monday.

> There's a "Ctrl-C to abort" step in the trailers process now, so you may need
> to run "b4 -n" to auto-skip any interactive steps in scripts.

Thanks for the pointer - the bits of the scripts that mainpulate git
only ever get run interactively anyway so it's not such an issue, I've
left it for now but might turn it off if it gets more annoying than
interesting.

--o9tOkOzHmp84b4ey
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZncv4ACgkQJNaLcl1U
h9DWXgf/UCHTGE2b7bI0Y0WEFO9Dl8v5ZvBfaGjtAlfTfqqoqKYwYRC+LoGHjKHo
xyQkXVbMBpXPPfqG+yeBChH7ULwYBMKLeItpGlDlV0ppACkKQ+C3vtBBtsi+MXzT
H4Qxvbhykkt/IBDvYgeHvLlXAOEGvuLE6wkRxUPVLrqf9SlknctsGy89mrTf/d16
OHeY5NsBJFBtAW+G/85zqnEIcTMV/5lxShbSQOhkk7Sln9rwfgTEI7Szke0mqH9q
I7Dty0ZXiGttBptmkMm2ZreW+zIWrOHrKvuq0F+/LuEC+GIx1rnZDtsfweT/Y7kC
SePUGPeL7JOqkoykKePtAVFv4d9C7A==
=NWSD
-----END PGP SIGNATURE-----

--o9tOkOzHmp84b4ey--
