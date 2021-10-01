Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C6F3FD0
	for <tools@linux.kernel.org>; Fri,  1 Oct 2021 00:27:52 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id y8so6447847pfa.7
        for <tools@linux.kernel.org>; Thu, 30 Sep 2021 17:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B13GFMlLviK06UiJuEQQeRshnlj6oNrBCX34zrDLfUo=;
        b=tKHDWDZNl5YIZWq7Z8h/DTFg0IyTfOWx7EmfrhRSgjkTe4QUo7Qz3cVQTaoQPyoKDn
         jjEevqLQk1A5YzuJjPGzlL8NkapU2VlrYZHU+yOuJzZPg0/tUav5NbiWusu11RzUGOQl
         PJ9H5ZFMqXXIoPSm8oct1t8Z5+eJDTcvAd10WEV6N+XohIcjSnsuZ6NPp4Pim4L0q7pt
         wuxF5WuiZAOnOxgv/uvCZ7DSAUtZnU+oOhvVZP9Wv67mFdAw4yKzjBY60sPluit5QlnM
         Vue/vcdPppp4XFwjo2m6ioGasCZDCxooZ1VdO/kkVbm5zBSLbzyTBbTzFkrAw1hNgd1V
         u3xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B13GFMlLviK06UiJuEQQeRshnlj6oNrBCX34zrDLfUo=;
        b=KIYVqQ7xXlm+xouReT5fiHwQJP0g1RPUw6h/PHkMZhGV9aTRJG7VKtlAspjx46Ffu+
         HZ9KzGw2ByObYULliCm7g3Y5ApuY1Igc8bR4y+WXkeMmGA5Lu7TYnxR2BXjLRHeHHpl5
         2iPGm4nzrRSlNv0outysAVNFAYOnXtG1ghqylH2oSEh4hs48mMPqxBNyLNWCvaueI+Vo
         lcjfB2b6KqcbNg2WXHn2zTG/tVfgE67SHiUoIX0GFlwlZIA68qFFKvmurI90Oz534J2r
         Ge7ZClCxdKXwAvhKTybvqY5qO8JfWgqUfcuG4Rk1DITICjIX9fTLMrH4/03igGPRIcP+
         RZvg==
X-Gm-Message-State: AOAM533TzyuNTpQRxvJ7kIoiH1ySW/woy2u1zF2875yxqOE8ius7ukO5
	FPAzPFrnarusO1EXmc6ttNOzTKC4v8ji1ampBlW1PMKyZnHOQQ==
X-Google-Smtp-Source: ABdhPJyTi/Pb60hwI4lTlEoI2t/eg5sexF8eZewtga9ghnbUCpHJDZHgoKXBO7gtChIkCuInUNokcvq/tSIGPvpQSI8=
X-Received: by 2002:aa7:8887:0:b0:43c:83fe:2c56 with SMTP id
 z7-20020aa78887000000b0043c83fe2c56mr7111297pfe.82.1633048071850; Thu, 30 Sep
 2021 17:27:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <202109301023.B78ABE54B@keescook> <20210930200002.67vxbowvegso2zhg@meerkat.local>
 <202109301559.A9BFB03@keescook> <CAOesGMhQBQ0V5GmempB8UhtmAS3gokHb3ACiAiUgQeswwzQPmQ@mail.gmail.com>
 <202109301644.0DC921248@keescook>
In-Reply-To: <202109301644.0DC921248@keescook>
From: Olof Johansson <olof@lixom.net>
Date: Thu, 30 Sep 2021 17:27:40 -0700
Message-ID: <CAOesGMj9PW1wex=y8VhPOJms8Xzp=J46Yx0_BxBkTdF+YE0NGA@mail.gmail.com>
Subject: Re: merging pull requests
To: Kees Cook <keescook@chromium.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, tools@linux.kernel.org, 
	users@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

 On Thu, Sep 30, 2021 at 5:09 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Thu, Sep 30, 2021 at 04:31:20PM -0700, Olof Johansson wrote:
> > On Thu, Sep 30, 2021 at 4:09 PM Kees Cook <keescook@chromium.org> wrote:
> > >
> > > On Thu, Sep 30, 2021 at 04:00:02PM -0400, Konstantin Ryabitsev wrote:
> > > > On Thu, Sep 30, 2021 at 10:33:56AM -0700, Kees Cook wrote:
> > > > > Hi!
> > > > >
> > > > > I'm just realized that all my workflows have been entirely mbox patch
> > > > > sets, and I finally have a pull request to take, and ... I have no idea
> > > > > how to do it "right". :P
> > > > >
> > > > > I see "b4 pr", but I was hoping for some kind of three-step process:
> > > > > 1) get the code
> > > > > 2) read/verify/test code
> > > > > 3) merge code into main brain
> > > >
> > > > Glad you're still around and doing well, professor Nightingale. ;)
> > >
> > > 3 weeks of virtual conferences is wrecking my branch.
> > >
> > > > I'm going to cc this to users@, since it's likely to reach more
> > > > maintainers' eyes (and brains) there.
> > >
> > > Good idea; thanks!
> > >
> > > > > And that it would end up looking like what I see from Linus (i.e. naming
> > > > > branching after the tags sent, etc):
> > > > >
> > > > > 6e439bbd436e Merge branch 'linus' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6
> > > > > a4e6f95a891a Merge tag 'pinctrl-v5.15-2' of git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl
> > > > > 62da74a73570 Merge tag 'vfio-v5.15-rc4' of git://github.com/awilliam/linux-vfio
> > > > > e7bd807e8c9e Merge tag 'm68k-for-v5.15-tag3' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k
> > > > > dca50f08a03e Merge tag 'nios2_fixes_for_v5.15_part1' of git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux
> > > > >
> > > > > It seems like "b4 pr" does part of step 1, but doesn't build a branch
> > > > > from the tag (though one can use "-b").
> > > > >
> > > > > And for step 3, when I do a "git merge --no-ff $branch", all the tag and
> > > > > origin (e.g. "tag 'pinctrl-v5.15-2' of git://..." is missing).
> > > >
> > > > It shouldn't be if you leave it in FETCH_HEAD, which is what b4 does by
> > > > default. So, if you do "b4 pr" and then follow it by "git merge", it should
> > > > retain the pull request origin and make it the default subject there.
> > >
> > > I guess it depends on the expected order of operations. What do other
> > > maintainers do to process a PR? I would think it would be:
> > >
> > > - pull remote branch (to FETCH_HEAD)
> > > - review (in FETCH_HEAD? in a "real" branch?)
> > > - merge into my topic branch (where the commit subject should retain details
> > >   of the pull location, body has notes from the signed tag, etc...)
> > > - review, build, and test
> > > - push to public tree
> >
> > I have a script that I pipe the email to, that parses the pull
> > request, finds it in PW, updates status, checks out the topic branch I
> > want it for, and merges it there with a commit message with a link to
> > lore, etc.
>
> Yeah, this is what I'm looking for: the scripts that are driven by a PR.
> (And now I have so many more questions...)
>
> What's the PW step here? I've only seen PW used for managing emailed
> patches, not handling RPs. Or is that just a check for "was this sent
> to a public list"? (And do you end up needing to compare the PR results
> against the emailed patches? Does your PW do any checks like the netdev
> PW[1] has running for CI[2]?)

PW catches pull requests too. Current state hasn't been updated so
there's some stale material in there, but see
https://patchwork.kernel.org/project/linux-soc/list/ for reference.

Our PW does not do any checks today, I've had ambitions to add some
but my personal time for upstream work has been limited in the last
year.

> And now that I'm thinking about it -- do the various PWs by various
> subsystems perform the signature checking that b4 can do? Am I really
> the only person who has added b4 to their "git send-email" hook? It's so
> easy! :)

I don't rely on PW for any checking, I just use it as a state tracker
for patches/pull requests. For maintainers who send to the right
alias/list it gives us a safety net for missed pull requests or
patches as well (but we've had issues with some developers sending us
patches directly that we shouldn't receive, so it's gotten noisy).

> > I also manually double check merge stats in case the script got something wrong.
> >
> > It's a messy script, but I can send it over.
>
> Sure! How much of it could be replaced by b4, I wonder?

I'll be honest, b4 is newer than all of this and I have had zero
cycles to invest in replacing anything with it. Maybe a lot of
overlap, and maybe all my work is redundant. I don't know.

> > We have bots that build the for-next branch after push. I do run a
> > script iterating on the branch before merging it, looking for the
> > silly mistakes that otherwise sfr emails about (missing sign-offs,
> > etc).
>
> Yeah, I've added "git push" hooks for this now too. I should refresh my
> kernel-tools tree[3] with those changes.
>
> > For build coverage, I usually let my bot crank through post-merge when
> > I push out the for-next contents, many of the pull requests we get
> > have already been in linux-next.
> >
> > As for review, it depends on who it comes from. Some I only glance at,
> > others I look at in detail for every single patch (usually with tig,
> > on the pulled branch). If I have a comment on a patch, I respond
> > saying I didn't merge due to something, and reply with comments to the
> > patch. It happens surprisingly rarely.
>
> Right -- this seems pretty common. :)

It's... almost as if we had an ad-hoc personal web of trust going.
Strange, isn't it? :)


-Olof
