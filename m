Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
 by mx.groups.io with SMTP id smtpd.web12.12781.1593570603109960054
 for <tools@linux.kernel.org>;
 Tue, 30 Jun 2020 19:30:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kCV7QtDu;
 spf=pass (domain: gmail.com, ip: 209.85.214.195, mailfrom: unixbhaskar@gmail.com)
Received: by mail-pl1-f195.google.com with SMTP id bj10so4061153plb.11
        for <tools@linux.kernel.org>; Tue, 30 Jun 2020 19:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=iIfgKUf6skENbZ9nNisjd23aZNZbw6bVtCOND5WxtSI=;
        b=kCV7QtDu+yrioXAq2/wzgbj31hHEP+wmsJp/+O3CuQgn+Px35u9d2KwXw8NFxix+3L
         VPTh0Tj2NXg85aB6O3b38muQf4KMZG84QovfKjv/2Zd01cJVZ4f7l2nFOZL2QSkrAF3b
         R8Z3YLvXvGLCl34LXrbyejeZmnUtv6LxQ6DDwW6Ta87FNw7DOssmvS0GFN4PuOLj8pOT
         4UwVSdyIoBE33OAiDDwpX2WnZYDjXcGi9TueZzjRbcCQNnnUkWlTNjA0K3AbH0vzdElE
         4bjM6NIC7iL+1w0Nmpx2xdXgiYq/Di9kv2tuCv7lgunujWVQMnsZjhomnD5nQVxoOksM
         YQ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=iIfgKUf6skENbZ9nNisjd23aZNZbw6bVtCOND5WxtSI=;
        b=QrwBJbgccUJR/x+2C+0MDglQ9wSD9HUM87mvuvu8k4V9ii0LcYBPtSb4Pod8odUU68
         vuTYw6RBkWknQcjxfplnkXIFRdg2ofauMdLXYb5DLcZ4jZip/XvQAGAtUfHYDGYIfZLL
         rCXPqEHTIF5psq/YTus/2c28OHWOkOPZ91HeGU3GWC+jkdoe889EruQ+vQUFekSM1TQJ
         H9NQQ26LSVPCN7rEHrYj9RVlW4zmAeUNu3oXE/l5Qm8uVRmLxknszc+NGax2wyrX9Ubl
         3hpTRqddIAJQw46AnzYycXV8SHLIjmLrtG7zgT66LDKL7GTSdo7rb7+YOIVfzgkED/JI
         KmPQ==
X-Gm-Message-State: AOAM531N4vDY/scZugLXW8TpLdNx4l0PHzWkr+HQTfo+FzWyb6OneCaa
	GqHH4LoxRC07+BOqNiizpZc=
X-Google-Smtp-Source: ABdhPJzVWqY4LuoXDz4LIGFcnyVlKgXuUKxMUtgdYa90+DmcygQJXH3mWMTp+mFwzHpKaJOXvu4jFA==
X-Received: by 2002:a17:902:b58f:: with SMTP id a15mr20730829pls.106.1593570602659;
        Tue, 30 Jun 2020 19:30:02 -0700 (PDT)
Return-Path: <unixbhaskar@gmail.com>
Received: from Gentoo ([185.156.175.88])
        by smtp.gmail.com with ESMTPSA id l134sm3832198pga.50.2020.06.30.19.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 19:30:01 -0700 (PDT)
Date: Wed, 1 Jul 2020 07:59:34 +0530
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: b4 trouble!
Message-ID: <20200701022934.GA11489@Gentoo>
MIME-Version: 1.0
X-Groupsio-MsgNum: 178
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fdj2RfSjLxBAspz7"
Content-Disposition: inline

--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Kai,

The story goes like this :

Once cloned the git repo and as suggested in README in the cloned repo
,I made an alias in .bashrc like this :

alias b4=3D"The path to the b4.sh"

source .bashrc=20


But...I got this ...I tried this from within the dir and outside of it..

=E2=9C=94 ~/git-linux/b4 [master|=E2=9C=94]
07:53 $ b4
Traceback (most recent call last):
   File "/home/bhaskar/git-linux/b4/b4/command.py", line 10, in <module>
     import b4
   File "/home/bhaskar/git-linux/b4/b4/__init__.py", line 15, in <module>
     import requests
ModuleNotFoundError: No module named 'requests'
=E2=9C=98-1 ~/git-linux/b4 [master|=E2=9C=94]
07:53 $ cd ~
bhaskar@Gentoo_07:53:29_Wed Jul 01:~> b4
Traceback (most recent call last):
   File "/home/bhaskar/git-linux/b4/b4/command.py", line 10, in <module>
     import b4
   File "/home/bhaskar/git-linux/b4/b4/__init__.py", line 15, in <module>
     import requests
ModuleNotFoundError: No module named 'requests'


Is this a expected behavior of it??? I know what it is missing, but the
point is ,why the end user have to take care of this??=20

OR, this is tool made for certain people and those people know what
exactly do with this kind of return???

I am lost ...and can we make some sanity check to before running . Will
that be costly enough or bring more maintenance headache. I am not sure,
because I lack knowledge ,probably.

Kindly , shed some light.

Thanks,
Bhaskar

--fdj2RfSjLxBAspz7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAl779QsACgkQsjqdtxFL
KRVU8Af+LmwX9EkEOMCY9vN55nU0Dgrzja11luTVNbAc1WvxNsbuc0xhOaC0rNdw
AKv2W0T99iupiE7J6HJqH6dRlDqvSBwcpgqjRn3+l1x8nV+gXZOpkX8D5BTKRF38
LVp8Vf+TPYGP/l5QzEajR205VQdoswFS42cT3UamPjm/Fg4a1iMdTm1OfP29PwQx
PSfFRzH6ZCeZsZl/Yz8EKHW4DzrZiELWchCwOluBrMLJUyNEN8hu3zNkWbMgm6aV
FQJ/OwrvlSIdQHgHri5KkvO3Bv+siY0FgKhsCmQIcxDONIL+MgHHc8w0vSBf4jzQ
69wyz/IjeJmz2Anm8sVCcyjUpY2r2g==
=fs7w
-----END PGP SIGNATURE-----

--fdj2RfSjLxBAspz7--
