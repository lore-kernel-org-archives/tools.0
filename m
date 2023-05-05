Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A78BED1;
	Fri,  5 May 2023 07:17:51 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id E22733200A35;
	Fri,  5 May 2023 03:17:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 05 May 2023 03:17:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1683271069; x=1683357469; bh=Au
	r4yXXgr8CGCAfxf7GLmncgxPRSt7QpPB6j2f6oqhE=; b=g9qzYwLwnjhd0K/heO
	z5td4AXV5KBo8zwxpaGm/jLcFNtrMgHmwcKaL4+/vxS58QF8yoImki1BYOyCtblf
	PHoatXkb6P1SAK48Gim2+UamAmdeFYwp3VQOX/1EtnFX/vOED8Ra0+tjUMKjv8eP
	x/9XfpTC+Qa66Ukf3GWUH5PEdltCYBGkDSriBpF24CJI4Tw0dPpW0YhE6VjteqI/
	beLjmLfKKCws/w6FVuC6M1yJaLnEF9lSwJ9A2TaZeuItLze4VdkuSMzfS0vNHQm8
	IoBW3Q2XYrdY6lrxkMz2mTtZj5cXpaz3XGefWr8X8cGo4TSyoKiWLoQTx2lq7x8z
	Mhhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1683271069; x=1683357469; bh=Aur4yXXgr8CGC
	Afxf7GLmncgxPRSt7QpPB6j2f6oqhE=; b=PRWbK65D9TQD3HpOM6lScg3by6akH
	qf02bpQCEqEPjzRaqxXGmGcBEGny+ZwvKEhDaGZgR6v3InW74Sg8Pi2TKN8QIbuI
	7M29IBBv9hSBr2kZMC12FEvSRQ6DX1ZqCPYV0+B7TF9AgJ/7wUcUa+Pa1uGar2QW
	enIHDkHGNhSnkhhh3stfDSVQkadWekaexH2WQaGr9QJlkm8aNcnZ7CNXRlAqHu6a
	VS5SKDw/gwrpz7CuB1A/glFGRUU+Nv5a/eqRGlNDJE2cwF0sw60CfrBDAwrKGGK0
	cHzIWzCed0XSURDDdf2NinAiJjC5R8qMJqiWzRLcAVXkJCIv8UZ0v9FEA==
X-ME-Sender: <xms:na1UZKUw5zFXUscA1a8AgzJJVdmz-MhEdbUV1ZGnTQTiVmEkW7KHSw>
    <xme:na1UZGkQNiv19RH4orN9eHFHu7HN5grMGEcJKknwqgWMLtHpnwip4HaNiSmLlX0qb
    YgA28iGyIBW5bHMcfI>
X-ME-Received: <xmr:na1UZOaq7x6Kna4MUq-ytO0gfheB1LhI90xdp23jv2Fzrc-maE0a1VgjbOWK8aP-tQrMOmrfnVzDRTl-lImaqkKRLD6K0M4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefuddguddvtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtdfsredttddvnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepiefhleektddvtdeghfeuffdukefhhedtjefffeetveffgeeujeeifeeh
    udeiteefnecuffhomhgrihhnpehusghunhhtuhdrtghomhenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgv
    tghh
X-ME-Proxy: <xmx:na1UZBXUgcTDNMLeR6aygDwry-UQzbX5cv8lgnd94Tjas0PVKvIMeg>
    <xmx:na1UZEnvcUVAC40beJWdX3_81NZQ0SVWOqJEfEGoFy4OOxh8gtidxg>
    <xmx:na1UZGcUsVRDRMibvdXSSD_GrElpntFD5uzj8JD3E0hcm128-ZU0Ig>
    <xmx:na1UZFAFDTFYAADgaK7OF5jRX4Dy3iScRMKrRsoakcKJKlt8FiZmig>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 03:17:48 -0400 (EDT)
Date: Fri, 5 May 2023 09:17:46 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 bugs / future improvements
Message-ID: <gly2lv2p2tdppodcuosuo5ukwuqkxj5oapq3s6mmgizwqypiyc@j6gr6h3hpsxm>
References: <20221018153620.tyuedbldi2ofbe2x@houat>
 <20221018201804.na5x7lohm4yszg5h@nitro.local>
 <20221019080140.zc42aqi7gwjpvczs@houat>
 <20221020084930.vpu552rag6gdvmvm@houat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o5ormz5wzpnjenow"
Content-Disposition: inline
In-Reply-To: <20221020084930.vpu552rag6gdvmvm@houat>


--o5ormz5wzpnjenow
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 20, 2022 at 10:49:30AM +0200, Maxime Ripard wrote:
> On Wed, Oct 19, 2022 at 10:01:40AM +0200, Maxime Ripard wrote:
> > On Tue, Oct 18, 2022 at 04:18:04PM -0400, Konstantin Ryabitsev wrote:
> > > > There's a bunch of things I have noticed in the recent weeks:
> > > >=20
> > > >  - It looks like 87e0e464959c breaks msmtp which doesn't recognize =
the
> > > >    -f option, and will just error out
> > >=20
> > > There's got to be something else going on, since -f is required for s=
endmail
> > > compatibility. The msmtp manpage specifically mentions that is suppor=
ts it:
> > > https://manpages.ubuntu.com/manpages/trusty/man1/msmtp.1.html
> > >=20
> > > (see under "options specific to sendmail mode")
> >=20
> > It might be the auto argument that confuses it then? I'll check.
>=20
> So, here's the behaviour I'm seeing:
>=20
> $ printf "From: <maxime@cerno.tech>\nTo: <maxime@cerno.tech>\nSubject: Te=
st\n\nTest Test." | msmtp -i -f auto maxime@cerno.tech
> msmtp: recipient address maxime@cerno.tech not accepted by the server
> msmtp: server message: 504 5.5.2 <auto>: Sender address rejected: need fu=
lly-qualified address
> msmtp: could not send mail (account default from /home/max/.config/msmtp/=
config)
>=20
> If I drop the -f auto, it works:
>=20
> $ printf "From: <maxime@cerno.tech>\nTo: <maxime@cerno.tech>\nSubject: Te=
st\n\nTest Test." | msmtp -i maxime@cerno.tech
> $ echo $?
> 0

I was finally able to figure that one out.

Git configuration option sendemail.envelopeSender has a special value
"auto" that will use the From address and pass that to sendmail's -f.

b4 uses sendemail.envelopeSender directly, passing "auto" directly which
results in the behaviour described above.

Maxime

--o5ormz5wzpnjenow
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZFStmgAKCRDj7w1vZxhR
xehbAP4xKPTc+E8NMgsVjA4mA3KQPVRoJL9hYElcMvKSaQKlVwD/eOb3k+Eizzzn
yqJjAAi2QYmhp+7BicFQwljjgfw0pgg=
=QPKC
-----END PGP SIGNATURE-----

--o5ormz5wzpnjenow--
