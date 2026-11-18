Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795014844;
	b=IsoOOcqiksrqTFUcd8rZo0yCPAEI2RPivdJx2LGxue6ZgvEiPVR4k61/TPQA5tVXHUxK
	 aPKl41DGoCqSTl3VZ9bv6wcrI5g/rcr3gus7Eu/vEuuM9CTvPCFI21Rhjq0LxSWq0+5b1
	 xXD8gEYkPOz1zKIuh0yHhzeZ+wlwo9FtD0lZbrM/d9IHV18A7hovQl1jSsCP/yMg5Scrk
	 PH0knX63WFMwfIhGSTC8fITpSZe4P7EwXOQqi9r16VtMkyyFlB3J6YK5YWeqaMXlfkjHT
	 UyRxSs9+18pJ5TiGY9RdlhSjRh6c1Gao6tY047EstJzM+Sh+yotobF1MEEpy0FfJ+Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795014844;
	h=Received:Delivered-To:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 X-Cookie;
	bh=kJX5cNLgHsE18XWoGc7T6l2K8535vfxOODyJcZeLjx4=;
	b=c6EuedDVk6vOfT892jLSARZPE06IA204vVWrEClH1t9MK4XsvTayeSVX0pvar5gUvw+G
	 W37fNvagBLqrXJP3JMo5TJr9gJkrI+6DzgI3M1HOmDUnuMhT1ddDWg6DSIZeYrlpwVWdc
	 pdf0rFdErWyfGlqaWF/DeJOxET9t5jeP1HPgNqpPdHMQfYE/X0uUj2o/ot7v2gZm03pBv
	 +Du+8VRVowZJipaRVnX9tRSQoHuXWO0Ctp8tBdd/wpjFVdxtMRhGdv6WsuosIuHIxRe34
	 QN3tI7iT2PUcW4f6rsBd+azFiNKD2/Wu6nIdG9aswVApgMx5tKa/DiA8STjyMYAvRJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cW4Lhh+Y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7B0606A31C
	for <tools@linux.kernel.org>; Wed, 18 Nov 2026 15:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cW4Lhh+Y
Received: by smtp.kernel.org (Postfix)
	id A06E31F000C5; Wed, 18 Nov 2026 15:14:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E243F1F000C4;
	Wed, 18 Nov 2026 15:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795014844;
	bh=kJX5cNLgHsE18XWoGc7T6l2K8535vfxOODyJcZeLjx4=;
	h=Date:From:To:Cc:Subject;
	b=cW4Lhh+YnrVj78uumVlwGjy98Cn+vOlx8gjmRNkwGJCu/YCp9OnRwBLyJUwNJ2P9x
	 AHAY6StYxov40TlhZc2Xaln70Iwbsde+k025WpL7oI5tBdiKc9yU0cMvrHYWxDRLBk
	 WMceAxazHqq9WWMykvrY4ILZqGt58751XYbFDvgyboAvG75IOxrjuEnsXIbCmHzAt7
	 eRp03o+L4pQ71HbpFs8iXC1prmm2KLTIUefMlUVz1j6YA/wa/YZlIBLGbu4R/2GtGa
	 GguMTVs3oWjzTUd1ockGrMoYoM47ZFVJYdf0eJ6SDiqmZKBgF1zGuXzsk9IaJV4+hQ
	 Kbb3+E513eWkg==
Date: Wed, 18 Nov 2026 15:14:01 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: b4 review has no way to throw away an email
Message-ID: <c325a205-ad11-4e0e-b230-d437059a1cb4@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="JhTkEmRdJtedeyc5"
Content-Disposition: inline
X-Cookie: When in doubt, follow your heart.


--JhTkEmRdJtedeyc5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In email mode if you start replying to a patch but either decide not to
or decide that you want to restart (eg, to get back quoted context that
you deleted) there doesn't seem to be a way to do so.

--JhTkEmRdJtedeyc5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr9wLgACgkQJNaLcl1U
h9DbxQf8D72vEf4ViOIs6BXiOGYfC5wXLEW+lAnlGmYdzyVqb+WXo52l3W7LTq6q
Oj6AGhvoTlpYlP03iXaXinLpI87e404JURlZmVnNZrKO67D+9Z2gfCJHLf0CI5vx
ho332EYQu0QNsOcf0ec2Dt+3zD+bp+oStZLifwoL76/N5kDLwAgcBT9eYJTZ1D0K
heXxT1hDSfDnCOZ6dD9bx6s2CRWARuayoQgTDNGUXHYmAArTSy5yzGn5iEHo+1JN
UTlVjG94I61Xm27gu7loMtewoZxqlpC4yP5NGM8JJYITX6XQTObDGdD9TxH2TqAZ
KwN6hXmf+AKsrQs/0CuZQBF0OZLrPg==
=h5Hs
-----END PGP SIGNATURE-----

--JhTkEmRdJtedeyc5--
