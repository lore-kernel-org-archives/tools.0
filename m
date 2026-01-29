Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B9937AA90
	for <tools@linux.kernel.org>; Thu, 29 Jan 2026 12:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769690162; cv=none; b=iRxphAfn/WLDajZYYsPMXATdqEsl1VMZGZrp8gnNG7D/u/bk6D4JQcSGLH8EvUq0f96nQKvt58rDhJ7lxlwNDnJzRaB6j9uLVA7HMUe7A79Qt+m+42EceGC/ij6dhFmlLRUQnoOSZPc5051whVoPYcDi/8m4PFmC03m/zawOroQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769690162; c=relaxed/simple;
	bh=dQAe9ckq//bZ4H9nFp+s/GCB+ITknqiVnKHP+WIEw1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hZ0WCGc/82WaQQuJ/d1SZTuZjGYNgzjxtlmT4buYQ4F66JPZkyXO6r5DzakNEbNEjPnMVli/LhMN4bm61X1zj2vtYu1ccnxMDV8czElHGozaNL8UiCtFgrsI7EUMLuWb+jLKSXFEcXMYgKYAROpuawFEQzUipC/P7QdDKCgd50k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 8738BC19421; Thu, 29 Jan 2026 12:36:02 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B28FFC4CEF7
	for <tools@kernel.org>; Thu, 29 Jan 2026 12:35:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B28FFC4CEF7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1vlRFX-00032q-BW; Thu, 29 Jan 2026 13:35:51 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1vlRFX-0035NU-1r;
	Thu, 29 Jan 2026 13:35:50 +0100
Received: from pengutronix.de (p54b15bf8.dip0.t-ipconnect.de [84.177.91.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 9456C4DB1DC;
	Thu, 29 Jan 2026 12:35:50 +0000 (UTC)
Date: Thu, 29 Jan 2026 13:35:50 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Oliver Hartkopp <socketcan@hartkopp.net>
Cc: linux-can@vger.kernel.org, tools@kernel.org, users@kernel.org, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: b4 prep --auto-to-cc fails with 'NoneType' object is not
 subscriptable
Message-ID: <20260129-savvy-vicugna-of-drama-aeefac-mkl@pengutronix.de>
X-AI: stop_reason: "refusal"
References: <20260125201601.5018-1-socketcan@hartkopp.net>
 <20260127174937.4c5fc226@kernel.org>
 <67cb17f4-2f72-4847-aa04-3633f3d8df33@hartkopp.net>
 <20260128-booby-of-phenomenal-proficiency-4db5ab-mkl@pengutronix.de>
 <20260129-versatile-tuscan-mongrel-f9b173-mkl@pengutronix.de>
 <f47126ee-8256-4077-a09c-47a1ed461f65@hartkopp.net>
 <20260129-fortunate-pompous-chinchilla-dcb99f-mkl@pengutronix.de>
 <c5e95a45-9aac-4a67-82b5-ac4ed8ae2844@hartkopp.net>
 <20260129-skilled-placid-lori-f58fb9-mkl@pengutronix.de>
 <1d9966d9-877f-46d4-a2a8-56b6d621bb36@hartkopp.net>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s4t464t5khomgopt"
Content-Disposition: inline
In-Reply-To: <1d9966d9-877f-46d4-a2a8-56b6d621bb36@hartkopp.net>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: tools@kernel.org


--s4t464t5khomgopt
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: b4 prep --auto-to-cc fails with 'NoneType' object is not
 subscriptable
MIME-Version: 1.0

On 29.01.2026 11:31:18, Oliver Hartkopp wrote:
> > > I didn't fiddle with https://kernel.googlesource.com/pub/scm/utils/b4=
/b4.git
> > > nor pip.
> >
> > Try the b4.git, you can directly use it after cloning. I'm using it
> > successfully on Forky.

> ~/net-next$ ~/b4/b4.sh prep --auto-to-cc
> Will collect To: addresses using get_maintainer.pl
> Will collect Cc: addresses using get_maintainer.pl
> Collecting To/Cc addresses
>     + To: Marc Kleine-Budde <mkl@pengutronix.de>
>     + To: Vincent Mailhol <mailhol@kernel.org>
>     + To: Oliver Hartkopp <socketcan@hartkopp.net>
>     + To: Robin van der Gracht <robin@protonic.nl>
>     + To: Oleksij Rempel <o.rempel@pengutronix.de>
>     + To: kernel@pengutronix.de
>     + To: David S. Miller <davem@davemloft.net>
>     + To: Eric Dumazet <edumazet@google.com>
>     + To: Jakub Kicinski <kuba@kernel.org>
>     + To: Paolo Abeni <pabeni@redhat.com>
>     + To: Simon Horman <horms@kernel.org>
>     + Cc: linux-can@vger.kernel.org
>     + Cc: linux-kernel@vger.kernel.org
>     + Cc: netdev@vger.kernel.org
> ---
> You can trim/expand this list with: b4 prep --edit-cover
> Invoking git-filter-repo to update the cover letter.
> New history written in 0.41 seconds...
> Completely finished after 0.81 seconds.
>
> ~/net-next$ ~/b4/b4.sh --version
> 0.15-dev-47773
>
> Then I can remove the b4 Debian package again.
>
> Thanks for the support!
>
> Btw. that it does not work neither on Trixie nor on Forky out of the box =
is
> not very satisfying :-/

Hmm, I cannot reproduce the problem with b4.git, maybe you can try
bisecting:

| git bisect start $(git merge-base origin/master v0.14.3) origin/master

then

| b4 prep --auto-to-cc

followed by:

| git bisect good
or
| git bisect bad

depending if auto-to-cc works or not. Then try "b4 prep --auto-to-cc"
again...

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--s4t464t5khomgopt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAml7VCMACgkQDHRl3/mQ
kZxDuQf/cMEhc0ixbwaQIdtHSeSNJk48q+cItw4usq0faNPlVjxXRysurlB2AnGi
RacmEZb3vWjtCLqkextSFfkPb6rbmPrqZSucnSM6BI65XV03kIXvliFLoi5qMO0m
hbHnLNeelTyKs0Q+O+LwFb/qypexvvTb9E0u3kjJpq7i54670RKIH8WRIb/SZXzl
9eHeYXAwSSSgXTzYekVgcOzIXOYk9b0zDD+81YFXDCHrPFrQ8Ab6DmLvt+LQrheV
RH6CdVx7t6XH1B1CeMqXpEOayGvs1iDQRJHogKMNmWvhDbyDUVoRWtN/TTrkUAoz
/+GH6mFxu1ny8kry7AFRwwy8rrLzqw==
=dW+7
-----END PGP SIGNATURE-----

--s4t464t5khomgopt--
