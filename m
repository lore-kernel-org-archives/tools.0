Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC283FD0
	for <tools@linux.kernel.org>; Fri,  1 Oct 2021 00:09:27 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id g13-20020a17090a3c8d00b00196286963b9so7985448pjc.3
        for <tools@linux.kernel.org>; Thu, 30 Sep 2021 17:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=d6YS3r6S2cZhQ0kSlwtQ9muyZ/VH3fx1q6undTXNlDQ=;
        b=ZiEj/LFw/16dRnMhXYBNZhAV+oIrYUtGyiTbKLZqq/Z0kTphOoRfU8d8rGqL5NGZxS
         RCNJTwoYmNk6K7/5g+uLO3Aj+g0WA+c8a9EbxOtsoh6R/xX4sCdXnKMQG7HWX4cSWZgi
         dYR3qksOpo6K2RlsGipINGtng+Eoii//5UYdA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=d6YS3r6S2cZhQ0kSlwtQ9muyZ/VH3fx1q6undTXNlDQ=;
        b=zJNkeVhqkeLyV3vf9TJ7tsyreSIoWwz8Coz4hw9pUAMJ+uVRK4eCebFLgXe5ro3aDF
         FHoFnTyOHyXu4utLxbKkKeqwcQ58S89hYkK8kr2nRflx6gBnjz5+6x/1oA33ahIAhR+K
         AN0360gdPOYvf5Y55Ls+wUN/yGtlQpU0FzdjMUzor2MCY+9/emsjc9nhn8/hhTccoR5y
         Icyue7koyiVr75DCOg2B5xH5XzYmjLfDiPq4ILGpQ7IQtpgGHChkr2yA9PC2BMkUh4jY
         MVqGir6dS6eCt3869s72bKcTwjRW7f/2nTImltwxrvy7eSin5qnLZ+ZQjHpOROgivAzp
         pYJA==
X-Gm-Message-State: AOAM533jZTjrzgexhI8r4RE6M/xUidnlRMrgJerftW2U59p5GwLzMntR
	Fn+pl88ahrw0+g8kPiFdFfojWE/B74kaEw==
X-Google-Smtp-Source: ABdhPJz/FMBWUL/HW+HMRTEHhGviT+TAXVoKdxUP7pYLNv/oMoaKKraoC8g7m15i5HiY1hJMGM7hig==
X-Received: by 2002:a17:90b:33cc:: with SMTP id lk12mr9466607pjb.191.1633046966340;
        Thu, 30 Sep 2021 17:09:26 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q21sm4653082pfj.90.2021.09.30.17.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 17:09:25 -0700 (PDT)
Date: Thu, 30 Sep 2021 17:09:24 -0700
From: Kees Cook <keescook@chromium.org>
To: Olof Johansson <olof@lixom.net>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: merging pull requests
Message-ID: <202109301644.0DC921248@keescook>
References: <202109301023.B78ABE54B@keescook>
 <20210930200002.67vxbowvegso2zhg@meerkat.local>
 <202109301559.A9BFB03@keescook>
 <CAOesGMhQBQ0V5GmempB8UhtmAS3gokHb3ACiAiUgQeswwzQPmQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOesGMhQBQ0V5GmempB8UhtmAS3gokHb3ACiAiUgQeswwzQPmQ@mail.gmail.com>

On Thu, Sep 30, 2021 at 04:31:20PM -0700, Olof Johansson wrote:
> On Thu, Sep 30, 2021 at 4:09 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > On Thu, Sep 30, 2021 at 04:00:02PM -0400, Konstantin Ryabitsev wrote:
> > > On Thu, Sep 30, 2021 at 10:33:56AM -0700, Kees Cook wrote:
> > > > Hi!
> > > >
> > > > I'm just realized that all my workflows have been entirely mbox patch
> > > > sets, and I finally have a pull request to take, and ... I have no idea
> > > > how to do it "right". :P
> > > >
> > > > I see "b4 pr", but I was hoping for some kind of three-step process:
> > > > 1) get the code
> > > > 2) read/verify/test code
> > > > 3) merge code into main brain
> > >
> > > Glad you're still around and doing well, professor Nightingale. ;)
> >
> > 3 weeks of virtual conferences is wrecking my branch.
> >
> > > I'm going to cc this to users@, since it's likely to reach more
> > > maintainers' eyes (and brains) there.
> >
> > Good idea; thanks!
> >
> > > > And that it would end up looking like what I see from Linus (i.e. naming
> > > > branching after the tags sent, etc):
> > > >
> > > > 6e439bbd436e Merge branch 'linus' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6
> > > > a4e6f95a891a Merge tag 'pinctrl-v5.15-2' of git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl
> > > > 62da74a73570 Merge tag 'vfio-v5.15-rc4' of git://github.com/awilliam/linux-vfio
> > > > e7bd807e8c9e Merge tag 'm68k-for-v5.15-tag3' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k
> > > > dca50f08a03e Merge tag 'nios2_fixes_for_v5.15_part1' of git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux
> > > >
> > > > It seems like "b4 pr" does part of step 1, but doesn't build a branch
> > > > from the tag (though one can use "-b").
> > > >
> > > > And for step 3, when I do a "git merge --no-ff $branch", all the tag and
> > > > origin (e.g. "tag 'pinctrl-v5.15-2' of git://..." is missing).
> > >
> > > It shouldn't be if you leave it in FETCH_HEAD, which is what b4 does by
> > > default. So, if you do "b4 pr" and then follow it by "git merge", it should
> > > retain the pull request origin and make it the default subject there.
> >
> > I guess it depends on the expected order of operations. What do other
> > maintainers do to process a PR? I would think it would be:
> >
> > - pull remote branch (to FETCH_HEAD)
> > - review (in FETCH_HEAD? in a "real" branch?)
> > - merge into my topic branch (where the commit subject should retain details
> >   of the pull location, body has notes from the signed tag, etc...)
> > - review, build, and test
> > - push to public tree
> 
> I have a script that I pipe the email to, that parses the pull
> request, finds it in PW, updates status, checks out the topic branch I
> want it for, and merges it there with a commit message with a link to
> lore, etc.

Yeah, this is what I'm looking for: the scripts that are driven by a PR.
(And now I have so many more questions...)

What's the PW step here? I've only seen PW used for managing emailed
patches, not handling RPs. Or is that just a check for "was this sent
to a public list"? (And do you end up needing to compare the PR results
against the emailed patches? Does your PW do any checks like the netdev
PW[1] has running for CI[2]?)

And now that I'm thinking about it -- do the various PWs by various
subsystems perform the signature checking that b4 can do? Am I really
the only person who has added b4 to their "git send-email" hook? It's so
easy! :)

> I also manually double check merge stats in case the script got something wrong.
> 
> It's a messy script, but I can send it over.

Sure! How much of it could be replaced by b4, I wonder?

> We have bots that build the for-next branch after push. I do run a
> script iterating on the branch before merging it, looking for the
> silly mistakes that otherwise sfr emails about (missing sign-offs,
> etc).

Yeah, I've added "git push" hooks for this now too. I should refresh my
kernel-tools tree[3] with those changes.

> For build coverage, I usually let my bot crank through post-merge when
> I push out the for-next contents, many of the pull requests we get
> have already been in linux-next.
> 
> As for review, it depends on who it comes from. Some I only glance at,
> others I look at in detail for every single patch (usually with tig,
> on the pulled branch). If I have a comment on a patch, I respond
> saying I didn't merge due to something, and reply with comments to the
> patch. It happens surprisingly rarely.

Right -- this seems pretty common. :)

Thanks!

-Kees

[1] https://patchwork.kernel.org/project/netdevbpf/list/
[2] https://github.com/kuba-moo/nipa/tree/master
[3] https://github.com/kees/kernel-tools

-- 
Kees Cook
