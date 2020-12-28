Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web09.1009.1609179514123486367
 for <tools@linux.kernel.org>;
 Mon, 28 Dec 2020 10:18:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BYymKZ3c;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.160.175, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qt1-f175.google.com with SMTP id g24so7403808qtq.12
        for <tools@linux.kernel.org>; Mon, 28 Dec 2020 10:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4H5yLP2YlKwFGd+UWGePyX21DdqIQpcIPIha/SNc5ok=;
        b=BYymKZ3cD8q/ZcC013xDIq4AYGd18Iv3zf6Nd3luKa9e00/Y2BxH7GHx8eOaMzaQBW
         JajNPLfe9br3w8Cncn/mqwz8YgN7g3G3MvaMerHGoClJjoi0/0qOTMOnGjuH1uZNzgPv
         oywafKV/SIryyv8qD0u3hbgLK9wwpWWUErgZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4H5yLP2YlKwFGd+UWGePyX21DdqIQpcIPIha/SNc5ok=;
        b=KvbiUzK5zz0nDSrhGUerFMM8yWq6fHe7RG3NomM8tR+rLP+yCeDFMZXoqwHkyE7DHj
         cGXzrMcchCZ5qMTzvvTbAV0xz0gGOo12sLwCEzrGWAgKoWgVxBS9Cgy89DC87M3u8m3I
         8nDeNnbq/yBSrGXWN6hJHFGzpczds359zJk0bd+lxu5hxxnGoJE+pLvGNNIS7rLgypKa
         cD3xX0zQyFu0NCrW72RTdlMfHqpwMDetaYxL7/refaR7k9PsvLvLVXYW1p5pGX1WGTM/
         l/b3eUT3ohPMLDejQxoY7i19s58b8nOlZCJ5gmKabOEpsGmIyuwlYipEV2ZzopWpRWeC
         WT0A==
X-Gm-Message-State: AOAM533qzAwG3Ar+Dk2kVFtz/RVb8s21YWOrw7RgSclQ3kYQw40QI5jJ
	Ks5yD6kxKLF8wBfV8uS/QAg26w==
X-Google-Smtp-Source: ABdhPJz0ETx/eTnYj9uJUDlaFqthGmZ5tkec4t9Oxhf2YmZjBoeJJQEkh52T4Q66y0iyVrOhvs5YIw==
X-Received: by 2002:ac8:6f77:: with SMTP id u23mr46089251qtv.118.1609179513158;
        Mon, 28 Dec 2020 10:18:33 -0800 (PST)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id s21sm23825166qtn.13.2020.12.28.10.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 10:18:32 -0800 (PST)
Date: Mon, 28 Dec 2020 13:18:30 -0500
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 ty unicode crash
Message-ID: <20201228181830.wi726giciurlhunh@chatter.i7.local>
References: <20201228161347.GD5352@sirena.org.uk>
MIME-Version: 1.0
In-Reply-To: <20201228161347.GD5352@sirena.org.uk>
X-Groupsio-MsgNum: 333
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ifmiuayo3txbi2hi"
Content-Disposition: inline

--ifmiuayo3txbi2hi
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

I have an attempted fix for this in master/stable-0.6.y, but it will only
apply to future series you fetch with "b4 am", not any existing tracking fi=
les
in ~/.local/share/b4. It's not a perfect fix, since the underlying Python b=
ug
is still there, but the changes should avoid hitting it in most cases.

-K

--ifmiuayo3txbi2hi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQR2vl2yUnHhSB5njDW2xBzjVmSZbAUCX+ohdgAKCRC2xBzjVmSZ
bLEGAP4g+ZOXWpR83CY/KzwjBPP8ki/ndSRFVgyko0TTPONbPwD/djruWFARAhgS
39KJ1FhEFwtHL9PhqTVZVH7ZAGPaIAM=
=uLGX
-----END PGP SIGNATURE-----

--ifmiuayo3txbi2hi--
