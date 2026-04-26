Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E1826159E
	for <tools@linux.kernel.org>; Sun, 26 Apr 2026 19:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777233415; cv=none; b=nclcrjrzkjKf3sZwRG7zlGKEkJvTeZGur8YINyhVM+uFZ4x46S/6fMyivHjhx/+NIc6dorF6HgAGYN9lnzMa+dFHwZ4Z97Wu38pJsDK/eZzoIWqE41nbay7FyWZFxpQwR7C+p1SzbKaA5kNsn9dEwcftzrejmUla7KaRu1H7/Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777233415; c=relaxed/simple;
	bh=yQVAjdg6v3yjmJr444aZN2JZj8afMjfHNntqA9VrpNg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fiZan6Mk89wVTHGg9JlQqIzNMX5cwt3RFWO1F/XkpuqRUUStY8F6LS5izeMqiPTvj3lxZBqX+2CaWSHNMVEapRazFzPdv8pY6Uc+CZNEbwnedkajuIVpXlX4JLu5GO4m4Nw9y6bK6mZFgnIW1+gF+GLSYo9poUjTIWO2/SIQVVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fE5rvZJq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fE5rvZJq"
Received: by smtp.kernel.org (Postfix)
	id 8F80BC2BCB6; Sun, 26 Apr 2026 19:56:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62701C2BCAF;
	Sun, 26 Apr 2026 19:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777233414;
	bh=yQVAjdg6v3yjmJr444aZN2JZj8afMjfHNntqA9VrpNg=;
	h=Date:From:To:Cc:Subject:From;
	b=fE5rvZJqT97WIE6v/umUgxBZAL164CCm2JbloGK5WbfToCspHAr2wl5fScghEyghu
	 hAL20pYfzu5l+vpPYiht9qOEXqyM7yphXO17R6pyvd5MbqfPIiOS0XKcn1ISf4bAvR
	 p5mTnBFr/4yY6zEQsROYWOB/0dQJy7WRVmk9VMIwEbP3yZZlcR8KXpJ5iAvA912llN
	 BNVDAgQ7vn0j1O7xh3j2ARrmCu9xzBKdWHJshxU/Ga1rmRTU417v1w6oxwecSNwFG8
	 uLWfigf7N3UeCYV87wbk8XmVICiPi4saS/j2Gz/Qtz5ymUwaX423oqv7LrtIRRIzxq
	 E8EWc6bTP7S9w==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 4042E1AC581F; Sun, 26 Apr 2026 20:56:52 +0100 (BST)
Date: Mon, 27 Apr 2026 04:56:52 +0900
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: b4 tui: Old serieses not removed
Message-ID: <ae5uBJGVI5plpGkb@sirena.co.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ksz3xIni8KFhXf+o"
Content-Disposition: inline
X-Cookie: Victory uber allies!


--Ksz3xIni8KFhXf+o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

As part of an effort to sync review state between machines I have
arranged for the set of b4/review branches on the destination machine to
be the same as it was on the source.  When I open b4 tui and run 'U' to
update all branches it reports the existance of several hundred more
branches, looking at them going past and what's in the UI I think most
but not all of them are thanked branches which I later archived on the
source machine, the branches are gone but they remain in the UI.

Thanks,
Mark

--Ksz3xIni8KFhXf+o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnubgAACgkQJNaLcl1U
h9AxKgf9HLHdWTYIPnhHS3LvInkHiWqXDxTxiWPLfEFs2etn6h9LKT6hR9qIZ4oC
wVI/5H/4afCWpzkj2GWiPcs4BOR7Q51zvBNIfU13tGhpJ13YSBdhC/e73khdPWOD
q1daQXTCMDRKKlcsVEqFTztdPVeQ4Gy2g3SSyd1rIXN+U+Bg+p/G/mJuNy/Il6Ab
gyDvYdSLxHnpB5Rq74y1sFw0+I1UsPLjiPJNBwquygkt+p68adV3ZCiW7rJoFvkX
AVpgb+80xvTijfB4fV75I3dn/Jr3LCWYMRF3BV4mjr7GWiOKgAZYhzCidInIjtbB
uv5J0z4cbdNvwOvc5yxtMuWSHdnGSg==
=dSyI
-----END PGP SIGNATURE-----

--Ksz3xIni8KFhXf+o--
