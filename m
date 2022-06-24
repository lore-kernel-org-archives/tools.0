Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7E933E9;
	Fri, 24 Jun 2022 16:16:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E840C3411C;
	Fri, 24 Jun 2022 16:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656087400;
	bh=iIZ9hc6OrU4/u6XVkIyfP4YUSitbqK2n+VyBXhCKK9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YOzjPZEYotHpVOapqlTg87l6vI/BPri2phuxPHh97ATJd3V9bVt69TkWTsex+yXdg
	 n/Z7+oC3B7Oe8HB5hUk+Or46MI7KwjrFpsbzB9LHzx4oBq3/KdvuCzJcL5hQ8aiuq1
	 lp1y0/vyoXBk12R8a3dQdmXFWFCsllwfhfV7jZj9AQh2i6F1diND19c1RJ82MrrEN8
	 C745Fa4Awi2tG3szy/CHnuBXTK2TwTyqsrXwNz7LSzc1QysuJXa74fr1PtGlAYfcHL
	 s14sMxAVT/tDX/MS00FOdFFLhN2tjysg9ytUN79uj2sKhN9yIBlkbWaQpewAu2GLHe
	 MCc30yyYYRVeQ==
Date: Fri, 24 Jun 2022 17:16:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Theodore Ts'o <tytso@mit.edu>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linuxfoundation.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>, tools@linux.kernel.org,
	users@linux.kernel.org
Subject: Re: b4-0.9.0 available
Message-ID: <YrXjYmNoCZ+X0SOM@sirena.org.uk>
References: <20220621165953.z25hwos7gom6bp6s@meerkat.local>
 <YrIEnmt5vDMcbOiG@zx2c4.com>
 <20220621182953.p5asczznnz3pn6dl@meerkat.local>
 <YrIR2v7GdC3qIt2E@zx2c4.com>
 <YrI3W46GUS/Dap5J@ripper>
 <YrT4LIq6ssD1mhMQ@mit.edu>
 <20220624135147.GA23621@ziepe.ca>
 <YrXYaE12VFUDucsN@mit.edu>
 <20220624155213.4wfbnttowgom2sjz@meerkat.local>
 <20220624160628.GB23621@ziepe.ca>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zr3Uk3sVj661Cagt"
Content-Disposition: inline
In-Reply-To: <20220624160628.GB23621@ziepe.ca>
X-Cookie: Help!  I'm trapped in a PDP 11/70!


--zr3Uk3sVj661Cagt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 24, 2022 at 01:06:28PM -0300, Jason Gunthorpe wrote:
> On Fri, Jun 24, 2022 at 11:52:13AM -0400, Konstantin Ryabitsev wrote:

> > 1. b4 submit --new: this will create a new tracking branch and define
> >    some metadata to go with it, such as a cover letter template. The cover
> >    letter can be edited using `b4 submit --edit-cover` at any time.

> It would be nice if this could store the cover letter in an empty git
> commit at the top of the branch.

> At least here we always require cover letters to be reviewed (eg in
> gerrit/gitlab/whatever) along with patches and having them stored as
> notes or in the branch description that is not git pushable is not so
> useful.

Or at least something that's easy to move between machines (eg, desktop
and laptop).

--zr3Uk3sVj661Cagt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmK142EACgkQJNaLcl1U
h9BCcQf/dGC6sNTkYSRzwIHMuKX7xQAwWI9F5ScQn/KRv8HiIlx14gNvUxDVnGny
xn7NUHQFjKwWR/LOUPQd+ekmfcpOvYKF59OZYWJzsuYcBKIK2qi/FkFeR3aKRoou
1t9gkYn/eJ5rU6QZBDm0kCiE2aKX7NsGlZeyrK7kvaFUzbJqu09NnwTrsIR4kNNk
kZzwZzhnJSNYesb9aD5Zv5oigiiFwG1aM0yzW2PhdqkAG1NrH3A/Vh5pTFCzoqH9
daZvGS4JFgEfShl0tYm2yFNPVx1zgfiJ1JNSIRPcPjXj16/VpN4dMovXQ/FKi7yY
MOeBciTGScPo+hfuitpx7hpo2HHgcw==
=nxNc
-----END PGP SIGNATURE-----

--zr3Uk3sVj661Cagt--
