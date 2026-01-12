Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EDE324B0A
	for <tools@linux.kernel.org>; Mon, 12 Jan 2026 19:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768247579; cv=none; b=X3r/Ht83DOY8RsG7sms558bH8UkTqhMTRmk0N/YtFPmPw2AqayQrP2+gijEeQbtJ9przx5h9Lq9dHIa891A5MG6xBqo0lR4SQ9jc7APdY35jBRfjEi7+q0PfOtlTBTNl1RdJkGR11ytXtcuETcEPmAfONpUJJOGcXt67jyA4MTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768247579; c=relaxed/simple;
	bh=0dDB9ASm9u6TRPLEjxpNxIKEdB7gCLRJvCX3I8jpju4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nCKgUS9MCAVwQFy4J6pcQdJA/CQNWR1OKcIm/4sN4UFIzvMoJoNuQ/28CJleW+/xoGFoLlkF73SuGYRA9iN3abwczdEO9KUT38Ka+80o7x40oz5evt4NOi2ssClPb8jE0x5BjlcnlY5EaUOThryqKZnZKprIKI2fzP2bcH8EhEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jKkSYQ6a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jKkSYQ6a"
Received: by smtp.kernel.org (Postfix)
	id 22B28C19425; Mon, 12 Jan 2026 19:52:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B5D4C4AF09
	for <tools@kernel.org>; Mon, 12 Jan 2026 19:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768247579;
	bh=0dDB9ASm9u6TRPLEjxpNxIKEdB7gCLRJvCX3I8jpju4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jKkSYQ6a3jxmKElp0ifGFQcdPLZlZMFvnMuMVQtNql3ddZdAa5p3NGG1mWsX1Q1Uq
	 i0wiShNJGNtZie+IwQVDOvlXSnLPmDez/Af4X8bLhZ6Idc1BnmoWJb6opiNK1IRWiH
	 zwdgTS8SYgKNUAQH30+6TREEQCs7OpVkZgS7wjB3XdAyH2JpPJchJ17bPWqpRYyFvP
	 qm45EvKuYIpJWq767KVXolNGZ1wJCc1GT34oHGpNtR6zR7CKSlKTRkS9fS8cN3RVS5
	 dNcFLVayiD5G6ojqej9XB70POEITniinfursfsa9A9LEqJnJM2jrjkB8BTzQUL/Uik
	 FdH3Dy4Jb43vg==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-59b7bb3b913so5036802e87.1
        for <tools@kernel.org>; Mon, 12 Jan 2026 11:52:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXDU5viKyuYHjcvLRLzYYiGf7PU2wma+Q6nzYSnA+y2Z2Wu+zrq2xMZZA0daIdjQvCye55ZaQ==@kernel.org
X-Gm-Message-State: AOJu0YxiCiyC4hkqljyKnQ1AMSRgD5dx16uhHA+Oc2uigrKLCxORXPKE
	68ZFK3CGSdr9rnSOrhBC7P1Yt9Nn1TbgZY9ntYnP5CJpaUNr/CnBe5AJ/vbEzc1WhiIhwr1XtUq
	TvdNQs4ORdpZn3oHc7E7muGd1ejlHNPA=
X-Google-Smtp-Source: AGHT+IGX+ouodxOjFn+a/HdBWI8V0+vtU1fkHv6EvN9d1PA/QhHkgunhdLCVLthwzrR8IRFoQdtY4TfyOBJnarI94Uk=
X-Received: by 2002:ac2:4e06:0:b0:59b:6ac6:115f with SMTP id
 2adb3069b0e04-59b994079d6mr150886e87.18.1768247577658; Mon, 12 Jan 2026
 11:52:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CAD++jLmGuPxWLEcUaVMU9jCmEfrzUbgzMrFbd9uX+62avv9jmA@mail.gmail.com>
 <20251217-yellow-cormorant-of-debate-b55a75@lemur> <CAPKp9uY-BYKXAoWg8zPLhQjEHs4qqsW+qjYne7Qv1LKwL6BQUA@mail.gmail.com>
 <20251218-dove-of-fantastic-upgrade-c491ea@lemur> <CAD++jLk6=56izoMzfs_PVFvX3j9N+J6O1FGxrEg3wE78rOww4g@mail.gmail.com>
 <20251218-merry-azure-chicken-4d3724@lemur> <CAD++jLmwVSGwBZgSrbhcJ+w4BHWrgK57sBmMGR=ELRsHM+MzHQ@mail.gmail.com>
 <20251222-speedy-tuscan-salmon-4bfbb8@lemur> <CAD++jLmnGmdQtXraa0wzOmEs-j9BrzgnChvk=W8kE1NTUBqhVw@mail.gmail.com>
 <CAD++jL=JGmHWKDobmcf1v99335CrsLaT9My8-3Th_RNqq1EfuQ@mail.gmail.com> <20260111-hilarious-spicy-cobra-ad26c6@lemur>
In-Reply-To: <20260111-hilarious-spicy-cobra-ad26c6@lemur>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 12 Jan 2026 20:52:45 +0100
X-Gmail-Original-Message-ID: <CAD++jLnUtBod3+FNdLduG=g+6p3SmM7E55ZwcGqQdE6b2W=qbw@mail.gmail.com>
X-Gm-Features: AZwV_QhdVPl6zXff66vyfJRcdQOlwKxvSd8kxLSzDB3GUoZstREjycnn7OLFpIk
Message-ID: <CAD++jLnUtBod3+FNdLduG=g+6p3SmM7E55ZwcGqQdE6b2W=qbw@mail.gmail.com>
Subject: Re: korgalore v0.2 released with JMAP, IMAP, Maildir support
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, tools@kernel.org, users@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 11, 2026 at 9:16=E2=80=AFPM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:

> > I would almost set this up to run as a cron job if it wasn't for the fa=
ct that
> > the Googly API wants to reauthenticate every now and then. Other than
> > that it is smooth as butter to work like this!
>
> I've not actually had to redo my gmail authentication again, but I do hea=
r
> that it's less smooth for others.

I've had to do it twice, second time today.

About that!

What happens when the token expires is this:

$ kgl pull
(long splat like the one below)

$ kgl auth personal
Traceback (most recent call last):
  File "/home/linus/.local/bin/kgl", line 8, in <module>
    sys.exit(main())
             ~~~~^^
  File "/home/linus/.local/lib/python3.14/site-packages/click/core.py",
line 1485, in __call__
    return self.main(*args, **kwargs)
           ~~~~~~~~~^^^^^^^^^^^^^^^^^
  File "/home/linus/.local/lib/python3.14/site-packages/click/core.py",
line 1406, in main
    rv =3D self.invoke(ctx)
  File "/home/linus/.local/lib/python3.14/site-packages/click/core.py",
line 1873, in invoke
    return _process_result(sub_ctx.command.invoke(sub_ctx))
                           ~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^
  File "/home/linus/.local/lib/python3.14/site-packages/click/core.py",
line 1269, in invoke
    return ctx.invoke(self.callback, **ctx.params)
           ~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/linus/.local/lib/python3.14/site-packages/click/core.py",
line 824, in invoke
    return callback(*args, **kwargs)
  File "/home/linus/.local/lib/python3.14/site-packages/click/decorators.py=
",
line 34, in new_func
    return f(get_current_context(), *args, **kwargs)
  File "/home/linus/.local/lib/python3.14/site-packages/korgalore/cli.py",
line 619, in auth
    ts =3D get_target(ctx, identifier)
  File "/home/linus/.local/lib/python3.14/site-packages/korgalore/cli.py",
line 93, in get_target
    service =3D get_gmail_target(
        identifier=3Didentifier,
        credentials_file=3Ddetails.get('credentials', ''),
        token_file=3Ddetails.get('token', None)
    )
  File "/home/linus/.local/lib/python3.14/site-packages/korgalore/cli.py",
line 146, in get_gmail_target
    gt =3D GmailTarget(identifier=3Didentifier,
                     credentials_file=3Dcredentials_file,
                     token_file=3Dtoken_file)
  File "/home/linus/.local/lib/python3.14/site-packages/korgalore/gmail_tar=
get.py",
line 43, in __init__
    self._load_credentials(credentials_file, token_file)
    ~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/linus/.local/lib/python3.14/site-packages/korgalore/gmail_tar=
get.py",
line 69, in _load_credentials
    self.creds.refresh(Request())  # type: ignore
    ~~~~~~~~~~~~~~~~~~^^^^^^^^^^^
  File "/home/linus/.local/lib/python3.14/site-packages/google/oauth2/crede=
ntials.py",
line 409, in refresh
    ) =3D reauth.refresh_grant(
        ~~~~~~~~~~~~~~~~~~~~^
        request,
        ^^^^^^^^
    ...<6 lines>...
        enable_reauth_refresh=3Dself._enable_reauth_refresh,
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    )
    ^
  File "/home/linus/.local/lib/python3.14/site-packages/google/oauth2/reaut=
h.py",
line 366, in refresh_grant
    _client._handle_error_response(response_data, retryable_error)
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/linus/.local/lib/python3.14/site-packages/google/oauth2/_clie=
nt.py",
line 69, in _handle_error_response
    raise exceptions.RefreshError(
        error_details, response_data, retryable=3Dretryable_error
    )
google.auth.exceptions.RefreshError: ('invalid_grant: Token has been
expired or revoked.', {'error': 'invalid_grant', 'error_description':
'Token has been expired or revoked.'})

This isn't very pretty, the reason is that korgalore seems to have no idea
about overwriting an existing authentication token.

Some try-catch thingie is needed here, right? If it's hard for you to repro=
duce
I can try to do some Python hacking the next time it happens.

You have to manually do this:

rm .config/korgalore/gmail-personal-token.json
linus@Fecusia:~$ kgl auth personal
critical: Log in to Gmail account for personal
Please visit this URL to authorize this application:
https://accounts.google.com/o/oauth2/auth?Authenticated target:
personal (type: gmail)
(...)
Authentication complete.

Maybe this could be made more smooth, as in prompting:
"Do you want to delete your old expired access token and get a new one?"

Yours,
Linus Walleij
