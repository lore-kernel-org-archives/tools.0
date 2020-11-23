Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web10.35724.1606142964781197776
 for <tools@linux.kernel.org>;
 Mon, 23 Nov 2020 06:49:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FRYN7kXr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.160.193, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qt1-f193.google.com with SMTP id z3so13469824qtw.9
        for <tools@linux.kernel.org>; Mon, 23 Nov 2020 06:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=48JfSAqDQ9et58F7l+8wV7uMzRcjIUmQJtRMOTs1A7Y=;
        b=FRYN7kXrNHP0T5J9wfG1SSfC/PkW4n36p14ch2DchWYDc+IUVHCMVhaKk2KlASmNlU
         RQH/P0aX1Dm4Wxetvo6/+co/pPgAGg/HJuUp6sEFKLZ4Vgsp/4yiP0VF8QMZyXk15N+R
         +0dNQRie3IHdZEEDjZac1qP6HD8LI3i+c51oU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=48JfSAqDQ9et58F7l+8wV7uMzRcjIUmQJtRMOTs1A7Y=;
        b=bHLcGdz745a5Jdu7Xd5BDSJ1C3k4/iEyvLppkEf2QgJ3dmnxrUCZK+WR/yZyAfW8VO
         hJtcxRfeZNlULQHspxawBeR64oT4bR6acKWxc0+0qQMvlng5P7nzaaM7Tq1wBQueiI99
         BRNZZt9iBkBNenKWgPKPL4AcUxRCikwa0yPj9+auBWHInlDWFwcL+F9cIEVnhA8azn3/
         c3RVfcMulIJx3UjgYtqOESeaZSUJ5vu0DpTQ8rYn9+uFuT/LY0A1f7AUKOypsEOzPtWS
         VmZxslMYptjfMNe2PXgGYZDSqmVX4TVrd77rldX/KurF9SWYhEzCaEerZdn9WGSu/1mZ
         sM+w==
X-Gm-Message-State: AOAM530U/Z7g5Tdev1XSWe5rl9MZNgLyuyyWhl9HpeQWfd6zQoX9Moll
	jRenFv6dpB5H+JSro368BxhIyg==
X-Google-Smtp-Source: ABdhPJzCs97JQLNbdeaMvBBP8eb0/jEkBOzlcXO/qEjQ93tA7/7YAAdviQPgzO4bqqKF3Rt1p/OGeQ==
X-Received: by 2002:ac8:5b82:: with SMTP id a2mr27836414qta.215.1606142963824;
        Mon, 23 Nov 2020 06:49:23 -0800 (PST)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id c14sm9666750qko.29.2020.11.23.06.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 06:49:21 -0800 (PST)
Date: Mon, 23 Nov 2020 09:49:20 -0500
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: Exception with b4 am
Message-ID: <20201123144920.qijmi23rxdibswtb@chatter.i7.local>
References: <20201123124139.GB6322@sirena.org.uk>
MIME-Version: 1.0
In-Reply-To: <20201123124139.GB6322@sirena.org.uk>
X-Groupsio-MsgNum: 260
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="savjeyaqkoc374hj"
Content-Disposition: inline

--savjeyaqkoc374hj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2020 at 12:41:39PM +0000, Mark Brown wrote:
> When running current master on Debian stable if I invoke:
>=20
>    b4 am -P 59 c0efb81064f71837f19408f65b52d155103ee514.1605896059.git.gu=
stavoars@kernel.org=20
>=20
> I get the traceback below unless I remove python3-dkim:

Right, looks like Debian pulls in an older dnspython version. The latest=20
commit I just pushed should work with either.

-K

--savjeyaqkoc374hj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQR2vl2yUnHhSB5njDW2xBzjVmSZbAUCX7vL7wAKCRC2xBzjVmSZ
bPfyAQCSyZi2tGKTi+GfNTfMnEb5crhwSmp17BD2jpmj5wkDOAD/ajDEoRo5gR1v
D34u/TokDaUx+0rZetc9lmzASrIj1wo=
=UKlz
-----END PGP SIGNATURE-----

--savjeyaqkoc374hj--
