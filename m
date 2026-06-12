Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E097C2BE051
	for <tools@linux.kernel.org>; Fri, 12 Jun 2026 20:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781296625; cv=none; b=PmmO3O3L0GxNIGJvZ233wgPsWw+bIlBcA2RXRpkw05dcI2tsPrTQpebh/c/M/9uY6nN+6kFX3sNOE7RTj6rXRvRTmUtzHTd0romG19kq/HmrEtgRnql6SWzNpEM6hemccn0V7mNFQaEBxzLrJdbRwECUnlh/NeC5TUHoESK1sPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781296625; c=relaxed/simple;
	bh=0+M6X3S+ZU+skqudl3sD7uo0v7KdCfHrfjhKXgMiFxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lzwbM2JqGxABUBTfVaC4sLGhFrlIJEhur5KxcDNq4XVBR3OzFR2hUDowIXW7GVOzL5980VSbilKyrQ9WgpUziXL8g57ILo1jK37lVP0U1WHUstu02KHm3Pbyf0duIp3mmV3lorj1VTD3mY60N8HHuAfZcvFySsulSyj38FQKW2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WpL1SNtl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WpL1SNtl"
Received: by smtp.kernel.org (Postfix)
	id 7C7F21F00A3A; Fri, 12 Jun 2026 20:37:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 401971F000E9;
	Fri, 12 Jun 2026 20:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781296624;
	bh=0+M6X3S+ZU+skqudl3sD7uo0v7KdCfHrfjhKXgMiFxs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WpL1SNtlmrMDMKRhmVXxWhQeuM3pNReYIKJKrX6JSkcMHPQfI4XNRVs/RYKXSqsnr
	 NZmpkuzywghEkXQj7PNX0ELICRdh8TxvNEJlo30Sxo7minguKq+QvjVL7PCVDVuYE9
	 lKVjv61rqgVpXue4pkkWjBg6yrIy6xWtHF5BaQ/vcci9OxJJQUyrwikFPvTVXj9NOb
	 lLzP6NAnJwiCT0SV9lwPOLnd90yYbrWq2ha3VggX18VSkIC3DCx9hYB0gsGvGdoJBA
	 yC7o+xGonVfeeyaKbBEhRlnRZ8wJBIJ1eAQIRE6Ybpva0hJx8viZsTkTuLY2Naz6/R
	 NRVCv6qRgdPkg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id B0EF41AC5AC5; Fri, 12 Jun 2026 21:37:01 +0100 (BST)
Date: Fri, 12 Jun 2026 21:37:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: b4 pr fetch refuses to fetch already fetched branches
Message-ID: <aixt7XBPM5DgDPxR@sirena.co.uk>
References: <aiwCjkJ7DWAAD0yf@sirena.co.uk>
 <20260612-optimal-snail-of-ecstasy-cf37a2@meerkat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3Br+FqF9SI6GNzR3"
Content-Disposition: inline
In-Reply-To: <20260612-optimal-snail-of-ecstasy-cf37a2@meerkat>
X-Cookie: Price does not include taxes.


--3Br+FqF9SI6GNzR3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 12, 2026 at 04:32:13PM -0400, Konstantin Ryabitsev wrote:
> On Fri, Jun 12, 2026 at 01:58:54PM +0100, Mark Brown wrote:

> > Running b4 pr on a message that mentions a commit that's already in some
> > local branch nor (AFAICT) sets up to do a b4 ty for the PR (which is a
> > large part of what I'm looking for here):

> You're right, this behaviour was not very useful. I've pushed (really!) a
> change that should make the checks more narrow and only bail if the PR is
> already in the current branch (or the one specified with -b). Even after it
> bails, the PR info will be recorded, so you can run b4 ty post-fact.

Thanks!

--3Br+FqF9SI6GNzR3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmosbekACgkQJNaLcl1U
h9AgsAf/WruHo1ff1Qz+xeSomCCER77QVLZ8noSBuIslyWmXYWPlCBUayPWe3Aau
70Yd57bYFqOzlRsljb3IZ2BbC6KrgA5zOnm6OAT3+HsNzT+4Q/e1S8c1+ctt+lqy
ofp96HrKszkwXMNVLwrq1iMcPzoSPwQTEdK1axDX/3K2qDv5ixE8BHLjA9td5d15
4/ZctKX95oon5G1jYLdDNAiJYvJ00h4Hz5wuR6OqS36FQAZLXftjmoQJH3jMq75C
64baVaHm47JBYclSI+ExevwE1ugARjJDpklY0Dp4zxlfNsZDK+tv/x/+o47WUZDE
yoABTBkslvOVFe+HZB0fN0Ah7ejJ4g==
=8xXH
-----END PGP SIGNATURE-----

--3Br+FqF9SI6GNzR3--
