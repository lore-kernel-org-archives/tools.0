Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E179023E25B
	for <tools@linux.kernel.org>; Thu, 25 Jun 2026 17:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782406908; cv=none; b=NM8m2xHdk63AgTh3N6dQL2tfnx339IKQ9HqqY1KRjsValzVOgppVwFwEWIxg2n3Q8w3aKuhYoPJOLFGfQmzFfIW9epiBYvNGFp+AbPrda5V1cMfyPNkyf8YdetxIwHMAO9D+ZCAgP0/pxHLJ0jvEqrY4YYYLz+HsI6DleVivjw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782406908; c=relaxed/simple;
	bh=QFL6GCMyi4+yixqo2DmBXyzh48GlVe6sogW+tkAaGkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DSQ+/VQXlqeP71VfF92jgUrk0iN6QBaZEsUmdjyy9O7T9DxDnMpD7KE4EhhdhJq32slAQFRDXCsA9TlZb6RzOv+xI7GIlAuH82/PhlKiiNArib7RCQ4h5hKC1qpvkb116AcnSzdwpbkdbLgFrlmKO1mPFTU7HyfYtem6HG9bHy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bODUMXSl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bODUMXSl"
Received: by smtp.kernel.org (Postfix)
	id A47971F00A3A; Thu, 25 Jun 2026 17:01:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7D7E1F000E9;
	Thu, 25 Jun 2026 17:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782406907;
	bh=QFL6GCMyi4+yixqo2DmBXyzh48GlVe6sogW+tkAaGkA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bODUMXSlulEMagr1DNMQqRw8EJU2dqgAjY5q5BW46g2rnvBMrsMbSIbw1nptZxFdS
	 4SA05JW2XTk2HD4ZA4cTh781xQj5yLkvqvsPmWfnHiOuWj1HaBD7KfYcK33X+9CfeS
	 Bdx5DceJ/+FTgReLCE2x8oYKCv5q0kLJA0h72N/1ku+SKbtVBneM/9vkXyEFgvsUuw
	 xLE0uzqKhk1tM9vaMH1E6NNcCkDt4stE7GaZsU4hhbSsz5s3NPTFCooa0RzNSxHspp
	 3zuT1455o6bvDVKjg+46YQZfVaERJNxpwS0bB+m3hHkoKu+ilWuVNsgHuh+KASjxvQ
	 xh4lShWjUrjpQ==
Date: Thu, 25 Jun 2026 18:01:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: "Kernel.org Tools" <tools@kernel.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: [PATCH RFC 0/2] review-tui: add a "cherry-pick + merge" take
 method
Message-ID: <741f7bc9-18ea-45fe-85a5-2976352750e6@sirena.org.uk>
References: <20260625-20260625-review-tui-take-cherry-pick-merge-v1-0-8ba4809d048a@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i5Gb2Y0FgUC6vPcy"
Content-Disposition: inline
In-Reply-To: <20260625-20260625-review-tui-take-cherry-pick-merge-v1-0-8ba4809d048a@kernel.org>
X-Cookie: If in doubt, mumble.


--i5Gb2Y0FgUC6vPcy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 25, 2026 at 02:18:35PM +0200, Christian Brauner wrote:
> The review TUI's Take dialog can apply a series three ways: merge (a
> cover-letter merge commit of the whole series), linear (git am onto the
> target branch), or cherry-pick (pick a subset and git am it). It could
> not do the combination a maintainer often wants: take a hand-picked
> subset of a series *and* record it as a cover-letter merge commit -- the
> equivalent of "b4 shazam -M -P".

Assuming this doesn't impact the existing flow:

Acked-by: Mark Brown <broonie@kernel.org>

--i5Gb2Y0FgUC6vPcy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmo9XvcACgkQJNaLcl1U
h9BSSwf+OpzY3crQSZBKAJkY5yG18AzLwxsq7LRrfuSeubDjK1pDPOzx2PQgB7WB
1sXq5IY9TMmqymP0k/IbB3G0pViUuzkgnPms+kbmNLUu0/Y5TayzEv1DepuNIyle
02+CWZYXBM9+ceoY76WrjYZAJTqWK7IMzkEFmcrf/hXxwH+zuY5sQyshDVWQivSl
fe6aTkQMS0jUwOfu1PVKfhUMUA2pvHxuBBmxEnojCs9uPZ640yiOSeywT88uL2jb
w4mRCXGQw8xZoi7kYIaKIOVuWJgAfJ7gTUuxwrTO+rqYKIpUGvmuCeoxeiJMHKbd
iq0pFAzHG3j467v4F1qeCo9A6WlZ/A==
=WWSt
-----END PGP SIGNATURE-----

--i5Gb2Y0FgUC6vPcy--
