Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web11.38917.1590438825595201019
 for <tools@linux.kernel.org>;
 Mon, 25 May 2020 13:33:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DHXKHl+A;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.222.196, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qk1-f196.google.com with SMTP id b6so18474090qkh.11
        for <tools@linux.kernel.org>; Mon, 25 May 2020 13:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=hd5l9tmE6sZVVbGW6+TPHUAjf8m6l3UIcXEsGqc+T2s=;
        b=DHXKHl+AIhtAKWtIWDAcuBd9YI1dTyLMHo81ORQ7R33qnRYso6W7zwg07asix3Dlkh
         CltixsaBetmt17OuUGwGhRxetxfwtilimSs1erwUxfRKSz5iTKvULjuWVdsaRm3JecC3
         GNwMqHtmoAqSqaL9AtE1eaIPHcHLFNux2Andc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=hd5l9tmE6sZVVbGW6+TPHUAjf8m6l3UIcXEsGqc+T2s=;
        b=n/n7IWWWz7oHoKkNt6SBrAszy2iL8oeifqY6FG9+Bw6cQDmg1LJ3vV4inNG82Uvgcl
         xvUbX2xe3rpTGx4yQVTKkAwhNK3ZUK796+u/bj5ZykiEtrbFv31D3WtD3Isnlzzq9lMo
         Ed4baoRI31LbcmuqGFgge/4mR6kg53u4MnDE9nbKApGHptVBCbj7pFOp9yeiBk3dZA4v
         ESJrvPkx3hg7Tk2QJxj2rXKKGoiSh0s2CrmEEr3AE9CHPHyjFjSgnUVZ3sgMWT6MMfqe
         qQsFko0EdVreZx7IloNqeVHhssT/Jqehq5qcjZx5rJvmQZq/RuR8EABUu3ldiCQ+aO0K
         Er7g==
X-Gm-Message-State: AOAM533+Na75DfOX0+GADb3/iVlzNxsBc2PxFqEuUz2dgzK0ryELnrLP
	e7VpNxBrXJE9RRXL4sRm7MrQkzEt7JQ=
X-Google-Smtp-Source: ABdhPJywrZ15KJYdCZXjMfKYFrV0vkunt8yo8voeEekdzYqvmljBLavNA0ftVlD1fx0fqA15P/+LEQ==
X-Received: by 2002:a37:cca:: with SMTP id 193mr21815022qkm.208.1590438824583;
        Mon, 25 May 2020 13:33:44 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from i7.mricon.com (107-179-243-71.cpe.teksavvy.com. [107.179.243.71])
        by smtp.gmail.com with ESMTPSA id h3sm14286835qkl.28.2020.05.25.13.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2020 13:33:43 -0700 (PDT)
Received: by i7.mricon.com (sSMTP sendmail emulation); Mon, 25 May 2020 16:33:41 -0400
Date: Mon, 25 May 2020 16:33:41 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: users@linux.kernel.org, tools@linux.kernel.org
Subject: b4 version 0.5.0 is available
Message-ID: <20200525203341.z4dollmzbo7exnhc@chatter.i7.local>
MIME-Version: 1.0
X-Groupsio-MsgNum: 166
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lmnw23fyyl2ic5p2"
Content-Disposition: inline

--lmnw23fyyl2ic5p2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello:

I am pleased to release b4 v0.5.0 with the following new features:

b4 diff:

  allows to display range-diffs between patch/series revisions.  It=20
  accomplishes this by creating two "fake" detached ranges consisting=20
  solely of the files in the patches and then running a "git range-diff"=20
  between those ranges. In order to work, the following conditions must=20
  all be met:

  1. patches must contain "index" blob information
  2. we must be able to find all of those blobs in the repo

  Behind the scenes, b4 will create a temporary worktree containing just=20
  the files mentioned in the patch and run "git am" to create the commit=20
  range. After deleting the worktree, this range will continue to exist=20
  in the repo as loose objects (until gc cleans them up), allowing to=20
  run git range-diff across both patch series.

  In my experience, this works about 60% of the time, but I expect this=20
  percentage will be higher for you, since you are more likely to have=20
  the needed blobs in your repo due to using the same tree as the=20
  submitter.

  Here's a small demo: https://asciinema.org/a/333888

b4 am enhancements:

When we find blob information in the series, we will check if they match=20
the current tree. If they do, we will display an "applies clean to=20
current tree" message. You can additionally try the following flags:

  -g,--guess-base: will look at the last few tags to check if the=20
  patch/series applies cleanly to any of them. I'm not sure how useful=20
  this feature is, but it was an easy thing to implement.
  -3,--prep-3way: if you know you have to do a 3-way merge, this will=20
  prepare the tree for you by making sure all files exist at indexes=20
  specified in the patches. Same caveats apply as for "b4 diff".

The "b4 diff" and "b4 am -3" functionality borrows heavily from Jason=20
Gunthorpe's gj_tools [1], for which I am very thankful.

You can upgrade to the latest version by running:

pip install --user --upgrade b4

Please send any inevitable bug reports and feature change suggestions to=20
tools@linux.kernel.org.

Best regards,
-K

=2E. [1]: https://github.com/jgunthorpe/Kernel-Maintainer-Tools

--lmnw23fyyl2ic5p2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQR2vl2yUnHhSB5njDW2xBzjVmSZbAUCXswrowAKCRC2xBzjVmSZ
bOc0AQDK98KlPInqm50TZwZ73KmsP4Mkg51mTNAG475i5oqKxwEAwcoN/6kdc4QK
8zgNBUEIdybQ0w2sfaUmQvYxdZztZAs=
=CpPr
-----END PGP SIGNATURE-----

--lmnw23fyyl2ic5p2--
