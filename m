Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255BC410D1A
	for <tools@linux.kernel.org>; Thu, 23 Jul 2026 12:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784810333; cv=none; b=s89/Hlt8wOh+NvhoC0MloCOwU+AOLsEgpE4u6hspHcNumzR/Cn3i/t7Txj4X58hUVGa9rbgJFETSl2fgAZK4Y11SRbzRsvws182PK6LCScBkkvYwgO9r/gk9/OD8aQoG/i1/PVLs7qj1tZuZjhOtIPzDtV1AIxQQpUupqak1nDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784810333; c=relaxed/simple;
	bh=wAPblX18c5M1K/+s5PsIvRg2rMhiXdb5dZt5Ah+9zks=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nWejC6jbWlr/5KNc4fYoBXPi5ruRd/1QayQFYiIs1750Pql8x24E6TSl+7BUcfcACpWGLIAkNd0dUtP+EYa3DVl7OeO1nCiTsTMy0d3iHDypVQ0chWpJXRTwSwR+4Zvv3ZoRZs13gN1n9Rvju/ft15GsGT2rLSJIuam/QzwsUlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UAYHdmU9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UAYHdmU9"
Received: by smtp.kernel.org (Postfix)
	id BC1A01F00A3A; Thu, 23 Jul 2026 12:38:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08BEF1F000E9;
	Thu, 23 Jul 2026 12:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784810331;
	bh=PLTGiv0vnGcAeVcNGZ+GedByOE22Sc/+PNbrnpRuDh8=;
	h=Date:From:To:Cc:Subject;
	b=UAYHdmU9TkdjwvHmLCpkjK685tStAjnaVZRxRJu4xagf+9KfiJiYBthRzM68eOvdI
	 6PYausa3RHmotgid59nCWn/XsjP1X9a6Q8I6dDPF5Obd2QJcLSVhIXlSHDNw6N9uPJ
	 jUQvHyLwyPTvmxA96eG2eSOdApQ8BH9y/q0b719TShmF8Z49mETUjoEkf6BF7mjE5H
	 0hBNAyVZXPBTXB6UxF9NYgMB8rQvVJKqvvWgCL51Jm1/T/ngVL48uvvg9bCDzytzJ4
	 PvbZ3Yb8TdxrRlIjNt2pTeH0ghUCcpeeiZ6d4iEDpdQOavIYrSvHR43ID9aPOK1ZHd
	 3LizLxZkmlFqw==
Date: Thu, 23 Jul 2026 13:38:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: b4 review surfacing updated serieses
Message-ID: <b356bccf-8e14-41da-8369-53eb442d0f30@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qthtUaFobB5aJBRK"
Content-Disposition: inline
X-Cookie: (null cookie


--qthtUaFobB5aJBRK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

One issue I have frequently with the UI for b4 is that it's not great at
surfacing serieses which have new versions.  There's nothing in the list
of serieses that says that a series has a new version, they stay sorted
in the list with whatever date they arrived and you can't see that a new
version is there until you actually highlight the series.

It also doesn't seem to reliably move things out of "waiting for new
version" when there is a new version.

Thanks,
Mark

--qthtUaFobB5aJBRK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpiC04ACgkQJNaLcl1U
h9BxEgf/QCuZ3lwOJqTs+Wx672/wElUncBDGTRfjXkQqcGEXuDXY+VQL7u5mJ3m3
BvIDFw5f89qE0frWoIeoy81GzzTD48A5f2hWjcQfhW0FNzhTutG9lby5AXAY1DPL
0gvNPs6u8Kj0SYGJqkovROlTaIEppdVQwiGzIYBSzcw3sCtiBzhjoZTAtkAQA4at
5YWRP/ajP4K7zIU3vt+hBqGHlKxXlnU6R8fh9JjNVqZzepzavlZHVl2o0PcUopVK
faSm5/DDsLBTzEzaUwM/VgdjyrjH7s7TSokMdvSfJUJKQJ0nDBOa44C3u439HHnr
ZpSPQEAmAPTik7T4R9jrHJERMje5Cw==
=5Ev9
-----END PGP SIGNATURE-----

--qthtUaFobB5aJBRK--
