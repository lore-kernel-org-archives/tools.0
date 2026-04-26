Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C29E257845
	for <tools@linux.kernel.org>; Sun, 26 Apr 2026 19:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777232696; cv=none; b=VUujagnnY0SUlhVm83pmxi4EOVPi7KPOhEnFFton5lRdMfberAkykMin9zwckcSt3mn/kehsJ83SgtsPw+NpvfrNp+8OxCE7zZAf3Oz27UucEHP0m6FU/4kmS83fIc3WsBix9BH66etwAqNmkhQ5xQpl74UKr6T2qjdugJZTZlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777232696; c=relaxed/simple;
	bh=+wJuG5hchyEDN8l8SSK1E/3nspJWgoCAt7puC8b1+tY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l8aAvsnz+TjJSBMp8i8q8J5iMsfbCjTtcxBbrMGfqgTdomCk/1k0CKUis2VF1ZMpkJbWSZ+6p8wNak4RUreyZETfJ2h+ppDThjdmVv4ryQyemmwUoUQ/CL6ncXAfBDuFYr6b4BzNHLu7mMgLeUTS7HvhohgaxF3Cngy4yn9FnDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bOp291Dx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bOp291Dx"
Received: by smtp.kernel.org (Postfix)
	id EA9A6C2BCB4; Sun, 26 Apr 2026 19:44:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6204C2BCAF;
	Sun, 26 Apr 2026 19:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777232695;
	bh=+wJuG5hchyEDN8l8SSK1E/3nspJWgoCAt7puC8b1+tY=;
	h=Date:From:To:Cc:Subject:From;
	b=bOp291Dx+Hkcn9ZodqBBRxPhlx5W6ZxPiZESDpRU1Jr0lWWepTOsBzOA3hrYDhprD
	 ofHFwzdgxfH4duxh7mpksx2Voe4KKSj5ZvFO59VvgT5SYjlWoU19BXClc7juD4eGvS
	 bWjlZaQyBFQmYcC55r3C3eGg9w2cOHklj/WyJCNKy3gpqkRCwqgyvhh5pErteP+AEC
	 ie47Jikqkk6HxKi40f9UNQjMx+50TSmram1h2tLb6oxUrav6X7hSn/D9E7OHSxSYnN
	 XTKh0qoZMVLwFcLBystDoa6MUreUkWQSK2XXV5DDLVTDdaT2xYrdDoJHPMkhs7j5lu
	 eNxgFAV7aqGDQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 3208A1AC581F; Sun, 26 Apr 2026 20:44:53 +0100 (BST)
Date: Mon, 27 Apr 2026 04:44:53 +0900
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: b4 tui: Bulk archive of thanked serieses
Message-ID: <ae5rNeQeDeZKQHwg@sirena.co.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HRCjDKzYtIyuGaUl"
Content-Disposition: inline
X-Cookie: Victory uber allies!


--HRCjDKzYtIyuGaUl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Given that the only available action for thanked serieses is to archive
them it would be really nice if it were possible to do this en masse
rather than having to click through each individual series and confirm
archiving.

Thanks,
Mark

--HRCjDKzYtIyuGaUl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnuazEACgkQJNaLcl1U
h9D5Ngf/W1CeyjT04V9V6T4FcYFBLxXqNwEp4deAWW7Jt897E0dYLdSWaHlL3rLA
MR/aAAqehTWoDnBdXbHIBFGx8GK1u6HXkxoXEmR/AbCOgYC+59y3yPtr2aQDGyjB
M6nCktTM2eQacdzEP3j9kcAOMcjON47la0/7FXbL/T8zh30redBrJBGTU7kHpl3R
TLRCHasz/ClYHu1vY8sP629CLUQOrVZahXmOczjeFML7gpMPUXJBzURL43vvRQjE
z0BnZJ5ZvhEVc3Z+6gzDXxjzZFrYypWmsFPphgGEsb21+KkkbAWzIttGE5Qtym8O
R6DWko7oi+KJy4YPfT5pg7K/j1fPFQ==
=q7h+
-----END PGP SIGNATURE-----

--HRCjDKzYtIyuGaUl--
