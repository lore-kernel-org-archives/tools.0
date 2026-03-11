Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7615A3D648D
	for <tools@linux.kernel.org>; Wed, 11 Mar 2026 12:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773231253; cv=none; b=AcgLfxW4UxvJMu+n0zzkb8kIypLq2JGUTHU04c2xzxUaSGrC4b0kmiB4tvnD0LlnOH9lf3JoHbYQG4uxkuhuwdEg+rDaSVidc85619m0B76YhQoaYdOmFprYQmoXstOQwtEzc3DWPRqDKcy/hID3MuMWPyfNoFtmL1Z67SJk8LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773231253; c=relaxed/simple;
	bh=PLUfmfSwgxgW13SuOeRRGltSKV7UzOXXost2rBwexaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rEp2dG+LtXDjPlURdruEx784rTP836sPum5iSURyTiqfFTyQIB5Q45imoWq8S/iCY7iVM7D6NYPPi8x0ammniQgok9zSELm0JNYOuUa7l3zqBHzS4Xsb5Dp0x4d21DqKH6Ojxwl1TnQnMu79UcB8BRwEv78m/3Q2rnjhHomkwhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EC5UTEVW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EC5UTEVW"
Received: by smtp.kernel.org (Postfix)
	id 17BD2C116C6; Wed, 11 Mar 2026 12:14:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58ACBC4CEF7;
	Wed, 11 Mar 2026 12:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773231253;
	bh=PLUfmfSwgxgW13SuOeRRGltSKV7UzOXXost2rBwexaY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EC5UTEVWD0TnYkf//dFYZfivzo+ZsI86tte1XYK1qISMZtryhluz+qDC3r/MdiIbA
	 WSaiLexQHE8TSwwQTZnZPo+XuKF7e5Sqwc2Lt/y7xioPM4jW61xB0mCppFKgDf1AP/
	 7DndX1Kg/szZ0K/0llXcU/m/rjClI+9CN97OAea3pGxfbjAeY31lQmySMD25mBU2d1
	 O3uMsh6u4AbnJNFweB+bfwLT7Fm/DmTI1sKB/oJdK3X5fZnPl6+VCxOizDApT0zKiE
	 YaYIAoT7hzME2iChWrfmKpNklTAaqDvrEAmv+C0TEYD/bke1aGgs6J3GYY/tyZBXN5
	 ni1RQMLlG11Vw==
Date: Wed, 11 Mar 2026 12:14:09 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: b4 review looses thread on update
Message-ID: <0dbd8df1-3c66-4ab0-a64b-1f3ded93a7b6@sirena.org.uk>
References: <aTj6C69JzDUJUVP4@sirena.co.uk>
 <20260306-steady-tunneling-asp-7febfd@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KeQnNa8V5DkKYNp1"
Content-Disposition: inline
In-Reply-To: <20260306-steady-tunneling-asp-7febfd@lemur>
X-Cookie: When all else fails, EAT!!!


--KeQnNa8V5DkKYNp1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Konstantin,

I had a review of v1 of:

   e53aefc63e28caf32bcd553f3d0a8f2a5a25cd8d.1773193726.git.xiaopei01@kylinos.cn

which showed that v2 was available.  When I did actions->update (mildly
annoying that that's a captial U BTW) b4 flashed up a screen saying that
it couldn't work out a base and then returned me to the list, with the
series gone from the list.  I'd have expected to get to pick a base in
that case (ideally it'd remember what branch it was previously targeted
at).

Thanks,
Mark

--KeQnNa8V5DkKYNp1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmxXJAACgkQJNaLcl1U
h9DasQf+IAhUfjZq7PEZ8JTkPXFBpqz2HgF/U3r+7pX4FV4OY9BBg0Hgf+aasWXK
zj4QMxbkq8QQDDYnMLw/TA3Gn/kvyEwUi12KQj5q0JM3pCOBNOuLO+HuClkEMhiU
cdh6n9DvImB6MgpwRkXsb2Rz9VfdKIv2np/Nzo1cBWwlGBtwiJBQhfNYUJ7rQUCR
V2qlI4d/zgx+iWrcuzVCImzAqvkRO7gjobA2BEcoOxEcQdCKXOPN/5WFEVlRvJiv
PBFSeKupRuuHuEgnLRWSMkkd4dpcy3aPNNiQVpHO5DeoHNEAp4G9ubQoxz8cXBdM
iLj5Mkatr/myVvR3TWM8YeJAmh3g0Q==
=g3lj
-----END PGP SIGNATURE-----

--KeQnNa8V5DkKYNp1--
