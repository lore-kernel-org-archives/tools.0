Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372B129CE7
	for <tools@linux.kernel.org>; Wed,  2 Oct 2024 13:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727877126; cv=none; b=mm+/iNd2HSOB+3P8EJT+B7r8HwawKG67Ap0ztP0Ow3hdglm3BIH3G4NovNgi8Gc7E+QZtSbq/5zk3j3BKV0A/+4BfMhNL/e5/c85rZ5aKyTzWsFrengN0RymBZv7wVNNU1gaoeL7g3SdT5VuxKG8quVk45IR8rT+egYeIpFN7ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727877126; c=relaxed/simple;
	bh=pmZWU3Ur8ESes4OYQ8aGjvjDue4bKLbMziZ3kBCSxGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iwbbob3Elr0zVK0OAi3CFPDeQn6GdSlA0XELWUhHWlkNbJr6/XTyaukqfLXeg2gE5q9aXAd4vNzcmeawOdh3ggsz9aqOcFJpQY/XrnVHy7NEEO6we4raA1vT24C9tQHVNw5AfAj84VcYyr+ITwK51kwvvhHS/359Tyuj6K5t81Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jswiAPVX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jswiAPVX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4166EC4CEC2;
	Wed,  2 Oct 2024 13:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727877126;
	bh=pmZWU3Ur8ESes4OYQ8aGjvjDue4bKLbMziZ3kBCSxGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jswiAPVXfS2I+Q3/cWwYaXlmX6sfnlBQcaeO9HWYEvEDbhXvwpY3uGtS9QsInV9aT
	 1NM6ah9fmEQXb43tX6alvaGPcZLp9i/stZTmpZKZwkzigC2GJaJGA9fvF4djWd0lS3
	 411rqD7193PjeaaEJ1G+b1n6Z2aJpbGIOS4AmyOyBLgpTxThK99KtGSy2Oh4Fqi00v
	 wTZlYdPZjcdxissRW7Yas1MbocVvr0WURaEZ8r2G0rQcDyKmFrs6Y4QUyN+5yn5HXa
	 kjUY3MbrUXHCcCy9t1nAuCTFljbEUPS58VXoOZi7y6ae2nnofJWJ3namcKAMarzkGI
	 Muz6/hOS994yQ==
Date: Wed, 2 Oct 2024 14:52:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools <tools@linux.kernel.org>
Subject: Re: b4 trailers --update picks up bogus trailers
Message-ID: <e574a54b-c091-4b7b-a182-d285f54f2e46@sirena.org.uk>
References: <98450a13-1339-41e1-87b4-3db7387906c7@sirena.org.uk>
 <20241002-quantum-guan-of-action-427cc4@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="W8sY6XRCGpFXU0Na"
Content-Disposition: inline
In-Reply-To: <20241002-quantum-guan-of-action-427cc4@lemur>
X-Cookie: Know Thy User.


--W8sY6XRCGpFXU0Na
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 02, 2024 at 09:34:20AM -0400, Konstantin Ryabitsev wrote:

> When I try it, I see the following updates that it wants to pull in:

> 	Finding code-review trailers for 41 commits...
> 	Checking change-id "20230303-arm64-gcs-e311ab0d8729"
> 	Grabbing search results from lore.kernel.org
> 	---
> 	  + Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
> 		https://lore.kernel.org/all/878r3f99o1.fsf@linaro.org
> 	  + Reviewed-by: Deepak Gupta <debug@rivosinc.com>
> 		https://lore.kernel.org/all/ZvyCC7tJT7QoKO%2BD@debug.ba.rivosinc.com
> 	  + Acked-by: Yury Khrustalev <yury.khrustalev@arm.com>
> 		https://lore.kernel.org/all/ZtbQPBSl6Ym7g4QE@arm.com
> 	  + Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> 		https://lore.kernel.org/all/ZschddrfehjVUMXw@arm.com

> Are these different from what you see?

That's what I see.  The biggest immediate problem is that the R-b from
Thiago was sent against v8 and then gets added to patch 2:

  mm: Define VM_HIGH_ARCH_6
    + Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org> (=E2=
=9C=97 DKIM/linaro.org)

which was not present in that version so the tagging is clearly
inappropriate.

Other than Deepak's R-b the tags were all for old versions and one way
or another were deliberately removed or are being applied to newly added
patches.

--W8sY6XRCGpFXU0Na
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmb9UAEACgkQJNaLcl1U
h9B9pwf+Kw8WojJyNWaB/gs+R2b/ICaVFJlcSdkHlZr20k2QlKt44tin4Jx26s1w
PvhX+Rbzqncr4pVStzD4Qa1AhpA2o7lN1Y1aGOfQ441IUjSV+9TRzp+XOi26vZH7
HqCBXlnS64kgHoVHn1lkzLeG+BjcJzfEQihV2XmiWi3yRPA51XwP6WPaH/7JmJzh
pfeGDMJPscf1ku/9ZEfw+0AXaalZsJj5kyTnMx2qw9ll1V6401pLgkTcOfdCp38Q
7mx85NS2ateBAhv/Cb4JdgTFMOTaHvo/xeog/r7GtmY6Ms1e8+lMOGO2u/Clj22b
otv+PpjXbrhstwDpkQ8ztV27NDjDpw==
=cpnL
-----END PGP SIGNATURE-----

--W8sY6XRCGpFXU0Na--
