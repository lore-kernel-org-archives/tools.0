Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web10.1353.1588182134592021555
 for <tools@linux.kernel.org>;
 Wed, 29 Apr 2020 10:42:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: jch2355@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id a8so2253993edv.2;
        Wed, 29 Apr 2020 10:42:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PDbgJkTvlNKPPgz+OMZwNLUBi36I/r9wgtPPGZ5q0mU=;
        b=Zh/vFrihzPUD1IP4/CPb7vOO3UaZyj5cdTqoN4yXxcWp1sIS88UmUkZDQH00wDyjfC
         xm6gSTI8Z4XZJnt18e0HqGpQiWy6daA3Sm4vwRL88nW7qzE2fzJ9heTkUw/t+3cu9RL6
         FnyMpvnGxmLI6Ljwm7hVvoqmqq88p3fu3Sp091Iue7a8NGF1TCEND4h7Gl/vCiTJgvdF
         BGmDycwdo2fWJ0uTGUQOKFTMN2HMVlh5r1fXv24rjGxTTuNZ5/pbHz685ZjY6lpkbPAi
         iza48/eMMYaxB0F3h7DdhUOFX/OgmMs3Y6QrG/XtYWn0gTcJIpjmutA3Jzdpz7HueTX7
         u+Lw==
X-Gm-Message-State: AGi0Pua2x+sWhyy5MMC1WN8euL42GT6dGFB+LTH3N46x37xEtnXMeCm1
	qoO7Qb5oIl1RqK7hwTSJ6j0AY1YACOn6Oua7dGw=
X-Google-Smtp-Source: APiQypKwvR9pBf44HqHrB+hUE5gU+F2b7cWfn7gMc1PjrysJYSmEy7S5sRBK/OaWbxFpS6cV7QMqAQp1lXJPjo1ZoO0=
X-Received: by 2002:a05:6402:48b:: with SMTP id k11mr3632243edv.47.1588182132981;
 Wed, 29 Apr 2020 10:42:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200428192938.aue3v6kxsm47day5@chatter.i7.local>
 <20200428193550.GX26002@ziepe.ca> <20200428194419.i2gamyjgbilp2x73@chatter.i7.local>
 <20200429101309.GE4201@sirena.org.uk>
In-Reply-To: <20200429101309.GE4201@sirena.org.uk>
From: Junio C Hamano <gitster@pobox.com>
Date: Wed, 29 Apr 2020 10:42:01 -0700
Message-ID: <CAPc5daUXCRv5CN9cVdGTgAWinTEFB0RnMF27MA5D4dOMiCCk1A@mail.gmail.com>
Subject: Re: [kernel.org users] What is a useful way to show changes between series?
To: Mark Brown <broonie@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Jason Gunthorpe <jgg@ziepe.ca>, users@linux.kernel.org, 
	tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Are we talking about format.useAutoBase or something more elaborate?

2020=E5=B9=B44=E6=9C=8829=E6=97=A5(=E6=B0=B4) 3:13 Mark Brown <broonie@ker=
nel.org>:
>
> On Tue, Apr 28, 2020 at 03:44:19PM -0400, Konstantin Ryabitsev wrote:
>
> > Right, but that only works from a tree, correct? Unfortunately, very f=
ew
> > people are providing base-commit information still, so I'm not sure ho=
w
>
> It would be helpful if git could be configured to do this by default
> in format-patch rather than requiring it to be done manually on the
> command line separately to specifying the set of patches to format.
>=20
