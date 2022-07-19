Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A011871;
	Tue, 19 Jul 2022 12:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1658234674;
	bh=k7ahpsdlc3gwysVyd1RiA9DBHhqJ9mcBJ03eWH7fDq8=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=RMB7TazYO+qO30+Zf9Xtr3JtmiQSTUt0qK3/slG5wk1EDI76IIkMQZaEC3/oT5USd
	 gnknpbRe75cQlJ29HsoSNLqVNEBzcXhQKgzhtlSLgI15uHuH2jLeTFR2D8JaSzcRUo
	 v6UbRtXvayVg1jtlIZcCzj00e6aarPc9TGKmqmgg=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id DC3C312813DA;
	Tue, 19 Jul 2022 08:44:34 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0_ne6l6763Di; Tue, 19 Jul 2022 08:44:34 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1658234674;
	bh=k7ahpsdlc3gwysVyd1RiA9DBHhqJ9mcBJ03eWH7fDq8=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=RMB7TazYO+qO30+Zf9Xtr3JtmiQSTUt0qK3/slG5wk1EDI76IIkMQZaEC3/oT5USd
	 gnknpbRe75cQlJ29HsoSNLqVNEBzcXhQKgzhtlSLgI15uHuH2jLeTFR2D8JaSzcRUo
	 v6UbRtXvayVg1jtlIZcCzj00e6aarPc9TGKmqmgg=
Received: from [IPv6:2601:5c4:4300:c551:a71:90ff:fec2:f05b] (unknown [IPv6:2601:5c4:4300:c551:a71:90ff:fec2:f05b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id C24781280DD3;
	Tue, 19 Jul 2022 08:44:33 -0400 (EDT)
Message-ID: <ede046d59801ff43038f4d59e711c1f3fdb72211.camel@HansenPartnership.com>
Subject: Re: b4 submit ready for beta testing
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Mark Brown <broonie@kernel.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Konstantin Ryabitsev
	 <konstantin@linuxfoundation.org>, users@linux.kernel.org, 
	tools@linux.kernel.org
Date: Tue, 19 Jul 2022 08:44:31 -0400
In-Reply-To: <Ytae3XK2uA5z93rV@sirena.org.uk>
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>
	 <4c4652b0e333bd81b91f71346ac6142322682eff.camel@HansenPartnership.com>
	 <20220716145638.ubuwwc7xtjw6ugy7@meerkat.local>
	 <6ad8ce3aa0d14d8a09a3c117affe19928a44f639.camel@HansenPartnership.com>
	 <20220717160218.a5ccu4chbaoj3uxv@meerkat.local>
	 <20220718181732.GC5049@ziepe.ca>
	 <CAMuHMdWgjimmGRxP6kLK_mzv3Fo=5S6SjYj5sbk24eSHLWKZHg@mail.gmail.com>
	 <20220718231012.GE5049@ziepe.ca>
	 <CAMuHMdUQiMwcC=r5NUZzniLC1qLkfcsB0rj+VnGm15+-ztjRqA@mail.gmail.com>
	 <Ytae3XK2uA5z93rV@sirena.org.uk>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-armz0K+ZdHByTOILvj0t"
User-Agent: Evolution 3.34.4 
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0


--=-armz0K+ZdHByTOILvj0t
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2022-07-19 at 13:09 +0100, Mark Brown wrote:
> On Tue, Jul 19, 2022 at 09:02:40AM +0200, Geert Uytterhoeven wrote:
> > On Tue, Jul 19, 2022 at 1:10 AM Jason Gunthorpe <jgg@ziepe.ca>
> > wrote:
> > > See 'git-tag(1)' "On Re-tagging" for a discussion on why changing
> > > tags that have been pushed is a bad idea. There are many
> > > troublesome behaviors here.
> > > Tags are not a solution to store the cover letter during
> > > development..
> > Oh, I always write my cover letters _after_ development, just
> > before sending out my series.
>=20
> I tend to find that's less true for followup versions - when revising
> a series I tend to add to the inter version changelog as I go through
> making changes.

I tend to put it history into all commits, so the v<n> version after '-
--' in all patch trailers as well.  This means my patch series has to
go via email to get rid of that information in the final tree.

> > > If I use a tag I have to remember to update the tag after every
> > > rebase. It is much more likely to break down.
> > Why would you have to update the tag? The tag would represent what
> > was sent out, i.e. the tag name would include the revision number.
>=20
> Yes, tagging versions as they go out can be very useful (I do as
> several people have suggested here and tag things as I post them with
> the cover letter in the tag).

I've always liked the idea of cover letter in tag, but the tag only
goes into the merge commit if there's a direct pull.  Pretty much all
of the patch series I work on with git go over email without a direct
pull, so the easiest worklflow for me is=20

git format-patch --cover-from-description=3Dmessage

It's just really annoying none of our tools supports all workflows:=20
git-format-patch can't work nicely from a tag; the pull workflow seems
nicest but has no tooling at all around cover letter maintenance and
the empty commit will be b4 specific.  I think this means there's no
general agreement on a preferred workflow, which possibly means none is
deal, but now your tool decides your workflow.

James


--=-armz0K+ZdHByTOILvj0t
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABMIAB0WIQTnYEDbdso9F2cI+arnQslM7pishQUCYtanLwAKCRDnQslM7pis
hXooAQCHO2lFyS69IPuD9mg4Dt17gC95OIATuLCwDBTLfyBd+wD9EqeGgUSnqjnX
TxiJ3INLthug+z3nUpA1Oq9cJecc7f8=
=BqT9
-----END PGP SIGNATURE-----

--=-armz0K+ZdHByTOILvj0t--

