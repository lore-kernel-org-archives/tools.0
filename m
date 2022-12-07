Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5672C8F4B
	for <tools@linux.kernel.org>; Wed,  7 Dec 2022 22:55:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59328C433C1;
	Wed,  7 Dec 2022 22:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670453712;
	bh=kCuwcoqS7VVizUftGwL7kUwX1rx6yCeHcz42gubG9gc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o6U90uhUDyEQC/D/K7Pm7Kma0HmwNvmONDhpJO1BdwIc6elk8+qcX0JFpiEFaiDMb
	 oXT6/SxMAski8u9ZOey76RtOJfPQ9pwBnYLLsQ/x0Q+c7Ra/ykf8p5NdSNIEmexee9
	 W7odE6Lyd9GZ1TJhtitQuL9BzYuwsUeXgUxqPqBmoT3miMsdKCtlJRb7Om+FsBAZrq
	 OHmGgKHDf0sdJNIHsMQkYv1qKLAQ2+ilJRu2/5bq0gZhGISUdfDdZJP8HRP9WvEiS8
	 xKoLsuN/pM65j9ZRYr4LRibYgqEnF9OPFy885/zlJCxgkSF5x+4TGkZenU68UBexUC
	 MxUT82YeNu9DQ==
Date: Wed, 7 Dec 2022 22:55:07 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 prep HEAD fails when specifying branch point
Message-ID: <Y5EZy/qqongS4Teo@sirena.org.uk>
References: <Y4+9Fz7lkzSnFV72@sirena.org.uk>
 <20221206221546.ezjxmz2w3tuxbzx5@meerkat.local>
 <Y4/I/dzuV+s00L8k@sirena.org.uk>
 <20221207011100.v6dyvrma53hv4oor@nitro.local>
 <Y5CKJ2qs5aIVfWoE@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qcfYt9kpC5cb3zNN"
Content-Disposition: inline
In-Reply-To: <Y5CKJ2qs5aIVfWoE@sirena.org.uk>
X-Cookie: What!?  Me worry?


--qcfYt9kpC5cb3zNN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 07, 2022 at 12:42:20PM +0000, Mark Brown wrote:
> On Tue, Dec 06, 2022 at 08:11:00PM -0500, Konstantin Ryabitsev wrote:

> > Since my primary goal with this work is to simplify the process for newbies
> > and occasional committers, b4 tries to enforce the workflow of 1) switch to
> > the branch from which you want to fork, b) specify the tag in this branch that
> > you want to use as the fork-point.

> Right, so a common use case here is that you want to fork from a remote
> branch (generally something in the maintainer's tree).  For me that'd
> probably mean that I'd end up with a lot of branches tracking a branch
> called tmp.  I'm not sure if that *matters* though.

Ah, yeah - turns out it really does matter, b4 send gets very confused
about what it should send if the base branch isn't actually the base
branch.

--qcfYt9kpC5cb3zNN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmORGcsACgkQJNaLcl1U
h9BprAf/SGmjf1tlO6JVMTCY+6yogHQTwKcgBMAgb7xT2mwCfAOOHi08A3K9ZD/E
Z0MlXYRjSvxgscRB3b914oYlvLmnHp/zGHVjiksRdwcwod2kD5/06IZzi1pivRrt
hLdHXur7zoMC+6Q6ClTEXTZoMAI2xs+WzK4gyudB7TLttI6NmL/O1+4NyCMjHN8u
d7CsVztXJBZALMS1V8/m02oI9lDq0MW926JY4DIVY1N2gbJt3HZ1DBFeyhn4dL8C
HGyj4dmKC6CYqYsBtxx1awEznFT9S8U/2oaq1AZBBVSvErZT+5pT/lqj4hExShEZ
cNacO80HBPDVTYwynE4n0uzGVHhX4Q==
=vpnk
-----END PGP SIGNATURE-----

--qcfYt9kpC5cb3zNN--
