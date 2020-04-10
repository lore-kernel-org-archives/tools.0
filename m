Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web12.83.1586551050859897833
 for <tools@linux.kernel.org>;
 Fri, 10 Apr 2020 13:37:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IgW0KlKe;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.219.46, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qv1-f46.google.com with SMTP id p19so1551013qve.0
        for <tools@linux.kernel.org>; Fri, 10 Apr 2020 13:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=TTub9IhfVU/BmwvTGFUjteJ4g5kMPkc/si3S7GkgsU4=;
        b=IgW0KlKebSHCkyC748Jov+kmBrgvmnffHY/jKD/A1qe3TWEHjh4RByYcU/uT1uBtjW
         9HWAeKW2QUzcYExmJASuZ6q9UIchLtWdGkn8JcQYrqBGAmaA09EbiPtKei6NiLjIXK2y
         xj8ey92EcPVfHnRxK+tQrK8r0SPMb6HmB3RTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=TTub9IhfVU/BmwvTGFUjteJ4g5kMPkc/si3S7GkgsU4=;
        b=UwL6CYzuuXGDoi7woYkoriA+8A4319luzFQSadjzNNyrjPoGlCrVzAw2ljO4hILEH7
         u0YOSh4M9fyHNuFkrQXIvGUOH9VDblKV2o7JEKRWub2A1m+48sud70E/vyTw+QkUotTH
         pM8fguwW6ZhyYoFIU/ShGe3oXwMmxLnP5WXFuiuC7NdSWdmoqFaN5CE3hE1HmLXY4Fk6
         D014OiY5y7s01HhuOzGcQUAyzqXM99+pDJldZQW+VjxoKILOTF4xNtPZ+n09rbJlY/TI
         6Cy0hCyOMz76ZFd0T5IwL0Mf2y2ZwOVHNjuPsNrtd+TOmlUitvsIeeJTpdFDIQkyM05L
         Tkhg==
X-Gm-Message-State: AGi0PuYhnMhcw+jHWz8x5L59Hp7cG02hGFhwc9HnBOGJeHjziLdS8OGJ
	S1Lwq5yYDxMr+bYLQ/h4Yfopt4MnS6k=
X-Google-Smtp-Source: APiQypIkrSO3N+6v1kOrbLdX8iDQX+dCK00SxZCra+N9jglWipUIw3bZ7EpsxNLLyemlR+svrezPaQ==
X-Received: by 2002:a05:6214:924:: with SMTP id dk4mr6789917qvb.140.1586551049698;
        Fri, 10 Apr 2020 13:37:29 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local (107-179-243-71.cpe.teksavvy.com. [107.179.243.71])
        by smtp.gmail.com with ESMTPSA id x65sm2358791qkd.65.2020.04.10.13.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2020 13:37:28 -0700 (PDT)
Date: Fri, 10 Apr 2020 16:37:27 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org
Cc: users@linux.kernel.org
Subject: b4 v0.3.7 is available with minor bugfixes
Message-ID: <20200410203727.ssas63ka3ok44ytm@chatter.i7.local>
MIME-Version: 1.0
X-Groupsio-MsgNum: 72
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iows4bghsoat2xku"
Content-Disposition: inline

--iows4bghsoat2xku
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi, all:

I just released b4 v0.3.7 that contains minor bugfixes. If you're using=20
current 0.3.y stable branch, you should update, or run:
pip install --upgrade --user b4

Best regards,
-K

--iows4bghsoat2xku
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQR2vl2yUnHhSB5njDW2xBzjVmSZbAUCXpDZBQAKCRC2xBzjVmSZ
bFCzAQChR8S9IRD3usSn6rQRuRbQjkYaTv2/3dph/QgHHMf6GgEA6tehUw6h0lqC
/dQFMcOrlSX8RBjLEGBqPOZ8c7y9iw0=
=R0GW
-----END PGP SIGNATURE-----

--iows4bghsoat2xku--
