Received: from mail.archlinux.org (mail.archlinux.org [95.216.189.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC297E0
	for <tools@linux.kernel.org>; Tue, 23 Aug 2022 18:43:13 +0000 (UTC)
Date: Tue, 23 Aug 2022 20:35:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=archlinux.org;
	s=dkim-rsa; t=1661279745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o0TnhL2cJa78354u2W0dtRMVLe55jWpZ2QqHzaWc6g0=;
	b=yd/Y8/JIkSds9PE4nY0f3IoSlX4yRK95k3GlvO89mgnaPkSaGkJpRBfUB6C3jDlw6zpV/I
	ccDepGBzuNPSdsSaKJJjpvet3Z6vHBotBJcRG208DSbTW+2OukSRt2XzfoU8xD1y4m+TDm
	xoYvJeQIWAzTJQDe8MCFuzxt6KgCUWj7B1ZdAIRVSpZucR+cAAe00CtOPgy2AW6lwFsNvW
	zR8TrFenPGvfOUyr3EJorHrpl7GQ3RL+h7TISpaBlQrBmxMBj5HuNAMaYVueNyqquaj96b
	JW15K37i+dIdEhiZoipaYdB2aMVjMrt6Zqwh7MeG6m8ABiuxB8UJFCiEsp7zUsreyD5ERu
	8MAOQfZQ/uVLKt4GLACXBr3kb7itEYcGCpyk/xbyvAt7/q/YumCIBhvIC/f4ORiULdkrUT
	+pHEF6o7PL77cCLvr/DqRKT9vfjhQrs5P3jP6t7/iPCcYGKGTXryXlUJO/HmkLdllCnaLv
	5avHqZ8RRzeVeSqedTNmrO8JwqqzpgzLL11Bq5N06TZFSvWHLQYKpxPN2uV1gDL07BVRbo
	W8EVUqXqbMwzzcyd1dq18if9J/puxvucIHrHOrA4rDioLdmJK/xDYR7SlW2+gsUm7d+czj
	Pa9ygH3P9r5X0omMjey1RZf12loiCFrHCefhKndQMdMwT+pM9AV8k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=archlinux.org;
	s=dkim-ed25519; t=1661279745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o0TnhL2cJa78354u2W0dtRMVLe55jWpZ2QqHzaWc6g0=;
	b=91MUuZ4WfpGLEhc7EGLGYxSBqNR6w6ZzaJx9U+S6391K7sLAlEMRkh1XiZ4Z8o9xLnkNfA
	YhL3ZOOgXmtCVZAQ==
From: Morten Linderud <foxboron@archlinux.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: patatt-0.6.0 is available
Message-ID: <20220823183543.3735p3hdf7pey4hr@framework>
References: <20220822170226.4amnes5dt7ng42xg@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cbncumgecsnjzyfu"
Content-Disposition: inline
In-Reply-To: <20220822170226.4amnes5dt7ng42xg@meerkat.local>
Authentication-Results: mail.archlinux.org;
	auth=pass smtp.auth=foxboron smtp.mailfrom=foxboron@archlinux.org


--cbncumgecsnjzyfu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Yo,

Thanks for the new release. I was packaging it up for Arch and I noticed the
tarball signature on git.kernel.org is missing. Is there going to be a sign=
ature
on the release?

--=20
Morten Linderud
PGP: 9C02FF419FECBE16

--cbncumgecsnjzyfu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEwQA0ZnZjToDJQPuenAL/QZ/svhYFAmMFHf4ACgkQnAL/QZ/s
vhYmwhAAnMfEaoG5+dny25s+P17dy+XurKylTWpAqFhrysKJMOnrLX2JGSMXSCHX
2qlng6Qro8mqebDL8Z3P306u6p3XW3Gn4r3VAJQzYb36RCgDL/nnUXA8C9KBUtSc
+fkUgE7XEcWCWZe3hE903LThakQIIEnXzD8l7nhfDlsVXk71b5AkKs0YfGVPNi6J
s8+HVaqYSMM8BBKmcXhNffJlsprx4OA1DJ7L6o9tXae8eqhYCQFwhSFoYicPAd8t
uR2QT1a4zvtp8Wp+CBni+FSo0yWdf7qJ2nZ3aHL3HqBWjve5MZglBy5EWtQCbuQU
AsAQKSsATWwmU8jUe+S9QeDOpWLA0TjR/WmXf0sDNJ8/yFuLF/yCBnmEbJ7XAeAc
94KADXOMMLRBO2E+DP0VciJ5msdgreiyUfgu7Js68o3teEG9KLFPnEdUHxDJnrZ4
xWIS4DFrIDbhKQcZvF4GKbDt8J7wK6fXJTX5TI9nHcy6qgjMLmMo8ViHM8g0UxRj
C+zQ1oSIdM84pGXuHK60d0rq0iH5IoG0Lpb5dVUch6oRVP+kndJHuWv/PhnoP+9Q
RR1pLczesofoa3D/7q2tbs9jizJWDpbMYV9FvU6hVDbk9kpdWw/WsyT8afUsQrzu
B3fPtDH3UOBGgN1NsQPZMiTyhOI3Ch3jH1W7npcBL7OfEl3JdEY=
=VaEj
-----END PGP SIGNATURE-----

--cbncumgecsnjzyfu--
