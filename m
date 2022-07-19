Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5F11C04;
	Tue, 19 Jul 2022 13:59:53 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 2A9F75C012B;
	Tue, 19 Jul 2022 09:59:52 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Tue, 19 Jul 2022 09:59:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1658239192; x=1658325592; bh=K4xpT6U+VP
	oJPfMnGKIHmDRsKnYiPN+16d12+QtEoTQ=; b=C9RARRSXWt5FO+FG3EK2EEu/Nl
	Mi2XabmszCcmFHphyJeruLMy7m/id0DhvJwxPQRL8+JJCcoHz16uzZyQI01VOjqs
	908Bx9EZU/2e8IL5B0vaMx1PuMFnQJeGnE9RgSaunWhYb/jpx1AI1AekorEbu/SN
	B/WaFFqcFUQRfx2JFq7PGcgu2GEcKhW2Y0KUzZao3jmk5nW08taC7Sn7DlFe8V30
	LNLgKI5TBDPQdyTS4+Dgnoh56ApykvR02IGYvooJmT2WNnk6mbjHj8AvTlg+Bxiv
	AiOY5FCugLF4K4KM8vZjRKYbCuwqwRY2vx8K+fMxWsxh4LoDm5kDFf32arEg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1658239192; x=1658325592; bh=K4xpT6U+VPoJPfMnGKIHmDRsKnYi
	PN+16d12+QtEoTQ=; b=vm9KsgPVRZmyhGFMxJLJC44r37yPdyvkLTQEdomLB4jm
	lwapcF6u/j4d8uYx933JDNt60b/kiBF7MP3isfznWdqvN4s7ObOmeMHEafAPddpc
	6dXedZerUGvKfZ6bqmpmjnItCY4hLL8VrRhyCY0QYSqPrvi8JgQ/xoJEKsZfkK75
	1qG+CsTGB7ZuSJW6txPdEp61sf6GF8HqQnd5i2HuGUZKeHtmKbZjQ3EP3Cg+64Lr
	5W1KZnkdkKvenlpW6Xhj2JjSGk1DASoFaRQrCYU6L6gh7ctA7tW35AYvgL80oulo
	+cc2PU9T0uzx06r/HOtP9J6Pb4siAYKMYNHwKO8M4Q==
X-ME-Sender: <xms:17jWYpWDNgaVaJgiSl9Nps5hzcph8thheW0UKrTX9niROVAQpzJcKw>
    <xme:17jWYpkAwGp9vu9np5_tgow1UIUJNzk05ieXvkqTSq31YrUVJfuJWaHiGnZprlamH
    lBwUGqJ_18UVTFtfGg>
X-ME-Received: <xmr:17jWYlYPtibGbDTUOQd4FOJxMTU5IJVi0scttAYpqxUUdYgolNLehIsJVWeTNdNqjI8F7qFlbWZQvZ9wb5hh9sRqx_XAw0_2lpP2xTY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeltddgjedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelvdfhgeetgffgfeeftdevkeefueegieejveduteekjeeiheeuvdegkeeh
    jeegffenucffohhmrghinheplhhkmhhlrdhorhhgpdhpuhgslhhitgdqihhnsghogidroh
    hrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehm
    rgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:17jWYsU3dwlaPvuip0vUXkgqwgpI0zxGsF0iQzy_v_HbhRtG0OyzkA>
    <xmx:17jWYjmBvZ8iub1tFIYiZ6mGrwpBueNq-cmOL24KSZNc8DTlYKvo2A>
    <xmx:17jWYpfXO1VZwBA1_Y2rtai_4xHDAzYEXQv5d7Xbo91C9Kqfu9do-w>
    <xmx:2LjWYsA-IVj-jJ12iCMt50Wf4NxPDBHY0dHi-CTPnEXRru9oZ_KrPg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 19 Jul 2022 09:59:51 -0400 (EDT)
Date: Tue, 19 Jul 2022 15:59:49 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 submit ready for beta testing
Message-ID: <20220719135949.jlw3pfe3qz7xk53h@houat>
References: <20220716145638.ubuwwc7xtjw6ugy7@meerkat.local>
 <6ad8ce3aa0d14d8a09a3c117affe19928a44f639.camel@HansenPartnership.com>
 <20220717160218.a5ccu4chbaoj3uxv@meerkat.local>
 <20220718181732.GC5049@ziepe.ca>
 <CAMuHMdWgjimmGRxP6kLK_mzv3Fo=5S6SjYj5sbk24eSHLWKZHg@mail.gmail.com>
 <20220718231012.GE5049@ziepe.ca>
 <CAMuHMdUQiMwcC=r5NUZzniLC1qLkfcsB0rj+VnGm15+-ztjRqA@mail.gmail.com>
 <20220719123434.GF5049@ziepe.ca>
 <CAMuHMdVfrbnBmh=MCoX5S5y0JaMhZ7o8Do3bFORk1a_sF7MDOA@mail.gmail.com>
 <20220719130039.GH5049@ziepe.ca>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nv5fqeiaxk3ktwos"
Content-Disposition: inline
In-Reply-To: <20220719130039.GH5049@ziepe.ca>


--nv5fqeiaxk3ktwos
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 19, 2022 at 10:00:39AM -0300, Jason Gunthorpe wrote:
> On Tue, Jul 19, 2022 at 02:47:09PM +0200, Geert Uytterhoeven wrote:
> > Hi Jason,
> >=20
> > On Tue, Jul 19, 2022 at 2:34 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > > On Tue, Jul 19, 2022 at 09:02:40AM +0200, Geert Uytterhoeven wrote:
> > > > > If I use a tag I have to remember to update the tag after every
> > > > > rebase. It is much more likely to break down.
> > > >
> > > > Why would you have to update the tag? The tag would represent what
> > > > was sent out, i.e. the tag name would include the revision number.
> > > > After rebase, you have to recreate the cover letter (with an
> > > > increased revision number), using the previous tag description as
> > > > a template.
> > >
> > > Using a tag as 'what was sent out' might make sense - but that is a
> > > different problem.
> > >
> > > In many cases the cover letter is part of the series, and complex
> > > series often have very big cover letters explaining what is going on
> > > that take alot of effort to make and review in a "team based" flow.
> > >
> > > Fundamentally, the cover letter needs to be source controlled while it
> > > is being authored just like anything else.
> >=20
> > Makes sense.
> >=20
> > So during development, you want the cover letter to be a real file,
> > using a specific file naming convention.
> > When sending out the series, you need some machinery to detect the
> > cover letter file, and turn it into the 0000-cover-letter.txt file inst=
ead?
>=20
> Here we've always used empty commits for this, for years and years
> now.=20
>=20
> I'm puzzled why people are saying this is non-standard, it is well
> supported by git and works well with all the review and web tools. The
> only missing bit in git is a git format-patch flag to process it
> automatically into to the cover letter email.

So, I definitely haven't been around for as long as you, but I still
have been using git daily for the last 15 years. It's literally the
first time I'm hearing about someone using that workflow.

The only reference I could find remotely describing how that would work
are those two:
https://lkml.org/lkml/2021/11/14/37
https://public-inbox.org/git/CA+P7+xpHDGY5RTR8ntrABdxqM6b4V9dndS68=3DkV1+1Y=
m1N6YKw@mail.gmail.com/

I'm sure that it works great for you and others using that workflow, but
it's far from widely used still. I wouldn't call it non-standard
because, well, there's pretty much no standard when it comes to how you
should use git, but if we're targeting outsiders we shouldn't go too far
off the typical workflow.

Maxime

--nv5fqeiaxk3ktwos
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYta41QAKCRDj7w1vZxhR
xc19AQDOSsj97/Q0fPXTM4fAh0DLx/uA1wq8/Nl7MdoFT+PrxQD/WK9dsB6mSWrE
XAEgzMw5sAbI2l168O5febvVO5KhHQw=
=0LCx
-----END PGP SIGNATURE-----

--nv5fqeiaxk3ktwos--
