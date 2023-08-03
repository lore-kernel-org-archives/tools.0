Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A855F1F16D
	for <tools@linux.kernel.org>; Thu,  3 Aug 2023 17:51:14 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-31757edd9edso1012229f8f.2
        for <tools@linux.kernel.org>; Thu, 03 Aug 2023 10:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691085072; x=1691689872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dX7BlwAxHT3wt46VOJeC81aW8H8kIb9i2g7ZLN9Hw74=;
        b=5wwWAipPRvZyDYB1SlITyKN+xoTgxHeW0tdncNP2IrPkbf8IKsYLk8o81LWcj+DRsW
         wqzx6RdduQKvz3yAUHmua6YREaI6sHIJxX8THmPrllHawmwr1tOKNscVAkxUSs+t3gLI
         UpLQ7rkHs5Prwyjt9ibBVdL8/2mpvjketPqi6IDpd2hK/ZasqOIHo8A0BmqKoSV63K5O
         DjRJZnpkCDw8wA9Fmy3+hsrxVYnjmH7ZKM4851WPrwy5zVA7tdktDxGcfuyeT4gJCnqI
         sWERxhy8l1ftrfz7ZjYjaPLIzGaiutLv/CLSJ9wTY3Y6/xiFTkpPTM6KiX58jltYdOzF
         69nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691085072; x=1691689872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dX7BlwAxHT3wt46VOJeC81aW8H8kIb9i2g7ZLN9Hw74=;
        b=iGIwqxJ3p4NNvg+Spla6Hp2ngIShm/ZwgiilE8xx5YrBpSOuz11ddLaOjR5+tDHuN3
         cfhiBrB3HGXZ+p1UTk0fc3y0Uz7i+V1//bwYHD8/q/LVHrgecq1+/5MVG4hyhoGmwPpY
         a4nH8AltaIXZ9tVYXw/V/evXXKBLuPxQduyRshYwAI7EXo/hNe2ErF/JpLSdj5DO1jMw
         WNnvK755vFNPeGaEiAPRxRjqBeDTup/a6p+ddaIWXv50NGpyzu6JrJvJxLxJyucPDd9B
         51Bjr/u3P8t93OAWVU1ldNuRE3WqPgUvRJSERVsbeHDvTf9IpbPFGoxqKNfRJZiRgFSU
         p5Bw==
X-Gm-Message-State: ABy/qLbE9j2RpqTCHh8BkeMU/itqefEyxGhwGUVOwNMbFbyEuZAD1LKp
	BflU/L61M7rnnzIxBoF6wUSynWIosYbrkG9w+CZQtg==
X-Google-Smtp-Source: APBJJlET8nukSGVZS1WaL53ebjspM04SOUbNg3dbClrUeVeDTvudRWYmc3DV22ai1ATj8jd0mwnWN25YKV2jHwZ+hBU=
X-Received: by 2002:adf:f410:0:b0:30f:bb83:e6f4 with SMTP id
 g16-20020adff410000000b0030fbb83e6f4mr7067200wro.0.1691085072621; Thu, 03 Aug
 2023 10:51:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20230727-fix-from-header-v1-1-2fb23c0a5da9@google.com>
 <A250134A-7A60-47EB-8849-DB39D08B223B@kernel.org> <CAKwvOdn0ePdAfQBby9zaXi7CA64Foc2NRJfzYyQHaOhz2C9+VA@mail.gmail.com>
 <202308010939.9EC4C98@keescook> <20230801-exhaust-movie-971927@meerkat>
 <CAKwvOdnMf227kX1F_rC+mDdf122ah9o7XcEi2tUHKehaWuo0rA@mail.gmail.com>
 <CAFhGd8pDdJHf8YOb8XztzkPc51KF1F5o30Frx3S4c0OTFNe5Jg@mail.gmail.com> <CAKwvOdmmcSdL3=m_0CedFr-DWirZXVgazxQ6kwkeVHQxmyay9A@mail.gmail.com>
In-Reply-To: <CAKwvOdmmcSdL3=m_0CedFr-DWirZXVgazxQ6kwkeVHQxmyay9A@mail.gmail.com>
From: Justin Stitt <justinstitt@google.com>
Date: Thu, 3 Aug 2023 10:51:01 -0700
Message-ID: <CAFhGd8rQdfOJpuHJ3Nc7jw9340VcbzBHDNc1qvrEULq9p2W4gA@mail.gmail.com>
Subject: Re: [PATCH b4] b4: fix from header not using real name
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Kees Cook <keescook@chromium.org>, 
	Kees Cook <kees@kernel.org>, "Kernel.org Tools" <tools@linux.kernel.org>, 
	Sterling Stein <scubed@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 3, 2023 at 10:48=E2=80=AFAM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Tue, Aug 1, 2023 at 3:27=E2=80=AFPM Justin Stitt <justinstitt@google.c=
om> wrote:
> >
> > On Tue, Aug 1, 2023 at 3:25=E2=80=AFPM Nick Desaulniers <ndesaulniers@g=
oogle.com> wrote:
> > >
> > > On Tue, Aug 1, 2023 at 10:05=E2=80=AFAM Konstantin Ryabitsev
> > > <konstantin@linuxfoundation.org> wrote:
> > > >
> > > > On Tue, Aug 01, 2023 at 09:44:54AM -0700, Kees Cook wrote:
> > > > > I don't, no. I also don't use "b4 send" (just "git send-email"), =
so it's
> > > > > not clear to me what's actually going wrong here. It still looks =
to me
> > > > > like either "b4 send" isn't writing a "From:" header, or Justin (=
and
> > > > > your?) MUA is removing/replacing it when it processes the "-f" ar=
gument.
> > > >
> > > > I'm pretty sure this is the side-effect of using sendgmr, which for=
ces the
> > > > in-header From: to match what was passed in the -f parameter. It's =
just
> > > > another way in which it differs from /bin/sendmail.
> > >
> > > Going back and forth between the maintainer of sendgmr here...
> > >
> > > I don't think you ever responded to my question of `-t`:
> > > https://bugzilla.kernel.org/show_bug.cgi?id=3D217332#c9
> > FWIW, I tried manually adding `-t` from inside of b4 and it did _not_
> > fix the issue. sendgmr still botched the From: header.
>
> Hmm...that was not my experience.  Using the patch to b4 that you sent me=
:

Sorry, I meant adding the `-t` flag in conjunction with the existing
`-f` flag did _not_ work. The standalone `-t`
flag certainly works as you've aptly demonstrated. Thanks for confirming.

To elaborate:

Works!
Sending via "/usr/bin/sendgmr -i -t"

Doesn't Work!
Sending via "/usr/bin/sendgmr -i -t -f justinstitt@google.com"

Doesn't Work Either!
Sending via "/usr/bin/sendgmr -i -t -f Justin Stitt justinstitt@google.com"

> ```
>  b4/__init__.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/b4/__init__.py b/b4/__init__.py
> index b974642..993d6f6 100644
> --- a/b4/__init__.py
> +++ b/b4/__init__.py
> @@ -3259,7 +3259,7 @@ def get_smtp(dryrun: bool =3D False) ->
> Tuple[Union[smtplib.SMTP, smtplib.SMTP_SSL
>          else:
>              envpair =3D email.utils.parseaddr(fromaddr)
>          if envpair[1]:
> -            smtp +=3D ['-f', envpair[1]]
> +            smtp +=3D ['-t']
>          return smtp, fromaddr
>
>      encryption =3D sconfig.get('smtpencryption')
> ```
>
> Here was the recent result:
> https://lore.kernel.org/llvm/20230803-ppc_tlbilxlpid-v2-1-211ffa1df194@go=
ogle.com/
> (Note to followers, the very first line has:
>
> From: Nick Desaulniers <ndesaulniers@google.com>
>
> compare that with v1:
> https://lore.kernel.org/all/20230803-ppc_tlbilxlpid-v1-1-84a1bc5cf963@goo=
gle.com/
>
> From: ndesaulniers@google.com
>
> This is a PITA because now patches are getting merged without my name on =
them.
> example: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it/commit/?id=3D79e8328e5acbe691bbde029a52c89d70dcbc22f3
>
> author ndesaulniers@google.com <ndesaulniers@google.com>
>
> Konstantine, can you please help?
>
> In particular, I would love if you could address the question about
> using `-t` rather than `-f <email addr>`, or provide concrete feedback
> to Sterling (cc'ed) on what the expected behavior of the external
> mailer is, such that Sterling can then provide feedback on whether
> that's acceptable or not.
>
>
>
> --
> Thanks,
> ~Nick Desaulniers
