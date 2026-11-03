Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793749996;
	b=E0CnfU4IcAkB/r+KIasJcAcXmZEu84OpInxM9jVI0SVHp8yMDTux+6MThMxu5hxTGlmM
	 KoyP/+G1zHbhz2gDHnfBS3U0fMcI28velzznvwKcrca90DMcH2X35hO585uxH62/ZNbcc
	 8uLSazqbUse4/RVaGVdiFpYPTyjjYwv2/ql6fAc0UX8+Mnxo6XNgG+flml4R7iUcbH/5a
	 ypsA0gJOuabzzllZbji83pMiqOLTd0mluiMNbV842xTnghXg8SLU3aU08m7LKI55aZXxb
	 q+If789YYNuJrP29+zvQVqCx8bOUo8aqLBq/tFsauixfsUtR6NcWTBvgBf2Rdwr0k9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793749996;
	h=Received:Delivered-To:Received:DKIM-Signature:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 X-Cookie;
	bh=74LYleP7dLtxc+DN8G70ktzP/7zOHA76/lh7FWfT4+g=;
	b=vCYV4e4Xjt3nCtpchUvI2ga3n/eIWmHpf45tFaSvyMi5xrlf4BxLtJz3FBJVrfEwLEXg
	 1TvmKUaVkxWfOtjEVDEWsoxG5m5Ynul9Pvxi/1bWsul407YL2NQu7UoHdZO1kHxGf0ul5
	 1zhfteCyLJUBwjCB4kgcPfNfvviycT7hX3EXY4Ua3wj5bWDxmV+O+GxlLfLLKfzyYHr9w
	 lcdmnT5lH4NRnUQor1e1X2eN3yWHOAqMFK7gR1S6da2rGXjwlMDks3/xGXslihUrXqYVX
	 QkXj48tBAbIzNaBOBfABBoeSmAaarUAYu7sc9+I1wAhV20HH4lgGW2yy+hxpR9DnmJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GmJI2RdQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BA9606A324
	for <tools@linux.kernel.org>; Tue,  3 Nov 2026 23:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GmJI2RdQ
Received: by smtp.kernel.org (Postfix)
	id BA8441F00919; Tue,  3 Nov 2026 23:53:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BD561F000C1;
	Tue,  3 Nov 2026 23:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793749995;
	bh=74LYleP7dLtxc+DN8G70ktzP/7zOHA76/lh7FWfT4+g=;
	h=Date:From:To:Cc:Subject;
	b=GmJI2RdQdEJJwSkXEirFTomK8wWN+/ddMEHNeIlSAcgTbRhucxsHglmfj4xRec5ZW
	 Eee/DtewiHArOjM0RYFN8yO6ImN8M4b7X+jv7wIJ8pu4+zI7FPezwG0assUuU+hli0
	 de4P+HpGFwOA4EUGLSN0XK6i2r+XvOza0wFoT2gv4j6g+8IbV22pnrStmzy1DI9qMN
	 GI6u3w+a9l7vnnPIDWNhWsG/9aGTJ91Bi4x5TXPR0lO/+PuYF9LLVqHe/H2q30aMpS
	 /m+3EFc7YO5lgHseCiY5fG5H/6HlwXPeU0eIfHGVSISCeM3s+DimJhIy7SNTkO61wK
	 N3WtQo75fVSHQ==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 1776225D83BA; Tue, 03 Nov 2026 23:53:13 +0000 (GMT)
Date: Tue, 3 Nov 2026 23:53:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: tools@kernel.org
Subject: b4 review should support detaching revisions
Message-ID: <6a8bb6d3-f5cc-4932-8d05-0d41c055fcc7@sirena.org.uk>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="U5714d6ur23Eiiwo"
Content-Disposition: inline
X-Cookie: I'm shaving!!  I'M SHAVING!!


--U5714d6ur23Eiiwo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

When a submitter splits a patch series into multiple new serieses b4
review can't cope with that at all.  For example it thinks both of:

  20261103224753.3610049-1-jctchan@gmail.com
  20261103225116.3624270-1-jctchan@gmail.com

are the same series, even with the original v1 forgotten.  You can link
a detached new revision, but the inverse operation doesn't exist.  As
well as splits like this we also see this happening when people do
something like send a new series in reply to an old one and confuse the
tracking.

Thanks,
Mark

--U5714d6ur23Eiiwo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCaupz6AAKCRAv73Ows9A4
iawkAP0Sn4xSPH0RQUyOa5XHVSR92cLlNWHaLjBS1A/aWK01EgD+Lkc0f4YaKS+L
L/BUvAU3QMN+MhmECK/YEGHKfj1blgY=
=t2pi
-----END PGP SIGNATURE-----

--U5714d6ur23Eiiwo--
