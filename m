Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C149A3FD5
	for <tools@linux.kernel.org>; Thu, 30 Sep 2021 23:31:32 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id a73so4821076pge.0
        for <tools@linux.kernel.org>; Thu, 30 Sep 2021 16:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=45Qd5KMvpttWaFu7Xm/fHDZGoDeKPXGejHZXvT/xmk0=;
        b=WzTZ2lhTvBcg/At3X8T/V9fhzn5egCbvuy47vPZyXGc5WdfKdaZRQb2Kp9xoqFE+ce
         SyO3mcaSsMg2gqsDLJrp1XK1u07OvLgf5Qglg6YR0R0iNcOJsGeThfNSburikVJ+VY5E
         /Kfn1zdYAmaozF9aFCqZmaqxvONA+/39HxTO/PS6jYhrF8IFfVD/eKTvlbeKTrI0nAzV
         kosSrSLdoyHY+++7FuFxQfQTs5+fwksLV2sDTxA36TgW/iP6YvD/bMt7dnY/aDYOubqt
         XPfOGdrBC/ohhFcnpspLEcxndoWZgPFhhZnKmbwDFjtRzL5RqgvERS4Dp1Q/SS7NRxMQ
         JT6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=45Qd5KMvpttWaFu7Xm/fHDZGoDeKPXGejHZXvT/xmk0=;
        b=Sp58LYrD250vcwuyj5btJmjaMQ552D4ZsJM7C2mvs+ycsAKoMbeFrsuNgcXeorJMwQ
         oO5hmSOZQkh0VVBOQqf6ULJu63xasOkYjIt83QCKXrE7wK/nBshWQNycDWfiR7E21qAY
         x3cm7H8MkBq4MN/8NMhIsyIIFcTcTS1Ah20bzSJwX+kgtLBVnWL1T21XY9CSgpdiBczZ
         +x/xO0wsBFYaE5lvF59zbW+X2bOqqxEjz1BCoX+yyj9m/KOSsMqbfTI17bMFq3AkIc8t
         p5hRUhx5CRAs981tIhEdnJzpns24XnDkaGzbHHu0X3dUPaTy+8MfhUEfFJNbpu26OPau
         uuXQ==
X-Gm-Message-State: AOAM53012Xom3HdLvaStam8bSOmOvbkSAi903AppOJIF+/J2rr4M4pXw
	DYlwgZYiM+MEgsp05dPChiNOk+BVlIjJTuKHO4sH5bdJRnE=
X-Google-Smtp-Source: ABdhPJycisMdN2r32D75ae8kaAD7NLjMsoROA4CLauZnF/iboNHUlqIaRbk1XEcIWsm2vKrroiRtxVSPDCHffyfhDcw=
X-Received: by 2002:aa7:8887:0:b0:43c:83fe:2c56 with SMTP id
 z7-20020aa78887000000b0043c83fe2c56mr6891173pfe.82.1633044692120; Thu, 30 Sep
 2021 16:31:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <202109301023.B78ABE54B@keescook> <20210930200002.67vxbowvegso2zhg@meerkat.local>
 <202109301559.A9BFB03@keescook>
In-Reply-To: <202109301559.A9BFB03@keescook>
From: Olof Johansson <olof@lixom.net>
Date: Thu, 30 Sep 2021 16:31:20 -0700
Message-ID: <CAOesGMhQBQ0V5GmempB8UhtmAS3gokHb3ACiAiUgQeswwzQPmQ@mail.gmail.com>
Subject: Re: merging pull requests
To: Kees Cook <keescook@chromium.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, tools@linux.kernel.org, 
	users@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 30, 2021 at 4:09 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Thu, Sep 30, 2021 at 04:00:02PM -0400, Konstantin Ryabitsev wrote:
> > On Thu, Sep 30, 2021 at 10:33:56AM -0700, Kees Cook wrote:
> > > Hi!
> > >
> > > I'm just realized that all my workflows have been entirely mbox patch
> > > sets, and I finally have a pull request to take, and ... I have no idea
> > > how to do it "right". :P
> > >
> > > I see "b4 pr", but I was hoping for some kind of three-step process:
> > > 1) get the code
> > > 2) read/verify/test code
> > > 3) merge code into main brain
> >
> > Glad you're still around and doing well, professor Nightingale. ;)
>
> 3 weeks of virtual conferences is wrecking my branch.
>
> > I'm going to cc this to users@, since it's likely to reach more
> > maintainers' eyes (and brains) there.
>
> Good idea; thanks!
>
> > > And that it would end up looking like what I see from Linus (i.e. naming
> > > branching after the tags sent, etc):
> > >
> > > 6e439bbd436e Merge branch 'linus' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6
> > > a4e6f95a891a Merge tag 'pinctrl-v5.15-2' of git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl
> > > 62da74a73570 Merge tag 'vfio-v5.15-rc4' of git://github.com/awilliam/linux-vfio
> > > e7bd807e8c9e Merge tag 'm68k-for-v5.15-tag3' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k
> > > dca50f08a03e Merge tag 'nios2_fixes_for_v5.15_part1' of git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux
> > >
> > > It seems like "b4 pr" does part of step 1, but doesn't build a branch
> > > from the tag (though one can use "-b").
> > >
> > > And for step 3, when I do a "git merge --no-ff $branch", all the tag and
> > > origin (e.g. "tag 'pinctrl-v5.15-2' of git://..." is missing).
> >
> > It shouldn't be if you leave it in FETCH_HEAD, which is what b4 does by
> > default. So, if you do "b4 pr" and then follow it by "git merge", it should
> > retain the pull request origin and make it the default subject there.
>
> I guess it depends on the expected order of operations. What do other
> maintainers do to process a PR? I would think it would be:
>
> - pull remote branch (to FETCH_HEAD)
> - review (in FETCH_HEAD? in a "real" branch?)
> - merge into my topic branch (where the commit subject should retain details
>   of the pull location, body has notes from the signed tag, etc...)
> - review, build, and test
> - push to public tree

I have a script that I pipe the email to, that parses the pull
request, finds it in PW, updates status, checks out the topic branch I
want it for, and merges it there with a commit message with a link to
lore, etc.

I also manually double check merge stats in case the script got something wrong.

It's a messy script, but I can send it over.

We have bots that build the for-next branch after push. I do run a
script iterating on the branch before merging it, looking for the
silly mistakes that otherwise sfr emails about (missing sign-offs,
etc).

For build coverage, I usually let my bot crank through post-merge when
I push out the for-next contents, many of the pull requests we get
have already been in linux-next.

As for review, it depends on who it comes from. Some I only glance at,
others I look at in detail for every single patch (usually with tig,
on the pulled branch). If I have a comment on a patch, I respond
saying I didn't merge due to something, and reply with comments to the
patch. It happens surprisingly rarely.



-Olof
