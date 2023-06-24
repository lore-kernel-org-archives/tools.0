Received: from jpoiret.xyz (jpoiret.xyz [206.189.101.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9930B441A
	for <tools@linux.kernel.org>; Sat, 24 Jun 2023 10:21:13 +0000 (UTC)
Received: from authenticated-user (jpoiret.xyz [206.189.101.64])
	by jpoiret.xyz (Postfix) with ESMTPA id 5FE14185313;
	Sat, 24 Jun 2023 10:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jpoiret.xyz; s=dkim;
	t=1687601589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vU4/yQMNj/himuko2Fp0V6CE8hDUI6JIDcQGFF1cQZY=;
	b=q+FBR4Ms+7qyDFCSpBoQ5MnKVGTYaf3uz0yAxGN1t6IG2JXbXTdtt8166to33aQeuWXBbi
	3QUo5pTQEUeuQudZZrrYQe3giJIWn9mCeOTsD9FVuE8f82AmB13rcI3DLHTb6j1STZqgDH
	49mnMqZMgvH9uD7pFGbo6Mh1xxjyQytdEp+hrMkgIZnAW7g1BJ7cu46nGbkpDt6LbqMvRC
	EnqXKfxg3k6r9BbqzTfvpPeBDWc29zBfCRSGNRVr5qm9FaOqPM0bmH4Wp/fxr+2sw0kFzu
	2CX6BoT63zcOMcGcEuJZ/hQRy6yAz8weoEkUDmBFCsCn4C4TDeNkdDTtlMmgFQ==
From: Josselin Poiret <dev@jpoiret.xyz>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: [PATCH] Quote author name when creating am message.
In-Reply-To: <20230622-facelift-precook-d9ca32@meerkat>
References: <5de6864e5999c398700712fdce5d52c77d8b0a2a.1686057776.git.dev@jpoiret.xyz>
 <20230622-facelift-precook-d9ca32@meerkat>
Date: Sat, 24 Jun 2023 12:13:07 +0200
Message-ID: <87bkh5rwwc.fsf@jpoiret.xyz>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
X-Spamd-Bar: /
Authentication-Results: jpoiret.xyz;
	auth=pass smtp.auth=jpoiret@jpoiret.xyz smtp.mailfrom=dev@jpoiret.xyz

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi Konstantin,

Konstantin Ryabitsev <konstantin@linuxfoundation.org> writes:

> Thank you for the report. I didn't take the patch, because there is a bet=
ter
> way to do it, but I did give you credit in the commit:
>
> https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=3D87aacf279afc3=
c1eda7b2e6e02e70842b4f99bc7

It was my first time looking at b4's source so I'm thankful for the more
idiomatic code!  I'm hoping to contribute more to b4 in the future since
we're trying to use that more and more in GNU Guix.

Best,
=2D-=20
Josselin Poiret

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQHEBAEBCgAuFiEEOSSM2EHGPMM23K8vUF5AuRYXGooFAmSWwbMQHGRldkBqcG9p
cmV0Lnh5egAKCRBQXkC5FhcaisjiC/9uQPWYN8aGb9DP1kGLVJUV8xHyyDNisOyp
8iIYKS7h83NIIvo8TdZ8uXMwAyn48ChCD3intrz4C4Q5Nws9YeZGs4OGkuiV40vG
QxG0RhaO4Arp+OMzVPw+/+ObzPV/gCaH3LHVQBEcj10DOprn0tZAmf96bSQJOFyz
d+WcZxAcEqBTK73n6/TwRgK0F5Ed6gVnI0SmBXTLlWMJsh7vCRaeyqA/is9Fddg4
uYct9Pj8RXOQ//amh+kY1FCfhJhB/ax+Lc2nbxYezfVT0qnszpT77VxCVel1YWrx
8ONTgmD0Bld8pZcH+T6+pHt9hRzpL6rJadsQcsyS9mtNNmlAcvE6CEss5y87adJk
z51joJ2NoXBy7cJNU+gRi1QgDuc/ZvUl0nt6YZqtQem2wM+fHzxV1IfKSVi9lzF6
srQtcj71wWobKMsO/kg94xCxgAiexp4UrRqw9Z3ZWtzAYog54pzKU6o9lDDCZ0X0
CdrG1qkaUFOOo6VLvJc4sEcQua8cQaY=
=5TqZ
-----END PGP SIGNATURE-----
--=-=-=--
