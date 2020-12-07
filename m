Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web09.7.1607377335630474457
 for <tools@linux.kernel.org>;
 Mon, 07 Dec 2020 13:42:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=f31H5XiO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.222.182, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qk1-f182.google.com with SMTP id y18so14151560qki.11
        for <tools@linux.kernel.org>; Mon, 07 Dec 2020 13:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=0R6ddMGnOIU8+UlTgAro8sJpIrMxzjY7wR3n+vwBlAk=;
        b=f31H5XiO9gis/w9Oy//DZXJAn6RhQVLvqnxcwB3UIwAYJrvRL4Ic3bXNC/mT1co8mB
         M52/gX3kp2B7DQYF3RGgpQBejY3mYjFhVJ7/p/Z60LgrVW1y5iURmq856IlMexXzRdGZ
         5vy5ZZcOW4Zq7UcnpyRhVDhxoS+DjbKd9TQkM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=0R6ddMGnOIU8+UlTgAro8sJpIrMxzjY7wR3n+vwBlAk=;
        b=XeG1ziAxlUV9Lfe2ZRXo1eLSPZdS2fz2y/wllfIz0ZITEEM3pgp8fU0SGlSjZoXRvE
         38rNhiQtEQP45FsJ142jCQogNOoytYrtiAmJf8kZwVULINn11jSzct4/Gh3LnQDMZGCv
         Ik4NyIA+ZV3h7wfHnYwuco4jJyJq9TWumvfzIZyqxxZ1KJBr7V6DT+0pTAuNJdhIOlJr
         XR/yZnnibaxH3O51k0EiFI1j3rlUfo87usCRr8oh/kfcOuSStLtXdH/gXvc1KgTRMM4P
         QIZAD/HAvr1VqbsVwHSNWGQMVK/KKTKK9HUgAl3eG4HVNmEIvVOFyr9Ka1pRX/IEETjV
         9BcQ==
X-Gm-Message-State: AOAM533lfmsHoxvhgQ0b88b5mlc5TlxNawehjDwI/x8GwqTgvMRoTOhD
	kjGp+b64psYYQcb2rfxVpC+YmQ==
X-Google-Smtp-Source: ABdhPJw5xlO5mBvxzxFBMdIcbaIBuxFl2BpqSRSEGflN5ilbpjAnD9STVdOSbvdvc3lgla6r+dxwNA==
X-Received: by 2002:a05:620a:2104:: with SMTP id l4mr3718411qkl.35.1607377334575;
        Mon, 07 Dec 2020 13:42:14 -0800 (PST)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id f129sm12988927qkb.22.2020.12.07.13.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 13:42:13 -0800 (PST)
Date: Mon, 7 Dec 2020 16:42:12 -0500
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: users@linux.kernel.org, tools@linux.kernel.org
Subject: [b4] version 0.6.1 is available
Message-ID: <20201207214212.qyehpt6o6nxfuzz4@chatter.i7.local>
MIME-Version: 1.0
X-Groupsio-MsgNum: 289
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vw2l5fvrzx3pxxsj"
Content-Disposition: inline

--vw2l5fvrzx3pxxsj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi, all:

This is a new major release of b4. Version 0.6.0 contained a crasher for=20
when dkimpy was not installed and therefore we're going straight to=20
0.6.1.

The following highlights the most important changes as compared to=20
version 0.5:

- Extended trailer format recognition for follow-up trailers, e.g.:
  Reviewed-by: Dev Eloper <dev@eloper.com>
  [for some_foo_function in bar.c]

- Add support for local maildirs, allowing to grab threads straight from
  a local maildir or mailbox, e.g.:
  b4 am -m ~/Mail <some-msgid>
  (don't try this on huge mailboxes, though, as there is no support for
  intelligent header search -- b4 will iterate ALL messages looking for
  the thread you need).

- Preserve trailer order by default instead of sorting them. If you
  like your trailers sorted, define the order in the config file; see
  b4(5) for configuration file details.

- Perform DKIM verification on all patches and messages containing
  follow-up trailers. To turn off, set b4.attestation-check-dkim=3Dno in
  gitconfig. To work, DKIM attestation required dkimpy and dnspython
  libraries; if not found, DKIM checks will not be performed.

- Reimplement developer patch attestation using in-header hashes instead
  of detached certification documents. For more info on the proposal,
  see:
  https://git.kernel.org/pub/scm/linux/kernel/git/mricon/patch-attestation-=
poc.git/plain/README.rst
  To set up PGP attestation for your patches, see README.rst. It's free!

- A handful of fixes and improvements, many already backported to 0.5.y.

If you installed from pip, you can upgrade using:

  pip install --user --upgrade b4

This will pull in dkimpy and dnspython dependencies.

Special thanks to everyone who contributed to this version, not just=20
=66rom shortlog below, but also for bug reports and functionality=20
suggestions.

$ git shortlog -s v0.5.0..
    80  Konstantin Ryabitsev
     3  Kyle Meyer
     1  Marc Zyngier
     4  Philippe Blain
     2  Tudor Ambarus

Best regards,
-K

--vw2l5fvrzx3pxxsj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQR2vl2yUnHhSB5njDW2xBzjVmSZbAUCX86htAAKCRC2xBzjVmSZ
bCOuAP9wfppAPrB/9xume9OtrILe0e66C/Bf6TnQtFu6fMUPKQEA6HytkEK9v0qs
5haofwsovfrpZNAqKv+zUMY4DnYRuQg=
=rsE2
-----END PGP SIGNATURE-----

--vw2l5fvrzx3pxxsj--
