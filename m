Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web12.16491.1585327546306703913
 for <tools@linux.kernel.org>;
 Fri, 27 Mar 2020 09:45:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Y+fcPNns;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id a25so12248097wrd.0
        for <tools@linux.kernel.org>; Fri, 27 Mar 2020 09:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=DxhSBXDjoeDwg0yEIy/WezOVMR13s68wO9jmgQ5JaNM=;
        b=Y+fcPNnsQnkm/czGzA6E9p3iZsvfrs3ogpxPGZyIeULFITAxP6xNaY4/yYmSadMDXz
         ZEhMiA7Z/GG5YBmp6IzRtyOMFQ6ky6uS/YpjagDEHb2x3ulGxGhu04K7pRMCdNnRvToH
         HrGe+uzW/FntNUdyK7NYxN+o313W+6MpeR2ec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=DxhSBXDjoeDwg0yEIy/WezOVMR13s68wO9jmgQ5JaNM=;
        b=AGRNu/ZXHVOPAz4hjel4lArr5aOVTiSF4ZxtoMB3psNAl0Vjt8e7Y9zN2pyA1gBW4y
         Yy6GAoQrIU49Q6ihclpakOyACDgwS/rfczCC9iWBJIYZoNaV2TKlw/SLAfy+p4oOJs6c
         9zixT/2F8HX2kaPHPxS8JvVsl09q8o1yIPv6xsBb7M2c4crR85IpldJ2eGfixPJ1/UEK
         mVSK0lWMejLzsrCc/ZomrnLSnVk0T0KSsodGAW0R/8sDyqEZcv86LRFHEOfIdCLIki8W
         lzf67nSA83OfV5HjWADvZVIq3cMZksyhTzYm8+7A9K/bxrwb6SRN/wvuGOtxBWx2BDLl
         N7LQ==
X-Gm-Message-State: ANhLgQ3EgbY/zif7THlJOpi0dEOZPHorQK7O9UoVrEy8EGpK9PCMI/I4
	esaLrsoQhErrM4YpNCMx6jJIFZWrDlDSNg==
X-Google-Smtp-Source: ADFU+vu+F5DTd0glCt8oJqyIUh0t9MZGo1nXj+LjpX7gmoI2mWxJtvBPDcV5xy9t5aFNgq0KLbYx1Q==
X-Received: by 2002:adf:f6c8:: with SMTP id y8mr276295wrp.403.1585327543266;
        Fri, 27 Mar 2020 09:45:43 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([185.220.101.146])
        by smtp.gmail.com with ESMTPSA id r3sm9000467wrm.35.2020.03.27.09.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 09:45:42 -0700 (PDT)
Date: Fri, 27 Mar 2020 12:45:37 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org, users@linux.kernel.org
Subject: b4 version 0.3.5 released
Message-ID: <20200327164537.wxfcj5f7xtwp574o@chatter.i7.local>
MIME-Version: 1.0
X-Groupsio-MsgNum: 58
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3jbyuvwozxppd5sb"
Content-Disposition: inline

--3jbyuvwozxppd5sb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello:

Version 0.3.5 is a minor point release in the stable-0.3.y branch. =20
Notable changes compared to v0.3.4:

- Tweak b4.sh wrapper so it can also be symlinked
- Strip leading id: and rfc822msgid: bits from the message-id
- Warn when we are ignoring trailers due to From mismatch and allow to=20
  force their application using the -S,--sloppy-trailers flag
- Ignore messages without plaintext content instead of crashing
- Disambiguate cached messages when running with --useproject
- Minor bugfixes

Thanks to the following people for their help:
- Greg Kroah-Hartman
- Jason Donenfeld
- Rob Herring
- Geert Uytterhoeven

To upgrade with pip:

pip install --user --upgrade b4

You can also run from the stable-0.3.y branch directly from checkout if=20
you use the b4.sh wrapper.

Best regards,
Konstantin

--3jbyuvwozxppd5sb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQR2vl2yUnHhSB5njDW2xBzjVmSZbAUCXn4trwAKCRC2xBzjVmSZ
bGQ6AQDWhrU/e35ysX6zU1Q6Y/xbvf2J//8MF8HpwlKh76HqfgD+NmjVWL7VWmxP
wvj9Qwh1jG0luVEa/k7yaTCyVSfe+wE=
=Aj0U
-----END PGP SIGNATURE-----

--3jbyuvwozxppd5sb--
