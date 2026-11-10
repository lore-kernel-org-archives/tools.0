Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794336454;
	b=tLMNSAgsLOfNjhYn79EOcDnPNrV++w0kLiBk+rWeZnTbtASjasfcoFIGXVDUxwFZVfTN
	 T2o4MqdoqoIyhCiDllxz5qJdJQZZrVhHB0g/diTXJ3WUC+wcWv8Ji/jxbsVAdtEPpUtDD
	 yStK2reg9i3TbDJx63yDgQLe9P07OgjUXVT1w9Dedctb9hmczj8UHJf6QLqzfeGo/tc91
	 mQ1XB3T5eYswcKsxGeURmK/U7i55cDPRZmljnB0vCg+Z59RzQOIVHXSQ+raCbbMyrC3ej
	 MZfu50WKjBPjfI3O521T/PLjscRd2sP7ifpF6Jr8gXvXU8lYEaZqRnbxqEyp5n/7KLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794336454;
	h=Received:Delivered-To:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 X-Cookie;
	bh=aNodANkQ3nnoqYZtMBibNxWA5Fard+OPgsMpR1GbPqA=;
	b=pUHvZoqbGX8iwLtobl3zBm3o/wy5WaAGiXlsiijKvdnYJ0YayHaEAQmQyNXw1VUWYvy3
	 WtFrvUYpw522dnfeY+HQwMdAZ5SB68GXAdLCndwva6dX111z0nbjjjNiu25iRz6J9FG7t
	 vW+L/ZJgoDX6ri1hX/jqsVr3H4FoPAiWeaJI9kjOlAghUzSA6q6RC2PDPtwKYBCeX+fpg
	 0t1qy1m6/ha0XPLGsC6I3jq3Dy3nRvWsG6j1trFzTh2oFWeZe8gIV14Efo+vTxl91/JVo
	 Pxy/FHEYOW0yazbeS/7nfJBwnO6C2Road/6Xeqrhi6cy2sgPI5WFv1erqbYkEXahdXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JwSKEouM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B3A606A32E
	for <tools@linux.kernel.org>; Tue, 10 Nov 2026 18:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JwSKEouM
Received: by smtp.kernel.org (Postfix)
	id CEB101F0089F; Tue, 10 Nov 2026 18:47:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DA1E1F008A3;
	Tue, 10 Nov 2026 18:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794336453;
	bh=aNodANkQ3nnoqYZtMBibNxWA5Fard+OPgsMpR1GbPqA=;
	h=Date:From:To:Cc:Subject;
	b=JwSKEouMLJuFhy9lXfcA9R1lLg/Ba+1z0V2kr1567Db/7gYBdh2mp8kAEzEXWn5xk
	 qE1y5qYxXoOA/OYcwugR6EHPSZgVmaoZQVJB1cPhW10VdHHyQMi2XctkATiNUqy+k0
	 y/cr4IGMwjS3HHNS0oj+52B3VJqZch9s5zHDRgsN4rewAezUNXLlBY6bxTLM8e1LKm
	 8D9j5y+bL7yuZEiRc0Otb6dELNf5Hu9avxKDVjeBRYjk7ztSBmCSuQQoOTUOtFO+XZ
	 tlZWt+8MWjmPvddDcExPcVNenidoUdl2SuhYqswDa3S1gYeNBz5to2Tl0XRmX1Dzr+
	 j+3/LO5KDmCtA==
Date: Tue, 10 Nov 2026 18:47:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: b4 review handling of inapplicable serieses
Message-ID: <a31dd230-e389-446a-94c0-847b792851ae@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="+MfaUMqBCPmLPdwi"
Content-Disposition: inline
X-Cookie: HAIR TONICS, please!!


--+MfaUMqBCPmLPdwi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

The b4 review workflow where you track something in b4 then separately
create a git branch for it breaks down a little when the series doesn't
apply to anything - there is no way to let the submitter know about this
inside the b4 UI, you have to go back to your email client and find the
original mails.  It would be useful to be able to use at least some of
email mode without an applied series for this purpose.

Thanks,
Mark

--+MfaUMqBCPmLPdwi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrzZsEACgkQJNaLcl1U
h9DX6wf/b5dgv9xWPRL7DfG9DxexzyLfDwYl6OWXCRqPrJAtz1juBjjSDrU1viwv
uKmH/52WHzPouSAS2gLXWg0f83jN9kDnE5dOlAKL+/i6c5lFg0KPjhQ6pJErAaxN
OpVontceTHX4eanRkXyzOxgpcm69Dfqt/D4u/OKr+LqGJEyN3Ew9uY0ttvFy6tLz
L/9VwD26tMvriEf709MTOTpH4V/mU30GQZvF8TRX54spvtH+iy6JArrdPXpC986U
bIwy/BdKMg+CvtqTRxppPInLrnQRwH6TJZMxq7CXR8Axdo5FhJcgpwTAIYY3v/oF
m+o0lFEWeO5b7vsR5KTigGScx8vMMA==
=gwI3
-----END PGP SIGNATURE-----

--+MfaUMqBCPmLPdwi--
