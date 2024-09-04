Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECEA84A21
	for <tools@linux.kernel.org>; Wed,  4 Sep 2024 12:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725451474; cv=none; b=htZqXse+A2n4MIYLAKzIYeBbt5LPz2HsP7Tr7LcxmqmVy3ylJhFTqqHCjrrPC2uNsmkHTtC1NXaK5PAVxo80rD6mDWFUzwvAS1LD4D6KAALJ7wj4MXOROCFSK1yDmc0eUIn3geVAUNZRymzsyVRq4mCniVTILWNzLtIxSJIsNhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725451474; c=relaxed/simple;
	bh=Ii2ztldtprOW6tLsY0EIP4Hek9IF0zNbvkknoSzKCR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=do6amjJo2Z+LL6RgVXwO+wpYzAk0gb2189vVbT2IO83wo+0ljdHyN9OiDm6d+cP6TdAxJXNJhQjzC5x3urFwljip+TXQX1UBFy9XBo2vhRIBm/zoFoK2QkvlLlKNKwdl1dkBUzklG5SB5My8iOzPAZqgsTyaDAqq4fRbPURw47Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hi49MHYR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hi49MHYR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D484EC4CEC2;
	Wed,  4 Sep 2024 12:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725451473;
	bh=Ii2ztldtprOW6tLsY0EIP4Hek9IF0zNbvkknoSzKCR0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hi49MHYRjtt8zitlwFriP1Ce4TfXiZPxqkRFFvq0hUEuT1Y5O6YRNQZwQxkLEhszC
	 hFtxp1mY2Gzg5XESvc9SuHSXCh3CoYtw3gQEQ7ByKeZjTK/z8BPmSoTSefzBBGjYAE
	 vmq6eTPed5OPIPyYs2JOqMsNDS+cJEN+wq5ET7akaDH+GW0qLU3WTZePoYSJU6MF/8
	 3RKkch2FssbgLbVT73m/uAS/5aA1AEKbTbSurNahftb/8uQ1Vvw1W62TAs9ryqblpN
	 vF4MlSHCxcWlKOjxlcNRGL2QqFyVYXenOzadVz1Y22+qbG5nylqncVEmQ+EOACT03R
	 FN/tXGMSfr3DA==
Date: Wed, 4 Sep 2024 13:04:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools <tools@linux.kernel.org>
Subject: Re: b4 send falls over sending a series
Message-ID: <c2f1f863-8ec7-41c0-948d-230414caeda3@sirena.org.uk>
References: <9ae3668b-666f-47d9-9d25-be0fc57b6335@sirena.org.uk>
 <20240903-caped-graceful-ammonite-b0ed4f@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j0u0LjvWjpD9TBJX"
Content-Disposition: inline
In-Reply-To: <20240903-caped-graceful-ammonite-b0ed4f@lemur>
X-Cookie: Linux is obsolete


--j0u0LjvWjpD9TBJX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 03, 2024 at 11:35:04PM -0400, Konstantin Ryabitsev wrote:
> On Tue, Sep 03, 2024 at 11:42:21PM GMT, Mark Brown wrote:
> > Hi,
> >=20
> > When attempting to b4 send from the branch:
> >=20
> >    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git doc=
umentation-b4-advert=20
> >=20
> > with current git b4 the patch is sent but I get the output below and the
> > repository is left with the base commit checked out as a detached HEAD:

I've now pushed this to a separate branch b4-send-crash so it doesn't
get overwriten.

--j0u0LjvWjpD9TBJX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbYTM0ACgkQJNaLcl1U
h9Dyuwf/Wnp/4p/No797pkemOVEmxANzaHd1BC8kHI01lrzBVByWAp1LfPHa4uyz
d6hpgJnfGxp5H1L7MBZ/j9KwiIaiucHtiyQlzJyKneBoKoVrrJ0+XeKarAcIs+yL
nj9FhEuboJJCx8QewCl27Rc611vLbM4adjUFHv1Qd54Yw9Vh7V9/Vn9T2CtSNrx9
dcd0dUTb6N9HZVmSLJL24wT5CtInOmEhGDqZpuLuthbLdv2JiN72eHXjGcBUSGJw
/q7192nVNP1Mj/9TIQpuqXU0yUGkK7XlXYTT1dVBrPpEXZOKbXDHaw6/CZW+lb9n
fS9j5gLn4uq1+eaE0Z/Yd5rZB+zUNQ==
=HywJ
-----END PGP SIGNATURE-----

--j0u0LjvWjpD9TBJX--
