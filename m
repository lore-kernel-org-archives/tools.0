Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A64F46EC69
	for <tools@linux.kernel.org>; Wed, 12 Aug 2026 16:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786553336; cv=none; b=sftT41WVdJHC9jTYR6c6262S2jLxBWp5ooeXvQ+HGuXmECiQFjX5KBeKOLjQ+9Si7YARX9JPhcbeLEQKwZJXTEiWlmruFHVUmYs3X08duJLEr5lV0/jaOGcgnt2QCK9fNWzTrfZDTbyVD8hfO+sNnbhb3EWLYw2rYgUbQ6FRgc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786553336; c=relaxed/simple;
	bh=Y/d+T0dOGtiBFloAThM/l4wE2ytbhzEj284SQIjyqh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aua6epM0mJkx84ciAZHxm85Lp9pwoIIeMB+VtkTG10a5Bb6GYgG+mymtizm0aZXEymr7FwxLcd2tw3dc1iTd20sdRFtFPFnA8Hkx/iv8VQU+Rfce5AW7UfTNJrBDG4Bigc/YQEOJlJZrCyZ7N2pR3OlKWsrTcFHtDCzsq9uHFMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RPkHWB/S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RPkHWB/S"
Received: by smtp.kernel.org (Postfix)
	id 298011F00A3E; Wed, 12 Aug 2026 16:48:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70C591F00A3A;
	Wed, 12 Aug 2026 16:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786553334;
	bh=Y/d+T0dOGtiBFloAThM/l4wE2ytbhzEj284SQIjyqh0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RPkHWB/SakqsywUx6PcNdm4HfO6chSHs3xddMAQv5+RHmZDOL83WzN0BZPdw715Dc
	 5qIKVPInPmC5m+JGKzaCoCARTqhsYBrSdR+VJJ+nlQ6LLHQ+iuNZdDCvFW/8XQ19OS
	 gbyg9Rbck9ZEK9/DBZSCGLmihm7WmeTUAXrU+hG8MsRBm+20K3T1hfgHaqjQ/+tazX
	 N4qqOx7nX5IW9R2FpfIEWlT2u6I7egsnI+cJ1eAWSUzFOA+gb2jZun/bXMgXfDXcV0
	 GKsulxPROMFBnhUmtiHCb2fLo8rjxaB3UlqL5RxrrShjmQjTlj30eUwRZHkSfc2lZT
	 6gQ7r1ponSQ/A==
Date: Wed, 12 Aug 2026 17:48:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: b4 review misses a patch
Message-ID: <723eb87c-7235-441a-a751-15d935e18468@sirena.org.uk>
References: <8d7fc80b-e303-4f2c-9890-8408bd5d27ac@sirena.org.uk>
 <20260811-spicy-woodlouse-of-joy-7fa3fc@meerkat>
 <20260811-beluga-of-theoretical-engineering-5ca1a8@meerkat>
 <7b541824-f3f1-46cb-a50d-32bd88068c57@sirena.org.uk>
 <20260811-maize-whippet-of-plenty-9a5b30@meerkat>
 <20260812-omniscient-tan-heron-fc7035@meerkat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6AyRrXz3Av2ohJIK"
Content-Disposition: inline
In-Reply-To: <20260812-omniscient-tan-heron-fc7035@meerkat>
X-Cookie: !07/11 PDP a ni deppart m'I  !pleH


--6AyRrXz3Av2ohJIK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 12, 2026 at 11:00:10AM -0400, Konstantin Ryabitsev wrote:
> On Tue, Aug 11, 2026 at 07:38:04PM -0400, Konstantin Ryabitsev wrote:

> > There are ways to make it work, but I think it's easier if I just release
> > 0.8.2 so I don't make future upgrades weird for you.

> liblore-0.8.2 is out now and dependencies updated in master -- you should be
> able to pull it in.

That seems to have done the trick, thanks!

--6AyRrXz3Av2ohJIK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp8o/IACgkQJNaLcl1U
h9BcXQf/fOu18QIFU7lPvml/UHnEdpDjNMZKYKpuboEF5C2aYwB3+InCN3J8bqrY
NtaqHTXacSr2XDai1BRvk+EZcDVGt2Z228p0tax8UTj0HcH4wUwM19RG2UORlxcG
tQ/YSb2nzzL2CEabPhIrhfhXli7yKRB0GNXT84ZPwcPmlzoGptp+W8FnUnIg3aFd
RVof9Hvfig1efurv8cWWeam5LBuFd/vvClWdFJS6mZTr4jbB6Lcd6TDHkLkWZHnW
tKGyAAzDkIkJrsPy0yiQazDXYEVRU5fq1psEggemD7ujkZmtCn5uf5frZA8aLrTg
OZwxj8CV3Wh9Xy70K4l6Bkb9qOEgew==
=3XsE
-----END PGP SIGNATURE-----

--6AyRrXz3Av2ohJIK--
