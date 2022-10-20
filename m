Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894A27E;
	Thu, 20 Oct 2022 08:41:45 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 57D8A32004AE;
	Thu, 20 Oct 2022 04:41:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Thu, 20 Oct 2022 04:41:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1666255303; x=1666341703; bh=icETKuOXd1
	VlkrtXrf5Q5iYGfMAS6lzdnSvUlIcUYsU=; b=eKkxrbN/+0r2vJV/bBPlV+CP5S
	17SdvO3H2USdRwlMJlR7rQU0CHDnubAaKFKNYFwZgh1N2jRaZhZWohZ4F5f5tHUe
	DxP0YH8OXvKa2eU6H9tVtPqbSCbYLlQ7Qu1ziki64lRKFRT3QTvpTnExsvSD2fO8
	nswrriJVIGM2Z7/ExOEu2OTTn1OWa1oFEzPDR7R34zSWzQOp/9sHiqcxBfesO6uo
	9AEGrsWQmP/jfDVPxJwJrPhuA1bh/htuPC2NzKahXzLWPphx6nG6ssOifHE6FXeI
	wtElwZj9HBgYB/JxzsD6ZlDA1KYLq5nSYZF0ddlawVdaULNPUEkq2gdcHIpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1666255303; x=1666341703; bh=icETKuOXd1VlkrtXrf5Q5iYGfMAS
	6lzdnSvUlIcUYsU=; b=pTnS1PFvuFD4k7A/gBKeEDjqpbhDSUmGAuxQQWU18EzA
	Gq6S2PnfnEmmQScHMNhxjuQcW2PpTFsev5BvBefoeZUGDcjfGjh8kojBaruJCMh7
	mfuHxQw6ZGWzASaxMmJK8vXLZ0kLUSrRenj2XIl6Hwn9Q674uPYoZVvmDTR4wd9Y
	crU7vIk/EEZ8xrygcCmzEz2w4V71HplKEXdyUh20iX+WdnkMvj9wk5rPFbBLc9C8
	W4VyKHCjhL7yseazIKjIxyX3sw3YXD7Z3ou7BQbARCdRlZAilhKoh/bsHEC9fCY0
	9ps/8Ky3ekY9GjYFrObbt/VI8ZCn+j4tF5zAZ+CrFg==
X-ME-Sender: <xms:xwlRY5HwETc8EaQMkY6jb9APfVtGUV7w8bLvOmOAKLto38v05DvPuQ>
    <xme:xwlRY-XPZ1ymuirKBEwysxFxFLx8cS4wn1JGnzB91LOcptCjqj1XbrIL-FYj58dZP
    ohOTKstuPFF3qfIGZY>
X-ME-Received: <xmr:xwlRY7Kad9E3KnKNS0aoXpNOBX7hY9lZ8hI5p_mPfyQdLRkPCxorHfXmsP544Vcub-OZ6ZMJ61bydIluffe_HJDrO4oLzMl3DNap>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeliedgtdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
    hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:xwlRY_E15OERJVjKRDuMMebnyo4pQmDWOi64oxoxkoAKeFQ4EEmSCg>
    <xmx:xwlRY_VBESvEnU41L7kAwexrvJhXeLHaviN1-hFJg2u3oxofiNXGIQ>
    <xmx:xwlRY6PPXZwxQP105G88cUJdBJPOORGm87n6pbKf_xBJUqA5D5oBTg>
    <xmx:xwlRYxKckCw03Tjrl_gzoLjNOPR-5IjjWhZ5aj5FU1u5bJEz8QxNpQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Oct 2022 04:41:43 -0400 (EDT)
Date: Thu, 20 Oct 2022 10:41:42 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Mark Brown <broonie@kernel.org>, users@linux.kernel.org,
	tools@linux.kernel.org
Subject: Re: b4 bugs / future improvements
Message-ID: <20221020084142.gfep2hbapwkhjybv@houat>
References: <20221018153620.tyuedbldi2ofbe2x@houat>
 <20221018201804.na5x7lohm4yszg5h@nitro.local>
 <Y08MuItOLxqpBr+/@sirena.org.uk>
 <20221018203749.o4i5h2qt6artzezx@nitro.local>
 <20221019080439.cwwiycfdn4b4evvv@houat>
 <20221019191633.pay6hl43fiisgcrh@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hm2q745neflxz3mj"
Content-Disposition: inline
In-Reply-To: <20221019191633.pay6hl43fiisgcrh@meerkat.local>


--hm2q745neflxz3mj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 19, 2022 at 03:16:33PM -0400, Konstantin Ryabitsev wrote:
> On Wed, Oct 19, 2022 at 10:04:39AM +0200, Maxime Ripard wrote:
> > > > If you're doing an inter-version changelog it's common to say somet=
hing
> > > > like "rebased against foo" in there.  It's a bit clearer about thin=
gs
> > > > than base-commit.
> > >=20
> > > No, I don't think that's what Maxime means -- "rebased against foo" c=
an be
> > > done using "b4 prep --edit-cover".
> >=20
> > Yeah, I'm manually editing the JSON part. But tbf, I don't really know
> > why I started doing it, so it might be fixed for a while, or never an
> > issue in the first place.
>=20
> If you're using the "commit" (default) strategy, then you really don't ne=
ed to
> worry about the base-branch bit in the JSON tracking info.

I just tested and it indeed just works, sorry for the confusion :)

> > > I think there's two things going on:
> > >=20
> > > 1. he's using a different cover strategy that requires base-branch tr=
acking
> > > 2. he's rebasing on a different branch, as opposed to a newer tag wit=
hin the
> > >    same branch
> >=20
> > If it causes any issue, then it could be the reason yeah. I do rebase
> > across different branches from time to time, so it might be why I
> > started doing so.
>=20
> When we keep the cover letter at the start of the series, then we don't r=
eally
> care about the base branch -- we know exactly where the series starts, so=
 we
> don't need to keep any information about the tracking branch around. Next=
 time
> you rebase, just ignore the base-branch entry.
>=20
> I will look at improving the trailers matching logic in the near future
> (that's unrelated to rebasing -- we just need to have a sane fall-back wh=
en
> the patch-id changes).

Awesome, thanks

Maxime

--hm2q745neflxz3mj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY1EJxgAKCRDj7w1vZxhR
xVy4AQDe2DjaIRBrhh5vnndDXVz5zgS3FI2qsebOzjWgBqcq0gEAmarFgWhTmxLJ
HBMV4WOyuU9cXxiXNzl8E7tIJOesAQg=
=ans0
-----END PGP SIGNATURE-----

--hm2q745neflxz3mj--
