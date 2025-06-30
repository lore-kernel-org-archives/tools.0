Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C29079D2
	for <tools@linux.kernel.org>; Mon, 30 Jun 2025 19:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751312542; cv=none; b=PG8fX36KC/OVN5bnKY9eTDImp1IL6qLTh7GWToMp3Lb3MOK2i0Z+5JqsGZ0dlcbH5F9g3kKHlgbrUMPoMwqpYDJBoH+nV+7UyQKB7H6+J6QfuHVZYiKgyER2KRAe6Qr6ibP6U26nj6NaalW9TI9/wt/vmPCd9mEFRlT5fZetQac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751312542; c=relaxed/simple;
	bh=BcwvJ5CoWa1uVId04HnjP3i1CYHNHL6yqSuw4i9FLC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I08yYjbaAQe7rpQLLyQsH0F1ZRWwN7BBmKj1386Ep3XAvsY83CqyODZHQ87uffHuXV6V1LDtivkQMEq+hMcQHxXtGDFaJcGN1f3AVQ3mirNkn9LiYkh8BTA3ESNJJpT2tu4JmQqitCezV+bRlghQD5LDuizIGmns6ipFjjuioOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu; spf=pass smtp.mailfrom=heusel.eu; dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b=Q04B4cPf; arc=none smtp.client-ip=212.227.126.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heusel.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b="Q04B4cPf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1751312529; x=1751917329; i=christian@heusel.eu;
	bh=mA8LsO9At1r/ee4fy8p6fSR4KwR2gsBkIk1II4cjrDc=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Q04B4cPfhrYIbewW+H0eComR5cikWPWbvaSN0wiYBR46OzD6ti7UdpRsoSpmxPH+
	 IcG5TB4KkBlVsw/dpWViBoMKuwAJo4IAq3e8mXQoCjGhKh823p9FALsLndaITg04B
	 fnpkleF8q1iEhbTkbDdnd787pXZrAnAuXrSPyehbilgWe5x/KThDalQe+r9W0EdI1
	 z5xUnScQIlpOcDRqh7BBeXPeT2T497uS2xn9f2d+qwPHGbhq0oG7N8AumFvoIsMIK
	 VosPUHYIvNsF18f+zpEx25RKQrEkmnu6EE30+Ll8dtDruZ7oO2SB8xfW63ATIAuuT
	 raygf/loT5aCiVVqtg==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([80.187.64.43]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MCKO2-1uMwjr0aAc-007YCL; Mon, 30 Jun 2025 21:42:09 +0200
Date: Mon, 30 Jun 2025 21:42:07 +0200
From: Christian Heusel <christian@heusel.eu>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: tools@linux.kernel.org, Konstantin Ryabitsev <mricon@kernel.org>
Subject: Re: Empty s-o-b with shazam?
Message-ID: <5bc20430-06c1-494f-a269-05b3d5e4cec7@heusel.eu>
References: <CAHmME9r4wVpPMP_iUOvMZ8ppGBQu=v_Oz_MGpnQwU8nTUYP+vg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kfzcblamiefjgf4h"
Content-Disposition: inline
In-Reply-To: <CAHmME9r4wVpPMP_iUOvMZ8ppGBQu=v_Oz_MGpnQwU8nTUYP+vg@mail.gmail.com>
X-Provags-ID: V03:K1:DzzGsFFMxQvrySSVIM/iTd/AvRKNHYMYtz5ywZRw8c7PcgAzMmF
 EH/StUx7m+EDAr1IHQTDDB/Gk9C7vNHkf9qwGVSWlgxKvajVbRy7U4cSZbU++PHStcA71M9
 ucSg6A38DWsdBw/BLCFWbJ67dktTQKBlUzJQZLYU1DBr/RikEO/9Zo/cK7VWDaimkmOxUHN
 crdnr6VApVBDPNxIYTA8A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:6w44O3CMNpk=;Cgk1gECG79NbHJMsDdH5BbiI/U9
 Ing60z/blTVN0UTOLuqFJIRnT9HOUrV8UMmDBcGsXHjyusLSPacr3qvNJdlKsNjISr5b9ngxj
 gBQMOujuut+S5UNQ2HZT3pvP4YTgCLjX8JNPOIKVD4cXwWm1XxBwyHn9t3MQYu0msgQS2whLb
 JDDae51b/ZL3PgEDdWo718AVIH7JaUD6OrnYFokiAiK0aMpDbkXgCwUjGHHWvHiEcUK/U4e5y
 z3PfbuYJj54hZWx5ZX6nAGE8SPm+aC0cL1H1M31e56+DCOPXm1vIy49F+6euYzKlf/clF0JCG
 +523w32HBRiXiMuBkjRvlX9pdwOjQOrwLyU8oxM9Syi4uwak2NolvAxhi6ml4slNpej4XYXX6
 TkH+q9jvl4Lz7WAxqG0Q2gCLMdA5CJMEzjCkMxUMWOmemoU0BD1NmCXgQ6fkTtGzBztkh8ilz
 tBW//fxnfvf9vZrRy4RbA21qn+HYYBnEc9uDDQbQzTZTyhPBd/RTMEfWDL2VOn+79yM2LbbZg
 3XP3CcXrVHDMiiSLR5mmj2fKDOdMcbTm4jH8JKdl3CUCSESNkErKXqKlVVX9OViozv5Q2n16g
 w5Xt1PN+Ga49R+XbDKzBjOi2Bq5n/IXsmqwC/EVX5b459GS1O+YzYpUT7WgphyKd4goiVt9e1
 sjoejRnC6vGDh/0tFHT0pn6wqmDbkKjYDmL3mYjd5Rxx4eMQtRZ0B2wttQOsGtPSG2rz0M31J
 SLoLu7uuE9mGBAHFzOgMcoyx4AjSN2PXSxqVGWJvJCRAFd2NQo13mcssyDzBnstl1PkBMZ98b
 DNoV3ZqJ3UD0cnVehhUuzKOi1So8Pf7KRwC1u1aNqlIt8sG3f9y21GNiJsDugU5OSJPjahetH
 qw9HkkHwBZ8pT4tjtYi0MEAGSiqKBmlkhFhcrH1EufN5F/bfZkrI1hAjMs+fWOSxtpSPEuKy3
 qI/BmZxDLNJnQ528opYlpCC+ADeCM16xPA0eG46+m44O0c/rleIq5Ia+7qJ2pECogCcIy32dm
 odohuRgLfu1LnThwaexs14nh7kzmW9Us3wcqozm2u4L7Ih0iAr53+xuhA7UtsID4v/ysdDlPk
 JNQqnhMBzR4W8xqfCj0zMY4DJeplf8C50Bnq3ArffbGtN9r0jVM8yXN40CTXXy3OHgtHYyYKk
 qr4eOxW3HZukvvd26rbPg6uhJmPJCjVlAi1/PLZ3FTb2p8CWiPreot5DCW1gZiIfgb1eBPp79
 iZVWcaN6503ln5ntocKQmkWv7CfnrG/aVcerErgz747VUwY8Fc0G68lZbBvVTF8bKaP1YMZSo
 DbwSevvEhS0NqyEmi7Gl3HJ63N5V986dduvV5LH8QEAPve8V9eJg86VduOWswj7QxmzCqrDSw
 QhPOL2Ud16p2tdNdw1k9ytEduuRKNWLeSJNjcx2OH0Inf9FxKySo9TvSXQzOzoRz7bUKnaFCt
 kCKTQ2W7vSJPvl252s+mADOusGSRedflJAhKotkQNHth8FLr5xKPWjW1Ek6jQbqib6SungNuL
 RV3y2b0umYZ+oBgLwUwWyH30vEwIl/kXLj82J+7MAfOAB7zo5xpKuTaP057ivvbKOOq0s+GUE
 e0ublQp3BK/k5PM5JJ7n6rHnfLtlRAL


--kfzcblamiefjgf4h
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Empty s-o-b with shazam?
MIME-Version: 1.0

Hey Jason,

On 25/06/30 07:20PM, Jason A. Donenfeld wrote:
> $ b4 shazam 20250619145501.351951-1-yury.norov@gmail.com
>
> commit 641c28eede30cecf7e262dd1191fec9679a7125b (HEAD -> stable)
> Author: Yury Norov [NVIDIA] <yury.norov@gmail.com>
> Date:   Thu Jun 19 16:54:59 2025
>=20
>    wireguard: queueing: simplify wg_cpumask_next_online()
>=20
>    wg_cpumask_choose_online() opencodes cpumask_nth(). Use it and make the
>    function significantly simpler. While there, fix opencoded cpu_online()
>    too.
>=20
>    Signed-off-by:
>    Reviewed-by: Simon Horman <horms@kernel.org>
>=20
> What happened to the S-o-b there?

Maybe the issue is the s-o-b line in a later message of the thread? [1]
I could imagine that b4 tries to filter duplicate signoffs somehow but
fails as this one comes from a message in the thread =F0=9F=A4=94

Another factor that points into the same direction is that the wrong tag
vanishes once you pass "--no-add-trailers" to the command, so the empty
signoff seems to stem from another message.

Hope this input helps Konstantin to debug the error better!

Cheers,
Chris


[1]: https://lore.kernel.org/all/aGLPOWUQeCxTPDix@yury/

--kfzcblamiefjgf4h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmhi6I8ACgkQwEfU8yi1
JYVAsg//X+b6fcMqeEY/WoX6z+fa657xOvAA21pyseqd3Jo1O0lf2zOxoTdsFA0S
1NDMo43HZzJR0zH9Ous/u8c2PVtMyPREDjoBe11WF8+NVkRWsS6WsqNzYYOadmhC
w1pDQXvwFfxIeJ8iAdTwiw2ORzBDZ/oIkTW59bbzo3/Hc4yO8+jHNxZL5iMxUAL9
uE5SQa2757gdSDwepaOmVRQxiiv1avlYFDElHYRE+GbX6jgLhXzZ7DZh3/fPae/S
6+cAe/AT9A3oau1oA3bCNxx0lLaZUfFh5gqiON5pHh3Y6JSRnlaqj2s5uayDyq18
J93LK9Yg3SEzCfO6prfjvwAQG7zoTW4wd5swLjj05rzH3/O/RCQvbVQl45S1c9Gy
9GYDqsM1C/CReUrB0dPfe9E8hwKuanffRN916EnuDag7Cn3L0AD+nRc+JwiCfb7V
pgg4sd4W074XI+ZP4yNQplhk+jHQM7XdQrIJ3htxXu7szzC3y+8I60BbUDZrq2cy
eIpMpDqeidZN94y/s8c/FsGJMGKWqI6MU/9T+SDzV5pyPYCpEpnpsisOeWJRztLS
56RD0waIsNgIWEleXVnE7K4+hANgnHb/vnwBUROD262iwaL5I41VX2gf2VbBJyrF
YhsN2BdiwllhrsSytiG7rH1rbOddquQAMNcyBH72shqlNo9H200=
=Awky
-----END PGP SIGNATURE-----

--kfzcblamiefjgf4h--
