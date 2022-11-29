Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A13BA28;
	Tue, 29 Nov 2022 20:52:58 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id D859E5C00ED;
	Tue, 29 Nov 2022 15:52:57 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Tue, 29 Nov 2022 15:52:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1669755177; x=1669841577; bh=ih5OYSuRX7
	9CsMOtjeLVD/Te6Gkp86j0puWT4++yvcc=; b=dMgfIo+KW7OTf7miBQ8GPSJHAY
	X9VQmER9AttcfBc8+sur3VfO7VMQgnyxN1Mp0O70wxg1lX0bGGXQlov/sKWYLWcz
	XVc8voVMgJHIKBoVBGhkRa2IDa8FpZsX4iJsfa183Q2kQNtJ76R2pWxkY5z0y86l
	CithZsoSzAdKtOXpZix7cyEZdEtiKYa9GdlZnvVhch5OGiDijDAWGdfmZaEMhlzL
	3kVP8fT1VBc7QbgTPBs9Zaaup6sMgbOjVFhMoc0/zGuE02Rzs/ctylPr82y/fQoq
	dwm1kH9jgPnsJApC9/Ps+vKG53JYwwBhOCFrcEDfjqTT/4wM+6j/+FmXdyag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1669755177; x=1669841577; bh=ih5OYSuRX79CsMOtjeLVD/Te6Gkp
	86j0puWT4++yvcc=; b=wot6TFo11hITkUHpuhXyoXiCueseMoIdLds13AKXoZ7L
	ozcVNRG4CQt35i2MmtaYfX4swJ2yhkzO8WPwtybR/YD/X3h53ktylImrd1o+woau
	F9J9maeuL2VtFdXNDLE5WS2I9NlRl/x5oZqxoDR//gGSyw2gJAR35lquWUtR8y4V
	/EWRYCHdri/KIQOXzVUpM3Tj96zB/qAzuhQsFUEikuEdHr5HuL20NJgakua8Vr+o
	mafS/x6QndGDhxjBZfr9axkmDLmHFn5te7pQOrzxX5knqu+Vytbw8nYZ0NuPxCS4
	Ejq5UlafjF2FHaNhvMkBi3LrZQxrNNagyAwA+PnPEA==
X-ME-Sender: <xms:KXGGY7lTxHpZ3h9tSQg9422dZg30c1Z5-osAuGwlEYk8ilCfQxMFWA>
    <xme:KXGGY-33UY1AdWKLnbxWgznAotcoA94mle9Co-SvHmB7YgjctlQLv-8I7DGeMPlA9
    ER20qr17Ld1q1hDRtI>
X-ME-Received: <xmr:KXGGYxrWgdwUaOqfASZJSWhg9tVJkm7cm0H3ZTYDH2SyZvPQoSrE3QyOyha-XJSSu3LIUHhtnriYl8zWJStPeaj5QVzE8md5gzAfSg5PU32XUw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrtddtgddutdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpefhkeehfedthfejfeejtdfhvddvueeigeejjeeuteegveffhfffgeffieeu
    ueduvdenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
    hh
X-ME-Proxy: <xmx:KXGGYznxfrpPwwQRcz3mawhQxFvjpM2-lyjM3rtRZqIziNM7E0tN7g>
    <xmx:KXGGY52vlX_eCFBO69zX2yyhjJAwENG-ffJedQYmM9Eqn7EPCVADig>
    <xmx:KXGGYytwJVrwMjnq8D-_PqBh7ZsnX29tNHN0LOxf6KnOM_e9OP--xw>
    <xmx:KXGGY0SKgRBE9aj5BNc-JINRp9IKUeAe2XrOBoxRxOfQyXWikK_Xsg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Nov 2022 15:52:57 -0500 (EST)
Date: Tue, 29 Nov 2022 21:52:55 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 bugs / future improvements
Message-ID: <20221129205255.pfpuafph6mi2x57o@houat>
References: <20221018153620.tyuedbldi2ofbe2x@houat>
 <20221018201804.na5x7lohm4yszg5h@nitro.local>
 <20221019080140.zc42aqi7gwjpvczs@houat>
 <20221020084930.vpu552rag6gdvmvm@houat>
 <20221109141459.ud2wofasq2jozmks@houat>
 <20221129171453.f74wxgd3kemsvy6q@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5ry6qly44m7hdzbq"
Content-Disposition: inline
In-Reply-To: <20221129171453.f74wxgd3kemsvy6q@meerkat.local>


--5ry6qly44m7hdzbq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 29, 2022 at 12:14:53PM -0500, Konstantin Ryabitsev wrote:
> On Wed, Nov 09, 2022 at 03:14:59PM +0100, Maxime Ripard wrote:
> > > It seems to be related to
> > > https://github.com/marlam/msmtp-mirror/issues/51 except I don't have
> > > set_from_header in my config. I've tried to use allow_from_override a=
nd
> > > force it to off, and it didn't help.
> >=20
> > I just discovered something else.
> >=20
> > For various reasons, on one of my series I keep a per-commit changelog,
> > in the commit log after a ---
> >=20
> > This works generally fine, until I run b4 trailers -u which seems to
> > drop the entire content after --- when adding the tags.
>=20
> This took a while to track and fix, but this should no longer happen in m=
aster
> and stable-0.10.y. Thank you for the report.

Awesome, I'll give it a try, thanks a lot

Maxime

--5ry6qly44m7hdzbq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY4ZxJwAKCRDj7w1vZxhR
xbkvAPwIw/wY3yUI6nCQn/4E+RLCSamE/yCv/rTJv+LRRXNXQQEA5NEl0wzamahf
p+KiNObOjBCblzLOEbCNcyi66tc6zwo=
=8QvL
-----END PGP SIGNATURE-----

--5ry6qly44m7hdzbq--
