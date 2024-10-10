Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECC01C57B5
	for <tools@linux.kernel.org>; Thu, 10 Oct 2024 12:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728564578; cv=none; b=bVhH5GROjRipkF83OPWN1dA029LqpNYoc0xyYDZYAK23AkBAvyUdmIPtdnP7P5AOksVFA0gcbcsbl9GKDXXfk04l6FHjKkcC5vKf5LO0p8nVVTZSlJQNYePOhIqhCvtpmmCnnF6b424d1Jbdi+fBjer9P96aAFY8rKw+KH5wulA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728564578; c=relaxed/simple;
	bh=qNF65Qe5Q88GU9YwCTUJL9huSbqTC8RZe5lXyW7ew00=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fDXRzsZxLrDmSouGepituSFgAXerFP/iYa/1Sh6U8BDhZXpQdhkcBy8IGK5YNTmMXHR/ZALQaysZbJBEIH+fkFIJxkUYUxolsyaI5kO3YBuz1oQ8e/DQwhKgDy0GiQJdwcBJxTkLw6n4fPLS4WZOYJltXRO8lvX0y930U0SDVAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b=C9/gP2n0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b="C9/gP2n0"
Received: by smtp.kernel.org (Postfix)
	id A53F2C4CECC; Thu, 10 Oct 2024 12:49:37 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B7E86C4CEC5
	for <tools@kernel.org>; Thu, 10 Oct 2024 12:49:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B7E86C4CEC5
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=heusel.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1728564566; x=1729169366; i=christian@heusel.eu;
	bh=FM+YNPt6cZU5Ty44rWNhlmvYdZhmLT52acXX/d0zP5c=;
	h=X-UI-Sender-Class:Date:From:To:Subject:Message-ID:MIME-Version:
	 Content-Type:cc:content-transfer-encoding:content-type:date:from:
	 message-id:mime-version:reply-to:subject:to;
	b=C9/gP2n0sw86BnPqjZnKcLQg/Oo2jF8/A+76BLM2HPlm6PTRXYFf+k1RVzO/wuf7
	 mzqxh7hnrJb82gYyzW2bOgakU73uuhS7hJPokYuP0AsDLp+pfSkFYavHi9r0Rk0kf
	 AFHpEImQ3ubAdVYmReYjMz84uGipqiUEwiMoSk2rW4EMGvYI2MhtaQqBVZzMX79sJ
	 rPDIwBS3e4V60ifuvDToPdarpRzmBy4f6+/RiuK3q8n5zQskCrE0A0bmM1JRf7IU6
	 8PoiN2y0OLGa+3DIXlN4cZoKe/0InBvIfAp5Wi2iR4PW8pDGiUQzrHPEbNwzC9Rs+
	 Mzls694x4XhMl31I+g==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([141.70.80.5]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1M1q8m-1t14Nh2bto-005O2v for
 <tools@kernel.org>; Thu, 10 Oct 2024 14:44:13 +0200
Date: Thu, 10 Oct 2024 14:44:11 +0200
From: Christian Heusel <christian@heusel.eu>
To: tools@kernel.org
Subject: b4 crashes due to type error when signing with gpg key
Message-ID: <9ebef39e-ec9d-403c-a0f2-9a3176d71c1a@heusel.eu>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jervkqi3dajvg2hf"
Content-Disposition: inline
X-Provags-ID: V03:K1:E4SNtsq8M5ie2agK4uUZjaX0dnX7jNypC7Qkt3ULPR3rCF8phbj
 B1XDoB0K++IXbl00OE7PeC1dgazG8wZNDqWJf3A48fW5nVmHjc4oufh0FNlwj1/XRb3n4H5
 /YmzejbthW591VDORGh0bXi4Z5+j3hk/3HRG7uLey0AlAOokumaZXSI+XE7zeJ/czzpgQZQ
 JRp+P3s8qn7l0cWOUTAvA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:LWpOpFsEgXs=;IBq1wIFAwKJ+uCaoHUasCFtVYdg
 iPzCfh2eg6fRow6KiYeyXzJ4e6yMFGmC77BF+3AY+KVWM77HLZ/23Ma0J3mK1ap7nCiMSXBcT
 zT8YSQCl4AeJ1/T4w6SZbyPJVRrKNUtyWD5tRsYWt3WNunF7mveXrNQ9FcVvApsIJsGXfKxrg
 WNIhmQAqXpBkM3obexXAE2BsxMIiUJ4oVhehZDwPNDYVDJxteykO1z4PNHVuSRMfEKjvD8WXM
 HKR4G5G2k/dxwoiQZrkTovWSJGgk3j0Jdv98zkD5l4Sm8zPsxnBMFO5z4Ah8clWhwZwqbXZ5C
 UJ95xzqhsI6Yhk5l8BKNYi0Q6yffwpwKuGaZqE8XdYVjK44I2FPodC9+AReDujPf77GnA54VH
 8+tjJjjVhfPmyNLIWqOotDpv9UfIhFeQdkQ3kBbdj1r0zxWcfEKfb6WPvdsQgNTnsq3dX/e8b
 T+7GIFfd2Y0xDP6hph+zbn7pahQmvLSe3Y8/uZ5PxR2mKqciHLfG+mR+Z6uH3hN1aDJy++faO
 yCturPwvTd2wSe+GxU75a3NCMq2I9/OOkBO5G9O0LkDx5M10stPlY1HoYgHIAeZDL+Ysourc7
 2mizqtMbKOUQXs20Zh3Aw8IUiEnuvNExa0SypSNh5Nl6RGqKj7k7/TiF51mTMk0XMe6BfjQB+
 t2M4IvKf2UDI7NjApGsLvvnUgLyB+RIPiUbYNIxGVFwIrHR5V8TBGIdJWe5JoSmYhV2zx/6UT
 MSKbJ2M/L+KVtyGpDWmRCs5eVOGO25tiw==


--jervkqi3dajvg2hf
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: b4 crashes due to type error when signing with gpg key
MIME-Version: 1.0

Hello everyone,

today I wanted to check out b4 for sending patches again (I used git
send-email so far) and noticed what I think might be a bug. After b4
first complained that I had no signing method available I configured my
gpg key via user.signingkey and then got the following error on dry-run:

    $ b4 send -o /tmp/presend
    Converted the branch to 1 messages
    Will write out messages into /tmp/presend
    Traceback (most recent call last):
      File "/sbin/b4", line 8, in <module>
        sys.exit(cmd())
                 ^^^^^
      File "/usr/lib/python3.12/site-packages/b4/command.py", line 417, in cmd
        cmdargs.func(cmdargs)
      File "/usr/lib/python3.12/site-packages/b4/command.py", line 93, in cmd_send
        b4.ez.cmd_send(cmdargs)
      File "/usr/lib/python3.12/site-packages/b4/ez.py", line 2111, in cmd_send
        sent = b4.send_mail(smtp, send_msgs, fromaddr=fromaddr, patatt_sign=sign,
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
      File "/usr/lib/python3.12/site-packages/b4/__init__.py", line 3978, in send_mail
        bdata = patatt.rfc2822_sign(bdata)
                ^^^^^^^^^^^^^^^^^^^^^^^^^^
      File "/usr/lib/python3.12/site-packages/patatt/__init__.py", line 1002, in rfc2822_sign
        pm.sign(algo, keydata, identity=config.get('identity'), selector=config.get('selector'))
      File "/usr/lib/python3.12/site-packages/patatt/__init__.py", line 580, in sign
        idata.append(b'fpr=%s' % pkinfo)
                     ~~~~~~~~~~^~~~~~~~
    TypeError: %b requires a bytes-like object, or an object that implements __bytes__, not 'str'

I can't really judge if this is an issue with patatt or b4, so I thought
this list would be a good first contact.

Further debugging information:

    - b4 version: 0.14.2
    - patatt version: 0.6.3
    - output of `git config user.signingkey`: christian@heusel.eu
    - git version: 2.47.0

I have also quickly skimmed the commits for 0.14.2-post but didn't find
anything that looks relevant at first glance.

Cheers,
Chris

--jervkqi3dajvg2hf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmcHzBoACgkQwEfU8yi1
JYWo/BAAzopJTZ1Kc7wGJFQug/4PllPHzxn8KmbCCnK3G+5zTVJhW+/wspDyAK4C
22VcAYGMtSD02yDPySKF0nUm3lYn+vcdN2lujl9JIHpWPI+ULU6eqoijolrmcSAj
NfkvQyyAyGl3gv3Vc/1pLQKaRfn42CEsUpGekN0+Vn10c1Is2ZYCd6Ql6CAf25f8
CARPn6Xs44R7LxK3LF87yu7kcnnHCt81X5L9LQPqTCePch1dvQmWRxoXiv7innH6
r0Gu/YipepaHQkPby13R4GDj2QmAfaq2CpY/bUwL8XGWfn7ZKvGrHB70HGtP3McC
qEN28liPT7rQK7ijXj2+CBNHQjaN+LjmV2CqoHHjjgEGvk3odJKRf0os48k5AJAJ
aiGIOD/62cHXi1RWIicZTKEYlehrkafFMW/2TdeNoVM/1593M/A4+rqmW4knsawV
Y4rFTWCu1H7wQZ61AMf2dGnFcHmMu209+jZ3F8Ae07mON2l5YZdi7vRQtDeY4vlP
/2idBLHtRyEq2SO+YS3wk0PWrAaHXEA18mVZz8VL+V38U3arngfC2Z9T5vzRpdnL
xGKEsfd4pIM1NTsMRSTR8MRr1R5VD65j8Rixh8tUVmdSaMZdbt/W4w1DpfENR8GS
xaTXEFhw7OVoK1UEF4+lhBu5NmJNcGfX5FI/rtxcIDcKsL81zOA=
=OsoW
-----END PGP SIGNATURE-----

--jervkqi3dajvg2hf--
