Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.424.1584554107027680900
 for <tools@linux.kernel.org>;
 Wed, 18 Mar 2020 10:55:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZxKOKsfV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id z13so4504911wml.0
        for <tools@linux.kernel.org>; Wed, 18 Mar 2020 10:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=d2KRV37Togh05O3mD6meFBkFtyTmW4us4rQFP9sQ2JM=;
        b=ZxKOKsfVkTgB2lKYAo+0LP/GZqtmpoApG+I7XiuMhcAoFivJwgbCPSr2Kyy9KDQkUJ
         ZiASI1vI5dQSOgJDsWBR+KEOr+CN3muo4IBCDl3dhLtg97wJa1vZ7Wiivi+qyZkzzCnP
         c/KHNMHB92lWJUHwqqxcEzrhi+BhIZULhad1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=d2KRV37Togh05O3mD6meFBkFtyTmW4us4rQFP9sQ2JM=;
        b=iZVazh4a/7CGo+TcdqvJw2WGtHP8qD3mLzCXBQHmOURtWqrehyQbdtyCWmRfAMU233
         ub38isCrRT/TgbvT6YnnOxeyN44eL+Or5W/QyNPGxVncqAozA11F35qVZ01wQIWFxXCZ
         hIacQs26UxL1UlMxOi/wdJay4xXzujimf0s6XsaZPwFxFZ8pqRtIIAcVkM2Mf4IZ+FtU
         U5kvgd1KGeX6sdEk9Ga6GwLK5V4CcBuLZkhM+FoQWI2C3QHg9Ni8BmyIRRhGY0xcCNAL
         bGnxzi1ukk2/grWwkjY8rWIrwa34cGx2eA6NRVYIojw3XzU6uRyJjSLji4GoVqwlV3B5
         2+nw==
X-Gm-Message-State: ANhLgQ0rd7X4sDatc6UF9jJF1/IKOr4MjnHA2FTC/V4G0CAZhLayUw41
	jxNF71X/6vQHVnaa4htr07e3ErarfxJCNA==
X-Google-Smtp-Source: ADFU+vvDeCd7rnSjtcUAXL/t19BYYc/r89WoJIhL3tRndzg/ModQRbEp3p9fWmYfOYrXuii+ZZBTow==
X-Received: by 2002:a1c:7214:: with SMTP id n20mr6209734wmc.24.1584554102720;
        Wed, 18 Mar 2020 10:55:02 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local (chomsky.torservers.net. [77.247.181.162])
        by smtp.gmail.com with ESMTPSA id v2sm10876497wrt.58.2020.03.18.10.55.00
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2020 10:55:01 -0700 (PDT)
Date: Wed, 18 Mar 2020 13:54:58 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org
Subject: b4 v0.3.3 available
Message-ID: <20200318175458.cknmmoy64u5jesi3@chatter.i7.local>
MIME-Version: 1.0
X-Groupsio-MsgNum: 2
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vbdzwtqnquu6klh4"
Content-Disposition: inline

--vbdzwtqnquu6klh4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello:

Version 0.3.3 adds a few minor features to patch attestation:

- if attestation is available but does not succeed, we try to indicate=20
  which part of the patch is failing (commit metadata, commit message,=20
  or patch content)
- we now reject attestations that were created 30 days or more before=20
  the date of the patch (configurable via 'attestation-staleness-days'=20
  parameter)
- when querying the signatures archive, use the URL that doesn't result=20
  in an unnecessary 301 redirect

You can upgrade using 'pip install --upgrade b4'.

Regards,
-K

--vbdzwtqnquu6klh4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQR2vl2yUnHhSB5njDW2xBzjVmSZbAUCXnJgcAAKCRC2xBzjVmSZ
bAUoAQDk3oRRic513J99UhtYRay1v9rpsYKwcfZKPz2+Mi1PFwEArSfEh+rEtDmV
o6wcb28YgBjllS9to34eSYKDAaLeiQI=
=AUQ6
-----END PGP SIGNATURE-----

--vbdzwtqnquu6klh4--
