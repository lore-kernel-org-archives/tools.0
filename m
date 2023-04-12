Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E265C3C02
	for <tools@linux.kernel.org>; Wed, 12 Apr 2023 19:03:04 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id f2so4053798pjs.3
        for <tools@linux.kernel.org>; Wed, 12 Apr 2023 12:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681326184; x=1683918184;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T9fuw8X588Nkqf/b/NQLW3/B0z6UC7+/LFZuhKnDQzc=;
        b=oHWYmkRa+rdQOgMSPj0PBEStJBgl2OKI+mxtyEWvtYi2ToYgehbpBEmHFxElH4OXNP
         gf9hdJ5Bq7iNHQsju/ouAZz3CaHqpw59BFduknjIb7RzCVVhiBGQqlj5iKdRDDklrhRb
         FhbqEqGx2dd3ih9opdjtsy+sF0soOW8RT25lEC9rpvI+dQLm8g+IKzxbjhSFOO3MfgJX
         HMsJXcENLyrF4WeQRufkzRqNg02FnhFTpFfx9HAKSe0g8QHc+jVOtZZkAgIESzGxID72
         +7LS5TRwRr3vMSg+nrH4U8F6uE71L5WPBxPwVdp6SdQ98ZxizIp8a8AhFsuo4SDHOlTv
         Me1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681326184; x=1683918184;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T9fuw8X588Nkqf/b/NQLW3/B0z6UC7+/LFZuhKnDQzc=;
        b=CWxEqR2iIlbQMFU396uD+4ZLvWBMOx+Hn2qHND/1PH9ctZhbfJDAt6K1nWJrh7JCKv
         3BEoum3ZFaU2qOudGaZY7viyHYgsPyIz2BoJPk0QB34fzCI/Q+7cSRTgIZtEpLWOa5SB
         7VjZKdPTnRVlhGJGdHDwKtScbPAeQkmCoP67Uic4CgDNnUvBObyPHaqmjPlDWb6cnUsh
         2Pz72GFsHn1D3xgP7zEY93xcmgcDz+4gfUYQlj+Mi0XCMZg15qhNZ4XIJ0LcUXYOE7Bk
         40VNpOtQyNycPwSbvlKeyF7ZvUp0bgJAoRB0C2LV8c6ENOGckwja/mtw5HX+IWLPTpiH
         LF0Q==
X-Gm-Message-State: AAQBX9dJjwzBxF5EvPBnbNQxJPGsvhGW+/wkAT2+ye3zCnO3YdPM4NAe
	IA3XhVLxmbzg8Fr+o1YaG/CWnJbV43ilXAD3XcIN1g==
X-Google-Smtp-Source: AKy350br8XyY4nRFHIjzNYFoKRh/HEjPASNdHcpX1uuIk+NcJJKdokq4tLGkzEddyPQFQFTUu4PrNxI9d2k2hTZyAYY=
X-Received: by 2002:a17:903:2607:b0:1a5:2abb:3be7 with SMTP id
 jd7-20020a170903260700b001a52abb3be7mr1353321plb.4.1681326184132; Wed, 12 Apr
 2023 12:03:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CAKwvOdn6_J+9BppRbXEtDc8CW-qqoat7VJ521oWnqXCXHb_d6A@mail.gmail.com>
In-Reply-To: <CAKwvOdn6_J+9BppRbXEtDc8CW-qqoat7VJ521oWnqXCXHb_d6A@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 12 Apr 2023 12:02:52 -0700
Message-ID: <CAKwvOdmqageZXw8cxETPaWyST-TfAp+bDa8vxfKEVksf35-qLA@mail.gmail.com>
Subject: Re: executable sendemail.smtpserver and b4 --reflect
To: icon@mricon.com
Cc: tools@linux.kernel.org, mjg59@srcf.ucam.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 12, 2023 at 12:00=E2=80=AFPM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Hi Konstantin,
> I was following along
> https://people.kernel.org/monsieuricon/introducing-b4-and-patch-attestati=
on
> eager to try using b4 to send a patch series.  When I got to
>
> $ b4 send --reflect
>
> it seems that my series was sent to the list, surprisingly!
> https://lore.kernel.org/llvm/20230412-no_stackp-v1-0-46a69b507a4b@google.=
com/

Ah, forgot to attach the log of what I ran and observed from the
command line, in case that helps:
https://paste.debian.net/1277133/

>
> Internally at my employer, I must use a command line utility to send
> email outside of the blessed GUI.  As such, my ~/.gitconfig looks
> like:
>
> ...
> [user]
>         name =3D Nick Desaulniers
>         email =3D ndesaulniers@google.com
> [sendemail]
>         from =3D Nick Desaulniers <ndesaulniers@google.com>
>         smtpserver =3D /usr/bin/sendgmr
> ...
>
> From a discussion with you and Matthew on IRC, it sounds like this
> company-internal sendgmr utility might not be respecting some header
> b4 adds to the eml file (envelope-from?)?
>
> I can file a bug internally, but I'm not well versed on how to clarify
> precisely what's going wrong.  Is there anything to be done in b4
> itself, or help me word such a report I can file internally?
>
> I also noticed that my name wasn't being sent on the From: field to
> LKML. I assume that's an orthogonal issue, but is there anything else
> I should be doing there?
> --
> Thanks,
> ~Nick Desaulniers



--=20
Thanks,
~Nick Desaulniers
