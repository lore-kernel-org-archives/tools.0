Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E8D1FBC;
	Tue, 16 Aug 2022 07:39:41 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id BE966320089C;
	Tue, 16 Aug 2022 03:39:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Tue, 16 Aug 2022 03:39:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1660635580; x=1660721980; bh=5ICrNS1Fq+
	N4emCxbIX+q2FhpFn0mjCoDm4UUiOOECs=; b=ZRQiYEB+4AWxcGzyUuI/GRx2jN
	BmCtIAzs0/FFHZGIu+gtXU9sylh+aZrWAL5kAvdMTTHnBMeZ2NWH1gsy2pOFhqsI
	ijgrvBRFTvS3RILUWI72IBTH4WDh8iQbZIHWvdlvttEh3KNmjsGbEWh3UjeZZfOB
	Ol9Rj0C0VLNthctzYzS8fKTS6WjVim81dIv24/1vsPOYMx+7MCR3/98vvsViYoap
	d/MBanzhGUXiE0wrJF1xozE6bSFlxPjuGQEH1iWituQImRVyUePiwfKo4YE5yGVQ
	T2epknK3OKDNznI9DpX0LKN59lK68CgCHGgIxrutsX/Gv+jxUmt8xYSbsohg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1660635580; x=1660721980; bh=5ICrNS1Fq+N4emCxbIX+q2FhpFn0
	mjCoDm4UUiOOECs=; b=a/ZHge1qXCYp46+ohNsragj36khIHWAvRZDmn9QIaIZJ
	FyXDXC5DI/LW4o4wZyjPEjJSQUvDLr9RHNe69ugazBVA/aqt4SgoA9Ge4h8UbWTT
	xmJNnI5gR+8xUeBTo2xyTMzHjtShItPzugvfmcxOnheStvOZPYwtj3gBsp6dGmMr
	VXU2tUb1ILSq9CSmFwdKd6hATTd/XgtDsEp9cps2oncNVNprm/Fc5fQ7Q1Jt3tK6
	0ggewAFuUbKnt1heSzd/OleJojbOdkTdjhdjUPYEqHfAFDwdvtH7zh1c+4VU/tuV
	0WWMDYIYSlr8f+k1lZWT38bU0HBOdvljgJw1oayJQw==
X-ME-Sender: <xms:vEn7YvZP-hSiapICHICaMRVDT9H75W8qV0ZyLutbkqcYqYbyGizsVw>
    <xme:vEn7YuYrKSVkoYk8jApI6rX9D8SMW1Ubzy9FEh1HsYlnpK9Pncloz-stCjcVea4v6
    ddF1_7SBhqvv20aaC4>
X-ME-Received: <xmr:vEn7Yh-tYLPWE5se0EFnYV7Qx7n2z-_29FYnvMxsPuY1l4GGFEHtzlOYv9E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehfedguddviecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepteefffefgfektdefgfeludfgtdejfeejvddttdekteeiffejvdfgheeh
    fffhvedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:vEn7Ylr8Kvu1TcVPNB7as0VSiTlyJJWMhFvJJJkww3rUAqmt_snyyw>
    <xmx:vEn7YqoSQnv_S2yQtqQrsrGxmiGgqQQ7TD8xBG_kpsQlSkokoiir2g>
    <xmx:vEn7YrRKhfmWLJ10ClujTw_RCEjK-uCkvkD9QwY7hhZFd_WjZ-_77g>
    <xmx:vEn7YvB4n4252v1zV9FlfuLFiFNL8pqHrjW8lhjE9swma8NwbXbjmg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Aug 2022 03:39:39 -0400 (EDT)
Date: Tue, 16 Aug 2022 09:39:37 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 submit ready for beta testing
Message-ID: <20220816073937.22tn2y6nfznpbiip@houat>
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>
 <20220720184835.uhnkucai54alhgo6@nitro.local>
 <20220728160418.sgfns5jsisjsz5hr@penduick>
 <20220728162434.eedqnx42sezb2vbe@meerkat.local>
 <20220815161757.yr5vkjuoulsy226g@houat>
 <20220815170518.ydthz47bfz4myggq@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q4yjqpqkdgdhczft"
Content-Disposition: inline
In-Reply-To: <20220815170518.ydthz47bfz4myggq@meerkat.local>


--q4yjqpqkdgdhczft
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 15, 2022 at 01:05:18PM -0400, Konstantin Ryabitsev wrote:
> On Mon, Aug 15, 2022 at 06:17:57PM +0200, Maxime Ripard wrote:
> >   * b4 prep -n will create a branch with the tracking commit last, but
> >     b4 prep -e will add the commit first.
>=20
> I assume you set your strategy as tip-commit, right?
>=20
> Can you give me some further details here? "b4 prep -n" will create a bra=
nd
> new branch and create the cover letter commit right at the tip, so it's t=
he
> only commit past the fork point. Is that not what you're expecting?

Yeah, I got confused by -f

I was expecting it to create a new b4 branch reusing the current branch
I was on, and adding the tracking commit at the fork point. But I
realized after sending that mail that it wasn't really the point of -f
anyway, so it's more a PEBKAC than anything :)

> >   * If we have a branch tracked by b4 (and using a tracking commit), and
> >     we want to enroll another branch based on that first branch, b4 prep
> >     -e will refuse to enroll it stating that it's already tracked.
>=20
> Yes, I have not yet implemented a way to have more complicated topologies=
 than
> that for all strategies. I.e. this works:
>=20
> -A-B-C
>     \-B4A0-B4A1-B4A2
>     |-B4B0-B4B1-B4B2
>=20
> But I haven't really tested various gotchas of this yet:
>=20
> -A-B-C
>    \-B4A0-B4A1-B4A2-B4A3
>                       \-B4B0-B4B1-B4B2
>=20
> Which basically means that multi-series are not currently supported -- but
> they will be once I get most of the basic kinks out.

Ack :)

Thanks!
Maxime

--q4yjqpqkdgdhczft
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYvtJuQAKCRDj7w1vZxhR
xXT8AP4hoKGfXXipzNHXmWKsyFBiMmtU4wqbQdF3hA5Je9UhZwEAv39Ov6+4tCQU
a3iEisWYj69fQwf4zKol1d5hktlPGww=
=M+Jc
-----END PGP SIGNATURE-----

--q4yjqpqkdgdhczft--
