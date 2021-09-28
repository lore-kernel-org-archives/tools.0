Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556C429CA;
	Tue, 28 Sep 2021 18:23:11 +0000 (UTC)
Received: by mail-vs1-f41.google.com with SMTP id q66so23161975vsa.4;
        Tue, 28 Sep 2021 11:23:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zXoxQJ4S6GM4zKYThMFHYYHAKal49po66tIGOkfx3pU=;
        b=lmnGwUO0djkxbsLlpmXL0p0OzGYGtvk/yz1UUL4V6Lj6CyRTCnlVG9I8+A+yQz/d7T
         zXaEHg9wlgwskubrnE5Rskpu+bnNgQkrAY/a5qENaxz0TStvMbETxwRP9bldXrUKj+qS
         FmDbQjwIFIYhyHTq64tP0Q46iNO5sBRfudkvRt21l4Sf0BZBWDOhZ5CzxArciUb8sba+
         EmQctG4KTz5h7G2bzmh8ZT8DdCg62/ap9pAXQHRjsLV93uH3vi1FLq3LpzOdsdUA7+tm
         jn/5P2ykFTBJmLaomXvQULlMrasGa7EsJwTMtyBWlaWHQfXU1pD7Rp25A7ue7vusjQgI
         KDCg==
X-Gm-Message-State: AOAM530e5u4plvTl6B1PS6i3QO9f8qGZiUfhwq44XpHCq5fhe2StNusZ
	CTp0xGjultOGxVrzhl+Y96lHfsevRq1jLOhGC4e0wgFiC4U=
X-Google-Smtp-Source: ABdhPJz0yHdh0UNt4c9+XhGwLC5kNRhYWkNb0I3Ch2skkqJFpIOJK7ewbPpUMC8FDVEo9h4oKR45hEVS4tzsneul96s=
X-Received: by 2002:a05:6102:21d4:: with SMTP id r20mr3454079vsg.50.1632853390273;
 Tue, 28 Sep 2021 11:23:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20210921202526.mk2meetobbtl3tvi@meerkat.local>
 <CAMuHMdWDh=pkFWvxkikFPh3ACyo8ctO1A-DvA6qq7KZ+Lr7X9w@mail.gmail.com> <20210924210826.ebi3ljjdfiuie2pr@nitro.local>
In-Reply-To: <20210924210826.ebi3ljjdfiuie2pr@nitro.local>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Sep 2021 20:22:59 +0200
Message-ID: <CAMuHMdUubqhqyDwkO_x98-M_i1tXsA5KfxhM1RDhrbhby8QT5w@mail.gmail.com>
Subject: Re: b4: introducing b4 shazam (like b4 am -o- | git am)
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Konstantin,

On Fri, Sep 24, 2021 at 11:08 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
> On Thu, Sep 23, 2021 at 10:51:21AM +0200, Geert Uytterhoeven wrote:
> > [...]
> > Magic: Preparing a sparse worktree
> > Error running sparse-checkout init
> > fatal: Unable to create
> > '.git/worktrees/tmpz9m4cwww/info/sparse-checkout.lock': No such file
> > or directory
>
> Interesting. Are you already in a detached worktree, perhaps?
>
> > According to "git help sparse-checkout", my git (2.25.1, Ubuntu
> > 20.04.3LTS) does have support for that command.
>
> I suggest you repeat the following manually:
>
>     git worktree add --detach --no-checkout /tmp/foofoo
>     pushd /tmp/foofoo
>     git sparse-checkout ini

s/ini/init/

Fails with:

    fatal: Unable to create
'/path/to/repo/.git/worktrees/foofoo/info/sparse-checkout.lock': No
such file or directory

The info dir is missing:

    $ ls -l /path/to/repo/.git/worktrees/foofoo/
    total 20
    -rw-rw-r-- 1 geert geert    6 sep 28 20:14 commondir
    -rw-rw-r-- 1 geert geert   30 sep 28 20:14 config.worktree
    -rw-rw-r-- 1 geert geert   17 sep 28 20:14 gitdir
    -rw-rw-r-- 1 geert geert   41 sep 28 20:14 HEAD
    drwxrwsr-x 2 geert geert 4096 sep 28 20:14 logs/

>     git checkout
>
> then, regardless of what happens above:
>
>     popd
>     git worktree remove /tmp/foofoo

needs --force, else it fails with:

    fatal: '/tmp/foofoo' contains modified or untracked files, use
--force to delete it

> That's basically all we're doing.
>
> > Note that with -s, the Link: tag appears below my Sob, while
> > b4 am + git am -s adds my Sob below the Link: tag.
>
> Unfortunately, I can't control this beyond reversing this for everyone. The
> only other alternative is setting up b4.shazam.am-flags variable for what to
> pass to "git am" -- which may be a good idea anyway.

The current behavior of b4 shazam does obfuscate the patch trail.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
