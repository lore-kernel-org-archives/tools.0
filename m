Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E476A219EB
	for <tools@linux.kernel.org>; Sun, 26 Apr 2026 21:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777240024; cv=none; b=WbpS5lKPD8olmmgTLPNuZNGEyPSQtphYbpDPROwwDNdAQVkxhSYcIrHDJHSVwubQsLgA1j4AToBGune9EQemyTP1Bu4xCpC9Jma8mmU5pUbHyxpG/mjvwATrc57jIMAvq3TLuhwkxsADFtonMPkm+Vgo42FAzS5UjHMCxMu1Wq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777240024; c=relaxed/simple;
	bh=yfrNwHOYAT5S6aHW/Lb38N89+7oPzdoppbIMcawZ8Bk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TdAoV6DAZHNA8BcHSW7LF9IftLzkqtq9pCIW9lAzRhdVD2/VWDRzWprOiIidQH1wUK0Axdqiz/WyBUGSONvFOCwKx7lJGszrHrRBYs1wxgCXjulzVMOopV8w04DwDQRxYD3+SfSoY/k/fdp4IpnFrZdqP+/Awn5VgMxt1HYpmzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HVklHgaw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HVklHgaw"
Received: by smtp.kernel.org (Postfix)
	id 8E90AC2BCB6; Sun, 26 Apr 2026 21:47:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A70CC2BCAF;
	Sun, 26 Apr 2026 21:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777240023;
	bh=yfrNwHOYAT5S6aHW/Lb38N89+7oPzdoppbIMcawZ8Bk=;
	h=Date:From:To:Cc:Subject:From;
	b=HVklHgawktDoUv9jXwqUY6FTXBv/iLWSzqD2DpTZf8u/x6QMFiZzWgqaROE9HSv/l
	 zMX9VCkBOPZsE33XYYxckhlorlyzHbezKsrUndS++/2g7hHFPRL6cauCM4apDpYKES
	 hSfpE79qmpwbHa1Qi9VdycHMXKSGY/h/Xhcc+T9Qarp+x8pvWiujb4Rj0lpisA6h7I
	 GorMfiaDDpM5TkVDIF+JZlgyJWswaQGKEOc96EZ78PgkHcPCZxMwR0kVa53T5Ywcu5
	 abOstOXQeW17M/qGLKUd3YmPQ/ki4njeWoqIZbhmr3BsyboX0V6f73BbrmUe8sonbE
	 VYa/z1g7cp0FA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 870BF1AC5824; Sun, 26 Apr 2026 22:47:00 +0100 (BST)
Date: Mon, 27 Apr 2026 06:47:00 +0900
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: b4 review 'U' doesn't wake serieses
Message-ID: <ae6H1L3J4tCEoDuY@sirena.co.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VOku3ca+5UQy/han"
Content-Disposition: inline
X-Cookie: Victory uber allies!


--VOku3ca+5UQy/han
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

If I run 'U' from the main menu of b4 review tui I would expect that if
a new tag has appeared that serieses were snoozed waiting for then they
would be woken.  I need to go and manually wake them.

Thanks,
Mark

--VOku3ca+5UQy/han
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnuh84ACgkQJNaLcl1U
h9Bv/Qf/T6m5xBRW/pDDpeaO0dBhO8qymCiqdfY8U2lzxp6r5ewo0uNy9ywBB+lI
6/sx5OgSXgjFuOBhB5b48FJ+VT55IP/Q+763Rcd+tfb4BHzRH3Z7WR6TJbvXRzB2
fMnFOEw6qDLlxLZgdWxnKC2b1URF21bmLVTM4b+82IM6+i+df3l1YHunAtjbf9He
/kp58tYobFrZaHzJNzBzp+Z9kUOEqEPDv7iBh5Xo6SV3dEEJMXlIowdekSa1rTUL
Nn8Jll/GERCUKUpwT7yCJaCapRhqtebSkB/1EtpdRiRiDksPqFPGDv/JRBvMKjA2
8IlZoxDXYftsp83ANleY2vBv91RJ/w==
=RXFH
-----END PGP SIGNATURE-----

--VOku3ca+5UQy/han--
