Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5AE33C1;
	Fri, 24 Jun 2022 15:34:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F385C34114;
	Fri, 24 Jun 2022 15:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656084896;
	bh=o4skhySFQNMElYkcUH+gyqn5E0MWmsKVv0D3mBrtAzI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oEuArpqLeNVX7dT+eU+/6XNQqW0/XqPg8r612iybdnNK6wATOkNM9gzArownJav8P
	 mvlsL/9NtXqF7g/xsqV8+BgGY93YvpdPewLQyK5oZcbveoFAEZl0J9EXU2iPcbBHFW
	 DdU/4nXBR4JeakoUyLuBc9DixvFQqctS4qbDzSFoU14GiJERwDThAhXC0a/bOL9mFW
	 yGBr04Eu/ie7xvcGb75ufCYRrf+L2hENVPb3o0nsTKHYftDsndLkwgTx7jdbgmR+TQ
	 gfmY8+SUxuNYeKoDmzxro5oOmO7ClhZuyRdjA/MlBUO7AdG5tmhxOjDna9neun36NC
	 pWNKx/AvhgEjQ==
Date: Fri, 24 Jun 2022 16:34:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Theodore Ts'o <tytso@mit.edu>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Linus Torvalds <torvalds@linuxfoundation.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>, tools@linux.kernel.org,
	users@linux.kernel.org
Subject: Re: b4-0.9.0 available
Message-ID: <YrXZmtwm705pSkuG@sirena.org.uk>
References: <CAHk-=wiQzp+aurcmj15=LAa2ntvRZH0Ee2dn-PLjcFpmRE6Jcw@mail.gmail.com>
 <CAHmME9p+zRErOsvA1zC=kTHtpYD_sGjFxVsj0pMwteAp4dCdjQ@mail.gmail.com>
 <20220621165953.z25hwos7gom6bp6s@meerkat.local>
 <YrIEnmt5vDMcbOiG@zx2c4.com>
 <20220621182953.p5asczznnz3pn6dl@meerkat.local>
 <YrIR2v7GdC3qIt2E@zx2c4.com>
 <YrI3W46GUS/Dap5J@ripper>
 <YrT4LIq6ssD1mhMQ@mit.edu>
 <20220624135147.GA23621@ziepe.ca>
 <YrXYaE12VFUDucsN@mit.edu>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Mc+Ov4ePCQ0CyJjh"
Content-Disposition: inline
In-Reply-To: <YrXYaE12VFUDucsN@mit.edu>
X-Cookie: Help!  I'm trapped in a PDP 11/70!


--Mc+Ov4ePCQ0CyJjh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 24, 2022 at 11:29:44AM -0400, Theodore Ts'o wrote:

> It would be great if we had some kind of tooling where when someone
> sends a new version of the patch series, the tooling opened an editor
> and allowed the submitted to enter a quick changelog of what changed
> between the v25 and v26 version of the patch, with an option to also
> edit the body of the cover letter.  And then then when the patch is
> sent via e-mail, all of this would be appended to the cummulative
> version of the cover letter.

I gather some people use patman for that already:

   https://gitlab.com/u-boot/u-boot/tree/master/tools/patman

(I've got my own thing which predates me knowing that patman exists).

--Mc+Ov4ePCQ0CyJjh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmK12ZoACgkQJNaLcl1U
h9B60gf/Ywd7xcwa2nQB47apGKjF5LpxdWkNIB3xYjqG6RKjTAfJzjkQbukgOnwq
UtVwb0y3dvGr1hLSYzO7N/HIVJJaPYIswTlAbmZhUWE/USO3yMzzFyZnix/O5kfQ
Alaa66vgjkUjjBOGrlA97xRT1ptYMeAPAAEnEe3H4G5SfH7pFRvr42gY25mWVXjj
5DgMh27vKh9rfE1JesAdtOmXnrp8VRj70B4wEYpaCByRhPgbTMuCPWkzukdhjL3A
ZB5uQqMQNnQJ+e/ep97Koxq38BvWGnqEEs5qTNH4bDSCPbnwpl+ebKsAMUNm2f/0
rhXt9jS+e9eOWFIoVsUUOYpO6XjYQA==
=j0oc
-----END PGP SIGNATURE-----

--Mc+Ov4ePCQ0CyJjh--
