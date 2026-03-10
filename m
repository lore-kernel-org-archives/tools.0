Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF61A3AF64A
	for <tools@linux.kernel.org>; Tue, 10 Mar 2026 13:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773147717; cv=none; b=ZMSe72OyVkcoAab3uAsRI0jp7clAmLHZzDT4UiZaNCzB2bHQBlKMuvMhDCMHwKzUcvsKnAWACPfHv1mWammLtTAmj3dIuwEuDqCg28oqswqZp+368QTLZccxobJIc6HUjHYmh0p3OnkTP+I130vkNcq0og5zjGdKbqsx39nlI6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773147717; c=relaxed/simple;
	bh=oddtf0tETG6+sQh9VuyQlb+Xy6k9lZWxTc4lfEBw9Mg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H77hqhCrp1nD14QG/ZdOIqpP+u3zgCCFhT0sU3fP3xZeFIqR4wusOBKymK+Ltdf5+TcNtGNn8iFNQwECXWhoRzE2f1Y/Diru4m2cWMMJYB5fJJ37WeE1LE6FtVQj2ooSHpdl+bqRXkUwmkphcjsbJxTYSJ+sTaWLhYQsP4O5vl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iJJHoMNU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iJJHoMNU"
Received: by smtp.kernel.org (Postfix)
	id A614AC2BC86; Tue, 10 Mar 2026 13:01:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3E66C19423;
	Tue, 10 Mar 2026 13:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773147717;
	bh=oddtf0tETG6+sQh9VuyQlb+Xy6k9lZWxTc4lfEBw9Mg=;
	h=Date:From:To:Cc:Subject:From;
	b=iJJHoMNUVHw08SGCaboXWAVPkcG38tXav7AU+xlTFbWz60r3XJ0BVoxMhCWlUD3Kv
	 Qi7ijka+tzLAQXLvGXeuKPeVQxERJxWrNc1mFfqV7NbW+kVPGYznUsM08Ac5D2oJbU
	 q+VYdlYJhiWNNuUQEP4VeTppa6T5xvMwTH7ZFltjmO5XPYUnRyUKDwX3qgicatXvN+
	 Al4yjDQiK/kkGiYnj9HJZW8qVUzCfXR/gBTBQFaUCAT1nkNwmLvfNEa3oq/mUSnWJ0
	 RbyClHKtICC66WA3f8sNNzeaRHKkKBSl2tsCTKLj5nW+ZBk3+AlGUtPCcWUt9Jxb4C
	 eerzeqrk2AduA==
Date: Tue, 10 Mar 2026 13:01:54 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Display of branches when importing things for review
Message-ID: <37c01662-7b45-4440-b59e-5c4852cd0b78@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Pe5Ocqz4sqRKN5gM"
Content-Disposition: inline
X-Cookie: A fool and his honey are soon parted.


--Pe5Ocqz4sqRKN5gM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

When successfully importing a series for review the UI displays an
"Attestation Check" screen which says "Base: <abbrev SHA1>".  This is
not terribly readable, and the fact that the TUI prevents cut'n'paste
might lead to unpleasant surprises.  For example, in the case I'm lookig
at now it seems to have guessed a next summary commit which definitely
isn't what I want.

Thanks,
Mark

--Pe5Ocqz4sqRKN5gM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmwFkEACgkQJNaLcl1U
h9AXkgf/Yfsjf7eZzhE/L53D666LFyjjD9UxaxXkhf/0dVCwPRXBtDpUIASpMfnk
0s2TT7zf0anAOSEswlwhJKyD/ry94qMPFK3iiyh6aqRFmxsQ81JgaqFSosnkqlWX
hjMahGoSm/pD5Xp7oeWTQ1tlRvKfBJoMl9k7RiElUfbOY5LNBnrr8b3ciTUy76+F
RW3gquf8p1qhZCS7IvjCL1JotWqtYqdetU3QrKS0eCw2tvLDvRQqjGBLlkcQnPBd
dsgQ4oPV+ZSTKEqEJfnDWxpJG6kAG/ycP5QdJS4MJwbwl/sX8PtMmxOXkY5GBoZr
GJM31McnfBCVxShDYpS60NViFgQeYA==
=eEcO
-----END PGP SIGNATURE-----

--Pe5Ocqz4sqRKN5gM--
