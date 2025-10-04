Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096631FBC8C
	for <tools@linux.kernel.org>; Sat,  4 Oct 2025 12:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759580366; cv=none; b=PibEXkCS5Mk+jmBKlWym71mJjjY1pKMcsrTdwuPwaSt/meqqh5v3QGuzvHB8Al8DayTME6FdnITgNVUnzn6DF+1GITLlT4f0s0IgucRXNtC5mV9npZWwBXOMgkoiLbRzuiShl8sIGBkev16vpHyTSfHnUub1f1EVSng/VFeZgww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759580366; c=relaxed/simple;
	bh=ZtUm0Jr9/4vfinxL7r4p7LxcxmUF54FIlTrQZXWeZWY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Za9PXVYzveIWJJVcOVVcmlJcX3z7YinDk82lJs7Yt02JA5DWG6Ze3rMaKJwOmgQw/dXY5MeRGCmeT1j/j/GYL06YFRN0DkcKtghCbguIXL5L+oslZLoAD8TmAMEk6/1CAX1eospTh2ZJL7n/PmBih+YvEwKosyDYC7fP1pNwvLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b=hAHPpunP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b="hAHPpunP"
Received: by smtp.kernel.org (Postfix)
	id E4E89C4CEFA; Sat,  4 Oct 2025 12:19:25 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CD098C4CEF9
	for <tools@kernel.org>; Sat,  4 Oct 2025 12:19:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CD098C4CEF9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=heusel.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1759580355; x=1760185155; i=christian@heusel.eu;
	bh=ZtUm0Jr9/4vfinxL7r4p7LxcxmUF54FIlTrQZXWeZWY=;
	h=X-UI-Sender-Class:Date:From:To:Subject:Message-ID:MIME-Version:
	 Content-Type:cc:content-transfer-encoding:content-type:date:from:
	 message-id:mime-version:reply-to:subject:to;
	b=hAHPpunPrKvZaMtB+6GaBTl+svwmft/GcGSc6d+ENPDC+3p9mO6qTmb45nQouJEW
	 bMSMkIfx5EVORneIkRrzir+cYVk2YpptmjYCWXY9HwfXO1caP7Ip1aXxCjZL/iZZr
	 cYwzV8+Ff5l9q44T6Ts0YM5ZWIeN40B00lUqTmBznM08fsVs9hxARStRcYoIbatkm
	 idf9r7Kaqcuttu2X2atkglHtoZTPhLwqIAuuUFXPl0eV5b4zjo2xEXxA3SkLQM4Oh
	 ZWZ5w+myh6gZhS2/2/DYe5TxtiYdQlGTOMn7wpvykJOrFSoG4Jrfv/93C447qguYO
	 qek5kcy0LI23JtcC8g==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([89.244.90.61]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MYN3E-1ujes50syI-00OGjV for <tools@kernel.org>; Sat, 04 Oct 2025 14:19:15
 +0200
Date: Sat, 4 Oct 2025 14:19:13 +0200
From: Christian Heusel <christian@heusel.eu>
To: tools@kernel.org
Subject: [b4] Release tarballs missing & test failures
Message-ID: <32207548-725a-488f-8815-bc208311482f@heusel.eu>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dtxz5d6r6xgyu32v"
Content-Disposition: inline
X-Provags-ID: V03:K1:yi2WE0KRqF5EpXYMfmTIqBNckCYodhfmoGYlDDfhzzmKdaKEaNs
 B+voWG//gkpnXMIM+IN+4qdjVw7SrFsVv7mceRjyzwuDoezjC/FF7x0o4j+uiK2zqPR0Fkm
 Ymg/2kvLCOysB+BTN3huOiekiQYkINv1qC9RfVPxcE9ghXmT9gjbqdNP0m2DCurrap/EUNo
 e162c+FNcdqnQoRo3wz/A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:L1Y8/3rV/z0=;AcKQ2afabF5YYxB8TzXqxtJTD05
 kyMeBftwMOwKrZhFYPrMn4W8t97JrM8vwEIh1eFFzradjVQD9rp0uicsZeXvsX+ybGMFJLaM6
 BZmGHlcNjhB6gXeFq+/nXbehkgS/d7v6QFTV3bR1vvxtssPsjlAlCDrX20rL+MaHbuf32mfRG
 lAby632m+wGjwxOjfdoxO+qxgIMaE7/+UGmIxBVuLKfpdUzetVJDTynnuUUw/vWxMoxcx59rX
 ohHRqb4HE9p3lokgPPBS/dpy+fsZHM8EC7NyUfGy3fse41yGAK8kGbGveKsQlbH9aGh5cu8+c
 kr6Fs7oFd+qLI5MoSYeDlVnJhWI6sBsxgac2jG6d2BzwTCtQyOh39qP77HrZ2NNYtP7lDAHpV
 nyCdhFsKspoFazu+D74I4SLpcThvIx+VzyEVRFDXnLtrwW9D1Avq2j2EFOFyBkCDCfFOio0dL
 Uob3aIbyahdKPTraXA7S55jFB4c6t1K8mZJDN1iC3XmR7OH1N3k8bPtoMwGKDcezpe+xmOeFi
 DqEMk89BmREHvyGjzpRwGJHu9ipvpmfyyKzhLAmALgHdI0WhOLIG7/0kjsupYlY9avlN57Ptm
 zXZvFWuh771cJNyQd/2BbWB+Fk+GS+vlkKTJXH1xX8EEHuNQ4r2l+oBYjbWEdwondUm+8kwk/
 LcoxgIWRS1ODVOBWEfuiVf8UCJpAGLhTlu7DYkR+3SsflkM5afaPhj26aHh6PUZTeRytRt9Ne
 kDjxLFAKCl42GrjeYbwqxXl2GaUVL9D2Cw0fKWvAJsCmN0w0G/bIvWDaMX9dnz96F/s65LlFD
 Dz2+RszYsRbsgqiXUM3NP8JPLFbr0787MuuQ3ebWw7L7dXotGngaw+GLxUE1LGs1gE2iQu0xi
 VEJSsS0bfytCo99LlMVrJrwt+TgCJUopEw8eK/SPLLIUQwKCwAHF78bMSS+jKBe2u1FvJUDBU
 jMlx1KbqBi+2/55kat1A7jS1XgCS5eEBNQ6P3iLEbn2kVQiLuetpwfvmsaqpSJ3pV2vFTz99E
 PLaf6P1JCRcVquVUklPtpeplmKzuP9hTDx4zIeIsD8zER/iR0b67sFsyytDg/HF70CoszHYTG
 VwTQ3fUQVHoqOSVtZcMW7F+zXZn9XKvhAy6f+EZrCHud04/zz3Utz/A8CWPiHkm1llZIpAZgf
 Sq2hdj7YY0JxGUkc6QGqZ84iS78qEIEo1WGSO5BEqv8pKRd821yRdOG7dlCXwbuyHpyzbal00
 EGWBLlJaYHxnS5QHTtgfZhWOs8BG9lKJ/Ihg/errJpqkHvOx4WJu66JiMZF48iYWYESWiU1dV
 Tk0RqAu8E+5aJ4NsghvnrQAgLPTL0Bjm4qQwLtRKsqiKNxuNfI0YJzXqQbnKqHfMzDdt2NANA
 +DB820I71dKxBS9lixhdLekJaepgSkihw6m3bYlT3L5BseS9ZhANdZmE8fnCQVs9RYWyygG+C
 iQqQsjIbRKfLeGh7IUvrGRB+i9x2u8mq83ZxSRws66on/BpRGS+5ZP2CydAl7OHKqtRJPIwai
 AxwGOb7+pYsspXBlUzUMhC8DXMxrEXNqtMr9jLUBDZ0SYrIERKBkaVsnAEA2FS+nWqzYG7jtz
 o8pFELy3R6Xn0dkS8x+JSMgFH4q5wFuydWzaZKAE46V5EbeWwAn1NTahHWyZfgzGp0VPuq0i1
 tdocYSUKHLhJag0fr4GkGj


--dtxz5d6r6xgyu32v
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: [b4] Release tarballs missing & test failures
MIME-Version: 1.0

Hello everyone,

I maintain b4 for the Arch Linux distribution and noticed that for b4
version v0.14.3 there have been no tarballs & signatures uploaded to
https://mirrors.edge.kernel.org/pub/software/devel/b4/.

Is this intended or simply an oversight?

I tried to build from the git repo afterwards, as the tags of the
repository are also signed, but this showed all tests from test_ez.py
are failing. You can find a log of the test run here:
https://gist.github.com/christian-heusel/8f50704566f650ed0724f0d45a1d894f

Are these issues problematic or just something that is to be fixed in
the tests of b4?

Cheers and once again thanks for this awesome tool!
Chris

--dtxz5d6r6xgyu32v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmjhEMAACgkQwEfU8yi1
JYUgfhAAhUjqSZHIPht+DSVgiYDzDm+qB62IxsVRCCEqWe0OfPZqPrD8SN0C4EaR
n6623IJoUCu6+VBNBVBQPkXHBFcQEkSPoc9TEMHeK2AqwzrfE5m8VjZBzLNJ+uv8
UhGyav6ERgn7W40BLhmr3/bYNKCYSLliQbD5UT0FNpeafeq6GIv51FcQLuDcKsiq
Ab3oYL8L7QXahxOlwAGa8PIfKsDT1/VtlusA/31gs8fFKmmpyxWG2UJrKKvcsD2+
cMUvEKxcbJ/s4WHqhDT84dLI5Nv1lh+FEXIApkcxE+ZEDlhvP+ILOd60p9r1SQlP
SZjUr0q5Sm0FDTmShv/sAk0aI3pTx1jySoc1GjSbra17cRzDsIoan7+ZBNyyK2mZ
FqQk5y6sd47JFQj6STA6q9AlON4TWRTcBwLlb6Y8aybz1Gj7IlJr86rXS/TmF37r
NZLljZq4vyNu6Qq50g6BAXFRiTKjm+2AugNUtf+Z8w4CM36PRtXT5Z4LvmoxUG12
ufw3cOFAZMRe+W9XsxCn7h0H2b8HIArlrqt5oAaEMl9Z8BADbdDSj2EW9QuoKvbF
QiuOHtUoeba/Vgr/hxazJNvtY7+EYxWN1DkwcWvmqi/jqP6jFFDRX4ucKTqvl6xh
z4V0eMTvFwio+9va2FATXdyAVLU978Z1t9mrMZd8n+rMccx25ho=
=JqWn
-----END PGP SIGNATURE-----

--dtxz5d6r6xgyu32v--
