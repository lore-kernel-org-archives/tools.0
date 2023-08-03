Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3C5100D7
	for <tools@linux.kernel.org>; Thu,  3 Aug 2023 18:42:03 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-63cf3dcffe0so7664886d6.1
        for <tools@linux.kernel.org>; Thu, 03 Aug 2023 11:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691088123; x=1691692923;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L7dte2L6a9i0JUbNmd9/Mnkqxh/ZG7l0MSwghZBUNPw=;
        b=CMG0YRvN+TTSxiCTpgUFml0+TfjMKvTSFE9umH2nc9+oj9rUw37LqfBjm2gP15ojV4
         AaOpiNuQGIsYBmNCXV61YhSVFCVxL+RNbRAeY1afr5FWAxxGPckQSTscrEMi94Apqk5Y
         REzUd5jxhr38c+aFAviNs5AX6SDvdIWfsl+3jCD98p/+jrYiEzSKpmF0JyWp+0yBIviT
         86zzJCAS3kcAOiDfRrrIOrDh63V30h3YnJTmuhjjIjBjqnAwvbJMi8ukieFsBI0HsCx1
         q2CSSH06kXSRpAdVY9z/M9hgiKSTwH10gdBpHGnCH4tkWPvCZuZKQ3l0nesZCUaP+whf
         3PuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691088123; x=1691692923;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L7dte2L6a9i0JUbNmd9/Mnkqxh/ZG7l0MSwghZBUNPw=;
        b=OtcrOqetWfu+x1s9bC3YZfF6oT02kmFFpxWzIawLd3oFs3rxzUm/89TJVWAPfQumm6
         c0O/loAJXyWOCg3fF7Btld/eVm2Z6hZz8eYn720ycFAN2j1ta+XjDLEaRQmVRz3V9BVR
         dVvn74isQXq6hk03b01IDT+6LQtxi1bVeN+xh9TOFVVTnVMP/1nkst6qqz3w90sRgb07
         /yyki05ZWmcPI/U9mFy6/z8CyCTorSngzv6igF3E84EBN2VfAnY7WxvoVe3+IfT/wZxn
         JVZBikojaqAcB1bqpWAmfdMbvWjbiW0n2pCTlH6Gw2P3K9WJNKAWPSvRYKUfhZckAnVw
         n7ew==
X-Gm-Message-State: ABy/qLaWPqCWZgcxDYBjpptDr7DVYP5NiwMtLDSaICVdLx4JQP6tyJDg
	3Lt3DidAZ6FCjZbKqdh8JtYbClVbulxLcFLK7reXqleYq6Wh6xq/utc=
X-Google-Smtp-Source: APBJJlHAYTNSgWrnEBGjhrYTzLnHYW+fUpLpmhzBAY/JX/pbJ+UY2GT6jRH4Rn/8ZZRMiBug1Yqta3UB75QbAF5XTVQ=
X-Received: by 2002:a0c:e352:0:b0:63d:8446:c9ab with SMTP id
 a18-20020a0ce352000000b0063d8446c9abmr7504196qvm.22.1691088122618; Thu, 03
 Aug 2023 11:42:02 -0700 (PDT)
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
 <CAFhGd8pDdJHf8YOb8XztzkPc51KF1F5o30Frx3S4c0OTFNe5Jg@mail.gmail.com>
 <CAKwvOdmmcSdL3=m_0CedFr-DWirZXVgazxQ6kwkeVHQxmyay9A@mail.gmail.com> <20230803-sturdily-viscous-f99673@meerkat>
In-Reply-To: <20230803-sturdily-viscous-f99673@meerkat>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 3 Aug 2023 11:41:51 -0700
Message-ID: <CAKwvOd=5PuW1VWUxmOkXGZtkus2ZoyyW_9HNKnjUwfjGKEr14w@mail.gmail.com>
Subject: Re: [PATCH b4] b4: fix from header not using real name
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Justin Stitt <justinstitt@google.com>, Kees Cook <keescook@chromium.org>, 
	Kees Cook <kees@kernel.org>, "Kernel.org Tools" <tools@linux.kernel.org>, 
	Sterling Stein <scubed@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 3, 2023 at 11:17=E2=80=AFAM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Thu, Aug 03, 2023 at 10:47:49AM -0700, Nick Desaulniers wrote:
> > In particular, I would love if you could address the question about
> > using `-t` rather than `-f <email addr>`, or provide concrete feedback
> > to Sterling (cc'ed) on what the expected behavior of the external
> > mailer is, such that Sterling can then provide feedback on whether
> > that's acceptable or not.
>
> Reading the sendmail man page
> (https://man7.org/linux/man-pages/man8/sendmail.8.html), I think the prop=
er
> way to do it is to:
>
> if sendemail.from has just the email address, like:
>
>     [sendemail]
>     from =3D foo@example.com
>     smtpserver =3D /some/path/sendmail-alike
>
> We should run this command:
>
>     /some/path/sendmail-alike -i -f foo@example.com
>
> If we encounter the following (without envelopesender):
>
>     [sendemail]
>     from =3D Foo Quux <foo@example.com>
>     smtpserver =3D /some/path/sendmail-alike
>
> Then we should use the -F switch to pass the full name:
>
>     /some/path/sendmail-alike -i -F "Foo Quux" -f foo@example.com
>
> I'm not convinced that passing the following will work properly on all
> /bin/sendmail implementations:
>
>     /some/path/sendmail-alike -i -f "Foo Quux <foo@example.com>"
>
> I am fairly certain that at least some clients will not properly handle s=
uch
> situations, because I think -f is only supposed to have the email address=
, not
> the full From-like header.
>
> Now, the question is -- does sendgmr support the -F flag?

It does not currently, but we probably could add support for it.

What are your thoughts Konstantin on -t?

--=20
Thanks,
~Nick Desaulniers
