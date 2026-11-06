Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793975479;
	b=r6tMkEM/aJhubpOKQmuhS0poNc/ENwjt6fRHpNHELE7OKXycxjnzXWkIGLwBEONewWPb
	 mSuXU5BuxDcXp8qVBFVrkNNlZPBi8FS5kvMWQBI4LxdjEC2cw27x4k/E+mAI2vGmoUu/a
	 t0y9mQV/pUkb+lszc+TbKtgMYN8LMNDaDLMa4Bcb/Njbjrnyqw4g3gT0Id7MQRyrhpmi+
	 UPQf5uNtQ70A38sTnK3F45G3+vGlUywfHZhRfpUGpShlKe7hMI3BQXo4oi9gtrxz6QV2J
	 K3/wFHIWTj12DObSVSkPJlsUDKcYt5Y4BHzINE+P4K+EOqE5JhzZE3khq16OKiPw/9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793975479;
	h=Received:Delivered-To:Received:DKIM-Signature:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 X-Cookie;
	bh=9DSSt80mVVYwkg19yV11IjiW+wdMtqTWMbpOxycoYr0=;
	b=nR8Jr/piZs2uNl8oBF8ZUK0LzSYiYdplwgd+2aE/AwoCrXuyLh3zPtp4oe8IS6EL+nkQ
	 nMe13nR0Qdv7md385rFV+puDhlicXzU4jXg4EuhT3u8Fo5wq33fmgWogr4kpYuBf55tGV
	 /H0+rMgt++yhJhEx5Iz/TNykHoydhsp+WzaaViR8ZH9nUpUPjdzpR4934xpvZYA6rH7qS
	 q+v+aZ4G+eSTFoC40jJzy54xYBPwVmk4zfvcBvXDYh4WFcpMLYq55/83ztzFqqPCgyH4d
	 kWIKH1q7Fq9shA5Ozn0FCWKIutU+Vx8EZyBX7VvWX8NJCOyoPEdmBIMyGO0HlpJdVuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j3VsQh8p;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C4D606A32E
	for <tools@linux.kernel.org>; Fri,  6 Nov 2026 14:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j3VsQh8p
Received: by smtp.kernel.org (Postfix)
	id 27FC11F008A1; Fri,  6 Nov 2026 14:31:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 145521F0089F;
	Fri,  6 Nov 2026 14:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793975479;
	bh=9DSSt80mVVYwkg19yV11IjiW+wdMtqTWMbpOxycoYr0=;
	h=Date:From:To:Cc:Subject;
	b=j3VsQh8pkLvl8DGj6GOr4CmUA0N21/x3KwV9BH1t42nsfn9nAftNaxr3ZX1TBLNuY
	 5R2IvV0CgzolQ++RT9TUc8Vsxcxri30VrXRaVs0LB6a1UC4rDWPIg1NLBIRdzM/iA4
	 Fq/aETZdYCbdJVkS9jqAtvebZWOmjcfSvn+7jdMj9zlmvACOEMRFeFEKAD+yg8QqL/
	 +644/zhgjKx0sxOuOKjQjO6SCkVG0JD4fXhkLCRRiHtokTCyQ/BD9dBzVR1c1GZ3bd
	 aFC/1VIWpQaI84fGrG6afE3G4+UFuBh7LX66awERZd1hVi14IyzWRk/iCWluvluP9J
	 8HrH0uKkp8hcw==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 359EB2869431; Fri, 06 Nov 2026 14:31:06 +0000 (GMT)
Date: Fri, 6 Nov 2026 14:31:06 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: b4 review gets confused by rebasing out patches
Message-ID: <1f0d587f-ef84-4271-9879-1f5a84d5097d@sirena.org.uk>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KSmZVJk+UkxPpE15"
Content-Disposition: inline
X-Cookie: Whoever dies with the most toys wins.


--KSmZVJk+UkxPpE15
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I've got a series that I rebased since part of it got applied, now when
I try to open it in b4 review the UI just seems to spin and consume all
CPU.  Looking at the tracking it seems it didn't notice some patches
getting dropped during the rebase.

Thanks,
Mark

--KSmZVJk+UkxPpE15
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCau3kqQAKCRAv73Ows9A4
idcXAQCCG0LjtSSoUslciyDCEgJnR5HvVAMet4bvqeULgPgAfAEA8wE9qlvuC8qK
YJ0RcshRK/z9Yo7Y+nb+MaE4FNuoFAc=
=HEHQ
-----END PGP SIGNATURE-----

--KSmZVJk+UkxPpE15--
