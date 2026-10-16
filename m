Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03EEF466B4B
	for <tools@linux.kernel.org>; Fri, 16 Oct 2026 09:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792143376; cv=pass; b=rdttbbG8lzYuaB3XOhkE8X0YU0XFmsD1IGdKHhcL0CbncnC80nNPbmxiImvw9+Zl9v3JpsDHAIb/3V1qqFBveTkNB/v1tev2sBfGHjrE7Y6eWpivytcydjwRV2welnNdbufctZkD5YrEr4Cam82PdamHgQlWr0S12xWfWmLpQv4=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792143376; c=relaxed/simple;
	bh=d8v0cm1WfyjrnuafCif2r0so7wYZmDT4NslWsNyj0zM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WpNdDNZmvbNX8O7wkADWT5lujLFkffPyDsnx8hz4IUguJIgLmRPGGmC2jIMreKQJ6osrFiLfXGbLVQSBiBCMgw+0HC4cuig6AqfO21g4tctER15XEHrDxhAb4DW5tMl2c6lJXTlFcY+dEsNXZzZckHAvNHj0dKEchIcG/NNJ9Qs=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b=ARMBhICQ; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b="ARMBhICQ"
Received: by smtp.kernel.org (Postfix)
	id CE9921F000C5; Fri, 16 Oct 2026 09:36:14 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1792143374;
	b=j9MyhlHCIkzUTiYBJtq2R2A91jaVoibgRifrrYwrk4akMDsz9KbV+DlDRmi3wq2AHA1o
	 rSm6me9/IpasHcypuINwLh6eDlOvyIuXTZy8oOzvE6hj80pfZYXtrEPFFJmXdaaUrGRNz
	 c9hda3A0xzI/8XueNaJxearTk8MouZ1L7gjTwkFglTm2d2JQqXhM8YqS2dgu72h5zqMGb
	 3pdFnwaWJpAaFsqCp+Uhbcil6XI2YOxJroO0XOuABWLuTTnUt+uUcUyeq8TjF6lz7fO9T
	 cCdObyrbOpvyGZHPyQS0gozharWacxizoP8Ac+hcDiRbAitIsU0g3Kn1DlwkDCoWI4w==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792143374;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=H0Q95QMyX1Ze2YorTcbrTnhj7kkVBpX905MZ01ZUy0U=;
	b=0s4dGRAgwGpwRAvU3+cgywW5ql6OIfDIYCxtqVnbCSQFw9ICFAr/ZmMpZkZlva7GV1Eo
	 9OOz/NJz/1wHGGgnhLWDTFYIABew0xvwdZv7gz4EV00YqlwPD9uKElDoahatPVlW2H8YW
	 yBaIL/ksMjipHGoJRjQWS3GxAKs26gK4qatorQ6XzrVefnmu17ZleXgQR6VhR8AFx+SJm
	 TuJ81tx9pw3qwwZRQt4YNStyQfsq313BCKfadU6d6Qc19/9b37jEYUGVQjVd/Ph39PMSp
	 Qui5Pm2fJV3uAds4MUhbHZvcFcb+1HNni1wOdPYZDZtZ8BG7FXVUwXlIJyqWA2m4Mmw==
ARC-Authentication-Results: i=2; smtp.kernel.org; 
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=ARMBhICQ;
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1A4B71F000C4;
	Fri, 16 Oct 2026 09:36:12 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=ARMBhICQ
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 1A4B71F000C4
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id ED7DE202148;
	Fri, 16 Oct 2026 11:36:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792143370;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=H0Q95QMyX1Ze2YorTcbrTnhj7kkVBpX905MZ01ZUy0U=;
	b=ARMBhICQd9HrYvlV6VlZ5UxE6UG4x2zGuYS9ExFj+hADCZwkXeF0r9XJj2DD5FDRl8sNNL
	GPJ8OTeSpKdDne8v0kGwGSVZbRhnhL/fX9fwAg0rH367QM0I5arqAhHX0iSQT2U6EkdsHE
	8pUFl6kvaIA6RnBxfJD1u3BXGM5trDKeYcBFcoAXiHN77zEhcVSD9lLfbJDwgU8DwiVaVw
	5nfX7MrDjb0LThfKXDHlT3AMONYYaNTbNQ3PlAs+ePXYOJXGwzprWo5JEi03MS06whK59I
	M5MGfAcXg6iXMP1ER0YruNtRe8hmVDc9rl9Fr2pIjhAHJ3UiE2Q7w/wy4fINZw==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1792143370; a=rsa-sha256;
	cv=none;
	b=Cbai/dy1bNT3mmgAthUxlxAfEFBxZihxFXkck9Zv7qquMoaPFhMF7LOZq0yL4BIGHVjeBE
	o/Ouek72UmLD30FLvx7NzD3wtysJcEURSRit7GCq2w2N1pd13VXUqj5VxPsJuESy2mhZ6d
	sAhalHaazHtOur/upTUUAW2px6M8AmMZyKoLdmTO0OIYcrXKR65M29Z+q2vIZvcS7hD2nl
	iiebNLWh/tfBr9RPuUqNddMuEAn93LPIAmDIiGJ87XgVFzTNH0/xw0dMth1IMbI+9aja9S
	luqnnK+cneToItu0vLPmLikkuDQV7o9JcrQG/OSLcPnXYTynZ8OeIHGTaWN2Bw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=mkl@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792143370;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=H0Q95QMyX1Ze2YorTcbrTnhj7kkVBpX905MZ01ZUy0U=;
	b=e5snFSjyXP4ffcJrLo7C9sL6FKuQY1Zq6WNb5gs4RT0pYrxL7Bck0gPi+GEEUA61dZbsFI
	32RNWR9PdFL5NLB5bqgn1sXWPD5JzVVGmMYtpzijT1/nEwVXnlcf7gSL8cbw6VOpTeV48v
	zKhZo4YHnWmUrNecv61Gu/IiEP8Z86FJcQtNxvl73EhzAR3gXtyM2w7PtpGF7tPwGOOV60
	2iHahPQsRbGbTk2nbwFvkQYtRTnXNC0TXBo96KB1u/l+2zhzav9fTatxApv0psgxy4Z0CA
	ORzFxy3mDSzq9XuA4DMV+hipzrAyYxYKBiBgTSm48i+7hQJKRqRPjkypgcOfJA==
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1xHeME-006AG5-2p;
	Fri, 16 Oct 2026 11:36:10 +0200
Received: from pengutronix.de (p4ffb23c7.dip0.t-ipconnect.de [79.251.35.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 9C24C5C5F01;
	Fri, 16 Oct 2026 09:36:10 +0000 (UTC)
Date: Fri, 16 Oct 2026 11:36:10 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: mricon@kernel.org
Cc: tools@kernel.org, users@kernel.org
Subject: b4: retrieve API key(s) via git credential mechanism [feature
 request]
Message-ID: <20261016-tiny-labrador-of-serenity-28c5fd-mkl@pengutronix.de>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ovpiud7r7c6x2u7p"
Content-Disposition: inline


--ovpiud7r7c6x2u7p
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: b4: retrieve API key(s) via git credential mechanism [feature
 request]
MIME-Version: 1.0

Hello Konstantin,

I don't like the idea of storing my patchwork API key in plain text on
my system (which uses encrypted storage, though) and my dotfiles repo.
Can you use the git credential mechanism to retrieve API key(s)?

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--ovpiud7r7c6x2u7p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCatHwCAAKCRDMOmT6rpmt
0gEIAQDMfhvlQxII39Yk31OTYUKo7S9jDggkFIv51Deh5GUprwEA7EflsDKW+e/3
ujCzXR2AGrsldpKI7vUu3EZWPg6xwg4=
=FnP1
-----END PGP SIGNATURE-----

--ovpiud7r7c6x2u7p--
