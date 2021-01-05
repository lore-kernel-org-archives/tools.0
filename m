Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web12.5163.1609853894802092985
 for <tools@linux.kernel.org>;
 Tue, 05 Jan 2021 05:38:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ziepe.ca header.s=google header.b=BqnMqHCG;
 spf=pass (domain: ziepe.ca, ip: 209.85.160.170, mailfrom: jgg@ziepe.ca)
Received: by mail-qt1-f170.google.com with SMTP id a6so20803989qtw.6
        for <tools@linux.kernel.org>; Tue, 05 Jan 2021 05:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GK7947NdZ2JmFVXWGYVv6+bKHU1e+QKxkBaEIdwwyCc=;
        b=BqnMqHCGlOHNyVQQaTTUSqYR7GPKFDyOW0UOr1r6UFliDJBAFXn6vQJrmO0av+IzpV
         fpARf4OhdiBlgBnSrJPkZWJd4cmKWZZ2O6SE+qw/hFqZacwmQg1Y7IUsfxGmKsfgM37F
         3vSijn0G7A94YGRKkEtXF++owzd4LM4FxVGPTU+dFw8fnPphmoEBfxA9ZgR9CqlMwifu
         9xccqA6KolYfT7xztTXL2RE6dNLzMeq32U+oc3jeYGBCPaN40WF+GuZ7NRmArWdAc5KK
         /MYomP8/0CkUStfjO30HEAnyZQ5IUupitWlwQJOom4hD9v5pRuy9cPkD3aWHUiZ/8pBT
         NOnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GK7947NdZ2JmFVXWGYVv6+bKHU1e+QKxkBaEIdwwyCc=;
        b=ZRHbPlEJylUcNnKTpN9nTEHCt6Tx61jGmU06hTzJifGvhWT6J1OSuwrvJ5IKgH6u4g
         ipl7StMFqkrABB/bsBvNI6ZSkO5Pq2cGD60AO13AKwTWnGxn497BOAb+x/g+lNnBflae
         Ax8itvnVyircKqoe0Q7PIQT7vfLgCOVqAwdaXNeDPx9/wXXzA4bk/JbOSvbAfkoajeB/
         tv9DhZi5Kvf0ZrteDajxplPO8zY1Eto9t8yXeZBBNrbMk8+qq/nRW3mhC5MV4gSYZCSU
         54r7WqZj1FzN4WbFJBhTzZZX6CohqppBk4Kflf64v1psmWLFAiL8EtvQIcUUCQfgHcYY
         EQFg==
X-Gm-Message-State: AOAM533miAGtj01qWss7FieWiI5II02EziwlC/Nj50Lv/88w/YxmK+Ue
	CnlcC/+yY6/CDtw2nx/R486L9w==
X-Google-Smtp-Source: ABdhPJwUIp7DVl4+JDMMY5RwoqoanIDSiGYSJ8ptMZFS4bCJYHbPCIOASXjChzrqdwmARYfsupJlWg==
X-Received: by 2002:ac8:6e81:: with SMTP id c1mr76262180qtv.36.1609853893841;
        Tue, 05 Jan 2021 05:38:13 -0800 (PST)
Return-Path: <jgg@ziepe.ca>
Received: from ziepe.ca ([206.223.160.26])
        by smtp.gmail.com with ESMTPSA id n66sm39145233qkn.136.2021.01.05.05.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 05:38:12 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94)
	(envelope-from <jgg@ziepe.ca>)
	id 1kwmXL-002H9L-FU; Tue, 05 Jan 2021 09:38:11 -0400
Date: Tue, 5 Jan 2021 09:38:11 -0400
From: "Jason Gunthorpe" <jgg@ziepe.ca>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Leon Romanovsky <leon@kernel.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	toke@toke.dk, Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	"users@linux.kernel.org" <users@linux.kernel.org>,
	tools@linux.kernel.org, Jens Axboe <axboe@kernel.dk>,
	Michal Kubecek <mkubecek@suse.cz>
Subject: Re: [kernel.org users] b4: encouraging using the cover letter in merge commits?
Message-ID: <20210105133811.GA504133@ziepe.ca>
References: <877dpeol5w.fsf@toke.dk>
 <bdffc35910338117c6ed66f6dfac2dc13d6ed03a.camel@HansenPartnership.com>
 <87y2hum0t0.fsf@toke.dk>
 <fc05bad0b5517500e62b271b8896f142060b235e.camel@HansenPartnership.com>
 <20201219092126.5633d02f@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <20201221190552.GS5487@ziepe.ca>
 <20201221213012.GB433286@kernel.org>
 <20201222063034.GC3128@unreal>
 <CAMuHMdXJy3i6Sap21SVetirExyFvtx-bq-C5ampK+6H8hhUs8Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXJy3i6Sap21SVetirExyFvtx-bq-C5ampK+6H8hhUs8Q@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 22, 2020 at 09:14:48AM +0100, Geert Uytterhoeven wrote:
> Hi Leon,
> 
> On Tue, Dec 22, 2020 at 7:30 AM Leon Romanovsky <leon@kernel.org> wrote:
> > On Mon, Dec 21, 2020 at 06:30:12PM -0300, Arnaldo Carvalho de Melo wrote:
> > > Em Mon, Dec 21, 2020 at 03:05:52PM -0400, Jason Gunthorpe escreveu:
> > > > On Sat, Dec 19, 2020 at 09:21:26AM -0800, Jakub Kicinski wrote:
> > > > > On Sat, 19 Dec 2020 09:03:36 -0800 James Bottomley wrote:
> > > > > > > I agree that the cover letter is useful more often than not and
> > > > > > > ideally it would be included in most cases. In netdev/bpf land the
> > > > > > > maintainers do this by always creating a merge commit when applying a
> > > > > > > multi-part series; here's Daniel applying one of mine, for instance:
> > > > > > >
> > > > > > > https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/commit/?id=4e083fdfa39db29bbc7725e229e701867d0da183
> > > > > > >
> > > > > > > I personally think this practice is pretty nice, and so I was hoping
> > > > > > > that supporting this workflow in b4 could be a way to encourage other
> > > > > > > maintainers to take up the practice as well :)
> > > > > >
> > > > > > I've got to say that creating a spurious merge for the cover letter
> > > > > > looks even more tortuous than creating an empty commit.  What
> > > > > > advantages does this have over the existing link tag practice which is
> > > > > > the one that we now use instead of the empty commit?
> > > > >
> > > > > May be a chicken and an egg problem in case of other subsystems.
> > > > >
> > > > > DaveM started creating those merge commits long before Links were
> > > > > a thing (let alone lore). That gave netdev developers the ability
> > > > > to provide a high level description of their work, reasons, goals
> > > > > in the cover letter, rather than one of the commit messages. For
> > > > > a series with changes finely split for ease of review it's often
> > > > > awkward to pick on which commit to put that information.
> > > > >
> > > > > Obviously the cover letter information may be made available via
> > > > > the Link, but there's obvious value in seeing the information in
> > > > > the repo, after all we don't replace commit messages with links.
> > >
> > > > My biggest problem with the cover letters is while the are in the
> > > > repository, someplace, I've never actually found one while hunting
> > > > around in the git history for clues, eg with 'git blame' or 'git log
> > > > log -p'
> > >
> > > Well, they don't get merged, this is the point of this thread :-\
> >
> > In the netdev flow, the cover letters are merged.
> > See commit 28f53159e121 ("Merge branch 'vsock-add-flags-field-in-the-vsock-address'")
> 
> But "git log -p -- net/vmw_vsock/af_vsock.c" does not show it.
> You need convoluted commands like Michal posted. And those don't
> take the path directly, so you have to find ${id} and $[branch} first.

Yes exactly, if there was some way to make 'git log -p' or 'git blame'
make the covers visible it would be much more appealing..

Otherwise we merge them into the repo and they are technically
findable but realistically nobody will read them.

Right now if I need to make a merge commit for some reason then I put
the cover letter in there, but needing a merge commit is rare..

Jason
