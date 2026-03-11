Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3299B3E6395
	for <tools@linux.kernel.org>; Wed, 11 Mar 2026 17:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773251715; cv=none; b=QCSytFGeavFpa2Mw4Mx1RB1Dl6kp4K9GjSSjT+UB1oOkNiSduex/XNJv4+5bL5qlN6hpNMEZ5mRVACXbwpIudqJYyJyAUFcWFs0w36tHvBURl3ks0/RjNTrtrsfdycHo2Osk1MRy87Bk2d4/Aogu1D+ezfu317Tr19vcvQZSjsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773251715; c=relaxed/simple;
	bh=qC9unol7kLlNpVAnFQk65chtNHHv75fsKZDwWznYGtU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LAWPzEoU2fbqM5N+zElcO/Zlv/zIfS94DlDLsSgEkHFZKR9cyAzEEPpmYjOYSX9X0UDUWcd8/G6raKuozTsUpAbshOM2PCa4/xqISiylcGuXdJBgYuFE/PULG+9UDgdy0Y2CC/oSst4drI0AkwYuPNdHIO6Tc6FC8j4FheFNsqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U55PmrX5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U55PmrX5"
Received: by smtp.kernel.org (Postfix)
	id E06CDC2BC86; Wed, 11 Mar 2026 17:55:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25FAAC19425;
	Wed, 11 Mar 2026 17:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773251714;
	bh=qC9unol7kLlNpVAnFQk65chtNHHv75fsKZDwWznYGtU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U55PmrX5l6QQRZtAjUJYZr7Q+jcLz7YuyYZnlZYePtd+nlnlGAfEnOLt896sdrXGz
	 XPAyoYNz/Xs+hQ9kd8MQRSbK0b2MbYVmSiPW0Nu5Jvzz7i2VSGqnXyi2iZ9YuFW0N0
	 scSFbPfttArJvB94giZkgL+GXqoaNyrySB2FAL3P7cCCrsiLwRsHOsOQteMRfPRGci
	 +4aM3k77SiuTcVAeqlTmMTKwjIxeXkUEbRkgaVo3n4F3Vf0M6aWmBPLvhw0o+J9Z/m
	 r0XKocdfWVNJBlkSYxFm2upejt7zDK0aArj/E6IZ5Qdpqw+obeG9x4QiYR5ZqgMLoP
	 B7PqrJ33wZlOw==
Date: Wed, 11 Mar 2026 17:55:11 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: b4 review feedback
Message-ID: <207defd7-8533-4991-82d5-f42e676e9a7c@sirena.org.uk>
References: <c2cf828e-fb43-431d-91f8-ef7ca384edc6@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ctcU9/dd5NDtcB5O"
Content-Disposition: inline
In-Reply-To: <c2cf828e-fb43-431d-91f8-ef7ca384edc6@sirena.org.uk>
X-Cookie: When all else fails, EAT!!!


--ctcU9/dd5NDtcB5O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 05:09:19PM +0000, Mark Brown wrote:

> I've run through a bunch of review using the b4 review functionality,
> it's mostly working well and helps with some things I'd been wanting to
> improve.  I've still been using mutt to reply to things so didn't really
> test that side of things.
>=20
> Issues I've noticed with the flow, some of which are repeats:

One other thing:

 - Checks for signoffs (patch sender and author) and the validity of
   fixes tags seem like something the tool could just do directly
   similarly to the checkpatch integration.

--ctcU9/dd5NDtcB5O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmxrH4ACgkQJNaLcl1U
h9Ct/wf9EoTnSqefQsxbvxDrx6mi7IKuvtn9ZcXnJlfoeKyWSXNDsuA3oQSluGHl
BCXsC/dtUMSadyq8P34YGJzUU/xL4uVNnD2wImITtpcMbq9gtQHqDyTR1xEMj9+/
e+tUCrWgWIXrQfq56kHxRA0b+gv+1ODe+nyZfkndRdznKTtCYgdWC4W1jID4sTg1
uh1rPz+fS4eEqnDHWvpPZ2PQlye7CZk4nddC1dmsvb45tmz1bh81IZ7gLX8M1mCw
zyFJu59oJRGZ1N9LNq6ijw/YZgZnHWtrsYFMXZOppNLWSqXbsmOGwmCw8AYiMYVn
VcDMjuBu3zhsj8jOHWhNVrhp72EC3w==
=hkmQ
-----END PGP SIGNATURE-----

--ctcU9/dd5NDtcB5O--
