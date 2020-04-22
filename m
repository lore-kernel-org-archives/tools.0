Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web10.2430.1587564400249476017
 for <tools@linux.kernel.org>;
 Wed, 22 Apr 2020 07:06:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=YygDO85l;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: broonie@kernel.org)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 310DA20787;
	Wed, 22 Apr 2020 14:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1587564399;
	bh=tjkkWkisoP1MrwzjaIMHCGbVsEAM4KlNWehtbhaNwA8=;
	h=Date:From:To:Cc:Subject:From;
	b=YygDO85lWokoq2ywK/wFnZP+LA4cf/LC3rV7SrCgGKaV/NY/off8RZPNYUeZqzTc4
	 dvvxs7fDjbbgZk+0/yRSCQzLMrnIdnGl8U4SGXEy9YU9hnQKcnoxRL1VH+/Isd7ntt
	 pAainBNTDpKJM54kQWUxQGeZuOF8od1NqxijrdsI=
Date: Wed, 22 Apr 2020 15:06:37 +0100
From: "Mark Brown" <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: b4 ty doesn't respect -b for prs
Message-ID: <20200422140637.GI4898@sirena.org.uk>
MIME-Version: 1.0
X-Cookie: A stitch in time saves nine.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Groupsio-MsgNum: 97
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uJWb33pM2TcUAXIl"
Content-Disposition: inline

--uJWb33pM2TcUAXIl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Konstantin,

When I run b4 ty to generate thank-you letters for a pull specifying -b
the program doesn't find the merge commit:

  $ b4 ty -b asoc-5.7 -s 2
  Generating 1 thank-you letters
  Could not get merge commit id for [GIT PULL] ASoC: tegra: Fixes for v5.7-rc3
  Was it actually merged?

however if I change to the branch it does:

  $ git checkout asoc-5.7
  Switched to branch 'asoc-5.7'
  $ b4 ty -b asoc-5.7 -s 2
  Generating 1 thank-you letters
  Writing: ./thierry_reding_gmail_com_git_pull_asoc_tegra_fixes_for_v5_7_rc3.thanks

(asoc-5.7 is for-5.7 in my sound tree, the merge commit is now published.)

Thanks,
Mark

--uJWb33pM2TcUAXIl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6gT2wACgkQJNaLcl1U
h9DZFgf/UfpKR+bI/rHo5kvksKCqiz+XzuBcYOlK+Ao5Ug4cY8OfT4LzIxh6NXCs
1JUCMvWBVlEF3N78Z93Nq6qxXpcIoGcMDPZt6mnqZ6UQSVh70gAPI+ZHGqK6TWko
c18uoztdMPiT1CE0zSQCTV8Vbfnc19HLPTcGw58W2crmg88ipzJbrI7KjJl5CI3z
H4TlSH43fzxFelegH756NJRGwBqtNIUSqX63M8jrRKtnhW7vu85qWsGqqRnT2hLO
LUt2NqotU/O7QA1DlB7TjkKo8OIN9ym4QVP7y0Y82olXa15wvpLDCIdmU4i7zJam
YM1S0kzz+MGvsY3ZtsNJ/UqoaJSlww==
=K8zM
-----END PGP SIGNATURE-----

--uJWb33pM2TcUAXIl--
