Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D323451069
	for <tools@linux.kernel.org>; Sat, 28 Feb 2026 15:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772291551; cv=none; b=rH2sEoIrJg+h6XzqJScu0t787lSFEZ0RuklqW9bmYCz1ArU2EGVrYuruVoIOZHP/pXZjjye6FvCxkEb+kkBUxjOhyVLsqA2eTg2kjDSieWCP6UK60AECSscaBxN4XSnvNZV2yLYVfbiCal79C10WRu6OQ15kAlZBrTv1w5t8bWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772291551; c=relaxed/simple;
	bh=dui350kHAd4TTqPxziYx7kiIVig/iDPIDRkaXsilY9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X053BNhKvo4tW5dE4UMv8SRd+MKC8/bDcmow4QWAATH41aoYCL84LbnJRoZ1bbzxi0kEbf8KZnchfzOPgTYgJgECmb7raq9P7wzUkpaAq7DhFsyERLK1+0drCvhmDVvl5P7jI7jH0sDTFYl6KKvEMyhv14PYIclzKn1BBdARAQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bu/GonH/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bu/GonH/"
Received: by smtp.kernel.org (Postfix)
	id 343ABC19424; Sat, 28 Feb 2026 15:12:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3F2FC19421;
	Sat, 28 Feb 2026 15:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772291551;
	bh=dui350kHAd4TTqPxziYx7kiIVig/iDPIDRkaXsilY9Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bu/GonH/FgHYQ9pmaek7FHkbC8Xi3pEWDklikJ9TdRuvPmMkSWBp8+uoKjQirnHM9
	 1tpNLfHoD8DOvtg/hCAj+giF6zquQtIcpM1zYZSNYCGGf2aIE4s+rtDyD+HSIww44L
	 T9jPabuAuJOUIO5NFXLayWuxUP/Kjn/E1cViJTrQt/lx4XmhU2EiSyaneXze5hrk1S
	 gJtNVbm+/9221vQjX8Jsvkx7SFbOfcsIRVYFHNRKlEyzi09h7Jdk83wqO+9ldVARwo
	 4LBPquUN67wYsmZkSqJty0ePZ98UkGBDLHQ+JE+CKhD6QyRV/00XBI41APmKG7SDI6
	 QJi3L2ixei3Ow==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 7CF7B1AC597B; Sat, 28 Feb 2026 15:12:28 +0000 (GMT)
Date: Sat, 28 Feb 2026 15:12:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: b4 review available in master
Message-ID: <aaMF3GQvC26DsqQf@sirena.co.uk>
References: <20260227-imported-aromatic-guppy-ad3dca@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="roFMPvooowEXL9Vi"
Content-Disposition: inline
In-Reply-To: <20260227-imported-aromatic-guppy-ad3dca@lemur>
X-Cookie: Think big.  Pollute the Mississippi.


--roFMPvooowEXL9Vi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 27, 2026 at 02:53:07PM -0500, Konstantin Ryabitsev wrote:

> The only new dependency introduced is python-textual. I say this with a bit of
> tongue-in-cheek, because textual pulls in a ton of other dependencies, but
> it's usually already installed on many modern distros anyway.

On Debian stable:

    class ReviewApp(App[None]):
    ...<1351 lines>...
            self.push_screen(HelpScreen(_review_help_lines(has_agent=has_agent, has_check=has_check)))
  File "/home/broonie/git/b4/src/b4/review_tui/_review_app.py", line 138, in ReviewApp
    _GRP_REVIEW = Binding.Group('Review')
                  ^^^^^^^^^^^^^
AttributeError: type object 'Binding' has no attribute 'Group'

where python3-textual is 2.1.2-1.

--roFMPvooowEXL9Vi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmjBdsACgkQJNaLcl1U
h9DULgf+L13HtH2yYQK2s3hRS+cUXvtCk157c4Bv5nh3NBS2cVt7zS0EJqRKwNFp
JVcOA4rwgLOG0QJJToohqB3eGUTgYsZR8y38vJCUpDprHnMeoENMuUEoq3ynSpOl
0HZczqAF0NcZLf2UnF/+SknrgUVmPacN2SAyBLd4BMCQWLKf0gBrXbkF6kYQx03v
9h+gvLda+ztHC3TgKI/p5mIOVG7GiKYdp2Cr7kJa/oVh7MEQ3UNZ4Hku1p0N7651
AGgpcfetmlU/AIB+tzvJs5MJ/jpqQ9PZFu0eBA3smtp8amkriRoQ+J622AVNJ0tJ
OJYIOn7nhYDCR4vq1UlmJFgt4yK7iw==
=0/4A
-----END PGP SIGNATURE-----

--roFMPvooowEXL9Vi--
