Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web10.10866.1588612202653233372
 for <tools@linux.kernel.org>;
 Mon, 04 May 2020 10:10:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=Uy2fDz3o;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: robh@kernel.org)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 1A57A206D9;
	Mon,  4 May 2020 17:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1588612202;
	bh=9OZrlmug5lAY/WKxocn5QX1znK4AyPk1hB5UbhyNoVg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Uy2fDz3obPFXj4gLdDtqEzSgSa5hk+jCmUKJSzKuA5vY1mXqR4CEPRwZqjG27/eXC
	 MlAWt05lkcJYFRaojzZRIn4Wy2hkXr1ZC63vmwBpsOHJunO+uKB4QSg44IxQ4YfnQP
	 cjIxOGjGxw33V5eR7HeR4HFsgifEfU9YGK8XV2IY=
Received: by mail-oi1-f180.google.com with SMTP id k133so7245413oih.12;
        Mon, 04 May 2020 10:10:02 -0700 (PDT)
X-Gm-Message-State: AGi0PuZ5TrMFYOWx49tRcYzRPiX/pdpB8eNra5YUw9dxHPhmBNACKeI6
	q/w1u+KMkm+PhpL1G+CPkvM67I+uuON/2c+FOw==
X-Google-Smtp-Source: APiQypILvdGmg+2ANDzTgWNkzNEElbZ3ImcrkAzThiidZ/V9ug6i6bwyOVlgYCWFiyBFFyWHmTxH+KnHn4QzyHlfqNg=
X-Received: by 2002:aca:1904:: with SMTP id l4mr9709045oii.106.1588612201356;
 Mon, 04 May 2020 10:10:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200424170442.ad3b3j5f5vkbcmvb@chatter.i7.local>
In-Reply-To: <20200424170442.ad3b3j5f5vkbcmvb@chatter.i7.local>
From: "Rob Herring" <robh@kernel.org>
Date: Mon, 4 May 2020 12:09:49 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ+0Py_XtTojshKPV+o8Y1-Z=pGYJFODDTRVuroLpsJCw@mail.gmail.com>
Message-ID: <CAL_JsqJ+0Py_XtTojshKPV+o8Y1-Z=pGYJFODDTRVuroLpsJCw@mail.gmail.com>
Subject: Re: [kernel.org users] b4 v0.4.0 available with new features
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 24, 2020 at 12:04 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> Hi, all:
>
> I am happy to release b4 version 0.4.0 that contains a set of
> improvements and new features. To upgrade from pypi, run:

Thanks Konstantin! A couple of requests below.

> pip install --upgrade --user b4
>
> Or you can clone the repository directly:
> git clone https://git.kernel.org/pub/scm/utils/b4/b4.git -b stable-0.4.y b4
>
> You can run ./b4.sh from the repository or set an alias/symlink to that
> wrapper.
>
> # Improvements
>
> - When a series is missing patches, b4 is now able to backfill them from
>   other mailing lists tracked on lore.kernel.org. This feature will be
>   improved when public-inbox is able to collect a thread from across all
>   sources.
> - If both patch and metadata are identical between rerolls (v1 -> v2),
>   b4 will automatically carry over trailers from v1 to v2. This is handy
>   if there is an sob on [PATCH v2 7/15] from a maintainer that is
>   missing from an identical [PATCH v3 7/15]. In my observation, this
>   happens very rarely, though.

This is pretty common actually. At least common enough that I do a
check for this and have a semi-automated reply for it.

I worry that automatically fixing it silently will create yet another
case of tribal knowledge of maintainer practices/requirements for
submitters. Maintainer A using b4 doesn't care if tags are added, but
Maintainer B does care and gets grumpy. We need the tooling to promote
that submitters should add these tags as that is what works in either
case. It would be useful if b4 provided just the check as a separate
command/option for integrating into maintainers tools or maybe
submitter tools like checkpatch.pl.


More generally, as I've started to integrate b4 into my workflow,
there's a couple of useful pieces of functionality already in b4, but
not exposed directly on their own. It would be nice to have both
porcelain and low-level commands.

It would help for scripting if 'mbox' stdout was just the mbox file
name similar to git-format-patch output and send the rest to stderr.
While I have message-id and can construct the mbox name, there can be
some transformation on it.

It would help if the old versions of a series could optionally be
included in the mbox output.

Can the lore search code in get_newest_series be exposed as a command
taking a search string and outputting an mbox? Essentially, what the
lore web interface does with a search box and 'mbox.gz' button (I
tried and gave up doing that with curl).

Rob
