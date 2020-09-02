Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web10.7574.1599053710505612000
 for <tools@linux.kernel.org>;
 Wed, 02 Sep 2020 06:35:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=jxIVLpnP;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: krzk@kernel.org)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 83FB920709
	for <tools@linux.kernel.org>; Wed,  2 Sep 2020 13:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1599053709;
	bh=wPcrw2IEh0ZQ4QO6wuQO9b7Vwal20+MnQp+AdPgCnWw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jxIVLpnPLoGzf9vdXzSKk1NPDGm+sICahq0ch7HCNcHG4h2BlOUtzeSeL3tufeUoO
	 yhgXIhiK7S7fEmW62xaMUtCKFD3Ip4cXncheQHkEpVSShIburEkFpIMeNHoetMTY/X
	 F3ED5BpiTeV1D3z8TM6OSg6utysyt2kQPER593OI=
Received: by mail-ed1-f52.google.com with SMTP id n22so4941354edt.4
        for <tools@linux.kernel.org>; Wed, 02 Sep 2020 06:35:09 -0700 (PDT)
X-Gm-Message-State: AOAM531qkai/wX1HN7XW6sMg8MCF2z4gRLw9kxIyHNgl6XdZPGz24ndq
	YALx5CMVS5bIVQQq783KxUJjetW6VipUfGJxCCs=
X-Google-Smtp-Source: ABdhPJyDtemCak/goFqWaiSoJ8JuDdhsPBB2OCUM3rVJKxXM/keldn61ExpJqtH/UTETMUe/juQuU5+T6vsT//0br1w=
X-Received: by 2002:a05:6402:1a48:: with SMTP id bf8mr94271edb.298.1599053708176;
 Wed, 02 Sep 2020 06:35:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200902085531.GA13726@pi3> <87mu28b92n.fsf@kyleam.com>
In-Reply-To: <87mu28b92n.fsf@kyleam.com>
From: "Krzysztof Kozlowski" <krzk@kernel.org>
Date: Wed, 2 Sep 2020 15:34:56 +0200
X-Gmail-Original-Message-ID: <CAJKOXPdDX42BCQ367ZB9RwkhGNvR7YhRCwJjW-ne0=1ZUzC=Mg@mail.gmail.com>
Message-ID: <CAJKOXPdDX42BCQ367ZB9RwkhGNvR7YhRCwJjW-ne0=1ZUzC=Mg@mail.gmail.com>
Subject: Re: [tools] b4-am SyntaxError on Python 3.5
To: Kyle Meyer <kyle@kyleam.com>
Cc: mricon@kernel.org, tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Sep 2020 at 15:33, Kyle Meyer <kyle@kyleam.com> wrote:
>
> Krzysztof Kozlowski writes:
>
> > Hi,
> >
> > I tried now b4 v0.5.2 on my Ubuntu 16.04 with Python 3.5 and:
> >
> >   $ b4
> >   Traceback (most recent call last):
> >     File "/home/krzk/.local/bin/b4", line 7, in <module>
> >       from b4.command import cmd
> >     File "/home/krzk/.local/lib/python3.5/site-packages/b4/__init__.py", line 625
> >       ecode, out = git_run_command(gitdir, ['show', f'{when}:{fn}'])
> >                                                                  ^
> >   SyntaxError: invalid syntax
> >
> > Is Python v3.5 not supported by b4?
>
> setup.py specifies that Python 3.6 or above is required.

Somehow I missed this information. Thanks for the explanation.

Best Regards,
Krzysztof
