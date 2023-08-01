Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54154DC89
	for <tools@linux.kernel.org>; Tue,  1 Aug 2023 20:07:54 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-4fb7dc16ff0so9937089e87.2
        for <tools@linux.kernel.org>; Tue, 01 Aug 2023 13:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690920472; x=1691525272;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J3mSheMI40WiNqBKdtyo+yyjkhO+ZcVNTKLCp/pP+Lw=;
        b=zJrEFXkuRUQJGJNvhOSRot+nzdGxANAvMR4Cc7S4XUuhT5D0LdjlW+ipPSGTZ8AEFb
         cJ6U6oPI/ApuCflzKK0NfxGVMqoBZQvw+kddhsBkTY9GtZo62T4/Frx+gunfNElHcPgR
         aHuthS/nEnUHlC4br7oEV+NleqT9U8Gt1SulK06Tv0aqE/r7HvclFgIFdvHxfNnZdEQ6
         v7AD6plPpwUDB90bNQSUvUACCoyC8bdP25rq3yFnVEIb0oPOuLoMXT9qCqpo38YwV4lR
         /ho2DPf0USv7b9j6ucHE9DliXAIjWDUlTQVt19i+X/9onD7asvOi8GVJppdq3qiIv1oO
         4o6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690920472; x=1691525272;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J3mSheMI40WiNqBKdtyo+yyjkhO+ZcVNTKLCp/pP+Lw=;
        b=XIFL0T2feY5m8hvRx7bbunpwymRuqqLoSftKEwE1yXEhWBepjKe7aUEmvKZpB7XybF
         BPYGkBA4U691GH8gEztIZEvwFrMeuAjWbF29/3TvIs2uF1fUVIpZiF3L+h4TjA1UryL0
         XgyKIBiulNIBRuPgMsrEUTu4ai/f4U1tX1ZsxIuNSImUmIAnbDFA2wUAxkXtypM6aYMI
         tEiby02Ipd6cjUbLtXkt5qbwleQjvDq/xxqaYjt27ofI6zUHc776VYEmvktExad/so8L
         hLE77vyGbQTlKsn33xFu9xyyWvmEgMp0Xfv/XRPxEdhuuNxM3wz6guUPOrBunnDLuw7x
         sjOw==
X-Gm-Message-State: ABy/qLYIzQulDLnXL0mfBxLTc5c7OJnk3wWgYZBvq8/gWLYQ5/v+LFUL
	i/YZwGEZfxRivT7MhLHx1OCknVDzNz9x/lTCpwweVQ==
X-Google-Smtp-Source: APBJJlEuwnPg5ZtTDQNGrwCWXWgWQif/TbPOwicSE2C9t5DXyyXyND8hE4qwJWdXaltdgwxunEszW4znSoC9P8XdG94=
X-Received: by 2002:a19:771b:0:b0:4fd:da65:d10 with SMTP id
 s27-20020a19771b000000b004fdda650d10mr2561444lfc.36.1690920472301; Tue, 01
 Aug 2023 13:07:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20230727-fix-from-header-v1-1-2fb23c0a5da9@google.com>
 <A250134A-7A60-47EB-8849-DB39D08B223B@kernel.org> <CAKwvOdn0ePdAfQBby9zaXi7CA64Foc2NRJfzYyQHaOhz2C9+VA@mail.gmail.com>
 <202308010939.9EC4C98@keescook> <20230801-exhaust-movie-971927@meerkat>
In-Reply-To: <20230801-exhaust-movie-971927@meerkat>
From: Justin Stitt <justinstitt@google.com>
Date: Tue, 1 Aug 2023 13:07:38 -0700
Message-ID: <CAFhGd8pA31-dCVf-vuWjZm4UCJpuA+mVbQFtEKzBwwXZLVHCWA@mail.gmail.com>
Subject: Re: [PATCH b4] b4: fix from header not using real name
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Kees Cook <keescook@chromium.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Kees Cook <kees@kernel.org>, "Kernel.org Tools" <tools@linux.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 1, 2023 at 10:05=E2=80=AFAM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Tue, Aug 01, 2023 at 09:44:54AM -0700, Kees Cook wrote:
> > I don't, no. I also don't use "b4 send" (just "git send-email"), so it'=
s
> > not clear to me what's actually going wrong here. It still looks to me
> > like either "b4 send" isn't writing a "From:" header, or Justin (and
> > your?) MUA is removing/replacing it when it processes the "-f" argument=
.
>
> I'm pretty sure this is the side-effect of using sendgmr, which forces th=
e
> in-header From: to match what was passed in the -f parameter. It's just
> another way in which it differs from /bin/sendmail.

Do you think a patch to b4 specifically catered to `sendgmr` is the
right call here? If not, I can hold onto my patch locally and use it
for my purposes + anyone else who wants it.

>
> -K
