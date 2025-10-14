Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC752EA73B
	for <tools@linux.kernel.org>; Tue, 14 Oct 2025 22:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760479984; cv=none; b=cIMYoz0MYXDXzkOdKASh7F2Pox1WvLW+8XsPQqb67f85JC7jLI2rSdoHEtpnoHtf01GiZmMboQerfErC5QAeAqwB7tRq3BOOQ8vTF8Pv+Q1DBaEDu9wEcWIQR+BXb5brI1xGWdjAnUozxAGY2Ray4FdDabvCbbJ26L8CiE5e8qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760479984; c=relaxed/simple;
	bh=zBBHW2SKQ+LMIjAv70OzSITy3mP1eR+FUKbVbV514rY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qpBJkOSOoE+2gqju32jOi+8vIhBD8faQ0ORPy3Ik5HCF5Kp3SxbmuZpqa+XolN7BZ8b6W/xpijYpi36v79Dp+ZuBZ68SvAaQAcMdaCyM5uE1tKJdl/eDHFWCgYRi01K1+UoVJNQN2C3sFRmULkJgu+LKlrCv9wcVA4ccgHJ1s1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dCSPALcX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dCSPALcX"
Received: by smtp.kernel.org (Postfix)
	id 07C4AC116C6; Tue, 14 Oct 2025 22:13:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D769C4CEE7;
	Tue, 14 Oct 2025 22:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760479983;
	bh=zBBHW2SKQ+LMIjAv70OzSITy3mP1eR+FUKbVbV514rY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dCSPALcXOe8kPaVNJC01/Bmc1BChiiQRVmJ0rL9k0VOlI4jQkd+HEN4+jpjvXAJHn
	 0sDUsr8VNzW+Ecf0N03wIJpInI+VeuRLGso0sWLtXFV7M6/jivOgE4VG1RH0f3egX2
	 mwblyPEE9oanPJglb3t/sdtV4UXtdYztHuDnjGPftkro3+Msu+1y/cFMSc6DSioEvM
	 gTK7YSSjMahDgULV8sOzCAB6tkU7qcRG8FcImQRxitSfHm6at95s5L3PP7TzGji1+y
	 A9AUKl954Fq+b7+OuHm/EMCuxxIiOrX+2Z3fhUe3Z6cQtM26pDEgSP7qQw+X+4uTrN
	 XDbjJXR9up0cg==
Date: Tue, 14 Oct 2025 23:13:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: [b4] initial "b4 dig" to supplant Link: trailers
Message-ID: <741ab86b-753d-40ec-91b5-e1b8bb4a3de1@sirena.org.uk>
References: <20251010-muscular-camel-of-acumen-00eeaf@lemur>
 <20251014-gorgeous-cougar-of-endeavor-0c5baa@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aNJe7gZbmXe/gsN8"
Content-Disposition: inline
In-Reply-To: <20251014-gorgeous-cougar-of-endeavor-0c5baa@lemur>
X-Cookie: Madness takes its toll.


--aNJe7gZbmXe/gsN8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 14, 2025 at 05:17:43PM -0400, Konstantin Ryabitsev wrote:

> "b4 dig -c [commitish]" will now output a single link to stdout (all other
> output going to stderr), so that it can be piped to other commands. It should
> be the latest matching patch received by lore prior and including the "author
> date" of the commit. This weeds out all ensuing backports and cherry-picking
> efforts.

It would be really handy to have a --mbox (or something) option that
will download the mailbox like b4 mbox would, my main use for this (and
for the existing link tags) is to pull the message ID out of the link
and feed that into b4 mbox to get a mailbox which is what I'll actually
look at and work with.  Obviously that can be scripted locally but it
seems like it might be a common enough need to automate directly,
especially given that the scripting will be going right back into b4.

--aNJe7gZbmXe/gsN8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjuyusACgkQJNaLcl1U
h9AvOAf/Try2xVGQEzjhP6tMnN5Q6Ttrf/uJf5hAzucBEnQdo75KnBhimamNw81D
MRGItQgW4AH0IeHH6g2IGf4tixbtqQEyxWWC2qXZQi9EB17UrPe2u+4pfBZsiq6E
WN+PYCX8GTL1YdoFFpH4MN5bhpp6FAsArVcrZN0eOAxx7N+g0qrNeJQCABIZexN3
yb7qGNPeGTAcDRokjEYDSJ5Xn5GvUicGUXutMZluKgOzi0NgYCJVkI5jxvTIERCN
Qs0niw/tpjHrUWqksZPBWRGGlLOHaaAUx6yyMIVi7edZcFYxo4SVcK/BNDsweKL/
4U2i2UXQnC0akSUm3vBavGtHfO4awg==
=FS5T
-----END PGP SIGNATURE-----

--aNJe7gZbmXe/gsN8--
