Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EDF18E030
	for <tools@linux.kernel.org>; Tue,  3 Sep 2024 18:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725389240; cv=none; b=OrxPngDf6oW8MPGfoB2sUy6Q86qyl+/leaOXH1vK25+yPNdhA9yOSy9bQ5V3clZw1wWkjtWafAEkc+rlo+EAoWDgdIhZP1eaf2uYUfEkLRHW6d2DQe0p3XFT3ewU3XHftWLeU331PBKBXIbcvpA+YIo3jy7+IwScnRSEu3nsU2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725389240; c=relaxed/simple;
	bh=N3ZDvNLTaAdvoD0I/5ZMzMMgWibUi6+QmXD52WtjPYc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bH5CYkF6zqqbIVB5jV00E+Cwd/aOh0lH7+zl8tY+n0LylULxRRpOx9uFrCs+yAwaGeUwLVYyDSbEs153sZY7RHmPPOO5fEGvOpt8J1LfYy5SM9LTkWIu3XyCNSBcQU+AMy4aw0Fjo2vHymKsMQFg4ZEGLAFSpai4nE3Pw2q+CJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VCEsPgg7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VCEsPgg7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CA17C4CEC9;
	Tue,  3 Sep 2024 18:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725389240;
	bh=N3ZDvNLTaAdvoD0I/5ZMzMMgWibUi6+QmXD52WtjPYc=;
	h=Date:From:To:Cc:Subject:From;
	b=VCEsPgg7+3SH8+nJek647a8BPJzs1VFU9NPYMVohhmkJ0Wo7Q4YnugyEKdgL6xJDG
	 6VGFlvffIYCePU/LojsJi0p0/YPmUTkswCV8EtM1KwiAGPtyjSOVmhX9szHTV4uD/J
	 HtqtW9apNRXKupiuueA2qYtTxV/xVLPhxoPd+DKz9BavKGPgZ7oBKOdTFvKNkrSZ0S
	 rRtreAB9i1MeS19Q6ZsGdMsQFT4r8+5xVhjs0wKB75qGLO2yAWgO6W0QelnexKe5RW
	 cS+kcJwT1OHtNipjCetUXzDYjR+4DJDmqCuCW/Cw2NOdh/2UHsAP2h5Vv6o5eB4VJS
	 R/UPUySkLXoMw==
Date: Tue, 3 Sep 2024 19:47:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: b4 prep --check for signoffs
Message-ID: <fc6eba60-6cde-4e8c-a075-61d564c33e26@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BupyfzboG/w+k8G1"
Content-Disposition: inline
X-Cookie: Words must be weighed, not counted.


--BupyfzboG/w+k8G1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

It might be helpful for submitters if the checks implemented by b4 prep
included a check that there's signoffs from at least the author of the
patch and the person doing the sending.

Thanks,
Mark

--BupyfzboG/w+k8G1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbXWbMACgkQJNaLcl1U
h9CQtgf/RgoU6D20Jzx1KBMYGSN9G6E1YCFLsolKo6XXr61JfzvbvAaZV9sFywNs
kilPtPy0QdX43PO9CGRjpTyQQKdnHxReMTy9bxckOZm516/753kI00rdP0N3BzgW
Y/ip+WAQrsVWKnUJjKTDF8nFXvSqM3FxmEROGdWQmtTLVnJaSIc7aNYOM0uuAYeo
Qva8es2jWADgzvJnsW2BSGQgIU72rRjTGvXrokbdOdPwmsuUSlLkecMuNryL9cSo
oyC//KBBPm87nofiKTNT67pkJRPJ2b3qjws4QBDfaQ6B4zOuMNUmQYZb+GfWCeUu
BrwhAYwfA2m2UiSJO7gkiu3BykP5/Q==
=gdSI
-----END PGP SIGNATURE-----

--BupyfzboG/w+k8G1--
