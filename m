Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEF91C3E;
	Tue, 19 Jul 2022 14:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3141C341C6;
	Tue, 19 Jul 2022 14:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658240089;
	bh=nH8AYsJHpaJYjXelbn4eAO6R/C09L9Z92bHwSCZy6A0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dANrwyGPXcULJGDrw01fieUqMdXufxa324Z/zY+oxJ/eSDiOebdT9+7LI0WEvrypc
	 NLgSv6aPR9hN1FoPKfGG1W/kPUuzCsvr2DdczLHjmM9RwExaNFQffKdwaFUTj8V3/g
	 NSlushIRd4N5AavleaGssTkePp2m8vj78870wZOCloxHqRlrzikAwfDIiaO+aDs3xs
	 PU8IFeKJj/iOx4xGpg0Z7jHqTFRAwexsYj5/psvNBahqQBouwU7zvwEBgTzTiH9ham
	 HAPxgPgSxWgtugTXml1HndFkQgjQU2StZIoZB/69jxPo/rJuz/qO4EI/X1T066k0Tz
	 D8R+/HFMjov6Q==
Date: Tue, 19 Jul 2022 15:14:44 +0100
From: Mark Brown <broonie@kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 submit ready for beta testing
Message-ID: <Yta8VNU+lQwWAvUS@sirena.org.uk>
References: <4c4652b0e333bd81b91f71346ac6142322682eff.camel@HansenPartnership.com>
 <20220716145638.ubuwwc7xtjw6ugy7@meerkat.local>
 <6ad8ce3aa0d14d8a09a3c117affe19928a44f639.camel@HansenPartnership.com>
 <20220717160218.a5ccu4chbaoj3uxv@meerkat.local>
 <20220718181732.GC5049@ziepe.ca>
 <CAMuHMdWgjimmGRxP6kLK_mzv3Fo=5S6SjYj5sbk24eSHLWKZHg@mail.gmail.com>
 <20220718231012.GE5049@ziepe.ca>
 <CAMuHMdUQiMwcC=r5NUZzniLC1qLkfcsB0rj+VnGm15+-ztjRqA@mail.gmail.com>
 <Ytae3XK2uA5z93rV@sirena.org.uk>
 <ede046d59801ff43038f4d59e711c1f3fdb72211.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l9iib3W+y8EbAhwx"
Content-Disposition: inline
In-Reply-To: <ede046d59801ff43038f4d59e711c1f3fdb72211.camel@HansenPartnership.com>
X-Cookie: We have ears, earther...FOUR OF THEM!


--l9iib3W+y8EbAhwx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 19, 2022 at 08:44:31AM -0400, James Bottomley wrote:
> On Tue, 2022-07-19 at 13:09 +0100, Mark Brown wrote:

> > > Oh, I always write my cover letters _after_ development, just
> > > before sending out my series.

> > I tend to find that's less true for followup versions - when revising
> > a series I tend to add to the inter version changelog as I go through
> > making changes.

> I tend to put it history into all commits, so the v<n> version after '-
> --' in all patch trailers as well.  This means my patch series has to
> go via email to get rid of that information in the final tree.

I tend to only track the versioning over the whole series for a bunch of
workflow reasons.

> > Yes, tagging versions as they go out can be very useful (I do as
> > several people have suggested here and tag things as I post them with
> > the cover letter in the tag).

> I've always liked the idea of cover letter in tag, but the tag only
> goes into the merge commit if there's a direct pull.  Pretty much all
> of the patch series I work on with git go over email without a direct
> pull, so the easiest worklflow for me is=20

> git format-patch --cover-from-description=3Dmessage

Yeah, what's actually happening with my scripting is that both the cover
letter and a tag are being assembled by the script and then the mails
are sent out, I don't actually tell anyone about the tags.  I keep
thinking I should perhaps just include a pull request style reference to
them in the generated cover latter (everything else that'd go into a
pull request is there already) but I worry that might annoy some people
so I don't.

> It's just really annoying none of our tools supports all workflows:=20
> git-format-patch can't work nicely from a tag; the pull workflow seems
> nicest but has no tooling at all around cover letter maintenance and
> the empty commit will be b4 specific.  I think this means there's no
> general agreement on a preferred workflow, which possibly means none is
> deal, but now your tool decides your workflow.

Indeed.

--l9iib3W+y8EbAhwx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLWvFMACgkQJNaLcl1U
h9CxFQf/WTEsNRrxKjJHZUsnWGUUPrNdzsZg7brqzvDx9ZrZ+ZUtWxKqlWsrIVK8
NIH1g8MmbxgfdZHvAU0BCmU9ynSUPQw2bTUcGS43kITvwrzNIW0Dj6EhzK9wr4O/
Rs37kQsu5rcWZBmU2JFendymcjsI9nYnKAnAH38H2gFt+VIz6xS+selF2zDkWByC
xNHzwHGWjgRMwbmFhmY3g2gzaU/vli8dfHOpuBmHacqGiX+9a4BUSUfFKY08YeW5
uSkrLYkoCg4d9ql7Pq2QzHxdV7uI3wOQrKUzNHpIxa7vUx6jx4mRoiB2j1MeAIGh
yGwLRoyeXaPaIxUFX8Q7lgDXHqGp+A==
=5VdB
-----END PGP SIGNATURE-----

--l9iib3W+y8EbAhwx--
