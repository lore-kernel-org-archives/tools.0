Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAC018DB35
	for <tools@linux.kernel.org>; Mon, 29 Jun 2026 18:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782756086; cv=none; b=hFiylCuM4fq5P9GS487nG17LTsP20Whw+dwXSPLyAXo2k7IGcLkL2OSr8+SRiIM2RULjcSidDCJlNP2OGSbYcWY0FQdaZ79YbCUWuBd/rpiUfU9lNTgrNSI9xQCrNkYAWZIzpVu+r2HJAwDt6EREtAufvvjOUHXu56fFIzgsr6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782756086; c=relaxed/simple;
	bh=oJYZf+TJr1YPk8lUpEmeZb66OLOEAXJMM06Wjw12Tq0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=boNL2WJQxjVsFVwYs0gUFCayCizvQZItfvFuz9DGd6o45WBs2MJiU3nYR4RqkErvHuuVfH9kjYvcCEVizaDrx9G2mcLBtTTj28jICSAPdZh8RtTqjqdK88+xSWcfMWNYZVHmbmibzJkj528vjrKXtMHy8ejUcmqRB596O0RsTjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cJcf1jYh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cJcf1jYh"
Received: by smtp.kernel.org (Postfix)
	id 9A27C1F00A3A; Mon, 29 Jun 2026 18:01:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D89051F000E9;
	Mon, 29 Jun 2026 18:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782756085;
	bh=oJYZf+TJr1YPk8lUpEmeZb66OLOEAXJMM06Wjw12Tq0=;
	h=Date:From:To:Cc:Subject;
	b=cJcf1jYhFPLZoQ2AYoKOe8/u2wqGGv8jCSAvEQ/E+varhySrwwACrONUxbtkm2YsH
	 FYVR+HJnL2ixMOJ/HetsdlaEjCfx+1BgCD6LW+oqx25Whhzb6qyTdadGLq6HfUAyQy
	 ZUZFQbKGrJB8+m+eQPaYc5iEgVvYcwsFCAl5hVVXcoCoiG3/yAEXAGqWuxwjJN8M7Q
	 t/8lay5xGNGzXRdNgWq2IhAgXFbXh7Q0OBkO76830dayVEGTlfJ6Mz4dLuNOsPixTy
	 qzMza3ZKgXVV+3r5tX44VZzbcyJye2tuwVR6XthxOO6sTwubKAgiNF2pv62BAgspOa
	 dMuCbsmQ0mO0g==
Date: Mon, 29 Jun 2026 19:01:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: b4 review batching operations
Message-ID: <55e2fdf0-f825-4c10-ac82-90d73790cb3a@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="axhoNFHeLYDQGgMV"
Content-Disposition: inline


--axhoNFHeLYDQGgMV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Going through my post -rc1 stack of patches to apply using b4 review it
occurs to me that it would really benefit from being able to batch up
operations - the interface is fairly laggy, partly but not entirely due
to doing checkouts per patch, and requires quite a few interactions per
series (take, confirmation dialog, thank, confirmation dialog, edit
message to fix up tree, queue with more if it's a series) so the whole
procedure is very much slower than it would have been with my custom
scripting.

Thanks,
Mark

--axhoNFHeLYDQGgMV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpCsvEACgkQJNaLcl1U
h9C1ggf/UCnnKA8z5nicEaT9jf5C9RQSYTLP4seHIBuz+Ya7ZR6iHfs+6hnEheHh
Lgh18Z7d1sF0Mg/KDNJdWgkK07hKMLJz7emECUH90vxE/rJ29IMrjOlsE7fTPc1S
zkYoWEL9ZQPVZSB55pd9Jm56518uAbBjWMnGYMhSZqfUOlwf+EZCr693AWdDtFBD
RnjCfK08OF/z71cDXEaeg9jFKyyQxTYgtJGXZaLdNjlM+id/YZPQT+EDA2C8F53h
IXMfL5rYDI0LVK8TZ5KagL7Xb9D0V9LukVFkCbQBPorZiJ8Rcl+blpS9SvvrQtad
MmWtP3lqhDo8l1vIN91oWwZYNa2izg==
=SouL
-----END PGP SIGNATURE-----

--axhoNFHeLYDQGgMV--
