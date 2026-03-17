Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C3E2C234A
	for <tools@linux.kernel.org>; Tue, 17 Mar 2026 19:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773775327; cv=none; b=cwpe3ZnIU4GQ7ZY3SU/Zm65S3gr72dZcnIQMf/pLP/uXjRsQYb4klF0ZQynXfekfrgSzpZy3EEVOG/IOHSGIl1NTnwRA89aHQQktR/ePnxOQ25YCtkgTagnw4cimCBEFqtuKnGItzoykrHnSJh388GbTWTYqEdB/AhQXEYVDv9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773775327; c=relaxed/simple;
	bh=pOccWc77mo4HzUJP//b4LX4EJsXAd+b/5nznfZhSlwo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PhxVP3EsFTw1sJ/ClowGIhBmfKTHqcWcep6QIr/Fmg6T5Fog00D+vaVA9GSS+wPuXdtPg5k+ceE3oInwYS7eHJyQfgmFsvYJZ5c2UVhGlt99bfSEzJD0pzdCYJXMNq9kKD5OcM61tylTbE43Ya3gvyR48ys9+GlhxZO3BoCErwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E95JEmgA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E95JEmgA"
Received: by smtp.kernel.org (Postfix)
	id 359EEC2BCAF; Tue, 17 Mar 2026 19:22:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 728D8C4CEF7;
	Tue, 17 Mar 2026 19:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773775327;
	bh=pOccWc77mo4HzUJP//b4LX4EJsXAd+b/5nznfZhSlwo=;
	h=Date:From:To:Cc:Subject:From;
	b=E95JEmgAYcsM1GovG6e0kA89jVXhxXFQQcPA1Iv/pOYs/HCArbCMZq6fSOnF9bQ9S
	 R/YrIzTOUrap212QJVrjyNl3UrNQpiiyCTP8yADxcrgzK2eIe60F67K9Gk/BnOl6Yh
	 Q9pyFX3VM9EkAx83U2LqoGqN29Ajk2Za20J+KhbwYqBMx/M4P5nvd1gnOOmuwNg2aX
	 edjCjyFqGEhS36gurJRdieNq2Ug0L71R0PYoMD/w309yAoPPHdhtLGWk7eIpVAjzX3
	 ZDQME2qkhw+32v2yZxKyj8dGmVismN9PtqJX1ZbbYX7P/aBz6o6Le9OE9LBMHIs44O
	 o1YNPKxJtLAPg==
Date: Tue, 17 Mar 2026 19:22:03 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: tools@kernel.org
Subject: Sorting for applied and thanked reviews
Message-ID: <4547f513-9e28-4f5c-93d1-823e70b110fc@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9y0i/8Xt4AEPS7Tu"
Content-Disposition: inline
X-Cookie: Must be over 18.


--9y0i/8Xt4AEPS7Tu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Konstantin,

Currently it looks like in progress, applied and thanked reviews are all
sorted together (by activity I think?), with reviews that are snoozed or
waiting for new versions sorted after them.  This seems a bit
surprising, I'd expect at least the thanked reviews to be sorted even
further down the list than those that are in progress but waiting for
something.

Thanks,
Mark

--9y0i/8Xt4AEPS7Tu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm5qdoACgkQJNaLcl1U
h9CIoAf9Gc+SqD29H7tHgu75AM2gKgNKi2EWEgg04lpXqXsQg9rVi2NcYAgJ+XvX
j2xGHEZF70EpfHHeb//koTpJlzaw03zBEZbChgDrTlbgz8SgY3IVTa5vpXu4IAri
RWhakdtRGnMifwjZWebXS97Xo6IGg2LXdz9GfLbCT0+7yBW5/q+zLMdygJe2BesB
td2B4KM/1SF+8IpLp1LLPUrfDT2DQktPiYThoz7d0tbPBJHlPqLfpgnbqRPtKde+
XeRAIIJ0IygzcLAT9O8pciEoiCQSKqXt0Z0wZQ8J9JRyomxgukr55hs/6URMZdHE
cHysOj5NhlWV4zOXtHDKdKbyQQ+C0Q==
=aYrU
-----END PGP SIGNATURE-----

--9y0i/8Xt4AEPS7Tu--
