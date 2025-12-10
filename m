Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78AF24469E
	for <tools@linux.kernel.org>; Wed, 10 Dec 2025 04:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765341710; cv=none; b=EdCVUQv33HNLDXpSBauMxTVVt/lbUFcsWRkZOWitH0nSPzgP+wNSdNOemaPl+ryzDNMHGPmSKvHKPLLcyRkYvE6COg4RTwZHkRIK/rHsFoovOZAXDj8VNBl131GFwJVzBrm3Eno7QVK8vJ6nRHlHZjpc4z52A8bZfcnS31a0B0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765341710; c=relaxed/simple;
	bh=rKDnrcTeVD0ANO2/RXYLgFAflIhrXiIC+Xj1F0+TfpE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tvBXWSVwJ3IEwwe6KOPuLtn2/elPaCqEb3YF96aKEXA+8uS/nM6KveMKChwP1jcyg8ZmdJDAuGcLewU5KfZIb2M3914FU3CD+SmBkd/Zo/7H10JoqtEsUHNMFeJDA6mkLHv4lfg7GuhoTFTvqC46AtdT5IiM+oNc2mUsrtLMoBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bYnfcc5g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bYnfcc5g"
Received: by smtp.kernel.org (Postfix)
	id 8FCBBC116B1; Wed, 10 Dec 2025 04:41:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A032C4CEF1;
	Wed, 10 Dec 2025 04:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765341710;
	bh=rKDnrcTeVD0ANO2/RXYLgFAflIhrXiIC+Xj1F0+TfpE=;
	h=Date:From:To:Cc:Subject:From;
	b=bYnfcc5g5swjBGetIHm2JMHkeFYeAt2sy46Pr/YRIg6QzD0zgSTU5W/cuOUfpCZiX
	 c09EC3Pn7XsSNnr1eOGFlVoi4fuFM4FsVR02rJ/F+J5Z892MWQ+erfeLmywTDfQIEC
	 d/nxYlHysY1fCzts/yba51cDVlmlYFx4irwGsKZ4rjMNWM+k2r/Zm6/SlLEH8aOOVJ
	 Zm8kPC8Q2R3ALFe2kxltzUMPs7nq8oE6Gc9V+HxNgIp8wEsGGlWwAL29ryN7Ld9bIA
	 L2dcurPX7Wh2EVc1JqaMegxTtz6j4ZSfUgDao/CCDXd6FxN5rz+CCDpZmneqs0NAh4
	 yvPdVtoX4UbmA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 1AFCB1ACB974; Wed, 10 Dec 2025 04:41:48 +0000 (GMT)
Date: Wed, 10 Dec 2025 13:41:47 +0900
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org, kernelci@lists.linux.dev
Subject: b4 pr checks for KernelCI results
Message-ID: <aTj6C69JzDUJUVP4@sirena.co.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eb2nJQW6Aode4U6a"
Content-Disposition: inline
X-Cookie: It's clever, but is it art?


--eb2nJQW6Aode4U6a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Konstantin,

It'd be really handy to have integration in b4 for querying the KernelCI
APIs for test results when both sending and pulling in PRs to see what
the testing state for the head commit for the PR is.  There's some docs
for the API here:

   https://docs.kernelci.org/

Possibly this could just be pointing at the dashboard if there's result
there, that'd be a start - there's a bunch of UI issues with starting to
get more complex.

Thanks,
Mark

--eb2nJQW6Aode4U6a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmk4+ggACgkQJNaLcl1U
h9AmFAf/WtXIwH0okguevIgDqcXhyS4MX3PB138GWJ18mJTx3buQC5UuHCL/5xvM
IP70OfC3T3M6LcxFUh8A5Ssi9Q+29hw4r7ckIxdgQZwtZvlWRJLisVlG2BXsZx0d
BowzUrEdoHxMm6XsehqXvrVclbbPwBJBRu2M24JLaGGjHdkUeaSW/trVFUZ2PVEo
ChMyYUdFsqic064v2rwCGMx23AX1186bxzm4EU/Mo17ejcPnpuPuQLmEi4dkEWKX
xInbVG+gFldhEb9KDqUdbR/v5zDfZwPBpgX4Vz3yEgSm4B/FI1R6yziK+yv85oME
j90IKampeexySZFt3pDJQzCKKAkRRg==
=5BTq
-----END PGP SIGNATURE-----

--eb2nJQW6Aode4U6a--
