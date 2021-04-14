Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB39871;
	Wed, 14 Apr 2021 18:51:35 +0000 (UTC)
Received: by mail-ua1-f42.google.com with SMTP id z23so5561324uan.8;
        Wed, 14 Apr 2021 11:51:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tAgOeVuqKdlNrJzHBZ7URdJFWp/Vo/obV82nB4zJERI=;
        b=jyGYwUzqqe+P5XywEVt5FrbHmx/d0Impcsf1iUgOmtOxies6Mtt4+vlj9qPfCbdUN5
         bgrTxhYB4A4YOSNTGD8VNLxqvebwijqybFJtrsBrdLe61jfLutWiKcIB9ac6XMPsSlIF
         woiw5BykRd3HRznA5uPLApNIkfiSGCiE8mZJo1EQuLULx6h8ufN0UbOmx9CI1aKcEO5Q
         NCcbLdjdjNmWBaoraSiCFZfiuECQMJo5MUoX/ns+Er2nfqgGEdt+b5wwjcP/rU+dSl30
         HiMUTMhgKWt8hgg/ii/S19nWdS4x7NnbUMcnmaUesY7wa4Q+KZdAcIevtRBHuP2O/xdC
         xmag==
X-Gm-Message-State: AOAM530Y1g78Pr1w/XM06PxEENSl9tMXdWu8IjO7SYUO3t2C2fqfMQ3X
	W8WJalt6vlaB+m/9i2MQ1vOSY2J8u47U9TFD9vk=
X-Google-Smtp-Source: ABdhPJyLg6XFj5VACUFTYou7phbGtVtxFyco7h5YkrDX68x/nwZEwCbeFoZ4m25paQf7U+X0XnVqe+LkhOjzXrK/kQ0=
X-Received: by 2002:a9f:3852:: with SMTP id q18mr19708576uad.58.1618426294916;
 Wed, 14 Apr 2021 11:51:34 -0700 (PDT)
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20210413204932.yovoa7njwc56jo5v@nitro.local> <fd732fc9-83a9-5502-fba5-f08317bdcaf3@ieee.org>
 <CAHmME9pFqm00ibpqhQQ9_P61F7mU12yrcOvdNSDYDz8ot8HJDg@mail.gmail.com>
 <20210413172901.1465307c@gandalf.local.home> <20210413214031.fenjvgh5helyuqdz@nitro.local>
 <YHaaMaa2uaa6HM9c@hirez.programming.kicks-ass.net> <20210414114950.GM227011@ziepe.ca>
 <YHb/sM95npXrwKPJ@mit.edu>
In-Reply-To: <YHb/sM95npXrwKPJ@mit.edu>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Apr 2021 20:51:23 +0200
Message-ID: <CAMuHMdU3LQsGvS-GOAf0yxk4PcUAPDJ=pLdYUNtgE4h0cVESqg@mail.gmail.com>
Subject: Re: RFC: Superseded-by: follow-up trailer
To: "Theodore Ts'o" <tytso@mit.edu>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Peter Zijlstra <peterz@infradead.org>, 
	Steven Rostedt <rostedt@goodmis.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>, Alex Elder <elder@ieee.org>, 
	users@linux.kernel.org, tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Ted et al,

On Wed, Apr 14, 2021 at 4:46 PM Theodore Ts'o <tytso@mit.edu> wrote:
> On Wed, Apr 14, 2021 at 08:49:50AM -0300, Jason Gunthorpe wrote:
> > v3:
> >   - blah blah
> > v2: https://lore.kernel.org/r/foo
> >   - blah blah
> > v1: https://lore.kernel.org/r/bar
>
> > b4 does a nice job helping the maintainer, but the submitter has no
> > helpful common tooling currently.
>
> It would be nice (and I think possible) if finding the mapping between
> v1 and https://lore.kernel.org/r/bar could be automated --- and if we
> had an appropriate hook in git send-email, it should be possible to
> capture the message-id and stash it in a state file somewhere so the
> developer could either fetch it manually, or if we had something like
> debian's "debchange" command to make it easy to compose the changelog,
> it could fetch it and stash it into the template file before opening
> up an editor for the developer to update the changelog.
>
> What do folks think?

I recently switched from letting "git send-email" generate Message-IDs
to letting "git format-patch" generate them (by setting
format.thread=true in git config). This means the Message-IDs are now
preserved in the cover letter and individual patch files, which can be
useful for reporting, or for creating backlinks to the previous version.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
