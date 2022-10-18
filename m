Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952AE4C7C;
	Tue, 18 Oct 2022 15:36:24 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 7348632003F4;
	Tue, 18 Oct 2022 11:36:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Tue, 18 Oct 2022 11:36:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1666107383; x=1666193783; bh=dOGoFEzDCOrQHr8HH/kmj8m65pwksqMRwTa
	MO3oWsHw=; b=yIRxvYRZe/Lc2UYyDq0YBbPhvJZ6dIjUAXqaSVAYIDERkiz62+K
	zdRCntaH9paL7G0DHtnQ8CALW++p+0FnSWvGjGmqfu1XFsxN9H6CftW97bLI8q5q
	1HfNm+vXjoBSYID6r11nRc40NNsuM4R4YATEhLZgb6XybEkP0QXCIesBCe+qB2C3
	DN0iLpChwXktMUUOo5WxddaPGpuxzJHRU0FJ0VUVGjKHC3CROHXOU6aKk7DANUmp
	VYxldCmTMSgYjEgjxKhjNtlz0diToqUl5LO8Bcip+ywA8+UXH0KCFCBm2lgW8jxf
	69zTKVA4tG9PKnXGBh8C9qO49vPGEAV9Qbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:mime-version
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666107383; x=
	1666193783; bh=dOGoFEzDCOrQHr8HH/kmj8m65pwksqMRwTaMO3oWsHw=; b=a
	AIU1v2LaXgIbASUUzOCtJRid5Ae5Jlthm0CnzpyOiPiJTdVvHR4z3xQN/TtPmTfy
	KQIhI9tk7PUTPobSMROAqOvdEkEoQVrO/tQImPZnKPU8nYx6c7z5s+eGaCx/Fd7g
	DQ+rDSOuJaZzUoYxsWebsJYkK1RWsePD03rsZc4IryeQPIilZeRT6OQtVIwHlyxE
	rUaU1SoMYI9mlMM/lgPeo0IQ8mLC4HNYKdxUiG06ANaSG+Pl7mxfkwP3uFHxC3J4
	eCisgF6g5HWtlXwcOVtVuAS1IJn4n5IpOOV280AqzEjsx6h/gzkvMeis0jgAAa9S
	r80LwvoI3hVOjInjPbXBA==
X-ME-Sender: <xms:9sdOY3CU6diDcj9WpHa3wuqCpL2fchZ61Dgbsif5rD0N8ZrM79MNXA>
    <xme:9sdOY9jvBnYSSCMvcJNvAs3u-2tgZCLeYi_Wqji9d2PuH8WHl3IFfRUYn4BdCNFRs
    Mg98_UhxPpfLDDof8I>
X-ME-Received: <xmr:9sdOYymH8N4ptgd3mO26buyDziO8qenK8dDKaLd35uh4sfc72JRcj-Zxme4L>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeelvddgieduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkgggtugesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeevteeifeeuveekjeetvdettdfhudejjeffieehveetteetueegteelleefkedv
    keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:9sdOY5zOh3KSONIEY-xU7hLaMUJHVFs4lYbrjrV-FA2AXT1fev7dPw>
    <xmx:9sdOY8TkhsOULISNrSJxSaqh_T0-htg_OfjB3FyyVjJW-CSm1C_xvQ>
    <xmx:9sdOY8Ybjs-YZOpl08GWLSwlA5s5kHHvBjqDW3fWYgqQnh5NtspBVw>
    <xmx:98dOYyOe1Xr3IcKsklfAPckBcJzaGQjLLICXUjctxyoAAQMq93bTlw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Oct 2022 11:36:22 -0400 (EDT)
Date: Tue, 18 Oct 2022 17:36:20 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: b4 bugs / future improvements
Message-ID: <20221018153620.tyuedbldi2ofbe2x@houat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tkv4mbdxikxdqdfh"
Content-Disposition: inline


--tkv4mbdxikxdqdfh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Konstantin,

Thanks again for b4, it's really great :)

There's a bunch of things I have noticed in the recent weeks:

 - It looks like 87e0e464959c breaks msmtp which doesn't recognize the
   -f option, and will just error out

 - Generally speaking, rebasing a b4 series is a bit troublesome:

   - It's a bit tedious to do. One needs to rebase and then edit the
     cover letter by hand without b4 being involved. I don't think doing
     the rebase interface all over again is reasonable, but maybe we
     could add a subcommand to set a new base?

   - If one sends a version, rebases, and then runs b4 trailers -u, then
     no tag is found for that series. I assume it's because the
     change-id has changed, but maybe for series that differ from the
     last sent version we could also look for the last sent change-id?

And finally, and this is more of a feature request, now that it looks
like we have the list of all the older versions in the cover letter and
their base, could we have a subcommand to start a range-diff between an
older version and its base, and the current base and HEAD?

Thanks!
Maxime

--tkv4mbdxikxdqdfh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY07H9AAKCRDj7w1vZxhR
xRNZAP0aQLZhKsjnYkEJuarSxocKJSw7XWY7/NW9fKVHThjFLgEA0jRF6LZuScgV
ZE+1w+ZMCgkD9Mf4uY7su8xKP0+d7gg=
=SZWj
-----END PGP SIGNATURE-----

--tkv4mbdxikxdqdfh--
