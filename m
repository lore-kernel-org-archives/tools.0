Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABA8EA3
	for <tools@linux.kernel.org>; Tue,  1 Aug 2023 22:34:33 +0000 (UTC)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-79a0c5a5d02so1854847241.1
        for <tools@linux.kernel.org>; Tue, 01 Aug 2023 15:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690929272; x=1691534072;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eB5Xp3rel2CLl/Z3fnMM/Dg0IQCXwoEuVsqSz83yX6I=;
        b=pNhWNvOVjy9zGRqIrofvl6GRdIUzga9IoowjX5dc5S9OtG5RuwH093kIGpCQ3FzLjb
         WbPeA6dCfJPNNPZYai7iRCeuAQisjAANmEbEDv1ZcwlwSgS3cS/gP9ia9C8fzmTGmmVM
         ZU5+IHcfo6OltGEHY+RS4XdCTl4iNXRTsSppdUR9ywUTzd5+TLwWrw2wdUT7SW+T2/oc
         rMzi9f7QrgpRTZVoxIZ2PVmi03/EscmdoMCzXZP+JK5cMZqTwDLUutDkHOfJ9gDyHAhT
         DUvD4kdxoQCUVSvJn8B9KgRGMdI4/ZRw0E7aUJB4h7VQjtbintLRXs0T1yCKbvrCNfTr
         RDjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690929272; x=1691534072;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eB5Xp3rel2CLl/Z3fnMM/Dg0IQCXwoEuVsqSz83yX6I=;
        b=D6P+HTrkUdrBmV+DObx57Y6tEZLEHe60lnUOiweRrB65CM6c+HHDK6C5CrGZzUqVCE
         x/OxGgvhVpBvgCI3mwvkcHxwioadkjb/Ec9XHjseZQRx+Gb5RmGG6bnaPZm35g2FC8QH
         gnN+FVl00ffgXtq+9CUzd2x5v7T5BcJQuUeUFTYtZqT/oqrg/t6ZMni4Y8ERg7TEC/Cd
         M2dFmcl18XKAyoN+YQDDdWtvsAiucSQnoDtGpj//jkmpaZteYIbd+zxp51DztQcXvkKG
         2YlxDprZh1CurDuBQavL5BVD/VgyvWzRv53Q5Ap48Y0NTb9QeV5BSddp1hxDst4BsBTh
         iePg==
X-Gm-Message-State: ABy/qLbUtGELwfqdD8V8F2Uj9YenqL0LyVZwYKDVGBtE3y9wM63h7Rsl
	kLDtBJHYSjntIfD5xugGx3qXoc3kYfFZGOE2O6iyYA==
X-Google-Smtp-Source: APBJJlEzQaLsyMM0kAqyu24Fjj+Ue3DHYHqIR4p2HvrsFm01w0u9/TS8ImHduZ3mFUb4iE9wbsij59SKGRKI6vZlIvg=
X-Received: by 2002:a67:fa51:0:b0:443:7ab8:b5d7 with SMTP id
 j17-20020a67fa51000000b004437ab8b5d7mr2479202vsq.14.1690929271904; Tue, 01
 Aug 2023 15:34:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20230727-fix-from-header-v1-1-2fb23c0a5da9@google.com>
 <A250134A-7A60-47EB-8849-DB39D08B223B@kernel.org> <CAKwvOdn0ePdAfQBby9zaXi7CA64Foc2NRJfzYyQHaOhz2C9+VA@mail.gmail.com>
 <202308010939.9EC4C98@keescook> <20230801-exhaust-movie-971927@meerkat>
 <CAKwvOdnMf227kX1F_rC+mDdf122ah9o7XcEi2tUHKehaWuo0rA@mail.gmail.com> <CAFhGd8pDdJHf8YOb8XztzkPc51KF1F5o30Frx3S4c0OTFNe5Jg@mail.gmail.com>
In-Reply-To: <CAFhGd8pDdJHf8YOb8XztzkPc51KF1F5o30Frx3S4c0OTFNe5Jg@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 1 Aug 2023 15:34:20 -0700
Message-ID: <CAKwvOdnB4wzzFPK-cZ4+Qciyxy1e=bKwwbc44-kT9u1Gz-5WMw@mail.gmail.com>
Subject: Re: [PATCH b4] b4: fix from header not using real name
To: Justin Stitt <justinstitt@google.com>, Sterling Stein <scubed@google.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Kees Cook <keescook@chromium.org>, 
	Kees Cook <kees@kernel.org>, "Kernel.org Tools" <tools@linux.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+Sterling (maintainer of sendgmr)

On Tue, Aug 1, 2023 at 3:27=E2=80=AFPM Justin Stitt <justinstitt@google.com=
> wrote:
>
> On Tue, Aug 1, 2023 at 3:25=E2=80=AFPM Nick Desaulniers <ndesaulniers@goo=
gle.com> wrote:
> >
> > On Tue, Aug 1, 2023 at 10:05=E2=80=AFAM Konstantin Ryabitsev
> > <konstantin@linuxfoundation.org> wrote:
> > >
> > > On Tue, Aug 01, 2023 at 09:44:54AM -0700, Kees Cook wrote:
> > > > I don't, no. I also don't use "b4 send" (just "git send-email"), so=
 it's
> > > > not clear to me what's actually going wrong here. It still looks to=
 me
> > > > like either "b4 send" isn't writing a "From:" header, or Justin (an=
d
> > > > your?) MUA is removing/replacing it when it processes the "-f" argu=
ment.
> > >
> > > I'm pretty sure this is the side-effect of using sendgmr, which force=
s the
> > > in-header From: to match what was passed in the -f parameter. It's ju=
st
> > > another way in which it differs from /bin/sendmail.
> >
> > Going back and forth between the maintainer of sendgmr here...
> >
> > I don't think you ever responded to my question of `-t`:
> > https://bugzilla.kernel.org/show_bug.cgi?id=3D217332#c9
> FWIW, I tried manually adding `-t` from inside of b4 and it did _not_
> fix the issue. sendgmr still botched the From: header.

Hmm...I should probably reopen our internal ticket for this then...

>
> >
> > Specifically NOT REFLECT MODE.
> >
> > >
> > > -K
> >
> >
> >
> > --
> > Thanks,
> > ~Nick Desaulniers



--=20
Thanks,
~Nick Desaulniers
