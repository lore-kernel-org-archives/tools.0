Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C001E3BB675
	for <tools@linux.kernel.org>; Thu, 23 Jul 2026 18:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784830724; cv=none; b=ZaFI+K8pCGH+pMAsaVaV4qL8vRlfzz2tVA6vgCg0YA0pWyDX7/RVK0Se1Pjpjw89AtYt/7vLnw/11I2pU3+ZqL0Ugy439TMI264JNjapOFTZEohqfgbtJHsaT1d2Cwg4WMQFJ+cfnZ73dzc5ZjlS2ZsdzV8P+2JWIa4ZbTZTFgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784830724; c=relaxed/simple;
	bh=MkuE22HGlobhaZ1AwHsYTkDVP4QDjPOMw2SWOnp2Qkc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dq8TJyjC1g4N0Ym1lLIEA2j5jT18PNjAyQ3CcA68CHcm9nESKErj1Tq+lt5si8bpH7PlDHtWoI87mODQflJJ81PcWRaw+HK9oTHibEGi0jTPl42Lockn2NGgxfYlaw4GSr3kBMlAgssrStP2Lv8sbZf6V+4s2Cy/lqnLo3nld94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RtFz0MsK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RtFz0MsK"
Received: by smtp.kernel.org (Postfix)
	id C17D51F000E9; Thu, 23 Jul 2026 18:18:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B05A1F00A3A;
	Thu, 23 Jul 2026 18:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784830708;
	bh=ScTZbuu3pUihOCB722hDz7nCkM4bkGn0CzbkswlsELg=;
	h=Date:From:To:Cc:Subject;
	b=RtFz0MsK7edx6DfNXitPZn8Lu9cfrt8KAGgtavfzlPqgK6iu6kr7t9OoQm4vxwHrU
	 Zicq/d9BsHwX+Ib+6jdWD1jKbwIoZFx46h5MQxIMSAGXHN3q5S/p6VEpymzKh6lukq
	 rHj3VRLbMgGApT2fZleNfZpkEocgPOkCEqyWuuGMnOx20N/FmCrCGXLVM7pcQmSKvs
	 Krqsi8iiM+FdSnrGGvEmY7M1W1rajJmCOSGVN1cFHFxclA6Ima6ngubVWiqh+anM8w
	 qMU+3/DtJYXot3pAth6qMbDdEmtgYfVPo9r5WWVvAkW/zjWc80SPcy5tuBeNPDkNQL
	 78ZD0i2G+G6Wg==
Date: Thu, 23 Jul 2026 19:18:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: b4 review spurious duplicate detections
Message-ID: <0a399ae7-d60a-4378-8c66-2ef6f48aeead@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Yt2yciO5TMPiGXE7"
Content-Disposition: inline
X-Cookie: (null cookie


--Yt2yciO5TMPiGXE7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

For some reason b4 review thinks all Randy's posts are the same series,
mostly recently that

   https://lore.kernel.org/r/20260723181215.419984-1-rdunlap@infradead.org

is:

   https://patch.msgid.link/20260713175510.524728-1-rdunlap@infradead.org=
=20

Thanks,
Mark

--Yt2yciO5TMPiGXE7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpiWugACgkQJNaLcl1U
h9D8cAf/eRr0wSbnDOb1A5EXNCx7204+y/6/e31ek1XCRQFKK+XsRPFs39Dbmn1Q
TZfzzxtXAgP+gxwzUa+6+j7jCj4w2eQlCSCJ2IldJo9HZ7nArgiVFwKNEYX+y5W6
nOLh0GHTeeG6v7BgPUdv2KzZ6klIHRvAqkgN97MUCs8aN0gy59th6SQo5NaTrcbX
NL4UINOgEB72w4wXKS5ZvP+PcQ7SJBRBf0e9NUDMUODdA44LohhBcpqjXrXU4sLn
jZ7UHYWNbl0f8e+GjNWIL/TF3Cflo050T+UqlmlCcDQJnU+DCF43xtcBObRGAmE0
B8mSoiXzt8S43YCxfty1MalVYj+LgA==
=0h7/
-----END PGP SIGNATURE-----

--Yt2yciO5TMPiGXE7--
