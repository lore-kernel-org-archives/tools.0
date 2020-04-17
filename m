Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web11.1413.1587143347663120728
 for <tools@linux.kernel.org>;
 Fri, 17 Apr 2020 10:09:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=RzmvbhIa;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: broonie@kernel.org)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id C87992220A;
	Fri, 17 Apr 2020 17:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1587143347;
	bh=07ZZe0g6Y0zj+2u6XTKcSFXIdD79yTHCfHIVHvM09No=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RzmvbhIaj2Znv/T165CL9t+98jlotMKpwrX+tRLUO4idhKRuPw3hqPxM1GT5XZg00
	 yOdNRvuw6BTf/cDdrhpLRQz7NA1uKXYs5GvEXegBQhDCZitjXw1y8Gu+7nzS4Yf4Os
	 9uSW0JsfRjHiSLc0GKibQaQzep5D7wZMzCH9BqEc=
Date: Fri, 17 Apr 2020 18:09:04 +0100
From: "Mark Brown" <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 ty feature requests
Message-ID: <20200417170904.GI5315@sirena.org.uk>
References: <20200417154430.GG5315@sirena.org.uk>
 <20200417161424.y6nlcm6pbavikwch@chatter.i7.local>
 <20200417163939.GH5315@sirena.org.uk>
 <20200417165537.4xgdj537vw26fai6@chatter.i7.local>
MIME-Version: 1.0
In-Reply-To: <20200417165537.4xgdj537vw26fai6@chatter.i7.local>
X-Cookie: MOUNT TAPE U1439 ON B3, NO RING
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Groupsio-MsgNum: 91
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9s922KAXlWjPfK/Q"
Content-Disposition: inline

--9s922KAXlWjPfK/Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 17, 2020 at 12:55:37PM -0400, Konstantin Ryabitsev wrote:

> Ah, excellent data point. How about we approach it from a slightly=20
> different angle. We already allow setting a per-repo=20
> "thanks-commit-url-mask", but how about also a way to record that in the=
=20
> remote section of .git/config, e.g.:

> [remote "foo"]
>   url =3D git@gitolite.kernel.org:pub/scm/linux/kernel/git/foo/linux
>   fetch =3D +refs/heads/*:refs/remotes/foo/*
>   b4-treename =3D "foo/linux.git"
>   b4-commit-url-mask =3D "https://git.kernel.org/foo/c/%.8s"

> Would that work?

I think so, yes - the treename could even default to either url or the
remote name so a lot of the time it'd not even need to be set.

One thing to watch out for is that you can name branches foo/bar without
them being remotes so just because there's a / that doesn't mean the
branch is a remote branch.

--9s922KAXlWjPfK/Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6Z4q8ACgkQJNaLcl1U
h9DAGQf/W0PX+QG0GU5abrEl9Ku91Kgaf6RmIgnF4FzxL/HQ4lRmAOa/42cfKjOr
RS/j0t+AKiPcpsqdBnsXOmb/ETdLOxCHovADBuZtKy2QUqgkvBecceWKhybgvk3J
Rgiwe7UMC8HFEmD0Bn4P/0rijgTA51v4Oyh5wfUnDUGUrFqlVyT6CbKtbigMJBvI
KyyGYbJ/ArnmgHrxPJqYp+ebWF8F8XZVjF63WlECvkV9v+Q0zymN4jNVy20vA3WE
iBApT2bSG7Xi/xAKARyhbLBfjvBrZuWuGRFHnBmbgHnw8QRTK/rmcJz3kVUHY4/P
92pblw1NSL7KHekWl0L7e1Gzz3irEw==
=ZmH0
-----END PGP SIGNATURE-----

--9s922KAXlWjPfK/Q--
