Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8853C16BE1B
	for <tools@linux.kernel.org>; Wed, 28 Aug 2024 13:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724851568; cv=none; b=E4gVYg8aWzl2EWsmT1KuGxhuQUnQ8kKa1LnoZzsgCw+KFJKcSgQex/3qjtz4p4VIiil/TN6NeaLis8f6qei2aF0rxoEgK71DlV3B64SK1jS8A9HDjstk5TRLk3QKWu63RncRZgFX5UV7Iq/ACDKZBYNVeUwFKzjYLR+CX62hjSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724851568; c=relaxed/simple;
	bh=fVakZQUpQWCA6djXFXse6b30BZsYI3uWHPuFs5LouIk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t1Gdenle5jwBB2UW2FJ8f12MhxXc1k9WykXnYwsNdrbOu+2HR2c5rxu39tkn7tkgpUZeR+hpdkAIofuHBKiI/A015Tq6EIsSkgv0j5bSPa7ANE+XrbTQO+NHrOEMpx97eiL+oQccIAvtPlE/owGEgWriyK6Lo1DcGxGJNL42V4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DUDELdng; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DUDELdng"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 090FFC4DE06;
	Wed, 28 Aug 2024 13:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724851568;
	bh=fVakZQUpQWCA6djXFXse6b30BZsYI3uWHPuFs5LouIk=;
	h=Date:From:To:Cc:Subject:From;
	b=DUDELdngRkmIMO3elZ3yEPCC9F7cUhSwj5eZGSlxaRJsB9y7jkFdFmiLsBibt4zHB
	 cLn96O7+fEL3QwTRejl29+djHCbsM4dRF6r2DlOfaRJYEW25IKIvdKoVyyCmjPjlVR
	 GB1P0VVZRd0SVC/Zk08Xk2TgnmtVDQy4dM/21mc/uEdWwSWCLibkU1QFV8LiCKExvw
	 Ai1VDqvp6o1f+7QU7PBuUgHGfhbyCiYxAx+vS46ttxi+fDE8Jq87eWAut4O7qFtMbG
	 CgUGQcvW0k2x6aGvtjOdDjnlC3eAyCs++gg8SkaOMVTg0vuuoD6CLWxBbT94a/WRVQ
	 QunJX3cYq1NKQ==
Date: Wed, 28 Aug 2024 14:26:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools <tools@linux.kernel.org>
Subject: Option to filter trailers in b4 trailers --update
Message-ID: <9e5ae790-9c8d-4ee6-a85e-9ac1e32ac24b@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tUSC1LpmNxE22MgK"
Content-Disposition: inline
X-Cookie: You are number 6!  Who is number one?


--tUSC1LpmNxE22MgK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

It would be useful to be able to specify a set of trailers to exclude
=66rom b4 trailers --update for the case where you are collecting review
comments.  If you've had some Tested-bys which have been invalidated by
addressing review comments you might want to pick up further review
trailers without getting the Tested-bys.  You can fetch them and then
remove them later but for large serieses this can get tiresome.

Thanks,
Mark

--tUSC1LpmNxE22MgK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbPJWoACgkQJNaLcl1U
h9Difgf/R7bMFLsQQ4TG3rh1zl/I7FU1t1i+btp2eX0S3KNQpxL21hs9isE+m9LW
fBgu3DQAm5CcZQfXBl54EHkFUARS/81HafOGvi/xExawnStbsOPkjvaOVFEv25xA
VwfL6L6F8HS9UQEMHD+spwW8Qh3F8OFE+RUiRDVPtNN0leX2HtXqaK8/uYhDunuQ
NNEw7Co54mxv4efXxNGZbYFaH8xqZbqLSFtH4iw8uU2Tqs3HTUZoQNdPG/4b/K0D
TRyYi57p+09R8IpAmopPUeP+t6os2gKNsRItA5orqOgi4eL20FWUs8/MCNlNGdQd
RfLRGZSD+jjQFfwez+AsBMmkRQM3jA==
=+D3I
-----END PGP SIGNATURE-----

--tUSC1LpmNxE22MgK--
