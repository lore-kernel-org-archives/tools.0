Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3A54DC94
	for <tools@linux.kernel.org>; Tue,  1 Aug 2023 22:27:54 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2b74fa5e7d7so93785731fa.2
        for <tools@linux.kernel.org>; Tue, 01 Aug 2023 15:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690928872; x=1691533672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UCc5NkcrEvfkqv6m0yad7lio6sMQUicvpx/or6sKAio=;
        b=A1CfMyijc2lhyoiTVA/89RQKeY4siwB7+fj1IFJ3DCPEIj8TJ8Z4fBIJxVOz+Eq+Fj
         Jmzh/llpe0A4RFBpGUCkYqkghgIAaGMUy5/e5e3RngCTVp8eVnkfswu9G9GXQRcjgNzq
         8iLe2c8gJXlkmYK0ZIPgOW7D5FeoDLS6SKbELbQlwLBhMOaPkoE1jNRc47ORC4K0y8vJ
         hJlHLNLn0OuLzNlEegSwZ0MjSCXzJMTyvOsMopnPy231rTLH6hcpduqtzjtFGnn7B3R8
         tbNqWobYGovYjJtC6Ss7XWTWJvhTCAtkaRy+qIUmA848wpIOtEf8n4q/OMxT0SqnzkyC
         ZnZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690928872; x=1691533672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UCc5NkcrEvfkqv6m0yad7lio6sMQUicvpx/or6sKAio=;
        b=gfKwgNdIxq+kRKBhZAnSFC3YenXMbYJBBfTuzx5sYMJJ9u2fBr3ECrZpHFs/aIRxs8
         Xfoji+LDy4+1NfIst8wMMeuZBnEXyRIpBvV/0lHUoINmcwPrTmcvP3ZpxRrfzYjVY9g9
         GHYQirTWBfLoroACXOeR83GX3CUZ2orLOfEe3J7vlqcrc5nUfD7V7llk+v/SeVD9HrnQ
         CHGazlHpUJiW3KKvZOtLVB//4UI8Fc+uvqsQsffIPrI6L9AWP41JSW7p3HrlItk67GhI
         4nulpaZ8eg8/+qoudCplH3Uo1ckVci5Ya7hzBFvJKZRzaT0XGnKbVOogCXYABSXmP/Pi
         8u7Q==
X-Gm-Message-State: ABy/qLasl/cOrSXPSyxzB7lWzpG+EzzX3yqTHKVa0aojps97u++B11VZ
	EOeKiSm5SegST1Yl17LUML7UqqKT/D4Wvi4CRKOy6A==
X-Google-Smtp-Source: APBJJlEiSbAjw72pVAwF4cUcBWZZrxom4WD4mEJFBl5MQ9SESELAPQVqYYtVUhu9nvZkmbwissAxfZiGmQ75iUsR3m4=
X-Received: by 2002:a19:6703:0:b0:4fd:fabf:b923 with SMTP id
 b3-20020a196703000000b004fdfabfb923mr3072755lfc.14.1690928872437; Tue, 01 Aug
 2023 15:27:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20230727-fix-from-header-v1-1-2fb23c0a5da9@google.com>
 <A250134A-7A60-47EB-8849-DB39D08B223B@kernel.org> <CAKwvOdn0ePdAfQBby9zaXi7CA64Foc2NRJfzYyQHaOhz2C9+VA@mail.gmail.com>
 <202308010939.9EC4C98@keescook> <20230801-exhaust-movie-971927@meerkat> <CAKwvOdnMf227kX1F_rC+mDdf122ah9o7XcEi2tUHKehaWuo0rA@mail.gmail.com>
In-Reply-To: <CAKwvOdnMf227kX1F_rC+mDdf122ah9o7XcEi2tUHKehaWuo0rA@mail.gmail.com>
From: Justin Stitt <justinstitt@google.com>
Date: Tue, 1 Aug 2023 15:27:39 -0700
Message-ID: <CAFhGd8pDdJHf8YOb8XztzkPc51KF1F5o30Frx3S4c0OTFNe5Jg@mail.gmail.com>
Subject: Re: [PATCH b4] b4: fix from header not using real name
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Kees Cook <keescook@chromium.org>, 
	Kees Cook <kees@kernel.org>, "Kernel.org Tools" <tools@linux.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 1, 2023 at 3:25=E2=80=AFPM Nick Desaulniers <ndesaulniers@googl=
e.com> wrote:
>
> On Tue, Aug 1, 2023 at 10:05=E2=80=AFAM Konstantin Ryabitsev
> <konstantin@linuxfoundation.org> wrote:
> >
> > On Tue, Aug 01, 2023 at 09:44:54AM -0700, Kees Cook wrote:
> > > I don't, no. I also don't use "b4 send" (just "git send-email"), so i=
t's
> > > not clear to me what's actually going wrong here. It still looks to m=
e
> > > like either "b4 send" isn't writing a "From:" header, or Justin (and
> > > your?) MUA is removing/replacing it when it processes the "-f" argume=
nt.
> >
> > I'm pretty sure this is the side-effect of using sendgmr, which forces =
the
> > in-header From: to match what was passed in the -f parameter. It's just
> > another way in which it differs from /bin/sendmail.
>
> Going back and forth between the maintainer of sendgmr here...
>
> I don't think you ever responded to my question of `-t`:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D217332#c9
FWIW, I tried manually adding `-t` from inside of b4 and it did _not_
fix the issue. sendgmr still botched the From: header.

>
> Specifically NOT REFLECT MODE.
>
> >
> > -K
>
>
>
> --
> Thanks,
> ~Nick Desaulniers
