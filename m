Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8755353A95
	for <tools@linux.kernel.org>; Tue, 11 Aug 2026 17:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786470861; cv=none; b=q9cFqf4Jl8wRFy/7rrTFxtSdA6rlwQa5uF7mtGhLOZucva/fGn1QPGKld1T/EHVtMURKhqHFfNQSIbHVlQwZsE+gL/Rk6v7YKoeI+WN339De/LhCr18ZtC3YmArd4tXt/DjgpLc010PZHZw7Ptnh4yrIoVUHYP6s9Oep3B/ubV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786470861; c=relaxed/simple;
	bh=Qg0NZ8u82po/fmRqozM+9KUu9ixVuFCT++wCEsPxOco=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j+bShh7k4lZacA2YFgrtp6V/6+0Fojsdt7l64KjM5DOHira/X0UjZ6i3l0P7ns04JqhnvQmqa0Zdd6oamBSqWaEMXI9a9IEIRbdLCsF9GiNb2n+uflMK++jAsoRE8VLfmwh7Tkz7h5jjtirw1eaC1zR1ok4hNgsQe1TWbbY6pEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OFOTNxxb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OFOTNxxb"
Received: by smtp.kernel.org (Postfix)
	id A67DC1F00A3A; Tue, 11 Aug 2026 17:54:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9D8F1F000E9;
	Tue, 11 Aug 2026 17:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786470859;
	bh=8BI7XzYukz2QVifj+hS+wqJObBIlWk28HXhrjNOIk4o=;
	h=Date:From:To:Cc:Subject;
	b=OFOTNxxbPssBwd1m/lqPmRKoSu3+d5IlJKcgUZnfJLoSbSre5IAomtBbTgI1God3W
	 pg/0C0TrgVtE+9XrILFL+IEx5mb512NAta1rve3ZsaiWM9QpT+h2unC7Hb566T+blW
	 1OgEs9U3IoItR/Nk5I5jNaADZQdNSYxiRDnDpugr4jkT7ZEc94yqtqWyxS8VK/4gYh
	 wreo979zpahCQrIWEPoZiffkl75/qfCOtoy/hS/folvTO4NLkrxhWHbKsG71YK9xBH
	 h4WrzsrE98g7KqdumaYHJ+6kxbVhFXrBeP9JfJPwghOrt+taaJ3ToK23E97hxNHotw
	 XajIhQ0oL05qQ==
Date: Tue, 11 Aug 2026 18:54:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: b4 review misses a patch
Message-ID: <8d7fc80b-e303-4f2c-9890-8408bd5d27ac@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h4Gm8PwAjn8V2uUB"
Content-Disposition: inline
X-Cookie: Anything is possible, unless it's not.


--h4Gm8PwAjn8V2uUB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Konstantin,

Fun one with current git.  For:

   https://lore.kernel.org/r/cover.1785855013.git.rriveram@opensource.cirrus.com

b4 review has imported only the first patch, even though it did say:

Retrieving series: cover.1785855013.git.rriveram@opensource.cirrus.com
Looking up cover.1785855013.git.rriveram@opensource.cirrus.com
Breaking thread to remove parents of cover.1785855013.git.rriveram@opensource.cirrus.com
Checking for newer revisions
Grabbing search results from lore.kernel.org
No change-id found, generated: 20260811-introduces-mdsync-support-for-cs35l45-d87349df7cad
Tracked series: Introduces MDSYNC support for CS35L45 v1 (2 patches)
  From: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
  Change-ID: 20260811-introduces-mdsync-support-for-cs35l45-d87349df7cad
  Message-ID: cover.1785855013.git.rriveram@opensource.cirrus.com

--h4Gm8PwAjn8V2uUB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp7YccACgkQJNaLcl1U
h9DMUQf/Vs2exrh6/IHLpoyppylKVRuc7m7UgfXVi9opXgSb7evV9q70l27KeSII
Vp5O6A4RHtCtukc7jyzH4BSfYXJmifvBFrSL6wXBLASECId5IWHjuRsXFbZeRTs8
PVJNsdC2gb5mm1LFp1XLylG3AyWoUMk33cfGNzqcY067W9jb0cq4q5W3wYJjOz5c
EQA55GKDNbRYF4NUkYa0gh4+HKM271p6q6smu//ApxW7mQNF8sLHJDn3GgEF+VM3
i2qSrU54Hr+IKEGmzCpWcKztwMzHHNqUu2xrCi5PtB0+hT4RWkaG8ON1RQbiEgI2
PubSvQRq915ReYxA+mnF8Z9T2HZSZA==
=QbZ7
-----END PGP SIGNATURE-----

--h4Gm8PwAjn8V2uUB--
