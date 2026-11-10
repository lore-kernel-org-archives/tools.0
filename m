Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794336812;
	b=h1rkPyLTmGJMxVMrAjvyZbHZUFWuRuqxUDWkswtmaxwl1UrlZbX40+yPX/oprebZORwK
	 JxSm44KeMFA3EVfeUYKY8yFb0Yy0bKgtWuCFxUE6OH4CK9pAw5dBQS3f/eytGvYW4kRHD
	 MtcFyye6qDdxQqsksBG2ABq7sxqJNytYfb9Gvc78QEirJkrIRATPkdpX54uNbOeKwxtN6
	 2Ep01AmRaOSFDdKg1BWxh5NM4UrMbEISLOHKGd6LUFzrSZCmY752nexpMMKtgL+TtkTHT
	 p8aEQuvNzbWr8iN3eWVPNMbYsvivzLppnRZpmPX/H4gFewsMKmnvy6eOngQId1k44Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794336812;
	h=Received:Delivered-To:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 X-Cookie;
	bh=+XapRMGir0pSMj2oU0bM9XLh8Hupyoxj53hu5R14E6g=;
	b=wIU5L8RqYdiFvEey3ApStB+Mmu80Pt6VmbRI1TRyIC7H5lRfzyI//uzrK+7jiR3f7ZuI
	 V40i/zQJNW4w1DY8f8dLL6nZn+2CpEAacQ2jHoB6bKIG1v0W8PD2PgyYmqNET/3CpegAj
	 607mj4BCksu9TSOzwje5Q6uER191zF+huoNQ2NeCybSyRGQNH7ArUCT171j9yo5l95v91
	 EtAG5mCpIHLbKVZqOlnqSXPZHBNFK5KO2glz99g6XYH/krpC+iP4/CKZmY7mLK+ZccOtT
	 jLnh9Kmy6t05VGqMAB+fxjYRT9PTiB5zH6Fc+gYrIyH6ip426EXWoyeN433DXUqWEgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VPZDHDLK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7EF606A31C
	for <tools@linux.kernel.org>; Tue, 10 Nov 2026 18:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VPZDHDLK
Received: by smtp.kernel.org (Postfix)
	id D100F1F008A3; Tue, 10 Nov 2026 18:53:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13BD31F008A1;
	Tue, 10 Nov 2026 18:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794336811;
	bh=+XapRMGir0pSMj2oU0bM9XLh8Hupyoxj53hu5R14E6g=;
	h=Date:From:To:Cc:Subject;
	b=VPZDHDLKbD7ktxlLRp5uT63uypxAu2LNsv9IgrdT0XFKc/08bwiXX9W0Jm+nxc8U1
	 9Z1atoaSOcWvjfCij+z0RZ12jeoLZI2ZsFuQYsOUkAx4zRP/CNqLWjuvLA9dfT/HbG
	 l2/ExWmuWhjl8quwY6kJQUqAEpz/LysmXg/Gb4TE0lvboAuJOzRBUhtOHWFZCOJ9M8
	 8dREWjTmeJuV/3X4dmMGtHB4hAB+hZh4YS/ZE70GaMpXCr+did/8Qb9yzfEAYsOe5H
	 QkYnKdVlKtwdtj/PiBcLwKsXGGrbNd0r0cAkQKs8NWRDxTXmeJ+5g4IUJQ68M+LOTD
	 98kt2UDFyiwig==
Date: Tue, 10 Nov 2026 18:53:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: b4 review handling of prerequisite patches
Message-ID: <0991195b-e1b9-47b6-a302-8753ef6b3810@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="bAUU7ZXRkpxA46jZ"
Content-Disposition: inline
X-Cookie: HAIR TONICS, please!!


--bAUU7ZXRkpxA46jZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

The send interface of b4 provides information about dependencies of
serieses but the review interface neither surfaces nor uses any of this
information other than base-commit.  This increases the chances of a
series being totally inapplicable, it would be good if the UI surfaced
the dependencies and offered to try to rebuild the state the submitter
had.

Thanks,
Mark

--bAUU7ZXRkpxA46jZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrzaCcACgkQJNaLcl1U
h9BRawf/V5nBCzR0Mns3QeKlFP6js/0ehyphFeNeU/Y4eQOk4o8yjpCXvexihvf4
IE3AXxhfDrJS0XxWWu0Aw9Ev8+tBAmPesjfZ4nUS0lIgnD6h6FDUEP3J3XiXic6g
4T/iGUJp9/hrBJ/lYxCXdPHw4dBwv/ms70E2kMy4RDRqFhJoL836ITuSTRYG+A6Q
y8OHRTJo7AF7fYdIAJ6vEmZk1sv1FzvxXHtO/NEq1hrUOJ9TMcmOViIqBsZwi7Y3
PJiWVyiWHLoQp5M/3BUkvSHgOmnApMUfG/qEl+ItmQvw7RZBIZDlmE/ZOuXzh0qI
ZvJcocv530dqtQjKao9Rnmm9kROHmw==
=gJ9X
-----END PGP SIGNATURE-----

--bAUU7ZXRkpxA46jZ--
