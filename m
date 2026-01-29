Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827DD288D6
	for <tools@linux.kernel.org>; Thu, 29 Jan 2026 14:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769696149; cv=none; b=rIbMeeT2MtAj+4l5q7xSWRH9eRmu3gsf2hhy4E9OY69CkBmnccyh9PI9Spayp0tzg6RmD2dkV8H5j+R7OhvLRUCTBI/YtpiEgezujXbsJcnZdvhWMX2KS2kE04TddlM6mkrh2A0joQDnWFNDrfBozy3489M5gkgHQmgQyBDzDok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769696149; c=relaxed/simple;
	bh=lnQL9erIn5mPkc9S5XievJV5NOlcBlBYOfdB2JMJ/vo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cF/7QMhFPwbufi3h1xGjNBxSZ7MO4fUyzSnREegokjnmTJ6mYa1jcMibaRy6g+lfHfbfHp2UDXiViF/UwAgT2cG/s+ylTlsj8sFYfRcUBbjVpYzXo1hhgot/k9sEy2y1nfD1ajeEXOvvwkPT1Jcmka6leaaMHgjMrIAPlYbDIgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 26EC6C19422; Thu, 29 Jan 2026 14:15:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3DDEC4CEF7;
	Thu, 29 Jan 2026 14:15:47 +0000 (UTC)
Date: Thu, 29 Jan 2026 14:15:45 +0000
From: Mark Brown <broonie@debian.org>
To: Breno Leitao <leitao@debian.org>
Cc: Antonin Godard <antonin.godard@bootlin.com>,
	konstantin@linuxfoundation.org,
	"Kernel.org Tools" <tools@kernel.org>, kernel-team@meta.com
Subject: Re: [PATCH b4] send: Add --force-cover-letter to send separate cover
 for single patch patch series
Message-ID: <d68a802a-abfd-4cf1-a95c-a7eea231c627@sirena.org.uk>
References: <20260127-force-cover-letter-v1-1-1ba8d7f9a64f@debian.org>
 <DG115TDKJFHA.2VQ4J0C51DKHX@bootlin.com>
 <aXteOVMUIKNzv2te@gmail.com>
 <DG14EHTYTJTN.2NQI0XSURUJIP@bootlin.com>
 <aXtoMh3MEuJHXtMH@gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WpsQCVPkpTXDNIq5"
Content-Disposition: inline
In-Reply-To: <aXtoMh3MEuJHXtMH@gmail.com>
X-Cookie: You have taken yourself too seriously.


--WpsQCVPkpTXDNIq5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 29, 2026 at 06:03:44AM -0800, Breno Leitao wrote:
> On Thu, Jan 29, 2026 at 02:51:05PM +0100, Antonin Godard wrote:

> > Some project ignore merge commits altogether, so I regularly see series without
> > cover letters. Are merge commits that frequent?

> The trees I am familiar with, they add the cover letter to the merge
> commit, which I personally think this is a good practice, but I am quite
> sure we don't do it everywhere.

I think it's more a question about if you get merge commits, within the
kernel that's very subsystem workflow dependent - a lot of subsystems
have a fairly linear history, they just apply patch serieses on top of
each other on a single branch so merges are very infrequent.

--WpsQCVPkpTXDNIq5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml7a5AACgkQJNaLcl1U
h9Cg0Qf9F48NnmcvyKF4iajI2QwU0Kj/OMIVGZTwCfibDmgtLS/MQx5hRitbiNQ+
1uxAv9xueNrdOhA3oB7FNdLxoO/2kADZ+fsqnr/VLDMoUmfOoHM+cptJu7zT7KQ3
jtMmCQaf0dJnBqXMDJGsDuml63eyGJDKPP3UC1rvctYJthGSLgQToCHSs5oHqQmo
mdniCwYv66pjOzUWelqiSrhidM2vjZHfq4o8MHQjmX4jHfplBeuu45HWg/nqdDQD
cxat8Q3Tdvkz7wToipgWYajk1/1VEAbCSIEmX5oL8JRBg22FQxEKmvNgmW5Gtf+y
16utECmG+JlgRGW8JYpJUkLfSfwX3w==
=bhbV
-----END PGP SIGNATURE-----

--WpsQCVPkpTXDNIq5--
