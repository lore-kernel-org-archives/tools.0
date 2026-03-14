Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5911D1E8823
	for <tools@linux.kernel.org>; Sun, 15 Mar 2026 13:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773582255; cv=none; b=DZb4ZgnTcBpekQkbOvIxxLTzktgR1NZHvD0xy+5yZbDUUkMlXt0ANRjPniFZs1ZV3rPh1mGAJumXMFu7BF/nWBkqANkmsnw0h+lB1+INMZ6PTqc7zR1EEmc3MuureZyISfgBVfyEefFLP/l3xulWDO3qNGpbjNAN/eEsZiOwFlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773582255; c=relaxed/simple;
	bh=QtC6T8Ui2PcfNGD9uuo0RStVPETPlm68r6/wICem19g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jk7ObXe6SNJrC4wzvLWVi3pod8SxlPys0BDetUR/HpE07tw0jq49+4gIZ2G41S69JimimAU5x5iWEAZ0sOk+DVryBqaRV0J4pwCn9EkExbEpvLjx0hjDZ1f+Ay3M6MW9CDq8KPC0uQLt5wDDJ5Qmqa2xvEtDPr139CFvU2eTMAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 25916C2BCAF; Sun, 15 Mar 2026 13:44:15 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 27EBEC2BCB0
	for <tools@kernel.org>; Sun, 15 Mar 2026 13:44:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 27EBEC2BCB0
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1w1llC-0004D0-BU; Sun, 15 Mar 2026 14:44:02 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1w1llC-000PiA-0V;
	Sun, 15 Mar 2026 14:44:02 +0100
Received: from pengutronix.de (p4ffb2dc6.dip0.t-ipconnect.de [79.251.45.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id B6A41501957;
	Sat, 14 Mar 2026 09:27:47 +0000 (UTC)
Date: Sat, 14 Mar 2026 10:27:46 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: range-diff hangs
Message-ID: <20260314-slim-terrier-of-tempering-996754-mkl@pengutronix.de>
X-AI: stop_reason: "refusal"
References: <20260227-imported-aromatic-guppy-ad3dca@lemur>
 <20260304-courageous-deft-skylark-a16e39-mkl@pengutronix.de>
 <20260314-bouncy-lilac-mammoth-d6e6eb@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rl36npdaaq4n3zvk"
Content-Disposition: inline
In-Reply-To: <20260314-bouncy-lilac-mammoth-d6e6eb@lemur>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: tools@kernel.org


--rl36npdaaq4n3zvk
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: range-diff hangs
MIME-Version: 1.0

On 14.03.2026 00:20:47, Konstantin Ryabitsev wrote:
> On Wed, Mar 04, 2026 at 09:56:35PM +0100, Marc Kleine-Budde wrote:
> > On 27.02.2026 14:53:07, Konstantin Ryabitsev wrote:
> > > TLDR: "b4 review" is a terminal UI that hopes to streamline a lot of
> > > maintainer duties. A getting-started guide with screencasts is here:
> > > https://b4.docs.kernel.org/en/latest/reviewer/getting-started.html
> >
> > I'm using b4 v0.12.0-419-g18f8fdb27a22 and a range diff "hangs":
>
> > | $ git config get core.pager
> > | diff-highlight | less -RFX -x1,9
>
> I believe we should be handing the | in the core.pager config now, but pl=
ease
> test out the latest master to confirm.

Thanks, latest master fixes the problem.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--rl36npdaaq4n3zvk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCabUqEAAKCRDMOmT6rpmt
0mlnAQDHwC7OFKWE0SuS4WRjXxKNMEeMRnWPV+gvGfxwGyC5QwD/WfKKQBZrwEZA
UCiMZkInC7v9xJXr5hoyw8p19Jm7pgo=
=qxq8
-----END PGP SIGNATURE-----

--rl36npdaaq4n3zvk--
