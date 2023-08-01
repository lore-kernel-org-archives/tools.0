Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2476C1ADCC
	for <tools@linux.kernel.org>; Tue,  1 Aug 2023 16:12:46 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6bca3588edbso1475351a34.0
        for <tools@linux.kernel.org>; Tue, 01 Aug 2023 09:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690906366; x=1691511166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QUMk2FExhqxQMFVKlJuAGqG7lauJ/nvTYnqEbse1XXk=;
        b=hFFXzHkoIQyhX2HxrLb5tHYrn4wnEwq4KW89QTfdEmCcVKnBBqHsMEVfKPK20mLVS4
         uFb9S+OIlkkEgKf02ri3qLRogOT4K8qs7iPWrtGMiwhkfM8Nyodsg4eEegXYr1NR+stv
         wanWzbVZ8+LOCnLM3KHBKF2ezd90+C1VGpdQi23zSLx3pNwyr+wk7Q4U+DoYfGC/ows4
         mgTFR1ZSOf23n/VGSSPA4hHnTTE1gxrQSGEUrKTwKIbjnNuH2rspAO0fzUDXqI8e9m0N
         g8SRNDlte/CkkOSCyLZliJEvDdPXg8qtTXKyLGnZG8uWgqLWD4w7jUzd9bZiit2dLDcs
         Adtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690906366; x=1691511166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QUMk2FExhqxQMFVKlJuAGqG7lauJ/nvTYnqEbse1XXk=;
        b=ZJlG4nuPkrnDrIRW6xyA13PuEGWv+6pNDNdC+91L84r6j19v/57vQ9suVuR6CHrfU0
         tO3I9f8RimyDl6S+EX+cCwwxxJeadsMO1seqME9yGwVWoMcv6Pf2noDEN4wdCBxZxJxI
         NbmT5kI0iJS0wTpE5TQeC+ZtsP0E42qu2c51QD3TUcDJ597/zEX06yYrCGpn/gb/vQDE
         QEKS2bLVimwkiyjH5rGYL6TV8CYVWt2JZHYi7GImp3fwxtuF6uqVGkid4boThJMg/pm1
         IXb5NdAhYkxYf3H1fMNI27EllEZp3A0pPiVMLds8NrFPcisIWdBh7QSUDCsXo3tuFFye
         /xng==
X-Gm-Message-State: ABy/qLa1Dloc09W9ZVQyN3GrXrf4uu5Few9+hDUclDI1yCbs9Tj1c05S
	x2H8D4fHhVIgeG/2nZYhIFicV3hmOWwl9f1PJUVzcw==
X-Google-Smtp-Source: APBJJlEWPIxt4T2q3SbBDuo7+3kSU2EfYYi9fFeM8mJ/hCNuw7mexviToqXq+dLJqBA52OrG4Yb/m1VRe2UXY0fzhSo=
X-Received: by 2002:a05:6358:884:b0:135:4c43:f4df with SMTP id
 m4-20020a056358088400b001354c43f4dfmr2152360rwj.3.1690906365811; Tue, 01 Aug
 2023 09:12:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20230727-fix-from-header-v1-1-2fb23c0a5da9@google.com> <A250134A-7A60-47EB-8849-DB39D08B223B@kernel.org>
In-Reply-To: <A250134A-7A60-47EB-8849-DB39D08B223B@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 1 Aug 2023 09:12:35 -0700
Message-ID: <CAKwvOdn0ePdAfQBby9zaXi7CA64Foc2NRJfzYyQHaOhz2C9+VA@mail.gmail.com>
Subject: Re: [PATCH b4] b4: fix from header not using real name
To: Kees Cook <kees@kernel.org>, Kees Cook <keescook@chromium.org>
Cc: Justin Stitt <justinstitt@google.com>, "Kernel.org Tools" <tools@linux.kernel.org>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 27, 2023 at 4:20=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> On July 27, 2023 11:47:36 AM PDT, Justin Stitt <justinstitt@google.com> w=
rote:
> >When using `b4 send` there seems to be an issue with the real name not
> >being included in the From: header.
> >
> >Here's an example:
> >| From:        justinstitt@google.com
> >
> >Whereas, something like the following is preferred:
> >| From: Justin Stitt <justinstitt@google.com>
>
> Hmm. There are actually two "From" fields. There's envelope sender "From"=
 (which is what -f sets), and the in-body "From:" field. I wonder if b4 isn=
't constructing the in-body From: field, and when missing, the MUAs add it =
based on the -f flag?
>
> >This patch fixes this issue and achieves the preferred behavior (above)
> >by properly using both parts of a user's `from` field from their config.
> >
> >A .gitconfig like this now properly works
> >| [sendemail]
> >|   from =3D Justin Stitt <justinstitt@google.com>
>
> Perhaps what's needed is this (which is what I've been using forever):
>
> [sendemail]
>         envelopesender =3D auto

Thanks for the tip; I'll give that a shot. Do you have `from` set
under `[sendemail]` as well or no?

>
>
>
> --
> Kees Cook



--=20
Thanks,
~Nick Desaulniers
