Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCFC29CA;
	Wed, 29 Sep 2021 13:39:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DB2046128C;
	Wed, 29 Sep 2021 13:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632922778;
	bh=mmblQb7W46u5mebosC00vsjz5qjqATdUcLGPaed8EHA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XcahcJcDgkseIYmIPdQcehMOVDrM0MupvEX9KNW7K0uTkLAauynB6NZdP1dd1HXn6
	 I6MtfTP1ahYR35XTwgH/9hwMZSZUXCJ3hTiTmlPuweBkRuthFcUhDZfBLKn6GnECMh
	 29e2AodaqKzC3UypH2fxaq/9fFNeFLPKJb7VYLnSRLFk3NBw0kq3PMH28yUjBsSyq4
	 IjzeG8UE4EV9R0w8cQJWvKe6R8Y+P0lYV+WXfs37Jo0lmQ/0bTc/RMkgjKwsEGZWdk
	 Xj0qH/TU3jFObEN9XIX32TzSHTxAE8DDQzghY3BA8+njYlicaMqygGyA7F6P+TiQQG
	 gFYm79p1yussA==
Received: by mail-ed1-f46.google.com with SMTP id l8so9029547edw.2;
        Wed, 29 Sep 2021 06:39:38 -0700 (PDT)
X-Gm-Message-State: AOAM532g8KQhOtGh9Fq6Mr+6J0xN8I/pk29RXKZFI9O7T5nezd+qMjlS
	j8rdl5O1XouFAUNQPdxbr+GOO3PsZnSGV0WXKA==
X-Google-Smtp-Source: ABdhPJwVOnggZX7I6SGZGR1pDB7nVdWsQuOtwQG+xKo57DQfItN8sckbA9GPiiv1LM01h8LMixCMyTL1Wzav7kTxxPo=
X-Received: by 2002:a50:8163:: with SMTP id 90mr14318509edc.271.1632922777217;
 Wed, 29 Sep 2021 06:39:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20210921202526.mk2meetobbtl3tvi@meerkat.local>
 <CAMuHMdWDh=pkFWvxkikFPh3ACyo8ctO1A-DvA6qq7KZ+Lr7X9w@mail.gmail.com>
 <20210924210826.ebi3ljjdfiuie2pr@nitro.local> <CAMuHMdUubqhqyDwkO_x98-M_i1tXsA5KfxhM1RDhrbhby8QT5w@mail.gmail.com>
In-Reply-To: <CAMuHMdUubqhqyDwkO_x98-M_i1tXsA5KfxhM1RDhrbhby8QT5w@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 29 Sep 2021 08:39:25 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL-_GhC0L7O5BugC6P_TjhoqL_p3dgBmHuoJfX0fy8gaw@mail.gmail.com>
Message-ID: <CAL_JsqL-_GhC0L7O5BugC6P_TjhoqL_p3dgBmHuoJfX0fy8gaw@mail.gmail.com>
Subject: Re: b4: introducing b4 shazam (like b4 am -o- | git am)
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, tools@linux.kernel.org, 
	users@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 28, 2021 at 1:23 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Konstantin,
>
> On Fri, Sep 24, 2021 at 11:08 PM Konstantin Ryabitsev
> <konstantin@linuxfoundation.org> wrote:
> > On Thu, Sep 23, 2021 at 10:51:21AM +0200, Geert Uytterhoeven wrote:
> > > [...]
> > > Magic: Preparing a sparse worktree
> > > Error running sparse-checkout init
> > > fatal: Unable to create
> > > '.git/worktrees/tmpz9m4cwww/info/sparse-checkout.lock': No such file
> > > or directory
> >
> > Interesting. Are you already in a detached worktree, perhaps?
> >
> > > According to "git help sparse-checkout", my git (2.25.1, Ubuntu
> > > 20.04.3LTS) does have support for that command.
> >
> > I suggest you repeat the following manually:
> >
> >     git worktree add --detach --no-checkout /tmp/foofoo
> >     pushd /tmp/foofoo
> >     git sparse-checkout ini
>
> s/ini/init/
>
> Fails with:
>
>     fatal: Unable to create
> '/path/to/repo/.git/worktrees/foofoo/info/sparse-checkout.lock': No
> such file or directory
>
> The info dir is missing:
>
>     $ ls -l /path/to/repo/.git/worktrees/foofoo/
>     total 20
>     -rw-rw-r-- 1 geert geert    6 sep 28 20:14 commondir
>     -rw-rw-r-- 1 geert geert   30 sep 28 20:14 config.worktree
>     -rw-rw-r-- 1 geert geert   17 sep 28 20:14 gitdir
>     -rw-rw-r-- 1 geert geert   41 sep 28 20:14 HEAD
>     drwxrwsr-x 2 geert geert 4096 sep 28 20:14 logs/
>
> >     git checkout
> >
> > then, regardless of what happens above:
> >
> >     popd
> >     git worktree remove /tmp/foofoo
>
> needs --force, else it fails with:
>
>     fatal: '/tmp/foofoo' contains modified or untracked files, use
> --force to delete it
>
> > That's basically all we're doing.
> >
> > > Note that with -s, the Link: tag appears below my Sob, while
> > > b4 am + git am -s adds my Sob below the Link: tag.
> >
> > Unfortunately, I can't control this beyond reversing this for everyone. The
> > only other alternative is setting up b4.shazam.am-flags variable for what to
> > pass to "git am" -- which may be a good idea anyway.
>
> The current behavior of b4 shazam does obfuscate the patch trail.

Is there a defined right order for Link and committer's Sob? Either we
have to define what that is for b4 to implement or b4 has to be
configurable. If the committer != author, then Link followed by Sob
makes sense. But what about committing your own patches? If you
strictly follow the patch trail, you'd end up with your Sob twice:
Sob, Link, Sob. In these cases, I've been putting Link last and a
single Sob.

Rob
