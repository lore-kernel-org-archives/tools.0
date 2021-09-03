Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7900D3FCD;
	Fri,  3 Sep 2021 10:31:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8CB3F60232;
	Fri,  3 Sep 2021 10:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1630665080;
	bh=5/S7r0N9MCh40+PzK39/hbLo16i7XmIbpqvLJc7PqSE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yv0EhBiVHeTZ1Zn3lohzB7mHGLbCakW25vvB/xWS0WzgeD7ufqkkIIipnN5SikqNv
	 tZPu7vF9R0iBovNA66244+7lKlvs4VVHfeZEoYH04qPvW7MM98UTkRPrN1YMmBG9Sh
	 aDofh8Ikr1e5DlfHKjN6ILb8vd2+S22C5/bMVtrdkwyDiCvpK6eJXETz+1hSaF2jUD
	 l0tis1xVpqTd3DT3hajd6Jhw0EqHohVUQ1jYGZhPckFyR0IY/E1eruuSlLvh1Rikar
	 XMcqfWupM+8cRPHiL98+5VqHIu8LApdv2nVIdIonP5g0XbTmNBGkAAguVo38cFjxce
	 mmO81CrETVNKQ==
Date: Fri, 3 Sep 2021 11:30:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Jason Gunthorpe <jgg@nvidia.com>, users@linux.kernel.org,
	tools@linux.kernel.org
Subject: Re: New version of lore available for preview
Message-ID: <20210903103046.GC4932@sirena.org.uk>
References: <20210818190750.g3xedu7j24sqndo2@nitro.local>
 <20210902195332.GA2493828@nvidia.com>
 <20210902201402.bbdttirbb5ckrtiz@meerkat.local>
 <CAK7LNAQogtzDbAFDtRt7UvDkH6K4tkQgwfmu-2_0rGgo_Uj_iw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KDt/GgjP6HVcx58l"
Content-Disposition: inline
In-Reply-To: <CAK7LNAQogtzDbAFDtRt7UvDkH6K4tkQgwfmu-2_0rGgo_Uj_iw@mail.gmail.com>
X-Cookie: Darth Vader sleeps with a Teddywookie.
User-Agent: Mutt/1.10.1 (2018-07-13)


--KDt/GgjP6HVcx58l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 03, 2021 at 07:44:35AM +0900, Masahiro Yamada wrote:

> I used to use
>   https://lore.kernel.org/patchwork/project/lkml/list/
> to pick up patches sent to LKML, but it is gone now.

> I use
>   https://patchwork.kernel.org/
> to pick up patches per subsystem,
> but LKML is missing there.

I used to do that too but at some point I switched to using b4 which
does the same thing with downloading patches and tags but uses lore as
the backend instead of a patchwork client.

--KDt/GgjP6HVcx58l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEx+VYACgkQJNaLcl1U
h9C8qQf7BC9c9yYTQMV5mVAPhKcksMnAsKdU5Y/YqXk/Qt1NUDBf2EOXTOZfok6j
giFnyug3cMnwhvTsGSAu7zXEPl6WejzwGj22Qboi6Gs0qFEojLynhjdYoK7lRuEz
UgAIToJEEdwaPfB3YOI3+P0d/8vDRvTAiBPhBpuVhza06vYQAL+t6HvnWt0MzD/M
CvqYpOW7taDuSqYES/fStCertfObsBGZccQSwonRrtypvGFfCCgJj1Uc7GpOKvPQ
bBypFR/y+W3iNtTrJmtfpAWk3W643ZJxR3c6Luf3703HpWOru/hDTdbY5+yOOWob
ftAdzu4T1XaGg2aSaKUI45SiVsjvBg==
=Q+OD
-----END PGP SIGNATURE-----

--KDt/GgjP6HVcx58l--
