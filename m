Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=3; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794769242;
	b=zi56fmV89X1Xo8NbKYyaVmPoTRWOF/Ic7N0ecDUL55d6P8WrBmVWuAjQe4Mg4UpGcUvC
	 dpjOiAjVYq50Jb1eUewzdeorHbiPLUVWU4aIfmIXqQZcuM1AQomyo4Cv+vQfS17v4r5rf
	 5rYnutnVikCv1Hl4k3fvL+x7yiAWmM5c9avGugTsTLx+y+tgf7bEUs49rXmpBVtlPQuys
	 aVoNjXAcqNTnvHQQeLQyem9uLesf64bcr4fspD5urL0RDIicTK+FJhN0Q5L+H1MI5+cqn
	 W3W81NzG3xsZ+RWdyX1JzzvfMjgvo3AK0SyclGSBpKx6/njDdXsPDYEL+c680ecu+9Q==
ARC-Message-Signature: i=3; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794769242;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:DKIM-Signature:
	 Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=m49LifZTDrMOW7txRk/FbY+HORZf84gaYgjrSgOSm9Q=;
	b=pj0c2JyEeZ9Tys8VZlXNsq1UwHX0XLEx+TTevWcPi8J677jDHKfTRAEKEYX4jPSH8xs9
	 MDfjUhyWU1uOKz/o8snXm2Tk4mugFstvX2pffYJzMHUj581bH45m7oM8VznmX0q6kdiet
	 aIAhdKI9VLnwICHySYB0fu8um9sNjOc1bLK2nW7EIh4vtCvwjFVP+Zd6saM32Mbmt6bHS
	 7i+flpjq1XoqdTmVGygqjNas66up2jLHd7qD8bjQ+HEbxA4s9X5K37ohWg8R4Imf6iVBn
	 97S3U8l8aRtPz5nI+EWg9oDOeTO3l9QETBWtwal6gV/D3rTE2ME2S3+iy+rPqItqaCw==
ARC-Authentication-Results: i=3; smtp.subspace.kernel.org; 
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=NePdxLEG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D7A606A31E
	for <tools@linux.kernel.org>; Sun, 15 Nov 2026 19:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=NePdxLEG
Received: by smtp.kernel.org (Postfix)
	id 111B51F000C5; Sun, 15 Nov 2026 19:00:42 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1794769242;
	b=sDG8L4CjWHhAarnBsPEgf+ZQaMnJSo1EUEAIbAP0YtRdCjjGQskXgmlDh1gKRga6H51f
	 9cKywNRZH6s+rkSw1vlUoEsmGuG4nOhdMWMPkGKsDeypifM27rROh2293vs2rImUE2xPG
	 DdCbFdUUtvRFYUjpvhXGB7KSh0D89UtndW4c46lAAdnMyOkc0DK8lhGbG3JLKdVSLbRHe
	 HvrH9URS0wgLsPNefh1edpZVPOK1zlqwf3HWR+HPexcBvk1RcjbuKTp01KU1ISdneDphV
	 DEbJ5naOe0b+gc0cko39bP3WV0gdDGBRiagZVI5MDcVHu3umzMvKdtScFANA7jY6yDQ==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794769242;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=m49LifZTDrMOW7txRk/FbY+HORZf84gaYgjrSgOSm9Q=;
	b=20vc1tvujXHlhaVFX3+UwMQGvC8rfaV22dCvd9zKrDQrdbp1WzY5fTPKNTjaK9dEHyLk
	 4zlfXs2qyOPtwiXT0oGAMYQ8YK6nEAdJwB8tWpkWfH/vkwR1uS5vJc7Y5AjavB7pQMT13
	 esKI127baz3s+x2tFyBps9aBkMco4rYFaziFCtM+NCc0m6fB8/RErotI4kvc3qxFnZLAm
	 rO2lom/Re+Nk2I8BrhbZHE+5VDS0+mRVwLFrfonaNMMVqdqmWjzF/I1pajNvDEjodvu1S
	 86cV37iK9uQ9mEn8C+ArXhHh52w0UuIj8h04JFADdtvzPhP2hurLZZWTTRKD0iI4rDQ==
ARC-Authentication-Results: i=2; smtp.kernel.org; 
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=NePdxLEG;
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 253E41F000C4;
	Sun, 15 Nov 2026 19:00:32 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=NePdxLEG
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 253E41F000C4
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id EE590201BC8;
	Sun, 15 Nov 2026 20:00:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794769230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=m49LifZTDrMOW7txRk/FbY+HORZf84gaYgjrSgOSm9Q=;
	b=NePdxLEGZgfuwCzPP/uRuIQuJVitTHKuD1qklNgKfzuOphavbT3NXVfvZeVJIB9NN72Rvo
	WBQAzT1U5cpKPyZNwm31LPs7of1tq0aoLr+tazadzyISUnbhJ6oL7ZnMinyNWNpukWpZ6y
	CfaxamVxdpHCr+ofrACk+baTBDKynslNpn6pkI7lsxnfEt9XoVNfn558/aUAg/ZIqZ4GIA
	DXk4ODF6CWbUrChozXQ/IOd4E/400zuTCKAeLzC62abQvR96lZjIMzzA+frGTLAYs+4oOs
	JJXXUh6nXPnTLnSKIfTQ3k4FYQ1ZugVourVYN3r2ydar7H9rKtnwJ3STd1xi8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794769230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=m49LifZTDrMOW7txRk/FbY+HORZf84gaYgjrSgOSm9Q=;
	b=DmHOfAtsPlO4Hjf6YSZ2DWjc23FVsb0KM+cBwLe1/jE1NyDwlNWKalPpsRJdzsITt62fQG
	P2qqURNMV2qZSeRxHi4U5wHOf2Wx0tcTsvyJfGIIoqcpEGRicW6xltVnPFAngjFeaS/+Gq
	oZ6RUT8/pZb0EYl7ViVE7uPjCu0F0jcKeH2OHSKT6rYNtcC3QIIp5OSkyI94yCZOgLsZ2t
	gLZjJLRtCct3kLcfn12iYPBFMIe6YgXxy6xcSL4btm2Rq/hOuWewe6lxPlbMYSMRn6Ov66
	mFz00sl5MbXrfSrjkGyPPkY1IW0dCEWtdN05+F72R6285yP/CoEvM5jWczyJaA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794769230; a=rsa-sha256;
	cv=none;
	b=c/IQOWD7b20kScTayogYkY+XBnYD5+MkGcRTMgcSDG/s+NIyiBXtk5rvebvi5/AvnZ+AxE
	D64VcwEUleNUJCrzMuBqexBOW+kophQpFszeElXARmuz6sYM0yT6ne1PPuK6KkcqJr1fMS
	Shcv2DmOg2O96oXu8SdezBdlH4iBrnyCMKaXTT9b/7N9pM7xEdJjLWAykKMLkBx5JjQvZ8
	iN3BxivcNIkojazxfWRGmL32chz0aABlnW1XvDRZ5WjfMit7t79rxK+7cq/zONLu7VSjQj
	pIoAKHcKHSJ2u7erpMlrfLsSMJ78CnvIFd6K8HD5hHNERVlZCRuYazAaHL5+Tg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=mkl@pengutronix.de
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1xSfSo-004K84-2l;
	Sun, 15 Nov 2026 20:00:30 +0100
Received: from pengutronix.de (p4ffb23c7.dip0.t-ipconnect.de [79.251.35.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 952D45EC625;
	Sun, 15 Nov 2026 19:00:30 +0000 (UTC)
Date: Sun, 15 Nov 2026 20:00:29 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: tools@kernel.org, users@kernel.org
Subject: Re: b4: include git notes [feature request]
Message-ID: <20261115-wooden-rigorous-tody-62592e-mkl@pengutronix.de>
References: <20261114-rapid-diamond-skylark-6d6cc6-mkl@pengutronix.de>
 <20261115-cherubic-eggplant-kakapo-0bc1a9@toolbx>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tcaaympzwnfukhgx"
Content-Disposition: inline
In-Reply-To: <20261115-cherubic-eggplant-kakapo-0bc1a9@toolbx>


--tcaaympzwnfukhgx
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: b4: include git notes [feature request]
MIME-Version: 1.0

On 15.11.2026 10:43:14, Konstantin Ryabitsev wrote:
> On Sat, Nov 14, 2026 at 10:33:47PM +0100, Marc Kleine-Budde wrote:
> > I'm using git notes to track additional information for some patches.
> > Sometimes a FAQ section for our AI overlords^w review bots, sometimes a
> > note why checkpatch currently creates a false positive and a link to the
> > discussion, etc....
> >
> > When sending patches I want to have that information after my S-o-b, the
> > '---' and before the diffstat. After adding
> >
> > | [format]
> > | 	notes =3D refs/notes/commits
> >
> > to my .gitconfig, plain "git-format patch", does what it should.
> > But "b4 send" doesn't. Is there a config option I missed?
>
> The reason we haven't done this before is because git notes used to be lo=
st
> until recently when we switched to using libgit2 for history rewrites. No=
w it
> should be possible, so I'll look into it.

Thanks for looking into it.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--tcaaympzwnfukhgx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCavoBSwAKCRDMOmT6rpmt
0lGRAP4+sSsmK2YZ6g78RhpY829JMsDIjhEOGS4xE1J7OIQqvAEAkMnwu8TYxIcW
2qLRVgyf/fT3kGXPQywNRCK0iAxvEwA=
=cFgB
-----END PGP SIGNATURE-----

--tcaaympzwnfukhgx--
