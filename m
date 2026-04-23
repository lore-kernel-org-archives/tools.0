Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015191FC8
	for <tools@linux.kernel.org>; Thu, 23 Apr 2026 11:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776943927; cv=none; b=SJBZiVLB+/fYqwH0buAtqUmUX9YVGP6JunjhHDARnlyomZUuZ4CUpU1jKFIyrUcwt4Pmb7wSM+43jGUIoGVM8qddxZ7eRfdVrJ8iiMvI7gHTn+d90UghwA1Qg6XcRBUitNj+d6/H+uXOIpVERiNbMMNy7wI3wBzhj2Y4SoPC1es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776943927; c=relaxed/simple;
	bh=T6h9EZNFm3aYPtfdWHIbazWVRjoJVh+ZRCgJ1PEhdno=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HFFeDwv18BAwONUaCUzy4umUHK3tfFKAdeSFp4+y/kuTfKOeWcNAbAvJeMyugwMUobFRO+Z7e9LmFt6+MYbh/eIjNCpCw7CbvDaTjJJIGEr2rPQAEIRkCuyN8gycT3QGQhtu20SHSb7wCU7rfy5g2a2cCjexMC1RAQ1GK9mDdgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pFREzy9C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pFREzy9C"
Received: by smtp.kernel.org (Postfix)
	id EE370C2BCB3; Thu, 23 Apr 2026 11:32:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42691C2BCAF;
	Thu, 23 Apr 2026 11:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776943926;
	bh=T6h9EZNFm3aYPtfdWHIbazWVRjoJVh+ZRCgJ1PEhdno=;
	h=Date:From:To:Cc:Subject:From;
	b=pFREzy9CiHr7gv/RMm1ODmiPGF9mnlLJiVYDznDsaE40ILp5+LHoRsm67aGepZw8u
	 SkzM5j9fqA30LTTdl5j+lvfPNJLRJZhrxeXbuY3WYl12PxLW2JhT6aeJY3kREcNjXl
	 g6eXkNWlOHgAbn7nwANjRDQZ4gQmVA+TqOXa1FAtCRcOFbylVqcZ7EsEmbvC1Dx5Hm
	 W9vc+TxnMQz0Ktc5he6N3GtKTI7jDnmevuosh2CQyoJC9x6b6MRRjTuY1EyQxJpKIk
	 mXC6eRSlvlrdu+RZa5epFVbfBQ/+rCSf96ei/m3MNUvCnhzZRE4KCcrpkfAIbxVsRm
	 YpPrMrd0UmAQw==
Date: Thu, 23 Apr 2026 12:32:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: b4 backtrace on startup
Message-ID: <7da1f1d1-25a3-4f8b-b56c-7f67c334c0af@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="awH102zwfyygj2ZF"
Content-Disposition: inline
X-Cookie: I'm hungry, time to eat lunch.


--awH102zwfyygj2ZF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Konstantin,

After upgrading to latest b4 git I get:

$ b4 review tui
Traceback (most recent call last):
  File "/home/broonie/git/b4/.venv/bin/b4", line 4, in <module>
    from b4.command import cmd
  File "/home/broonie/git/b4/src/b4/__init__.py", line 65, in <module>
    emlpolicy: email.policy.EmailPolicy[EmailMessage] = email.policy.EmailPolicy(
               ~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^
TypeError: type 'EmailPolicy' is not subscriptable

(running on Debian stable, in a venv - I tried upgrading all the
packages in the venv.)

Thanks,
Mark

--awH102zwfyygj2ZF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnqAzIACgkQJNaLcl1U
h9CUfwf/VYYj+2YvtRzLGZde56PRc/PEuievmyXO2hiM1ZL27t5Kdt+UNKaT4sr3
fc3XBGhitrgE5ItqmCYJdbAoKANlMh7IPguQTTMxTvlQM1CMtSJpyeLm01kuSHpM
NSRfuGu6pzFcBN2o98b8aykeFudrSdN24va4N+MzkmLahiEi9fQ/9v3maRqb9/v+
j2N6Aw7OQemhuiR3qnUwIIB22L1XH0nSuC+RX7dP6JtJMqRU/kD+7wu78BE9PAQG
luUIoEaOyljJLjyPdfk1hWMcaigFwBq7j93bSDXsFWjmNjtuNJrBS+8p7SVjkWrd
2XlpmdNxB6F8lXpc+PLDphf/eNGQzA==
=QOnH
-----END PGP SIGNATURE-----

--awH102zwfyygj2ZF--
