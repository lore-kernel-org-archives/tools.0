Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF8C185B;
	Tue, 19 Jul 2022 12:09:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DC66C341C6;
	Tue, 19 Jul 2022 12:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658232545;
	bh=bDiw4k6lnEGrkm5ptivBNlFb8ZmNW9wpMf5dgfbMGh4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WkS0qbeWupzfecvHpaSf9KfT4cEJ5fy0qAqIMy49BBsUAVNK7lCCpBzwm3kD6HQdO
	 UAGCqayGkVJ8Nu+wpl50Aa5uGlW/mwm222os5TXhRGClp9eyBorNbkFrKOFgvArtDx
	 /OqjuTBUHbVZtMdSRqPsQ1qqqntr39bnf7topmvj2mTuyJm6PeBedi6D7WjJJQtFEv
	 ZmR69RA+VFMIIfGEUA5LvsVVrZ6MbcbjbnPhxHK1hN+jYvXSygWqdLK0EtPCdmA/TD
	 TEj1qIcHVpzexacopRJ0RYD7TzKtiT03dpzHpM2QxytmZl7b5Pawr45y4FdQBYFGLg
	 TxGhqFMy0D0aA==
Date: Tue, 19 Jul 2022 13:09:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 submit ready for beta testing
Message-ID: <Ytae3XK2uA5z93rV@sirena.org.uk>
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>
 <4c4652b0e333bd81b91f71346ac6142322682eff.camel@HansenPartnership.com>
 <20220716145638.ubuwwc7xtjw6ugy7@meerkat.local>
 <6ad8ce3aa0d14d8a09a3c117affe19928a44f639.camel@HansenPartnership.com>
 <20220717160218.a5ccu4chbaoj3uxv@meerkat.local>
 <20220718181732.GC5049@ziepe.ca>
 <CAMuHMdWgjimmGRxP6kLK_mzv3Fo=5S6SjYj5sbk24eSHLWKZHg@mail.gmail.com>
 <20220718231012.GE5049@ziepe.ca>
 <CAMuHMdUQiMwcC=r5NUZzniLC1qLkfcsB0rj+VnGm15+-ztjRqA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nINDxJsw+NhlyIil"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUQiMwcC=r5NUZzniLC1qLkfcsB0rj+VnGm15+-ztjRqA@mail.gmail.com>
X-Cookie: We have ears, earther...FOUR OF THEM!


--nINDxJsw+NhlyIil
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 19, 2022 at 09:02:40AM +0200, Geert Uytterhoeven wrote:
> On Tue, Jul 19, 2022 at 1:10 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:

> > See 'git-tag(1)' "On Re-tagging" for a discussion on why changing tags
> > that have been pushed is a bad idea. There are many troublesome
> > behaviors here.

> > Tags are not a solution to store the cover letter during development..

> Oh, I always write my cover letters _after_ development, just before
> sending out my series.

I tend to find that's less true for followup versions - when revising a
series I tend to add to the inter version changelog as I go through
making changes.

> > If I use a tag I have to remember to update the tag after every
> > rebase. It is much more likely to break down.

> Why would you have to update the tag? The tag would represent what
> was sent out, i.e. the tag name would include the revision number.

Yes, tagging versions as they go out can be very useful (I do as several
people have suggested here and tag things as I post them with the cover
letter in the tag).

--nINDxJsw+NhlyIil
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLWntwACgkQJNaLcl1U
h9BsVQf+JsEt2iy0kMUEpJv0QR/xZUPEF9TdKCKuiS0R3XUv8jWN9qjIW83Iiqzi
r6iUff0BCY3q6mpZcdx1VUfJjhCwTSMofQUEatCY2hiaCd2RbKAIU2ni+jlULrnw
Psrv9y83vsffNK+MbCCfsygWf1ap7/GKVbpSVuP8kLUxD/6ck/zzQzNEwrU7ovPr
ejqPcUb0AIHAL+JwYkGuXw/8oylb3gSZR0wCa0KV/t/1kC/2FNgKmq+pRk9dgFNJ
f7fVdcs51zfreuTCjfyoEIabXwK+MJpdmn4fwebNiGHWoLOhRp0n0UbF7N19H8JJ
OJuOpxBlocSYMC4bRFwROiSfNfrI+Q==
=9d3u
-----END PGP SIGNATURE-----

--nINDxJsw+NhlyIil--
