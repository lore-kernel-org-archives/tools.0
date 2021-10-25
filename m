Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DA32CA4
	for <tools@linux.kernel.org>; Mon, 25 Oct 2021 19:58:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CEF3060C4A;
	Mon, 25 Oct 2021 19:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635191908;
	bh=xpq5ert3g6PqXk+p/aeHTYOywkQ9/lG5L3ce2JEN5mg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c+i/1hSWPLoV5XyU5k3X5bgFiHQWzlec2LccckWwEVtI4iKM86C0Bemh45qHC5mQ7
	 QL+fP5FVF2+8xMfavGY/WKvJb6Wfc63GtKDpi+dtO83CHaHXX1S0Y0FNNzC96koKIb
	 uC/GdALFOlddR0x8wEihq9s3u06rTVEbG6fHmPiNzi/JrnMlkOxgav4Mk9iRqKNnk/
	 EWPaRQuf2Wv6h8k9uyCUdj3H3wPpfG8J+8Va5v9IBGh3exHyWz1MLIJqTNITk6URa4
	 G5mfPa0NVbq+jzE2BXMrpAyBSZ1UOBRL9KWGJF/5JEgyRZTv2sD8qYSg0kJmOKI7Tg
	 pQRlXlagX+hOw==
Date: Mon, 25 Oct 2021 20:58:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: b4: shazam and ty flag changes
Message-ID: <YXcMYRe5fsHlYIeL@sirena.org.uk>
References: <20211020151043.dwbug4k5yeifqbhe@meerkat.local>
 <YXcHfu5mTWkiHY6L@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lZlvEFCTFcTYvbRm"
Content-Disposition: inline
In-Reply-To: <YXcHfu5mTWkiHY6L@sirena.org.uk>
X-Cookie: Kiss me twice.  I'm schizophrenic.


--lZlvEFCTFcTYvbRm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 25, 2021 at 08:37:38PM +0100, Mark Brown wrote:

> git send-email also takes smtp. versions of all those parameters which
> was what I was using, presumably it's renamed at some point.  If I
> replicate them with sendemail I'm getting

> 	(535, b'5.7.8 Error: authentication failed: authentication failure')

> when trying to send via mail.kernel.org as I usually do.

Ah, now I try again after setting up a [smtp] block I'm seeing the same
error with git send-email, though not with the same parameters specified
in a [smtp] block instead which is confusing me no end.  Both programs
connect to port 587 and does STARTTLS as I'd expect before reporting an
authentication failure.  I'll have another poke later, I can't spot
any reason why the configuration that works with [smtp] won't work with
[sendemail] - the parameter names appear to match.

--lZlvEFCTFcTYvbRm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmF3DGEACgkQJNaLcl1U
h9DFoAf/Z3PgRhYmcNgmBng29No6yweeqV4DKFABouK+TIowCPjQjc6ogY68dqnd
DABGzARr01uk20CGtw7jLea3nC2vTJtcta9gxZ+FEyD6rOg/JU5AttbJYuXfgSxG
FGkmkwTGHsGTiMyI+LW8zEuLf6HEBOSQSTHbyw+qdBECYLuTkwieuFV+jB0UveRF
1C3gSo0UWpBjpKqq5seRp4sdf1MpwZgUxi0C8zKt3hl5GQscLxbwcfKyFYloTtBV
OvWmjw3ONf9xuh4/Oyl0wwJIoVMUwLJJoalCWmZMis2XHJJFl+KZbMvjm9ZtAFCK
+3nwYODH1Zz6Nss8Zog4g8YOLczeYQ==
=J+C3
-----END PGP SIGNATURE-----

--lZlvEFCTFcTYvbRm--
