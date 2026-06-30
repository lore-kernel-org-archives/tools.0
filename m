Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D42B3DB32F
	for <tools@linux.kernel.org>; Tue, 30 Jun 2026 17:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782839545; cv=none; b=NgNJnSLAQiUHCOQ5OyHtsHkmkSWlKmHNpr8Yd14zSRBV+Ga+jORzeDdd9kR2kH7h6NQtItruKnKcE660A7pG+wB1cXgL6mgU2YFj4FUHf9q29CK6VADjcuvLEXhp0k0bxdseq7y7Auf1odh9H25aw5TZTZS4l1UwYDuJkob7gmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782839545; c=relaxed/simple;
	bh=tliRwgeAcDje8ht7q2qL18uY2rc1Cd2tlp0V0eGHaI0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ChNEG8jkN3DaAhzbQEIOV1nUOpJjBI/o8PvdHpUVNaznQafwcfmZPkxdie1DAla2qrTflR/ZXbBdF39S+l3zupvTLs9OVstwyGil752QkLgbY+qDvrCyP6SUxrDLJnGfHz+SoK0I62qhr+EUpqwbDeoNXx8Hindl8/9iF3zdkVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PY9J20DD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PY9J20DD"
Received: by smtp.kernel.org (Postfix)
	id 495921F00A3A; Tue, 30 Jun 2026 17:12:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94BEC1F000E9;
	Tue, 30 Jun 2026 17:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782839544;
	bh=tliRwgeAcDje8ht7q2qL18uY2rc1Cd2tlp0V0eGHaI0=;
	h=Date:From:To:Cc:Subject;
	b=PY9J20DD3YIWTXghk8ntsRD/yPjYRwvU3coZluYYXp8TvFREZqPNSIcE3VAALfW+p
	 sMlMegaHLqvTsF8prwhPXKh9pNwkeyyh7TKBOxsWP6+0BRuxPKlgh95qqLvbmjSxma
	 WtoRNk2eS90VdWcm8/IOsQisl/35lzWNptoCzMYpdoG2p7yjHx+N2guGK466sBxfYq
	 3CkTS5vi96wAxbU2n4X83oUbPzrrpfHFGu6OcwUNqcrBncbMukXTrEe6xGAYa5CFxZ
	 9Ulx1sTw26HYCKOCe0qXBQ8aWChGmxkfib2MVYldmOEGrS5+SEI8mRTDZAkaxgH0OH
	 zdhIOhD5yrVow==
Date: Tue, 30 Jun 2026 18:12:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: b4 review base commit isshes
Message-ID: <48314580-a660-459e-b2d6-0abc57f26878@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0B1gnQxaphknGHKn"
Content-Disposition: inline
X-Cookie: Air is water with holes in it.


--0B1gnQxaphknGHKn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Konstantin,

I've run into a few issues recently where b4 has applied a series on a
merge base I am fairly sure I didn't expect - I *think* there is some
lag between me entering a merge base in the UI and it actually being
paid attention to, possibly if checks are ongoing while I'm editing the
UI.

Relatedly it's not really visible in the UI what the base for a series
is, I've only noticed this from the diffstat when applying which would
be even more annoying if it got as far as testing after I've applied a
bunch more things on top.

Something I did in my custom stuff is that I'd only pay attention to
base commits specified in the series if they were on specifically
approved branches, that way the common case where someone says they
based on -next doesn't cause -next to get pulled in by mistake.

Thanks,
Mark

--0B1gnQxaphknGHKn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpD+PQACgkQJNaLcl1U
h9ClNgf/XEN68wmt+nH4nvkUKJuVrAMLtBeu9TdGWN5ZtfRUWkzKegLelaCMVeB0
9EGULQutT2CrrXkLKYxTNybRpyjA+1ZxN5KSYR/hQfq2QWrxxKMzWIT6bWovY2c3
HkAR1ZTYIIvXurQifpFBycsCcn6R6EIiRaR+rmdQ8Vh6tGWUuo40pfmuXgjbX+xD
BHjorNNisJexduk7aI9U1jS0p148vRCfJ1rEBsPMHfKGZBSz4Hd32ZGZQkMX66Wk
EPi7FsD5GDZCCE8fcSjj5JN+hehIhYVIceC/uXpS0AqKxBBFP/Ou6Cr6QTjE589O
jhxMfv9tonIY8/PvPPsMnQJoMGHZZQ==
=itAV
-----END PGP SIGNATURE-----

--0B1gnQxaphknGHKn--
