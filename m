Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web12.2585.1608586199715474429
 for <tools@linux.kernel.org>;
 Mon, 21 Dec 2020 13:29:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=ELD1nOc/;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: acme@kernel.org)
Date: Mon, 21 Dec 2020 18:30:12 -0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1608586199;
	bh=UqUBC+hnTV+XGqwbr2iGO1YcIag+CVHK5KFk4f0zvdM=;
	h=From:To:Cc:Subject:References:In-Reply-To:From;
	b=ELD1nOc/utNvSCDNgXQX+feMB2m41DDCCLWX0i7TuadLpwxk+VGefOKRmhg7RLi6V
	 6gyJxTaZSGTpSGGuotuP/XJcpjZU2o1gVLmHF03nAkCoiia+e6CfjLELHG2yITOH8D
	 cgjBYveud9zAnJaaKIiJcVv7aXNXTdQE/wMRqi6K3ELCCR1I30ITUwKHB/+jCnzDF2
	 S7fkLBhNNEsGpGye9YpOsRqG7eO8Dv4nKQQxcHVXqb9deV9wzIVKo3yxkGOnSFHYEi
	 S+v8b4jcfpRQhlOU7Nxhjn4ieL/QOzNCxtHa0MdwFfeJlhPD5oWJI5LvCegftvGk/A
	 zVo2BaqqxQQwA==
From: "Arnaldo Carvalho de Melo" <acme@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Jakub Kicinski <kuba@kernel.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	toke@toke.dk, Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users@linux.kernel.org, tools@linux.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Subject: Re: [kernel.org users] b4: encouraging using the cover letter in merge commits?
Message-ID: <20201221213012.GB433286@kernel.org>
References: <877dpeol5w.fsf@toke.dk>
 <bdffc35910338117c6ed66f6dfac2dc13d6ed03a.camel@HansenPartnership.com>
 <87y2hum0t0.fsf@toke.dk>
 <fc05bad0b5517500e62b271b8896f142060b235e.camel@HansenPartnership.com>
 <20201219092126.5633d02f@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <20201221190552.GS5487@ziepe.ca>
MIME-Version: 1.0
In-Reply-To: <20201221190552.GS5487@ziepe.ca>
X-Url: http://acmel.wordpress.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Em Mon, Dec 21, 2020 at 03:05:52PM -0400, Jason Gunthorpe escreveu:
> On Sat, Dec 19, 2020 at 09:21:26AM -0800, Jakub Kicinski wrote:
> > On Sat, 19 Dec 2020 09:03:36 -0800 James Bottomley wrote:
> > > > I agree that the cover letter is useful more often than not and
> > > > ideally it would be included in most cases. In netdev/bpf land the
> > > > maintainers do this by always creating a merge commit when applying a
> > > > multi-part series; here's Daniel applying one of mine, for instance:
> > > > 
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/commit/?id=4e083fdfa39db29bbc7725e229e701867d0da183
> > > > 
> > > > I personally think this practice is pretty nice, and so I was hoping
> > > > that supporting this workflow in b4 could be a way to encourage other
> > > > maintainers to take up the practice as well :)  
> > > 
> > > I've got to say that creating a spurious merge for the cover letter
> > > looks even more tortuous than creating an empty commit.  What
> > > advantages does this have over the existing link tag practice which is
> > > the one that we now use instead of the empty commit?
> > 
> > May be a chicken and an egg problem in case of other subsystems.
> > 
> > DaveM started creating those merge commits long before Links were 
> > a thing (let alone lore). That gave netdev developers the ability 
> > to provide a high level description of their work, reasons, goals 
> > in the cover letter, rather than one of the commit messages. For
> > a series with changes finely split for ease of review it's often
> > awkward to pick on which commit to put that information.
> > 
> > Obviously the cover letter information may be made available via 
> > the Link, but there's obvious value in seeing the information in 
> > the repo, after all we don't replace commit messages with links.
 
> My biggest problem with the cover letters is while the are in the
> repository, someplace, I've never actually found one while hunting
> around in the git history for clues, eg with 'git blame' or 'git log
> log -p'

Well, they don't get merged, this is the point of this thread :-\

That or they are really well hidden :-)
 
> In fact more often than not I find the netdev cover letters through
> hunting in lore, not through git.
 
> Is there some git sequence to make it visible?
 
> The Link header is a nicer because no matter how I end up at a commit
> I can go back to an email discussion..

For going back to the discussion the link is fantastic, its just the
cover letter, that is made with the specific intent to justify that
follows it (the patches) should get merged, so should, I think, be
merged _too_.

This is not about having everything in the repo or leaving as much as
possible outside, pointed by the Link: tag, not even a middle ground,
its just about the cover letter.

- Arnaldo
