Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A65327FD75
	for <tools@linux.kernel.org>; Wed,  8 Apr 2026 14:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775659733; cv=none; b=VJnDez72dA9CmrjoQDDCwfxVV/qRDOmq7m8evWt7fqacsr8Df1tZen2gShN6I+I5fNXuaqQ7Tk23lSH1rL8GCKzvfHXpBz9CJGDIsXXvxTLm5DvInjG/NddoZv7iOg0RT1YGnahQO5eiRdxJHQCBOewI5SCEXO/ZgiOTms8b1MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775659733; c=relaxed/simple;
	bh=s9zWfiI3dw7+HRP7mqO8PUfrMJ2lK69q3CfYTmFDelI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p0/CBam5E6V0MsCskxXHYadvu25E7KwrdvmCdyz7y2naFn/WJ+abYqgWAeJeMyjUQKIj0WQ5DymupG3XWdBUjt3eEYiemWMu4JkwOXCK1f15I74iYGPnzdkFPXtvFQKNXvxPornNykGS8wxrNyq399SWDhpc2KJlpTzoLIObC48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CJdS48HG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CJdS48HG"
Received: by smtp.kernel.org (Postfix)
	id C2748C19424; Wed,  8 Apr 2026 14:48:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C0DDC19421;
	Wed,  8 Apr 2026 14:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775659732;
	bh=s9zWfiI3dw7+HRP7mqO8PUfrMJ2lK69q3CfYTmFDelI=;
	h=Date:From:To:Cc:Subject:From;
	b=CJdS48HG0HTNhhvYCN0etfCfZBqhNh4nZTWxXZQ0vK6/NcPWuJTpp+AAhGzZxZjo1
	 qA2gVP3nCsmWE8yHYLA2NGPY/lPdLIJOgtxrfzKsYMfrT3i+LP/IqHznz/ApxLTuWR
	 2FinmiFEbVY+yvutVzsefdOKtAFqQHwpcWplkN+WG7wcHFv1F64WyagAiq9MtQXe5w
	 aLA1ASSJMK1F8TQv2hx/+ceXeTxiBFJHaU3n2Gdvj2HAmvwDOU+BrMNyk+F7NFGfM3
	 yXJ9mnPDDUMy9cZdvTgML65FhI/Av07wAuJoA3WaGLtgxVWydT/P0qREjPmY7Z4sf9
	 q+tHmpTPwdkAQ==
Date: Wed, 8 Apr 2026 15:48:49 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Displaying apply targetsr
Message-ID: <a382bcae-f594-4045-8986-f6161f06e96e@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ct9TWb6QgBxS0je1"
Content-Disposition: inline
X-Cookie: Often things ARE as bad as they seem!


--ct9TWb6QgBxS0je1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Konstantin,

It seems to be a bit random how/if commits are described in the UI when
describing where things are going to be applied.  For example with this:

  https://lore.kernel.org/r/20260408-tegra_warn-v1-1-669a3bc74d77@debian.org

which specifies a base commit of a -next tree just the commit hash is
displayed, other times we do get what looks like a git describe.  It
would be useful to also display the commit subject to avoid
inappropriate bases, especially for serieses which might get merged.

Thanks,
Mark

--ct9TWb6QgBxS0je1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnWatAACgkQJNaLcl1U
h9A3Jwf/V/wAbgLYjiSilshShAckd9lmt6Bi3mmY6cINfw9YB9VreoQD29fid4gp
X2CZKPg3R8r73ZRoUWupCRiLh40bNGHt6q05Cl9FPWtdVSyhu/o2VWqUMy4vrPHo
Ili1Vj5yu/rY2MkMu9Tvmp9aUJfqbJB5jptWuMkdI0LgST6Q76KVeacnszcQ9ZKj
43wSJ61Er+GX7fACOepwqDBJQG/kpKNrNtbWNFxHMIG+LyM/I/IYAgs96zVT/6YC
UjnfwYW0jcHzino1HIQh80kXa5hoPlZgdt3tRl2n+YzIFkTDWOqloMJrnv9JaYPb
WSPrgsJ43ONXYQpAYA8Ct1DtQuknMg==
=EBzQ
-----END PGP SIGNATURE-----

--ct9TWb6QgBxS0je1--
