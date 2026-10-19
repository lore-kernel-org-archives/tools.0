Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=3 smtp.remote-ip=10.30.226.211
ARC-Seal: i=4; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792422089;
	b=VycSQcLOsLoF5v7rspr9f+1OFch+nWULU6QoXf1c5HoNL7p0BjtpHZjbsY+fw4ki37p0
	 4lbWXS0uQlGz4pe1ZMaqZ/IQWGXs14NlB57vaogZ+yekhXMhjKka/Cn3AV3lbWBwkaAuJ
	 iZEyopbBxI5oNBU0eBSuY8QYr5u9izyjivHEm2wKuvkyJsBaiqzoPcwlc8oBXBTnWy87L
	 mfH1W2ncif3LdVmurLjwX/KLlgcx/hOm1uwZItaOC2m9Wh8JhGpBF1dyyaUuTtWZ471H4
	 sLEifRy/cR1oKl6FlSsRLwGjw+z9Atz+xnoeZQgXrZinTI2buoF64LCTryw43g5wY3g==
ARC-Message-Signature: i=4; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792422089;
	h=Received:Received:Delivered-To:Received:DMARC-Filter:Received:
	 DKIM-Signature:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=7qAKq0mfh8qC1H4A586pUcpXoHLD4uB3J5dj8twRldE=;
	b=rR87f94NMSD/ZiPBWyl/7hX5yaBbSuIBOpR5Q14umaIJHEquE0MrNIKb+ssgXTqTKzS/
	 FIBLmhV1t38yfzqgoXXmHWZrR4v4WBY9Tjb/gAc25BxWJHc5yGwQYwK4hVYJEHGoY59vU
	 Drakj3LbTMf6COXgYlFS83o7RN7alBkB4idWheyY6qJ2cuIbMyZFi4LMHCqzIK7E88tts
	 GaTdp4pLwXGiT9gGvuUPyw5E79uzREwQt7RmBzVaYWfvRp5rPU02WJ/tCHMhIZcCA3qM4
	 wsfXLUX0YscxNwOfV8ioT/MYlndum5c8lIIV4GVPTR34TH/VyTCDuvoudBnjfqQG8tQ==
ARC-Authentication-Results: i=4; smtp.subspace.kernel.org; 
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Y82mefJk;
	arc=pass header.oldest-pass=3 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7811607AF16
	for <tools.linux.kernel.org@localhost.mlmmj>; Mon, 19 Oct 2026 15:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Y82mefJk
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665CE353A72
	for <tools@linux.kernel.org>; Mon, 19 Oct 2026 15:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792422088; cv=pass; b=BcgMvO4d2EphMcODIygUC+A4opo4ahmHkJCzy8dChBj/w23zoiOTyhXipm7Z0YP8EayHPjPsTMDRDOm697G1hwRi+lS8uP7XZsX3T+XQlSsFQfsrfGynOdJBLZ5m3P07swak0PH2oy4+hR8/tMhyMCpBlfmyKAhAj9CZAssZyos=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792422088; c=relaxed/simple;
	bh=982mvNVo9u1riE9+3KjkIGS7/JX1V70640aBDeBg07g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FNbTDgsqBYk95eeIo+5R3vV3sEIJaYhFx43sK8sNvX3RnRAZ2nkFM8LccdjvqMsXcx3UQoaI8JjP4Q0jEHGo3Pci2w+mnr7QqUN+4QrzkvLfzPnhJ4+CWoUIUDUAAP0/6B2KVBqfBp7fHajnN31C6D7PXa5agFLMzW1xt4BE3bg=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b=Y82mefJk; arc=pass smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix)
	id 591681F000C6; Mon, 19 Oct 2026 15:01:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1792422087;
	b=Dx86pmRnJsWatdSPB3ejAlOp5XNnaqDeXHEPtEf747dujmn/MPbOi/yR+Ex/SLaQgLAq
	 NjuUzbnWl8P+5c1YiTlwYf33tNfnk1G+uQLPMOBImpjboXYEfTYQIF+Ojg5p44mJjoKx9
	 RMboDNpWZs8KWWUcqVbHCCk4YApsBup5ex8YUbYcG57DxxznzbH2qACEx2/RanfSRG22N
	 BZXSK7+dOJVWTDzGWsBzbXIpLUQ3r1BRyUU9/DP1VmdkrVv9TtsQXxJkK4Rz+oVEEMVRz
	 bkZYdzQIqtkmCG+ersWO93ViFciwznSUFVV3bjlV2/KrlYXO7vbYAeIYizhyTl9Kzag==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792422087;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=7qAKq0mfh8qC1H4A586pUcpXoHLD4uB3J5dj8twRldE=;
	b=egeTkwqM6aORxioYo8XLdtunNGfBJAbzBa+x4kQ5+4g8zIfr3ayQCV8Znpmn9R6t+VYe
	 tQDpH1ieY2Jl6p9LNzzDRWjfgezufyHCOwvB9Eo1CloOKeMfp96lQb4QHudJhNIHu6Hrd
	 VhLwJYmhHAjdrX4G26U3xbjbWQjV0nuc8rDJodB1P1/MQQWb6b2YLhy2mwLsFaJlk+TTf
	 QWX+XKuslkI0CpSjlYUbsHumT/EJ2QFQ2hQXTLN5bPl0A8LBqg7ThMuzVWIx0/1o4FBw7
	 +sBO57tUn++6AF1Y/KKDQHgLmvTa5CpjV2sNzRutG81oP+WDvKTIrwInPmnbwR2OwOQ==
ARC-Authentication-Results: i=2; smtp.kernel.org; 
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Y82mefJk;
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BD1D41F000C4;
	Mon, 19 Oct 2026 15:01:25 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Y82mefJk
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org BD1D41F000C4
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 03CF420283B;
	Mon, 19 Oct 2026 17:01:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792422084;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7qAKq0mfh8qC1H4A586pUcpXoHLD4uB3J5dj8twRldE=;
	b=Y82mefJkfiyZzBmEKgGRpO7r2NkKU2eN1BL9ta2+tbGJ7XjNgF/xelFCdorLtPRPZggulu
	nxc+QTH4Z3+lpU+5SoChSM/E/wSvyYAlR4Gx/q17ifTTlmVLkMOtuwQMR8GogQFV/okQLK
	qYWBJexV02FNcoazli5cQ0TlbXSZgjer50+y7iXqUcRcBZpNObNWF+dyngpKucaan9jqCO
	uZk9e6nDCt2ujmG2bZ3qYaNozYJDzWVelG9qrcHGkodJtYfDCDE6kR4U5P3wTHuWKJPMul
	hBl47D/T7EHo2fsiYtyXV+Wco/eZF9GJ3y1pGZxdSR+JFLLbySUCB3HJdSYnew==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1792422084; a=rsa-sha256;
	cv=none;
	b=dZhmAMurHMEbQc/60m6Fu5EQBJ80dACR2UBhwSlCOalZ/WAF/SH9qDoLuHYCanDM1npfsc
	/pJKS5DW39SOKzj8qyPCKotBZrVNFdAoupei1cAx/ZBoi0xGh8sLI0Uke8Cdt2hRmqMeuh
	1ymJIaEfebRAbv6wsGETH16uKRwqHgU2yBrr5fyKq0ZsufuBvVss5GoQtyWnFsJNsvvOPc
	gBOhSR3aeW1MhagEQiTPJxCrQXZaFeJNLHhBG+MQFM2a56HWqqPtP2j2ErN1PVzArD0oAO
	7Fee+uhpDjxT6qGEUeM2j1PkcLMaB9nVYn2NvXL/n+3G1twe2pbii+rlczY3wA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=mkl@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792422084;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7qAKq0mfh8qC1H4A586pUcpXoHLD4uB3J5dj8twRldE=;
	b=SSlcVjTq9+u3uH9soYh6sZXFFCLB+fVr6PRc9ftSr6I9g6XreYqT4VXQgqpKK65KsWZbHI
	a8i3h8u7NQXXl+jRMdRsNDPOTmuWvKscuGhbv49KKGKaJoqb7A2XxV7lEfgYZWdI0Ewpwn
	dyjJPBMA+qKd/QoJR42C5p4v7DNO516tuQU21o51V5jHalnkZLahalriq/CPUN2yYyvYxl
	7f2RwJs887mrBp/l5OPqCpD+27OifXtllQJ7zjzGDGrP+P8fWyFnCsJKRclC1VuKG68LcT
	JiY7Z7Hmu2raEmDXhSc7G6PIc/PtUY6nJod0zJYTYMhNck/6I1BJ2rTzLTqWkw==
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1xIorb-000Erx-2w;
	Mon, 19 Oct 2026 17:01:23 +0200
Received: from pengutronix.de (p4ffb23c7.dip0.t-ipconnect.de [79.251.35.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id A0E2B5C9355;
	Mon, 19 Oct 2026 15:01:23 +0000 (UTC)
Date: Mon, 19 Oct 2026 17:01:23 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Brian Masney <bmasney@redhat.com>
Cc: mricon@kernel.org, tools@kernel.org, users@kernel.org
Subject: Re: b4: retrieve API key(s) via git credential mechanism [feature
 request]
Message-ID: <20261019-fantastic-wine-kittiwake-14132f-mkl@pengutronix.de>
References: <20261016-tiny-labrador-of-serenity-28c5fd-mkl@pengutronix.de>
 <atYgJxjTgToh1Jn1@redhat.com>
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
	protocol="application/pgp-signature"; boundary="qzretrquopovo2oj"
Content-Disposition: inline
In-Reply-To: <atYgJxjTgToh1Jn1@redhat.com>


--qzretrquopovo2oj
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: b4: retrieve API key(s) via git credential mechanism [feature
 request]
MIME-Version: 1.0

On 19.10.2026 09:50:31, Brian Masney wrote:
> On Fri, Oct 16, 2026 at 11:36:10AM +0200, Marc Kleine-Budde wrote:
> > I don't like the idea of storing my patchwork API key in plain text on
> > my system (which uses encrypted storage, though) and my dotfiles repo.
> > Can you use the git credential mechanism to retrieve API key(s)?
>
> I posted a patch series to b4 last week to do that. Please give it a try.
>
> https://lore.kernel.org/tools/20261015-pw-key-command-v1-0-6daa9b8cee2a@k=
ernel.org/T/#m1ba5c2cd1c5924dc293be4c1969a509278a8bdf0

Thanks, works for me!

Using git credentials is probably more work, but IMHO integrated better
into the git ecosystem.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--qzretrquopovo2oj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCatYwwAAKCRDMOmT6rpmt
0vjFAP9Cwd76ZcyajSOg14s2uLxZ6KWaWopZYcbZJs9Q3FaxFQEA6ZAfT+DTF+/c
Ur/p+hIERirTp4TXIHNqBlWTTSbAnQI=
=UF4M
-----END PGP SIGNATURE-----

--qzretrquopovo2oj--
