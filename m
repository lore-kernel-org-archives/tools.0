Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web10.1998.1588183784786689928
 for <tools@linux.kernel.org>;
 Wed, 29 Apr 2020 11:09:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=HT6aQxPp;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: broonie@kernel.org)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id E59682064C;
	Wed, 29 Apr 2020 18:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1588183784;
	bh=AYAiCgwC640AgZh2nCo4sBpK5RblXzGegQEmhHHJglo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HT6aQxPpp09cIyi8d6KrTs/sPoySnCi2OX8zYiUVybGUQ+EqbuYXwOeA/gKGfFPCC
	 iAtq/2p59wVsmchy+7f4ZogJGmqiwf+/7U+gDuHiUNO45fUvTq2Ewr9bj3qbzilQR9
	 g13t04TaS3ycwGPz0IxqzptSD+VwugzluZjGS7RE=
Date: Wed, 29 Apr 2020 19:09:41 +0100
From: "Mark Brown" <broonie@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Junio C Hamano <gitster@pobox.com>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: [kernel.org users] What is a useful way to show changes between series?
Message-ID: <20200429180941.GQ4201@sirena.org.uk>
References: <20200428192938.aue3v6kxsm47day5@chatter.i7.local>
 <20200428193550.GX26002@ziepe.ca>
 <20200428194419.i2gamyjgbilp2x73@chatter.i7.local>
 <20200429101309.GE4201@sirena.org.uk>
 <CAPc5daUXCRv5CN9cVdGTgAWinTEFB0RnMF27MA5D4dOMiCCk1A@mail.gmail.com>
 <20200429175049.GP4201@sirena.org.uk>
 <20200429175844.GH26002@ziepe.ca>
MIME-Version: 1.0
In-Reply-To: <20200429175844.GH26002@ziepe.ca>
X-Cookie: I know how to do SPECIAL EFFECTS!!
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Groupsio-MsgNum: 129
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cnBsrynPgIOyCJkL"
Content-Disposition: inline

--cnBsrynPgIOyCJkL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 29, 2020 at 02:58:44PM -0300, Jason Gunthorpe wrote:
> On Wed, Apr 29, 2020 at 06:50:49PM +0100, Mark Brown wrote:
> > On Wed, Apr 29, 2020 at 10:42:01AM -0700, Junio C Hamano wrote:

> > Ah, indeed I think that is exactly what I'm looking for!  Sadly it is
> > not documented in the git format-patch man page so I hadn't seen it,

> So if we use this, should we set the --base to be a linux-next tag?

> Is that reliable enough?

> Can't relly use Linus's tree, and if people randomly choose their
> upstream's then it defeats the whole point :(

Personally I'd just not bother specifying a base if it's -next or
there's platform enablement stuff in there - I do send a bunch of stuff
that's based off directly off a rc or something in a maintainer's tree
so for me it's quite useful.

--cnBsrynPgIOyCJkL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6pwuUACgkQJNaLcl1U
h9AUywf9Gp/PqKDRHrmDKDfWm0IU+Fm4F3h6PGTTHIO/7vMF+LZXVWMFEvAwDVpM
18HtQtIoiYI+kdy1SX3zWfyrSkYdtvScgRkyomxc2Bxw0NuYLWL/TawL+MNIcVYa
ihxdNqaEtsTJu/Ef6TGuCv0DBH3IiVRFpNu4MCfkHKXHSdkLlvbNI3F/oRxmSHw9
sM2hLOptmAT/8w6YS1VTK4sAJ7vTn8PG1N+1CYg2gkTz5SXg16i7aLqhJzII4zVR
ztHTstvRZcSZSxnSyDi7YcRbD/bZJ/Qd11VYNKp5dQdJrlSpYXIoFtCj8gjhWgNh
aVlNS5SCfhniHpOkIls+62vGZzw9Gw==
=J0mj
-----END PGP SIGNATURE-----

--cnBsrynPgIOyCJkL--
