Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2EA51420D8
	for <tools@linux.kernel.org>; Mon,  8 Apr 2024 18:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712602301; cv=none; b=L5r9D4iopkuXOoM7XTempxfSfmwpEtxIheTTDVZeVcFb4G9X9gmbe6sGgwFfE4DCwgsRvuPUA4Bj/3d3+yABrbVzPbxfLRA7HvO2dgAOm+2SROzFCy/ifHt2IysJxlUt2d9XyPO49LgDVUKtHoNukgYbPeiwtmrQ2ExQoWvbmRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712602301; c=relaxed/simple;
	bh=xKj5jVm5OYj8rnaM2PmKbx62aZD7HSvCOcSZXsnDsiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YpElM+KjPylHQUJGYXDobv+W6nrkQw5Qs98gQwFEjbpbuBz39pNE+UExQBc/QoExFY2WjEYwTuQjjAkfhd3baJunDqyDFsEsV0wZFVoTI07osUGff6WumP+30zdoWl+2cS25F/lmDyn/1LAQ6W9J6GMgnieFFseFBdrXTjbjvWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gRE/uPol; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gRE/uPol"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC7C3C433C7;
	Mon,  8 Apr 2024 18:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712602300;
	bh=xKj5jVm5OYj8rnaM2PmKbx62aZD7HSvCOcSZXsnDsiQ=;
	h=Date:From:To:Cc:Subject:From;
	b=gRE/uPolEyulVVFGIQ+pvY7816uS6597xeWsYocRyw1av43JYF2bA5cNDgQsZJYFi
	 F0BxTUkD6W9Q4pJ6svGkPkk8lhWDtIoKdhLI7NzhCbXa6ZXplpP2JvdJ4miMiPnQ72
	 a2n0Jy2mMWCJay9wgHWKQUfskAzdCX82jeN3u+JAG2QJUFgcBA5uh9FP4PVR27fZKN
	 wwO2bHBnqb5lHc12wOJR5/K+8POp1PzXGBRsSSGAQCB8PJnwdOhPQHQ0Mv2OOS7hBh
	 GTnqnVBH38M8qinFLsB1y5GOhskd6ejhQOc7eg2YW3tl2x/woSl8U2c7+wyw/ek6yx
	 SKAxHxwqOG8oQ==
Date: Mon, 8 Apr 2024 19:51:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: b4 needs-editing check vs single patch serieses
Message-ID: <c9a9347a-b795-4824-8edb-9fba31cdfc5d@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Cl66G6G3qRDJP988"
Content-Disposition: inline
X-Cookie: Drive defensively.  Buy a tank.


--Cl66G6G3qRDJP988
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

The needs-editing flag in b4 prep --show-info was intended to support
scripting which wraps b4, allowing it to see if b4 would refuse to send.
However as implemented the check does not take account of the logic b4
has which doesn't require a cover letter for a single patch series, it
will just report if EDITME is present in the cover.  Wrappers could do
their own version of the single patch check but it would be good if this
were done in b4.

Thanks,
Mark

--Cl66G6G3qRDJP988
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmYUPLgACgkQJNaLcl1U
h9BQIgf6A2irgG76RCzyjpMI6LjzE3V1qLrcrcCohlA/+mNpE+d4w011vNIjRRa5
BZy/U6HOuNz4QZSboe/9Eg8ONd9uCyJUOhIh8pITagQD7wqG5PYJ0ibf47l3+ubD
X7DbYtDZx5kB+SmeGVLycD2MB+OriCsF9j9Ws8N1KZvzV3KGJ0GyKAziHK973VqS
0zlNVkqAPJHWdIoe5uZjZbkhlCCue+Y/P2GZGrXKUxNmksqLnB9T+ejzfTswA94s
xM7hQLiziqx519g8gVmcY9lb/7Q1g/OLxIiuKHIeMSvNVIl4q54stO1nVCHrUf0B
vZcb3rEBs12rX5F4ZoKPMmlJXDgfiw==
=8te7
-----END PGP SIGNATURE-----

--Cl66G6G3qRDJP988--
