Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B5329CA;
	Tue, 19 Oct 2021 14:52:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 616CF60560;
	Tue, 19 Oct 2021 14:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634655124;
	bh=n7IXqWRnGlzLNbPMB5zyq9NbcZzlBEtO6s4UTjKJrQs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NrnSAjAHzIKzuokh+h6NKMIjp+CBytCHNgcotafGh+3viDBrFMLEPcJHwWXhydMdp
	 pmZS+s1ws1m8yIipvQl1UVMeh8G/364Kw2xVYpCTutxm9sbTot1JcVkBVBop2uF9X3
	 3OrDcJ/ym2dHbS+imfwktqWX7H7g/Ta8Dk2i+50kj6KxbGI1vFUVf37D1TiqXQYS6d
	 J9RgNPiHIOIYsC0xfFrm3NxOVNTNf9fh9OlQ0T69lLObWnzBV2SplNVx711j0wnobA
	 O/Jd3Va6b9vInukoZwJ/itqkOVtmQn9XKT53TKXSmdKzKJjl0eN/m88qk8Rdx58K/g
	 EDh/7tYi479Iw==
Received: by mail-ed1-f51.google.com with SMTP id g10so13754519edj.1;
        Tue, 19 Oct 2021 07:52:04 -0700 (PDT)
X-Gm-Message-State: AOAM53009e29rN6w7vBqElIU6sQMq6szExNyrnOuuaTypfH/PaAEBwDD
	/jROTrE+lPi5QgPsvvWTdfNkNzW6spaBx2pClw==
X-Google-Smtp-Source: ABdhPJz5yYsFgJLu0hBmwSzwULrpnKq6bfZUg2OzA9BIvrRZf5SSK1R815Wv0jgdt2CaDPNwsRmidWWAymf0QO0mguA=
X-Received: by 2002:a17:906:71d4:: with SMTP id i20mr38465092ejk.390.1634655009108;
 Tue, 19 Oct 2021 07:50:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20210921202526.mk2meetobbtl3tvi@meerkat.local>
In-Reply-To: <20210921202526.mk2meetobbtl3tvi@meerkat.local>
From: Rob Herring <robh@kernel.org>
Date: Tue, 19 Oct 2021 09:49:57 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK0+f_QPiYr6hv1dVoNT7qJspmjDW6hg0HUcfctpTo22Q@mail.gmail.com>
Message-ID: <CAL_JsqK0+f_QPiYr6hv1dVoNT7qJspmjDW6hg0HUcfctpTo22Q@mail.gmail.com>
Subject: Re: b4: introducing b4 shazam (like b4 am -o- | git am)
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 21, 2021 at 3:25 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> Hi, all:
>
> The current master branch landed a new feature that implements a new
> subcommand "shazam". It is the functional equivalent of piping "b4 am" to "git
> am", with some extra safety padding.
>
> See "b4 shazam --help" to see the available options. You will notice that many
> of them are exactly the same as for "b4 am".
>
> The default operation still tries to be the safest possible:
>
> - we'll create a temporary sparse worktree that will only contain the files
>   being modified
> - we'll use the base-commit sha, if we find it, or we'll try to guess the base
>   commit from git index info
> - we'll run "git am" against that temporary worktree
> - if successful, we'll fetch from the worktree into your current repo and
>   delete the temporary sparse checkout
> - you can then "git checkout -b foo FETCH_HEAD" or "git merge FETCH_HEAD"
>   or "git rebase" as necessary

I get a splat due to my multiple worktree setup:

Fetching into FETCH_HEAD
Traceback (most recent call last):
  File "/home/rob/.local/bin/b4", line 33, in <module>
    sys.exit(load_entry_point('b4', 'console_scripts', 'b4')())
  File "/home/rob/proj/git/b4/b4/command.py", line 264, in cmd
    cmdargs.func(cmdargs)
  File "/home/rob/proj/git/b4/b4/command.py", line 76, in cmd_shazam
    b4.mbox.main(cmdargs)
  File "/home/rob/proj/git/b4/b4/mbox.py", line 721, in main
    make_am(msgs, cmdargs, msgid)
  File "/home/rob/proj/git/b4/b4/mbox.py", line 312, in make_am
    with open(fhf, 'r') as fhh:
NotADirectoryError: [Errno 20] Not a directory:
'/home/rob/proj/git/linux-dt/.git/FETCH_HEAD'

I just sent a patch to fix it.

>
> Alternatively, if you run "git shazam -A", we'll just run "git am" on the
> current HEAD, which is the exact equivalent of "b4 am -o- | git am".

'-A' worked fine. Can we make this a configuration value with
enable/disable override instead? I kind of expect users will use this
mostly one way or the other rather than decide per patch series. Sure,
I could wrap that in a script, but so could I with "b4 am -o- | git
am".

Rob
