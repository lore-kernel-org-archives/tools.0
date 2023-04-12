Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567F56FD2
	for <tools@linux.kernel.org>; Wed, 12 Apr 2023 17:23:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04F39C433D2;
	Wed, 12 Apr 2023 17:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681320196;
	bh=h+eG6eksvJlcPsE9F7q+m/OGipBl6KFltzkwo4IQC6g=;
	h=Date:From:To:Cc:Subject:From;
	b=CeyTokIaLUafBxWyOxI7CGsDxZhmzTkiAk1Cdlc83WHh0oC1l+rDF69ZXPofbBf0n
	 LEVOb6ckEZLz8jihr1+aUknDVtAFE7K+CtC1Z3jwn0rElXe8SgiXW7y34P12QVA1gm
	 f3zvz9Q53KcCsP0A6TZBGW5pPSqdck/zcGzjdf/gL+EI3xHIGh5r9BsRynEEuAkfhy
	 r5o9vw7LIA4sjX1KTyNvNyegChHzfjvQ+Rt0sQdRJ6bAdaURyVsQ/qvK4M04rrMr1Y
	 EnISayollbX3sbVZOGb2JQO3sLgQLqaW8p2mckLla5Sj9FTicElwD/MD05MzYl/w+5
	 sXgmJrAXNoPJg==
Date: Wed, 12 Apr 2023 18:23:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools <tools@linux.kernel.org>
Subject: b4 trailers --update splats on new branch
Message-ID: <ZDbo/qTKFgBQdWh4@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NKeZ2FYlxf0QS/I3"
Content-Disposition: inline
X-Cookie: Happy feast of the pig!


--NKeZ2FYlxf0QS/I3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Konstantin,

If I run b4 trailers --update with current master on a series which I've
not sent yet (which I do as part of my testing for outbound serieses
just to make sure I didn't miss anything) then b4 gets upset and prints
a Python backtrace:

Calculating patch-ids from commits, this may take a moment...
Checking change-id "20230303-arm64-cpufeature-helpers-a70213a244e7"
Grabbing search results from lore.kernel.org
Traceback (most recent call last):
  File "/home/broonie/git/b4/b4/command.py", line 381, in <module>
    cmd()
  File "/home/broonie/git/b4/b4/command.py", line 364, in cmd
    cmdargs.func(cmdargs)
  File "/home/broonie/git/b4/b4/command.py", line 81, in cmd_trailers
    b4.ez.cmd_trailers(cmdargs)
  File "/home/broonie/git/b4/b4/ez.py", line 2201, in cmd_trailers
    update_trailers(cmdargs)
  File "/home/broonie/git/b4/b4/ez.py", line 890, in update_trailers
    addtrailers = list(lmsg.followup_trailers)
AttributeError: 'NoneType' object has no attribute 'followup_trailers'

This seems like it should at least print a nicer error, and I'm sure
this used to work.

Thanks,
Mark

--NKeZ2FYlxf0QS/I3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQ26P0ACgkQJNaLcl1U
h9C8yQf7BKjfRTC3LtYQucnqPpDa5jnHPXb5Mgk7K3koCJplHqjf42B1G/K2m4ze
8nZiThQ/NMAobUc5jq4PQq5qJ8FZwO4v7+KSRsX16hCizOp21yp1OiHTCidV2s+w
8bwtu2q0UEpCRA18epqZkAu36CRtplcBTEH87+204XaJIbfFAGXfaa3VvcIbwoa6
qN69TIIW6Zujr63HObxeAdyu+kpjOMpU3jlFstdvv3HcfDoe6Qxy4lS8jP+UMd6a
RlK6eFrYD95jld9AF3k//LE5m3uUxpwC7hsRwAWbNgymBl+Y8X15fMtHekqT90is
FV6BgakJNhL+bP13PeHQmxieq1tzwQ==
=SlH/
-----END PGP SIGNATURE-----

--NKeZ2FYlxf0QS/I3--
