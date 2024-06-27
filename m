Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F4719306A
	for <tools@linux.kernel.org>; Thu, 27 Jun 2024 14:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719498184; cv=none; b=b1QXzRnrRYsThWNrtlEzBflszRNKv9rsvKKm9hdW05XKDOcspoogK4N7W5GtAV1BHJMd0LhKS6Umh5uvR6plubayp29QOI/d1j5+K3JIqRxaF2Kob/KYKYLQ6yLYepp0vzO7N8qH0PcT8LUVS5SNPe+kyFkyj95DYxyyKHddPTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719498184; c=relaxed/simple;
	bh=RhtE14vbH2V1FkngA+pZRydMKnsga5RUfPtV0E6Vv4k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sXN63YI+3q2abHiqxyJD2XX5K5cvz94A9Fw6g4o6I5EwbGTnJpRmXStlnABfjA0EyxrP+cSTlF/8M6FFySggHTW+mlHc1QCEJ59jIjBWb65yVNOIpxnLD31MIqYXzfk5bY81jKw9m9AtsEf/OozICfjaWetjPyHRcsJrCwZTiVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IY03pMAe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IY03pMAe"
Received: by smtp.kernel.org (Postfix)
	id 199A8C4AF07; Thu, 27 Jun 2024 14:23:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3140DC2BBFC;
	Thu, 27 Jun 2024 14:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719498184;
	bh=RhtE14vbH2V1FkngA+pZRydMKnsga5RUfPtV0E6Vv4k=;
	h=Date:From:To:Cc:Subject:From;
	b=IY03pMAes0jc/rJuUEqRdF1jwzrseoRmEHHig8Q2vsggMIpB6ojioIH4gRWrGxPn9
	 3o4baDlggBghPn1nO8FEg6jT2YYsr0wCK0T6DP8eb/huHPk23/X832/JaCYnrF9cPP
	 Z9X7C9+Dy0yYJuh6RxjHaOBj2feimLjn1g4s6mZd+CIIqDvxt2H5oc2vfbEVq0hPco
	 Mdclpr2IVq+0QAuJTvxIyfDbubNi7YyMRTzUyUNYmBULb9itwgzM4aZMtdTL5L2YbW
	 2In83D+wirkiO2YIVmCUF8d/Ee98Lc6mi/bQZYTDKslQJtnaPScPkFBw1GhVYe4sDs
	 3tRXqHS67EEdQ==
Date: Thu, 27 Jun 2024 15:23:01 +0100
From: Conor Dooley <conor@kernel.org>
To: tools@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: patchwork & b4 failing to detect pull request
Message-ID: <20240627-unrest-rigid-c7bb9ac94bc7@spud>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GqxV7j4Ddu7vtlyn"
Content-Disposition: inline


--GqxV7j4Ddu7vtlyn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Yo,

Neither of the following two PRs
https://lore.kernel.org/all/20240419-unnamable-tapering-f05a0af759e3@spud/
https://lore.kernel.org/all/20240627-wobbly-custody-5df564133088@spud/
appear in the soc patchwork at
https://patchwork.kernel.org/project/linux-soc/list/?submitter=206274&state=%2A&archive=both,
and `b4 pr 20240627-wobbly-custody-5df564133088@spud` fails too.

It seems the trailing + in the tag, while accepted by git, could be
the problem? At least, all other PRs that I have sent do not have a + in
them and have been processed without a problem.

Thanks,
Conor.

--GqxV7j4Ddu7vtlyn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZn11xAAKCRB4tDGHoIJi
0vyIAQDAfDgsAhu9Cv/WuUTW6HKEf9WHJSLhQdO2BeuqaJwowgEAkgCb+Fqa7xXM
sFbDgIVQintShIyjYsuBat+tIbkZ1As=
=HUVD
-----END PGP SIGNATURE-----

--GqxV7j4Ddu7vtlyn--
