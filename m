Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679EF100D7
	for <tools@linux.kernel.org>; Thu,  3 Aug 2023 18:42:08 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-4fe426521adso2148262e87.0
        for <tools@linux.kernel.org>; Thu, 03 Aug 2023 11:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691088126; x=1691692926;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xq5zDLWLB3snRZUu9vEauHsHrRfqQThxPTS1oMlvsz8=;
        b=J0yw+0/V6q0rm/LqiPnMPg79nATN0+NBiDTY1s5sawkp7hso1sIiHfMqHs3B0Vrx1L
         8bI3O8qXOSvNXkqzEAFg+FHKkYChjrTFemBl9jWFnPqBw7XFt90JZyd+Y3BtIdc+4hTX
         ulcSNEonOt6xI4dHDdZjUVKGtotH+EGq/dJ12NbYW+W95AlC3SiGB0jlIKXu0MdokdjT
         +gO6eOkTzF7tnk8/j8f9U0RA+eRsg/q/Um1D8pWPZYVTJKVVs31OZFh8FePFYDi1mFi/
         3rQ80zy+0UfS3Jl5L6JvQofJRBHJQWirNj4yscFz0rSbJXEZVZFRr4ulXHPoKey5xBMs
         xtVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691088126; x=1691692926;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xq5zDLWLB3snRZUu9vEauHsHrRfqQThxPTS1oMlvsz8=;
        b=a2QZFK5viJEUm6A8EiZtMsFCgo7CpcIePGAaGMlzo0qaYlmIJAJpX1Vlg3yr1uMGxm
         7U8zYVSKiNP/qn8SreOnsRpxZssFN4J2/2XRgEKuLJ8UmsHt8DODcZGNK6O9XHvuU0aT
         KTUuvXvM6tmPrXqVMtzi6DpeaQ6iyQk8PpKaNUuTOZydQgr8OdMd/v3uzvxMGbFIAEDb
         NV0DZDHrI7IIN9RcMsx9SCtgum9aN4/0cazxptgqg6T118drBF95x2UUkXstlcatk0fi
         kHJJkwQCK4EYccxcMpKCnJNycZ3xS/UeOTZLQIiPwWJGP4q1oQLtWcRkOqmMyiNGYozd
         iUjA==
X-Gm-Message-State: ABy/qLZXqnStFamXiPhZuTxhsL/1GtcHXR3ySCV9Gg03YoJ8Dx3pScOs
	n56Gdt0rP3I1j3R0pwvGSKRAjHbXA98l1YBuBaX7gg==
X-Google-Smtp-Source: APBJJlFjSUPYH8yqG13IekJ3eq78Vdn20Hij0mZVuEelNykqxyInzYilXFxX/0wl5+vsldUNNYcL+2V99tu7az5sPv8=
X-Received: by 2002:a05:6512:2082:b0:4fe:f2e:6cfd with SMTP id
 t2-20020a056512208200b004fe0f2e6cfdmr6910580lfr.62.1691088126131; Thu, 03 Aug
 2023 11:42:06 -0700 (PDT)
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
From: Justin Stitt <justinstitt@google.com>
Date: Thu, 3 Aug 2023 11:41:54 -0700
Message-ID: <CAFhGd8pdOUYwiBMKsCpRT=Cwm92bpqva-ON=+Bh+1tLRsKOCww@mail.gmail.com>
Subject: Re: [PATCH b4] b4: fix from header not using real name
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Kees Cook <keescook@chromium.org>, 
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
Working on a patch to address all of these points.

>
> Now, the question is -- does sendgmr support the -F flag?
>
> -K
