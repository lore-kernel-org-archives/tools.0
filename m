Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E050E2914;
	Mon, 15 Aug 2022 16:18:01 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id C8CA03200972;
	Mon, 15 Aug 2022 12:18:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 15 Aug 2022 12:18:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1660580280; x=1660666680; bh=6LdlUZCA+v
	ew5xQY+O7osX/jO1wo6mgaDUvfizjLxKY=; b=qlmcPXE7lxalS/NPybmRWdDmw5
	BzItirOtjispsvgBe0N1OAdAFS2LXnJDd2W8SlxwncQAZHBMmc+6nEpK+66uKGqh
	D1hDA6nYMT1fOA+7HhS/ysQfr+H2B9ZkLQ9B5RQGgXhA6tqM6I8OlVoDKjfxJdhh
	xl6lp9q8x5wn45PXjqpHO2m5r0+EZKoFHfstUUmHIIowl6aRV2OtdMxNwh2HP5g1
	HcldnWxugwTk7Ds3Q4CCTCAXuIQLdikDz4LzvEWWFG9rpS/GnWpPH9PV7f96Fxza
	0ax5ilCUukcJ3aodpV911MvpH+A360JSDMN/X4dc9A/JYfS65sceZBD3zcVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1660580280; x=1660666680; bh=6LdlUZCA+vew5xQY+O7osX/jO1wo
	6mgaDUvfizjLxKY=; b=jT/WBxRp9Hn+CdhNUFrD1X4oEAjOU1/2ke+ZJ3yTQW1a
	BpFuq+TlqoSnzr0prVPNWRYHXOJV4h1415lOwRk2O9RZqCUkqj2YS8r9byr/CRa4
	rvgRkil86DwJxJ7mxCo5dw654Hc+5ij0RM83WQjvwwEvy1JWWSWs9RLCOjQI6h9z
	NVwV73b8MaGpZ9gQED5KE8IsxXipvapEq1JCOArIUtWO4JTbdFEGSqX6VrjA/9L5
	Rnasz56KAMPs9bcBnqV1KKWZnZ8Vqbpkzij8kEflcA4pW23b1vKusd6vrGN/mEU2
	9TMh9X/wljEvmxMB7vUkFfIZy58eoGCX5hDHLRJ2Vw==
X-ME-Sender: <xms:uHH6YrL022ecI-S8HsSGVzXdsEUwBhwW6tkijMcQO43vrHI7MjVCqg>
    <xme:uHH6YvI3jQ6gvY09EjtmYkvhI6zj7JaM5_ezv9DP51F3cm9uc7gFml-y29XwWF1hx
    rHReG22jg1BOUgvQVs>
X-ME-Received: <xmr:uHH6YjuW3HizSuJTm_evql1yKSelxyMs-jmyQhMUrvfzXJF8IRTmqKZvdnN1>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehvddguddttdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepteefffefgfektdefgfeludfgtdejfeejvddttdekteeiffejvdfgheeh
    fffhvedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:uHH6YkZlLJLuuIQjuK0Xyf4PkmquyCj8m9fqIJU7_kuT02Bp0hzDcQ>
    <xmx:uHH6YibHr2yKPde7h__iaW2Ynz-MmBUhrxhV8_Km2qXWExxqeDcLLw>
    <xmx:uHH6YoCLsj8PP1UCxLchVGt0tlpc9G2uwjehBK6Gqqu77k8jTbjX7w>
    <xmx:uHH6YlyTFKPR60Sm2ah1JDv2OLN8Dg_6H1dqxiiFvpeVCGFlY9fxPA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Aug 2022 12:17:59 -0400 (EDT)
Date: Mon, 15 Aug 2022 18:17:57 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 submit ready for beta testing
Message-ID: <20220815161757.yr5vkjuoulsy226g@houat>
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>
 <20220720184835.uhnkucai54alhgo6@nitro.local>
 <20220728160418.sgfns5jsisjsz5hr@penduick>
 <20220728162434.eedqnx42sezb2vbe@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="727gkvu6n6nivn36"
Content-Disposition: inline
In-Reply-To: <20220728162434.eedqnx42sezb2vbe@meerkat.local>


--727gkvu6n6nivn36
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 28, 2022 at 12:24:34PM -0400, Konstantin Ryabitsev wrote:
> On Thu, Jul 28, 2022 at 06:04:18PM +0200, Maxime Ripard wrote:
> > I've started to test the current master (9e95d523c9b9), and there's a
> > typo in b4/ez.py:
> >=20
> > sed -i 's/crtitical/critical/' b4/ez.py
>=20
> Thank you, fixed in the latest master. I'm surprised pycharm didn't compl=
ain
> about it.
>=20
> > I also have a branch based on an linux-next tag that I'd want to enroll,
> > but it looks like we can't enroll branches based on arbitrary commits?
> >=20
> > Neither the commit ID or the tag seems to work:
> >=20
> > $ b4 prep -e 37b355fdaf31
> > CRITICAL: Could not find common ancestor with 37b355fdaf31
> >=20
> > $ b4 prep -e next-20220714
> > CRITICAL: Could not find common ancestor with next-20220714
>=20
> You're right, we should support this using -f.=20
> I'll work on getting that in.

I've used b4 prep a bit more, and a few more rough edges:

  * If the repo has untracked files, b4 trailers errors out. Adding
    --untracked-files=3Dno to the args list of git_get_repo_status
    makes it work fine.

  * b4 prep -n will create a branch with the tracking commit last, but
    b4 prep -e will add the commit first.

  * If we have a branch tracked by b4 (and using a tracking commit), and
    we want to enroll another branch based on that first branch, b4 prep
    -e will refuse to enroll it stating that it's already tracked.

    It seems like this is due to is_prep_branch() returning True because
    find_cover_commit() will consider the entire history and not only
    the base..HEAD range.

Thanks again for working on b4
Maxime

--727gkvu6n6nivn36
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYvpxtQAKCRDj7w1vZxhR
xZUeAQCCV/qMKUhoJKevndOqjMepFfxGtlpMqXcB723vUTwHQQD41qVtVQtc3WTb
pyVT+0AD+mqfNiUCvNQQ5VawRbwVBg==
=ZU8r
-----END PGP SIGNATURE-----

--727gkvu6n6nivn36--
