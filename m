Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429513988EA
	for <tools@linux.kernel.org>; Tue, 24 Mar 2026 19:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774382078; cv=none; b=a0XrRCXmTTc9kHBnuBXR2VhIo3QQ3YV7+X9HSFCazTbUc/qwksJg67jyQodONUJNo9Cgn4h1Zjpox9CSz+2cpzJMxSsHDym53f7UpxT6KBgTIJWsFwdf0LLi9qQFG3FUdsaFX31O0KNiz3sQUTAcPtUKWRgU78/h8RT3lWIlPUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774382078; c=relaxed/simple;
	bh=Xo+gdwOzE0muhyk1QobZI4bSS+60jMvnCc97dkvj/U4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qxbAIi+fgRZSVk7cqMUdLS+aFq8ufyUP/kWtO8eCGBVaIzRAzZnU6S0bpT2UsmHBV1xbJ13stOvIX6shKVHXQoFSG9b1bRBtFhRtN7dbU4ZJ/8OpUzG3o/xEAFMcTPm/SzT0NMk4xRU6351W4N0nhiRrlFsOzaqLMiV8oRVRYsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p11WhWz6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p11WhWz6"
Received: by smtp.kernel.org (Postfix)
	id F31C3C19424; Tue, 24 Mar 2026 19:54:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43EE3C2BC9E;
	Tue, 24 Mar 2026 19:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774382077;
	bh=Xo+gdwOzE0muhyk1QobZI4bSS+60jMvnCc97dkvj/U4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p11WhWz6tlBDL9hUihhoctUVb52ZdR2RaModYYINHn8Jvpv3XLUQlobjMqOQFQoh0
	 ES+8Yb9sSXjxoEX5KwHynG74gfRUv0RwHqOEFUshx4GDzGKrKvGuGrBDlSSzndVQxH
	 n3ATBG4fUne+TfoGKKuMg1n0rHG51d9nmBSrnDH2I11LaClTnKRFck2WRvN1IPGepC
	 85jSLwJNI0KrceTjwqzDwwEQ/F8UkMm0myfocIiQDZYyOiFtIQQ/T7IU0suOCR9s/Q
	 +xE8LavbXPat1esJ22j3yX4+3H352k0K5qcjgegghBlQhgTHWzfodPi7IVppOaSBY1
	 ibEOV7Mk1cVpg==
Date: Tue, 24 Mar 2026 19:54:34 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: Checks for published commits not working
Message-ID: <459a8393-d2ef-4c5b-9a5e-2409bd23db98@sirena.org.uk>
References: <7e063a38-1415-40e0-9342-4fe5b31b65b2@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JpWk2RNTaI5cwvrF"
Content-Disposition: inline
In-Reply-To: <7e063a38-1415-40e0-9342-4fe5b31b65b2@sirena.org.uk>
X-Cookie: Forest fires cause Smokey Bears.


--JpWk2RNTaI5cwvrF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2026 at 07:49:12PM +0000, Mark Brown wrote:

> I just processed the queued thanks messages I had.  The list displayed
> in the UI correctly said that:
>=20
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git/commi=
t/?id=3D6c2505e185b0
>=20
> would be checked for:
>=20
>   https://patch.msgid.link/20260320-no-gpio-control-v2-0-dbc938e462cb@axi=
s.com
>=20
> but then proceeded to send the thanks in spite of the fact that the URL
> it said was going to check reports "Bad object" as it should since the
> commit isn't published.  It *is* in my ci.git but the URL above isn't
> for that and the UI displays the right thing.

Checking with another series it seems to DTRT if the commit hasn't been
pushed at all and is just being checked by itself.

--JpWk2RNTaI5cwvrF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnC6/kACgkQJNaLcl1U
h9CiPwf+LhAMNV+mr+ZU9Myepj5njXFGERzuKYhSaUPmGYuoitBnTvUtoFG9UnT7
5Vn4IiR4tbMQ8Mu9Y3PQW2QcrKGajM276Hd8otjapcUXR6nulb5D5qsZf4Dc8zYS
kIRZplMPzjZH8Xx3ONaU3bzBpkzMVrebNAHNhE07z9jL8la0YtSbn9SPfdanANlF
dm4K0QgfA43z+dvUBU1oHW4zvrzDdJ4tXo/Icgbzkoz3xT4TEss5CI3kb288Hzt4
IlHSEa9PGTa1UyNPB3bIoSZapzNEiM+7BqTeTC/uqprn6zYu3X9zEeBC/fkxvcXe
NTvn5iH8/hYwIpkjR7d3f6wt7Gf45Q==
=D8JV
-----END PGP SIGNATURE-----

--JpWk2RNTaI5cwvrF--
