Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=3; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793013903;
	b=UHW3jthoBkwpd8fJuZ0R4YEjRaaPIQoRHPMAB/wTFOnU4FUzyzZj/fAxG+EONoFh79jw
	 ZKdLnjjFoa01pKtUZOrv9rQo6Z3YUIWQwBXH/XQujIlbDxUqlanRL/q5i7uS5YmkXGxvU
	 DUNxseM0aP7wsJl4eIzNIf6g2jNYizhE1wpvk12PO701UK/dnO2iYVMoKgakXawrhyzh+
	 SvhEqZWJ3DNzQeEDAhd3Y3pVOkk/gjUb9BYjVGBZLhPdEc7Vcel6qD3y45gpY+Ikur4i8
	 f41CcZtUCqB+bOqEpoFN2et1BqJdRCyT1uidsbgIa6H/QpzPcaYBnZVG0MRYu0s/f/Q==
ARC-Message-Signature: i=3; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013903;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:DKIM-Signature:
	 Received:Received:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
	 Content-Type:Content-Disposition;
	bh=DWmG1DAG5/lCkC3p2wd7bT+yMGqV9a7kPehR2sYwPxQ=;
	b=fCU9yuGfXPAsO0I1XdXQKWxisqqOpDA0FvvWdkP4t1RLLTzOo73UOnJNXJoql/UHuKBT
	 Eda/YQ+/cvw0uoEmTswaezvLAOOji4sG5kuQZj//NiuHAQjAd+Z4IeNMoODYuGfKXTbUd
	 +nEOujowNmjmfa3Fk5kNYrnx2ZNPdUaTZSLq8S1tTP7a9BxCjQrGgkwNMh1z3B3/Pq4V9
	 TRVqcs/rLWD6cF+gc5OCeyaOoBxuo0Ak148zNM4POB2MYuxKaJAn5AEW6mNRbCl0J0R6D
	 xkwwJ1NhDZPTyzFBeiYeARaT/487qTgIdvA+D6PF5xYD50Xt7ij59Ca3Ruh1ycHAzxQ==
ARC-Authentication-Results: i=3; smtp.subspace.kernel.org; 
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=YhRf76vG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4ED3606A330
	for <tools@linux.kernel.org>; Mon, 26 Oct 2026 11:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=YhRf76vG
Received: by smtp.kernel.org (Postfix)
	id 938851F031E0; Mon, 26 Oct 2026 11:25:02 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1793013902;
	b=A6s9j16jlamp1b9ka5iQVYhxcJ8CiXEMJu5h3ifztisSGSnw6l1urrriuAzixiXRlbyl
	 S8LHbJRvY+xwEEuLJ1Eff9GazIeO3gVbllI8gX4x/FuHuMkxNo0uCQ60CB563ju+K771n
	 zm6Cg9Qly9Fycee3T5HNLxDoBVJIAtKrtRzoaWOD/DBquLy3DJOCqD9H06tdcQfHqgcsJ
	 zwlR0kW/lEzmYUR3Dk/Zv5rZq2dMBTMjBchmsVHfwftXicSNinp2t9S5Pi6Jsv21aL+C4
	 QVCzUicxpm+GNRxbL/1ZktTv7gpir09IOFr+IojDlvqzUFoq/isaSByem7PLg14S7Pw==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793013902;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=DWmG1DAG5/lCkC3p2wd7bT+yMGqV9a7kPehR2sYwPxQ=;
	b=qc6q/G2Za1s0BEZIuD02Njn+hQCLGQhlw5eHldRkyAkrzGOYaDjkyQ1Cbnlhqa7rR59C
	 rXwX5q6znuhj67qJhVcgp7NT0sJ8xmwkWOM+6EnOjLJ14b4AObQlZrh2LOCSiQ4EHOK5H
	 iK+s4nMIGOpyEkiVQpFAkTz6mkvX1NEXy7RkoLyfRQYAIbNr2oM6VWNTYSufELYwhSTAI
	 eOdzSURGii2wR8ysOU8oMC9VPinhum889jtFel0HfaL3SuWzOSTYxOGxLJBzxl4c2VXOm
	 Tbeul3x9m9k9XTJERTeYTu4hQc7zDfaQZ61UwGvOVuMCbqnoc55GG6MSLOHnwHxq0Og==
ARC-Authentication-Results: i=2; smtp.kernel.org; 
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=YhRf76vG;
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 297B01F01825;
	Mon, 26 Oct 2026 11:25:00 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=YhRf76vG
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 297B01F01825
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 480982022E8;
	Mon, 26 Oct 2026 12:24:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793013899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=DWmG1DAG5/lCkC3p2wd7bT+yMGqV9a7kPehR2sYwPxQ=;
	b=YhRf76vGYGoYX8lX+z1lCHGoIvASogleM641HL31hlNbVwlT5rt9Ue6DXPzTQfuhs2KGV1
	Ts8q8R3JnQwR5W4/pIQRcA3MwD0bSKokKncBz0mMh16eAoAgBE7YDbRFMIq2YWGawU4aaQ
	QbX1NPm7WeWVpL2myShOu43G/Z9IFpVWj1bRd6mEWYQ/yEHTaEiAvyxbiTf2Df6gzScLdW
	Dh4Sip6Z42SBN8Y6gGH6kyO/Ngotu4ezpcN2IGozlltPl131zzBFmUMRv0gBekcGv1Bjzu
	Gcrj4BjSVJrou4Ct3RvQg7JzbThoLn8oi6ce6smc0CuOa9nDvUkYoOFCbftk8g==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793013899; a=rsa-sha256;
	cv=none;
	b=ZWEntXQfC3Fx89mNyrIbK1SYks35PYXkX7OeZnjHgeaTsijlPRUjBzzGiMDEWq1wyFMB+g
	pMT89r3g4RVFCvk8wPKET0TQGAfrlLN4keIZG5JWHveIPSeVTqgOM6rqIbiZTD6b5KsnXd
	3u9D36zb80iAg81SbPlfS05IwfoZ27Inzhh48ZcVQtNvCT6wsPDMGmyLvIOBTrZzbfaqCu
	WXU4ZhqSM330nRHqOxlsjUOJb49NaNwz4m3tQfHrcTGni1KpihLag8mK614augGHz7qZDe
	5KGYbx1DzvWGUyNggc6Mk0FzJF+AhgR1VM6MTlSIO7uwr1nDA8jk1OvkcwzMiA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=mkl@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793013899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=DWmG1DAG5/lCkC3p2wd7bT+yMGqV9a7kPehR2sYwPxQ=;
	b=TMqU5bkyYV6P5sVWrCbAYEaKirugMN9+pp7geQvb+sHy2u4k5dSmq+cPJ15C2UW881BZkY
	q8OABP4KHIkMEI0wpMnrmhatFBCMyKZPWBbbZCs50+I5UlcU7FOnmX7dRcAIbVEg2GYh8z
	9iKBj0SspUYKXGaD6A1EymyF17v7WIh7V+XmIHEyt/BPwqNZr/katclyy04eQcWWW5zX/m
	WGfyMQ1jAGw3gi1ARH8QGcLejtj+80QZQBstpE49YR0Y3CksgctvYaEvNAYhzr2TizcIEB
	XFrqwF6GG/uQU+zB+sX3DqU4pSqxBAssG35ktHi5xl6APLP8B3nEBLyUChNoCQ==
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1xLIp1-001H0o-0Z;
	Mon, 26 Oct 2026 12:24:59 +0100
Received: from pengutronix.de (p4ffb23c7.dip0.t-ipconnect.de [79.251.35.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id E27495D6C7A;
	Mon, 26 Oct 2026 11:24:58 +0000 (UTC)
Date: Mon, 26 Oct 2026 12:24:58 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: mricon@kernel.org
Cc: tools@kernel.org, users@kernel.org
Subject: b4: review tui action->upgrade ignoring b4 generated dependencies
Message-ID: <20261026-quiet-onyx-toucan-2a8d39-mkl@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="xy233rc2gs7ci4vf"
Content-Disposition: inline


--xy233rc2gs7ci4vf
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: b4: review tui action->upgrade ignoring b4 generated dependencies
MIME-Version: 1.0

Hello Konstantin,

I'm on latest b4.git (commit ce4c1158edb2 ("review: merge takes from the
nearest annotated tag, pinned at confirm")).

I'm tracking Oliver Hartkopp's series [1] with "review tui" and want to
upgrade from v7 to v10 with action->upgrade. b4 takes the base-commit
but ignores the prerequisite-message-id, so upgrading doesn't work:

| Saving review data from v7...
| Saved review data for 4 patch(es)
| Prepared fake commit range for 3-way merge (e2894fe10a11..5987fcb292ea)
| Base: 734bef548a96e8774d6eef5dfa2026c6edc4e80b
| Magic: Preparing a sparse worktree
| Magic: Materializing the full tree to retry the merge
| ---
| Applying: can: proc: reset pkg_stats atomics individually
| Applying: can: proc: skip stats calculation after reset in can_stat_updat=
e()
| Applying: can: proc: remove pointers from CAN specific proc output
| Applying: can: replace ARPHRD_CAN type checks with can_get_ml_priv()
| Applying: can: isotp: check the return values of can_rx_register() in iso=
tp_bind()
| Applying: can: protect the receive lists with a per-device lock
| Using index info to reconstruct a base tree...
| M       net/can/raw.c
| Falling back to patching base and 3-way merge...
| Auto-merging net/can/raw.c
| CONFLICT (content): Merge conflict in net/can/raw.c
| Patch failed at 0006 can: protect the receive lists with a per-device lock
| Recorded preimage for 'net/can/raw.c'
| error: Failed to merge in the changes.
| hint: Use 'git am --show-current-patch=3Ddiff' to see the failed patch
| ---
| Patch series did not apply cleanly.
| ---
| You are now in a shell in the conflict worktree.
| Resolve the conflict, then run "git am --continue" (or "git am --skip" to=
 drop a patch).
| Run "git am --abort" to give up on the whole series.
| When done, Ctrl-d returns to b4.

On the other hand, "b4 shazam" works:

| $ b4 shazam -k -l -M -s 20261026-can-rx-lock-v10-0-281c4b556a1a@hartkopp.=
net
| Looking up 20261026-can-rx-lock-v10-0-281c4b556a1a@hartkopp.net
| Checking for newer revisions
| Grabbing search results from lore.kernel.org
| Analyzing 8 messages in the thread
| Looking for additional code-review trailers on lore.kernel.org
| Analyzing 87 code-review messages
| Checking attestation on all messages, may take a moment...
| Retrieving patchwork CI status, may take a moment...
| ---
|   =E2=9C=93 [PATCH v10 1/7] can: proc: reset pkg_stats atomics individual=
ly
|     + Link: https://patch.msgid.link/20261026-can-rx-lock-v10-1-281c4b556=
a1a@hartkopp.net
|     + Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
|     =E2=97=8F checkpatch.pl: passed all checks
|   =E2=9C=93 [PATCH v10 2/7] can: proc: skip stats calculation after reset=
 in can_stat_update()
|     + Link: https://patch.msgid.link/20261026-can-rx-lock-v10-2-281c4b556=
a1a@hartkopp.net
|     + Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
|     =E2=97=8F checkpatch.pl: passed all checks
|   =E2=9C=93 [PATCH v10 3/7] can: proc: remove pointers from CAN specific =
proc output
|     + Link: https://patch.msgid.link/20261026-can-rx-lock-v10-3-281c4b556=
a1a@hartkopp.net
|     + Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
|     =E2=97=8F checkpatch.pl: passed all checks
|   =E2=9C=93 [PATCH v10 4/7] can: replace ARPHRD_CAN type checks with can_=
get_ml_priv()
|     + Link: https://patch.msgid.link/20261012164802.94113-1-socketcan@har=
tkopp.net (=E2=9C=93 DKIM/kernel.org)
|     + Link: https://patch.msgid.link/20261026-can-rx-lock-v10-4-281c4b556=
a1a@hartkopp.net
|     + Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
|     =E2=97=8F checkpatch.pl: passed all checks
|   =E2=9C=93 [PATCH v10 5/7] can: isotp: check the return values of can_rx=
_register() in isotp_bind()
|     + Link: https://patch.msgid.link/20261026-can-rx-lock-v10-5-281c4b556=
a1a@hartkopp.net
|     + Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
|     =E2=97=8F checkpatch.pl: passed all checks
|   =E2=9C=93 [PATCH v10 6/7] can: protect the receive lists with a per-dev=
ice lock
|     + Link: https://patch.msgid.link/20261026-can-rx-lock-v10-6-281c4b556=
a1a@hartkopp.net
|     + Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
|     =E2=97=8F checkpatch.pl: passed all checks
|   =E2=9C=93 [PATCH v10 7/7] can: raw, isotp: copy socket options outside =
of lock_sock()
|     + Link: https://patch.msgid.link/20261026-can-rx-lock-v10-7-281c4b556=
a1a@hartkopp.net
|     + Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
|     =E2=97=8F checkpatch.pl: passed all checks
|   ---
|   =E2=9C=93 Signed: ed25519/socketcan@hartkopp.net (TOFU: 1 series)
|   =E2=9C=93 Signed: DKIM/hartkopp.net
| ---
| Total patches: 7
| ---
|  Deps: looking for dependencies matching 1 patch-ids
| Grabbing search results from lore.kernel.org
|  Deps: Applying prerequisite patch: [PATCH can-next] can: raw: remove red=
undant NULL check before netdev_hold()
|  Base: HEAD (does not apply cleanly to v7.3)
|        ignoring series base-commit 734bef548a96, use --merge-base _specif=
ied for it
| Magic: Preparing a sparse worktree
| ---
| Applying: can: raw: remove redundant NULL check before netdev_hold()
| Applying: can: proc: reset pkg_stats atomics individually
| Applying: can: proc: skip stats calculation after reset in can_stat_updat=
e()
| Applying: can: proc: remove pointers from CAN specific proc output
| Applying: can: replace ARPHRD_CAN type checks with can_get_ml_priv()
| Applying: can: isotp: check the return values of can_rx_register() in iso=
tp_bind()
| Applying: can: protect the receive lists with a per-device lock
| Applying: can: raw, isotp: copy socket options outside of lock_sock()
| ---
| Fetching into FETCH_HEAD

regards,
Marc

[1] https://lore.kernel.org/all/20261026-can-rx-lock-v10-0-281c4b556a1a@har=
tkopp.net/

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--xy233rc2gs7ci4vf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCat84hwAKCRDMOmT6rpmt
0paTAP4p7BDLcBaW9kSD/yBSubp3MAvXITzM2ppECw91R2HZVgEA2Ng72kjoRwDa
YHYiQSreH6tgavOsOAeEL3+OYZcQ8wk=
=vYZK
-----END PGP SIGNATURE-----

--xy233rc2gs7ci4vf--
