Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671293F6600
	for <tools@linux.kernel.org>; Tue,  7 Jul 2026 12:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783428478; cv=none; b=RQLoZ1ld/A/JbiZqf6c9hKiZmLsPAl3iWKQjX+jcb78qUI8USgLbGSuk+PUufZgvrzgBWrzJCsVZoMLPDTpmDfqZaCH3uI92adB8HVyF2pSof9/plmv6gzquz/4Sufsy9pXXmDjdLInsHv4iv+Aa5TbCh8lMyP2192wTssmv7GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783428478; c=relaxed/simple;
	bh=JgPUHbEQaxwQvfJiO1Ti3pGa98/ZRUPM63hUOcp4Rcw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dV06/r7fGj+fT0SzgWy0pVUEUlEdvfpnP47OPX3LvBkd5BZJ1aECJ1reBm+9yLsAGILYCcn/a4LRj01qO6b+6tyXcIm1ab0ryTUcjEaizhFnLayxUnaLOBAvxvv3v17IHUHVcrhDiNTOrdbyqE+KWME3y98YbOSi41l42blbz/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qv5999jX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qv5999jX"
Received: by smtp.kernel.org (Postfix)
	id 1EC511F00A3A; Tue,  7 Jul 2026 12:47:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6645F1F000E9;
	Tue,  7 Jul 2026 12:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783428477;
	bh=q1prhFmRevKQndCXZQVK0qOMUV28drAJT+5LnC92Ybw=;
	h=Date:From:To:Cc:Subject;
	b=Qv5999jXIPqKwxFgj/Sj1kd/CHvSNSgQO4uxiYv/tGeh0EmtCDCHa1aCtrI8vY4mg
	 GeNt01st6hkIHnxIEW/+fnVvxQfMx2nqIqdKcu7Jep4adOoCxVqk9UHn//zBXh7lOa
	 heLQNRL05kwYGc4jXQDhGD6yC2nC0tphPhND9ZuCcbY3rNxn4I/35CHlfurap6D1uQ
	 SKUodFQo23UCiSpWrSqDO3s2X+rNqWJO9rTxhThPXPivLVhUzt4Kjimsj2x9Ithlfj
	 ekPolzdgMTpcWvKZg4KEh7Od8VuShwJPvkl/d3qsHej04NQKyQ7fQMXS1nJlRv1EAT
	 hGNQMbVJdhMrA==
Date: Tue, 7 Jul 2026 13:47:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: b4 review sashkio integration
Message-ID: <24e7e23d-2413-4185-bd5c-b563209630e5@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lx0xb1Z6AgZlsrh/"
Content-Disposition: inline
X-Cookie: Walk softly and carry a megawatt laser.


--lx0xb1Z6AgZlsrh/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

b4 review tui can display sashiko comments it fetches from the API,
currently it displays all comments.  It looks like Sashiko has the
ability to flag comments that are preexisting issues in the API, it
would be very useful if b4 could optionally hide or distringush these
=66rom issues identified in the patch itself.

Thanks,
Mark

--lx0xb1Z6AgZlsrh/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpM9XkACgkQJNaLcl1U
h9Ch8Af/U+v5Il8i+/iV7fzgqacaTo63bVUDmwyEDsre1YgjuEj9zV2tmbQtwloU
57VAcJu2IrK9gn/aRdhHOMtil5w15yQwMUftXvdk71VUmqbjPExnee7vIE2yNNbf
JdlY7CkgDvB+OQ5Tx/0QpHyN3rQDnh5+Ni+qMGAC/PLMV7xjkSBZpcjSMttiN0fG
8rQAwdkAB9I8GUke/oxbyOzicjV8rFIDU3mHr/yKmwE3hFOm9wKhl2qt0QSFZSQP
ip7PwNaLkj8oDYuARo+msbjsh9az+Gx3541dP5JXEs2KpC92zsnr1x4ZjG2BrjyT
O3RlhaIDSYDen+aw7a5619vMHkRMPw==
=s+NE
-----END PGP SIGNATURE-----

--lx0xb1Z6AgZlsrh/--
