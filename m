Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAFF7E;
	Thu, 20 Oct 2022 08:49:33 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 8EFC932008C0;
	Thu, 20 Oct 2022 04:49:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Thu, 20 Oct 2022 04:49:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1666255772; x=1666342172; bh=xXd9v9sHbQ
	EMJNQ8C5U4djoypVMeq8b0prrw/HC14mQ=; b=B+f+JngIsYBJQhBF8POupWVp8q
	R8AB+U20EnK9SVcTroAsJnDuzyz7T/gDSlSNMjk5WkrSvpOKebk2bv2Rv4AXNbdr
	+qacVbyYEPsGBLm9bLOwdLuFaw+jEJ5QbFercbOLOtVqaR3Rx0FkD9zIfQUpH4lh
	XJgwVf3yMZtBAciVTwP/kHN+8sX5rii1pRRkMQCni9uewcUxTJhRdtkJ2Cmcs4zO
	Z8VPFYhfHSmSjhx7KG5TYp/eNsTbEU1t+ECbCPMAkZk92pygu8i2H7Y1PrlaoK8I
	+u/3JUxlzL7sy22WJnHdFAPoPmsIsRC+V4uS65gxb7wSY7m9/SdS96y3zJKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1666255772; x=1666342172; bh=xXd9v9sHbQEMJNQ8C5U4djoypVMe
	q8b0prrw/HC14mQ=; b=KN4BEncOebMfZKOB2/z0Bu1nkkb5+MixW1mTYkAUgp7Y
	mHrraZxc0yxe3xsqrO6jkVuQTNaL1mhFdGSfy5Nq6uRHxLI+yCYMd7sx6CSKiQ9u
	F+J8AqPJHlRPDOhawcQjrOhIC3tShNRczfn5s+0HQHBpVZhxDV9cbal5OC+4AH44
	j6Sc+SK7dpTjdUYrTRK9LNT3Cjg7PJeuZkAxLZBIM2gn+XEUQQJCoY9nQmQLhxCe
	zSF8g1GZy/xdugs/djj5BMRVD7wO2ocGL7QoIgioohPN91oN03LhAha5NVQ/1HX+
	O/KkKhgrSN58WVyjYk/JaJNwMwdQCi8GsHZsoS2BSw==
X-ME-Sender: <xms:nAtRY7EVuJSL2lBdYvojnNv8-HrPsN2hc39POmB1yRmiWOMq8ThwFg>
    <xme:nAtRY4VeAHteq7DPJBEeDs3yvpqhK-REdZC0yErcT_rqY63buOwWhzzjyh6kquBxM
    KIcHlxrFjHLOIQf3ec>
X-ME-Received: <xmr:nAtRY9IUECQbYStWcpgSEq-4ajDV1Qp7oNjaIeGMyxX-YEd5z4N11tlQX3gu7adn3KfWuMVITSTmAuj32kpkyAh0U-kXJhm48kCJ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeliedgtdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelffevieehfeeltefhkeeufefhgeelkeevkeevheelgfeikeffieegfefg
    heffieenucffohhmrghinhepuhgsuhhnthhurdgtohhmpdhgihhthhhusgdrtghomhenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhm
    vgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:nAtRY5H1CGC02UT3YQcwM0Rj46ABuGapY9CwV1GbuQNawWXOvzSj1Q>
    <xmx:nAtRYxWZYEzb3RLU96i7s6iJlcRZI0bYYxVTNhavEqgJnrznGInbWw>
    <xmx:nAtRY0Oo7CTON7V7zPemf2jiXz2PuYkNa1HNFyUtAssVAYZwLsjXxQ>
    <xmx:nAtRY3wL8U0XV97GnNhxMBDkMKbV1U3f1VMiiqNb-q_NWVg4kMW42w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Oct 2022 04:49:31 -0400 (EDT)
Date: Thu, 20 Oct 2022 10:49:30 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 bugs / future improvements
Message-ID: <20221020084930.vpu552rag6gdvmvm@houat>
References: <20221018153620.tyuedbldi2ofbe2x@houat>
 <20221018201804.na5x7lohm4yszg5h@nitro.local>
 <20221019080140.zc42aqi7gwjpvczs@houat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ye6ojrjmp2wcx44i"
Content-Disposition: inline
In-Reply-To: <20221019080140.zc42aqi7gwjpvczs@houat>


--ye6ojrjmp2wcx44i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 19, 2022 at 10:01:40AM +0200, Maxime Ripard wrote:
> On Tue, Oct 18, 2022 at 04:18:04PM -0400, Konstantin Ryabitsev wrote:
> > > There's a bunch of things I have noticed in the recent weeks:
> > >=20
> > >  - It looks like 87e0e464959c breaks msmtp which doesn't recognize the
> > >    -f option, and will just error out
> >=20
> > There's got to be something else going on, since -f is required for sen=
dmail
> > compatibility. The msmtp manpage specifically mentions that is supports=
 it:
> > https://manpages.ubuntu.com/manpages/trusty/man1/msmtp.1.html
> >=20
> > (see under "options specific to sendmail mode")
>=20
> It might be the auto argument that confuses it then? I'll check.

So, here's the behaviour I'm seeing:

$ printf "From: <maxime@cerno.tech>\nTo: <maxime@cerno.tech>\nSubject: Test=
\n\nTest Test." | msmtp -i -f auto maxime@cerno.tech
msmtp: recipient address maxime@cerno.tech not accepted by the server
msmtp: server message: 504 5.5.2 <auto>: Sender address rejected: need full=
y-qualified address
msmtp: could not send mail (account default from /home/max/.config/msmtp/co=
nfig)

If I drop the -f auto, it works:

$ printf "From: <maxime@cerno.tech>\nTo: <maxime@cerno.tech>\nSubject: Test=
\n\nTest Test." | msmtp -i maxime@cerno.tech
$ echo $?
0

It seems to be related to
https://github.com/marlam/msmtp-mirror/issues/51 except I don't have
set_from_header in my config. I've tried to use allow_from_override and
force it to off, and it didn't help.

Maxime

--ye6ojrjmp2wcx44i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY1ELmgAKCRDj7w1vZxhR
xS4UAQCOa6JkoQxjxoFbp45JBFVJdzKs6Jxjk+aric7wT3azfgEAhdXzei9r1Mlf
SAiK1edDaXqChhbledGSYrfDzHhEtAA=
=7oM5
-----END PGP SIGNATURE-----

--ye6ojrjmp2wcx44i--
