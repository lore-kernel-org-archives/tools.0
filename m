Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6A540928C
	for <tools@linux.kernel.org>; Fri, 10 Jul 2026 10:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783680042; cv=none; b=D0kJ45WLMbwvsWRR9knrH3RlTKrI/NAJ+YJoNuzzXf6NXPqRdZRZ5ZZ48xaCSVx46qHMTVyjvLkaLR+aIcMNVS8rG0z7gJigUVnCreRcu8AVK3bGQxAGBgviSHs9VZ4WGtnRd4/yq8tPwDJlNuac6BDf1V8+FTSmdaXT/w9cDJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783680042; c=relaxed/simple;
	bh=yKgKvWyi/chitmgrYMTIrRBu8Vk8WOk4hCUCNyJbW8k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MmJRxskZ0B6C2PmfiJ1uNu0zGFw89ULAuw8Z8E3bfxTGkz2RHtvDdKRhA89mOEppxSptrus486v299C628p2/vLIs+M0cvGa6EzThwpYazH3idEreJ2FEY0xwlaNC0N1vehh6BMeJaPktleZjn2GfBoPVChMs6+xvmKZHnZCg5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YK2Y/fCE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YK2Y/fCE"
Received: by smtp.kernel.org (Postfix)
	id 2F03D1F00A3A; Fri, 10 Jul 2026 10:40:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B4AE1F000E9;
	Fri, 10 Jul 2026 10:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783680041;
	bh=yKgKvWyi/chitmgrYMTIrRBu8Vk8WOk4hCUCNyJbW8k=;
	h=Date:From:To:Cc:Subject;
	b=YK2Y/fCEnh+WppxQ6PzW0vi455epg7AIquAIURBvTVETguxswAhG269oselez70hV
	 scoqQEF1GYaHWSHk4+AsfgC8yDJjpAKSC1y9tcLk3kKB3sr09f39pkAuXiHT37rI9F
	 1b98sq/uqWljYXWun4WMoDpmcGr9OLstZeMMDU4VM3huvcYSGvM66rHFebzJTr67Hq
	 LecthJj8GOswjjpJPoVjDOKtJH8zBHpFvTz/o9baNtS3CUJdOCNJT6YT97Z1rp7b6W
	 IbBe3c78xZw444s4qk1A+cp9ltRn7IEvZcGSV8VuJPNae3LuB0ykME+WAG1iZyyk0N
	 t1z1/3D8PRfrw==
Date: Fri, 10 Jul 2026 11:40:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: b4 review issue with upgrading partially applied series
Message-ID: <a194d102-b179-431b-a2fa-9297394b78ef@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="r6joD6r8/2HgxNB7"
Content-Disposition: inline
X-Cookie: Did I say I was a sardine?  Or a bus???


--r6joD6r8/2HgxNB7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

If I cherry pick one patch from a series then find an issue with that
and back it out I find I can't move to a newer version of the series.
The series stays marked as "partial" and attempting to upgrade to a new
version says "Series must be checked out or new to upgrade", I need to
apply then revert the other patches to unstick the state machine.

Thanks,
Mark

--r6joD6r8/2HgxNB7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpQzCQACgkQJNaLcl1U
h9DgAwf+MkTk4LPUNXI7u8655HoAyUqKv/RIII5zO5YTAqSmxir9OI/w5t5Sb0cg
srMwVtAyOMzMQDRCFvEUOzF23UTHSYJicHRjafZG5/JqGgcQCsJoZa/bBsGpJuJk
p26sh4OjA9o5Su2tJwpRBdHSybWfmD2NTrTq7YcjCrNzaFqUJRzp+Ty0qoEN4Yoj
4qmV5vy1BjEVhu0Wve0TCOEf5w6G0mYdTRW0EUPgyJkY7Dp9QBuUhSIGIVPf1KI8
XsGd2XOBv2zelVDDyzfgS8EbisqKhU49+NrA+hUT6mZbwdv5tC+yStw1+7H/J1XF
hOSEmlkwbd3Re8zdZREq1LsPzpiRPQ==
=+8rJ
-----END PGP SIGNATURE-----

--r6joD6r8/2HgxNB7--
