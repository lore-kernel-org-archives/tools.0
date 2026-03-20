Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54D13B895E
	for <tools@linux.kernel.org>; Fri, 20 Mar 2026 15:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774019576; cv=none; b=Um+XABcjrTVpxiWsN4KKs2+FE9VA4KMbfdDkOF+paq1kp2YYYgawdXnoUlcAZlCVn9SLkjA3oXb1S4lURLJHCfjZVWC5+bb0GlkzLe5Uha0NUi5fAWjFVju0Z/pzBlg+0GJAAk6L8e8U5XlxCUYhHaaJwWjljH4EoCpDaxaF3D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774019576; c=relaxed/simple;
	bh=EeB3KRHVLiLBKemne34ULql8aqu3AMmMhEx7BayL/6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gts89T0OCCeODo8DpK+03oDbiK3XP0VAm+siUze2HPgpw2TQ83IuIgIWuPiCFzZMPBS4dvshnF5HvRfJ5Il2x5claf17+3jlSXr8Yx3Q6qb7caY+d8sg/Nle3MB8r82/MZj0yB8sKaNSv270RlByWHEa1zrIq7NfboTzNhWOOUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HN/Hcc8J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HN/Hcc8J"
Received: by smtp.kernel.org (Postfix)
	id 70B2BC19425; Fri, 20 Mar 2026 15:12:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1029C4CEF7;
	Fri, 20 Mar 2026 15:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774019576;
	bh=EeB3KRHVLiLBKemne34ULql8aqu3AMmMhEx7BayL/6Q=;
	h=Date:From:To:Cc:Subject:From;
	b=HN/Hcc8JzWYWCR56vdf33fQVZVSUo5wJR0xEWfpV1xmGyEzvGtfQgCgd9AjcweupT
	 M8hzsdu8ita19ggyjDLbTpKcq84IdEImf0QFpBUgHSKJc+/ToMT+uKPc7ynHe2l43n
	 riEasvXB7aJkkqi+yzu6r3ACwYoais2jSZKnVgbnmqhvgQOVIYvMaodnbi84HKNq5X
	 puOLbhGbwuYtu389hOIJj4tnBGQa+725FL0sj2DFrkT2oWL8HZ+TGw89nHHMCKnAcv
	 KJ27xQIuLBiqLbhRCRcNlqH4v6BwMSHcFme0cI1or5niBnQkXI6l4oWGjYwqT/ggU1
	 kepirfPsBB6+w==
Date: Fri, 20 Mar 2026 15:12:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: tools@kernel.org
Subject: Series revision identification issue
Message-ID: <88549a4a-cc82-4200-b73b-e335cbb2b024@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="F++k2G2yjALDM4/H"
Content-Disposition: inline
X-Cookie: Who's on first?


--F++k2G2yjALDM4/H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Konstantin,

The series:

    https://patch.msgid.link/20260309065137.949053-1-srinivas.kandagatla@oss.qualcomm.com

has a new version:

    https://lore.kernel.org/linux-sound/20260320144918.1685838-1-srinivas.kandagatla@oss.qualcomm.com/

but b4 does not seem to notice this (there's no metadata in the series
that'd track it, but there is the subject...).

Since this sort of stuff is never going to be 100% accurate it might be
handy to have a way of explicitly linking a new version in the UI.

Thanks,
Mark

--F++k2G2yjALDM4/H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm9Y/MACgkQJNaLcl1U
h9B3GQf/e8vj2icG2/haY+4pyYIHPihjRg8p5hraS1WpFhuT30wws/Yi3eGfQor7
LRKmhpBKH6Dh0yeQL62dLAhsEPKB7wD4oDLuYrOwPivFVdqntmuj3iI0AmG6b2ZX
ziNuPhejgk6sbaEyq5Xvsn7ZXNGqMKmxdJueDJ0862S+7gMJIH/YBqNt8DJeZFud
HPPMsB08IkaSmtlD64G9UV7a7CsXnrrNiOnvdU+UchFsSvi6bLtn7gZ6e/09ymii
v8KxWsgQiX6neTamQ0Su1atxXvKlMALPCPu6OHSonpYBBp5AdehLjvGX0guElfpo
NThECv4geYRg1FNSgUtKbFsIk1vebg==
=/MPL
-----END PGP SIGNATURE-----

--F++k2G2yjALDM4/H--
