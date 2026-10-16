Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD414A4843
	for <tools@linux.kernel.org>; Fri, 16 Oct 2026 12:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792155290; cv=pass; b=cGvsMO2aq1jiDRP3u2wYKG9kAmyrP5Irggt+hRjrzSXiD6Lmo7So7o6LwxmZrGGLgY5EuHU22N4C2LaZ2r4mqpnDgbtb02sD+xR0m6XWZ3+lv9yXCjVdx3rRmFXgm+3hQS1cmTLuPu6K/JApZT83eVMjY//I5K4bC+lOg/0BuCg=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792155290; c=relaxed/simple;
	bh=vdTwWK0/GytQ02bqf3bWiTjJn8wkppBd+gv1taVVLlg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N3rJL+B5zcmceHA6EZHwLgHamSo21gWw1snoyt7Yz4+VEeBgWpn4GRsDpTSDyJScpmkh6RE4SOFhj/G87TXE2EnLs8xMXNyRzd/SYKaDM5gR2HzRgUHnHRg2347hGaNk8GrMiCPAany7JyOOZx7VEa4XcLYEXlYL5jbvEMZIek4=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b=DENLiZTq; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b="DENLiZTq"
Received: by smtp.kernel.org (Postfix)
	id CF9121F000C5; Fri, 16 Oct 2026 12:54:48 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1792155288;
	b=ViJa0acQtwB4srD9NtJ2c1Dx0262LtAQHhMeZLw52VYTXJEyGlkZCzxY5jO8RIEkmf/g
	 RedcnyN+LzV78s7yvvHIvHs5IwNrkc3Bygj77/xBMAiJzzY5TfdffTm1I6S9szUv1VBAH
	 0dmv7JiG6attAstSe6Pn06iOLAYyGQuenclGH7UsAdSLyoDU77ONPFn8NfDAZa44hByXC
	 trzyMcZZrrL4ovUoPtZKAvbaabjNbCUUCLaEUzhbQAlhG9/o9mvTw/2bYGYOqevrIxo/I
	 PzbXN/e/jqVIiFJ7aI+M+Rcap4EaHuDvZx5vvdT1lZo/VPaEMXGizDeNgCyJVXFMK/A==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792155288;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=4hAIdwuVxOdUIhPsV7w1DT/vfADgWUCR3OV0IBxm0b8=;
	b=nlFl1rFEkaV3VrFvmTcnF94zro5ytESDfngL4eJKlO2YkfYk1N0g6Nk5LO9+Upl0oODb
	 d+6o89eH81I9yhbl8gWCMXnsFP361mUZDDVDh91Cq6By2sIyVbe0bVkNQMjjgkYagXUFX
	 reVAybO3+M5691J6pQky5+bX1ntIbE/jsbJIuZ1znFuWQyXzxxfG18gGxHw7ctqfSZ8lv
	 b2DFA1TeKIdEQKKVMEyVBr5VLlIRmKBCIS8PFu64W7WUKH5int+lPW8ZM5MGIiLYzvU+f
	 8vJs1PuCoLOXVOm30JKJK6HyNUIQ++LealDXvIJBqM2rWOHXAqSvqdRvOHDb/PtSVLw==
ARC-Authentication-Results: i=2; smtp.kernel.org; 
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=DENLiZTq;
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 376561F000C4;
	Fri, 16 Oct 2026 12:54:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=DENLiZTq
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 376561F000C4
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 49CBC2027F7;
	Fri, 16 Oct 2026 14:54:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792155285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=4hAIdwuVxOdUIhPsV7w1DT/vfADgWUCR3OV0IBxm0b8=;
	b=DENLiZTqpHyWg/rmLutDGWF6ncvk2dBnVmrlcwsH5zj7D1axIvO9fUtRHW1jP6hNM37k5h
	0Fr6sp6ypf/41Nq1AVUHdTrXnE7G/4axF4jmZJnzcqx4jKQeXDtfIcOYv226KALgq+DzQU
	zv9uViyQQuWqt5FvDxYpxDI6B35oDidRalXyrTQM3AbVAQWAIHFtt99H49dS7w8Z7HUPsu
	ORAsVFcpdrpyCBXkb1zjANEtfjlaaSIe3VGFETCzTXy8ZT8kZOnFrbnDc5NB0xoDG4XYWn
	JuGSn1J3Amo5TN7+W+qP8mMQxuIfyYk156vwKgL/FaCaLLLerJAZRT0UlsCOeQ==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1792155285; a=rsa-sha256;
	cv=none;
	b=S3qtheQeLpBKGg2vwRKevCK20WRv3v37AVQ305WRHi7RJvn4P/tSIAkVpHiYTm3zWWhFDs
	8Q2zrOS4W5QBP4TuF2PeSDf/0GwJm+E/YXumrRrfvJdgBf61N9iv5phakMNGzY2HTd+akm
	7m+7jj5/v0B9EK7tRDpoCqSWhHp0zrVxTHS/6QjfUMjLEOg+s+OMMJPlDxTki/VH8R7SSZ
	XAZOBqRZQhOGT4ggRQUT5+MDX12YFaoUPaXj5JD3VQK0zBPk8xSwV709eXXTAsY6kuuP7Z
	TW6kDE+vq+fK0HwGlLRrsNxDDaEw0bbO8aFXlgJLpTUdFDS/6Z7bPtpYT0wOWQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=mkl@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792155285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=4hAIdwuVxOdUIhPsV7w1DT/vfADgWUCR3OV0IBxm0b8=;
	b=MRla+xhkip++prAtog59J5N8E5e0EYejd+0pYFNXEGU5bcsoe9Pq35a3VWOaZ0NC4OeAUu
	7Pfw7lh5W9slXbSrMp8ypt4E7/zOy+1Pt2hPyisOQfuDLRW4rBkCqigjyRy3x7FyWII2IO
	SOSt3GgGV0N0ZZIlgEBoDJoVACoogcLa43Olsv46p86ry+k+9g7/4Uu5AYNETgGTtelbPB
	DCJ3FXV73ON2xXvJn2DPDR61Ghx2j5oA+LqpgC3K21JkhFapwRwL1vn3CA1uwYJjECfnBL
	Z35xb/RwAIbzjP5SSOtjwl8IIVBFZL95mYfKnu7zRn6yiChI3dcPJ718V7Z8KA==
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1xHhSP-006BeM-0e;
	Fri, 16 Oct 2026 14:54:45 +0200
Received: from pengutronix.de (p4ffb23c7.dip0.t-ipconnect.de [79.251.35.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id EA59C5C61BB;
	Fri, 16 Oct 2026 12:54:44 +0000 (UTC)
Date: Fri, 16 Oct 2026 14:54:44 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: mricon@kernel.org
Cc: tools@kernel.org, users@kernel.org
Subject: [regression?] b4 shazam doesn't work anymore from git alias
Message-ID: <20261016-ferret-of-excellent-ecstasy-c723a9-mkl@pengutronix.de>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jajgwlrevpmxx2uf"
Content-Disposition: inline


--jajgwlrevpmxx2uf
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [regression?] b4 shazam doesn't work anymore from git alias
MIME-Version: 1.0

Hello Konstantin,

on latest b4.git and my git aliases are not working anymore:

[alias]
	b4-merge =3D "!b4 shazam -k -l -M"
	b4-merge-head =3D "!b4 shazam -k -l -M --merge-base=3D@"

| $ git b4-merge-head -s 20261016091128.325332-1-socketcan@hartkopp.net
| Looking up 20261016091128.325332-1-socketcan@hartkopp.net
| Checking for newer revisions
| Grabbing search results from lore.kernel.org
| Analyzing 4 messages in the thread
| Looking for additional code-review trailers on lore.kernel.org
| Analyzing 66 code-review messages
| Checking attestation on all messages, may take a moment...
| Retrieving patchwork CI status, may take a moment...
| ---
|   =E2=9C=93 [PATCH v3 1/3] can: isotp: fix filter removal race between re=
lease and netns change
|     + Link: https://patch.msgid.link/20261016091128.325332-2-socketcan@ha=
rtkopp.net
|     + Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
|     =E2=97=8F checkpatch.pl: passed all checks
|   =E2=9C=93 [PATCH v3 2/3] can: bcm: fix filter removal race between rele=
ase and netns change
|     + Link: https://patch.msgid.link/20261016091128.325332-3-socketcan@ha=
rtkopp.net
|     + Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
|     =E2=97=8F checkpatch.pl: passed all checks
|   =E2=9C=93 [PATCH v3 3/3] can: raw: take rtnl_lock() before leaving the =
notifier list
|     + Link: https://patch.msgid.link/20261016091128.325332-4-socketcan@ha=
rtkopp.net
|     + Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
|     =E2=97=8F checkpatch.pl: passed all checks
|   ---
|   =E2=9C=93 Signed: DKIM/hartkopp.net
| ---
| Total patches: 3
| ---
|  Base: attempting to guess base-commit...
|  Base: tags/net-7.3-rc6-2-g7093c3b8314a (exact match)
|  Base: @
| Magic: Preparing a sparse worktree
| ---
| Applying: can: isotp: fix filter removal race between release and netns c=
hange
| Applying: can: bcm: fix filter removal race between release and netns cha=
nge
| Applying: can: raw: take rtnl_lock() before leaving the notifier list
| ---
| Fetching into FETCH_HEAD
| Will exec: git merge --no-ff -F /home/frogger/pengutronix/git/linux/.git/=
worktrees/linux-can-next/b4-cover --edit FETCH_HEAD --signoff
| Press Enter to continue or Ctrl-C to abort
| Already up to date.

The editor doesn't open and if I copy/paste the "git merge" it insists
it's "Already up to date.". The working tree is still on FETCH_HEAD, but
with uncommited changes undoing the 3 applied patches.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--jajgwlrevpmxx2uf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCatIekgAKCRDMOmT6rpmt
0s0eAQDw1BtfA3BETwryG+M00Xhpvdd6PAwzbOU0BKZNv4s6YgD/dVGhP3D72THa
AmngZy+svJHuMc+pU1aVknTs5+LKTwU=
=8Wwu
-----END PGP SIGNATURE-----

--jajgwlrevpmxx2uf--
