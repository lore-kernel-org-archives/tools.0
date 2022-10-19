Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886867E;
	Wed, 19 Oct 2022 08:04:42 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 469993200935;
	Wed, 19 Oct 2022 04:04:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Wed, 19 Oct 2022 04:04:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1666166680; x=1666253080; bh=hTMv4TftjY
	haDc9FSZGr4OA27Kjhsi14d6zsGQPl7z8=; b=KoBagGovB7iT30CD93OJqmt4In
	EsAejrYNNGCuEz0rBSYvU81xThPv4hZWbCBDlEnOS8Z4VLl2vL7HvIcCreFWtMwo
	jageRsNmPpye3N/WCproKvPl0tQqCa1a7JgS2RUvkcF78Y0yZqSpF4GMSzGYldz7
	7PVDgZ4OTGOWmk++FBTTY5wd6NuzSZHoEUwcmUxJmNKs1T9hrlgTOdC4p3mtPwLX
	RCSiNUdRvkAk2cPtEt2npRWmkG46N1gfm8ahUVQ9j87pgnw687+WbtJkjEZRwLaZ
	A9gHVkYwdKD2gaQNWnNfMICSCWk/CFUDGNWvPaWoiCP/EwLk0hZC14q0Mg9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1666166680; x=1666253080; bh=hTMv4TftjYhaDc9FSZGr4OA27Kjh
	si14d6zsGQPl7z8=; b=Z75I9PhlUhYmZJYLXL9RCEeAcU+cB8P1IeDd5x3uOZKo
	yL/1JJ5O9YkzIezhFC6okxRXrJ+lgoktbjYPbp7kEwQr9Wv9wh7iLQb+G5lICwLW
	YkUzDJ8lN2A1yqxXQaM5jupJLF1iPaoVQQue2e2qqUamCBCAHnMfAt99L6LKsbHO
	OBm8o4Kz42ymFvXKDYvCLuI6DI7B7W0XFYUvMJ1ioxBvvPdW/xwTQPwNVpeEwRkD
	CuOEx8/4nJoP1AeMCmNUuzO2z4jzJHLXQhD9PbnK7G6bIcp5Z+ppPm4Xqn57LH2I
	cBXUAF6+mccC/aUCZPio8hq10Y7MA/sRwopCVJLb2A==
X-ME-Sender: <xms:mK9PYyMlWKj2Jmt36TGaYFyMjrws01Lnq2-xUjbqrUQbUsBcFX25yw>
    <xme:mK9PYw9eH717AqVoilxC54kVHc9I3aMReTIFAiK2xxptl2zkA5WVAIWNA_HlvJqw7
    tHofsgMWmtP0AzmL30>
X-ME-Received: <xmr:mK9PY5TeEGTx0X5OJr6yE8o7_BKYc_EadJCcKHLkqf_eBH9TQPcK-5FRusWy>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeelfedguddviecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepteefffefgfektdefgfeludfgtdejfeejvddttdekteeiffejvdfgheeh
    fffhvedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:mK9PYyspe5DDERUv2z6oDpIe6sqv28oZI6d6QwZb96AUKKvzUmy-hA>
    <xmx:mK9PY6ftVKUzt06paZjQVY86cJs1ihgvZuFbmj_v0HM5vxQzLvQhGA>
    <xmx:mK9PY23WhxuwAoHTjAcdGl--oWv0kf7GpVHwh3rxjVmGFlzFX6Pt9w>
    <xmx:mK9PYyQZ9Q2jTqIpn8qdt0gZpc6MLAm1Irka45lctrUEcuhPqaL2Kg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 19 Oct 2022 04:04:40 -0400 (EDT)
Date: Wed, 19 Oct 2022 10:04:39 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Mark Brown <broonie@kernel.org>, users@linux.kernel.org,
	tools@linux.kernel.org
Subject: Re: b4 bugs / future improvements
Message-ID: <20221019080439.cwwiycfdn4b4evvv@houat>
References: <20221018153620.tyuedbldi2ofbe2x@houat>
 <20221018201804.na5x7lohm4yszg5h@nitro.local>
 <Y08MuItOLxqpBr+/@sirena.org.uk>
 <20221018203749.o4i5h2qt6artzezx@nitro.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j2vyr4sehznvuw6n"
Content-Disposition: inline
In-Reply-To: <20221018203749.o4i5h2qt6artzezx@nitro.local>


--j2vyr4sehznvuw6n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 18, 2022 at 04:37:49PM -0400, Konstantin Ryabitsev wrote:
> On Tue, Oct 18, 2022 at 09:29:44PM +0100, Mark Brown wrote:
> > > >    - It's a bit tedious to do. One needs to rebase and then edit the
> > > >      cover letter by hand without b4 being involved. I don't think =
doing
> > > >      the rebase interface all over again is reasonable, but maybe we
> > > >      could add a subcommand to set a new base?
> >=20
> > > Interesting. I'm not sure I fully understand the problem, but then al=
l my
> > > rebase tests were all very simple cases of running "git rebase <newta=
g>"
> >=20
> > > Is there a reason why you have to manually edit the cover letter afte=
r a
> > > rebase?
> >=20
> > If you're doing an inter-version changelog it's common to say something
> > like "rebased against foo" in there.  It's a bit clearer about things
> > than base-commit.
>=20
> No, I don't think that's what Maxime means -- "rebased against foo" can be
> done using "b4 prep --edit-cover".

Yeah, I'm manually editing the JSON part. But tbf, I don't really know
why I started doing it, so it might be fixed for a while, or never an
issue in the first place.

> I think there's two things going on:
>=20
> 1. he's using a different cover strategy that requires base-branch tracki=
ng
> 2. he's rebasing on a different branch, as opposed to a newer tag within =
the
>    same branch

If it causes any issue, then it could be the reason yeah. I do rebase
across different branches from time to time, so it might be why I
started doing so.

> That would indeed be as cumbersome as described (and why I'm using the "c=
over
> letter as an empty commit at the start of the series" strategy as the
> default).
>=20
> Maxime, is that correct? I assume you're using "tip-commit"?

I'm using the commit strategy

Maxime

--j2vyr4sehznvuw6n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY0+vlwAKCRDj7w1vZxhR
xVgZAQDn1wPF8KdUlfIM3bWIzlGHTbDFqa9kCijmEf98cPGjWgEA5fZtWxMXBhT9
3got4a1EkVza8lupxHLRH7Ds6s6+dw8=
=Cyp4
-----END PGP SIGNATURE-----

--j2vyr4sehznvuw6n--
