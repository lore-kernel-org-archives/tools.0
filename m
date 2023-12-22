Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B842EB06
	for <tools@linux.kernel.org>; Fri, 22 Dec 2023 22:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="c9lPKqU6"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-db99bad7745so2199811276.0
        for <tools@linux.kernel.org>; Fri, 22 Dec 2023 14:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1703283659; x=1703888459; darn=linux.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N4xerUATgxBIYL8AfGscv8JvXzlChceY880fblkmNnI=;
        b=c9lPKqU6c0KlYqhtOJbCvWiUzlDVjloVc2SiosoNr71YdcMYcCWCd7pyaYlkeYazwP
         0j9CvTGSCJv491aJif4vreycB9pcx1k98m7sk/wv1vmIkpmc2ZQqYjm/jcKY3nIzjiVU
         GGBZ7583/HNJnnR68XjtnvNApSUjoskRr6AOqL7PTM6KgAGU7lrucw/i6xTBLyH247dB
         FEy2pNPoOq0Or8AFBExIYDZMAvjJDjn4+1Odn22kVYpQn2QCDSSrWEF9kgHNhFT19jxu
         5hXTKHDjhMWmOzOtEtGMCSJByN0/xA+JNHpq0AhWrCOkcM8sTYkOoXereUMgSO8o+6E/
         VYaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703283659; x=1703888459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N4xerUATgxBIYL8AfGscv8JvXzlChceY880fblkmNnI=;
        b=eWyC4QstJp4p0UXpDALRrmNmRJtCtist0JJqA0/uTpU8ArGLP3UjyZxv/S8GTwIgHG
         TZGy64obYCTDHb7Eg3VWliK4OFOI7mwFHj3msVXRc96p7+cIFqdXCGBuCnZIulUZsPj8
         K68JFiMI5cfYG6CrcDdiV2Y6xwnFJs3zlmaivFW8HYHmpoHgau12M5g5nNF/JA6TG+FM
         GT4Erl03KdOO6/Gqns7ZcwllI+pmJb3GHNvmXgdyBPS/8oe25a/qJ/KXP1piSBTGftrE
         WTqste2oDox8s/Y8NaOjiukMO0dabYitYfSHJLqDXnDPoKz0X0pVJO8gpVsLn+d7PJPu
         cohg==
X-Gm-Message-State: AOJu0Yy8bs0ll8tMebmJP3tx880KxaSjOzMYfpi1BRYOMt/inhWTXxK0
	qDUlXiCq3Y31buZFuQ5V6DIxe+IMsFB5KOBxiJmV8UmBe1/AstxUuf+qyDNZMA==
X-Google-Smtp-Source: AGHT+IEpYW4koDYOdJ6Vrje73o/PSQUiAJ3OYPX2ZSEoweXQqkv9AWuxuLlbvpDgrpO3I1GRmop+HyHlJd/zC4G/rsM=
X-Received: by 2002:a25:9385:0:b0:dbd:7510:e0b2 with SMTP id
 a5-20020a259385000000b00dbd7510e0b2mr1651727ybm.86.1703283658945; Fri, 22 Dec
 2023 14:20:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CAHC9VhRCTKD7qwm7u9EvudWkY9nw+CSS1HCOdr5c8OWBU1LCEg@mail.gmail.com>
 <20231222-secret-thoughtful-zebu-fedba6@lemur>
In-Reply-To: <20231222-secret-thoughtful-zebu-fedba6@lemur>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 22 Dec 2023 17:20:47 -0500
Message-ID: <CAHC9VhRTQPAfTutfXQt3yk9267EHdDpSGqE-=GnEAyspSvQ-Zw@mail.gmail.com>
Subject: Re: Problems with patatt and stacked-git's patchset cover letter
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 22, 2023 at 1:09=E2=80=AFPM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
> On Thu, Dec 21, 2023 at 05:55:25PM -0500, Paul Moore wrote:
> > Hi Konstantin,
> >
> > I didn't see a place to file issues on the patatt GH, and I'm not sure
> > which mailing list was appropriate, if any, so I'm only sending this
> > bug report to you; feel free to forward if appropriate.
>
> Sounds good, cc'ing the tools list.
>
> > I'm a little surprised to have run into this, as I believe there are
> > other kernel devs using stacked-git, but perhaps I'm the only one
> > using stacked-git in conjunction with patatt, who knows.  The good
> > news is that things seem to work just fine when sending single
> > patches, or patchsets with no cover letter, however as soon as I try
> > to send a patchset with a cover letter, i.e. 'stg email send --compose
> > ...', I run into an error caused by a missing 'from' header:
> >
> >  % stg email send --to=3Dlistname  -a --compose
> >  ...
> >  error: `git send-email`: patatt: E:
> >    The following required headers not present: from
> >
> > ... which appears to be caused by the cover letter not starting with a
> > "From <hash> <date>" line.
>
> No, this means the actual From: header, like:
>
>     From: Foo Bar <foo.bar@example.com>
>
> We require two headers to be present, From: and Subject:, because they ma=
ke an
> integral part of the git commit. Signing a message without them doesn't m=
ake
> sense, which is why we err out.
>
> Can you verify that stgit creates cover letters without the From: header?

If I replace my sendemail-validate hook with the following:

  % cat .git/hooks/sendemail-validate
  #!/bin/sh
  echo ">>> HOOK DUMP"
  cat "${1}"
  exit 1

... and attempt to send a patchset with a cover letter I see this:

  % stg email send --to=3Dselinux -a --compose --dry-run
  ...
  error: `git send-email`: >>> HOOK DUMP
  From Paul Moore <paul@paul-moore.com> # This line is ignored.
  Reply-To:
  Subject: SUBJECT
  BODY TEXT
  fatal: /home/.../.git/.gitsendemail.msg.C_MjHr.final: rejected by
    sendemail-validate hook
  fatal: command 'git hook run --ignore-missing sendemail-validate --
    <patch> <header>' died with exit code 1
  warning: no patches were sent

However, if I send a patch without a cover letter I see this:

  % stg email send --to=3Dselinux -a  --dry-run
  ...
  error: `git send-email`: >>> HOOK DUMP
  From 99e622c26aceab38caec40ba173cbf5044adcac6 Mon Sep 17 00:00:00 2001
  From: Paul Moore <paul@paul-moore.com>
  Date: Thu, 21 Dec 2023 16:09:34 -0500
  Subject: [PATCH 01/15] ...

  As part of on ongoing effort ... <rest of patch>

  fatal: /tmp/file.patch: rejected by sendemail-validate hook
  fatal: command 'git hook run --ignore-missing sendemail-validate --
    <patch> <header>' died with exit code 1
  warning: no patches were sent

Ignore the failure as that is due to the substitute hook always
returning 1, it normally works fine when sending regular patches.

I'm happy to provide more debugging/testing help, but I expect to be
checking email rather sporadically the next several days so responses
may be a bit delayed.

--=20
paul-moore.com
