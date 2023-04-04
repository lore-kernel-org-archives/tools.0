Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A92528F3
	for <tools@linux.kernel.org>; Tue,  4 Apr 2023 17:12:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33124C433EF;
	Tue,  4 Apr 2023 17:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680628328;
	bh=1rbEmAFYTQiaFx5LxDGDgcJuP31nzUedQ3Zx4crWmw8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RQujKoB9eG1p5yQLLDIUsfTMfPZcs1r7J1MrUdrmndhDW+LPoIzXdEA7tWe4DSDzC
	 a4VZHBTziQ2IlqGErIRrDAprhu6WaaUiViwJc/r1Cdmdo/xGON9J4S9hJTa082qBtB
	 3y/ikbyPHBauU9GQwM6DCOCUti+xRsoQnLRyNwKR6Z3RDHMimYZT1tAagNXO7VpVC1
	 TCZZyMupNwRmuG1PTDAOSi08UZhhbVDSUXCrPG5uoUiquJQJQKsMCFF7+gmnEyWsOq
	 fNpZVbn3wxEO/eWDYiErXzdlq04KCiqp2DXXb05dvMcgLY8HK5eDEK573SDH2y7cNW
	 0bEseIJ+S72Yw==
Date: Tue, 4 Apr 2023 18:12:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 having trouble parsing recipients from cover
Message-ID: <3a74ab04-8056-4691-8892-f19abf985ff6@sirena.org.uk>
References: <gmnswy45efztvcyc3xqymm52h7cdfwjz64go2wy3zyeqcqwb76@36fva4hyip4q>
 <b38de7ff-3de1-cd4a-a532-66642aea587c@leemhuis.info>
 <20230404-bacteria-refinery-a97393@meerkat>
 <ZCwlhTvZhpVXBj6/@sirena.org.uk>
 <20230404-tummy-lusty-057598@meerkat>
 <03f33806-d61f-47ce-9c0c-f3cb0a7a6302@sirena.org.uk>
 <20230404-oblong-mower-6b4fba@meerkat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XQ7dahpNFpiVmowb"
Content-Disposition: inline
In-Reply-To: <20230404-oblong-mower-6b4fba@meerkat>
X-Cookie: Being ugly isn't illegal.  Yet.


--XQ7dahpNFpiVmowb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 04, 2023 at 12:51:15PM -0400, Konstantin Ryabitsev wrote:
> On Tue, Apr 04, 2023 at 04:03:54PM +0100, Mark Brown wrote:

> > No, same behaviour (I just added a line with a couple of characters
> > rather than a full subject).

> Okay, you can work around this by adding --- between your trailers and the
> changelog:

> 	Signed-off-by: Mark Brown
> 	---
> 	Changes in v2:

> I'll work on returning a more sensible error here.

That seems to be working, thanks.

--XQ7dahpNFpiVmowb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQsWmIACgkQJNaLcl1U
h9CJVgf/bLK8wXGJ8aJE62tyS2q6xEOvLHVxkPZjAjE/9uZejB1fTL1AZk2XmhPP
N+LauqailYJCdTWTrFLm065V2E/IrGimn8jiMdYzZJGTfKGcO7HBu0UtSz/J2v7+
8EkhRVRLkziW5fDgS/gBvLEHhtgdG0Gz/rsyklovMWh2k6azYemxgAy0wfJZj/a7
/AH9TcrwEchpfENYoKL0KyLnjFopCkH/s8y9nmECb0rLDaTGHtHZw4hc/PFRmak6
66Jj0GgdSGQuh0h635fUnUk5yH6K7nXhifmtvA3sn1bg9wP/w8X2HIzQRL9j/Oqr
eXdK+/ohrounAK0XmJuG+qvMzeM70w==
=Q7uC
-----END PGP SIGNATURE-----

--XQ7dahpNFpiVmowb--
