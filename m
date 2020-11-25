Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web09.3435.1606342526262808371
 for <tools@linux.kernel.org>;
 Wed, 25 Nov 2020 14:15:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bLGUF6JN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.222.173, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qk1-f173.google.com with SMTP id h20so6280700qkk.4
        for <tools@linux.kernel.org>; Wed, 25 Nov 2020 14:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=RKjvJHgw1zUhIickXTJtncW4mvbweSxk5yGqVhxvxPI=;
        b=bLGUF6JN+ZcKFSN3nE96Y8mgMMHUyk60KzOiaRQBjK4jPLZc595ZcIKcExx9nKipeo
         4Jp8T0Xsi40sLCxULgGH2CCJowhAJ5o7sy1kdVDsrF1trQJdnOjAdAvC94a4UeAO1+RR
         /SvmGplAkiKLh9rBTOGQJ50M49FikIPojETJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=RKjvJHgw1zUhIickXTJtncW4mvbweSxk5yGqVhxvxPI=;
        b=QHqXjhtlOxGIvaBdCVQv2jTGAShM07ZVDlA3sJS0KLPLWzspgcBhYAnET1+E5XxsYK
         zbOTyrqaMHllqJg+1gyzM+3Emn4+wbGof0UjXkbHz+uklcaddxjAigJ2x9D7u67+ryJs
         M+jzt3ezFz1OIGrwY4EkYJP+aR3dG2wjsCcaU76BTAIBqfSF/t3OX2Lnaax1ko2q0dk6
         94Tw2wV8UAqMt/6Ij9fxNGXM1f78JvlHsu9FZdNb2YhkATPnOnpYebBpP2yyCS0RJ6mB
         6JYKMV6MYqozTohzVbbmVgX6hBfApisHIXDlOWt1AuO6FIZYe/JUwDx851C+VZepD02b
         aPHQ==
X-Gm-Message-State: AOAM533r2BoR7nH3FPjJZJDbDadFP/lilWeYL4ZP6zNAN+l10V2ItJE6
	HtRIN2fW187Js64mLYuj7Ti/CSH9i+ymTEmW
X-Google-Smtp-Source: ABdhPJyv6h21aj2o/zXgdJu0e6XY/sKme/Dq9LCHB8MygNSM4rmr4xYv3x3MI0KeGSdBj95KWZi6dQ==
X-Received: by 2002:a37:4903:: with SMTP id w3mr270245qka.340.1606342525083;
        Wed, 25 Nov 2020 14:15:25 -0800 (PST)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id q32sm774022qtb.71.2020.11.25.14.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 14:15:24 -0800 (PST)
Date: Wed, 25 Nov 2020 17:15:22 -0500
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org, users@linux.kernel.org
Subject: [b4] version 0.5.3 is available
Message-ID: <20201125221522.jk4kdfyfur6zblvp@chatter.i7.local>
MIME-Version: 1.0
X-Groupsio-MsgNum: 275
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5w2ezuixvwt4f57w"
Content-Disposition: inline

--5w2ezuixvwt4f57w
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi, all:

I've released b4 version 0.5.3, which offers a handful of bugfixes and=20
small enhancements in the stable-0.5.y branch. This is expected to be=20
the last release in the 0.5.x series.

Notable changes:

- properly grab cover letters that don't have a diffstat
- require that trailers are at least 2 chars long
- improve "b4 ty" on cherry-picked series
- fix some crashers

If you installed using pip, you should be able to upgrade using the=20
following command:

  pip install --upgrade --user b4

Full shortlog is below.

Konstantin Ryabitsev (13):
      Cover letters may not have a diffstat
      Require that a trailer is at least 2 chars long
      Set charset in order to generate MIME headers
      Use bytes when dumping to stdout
      Don't crash when no valid patches are found
      Fix some cherry-picking corner cases
      Fix header encoding introduced by earlier fix
      Fix crasher when attempting a 3-way prep
      Unquote msgid if we're getting a full https URL
      Improve ty with cherrypicked subsets
      Fix crash on incomplete series thanks tracking
      Fix thanks-tracking of partial series
      Increment version to 0.5.3 in prep for release

Marc Zyngier (1):
      Fix handling of series with the [PATCHvX] defect

-K

--5w2ezuixvwt4f57w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQR2vl2yUnHhSB5njDW2xBzjVmSZbAUCX77XegAKCRC2xBzjVmSZ
bDf7AQCND88SJ/WM07rdpAdGE6b8qe9WcdvOX629VlRyEGhI1AD9HvPMzvhUz/aK
L1eUsrYpJRhVxtEZwmIE50hJHTiNswU=
=pXyi
-----END PGP SIGNATURE-----

--5w2ezuixvwt4f57w--
