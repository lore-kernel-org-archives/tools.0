Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618401CB53D
	for <tools@linux.kernel.org>; Thu, 10 Oct 2024 13:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728568270; cv=none; b=YV1i5Tjl1OGcjMZAvq7a8dGiHhzUJcPiBFQH8Fo15FL5Md2gucXUIubdhKjKSKQm0zFbUPwm5ytHUM0ZTEGn0/fbYfRH7iIS/2dgYwxPW8ty7J7O4FC9+Js0E05FHUwfFqvbhuofrsmHsnJ6KJBfVC1Hg4es7dTfIDGgZAlZBwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728568270; c=relaxed/simple;
	bh=LPloP9zl25grIB7YauRCzyap0Rse4JmdAtT/PBhsJHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WMc9l8C656IctxAgnaPLH1JMkpT5uTWsXOVi2AKTL7fjXDKLwmUjLDJCDLvTMf5qgy6/5lRUQT/J1nxCn0EIQ3m3GVCtIOu3eUdRqWV+gIImviGMfJ7LEYxnt9C9wFPCWo9IMtPSTraufJi4Np9H+REdu5IUDgQa/MnHRk6ZIok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b=vZ1eGgA7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b="vZ1eGgA7"
Received: by smtp.kernel.org (Postfix)
	id 16729C4CECC; Thu, 10 Oct 2024 13:51:10 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BCF34C4CEDC
	for <tools@kernel.org>; Thu, 10 Oct 2024 13:51:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BCF34C4CEDC
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=heusel.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1728568264; x=1729173064; i=christian@heusel.eu;
	bh=/nLbsoVZg1WxxXFKOoDp4LCASisYc74zqbmDBMvzUN8=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=vZ1eGgA7KXkPFKbszANXSlZxNeVwO1mu9MO1jiohVtiQsOjaDVwdRFOi8M1oXPB0
	 7HZHTaLb48v4ku8PvFkEL+IgBTKv7dAnFXEJCdB8Q52yxhzB6fbifjEMKdL70dwp3
	 EYOA//wPECSLZh3YC7Iw1Hj0I7OhSoqTdIo7N1qdviwGzIx+e6VhQH7L+Hj3dIlwX
	 maIvzecFG4bMIDNxbjcuYZuvITsuCobcUK0C9p9eD15Qx/A+GljnABE1P2cp0hfEj
	 3tdzhHNCPmBvLn0ikTDLyGjBXQKFdM17fc9EcW9nv8SYbOaYkbBlr6mvYBPaBBYvg
	 vXE4s2DNuixVqx+K+A==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([141.70.80.5]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1Mq33i-1tkcSw1cLC-00kWS5; Thu, 10
 Oct 2024 15:51:04 +0200
Date: Thu, 10 Oct 2024 15:51:03 +0200
From: Christian Heusel <christian@heusel.eu>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: b4 crashes due to type error when signing with gpg key
Message-ID: <52dc54e8-b7a3-4892-aec4-067d8e8c331d@heusel.eu>
References: <9ebef39e-ec9d-403c-a0f2-9a3176d71c1a@heusel.eu>
 <20241010-refined-important-mole-a56fc5@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uwmd7k7wx4jp27ga"
Content-Disposition: inline
In-Reply-To: <20241010-refined-important-mole-a56fc5@lemur>
X-Provags-ID: V03:K1:oNXmr+/bDOll5E1106mvvT1qBNkagQ4JWFmGOKgIS04oaK/ZyDK
 k4cc5HCv+Ca7FmDxDGClcjTmb2O5Ofv3YGkiE39tfjwstyWDjzrljYvA9EHlWeyUkHTZhQ8
 lQLc/9iOD5v1IhVWgZvIcj09srk24NzWiInjlpF5pX9CY6cVYVpb3248pqg9w2zNA3+9Bq1
 CIKwTAZxkAmXhCL3joRtg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:BHhuGOPUgX8=;h7QF87ZSCmxuCKGME7rlLpB9sn/
 GvHPy6F0ihUZXpCQ+teH4eVingEZ2ZvV9r5AQsufslK7DfwdCIvCc5M7KIEs2xAu9oOaPspjO
 vN4/etV0Go/hAInOkh+U/PMkvPMqSOLKMyQaYAFogD+ZfEQptJ/sSl4sIXajaz2ONrXHk9xTC
 tILhbO9vGqRyIhszrOdbm/ZB3c68YO1+Xk6a/ty9qB1mPC2uHCrbpLe0FRUfeAiIht22bXMKu
 Z3gkPnzlgTQs3ZnthwEBQTLbJqcUzwZsSqqPrHUSgaQmQkfVQKiH1aIpaPGtYzbZCcbDWVnAO
 KaUulFWhcx4rjzhQMwUM2SPf/wIcNe5iR3AoYABpqM/CKoguPHUfsQw6KTalSzyDMbGoCspk3
 Sxxpgyjwd/SYQjFvf2b5SsrweQaE1//WbCevEqB16IwhWZndGNg/9V0aSKn+YyhpAgWS/nXE+
 6XTg5kLYZWPtbWb0cyOfePMjBFAeFDNJh6yGwN5pWev8XIsvqnkGieET+gwe+jQErUqGFg+KP
 oW+6l66VtLwubm9WwQA/FL3du4h8kI4qkoQDCJsEl/ny2SCgiMrvIfdRgiXjRzdHWBuE2H9yy
 6EJg0iov1ADOovlECyfQeZyUofahrRIhXRGO31HMBUsiCeUNYLwHRxQfg0Bl1Zaw3bhfeC15b
 dEpAOZ5s/eozGPmmapH7zIDkIFCra3ChjmmRTJCchSu1Rh+RPp8rSKFUPMD4TMOoTI8uY1/X1
 TQawCYmk5a6C7URcz+dG+XFPO+j1LI1sA==


--uwmd7k7wx4jp27ga
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: b4 crashes due to type error when signing with gpg key
MIME-Version: 1.0

On 24/10/10 09:40AM, Konstantin Ryabitsev wrote:
> On Thu, Oct 10, 2024 at 02:44:11PM GMT, Christian Heusel wrote:
> >     $ b4 send -o /tmp/presend
> >     Converted the branch to 1 messages
> >     Will write out messages into /tmp/presend
> >     Traceback (most recent call last):
> >       File "/sbin/b4", line 8, in <module>
> >         sys.exit(cmd())
> >                  ^^^^^
> >       File "/usr/lib/python3.12/site-packages/b4/command.py", line 417,=
 in cmd
> >         cmdargs.func(cmdargs)
> >       File "/usr/lib/python3.12/site-packages/b4/command.py", line 93, =
in cmd_send
> >         b4.ez.cmd_send(cmdargs)
> >       File "/usr/lib/python3.12/site-packages/b4/ez.py", line 2111, in =
cmd_send
> >         sent =3D b4.send_mail(smtp, send_msgs, fromaddr=3Dfromaddr, pat=
att_sign=3Dsign,
> >                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^
> >       File "/usr/lib/python3.12/site-packages/b4/__init__.py", line 397=
8, in send_mail
> >         bdata =3D patatt.rfc2822_sign(bdata)
> >                 ^^^^^^^^^^^^^^^^^^^^^^^^^^
> >       File "/usr/lib/python3.12/site-packages/patatt/__init__.py", line=
 1002, in rfc2822_sign
> >         pm.sign(algo, keydata, identity=3Dconfig.get('identity'), selec=
tor=3Dconfig.get('selector'))
> >       File "/usr/lib/python3.12/site-packages/patatt/__init__.py", line=
 580, in sign
> >         idata.append(b'fpr=3D%s' % pkinfo)
> >                      ~~~~~~~~~~^~~~~~~~
> >     TypeError: %b requires a bytes-like object, or an object that imple=
ments __bytes__, not 'str'
>=20
> Can you give me the output of the following:

Sure, here you go:

>     git config --get user.signingkey

    $ git config --get user.signingkey
    christian@heusel.eu

(this was already in my initial mail)

>=20
> and:
>=20
>     gpg --with-colons --fingerprint "$(git config --get user.signingkey)"
>=20
> -K

    $ gpg --with-colons --fingerprint -K "$(git config --get user.signingke=
y)"
    sec:u:4096:1:C047D4F328B52585:1634302979:::u:::scESC:::+:::23::0:
    fpr:::::::::6F779ADE247A6B8A0F72CC13C047D4F328B52585:
    grp:::::::::CE4A84D00DCBC94B028BE392A718A13B143CD8B6:
    uid:u::::1634303292::EC73D33378091A6E253D239CCE7A85F5DB161CA5::Christia=
n Heusel <christian@heusel.eu>::::::::::0:
    uid:u::::1634303162::48746678F1EAE23BDDAC4B526F5C571FAA987931::Christia=
n Heusel <c.heusel@stud.uni-heidelberg.de>::::::::::0:
    uid:u::::1634303192::8DA8B6040D8A9417FC1D97826EDC7C33981A9B6C::Christia=
n Heusel <chris@mathphys.stura.uni-heidelberg.de>::::::::::0:
    ssb:u:4096:1:B5CACC35EF9F1204:1634302979::::::e:::+:::23:
    fpr:::::::::BF020F0DAD135CC6C0237F6CB5CACC35EF9F1204:
    grp:::::::::CE06F15FFCB96F00727234AACAE1A7D0C0ABCD7E:

Note that I have moved the "-K" forward, since in the order you sent it
it just printed all the keys.

I can provide further debugging output or test patches as needed!

Cheers,
Chris

--uwmd7k7wx4jp27ga
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmcH28cACgkQwEfU8yi1
JYUdMhAA10IKMLlk1RjaRVlCm3TlGX+KyEeJDKXuBHtfDerFNgOb/1hsDvdKnBbz
w5vXPNx73QJwOLEJZOj188WvYqlZvASegQI+y3JYcrwF0REUSnP2IaV2atb5JE6q
JARmm/mH5C8SzzRWYkSGSUraZqFHOSM0rjlxNhtYGvMgeNSGotIbbsK/T/k5/pBL
v3HmexT3B6gDr5EO056ktbrCP2lx7jMmC0hviT7o+FZVsdoJKF3JpB7J5WNo8LcB
9U2hASI+8dJ14nwan/U0A64a0nwdEoIz+ZGZgvcizG0Bfplyy4dupBjfNyc5n0gy
DXankjkFeU8RYhtTJSKcpSpDQe1W++kgbOOyOurfdCjRl3Gei49QfMGuAHR9L4VL
d57Saopm5aFnDY+NxeO8qrAeFAdAV82T4rRtbYnOQdmCeazpT07SPQJdqVo/J1X2
+WCiXaZil/YJYhg4PbknIBqPNAzqoUhPvk84B0I6/A8noNLpvklUJ6YVnMJ/61JU
rSb6vDEUXoCCQwml76roKVVruAgdvjVoGAwTgHK2Z8akBUv1Fj9e1mB1inMFVg6S
zPZkEVAnNmZrkQLgoV27niVxEWfBqUkZ0QmlgoJvaNSv7M4PRNDj8x3vIVtLFbye
k0+CKkF+bz7mt8xbMBOXpdXGB/6RcZbR5bq7eltQ4wsRL7C0hgw=
=K79B
-----END PGP SIGNATURE-----

--uwmd7k7wx4jp27ga--
