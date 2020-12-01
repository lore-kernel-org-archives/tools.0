Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web12.12739.1606840190233688748
 for <tools@linux.kernel.org>;
 Tue, 01 Dec 2020 08:29:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ribyj7oC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.160.173, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qt1-f173.google.com with SMTP id f15so1515209qto.13
        for <tools@linux.kernel.org>; Tue, 01 Dec 2020 08:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=MlSSY/13iTjXZC7S032wlYpLTTH10jrxLIxWQkOAUFs=;
        b=Ribyj7oC3Qe9fqbpKKMktUDRdk0azcwWQdYsi2m3988L6MG4nOYsm+lkwonjS0hVwK
         7SxlUTs6fu6mnOetx3NXIl8yqhCr7KiohDJ5HfVIg/iMiOchNCNZwbSNSm54z8w4DmpL
         AmjNa8Eq3/7KZfunJfmMmr+C+oNZz6PDbM8/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=MlSSY/13iTjXZC7S032wlYpLTTH10jrxLIxWQkOAUFs=;
        b=jTf1zDh8/rhICJGqFfU2AnOPbMqH1zKuGq2YvMXJc8QrIZKnH/OrkdXFjejzlXsyl4
         p/WRBzg/SR6h320lICEw4O2sVP+tcgFtzBUwtyRc3hd4S9FKFivV2Bz99/fmOaKbx3LM
         pjwg3da7PrE5Et36Kua/y6Z50rp1JmOZzT+cU/wPG4HqH7ka+OmcLko5h5eZNa9/3UEm
         lOZdRkEqu16gfNI7/keGJ2M3vzrVSMZDii2Av44t20jYnskGZEIC686CCSyMYjmwK/cc
         1SkUnnzZMIHX/8LIO8ULvK5bjUodNajvogiBFB6zIdmm8P5A14aGRGNR7yodyXAIhYEQ
         SllA==
X-Gm-Message-State: AOAM532T/A9cVcNJwNKfvMFAyFQUKyiEqjHWo/EriONmlqw0hfJ9uMJw
	K7Joxw0/zjMYCuUG9OlNhoHyAtmw8IQsreyL
X-Google-Smtp-Source: ABdhPJwGhfN82YbmjTBtPBGGb+jISwQgSkw9MdZ7LdCS4PbuN5mfn6w/1bNIWT3If2xHVOcqltshlw==
X-Received: by 2002:ac8:7a70:: with SMTP id w16mr3687165qtt.61.1606840188992;
        Tue, 01 Dec 2020 08:29:48 -0800 (PST)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id e4sm64068qtc.54.2020.12.01.08.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 08:29:48 -0800 (PST)
Date: Tue, 1 Dec 2020 11:29:46 -0500
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org, users@linux.kernel.org
Subject: [b4] version 0.5.4 released (hotfix)
Message-ID: <20201201162946.44atowzr44m2yhky@chatter.i7.local>
MIME-Version: 1.0
X-Groupsio-MsgNum: 286
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="j6e4sq4umdfq5hln"
Content-Disposition: inline

--j6e4sq4umdfq5hln
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi, all:

There was a nasty bug in 0.5.3 that caused "b4 ty" to wrongly match=20
every tracked series, so if you're using that functionality of b4 and=20
you're on version 0.5.3, you should upgrade to 0.5.4.

  pip install --upgrade --user b4

If you are on version 0.5.2, you should be unaffected.

Thanks to Mark Brown and Martin K. Petersen for the report.

-K

--j6e4sq4umdfq5hln
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQR2vl2yUnHhSB5njDW2xBzjVmSZbAUCX8ZvegAKCRC2xBzjVmSZ
bCErAQC/rup8xqHl/0TiQKIV4zN3/UQpJPml1IDj+VwES1oJIQEAsJ7vGwTFUTeD
PNLxi9kj6ietVPfTbqao58CvYP2lUAc=
=XLaw
-----END PGP SIGNATURE-----

--j6e4sq4umdfq5hln--
