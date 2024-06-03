Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A43820317
	for <tools@linux.kernel.org>; Mon,  3 Jun 2024 17:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717437100; cv=none; b=aQPyTwPpv1J6t1/Xp0urkZwaZOM2Ah/kGu7+1DBTcPXrWrC5fePShKxSIlAT3FPukhjhKyjI8e0M8IYOOP24y4HYCmJ78bZU6orAC86T/SVQ9dylIrIeYXRdJDZozIXq1NsPT3XCI56YZFUHhUPd5bBVVVX3WtLJKaJNTHAATBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717437100; c=relaxed/simple;
	bh=it1q6hVJ+XHBNdzyqSH/WMM4oqnQdUt22Wv3ySVuMPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n6HeRzQWdGz73hYCB6E/em6HrjMQhQMUPkLaCXJuq2uU3wzInyKwA05bvRQM6cRPVslGph0DJkSp1KRI1oYgmYK1IibZ0sGyYcUpxiUP1lCEYQc1Jf6lLJdH0PqfJco7msOr6BbicWQk3YJbSgAvLhtrQO/jL8ElvKnOQ9ydkS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=og9AEAQg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="og9AEAQg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4604C2BD10;
	Mon,  3 Jun 2024 17:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717437099;
	bh=it1q6hVJ+XHBNdzyqSH/WMM4oqnQdUt22Wv3ySVuMPA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=og9AEAQgz89ziN5AWORDNobBaHHap0Pz7XJ/BsApB3WWvFtSIP2kIbBoGBPL4GD2o
	 rej+mGVzyR5kolJ/FjT2h8MOwwz7X1DrzrxCD808d/P8LcauAZVidOhOiJdJGpVg0g
	 95eNC87usDWuaMI3qKH39PlWTSdPDL+OTQ9LOr0bol0Jxh/h7ct/ArhWfPoY9zkt1i
	 //QFaajPlWe0vmLohweXhZjBTW9/XOhyGf8SBILhgPbYS2AlLPdc2Mb19NXIZcihg6
	 CIEfbmi001jt3/jnNzWU4W/4vnglZHnR4fQRkw1AtO1nLwlHc2fhYbLXi/2GbKjxB3
	 DfZ1cAZa+NwDw==
Date: Mon, 3 Jun 2024 18:51:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools <tools@linux.kernel.org>
Subject: Re: Trailer updates to git commits not working
Message-ID: <020408d3-4918-47bd-b8de-5ca89de72935@sirena.org.uk>
References: <15b55c55-8060-4c46-b545-3a3e774a9875@sirena.org.uk>
 <20240603-opal-wolverine-of-tempest-7a8939@lemur>
 <da75a55b-a698-4723-958c-6ee5e3b55104@sirena.org.uk>
 <20240603-frigatebird-of-unearthly-satiation-62b1ff@meerkat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cuMYe1+0Rk/yuFvG"
Content-Disposition: inline
In-Reply-To: <20240603-frigatebird-of-unearthly-satiation-62b1ff@meerkat>
X-Cookie: Don't let your status become too quo!


--cuMYe1+0Rk/yuFvG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 03, 2024 at 01:49:22PM -0400, Konstantin Ryabitsev wrote:
> On Mon, Jun 03, 2024 at 06:30:14PM GMT, Mark Brown wrote:
> > Ah, that's me being confused about what --since is supposed to do!  I
> > had been under the impression that it was letting me specify a commit
> > from which to apply updates (now I look at the full help I do see that
> > it says that the default is a time range style thing).  I didn't realise
> > it was a passthrough to the git log option.  In that case this is a
> > feature request for a way to specify which commits to update trailers
> > for, the use case is collecting tags as I apply patches on top of
> > already published commits.
>=20
> So, like a --since-commit [commit-ish] ?

Yes, exactly.

--cuMYe1+0Rk/yuFvG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZeAqcACgkQJNaLcl1U
h9DwrQf/SZ59C8JAWUCbw1iKL8Tp4WvGsxUR8bcu3DP4T8ceFfkcnGUrEZXCLBvU
RMDONWYB7A3OJdbdYXq+0lab1bQdFnB7NDNoIO6H0Uu29Ixj1idaAlPaQqFJF7OA
uj/lnUsNyzup/NOnz1Zh2hxF5GWj8BZWv5FoOqvp2qWDi9Q4vp08rsQ+Ldfg921k
idUmxHlbTetHJg7c1Qe4NWflv2FKpaIvbrmgK8oX4QS2sxy5vDEs+K8Sqm24JPtt
1EqIqb2VpL3yui3PZ0YcqFCMjZ1rzhjDR9G6SV/7eodxQP8v4sgP9fSCx2CWm5d4
xplRQ17lwpmi4xWBOB/I6PwN1IRA1w==
=ygbs
-----END PGP SIGNATURE-----

--cuMYe1+0Rk/yuFvG--
