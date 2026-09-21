Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3EA3F824D
	for <tools@linux.kernel.org>; Mon, 21 Sep 2026 12:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789992400; cv=none; b=QpaLfZkJldYI/IwwmRgpj1jW9FozOnRMHSS5iTIY/ggEsFylgRuB43bZp05ylIvuQKPdFM5jZ4sOK4N0gUmhzaOgvoYMzaeJeseCOA1+PQkklBTObd0I0NDoE8So9lRQrHdke3lTyQT05ZL6RFU08EH2+zgs6iHGJx7/VUEjM8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789992400; c=relaxed/simple;
	bh=nfPhqYkL8VoEBsxfg268jJMJhzIrm/KCrv7nNSSMi24=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IYxMuIiECho4d5C9Aenilv5MthxMbDUTA9tcaciBmPTVk95E6H6L9hYA5LFauRaRRYk7SHbSmupL5RlyO9m5axT9z06/kfCNj27EsOZlL3XKfMojZAOycWQdiurh1XWrP61tpVtX0Os9KcDdp1iI4rDfSvt3lJFtsRUxA5EaXno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jy1j4WiK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jy1j4WiK"
Received: by smtp.kernel.org (Postfix)
	id E34CE1F00893; Mon, 21 Sep 2026 12:06:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EC951F000FF;
	Mon, 21 Sep 2026 12:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789992398;
	bh=nfPhqYkL8VoEBsxfg268jJMJhzIrm/KCrv7nNSSMi24=;
	h=Date:From:To:Cc:Subject;
	b=Jy1j4WiKHIZY/C4eXZMuPLqhbrEvRcaUIqQ4ErjOVAVe3VYKgbzozMhc2kJaCqhqB
	 58leI7RJeAq+rc6QbT091GT25pKOJhPT66xm8uPxLvM/zJAiI+5RS9T2sz4mDQ05R9
	 A11efRd5jzHDWzHROhf/s17BULyxoTj7EgnaJtYNLZHvCnKQ4Zf6b8fY42Xb0Kta8u
	 CuokuUIcpjSdqgkcgRHQx4y7IqO/QJFn4WdqcIFfrVyDVMUsA/G4X+9V0Gh8g6e45j
	 76KHZ+BDmcz/klZs1gAZ2mdgevUFQvnD73tkOVPdwma3bK/DfzA4uXpQfb7z6hGi53
	 7Jorc+/ym/waQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 4A0751AC5367; Mon, 21 Sep 2026 13:06:35 +0100 (BST)
Date: Mon, 21 Sep 2026 14:06:35 +0200
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Waiting for more email on a series
Message-ID: <arEdy7YJkFP0iYHg@sirena.co.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FIGD4FVQkqah1KaK"
Content-Disposition: inline
X-Cookie: Too clever is dumb.


--FIGD4FVQkqah1KaK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Konstantin,

It would be really nice if it were possible to wake a series with a
condition like "if there is new email on the thread or <one of the
existing conditions>", for cases where the thinking is "I'll give it a
week or two to see if anyone else reviews".

Thanks,
Mark

--FIGD4FVQkqah1KaK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqxHcoACgkQJNaLcl1U
h9BsmAf7BULotyRc+XKIb/0AQvdyuyCOHOuNzJ5rszvo2gc6Y+V/jR8l+r0e4Vxq
s9ZfdkEZjtv8l6C0gRcqzTpC5WN+5v6F/pYuMlKNnDZYYDJEkaKhQQtMxAdfTHyw
jhPZEczfy2W9yLZ1xrk2w/jfnb/qdCmS63dVqJCnit7UBlIavMSBbKwHIFXbooMU
TohRe5WmX4l/6od4pwaSWP+zngnUfAX051ZW8Ape2g4juRFADzj6wmXGrrSqPC94
SRyoBbRUVj4yj7x/Keq3i74UHP9F5iOw0y/osv3/SYGttIBxBq0hj6rXdZ56HtCH
+drykvFNv/bXEFtgL2o5ajZGi3kGKQ==
=8eHl
-----END PGP SIGNATURE-----

--FIGD4FVQkqah1KaK--
