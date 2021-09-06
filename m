Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629293FC1
	for <tools@linux.kernel.org>; Mon,  6 Sep 2021 09:59:49 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id n4so3619538plh.9
        for <tools@linux.kernel.org>; Mon, 06 Sep 2021 02:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Q3Ym91I2g/S7E51JNsIpCq02MVG6gpJx46LGoYu6SCo=;
        b=EszsLLNxYGNDhONmqNBEz8Nsyn2pN1RR+CW14bR3pF1FYBEewFUCZ2yaAsTsb6IjEB
         J9GzA0xyR7Xqjc9/2wt/alJvTT9tMh2UmTL8l0jKnlwJ2Sg+lZ0i8QfHhsWBNCJIAfgh
         ponwRoYY7a/sPhmNadflecP30l4MTAes+3Qo7icVfzDV+fjcWsRU6ldvKRZOMVSwSoWX
         iispOTLaeLsKglPp6NyU3p1KePAuA86DOAWhW0K4/uCtWmWihBn3BHVvmmX+gBYNgPEh
         6alvOMLl1T6/5KLeVp51367mgGTVLIz2EXGQYA62fAC+RwpYq/WbjQ1LaJQEqGYgRSrn
         ToCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Q3Ym91I2g/S7E51JNsIpCq02MVG6gpJx46LGoYu6SCo=;
        b=N88AFc+FAKsROqsCzQd1suc+niduNYw5HQQDctPFVgQ0KU4V4HnrhU39ONslLIygmO
         46YHR3d88gwL9ZOLo+le0aEpi/xGvU/Z2tUDoYU5etVxmyz6m6zQHFnb1v2PJ4mBXVsL
         r2eM0R9X2UNb3qUSxphEfqnVzlEwYHHL8KolqTZmZ9aywwyqQ/mmAe6FOSgMbwoU28LK
         N53FJzogq0lz9/1TeeHkgg7TZ2C8Cmac4IxfRbpa04zJ3FK03gWXkm+In1kxUwrRio5m
         TB9a9B0HImUwKA34xWW0SHyLY3jP4uyJ3Twc2p33WiwnI+Ls7u+oqJSBf0HPoXPCo12M
         DMYQ==
X-Gm-Message-State: AOAM533G3mVoU4qPrnQ3PK4OpAJuxkSHQ7jSw3IiPMvhXJULYLDOxBf4
	3pkh7cFwX1o/VTmS5bGxKXc/GaSVLSZ3O8EQtkmbtw==
X-Google-Smtp-Source: ABdhPJwPo/0B+LodoyMI+rmDbOfwglWw+TxDjgHSY652iwoYpBjog6tsmrdsU6Rt8iaJUPTL6N1XxjHsTf9+y37jsV8=
X-Received: by 2002:a17:90a:1282:: with SMTP id g2mr13127745pja.230.1630922388858;
 Mon, 06 Sep 2021 02:59:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20210818190750.g3xedu7j24sqndo2@nitro.local> <20210902195332.GA2493828@nvidia.com>
 <20210902201402.bbdttirbb5ckrtiz@meerkat.local> <CAK7LNAQogtzDbAFDtRt7UvDkH6K4tkQgwfmu-2_0rGgo_Uj_iw@mail.gmail.com>
 <20210903152143.nt5mzgwprltl36pa@meerkat.local>
In-Reply-To: <20210903152143.nt5mzgwprltl36pa@meerkat.local>
From: Lee Jones <lee.jones@linaro.org>
Date: Mon, 6 Sep 2021 10:59:38 +0100
Message-ID: <CAF2Aj3jbU_vnKvYB2EJXuKdTCeJx3dgZY2h7sriJX4fP6Fsteg@mail.gmail.com>
Subject: Re: New version of lore available for preview
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, users@linux.kernel.org, 
	tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 3 Sept 2021 at 16:21, Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Fri, Sep 03, 2021 at 07:44:35AM +0900, Masahiro Yamada wrote:
> > I used to use
> >   https://lore.kernel.org/patchwork/project/lkml/list/
> > to pick up patches sent to LKML, but it is gone now.
>
> As Mark has suggested, just use b4 to do the same. Running a patchwork
> instance just for the purpose of retrieving a few patches was extremely
> cost-inefficient, especially alongside the same functionality being offer=
ed by
> public-inbox and b4.
>
> You can install b4 from pypi (pip install b4), or you can clone the git
> repository and use it straight from there:
>
> https://git.kernel.org/pub/scm/utils/b4/b4.git
>
> To retrieve a mbox file ready to be applied to a tree, you just need to k=
now
> the message-ID of the message (any message in the tread will do), and the=
n
> just run:
>
> b4 am [that-message-id]

[trying again with HTML disabled]

I'm happy with my current Patchwork based solution and would like to
remain pro-choice.

Is there another solution besides being forced to use b4?

Can we represent LKML on Patchwork as a reasonable alternative?

--=20
Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
Linaro Services Senior Technical Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
