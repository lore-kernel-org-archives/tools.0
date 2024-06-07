Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A2050282
	for <tools@linux.kernel.org>; Fri,  7 Jun 2024 15:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717773832; cv=none; b=PT+rZfD3UnzS3iHLFUHkUi/Gr5CbWy1bP0jvIdga7tIQ8Is46CMsWBOz0U0RAjWZ8zkERNO+KURlacnqe7NDli4/HtETL/r2OTVUSNnpv9Vw4SzHMFT4zDdakd1NuTHFcQT/RLuXq+g1JR9784H1R1A4tPfG8hgCQLEHhlnEMi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717773832; c=relaxed/simple;
	bh=NeYQttx+/SFi1TKLJDWaKTDjp2TxAoCNbssTI4Sbzjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TNVcHjPqFJo8pzcfOoiZdhQ2VgTDnmzRJGCqZoWUHwNmuog8jp/Nbel3NPYXeP0mUaqOWPovGq+ow0HHoXheOibtAa4xuNHCX/Rv/WU5YU2b1mOeqtDFncV5alfyKoEKIbbVp76+yEc0J+oRukSlyKclEUsHjB5oFRQP8p9ybMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tbcX+qgd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tbcX+qgd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF956C4AF07;
	Fri,  7 Jun 2024 15:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717773831;
	bh=NeYQttx+/SFi1TKLJDWaKTDjp2TxAoCNbssTI4Sbzjc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tbcX+qgdxhl30peJu6jGqfPTtO2kfVD9mlP2lx0QdUKwdHXT29J13rFrzefVQ9S7c
	 uSvh9FcNmSjXq+cGnhU7HMI7IfXfghT8ngtx5XrrVE9D0kjqygmlZw5AOLhSOw0pLz
	 19ZnE80rK3yptApX6v9VLdbZgBcOX8X4EZBIygjFl/slOZ1M2xkG1roREx5h5Cz4cc
	 VLK3pAUQG7FTSzOsF+IqHS/avMWJbsZHyTjo6bh/MVHkpX1daGQ8vacspRNISIcELe
	 tbkCo3yvJJJnkCto7B/m1/7dnoKDGgd+qI9581xNvWwA7F7qbn8o8YBlCBh7788gdB
	 Xq9sVQ+yvi9Og==
Date: Fri, 7 Jun 2024 16:23:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools <tools@linux.kernel.org>
Subject: Re: b4 prep from lore picks up versioning confusingly
Message-ID: <ZmMmAywcdk9lF7Wv@finisterre.sirena.org.uk>
References: <ZmMNp1_rMSMXHgFD@finisterre.sirena.org.uk>
 <20240607-tan-marmoset-of-cubism-5fab4e@meerkat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zkiRDddV4obXYhyI"
Content-Disposition: inline
In-Reply-To: <20240607-tan-marmoset-of-cubism-5fab4e@meerkat>
X-Cookie: Your love life will be... interesting.


--zkiRDddV4obXYhyI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 07, 2024 at 10:19:26AM -0400, Konstantin Ryabitsev wrote:
> On Fri, Jun 07, 2024 at 02:39:51PM GMT, Mark Brown wrote:
> > and the changelog for v2 in the downloaded series.  I would have
> > expected to see revision set to 3 and v2 in the history, v2 was clearly
> > sent.

> I can see your logic, but I can also see other situations where this woul=
d be
> undesired behaviour, for example if someone creates a branch from a series
> they mailed to themselves (or dumped into a mbox file). I'll think about =
it

If you mailed to yourself you'll end up with the version incremented in
the local copy...

> some more, but in your case it's fairly easy to get to where you want to =
be by
> running:

>     b4 prep --manual-reroll [cover-letter msgid or link]

Or just editing the b4 metadata by hand which is what I did.  Perhaps
just an option=20

--zkiRDddV4obXYhyI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZjJgAACgkQJNaLcl1U
h9BD5Af/dLzBzAZwl1QzaSQZG5pqSyR+1ZT4UZJCwGtQeMUAt0guIz/5BglJeX+M
eWQJABxsVp/rUbg/8HfndrDRKuZYCUKlnHDysoR0K0+R2xb5IcDmugzhrqrxLWVq
NnGpQRnkWL+kQvkoaRxoGn27Yu5J0mruq5uSJU0oCYsNjNSysnd2pOGxqNKl0XPY
/YNeNGzpP4r165SyWgoHM/GlEXARMVpzHL4wdaTp/VM+B0tnbFkFa0Sm9K/63wu9
nmcXH9SKuBBeeX5H1FQraFR7Cth/oICfEt2Ugyp/w1me9Rwx0v6YGl9pvI6zUTBu
9LWYJxgFI0CbdM0LU2MtztRy7yZTZw==
=Edbx
-----END PGP SIGNATURE-----

--zkiRDddV4obXYhyI--
