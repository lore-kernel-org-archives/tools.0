Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6EC16D324
	for <tools@linux.kernel.org>; Tue, 28 May 2024 12:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716898998; cv=none; b=evW15OgQaS9PKkiOyQG2DvtfAL3mJueqaeAqhsQQxn1b1i4Iaxtan5oM/t5p1muYzLijxtGAWMtUgxy4EANRWkCyIvRRIc7nDRSp09Wdwkts0VlzCj2ZRlkYtLC2emWTl493rRS43ONW++cWWTm8HO5N8WRYjK2vhZNd403v4Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716898998; c=relaxed/simple;
	bh=TXzpGiObPDJcHkOSH/4ESvb2afu7v2DA6gqR2pG5oUA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BmbBHuMDpRAV+cL1VBl0Fs3qRjIOZg4JOC7MSo69hC/2hNBSZ1K3caQ+g9CPKS3V6eCPOpAzeQR9A55L+O4kqlkBADssvv0Iny7Fx67+l1jiadqb1rdl4UIdXE85XsBYVzHY9PL22e8MUw0Z2oWFOcjD0nI9FO2BAYDBSHhdgMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VIRj/HwC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VIRj/HwC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF0C8C3277B;
	Tue, 28 May 2024 12:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716898997;
	bh=TXzpGiObPDJcHkOSH/4ESvb2afu7v2DA6gqR2pG5oUA=;
	h=Date:From:To:Cc:Subject:From;
	b=VIRj/HwCMj/PmgELFtgA43XdomwYXCgBwdQdnJ7qh3MAAZaY677EDExCmfUmMgTUO
	 c3FmJqvzbRe6Ee00cV6eHI52wTaF+lH2kAwZgVVFS55dvS7dTJXAA8EaC/zr8588qM
	 T2icR5NZi5aS9cfB4ERhnF+/D0hB4ebEitQWE7MKmQ7uGuo65KCrcofCtuPd3Fmyq7
	 K+yZM9oEKK/lok7iqnAcpuieHTDCb8hoA2aeYLSRPF8o7moQDuJVjj3l+BK0ricB6Q
	 pm8Axiqr9j0FjuLulVnKV56OhvpQ//UCjTSvI7dtABpWLDtXrMj/eL8cyEokR6QUfh
	 JetbNCD1DfiMQ==
Date: Tue, 28 May 2024 13:23:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools <tools@linux.kernel.org>
Subject: Single patch ranges no longer understood
Message-ID: <177fedb6-241a-420c-ab5f-8b7ae4d7acd9@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1q54p3rjJsJVmW0y"
Content-Disposition: inline
X-Cookie: How do I get HOME?


--1q54p3rjJsJVmW0y
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

If I run

  $ b4 am -S -t -g -3 -o /tmp/x -P 1 4ce8c4f16f1cf3aa4e5f36c0694dd3c5ccf3cd=
1c.1716870419.git.alina_yu@richtek.com

I get:

  Analyzing 6 messages in the thread
  Unknown range value specified: 1
  Checking attestation on all messages, may take a moment...
  ---
    ---
    =E2=9C=93 Signed: DKIM/richtek.com
  ---
  Total patches: 0 (cherrypicked: 1)

which is not good both since the failure to find any patches isn't
clearly reported and since I'd expect to get patch 1 fetched.  If I
instead specify the pick as "1-1" it fetches patch 1 as expected.  I'm
fairly sure just specifying a patch number used to work.

Thanks,
Mark

--1q54p3rjJsJVmW0y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZVzLEACgkQJNaLcl1U
h9ACIAf/V3olPRKUbxvtETQ+JWqjuar1hIOHTH4SEMdTzqrmP52IcNdRacM9mpNH
1H1qxdbcguKSt18Ab5lIn2SIe2Td3CNAzB17zkPDWLEAjv4Q47k3aE77cEQMDLV/
iSTe54OgjMOJiCUAIjmVa24cf/FDq/MssGJkKAFvAYUztSKC0JPAPvKklMLztosK
0QQSULg8H+NPA0lFV1O3SkxucA8a7AbxCFLjDlJ6BRAffCPLSGCBcJk+BBDthAQM
bZd7lD3SJtv/08ny4YJM2cjig5E/96v41IrmPTwlCTd5QlCAZB6yeqv4Y9gnsoc7
Gp5/cOocWh9+hentL58EHDbvzvDMLA==
=en3G
-----END PGP SIGNATURE-----

--1q54p3rjJsJVmW0y--
