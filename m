Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web10.65730.1595883136236223954
 for <tools@linux.kernel.org>;
 Mon, 27 Jul 2020 13:52:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bxOie5bR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.222.179, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qk1-f179.google.com with SMTP id e13so16649674qkg.5
        for <tools@linux.kernel.org>; Mon, 27 Jul 2020 13:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=7Il4dyESXsD3kqG9y3rah1DmbIJRQiVVqYWuvqvD/w8=;
        b=bxOie5bRoQNecSI431rpv8wN/06fDdyBg6F7QCFKR83G1q35HqI99kwMfF+MF0N3LY
         XMBvemr06sD5swxXpJcZAeFCuaPhWh+wc/2xKHquFuTPGncbyAJdp4PCdzofsljzQT/N
         SBxKNau/9EInIBGcKFRijete3G3jPFoYwQAJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=7Il4dyESXsD3kqG9y3rah1DmbIJRQiVVqYWuvqvD/w8=;
        b=hmoNum0gFWDO53aHy97kqe7dnJ0H7hQ8VFBD031QhQQhCtm/vtEKclAhij+ROuu3aR
         hiL7EP2qUMRA035O/OaHh4Un7hICv8r0tWFHnhoBM4cQIU2C8qR296J5/vQ/q4ZLjNQ/
         rg4MbJLXbCW4oQw0T74G20Pc6hUL1WFL/yIOvc7h2QX3Vrlj0/dhoz0YEc4E8LDWo8ev
         gJ7ybEJJZOBP1G6dmx9MBRZNxZg74AznkWNbO4RGG15ZhhLUIkXsmTxxU/L6Gf867T7G
         gwsJqiAyRKKTMSgTt67pWN6OVTm4yQLcNNnQlBdYzRPkkVtSvVDL/hme68QboEXSUyAi
         n96A==
X-Gm-Message-State: AOAM531unQlJeC4tJX8/fRzJW2zb7iXO+LkPgRv7gqHXpkT6kN5qYsKT
	Md1dUa6VjfIniOf7RG3dSos3RbIzHdBe0g==
X-Google-Smtp-Source: ABdhPJwiRQ+bC1kjzc2svVmbsEXSq/gd0tn3VXaxzDwapaTDzgc7sl94NdwpN3cShzrbOEqnQHJBxw==
X-Received: by 2002:a37:dcc3:: with SMTP id v186mr24041714qki.393.1595883134966;
        Mon, 27 Jul 2020 13:52:14 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([87.101.92.156])
        by smtp.gmail.com with ESMTPSA id k24sm16140893qtb.26.2020.07.27.13.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 13:52:13 -0700 (PDT)
Date: Mon, 27 Jul 2020 16:52:12 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org
Cc: users@linux.kernel.org
Subject: b4 v0.5.2 available
Message-ID: <20200727205212.fhybatrcz45lypsq@chatter.i7.local>
MIME-Version: 1.0
X-Groupsio-MsgNum: 192
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iw2m3nylkyb6wsnf"
Content-Disposition: inline

--iw2m3nylkyb6wsnf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi, all:

I am happy to announce b4 version 0.5.2, which is a bugfix and stability=20
improvement release. Everyone must upgrade (TM).

To upgrade using pip:

  pip install --upgrade --user b4

Or you can just run it from the stable-0.5.y checkout.


Shortlog for v0.5.2 is below:

Konstantin Ryabitsev (8):
      Up the version to 0.5.2-dev
      Fix regression with oddball charsets
      Fix crash with unbalanced [] in subject
      Fix crash when -c used with incomplete series
      Deal with [PATCHvX] subjects
      Fix attestation error messages
      Support mbox -m to be a maildir
      Prepare for 0.5.2 release

Kyle Meyer (2):
      Fix basement detection for empty commit message bodies
      Fix handling of single-paragraph commit message bodies

Tudor Ambarus (2):
      man: Drop the apostrophe from the linkmask configuration
      man: Update commit url mask to contain 12 chars of ID

Thanks to the following people for contributing to this release:

- Kyle Meyer
- Tudor Ambarus
- Mark Brown
- Christian Brauner

Best regards,
-K

--iw2m3nylkyb6wsnf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQR2vl2yUnHhSB5njDW2xBzjVmSZbAUCXx8+eQAKCRC2xBzjVmSZ
bAYDAQCsXGnEzNlFkeJfBX/pCCmAK7O3IW+Yyxxei3bS+RWApQD9EQOHC7tR0u03
U0t3yhVLwLjUGvzynlZxCoeIpB3B2wA=
=a7cZ
-----END PGP SIGNATURE-----

--iw2m3nylkyb6wsnf--
