Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.244.1585002049468460791
 for <tools@linux.kernel.org>;
 Mon, 23 Mar 2020 15:20:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=APxNvmso;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id z18so1214907wmk.2
        for <tools@linux.kernel.org>; Mon, 23 Mar 2020 15:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=o3PJt+c/4YlUjDwV02HY7EViWR03JqI06Aj6dNLEf1s=;
        b=APxNvmso4cQc43De6c7SyLy6xXt2R6Dfg2A63kz1KMpvNM0ydUBNsYq5MSpDLbmq88
         o9Fwbyl8xSQdlWZNHONhm1MtFCk66dk132PLLW72ahryK8ypZlhU2L/YhjGL1to52G8b
         XReh60guIIUNKRVjUeoG4OFXRwfuEFhCXBv/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=o3PJt+c/4YlUjDwV02HY7EViWR03JqI06Aj6dNLEf1s=;
        b=ENDWfpSnSL3heGLTX85g7xCzBvf744PnbsO0kOXzJMXwomZ7Kyihrz2lughE0fOQIY
         g4d4bYInEH6xpkUq0zgZ+9mxooMimQqMxq/1Wm3OIc6VwzzbPot/w+zyrVu9Zkq8zyV7
         B7s4O0xr3qCBrWcLXOr9RqurrlvAzX+bxYtFBIvLY4JJl03NeiK5UZpFXS1BOH1kx/u0
         FsjrXjbkmfdKhaKWioD38DmaOKjaKzSmNRuNDBwS0AIe197ONyB97hySmLFS4UMT86eG
         jmHZt37/pRsTH6ZmF9zMCOuQhKOnEevdJy9hHHGS3jhWP0DbsS8dYM+1aVYxrCVXUmc9
         XmKw==
X-Gm-Message-State: ANhLgQ0iQIgO3pb/SuSorDJuBmggECmaUO5JTEJVZtZ4RZmo4iNS5/W3
	p0xkKyFQjrmzyRFlWVEL1vecR3maG/DVBQ==
X-Google-Smtp-Source: ADFU+vuYMowx6QHE2NOEJRKyst9ziEsCzNUSurT8NROuaNwQdVABHF0z6wvnecjnmjb2bvrKzbNczQ==
X-Received: by 2002:a05:600c:10ce:: with SMTP id l14mr1700582wmd.161.1585002047047;
        Mon, 23 Mar 2020 15:20:47 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([185.220.101.18])
        by smtp.gmail.com with ESMTPSA id t12sm9318436wrm.0.2020.03.23.15.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2020 15:20:46 -0700 (PDT)
Date: Mon, 23 Mar 2020 18:20:41 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org
Cc: users@linux.kernel.org
Subject: b4 v0.3.4 released
Message-ID: <20200323222041.uzfcexg2wy74jqdd@chatter.i7.local>
MIME-Version: 1.0
X-Groupsio-MsgNum: 35
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wrsuxxzrlac4zsa7"
Content-Disposition: inline

--wrsuxxzrlac4zsa7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello:

I pushed v0.3.4 to pypi, so if you're using it from there, you can run=20
"pip install --user --upgrade b4" to grab the latest version.

Notable changes compared to 0.3.3:

- deals properly with series versions that are only mentioned in the=20
  cover letter
- adds a b4.sh wrapper that lets you run b4 without needing to install=20
  with pip
- fixes a couple of backtraces due to bugs with patch attestation
- adds a caching layer to avoid hitting lore.kernel.org on repeating=20
  runs (e.g. when rerunning with -t, -s, -l, and similar)
- properly refuses to install on python version < 3.5
- uses more descriptive filenames for "b4 am" mboxes

Thanks to the following people for their feedback:

- Geoff Levand
- Mark Brown
- Kees Cook
- Geert Uytterhoeven
- James Bottomley

-K

--wrsuxxzrlac4zsa7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQR2vl2yUnHhSB5njDW2xBzjVmSZbAUCXnk2NwAKCRC2xBzjVmSZ
bGn4AQDWgYnfcStEvm6SmBlOX/OCeih9ay3YHUlQGz3pbwCHaQEA/3Jh5UK3j2DM
xOo2i9w+d5XbxOR5EsWz/BOYS5Tj9AM=
=TcWm
-----END PGP SIGNATURE-----

--wrsuxxzrlac4zsa7--
