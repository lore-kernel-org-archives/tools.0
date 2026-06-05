Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C0B37F74A
	for <tools@linux.kernel.org>; Fri,  5 Jun 2026 12:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780663265; cv=none; b=saQnl9+k9DwC1JB87rh+ESPP3a3+DJbY1M47KqNcTdtqwYSJxgzWWTaTPo33jmH9sp5s+J/hQYmhdE5HSEj60Wvyn12cA6kfkuafPFVho45M5uUmr2bm0luq29k0t70atuGktDeSStlcsXyuIjKbyt4u8tWYcY9gUm/L4gqs4so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780663265; c=relaxed/simple;
	bh=WWnau4lcC/UDc4iNDo/JNHyAonD7sRzSblV7nAGhBK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ELJoqfJEo+OpiwoBXvvDsUNyDCjfhIweV8xVfr2kVLtY4Y7C6phyPL+NzGRKl1a/JVx8QuTdu3+9k4qXg6yxsQn/z0pU2r64pvJ3MtkpfBIR8sfsIKhAmw083wphCBzGTWXcH7QRIorIA4TBzbI4165H0JZOTmSxlWA6mAos2Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i5unOdYs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i5unOdYs"
Received: by smtp.kernel.org (Postfix)
	id A08D51F0089A; Fri,  5 Jun 2026 12:41:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D98361F00899;
	Fri,  5 Jun 2026 12:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780663264;
	bh=SzT9FFt8a0zsaW+YzKEDHBFi/iS4m4SPwHHG7agrLec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i5unOdYs9zWe2p1PY8aiBPWDhwsy9B3xNM5nx6RrRH9s5K+5UeO2gajBucbRXiXvJ
	 fdSMBqNKFB+k7ygUlWbe9kurBe2qrDOq1tYEZpx7/LOB8Mhzam9P2ofS6YsE6amK42
	 v4TjvXXY3292TXrpilassZe4RNHh2oNmbS41IlWklSMxoZ43JnJQDIg3gxUBjuyfpq
	 p283eiBGSRG67J6M7zqYE+19RG5hBUDGzKTfvu9ecFy9V0bm9RukKJCvxUgMoObH8e
	 7mBEnmgxuXMpEYx+Y5eRRJuE469H+k08JLxiQEIZCtSIwR1obMm75xyIBwX2B4FqCd
	 NQmLxuNiw0XdA==
Date: Fri, 5 Jun 2026 13:41:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: tools@kernel.org
Subject: Re: b4 review -- biggest pain points?
Message-ID: <b7061a78-632d-4fa3-8ffa-c0cb1d36d852@sirena.org.uk>
References: <20260604-dangerous-bobcat-from-shambhala-97b022@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yztXW4vlzO69MGVv"
Content-Disposition: inline
In-Reply-To: <20260604-dangerous-bobcat-from-shambhala-97b022@lemur>
X-Cookie: Error in operator: add beer


--yztXW4vlzO69MGVv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 04, 2026 at 11:07:37PM -0400, Konstantin Ryabitsev wrote:

> I finally have some cycles to get back to b4 development in a fuller
> capacity, so I'd like to do the next iteration of b4 review and b4 bugs
> features. I know some of you are using b4 review fairly regularly, while
> others have tried once and decided it's not working for them.

> What are the biggest pain points I should focus on? From my memory:

> - I know Mark sent quite a few bug reports and from talking to him I know that
>   huge series are problematic performance-wise.

FWIW probably the biggest single issue I have right now is that the
state machine around serieses can't cope with things being partially
applied.  This is a problem with things like picking bugfixes off the
start of serieses, or multi-subsystem serieses.

--yztXW4vlzO69MGVv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoiw9wACgkQJNaLcl1U
h9Bk+gf+J+yoN/csB+wXV9oZ5PPvFKKcrHVLZ04pswWW9hV7MTqhdaXvlarMp1Am
5Jg6PRvZIjHeVNTk+eDEk4xozXbdIaOKncNTpUiHwtNn4lTC0pCuFDiiu6/Wm3Bj
XF7g2kJSAzATM+7DuWbpYyBAk7Zq5NcpcOv/U7n2LM8wyPucEcLlhIzpR3UmU8gR
YeeAGRclfYZ7Snedj5eGbkz7ZkY67kA+F0MCA+pi9KaiaZEoauHDNzUAcV3Y+N5Z
B0qVM6N70eqNBHK7QYgLBxYsLc8thoJbg8r1Ly6JNilxAkIgTeehCOjZTmC4Z9g4
t/WR70a93If18D3L7xuVojglwUTtWw==
=2jhB
-----END PGP SIGNATURE-----

--yztXW4vlzO69MGVv--
