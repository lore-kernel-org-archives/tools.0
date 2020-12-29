Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web11.10929.1609244228838926598
 for <tools@linux.kernel.org>;
 Tue, 29 Dec 2020 04:17:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=ElvghdJt;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: broonie@kernel.org)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A8AB62078D;
	Tue, 29 Dec 2020 12:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1609244228;
	bh=x0T1/ZGIGROFraY7WM4meF4jjSRPs4jWpsCOlDmRolI=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=ElvghdJtyx7oW+S1/4SWHIOB552MT70/hptyePkia+82PNeukLt25OLCjMPkxu4/N
	 L4O9E16ECnG5QcMdxBXzthINL3hLNzqTmzRl2LBCa8VeNbYr/B4VlXp9zpTM4Qdx7B
	 fKp5Fa+QCJ6iJQMfxQhCsfIzq0+AmD+LxQNHZcmY6ZmO8xzYDezK1E1sOKafo4kGC6
	 TvhS+GK0lKoOQlS8cz3NeOuWazPRckfy6IlpODd7coew3cOf04ZIZWZ1hwb9dxpcu5
	 xKZVTP9UpuSG6GWmnvkMXsZLfwcUuGXa5sDwdPhs4G0qHAxv3DoVmU0iOKROoV18VG
	 SPibo8mIHfpCg==
Date: Tue, 29 Dec 2020 12:16:46 +0000
From: "Mark Brown" <broonie@kernel.org>
To: tools@linux.kernel.org, konstantin@linuxfoundation.org
Subject: Re: [tools] b4 ty unicode crash
Message-ID: <20201229121646.GA4786@sirena.org.uk>
References: <20201228161347.GD5352@sirena.org.uk>
 <20201228181830.wi726giciurlhunh@chatter.i7.local>
MIME-Version: 1.0
In-Reply-To: <20201228181830.wi726giciurlhunh@chatter.i7.local>
X-Cookie: Mother Earth is not flat!
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Groupsio-MsgNum: 334
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sm4nu43k4a2Rpi4c"
Content-Disposition: inline

--sm4nu43k4a2Rpi4c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 28, 2020 at 01:18:30PM -0500, Konstantin Ryabitsev wrote:

> I have an attempted fix for this in master/stable-0.6.y, but it will only
> apply to future series you fetch with "b4 am", not any existing tracking files
> in ~/.local/share/b4. It's not a perfect fix, since the underlying Python bug
> is still there, but the changes should avoid hitting it in most cases.

Great, thanks!  I'll let you know if I run into anything.

--sm4nu43k4a2Rpi4c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/rHi0ACgkQJNaLcl1U
h9CbEAf/TXJyzieyVQgY/sYj/kIvYzHcJiaZ61jnlNgZ7gyXvo6YX/wb/gNaArW/
npVKTjnHlxEqP0aEDdlx1ZCsqa+FIJchWYoA5vgX9vkZB6ygAxwLMZWEE/EYesvl
Yu5t9fzKrUzR/AMQ1H2ePWK2czLjcZDKyuc0PIH7rQhZA2u1dRelH+1+r5490ssX
1OJnGxkIxApMyD//YTCRuf6yQt3y1lHHZC/evp0mBVTcpP5iWRy7V6qwSjpwcEMV
JctMzKGR8sfpAaph6BKXphei1a9tV4F29WvP3A9eDl4UQWbYl316LcnjQzMWu29J
QUp+Hp92fN8qUNrAvu8Xv9bRrxNgpg==
=zS+d
-----END PGP SIGNATURE-----

--sm4nu43k4a2Rpi4c--
