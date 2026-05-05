Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D24D2BB1D
	for <tools@linux.kernel.org>; Tue,  5 May 2026 00:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777940805; cv=none; b=PTPLBJJsqF1b+ZdU0zFCNr+4mxtfYYhZohDyqR77Vtw5QJu7i+qHtbvhgn6TptIlRELaNieBPRQ+TH/mB4Djp/WijR3a6Ql27CG60QEmkNxh/aFe0X9C853wm2cFpH3efJZSbm0Av0Dj3bQx7dqxuoLhJNaOCesDGT/9zzE99cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777940805; c=relaxed/simple;
	bh=IHgC0AAUbmEALwVuXK685UHmF+uVh6vIZR/wxKPnuHI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FP5k8VpHzfNmrinJJwmI84nbdB3ieVssxPJkzbvRBiuFqDaCsa7/hGV2qbBJyX59AsSYgL9XRAe649ZI7a+RoZGNlaQX+Aiyfb+pEN1ns/uvHjby5/64jq0kaMJXYj9K17Aepvc7wtE+J+QL8SOzL6SdItVg8ut+8MnntXDJvD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q0gSBspi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q0gSBspi"
Received: by smtp.kernel.org (Postfix)
	id B62DAC2BCC4; Tue,  5 May 2026 00:26:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8855DC2BCB9;
	Tue,  5 May 2026 00:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777940804;
	bh=IHgC0AAUbmEALwVuXK685UHmF+uVh6vIZR/wxKPnuHI=;
	h=Date:From:To:Cc:Subject:From;
	b=Q0gSBspiFzrRqCaZMy0jXhaoPnF/9XAMT3jQ02xR7K6EMfpu1pdW1YI6fWTm/HESi
	 qdhvr6fXrsJvmfAwQyH6TMtVGTtWP7xQ9KvnIucedi1Xg7rOiQW8A4plI0RBZblvUq
	 mk1lRz4qmu/D1Of8b4Ue1yX8eRr9GM4nbjDvDrarEKzQKYHMMCHRK0FMisctvE2bVk
	 6zln/clnQ1vfVXA9z8sfRp9DHbiKnqJLaVvXXHdRMfy3NxVPsVxMdNQBh02JMFqKuF
	 MBkbADSl7BAqXO310DTKsE3ej7VksNPMl1YvO+e4WrpEClaw+6efUeq4MYtzSGaTFM
	 vJxEcJ5li78XQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 2BAA01AC586A; Tue, 05 May 2026 01:26:42 +0100 (BST)
Date: Tue, 5 May 2026 09:26:42 +0900
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: b4 review workflow issue with partially accepted serieses
Message-ID: <afk5QvNAQDxFCbvT@sirena.co.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VTqy5DUXjxyzg46e"
Content-Disposition: inline
X-Cookie: Alex Haley was adopted!


--VTqy5DUXjxyzg46e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Konstantin,

b4 review tracks the state of a series at the top level.  This gets
confused if you partially accept a series (eg, taking fixes at the start
of a bigger series that needs more work) then the state gets confused.
The bits that are accepted trigger the applied->thanks->archive flow
but that means that new versions of the series can't be ingested even
after the series is archived.  This is a pretty severe workflow problem,
there should be a way of splitting serieses and/or retrieving them from
the thanked/archived states to reviewing.

Thanks,
Mark

--VTqy5DUXjxyzg46e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmn5OUEACgkQJNaLcl1U
h9COGgf9GD7zJ8gsAh100p8qyQEKTpzwdQ4D1jTx01rQQGuv7oQy/bwea5pJKMIf
ndYVQVqgyd8lSyRhDLcIEaG/+LdR3w5sUsTDPj3Wn6UdDBnFhPuE6YZSh4Of0aNn
4wa1y+s+BA85BeVpdZmZWfyq0jxiL7noiZmxwEvBUIjmmm1K+Eia31s3uPe6FlMG
Ti3PNj8LPEJuYkpl2UBjJ8HIysEQL1vEsyXC/kVGJgOix1/vbvJBOtaAJlMzcfPJ
c7r5ns8Inh6JOA7lcSWJlYcigGROqfr6uevoZkB/KrXbzz+1T7Knqn7mzEVfBaLM
cMskOLfMhG4V4+NNqxUFlOW50Z3bHA==
=MDh4
-----END PGP SIGNATURE-----

--VTqy5DUXjxyzg46e--
