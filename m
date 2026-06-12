Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3102382379
	for <tools@linux.kernel.org>; Fri, 12 Jun 2026 12:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781269180; cv=none; b=AHRp44Cui+CLdZ2bm+zG6zgV8icPnnWiLpf7cmoaT5QYiopZWZ9l7J3MgsdPv44++eFmXg94BJELLr0Omfm2fygggu34s5wXrvSpkxOwMbkGhAdvzXq796rlAPXDsRl5+0+1t++NAtE7FPOvcVHtPcPR2ocLiGd5Y5taJf927F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781269180; c=relaxed/simple;
	bh=7HnEWQHjUDL2zhfio1BMduKt4fiT7ybvOUugx/PvYTY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=owYTaEZcxhDIRgWPKGtHeIzn7KJ1AP9jDAmRyuxlJzaJQQTxmz9w7rftsrTygo/UqtDm368qEhW9SdULiKUmiYNzWz3+gm5nT5jRNKdC87Hb3J+BfslMCZdUfj4rcha44yqSIts8zAIHhUhPmCXLwwVKPOH+7/qL5N3efLEjAzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GbAA+OJQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GbAA+OJQ"
Received: by smtp.kernel.org (Postfix)
	id 800521F00A3A; Fri, 12 Jun 2026 12:59:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32FBB1F000E9;
	Fri, 12 Jun 2026 12:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781269179;
	bh=EhLbsuZlxeXeX2daKGmUJY7KLdssa6wqf2odWDi9V7Y=;
	h=Date:From:To:Cc:Subject;
	b=GbAA+OJQzKEuKh+HuuiIUhdibcCXY3aCwzYDa/fGQU+urkAYCVnM4wnzWqOvNH++X
	 orvD6FPOeCMhXs0ENl64RT+YwLsR7B6KoCMGm6AdS/NHx+ul4rPNoiTJSoxR9XP1Gy
	 8+4accsGeT4EY9fnTRz6R3QPZOP7h8vA/oe7zIlrss5+Vyccy9SsZskG1dv1ETc1G3
	 z6CBWW//uuZEy2BO2TBBmEnmRgqx9FFRWX5FCLk/F9+3rZI3taMvIUsMBpMx3PEagB
	 Xd4sU4GqgaiIX0E6lHeZWxp1UAl0qVHTLMFlBJnrllAHnHN4tKQC0f7j1HUdsYwSsr
	 h/eB9RmF7v+rQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 18C191AC58C5; Fri, 12 Jun 2026 13:58:54 +0100 (BST)
Date: Fri, 12 Jun 2026 13:58:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: b4 pr fetch refuses to fetch already fetched branches
Message-ID: <aiwCjkJ7DWAAD0yf@sirena.co.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="V3E/79vdqJQh/C2G"
Content-Disposition: inline
X-Cookie: Nice guys get sick.


--V3E/79vdqJQh/C2G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Running b4 pr on a message that mentions a commit that's already in some
local branch nor (AFAICT) sets up to do a b4 ty for the PR (which is a
large part of what I'm looking for here):

$ b4 pr 87jythopgp.fsf@bootlin.com=20
Looking up 87jythopgp.fsf@bootlin.com
Looking at: [GIT PULL] spi-nand/spi-mem changes for 7.2
Pull request tip commit exists in the following branches:
  b4/review/20260216-sc2730-regulators-13ba789641a4
  b4/review/20260527-spi-cadence-quadspi-add-phy-tuning-support-bcef16741d7d
  b4/review/20260528-asoc-use-named-initializers-for-platform_device_id-arr=
ays-b0874c719b61

(the fact that b4 pr will happily pick up random linux-next commits as
branch bases is a separate issue...).  The fact that I've got a copy of
the branch locally shouldn't be relevant to my descision to pull it into
a published branch.

Thanks,
Mark

--V3E/79vdqJQh/C2G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmosAooACgkQJNaLcl1U
h9AEjQf9EeHUTBt1oxDwDop8oVDpxxtiKJ+PcJ0B0yInfuo5Qtye4fm+06SDfngH
pzOwQzdouYthIFT/PKCrFYFklpsgCVVUYWLNZfaDGsnmoXJyjQMYLrG28dvS/OSa
lczgtrL3B5PDx7Q0WF8B0sjtk2UjrD1Sredx9K0LpvCBGn0C5GFK00HfeHz4KcJE
gKXkaaT1A4KFr/8XDoib+9EaTgErKM9zYRWGc5qJaojwyl5q1b7IKB6+oqecxmw8
oXjJTpC3RS8VzooG63hlMx91tNO7O06fj6mSpGEiszfydUICZPY2SC5t37OyB6mn
lbVMaC/6oWhjd3l1sQGKnJPDMdwghQ==
=SJ23
-----END PGP SIGNATURE-----

--V3E/79vdqJQh/C2G--
