Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B002C8B
	for <tools@linux.kernel.org>; Mon, 25 Oct 2021 21:40:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 920BB60E08;
	Mon, 25 Oct 2021 21:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635198058;
	bh=KZQz4/0eMV2i/BTo/2XVTdYjkwdpv9WbagjVulIgam4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NuKCQThUZ/y8h5ULUDRWs8HNRW1wMwe9w7O36lhTx1DqghZ/oiF6kII2BZaGknCMW
	 Mfu01lY5rLGOW5rIzErGq0/BDJIN5Ol1WlvbJDycfUGsDP3gsMPzRF20JTxR+wvPrU
	 WdJBXex0Bc1bUCe4EUn+t1mEK6KQjcBmPJHbJRGgPTxlyVyiSW02wxV1s0f7rAyi5r
	 2n8UmaSMUtLccLRqwN6jwmJSCpXmiOHG8QHeCO8xRGY0jLy4rMaNZyxgaFHOHmAHnE
	 6SM2piPpEDkwJXpcKAJZzEhkGiQ85kRnd2/6OGbt3rhfxjT6bj7pa9jmEHJ/qNZNEo
	 T442wXXcAU6+Q==
Date: Mon, 25 Oct 2021 22:40:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: b4: shazam and ty flag changes
Message-ID: <YXckZtqzanA3QwC0@sirena.org.uk>
References: <20211020151043.dwbug4k5yeifqbhe@meerkat.local>
 <YXcHfu5mTWkiHY6L@sirena.org.uk>
 <YXcMYRe5fsHlYIeL@sirena.org.uk>
 <20211025210914.63j2q5cuslxwekwg@meerkat.local>
 <YXci+zYdqNmv0fEF@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j7E2rPoCC/Dh3E5k"
Content-Disposition: inline
In-Reply-To: <YXci+zYdqNmv0fEF@sirena.org.uk>
X-Cookie: A penny saved is ridiculous.


--j7E2rPoCC/Dh3E5k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 25, 2021 at 10:35:22PM +0100, Mark Brown wrote:

> OK, so I tested again and the [smtp] block is a red herring - it's being
> ignored and things are falling back to msmtp instead these days.  The
> configuration block is:

> 	[sendemail]
>         smtpServer = mail.kernel.org
>         smtpServerPort = 587
>         smtpEncryption = tls
>         smtpUser = = broonie

And now I put this into e-mail I see the double = there which is what's
breaking it *sigh*.  Sorry for the noise here :(

--j7E2rPoCC/Dh3E5k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmF3JGUACgkQJNaLcl1U
h9A6nQf+IlGOtiBj8ZkfJEdykmgPNHB2IRoZgqkPwLTX/osfKBaOMk6z95aDXeAe
eVPPSrZKYrUCEN9nkUUpGUE0DHJfvjZumsqA/jzXHsnm52RUStaUpUuo6Q9ddJKM
nz+VZz2f/TsPAYlH8z63EfBMoeXni/yX4m+ezMmmTV73B+gwLdeyLMgu4atRRgo/
u18AGQHr2VhFdvBDnpZynLSzKucsiChfNa4klQz8grR/SnZSMerzZzULCRXVPPRU
GIbUXbDMoCftfhWjg7jTPlQOKq8ipcQIwVrAtqhvEO7uGfmuowwvlkOmtmaB2MIe
eR0ybQo3FqOh2P73PRJ4h7/kp7Dnlw==
=4Rzq
-----END PGP SIGNATURE-----

--j7E2rPoCC/Dh3E5k--
