Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD522BDC3F
	for <tools@linux.kernel.org>; Thu, 12 Mar 2026 11:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773316180; cv=none; b=qf8qNt0Ac9yIiQ2xOYjyJk20Q9pF5m1F/LGG0Lz+jfQkMKQNhe4llWXtJI0wAFTcAzBOwibaUHpJenalco6fG2Uvr6bXpBhRE76YvsstXqdwjBRIBHHQcrrMBcCVoEhbscbsnpX/BJhCcA/S9qFvSaxjOCHx49KrYiOytvebIyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773316180; c=relaxed/simple;
	bh=BS22eIsh0K6+PFS0QvZhzwP/DnF0E/eNeJ7Q/csUeQM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KmTNu3kz63LkG/fQxipp3Nyx5zlruSX5E+30TaV7n9rxqTPbafyrjmWKsY+uvbRC/TegR4rEIqG/3TMSocV0KPCxDS/rjVPFHoQCwSw1RDZNe9rmLwIp/FOvTJvXbydfcYQMXvkYCIL6MaL11L+nYoAhDYcasRLNDiBRIBg871k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AL2F5CN5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AL2F5CN5"
Received: by smtp.kernel.org (Postfix)
	id 76BB8C19425; Thu, 12 Mar 2026 11:49:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD31AC4CEF7;
	Thu, 12 Mar 2026 11:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773316180;
	bh=BS22eIsh0K6+PFS0QvZhzwP/DnF0E/eNeJ7Q/csUeQM=;
	h=Date:From:To:Cc:Subject:From;
	b=AL2F5CN5/YOsUmdja0qvS8WBkd1RX5rzNC7cyWWxVkDYmzfstGefAC96AjmK0vFcO
	 xl2WCtmGMlge2XLhjTVWSc/3UvXWyEnoAQbDgrW+VgYU2+x2G5r8Z81wmFWrbWhRUY
	 g5T3e7IFz0P/p7ClAwwwF+rDIauUDatimbh7TgBHgwGa0fuNSGCcJ2pIU7a7ImB3Sn
	 h67eghl+WjjKJTVaAnijjHdcQXXzGKgkD+tsNeNEr8l1WpHNmIqGi+uW7ob0kGTDFg
	 6nDHkPLrMX+64KLV4EuiS2esyOaxScis0q4WhqRYaxRo0zuhj+jblQTi5c7MVQK/Ew
	 o3d1bwflkEABA==
Date: Thu, 12 Mar 2026 11:49:37 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: tools@kernel.org
Subject: Sorting of new patches
Message-ID: <121e9897-ee29-4af1-802d-2d2f979ea0fe@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6Wqjk+NeI90b6IAh"
Content-Disposition: inline
X-Cookie: I feel better about world problems now!


--6Wqjk+NeI90b6IAh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Konstantin,

One thing I'm noticing is that patches in the "new" state get sorted
after patches that have had their reviews started (just above patches
waiting for new versions), this rather buries them in the UI.  It would
be good to either sort them first (as they need initial triage) or allow
limting by state.

Thanks,
Mark

--6Wqjk+NeI90b6IAh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmyqFAACgkQJNaLcl1U
h9BD9wgAheD+KB1zEi348ImTWxV6BiOJL3JDC4NbWG7A/jbiHOgpnSnF6UBp3wHQ
oUK74C2mcHdV0TUsV1BMrge4o7jj8B+dUcAlE1smisfcl8oKOzGBdRbsjp4+T643
Gfibe7u8sMJ3+ApWUDdqXSQbfksDJIhHhKB9HDin0qIfDSj+rvMQyGCNzUNsJFfr
fFIdoYv6OdupXvTe812Bh04BHjcpaWnTQUiMsnkZEOKUPzLnojzvG/kGggmXuAsv
Vy/Vip9urd2TN7dKg+izb1MGzS9JLNWamNUHY0GA9lmQ/YwRg0LbehzTmYRg3wXg
TFkUoptM5JLK3gPilZ35YYuC/fMZ4g==
=gBxT
-----END PGP SIGNATURE-----

--6Wqjk+NeI90b6IAh--
