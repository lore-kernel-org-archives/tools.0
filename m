Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web08.47937.1609174590854247707
 for <tools@linux.kernel.org>;
 Mon, 28 Dec 2020 08:56:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=awqIw82k;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.222.171, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qk1-f171.google.com with SMTP id v126so9247368qkd.11
        for <tools@linux.kernel.org>; Mon, 28 Dec 2020 08:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rRzBiPgthYSe1tacTaG/g8oYAHC86+TxOA+UrfOOpXI=;
        b=awqIw82k7eVIv1or8xMVRkCtnPpk8xdITIaKaaV4ZsGb9lkJh0ZzJV0kxmFx5oNn46
         NEEXQda5ZOkIvrEv7SztbL+Tf3v+bb6kkI70YURkY5JBt542abViAbLPsrkNThtrEatf
         MwUyWJA3j896x+h4MlUC+HyMeYOgUMUwskE3A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rRzBiPgthYSe1tacTaG/g8oYAHC86+TxOA+UrfOOpXI=;
        b=Okh/pxc/LL1uzpfGwBr2/RQM97M6B31O+rlqOW4uBhLEAiDQnukbRGaNWVT3dY++4t
         dy4TqLROyZSMUcnIExtu8eabHux3rXpe81gBky0EldPmg/4vt7UTyDbrXCXW/sGKZHhW
         jPSrQ88rb1P6Z5pym+pURxAXXoKhitEDPctysEwkOWNV1YYBP4ZJg5EkVZtOroh3AnlW
         UlWGzSUqIrU5j1jzsz4L5QheImY7MLl0QeYo5Khheq57ITzrYcxhbJjEI4gtCjxSjExC
         1aS268oFpVXr7Oej0zFSFJ7xniOSfw4o2dUvb0yBblK/xdQNkzDagR7+O9H7JzBlGtrj
         AWZA==
X-Gm-Message-State: AOAM531zbwaO40fk6wockjfxctr1pWLRO8Qyd6BwG0UEV4Gfp8lYBaiE
	JSzRd2dS4KXJgvvBDSzbayoWQQ==
X-Google-Smtp-Source: ABdhPJz/AQi3Zad4xlh3GFptcivljBqkIdKx6ZNIHIbsxlft1ALPhjAkqimNsk65M7igBWh3QNE2Vw==
X-Received: by 2002:a05:620a:11ad:: with SMTP id c13mr44304472qkk.134.1609174589962;
        Mon, 28 Dec 2020 08:56:29 -0800 (PST)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id d140sm24219029qkc.111.2020.12.28.08.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 08:56:29 -0800 (PST)
Date: Mon, 28 Dec 2020 11:56:27 -0500
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 ty unicode crash
Message-ID: <20201228165627.7r2zd2gzvo4kuhsg@chatter.i7.local>
References: <20201228161347.GD5352@sirena.org.uk>
MIME-Version: 1.0
In-Reply-To: <20201228161347.GD5352@sirena.org.uk>
X-Groupsio-MsgNum: 332
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sfakyrzlbgvdkimh"
Content-Disposition: inline

--sfakyrzlbgvdkimh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 28, 2020 at 04:13:47PM +0000, Mark Brown wrote:
> Hi,
>=20
> When I run b4 ty and it finds what looks like:
>=20
>    https://lore.kernel.org/r/ec66399502514edbb1de3cf9bff08b1d@realtek.com
>=20
> I get a traceback:

Urgh, this uncovered a bug in Python:

In [5]: from email import utils

In [6]: utils.getaddresses(['foo <foo@bar.com>'])
Out[6]: [('foo', 'foo@bar.com')]

In [7]: utils.getaddresses(['Shuming [=E8=8C=83=E6=9B=B8=E9=8A=98] <shuming=
f@realtek.com>'])
Out[7]:
[('', 'Shuming'),
 ('', ''),
 ('', '=E8=8C=83=E6=9B=B8=E9=8A=98'),
 ('', ''),
 ('', 'shumingf@realtek.com')]

It crashes when it tries to treat "=E8=8C=83=E6=9B=B8=E9=8A=98" as an email=
 address.

>   File "/usr/lib/python3.7/email/utils.py", line 91, in formataddr
>     address.encode('ascii')
> UnicodeEncodeError: 'ascii' codec can't encode characters in position 22-=
24: ordinal not in range(128)

I'm not sure how to tackle this yet, but I'll try to figure it out.

Thanks for the report.

-K

--sfakyrzlbgvdkimh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQR2vl2yUnHhSB5njDW2xBzjVmSZbAUCX+oOOwAKCRC2xBzjVmSZ
bDbVAP9gAbvNO4Wx3Az3knwKZOP0bXBGP7SCaNoAiPZls74BKgD/Skpr5r8D8gyw
zDB2PHEhIzBvufygUO0NTTAJKrm5twU=
=M1nz
-----END PGP SIGNATURE-----

--sfakyrzlbgvdkimh--
