Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web12.1249.1605910655052632969
 for <tools@linux.kernel.org>;
 Fri, 20 Nov 2020 14:17:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hlUIEaDG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.160.179, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qt1-f179.google.com with SMTP id t5so8347522qtp.2
        for <tools@linux.kernel.org>; Fri, 20 Nov 2020 14:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=To5WyKPTtTM4H0bQhoOHF3k2+ojsf1NSkcSHJV9B51Q=;
        b=hlUIEaDGpfmMGzb29V3vuwirJi07DRDvmvuCXIgPlxb/rvEDJlm319STqnZQuKcrSp
         NJEFjOg8Emyz57N1T4XD2lfnCgqZUWY0FELLHaXUhR213OCE78mGUeJKzn7M15oh2vXE
         qSoQPHAgjKqwVu0LpByPTil2jNSfvD2XbZEh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=To5WyKPTtTM4H0bQhoOHF3k2+ojsf1NSkcSHJV9B51Q=;
        b=cgRkvUpP9Egy6dELoZHzfhamza6+F53Tm9e216LfGRf7t6Eejox2fZNkhMlj8kiOMV
         OhXV31GevlX/tlrdd8g12PRkD1jPSqEzf5BmLdxfI06pHv5q8XvZn6EqvVWAeuA+9rFT
         xE11HnJzfnccf7WdYPYz03iJ1ftVGCIFjXAvLsuQJtqWMIXncTs0P/jXZbtkWSTAJwrI
         itQsfa+kDyWmA5WIKZ0qhGj9bLVzT2MUSMAWGU3ZjFhWc4VYBENxbQrHtOdGPVL5lDeU
         f+B3CKWXIuwrIFWeC0Ib0GOgZE+c7nkkxh7Jv8entkYUorIwiumaAX/a6qIIM3v7HBgI
         D2qg==
X-Gm-Message-State: AOAM5326ZVeaZT+Ek7XQwDyq0f+X9+eW6pb3OtJwyB9DFXz0e0qwtY6+
	D4DGxqolTItOFp5tp0Ve3lPNmtDsnanp+mN8
X-Google-Smtp-Source: ABdhPJx8tY0+rOm04eUeXJRTgwnkE1SIKoqN9226zpWH46JMWoUOcw4qZrLglAc5g8MxJaW2noQpJA==
X-Received: by 2002:aed:20e5:: with SMTP id 92mr155260qtb.38.1605910653885;
        Fri, 20 Nov 2020 14:17:33 -0800 (PST)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id w45sm3122494qtw.96.2020.11.20.14.17.33
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 14:17:33 -0800 (PST)
Date: Fri, 20 Nov 2020 17:17:31 -0500
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org
Subject: b4: DKIM verification available
Message-ID: <20201120221731.ktof3h4yejunkc4a@chatter.i7.local>
MIME-Version: 1.0
X-Groupsio-MsgNum: 256
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6jlhst6w3itmdxvs"
Content-Disposition: inline

--6jlhst6w3itmdxvs
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi, all:

I'm gearing up for b4 0.6.0, which adds a handful of new features around
attestation. Specifically, it enables DKIM verification if the required
library is available. It used to be a futile exercise due to almost
every mailing list breaking it in terrible ways, but vger now properly
preserves headers so that DKIM signatures verify nearly all the time.=20

Older mailman still not so much, though.

Here's an example:

-----

b4 am -o/tmp -t 20201120131708.3237864-1-kpsingh@chromium.org
Looking up https://lore.kernel.org/r/20201120131708.3237864-1-kpsingh%40chr=
omium.org
Grabbing thread from lore.kernel.org/bpf
Analyzing 6 messages in the thread
---
Writing /tmp/20201120_kpsingh_ima_implement_ima_inode_hash.mbx
  =E2=9C=93 [PATCH bpf-next 1/3] ima: Implement ima_inode_hash
  =E2=9C=93 [PATCH bpf-next 2/3] bpf: Add a BPF helper for getting the IMA =
hash of an inode
  =E2=9C=93 [PATCH bpf-next 3/3] bpf: Update LSM selftests for bpf_ima_inod=
e_hash
    + Acked-by: Yonghong Song <yhs@fb.com>
  ---
  =E2=9C=93 Attestation-by: DKIM/chromium.org (From: kpsingh@chromium.org)
---
Total patches: 3
---
 Link: https://lore.kernel.org/r/20201120131708.3237864-1-kpsingh@chromium.=
org
 Base: not found
       git am /tmp/20201120_kpsingh_ima_implement_ima_inode_hash.mbx

-----

If you want to try it out, just grab the latest master. You will need to
install dkimpy and dnspython either from your distro (I found the
necessary versions in debian-unstable as python3-dkim and
python3-dnspython), or from pypi:

  pip install --user dkimpy dnspython

If you find this feature annoying or if it's making things unstable, you
can turn it off by setting the following in your ~/.gitconfig:

[b4]
  attestation-check-dkim =3D no

If b4 doesn't find dkimpy or dnspython, it won't run the checks anyway.

Best regards,
-K

--6jlhst6w3itmdxvs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQR2vl2yUnHhSB5njDW2xBzjVmSZbAUCX7hAewAKCRC2xBzjVmSZ
bAM3AP9IOwH+Kx7Hq/ZxUNgIFQEaP8xiHIfosNRQysonPdL9EgD+MAD58KmW3XDV
3HR/p/Xd0JdxNCpkOClcIHuFCW9d/Ag=
=JjUa
-----END PGP SIGNATURE-----

--6jlhst6w3itmdxvs--
