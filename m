Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web12.628.1608330704402025158
 for <tools@linux.kernel.org>;
 Fri, 18 Dec 2020 14:31:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eZ9R6w2P;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.222.169, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qk1-f169.google.com with SMTP id z11so3633812qkj.7
        for <tools@linux.kernel.org>; Fri, 18 Dec 2020 14:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=VESVamw+p2hoXlfzinH50OLGzvuOF4H4VzvsleFJy2A=;
        b=eZ9R6w2PmXxIvvesokif4TeO2YTrCVDKEErtBYfZz8E/muaNkb+L58AnLvdiWApN3i
         B5DUlo87EVwedk6Y5uV2VV7wdwy4K6KAqkdN12tbFNyAabiN0Ulc7iaD9z7QQWhcysVt
         X905nJwX72q6VuWykHWVMg6irEpoCwWwmeGVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=VESVamw+p2hoXlfzinH50OLGzvuOF4H4VzvsleFJy2A=;
        b=j8ZyDmKelE3PKzmIB66NZ3853+0VpKp6j7wacVDDdzEdsWlybuKsD+x0z86yVaHlcY
         8l4TfEinNgXZQqQ/S4YOku3cjHj06m+pBeXntI+mKeS5HHWcxeE14y9RBxr3Umj+qZXB
         qDYd85PS1OZXuDGWwirWEPEFaMExBbY30f+2yu/xv4wXnzWFmnri89s7wI+FNtkVLGZ/
         Nesy7nWidoZZDCuAwDEpupmxWEQX5psyA0BoqJ03tgcHC8hMNIm41RJzkjDDCOVm7mN4
         T9UvZ1n5KOoRtV8fhGrEGlxqElZXVrPow+BNuseFHWSas1Xz1352GCKpBKhdkJduRYLx
         P2IA==
X-Gm-Message-State: AOAM533crxpHGztG02/W+ZaYV1s4DMBL5xAr7xia3S3IL+5HhnnxaCEM
	RSpcMv2ne9yEOt4XAqqrswOFCvM9RafY7smH
X-Google-Smtp-Source: ABdhPJyxM8fmQ3sB1vENYztjt57oalq4xUieZsPQ1blSU8LVOfYNAYNGa0UtnCf5PCQKJPbvNQ0BCA==
X-Received: by 2002:a05:620a:1101:: with SMTP id o1mr7207299qkk.489.1608330703480;
        Fri, 18 Dec 2020 14:31:43 -0800 (PST)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id b14sm5866361qtx.36.2020.12.18.14.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Dec 2020 14:31:42 -0800 (PST)
Date: Fri, 18 Dec 2020 17:31:41 -0500
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: users@linux.kernel.org, tools@linux.kernel.org
Subject: [b4] b4-0.6.2 is available
Message-ID: <20201218223141.6g6rlqno4oekkegs@chatter.i7.local>
MIME-Version: 1.0
X-Groupsio-MsgNum: 303
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wz6vgybtl2uumw3k"
Content-Disposition: inline

--wz6vgybtl2uumw3k
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello:

B4 version 0.6.2 is available, which contains minor bugfixes.
Everyone must upgrade. ;)

If you installed using pip:
	pip install --user --upgrade b4

If you're running from git checkout, you may want to switch to the
stable-0.6.y branch, as there are some potential breakage incoming into
master.

Shortlog below:

Konstantin Ryabitsev (6):
      Create stable-0.6.y and increment version
      Add BugLink to non-person trailers
      Only check allow-list of trailers in follow-ups
      DKIM: remove extra public-inbox headers
      Convert mboxrd to mboxo
      Prepare 0.6.2 release

Special thanks for bug reports from the following people (who both happen to
be named Linus):

- Linus Walleij <linus.walleij@linaro.org>
- Linus Torvalds <torvalds@linux-foundation.org>

-K

--wz6vgybtl2uumw3k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQR2vl2yUnHhSB5njDW2xBzjVmSZbAUCX90tzQAKCRC2xBzjVmSZ
bFFHAP0U3vbRjSfEwyWP2yo/yID1ferelW2+eq21lgdOU9rjEQD+OnN+RYOWVOmS
/M2OK+V4pZpSSOd32Cf/6ZgvbNahYQU=
=MOKB
-----END PGP SIGNATURE-----

--wz6vgybtl2uumw3k--
