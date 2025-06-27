Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D6815D1
	for <tools@linux.kernel.org>; Fri, 27 Jun 2025 17:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751043658; cv=none; b=kz8XVCPtmarT494uClnXZCVhHlZPeZFtve/a6IxU53MywxPuCeJ3hU3DZuBG0kzgmL+0xhV7bAKFR3A6uruoPcqGhfBzm82qSKBUTo2malH8SbaPZjgOHBuujhHcuCxjVEl9UHF0MNYCfggOByJdb0vNIg2xcLz97Ck2tu5zKd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751043658; c=relaxed/simple;
	bh=6IBcgp8c9iNnYty7jyiM98ULbfTgUkV+C6tqG/352oY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bp+/nXbNRuNtBbXX7BYJOyEsyWVEwVTOC+wTikxHOu9oY9YgwAwy9ud14xW3M+TXkrMqP6wWHZUmBir7dYoeeD1HKazVeUitbZiWd9KUfMtRPIxwLHiwcX0hztY0+Npf82IpixIPOEtoSkdVuVdV/o9Vu3FRrRONv5d9lQdU5kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FBOCHWpO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FBOCHWpO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91F5DC4CEE3;
	Fri, 27 Jun 2025 17:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751043658;
	bh=6IBcgp8c9iNnYty7jyiM98ULbfTgUkV+C6tqG/352oY=;
	h=Date:From:To:Cc:Subject:From;
	b=FBOCHWpO8H7vVr62LxvqAVnDvt94wXLdgQ4CIQv6RQXP/rwL2I9Eu3i2qetrfoyyp
	 dF0AL8agsSFGCjMASOkEgnjwUU8W0KniUuoNAjhhcZ9H6IyUZ+jfV3AvmcxQyyytOQ
	 t1HRkkpg4dEJiiZBSYIWo/ZURUwt49dcUNF1QfE2JjarEMJuacPE5+/9cGAe6svdPg
	 zkDFRQ8NpGbmnSTTs4/22QzA0SanQxwXEiq2oeVShxtpNIwsGO+mcSTTjBufHgkmQO
	 DQXGeUt+iCenM4dYML9P9KwvMqeqvq0ApMf7QWXx3kEM6U7WihuucGCO6XAKKt9rhV
	 DvZiU9BcjjwMA==
Date: Fri, 27 Jun 2025 18:00:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 trailers doesn't work with imported series
Message-ID: <2491bc09-da6c-43dd-b8ce-e5c137294f68@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/uVp/nAYOpOWAH6p"
Content-Disposition: inline
X-Cookie: Avoid contact with eyes.


--/uVp/nAYOpOWAH6p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

With current git I'm seeing an error trying to shazam one particular
"series" (a single patch with a cover letter, which does normally work):

$ b4 shazam 20250627164348.3982628-2-mathias.nyman@linux.intel.com
Grabbing thread from lore.kernel.org/all/20250627164348.3982628-2-mathias.nyman@linux.intel.com/t.mbox.gz
Checking for newer revisions
Grabbing search results from lore.kernel.org
Analyzing 9 messages in the thread
Analyzing 0 code-review messages
Traceback (most recent call last):
  File "/home/broonie/git/b4/src/b4/command.py", line 450, in <module>
    cmd()
  File "/home/broonie/git/b4/src/b4/command.py", line 433, in cmd
    cmdargs.func(cmdargs)
  File "/home/broonie/git/b4/src/b4/command.py", line 105, in cmd_shazam
    b4.mbox.main(cmdargs)
  File "/home/broonie/git/b4/src/b4/mbox.py", line 842, in main
    make_am(msgs, cmdargs, msgid)
  File "/home/broonie/git/b4/src/b4/mbox.py", line 113, in make_am
    lser = lmbx.get_series(revision=wantver, sloppytrailers=cmdargs.sloppytrailers, reroll=reroll,
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/broonie/git/b4/src/b4/__init__.py", line 362, in get_series
    pmsg = self.msgid_map[fmsg.in_reply_to]
           ~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^
KeyError: '20250627142044.3872229-2-mathias.nyman@linux.intel.com'

Thanks,
Mark

--/uVp/nAYOpOWAH6p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhezkYACgkQJNaLcl1U
h9C9twf/UNQslGhqCxslgpTcHgmjyfm/r5AlOvf+tt6B1vVi4xGKnIvaQfoZKRBb
pz7PepGBabydLnn6Fvfj2tRfoUtfuhs+9S+n8Sf8LBZ21bfqgseZEWLnf8q6abS4
efYYobZdpvW73FD6I/XGiUCxCg5aQZT6bTJbLpl4z0WGOC6Y+a16e2dRgGpW78Ee
kZXqvBrvKxOLkN8WTKiBHtN1OwrWYpPQMzvSqDCw+Ry8qMlM1ljlA04bvmYZhyUU
1uHG2OvzIT+d2ewaQ+XL5CY8RW3vyAEj+vCyXNYKHm3I2yqLKiqjt60InAkE+RNV
1GA0pVjkIj7hgDc/4YVaB9kf+XB07g==
=bvMB
-----END PGP SIGNATURE-----

--/uVp/nAYOpOWAH6p--
