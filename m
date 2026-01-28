Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6CD329C77
	for <tools@linux.kernel.org>; Wed, 28 Jan 2026 20:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769633701; cv=none; b=uRSshXqxuXbZifGu4MuJLblAc5ibDlHEoj/n6om/pTZrRYcMYw1TqLb3wPW424iZMzsXeGkmIW6+oaHJJy/k8jBpJJFMRCA5me2yF/OyuDMdv9ueZN5d8Cj1MpLVPUGAxmwWsQYmAt0wyTDMrebdT0/L4OSpHcyhSGdaRQ+7RgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769633701; c=relaxed/simple;
	bh=ogPxkI5nss+fhuUGSzJRc0GfUBVWEVB4Ayzofv+u+5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L/UeB+vruxvEqUF35Fe2qeGDwNJpUlw+Sc8AlFoJ4lSCe5i95MMfHFQAWRVarWkC5TqZAvE8+vTMd2zm2k/6NQCA9VflBfOsGMl0LDDxgl/PJLYyIxMiSnqGDCdm1REuk8JZY7KvdHmVl1lu8MIHFmBecWFOma0KcJFjUZrPSbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pM2klWm5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pM2klWm5"
Received: by smtp.kernel.org (Postfix)
	id 10EF2C16AAE; Wed, 28 Jan 2026 20:55:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48887C4CEF1;
	Wed, 28 Jan 2026 20:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769633701;
	bh=ogPxkI5nss+fhuUGSzJRc0GfUBVWEVB4Ayzofv+u+5Y=;
	h=Date:From:To:Cc:Subject:From;
	b=pM2klWm5XNhg5q1K4jFDtGa62Cb08bRehdDF331ExE2ybD8rvBpZwHzqIyXlQPbQj
	 QuoqZln8kdVf11C77wxmj6AZGi3xAJxikJpaPpa2PGdcQB/Jf2IjgvoaSmX3fZdoBl
	 lsAaMD+tJomKEfYrEBm7GYXG57YkTkGBraQMxTu21jK4xAFoP/dHE4qvUVBs4UL7yr
	 DUtdp8m6DbaMfaK7pdmBCb6n+26W8fmNY44cMSPaREJPxR2LSMs6rfcN9RAMSFl1nR
	 wuFnQhKNYojjQr6jeGktIDhqv+qnmZ0Z3mDUkt3nhCP2Ez9afNGdibq449EFBLHDoO
	 Mk4Ff3I/rqaCQ==
Date: Wed, 28 Jan 2026 20:54:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: tools@kernel.org
Subject: kgl track-subsystem crash
Message-ID: <e2416f79-9bfb-4f72-8751-f300e9922223@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YRJ5MHcxU8UgDTB0"
Content-Disposition: inline
X-Cookie: APL hackers do it in the quad.


--YRJ5MHcxU8UgDTB0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

With v0.5 I get:

$ kgl track-subsystem 'LINEAR RANGES HELPERS'
Found subsystem: LINEAR RANGES HELPERS
warning: No mailing lists found for subsystem
Creating patches query: (dfn:include/linux/linear_range.h OR dfn:lib/linear=
_ranges.c OR dfn:lib/tests/test_linear_ranges.c) AND d:7.days.ago..
Traceback (most recent call last):
  File "/home/broonie/bin/kgl", line 8, in <module>
    sys.exit(main())
             ~~~~^^
  File "/home/broonie/venv/korgalore/lib/python3.13/site-packages/click/cor=
e.py", line 1485, in __call__
    return self.main(*args, **kwargs)
           ~~~~~~~~~^^^^^^^^^^^^^^^^^
  File "/home/broonie/venv/korgalore/lib/python3.13/site-packages/click/cor=
e.py", line 1406, in main
    rv =3D self.invoke(ctx)
  File "/home/broonie/venv/korgalore/lib/python3.13/site-packages/click/cor=
e.py", line 1873, in invoke
    return _process_result(sub_ctx.command.invoke(sub_ctx))
                           ~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^
  File "/home/broonie/venv/korgalore/lib/python3.13/site-packages/click/cor=
e.py", line 1269, in invoke
    return ctx.invoke(self.callback, **ctx.params)
           ~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/broonie/venv/korgalore/lib/python3.13/site-packages/click/cor=
e.py", line 824, in invoke
    return callback(*args, **kwargs)
  File "/home/broonie/venv/korgalore/lib/python3.13/site-packages/click/dec=
orators.py", line 34, in new_func
    return f(get_current_context(), *args, **kwargs)
  File "/home/broonie/venv/korgalore/lib/python3.13/site-packages/korgalore=
/cli.py", line 1872, in track_subsystem
    first_commit =3D feed.get_first_commit(epoch)
  File "/home/broonie/venv/korgalore/lib/python3.13/site-packages/korgalore=
/pi_feed.py", line 399, in get_first_commit
    raise GitError(f"Git rev-list failed: {output.decode()}")
korgalore.GitError: Git rev-list failed:=20

Thanks,
Mark

--YRJ5MHcxU8UgDTB0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml6d6AACgkQJNaLcl1U
h9AqgQf+NLSwhdkDZFII8lvCYWy0yRz+PZzL5dger2pnJP/YMtwUJoxAkcHi0o/O
HQIv2SqS3x9afNoLXi+FXv4xiO0dT/WkSEcP/CPSu4LhekOtdRcTQOFiOPF/dHeL
EyCWWt5nm0Scj7fxsP/qfkak6aRvGxyX5ixNLeYHkeyakG9j1osPhieZdCEVZW2m
r64iPn/lFQnlDCWZ7PgqWJDM8wDmPqLxUAY6O6ytaDNDuUqB/rGdeY4KUDS9HCwJ
3Y2ZQMGN2afJmM4xhDtd9xnRNEppw7waPkiugZ043oXA6Xu2QVxElfDrSSHWEDr1
aUkoftvdGg9qFQWwJNKh18UqxZTfMw==
=wLeN
-----END PGP SIGNATURE-----

--YRJ5MHcxU8UgDTB0--
