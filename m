Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937033FC7
	for <tools@linux.kernel.org>; Thu, 23 Sep 2021 12:09:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A8B9660F6D;
	Thu, 23 Sep 2021 12:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632398945;
	bh=6h7pOWicgm0zGiWBmXp52xY4CEE36ptinujggqygGDs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B79NfGZj9vZAVjKuhDFKqNXWgzvKvOROb7mp488qz8PWnryuFnrd+wCtbOhvSCwOs
	 QLhZVOtwzmV4+Vqp6+G+gJgedhhITQcCCehXh2gSjLxFJbOJNxJfTPKaeFk8Ed1DbI
	 r//7pAmUT2CyzccEeLBhOl+XS/GsgDRHlj7eNoXIJaCK9EFzoFgQ08BkVbaojNgSRX
	 D0b686cs7L1KzCRK2WMw6wGlAy75RXRPUdn5po42fO2bvWa3/J+fdwe5yMyiW8y7W3
	 ro9NHReYTX9tdB/wVo8wpSSxKPa8ANdnPdTBlYgCv/2+tU3Y0wn2VhibPgzzJL1q6r
	 6nAqmO6h7wNuQ==
Date: Thu, 23 Sep 2021 13:08:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: Issues escaping Froms
Message-ID: <20210923120820.GA5177@sirena.org.uk>
References: <20210921115544.GB4203@sirena.org.uk>
 <20210921124926.5j5z4pdedkk4ulwc@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mYCpIKhGyMATD0i+"
Content-Disposition: inline
In-Reply-To: <20210921124926.5j5z4pdedkk4ulwc@meerkat.local>
X-Cookie: Password:
User-Agent: Mutt/1.10.1 (2018-07-13)


--mYCpIKhGyMATD0i+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 21, 2021 at 08:49:26AM -0400, Konstantin Ryabitsev wrote:

> Unfortunately, the "mbox" files that git expects for "git am" are not the
> "mbox" files expected by mutt and other MUAs. If we escape the "From " en=
tries
> as mandated by the format, they don't get unescaped by "git am" and make =
their
> way into git commits:
>=20
>     https://git.kernel.org/torvalds/c/137733d08f4a
>=20
> There is no working around this, short of saving everything as maildirs.

Hrm, right.  That's awesome.  There's something fishy going on here
somewhere thoguh - I'm also seeing it failing to find the patch in

    60f0c65bbd52479cb83683b8475af435@bytesnap.co.uk

which has similar kinds of malformation in the incoming message, though
the result ends up different.

--mYCpIKhGyMATD0i+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFMbjMACgkQJNaLcl1U
h9B8wgf+JSdxysU536nN2h5p8yq14CTP6Aw0laWqThmM56Q9iBz/RPTmUWdAe5Ou
AeZvTtxjUOmxPyn/ZaXUCFElS/AzrEPZN82GBg1s/RjoZP9NDWB1III35cbcKVR9
R67WeK+zF7afOeGaEsykmwaSRVVlX/BPOTuzr44m5GspmkRATTkJvbpqrScEWfUG
bS34O4IWTtdTR9PxsJQOaRxL9hfrOT2asi+Zqxtc0Bq2ehT4ELkzNN0lDdK1NRcj
g8Gz7KtLU4wurb3GIhAU0/yeF3vvJ7ofQdWYIXedz1sZcMjwB1UgjqGdBw34Rk4+
a1CCZTwCfQBRVF+qWt+cNkc/p/zgwA==
=x6U9
-----END PGP SIGNATURE-----

--mYCpIKhGyMATD0i+--
