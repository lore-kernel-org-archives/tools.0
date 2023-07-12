Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E2C2101
	for <tools@linux.kernel.org>; Wed, 12 Jul 2023 18:35:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CB31C433C8;
	Wed, 12 Jul 2023 18:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689186949;
	bh=2FBpexjro64WUBkSMei4BgomzyDFpstOyemqrvwHrzQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Irnpcj1qsX4kNjJ6SHTdbofMMnC6nbGcQs2C4Ar0F8rsMHru9052JJbGawBhgf9fs
	 xknDXfLsYO53+eUuYKjzmFDzMfBThi36wzHo7Zntx3w9AZYtArcXxGLDcPNsRBPYA8
	 ItogF8IXeWxpmczO1C0Nak7PJdb/u8lwzwVRDsVaBsepI6igvEv02RtgeE0k8Kbdco
	 abgso72YT1G3Qqtx1vLHVi3Y6xwIlS+XmJCVxVlOLTvjkUoyqqQJsMWtgVhmnkZsCQ
	 whxeCQbsbTLTQUe35f7u1DogeyfDrVm9jCKQZoFNnvtWaATmDAxFEHZDXqifKsgfSf
	 Gb9z+dz7aMJbw==
Date: Wed, 12 Jul 2023 19:35:45 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	tools@linux.kernel.org
Subject: Re: [PATCH v2 0/4] ASoC: rt5677: Refactor GPIO and use
 device_get_match_data()
Message-ID: <9327ba4e-2df7-4eba-85c5-4da7bd64d2fa@sirena.org.uk>
References: <20230630172155.83754-1-andriy.shevchenko@linux.intel.com>
 <168916242630.46574.7633971537485557226.b4-ty@kernel.org>
 <ZK6xI8l7Vdp35yJG@smile.fi.intel.com>
 <d5cac1ef-1d44-4ab7-a933-b381108b1eaa@sirena.org.uk>
 <ZK7HUTyKB6hoaBtV@smile.fi.intel.com>
 <20230712-semifinal-expansive-f9189b@meerkat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yoO7lKbn6SwSRdYo"
Content-Disposition: inline
In-Reply-To: <20230712-semifinal-expansive-f9189b@meerkat>
X-Cookie: Dammit Jim, I'm an actor, not a doctor.


--yoO7lKbn6SwSRdYo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 12, 2023 at 02:09:39PM -0400, Konstantin Ryabitsev wrote:
> On Wed, Jul 12, 2023 at 06:31:29PM +0300, Andy Shevchenko wrote:

> > Konstantin, seems b4 doesn't handle long Subject lines for merge commits
> > (PR mode).

> Could you give me something more to go on? Was this done with "b4 shazam" or
> via some other way?

The patches are applied from mailboxes fetched with b4 am, then the
thanks mails go out with b4 ty.

--yoO7lKbn6SwSRdYo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSu8mMACgkQJNaLcl1U
h9AZygf/YOnSzGCAGoicP9w7tKfSODU+w9BHdMDSa+pPrFR58lwiJKTS/5SMIqMs
ZaqG9KkaaGZzqcLmGkSiPJ9waSbzlTjD/ioE6TkmEfUOUGtMaCR2AhEqO1j2k7Ss
A+byy01TWdZG5n2/pFZ+tVdcLOE3hSIjbmijSEgK8TLFOQfT//Ue7vQeGiQ32kNn
dlfW2Ubi7pe/aOXNU3gj39SRePxLuVGS4vUgmMpmI7IHeqENhlo7DEqs5jnwhZkh
RItYewAowaVB5d5bryOAaIAQ1mvo3Z9csatW1uxOmYAgPoGWU0x4i2l3woI78qxk
YP3xtIVOEccGIfXP871PfqNFOEy35A==
=SQSM
-----END PGP SIGNATURE-----

--yoO7lKbn6SwSRdYo--
