Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web12.8911.1608624901585902864
 for <tools@linux.kernel.org>;
 Tue, 22 Dec 2020 00:15:01 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: geert.uytterhoeven@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id x13so11209520oto.8;
        Tue, 22 Dec 2020 00:15:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i7ua9Yb5QahGg3rIy00WNesJw3F1WUw1gYMCMAzRIM0=;
        b=J5cE7zwt6GetFl0eSUF0YbhxOqN+xtWtJ3QKjRzvLqf1eRSAK7GN4kagHWXAhvzLtv
         km+FAxJW7sOwBfgRPlPM22qrwzvH0Dts6EGoGG8fcbCaiMGAGcpj/AVf/XqlWh+8lKhs
         70I9HVLHkQQBk7gmJtPbIHZ1SaYHi3XK9AMxqo38YbBhdgOvSEvQ3rwMiX+vWzb3VFwR
         YEihWLOz7pOVh1ET7pmAFAzvmf9aHsbyOZCSMbUt+Lz/z4QoSoY64gwSn8eOpR8HQEX6
         7xkmyGPWFFChe+UAWIUWJtwJasOdmaNKU1sR+Gj1Nl0wiRssm/n1cBsG3ILEVFUmn5X0
         5CRg==
X-Gm-Message-State: AOAM530nud1RC2/7EgVgvEaaHJrney8b1W6WRpaQl548zB3af3miIQ7U
	n2wygv57vCwpgba3FedhZ/2fRM1n5fB7dgNV6UQ=
X-Google-Smtp-Source: ABdhPJxR31x5pdZbPbQfuVlUf0koe3y+c1B710JG1DgqPqFUiylw047JbJeMuCii3CszxFtA+Sp7MnaFMl3SqEmwXXc=
X-Received: by 2002:a9d:c01:: with SMTP id 1mr377803otr.107.1608624900982;
 Tue, 22 Dec 2020 00:15:00 -0800 (PST)
MIME-Version: 1.0
References: <877dpeol5w.fsf@toke.dk> <bdffc35910338117c6ed66f6dfac2dc13d6ed03a.camel@HansenPartnership.com>
 <87y2hum0t0.fsf@toke.dk> <fc05bad0b5517500e62b271b8896f142060b235e.camel@HansenPartnership.com>
 <20201219092126.5633d02f@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <20201221190552.GS5487@ziepe.ca> <20201221213012.GB433286@kernel.org> <20201222063034.GC3128@unreal>
In-Reply-To: <20201222063034.GC3128@unreal>
From: "Geert Uytterhoeven" <geert.uytterhoeven@gmail.com>
Date: Tue, 22 Dec 2020 09:14:48 +0100
Message-ID: <CAMuHMdXJy3i6Sap21SVetirExyFvtx-bq-C5ampK+6H8hhUs8Q@mail.gmail.com>
Subject: Re: [kernel.org users] b4: encouraging using the cover letter in merge commits?
To: Leon Romanovsky <leon@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Jakub Kicinski <kuba@kernel.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, toke@toke.dk, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	"users@linux.kernel.org" <users@linux.kernel.org>, tools@linux.kernel.org, 
	Jens Axboe <axboe@kernel.dk>, Michal Kubecek <mkubecek@suse.cz>
Content-Type: text/plain; charset="UTF-8"

Hi Leon,

On Tue, Dec 22, 2020 at 7:30 AM Leon Romanovsky <leon@kernel.org> wrote:
> On Mon, Dec 21, 2020 at 06:30:12PM -0300, Arnaldo Carvalho de Melo wrote:
> > Em Mon, Dec 21, 2020 at 03:05:52PM -0400, Jason Gunthorpe escreveu:
> > > On Sat, Dec 19, 2020 at 09:21:26AM -0800, Jakub Kicinski wrote:
> > > > On Sat, 19 Dec 2020 09:03:36 -0800 James Bottomley wrote:
> > > > > > I agree that the cover letter is useful more often than not and
> > > > > > ideally it would be included in most cases. In netdev/bpf land the
> > > > > > maintainers do this by always creating a merge commit when applying a
> > > > > > multi-part series; here's Daniel applying one of mine, for instance:
> > > > > >
> > > > > > https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/commit/?id=4e083fdfa39db29bbc7725e229e701867d0da183
> > > > > >
> > > > > > I personally think this practice is pretty nice, and so I was hoping
> > > > > > that supporting this workflow in b4 could be a way to encourage other
> > > > > > maintainers to take up the practice as well :)
> > > > >
> > > > > I've got to say that creating a spurious merge for the cover letter
> > > > > looks even more tortuous than creating an empty commit.  What
> > > > > advantages does this have over the existing link tag practice which is
> > > > > the one that we now use instead of the empty commit?
> > > >
> > > > May be a chicken and an egg problem in case of other subsystems.
> > > >
> > > > DaveM started creating those merge commits long before Links were
> > > > a thing (let alone lore). That gave netdev developers the ability
> > > > to provide a high level description of their work, reasons, goals
> > > > in the cover letter, rather than one of the commit messages. For
> > > > a series with changes finely split for ease of review it's often
> > > > awkward to pick on which commit to put that information.
> > > >
> > > > Obviously the cover letter information may be made available via
> > > > the Link, but there's obvious value in seeing the information in
> > > > the repo, after all we don't replace commit messages with links.
> >
> > > My biggest problem with the cover letters is while the are in the
> > > repository, someplace, I've never actually found one while hunting
> > > around in the git history for clues, eg with 'git blame' or 'git log
> > > log -p'
> >
> > Well, they don't get merged, this is the point of this thread :-\
>
> In the netdev flow, the cover letters are merged.
> See commit 28f53159e121 ("Merge branch 'vsock-add-flags-field-in-the-vsock-address'")

But "git log -p -- net/vmw_vsock/af_vsock.c" does not show it.
You need convoluted commands like Michal posted. And those don't
take the path directly, so you have to find ${id} and $[branch} first.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
