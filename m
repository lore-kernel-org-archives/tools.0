Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00376AD4
	for <tools@linux.kernel.org>; Fri, 22 Jul 2022 19:10:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7751C341C6;
	Fri, 22 Jul 2022 19:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658517003;
	bh=6k3wxjatvtZvEuwU0vhe8WAYSavC4z98+IhhnLP4W4I=;
	h=Date:From:To:Cc:Subject:From;
	b=hQLxkmupFh2sZL945axCFRAlwTNInFPcyk8z3Op+fBA9g+ro8cWciD3hlzr5xW+Wf
	 aLR4HAQL0IkomTUhJo/WKbQQ8dE3uSdFJrbZWLHO8AQRHVoIjo1JE2mxqnVf+03J8i
	 lCZTZbvl1BfaxsK2oiImO/zEAdnY63u8kEviH2NDrYvXF2ZwTJwMy0XoeLBuDKddoW
	 A/2TfJmxClAfEjaWeB4ThktQwIr4Od8BHExi6cfyRtL5jKcCNxrTcwLiGX6AJ2Dg0J
	 ukaTc1rhSMGt5/CY0ph28vITuqn3q+abl9Ab7f/QWoes7BzloPFyYyJvRlV1742kwp
	 Qxgf2La4SKM8g==
Date: Fri, 22 Jul 2022 20:09:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: backtrace fetching message with b4
Message-ID: <Ytr2B+54jaPQJdWN@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="30Cp5C/nzhTFczyv"
Content-Disposition: inline
X-Cookie: Yow!  I want my nose in lights!


--30Cp5C/nzhTFczyv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Konstantin,

When fetching 20220722134603.316668-1-Syed.SabaKareem@amd.com with b4 am
using tip of tree (d952f4b20bc1e80) I get:

$ b4 am 20220722134603.316668-1-Syed.SabaKareem@amd.com
Analyzing 4 messages in the thread
Traceback (most recent call last):
  File "/home/broonie/git/b4/b4/command.py", line 343, in <module>
    cmd()
  File "/home/broonie/git/b4/b4/command.py", line 326, in cmd
    cmdargs.func(cmdargs)
  File "/home/broonie/git/b4/b4/command.py", line 91, in cmd_am
    b4.mbox.main(cmdargs)
  File "/home/broonie/git/b4/b4/mbox.py", line 763, in main
    make_am(msgs, cmdargs, msgid)
  File "/home/broonie/git/b4/b4/mbox.py", line 63, in make_am
    lser = lmbx.get_series(revision=wantver, sloppytrailers=cmdargs.sloppytrailers, reroll=reroll)
  File "/home/broonie/git/b4/b4/__init__.py", line 333, in get_series
    trailers.append(tuple(ptrailer + [pmsg]))
TypeError: can only concatenate tuple (not "list") to tuple

Thanks,
Mark

--30Cp5C/nzhTFczyv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLa9gYACgkQJNaLcl1U
h9Ax5gf/Qrw7a0GrR9DpoXCBejxz0AM9Kxect2/jRb2akbK+k+xywetg01SbQMlK
bxWahAnWxy0XCKDmSPNoyj2UjMijJMAm7LiNaq3TxpTwM5D9pWqmm4Hh+QsZGa6c
GeSWdyh4Ja0Wb5DZF5xBGJ4TB9K0tQbCc3OFEiRJPFmqB1HuCjljdoxyUVR3Q1XU
r+NC2P5eZnWb6LCk5N+2iyY1p3LOM0fFIB49N9URY6New5Opa9FfpQFFkbaes4d1
gOehTtEu85bKDJh1ivH1qGLhBQXRYxzl7KUuEFjYb/qrjt9HJVUteKrokZU8Qhfs
uP0pCT+3/7anpX1njxQQul4nBUrVmg==
=yLpm
-----END PGP SIGNATURE-----

--30Cp5C/nzhTFczyv--
