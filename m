Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52D868
	for <tools@linux.kernel.org>; Mon, 29 Nov 2021 12:31:39 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id A44443200E5F;
	Mon, 29 Nov 2021 07:31:38 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Mon, 29 Nov 2021 07:31:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm1; bh=+BCV6Pd9zYcEsRcKUjVhdGIAdSC
	fv8ZwrEmxyY3Q3js=; b=EmB/10uILe3E7k8ta0FcKiT+bhp27RsphyLzqBe7jLn
	ovizATU65sW/9RA/1RdPx3vAgHoM25qRH0jM2K/y1GvK9WVHLkboNc4rdXbtxvus
	9VhjwftyzfYWstA2mCV/0+tDDZOn5sZf8J2UBe1HnTbcfR98cugpEmF06D5Z0O5E
	pwRwJmCNk2UgXBrZppRR+9ObleE2t6sV2rHRytCDvS/8d2LafDbCW4zdERnXR/Kf
	PYwtakC7D/PIpe3FO4qMQzW1V8vna19tHX/hzMrBZcjnLOGyhMUnf/x+vzjO4WAa
	44ISF7RLhhY2cpfxC30nr8D3s5kNG0bLyxaCWRmxXJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=+BCV6P
	d9zYcEsRcKUjVhdGIAdSCfv8ZwrEmxyY3Q3js=; b=BgxyNewxIRdDp8MT0tHgmV
	DGVUSZfFeuraiEKW8dLuAP0QJU/WBz/Ghvv2jeo/gzXWliZCbCpgO08njQiHmEac
	W3UwyRXm0PekYsK8SKq9GlFNj6zHHPMpYBM/mht/RHlk2nuvnH+DDcjJ5pzKJI/+
	5d1slgOu24i6jFMf4/GQTKUFVeZboqaaBW2xEU2JU/ozL2k+1WQHPVNR7uagy08L
	52aG/xG27WLWx/6EyJ4FuxxdKn3jHhVOamDjUrFqafwyej5kHdzmr4ZbUrEYNMF9
	yof9W4r5FMLGQVg07PRwIo+znu58ydvXvVGtm8obQNWzs2NjYxI3Fq7WXcT9wQ0Q
	==
X-ME-Sender: <xms:KcikYY-uVNxAqtlX0UCnkoX-OzwvtlAG0q4ikyPejPP1byvOu213Dg>
    <xme:KcikYQvprBrtxG2s0WIQhzek-zZADa30UoO2jl30PMXExtbA9XueZN14v-5JclMv2
    hDsGDeCfVIRDsPh-c8>
X-ME-Received: <xmr:KcikYeBzgwwAUVNxqbqlX66e65RBUwzzTVbfaquJ1bfGOXtWvwZkLJPkvfaf2koznRpgWeQfERtsccvDLS0eJv2xNeZHVIhdEEU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrheelgdegudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
    udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:KcikYYcCd8VRDiXfXgjtI9lWfLAst0O5TmCoaQFUCfeBaroxGBoMVw>
    <xmx:KcikYdMhqaK9qAWQBaI3SRMP90hNgwLddRrmzKEfR5CJ2uIkEGe5uw>
    <xmx:KcikYSmV0d_HtPASnsFG6JYhytkjqbaSFGcK6JGu6RpYiv8eBgVWqQ>
    <xmx:KsikYfUsl0m6_iKk7uhFROdruLPv2KRGLQpDFxqhhVDZkRNzOG-HvA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Nov 2021 07:31:37 -0500 (EST)
Date: Mon, 29 Nov 2021 13:31:34 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: RFC: "b4 ack" to quick-reply with trailers
Message-ID: <20211129123134.7q5xpyy344btmzon@houat>
References: <20200417162845.uolobnt75ei6svtd@chatter.i7.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pumczjaomdpe6vdw"
Content-Disposition: inline
In-Reply-To: <20200417162845.uolobnt75ei6svtd@chatter.i7.local>


--pumczjaomdpe6vdw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Konstantin,

On Fri, Apr 17, 2020 at 12:28:45PM -0400, Konstantin Ryabitsev wrote:
> I wanted to get your opinion on the usefulness of this workflow, aimed=20
> at reviewers.
>=20
> 1. Reviewer does "b4 am <msgid>"
> 2. Reviewer performs the review as usual
> 3. Reviewer does "b4 ack that.mbox"
> 4. B4 sends "Acked-by: Name <email>" as a reply to the cover letter
>=20
> Acked-by would be the default, but can be set via -t "Reviewed-by", etc.
>=20
> This functionality would be easy to add, but I'm not sure if most people=
=20
> would just do this from their mail client and never bother using b4 for=
=20
> this.

I'm a bit late to the party, but I've grown accustomed to b4 ty and how
convenient it is, and I'd like to have that feature :)

Maxime

--pumczjaomdpe6vdw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYaTIJgAKCRDj7w1vZxhR
xS4hAP45ofr8baK6UA7K3UxyBRWN1Ei/47Pu4CxDi8Xb+3IhogD/WZKfdV7CmpfY
C35rSfQdygVQ4E8NcP3lypUQFiAgzQs=
=Q3UC
-----END PGP SIGNATURE-----

--pumczjaomdpe6vdw--
