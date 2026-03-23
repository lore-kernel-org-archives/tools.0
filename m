Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F4A3BED29
	for <tools@linux.kernel.org>; Mon, 23 Mar 2026 16:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774283684; cv=none; b=UVhnrxV2FVpRCI1TCTDQziZKVpub2VcjB1RNvpQV5gG5sw1UlaohwqKI5iN2j20JOyTYmmRRD/wg9vLpx4Rbr9h9MRyDh2Amb6AvLKCK60M1+H2WDUCMo04+39oEYezp2ICg/AtwhXrmxbbf6jj+shTtQh6G/G910Bh3gPDQvEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774283684; c=relaxed/simple;
	bh=H6EGrID6DfONOYRreyashVtzZeXDZvDVJERwQu9dMg0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cyuJ1eGs2xQgVqRbn2qSLo7om6IKGlFz7AE0F2KgquisjYn6CR4pDjc4+N+MdqUlWhBBkAIWrVgmu8TLaIQVn+jQV8OoLK0JsYM/Vh/tRtoYKy/Rsc23jm4Y/jGEbGBVkMak5G/o2elJ6W/X/1hGTeCKQPaCfm51JwLBUQlYHz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CMXasw6y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CMXasw6y"
Received: by smtp.kernel.org (Postfix)
	id DA95DC2BC9E; Mon, 23 Mar 2026 16:34:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EC1EC4CEF7;
	Mon, 23 Mar 2026 16:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774283683;
	bh=H6EGrID6DfONOYRreyashVtzZeXDZvDVJERwQu9dMg0=;
	h=Date:From:To:Cc:Subject:From;
	b=CMXasw6yVlS/ZgmXLiznGMwrxpCWahglA7ONwzCrmkw5s9Yif+Nx2Ac3ob/tiTgUI
	 2dgZ9tcP7Pis/eApQD+gPqpMTbCefGhSxgZowNxbOyiC2rp/jFlEb9El2AxhjXs8Ks
	 Jmdo8cc63qqiEPjYVQol/zDcSXGqr6HPfp8BhXVek5VRPif/t4A6RynXtlgHMy96RH
	 mw9vQLmCHemyiQVnh/iwka8w8LW1WBh1LZTDKLvwu+94T5aT8sIQecWZ9iVHW2WUH2
	 gBzG39XQCv0IHqDsLob/DnZyOSHfZaTAYnZooD/OLIO+/BP8NQ7cbmZyZQUuZbtTDc
	 1eF66CwDyZc4Q==
Date: Mon, 23 Mar 2026 16:34:40 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: tools@kernel.org
Subject: Clarity of pending sashiko reviews
Message-ID: <f4c4741d-0795-4e8f-abd3-420ab849dbdf@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kefNmJTN6CdO70G8"
Content-Disposition: inline
X-Cookie: Avoid gunfire in the bathroom tonight.


--kefNmJTN6CdO70G8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

When a Sashiko URL is configured (should that possibly default to
https://sashiko.dev?) but it's not yet processed a patch then it
provides a warning "Review in review" and links to the specific
https://sashiko.dev/patch/NNNN review.  When the review didn't happen
yet that's a 404 which isn't good, it would be better to link to the
https://sashiko.dev/patchset/MSGID URL. =20

Ideally Sashiko would have a page at the per patch review, assuming the
URL is usefully discoverable, but probably b4 can detect the 404?

Thanks,
Mark

--kefNmJTN6CdO70G8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnBa58ACgkQJNaLcl1U
h9A6vQf/YhaI1oFDaZMBwJgiALXOvmkjjmFOBafPUg8kHPf6s3lz7tVWzgVUBGY/
tEiEW9sXaV1lYFDOFg1o3YxIGG54sFLj284vvkrKO+rHNgAaZoX5GLBvS+TlrvBG
OzKujhrEwI5rKAFY8EIq9CKQXQ2y57oGk+3t72vnFk/l4Iqx6vPCYqzg3XVm7qma
9VVOUz3H/PzlW5v29sS0x1XlR3T1xQ3ugaTImQjiVy5a+EIcJ0CVonL4uc7JibNs
eONKWLWhaPaaNOsaCZ0UVL9fsuKVTnYyc+ur14QZU7VPHOsI8JRZ/z1Md5vx3YUS
ILYJun/abDaFJNZTNAckw6ifM+SvoA==
=b8uy
-----END PGP SIGNATURE-----

--kefNmJTN6CdO70G8--
