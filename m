Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0A8346E70
	for <tools@linux.kernel.org>; Sat, 28 Feb 2026 18:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772302367; cv=none; b=VmY6sUsCPXOpAlpidw3nsUlIKNVRtEqIrkkz0xy/r59FVHrjmd6D4BoUh9SN6qoBz7AomcNWFG/dmfyHZl4QyCIqYjMXzjS4qHr6QEDPEsg6dHszTs2B1gJ1ViSWKw1Gw4K8KScAgELT4Xdz05Ar7yRrABhzPMf8b3u3XO+B2TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772302367; c=relaxed/simple;
	bh=OlLpI7D1zf1kVNux6lkjS8aXgqiUMRphSVFwlHc1B5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dp6X+f0DGovrPONPxDkB6KsBLU/Q45RFvgLSUTGYKqt2BRydqVBv3D+ltQ2ux+LsP6rL6ZdsH3tFbAqW6D5lepm/N3diMQX3niyX99CTXK3P9q3FMtiMuU28+enLX61aoIXAvm7U4fD2ZomHyf+L3cZjG2OZ7BU13JidOUr/AnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZpWyxhVA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZpWyxhVA"
Received: by smtp.kernel.org (Postfix)
	id 05140C2BC87; Sat, 28 Feb 2026 18:12:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5928C19425;
	Sat, 28 Feb 2026 18:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772302366;
	bh=OlLpI7D1zf1kVNux6lkjS8aXgqiUMRphSVFwlHc1B5k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZpWyxhVA+ZbU9d8nDqrcmzZ5S6mIvxUGsPUe8Per0XOOOT8vETe7Lfm45Y81doY1U
	 xQP+jFnnqdXM7s+A/RdQuC0fdAOp5wiDvA5xJSlzfK8JpElCO9m72etRvVDqFlbogD
	 HhR9B4Hlq/3Q/za5+Meg7KWFGpomNEKwxAnMoP/qBYUFsqnxdtT+bdpKtu7KZjIiNT
	 wWyHlnBnW4H0UDotFIfrbqvFYXdkMwZPtdhmFTD/W/BNsxhd6oRi8M9reKEzIqyZXq
	 MtQM7fiJGTUdUMzbmLbBvq7H4Ei+XbFvUcV2NQ/7qrijvlUBQ5Xkxaad0oTsNUEwf9
	 kIIZNSAqLhd+g==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 37DF21AC597E; Sat, 28 Feb 2026 18:12:43 +0000 (GMT)
Date: Sat, 28 Feb 2026 18:12:43 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: b4 review available in master
Message-ID: <aaMwG6l1A6pIOFL2@sirena.co.uk>
References: <20260227-imported-aromatic-guppy-ad3dca@lemur>
 <aaMF3GQvC26DsqQf@sirena.co.uk>
 <20260228-bouncy-truthful-muskox-bcb0bc@lemur>
 <20260228-prudent-otter-of-justice-702586@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wqG2sJSwWKIZxySm"
Content-Disposition: inline
In-Reply-To: <20260228-prudent-otter-of-justice-702586@lemur>
X-Cookie: Think big.  Pollute the Mississippi.


--wqG2sJSwWKIZxySm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Feb 28, 2026 at 11:00:33AM -0500, Konstantin Ryabitsev wrote:

> Actually, this was a straightforward rewrite -- the latest master should work
> for you without a custom venv and the textual package available in Debian.
> I've also confirmed that it works on Fedora-43 with python-textual from system
> libs.

Thanks, that is indeed working fine with Debian stable!

--wqG2sJSwWKIZxySm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmjMBoACgkQJNaLcl1U
h9Bbdwf+LGKK02Oro09j/paiUWehN1WPTBJsJRbYdE/eYwnpRwuPOwwJCo83MxwC
+V6QQmuEUFjXJbVGvg13VOmTHuOhsEI+F2xA1m8zNSzU0jRxacgDJ33KsL8Ngdkc
ILJnUoeXNLghj9D0OYMwPT04vkYuYEnKeBASngNXTgvEpWMBqLnHooTFwIIOiupy
Vh3i+6gl274HAjfi2c0MkFjMXv+yKoY940x5H/F6O2VkMcazuB7cLZMscQtCKXUr
eQD/mRdb1fLGGCSMWt6s9jmtXKCyXydnBf9+wpyKWSDRwvrz8sg2nhFaA6l8kRjZ
8HAkJsKLj+NoiRPJWnj3ImIOMJUUTA==
=a5l9
-----END PGP SIGNATURE-----

--wqG2sJSwWKIZxySm--
