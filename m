Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021052C11CB
	for <tools@linux.kernel.org>; Thu,  9 Apr 2026 14:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775746679; cv=none; b=TK/BthjNmRIeBL6v7mVSUORRD4kxRMwrKJq7ppmMg7EWWA0u8MyXqxgXL3X5o23jLfMgoa9PMw1Wvg6wPtf+vDnwJpQbhcZm2ymRl07Gz4+wTfwwTcYON6h+I3YkValq1TzR474ay3cy9cmf34H9Fs12OrieBTselU8LpM1qQAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775746679; c=relaxed/simple;
	bh=sutZN4Lh5FG2YzrpdbQ/dqgSYFfdQIu5WvBC1aJRxT4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g7Wbd7e6DsAICHNQxPSjXMfhgNuaTc2PA8AEleVYtNRXcLqQQAksTGTmNq3zpouh4+EJmrfq64Re4yxMb2t8Kkk0XlpF/paMksJlTBQNs8OaoqwNnnbMY+iTHdj5hH39YZQlNVttwgUOQGJFR2SQLUGH8/X3MRvNzddr7bWud2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mx87Kjk5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mx87Kjk5"
Received: by smtp.kernel.org (Postfix)
	id B227BC19424; Thu,  9 Apr 2026 14:57:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0140CC4CEF7;
	Thu,  9 Apr 2026 14:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775746678;
	bh=sutZN4Lh5FG2YzrpdbQ/dqgSYFfdQIu5WvBC1aJRxT4=;
	h=Date:From:To:Cc:Subject:From;
	b=mx87Kjk5yhg5Eq8zBkOWBNLYDfWmHDwahLZGk8UX41uz/X4RejpwZ+gla00D7OL97
	 uuMtfjAOELinAwjjMxsDaIaPvrzJwm9DsTkKn6FzR3MNSU4D8MyZyFpCJeIvwG37h/
	 2tgpV0bzdpMKnkIZEcgrLfzs1Whr9g758mZzM/GwBvn+NfpTDyA15rsjJ9MNuIFmVo
	 tBzycuXq8bGt7OCW5KJ3q9SXxj5rCW8MFSlBId084TEPAt8Oea1xS9R4Di7q28jtYs
	 BdXcxW6GlM79y2rZWItAtJmESvbcQD9GZ4ZnE51jcOtLHApmix6dlwTm5DgbcqvX1X
	 XHfeEKkJf5AZg==
Date: Thu, 9 Apr 2026 15:57:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: tools@kernel.org
Subject: b4 review series version upgrade flow awkwardness
Message-ID: <be5b8df5-3995-4f81-92af-dc31fa4f6c04@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="66WV6DEIalFWF7+f"
Content-Disposition: inline
X-Cookie: Hailing frequencies open, Captain.


--66WV6DEIalFWF7+f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

When a series has been paused waiting for a new version the flow for
upgrading is a bit awkward.  When looking at the series in the UI you
can see that a new version is not available but the action for upgrading
is not available - you need to bring the series back into reviewing
before that's available.  I'd expect to be able to do an upgrade and
return to reviewing in one step.

It also doesn't seem like the new version causes the series to be
highlighted in the main series list, or provides a list of upgradable
serieses.

Thanks,
Mark

--66WV6DEIalFWF7+f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnXvnIACgkQJNaLcl1U
h9AurAf/STV+/rsQw6yifLY54br/zK056dcmQABpL10E/KtLD4ppg6NbGy3l+Z0w
9ykMH7PzMzo4Iiikr+DP7pFgGkp4TIK/0485KGb08lU2GVr5DwlS2SpfPkxVOp/Y
dAAq4qdVCujxXx0RaBkNoDUXH3spyEbmNNaryDGVZhYsNh1QikCy1RNdffR/FfdZ
+iyIKAuhdrmRProKG0HMe0RNGidoa4ZUASTV1wd4vLF0oZSVgURmyAM4PCnEZ6zd
atx15GXfFnDc7nHDw9xTpR37FFvWObS76FvFXnaek6gMWlZaUUn7KJn5C6AXuaUR
IFHYNvWiHyrx5OKhJ1sE2hlwbEfdNA==
=Qitc
-----END PGP SIGNATURE-----

--66WV6DEIalFWF7+f--
