Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5432586C2
	for <tools@linux.kernel.org>; Tue, 13 Jan 2026 15:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768317394; cv=none; b=Bh4DofCdLprHY9RGOixOtCTm1wZoDkEK2e/STbvRmwcZVEzZ1XJ8HIup3kHzk08mpyu3VcKFgOf3a3BEEySO++mQuuRhoUCtcNweMSuT0ayW4zBJIDmjD40D34yPNx2xIKkJ1fAOy1xMkjpX6Pia20200++YmcPbrqeB3bFP2EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768317394; c=relaxed/simple;
	bh=cbbBq/yzqgNcPHy+OtVOCUYPbX3teb51P2WRhTQ85Vw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uNhSm+m+TaBbTe78EHIsAkiBiMmcH/aKiIstsIWEm2/CzGdKg6WjkP8TCDWDAh/hXEXdwFHr8Iy9kKr5hv0LEgKwSJ7Pj01kTccItqdpH1KmGDzX+ls/wAcsS8FHGO+NphCHUiHQKIghR9U4uVVp4vVwY0ELEeffvRzaCcpngo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S63+VrbL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S63+VrbL"
Received: by smtp.kernel.org (Postfix)
	id 6D510C19422; Tue, 13 Jan 2026 15:16:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A98C9C116C6;
	Tue, 13 Jan 2026 15:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768317394;
	bh=cbbBq/yzqgNcPHy+OtVOCUYPbX3teb51P2WRhTQ85Vw=;
	h=Date:From:To:Cc:Subject:From;
	b=S63+VrbLBNvHRrbmS2trTWgKfhUuRoI1mjxq4pK4hlzEAS09UGDcsDIl8NiGzMbi+
	 pNPq0OzzlK4nvIhj6nxz4xNhJmbQpCtyvgHwbt8UmIJwGx2xyajf6tJlqwW+4QEBdr
	 6rFHTA5xvMSa9nYpUb76gxxu6+PTfNZj8LgbeQdDRdjwT4bPCUI656hPgujUGwB8i3
	 Y3EDXBoEGgalHblS1WRiAGPAoNNB8U1bvunvnrdqhN010WjyUphGeeW8+MtO/LxVZP
	 BNfy+cqSsUMF1OeN1/5yobSN4XOsEEJ9cHOQvIbFO29iUQQcdOCDjTbrrUyhBl/hhR
	 pKYaPi2pSf/8Q==
Date: Tue, 13 Jan 2026 15:16:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: b4 dig struggling with some commits
Message-ID: <0890b0f9-24a5-4bd0-b682-fddfc3fb3cd4@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yA8hoZrr5vCVbL74"
Content-Disposition: inline
X-Cookie: All models over 18 years of age.


--yA8hoZrr5vCVbL74
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Konstantin,

I've noticed that b4 dig -c frequently struggles with some commits, my
immediate example is -next commit=20

[2a0db5f7653b3576c430f8821654f365aaa7f178] struct filename: saner handling =
of long names

and I think most of the other examples are similar filesystem ones
(though that might just be that they're the ones I most often look at
that don't have a patch link in the commit log).  I think the above
corresponds to:

   https://lore.kernel.org/all/20260108073803.425343-16-viro@zeniv.linux.or=
g.uk/

but ICBW.

Thanks,
Mark

--yA8hoZrr5vCVbL74
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlmYc4ACgkQJNaLcl1U
h9AeLAf/YElqRD7fykskqR4E8klZnkM8DjwUmpvBJtvATenuaHMXRzkhBPAyQaKp
4DAEsMCw3nfi9j55PnRW4Xy5ndjNEBpEvng1/iw7WU1PruoX8qQQS3l1K/Q5RlQn
Q0UbSFd0FDDnuBN43mtfsHtj7r+V/7XlYYh1FNpEwSYFH64Q3ElH+0ACU97inPED
F97irA+yHmS/YnIyapRHysm7GFCgFspD68bFQVvDl0+kSs/Yw30fzA1XDXukMbeV
t8Z8duUFR/knNx7g71ZeUz2H0XE9qaZajXsNOo9N3NUANEMk5+VVvV99dc/G0uw1
jQjjiaI3b6z7AoChZcoMxt/qHJIpCQ==
=0ChI
-----END PGP SIGNATURE-----

--yA8hoZrr5vCVbL74--
