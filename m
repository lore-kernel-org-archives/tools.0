Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6F6101DB
	for <tools@linux.kernel.org>; Mon, 20 May 2024 13:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716212735; cv=none; b=YreX28XJ7OVp4U4cBoDbeZfxB8OnmQQDT7NgijkxQ0Kgrbkyn4j/U6R77MMvoraD755GIeNpwuLZUGmpNDe9FaxgpY3sONnuOaQQM3lTPK4kdK7enQFu37tVPk+nA9wEYsREVPPRcihENo5dl8JJGiXrEcBxMq5OrfLEjayn22k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716212735; c=relaxed/simple;
	bh=FMWRilSCXrfvkPt81GpPkEgP0xRuFt3AQhWIyLcELJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hn4GXR2x83vMyA4rAZO39iXLzPm297ghYTjVZd+qPP79Wwf+L0YRv+siJF9d4B3PqjGVC6lX9pC7RRAeKIdskcHK07kBo8gF9gD2fuKeM7z5QuPqR0M6CYdUq7bKJc01y2pcN87SygacCBbUlMHUWtqeMfP/xHNfQv1nVcUjVfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oy5Q0GLk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oy5Q0GLk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99DFCC2BD10;
	Mon, 20 May 2024 13:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716212734;
	bh=FMWRilSCXrfvkPt81GpPkEgP0xRuFt3AQhWIyLcELJs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Oy5Q0GLk3a4CUIaOihHm4GW4fuWrAdFJEhzYx6OdV2QGjX0ev8zEldy+zdcuusZN0
	 3jZO23WAWee8dEVEF6c+PTUsCCgZePqjc9CdSeKOIoVsNhsoq+w8M3crvIIRA3/Z41
	 8CpZ7E/kvntaRLIAFt1r1/JtZYEOm3kAofWwfpnl984cjVFC09yaMILGOdjHCn4HRi
	 EncjC7aOQsPkEi5GODEPhvXYXW3xyMpIYlalLPxWKOJkAIs9760uHxFEfZaqpJm7eA
	 vy8APd7g07RMTeQuS9+V18roaKltqCkBhqkPyDc32CRg+ycPHprY6nWP3cF1jnfEZO
	 RmcLk54sztX/w==
Date: Mon, 20 May 2024 14:45:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: Checks for recipients
Message-ID: <ZktT-sM1I_QFQ8ZH@sirena.org.uk>
References: <ZhQ8DoS1GaT0603l@sirena.org.uk>
 <CAMwyc-Q466R2za0sMTD9Chx77hL7xBBuNROokemLmp7dt=i10w@mail.gmail.com>
 <ZiPBx36go0AYBWO7@finisterre.sirena.org.uk>
 <20240420-arboreal-natural-sambar-ff61bc@lemur>
 <ZiRiK4sB6kKwdH7p@finisterre.sirena.org.uk>
 <20240422-sincere-stallion-from-hyperborea-bffddf@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9oiXoKsQ3XPKR/nD"
Content-Disposition: inline
In-Reply-To: <20240422-sincere-stallion-from-hyperborea-bffddf@lemur>
X-Cookie: We are what we are.


--9oiXoKsQ3XPKR/nD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Konstantin,

With current git b4 (621fa62) I'm getting tracebacks doing

   b4 update --trailers-from ${MSGID} --since ${COMMIT}

(I'm using ZktD50C5twF1EuKu@fedora or ZktCpcGZdgHWuN_L@fedora as msgid
here, ${COMMIT} being what I applied those two to):

Calculating patch-ids from commits, this may take a moment...
Traceback (most recent call last):
  File "/home/broonie/git/b4/src/b4/command.py", line 428, in <module>
    cmd()
  File "/home/broonie/git/b4/src/b4/command.py", line 410, in cmd
    cmdargs.func(cmdargs)
  File "/home/broonie/git/b4/src/b4/command.py", line 85, in cmd_trailers
    b4.ez.cmd_trailers(cmdargs)
  File "/home/broonie/git/b4/src/b4/ez.py", line 2786, in cmd_trailers
    update_trailers(cmdargs)
  File "/home/broonie/git/b4/src/b4/ez.py", line 1107, in update_trailers
    if lmsg.followup_trailers:
       ^^^^^^^^^^^^^^^^^^^^^^
AttributeError: 'NoneType' object has no attribute 'followup_trailers'

--9oiXoKsQ3XPKR/nD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZLU/kACgkQJNaLcl1U
h9BDZQf/aQLQ77D56rYXIEOLaTUuM0p2MvKm9BPO/9db68GyDCWriqoq6AHWsBdd
l2gjukNGVafoU9nTa7rUOTAZZtMl/lYTmQ1ZVzVr9uGYsHbovvsXcG3Rqvz3rHYp
kgtRSqj6eipzmfZLhpSQx9zGsRvqAT/LF3dnWohLjzG9YvPXiZKkc8Fwjy6w0q2s
M+zbBRwVefPy8k8TNLTdIiQGQrtI5fvGcRDlwKsPrMDNmHbgnMAejYANK0NMaeTj
PiLYRbSM4lq9b7HaxgR6aVrryHNG0ZO7m6Ulsf+qKLibRyQaR24KeSBVDhKGenXw
XsYv2+dIQHs6TlOyDuWAt8RJjvUqQA==
=xMBV
-----END PGP SIGNATURE-----

--9oiXoKsQ3XPKR/nD--
