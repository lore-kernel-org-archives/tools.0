Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A562C8B
	for <tools@linux.kernel.org>; Mon, 25 Oct 2021 21:35:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A01CA6008E;
	Mon, 25 Oct 2021 21:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635197722;
	bh=i5wv2Q6wdgBJDCaGDuSxErLJ/9LlsEF0B9eTOw3E90Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ofWVH+OFoitzxLoZgYzfYbOaCLn0a5JsIe7b4pvcef9V8ceoyLBBUHuKYmgAHlleF
	 kazjOWv0c4qfBnPJKcbydKxz3mKKoE+NskKiNH/a28rCyKJ4Mufc8q7FH52GPTOwSz
	 nYNzABlN32sjQsTHBiHn5LVmcaJlaEuCqIU+t6/CjnD/mOqMAFSLgH00+6zXFswKB3
	 G5Hui6lNs7aMuWC4Er1FxeyQvVnKOrGi9NS2NMySHKPpYOt3KP2xXv+0mKn7iXauGq
	 jrUI6mu1HlSkI11m1ILOIE60Mmh8W04F7NKMFxMd8Hf/rRlEgLQvBEnwTf/abeCoE6
	 RXk4W7YS4qWaw==
Date: Mon, 25 Oct 2021 22:35:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: b4: shazam and ty flag changes
Message-ID: <YXci+zYdqNmv0fEF@sirena.org.uk>
References: <20211020151043.dwbug4k5yeifqbhe@meerkat.local>
 <YXcHfu5mTWkiHY6L@sirena.org.uk>
 <YXcMYRe5fsHlYIeL@sirena.org.uk>
 <20211025210914.63j2q5cuslxwekwg@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gpDTp+QvSyp20biS"
Content-Disposition: inline
In-Reply-To: <20211025210914.63j2q5cuslxwekwg@meerkat.local>
X-Cookie: From concentrate.


--gpDTp+QvSyp20biS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 25, 2021 at 05:09:14PM -0400, Konstantin Ryabitsev wrote:
> On Mon, Oct 25, 2021 at 08:58:25PM +0100, Mark Brown wrote:

> > Ah, now I try again after setting up a [smtp] block I'm seeing the same
> > error with git send-email, though not with the same parameters specified
> > in a [smtp] block instead which is confusing me no end.  Both programs
> > connect to port 587 and does STARTTLS as I'd expect before reporting an
> > authentication failure.  I'll have another poke later, I can't spot
> > any reason why the configuration that works with [smtp] won't work with
> > [sendemail] - the parameter names appear to match.

> I'm happy to test it out if you send me your [sendemail] and [smtp] blocks
> with your credentials replaced by X's.

OK, so I tested again and the [smtp] block is a red herring - it's being
ignored and things are falling back to msmtp instead these days.  The
configuration block is:

	[sendemail]
        smtpServer = mail.kernel.org
        smtpServerPort = 587
        smtpEncryption = tls
        smtpUser = = broonie
        smtpPass = XXXXXXXXXXXXX
        from = broonie@kernel.org

which seems to match both the manpage and

	https://korg.docs.kernel.org/mail.html

AFAICT (I've used both smtpuser and smtpUser type LHSs).

--gpDTp+QvSyp20biS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmF3IxYACgkQJNaLcl1U
h9BoqQgAhXwtkbU+Agutl9eQgOQ1u9XWVEg5SPuyMaye9WBN+h94/nkchOQee+My
bbXWEXylRW0OXis+ie57yDQYJFYeOet0HOZogdDhhasuZVq8Txap/Hw3jeFUyWV+
XbB58OgD9OekVdXrYbJqgRyOmp1ivu4mLpa1ozicroNXWDOr6EnD6JFb+fcxzl6M
0ju5yKct9BK/hhoDdvH2jH0XRWEzQecAa2lVbh7j9bL1FuqX9W7A44fSANDKdeeD
JtGOeF3AGVMg4r673NdlDUiG+cDrucEF2Gxsk6lYwrakgvxsHz85tMe+A+ydC4IW
CQw3vo3XcOu0MUi7AEFG+cNDCiYovA==
=HJsM
-----END PGP SIGNATURE-----

--gpDTp+QvSyp20biS--
