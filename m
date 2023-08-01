Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341644DC94
	for <tools@linux.kernel.org>; Tue,  1 Aug 2023 22:21:03 +0000 (UTC)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-79ae250266cso275418241.2
        for <tools@linux.kernel.org>; Tue, 01 Aug 2023 15:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690928463; x=1691533263;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PN3PfQjTVmib+Dr2WxpOEN5hWpX8VJ/MA2Gqqg3/57M=;
        b=yKpCw06eM+gEDu6zXqgvXjbj17steWSNnHJ3r0nl/QFc6yFBj6hW8gA0F5MkrlVagN
         /JXUwm9beib7LF9acQvBQI3wOlCadH1FyicaX8ORzVLgCguUuIQSzgmxqcTI/hEpNjws
         LsjhVLq7NO46G7s2AM6trPe8s70YqI4H505ZNhzSnl+6MAWfZREp6OCjiJnoaPoKocY7
         Yi01bzvs6iFMcNniJqPXGFx7pPeATfEwi3owehxZI9T/jkgkzyFibDHreMMkxcBgM90e
         wP+DyGa7SdYNfpfah3+4tlJTd++Geu9MTHpJegg/cbuB7DnkHOGcdDB12d0VKpSTsGgm
         tJ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690928463; x=1691533263;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PN3PfQjTVmib+Dr2WxpOEN5hWpX8VJ/MA2Gqqg3/57M=;
        b=ZFvwGoozWnsgLlvUSxSThXSBG1L1zPCIAsQMYfl1PpuhZhcTQfShLisgiXTdho6nbQ
         rmrYKlVTh6+0WHi9I/tABClPE+nx+A6GVjPbd3+T5gxvUUXy+MLWn3pgFfNPvLilJGzc
         n7KV5mu1eIH++Zgsbr9LcMy1WIMWBXhH7HtuP8pJc38sPb7uj1dpNuazwnnWe0hoiS05
         SAPRc4lNd6S/zIt5HO4yCQL1ZGWf2PQCjEeSFI8KjZlmQL6lDJOzscluB+ctbMgAPy0s
         dEmHQUdwG2dSBXmQkgVkvQ6hEyz8fdi+EC2vS+hYr7ZR7PJXQkpSF22L4aMr/bKxwDLT
         uDKA==
X-Gm-Message-State: ABy/qLanZiqweCo2ao6mR6LhGm1fLOXYMWruWh2vwbH18MkioZMHKkyX
	hcuDKmycjEPNbTeHZMA6JcJf0B1lopoduT38H+8rdA==
X-Google-Smtp-Source: APBJJlFH4SUh1BmWjOmTiGDqBMQ0yPXg/PM5EIJ9aw9FaLqGBYewsmDPzzRyLRDutt+rTPM0Kz0UW1kQanghv9trGOU=
X-Received: by 2002:a05:6102:527:b0:444:bf88:c6d5 with SMTP id
 m7-20020a056102052700b00444bf88c6d5mr3509075vsa.1.1690928462741; Tue, 01 Aug
 2023 15:21:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20230727-fix-from-header-v1-1-2fb23c0a5da9@google.com>
 <A250134A-7A60-47EB-8849-DB39D08B223B@kernel.org> <CAKwvOdn0ePdAfQBby9zaXi7CA64Foc2NRJfzYyQHaOhz2C9+VA@mail.gmail.com>
 <202308010939.9EC4C98@keescook>
In-Reply-To: <202308010939.9EC4C98@keescook>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 1 Aug 2023 15:20:51 -0700
Message-ID: <CAKwvOdkCCF8iVW2RKJBhn+Ob=dQQxe7R2zc01K4njXdAS7SGxg@mail.gmail.com>
Subject: Re: [PATCH b4] b4: fix from header not using real name
To: Kees Cook <keescook@chromium.org>
Cc: Kees Cook <kees@kernel.org>, Justin Stitt <justinstitt@google.com>, 
	"Kernel.org Tools" <tools@linux.kernel.org>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 1, 2023 at 9:44=E2=80=AFAM Kees Cook <keescook@chromium.org> wr=
ote:
>
> On Tue, Aug 01, 2023 at 09:12:35AM -0700, Nick Desaulniers wrote:
> > On Thu, Jul 27, 2023 at 4:20=E2=80=AFPM Kees Cook <kees@kernel.org> wro=
te:
> > >
> > > On July 27, 2023 11:47:36 AM PDT, Justin Stitt <justinstitt@google.co=
m> wrote:
> > > >When using `b4 send` there seems to be an issue with the real name n=
ot
> > > >being included in the From: header.
> > > >
> > > >Here's an example:
> > > >| From:        justinstitt@google.com
> > > >
> > > >Whereas, something like the following is preferred:
> > > >| From: Justin Stitt <justinstitt@google.com>
> > >
> > > Hmm. There are actually two "From" fields. There's envelope sender "F=
rom" (which is what -f sets), and the in-body "From:" field. I wonder if b4=
 isn't constructing the in-body From: field, and when missing, the MUAs add=
 it based on the -f flag?
> > >
> > > >This patch fixes this issue and achieves the preferred behavior (abo=
ve)
> > > >by properly using both parts of a user's `from` field from their con=
fig.
> > > >
> > > >A .gitconfig like this now properly works
> > > >| [sendemail]
> > > >|   from =3D Justin Stitt <justinstitt@google.com>
> > >
> > > Perhaps what's needed is this (which is what I've been using forever)=
:
> > >
> > > [sendemail]
> > >         envelopesender =3D auto
> >

Sending via "/usr/bin/sendgmr -i -f auto"
  [PATCH] word-at-a-time: use the same return type for has_zero
regardless of endianness
CRITICAL: Error running /usr/bin/sendgmr -i -f auto: F0801
15:18:46.325579       1 sendgmr.go:277] Send failed: sending email
failed (permanent failure): PERM_FAILURE: PERM_FAIL_SENDER_DENIED With
GMR service:selector "_flex_", the envelope from address can only be
{LDAP}+anything@google.com.

> > Thanks for the tip; I'll give that a shot. Do you have `from` set
> > under `[sendemail]` as well or no?
>
> I don't, no. I also don't use "b4 send" (just "git send-email"), so it's

Well, we're trying to get that working with sendgmr + b4, not postfix
+ git send email.

> not clear to me what's actually going wrong here. It still looks to me
> like either "b4 send" isn't writing a "From:" header, or Justin (and
> your?) MUA is removing/replacing it when it processes the "-f" argument.
>
> FWIW, my MUA is postfix. (Though actually, I guess, it's the MTA, b4 or
> git is the MUA... whatever. The thing I hand off to is postfix.)
>
> For the relevant ~/.gitconfig settings, I have:
>
> [user]
>         email =3D keescook@chromium.org
>         name =3D Kees Cook
> [sendemail]
>         envelopesender =3D auto
>         confirm =3D auto
>
>
> --
> Kees Cook



--=20
Thanks,
~Nick Desaulniers
