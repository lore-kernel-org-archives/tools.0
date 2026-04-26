Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708331F4611
	for <tools@linux.kernel.org>; Sun, 26 Apr 2026 10:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777198910; cv=none; b=nINLL5sX0YKotKcqzwqKu0iNPxiXPlpXT5JqnwJ18JLt5C7RX6IDXL52ZxM35VFFMebwXNz0lmS0ZrzL2x1Oy6j2WzOhlG2EPz38wmUyS74OXj0KRPF5CcbA/zxYU3c4Joa9PQ4/dJtvBFJjvhsDOpNSLilLdrGAqkCoo1jSDrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777198910; c=relaxed/simple;
	bh=OeL3uCiSZQIj/Ant0f2NB0oxODdvNcSqFMVbqWhI1NA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sl4/EV7/TEQvPIazDO9IwpZsfd5WyW0GR9jt+rKC1khRj65wAYBvcydz7WodBwyoK8lDGOB69iyIKxSwzBjmkeltAg68whQErJxSLRiInRRwz/OlkuStTfgfnsBtVyE2Rfl3QhpeSNXs5iLVolb6r9QRfu0tmi0yLIhCXXCSfDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (4096-bit key) header.d=beyermatthias.de header.i=@beyermatthias.de header.b=s5bgs3yh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=beyermatthias.de header.i=@beyermatthias.de header.b="s5bgs3yh"
Received: by smtp.kernel.org (Postfix)
	id 31D61C2BCB4; Sun, 26 Apr 2026 10:21:48 +0000 (UTC)
Received: from mailgate02.uberspace.is (mailgate02.uberspace.is [185.26.156.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E7B08C2BCAF
	for <tools@kernel.org>; Sun, 26 Apr 2026 10:21:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E7B08C2BCAF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=beyermatthias.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=beyermatthias.de
Received: from cressida.uberspace.de (cressida.uberspace.de [185.26.156.202])
	by mailgate02.uberspace.is (Postfix) with ESMTPS id 5606C181F37
	for <tools@kernel.org>; Sun, 26 Apr 2026 12:21:35 +0200 (CEST)
Received: (qmail 9916 invoked by uid 989); 26 Apr 2026 10:21:35 -0000
Authentication-Results: cressida.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
	by cressida.uberspace.de (Haraka/3.1.1) with ESMTPSA; Sun, 26 Apr 2026 12:21:35 +0200
Date: Sun, 26 Apr 2026 12:21:32 +0200
From: Matthias Beyer <mail@beyermatthias.de>
To: tools@kernel.org
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: b4 adds Link trailer although not asked to?
Message-ID: <e3mhkyielk4berng7qdypcyty5e7yru3u4hsyx2fgzta56ryzf@xufrwmpc3g4b>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a2svrmmmpuez2pyb"
Content-Disposition: inline
X-Rspamd-Bar: /
X-Rspamd-Report: BAYES_HAM(-0.055066) MID_RHS_NOT_FQDN(0.5) SIGNED_PGP(-2) SUBJECT_ENDS_QUESTION(1) MIME_GOOD(-0.2)
X-Rspamd-Score: -0.755066
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=beyermatthias.de; s=uberspace;
	h=from:to:cc:subject:date;
	bh=OeL3uCiSZQIj/Ant0f2NB0oxODdvNcSqFMVbqWhI1NA=;
	b=s5bgs3yhMhb9vCPeS3QELQNqQubY0ZwlfUC+VmuBRh2laaC1yA2WIlQ2a8x+AyoZKv0Kma0oQU
	e7DqLom9pJgcC6wRougyh/zPpxXxUsU6D06maMkzG41bSSaVo+Yfm3qUGJ8RWAcdMSntGwZpVBcf
	fIm761Rs5TpBzGrHVvIKm7+3MuHionlAYV3NxFzjvtnzwOe2Gl7f0Xv6a9QyPb7/Sf/rbaywhMr1
	+XlCkJvYNqOkdX0D4DZUsVPnRxfhwJLKT+1ClEZ8GxVVZRoaqyA74iRF6GlbyiSib1fxAiah589W
	mOawTSP09N3zw+Z3Uay/hhBROyJi4vhU8oNrzJUSwF3bvqTM4nq+o/eAhXyPH2S0XYY6LO8P0Z8Q
	8Nd3suLF1nY8bRJSj2X7IY2ZdtwP67IKN6dbctVYNwDx2ttn7G69QG0vHXqtO8UpkfpsR9l0OMnm
	sjs3a3HxJ7MgPS7/a9szKHWtOQESeZerdwUCaW14IVh8vfuyJKpudK5X7P1GHXjSyoIdYYBjT8kl
	+BvrPbNbEMpdi8SshN9eP1QgZsQykOyNovHqudBvQdFhn8lyV66eSp4qKrgFNZiWYg032kXS/GPc
	Gbv7+RPOOKZJgx5gfgyZAcQyf7X3p9DcolYMyZx8UBv/KT96CiaOXG8iFcVHDGnLPTnVmjhccjWm
	M=


--a2svrmmmpuez2pyb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: b4 adds Link trailer although not asked to?
MIME-Version: 1.0

Hi,

(CC Konstantin as author of the file mentioned below)

I am currently playing with b4 and am wondering why b4 adds a `Link:`
trailer even though I did not specify `--add-link`.

There's no configuration file around

    git config list | grep b4 # no output

or something, here's what I did:

    notmuch show --format=mbox $SOME_NOTMUCH_QUERY | b4 am -m - -o -

and it prints the resulting patches with a `Link: ...`.

FWIW, I am not in the kernel context, so a lore.kernel.org link is wrong
for my usecase (I know I can set an alternative mask, but I don't want
any link in the resulting commits here).

The above was tested with b4 0.14.3 and 0.15.2.

The only source line in b4 that sets addlink=True is in

    src/b4/mbox.py:135

but I don't see how that line is hit in my case, because `addmsgid`
should be False here (False by default).

Hope you can help me here,
Best,
Matthias

--a2svrmmmpuez2pyb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEUJGUus1GMTrRclzcEKWX9Kitz80FAmnt5ywACgkQEKWX9Kit
z81dDxAAqOJZpqZryBk+3eiefz9gpI2F1iYKKPd09j34hXi6F+6w3oWchVCnUSru
mnmTS8B8wNW+Ob7vFjJISvpnTk2m26RKkLLNbjcwXNuyaDNvIOD6ekBjrkue613X
pA09M28dCfET+ZDrXaIHuxB0Bw08J379gk7DkpUMTzWU4XrCnfCACWDpfpG+iuQI
al7t8eEneREClZ82Kv0wo6i2kJ3KX1CKAvzJHf5QO3g4sBEwQ7oTPRlvW1AHuvV1
BGuXOaN4s7WlAypdAM3HP1czGZvGTz87vOGKvVJHZKREd6T/jueaEZm8/xsHrfdA
GZJaT1IFqsO8fo3MCJnc96JUw6hptJPYQ4xzQWdn2B56XS2IHQmCVa8wQJ89eu3v
IvRF+5eXF4qEs6zfNnTO8+c1F2tsEzs2zWf+vdKSMXVazJJXpegvaJShfo8WdcoT
IoxCia95kNDpT4aGH8aR5O+8CQGt3ntPTG5QiNapqi72mB3plrE1uwuS+jDAfUR+
guLuNsDuSVyRZ4UB3b0XplBJ7r+f+6w/4TP8nBy1E7Defo0xZ1qxJSdaYzFc40RY
Ypv+kI1iyk12pEzR2prvm7Q43lzH0Eg1Ko1AnFVk/a/Yti92GDps8nRGjMPV0n3r
hl2gKP+Js2/Avi3iXwNN+zeKVS8t5uXMQ4ovMRj2wJ6qSjDiedE=
=dT6a
-----END PGP SIGNATURE-----

--a2svrmmmpuez2pyb--
