Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4593FE348
	for <tools@linux.kernel.org>; Thu, 15 Oct 2026 18:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792090575; cv=pass; b=TCeayFGE6I0P41u6NR7+oiEU18LcTv/mUQJ49ndgf2dLXzTUAJDzcZ77GfcrdwY1rjhAUEksNlf1SKAa/oltP9ybzrhiQi8HvDvNu/ccxXC7iFZa3nhXsVRkKtJYLYN6LEgrJqL9InNMMTs1GaoMtfK8BqYuU0yg2pP6AQvKkiY=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792090575; c=relaxed/simple;
	bh=+EBUCcXnshqi/SF581EDGlGz3ufWSjmMkXHY/lqNB88=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=neGoNPz7syU0wLec9ZeQgmRQ38rHC1ODXFOpKUj9gYLzvB+DMG6MgfKWwDUqZNWdNjKoPVBWSO22NXw9cw3D5nkfNd3bSW4Spvyri8bAsWyqtd3+CUt14OOTJlc/rhJdi6ZQAPp+polUD/8Z+jVPIwBD0NME4FGMexDPC1ML+Ag=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b=FjMNzSi5; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b="FjMNzSi5"
Received: by smtp.kernel.org (Postfix)
	id 3309F1F000C5; Thu, 15 Oct 2026 18:56:10 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1792090570;
	b=k/1oFOCj1y4tT1RDNajDCzSKgBnuKsEA2oHIjxpFk4iBt2a5bPdAbr0m7nPFTqOWSZP+
	 kdEy4YGTs3SjDCjkdvZH8S0oFOZXqeZGUYPfJhiGK6ZrDsR/mhbvBkwQLOqwnjjImINGm
	 PW439zGtKlhQ3Y8evZA5Ad22c3O6YuQa6ti13l0nx7sdLRR0lp/HcyMPTPhqk+TmQLi6v
	 y3d7M1xeC6Iz1Kxx0l9Y9Hh9fVikTX5nIq+tg46nVbsZbSDFp7xHKJmxei4Y+dwhC07Cb
	 E+mGyqLPdZtlW4jnQSU16HsgS84YvL2ULu08s59ZoA10rnbegZXkMynGIHBLeqOVzwg==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792090570;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=0G+t0bXYOko2nnpuOm16NtxSRgWqZE1BldCdnUL9ziA=;
	b=cQtFP1fxgX8AQpkmqSwccEyJbruo/xOda9XqXBQOKiHjBOEu9pFhpa+CvOmsdxTP4XLb
	 xtzpMalwkald1hUtt9ShcDa4OLfOOSl9eBnM3Q2ddsGYGiXboObjtpG7MmTPDVc793iv3
	 qMitE+jeSiN/sqWne1Sz01bt3469BVKWt6B6ZeSOQYaxgPmHebJ7stz6PEAOeEJuVeRwy
	 D0BcPvmuCQ1iRaNw4iBj1B8hdFF76/sNfIZZV6uhdhX261zcJY2EtSaBYUxPqmxeuqOtE
	 RLw8eQy0bZR8uvfvyYkdPMCHJI/w/idfUiaG9k1qqv1o9h6y8HYG67mNYNWapSH0sJg==
ARC-Authentication-Results: i=2; smtp.kernel.org; 
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=FjMNzSi5;
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CEFEC1F000C4;
	Thu, 15 Oct 2026 18:56:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=FjMNzSi5
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org CEFEC1F000C4
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 10CE82004B4;
	Thu, 15 Oct 2026 20:56:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792090562;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=0G+t0bXYOko2nnpuOm16NtxSRgWqZE1BldCdnUL9ziA=;
	b=FjMNzSi5LJxjy4TVuXOvb4INX0QOn8VbOdqZvazRsT7hxDhmJ0bmzIMMQ9Pv2DJ7LCs9bF
	YbqCYuFGYc9dzhSQUbHP3rIw/hNp+oa8GYhmCbLprZqjIgES7t8n0lqACb0ZL39xLrg4RE
	8i7RTRLG9J3hTdgs7oF5ikWg5mS+H3nY0W5NjD4k/H8+wchJRPwEl9+83XjFJs1LTGHS/P
	7NUCS5bB9tZAE77u43nr7/tLozNj+1x69miRMBPDiaC4sMdHxJH+YQJob9QNxnmLNPfiVE
	5u4eeW2ONhf1hFdAviK1qsya7/pEDVdDjgcLKb0dLYnM9NPEkmnxrTJnq3+XJw==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1792090562; a=rsa-sha256;
	cv=none;
	b=dhAZZhL95NGDJ44bA3bMDlFm6DWQ2ImEMDNoIl3MGGBQ9SQPXFhQZUl0SEVpE2ztPEcEmb
	eh5NmbhcZvMLhqVv0rFedahlY+2BLVLV4+Tgo97eaIilljdY1p5ymn0O6C8yzmdGMEKlny
	8jJsk4wU+AxhHScDN4l7fb0dKyOH5o/ZruDBA/oQV6vN0h0XmGkCKByXJiz2KWzBxZk4tW
	6N8qAR24EMr+eWyLyX2BhuzzMZLpwb6Ck1rgk+QcI85gK8en+gqIurNGUZyjWYruUCZt5y
	6I6Ea20QVcGTYMqj+84FjgY7jrJ/a45do9cCdzJVmwuSHe9ZcWipnHed+OIvYA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=mkl@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792090562;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=0G+t0bXYOko2nnpuOm16NtxSRgWqZE1BldCdnUL9ziA=;
	b=KX3aVNnAOFCnRr3eV1OesysysE+sceFQM3SgEvQQ5ptDmGnTe86jRsK3uiVHjmPh066mRx
	eUcLIfMILSZ75H+Rm7LToZq54AxrnoOQWe0r6rhJWAji9DB4vxwH6Yt6tiI7HdZZ4LmiQo
	GI08Cmli7+ALH4x4PpL/5s6sK/0MAr2gmMzfixGlRblMC24X06GuSvNZrmlLhyfivO342z
	Va/RtR+0mEpptU4rWkl6GAB0gSTVe4zYp0yriS/D19UUU4TS6bs+MpWVGVF2NksSHWo2Lr
	VgSwyCs/DcsfCZ33SSgS4i+0TuorCZWl4l0EpvKLuDiu//KqaeI14j4lS8qXrw==
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1xHQcT-00649q-34;
	Thu, 15 Oct 2026 20:56:01 +0200
Received: from pengutronix.de (p4ffb23c7.dip0.t-ipconnect.de [79.251.35.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id ADBC25C5623;
	Thu, 15 Oct 2026 18:56:01 +0000 (UTC)
Date: Thu, 15 Oct 2026 20:56:01 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: mricon@kernel.org
Cc: tools@kernel.org, users@kernel.org
Subject: [bug] b4: review tui
Message-ID: <20261015-academic-unnatural-porcupine-b8568c-mkl@pengutronix.de>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xtkenroa3axbkski"
Content-Disposition: inline


--xtkenroa3axbkski
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [bug] b4: review tui
MIME-Version: 1.0

Hello Konstantin,

I'm on latest b4.git (commit 6be7c6139d77 ("send-receive: keep messages
that could not be archived")) and giving review tui a try. Great tool so
far!

b4 review tui doesn't like empty series, python takes 100% CPU. How to
reproduce:

- track a series that's already applied
  e.g.: https://lore.kernel.org/all/20260717021415.2234865-2-harini.t@amd.c=
om/
- review it, apply patches to the old base that comes with the commit
  as b4 suggests
- action -> rebase branch to mainline, where it's already applied
- review series gets stuck takes 100% CPU

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--xtkenroa3axbkski
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCatEhvgAKCRDMOmT6rpmt
0kjHAP4oHGxPO0adow/FCIYE9uUE84ajKdvriKgoLAejc0Uf8gEAoAKhB/P+YAdA
8zgFgCbKUIdoKhdUB8JkAJy9i9ZNVAs=
=XTbi
-----END PGP SIGNATURE-----

--xtkenroa3axbkski--
