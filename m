Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web11.3502.1587637056226657656
 for <tools@linux.kernel.org>;
 Thu, 23 Apr 2020 03:17:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=WYSP8pum;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: broonie@kernel.org)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 2D6DC20704;
	Thu, 23 Apr 2020 10:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1587637055;
	bh=jye/9OIjCvArxpD1rau1AOOo2suBsCYl62i9AcPyBUE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WYSP8pumFiy0XXoqNKKaEK2sPvLN/Aepnk7rzrxXFe50cUSwheN82cIKaytvSRaBi
	 L6uMRezMEkNLfk0aZXgFh48B8TwQ3k03RMnvpXiWTkFpjqvk1QTBckq5rsiNDFuZbW
	 yvRBr+jmnVgZPk1DGM+awqFvzAh09cJZeyQoIaYs=
Date: Thu, 23 Apr 2020 11:17:33 +0100
From: "Mark Brown" <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 ty doesn't respect -b for prs
Message-ID: <20200423101733.GA4808@sirena.org.uk>
References: <20200422140637.GI4898@sirena.org.uk>
 <20200422224345.jx7f6w7h4aisae6v@chatter.i7.local>
MIME-Version: 1.0
In-Reply-To: <20200422224345.jx7f6w7h4aisae6v@chatter.i7.local>
X-Cookie: This unit... must... survive.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Groupsio-MsgNum: 99
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TB36FDmn/VVEgNH/"
Content-Disposition: inline

--TB36FDmn/VVEgNH/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 22, 2020 at 06:43:45PM -0400, Konstantin Ryabitsev wrote:
> On Wed, Apr 22, 2020 at 03:06:37PM +0100, Mark Brown wrote:

> >   Generating 1 thank-you letters
> >   Writing: ./thierry_reding_gmail_com_git_pull_asoc_tegra_fixes_for_v5_=
7_rc3.thanks

> Good find -- there is a fix for this in master.

Thanks.

> > (asoc-5.7 is for-5.7 in my sound tree, the merge commit is now=20
> > published.)

> I see that your message says "undefined" here:
> https://lore.kernel.org/alsa-devel/158756395814.23495.171205742201395813.=
b4-ty@kernel.org/

> I'll see if I can find something nicer for it to say instead.

I'm not sure there's something fundamentally better - it's basically
"local tree" and not all of my local branches are tagged as tracking
branches in git.  Should've proofread properly before I sent it out.

--TB36FDmn/VVEgNH/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6hazkACgkQJNaLcl1U
h9Cgagf/X3q2ZXORp7vJ3dRPoK0ZIldyf17w3RHX8581HlNm3MDDxzbgKJ+tDSfH
udziL5oo/Oe12aRPu3uV3e5uAIiAxtvbKABcD1VjG8kQEKAbkl4Fd/ijzkZnLiik
p1c/J6GAry77tFUZRCHQnBa1MjeFrCrSVp8w4sAR4KzWfAoB8ExGP2KiwAjRS/bA
+IejOSAH7ivsumNqGhxuPAJKA4a9f56O9OcX6E79g5/PKK2yxFa3BB4CO4V522sC
o3sbtR9mct4YJQ82t5DclH0132r0USboK8mJ3ou22PnlbnvfaQpyg0MqanxWtLuL
QhW9mFjw3+4yUrbs9VL23P/hsVVBEw==
=g8aK
-----END PGP SIGNATURE-----

--TB36FDmn/VVEgNH/--
