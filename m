Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E78812D767
	for <tools@linux.kernel.org>; Mon,  3 Jun 2024 13:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717419635; cv=none; b=addBMmiMVAc0vXoy0zRfhhrCyrA6HdMbwDRBodd8PhXEdw2qFBuUqE1k/PglTVV8purF0Sd7InmQtuCIRsW+61wgyJFvmVry9bJHK5PPPcLXxbBDzaX7ymW+pBilrLdfcg51doz+qHLAWWexQ1+pAMTxFYbFrAzGtcGG3NNgui4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717419635; c=relaxed/simple;
	bh=PbFwyQa1+rdKiWZap8ZL6ba67++/vEdUXJ345sRMKiI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=laYQO6DZo98nHX3Zgg8le27K0P5Do/3C5QMa7g6Ac1/1uUsi2krULCZCZM1w9PfoJol53dCzuWTyKcJlo5CU8UQmVeTzM9QTZJ9yEAkRaL3rk246TdbTqc8X609R6AG+FZHPuhnfRT0rrFLpB8e2UOBIZRnGhzX/GAkOkcgSBkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JriDMSIP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JriDMSIP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4554EC32789;
	Mon,  3 Jun 2024 13:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717419635;
	bh=PbFwyQa1+rdKiWZap8ZL6ba67++/vEdUXJ345sRMKiI=;
	h=Date:From:To:Cc:Subject:From;
	b=JriDMSIPIgn2oZ9q4j+3hi5kJXucu7KAe13MFOD3KPsb9NGg7qHR6ruqaW/bpAZb8
	 Io8kaVOaeoVfzwGp9ODsiMDQfn7If/ENUgVlEnw3QsmsEpqntKCxvm2R1SzfecBv8T
	 FDpwNuLxrY1QNs2Dc2PJT2pk7OTEfFjRxFCeEDCfHcYa7iLyohwFrVTTIGoUT+BEOy
	 YSFNj7mA90EbNBLjAPlD/N2dK/AXgbFj/+BrTcZrnisS8YO2SfMXFFDhhiMnsTFo9s
	 C54aTnKSprKQug2eL1WORT9Y9xYusv5bMwkwYhtKOfn7B1sY5U9Bzrj901vlZbsb52
	 aLwT20PmBtqWg==
Date: Mon, 3 Jun 2024 14:00:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools <tools@linux.kernel.org>
Subject: Thread breaking behaviour for non-patch messages
Message-ID: <dcbebe7e-5e01-4559-8bf9-37a0749177d2@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Hp77c5wORa6Stev3"
Content-Disposition: inline
X-Cookie: Natural laws have no pity.


--Hp77c5wORa6Stev3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Konstantin,

Since updating to current git b4 with the new thread breaking support
for fetching patches sent in reply to serieses b4 mbox has started
misbehaving - if I try to fetch a thread by specifiying a message ID
somewhere in the middle it breaks the thread:

  $ b4 mbox CA+EHjTz_u2M-wsNnD_f=_R+dJoYwL9gUrBz=YwdqGZbtTT-aaA@mail.gmail.com
  Breaking thread to remove parents of CA+EHjTz_u2M-wsNnD_f=_R+dJoYwL9gUrBz=YwdqGZbtTT-aaA@mail.gmail.com
  1 messages in the thread
  Saved ./CA+EHjTz_u2M-wsNnD_f__R+dJoYwL9gUrBz_YwdqGZbtTT-aaA@mail.gmail.com.mbx

which is surprising and not so desirable in the non am case.

Thanks,
Mark


--Hp77c5wORa6Stev3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZdvm4ACgkQJNaLcl1U
h9CmGAgAgf/n3SEoq+GVcd0g1LlOz3sNYwPtUJOkvoAFYBTDP94dQdAVVDQb4y+7
tWVsAULwYGuBdnzZMEnzplMMjEXQFGJb3r+1pUEP4XoSaymrgWH4BGaaNJcCVbEH
AXs1MEastJNkifU8EZD9rfMFXeazyDfkuO8xqV0cIAvQCxKF7QfZJWu7D8gMSshC
NMx3+QrpBxnCAHPpo4ziCgIXJAH6iPk8EI2Fz+MHvn9XjPOafSuLs642QJZFTUPN
RDJyScK3Pr1KGMArsHwZHTFPvPHuKyIq8cbsQrlganSyyzdZoW9a470Hwp/+eqzi
2ONiYyNpa6qslVOagVJLkYpzQq4G+g==
=Zrmk
-----END PGP SIGNATURE-----

--Hp77c5wORa6Stev3--
