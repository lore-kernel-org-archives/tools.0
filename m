Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web08.10683.1608640604250658538
 for <tools@linux.kernel.org>;
 Tue, 22 Dec 2020 04:36:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=uSS/EbYw;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: leon@kernel.org)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0003923124;
	Tue, 22 Dec 2020 12:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1608640603;
	bh=znh99TCWNBa0QpY+vSfL3OnSlOWM730UmQZpHy0p3Co=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uSS/EbYwsmDpOdhiJHclzmRwdc3WichOAE0QVU/p6cZ/08gkBy2iDoaiNWoJ6ES2J
	 HHvVrCEPS/W6w4H4Em9wyR928jxeFdLuSLAajJgud7IMjekz5bKcZzyzg1IOhAyurV
	 AOGpU6EXWle6JJ2alrUz+5mIB8gIJHSodozTePlSXksIJjU+aOP+Ag0DWlhCuSyI0c
	 lVxfK7dGxe+qAbzECkBb9/MCpjuK4Ml/4HKgLtGePXfHmR7/qej8QM6qQPh02XFCac
	 duBFod+zqxLxRkJYvCiBxHorFV1K+8S2DtwR1lutZ4ZnMFKEg5r8mdAWsK1R5CEwg4
	 bbzaFvAQkofpg==
Date: Tue, 22 Dec 2020 14:36:39 +0200
From: "Leon Romanovsky" <leon@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, Jakub Kicinski <kuba@kernel.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	toke@toke.dk, Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	"users@linux.kernel.org" <users@linux.kernel.org>,
	tools@linux.kernel.org, Jens Axboe <axboe@kernel.dk>,
	Michal Kubecek <mkubecek@suse.cz>
Subject: Re: [kernel.org users] b4: encouraging using the cover letter in merge commits?
Message-ID: <20201222123639.GE3128@unreal>
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

I agree, just wanted to give a contra-example to the sentence "they don't get merged".

Thanks

>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
