Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EAE2405C5C
	for <tools@linux.kernel.org>; Tue, 30 Jun 2026 11:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782819650; cv=none; b=MlKzXQ1iO8gMHCWhiS6POkBx3T/jLd/tc8YZzC5kmdn2G6dsDDN8pPgpTrL+mZm1gdbA08JUGmolws6baqvw1o3WqJMAfAKK/g+q7XJiF5XhzrbKQAFD0rUy97UY3QBOlrFN1lUY+1WWddmK2xBjH9zzh4RM6ebm2jtXCN09xwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782819650; c=relaxed/simple;
	bh=iWTzNWfA0XEPg19gLekqcZp6+UghEfDnrOmF1z35pM0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S4gtpRU+kbzSzpQxEd0otRM5gmJ2aui8XSODttgP7YZ0WqnHLEMZUV03whe9fFkc0Npgk9ixJYPq3Zc+Cnbcgdylxw+gT4XuxjYwCztEpdbLa3MGDu37MOYpdPtw0Li8sXChiYHB+aR79Bfd20CJenuQTxhMEm9UDQqbAStdNc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mXMWtzm8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mXMWtzm8"
Received: by smtp.kernel.org (Postfix)
	id CF06B1F00A3A; Tue, 30 Jun 2026 11:40:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 237371F01558;
	Tue, 30 Jun 2026 11:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782819648;
	bh=AEg4rwQKgqP0SNKtkffVwO55HFvi8XBDS44BY6yJ0is=;
	h=Date:From:To:Cc:Subject;
	b=mXMWtzm8ThpjT5ElcANuRs6yLYxV2hX4E9gBX/goTGyNofZu3t5kLDZjX6b/+0HJW
	 AH7aHDPVfgjlwgauaUK6cuHu8BTQaYFuIzd9Dv+8nKnC75M7HMgtuGnsbpCf9CPaSs
	 fyVy4btD3RGJWIUD+yCpPDww2i1/HkwglyjmbM4oZ8Dvq7vpenHmqDSCB19uyj6nlt
	 QiI0+1K1bqPbzHrZ1AWLa+QY0eTPj7DTYIhT4Xe4wlPu/+v89D4rp/KxoMfJ2wHDz3
	 S/zdcdFtVhEZD2AmYs1owIW1YaM8naAlD/FFbHIXo7HRVT5KCnx4pBANEfulhg25Jz
	 MogerpuwnENZA==
Date: Tue, 30 Jun 2026 12:40:45 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: b4 review merge mode with no cover letter
Message-ID: <ba9789cf-a526-4bf9-8db7-351ff9f2cc11@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WM+GBxeO2f8LfLZX"
Content-Disposition: inline
X-Cookie: Air is water with holes in it.


--WM+GBxeO2f8LfLZX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

When applying a single patch b4 defaults to applying linearly, and when
applying a series it defaults to merge.  With a merge we create a merge
commit with the cover letter in it but when the submitter didn't send a
cover letter this looks a bit weird.  It feels like it would be better
to default to linear when there is no cover letter, you can adjust this
by hand but it's not obvious from the series list that the cover letter
is missing.

Thanks,
Mark

--WM+GBxeO2f8LfLZX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpDqzwACgkQJNaLcl1U
h9Aa3gf/VIL3JxRw0rdahgl39DtRseFOcuE9di1aqPDb7uZ/3+vxnA64Sosgbreh
bF2YQo0TBSqn8Q3W34sM+rC78BoubkGkV4IPI+wfGAbMQ+KGz4CzZ2f48APwA6u2
/K/gnO+sh5y8MZeONsD1lrCgY1x4feXbr5Z73AZ55B9UD8/YnGCauiSDtxNYW/wy
NScWdET8qcCDqf0Ss6RUznMSO1dQtL5soLcwZS/HiKEwmVexGITRursdYf6peu4d
cKwdcok9r+xQbEgoUvtRRhq8LlC3+F5PfOUMYKiUMUl0uBTUmu7iM1Dx3fFzRJRt
EE0GygBKnqQ+YZ0bFZCHDf2rHQ3/ug==
=sjdw
-----END PGP SIGNATURE-----

--WM+GBxeO2f8LfLZX--
